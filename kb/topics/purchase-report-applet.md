---
topic: purchase-report-applet
aliases: [purchase report, purchase report by item code, purchaseReport, PurchaseReportUow]
applets: [purchaseReport]
modules: [purchasing, inventory]
related: [internal-purchase-invoice-applet, internal-purchase-return-applet, internal-purchase-invoice-no-stock-in-applet, internal-purchase-grn-applet, internal-purchase-order-applet, internal-payment-voucher-applet, internal-purchase-debit-note-applet, creditor-report-applet, stock-balance-applet, calculate-base-on, advanced-search]
wiki:
  - content/en/applets/purchase-workflow/purchase-report-applet.md
status: growing
updated: 2026-09-05
---

# Purchase Report

Two read-only grids over finalised purchase invoices, purchase returns and no-stock-in invoices: line level (by document) and item level (by item code), each with a "Calculate Base On" cost basis, linked GRN / PO numbers and closing stock balance.

## Facts

- 2026-09-05 — Registry: code `purchaseReport`, name "Purchase Report", TNT-USER, ACTIVE; documentation_url already the wiki page. No client-side permissions seeded. [src:planning/private/registry-applets-2026-09-05.tsv] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Menus: Purchase Report (`purchase-report-by-document`), Purchase Report By Item Code; `app.component.ts` builds `HIDE_<MENU>_MENU` / `SHOW_<MENU>_MENU` keys generically from the route. Settings: Application Settings (applet-local field-configuration with tabs By Document / By Item Code / Item Category Group), Default Selection (`DEFAULT_BRANCH`, `DEFAULT_LOCATION`), webhook, permission screens, release notes. [src:…/purchase-report-applet/src/app/models/menu-items.ts] [src:…/src/app/app.component.ts] [src:…/src/app/app.routing.ts]
- 2026-09-05 — Backend `PurchaseReportUow.getPurchaseReportByDocument` / `getPurchaseReportByItemCode`: `server_doc_type in (INTERNAL_PURCHASE_INVOICE, INTERNAL_PURCHASE_RETURN, INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN)`, `txn_type = PNS`, `posting_status = FINAL`, `forex_doc_hdr_guid is null`; date column = `hdr.<date_type>` (default `date_txn`); GRN No via link GRN → PI, PO No via link PO → GRN; stock balance = last `bl_inv_txn_line` before period end per item/location; cost bases from `getBaseCostQuery()` (ref/delta/rebate price 1–3, sales/purchase min/max, `cost_ma_price_company`, replacement). Filters: branch, supplier (`doc_entity_hdr_guid`), salesman (`sales_entity_hdr_guid`), location, company, item guids, item status, item type, category 0–20, keyword over code/name/descr/scan_code/alt codes/remarks. Endpoints `purchase-report-by-document`, `purchase-report-by-item-code/backoffice-ep`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/purchase/PurchaseReportUow.java] [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/reports/purchase/PurchaseReportController.java]
- 2026-09-05 — The same UOW serves `getPurchaseInvoiceSettlementDetails` and `getPaymentVoucherLinesSettlementDetails` (payment vouchers and purchase debit notes against invoices) — the settlement-side query used by payables reporting. [src:same]
- 2026-09-05 — FE: `calculateBaseOnKeys` = cost_ma (default), cost_replacement, ref_price1–3, delta_price1–3, rebate_price1–3, sales_min/max_price, purchase_min/max_price, each gated by `ADVANCED_SEARCH_SHOW_<KEY>` setting or `SHOW_ADVANCED_SEARCH_<KEY>` permission; `HIDE_SEARCH_*` keys (8) hide search fields (2026, inline gear, gh:bigledger/blg-intranet#5384); column keys `HIDE_*` per grid; `HIDE_MA_COST` ↔ `SHOW_MA_COST`; external-reference columns ↔ `SHOW_QUOTATION/ORDER/DELIVERY_ORDER/INVOICE/OTHERS`. Validation messages: "Please enter both Date From and Date To before searching." (reworded 2026, gh:bigledger/blg-int-general-task#6099), "Search keyword must more than 2 characters.". [src:…/components/purchase-report-by-document-container/purchase-report-by-document/purchase-report-by-document.component.ts] [src:…/components/purchase-report-by-item-code-container/]
- 2026-09-05 — Settings model declares 131 keys; only 11 of them appear on the shared field-configuration screen, but the applet uses its own field-configuration component, so the shared-screen intersection is not the relevant list here. [src:…/src/app/models/applet-settings.model.ts] [src:blg-shared-utilities/modules/permission/field-configuration/]
- 2026-09-05 — The old page described a document-detail dialog with Details / Account / Line Items / Settlement / Doc Link tabs and columns "Document, Txn Date, Supplier Code, Status"; the component has no such dialog and its columns are line-level (Doc No … Amount Txn, GRN No, PO No). Corrected.

## How it connects

- **internal-purchase-invoice-applet** — the report is only as complete as the invoices that are FINAL; direct-keyed invoices have blank GRN/PO columns.
- **internal-purchase-grn-applet** — GRNs never appear themselves (not in the doc-type list); they only supply GRN No.
- **calculate-base-on** — shared idea with the sales/stock reports: multiply line quantity by a chosen item price/cost snapshot.

## Open questions

- Which header dates the shared advanced-search *Date Type* offers (the FE lowercases the choice into `hdr.<column>`; the header select exposes date_txn, date_finalized, created_date, updated_date, due_date) — confirm the option list in `blg-shared-utilities` advanced-search-general.

## Wiki impact

- `static/images/purchase-report-applet/purchase-report-infographic.jpg` (guide-style infographic) and `purchase-document-details.png` (a detail dialog the applet does not have) are no longer referenced.
