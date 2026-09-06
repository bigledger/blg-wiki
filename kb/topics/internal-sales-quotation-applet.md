---
topic: internal-sales-quotation-applet
aliases: [sales quotation, quotation, quote, INTERNAL_SALES_QUOTATION, InternalSalesQuotationApplet, SLSQUO]
applets: [InternalSalesQuotationApplet]
modules: [crm-digital, pos, financial-accounting]
related: [internal-sales-inquiry-applet, internal-sales-order-applet, internal-sales-invoice-applet, internal-jobsheet-applet, car-workshop-applet, internal-receipt-voucher-applet, internal-purchase-quotation-applet, stock-availability, serial-number-draft-lock, company-default-gl-codes]
wiki:
  - content/en/applets/sales-workflow/internal-sales-quotation-applet.md
status: growing
updated: 2026-09-05
---

# Sales Quotation (Internal)

A priced offer to a customer before any commitment. Both signums are 0: FINAL assigns document numbers and locks the header but moves no stock, posts no journal and does not reduce stock availability. It is the knock-off source for sales orders, invoices and jobsheets, and its Collection (deposit) lines can be converted into a receipt voucher from inside the applet.

## Facts

- 2026-09-05 — Registry name "Sales Quotation (Internal)", code `InternalSalesQuotationApplet`, TNT-USER, ACTIVE; doc URL already points at the wiki page. The repo's own applet title is "Internal Sales Quotation". [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Server doc type `INTERNAL_SALES_QUOTATION`, short code `SLSQUO`, amount signum 0, quantity signum 0; the DCO only checks doc type and amount signum and fills line signums. [src:javasdk/…/InternalSalesQuotationDataConsistencyObject.java] [src:javasdk/…/ServerDocShortCodes.java#L34] [src:…/models/constants/applet-constants.ts]
- 2026-09-05 — No journal: `JournalPostingTypeHandler.handlers` has no quotation entry, so the service falls back to the `SALES` handler by name, but skips every line with `amount_signum == 0` (L96) and the entity line when the total is 0 (L326). No inventory movement; not in `StockAvailabilityService`'s reducing-doc list (only SALES_ORDER and SALES_INVOICE). [src:javasdk/…/JournalPostingService.java#L68-L96,L326] [src:javasdk/…/domain/erp/stock/StockAvailabilityService.java#L36-L40]
- 2026-09-05 — Backend FINAL validation for a quotation: forex rate, serial qty/duplicates, bin/batch qty, fiscal period lock. NOT blacklist (list is cash bill / invoice / order / outbound DO) and NOT stock balance (zero-signum lines filtered out unless `validateStockBalanceForSignumZero`, which only the back-office convert endpoint passes). The applet's only backend lever is `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` → `validate_serial_signum_zero` → `BL_INV_SERIAL_NUMBER_HDR_OBJECT_SERIAL_NUMBER_DOES_NOT_EXIST_AT_LOCATION`. [src:javasdk/…/GenericDocumentService.java#L1623-L1699,L1858-L1882,L2083-L2091] [src:…/internal-sales-quotation-view.component.ts#L655-L663]
- 2026-09-05 — **Convert tab = "Convert to Internal Receipt Voucher"**: builds an `INTERNAL_RECEIPT_VOUCHER` (amount signum −1) from the quotation header (posting status copied as-is) plus its `STL_MTHD` Collection lines, POSTs it, then DELETEs the quotation (`DELETE /{docType}/{guid}`, emits `INTERNAL_SALES_QUOTATION_DELETED`). Not a conversion to a sales order — orders/invoices knock the quotation off from their own KO For tab. [src:…/internal-sales-quotation-view-convert.component.html#L4] [src:…/internal-sales-quotation.effects.ts#L993-L1050] [src:akaun-api/…/GenericDocumentController.java#L456-L475,L587]
- 2026-09-05 — KO For sources in this applet: Sales Quotation and Job Sheet (Sales Order tab commented out). [src:…/import-knock-off/import-knock-off.component.html]
- 2026-09-05 — Record status `TEMP` on "+" (panel title "Create"), `ACTIVE` after first save; DRAFT/FINAL/VOID posting statuses; DRAFT button gated by `SHOW_DRAFT_BUTTON` (setting + permission). [src:…/internal-sales-quotation-view.component.ts#L196-L199,L344] [src:…/internal-sales-quotation-listing.component.html#L35]
- 2026-09-05 — Settings surfaces: applet-local Default Selection (branch, location, company, pricebook, currency, pricing scheme, decimal precision 2–4, tab order — **no `DATE_TXN_LOGIC`**), shared Field Configuration (gating-aware census: 100 keys rendered-for-this-code AND read; 15 rendered-but-unread; 11 read-but-rendered-only-for-other-codes), applet-local Branch Settings (header/footer, default settlement method per payment type, pricing scheme, sales agent, rounding/group-discount items, item-category filter, menu list), Workflow Settings (company → process). [src:…/default-settings.component.ts] [src:…/branch/branch.component.ts] [src:kb/tools/applet-scan.sh + ancestor-ngIf census 2026-09-05]
- 2026-09-05 — Shared-screen quirk: `ENABLE_EDITING_UNIT_PRICE_STD`'s guard is `appletCode==='posGeneral' || 'salesInvoiceApplet'` (always truthy), so it renders for every applet. `shouldHideSetting`, `hideDepartmentSetting` and `hideDepartmentHDRTab` all include this applet code → pricing columns, department fields and the Department Hdr tab hide on first save. [src:blg-shared-utilities/…/field-configuration.component.html#L3053] [src:…/field-configuration.component.ts#L2333-L2384]
- 2026-09-05 — Registry seeds only 2 client-side perm defs (`HIDE_PRICE`, `SHOW_TRANSACTION_DATE`) while the code checks ~50 (`SHOW_GENDOC_*_BUTTON`, `SHOW_DRAFT_BUTTON`, listing `SHOW_*` columns, pricing `SHOW_*`, `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH`). [src:akaun_master.bl_applet_client_side_perm_dfn] [src:…/internal-sales-quotation-listing.component.ts#L80-L126]
- 2026-09-05 — `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` → `checkDraftLock` → `SerialNumberService` marks serials held by another draft as invalid ("Serial Number is already locked by …"). [src:…/pns-edit.effects.ts#L75] [src:javasdk/…/SerialNumberService.java#L283-L320]
- 2026-09-05 — Webhooks: `INTERNAL_SALES_QUOTATION_CREATED` on API create (L189–L192), `_DELETED` on delete; the FINAL-path webhook is invoice-only (L645–L650). [src:javasdk/…/GenericDocumentService.java]
- 2026-09-05 — Issues/commits (anonymised): group discount blocked save/FINAL (#16, fixed 2026-08-31); stock-balance column showed 0 (2026-01); grid not refreshing after save/FINAL (2026-05); deleting one line removed all (2026-02); grouped-item price calc (2025-11); SST population (2026-05); date_txn saving (2025-12); "Apply to Lines" for sales agent added (2026-04); company name added to Sales History (2026-03). [src:git-log:blg-applet-wavelet-internal-sales-quotation-applet] [src:gh:bigledger/blg-applet-wavelet-internal-sales-quotation-applet#16]
- 2026-09-05 — The previous wiki page (1,434 lines) described Pending Approvals, Team Reports, Quote Templates, Pricing Schemes settings, approval delegation periods, a "convert to order" button and a named persona — none exist in the code. Replaced. [src:git:blg-wiki@d380b240:content/en/applets/sales-workflow/internal-sales-quotation-applet.md]

## How it connects

- **internal-sales-order-applet** — the order's KO For tab lists Sales Quotation; the order (not the quotation) is what reduces availability.
- **internal-sales-invoice-applet** — invoice KO For also lists Sales Quotation (direct quote-to-invoice).
- **internal-jobsheet-applet / car-workshop-applet** — jobsheet ↔ quotation in both directions via KO For.
- **internal-receipt-voucher-applet** — Convert creates the RV from Collection lines and deletes the quotation.
- **internal-purchase-quotation-applet** — buying-side twin, same zero-signum behaviour.
- **stock-availability** — quotations do not count; document that explicitly on the availability page.
- **serial-number-draft-lock** — the draft-lock table `bl_fi_generic_doc_line_draft_lock_serial_number` is shared by all draft documents.

## Open questions

- Convert copies `posting_status` from the quotation header into the receipt voucher; converting a FINAL quotation therefore sends a FINAL RV header to the create endpoint. Is that intended (immediate RV posting) or should Convert be restricted to DRAFT? No guard found in the view template.
- Which tenants actually use the Collection tab on quotations (deposit-taking at quote stage)? Would tell us whether Convert deserves a guide.

## Wiki impact

- `internal-sales-order-applet` and `internal-sales-invoice-applet`: Where-it-fits rows already list the quotation as an upstream KO source — keep.
- `inventory-workflow/stock-availability-applet` (other lane): state that quotations never reduce availability.
- `finance/internal-receipt-voucher-applet` (other lane): add the quotation as a source ("Convert to Internal Receipt Voucher" creates an RV and deletes the quotation).
- Guides / module pages that promise "one-click quote-to-order conversion" (modules/pos related-applets text) should be softened to "knocked off by the order".
