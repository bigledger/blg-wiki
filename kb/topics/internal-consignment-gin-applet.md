---
topic: internal-consignment-gin-applet
aliases: [consignment GIN, consignment goods issue note, supplier consignment GIN, CSGGIN, INTERNAL_PURCHASE_CONSIGNMENT_GIN]
applets: [internalConsignmentGINApplet]
modules: [purchasing, inventory]
related: [internal-consignment-grn-applet, internal-consignment-return-applet, internal-consignment-purchase-order-applet, internal-consignment-billing-applet, doc-item-maintenance, stock-balance, stock-report, chart-of-accounts, generic-document-posting-status, serial-number-tracking, moving-average-costing, creditor-report-applet, customer-consignment]
wiki:
  - content/en/applets/inventory-workflow/internal-consignment-gin-applet.md
  - content/en/guides/purchasing-guides/consignment-purchasing.md
status: growing
updated: 2026-09-05
---

# Consignment GIN (Internal)

The goods issue note for supplier-owned consignment stock: it takes a quantity out of one of your locations and, if the company posts journals for it, reduces what is recorded against the consignor. It is the outbound mirror of the Consignment GRN and the only consignment document with no knock-off and no VOID.

## Facts

- 2026-09-05 — Server document type `INTERNAL_PURCHASE_CONSIGNMENT_GIN`, short code `CSGGIN`; amount signum +1, quantity signum −1 [src:blg-akaun-platform-java/javasdk/.../InternalPurchaseConsignmentGinDataConsistencyObject.java L15–L17] [src:blg-akaun-platform-java/client-sdk/.../ServerDocTypes.java L40] [src:blg-akaun-platform-java/client-sdk/.../GenericDocServerDocTypeEnum.java L59]
- 2026-09-05 — The GIN is **not** in the backend's consignment journal list (`isConsignmentStockIn` = GRN, RETURN, GRN_STOCK_IN only); it has no handler of its own and falls back to the generic `PURCHASE` handler (CREDITOR / PURCHASE / INPUT_TAX …) because the type name contains "PURCHASE" [src:blg-akaun-platform-java/javasdk/.../JournalPostingService.java L64–L81] [src:.../JournalPostingTypeHandler.java L53–L63]
- 2026-09-05 — When posted: line amount × +1 with a positive amount → credit the purchase side; the balancing entity line debits `CREDITOR` (AP_TRADE) or `CREDITOR_NON_TRADE` (AP_OTHER); an unmapped creditor default throws `MISSING_DEFAULT_GL_CODE` [src:.../JournalPostingService.java L95–L128, L318–L345, L1561–L1575]
- 2026-09-05 — Stock: quantity × −1 against the header location; the type is in `MA_WA_SERVER_DOC_TYPES`, so the line's Txn Amount (not the running average) leaves the moving-average cost pool [src:.../StockBalanceHelper.java L40–L42, L166–L170] [src:.../BackdatedInvTxnLineService.java L80]
- 2026-09-05 — FINAL is sent as `{posting_status:'FINAL'}` with no `validate_stock_balance` flag, so the backend validates stock (default `true`) and rejects with `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION`; fiscal-period lock applies with no exemption [src:blg-applet-wavelet-internal-consignment-gin-applet/.../internal-consignment-gin.effects.ts L519–L536] [src:.../GenericDocumentService.java L390–L392, L1682–L1695, L2213–L2216]
- 2026-09-05 — No VOID action, no auto-final, no approval, no e-Invoice flag in the applet; the only reversal is a compensating Consignment GRN [src:blg-applet-wavelet-internal-consignment-gin-applet commit 04acb95, routes + edit component]
- 2026-09-05 — Application Settings = shared `FieldConfigurationComponent`; the shared screen has no branch for `internalConsignmentGINApplet`, so every ungated control renders; ~45 `HIDE_*` keys plus `PRINTABLE` pass the four proofs; `HIDE_CURRENCY` is read but its control is fenced to other applets; `SHOW_DOCUMENT_DELETE_BUTTON` is read without a model declaration [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html L1592, L1775, L6136] [src:.../internal-consignment-gin-edit.component.ts L104–L112]
- 2026-09-05 — Settings > Default Selection and Personalisation > Default Selection are dead: `appletContainer` is never bound, a change throws, `save` has no listener; no form reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION` [src:.../settings-container/default-settings/default-settings.component.ts L25–L67]
- 2026-09-05 — Item search sends `consignment_flg = true`; only items flagged Consignment Item in Doc Item Maintenance can be added [src:.../line-search-item-listing.component.ts L90]
- 2026-09-05 — `bl_applet_client_side_perm_dfn` has 0 rows for this applet; the 20-odd `SHOW_*` codes checked in the line's Main Details cannot be granted until seeded (F-0044 pattern) [src:akaun_master.bl_applet_client_side_perm_dfn 2026-09-05]
- 2026-09-05 — Knock-off tabs (SO, DO, PO, requisition, quotation, invoice, return) are commented out in the Lines tab; a customer UAT asked for a GIN knock-off and was told it does not exist [src:gh:bigledger/blg-int-general-task#2016] [src:.../internal-consignment-gin-create.component.html]
- 2026-09-05 — Customer UAT on the shared hide screen: no hide for Payment / Department Hdr tabs, Credit Terms, Currency, Permit No, Tracking ID for this applet code; the code shows Payment / Department Hdr / Permit No / Tracking ID hides do exist (`HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID`) but only after the first Save of Application Settings persists them; Currency and Credit Terms genuinely have none [src:gh:bigledger/blg-int-general-task#2016] [src:.../main-details.component.html]
- 2026-09-05 — The FINAL error handler calls `String.includes(a, b)` with two arguments (effects L544), so only `FISCAL_PERIOD_LOCKED` is matched by that clause; the serial-number codes are matched by the following clauses [src:.../internal-consignment-gin.effects.ts L540–L556]

## How it connects

- **internal-consignment-grn-applet** — the inbound half (qty +1 / amt −1); a GIN can only issue what a GRN put at the location, and a GRN is the only way to reverse a GIN.
- **internal-consignment-return-applet** — the other outbound consignment document, but it posts to `CONSIGNMENT_LIABILITY` / `CONSIGNMENT_STOCK`; the GIN posts to ordinary creditor / purchase accounts.
- **doc-item-maintenance** — the Consignment Item flag gates the item search.
- **moving-average-costing** — the GIN moves the cost pool by its own Txn Amount, so a mis-keyed price shifts the MA price of what is left.
- **stock-report** — the Stock Report's document-type filter lists `INTERNAL_PURCHASE_CONSIGNMENT_GIN`; there is no dedicated consignment report (customers ask for one).
- **creditor-report-applet** — treats the GIN as an AP document selectable for contra.
- **customer-consignment** — the sales-side (consignee) family; unrelated code, same word.

## Open questions

- Should a consignment GIN post a journal at all? With the PURCHASE fallback it credits Purchase and debits Creditor — a reversal of a purchase that was never invoiced. Companies that post journals for it should probably exclude the journal processor for `INTERNAL_PURCHASE_CONSIGNMENT_GIN` in `posting_final_json`. Needs a product decision.
- Why is the GIN absent from `isConsignmentStockIn` while GRN and RETURN are present — oversight or intentional?

## Wiki impact

- content/en/guides/purchasing-guides/consignment-purchasing.md — state: no knock-off, no VOID, compensating GRN reverses; the journal (if any) hits ordinary creditor/purchase accounts, unlike GRN/Return.
- content/en/applets/inventory-workflow/internal-consignment-grn-applet.md — mirror signums; the customer UAT list of missing hides (Delivery Details, Payment, Department Hdr, Currency, Terms/Limit, Tracking ID) to be checked against the GRN code.
