---
title: "Stock Transfer"
description: "Reference for the Stock Transfer applet — outbound and inbound stock transfer documents that move stock between locations of the same company, the transfer queue, transfer details, outbound file import and error checking."
applet_code: "stockTransferApplet"
applet_repo: "blg-applet-wavelet-stock-transfer-applet"
modules: [inventory]
related_applets: [internal-stock-requisition-applet, stock-balance-applet, stock-availability-applet, stock-report-applet, consignee-stock-transfer-applet, stock-replenishment-applet, warehouse-management-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, organisation-applet, internal-purchase-grn-applet]
guides: []
sources:
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/app.component.ts
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/app.routing.ts
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/components/settings-container/
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/components/internal-outbound-stock-transfer-container/
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/components/internal-inbound-stock-transfer-container/
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/components/internal-stock-queue-container/
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/components/stock-transfer-details-container/
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/components/error-checking-container/
  - blg-applet-wavelet-stock-transfer-applet/micro-fe/projects/wavelet-erp/applets/stock-transfer-applet/src/app/components/utilities/select-location-drop-down-stock-to/
  - blg-shared-utilities/utilities/select-location-drop-down-stock/select-location-drop-down-stock.component.ts
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalOutboundStockTransferDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalInboundStockTransferDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/StockTransferQueueReportUow.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet stockTransferApplet)
tags:
- stock-transfer
- inventory-management
- warehouse
- inter-location-transfer
- stock-movement
---

## Overview

The Stock Transfer applet moves stock between two locations of the same company in two steps. The sending location raises an **Outbound Stock Transfer** (document type `INTERNAL_OUTBOUND_STOCK_TRANSFER`, short code `OBDSTF`); finalising it takes the quantity out of the sending location and places every line in a **transfer queue**. The receiving location then raises an **Inbound Stock Transfer** (`INTERNAL_INBOUND_STOCK_TRANSFER`, `IBNSTF`) by knocking off the queue; finalising it puts the quantity into the receiving location. Until the inbound is finalised the goods are counted at neither location, which is what makes the queue the in-transit record.

Warehouse and branch staff use it for branch-to-warehouse and branch-to-branch movements; supervisors use the **Queue** and **Details** listings to see what has been sent but not yet received. Stock transfers move quantity only — they carry no value and post nothing to the General Ledger.

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Stock Requisition](/applets/inventory-workflow/internal-stock-requisition-applet/) | A branch's request for stock; an outbound transfer can knock it off |
| Upstream | [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/) | Goods received centrally can be knocked off into an outbound transfer to the branches |
| Upstream | [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/) | Replenishment runs generate outbound transfers |
| Upstream | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) / [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Items and their tracking type (serial, batch, bin) |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Branches and locations; locations must be `ACTIVE` to be selectable |
| Downstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/) | Show the quantity leaving one location and arriving at the other |
| Sibling | [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/) | The same pattern between a consignor company and its consignee locations |

Modules: Inventory.

## Screens and menus

| Menu | Purpose |
|---|---|
| **Outbound** | Listing and create/edit of outbound stock transfers (goods issued from the sending location) |
| **Queue** | Every finalised outbound line that has not been fully received — the in-transit list |
| **Details** | One row per outbound line with the inbound document that received it: qty sent, received and outstanding |
| **Inbound** | Listing and create/edit of inbound stock transfers (goods received at the destination) |
| **Outbound File Import** | Create outbound transfers in bulk from a delimited file |
| **Error Checking** | Documents whose posting or knock-off status is inconsistent, by server document type and date range |

Gear (Settings) menu: **Application Settings**, **Default Selection**, **Outbound Printable Format**, **Inbound Printable Format**, **Custom Status**, **Custom Field Placement**, **Custom Resource Bundle Configuration** (relabelling), **Spreadsheet View configuration**, plus the platform pages (Webhook, Feature Visibility, permission listings, Release Notes, Applet Log). Personalisation: per-user **Default Selection**.

Routes for a *Multi-Stock Transfer / Replenishment* menu (templates, events, runs) still exist in the applet but the menu entries are commented out; replenishment is documented under [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/).

### Outbound

{{< figure src="/images/stock-transfer-applet/outbound-listing.png" alt="Outbound Stock Transfer listing" caption="Outbound listing." >}}

Create with **+**. The **Main Details** tab takes Location From (defaults from the tenant or personal Default Selection), Location To, the transfer date, Reference #, Remarks, Tracking ID and, if enabled, Driver Code. The **Line Items** tab is available in a **Standard View** (one line at a time, with Item Details, Serial Number / Batch Number / Bin Number and Grouped Item sub-tabs) and a **Spreadsheet View** (grid entry, configurable under Settings > Spreadsheet View configuration); a setting chooses which of the two is shown. A **Scan Serial No or Item Code** box adds lines by scanner.

