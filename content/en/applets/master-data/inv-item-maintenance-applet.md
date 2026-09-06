---
title: "Inventory Item Maintenance"
description: "Reference for the Inventory Item Maintenance applet — the stock-keeping record behind every stock-tracked item: inventory categories, multi-UOM, per-location min/max levels, serial-number import and trace, and the FIFO stock aging report."
applet_code: "InvItemMaintenanceApplet"
applet_repo: "blg-applet-wavelet-inv-item-maintenance-applet"
modules: [core, inventory]
related_applets: [doc-item-maintenance-applet, stock-balance-applet, stock-availability-applet, stock-take-applet, stock-adjustment-applet, stock-transfer-applet, stock-report-applet, warehouse-management-applet, organisation-applet, chart-of-account-applet, pos-general-applet, internal-sales-invoice-applet, internal-purchase-grn-applet, process-maintenance-applet]
guides: [/guides/purchasing-guides/, /user-guide/daily-tasks/creating-purchase-order/]
sources:
  configuration:
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/app.routing.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/settings-container/email-notification/email-notification-create/email-notification-create.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/app.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/item-edit.component.html
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/trace-serial-no-container/trace-serial-no-listing/trace-serial-no.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/MinMaxQtyStockBalanceCronNotificationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/inventoryItem/InventoryItemController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/inventoryTransaction/TraceSerialNumberController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/reports/stock/StockReportController.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet InvItemMaintenanceApplet)
  fields:
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-create/item-create.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-create/item-create.component.html
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/item-edit.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/multi-uom/multi-uom-create/item-uom-create.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/basic-item-location/item-location.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/basic-item-company/company-add/company-add.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/manage-image/image-create/image-create.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/stock-card/stock-card.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/category-container/item-category-create/item-cat-create.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/group-category-container/group-category-create/item-cat-create.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/models/advanced-search-models/item.model.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/models/advanced-search-models/stock-aging-report-search.model.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/stock-aging-report-container/stock-aging-report/stock-aging-report.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/stock-min-max-import-container/stock-min-max-import-edit/import-file-helper/stock-min-max-import-helper-listing.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/shared/inv-item-options.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/sdk/ERP/inv-items/inv-item-constants.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/data-transfer-objects/current-stock-balance-min-max-qty-dto.model.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryItemDataConsistencyObjects/InventoryItemDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InventoryItemService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/InventoryItemUows/InventoryItemUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/finance/FinancialToInventoryItemAutoCreationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/erp/genericDocument/fi/financialItem/FiItemToInventoryItemUpdateService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/FiItemService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/CurrentLocationStockBalanceService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockMinMaxImportFileHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/invItemSerialNumberFileImport/InvItemSerialNumberImportFileHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/InventoryTransactionUows/InventoryTransactionSubLineUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/reports/stock/StockReportService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/stock/StockReportUow.java
  troubleshooting:
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/item-edit.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InventoryItemService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryItemDataConsistencyObjects/InventoryItemDataConsistencyObject.java
    - gh:bigledger/blg-intranet#4048
    - gh:bigledger/blg-intranet#4324
    - gh:bigledger/blg-intranet#5347
    - gh:bigledger/blg-intranet#1125
    - gh:customer-repo-ce5219#512
    - gh:customer-repo-ce5219#513
tags:
- core-module
- inventory-management
- product-master
- master-data
- stock-control
weight: 104
aliases:
- /applets/inv-item-maintenance-applet/
---

## Overview

The Inventory Item Maintenance applet holds the **stock-keeping record** of an item — the row in `bl_inv_mst_item_hdr` that stock ledgers, stock balances, serial numbers, bins and costing layers are keyed on. Its commercial twin (price, tax, e-Invoice classification, what a document line can pick) lives in the [Doc Item Maintenance applet](/applets/master-data/doc-item-maintenance-applet/); when a *Basic Item* is created there, the backend creates the inventory record automatically and links the two. This applet is where you maintain what the doc item does not: inventory category groups and categories, alternative units of measure, per-location minimum and maximum quantities, serial-number registers and traces, and the stock aging report.

It is opened by the warehouse or inventory controller rather than the merchandiser. It sits behind every stock movement: a goods receipt, sale, transfer, adjustment or stock take writes ledger lines against the record kept here.

A short introduction to the applet:

