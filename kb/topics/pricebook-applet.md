---
topic: pricebook-applet
aliases: [price book, price set, pricing set, promotion rules, pricebook calculator]
applets: [PricebookApplet, posGeneral, AkaunPriceBookApplet]
modules: [core, pos, membership, purchasing]
related: [shipping-pricebook-applet, pos-general-applet, internal-sales-invoice-applet, internal-purchase-order-applet, membership-admin-applet, ocr-cash-bill-applet, organisation-applet]
wiki:
  - content/en/applets/master-data/pricebook-applet.md
  - content/en/modules-v2/membership/configuration/rewards-setup/pricebook-configuration.md
status: growing
updated: 2026-09-05
---

# Pricebook applet (price books and price sets)

A price book is a container of price sets; each price set is a `bl_fi_mst_price_book_line` with rules (who / where / when / which items) in `conditional_filter_json` and treatments (discount, sales price, membership points) in `treatment_json`. The applet only maintains the master data; the rules are evaluated by the consumers — a client-side calculator in POS and the sales document applets, and a server-side engine for OCR generic documents.

## Facts

- 2026-09-05 — Registry row `PricebookApplet` "Pricebook" (TNT-USER, ACTIVE, created 2021-07-29); `documentation_url` is `/applets/pricebook-applet/`, kept as an alias of the master-data page. `main.ts` dev code is `PricebookApplet2` (dev only). [src:planning/private/registry-applets-2026-09-05.tsv] [src:blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/main.ts]
- 2026-09-05 — A second ACTIVE row `AkaunPriceBookApplet` "Akaun Price Book" (TNT-APPLET, created 2025-11-13, route `applet/tnt/blg/b2b/akaun-price-book-applet`) exists; its only repo in refs/ is `blg-applet-akaun-platform-akaun-price-book-applet-deprecated` (one commit, 2025-11-18). No wiki page. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Settings are applet-local: one Field Settings toggle `SHOW_SALES_TREATMENT` (declared, rendered, persisted via the shared session effect into `APPLET_SETTINGS`, consumed by `priceset-edit.component.ts` L271-276) and Default Selection `DEFAULT_BRANCH` / `DEFAULT_LOCATION` / `DEFAULT_COMPANY` / `DEFAULT_TIMEZONE`, of which only `DEFAULT_TIMEZONE` is read (validity-rule date display). `gates.py PricebookApplet` reports 0 shared-screen controls. [src:blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts] [src:blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts]
- 2026-09-05 — No `bl_applet_client_side_perm_dfn` rows exist for `PricebookApplet` (live akaun_master). API access is gated by `TNT_LOG_PRICE_BOOK_OWNER/ADMIN` and `TNT_API_PRICE_BOOK_CREATE/UPDATE/DELETE/READ`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunTenantPermissions.java]
- 2026-09-05 — Two editors for one price set: the Price Set menu (`priceset-edit`) offers header rules Valid Date Range, Entity Type, Member Class, Member Label, Company, Branch, Currency, Settlement Method, OCR Company and six item/regex line rules; the nested Price Book → Pricing Set editor (`pricebook-edit-priceset`) swaps Currency/Settlement Method for Employee Category/Customer Category, adds Category 0..10 and Max Quantity, and never shows Sales Treatment. [src:blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/rule-add-priceset.component.ts] [src:blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/rule-add-pricebook/rule-add-pricebook.component.ts]
- 2026-09-05 — Price Book Status is stored as extension `PRICE_BOOK_STATUS`, not `hdr.status`; the client calculator never reads it, it only filters lines by `status === 'ACTIVE'`. An Inactive price book set as a document applet's Default Pricebook still applies. [src:blg-shared-utilities/modules/gen-doc-simplified-ui/pricebook-calculator.ts] [src:blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/state-controllers/pricebook-controller/store/effects/pricebook.effect.ts]
- 2026-09-05 — Client calculator (`PricebookCalculator`, used by POS General, Sales Invoice, Sales Order v2, Sales Quotation): lines sorted by `priority_line` descending, first match wins; header rules evaluated are VALID_DATE_RANGE (absolute dates only — RELATIVE stores null dates and never matches), BRANCH, ENTITY_TYPE, MEMBER_CLASS, EMPLOYEE_CATEGORY, CUSTOMER_CATEGORY; COMPANY, MEMBER_LABEL, OCR_COMPANY, CURRENCY, SETTLEMENT_METHOD are ignored; header logic is always AND (top_level_logic OR not applied), negation honoured; `multi_line_doc_filter` never read; single-line rules ITEM, ITEM_CODE_REG_EX, ITEM_CATEGORY_1..10 with minQty/minAmt/maxQty; ITEM_CATEGORY, ITEM_NAME_REG_EX and category regexes never match; `calculation_logic` never read. [src:blg-shared-utilities/modules/gen-doc-simplified-ui/pricebook-calculator.ts]
- 2026-09-05 — Treatments: SALES vs DISCOUNT are mutually exclusive by Priority (lower wins, tie → DISCOUNT); `calculateSequentialTreatments` applies both in order; POINT treatment yields reward points with `validity_period_days`. Sales Invoice writes the discount into Unit Discount and shows the price set name as description. [src:blg-shared-utilities/modules/gen-doc-simplified-ui/pricebook-calculator.ts] [src:blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/main-details/main-details.component.ts]
- 2026-09-05 — Server-side evaluation exists only for OCR generic documents (`PriceBookOcrGenDocMatchingService`, `OcrGenericDocMembershipPointsPriceBookProcessor`): hdr + multi-line filters with top-level logic and negation, POINT treatment only, `calculation_logic` honoured for POINTS_REWARD_HIGHEST/LOWEST and PRICESET_PRIORITY_ASC/DESC (others → first line by created date). The price book comes from the OCR job template `priceBookHdrGuid`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/priceBook/PriceBookOcrGenDocMatchingService.java] [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/ocr/OcrGenericDocPrimaryProcessor.java]
- 2026-09-05 — The consumers pick one price book through `DEFAULT_PRICEBOOK` (Default Selection "Default Pricebook") in POS General, Sales Invoice, Sales Order v2 and Sales Quotation. POS `PRICEBOOK_POINTS_AUTO_APPLY` is rendered/saved with no reader (commit 4fb19b6). [src:blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settings-container/default-settings/default-settings.component.html] [src:blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/app.component.ts]
- 2026-09-05 — Free-gift promotions are price books with `price_book_type` `PO_FREE_GIFT` / `POS_FREE_GIFT` created in the Purchase Order and POS General applets; backend `PriceBookService.createPriceBook` auto-numbers their code; the Pricebook applet hides them (`price_book_type IS NULL` listing filter; Price Set loader drops `*FREE_GIFT*`). [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/PriceBookService.java] [src:gh:bigledger/blg-applet-wavelet-pricebook-applet#4] [src:gh:bigledger/blg-applet-wavelet-pricebook-applet#2]
- 2026-09-05 — Backend validation: unique header code among non-deleted (`PRICEBOOK_HDR_OBJECT_CODE_ALREADY_EXIST`), FK checks on optional branch/entity/item guids, guid/revision/status/hdr_guid on lines, exts and events; nothing validates the JSON contents. Delete is soft (`SqlGenerator` L115 `UPDATE … SET STATUS='DELETED'`). Webhooks `PRICE_BOOK_CREATED/UPDATED/DELETED`; audit rows in `bl_fi_mst_price_book_event`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/PriceBookDataConsistencyObjects/PriceBookDataConsistencyObject.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/util/SqlGenerator.java]
- 2026-09-05 — Personalization › Default Selection is dead (`appletContainer` subscription commented out; change handler throws) — same defect as the Organization applet (run 17). [src:blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts]