{{< figure src="/images/stock-transfer-applet/outbound-edit.png" alt="Outbound Stock Transfer edit" caption="Outbound document: main details and line items." >}}

While the document is still new, a **Search Document** (KO For) tab lets you pull lines from a **Stock Requisition**, a **GRN**, a **Purchase Invoice** or an **ST-GRN**. Other tabs: **Delivery Details** (shown by `SHOW_DELIVERY_DETAILS`), **Doc Link**, **Service Note Link**, **Attachments**, **Export**.

{{< figure src="/images/stock-transfer-applet/outbound-view.png" alt="Outbound Stock Transfer view" caption="Viewing a finalised outbound transfer." >}}

Buttons: **SAVE** (draft), **FINAL**, **DISCARD** (draft only), **VOID** (final only), **CLONE**, and **DELETE** when `SHOW_DOCUMENT_DELETE_BUTTON` is on and the document is not final.

### Queue

{{< figure src="/images/stock-transfer-applet/queue.png" alt="Stock transfer queue" caption="Queue: every outbound line awaiting receipt." >}}

Columns: Stock Transfer ID, Doc No (Company), Item Code / Name, Serial, Location From / To, Date Send, Sender, Sender Remarks, Transporter, Tracking ID, Reference #, Amount Txn, Status, Posting Status, State, created / updated by and date. Rows come from the open-queue table (`bl_fi_generic_doc_line_open_queue`); `DELETED` documents are filtered out. Read access to the queue is limited by the user's location permissions on Location To.

### Details

{{< figure src="/images/stock-transfer-applet/details.png" alt="Stock transfer details" caption="Details: outbound and inbound side by side." >}}

Adds Outbound Doc, Inbound Doc, Qty Sent, Qty Received, Qty Outstanding, Date Received, Recipient Remarks and Serial List to the queue columns, so a supervisor can see partial receipts.

### Inbound

{{< figure src="/images/stock-transfer-applet/inbound-listing.png" alt="Inbound Stock Transfer listing" caption="Inbound listing." >}}

Create with **+**, choose Location To (your location) and Location From, then open **Search Document** > **ST-GIN**: the grid lists queue lines whose Location To you may read; select one or more and knock them off. Each knocked-off line is created with its open quantity (`qty_open`), which you can reduce for a partial receipt — the remainder stays in the queue. Inbound tabs: Main Details, Line Items, Delivery Details, Search Document, **Status** (custom statuses), Doc Link, Attachments, Export. Buttons: SAVE, FINAL, DISCARD; there is no VOID button on the inbound side in the current build.

### Outbound File Import

Upload a delimited file (the delimiter is chosen on the form) and follow **Process Status** and **Error Message** per file. Each processed file creates outbound transfer documents; item codes that cannot be resolved are flagged per row.

### Error Checking

{{< figure src="/images/stock-transfer-applet/error-checking.png" alt="Error checking" caption="Error Checking: documents whose posting or knock-off is inconsistent." >}}

Filter by Server Doc Type and date range; the grid shows Doc No, Branch, Date Txn, Amount, Posting Status, Posting KO and Remarks, with a **Missing Queue** view for finalised outbound lines that never reached the queue.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branches and `ACTIVE` locations | [Organisation](/applets/master-data/organisation-applet/) | Both dropdowns list only active locations; locations whose code starts with `L-STOCK-IN-TRANSIT` are excluded from Location To (and from Location From when the dropdown opts in) |
| Items with the right tracking type | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Serial / batch / bin sub-tabs appear only for tracked items |
| Location read permissions | Applet permission assignment | The queue and the ST-GIN knock-off grid show only lines whose Location To the user may read |
| Document numbering for `OBDSTF` / `IBNSTF` | Organisation > document numbering | Branch / company / tenant document numbers |
| Printable formats (optional) | Settings > Outbound / Inbound Printable Format | Needed for `ENABLE_AUTO_POPUP` |

No GL codes, tax codes or cashbooks are needed — the documents do not post to the ledger.

### Applet settings

**Settings > Application Settings** opens the shared field-configuration screen, which shows the keys below for this applet. All are tenant-wide and default to off unless stated.