{{< youtube wBAbnAasGyY >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream (usually creates the record) | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Creating a Basic Item there queues `FinancialToInventoryItemAutoCreationProcessor`, which inserts (or finds) the inventory record with the same code, name, UOM, type, sub-item type, currency, scan code and dimensions and sets `guid_fi_mst_item`; later doc-item status changes are pushed to this record |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies for the Company tab; the branch and location masters behind the Location tab, the min/max import and the stock aging filters |
| Upstream | [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) | Locations (`bl_inv_mst_location`) that serial-number and min/max imports resolve by code |
| Upstream | [Chart of Account](/applets/master-data/chart-of-account-applet/) | The optional GL Code on the Main tab (stored as an item extension) |
| Downstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/) | Balances, availability and reports are per inventory item and location; the Min Qty / Max Qty set here are the `qty_min_level` / `qty_max_level` those applets show |
| Downstream | [Stock Take](/applets/inventory-workflow/stock-take-applet/), [POS General](/applets/sales-workflow/pos-general-applet/), sales and purchase documents ([Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/), …) | Every stock-moving line carries this record's guid; scans resolve the EAN / scan code and the multi-UOM line barcodes kept here |
| Downstream | [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/), [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) | Movements that the Stock Card tab and Trace Serial No screen read back |
| Sibling | [Process Maintenance](/applets/manufacturing/process-maintenance-applet/) | The Process Template tab lists the manufacturing process templates (`bl_mrp_process_template_bom`) that use the item |

Modules: Core, Inventory.

## Screens and menus

The left menu has these entries (Field Settings can hide the last five):

| Menu | Route | What it is for |
|---|---|---|
| **Items** | `item-listing` | Listing, create and edit screens for inventory items |
| **Category Groups** | `group-category-listing` | Groups of inventory categories (`bl_inv_mst_label_list_hdr`) |
| **Categories** | `category-listing` | Inventory categories, optionally nested under a parent, each belonging to a group (`bl_inv_mst_label_hdr`) |
| **Trace Serial No** | `trace-serial-no-listing` | Movement history of one serial number across documents and locations |
| **Import File** | `file-import` | CSV import of serial numbers into `bl_inv_serial_number_hdr` |
| **Min-Max Quantity Import File** | `stock-min-max-import` | CSV import of per-location minimum / maximum quantities |
| **Stock Aging Report** | `stock-aging-report` | FIFO layers of on-hand stock bucketed by receipt month |

{{< figure src="/images/inv-item-maintenance-applet/item-listing.png" alt="Item Listing" caption="Items: the listing shows Item Code, Item Name, Type, UOM, Modified Date and Status; the filter icon opens the advanced search (Item Type, Location, Modified Date, Status)." >}}

**Items listing.** Columns: Item Code, Item Name, Type, UOM, Modified Date (default sort, descending), Status. The quick search matches code or name (`ILIKE`). The advanced search filters by Item Type, Location (multi-select), Modified Date range and Status. The **Export** button (CSV or Excel) exports the current search result together with the Min Qty / Max Qty of every location — it is the only bulk read of min/max levels. There is no delete button on the listing or the edit screen (the delete handler is commented out).

**Create Item** is a single *Details* tab: Item Code, Item Name, Type, Sub Item Type, Base UOM, Item Description.

{{< figure src="/images/inv-item-maintenance-applet/item-create.png" alt="Create Item" caption="Create Item: code and name are upper-cased on save; the item is created with status ACTIVE and no linked doc item." >}}

**Item Edit** has these tabs (Field Settings can hide all but *Main* and *Item Category*):

| Tab | What it holds |
|---|---|
| **Main** | Code (read-only), name, FI Item Code (the linked doc item, read-only), type and sub-item type (read-only), GL Code, Base UOM, Abbreviation (Prefix), EAN Code, Currency, Status, audit fields |
| **Item Category** | The inventory categories linked to the item (`bl_inv_mst_label_link`); add from the category picker |
| **Multi Uom** | Alternative units with a ratio to the base UOM and their own EAN code (`bl_inv_mst_item_line`, `parameter_code = MULTI_UOM`) |
| **Dimensions** | Height, length, width, weight |
| **Manage Image** | Item images by category (Main, Promotion, Additional) with an optional campaign date range |
| **Location** | One row per location: Min Qty and Max Qty (editable in the grid), Stock Bal Qty; selecting a serialised item's row lists its serial numbers at that location |
| **Company** | The companies the item is linked to (`bl_fi_item_comp_branch_link`) |
| **Stock Card** | Ledger lines (`txn-line/stock-cards`) for a location and date range |
| **Process Template** | Manufacturing process templates that use the item, with a *Replace* action to swap in another item |

{{< figure src="/images/inv-item-maintenance-applet/item-edit.png" alt="Item Edit" caption="Item Edit, Main tab. Type and Sub Item Type cannot be changed after creation. An item without a currency shows 'Please select currency' and cannot be saved until one is chosen." >}}

**Category Groups** and **Categories** are the same two-level structure the Doc Item Maintenance applet uses — a group (department) holds categories (aisles), and a category may have a parent category.

{{< figure src="/images/inv-item-maintenance-applet/category-groups-listing.png" alt="Category Group Listing" caption="Category Groups: code, name, type (CP_COM, DOC_ITEM or INV_ITEM_CATEGORY), param code and param name." >}}

{{< figure src="/images/inv-item-maintenance-applet/category-groups-create.png" alt="Category Group Create" caption="Category Group Create: all of Code, Name, Type, Param Code and Param Name are required." >}}

{{< figure src="/images/inv-item-maintenance-applet/categories-create.png" alt="Category Create" caption="Category Create: pick the group, enter code and name, and optionally choose a parent category from the tree." >}}

**Trace Serial No** searches `bl_inv_serial_number_hdr` joined to the ledger sub-lines and shows every movement of a serial: Serial Number, Location, Code, Transaction Date, Document, Server Doc Type, Customer/Supplier, Reference, Quantity (base quantity × signum), and — only for users holding the two client-side permissions below — Item Price and Total Transaction Amount.

{{< figure src="/images/inv-item-maintenance-applet/trace-serial-no.png" alt="Trace Serial Number Stock Movement" caption="Trace Serial No: Exact Match compares the whole serial; Keyword Search is a contains-match; both can be limited by transaction date." >}}

**Import File** (serial numbers) and **Min-Max Quantity Import File** follow the platform's CSV import pattern: upload a `.csv`, the backend queues a processor, and the listing shows *Process Status* (VALIDATING_DATA → DONE or FAILED) with a per-row helper grid of validation errors.

{{< figure src="/images/inv-item-maintenance-applet/import-file.png" alt="Inv Item Serial No Import Listing" caption="Import File: each upload is a header row with file name, size, format, status, process status and the user-facing error message." >}}

**Stock Aging Report** shows, per item and location, the on-hand quantity and amount split into one column group per month of receipt.

{{< figure src="/images/inv-item-maintenance-applet/stock-aging-report.png" alt="Stock Aging Report" caption="Stock Aging Report: fixed columns (Item Code, Inv Item Code, Item Name, Type, Sub Type, UOM, Location, Aging) followed by a Qty / Amount pair per month; Export PDF and Export XLS." >}}

**Settings** (gear icon) offers *System Configuration › Field Settings, Default Selection, Email Notification*, *Attribute Management › Attribute, Attribute Set*, the server-side permission screens (Permission Wizard, Permission Set, User Permission, Role Permission, Team Permission, Client Side Permission), Webhook, Feature Visibility and *Developer Tools › Release Notes, Audit Trail*. **Personalization** offers Field Settings, Default Selection and Sidebar. The two *Attribute Management* entries have no route in `app.routing.ts` — clicking them lands on the settings landing page.

{{< figure src="/images/inv-item-maintenance-applet/settings-page.png" alt="Applet Settings" caption="Settings: the landing page is the Teams access panel; Field Settings is the applet's only working configuration screen." >}}

## Configuration

### Before you can use it

- **A doc item, if the item is to be sold or bought.** Document lines pick a *doc item*; the inventory record is only the stock side. Creating a Basic Item in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) creates and links the inventory record for you (`FiItemService.createFiWInvItem` queues the auto-creation processor). An item created directly in this applet has no doc item (FI Item Code is blank) and cannot appear on a document until one is linked from the doc-item side.
- **Companies and branches** in [Organisation](/applets/master-data/organisation-applet/) — the Company tab links the item to companies.
- **Locations** in [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) — the Location tab, both imports and the stock aging filters resolve locations by code.
- **GL codes** in [Chart of Account](/applets/master-data/chart-of-account-applet/) only if you want the optional GL Code on the Main tab.
- **Server-side permissions.** Item create / update / delete are checked against `TNT_API_INVENTORY_ITEM_READ / UPDATE / DELETE` in `InventoryItemController`; Trace Serial No requires one of `TNT_API_INVENTORY_TRANSACTION_SUB_LINE_OWNER / ADMIN / READ` (`TraceSerialNumberController`); the Stock Aging Report requires one of `API_TNT_DM_ERP_STOCK_REPORT_OWNER / ADMIN / READ` (`StockReportController`). Grant them through Settings › Permission Wizard.
- **A sender e-mail** for the min/max alert: the processor uses the tenant's custom sender from the messaging channel configuration and falls back to the platform default (`MinMaxQtyStockBalanceCronNotificationProcessor`).

