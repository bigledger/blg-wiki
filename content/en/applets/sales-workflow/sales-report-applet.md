---
title: "Sales Report"
description: "Reference for the Sales Report applet: sixteen grid reports over FINAL sales, return, trade-in, receipt and payment documents — by item, document, salesman, hour, day/week/month, branch, collection, card receipt, serial number and voucher — with cost basis, gross profit and delta columns gated by settings and permissions."
applet_code: "salesReport"
applet_repo: "blg-applet-wavelet-sales-report-applet"
modules: [pos, financial-accounting, inventory, membership]
related_applets: [pos-general-applet, internal-sales-invoice-applet, internal-sales-return-applet, internal-sales-credit-note-applet, internal-sales-debit-note-applet, internal-receipt-voucher-applet, internal-payment-voucher-applet, daily-cashier-report-applet, sales-report-supplier-access-applet, non-stock-and-trade-in-applet, voucher-management-applet, membership-admin-applet, inv-item-maintenance-applet, pricebook-applet, customer-applet, cashbook-applet, organisation-applet]
guides: []
sources:
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/app.routing.ts
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/app.component.ts
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/models/advanced-search-models/ (one search model per report)
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/components/settings-container/field-configuration/field-configuration.component.{ts,html} (applet-own Application Settings screen)
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/components/settings-container/release-notes/release-notes.component.html
  - blg-applet-wavelet-sales-report-applet/micro-fe/projects/wavelet-erp/applets/sales-report-applet/src/app/components/*-container/ (grid column definitions, showColumns setting/permission pairs, branch targets)
  - blg-shared-utilities/utilities/advanced-search-general/advanced-search-general.component.ts (Calculate Base On gating)
  - blg-shared-utilities/utilities/ag-grid-custom/ag-grid-custom.component.ts (grid status bar export)
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/reports/sales/SalesReportService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/sales/SalesReportUow.java (document types and posting status per report)
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code salesReport)
tags:
- sales-reporting
- revenue-tracking
- performance-analytics
- sales-management
- financial-reporting
weight: 120
---

## Overview

The **Sales Report** applet is a set of read-only grid reports over finalised sales documents — cash bills, sales invoices, sales returns, trade-ins and (for the collection reports) receipt and payment vouchers. Sales managers use it to see sales, cost, gross profit and delta margins by item, document, salesman, hour, day / week / month, branch or customer category; finance uses the collection, credit-card receipt and cashflow views to tie sales to money received. Every report has the same shape: an advanced search on top, an ag-grid listing with totals, and export from the grid's status bar. Which reports, which cost columns and which cost basis a user sees is decided by applet settings paired with client-side permissions.

{{< figure src="/images/sales-report-applet/sales-report-overview-infographic.png" alt="Before and after view of manual sales reporting versus the Sales Report applet" caption="From manual spreadsheets to grid reports over the same FINAL documents finance posts." >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) | `INTERNAL_SALES_CASHBILL`, `INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_RETURN` in FINAL are the rows of most reports |
| Upstream | [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) | Included in SR By Salesman (the CM column) |
| Upstream | [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/) | `INTERNAL_SALES_TRADE_IN` / `INTERNAL_PURCHASE_TRADE_IN` lines in item, salesman, GP and multi-branch reports |
| Upstream | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | Daily Cashflow Analysis, Daily Summary, Receipt with Credit Card, Collection Invoice Detail, Multi Branch Sales |
| Upstream | [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Customer](/applets/master-data/customer-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Organisation](/applets/master-data/organisation-applet/) | Item categories 1–20, item types, cost and reference prices; pricing scheme; customer category and state; cashbook; branch / company |
| Upstream | [Voucher Management](/applets/membership/voucher-management-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) | Voucher Redemption report; member points (reward redemption route) |
| Sibling | [Daily Cashier Report](/applets/sales-workflow/daily-cashier-report-applet/) | Z Report and Cashier Collection (same backend service family) |
| Sibling | [Sales Report Supplier Access](/applets/sales-workflow/sales-report-supplier-access-applet/) | The supplier-facing subset of SR By Item Code |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/sales-report-applet/`. Each menu item can be removed with its `HIDE_<MENU>_MENU` setting unless the user holds the matching `SHOW_<MENU>_MENU` permission (see Configuration). All reports read FINAL documents only unless stated.

| Menu item | Route | Documents | Main columns |
|---|---|---|---|
| **SR By Item Code** | `sales-report-by-item-code` | Cash bill, invoice, return, sales trade-in | Item, type, UOM, branch, location, location / company stock balance, qty sold, sales amount, sales cost, landed cost, GP and GP% (MA cost, MA + landed), categories 1–20 |
| **SR By Document** | `sales-report-by-document` | Document types you select | Branch, location, delivery location, customer code / name / state, ref 1–2, salesman, created by, shipping entity, pricing scheme, item, date / time, doc type / no, doc and line remarks, qty, unit price, unit cost, delta unit cost, gross amount, discount, net, tax, txn amount, GP |
| **SR By Finance Charges** | `sales-report-by-finance-charges` | Cash bill, invoice, return | Item, qty sold / returned, standard price, discount, net price, net amount, finance rate and charge, sales cost, GP |
| **SR By Daily Weekly Monthly** | `sales-report-by-daily-weekly-monthly` | Cash bill, invoice, return | Period, salesman, customer, item, qty, amount, sales cost, GP |
| **Daily Cashflow Analysis** | `daily-sales-report-cashflow` | Cash bill, invoice, return, refund note, receipt voucher; payment vouchers and returns in a separate section | Section, branch, customer, doc, remarks, client docs 1–5, doc links, payment info, amount, then cash / card / cheque / PD cheque / coupon / bank transfer / e-wallet / other |
| **Hourly SR** | `hourly-sales-report` | Cash bill, invoice, return | Branch, item, one column per hour, total row |
| **Daily GP By Salesman** | `daily-gp-by-salesman` | Cash bill, invoice, return, sales trade-in | Salesman, date, sales, return, invoice and return counts, average per invoice, units, net sales, cost, GP, GP%, delta cost / GP / GP% |
| **SR By Salesman** | `sales-report-by-salesman` | Cash bill, invoice, return, credit note, debit note, sales trade-in | Salesman, sales, returns, CM, net sales, cost, GP, GP%, delta cost / GP / GP%, net margin; optional group by salesman |
| **Multi Branch Sales** | `multi-branch-sales-purchase-collection` | Cash bill, invoice, return, GRN, purchase trade-in, receipt and payment vouchers | Date, branch, sales before / after tax, returns, GP, GRN before / after tax, trade-in, collection, payment |
| **Daily Summary** | `daily-collection-summary` | Receipt and payment vouchers | Date, collection, payment voucher, receipts by cash / cheque / PD cheque / card / coupon / e-wallet / other, open balance |
| **Receipt with Credit Card** | `receipt-with-credit-card` | Receipt vouchers settled by card | Cashbook, payment method, doc, payer, card no / name, approval code, batch, amount, card charges, net |
| **Collection Invoice Detail** | `collection-with-invoice-detail` | Receipts with the invoices they settle | Receipt doc, amount before / after tax, balance, invoice item, contra doc, settlement method, salesman, customer |
| **SR By Serial Number** | `sales-report-by-serial-number` | Serialised sales lines | Branch, customer, salesman, item, doc, serial number, qty, prices, discount, apportioned discount, net |
| **Sales Item and Collection Invoice** | `sales-item-collection-invoice` | Invoices with sales order, receipt and points | Invoice, SO, item, sold / returned, net price, tax, finance cost and rate, MA unit / total cost, margin, item points, receipt and receipt mode |
| **SR By Item Salesman Customer Category** | `sales-report-by-item-salesman-customer-category` | Cash bill, invoice, return | Two configurable group-by levels (item category level 1–20), salesman, customer, state, total, cost, GP |
| **Voucher Redemption** | `voucher-redemption` | Redeemed vouchers | Redemption date, voucher code / name / type, serial, amount, validity / assignment / redemption / cancellation status, company, branch, location, doc, entity |

Two further routes exist but are not in the menu: `general-purchase-sales-inventory` and `member-reward-redemption` (points earned and redeemed by card, item and transaction type).

{{< figure src="/images/sales-report-applet/main-listing.png" alt="Sales Report main listing" caption="A report: advanced search on top, grid with totals below." >}}

{{< figure src="/images/sales-report-applet/advanced-search.png" alt="Advanced search panel" caption="Advanced search — branch, date, customer, salesman, item type / status, Calculate Base On, item category levels, Sales Lead." >}}

{{< figure src="/images/sales-report-applet/sales-report-by-item-code-report.png" alt="Sales Report by Item Code" caption="SR By Item Code." >}}

{{< figure src="/images/sales-report-applet/sales-report-by-document.png" alt="Sales Report by Document" caption="SR By Document." >}}

{{< figure src="/images/sales-report-applet/sales-report-by-salesman.png" alt="Sales Report by Salesman" caption="SR By Salesman." >}}

{{< figure src="/images/sales-report-applet/daily-gp-by-salesman.png" alt="Daily GP by Salesman" caption="Daily GP By Salesman." >}}

{{< figure src="/images/sales-report-applet/daily-sales-report-cashflow.png" alt="Daily Sales Report with Cashflow Analysis" caption="Daily Cashflow Analysis." >}}

{{< figure src="/images/sales-report-applet/sales-report-by-daily-weekly-monthly-1.png" alt="Daily Weekly Monthly summary" caption="SR By Daily Weekly Monthly." >}}

{{< figure src="/images/sales-report-applet/multi-branch-sales-purchase-collection.png" alt="Multi-Branch Sales, Purchase and Collection" caption="Multi Branch Sales." >}}

{{< figure src="/images/sales-report-applet/daily-collection-summary.png" alt="Daily Collection Summary" caption="Daily Summary." >}}

{{< figure src="/images/sales-report-applet/receipt-with-credit-card.png" alt="Receipt with Credit Card" caption="Receipt with Credit Card." >}}

{{< figure src="/images/sales-report-applet/collection-with-invoice-detail.png" alt="Collection with Invoice Detail" caption="Collection Invoice Detail." >}}

{{< figure src="/images/sales-report-applet/sales-report-by-serial-number.png" alt="Sales Report by Serial Number" caption="SR By Serial Number." >}}

{{< figure src="/images/sales-report-applet/sales-item-collection-invoice.png" alt="Sales Item and Collection Invoice" caption="Sales Item and Collection Invoice." >}}

### Advanced search

Fields vary per report; the common ones are Branch (multi-select, grouped by company, limited to the branches the user's API permission targets), Date range (or Date Option for Multi Branch Sales), Customer, Customer Category, Salesman, Shipping Entity, Item Code, Item Type (basic, grouped, NSTI, bundle, coupon, service, warranty, GL code, header adjustment …), Item Status, Item Category Level 1–20, **Calculate Base On** (cost basis, see below), **Sales Lead** (sales-lead type / label), Optional (`HIDE_GL_CODE_TYPE` — leave GL-code lines out), Invoice No (SR By Document), Cashbook and Credit Card item (Receipt with Credit Card), Group By 1 / 2 (SR By Item Salesman Customer Category), Company / Voucher Code / Date Redeem (Voucher Redemption).

**Calculate Base On** chooses the cost or price used for cost, GP and delta columns: `cost_ma` (default), `cost_wa`, `cost_fifo`, `cost_lifo`, `cost_replacement`, `cost_manual`, `ref_price1–3`, `delta_price1–3`, `rebate_price1–3`, `sales_min_price`, `sales_max_price`, `purchase_min_price`, `purchase_max_price`, `report_unit_replacement_cost`, `report_unit_manual_cost`, `report_unit_commission`, `report_unit_rebate`. Replacement cost falls back to MA cost when zero; SR By Document uses delta price and falls back to the delta-price percentage amount when empty.

### Grid and export

Each grid supports column grouping, a totals footer row, a document popup from a row (cost amount and GP in the popup are hideable), and export of the current grid — title, filename and date-range subtitle are set per report — from the status bar (PDF and Excel).

{{< figure src="/images/sales-report-applet/export-1.png" alt="Export report" caption="Export from the grid status bar." >}}

{{< figure src="/images/sales-report-applet/export-2.png" alt="Exported PDF" caption="Exported report." >}}

### Settings and Personalization menus

| Entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | The applet's **own** settings screen (not the shared Field Configuration): menu visibility, Calculate Base On options, cost / GP column visibility, category-group visibility, own-transactions-only |
| Default Selection | `settings/default-selection` | Default Branch, Default Location |
| Webhook, Release Notes, permission listings | `settings/…` | Standard |
| **Personalization → Default Selection** | `personalization/personal-default-selection` | Per-user Default Branch and Default Location |

{{< figure src="/images/sales-report-applet/settings-page.png" alt="Settings page" caption="Settings menu." >}}

{{< figure src="/images/sales-report-applet/application-setting.png" alt="Application Settings" caption="Application Settings — hide or show each sidebar report." >}}

{{< figure src="/images/sales-report-applet/set-default.png" alt="Default Selection" caption="Default Selection — branch and location." >}}

{{< figure src="/images/sales-report-applet/role-perm.png" alt="Role permission" caption="Role permission listing." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| FINAL sales documents | [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) | Every query filters `posting_status = 'FINAL'`; drafts never appear |
| Item costs and reference prices maintained | [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | MA / WA / FIFO / LIFO cost come from costing; replacement, manual, reference, delta and rebate prices and report unit costs are item fields — an empty basis gives zero cost and 100% GP |
| Item categories 1–20 | [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Category columns and category-level filters |
| Customer category and state | [Customer](/applets/master-data/customer-applet/) | Filters and the State column |
| Cashbooks and settlement methods | [Cashbook](/applets/master-data/cashbook-applet/) | Collection and card-receipt reports group by cashbook / method |
| API read permission per report, with branch targets | Settings → permission listings | `API_TNT_DM_ERP_SALES_REPORT_BY_ITEM_CODE_READ`, `…_BY_DOCUMENT_READ`, `…_BY_FINANCE_CHARGES_READ`, `…_CASHFLOW_ANALYSIS_READ`, `…_BY_SALESMAN_READ`, `API_TNT_DM_ERP_DAILY_GP_BY_SALESMAN_READ`, `…_HOURLY_SALES_REPORT_READ`, `…_MULTI_BRANCH_DAILY_SALES_PURCHASE_COLLECTION_READ`, `…_DAILY_COLLECTION_SUMMARY_READ`, `…_OFFICIAL_RECEIPT_BY_CREDIT_CARD_READ`, `…_COLLECTION_INVOICE_DETAILS_READ`; the branch picker only offers the targets granted |

### Applet settings

**Default Selection** (`settings/default-selection`): `DEFAULT_BRANCH`, `DEFAULT_LOCATION`. Personalization → Default Selection holds the same two keys per user.

**Application Settings** (`settings/field-settings`) — this applet renders its own screen with four groups:

| Group | Keys | Effect when on |
|---|---|---|
| Menu | `HIDE_<MENU>_MENU` for every sidebar item, e.g. `HIDE_SALES_REPORT_BY_ITEM_CODE_MENU`, `HIDE_SALES_REPORT_BY_DOCUMENT_MENU`, `HIDE_SALES_REPORT_BY_FINANCE_CHARGES_MENU`, `HIDE_SALES_REPORT_BY_DAILY_WEEKLY_MONTHLY_MENU`, `HIDE_DAILY_SALES_REPORT_CASHFLOW_MENU`, `HIDE_HOURLY_SALES_REPORT_MENU`, `HIDE_DAILY_GP_BY_SALESMAN_MENU`, `HIDE_SALES_REPORT_BY_SALESMAN_MENU`, `HIDE_MULTI_BRANCH_SALES_PURCHASE_COLLECTION_MENU`, `HIDE_DAILY_COLLECTION_SUMMARY_MENU`, `HIDE_RECEIPT_WITH_CREDIT_CARD_MENU`, `HIDE_COLLECTION_WITH_INVOICE_DETAIL_MENU`, `HIDE_SALES_REPORT_BY_SERIAL_NUMBER_MENU`, `HIDE_SALES_ITEM_COLLECTION_INVOICE_MENU`, `HIDE_SALES_REPORT_BY_ITEM_SALESMAN_CUSTOMER_CATEGORY_MENU`, `HIDE_VOUCHER_REDEMPTION_MENU` | Removes the item from the sidebar for everyone except users holding the matching `SHOW_<MENU>_MENU` permission (key = route in upper case with `_`) |
| Advanced search | `ADVANCED_SEARCH_SHOW_<OPTION>` for each Calculate Base On option: `ADVANCED_SEARCH_SHOW_COST_MA`, `…_COST_WA`, `…_COST_FIFO`, `…_COST_LIFO`, `…_COST_REPLACEMENT`, `…_COST_MANUAL`, `…_REF_PRICE1/2/3`, `…_DELTA_PRICE1/2/3`, `…_REBATE_PRICE1/2/3`, `…_SALES_MIN_PRICE`, `…_SALES_MAX_PRICE`, `…_PURCHASE_MIN_PRICE`, `…_PURCHASE_MAX_PRICE`, `…_REPORT_UNIT_REPLACEMENT_COST`, `…_REPORT_UNIT_MANUAL_COST`, `…_REPORT_UNIT_COMMISSION`, `…_REPORT_UNIT_REBATE` | Only options switched on appear in the Calculate Base On list (all off = empty list) |
| Columns | `HIDE_COST`, `HIDE_MA_COST`, `HIDE_UNIT_COST`, `HIDE_GP`, `HIDE_GP_PERCENTAGE`, `HIDE_NET_MARGIN`, `HIDE_DELTA_COST`, `HIDE_DELTA_UNIT_COST`, `HIDE_DELTA_GP`, `HIDE_DELTA_GP_PERCENTAGE`, `HIDE_DOC_POPUP_COST_AMOUNT`, `HIDE_DOC_POPUP_GP` | Hides the cost / margin column (or popup value) in every report that has it, unless the user holds the paired `SHOW_*` permission |
| Columns | `VIEW_OWN_CREATED_TRANSACTIONS_ONLY` (labelled *VIEW_SALESMAN_OWN_TRANSACTION_ONLY*) | Daily Cashflow Analysis is limited to documents the user created; `ALLOW_VIEW_ALL_SALESMAN_TRANSACTION` widens it to all salesmen |
| Category groups | `HIDE_ITEM_CATEGORY_GROUP_1` … `HIDE_ITEM_CATEGORY_GROUP_20` | Hides that category column in the grids and its level filter in advanced search |

Keys in the settings model with no UI: department / tax `ENABLE_*` / `INCLUDE_*`, custom-status `ENABLE_ / NAME_ / LIST_CUSTOM_STATUS_*`, `PRINTABLE`.

### Document behaviour settings

Not applicable — the applet creates no documents. Cost basis defaults to `cost_ma` when nothing is chosen; the document popup opens the source document read-only.

### Feature visibility / permissions

Client-side permissions registered for this applet (49 ACTIVE):

| Group | Codes | Pairs with |
|---|---|---|
| Menus | `SHOW_SALES_REPORT_BY_ITEM_CODE_MENU`, `SHOW_SALES_REPORT_BY_DOCUMENT_MENU`, `SHOW_SALES_REPORT_BY_FINANCE_CHARGES_MENU`, `SHOW_SALES_REPORT_BY_DAILY_WEEKLY_MONTHLY_MENU`, `SHOW_DAILY_SALES_REPORT_CASHFLOW_MENU`, `SHOW_HOURLY_SALES_REPORT_MENU`, `SHOW_DAILY_GP_BY_SALESMAN_MENU`, `SHOW_SALES_REPORT_BY_SALESMAN_MENU`, `SHOW_MULTI_BRANCH_SALES_MENU`, `SHOW_MULTI_BRANCH_SALES_PURCHASE_COLLECTION_MENU`, `SHOW_DAILY_COLLECTION_SUMMARY_MENU`, `SHOW_RECEIPT_WITH_CREDIT_CARD_MENU`, `SHOW_COLLECTION_WITH_INVOICE_DETAIL_MENU`, `SHOW_SALES_REPORT_BY_SERIAL_NUMBER_MENU`, `SHOW_SALES_ITEM_COLLECTION_INVOICE_MENU`, `SHOW_SALES_REPORT_BY_ITEM_SALESMAN_CUSTOMER_CATEGORY_MENU` | `HIDE_<MENU>_MENU` settings (no `SHOW_VOUCHER_REDEMPTION_MENU` is registered) |
| Columns | `SHOW_COST`, `SHOW_MA_COST`, `SHOW_UNIT_COST`, `SHOW_GP`, `SHOW_GP_PERCENTAGE`, `SHOW_DOC_POPUP_COST_AMOUNT`, `SHOW_DOC_POPUP_GP` | `HIDE_*` column settings (no `SHOW_NET_MARGIN` / `SHOW_DELTA_*` are registered, so those hides cannot be reopened per role) |
| Scope | `ALLOW_VIEW_ALL_SALESMAN_TRANSACTION` (read by Daily Cashflow Analysis), `ALLOW_VIEW_TRANSACTION_ALL_USER_CREATE` (registered, not read by the current code) | `VIEW_OWN_CREATED_TRANSACTIONS_ONLY` |
| Cost basis (legacy) | `SHOW_ADVANCED_SEARCH_COST_MA / _WA / _FIFO / _LIFO / _MANUAL / _REPLACEMENT`, `…_REF_PRICE1–3`, `…_DELTA_PRICE1–3`, `…_REBATE_PRICE1–3`, `…_SALES_MIN/MAX_PRICE`, `…_PURCHASE_MIN/MAX_PRICE`, `…_REPORT_UNIT_*` | Registered but **no longer read**: the shared advanced search gates Calculate Base On on the `ADVANCED_SEARCH_SHOW_*` settings only |

## Fields

Read-only applet; the only inputs are the advanced-search fields above and the two default-selection keys.

## Lifecycle and posting

Not applicable. Reports never change documents, stock or the ledger. Amounts are multiplied by each line's amount signum, so returns, credit notes and trade-ins reduce sales, and posting status must be FINAL.

## Related applets

- [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) — the documents reported.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — collection reports.
- [Daily Cashier Report](/applets/sales-workflow/daily-cashier-report-applet/) — Z Report and Cashier Collection.
- [Sales Report Supplier Access](/applets/sales-workflow/sales-report-supplier-access-applet/) — supplier-facing sales by item.
- [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/), [Voucher Management](/applets/membership/voucher-management-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) — trade-in, voucher and points rows.
- [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Customer](/applets/master-data/customer-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Organisation](/applets/master-data/organisation-applet/) — master data the filters and columns come from.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A report is missing from the sidebar for one user | `HIDE_<MENU>_MENU` on and the user lacks `SHOW_<MENU>_MENU` | Turn the hide off or grant the permission |
| Calculate Base On list is empty or lacks an option | No `ADVANCED_SEARCH_SHOW_<OPTION>` setting switched on | Application Settings → advanced search group |
| Cost, GP, GP%, delta or net-margin column missing | `HIDE_*` column setting on; user lacks the paired `SHOW_*` (net margin and delta columns have no permission) | Turn the hide off, or grant `SHOW_COST` / `SHOW_GP` / … |
| Branch picker shows only some branches, or a report is empty for a branch | The report's API read permission is granted without that branch target | Add the branch to the permission target |
| Daily Cashflow Analysis shows only my own documents | `VIEW_OWN_CREATED_TRANSACTIONS_ONLY` on | Grant `ALLOW_VIEW_ALL_SALESMAN_TRANSACTION` or turn the setting off |
| GP is 100% or cost is zero | The chosen cost basis is empty on the item (manual / replacement / reference price not maintained) | Maintain the item field or choose `cost_ma` |
| Filtering SR By Document by Sales Lead returned only cash bills | Older build ignored the selected document types when a sales lead was chosen | Fixed; upgrade |
| Receipt with Credit Card net amount wrong; wrong settlement total when the header is a receipt voucher; GP / net margin miscalculated; return totals missing in Daily GP By Salesman; hour columns missing in Hourly SR | Older build bugs | Fixed; upgrade |
| Export fails with more than two group columns | Older build | Fixed; upgrade |
| Category 1–20 column or filter not shown | `HIDE_ITEM_CATEGORY_GROUP_n` on | Application Settings → category groups |
| Cannot find a document by its remarks | Remarks filter added recently to SR By Document and SR By Item Code | Upgrade, then use the Remarks field |

## Related documentation

- [Sales & POS module](/modules-v2/pos/)
- [Sales Workflow applets](/applets/sales-workflow/)