| Setting | What it controls | Effect when changed |
|---|---|---|
| `HIDE_QUEUE_MENU`, `HIDE_STOCK_TRANSFER_DETAILS_MENU`, `HIDE_OUTBOUND_FILE_IMPORT_MENU`, `HIDE_ERROR_CHECKING_MENU` | Left-menu entries | Hidden unless the user holds the matching `SHOW_*` permission |
| `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_CLONE_BUTTON` | Document buttons | FINAL / DISCARD / VOID / CLONE reappear for holders of `SHOW_GENDOC_*` / `SHOW_CLONE_BUTTON` |
| `SHOW_DOCUMENT_DELETE_BUTTON` | Adds DELETE on non-final documents | — |
| `DISABLE_GEN_DOC_LISTING`, `DISABLE_ITEM_LISTING`, `HIDE_ITEM_SEARCH` | Turn off the document listing / item listing / item search box | — |
| `DEFAULT_TRANSACTION_DATE`, `SORT_ORDER` | Listing default date range and sort | — |
| `SHOW_ITEM_STOCK_BALANCE` | Labelled *Disallow negative stock for basic item (validate stock balance)*: shows the item's balance and blocks an outbound line beyond it | Prevents sending what the location does not have |
| `HIDE_MAIN_DETAILS_DOC_NO_TENANT` / `_COMPANY` / `_BRANCH` | Hide the three document-number fields | — |
| `HIDE_REFERENCE`, `HIDE_REMARKS`, `HIDE_MAIN_DESCRIPTION`, `HIDE_TRACKING_ID`, `SHOW_DELIVERY_DRIVER_CODE`, `HIDE_CREATED_BY_DETAILS` | Header fields | `SHOW_DELIVERY_DRIVER_CODE` adds the Driver Code field |
| `HIDE_CREATED_BY_OUTBOUND` / `_INBOUND`, `HIDE_MODIFIED_BY_*`, `HIDE_CREATED_DATE_TIME_*`, `HIDE_MODIFIED_DATE_TIME_*`, `ENABLE_CREATED_DATE_TIME_SPLIT_*`, `ENABLE_MODIFIED_DATE_TIME_SPLIT_*` | Audit fields, separately for outbound and inbound; the SPLIT keys show date and time as two fields | — |
| `HIDE_LINE_ITEM_LISTING_UOM`, `HIDE_LINE_ITEM_DETAILS_REMARKS`, `SHOW_LINE_ITEM_BRANCH_COLUMNS` | Line grid columns | — |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` | Hides unit price on lines | Reopened per user by `SHOW_UNIT_PRICE_STD_PRICING_SCHEME` |
| `HIDE_GRN_TAB`, `HIDE_ST_GRN_TAB`, `HIDE_PURCHACE_INVOICE_TAB` | Outbound Search Document tabs (GRN, ST-GRN, Purchase Invoice) | Reopened by `SHOW_GRN_TAB`, `SHOW_ST_GRN_TAB`, `SHOW_PURCHASE_INVOICE_TAB` |
| `SHOW_STOCK_REQUISITION_LOCATION_FROM_AND_TO`, `HIDE_STOCK_REQUISITION_SUPPLIER`, `HIDE_STOCK_REQUISITION_BRANCH`, `HIDE_STOCK_REQUISITION_LOCATION` | Columns on the Stock Requisition knock-off grid | — |
| `SHOW_DELIVERY_DETAILS` | Shows the Delivery Details tab | — |
| `HIDE_DOCUMENT_LINKS`, `HIDE_STATUS_GEN_DOC` | Doc Link tab and status field | — |
| `SIMPLIFIED_UI` | Compact header layout with custom fields | — |
| `VERTICAL_ORIENTATION`, `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN`, `EXPAND_*` | Vertical (accordion) layout and which panels open expanded | Presentation only |
| `OUTBOUND_DETAILS_TAB_ORDER`, `INBOUND_DETAILS_TAB_ORDER` | Tab order and which tabs are hidden (`INTERNAL_OUTBOUND_HIDE_*`, `INTERNAL_INBOUND_HIDE_*`) | Edited under Custom Field Placement |
| `PRINTABLE`, `PRINTABLE_INBOUND`, `ENABLE_AUTO_POPUP` | Outbound / inbound printable format; open the print dialog automatically on FINAL | FINAL shows *Printable not configured* if `ENABLE_AUTO_POPUP` is on without a format |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_LANGUAGE_CODE` | Defaults for new documents (Settings > Default Selection; personal values override) | — |
| `INCLUDE_*` / `ENABLE_*` for segment, dimension, profit centre, project, SST, WHT | Declared in the settings model but not bound to any transfer field | No effect |