### Applet settings

Settings live in an **applet-local** `FieldConfigurationComponent` (route `settings/field-settings`), not in the shared blg-shared-utilities screen; the shared component is not routed, so `sessionStorage.appletCode` gating and `kb/tools/gates.py` do not apply here. The form is a flat list of 14 slide toggles patched from `SessionSelectors.selectMasterSettings` and saved with `SessionActions.saveMasterSettingsInit`, which merges the values into the applet's `bl_applet_ext` row `APPLET_SETTINGS` (`session.effects.ts`). The settings are tenant-wide; anyone who can open Settings can change them (no permission check in the component). Every control starts unset (`new UntypedFormControl()`), so the default for every toggle is *off* — everything is visible until a toggle is switched on and saved.

The 13 keys below pass all four proofs (declared in the form, rendered in `field-configuration.component.html`, persisted by the session effect, consumed in the file named). The `AppletSettings` interface in `models/applet-settings.model.ts` is a copy from a document applet (`INCLUDE_*`, `ENABLE_*`, `PRINTABLE`, `DISABLE_GEN_DOC_LISTING`, `HIDE_ITEM_PRICE`, `HIDE_TOTAL_TRANSACTION_AMOUNT`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`) — none of those keys has a control or a reader in this applet and they are not documented.

| Panel | Setting | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Sidebar Menu | `HIDE_CATEGORY_GROUP_MENU` | Removes *Category Groups* from the left menu (`app.component.ts`) | off | Menu entry disappears on next load; the route still works if typed |
| Sidebar Menu | `HIDE_CATEGORIES_MENU` | Removes *Categories* | off | As above |
| Sidebar Menu | `HIDE_TRACE_SERIAL_NO_MENU` | Removes *Trace Serial No* | off | As above |
| Sidebar Menu | `HIDE_IMPORT_FILE_MENU` | Removes *Import File* | off | As above |
| Sidebar Menu | `HIDE_STOCK_AGING_REPORT_MENU` | Removes *Stock Aging Report* | off | As above (there is no toggle for *Min-Max Quantity Import File*) |
| Main Details | `HIDE_GL_CODE` | Hides the GL Code drop-down on the Item Edit Main tab (`item-edit.component.html`) | off | An existing `GL_CODE` extension is kept but no longer shown or editable |
| Edit Tabs Hidden | `HIDE_MULTI_UOM` | Hides the *Multi Uom* tab | off | Existing multi-UOM lines stay in force on documents and scans |
| Edit Tabs Hidden | `HIDE_DIMENSIONS` | Hides the *Dimensions* tab | off | — |
| Edit Tabs Hidden | `HIDE_MANAGE_IMAGE` | Hides the *Manage Image* tab | off | — |
| Edit Tabs Hidden | `HIDE_LOCATION` | Hides the *Location* tab | off | Min/max can then only be set by the import |
| Edit Tabs Hidden | `HIDE_COMPANY` | Hides the *Company* tab | off | — |
| Edit Tabs Hidden | `HIDE_STOCK_CARD` | Hides the *Stock Card* tab | off | — |
| Edit Tabs Hidden | `HIDE_PROCESS_TEMPLATE` | Hides the *Process Template* tab | off | — |

Rendered and persisted but **not consumed**: `HIDE_ITEM_CATEGORY` (the *Item Category* toggle in *Edit Tabs Hidden*). The Item Category tab has no `*ngIf`, so switching the toggle on changes nothing. The four toggles in the *Department Settings* panel (Segment, G/L Dimension, Profit Center, Project) have no form control at all — they are not saved.

**Default Selection** (Settings › Default Selection and Personalization › Default Selection) renders Default Branch and Default Location drop-downs, but neither component is given the applet container it writes into (`appletContainer` is never assigned; the `appletSettings$` input is not bound by the route), so choosing a value throws in the browser console and nothing is saved. `DEFAULT_BRANCH` / `DEFAULT_LOCATION` are also read by nothing in this applet. Treat both screens as non-functional at commit 06aebbc.

**Email Notification** (Settings › Email Notification) is not a field setting but a scheduler job. The create form fixes the job code and name to `MIN_MAX_QTY_STOCK_BALANCE_CRON_NOTIFICATION_PROCESSOR`, defaults the cron expression to `0 0 * * *` (daily at midnight) and takes a list of recipient e-mails; the edit form adds an ACTIVE / INACTIVE status. When it runs, the processor selects location stock balances whose ledger quantity is below `qty_min_level` or above `qty_max_level`, and sends one e-mail with the subject *Min/Max Qty Stock Balance Alert* — a summary body plus a CSV attachment — to every recipient. With no recipients, or no violations, it logs and skips.

### Settings in other applets that control this applet

| Setting / behaviour | Where it is set | Effect here |
|---|---|---|
| Item creation and status | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Creating a Basic Item there creates the inventory record; changing the doc item's status pushes the same status to `bl_inv_mst_item_hdr.status` (`FiItemToInventoryItemUpdateService.updateInventoryItemAsync`) |
| Item categories and category groups | Doc Item Maintenance › Category Groups / Categories | Both applets read and write `bl_inv_mst_label_list_hdr` / `bl_inv_mst_label_hdr`; the group *Type* (`CP_COM`, `DOC_ITEM`, `INV_ITEM_CATEGORY`) decides which applet's screens use a group |
| Scan code (EAN) | Doc Item Maintenance › Item › EAN Code | The doc item and the inventory record each hold a `scan_code`; the auto-creation copies it once, after which the two can diverge. Barcode lookups that fail on one side but not the other are the symptom; `POST …/inv-items/data-fix/scan-code-mismatch/align/backoffice-ep` copies the doc item's code onto the inventory record |
| Min / max levels | This applet (Location tab or import) | Shown by [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Stock Availability](/applets/inventory-workflow/stock-availability-applet/); used by the min/max e-mail |

### Feature visibility / permissions

Two client-side permissions are seeded for `InvItemMaintenanceApplet` in `bl_applet_client_side_perm_dfn` and both are checked in code (`trace-serial-no.component.ts`):

| Permission code | What it unhides |
|---|---|
| `SHOW_SN_ITEM_PRICE` | The *Item Price* column (transaction amount ÷ base quantity) on Trace Serial No |
| `SHOW_SN_TOTAL_TRANSACTION_AMOUNT` | The *Total Transaction Amount* column on Trace Serial No |

Both columns are hidden and removed from the column tool panel unless the user holds the permission; there is no tenant-wide `HIDE_*` toggle for them. No other client-side permission is checked by the applet — the `HIDE_*` menu and tab toggles have no `SHOW_*` counterpart that could reopen them per role.

Server-side: the item, min/max, serial-import and report endpoints check the `TNT_API_INVENTORY_ITEM_*`, `TNT_API_INVENTORY_TRANSACTION_SUB_LINE_*` and `API_TNT_DM_ERP_STOCK_REPORT_*` permissions listed under *Before you can use it*; an unpermitted call returns the platform's not-authorised response.

## Fields

### Create Item — Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item Code | `bl_inv_mst_item_hdr.code` | Yes | Max 255; upper-cased on save; must be unique among non-deleted inventory items (backend `INVENTORY_ITEM_HDR_OBJECT_CODE_IS_ALREADY_EXISTS`) |
| Item Name | `name` | Yes | Max 255; upper-cased on save |
| Type | `txn_type` | Yes | Basic Item, Grouped Item, Bundle, Coupon, Service, Warranty, Batch & Expiry, Doc Header Adjustment; immutable after save |
| Sub Item Type | `sub_item_type` | Yes | Basic Quantity, Batch Number, Serial Number, Bin Number; immutable after save |
| Base UOM | `uom` | Yes | Free text, max 255 |
| Item Description | `descr` | No | Max 255 |

The record is created with `status = ACTIVE`, no currency and no linked doc item; an item event row (`bl_inv_mst_item_event`) is written after the header.

### Item Edit — Main

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item Code | `code` | — | Read-only after creation |
| Item Name | `name` | Yes | Max 255; the CSS upper-cases the display but the edit save stores what was typed |
| FI Item Code | Code of the doc item in `guid_fi_mst_item` | — | Read-only; blank when the item was created here |
| Type / Sub Item Type | `txn_type` / `sub_item_type` | — | Disabled |
| GL Code | Item extension `GL_CODE` | No | Hidden by `HIDE_GL_CODE`; written only when a value is selected |
| Base UOM | `uom` | Yes | Max 255 |
| Abbreviation (Prefix) | Item extension `ABBREVIATION` | No | Trimmed; written only when non-empty |
| EAN Code | `scan_code` | No | Trimmed; written only when non-empty — the field cannot be cleared from the UI |
| Currency | `ccy_code` | Yes | Items auto-created from a doc item inherit its currency; items created here have none until set |
| Status | Item extension `ITEM_STATUS` | No | ACTIVE, INACTIVE, OBSOLETE. This is an extension value, distinct from the header `status` that Doc Item Maintenance synchronises |
| Created By / Date, Modified By / Date | Audit | — | Read-only |

The Save button is enabled only while the whole form is valid; see *Troubleshooting* for the hidden `currentGlCode` control that keeps it disabled.

### Multi Uom — Create

| Field | Meaning | Required | Notes |
|---|---|---|---|
| UOM | Alternative unit name | Yes | Max 255 |
| Ratio | Units of base UOM in one alternative unit (`quantity`) | Yes | Number |
| Sort-Code | Display order (`code`) | Yes (validator) | The template does not mark it, but the form is invalid without it |
| Base Uom | The item's base UOM | — | Read-only |
| Status | ACTIVE / INACTIVE | Yes | Default ACTIVE |
| EAN Code | Barcode of this unit (`scan_code` on the line) | No | Scanned as a UOM-specific barcode on documents |

Saved as a `bl_inv_mst_item_line` with `parameter_code = MULTI_UOM` through the full item update (the container is re-read, the line appended, and the whole item PUT).

### Location

| Column | Meaning | Editable |
|---|---|---|
| Location | Location code (`bl_inv_mst_location.code`) | No |
| Min Qty | `bl_inv_current_location_stock_balance.qty_min_level` | Yes — edit the cell; the change is sent as `PUT …/current-location-stock-balance/update-min-max-qty/backoffice-ep` |
| Max Qty | `qty_max_level` | Yes — as above |
| Stock Bal Qty | `qty_ledger` at that location | No |

The grid lists every location; locations with no balance row show 0 / 0 / 0. Saving a min/max for such a location creates the balance row (`CurrentLocationStockBalanceService.updateMinMaxQty` → `create`). The backend rejects a missing item or location (`INV_ITEM_GUID_IS_NULL`, `LOCATION_GUID_IS_NULL`, `INV_ITEM_GUID_DOES_NOT_EXIST`, `LOCATION_GUID_DOES_NOT_EXIST`).

### Company, Manage Image, Stock Card

- **Company › Add** lists companies (code, name, dates, status); selecting one writes a `bl_fi_item_comp_branch_link` row with the inventory item guid and the company guid, status ACTIVE. The listing's second column is labelled *Stock Bal Qty* but is bound to the company name.
- **Manage Image › Add**: Image Category (Main, Promotion, Additional — required), Image Name, Start date / End date (campaign window), Public checkbox, file upload (max 10 MB, stated on screen). Saved through the item update.
- **Stock Card**: Location (required) and a date range (required); the *Txn Line* tab lists Doc No., Description, Txn Date and Qty Ledger from `…/txn-line/stock-cards/backoffice-ep`.

### Category Group and Category

| Screen | Field | Required | Notes |
|---|---|---|---|
| Category Group | Category Group Code, Name | Yes | `bl_inv_mst_label_list_hdr`; namespace `INV_ITEM_CATEGORY` |
| Category Group | Type | Yes | `CP_COM`, `DOC_ITEM`, `INV_ITEM_CATEGORY` (`label_type`) |
| Category Group | Param Code, Param Name | Yes | Free text |
| Category Group | Status | — | Default ACTIVE |
| Category | Category Group | — | Select list of groups |
| Category | Category Code | Yes | Upper-cased on save |
| Category | Category Name | Yes | |
| Category | Description | No | Marked required by the create template's hint only when touched; the validator does not require it |
| Category | Parent | No | Tree of existing categories (`guid_parent`) |
| Category (edit) | Status | Yes | |

Categories are written as `bl_inv_mst_label_hdr` with `txn_type = INVENTORY_ITEM_CATEGORY`; the category edit screen also has a *Manage Image* tab (image name required).

### Trace Serial No

| Field | Meaning |
|---|---|
| Exact Match | `sn_id = :serialNumber` |
| Keyword Search | `sn_id LIKE '%' || :serialNumberKeyword || '%'` (case-sensitive) |
| Transaction Date From / To | Bounds on the ledger line's transaction date |

### Import File (serial numbers)

CSV only (`accept=".csv"`); the *Download template* button saves `MasterData_Upload_InvItemSerialNumber.csv`. Helper columns per row: `sn_id`, `sn_type`, `item_code`, `location_code`, `namespace`, `quantity_balance`, `quantity_base`, `sn_description`, each with a matching `*_error` column shown in the helper grid. The processor resolves `item_code` to an inventory item and `location_code` to a location and creates or updates the `bl_inv_serial_number_hdr` row; a row with blank item code, serial, location, type or namespace is rejected (`EMPTY DATA PROVIDED`).

### Min-Max Quantity Import File

CSV with a selectable delimiter (PIPE, COMMA, SEMICOLON or TAB; sample files downloadable). Columns: `INV_ITEM_CODE`, `LOCATION_CODE`, `MIN_QTY`, `MAX_QTY`. The processor resolves the codes, marks `INV ITEM CODE is Invalid` / `LOCATION CODE is Invalid` per row, and calls the same `updateMinMaxQty` service as the Location tab for each valid row.

### Stock Aging Report — filters and columns

| Filter | Values |
|---|---|
| Item Code | Contains-match |
| Location | Multi-select |
| Date As | The balance date; ledger lines dated before it are layered |
| Item Type | BASIC_ITEM, GROUPED_ITEM, BUNDLE, COUPON, SERVICE, WARRANTY, GL_CODE, DOC_HEADER_ADJUSTMENT, MEMBERSHIP, MADE_TO_ORDER, DIGITAL_GOODS |
| Item Status | ACTIVE, INACTIVE, DELETED |
| Calculate Base On | `cost_ma` (default), `cost_replacement`, `ref_price1–3`, `delta_price1–3`, `rebate_price1–3`, … — the unit value used for the Amount columns |
| Item Category Level 1–10 | Multi-select per category slot |

Columns: Item Code, Inv Item Code, Item Name, Type, Sub Type, UOM, Location, **Aging** (the item header's `plm_display_text`, the *product aging cycle* text set by the item file import — not a computed age), then one *Qty / Amount* column pair per month. The backend (`StockReportService.fifoStockAgingRows`) replays the ledger in date order, consuming outbound quantities from the oldest inbound layers first, and `groupByMonthAndFlatten` sums the surviving layers by the month they were received. Export PDF / XLS exports the grid as shown.

## Lifecycle and effects

This is a master-data applet: it has no document type, no quantity or amount signum, no `JournalPostingTypeHandler` entry and no open-queue rows. Nothing here posts to the general ledger or moves stock.

**What it writes.**

| Action | Table(s) | Endpoint |
|---|---|---|
| Create / edit item | `bl_inv_mst_item_hdr`, `bl_inv_mst_item_ext` (`GL_CODE`, `ITEM_STATUS`, `ABBREVIATION`), `bl_inv_mst_item_line` (`MULTI_UOM`, images), `bl_inv_mst_label_link`, `bl_inv_mst_item_event` | `POST / PUT …/erp/inv/inv-items[/backoffice-ep]` |
| Company link | `bl_fi_item_comp_branch_link` | item-comp-branch-link service |
| Min / max | `bl_inv_current_location_stock_balance.qty_min_level / qty_max_level` (row created if absent) | `PUT …/update-min-max-qty/backoffice-ep`; the min/max import calls the same service |
| Serial-number import | `bl_inv_item_serial_number_import_file_hdr / _helper`, `bl_inv_serial_number_hdr` | `…/erp/inv/…/import-file-hdr` + queued processor |
| Category group / category | `bl_inv_mst_label_list_hdr`, `bl_inv_mst_label_hdr` | label-list / label services |
| Email notification | Scheduler job row for `MIN_MAX_QTY_STOCK_BALANCE_CRON_NOTIFICATION_PROCESSOR` | scheduler service |

**What it only reads.** Trace Serial No (`InventoryTransactionSubLineUow.getBySerialNumber`), Stock Card (`txn-line/stock-cards`), the Location tab's balances, the Process Template tab and the Stock Aging Report (`…/erp/reports/stock/stock-aging-report`).

**Backend validation on save** (`InventoryItemDataConsistencyObject`, thrown as `Core2DataConsistencyException`):

- `INVENTORY_ITEM_HDR_OBJECT_CODE_IS_NULL_OR_EMPTY` — blank code.
- `INVENTORY_ITEM_HDR_OBJECT_CODE_IS_ALREADY_EXISTS` — another non-deleted inventory item has the same code (on update, any *other* item with that code).
- `INVENTORY_ITEM_HDR_OBJECT_NAME_IS_NULL_OR_EMPTY` — blank name.
- `INVENTORY_ITEM_HDR_OBJECT_guid_fi_mst_item_DOES_NOT_EXIST` — `guid_fi_mst_item` set but the doc item is missing.
- `INVENTORY_ITEM_HDR_COMPOSITE_CLIENT_KEY_AND_CLIENT_SOURCE_AND_CLIENT_VALUE_ALREADY_EXISTS` — duplicate external key (ETL / EMP-synced items).
- Extension and line rows need a guid, revision and status, and the extension's header guid must match the item.

**Status.** The header `status` (ACTIVE / INACTIVE / DELETED) is what queries filter on; Doc Item Maintenance overwrites it from the doc item's status (`FiItemToInventoryItemUpdateService`). The *Status* drop-down on the Main tab writes the `ITEM_STATUS` extension instead and does not change the header status. Delete is `DELETE …/inv-items/{guid}`: after the `TNT_API_INVENTORY_ITEM_DELETE` permission check it removes the header, extensions and lines through `DbTableDao.delete` (the physical delete path, not `inactivate`), with no check for existing transactions on the server — the UI's "involved in transaction: cannot delete" guard is commented out along with the delete button.

**Linking to the doc item** is one-directional and asynchronous: `FiItemService.createFiWInvItem` queues `FinancialToInventoryItemAutoCreationProcessor` ("Upsert Inventory Items for All Basic Financial Items Created"), which copies code, code aliases, name, description, UOM, type, sub-item type, currency, scan code, EMP status and dimensions and sets `guid_fi_mst_item`. Later edits made here are not copied back to the doc item, and later doc-item edits (other than status) are not copied here.

## Related applets

- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the commercial twin; creates and links the inventory record, shares the category groups and categories, and owns the price, tax and e-Invoice data.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — show the balances, min/max levels and serial numbers keyed on this record.
- [Stock Take](/applets/inventory-workflow/stock-take-applet/) — counts against this record; scan lookups resolve the EAN codes held here.
- [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/), [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/), [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) — the documents whose ledger lines the Stock Card tab and Trace Serial No read back.
- [Stock Report](/applets/inventory-workflow/stock-report-applet/) — the other stock reports built on the same `StockReportService`.
- [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) and [Organisation](/applets/master-data/organisation-applet/) — locations, companies and branches referenced by the tabs and imports.
- [Chart of Account](/applets/master-data/chart-of-account-applet/) — the optional GL Code extension.
- [Process Maintenance](/applets/manufacturing/process-maintenance-applet/) — the process templates listed on the Process Template tab.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The **Save** button on Item Edit › Main never enables, whatever you fill in | The form declares a hidden control `currentGlCode` with `Validators.required` that nothing populates (`item-edit.component.ts`, `resetForm`), so `form.valid` is false and the button stays disabled. Category assignments, GL code, abbreviation, EAN, currency and status changes all go through this Save and are therefore blocked at commit 06aebbc | Product fix: drop the validator. Until then maintain these values from the doc item (auto-copied on creation) or through the API; multi-UOM, images, min/max and company links have their own save paths and still work |
| "Please select currency" on an item you did not create | Items created in this applet are saved without `ccy_code`; the edit form requires one | Choose a currency (the drop-down updates the control); the Save then depends on the row above |
| "An error has occured … INVENTORY_ITEM_HDR_OBJECT_CODE_IS_ALREADY_EXISTS" | Another non-deleted inventory item has the same code — often one auto-created from a doc item with that code | Search the listing for the code (status filter ACTIVE and INACTIVE); reuse or rename |
| Barcode scans find the item in one applet but not another; the stock take says the EAN does not exist while the full code works | The doc item's `scan_code` and this record's `scan_code` have diverged (only copied once at auto-creation). Customer reports traced to exactly this (customer-repo-ce5219#512, #513) | Set the same EAN Code here and on the doc item, or call `POST …/inv-items/data-fix/scan-code-mismatch/align/backoffice-ep` with the item guids to copy the doc item's code across (`GET …/inv-items/data-fix/scan-code-mismatch/query` lists the mismatches) |
| Trace Serial No returns nothing for a serial you can see on a document | Exact Match compares the whole `sn_id` and the keyword search is case-sensitive; serials entered with leading or trailing spaces on the document are stored with them (gh:bigledger/blg-intranet#4324, open) | Use Keyword Search with the visible part of the serial; correct the serial on the source document |
| Serial-number import ends FAILED with "Could not find inv_item_GUID for item …" or "THE LOCATION IS NOT FOUND" | `item_code` or `location_code` in the CSV does not match an existing inventory item / location code exactly | Fix the codes; codes are compared as stored (items are upper-cased) |
| Serial-number import FAILED with "Empty data provided: Item code, SN number, Location_code, sn_type, namespace" | One of the five mandatory columns is blank on a row | Fill every row; the helper grid shows which column errored |
| Min-max import rows show "INV ITEM CODE is Invalid" / "LOCATION CODE is Invalid" | The code could not be resolved to a guid (`updateGuidBasedOnCode`) | Correct the code; re-upload |
| Serial count at a location differs from the quantity balance | Serial-number rows, location balances and the ledger are three separate ledgers with no enforced invariant; duplicate or missing serial rows after imports or migrations are a known platform issue (gh:bigledger/blg-intranet#5347, open; #1125 added a unique constraint on the balance tables) | Use the Location tab's serial list to find the odd rows; correct with a stock adjustment, not by editing serial rows |
| Default Selection throws or does nothing | Both Default Selection screens are unbound (see *Applet settings*) | None — nothing reads those defaults |
| The Item Category toggle in Field Settings does not hide the tab | `HIDE_ITEM_CATEGORY` is saved but never read | None; product fix |
| Cannot filter the listing by Item Type | Fixed — the advanced search now has an Item Type select (gh:bigledger/blg-intranet#4048, closed) | Open the filter icon beside the search box |
| Stock Aging Report is empty | No ledger lines before *Date As* for the selected locations / categories, or the user lacks `API_TNT_DM_ERP_STOCK_REPORT_*` | Widen the filters; grant the permission |
| Min/max e-mail never arrives | The job has no recipients, is INACTIVE, or no location balance is outside its min/max; the processor logs and skips in all three cases | Check Settings › Email Notification; confirm the levels on the Location tab |
| Mobile layout, translations, audit trail | Not yet implemented (gh:bigledger/blg-intranet#4831, #5105, #5323 / #5658, all open) | — |

## Related documentation

- [Purchasing guides](/guides/purchasing-guides/) and [Creating a purchase order](/user-guide/daily-tasks/creating-purchase-order/) — where inventory items first meet a document.
- [Inventory module](/modules/inventory/) and [Core module](/modules/core/).
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — read it first; most day-to-day item maintenance happens there.
