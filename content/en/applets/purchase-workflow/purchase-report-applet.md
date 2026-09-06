---
title: "Purchase Report"
description: "Reference for the Purchase Report applet: line-level and item-level analysis of finalised purchase invoices, purchase returns and no-stock-in invoices, its two reports, filters, every column-visibility switch, and known failure modes."
applet_code: "purchaseReport"
applet_repo: "blg-applet-wavelet-purchase-report-applet"
modules: [purchasing, inventory]
related_applets:
  - internal-purchase-invoice-applet
  - internal-purchase-invoice-no-stock-in-applet
  - internal-purchase-return-applet
  - internal-purchase-grn-applet
  - internal-purchase-order-applet
  - internal-payment-voucher-applet
  - internal-purchase-debit-note-applet
  - creditor-report-applet
  - stock-balance-applet
  - supplier-applet-1
  - organisation-applet
  - doc-item-maintenance-applet
  - inv-item-maintenance-applet
guides:
  - /guides/purchasing-guides/standard-procurement-workflow/
sources:
  - blg-applet-wavelet-purchase-report-applet/micro-fe/projects/wavelet-erp/applets/purchase-report-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-purchase-report-applet/micro-fe/projects/wavelet-erp/applets/purchase-report-applet/src/app/app.routing.ts
  - blg-applet-wavelet-purchase-report-applet/micro-fe/projects/wavelet-erp/applets/purchase-report-applet/src/app/app.component.ts
  - blg-applet-wavelet-purchase-report-applet/micro-fe/projects/wavelet-erp/applets/purchase-report-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-purchase-report-applet/micro-fe/projects/wavelet-erp/applets/purchase-report-applet/src/app/components/purchase-report-by-document-container/purchase-report-by-document/purchase-report-by-document.component.ts
  - blg-applet-wavelet-purchase-report-applet/micro-fe/projects/wavelet-erp/applets/purchase-report-applet/src/app/components/purchase-report-by-item-code-container/purchase-report-by-item-code/
  - blg-applet-wavelet-purchase-report-applet/micro-fe/projects/wavelet-erp/applets/purchase-report-applet/src/app/components/settings-container/
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/purchase/PurchaseReportUow.java
  - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/reports/purchase/PurchaseReportController.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code purchaseReport — no rows)
tags:
- purchase-report
- procurement
- accounts-payable
- supplier-performance
- financial-reporting
weight: 180
lastmod: 2026-09-05
---

## Overview

The **Purchase Report** applet answers "what did we buy, from whom, at what cost?" from the purchase documents that actually post: finalised **Purchase Invoices**, **Purchase Returns** and **Purchase Invoices (No Stock In)**. Accounts-payable staff, buyers and finance managers open it to see purchase lines with their linked GRN and purchase order numbers, or the same data rolled up per item with quantity, cost and closing stock balance, and to export either grid.

