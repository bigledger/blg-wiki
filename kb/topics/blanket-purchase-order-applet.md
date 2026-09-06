---
topic: blanket-purchase-order-applet
aliases: [blanket purchase order, BPO, INTERNAL_BLANKET_PURCHASE_ORDER, blanket PO, purchase agreement]
applets: [blanketPurchaseOrderApplet, blanketPurchaseOrderAppletSupplierAccess]
modules: [purchasing]
related: [internal-purchase-order-applet, internal-purchase-grn-applet, internal-purchase-quotation-applet, gendoc-flow-config, line-open-queue, inline-gear-settings]
wiki:
  - content/en/applets/purchase-workflow/blanket-purchase-order-applet.md
  - content/en/applets/purchase-workflow/blanket-purchase-order-applet-supplier-access-applet.md
status: growing
updated: 2026-09-05
---

# Blanket Purchase Order

A long-term purchase agreement with one supplier: validity window, items, agreed prices and quantities. It posts nothing (amount signum 0, quantity signum 0); FINAL only creates line-open-queue rows that the Purchase Order (Internal) applet knocks off.

## Facts

- 2026-09-05 — Registry: code `blanketPurchaseOrderApplet`, name "Blanket Purchase Order Applet" (the registry name keeps the word Applet), TNT-USER, ACTIVE, documentation_url already the wiki page. Sibling `blanketPurchaseOrderAppletSupplierAccess` "Blanket Purchase Order Supplier Access" has no documentation_url. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-wavelet-blanket-purchase-order-applet` (commit a9d1f494); applet at `micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet`; routing mainPath `applets/akaun/staging/blanket-purchase-order-applet`; menus Blanket Purchase Order + Report; settings Application Settings, Default Selection, Printable Format Settings, Branch Settings (+ shared webhook, feature visibility, permission routes). [src:blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/app.routing.ts] [src:…/models/menu-items.ts]
- 2026-09-05 — Document type `INTERNAL_BLANKET_PURCHASE_ORDER`, amount signum 0, quantity signum 0 (applet constants and backend DCO `InternalCustomInternalBlanketPurchaseOrderDataConsistencyObject` L16–L19). `JournalPostingService` L99 skips lines with amount signum 0 → no journal; inventory processor skips quantity signum 0 → no stock. No `JournalPostingTypeHandler` entry. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalCustomInternalBlanketPurchaseOrderDataConsistencyObject.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java]
- 2026-09-05 — Draw-down: the PO applet shows its **KO For → Blanket Purchase Order** tab only when the company gendoc flow config has pair `INTERNAL_BLANKET_PURCHASE_ORDER → INTERNAL_PURCHASE_ORDER`, `flow_type = LINE`, enabled (`koBPO`, line-item-create L120–L131); the tab queries the line open queue for that pair (knock-off component L346–L356). Open-queue rows are written on FINAL by `GenericDocLineOpenQueueProcessor` from the same flow config (L65–L70). VOID → `VoidKnockOffProcessor.updateKO(genDoc, DELETED)`. [src:blg-applet-wavelet-internal-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-applet/src/app/components/purchase-order-container/purchase-order-create/line-item/line-item-create/line-item-create.component.ts] [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java] [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidKnockOffProcessor.java]
- 2026-09-05 — Report backend `BlanketPurchaseOrderReportUow`: per BPO line, linked PO qty (`link1.quantity_contra`), outstanding = `quantity_base − quantity_contra`, and a PO → GRN drill; WHERE is date window + `status != 'DELETED'` (no posting-status filter). [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/BlanketPurchaseOrderReportUow.java]
- 2026-09-05 — Create screen has Main, Supplier Info, Line Items only; Settlement and Department Hdr tabs are commented out (create html L38–L43). Main: Start Date + Validity in Day(s) → Valid Date auto-computed (L244–L258), stored as ext `VALIDITY_DATE_START` / `VALIDITY_DATE_END` / `VALIDITY`; Status ACTIVE/INACTIVE default ACTIVE; Purchase Agent picker. **No Maximum Amount / spend cap / maximum quantity field exists** (grep: 0 hits) — the old page invented them. [src:…/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create.component.html] [src:…/blanket-purchase-order-create-main/blanket-purchase-order-create-main.component.ts]
- 2026-09-05 — View: panels Main Details, Account, Lines, Doc Link, Department Hdr, Export, Attachments (L146–L152); FINAL/DISCARD only while ACTIVE and DRAFT; VOID only when FINAL (toast otherwise); DELETE when master `SHOW_DOCUMENT_DELETE_BUTTON` and not FINAL/VOID/DISCARDED. Line sub-tabs Main, Serial, Batch, Bin, Purchase Order (PO No, qty, delivered, open), Doc Link, Department. Listing bulk FINAL/DISCARD/VOID gated by `isShowColumn(HIDE, SHOW) = !HIDE || perm`. [src:…/blanket-purchase-order-view/blanket-purchase-order-view.component.ts] [src:…/blanket-purchase-order-listing/blanket-purchase-order-listing.component.ts]
- 2026-09-05 — Settings four-proof: shared `FieldConfigurationComponent` has **no gate for this applet code**, so only ungated sections render; 63 keys pass all four proofs via shared screen + inline gear; 13 keys (HIDE_AMOUNT_MAIN_LISTING, HIDE_LISTING_BRANCH, HIDE_PURCHASER, HIDE_REMARKS, HIDE_REFERENCE, HIDE_DOC_LINK_TAB/FROM/TO, HIDE_DEPARTMENT_HDR_TAB, HIDE_EXPORT_TAB, HIDE_PURCHASE_ORDER_TAB, HIDE_LINE_ITEM_LISTING_TXN_AMOUNT/UOM) are gear-only; runtime-only undeclared: ENABLE_INLINE_APPLET_CONFIG, SHOW_DOCUMENT_DELETE_BUTTON, HIDE_TRACKING_ID, HIDE_PERMIT_NO; ~40 declared-only (custom status, ENABLE_ dims, SST/WHT, print/email/ARAP/contra/settlement expands). `DEFAULT_TRANSACTION_DATE` options 1_month/1_week/1_day (container L150–L166), unset → one month (listing L155); SORT_ORDER → updated_date. [src:…/models/applet-settings.model.ts] [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html]
- 2026-09-05 — Inline gear (`app-applet-settings-toggle`, blg-intranet#5374): opt-in via `ENABLE_INLINE_APPLET_CONFIG` (merged master + personal); Owners/Admins save to master or personal, others personal only; personal `false` deletes the key rather than storing false. Used in 15 BPO screens with explicit `appletSettingsKeys` (69 keys) and 23 PDN screens (129 keys). [src:blg-shared-utilities/modules/settings/applet-settings-toggle/applet-settings-toggle.component.ts]
- 2026-09-05 — Permissions: server `TNT_API_DOC_INTERNAL_CUSTOM_INTERNAL_BLANKET_PURCHASE_ORDER_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` targets Company/Branch/Location/Entity; client-side seeded: `SHOW_TRANSACTION_DATE`, `HIDE_PRICE` (hides std unit price and unit discount on the view add-line form), `BLANKET_PURCHASE_ORDER_DISPLAY_PRICING` (seeded, never checked). Code also checks SHOW_DOC_NO_*, SHOW_GENDOC_*_BUTTON, SHOW_QTY/UNIT_PRICE/AMOUNT/DISCOUNT/TAX/WHT/UOM/LAST_PURCHASE_PRICE — none seeded. [src:planning/lanes/lane-3/perm-dfn/blanketPurchaseOrderApplet.tsv] [src:…/blanket-purchase-order-view-add-line-item/blanket-purchase-order-view-add-line-item-main/blanket-purchase-order-view-add-line-item-main.component.ts]
- 2026-09-05 — Print: `BLANKET_PURCHASE_ORDER_JASPER_PRINT_SERVICE`. A "Batch No Booking" page is registered (pages service L105) with no navigation to it. Issues: only the Angular 14 migration (repo #4); wiki #39 was the user-guide task. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/print/PrintServiceClassName.java] [src:gh:bigledger/blg-applet-wavelet-blanket-purchase-order-applet#4]

## How it connects

- **internal-purchase-order-applet** — the only consumer; its KO tab's visibility and contents both come from the company gendoc flow config + line open queue, not from any BPO setting.
- **gendoc-flow-config** — same mechanism as GRN → PI (run 2): `bl_fi_comp_gendoc_flow_config` pairs decide which open-queue rows FINAL writes and which knock-off tabs downstream applets show.
- **line-open-queue** — `quantity_contra` on the row is the "drawn down" figure; the report's outstanding = qty − contra.
- **inline-gear-settings** — second rendering path for settings keys; changes the four-proof method for every applet that embeds `app-applet-settings-toggle`.
- **internal-purchase-grn-applet** — report drill-down PO → GRN.

## Open questions

- Is the validity window meant to block knock-off after `VALIDITY_DATE_END`? No code enforces it (PO knock-off filters on open-queue rows only). Product question.
- Which applet exposes the company gendoc flow config UI? (Organisation applet is the likely home; not verified this run.)
- The registry name keeps the "Applet" suffix ("Blanket Purchase Order Applet") unlike the other purchase documents — intended?

## Wiki impact

- Old page's Maximum Amount / spend cap, maximum quantity per line, Settlement tab, Department on create, "releases" as a feature, and the AI infographic (`static/images/blanket-purchase-order-applet/blanket-purchase-order-overview.png`, now unreferenced) are gone.
- `modules/purchasing/related-applets` and `guides/roles/procurement-manager.md` mention blanket POs — check they do not promise spend caps.
- PDN page updated this run for the gear (11 keys previously "no control" are gear-settable).