**Settings > Custom Status** — up to five client document statuses, each switched on for the header and/or the line and given a list of named values; enabled header statuses appear as columns on the inbound listing and on the inbound **Status** tab.

**Settings > Spreadsheet View configuration** — column labels and the **Line View Mode** (standard, spreadsheet, or both) used on the Line Items tab.

**Settings > Custom Resource Bundle Configuration** — relabel fields such as Doc No, Location From / To and the transaction date, separately for inbound and outbound.

### Document behaviour settings

| Setting | Effect |
|---|---|
| `HIDE_GENDOC_SAVE_BUTTON` / `HIDE_GENDOC_FINAL_BUTTON` | Force immediate finalising, or separate drafting from finalising |
| `HIDE_GENDOC_VOID_BUTTON` | Stop users reversing a finalised outbound |
| `SHOW_ITEM_STOCK_BALANCE` | Validate the sending location's balance before FINAL |
| `PRINTABLE`, `PRINTABLE_INBOUND`, `ENABLE_AUTO_POPUP` | Print on FINAL |

There is no approval workflow, no posting configuration and no e-Invoice submission for stock transfers.

### Feature visibility / permissions

Registered client-side permissions for `stockTransferApplet`:

| Permission | Unlocks |
|---|---|
| `SHOW_QUEUE_MENU`, `SHOW_OUTBOUND_FILE_IMPORT_MENU` | The menu when hidden tenant-wide |
| `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_CLONE_BUTTON` | The button when hidden tenant-wide |
| `SHOW_GRN_TAB`, `SHOW_ST_GRN_TAB`, `SHOW_PURCHASE_INVOICE_TAB` | The outbound knock-off tabs when hidden |
| `SHOW_TRANSACTION_DATE` | Edit the transfer date on an inbound document (otherwise read-only) |
| `SHOW_UNIT_PRICE_STD_PRICING_SCHEME` | Unit price on lines when hidden |

`SHOW_STOCK_TRANSFER_DETAILS_MENU` and `SHOW_ERROR_CHECKING_MENU` are checked in code but not seeded in the registry, so those two menus can only be hidden for everyone. Server-side, create / read / update / delete are governed by the `TNT_API_DOC_INTERNAL_OUTBOUND_STOCK_TRANSFER_*` and `TNT_API_DOC_INTERNAL_INBOUND_STOCK_TRANSFER_*` API permissions, and location read permissions filter the queue.

## Fields

### Main Details (outbound and inbound)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Location From (`locationSending` / `locationFrom`) | Sending location | Yes | Active locations only; outbound defaults from Default Selection |
| Location To (`locationReceiving` / `locationTo`) | Receiving location | Yes | Active, non-in-transit locations only; must differ from Location From |
| Transfer date (`stockTransferServiceDate`) | Date of issue / receipt | Yes | On inbound, editable only with `SHOW_TRANSACTION_DATE` |
| Doc No (Tenant / Company / Branch) | Running numbers | generated | Hide with `HIDE_MAIN_DETAILS_DOC_NO_*` |
| Doc Short Code | `OBDSTF` / `IBNSTF` | — | Fixed |
| Reference #, Remarks, Tracking ID, Driver Code | Free text | No | Hidden by the corresponding settings |
| Custom fields | Tenant-defined | per field | Custom Field Placement; a custom-field validation error is shown on FINAL |
| Created / modified by, date, time | Audit | — | — |

### Line item

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item Code / Name | The item | Yes | Active items only |
| Quantity | Units to send / receive | Yes | Base UOM; with `SHOW_ITEM_STOCK_BALANCE` an outbound line cannot exceed the location balance |
| UOM | Unit | — | Hidden on the grid by `HIDE_LINE_ITEM_LISTING_UOM` |
| Location From / To | Per line, defaulted from the header | — | Shown by `SHOW_LINE_ITEM_BRANCH_COLUMNS` |
| GRN No., ST-GRN ID, Tracking ID | References carried from the knocked-off document | No | — |
| Remarks | Free text | No | `HIDE_LINE_ITEM_DETAILS_REMARKS` |
| Serial Number tab | Serials leaving / arriving | For serial items | Outbound: serials must exist at Location From; inbound: the "already exists in company" check is skipped because the serial is already the company's |
| Batch Number tab | `batch_no`, `issue_date`, `expiry_date`, quantity | For batch items | — |
| Bin Number tab | `bin_code`, `container_measure`, `container_qty` | For bin items | Bin line must exist at the location (`Bin Line Guid Does Not Exist for STOCK_TRANSFER`) |
| Grouped Item tab | Components of a grouped item | — | Shown for `GROUPED_ITEM` |

