---
title: "Stock Availability"
description: "Reference for the Stock Availability applet — physical, committed and available quantity by company, location and bin, with document drill-down, stock aging, serial and batch tracing and stock card planning."
applet_code: "stockAvailability"
applet_repo: "blg-applet-wavelet-stock-availability-applet"
modules: [inventory, purchasing, pos]
related_applets: [stock-balance-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, stock-reservation-applet, stock-take-applet, stock-adjustment-applet, warehouse-management-applet, internal-sales-order-applet, internal-purchase-order-applet, internal-purchase-grn-applet, organisation-applet]
guides: []
sources:
  - blg-applet-wavelet-stock-availability-applet/micro-fe/projects/wavelet-erp/applets/stock-availability-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-stock-availability-applet/micro-fe/projects/wavelet-erp/applets/stock-availability-applet/src/app/components/settings-container/application-settings/application-settings.component.ts
  - blg-applet-wavelet-stock-availability-applet/micro-fe/projects/wavelet-erp/applets/stock-availability-applet/src/app/components/settings-container/application-settings/application-settings.component.html
  - blg-applet-wavelet-stock-availability-applet/micro-fe/projects/wavelet-erp/applets/stock-availability-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-stock-availability-applet/micro-fe/projects/wavelet-erp/applets/stock-availability-applet/src/app/components/stock-availability-container/stock-availability-listing/stock-availability-listing.component.ts
  - blg-applet-wavelet-stock-availability-applet/micro-fe/projects/wavelet-erp/applets/stock-availability-applet/src/app/models/advanced-search-models/stock-availability-details-search.model.ts
  - blg-applet-wavelet-stock-availability-applet/micro-fe/projects/wavelet-erp/applets/stock-availability-applet/src/app/components/stock-card-planning-container/
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockAvailabilityService.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet stockAvailability)
tags:
- inventory-management
- stock-tracking
- supply-chain
- warehouse-operations
- serial-tracing
---

## Overview

The Stock Availability applet is the read-only window onto inventory: what you physically hold, what open documents have already claimed or promised, and therefore what you can still sell — by company, location and bin, down to individual serial and batch numbers. It sits on top of the stock ledger written by purchasing, sales, transfers, adjustments and stock takes; nothing is created here.

Sales staff open it before promising stock, warehouse staff to find where an item sits, purchasing to see what is on order, and finance for stock aging and valuation columns (which can be hidden from everyone else).

{{< figure src="/images/stock-availability-applet/stock-availability-infographic.jpg" alt="Mastering Real-Time Inventory: The Stock Availability Applet - showing the Master Formula (A = P - R), Strategic Visibility, End-to-End Audit Trails, and a Role-Specific Quick Reference Guide" caption="Stock Availability at a glance: physical balance, document adjustments, bin-level precision, aging and role-specific visibility." >}}

### How availability is calculated

| Column | Meaning |
|---|---|
| **Stock Balance** (physical) | The ledger quantity at that company / location, from finalised stock documents |
| **Adj Qty** | The signed sum of quantities on *open* documents that affect the item: sales orders and outbound delivery orders reduce it, purchase orders, goods received notes and stock-in drafts add to it. Each document type carries its own sign |
| **Available Qty** | `Stock Balance + Adj Qty` — what a new order can still take |
| **Min / Max level** | The item's minimum and maximum stock levels for the location, used for the warning colour and by replenishment |

The Details screen shows the documents behind Adj Qty per type (Sales Order, Purchase Order, GRN, GRN draft, GRN stock-in draft, Delivery Order, Sales Invoice draft, Sales Quotation), so "50 physical but 0 available" is always traceable to specific documents.

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | The ledger balances this applet reads |
| Upstream | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Item master, category groups, pricing schemes and prices shown as columns |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies, branches, locations and bins |
| Upstream | [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/) and other stock documents | Open documents that make up Adj Qty and appear in Details |
| Sibling | [Stock Reservation](/applets/inventory-workflow/stock-reservation-applet/) | Reserved and locked quantities shown on Stock Card & Planning |
| Sibling | [Stock Take](/applets/inventory-workflow/stock-take-applet/), [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) | Correct the balance this applet displays |
| Sibling | [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) | Bins shown in Bin Availability |

