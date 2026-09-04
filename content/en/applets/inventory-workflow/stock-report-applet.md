---
title: "Stock Report"
description: "Reference for the Stock Report applet — thirteen read-only inventory reports (movement, aging, summary by location, historical balance, sales and purchase by item, value by level, batch expiry, and five stock balance variants) with cost and price columns gated by settings and permissions."
applet_code: "stockReport"
applet_repo: "blg-applet-wavelet-stock-report-applet"
modules: [inventory, financial-accounting]
related_applets: [stock-balance-applet, stock-availability-applet, stock-transfer-applet, stock-adjustment-applet, stock-take-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, pricebook-applet, organisation-applet, financial-report-applet]
guides: []
sources:
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/app.component.ts
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/components/settings-container/default-settings/
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/components/stock-movement-report-container/
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/components/stock-summary-report-by-location-container/
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/components/historical-stock-balance-container/
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/components/stock-balance-report-container/
  - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/components/stock-balance-report-new-container/
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/stock/StockReportUow.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet stockReport)
tags:
- stock-report
- inventory-management
- warehouse
- stock-analysis
- stock-balance
---

## Overview

The Stock Report applet is the read-only reporting front end for inventory. It reads the stock transaction ledger (`bl_inv_txn_line`), the item-location balances and the item master, and presents thirteen reports: where stock moved, how old it is, what each location holds, what the balance was on a past date, what was bought and sold per item, and the stock value by category level. Nothing in it creates, edits or posts a document.

Warehouse managers open it to trace movements and count discrepancies; finance opens it for closing-stock values and gross profit; purchasing for sales-versus-purchase and last-purchase-price checks. Every report shares the same layout — an **Advanced Search** panel, a column toggle, an interactive grid with grouping and totals, and Excel / PDF export from the status bar.

