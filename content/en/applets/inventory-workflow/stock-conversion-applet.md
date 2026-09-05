---
title: "Stock Conversion"
description: "Reference for the Stock Conversion applet — a stand-alone inventory document (not a generic document) that moves stock between items at one location in a single FINAL: what it writes to the stock ledger, which tab adds and which removes, its settings, permissions, fields and failure modes."
applet_code: "stock_conversion_applet"
page_type: applet
applet_repo: "blg-applet-wavelet-stock-conversion-applet"
modules: [inventory, manufacturing]
related_applets: [related-applets-stock-balance, stock-balance-applet, stock-availability-applet, stock-report-applet, stock-adjustment-applet, stock-take-applet, internal-packing-order-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, organisation-applet]
guides: []
sources:
  screens:
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/services/stock-conversion-pages.service.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-listing/stock-conversion-listing.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-listing/stock-conversion-listing.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/stock-conversion-create.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-edit/stock-conversion-edit.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/input-item-add.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/models/advanced-search-models/stock-conversion.model.ts
  configuration:
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/stock-conversion-create.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/main-details-create/main-details-create.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/main-details-create/main-details-create.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/input-item-add.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/input-item-add.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/resolver/permission.resolver.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/inventoryItem/InventoryStockConversionHdrController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissionsV2.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet stock_conversion_applet, 0 rows)
  fields:
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/main-details-create/main-details-create.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/main-details-create/main-details-create.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/state-controllers/draft-controller/store/reducers/hdr.reducers.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/input-item-add.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/output-items/output-items-create/output-item-add/output-item-add.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/batch-number/batch-number.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-create/input-item-add/bin-no-listing/bin-no-listing.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/input-items/input-items-listing.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/job-order/job-order-add/job-order-add.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/models/constants/sub-item-type-constants.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_stock_conversion_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_stock_conversion_line.java
  lifecycle:
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/state-controllers/stock-conversion-controller/store/effects/stock-conversion.effects.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-listing/stock-conversion-listing.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-edit/stock-conversion-edit.component.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/stock-service/stock-conversion.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/inventoryItem/InventoryStockConversionHdrController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InventoryStockConversionHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryItemDataConsistencyObjects/InventoryStockConversionHdrDataConsistencyObject.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/InventoryStockConversionPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidInventoryStockConversionPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryStockConversionToInvTxnLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/VoidInventoryStockConversionToInvTxnLineProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/InventoryTransactionLineFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/stockBalancePropertiesCalculator/StockBalancePropertiesCalculator.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryTxnLineToCurrentStockBalanceProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/custom/printable/StockConversionJasperPrintService.java
  troubleshooting:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/inventoryItem/InventoryStockConversionHdrController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryItemDataConsistencyObjects/InventoryStockConversionHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/main-details-create/main-details-create.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-create/stock-conversion-create.component.ts
    - blg-applet-wavelet-stock-conversion-applet/micro-fe/projects/wavelet-erp/applets/stock-conversion-applet/src/app/components/stock-conversion-container/stock-conversion-edit/stock-conversion-edit.component.ts
    - gh:bigledger/blg-int-general-task#8973
    - gh:bigledger/blg-applet-wavelet-stock-conversion-applet#4
tags:
  - stock-conversion
  - inventory-management
  - kitting
  - transformation
  - inventory-control
weight: 170
---

## Overview

The Stock Conversion applet records a conversion of stock at one location: a set of **Input** lines and a set of **Output** lines on one header, saved as a draft and then posted with **FINAL**. It is the tool for re-labelling, re-packing and simple kitting when no bill of materials or production order is wanted — for example turning ten single-pack accessories into one retail bundle item, or splitting a master carton into sellable units at branch `GS-KV-01`.