Modules: Inventory, Purchasing, POS.

## Screens and menus

| Menu | What it shows |
|---|---|
| **Stock Availability** | Item × company × location grid: stock balance, adj qty, available qty, costs (average, last purchase, FIFO, LIFO), prices per pricing scheme, category columns |
| **Stock Availability Details** | One item at a time with the documents behind each quantity, per location |
| **Stock Aging Report** | Balance grouped by age bucket |
| **Stock Availability with SO and PO** | Only the sales-order and purchase-order commitments |
| **Trace Serial No** | Movement history of one serial number |
| **Serial Number Balance** | Serial numbers currently in stock, by location |
| **Trace Batch No** | Movement history of one batch number |
| **Bin Availability** | Quantity per bin, with bin code and name |
| **Stock Card & Planning** | Per item: total, reserved (and by whom), locked, packed, ad-hoc and available quantity with bin, UOM, job order and completion date |
| **Audit Trail** | Change history |

Gear (Settings) menu: **Application Settings**, **Default Selection**. Personalisation: per-user **Default Selection**.

### Stock Availability listing

{{< figure src="/images/stock-availability-applet/stock-availability-listing.png" alt="Stock Availability Listing showing company-wide inventory levels with branch filters and color-coded status indicators." caption="Stock Availability listing: total physical and available stock across locations." >}}

Filter by company, branch, location, item, category group and pricing scheme; the same item can be seen company-wide or per location. Rows below the item's minimum level are highlighted. Every column has a tenant-wide hide switch and a matching permission (see Configuration).

### Stock Availability Details

{{< figure src="/images/stock-availability-applet/stock-availability-details.png" alt="Stock Availability Details view highlighting reserved quantities and pending transactions." caption="Stock Availability Details: the documents (Sales Orders, Purchase Orders, GRNs) behind the available quantity." >}}

The advanced search has an **Optional** multi-select that, by default, hides zero balances and the document-balance sections — `HIDE_ZERO_BALANCE`, `HIDE_GOODS_RECEIVE_NOTE_BALANCE`, `HIDE_PURCHASE_ORDER_BALANCE`, `HIDE_SALES_ORDER_BALANCE`, `HIDE_DELIVERY_ORDER_BALANCE`, `HIDE_SALES_INVOICE_DRAFT_BALANCE`, `HIDE_GOODS_RECEIVE_NOTE_DRAFT_BALANCE`, `HIDE_GRN_STOCK_IN_DRAFT_BALANCE`. Untick one to open that section; `SHOW_MIN_QTY`, `SHOW_MAX_QTY` and `SHOW_OTHER_IMAGES_1..3 / _ALL` add the level columns and item images. Each document tab (GRN, PO, SO, DO, Sales Invoice draft, GRN draft, Sales Quotation) can also be hidden tenant-wide.

### Stock Aging Report

{{< figure src="/images/stock-availability-applet/stock-aging-report.png" alt="Stock Aging Report showing inventory grouped by time periods." caption="Stock Aging Report: balance by age bucket, to find stock to clear before it is obsolete." >}}

### Stock Availability with SO and PO

{{< figure src="/images/stock-availability-applet/stock-availability-with-so-po.png" alt="Stock Availability with SO and PO view showing specific document links and outstanding quantities." caption="SO and PO tracking: stock committed to, or expected from, open orders." >}}

### Trace Serial No, Serial Number Balance, Trace Batch No

{{< figure src="/images/stock-availability-applet/trace-serial-no.png" alt="Trace Serial Number view showing the full stock movement history of a specific serial number." caption="Trace Serial No: every document a serial number has passed through." >}}
{{< figure src="/images/stock-availability-applet/serial-number-balance.png" alt="Serial Number Balance view showing quantities and specific serial numbers currently in stock." caption="Serial Number Balance: which serial numbers are in which location now." >}}
{{< figure src="/images/stock-availability-applet/trace-batch-no.png" alt="Trace Batch Number view showing movement history for batch-tracked items." caption="Trace Batch No: movements of one batch, for expiry and recall handling." >}}