{{< figure src="/images/stock-report-applet/stock-report-applet-overview-infographic.png" alt="Stock Report applet overview" caption="One applet, thirteen reports over the same stock ledger." >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | Every stock-moving document — sales invoice / cash bill / return, purchase invoice / GRN / return, [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/), [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/), consignment, RTV | Each writes one signed line to the stock ledger the reports read |
| Upstream | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) / [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Item type, sub-type, category levels 1–10, EAN, UOM |
| Upstream | [Pricebook](/applets/master-data/pricebook-applet/) | Pricing schemes shown on the Stock Balance Pricing Report |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies, branches, locations and location labels used as filters |
| Sibling | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | Live per-location balance and availability; this applet is the historical and analytical view |
| Downstream | [Financial Report](/applets/finance/financial-report-applet/) | Closing stock value in the ledger should agree with the Stock Balance / Summary by Location closing values |

Modules: Inventory, Financial Accounting.

## Screens and menus

| Menu | Route | What it shows |
|---|---|---|
| Stock Movement Report | `stock-movement-report` | Every stock ledger line, grouped by item, with running balance |
| Stock Aging Report | `stock-aging-report` | Remaining quantity and value by age bucket |
| Stock Summary Report By Location | `stock-summary-report-by-location` | Opening, purchase, sold, adjustment, others, in-transit, closing per item and location |
| Historical Stock Balance | `historical-stock-balance` | Balance and MA value as at a past date |
| Stock Sales And Purchase By Item Code | `stock-sales-purchase-by-item-code` | Sales vs purchase quantity and amount, GP, stock-turn ratio |
| Stock Value By Level Report | `stock-value-by-level` | Quantity and value pivoted by category level and location |
| Batch and Expiry Date Report | `batch-expiry-date` | Batch quantities in expiry buckets |
| Stock Balance Report | `stock-balance-report-new` | Current balance with MA and last cost per company |
| Stock Balance by Item, Supplier and Batch Expiry Report | `stock-balance-supplier-serial-batch` | Balance per item, supplier entity and batch with MA value |
| Stock Balance Pricing Report | `stock-balance-report` | Current balance with the item's price-book prices, tax codes and costs |
| Stock Balance Report With Serial | `stock-balance-report-with-serial` | Balance per location with serial list, add / subtract and stock count |
| Stock Balance Report by Supplier with Serial | `stock-balance-report-supplier-serial` | Balance traced to the purchase document, supplier and serials |

An *Item Price Change Report* route exists but its menu entry has been removed. Gear (Settings) menu: **Application Settings**, **Default Selection**, **Aging Period Settings**, **Custom Resource Bundle Configuration**, plus Webhook, permission listings, Release Notes and Applet Log. Personalisation: per-user **Default Selection**.

### Common controls

Every report opens with **Advanced Search**: location (multi-select; non-administrators must pick at least one location they may read), item code keyword (three characters or more), item code range, item type, item status, item category levels, date range, and location labels. Each report adds its own options — *Hide Voided Documents* and *Include SN Adjustment* on the Movement report, *Show Zero Balance* and *Show Serial Numbers* on Historical Stock Balance, *Show Zero Balance* on Stock Balance, *Hide Zero Quantity* on Stock Balance With Serial.

### Stock Movement Report

{{< figure src="/images/stock-report-applet/stock-movement-report.png" alt="Stock Movement Report" caption="Every stock ledger line grouped by item code, with running balance." >}}

Columns: Txn Date, Created Date, Location, Doc Short Code, Doc No, Ref No, Entity, Ext Invoice Date, Serial, Remarks, Unit Price, Unit Cost, Qty In, Qty Out, Balance Qty, Amount (std / disc / net / tax / txn) and Total Inventory Value. For stock transfers the report shows both locations of the pair. The source is the stock ledger, so a serial number changed by a serial adjustment appears as its own `SN_ADJ` row (included with *Include SN Adjustment*), and voided documents can be dropped with *Hide Voided Documents* (`posting_status = VOID`).

### Stock Aging Report

{{< figure src="/images/stock-report-applet/stock-aging-report.png" alt="Stock Aging Report" caption="Remaining quantity and MA value by age bucket." >}}

Columns: Company, Location, Item, Inventory Item Code, EAN, Type, Sub Type, UOM, Aging, Qty, Amount, plus one bucket column per period. Age is measured from the ledger line's transaction date within the searched range; the bucket size is **Aging Period Settings** (month, the default, or day).

{{< figure src="/images/stock-report-applet/aging-period-configuration.png" alt="Aging Period Settings" caption="Aging Period Settings: month or day buckets." >}}

### Stock Summary Report By Location

{{< figure src="/images/stock-report-applet/stock-summary-report-by-location.png" alt="Stock Summary Report by Location" caption="Opening to closing per item and location." >}}

Per item and location: Open Balance, Purchase, Sold, Adj, Others, Stock In Transit, Last Purchase Date, Closing Balance, Closing Balance (include non-movement) and Closing Inventory Value. The backend classifies ledger lines by document type: **Purchase** = purchase invoice, purchase GRN (stock-in), purchase return; **Sold** = sales invoice, cash bill, sales return; **Adj** = stock adjustment; **Others** = everything else (transfers, consignment, RTV…); **Stock In Transit** = outbound stock transfer queue quantity still open plus draft inbound transfer lines. Closing = opening + purchase + sold + adj; the *include non-movement* column adds Others.

### Historical Stock Balance

{{< figure src="/images/stock-report-applet/historical-stock-balance.png" alt="Historical Stock Balance" caption="Balance as at a date, with historical and current MA cost." >}}

Columns: Item, Type, Sub Type, UOM, Qty (as at date), Historical MA cost and value, Current MA cost and value, Serial Numbers (optional). Quantity sums every non-deleted ledger line dated before the balance date; the historical MA cost is taken from the last purchase-and-sales or Reset MA ledger line before that date. Trade-in stock is not included (open request).

### Stock Sales And Purchase By Item Code

{{< figure src="/images/stock-report-applet/stock-sales-and-purchase-by-item-code.png" alt="Stock Sales and Purchase by Item Code" caption="Sales against purchases per item, with GP." >}}

Columns: Item, Description, Location, Balance Qty, Purchase Qty / Amount, Qty Sold, Sales Amount, Cost, GP, Last Purchase, Stock Turn Ratio. Purchases are purchase invoice, GRN (stock-in) and purchase return lines; sales are sales invoice, cash bill and sales return lines, within the date range. GP = Sales Amount − Cost; the GP columns are gated (see Configuration).

### Stock Value By Level Report

{{< figure src="/images/stock-report-applet/stock-value-by-level-report.png" alt="Stock Value by Level" caption="Quantity and value pivoted by category level and location." >}}

Groups stock by category levels 1–10 (level 0 is also supported) with a Qty and Amount pair per location and totals.

### Batch and Expiry Date Report

{{< figure src="/images/stock-report-applet/batch-and-expiry-date-report.png" alt="Batch and Expiry Date Report" caption="Batch quantities in expiry buckets." >}}

Columns: Item, Expiry Date, Qty, Amount and buckets 0 Month, 1 Month, 2 Months, 3 Months, 4–6 Months, 7–12 Months, 13–24 Months, >24 Months, relative to today.

### Stock Balance Report

{{< figure src="/images/stock-report-applet/stock-balance-report.png" alt="Stock Balance Report" caption="Current balance with MA and last cost." >}}

Columns: Company, Item, Type, Sub Type, UOM, Balance Qty, Unit Cost (MA), Total Cost, Unit Last Cost, Total Last Cost, category levels. *Show Zero Balance* includes items with no stock.

### Stock Balance Pricing Report

{{< figure src="/images/stock-report-applet/stock-balance-pricing-report.png" alt="Stock Balance Pricing Report" caption="Balance with price-book prices and tax codes." >}}

Adds the item's Pricing Scheme, Sales / Purchase Unit Price, Sales Min / Max, Ref Price 1–3, Delta Price 1–3, Rebate Price 1–3, Replacement Price, Input / Output tax code, rate and type, and Unit / Total Cost. Which pricing schemes are included is set by `PRICING_SCHEMES` in Application Settings.

### Stock Balance Report With Serial, by Supplier with Serial, and by Item / Supplier / Batch

{{< figure src="/images/stock-report-applet/stock-balance-report-with-serial.png" alt="Stock Balance Report With Serial" caption="Balance per location with serial numbers." >}}

**With Serial**: Location, Item, EAN, UOM, Qty, Serial Numbers, Add, Subtract, Stock Count — a count sheet with serials. **By Supplier with Serial**: Doc Short Code, Doc No, Txn Date, Supplier, Item, Serial Numbers, Balance Qty, Unit / Total Cost — each unit traced to the purchase document that brought it in. **By Item, Supplier and Batch Expiry**: Entity, Item, Batch Number, Qty, MA Price, MA Amount.

{{< figure src="/images/stock-report-applet/stock-balance-report-by-supplier-with-serial.png" alt="Stock Balance Report by Supplier with Serial" caption="Stock traced to the supplier and purchase document." >}}

{{< figure src="/images/stock-report-applet/stock-balance-by-item-supplier-and-batch-expiry-report.png" alt="Stock Balance by Item, Supplier and Batch Expiry" caption="Item, supplier and batch cross-reference." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Report read permissions | Applet permission assignment | Each report calls its own API permission (`API_TNT_DM_ERP_STOCK_REPORT_READ`, `…STOCK_AGING_REPORT_READ`, `…STOCK_SUMMARY_REPORT_BY_LOCATION_READ`, `…STOCK_SALES_PURCHASE_BY_ITEM_CODE_READ`, `…STOCK_VALUE_BY_LEVEL_READ`, `…BATCH_AND_EXPIRY_DATE_READ`, `…STOCK_BALANCE_REPORT_READ`, `…STOCK_BALANCE_REPORT_BY_BATCH_NUMBER_READ`, `…STOCK_BALANCE_WITH_SERIAL_NUMBERS_READ`), targetable to locations and branches |
| Location read permissions | Applet permission assignment | Non-administrators see only locations they may read and must select at least one |
| Items with categories, EAN, type / sub-type | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Category filters and grouping |
| Pricing schemes | [Pricebook](/applets/master-data/pricebook-applet/) | Stock Balance Pricing Report |
| Batch / serial tracking on items | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Batch expiry and serial reports are empty otherwise |

No GL codes, numbering or document settings are needed; the applet writes nothing.

### Applet settings

**Settings > Application Settings** is the applet's own screen with three tabs; the shared platform field-configuration template has no entries for this applet.

| Tab | Setting | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Sidebar Menu | `HIDE_<REPORT>_MENU` — one per report, e.g. `HIDE_STOCK_MOVEMENT_REPORT_MENU`, `HIDE_STOCK_AGING_REPORT_MENU`, `HIDE_HISTORICAL_STOCK_BALANCE_MENU`, `HIDE_STOCK_BALANCE_REPORT_NEW_MENU`, `HIDE_STOCK_BALANCE_REPORT_MENU` (Pricing), `HIDE_STOCK_BALANCE_REPORT_WITH_SERIAL_MENU` … (key = route in upper case) | Removes the report from the sidebar | off | Hidden unless the user holds the matching `SHOW_<REPORT>_MENU` permission |
| Stock Report Listing | `HIDE_MA_COST` | Unit Cost / Total Cost / MA value columns on every report | off | Reopened per user by `SHOW_MA_COST` |
| Stock Report Listing | `HIDE_GP`, `HIDE_GP_PERCENTAGE` | Gross profit and GP % columns (Movement, Summary by Location, Sales and Purchase) | off | Reopened by `SHOW_GP` / `SHOW_GP_PERCENTAGE` if granted (not seeded in the registry) |
| Stock Report Listing | `ADVANCED_SEARCH_SHOW_COST_MA`, `…COST_WA`, `…COST_FIFO`, `…COST_LIFO`, `…COST_REPLACEMENT`, `…COST_MANUAL`, `…REF_PRICE1–3`, `…DELTA_PRICE1–3`, `…REBATE_PRICE1–3`, `…SALES_MIN_PRICE`, `…SALES_MAX_PRICE`, `…PURCHASE_MIN_PRICE`, `…PURCHASE_MAX_PRICE`, `…REPORT_UNIT_REPLACEMENT_COST`, `…REPORT_UNIT_MANUAL_COST`, `…REPORT_UNIT_COMMISSION`, `…REPORT_UNIT_REBATE` | Which cost / price bases can be chosen in Advanced Search and appear as columns | off | Each pairs with a `SHOW_ADVANCED_SEARCH_<BASIS>` permission |
| Stock Report Listing | `AGING_PERIOD_TYPE` | Month (default) or day buckets on the Aging report | Month | — |
| Stock Report Listing | `PRICING_SCHEMES` | Pricing schemes listed on the Stock Balance Pricing Report | none | — |
| Item Category Group | Category groups 0–20 | Which item category levels are offered as filters, each with its label list and a visibility toggle | — | — |

**Settings > Default Selection** — `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_LANGUAGE_CODE` pre-fill the search panel; personal Default Selection overrides them. **Settings > Aging Period Settings** — the same month / day choice as `AGING_PERIOD_TYPE`. **Settings > Custom Resource Bundle Configuration** — relabel menu names and column headers.

The Stock Balance Pricing Report has its own column keys `HIDE_LISTING_SALES_PRICE`, `HIDE_LISTING_PURCHASE_PRICE`, `HIDE_LISTING_SALES_MIN_PRICE`, `HIDE_LISTING_SALES_MAX_PRICE`, `HIDE_LISTING_REF_PRICE_1–3`, `HIDE_LISTING_DELTA_PRICE_1–3`, `HIDE_LISTING_REBATE_PRICE_1–3`, `HIDE_LISTING_REPLACEMENT_PRICE`, read from the same settings record; they are not on the settings screen and their `SHOW_LISTING_*` counterparts are not registered.

`INCLUDE_*` / `ENABLE_*` dimension and tax keys and `PRINTABLE` are declared in the settings model but unused.

### Document behaviour settings

Not applicable — the applet has no documents, statuses or printables.

### Feature visibility / permissions

Registered client-side permissions for `stockReport` (all `ACTIVE`):

| Permission | Unlocks |
|---|---|
| `SHOW_STOCK_MOVEMENT_REPORT_MENU`, `SHOW_STOCK_AGING_REPORT_MENU`, `SHOW_STOCK_SUMMARY_REPORT_BY_LOCATION_MENU`, `SHOW_HISTORICAL_STOCK_BALANCE_MENU`, `SHOW_STOCK_SALES_PURCHASE_BY_ITEM_CODE_MENU`, `SHOW_STOCK_VALUE_BY_LEVEL_MENU`, `SHOW_BATCH_EXPIRY_DATE_MENU`, `SHOW_STOCK_BALANCE_REPORT_NEW_MENU`, `SHOW_STOCK_BALANCE_SUPPLIER_SERIAL_BATCH_MENU`, `SHOW_STOCK_BALANCE_REPORT_MENU`, `SHOW_STOCK_BALANCE_REPORT_WITH_SERIAL_MENU`, `SHOW_STOCK_BALANCE_REPORT_SUPPLIER_SERIAL_MENU`, `SHOW_ITEM_PRICE_CHANGE_MENU` | The report when its menu is hidden tenant-wide |
| `SHOW_MA_COST`, `SHOW_UNIT_COST`, `SHOW_TOTAL_COST` | Cost columns when `HIDE_MA_COST` is on |
| `SHOW_OPEN_INVENTORY_VALUE`, `SHOW_CLOSING_INVENTORY_VALUE`, `SHOW_OPEN_BALANCE_VALUE`, `SHOW_CLOSING_BALANCE_VALUE` | Value columns on Summary by Location (their `HIDE_*` toggles are commented out of the settings screen) |
| `SHOW_ADVANCED_SEARCH_COST_MA` … `SHOW_ADVANCED_SEARCH_REPORT_UNIT_REBATE` (23) | The matching cost / price basis in Advanced Search |
| `SHOW_STOCK_MOVEMENT_REPORT`, `SHOW_STOCK_AGING_REPORT`, `SHOW_STOCK_BALANCE_REPORT`, `SHOW_HISTORICAL_STOCK_BALANCE`, `SHOW_STOCK_SUMMARY_REPORT_BY_LOCATION`, `SHOW_STOCK_SALES_AND_PURCHASE_BY_ITEM_CODE`, `SHOW_STOCK_VALUE_BY_LEVEL_REPORT`, `SHOW_BATCH_AND_EXPIRY_DATE_REPORT`, `SHOW_STOCK_BALANCE_REPORT_WITH_SERIAL`, `SHOW_STOCK_BALANCE_BY_ITEM_SUPPLIER_BATCH_EXPIRY_REPORT`, `SHOW_ITEM_PRICE_CHANGE_REPORT` | Legacy per-report codes kept for older permission sets |

Cost and profit visibility is therefore two-layered: the tenant hides with `HIDE_MA_COST` / `HIDE_GP`, and finance users get the columns back through `SHOW_MA_COST` (and `SHOW_GP` where seeded). Server-side, each report's data call is refused without the corresponding `API_TNT_DM_ERP_*_READ` permission.

## Fields

The applet has no create or edit forms. The search panel fields are listed under *Common controls*; the per-report column sets are listed with each report above.

## Lifecycle and posting

Not applicable — read-only reports. Values are computed at run time from the stock ledger; the Stock Balance reports show the position at the moment they are run, the Historical and Summary reports the position at the chosen dates.

## Related applets

- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — the live per-location figures; use them to confirm a balance this report questions.
- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — open transfer queue quantity is the *Stock In Transit* column.
- [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) — adjustments are the *Adj* column; serial adjustments appear as `SN_ADJ` movement rows; Reset MA appears as `RSTMVA`.
- [Stock Take](/applets/inventory-workflow/stock-take-applet/) — the Stock Balance With Serial report doubles as a count sheet.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — item type, sub-type, categories.
- [Pricebook](/applets/master-data/pricebook-applet/) — pricing schemes on the Pricing report.
- [Financial Report](/applets/finance/financial-report-applet/) — closing stock in the ledger.
- [Organisation](/applets/master-data/organisation-applet/) — locations and labels.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| "Please select at least one location" | Non-administrator with no location chosen, or no location read permission | Select a location; grant location read permissions |
| Search returns nothing | Keyword shorter than three characters, or filters too narrow | Use three or more characters; widen date range and location |
| Cost, value or GP columns missing | `HIDE_MA_COST` / `HIDE_GP` on and the user lacks `SHOW_MA_COST` / `SHOW_GP` | Grant the permission or turn the setting off |
| A cost basis is missing from Advanced Search | `ADVANCED_SEARCH_SHOW_<BASIS>` off and no `SHOW_ADVANCED_SEARCH_<BASIS>` permission | Enable it in Application Settings > Stock Report Listing |
| Report missing from the sidebar | `HIDE_<REPORT>_MENU` set | Grant `SHOW_<REPORT>_MENU` or clear the setting |
| Historical Stock Balance closing differs from Summary by Location closing | Different bases: Historical sums all ledger lines before the date; Summary classifies by document type and excludes *Others* unless the include-non-movement column is used; in-transit quantity sits in neither location | Compare the *Closing Balance (include non-movement)* column; check the Stock In Transit column |
| Corrected serial number shows in Stock Balance With Serial but the Movement report still shows the old one | Fixed in 2026 — the movement query now includes `SN_ADJ` rows | Update the backend; tick *Include SN Adjustment* |
| Trade-in stock missing from Historical Stock Balance | Trade-in (non-stock trade-in) stock is not yet included | Open enhancement; use the Non-Stock and Trade-In applet's own listing |
| Aging report shows negative quantities or wrong amounts | Fixed in 2026 (returns and adjustments were mis-signed) | Update the backend |
| Wrong amount for foreign-currency documents on the Movement report | Fixed in 2026 — transaction currency amount was shown instead of the company amount | Update the backend |
| Grid filter not reset after a new search | Known grid behaviour | Clear the column filter before searching again |

## Related documentation

- [Inventory module](/modules-v2/inventory/) — [reports](/modules-v2/inventory/reports/), [core concepts](/modules-v2/inventory/core-concepts/).
- [Inventory guides](/guides/inventory-guides/).
