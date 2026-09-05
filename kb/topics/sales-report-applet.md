---
topic: sales-report-applet
aliases: [Sales Report, SR by item code, SR by document, SR by salesman, daily GP by salesman, daily cashflow analysis, calculate base on]
applets: [salesReport, SalesReportSupplierAccess]
modules: [pos, financial-accounting, inventory, membership]
related: [pos-general-applet, internal-sales-invoice-applet, internal-sales-return-applet, internal-receipt-voucher-applet, internal-payment-voucher-applet, daily-cashier-report-applet, doc-item-maintenance, customer-maintenance]
wiki:
  - content/en/applets/sales-workflow/sales-report-applet.md
status: growing
updated: 2026-09-05
---

# Sales Report applet

Sixteen read-only ag-grid reports over FINAL sales / return / trade-in documents and (for collection views) receipt and payment vouchers. Visibility of reports, cost columns and the "Calculate Base On" cost basis is driven by an applet-own settings screen paired with client-side permissions.

## Facts

- 2026-09-05 — Registry `salesReport` "Sales Report" (TNT-USER, ACTIVE; doc URL on Confluence). Sibling `SalesReportSupplierAccess` "Sales Report Supplier Access" [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Menu gating is generic: for each sidebar route, key = route upper-cased with `_`; hidden when `HIDE_<KEY>_MENU` setting is on and the user lacks `SHOW_<KEY>_MENU` [src:…/app.component.ts#L58-L72]
- 2026-09-05 — Application Settings is the applet's own component (not the shared FieldConfigurationComponent): menu hides (generated from `menuItems`), `ADVANCED_SEARCH_SHOW_<OPTION>` for the 23 Calculate Base On options, 12 column hides + `VIEW_OWN_CREATED_TRANSACTIONS_ONLY`, `HIDE_ITEM_CATEGORY_GROUP_1..20` [src:…/components/settings-container/field-configuration/field-configuration.component.ts#L28-L142]
- 2026-09-05 — The shared advanced search filters Calculate Base On purely on `ADVANCED_SEARCH_SHOW_*` settings; the code comment says the `SHOW_ADVANCED_SEARCH_*` client-side permission gate was removed because those defs "are never seeded platform-wide" — yet 24 such defs ARE registered for `salesReport` in akaun_master [src:blg-shared-utilities/utilities/advanced-search-general/advanced-search-general.component.ts#L285-L300] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Column visibility = `showColumns` pairs per report, e.g. `{name:'gp', setting:'HIDE_GP', permission:'SHOW_GP'}`; `HIDE_NET_MARGIN` and `HIDE_DELTA_*` have no registered SHOW pair [src:…/daily-sales-report-cashflow.component.ts#L83-L90]
- 2026-09-05 — Backend doc types per query (all FINAL): item code / daily GP = cashbill, invoice, return, sales trade-in; by salesman adds credit note + debit note; finance charges, hourly, daily-weekly-monthly, item-salesman-customer-category, supplier access = cashbill, invoice, return; cashflow analysis = cashbill, invoice, return, refund note, receipt voucher (+ payment voucher / return section); multi-branch = sales docs + GRN + purchase trade-in + receipt + payment vouchers; daily collection summary = receipt + payment vouchers [src:javasdk/…/SalesReportUow.java]
- 2026-09-05 — Branch filter is limited to the targets of the report's `API_TNT_DM_ERP_*_READ` permission (`getTargetsByPermission`) [src:…/daily-sales-report-cashflow.component.ts#L363] [src:javasdk/…/TntErpPermissions.java (getBranchCompanyTargetMap)]
- 2026-09-05 — Two routes without menu entries: `general-purchase-sales-inventory`, `member-reward-redemption` [src:…/app.routing.ts] [src:…/models/menu-items.ts]
- 2026-09-05 — The previous wiki page described "calculation sets", a "My Sales" menu, favourites and BI integration that do not exist in the code; replaced [src:content/en/applets/sales-workflow/sales-report-applet.md@HEAD]

- 2026-09-03 — Sales report query optimised: initial load down from about 5 minutes to under 10 seconds (weekly technical meeting). [src:gmail:1a0663d23d98e303]

## How it connects
- **e-invoice-consolidation** — monthly tallying of BigLedger sales vs LHDN totals starts from this report.

- **pos-general-applet / internal-sales-invoice-applet / internal-sales-return-applet** — the FINAL documents reported; returns reduce sales through amount signum.
- **internal-receipt-voucher-applet / internal-payment-voucher-applet** — the collection reports read STL lines of receipt and payment vouchers.
- **doc-item-maintenance** — replacement / manual / reference / delta / rebate prices and report unit costs are item fields used as cost basis; empty basis → zero cost.
- **daily-cashier-report-applet** — Z Report and Cashier Collection live in the same backend service (`SalesReportService.getCashierCollectionReport`).

## Open questions

- Should the 24 `SHOW_ADVANCED_SEARCH_*` defs for `salesReport` be deleted from the registry now that the code ignores them?
- `ALLOW_VIEW_TRANSACTION_ALL_USER_CREATE` is registered but not read.

## Wiki impact

- `sales-workflow/sales-report-applet` — rewritten (done 2026-09-05).
- `sales-workflow/sales-report-supplier-access-applet` (lane 1, queued) — reuse the doc-type facts here.
- `sales-workflow/daily-cashier-report-applet` (lane 1, queued) — link both ways.