It is read-only. Purchase orders, GRNs and draft invoices do not appear in it — a purchase shows up only once its invoice (or return) is FINAL.

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules/purchasing/), [Inventory](/modules/inventory/) | Purchase analysis; stock balance per location is joined in. |
| Source documents | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | The only document types the queries read (`posting_status = FINAL`, base-currency shadows excluded). Returns carry a negative quantity signum and reduce the totals. |
| Linked references | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | The *GRN No* column comes from the invoice's document links to GRNs; *PO No* from the GRN's links to purchase orders. |
| Settlement | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) | The backend's purchase-report service also serves invoice settlement detail (payment vouchers and debit notes against an invoice) used by the payables reports. |
| Related reports | [Creditor Report](/applets/finance/creditor-report-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Supplier balances and stock positions. |

## Screens and menus

| Menu | Route | What it is | Hidden by |
|---|---|---|---|
| **Purchase Report** | `purchase-report-by-document` | One row per purchase line, grouped by document. | `HIDE_PURCHASE_REPORT_BY_DOCUMENT_MENU` unless `SHOW_PURCHASE_REPORT_BY_DOCUMENT_MENU` |
| **Purchase Report By Item Code** | `purchase-report-by-item-code` | One row per item (and branch / location / pricing scheme) with totals. | `HIDE_PURCHASE_REPORT_BY_ITEM_CODE_MENU` unless `SHOW_PURCHASE_REPORT_BY_ITEM_CODE_MENU` |
| **Settings** | `settings/…` | Application Settings, Default Selection; also Webhook, Client Side Permission, Permission Wizard / Set / User / Team / Role Permission, Release Notes. | — |
| **Personalization** | `personalization/…` | Personal Default Selection, Sidebar. | — |

### Purchase Report (by document)

{{< figure src="/images/purchase-report-applet/purchase-report-by-document.png" alt="Purchase Report By Document view showing a grid of purchase lines with supplier and item details" caption="Purchase Report: purchase lines from finalised invoices and returns, with linked GRN and PO numbers." >}}

**Advanced Search** (the shared general search panel; a period is mandatory): keyword (item code, name, description, scan code, alternate codes, remarks — at least three characters), **Period** (date from / to), **Date Type** (which header date the period applies to — transaction date by default, or finalised / created / updated / due date), **Supplier**, **Salesman** (the purchaser recorded on the document), **Item Type**, **Item Status**, **Item Code**, **Calculate Base On**, branch, company, location and up to twenty item-category groups. Each search field can be hidden with its `HIDE_SEARCH_*` key.

**Calculate Base On** picks which item price or cost is multiplied by quantity to fill *Unit Cost* / *Cost Amt* (and *Purchase Cost* on the item-code report): moving-average cost (`cost_ma`, the default), replacement cost, reference price 1–3, delta price 1–3, rebate price 1–3, sales minimum / maximum price or purchase minimum / maximum price. Only the options enabled by `ADVANCED_SEARCH_SHOW_<OPTION>` (or the matching `SHOW_ADVANCED_SEARCH_<OPTION>` permission) are offered.

**Columns:** Doc No, Date, Doc Type, Doc Reference Date, Ref. No, Company, Branch, Location, Supplier, Item Code, Item Name, Type, Sub Type, UOM, Serial #, Qty, Unit Price, Unit Cost, Cost Amt, Gross Amount, Amount Disc, Amount Net, Amount Tax, Amount Txn, GRN No, PO No, and the five external references (Quotation, Order, Delivery Order, Invoice, Others). Rows are grouped by document with group totals; the grid's status bar exports the current result to Excel/CSV; the column toggle lets each user show or hide columns.

### Purchase Report By Item Code

{{< figure src="/images/purchase-report-applet/purchase-report-by-item-code.png" alt="Purchase Report By Item Code view showing aggregated purchase totals grouped by item code" caption="Purchase Report By Item Code: quantity, amount, cost and stock balance per item." >}}

Same search panel. **Columns:** Item Code, Item Name, Type, UOM, Branch, Location, Category 1–20, Qty, Purchase Amount, Purchase Cost (per *Calculate Base On*), Stock Balance (the location's balance as at the end of the period). Rows are per item per branch, location and pricing scheme.

### Settings

{{< figure src="/images/purchase-report-applet/purchase-applet-settings.png" alt="Purchase Report Application Settings with tabs for the two reports and item category groups" caption="Application Settings: sidebar menus, report columns, search fields and item-category groups." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Finalised purchase invoices / returns | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | Only `FINAL` documents of the three types are read. |
| Document links GRN → invoice and PO → GRN | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | *GRN No* and *PO No* are empty for invoices keyed without knock-off. |
| Item master with categories and prices | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Category 1–20 columns and the *Calculate Base On* prices come from the item and its line snapshot. |
| Branches, locations, suppliers | [Organisation](/applets/master-data/organisation-applet/), [Supplier](/applets/master-data/supplier-applet-1/) | Filters and defaults. |
| Read permission on the source documents | *Permission Wizard / Set* | The grids are gated by the read permission on `INTERNAL_PURCHASE_INVOICE` and related types. |

### Applet settings

**Settings → Default Selection** (tenant-wide; *Personalization → Default Selection* overrides per user):

| Setting | What it controls | Default | Effect when changed | Who can change it |
|---|---|---|---|---|
| `DEFAULT_BRANCH` | Branch pre-selected in the search panel. | none | Reports open filtered to it. | Tenant admin with the Settings menu |
| `DEFAULT_LOCATION` | Location pre-selected in the search panel. | none | Same. | Same |

**Settings → Application Settings** — this applet keeps its own field-configuration screen (tabs *By Document*, *By Item Code*, *Item Category Group*, plus the sidebar toggles) and reads these keys; the shared screen's generic document toggles do not apply:

| Group | Keys | What they control |
|---|---|---|
| Sidebar | `HIDE_PURCHASE_REPORT_BY_DOCUMENT_MENU`, `HIDE_PURCHASE_REPORT_BY_ITEM_CODE_MENU` | Hide either report for everyone; a `SHOW_…_MENU` client-side permission reopens it per user. |
| By Document columns | `HIDE_DOC_NO`, `HIDE_DATE`, `HIDE_DOC_TYPE`, `HIDE_DOC_REFERENCE_DATE`, `HIDE_REF_NO`, `HIDE_COMPANY`, `HIDE_BRANCH`, `HIDE_LOCATION`, `HIDE_SUPPLIER`, `HIDE_ITEM_CODE`, `HIDE_ITEM_NAME`, `HIDE_TYPE`, `HIDE_SUB_TYPE`, `HIDE_UOM`, `HIDE_SERIAL_NUMBER`, `HIDE_QTY`, `HIDE_UNIT_PRICE`, `HIDE_MA_COST`, `HIDE_GROSS_AMOUNT`, `HIDE_AMOUNT_DISC`, `HIDE_AMOUNT_NET`, `HIDE_AMOUNT_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_GRN_NO`, `HIDE_PO_NO`, `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_OTHERS`, `HIDE_GL_CODE_TYPE` | Column visibility. `HIDE_MA_COST` hides *Unit Cost* / *Cost Amt* (the `SHOW_MA_COST` permission restores them); the external-reference columns have matching `SHOW_QUOTATION` … `SHOW_OTHERS` permissions. |
| By Item Code columns | `HIDE_ITEM_CODE`, `HIDE_ITEM_NAME`, `HIDE_TYPE`, `HIDE_UOM`, `HIDE_BRANCH`, `HIDE_LOCATION`, `HIDE_QTY`, `HIDE_PURCHASE_AMOUNT`, `HIDE_MA_COST`, `HIDE_STOCK_BALANCE` | Column visibility. |
| Item category groups | `HIDE_ITEM_CATEGORY_GROUP_1` … `HIDE_ITEM_CATEGORY_GROUP_20` | Hide a category column and its search filter. |
| Search fields | `HIDE_SEARCH_ITEM_CODE`, `HIDE_SEARCH_PERIOD`, `HIDE_SEARCH_DATE_TYPE`, `HIDE_SEARCH_SUPPLIER`, `HIDE_SEARCH_SALESMAN`, `HIDE_SEARCH_ITEM_TYPE`, `HIDE_SEARCH_ITEM_STATUS`, `HIDE_SEARCH_CALCULATE_BASE_ON`, `HIDE_SEARCH_OPTIONAL` | Remove fields from the Advanced Search panel (added 2026 with the inline configuration gear). |
| Calculate Base On | `ADVANCED_SEARCH_SHOW_COST_MA`, `ADVANCED_SEARCH_SHOW_COST_REPLACEMENT`, `ADVANCED_SEARCH_SHOW_REF_PRICE1..3`, `ADVANCED_SEARCH_SHOW_DELTA_PRICE1..3`, `ADVANCED_SEARCH_SHOW_REBATE_PRICE1..3`, `ADVANCED_SEARCH_SHOW_SALES_MIN_PRICE`, `ADVANCED_SEARCH_SHOW_SALES_MAX_PRICE`, `ADVANCED_SEARCH_SHOW_PURCHASE_MIN_PRICE`, `ADVANCED_SEARCH_SHOW_PURCHASE_MAX_PRICE` | Which cost bases are offered. |
| Layout | `ENABLE_INLINE_APPLET_CONFIG` | Shows the inline configuration gear on the search panel and grids. |

Keys declared in the settings model but not used by these screens (custom statuses, `ENABLE_SST` / `ENABLE_WHT`, dimension include flags, `PRINTABLE`) have no effect.

### Document behaviour settings

Not applicable — the applet creates no documents and has no printable formats; export is the grid's Excel/CSV export.

### Feature visibility / permissions

- Server-side: the grids pass the read-permission definition of the purchase document types; users without read access to purchase invoices see nothing.
- Client-side permissions checked in code: `SHOW_PURCHASE_REPORT_BY_DOCUMENT_MENU`, `SHOW_PURCHASE_REPORT_BY_ITEM_CODE_MENU`, `SHOW_MA_COST`, `SHOW_QUOTATION`, `SHOW_ORDER`, `SHOW_DELIVERY_ORDER`, `SHOW_INVOICE`, `SHOW_OTHERS`, and `SHOW_ADVANCED_SEARCH_<OPTION>` for each cost base. **None are seeded** in the registry for `purchaseReport` — create them under *Settings → Client Side Permission* before assigning.
- *Personalization → Sidebar* hides menus per user.

## Fields

The applet has no create or edit forms. The search fields and the columns of both grids are listed under *Screens and menus*; the only validations are **Please enter both Date From and Date To before searching** and **Search keyword must more than 2 characters**.

## Related applets

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — the documents reported.
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — sources of the GRN No and PO No columns.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — settlement documents the same backend service reports against invoices.
- [Creditor Report](/applets/finance/creditor-report-applet/) — supplier balances; [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) — the balance the *Stock Balance* column is taken from.
- [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — master data behind the filters and columns.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| *Please enter both Date From and Date To before searching* | The period is mandatory (message reworded in 2026). | Set both dates. |
| *Search keyword must more than 2 characters* | Keyword shorter than three characters. | Type at least three characters or clear the keyword. |
| A purchase order or GRN is missing from the report | Only FINAL purchase invoices, no-stock-in invoices and purchase returns are read. | Finalise the invoice; use the PO applet's *PO Line with GRN KO* report for ordered-versus-received. |
| Totals do not match the General Ledger | Different date type or period, draft invoices, or the report's base-currency shadows are excluded while the GL shows base amounts. | Use *Date Type* = finalised date and the same period; compare in document currency. |
| *GRN No* / *PO No* blank | The invoice was keyed directly (no GRN link) or the GRN was not knocked off from a PO. | Expected; check Doc Link on the invoice. |
| *Unit Cost* / *Cost Amt* show zero or an unexpected figure | *Calculate Base On* points at a price the item lines do not carry (e.g. rebate price 3). | Choose moving-average cost or a price the item has. |
| Cost columns missing for some users | `HIDE_MA_COST` on and the user lacks `SHOW_MA_COST`. | Grant the permission (create it first — it is not seeded). |
| A report menu is missing | `HIDE_PURCHASE_REPORT_BY_*_MENU` on, or hidden under Personalization → Sidebar. | Turn off the setting, grant the `SHOW_…_MENU` permission, or unhide in Sidebar. |
| Stock Balance looks wrong | It is the location balance at the end of the selected period, not today's balance. | Adjust the period or use the Stock Balance applet. |
| Returns make quantities negative | Purchase returns carry a negative signum and net against invoices. | Expected. |

## Related documentation

- [Purchasing module](/modules/purchasing/) and its [related applets](/modules/purchasing/related-applets/)
- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/)