Search by exact serial or batch number, keyword or date range. Sales invoice lines are shown as negative quantities so the running balance reads correctly. Use serial tracing forwards (which customer received this unit) and backwards (which GRN and supplier it came from, for a warranty claim); use batch tracing to find every customer who received a recalled batch.

### Bin Availability

{{< figure src="/images/stock-availability-applet/bin-availability.png" alt="Bin Availability Report showing item locations and quantities across different bins." caption="Bin Availability: quantity per bin, for picking." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Items with an inventory record | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) / [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Only stock-tracked items have balances; category columns need category groups bound to slots |
| Companies, branches, locations, bins | [Organisation](/applets/master-data/organisation-applet/), [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) | The dimensions of every screen |
| Pricing schemes | Doc Item Maintenance > Pricing Schemes | The `PRICING_SCHEMES` setting picks which schemes become price columns |
| Finalised stock documents | GRN, sales, transfers, adjustments, stock take | Without them every balance is zero |
| Permissions | Applet permission assignment | Cost and price columns are hidden by setting and re-enabled per user by permission |

### Applet settings

**Settings > Application Settings** — one tenant-wide form. Every hide switch has a matching `SHOW_*` permission that overrides it for the holder.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_<MENU>_MENU` (one per left-menu entry: Stock Availability, Stock Availability Details, Stock Aging Report, Stock Availability with SO and PO, Trace Serial No, Serial Number Balance, Trace Batch No, Bin Availability) | Menu visibility | off | Hidden for everyone without the `SHOW_*_MENU` permission |
| `PRICING_SCHEMES` | Which pricing schemes appear as price columns in the listing | none | One column per selected scheme |
| `PRICE_METRICS` | Which price value (selling, purchase, max, min…) fills those columns | — | Single selection; applies to all scheme columns at once |
| `HIDE_LISTING_AVG_COST`, `HIDE_LISTING_LAST_PURCHASE_COST`, `HIDE_LISTING_FIFO_COST`, `HIDE_LISTING_LIFO_COST`, `HIDE_LISTING_PURCHASE_PRICE`, `HIDE_LISTING_REPLACEMENT_PRICE` | Cost and purchase-price columns | off | Hide valuation from non-finance users |
| `HIDE_LISTING_SALES_PRICE`, `HIDE_LISTING_SALES_MAX_PRICE`, `HIDE_LISTING_SALES_MIN_PRICE`, `HIDE_LISTING_REF_PRICE_1..3`, `HIDE_LISTING_DELTA_PRICE_1..3`, `HIDE_LISTING_REBATE_PRICE_1..3` | Selling-price and reference-price columns | off | — |
| `HIDE_LISTING_COMPANY`, `HIDE_LISTING_LOCATION`, `HIDE_LISTING_STOCK_BALANCE`, `HIDE_LISTING_ADJ_QTY`, `HIDE_LISTING_AVAILABLE_QTY` | Structural and quantity columns | off | — |
| `ITEM_CATEGORY_GROUP_0..19`, `HIDE_ITEM_CATEGORY_GROUP_n` | Which category group feeds each category column, and whether it shows | empty | Category columns mirror the item master's slots |
| `ENABLE_FILTER_BY_TODAYS_TXN` | Adds a filter for today's transactions | off | — |
| `INCREASE_ITEM_IMAGE_SIZE` | Larger thumbnails | off | Presentation |
| `HIDE_STOCK_MOVEMENT`, `HIDE_PURCHASE_DOCUMENTS_IN_STOCK_MOVEMENT`, `HIDE_PURCHASE_DOCUMENTS`, `HIDE_INTERNAL_STOCK_ADJUSTMENT` | Stock-movement pop-up and which document families it lists | off | Hide supplier-side documents from sales users |
| `HIDE_GOODS_RECEIVED_NOTE_TAB`, `HIDE_PURCHASE_ORDER_TAB`, `HIDE_SALES_ORDER_TAB`, `HIDE_DELIVERY_ORDER_TAB`, `HIDE_SALES_QUOTATION_TAB`, `HIDE_SALES_INVOICE_TAB`, `HIDE_GRN_DRAFT_TAB`, `HIDE_GRN_STOCK_IN_DRAFT_TAB` | Document tabs on the Details screen | off | — |
| `HIDE_PURCHASE_GRN_PURCHASE_PRICE`, `HIDE_PURCHASE_GRN_SUPPLIER_NAME` | Columns on the GRN tab | off | Hide supplier pricing from sales |
| `HIDE_UNIT_COST_AMOUNT`, `HIDE_DOC_POPUP_COST_AMOUNT`, `HIDE_DOC_POPUP_GP`, `HIDE_TOOLTIP_PRICING_DETAILS` | Cost, gross profit and pricing tooltip in document pop-ups | off | — |
| `HIDE_REPORT_DOC_SHORT_CODE`, `HIDE_REPORT_UNIT_PRICE`, `HIDE_REPORT_UNIT_COST`, `HIDE_REPORT_INVENTORY_VALUE`, `HIDE_REPORT_AMOUNT_STD`, `HIDE_REPORT_AMOUNT_DISC`, `HIDE_REPORT_AMOUNT_NET`, `HIDE_REPORT_AMOUNT_TAX`, `HIDE_REPORT_AMOUNT_TXN` | Columns on the trace / aging reports | off | — |

The Listing and Details screens have separate setting lists; a switch under one does not affect the other (they are stored in the same settings record but do not overlap).

**Settings > Default Selection** and **Personalisation > Default Selection** — `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_TOGGLE_COLUMN` (`SINGLE` or `DOUBLE` column form layout), tenant-wide and per user.

### Document behaviour settings

Not applicable — the applet creates no documents.

### Feature visibility / permissions

Client-side permissions registered for `stockAvailability` (each overrides the matching `HIDE_*` setting for its holder):

| Permission group | Codes |
|---|---|
| Menus | `SHOW_STOCK_AVAILABILITY_MENU`, `SHOW_STOCK_AVAILABILITY_DETAILS_MENU`, `SHOW_STOCK_AGING_REPORT_MENU`, `SHOW_STOCK_AVAILABILITY_SO_PO_MENU`, `SHOW_TRACE_SERIAL_NO_LISTING_MENU`, `SHOW_SERIAL_NUMBER_BALANCE_MENU`, `SHOW_TRACE_BATCH_NO_LISTING_MENU`, `SHOW_BIN_AVAILABILITY_MENU` |
| Listing columns | `SHOW_LISTING_AVG_COST`, `SHOW_LISTING_LAST_PURCHASE_COST`, `SHOW_LISTING_FIFO_COST`, `SHOW_LISTING_LIFO_COST`, `SHOW_LISTING_PURCHASE_PRICE`, `SHOW_LISTING_REPLACEMENT_PRICE`, `SHOW_LISTING_SALES_PRICE`, `SHOW_LISTING_SALES_MAX_PRICE`, `SHOW_LISTING_SALES_MIN_PRICE`, `SHOW_LISTING_REF_PRICE_1..3`, `SHOW_LISTING_DELTA_PRICE_1..3`, `SHOW_LISTING_REBATE_PRICE_1..3`, `SHOW_LISTING_COMPANY`, `SHOW_LISTING_LOCATION`, `SHOW_LISTING_STOCK_BALANCE`, `SHOW_LISTING_ADJ_QTY`, `SHOW_LISTING_AVAILABLE_QTY` |
| Costs and margins | `SHOW_AVG_COST`, `SHOW_LAST_PURCHASE_COST`, `SHOW_UNIT_COST_AMOUNT`, `SHOW_DOC_POPUP_COST_AMOUNT`, `SHOW_DOC_POPUP_GP`, `SHOW_TOOLTIP_PRICING_DETAILS` |
| Documents | `SHOW_PURCHASE_DOCUMENTS`, `SHOW_PURCHASE_DOCUMENTS_IN_STOCK_MOVEMENT`, `SHOW_INTERNAL_STOCK_ADJUSTMENT`, `SHOW_STOCK_MOVEMENT` |
| Reports | `SHOW_REPORT_DOC_SHORT_CODE`, `SHOW_REPORT_UNIT_PRICE`, `SHOW_REPORT_UNIT_COST`, `SHOW_REPORT_AMOUNT_STD`, `SHOW_REPORT_AMOUNT_DISC`, `SHOW_REPORT_AMOUNT_NET`, `SHOW_REPORT_AMOUNT_TAX`, `SHOW_REPORT_AMOUNT_TXN` |

Typical pattern: hide every cost column tenant-wide and grant `SHOW_LISTING_AVG_COST` / `SHOW_AVG_COST` to the finance role only.

## Fields

The applet has no create or edit forms. Listing columns:

| Column | Meaning |
|---|---|
| Item Code, Item Name, EAN Code, Type, Sub Type, UOM / Base UOM | From the item master |
| Company, Location, Bin Code / Bin Name | Where the balance sits |
| Stock Balance, Adj Qty, Available Qty | See *How availability is calculated* |
| Qty, Base Qty, Container Qty / Ctn Qty, Container Measure | Quantity in the item's UOM and base UOM, and per container for batch / bin items |
| Serial Number, Batch No., Expiry Date | For serialised and batch-tracked items |
| Company Avg Cost, Location Avg Cost, Last Purchase Cost, FIFO Cost, LIFO Cost, Amount | Valuation columns |
| Sales Unit Price and one column per selected pricing scheme | Prices, valued by `PRICE_METRICS` |
| Category Group, Category Code, Category Name, Level | Category slots |
| NSTI Code / Name | Non-stock trade-in items |
| Created / Modified / Updated Date | Audit |

Stock Card & Planning columns: Total Qty, Reserved Qty, Reserved By, Locked Qty, Packed Qty, Ad Hoc Qty, Available Qty, Bin Code, UOM, Job Order, Completion Date, Status.

## Lifecycle and posting

Not applicable — read-only. Balances change only when stock documents are finalised elsewhere; the listing recomputes Available Qty on every load from the ledger balance and the open documents returned by the backend.

## Related applets

- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) — the ledger this applet summarises.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) and [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — item master, categories, pricing schemes; the item's own Stock Availability and Stock Card tabs show the same data for one item.
- [Stock Reservation](/applets/inventory-workflow/stock-reservation-applet/) — reserved and locked quantities on Stock Card & Planning.
- [Stock Take](/applets/inventory-workflow/stock-take-applet/) and [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) — fix a balance that disagrees with the shelf.
- [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) — bins.
- [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/) — the documents that make up Adj Qty.
- [Organisation](/applets/master-data/organisation-applet/) — companies, branches, locations.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Physical shows 50, Available shows 0 | Open sales orders (or delivery orders) have committed the stock | Open **Stock Availability Details**, untick `HIDE_SALES_ORDER_BALANCE` to see which orders |
| Item is out of stock but a colleague says it is on order | Incoming documents are hidden by default | Untick `HIDE_PURCHASE_ORDER_BALANCE` / `HIDE_GOODS_RECEIVE_NOTE_BALANCE` in the Optional filter |
| Cost columns missing for a user | Hidden by `HIDE_LISTING_*_COST` and the user lacks the `SHOW_*` permission | Grant the permission or clear the setting |
| Pricing scheme columns show the wrong price type | `PRICE_METRICS` selects one price value for every scheme column; it cannot mix types | Set the metric you need; different metrics side by side are not supported |
| Category filter returns different items here and in Doc Item Maintenance | The category column here is bound to a different category group (`ITEM_CATEGORY_GROUP_n`) than the item master's slot | Align the group bound to that slot in both applets |
| Average cost looks wrong in Stock Movement or reports | Costs are recomputed by the moving-average processor; a reset-MA run or an unposted document can leave the displayed value stale (a 2026 enhancement to surface reset-MA state in the UI is open) | Check the item's cost in Inventory Item Maintenance; re-run costing if your tenant uses reset MA |
| Clicking a document in the Sales Invoice draft section opens the wrong document | Defect in the draft section's drill-down, fixed in 2026 | Update the applet build |
| Serial trace shows negative quantities | Sales invoice lines are shown negative by design so the running balance is correct | No action |

## Related documentation

- [Inventory module](/modules-v2/inventory/) — [configuration](/modules-v2/inventory/configuration/), [reports](/modules-v2/inventory/reports/) and [use cases](/modules-v2/inventory/use-cases/).