## Lifecycle and posting

| Status (`posting_status`) | Meaning | Allowed next |
|---|---|---|
| `DRAFT` | Saved; editable; can be deleted when `SHOW_DOCUMENT_DELETE_BUTTON` is on | `FINAL`, `DISCARDED` |
| `FINAL` | Posted to stock; not editable | `VOID` (outbound only) |
| `VOID` | Reversed | — |
| `DISCARDED` | Abandoned draft | — |

What FINAL does:

| Document | Stock at Location From | Stock at Location To | Queue | Ledger |
|---|---|---|---|---|
| Outbound (`quantity_signum` −1) | − quantity | — | One open-queue row per line with `qty_open` = quantity | none (`amount_signum` 0) |
| Inbound (`quantity_signum` +1) | — | + quantity | Knocked-off `qty_open` reduced; line closes at 0 | none |

Neither document type is in the journal-posting handler, so no journal is created and no default GL code is needed. Discarding an inbound draft releases the queue quantity it had knocked off (`updateKO` with `DISCARDED`). Voiding a finalised outbound reverses the stock movement; if any of its lines have already been received, receive the goods back with a reverse transfer instead.

Stock transfers are **exempt from the fiscal-period lock**: `LOCK_TXN` / `LOCK_ALL` periods reject other documents but the backend explicitly allows outbound and inbound stock transfers, so period closing does not stop branch movements.

Costing: the receiving location takes the item's cost from the company-level moving average / FIFO / LIFO layers; a transfer never changes the company's unit cost.

## Related applets

- [Stock Requisition](/applets/inventory-workflow/internal-stock-requisition-applet/) — the request that an outbound transfer fulfils via Search Document > Stock Requisition.
- [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/) — replenishment runs generate outbound transfers automatically.
- [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/) — the same outbound / queue / inbound pattern for consignment stock.
- [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/) — received goods can be pushed to branches by knocking the GRN off into an outbound transfer.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/) — where the movement shows; the queue quantity sits in neither location until received.
- [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) — packing lists reference outbound transfers.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — item tracking type.
- [Organisation](/applets/master-data/organisation-applet/) — locations, in-transit locations, document numbering.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Inbound Search Document > ST-GIN shows nothing | The user has no read permission on the outbound's Location To, or the outbound is not `FINAL` | Grant the location permission; finalise the outbound |
| Queue shows lines already received | The inbound was saved but not finalised (`qty_open` is only reduced on FINAL), or the receiving inbound was deleted | Finalise or re-create the inbound; use **Details** to compare Qty Sent / Received |
| Deleted transfers appeared in the queue | Fixed in 2026 — the queue listing now filters `DELETED` documents | Update the applet |
| Inactive location still selectable in Location From | Fixed in 2026 — both dropdowns now show `ACTIVE` locations only | Update the applet; deactivate rather than delete old locations |
| Location To dropdown is missing the in-transit location | By design: codes starting `L-STOCK-IN-TRANSIT` are excluded | Transfer to the real destination; the queue is the in-transit record |
| FINAL shows an error message but the document still finalises | A custom-field validation failed; the document is posted anyway (open issue, 2026) | Fix the custom field value; check Custom Field Placement |
| FINAL shows *Printable not configured* | `ENABLE_AUTO_POPUP` is on but `PRINTABLE` / `PRINTABLE_INBOUND` is empty | Set the printable format or turn off auto pop-up |
| Outbound line rejected for quantity | `SHOW_ITEM_STOCK_BALANCE` validation — the sending location has less than the line quantity | Check Stock Availability at Location From; adjust or receive stock first |
| Serial number rejected on outbound | The serial is not at Location From (`SERIAL_NUMBER_DOES_NOT_EXIST_AT_LOCATION`) | Trace the serial in Stock Availability and transfer it from where it is |
| `Bin Line Guid Does Not Exist for STOCK_TRANSFER` | The bin code on the line is not set up at the location | Create the bin in Warehouse Management |
| Total quantity shows 0 or a previous document's value when creating from a GRN | Fixed in 2026 | Update the applet |
| Menu missing for some users | `HIDE_*_MENU` set tenant-wide | Grant `SHOW_QUEUE_MENU` / `SHOW_OUTBOUND_FILE_IMPORT_MENU`; Details and Error Checking have no permission and must be unhidden for all |

## Related documentation

- [Inventory module](/modules/inventory/) — [core concepts](/modules/inventory/core-concepts/), [configuration](/modules/inventory/configuration/), [related applets](/modules/inventory/related-applets/).
- [Inventory guides](/guides/inventory-guides/).