## How it connects

- **pos-general-applet** — loads Default Pricebook, syncs price books offline, owns POS free gifts; `POS_APPLY_GROUP_ITEM_PRICEBOOK_DISCOUNT_LOGIC` and `POS_MANUAL_PROMOTION_SELECTION` on the shared screen shape how the match is applied.
- **internal-sales-invoice-applet / sales order / sales quotation** — apply the discount per line via the shared calculator; Unit Discount + description.
- **internal-purchase-order-applet** — PO free gifts are `PO_FREE_GIFT` price books.
- **membership-admin-applet** — member class / label rules, points currencies for the Point treatment; the "pricebook is assigned to a member class" wording in the membership module page is inverted (the price set carries a Member Class rule).
- **ocr-cash-bill-applet** — the only server-side evaluation; job template `priceBookHdrGuid`.
- **shipping-pricebook-applet** — same rule/treatment design on `bl_fi_mst_shipping_price_book_*`.

## Open questions

- Is the client/server divergence (multi-line rules, OR logic, relative dates, five ignored header rule types) known to the product team, or should these be filed as bugs against blg-shared-utilities?
- Which of the two price set editors is the intended one — they expose different rule sets and only one honours `SHOW_SALES_TREATMENT`.
- What is `AkaunPriceBookApplet` (ACTIVE, 2025-11-13) — a successor to this applet or a B2B-portal variant? Its only repo is marked deprecated.

## Wiki impact

- content/en/applets/master-data/pricebook-applet.md — rewritten (run 18).
- content/en/modules-v2/membership/configuration/rewards-setup/pricebook-configuration.md — "assign the pricebook to the member class" should read "add a Member Class rule to the price set"; there is no link on the member class.
- content/en/applets/sales-workflow/pos-general-applet.md — `PRICEBOOK_POINTS_AUTO_APPLY` has no reader; calculator limitations belong in its Troubleshooting.
- content/en/applets/membership/ocr-cash-bill-applet.md — document `priceBookHdrGuid` on the job template and the POINT-only treatment.