It is **not** a generic document: it has its own tables (`bl_inv_stock_conversion_hdr` / `_line`), its own posting endpoint and its own pair of job processors. Nothing about it passes through the sales/purchase document engine, the knock-off queue or the GL journal. What a FINAL does is append one signed line per item line to the stock ledger `bl_inv_txn_line`, and the direction of each line is fixed by the tab it was entered on — see [Lifecycle and effects](#lifecycle-and-effects), because the direction is the opposite of what the tab names suggest to most readers.

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) / [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Every line is a financial item with an inventory link; sub-item type (serial / batch / bin) decides which extra tab the line form shows |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Branch (from Default Selection) and Location (header field); the branch's main location is the fallback store |
| Upstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) / [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | What is on hand before you convert; nothing in this applet checks it |
| Upstream (optional) | MRP job orders (`bl_mrp_job_order_hdr`) | The edit form's *Job Order Link* tab links an existing conversion to job orders |
| Downstream | [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/) | FINAL writes ledger lines that the balance processor rolls into `bl_inv_current_location_stock_balance`; moving-average cost is recomputed per line |
| Downstream | [Stock Report](/applets/inventory-workflow/stock-report-applet/) | Conversion lines appear in movement reports under server document type `Stock Conversion Applet` |
| Sibling | [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) | The generic-document way to add or remove stock with a reason; use it when only one item changes |
| Sibling | [Packing Order (Internal)](/applets/manufacturing/internal-packing-order-applet/) | The production-side way to build kits from a packing list |

Modules: Inventory (the applet's home) and Manufacturing (light kitting without a production order).

## Screens and menus

One menu item, **Stock Conversion**, opens the listing. **Settings** has *Application Settings*, *Default Selection* and *Printable Format Settings* under System Configuration, then the shared server-side permission screens (Permission Wizard, Permission Set, User Permission, Role Permission), Team access and the developer tools. **Personalization** has *Default Selection* and *Sidebar*.

{{< figure src="/images/stock-conversion-applet/stock-conversion-settings.png" alt="Stock Conversion applet Settings page showing Application Settings, Default Selection, Printable Format Settings and the server-side permission screens" caption="Settings: three applet-level pages plus the shared permission screens. Only Default Selection changes anything (see Configuration)." >}}

### Stock Conversion Listing

ag-grid listing with columns *Posting Status* (blank shown as `DRAFT`), *Conversion Code*, *Conversion Name*, *Location*, *Txn Date*, *Status*, *Created By*, *Date Created*, *Updated By*, *Date Updated*. A **FINAL** button above the grid posts every ticked row that is not yet FINAL and has status `ACTIVE`, one request per row. The **+** button opens the create form; clicking a row opens the edit form. The search box matches code, name and description (`ILIKE`); the advanced search adds *Code*, *Name*, *Description*, *Created Date* and *Updated Date* ranges. There is no print, void, discard or delete action on the listing or the forms.

### Create / Edit form

Tabs **Main Details**, **Input**, **Output**; the edit form adds **Job Order Link**. Header buttons: *RESET*, *SAVE*, and on the edit form *FINAL* (shown while the document is not FINAL and its status is `ACTIVE`). SAVE is disabled until Main Details is valid **and** both the Input and the Output tab have at least one line. After FINAL every Main Details control is disabled and SAVE / RESET stay disabled.

Each line is added through a three-step side panel — *Search Item* → *Item Details* (Item Code, Item Name, UOM, Quantity Base, Remarks) → extra tabs by sub-item type: **Serial Number** (scan / import), **Batch Number** (batch no., quantity, issue and expiry dates) or **Bin Number** (bin list with container quantity and base quantity). Input and Output lines use the same panel; only the sign applied to the quantity differs.

The two listing captures that used to sit here were removed (test data with people's names); a recapture from a demo tenant is on the lane's list.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| A **Default Branch** saved in this applet's Settings › Default Selection | This applet | The branch drop-down is commented out of the Main Details form, so the header's branch comes only from `DEFAULT_BRANCH`; without it the required `branch` control never fills and SAVE stays disabled (`main-details-create.component.ts` L64–L82, `.html` L3–L8) |
| Branch and location | [Organisation](/applets/master-data/organisation-applet/) | Location is a required header field; the branch's `MAIN_LOCATION` is the backend fallback store |
| Items with an inventory link | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | A line whose item has no `inv_item_hdr_guid` (and no item links) produces no ledger line — the conversion posts but stock does not move (`InventoryTransactionLineProcessorService` L72–L92) |
| Stock on hand for the Output lines | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Output lines subtract from the ledger; nothing here blocks a negative balance |
| Server-side permissions on the stock-conversion header | Settings › Permission Wizard (this applet) | `CREATE` to save, `UPDATE` to edit, `READ` (or `_ADMIN` / `_OWNER`) to open and to FINAL — see [Feature visibility / permissions](#feature-visibility--permissions) |
| A running-number counter (optional) | Backend `app_sequence_counter`, module `STOCK_CONVERSION_NO` | Filled by the backend when `stock_conversion_no` is blank; the applet never shows it — the user-visible *Conversion Code* is the free-text `code` column |

### Applet settings

Settings are **applet-local**: `app.routing.ts` routes `settings/field-settings` to the applet's own `FieldConfigurationComponent`, `settings/default-selection` to `DefaultSettingsComponent` and `personalization/personal-default-selection` to `PersonalDefaultSettingsComponent`; the shared `FieldConfigurationComponent` from blg-shared-utilities is imported but never routed. Anyone who can open Settings can change them (no permission check on the routes).

| Setting | Screen | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| `DEFAULT_BRANCH` | Settings › Default Selection › *Default Branch* | Header branch of every new conversion (the form has no branch control) | null (control starts empty) | New conversions save with this branch; existing drafts keep theirs. Required in practice — see above |
| `DEFAULT_LOCATION` | Settings › Default Selection › *Default Location* | Pre-selects the header *Location* on a new conversion | null; auto-filled with the branch's `MAIN_LOCATION` extension when a branch is picked | New conversions open with this location selected; the user can still change it |
| `PRINTABLE` | Settings › Printable Format Settings › *set default* | Stored default printable-format guid | null | Persisted to master settings, but the applet has no print action, so it has no effect in the current build |

`DEFAULT_COMPANY` is written alongside the two defaults (patched from the selected branch's `comp_guid`) and read into `main-details-create.component.ts`, but nothing uses the value — lines are saved without a company guid.

**Personalization › Default Selection** renders the same Default Branch / Default Location pair and saves them as *personal* settings (`savePersonalSettingsInit`), but no form component subscribes to `selectPersonalSettings` — the personal values are stored and never applied. Only the applet-level defaults take effect.

**Application Settings (Field Settings) is a stub.** The template shows eight `mat-slide-toggle`s (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) with no `formControl` binding and a SAVE button with no click handler; the component's form holds one control, `HIDE_LAST_PURCHASE_PRICE`, whose toggle is commented out. Nothing on this screen can be changed or saved.

**Keys read at runtime without a control.** The line forms read the applet's master settings and hide controls when these keys are `true`: `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` (hides the UOM selector — `main-details.component.html` L33), `HIDE_QTY_BASE` (hides *Quantity Base*, L44) and `HIDE_BIN` (hides the *Bin Number* tab — `input-item-add.component.html` L26). No screen in this applet writes them; they would only take effect if a value were stored for `stock_conversion_applet` by other means. The `AppletSettings` interface also declares the usual document-applet keys (`ENABLE_*`, custom statuses, `HIDE_UNIT_PRICE_*`, `HIDE_AMOUNT_*`, `HIDE_TAX_CONFIG_SELECTION` …); apart from the three above they are read by the line component's template-less price logic only and change nothing visible.

### Document behaviour settings

None exposed. Posting status is driven by the FINAL button and the backend; there is no custom-status, approval, e-Invoice or numbering toggle in the applet.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Item `txn_type` and item links | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | `BASIC_ITEM` with an inventory link → one ledger line; `PACKAGE` → one ledger line per linked inventory item, quantity × link ratio (`InventoryTransactionLineFactory` L176–L194); no link → no ledger line |
| Item `sub_item_type` | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | `SERIAL_NUMBER`, `BATCH_NUMBER`, `BIN_NUMBER` add the matching tab to the line panel; `BASIC_QUANTITY` shows none |
| Branch `MAIN_LOCATION` | [Organisation](/applets/master-data/organisation-applet/) › Branch | Backend fallback store when the header has no location (`InventoryTransactionLineFactory` L204–L206); also what Default Selection copies into *Default Location* |
| Job-processor subscriptions (`bl_applet_trigger_template_processor_link`) | Server configuration | `INVENTORY_STOCK_CONVERSION_TO_INV_TXN_LINE_PROCESSOR` must subscribe to `BLG_ERP_INVENTORY_STOCK_CONVERSION_PRIMARY_PROCESSOR`, and `INVENTORY_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` to it, for a FINAL to reach the balance |

### Feature visibility / permissions

**Server-side.** Header endpoints under `core2/tnt/dm/erp/inventory-stock-conversion-hdrs` (`InventoryStockConversionHdrController`): `POST /backoffice-ep` needs `API_TNT_DM_ERP_INVENTORY_STOCK_CONVERSION_HDR_CREATE`; `PUT /backoffice-ep` needs `_UPDATE`; `DELETE /backoffice-ep/{guid}` needs `_DELETE`; `GET` list / by guid / query and `PUT /backoffice-ep/update-posting-status/{guid}` (FINAL) need `_READ`; `PUT /discard/backoffice-ep/{guid}` needs `_UPDATE`; `_OWNER` and `_ADMIN` cover everything (`withAdminPerm`, L67–L70). `PUT /backoffice-ep/void/{guid}` and `POST /batch-print-jasper-pdf/backoffice-ep` carry no permission check beyond authentication. Line endpoints (`inventory-stock-conversion-lines`, read-only) use the `..._LINE_*` codes in `TntErpPermissionsV2`; job-order links use `..._JOB_ORDER_LINK_*`. None of the header permissions is targeted (no branch / location scoping).

**Client-side.** The line components check `SHOW_COSTING_DETAILS`, `SHOW_QTY_BASE`, `SHOW_UNIT_PRICE_STD_PRICING_SCHEME` and the rest of the `SHOW_UNIT_PRICE_* / SHOW_AMOUNT_* / SHOW_*_CONFIG_SELECTION` family as the re-enable half of the `HIDE_*` pairs. None is seeded: `bl_applet_client_side_perm_dfn` has no rows for `stock_conversion_applet`, so the Client Side Permission screen has nothing to assign and the `HIDE_*` keys, if ever set, cannot be reopened per role.

## Fields

### Main Details tab

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Location | Store the conversion happens in; saved to `hdr.location_guid` and copied to every line's `guid_store` on save | Yes (form) | Pre-filled from `DEFAULT_LOCATION`. Disabled after FINAL |
| Conversion Code | Free text → `hdr.code`; shown as *Conversion Code* in the listing | Yes (form) | Not checked for uniqueness by the DCO (two conversions can share a code). Distinct from the backend `stock_conversion_no` running number, which is filled by the backend and never displayed |
| Conversion Name | Free text → `hdr.name` | Yes (form) | — |
| Transaction Date | `hdr.date_txn`, the *Txn Date* column | No | Date picker only; ledger lines take their own `date_txn` from the line (set to *now* when the line is added), not from this field |
| Description | `hdr.descr` | No | Searched by the keyword box |
| *(hidden)* Branch | `hdr.branch_guid` from `DEFAULT_BRANCH` | Yes (form, `Validators.required`) | No control is rendered — see [Before you can use it](#before-you-can-use-it) |

The header also has `job_order_hdr_guid`, `process_guid`, `machine_guid`, `duration`, `process_type_code` (options SEQUENTIAL / PARALLEL / CYCLIC / CONDITIONAL exist in `options.ts`), `start_date`, `end_date` and `void_reason` columns; none is rendered by the form.

### Input and Output tabs — line panel

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item (search) | Financial item chosen from the shared item search (`search_word` keyword) | Yes | Item code and name are copied to the line; item type and sub-type are copied to `item_txn_type` / `item_sub_type` |
| Item Name | Editable copy of the item name → `item_name` | No | — |
| UOM | Unit selector (`app-uom`) → `uom`, `uom_to_base_ratio` | No | Hidden when `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` is true |
| Quantity Base | Quantity in base units → `quantity_base` | Yes | `Validators.min(1)` — zero and negatives are rejected client-side. Stored **positive** on Input lines and **negative** on Output lines (`AppletConstants.amount_signum_input = 1`, `amount_signum_output = −1`); `quantity_signum` is always `1`; `amount_signum` is always `0` |
| Remarks | `item_remarks` | No | — |
| Serial Number tab | Scan or import serial numbers → `serial_no.serialNumbers` | When sub-type is `SERIAL_NUMBER` | The panel does not check that the count matches Quantity Base |
| Batch Number tab | Batch no., quantity (min 1), issue date, expiry date → `batch_no.batches` | When sub-type is `BATCH_NUMBER` | Issue date after expiry is flagged (`dateInvalid`); a running total of batch quantities is shown but not enforced against Quantity Base |
| Bin Number tab | Bin list with container quantity and base quantity → `bin_no.bins` | When sub-type is `BIN_NUMBER` | Hidden when `HIDE_BIN` is true |

There is **no price or amount control** on the line panel (`main-details.component.html` is 68 lines: Item Code, Item Name, UOM, Quantity Base, Remarks). The component still computes `unit_price_*`, `amount_std/net/txn` from its hidden form controls and saves them; with no user input they are empty or zero. Line grids on the Input / Output tabs show *Item Code*, *Item Name*, *UOM*, *Qty* (signed `quantity_base`) and *Last Updated*.

### Job Order Link tab (edit form only)

Links the saved conversion to MRP job orders through `inventory-stock-conversion-job-order-links` (columns *Job Order No*, *Item Code*, *Container Measure*, *Container Qty*, *Priority*, *Remarks*). The link table validates only that the header and job order exist; nothing in the posting chain reads it.

## Lifecycle and effects

**Statuses.** `posting_status` is null (shown `DRAFT`) → `FINAL` → `VOID`; `DISCARDED` exists on the backend. `status` is `ACTIVE` (DCO default) and is never changed by the applet.

| Transition | Who | Backend rule |
|---|---|---|
| Save (create / edit) | SAVE button → `POST` / `PUT …/backoffice-ep` | `InventoryStockConversionHdrDataConsistencyObject`: guid, status, revision, created/updated by and dates must be present (filled by `fillMissingData…`); `job_order_hdr_guid`, `process_guid`, `machine_guid` must exist if given; `stock_conversion_no` is generated from `app_sequence_counter` when blank. No line-level validation (no quantity, item or duplicate-code check) |
| FINAL | FINAL button (listing batch or edit form) → `PUT …/update-posting-status/{guid}` with `{"posting_status":"FINAL"}` | Rejected with HTTP 403 *"Inventory Stock has already been posted to FINAL"* if already FINAL (controller L161–L163); otherwise the header is updated and one `BLG_ERP_INVENTORY_STOCK_CONVERSION_PRIMARY_PROCESSOR` event is queued `RUN_NOW` (`InventoryStockConversionHdrService.updatePostingStatus` L42–L61) |
| VOID | No UI. `PUT …/backoffice-ep/void/{guid}` with `posting_status` and optional `void_reason` | `Core2BadRequestException("Internal Stock Conversion cannot be void!")` unless posting status is FINAL (controller L347–L349); then `VOID` + `void_reason` are saved and `BLG_ERP_VOID_INVENTORY_STOCK_CONVERSION_PRIMARY_PROCESSOR` is queued |
| Discard | No UI. `PUT …/discard/backoffice-ep/{guid}` | `Core2BadRequestException("Internal Stock Conversion cannot be discarded!")` if posting status is FINAL or VOID, or status not ACTIVE / DRAFT (L321–L324); otherwise `posting_status = DISCARDED` |
| Delete | No UI. `DELETE …/backoffice-ep/{guid}` | Soft delete through the Uow; no posting-status guard in the controller |

**Posting proof block.**

- *Server document type:* the lines carry the literal `Stock Conversion Applet` in `server_doc_type` and `client_doc_type` (`AppletConstants.docType`); there is no `ServerDocTypes` enum entry and no `*DataConsistencyObject` signum for it.
- *Quantity signum:* `1` on every line, set by the applet, copied by the factory (`InventoryTransactionLineFactory` L255). Direction lives in the **sign of `quantity_base`**: Input lines are stored `+qty`, Output lines `−qty` (`input-item-add.component.ts` L150, `output-item-add.component.ts` L148).
- *Amount signum:* `0` — no value moves; the applet has no journal.
- *Balance equation:* `qty_ledger(new) = qty_ledger(prev) + quantity_signum × quantity_base` (`StockBalanceHelper.calculateResultBalance` L46–L50, `StockBalancePropertiesCalculator` L75–L78). **An Input line therefore increases the location balance and an Output line decreases it.** Serial numbers on a line with a positive product are created, on a negative product deleted (`InventoryTransactionLineFactory` L269–L275); bins likewise (`InventoryTxnLineToCurrentStockBalanceProcessor` L361–L374). Read the tabs as *Input = into stock, Output = out of stock*.
- *Moving-average cost:* recomputed per ledger line from the line's `amount_txn` (`StockBalanceHelper.calculateCostMaAmountPerTransaction` L145–L169). Because the applet writes no price, an Input line enters stock at zero value and lowers the location's moving-average cost; an Output line leaves at the running average.
- *GL precedence:* not applicable — no journal is posted (`posting_journal` on the header is never set).
- *Stock processor chain:* FINAL → `BLG_ERP_INVENTORY_STOCK_CONVERSION_PRIMARY_PROCESSOR` (fan-out to subscribers) → `INVENTORY_STOCK_CONVERSION_TO_INV_TXN_LINE_PROCESSOR`: skips the whole document if `posting_inventory` is already set (`checkCanInventoryBePosted`), builds one `bl_inv_txn_line` per line with non-zero `quantity_signum` whose item resolves (`createInventoryTxnFromStockConversion` L72–L92), store = header `location_guid` → line branch's main location → header branch's main location (factory L204–L206), sets `posting_inventory = POSTED`, then triggers `INVENTORY_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` per line. No knock-off queue, no open-queue row, no tax, no e-Invoice.
- *What VOID reverses:* `VOID_INVENTORY_STOCK_CONVERSION_TO_INV_TXN_LINE_PROCESSOR` rebuilds the same lines, negates them (`negateInventoryTransactionLineContainer`), sets `txn_code = VOID`, creates them **only if** `posting_inventory` was `POSTED`, sets `posting_inventory = VOID`, and per line queues `BackdatedInvTxnLineRecalculationProcessor`, recalculates future BF/CF and refreshes the balance / serial / bin / batch rows. Nothing is deleted.

**Printing.** `POST …/batch-print-jasper-pdf/backoffice-ep?printableFormatHdrGuid=…` renders selected headers through `StockConversionJasperPrintService` (a `GenericDocumentJasperPrintService` subclass). Printable formats can be uploaded under Settings › Printable Format Settings, but no screen in the applet calls the print endpoint.

## Related applets

- [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/) — where conversion lines join the other 25 stock-moving document types and the processor chain.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) — see the result of a FINAL per item and location; conversions do not show as documents there.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — same balance with open orders; a draft conversion is invisible to it (no open-queue rows).
- [Stock Report](/applets/inventory-workflow/stock-report-applet/) — movement reports list conversion lines under server document type `Stock Conversion Applet`.
- [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) — the generic-document alternative with a reason code and, unlike this applet, a journal.
- [Stock Take](/applets/inventory-workflow/stock-take-applet/) — count after a conversion to confirm the on-hand figures.
- [Packing Order (Internal)](/applets/manufacturing/internal-packing-order-applet/) — production-side kitting from a packing list.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — item links, package ratios and sub-item types that decide what a line posts.
- [Organisation](/applets/master-data/organisation-applet/) — branches, locations and the branch main location.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| SAVE stays greyed out on a new conversion although Location, Code and Name are filled and both tabs have lines | The hidden `branch` control is required and is filled only from `DEFAULT_BRANCH`; no Default Branch has been saved for the applet (`main-details-create.component.ts` L65, L79) | Settings › Default Selection › pick a Default Branch › SAVE, then reopen the create form |
| SAVE greyed out with one tab empty | SAVE requires at least one Input **and** one Output line (`disableButton()` / `disableSave()`) | Add a line on the empty tab; a one-sided movement belongs in [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) |
| After FINAL the item I put on the **Input** tab went *up* and the **Output** item went *down* | By design of the code: Input lines are stored with `+quantity_base`, Output lines with `−quantity_base`, and the ledger adds `signum × base` | Enter the item being removed from stock on **Output** and the item being created on **Input**; if the document is already FINAL, VOID it through the API (no UI) or post a reversing conversion |
| Toast *"Inventory Stock has already been posted to FINAL"* (HTTP 403) | FINAL sent twice — the listing's batch FINAL includes rows whose grid data is stale, or the edit form's FINAL was clicked after a listing FINAL | Refresh the listing; the document is already posted |
| FINAL succeeded but Stock Balance did not change | (a) the line's item has no inventory link — no ledger line is built; (b) `posting_inventory` was already set from an earlier run, so the processor skipped the document; (c) the tenant's job-template subscriptions do not link the conversion processor chain | (a) fix the item in Inventory Item Maintenance and post a new conversion; (b)/(c) check `posting_inventory` on the header and the processor subscriptions with the server team; the refresh endpoint on the hub page rebuilds the balance once lines exist |
| Location's moving-average cost dropped after a conversion | Input lines carry no amount, so each one enters stock at zero value and dilutes the average (`calculateCostMaAmountPerTransaction`) | Expected in the current build; correct the cost with a Reset Moving Average Cost entry (see the hub page) or record the receipt through a costed document instead |
| Serial-number balances wrong after a conversion | Serial numbers on an Input line are *created* (product of signum and base > 0) and on an Output line *deleted* (`InventoryTransactionLineFactory` L269–L275); the line panel does not check that the serials exist or that their count equals Quantity Base | Put the serials being removed on Output and the new ones on Input, with counts equal to Quantity Base; correct an already-posted mismatch through Stock Adjustment |
| Two conversions with the same Conversion Code | The DCO checks only that a code-independent running number exists; `code` is free text | Use the search by Created Date to tell them apart; agree a numbering convention — the applet does not enforce one |
| Cannot find a VOID, Discard, Delete or Print button | None exists in the applet; the backend endpoints exist (see Lifecycle) | Use the API, or leave the document and post a reversing conversion |
| Form unusable on a phone | Mobile layout was reworked in 2026-08 (gh:bigledger/blg-int-general-task#8973) | Update to the current build |

## Related documentation

- [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/) — the processor chain this applet feeds and the refresh / recalculation jobs
- [Inventory module](/modules-v2/inventory/) and [Manufacturing module](/modules-v2/manufacturing/) — where the applet is listed
- [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) — when a single-item correction is the better tool
