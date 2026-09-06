---
title: "Warehouse Management System Applet"
description: "Reference for the Warehouse Management System applet — warehouses, layouts and nodes, containers, inbound receiving and putaway, the picking and packing queues, and conversion into outbound delivery orders and stock transfers."
applet_code: "warehouse_management_system_applet"
page_type: applet
applet_repo: "blg-applet-wavelet-warehouse-management-system-applet"
modules: [inventory]
related_applets: [internal-sales-order-applet, internal-outbound-delivery-order-applet, stock-transfer-applet, stock-balance-applet, stock-availability-applet, stock-reservation-applet, inv-item-maintenance-applet, organisation-applet, pricebook-applet, employee-applet, internal-purchase-grn-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/app.routing.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/inbound-process/receiving-doc-container/receiving-doc-listing/receiving-doc-listing.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/outbound-process/packing-list-container/packing-list-edit/packed-list-scan-listing/packed-list-scan-listing.component.ts
    - blg-shared-utilities/modules/settings/settings.component.html
    - blg-shared-utilities/modules/settings/feature-visibility/feature-visibility.component.html
    - blg-shared-utilities/modules/settings/feature-visibility/feature-visibility-teams/feature-visibility-teams.component.html
  fields:
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/warehouse-container/warehouse-create/warehouse-create.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/warehouse-container/warehouse-edit/layout-create/layout-create.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/warehouse-container/warehouse-edit/node-create/node-create.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/inbound-process/receiving-doc-container/receiving-doc-create/receiving-doc-main-details/receiving-doc-main-details.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/inbound-process/line-items-container/line-item-edit/line-item-details/line-item-main-details/line-item-main-details.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/warehouse-container-sub-menu/warehouse-container-create/warehouse-container-main-details/warehouse-container-main-details.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/warehouse-picker-container/warehouse-picker-create/warehouse-picker-main-details/warehouse-picker-main-details.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/outbound-process/picking-list-container/picking-list-create/main-details/main-details.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/outbound-process/packing-list-container/packing-list-create/main-details/main-details.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/space-container-allocation/space-container-allocation-create/space-container-allocation-main-details/space-container-allocation-main-details.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/settings-container/wms-item-maintenance/wms-edit-item/wms-edit-item.component.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/wms/bl_wms_grn_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/wms/bl_wms_grn_line.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/wms/bl_wms_picking_list_line.java
  lifecycle:
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/wms/WmsPostingStatusColumn.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/wms/bl_wms_putaway_list.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/wms/WmsGrnProcessingQueueService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/wms/WmsPutawayService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/wms/WMSPickPackQueueService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/wms/WmsPickingQueueToListService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/wms/ConsolidatedPackingListService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/wms/WmsPackingListHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/wms/FinancialPickPackQueueVoidProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/wms/FinancialPickPackQueueVoidProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalOutboundDeliveryOrderDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalOutboundStockTransferDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/wms/WmsPickPackQueueOutstandingUow.java
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/pick-pack-queue-container/pick-pack-queue-listing/pick-pack-queue-listing.component.ts
  troubleshooting:
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/state-controllers/receiving-doc-controller/store/effects/receiving-doc.effects.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/inbound-process/receiving-doc-container/receiving-doc-edit/receiving-doc-edit.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/outbound-process/picking-queue-container/picking-queue-listing/picking-queue-listing.component.ts
    - blg-applet-wavelet-warehouse-management-system-applet/micro-fe/projects/wavelet-erp/applets/warehouse-management-system-applet/src/app/components/space-container-allocation/space-container-allocation-create/cont-node.service.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/wms/WmsPickingCartService.java
    - gh:bigledger/blg-applet-wavelet-warehouse-management-system-applet#5
tags:
- warehouse-management
- inventory-control
- inbound-outbound
- picking-packing
- space-allocation
- putaway
weight: 170
aliases:
- /applets/warehouse-management-system-applet/
---

## Overview

The Warehouse Management System applet is the physical-fulfilment layer that sits between a
customer order and the document that actually moves stock. It records goods arriving at a
warehouse (Receiving Doc), works out which container and which shelf they go to (Processing
Queue and Putaway), keeps the map of what is stored where (Space Container Allocation), and
drives picking and packing for orders that have been pushed to the warehouse from the
[Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) applet.

It is opened by warehouse staff, supervisors and the administrator who sets up the warehouse
structure. Nothing in this applet posts a journal or writes an inventory transaction line. The
last step of the outbound flow *converts* a Packing List into a generic document — an
[Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/) or an
outbound [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — and that document
is finalised in its own applet. Stock only moves there.

The applet keeps its own tables (`bl_wms_*`), its own warehouse/layout/node hierarchy and its own
WMS item register. These are separate from the company/branch/location tree owned by the
[Organisation](/applets/master-data/organisation-applet/) applet and from the stock balances owned by
[Stock Balance](/applets/inventory-workflow/stock-balance-applet/).

## Where it fits

| Direction | Applet / document | Relationship |
|---|---|---|
| Upstream (outbound flow) | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) | Its Pick Pack Queue screen pushes order lines into this applet's Picking Queue. Nothing else fills that queue. |
| Upstream (inbound flow) | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), purchase orders, sales returns | Receiving lines can be linked to a generic document line for traceability, on the *External Generic Document* tab. |
| Upstream (master data) | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Financial/inventory items that receiving lines, picking lines and containers point at. |
| Upstream (master data) | [Organisation](/applets/master-data/organisation-applet/) | Company, branch and location used by the Packing List → Stock Transfer conversion. |
| Upstream (master data) | [Employee](/applets/master-data/employee-applet/) | Entities registered as Pickers and as the Receiving Doc person-in-charge. |
| Upstream (master data) | [Pricebook](/applets/master-data/pricebook-applet/) | The pricing scheme used when a Packing List is batch-converted into a Delivery Order. |
| Downstream | [Delivery Order (Internal, outbound)](/applets/sales-workflow/internal-outbound-delivery-order-applet/) | Created in `DRAFT` from a Packing List. |
| Downstream | [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) | Created in `DRAFT` from a Packing List's Doc Conversion tab. |
| Sibling | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | The Picking Queue shows location and company `qty_ledger` alongside each queued line. |

## Screens and menus

The applet's sidebar (`models/menu-items.ts`) is:

| Menu | Route | What it lists |
|---|---|---|
| **Warehouses** | `warehouse-listing` | Warehouse register; opening one gives *Details*, *Node Setting* and *Layout* tabs. |
| **Inbound Process › Receiving Doc** | `receiving-doc` | Receiving document headers, with a **FINAL** button on the listing. |
| **Inbound Process › Receiving Line** | `line-items` | Flat list of every receiving line across all headers. Editing a line gives *Item Details*, *Serial Number*, *Batch Number* and *Bin Number* tabs. |
| **Inbound Process › Processing Queue** | `processing-queue` | Queue rows created when a Receiving Doc is finalised; where containers are allocated. |
| **Inbound Process › Putaway List** | `putaway-list` | Putaway instructions with a process status. |
| **Inbound Process › Putaway Processing** | `putaway-processing-queue` | Open putaway tasks; a row disappears when its container is slotted. |
| **Inbound Process › Scan Session** | `scan-session` | Barcode scan session over containers and spaces (uses the browser camera through Quagga). |
| **Container Allocation › Listing** | `space-container-allocation` | Container ↔ layout-node links; create by scanning a container code and a space code. |
| **Outbound Process › Picking Queue** | `picking-queue` | Order lines pushed in from the Sales Order applet. |
| **Outbound Process › Picking List** | `picking-list` | Per-picker task lists. Tabs: *Main Details*, *Lines*, *Picking Sequence*, *Add to Cart*, *Add to Cart Scan*, *Discarded Carts*, *Outstanding Product*. |
| **Outbound Process › Packing List** | `packing-list` | Packing headers. Tabs: *Main Details*, *Account*, *Lines*, *Packed Product*, *Discarded Product*, *Doc Conversion*, *Doc Link*. |
| **Containers** | `warehouse-container` | Physical container register (pallets, totes, cages). |
| **Pickers** | `warehouse-picker` | Entities registered as pickers for a warehouse. |
| **Settings** | `settings` | See *Configuration* below. |
| **Personalization** | `personalization` | Personal Default Selection and the shared sidebar-appearance screen. |

Two routes exist with no menu entry: `space-container-allocation-report` (the *Report* item under
Container Allocation is commented out in `menu-items.ts`) and everything under `settings` that the
shared settings sidebar does not link (below).

{{< figure src="/images/warehouse-management-applet/application_settings_details_1774408664855.png" alt="Applet Settings — Application Settings, Inbound Process tab, showing the Receiving Doc Settings toggles" >}}

The Settings area is rendered by the shared `app-settings` component, which draws the applet's own
*System Configuration* group plus fixed *Server Side Permissions* and *Developer Tools* groups:

| Group | Items shown |
|---|---|
| System Configuration | Application Settings · Default Selection · WMS Item Maintenance · WMS Item Category · WMS Item Category Group |
| Server Side Permissions | Permission Wizard · Permission Set · User Permission · Role Permission |
| Developer Tools | Release Notes · Audit Trail |

{{< callout type="warning" >}}
**Release Notes and Audit Trail are dead links here.** The shared sidebar points them at
`./release-notes` and `./applet-log`; this applet's `app.routing.ts` defines neither, so the
wildcard route sends you to the 404 screen. *Feature Visibility*, *Webhook* and the client-side
permission screen have routes but no sidebar link — Feature Visibility is nevertheless what you
land on, because `settings` with no child redirects to `feature-visibility`.
{{< /callout >}}

{{< figure src="/images/warehouse-management-applet/applet_settings_listing_1774408553901.png" alt="The screen you land on when you click Settings — Feature Visibility, showing an empty Teams panel" >}}

## Configuration

### Before you can use it

| Prerequisite | Where you set it | Why |
|---|---|---|
| At least one warehouse | **Warehouses** in this applet | Every receiving, putaway, picking and packing record is keyed to a warehouse. Warehouse Code, Title, Status and Type are all `Validators.required`. |
| A layout and layout nodes per warehouse | **Warehouses › Layout / Node Setting** | Putaway rows can only be planned against a layout node. Without one, every putaway row is created as `PENDING_ALLOCATION`. |
| Containers with a scan code | **Containers** | Container allocation, the picking cart and the packed-list scan all look the container up by its scan code (`machine_code`); a container with no scan code cannot be scanned. |
| Registered pickers and packers | **Pickers** in this applet, over entities from [Employee](/applets/master-data/employee-applet/) | *Picker* is required on a Picking List and *Packer* on a Packing List. |
| Company, branch and locations | [Organisation](/applets/master-data/organisation-applet/) | The Packing List → Stock Transfer form requires company, branch, from-location, to-location and transaction date. |
| A pricing scheme | [Pricebook](/applets/master-data/pricebook-applet/) | Only for the *Batch Process DO* path, which sends `DEFAULT_PRICING_SCHEME` to the conversion. |
| Orders pushed from the sales side | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) → Pick Pack Queue → *Send to Warehouse Picking Queue* | The Picking Queue is fed only by that button. See *Troubleshooting*. |

### Applet settings

Settings are **applet-local**: `app.routing.ts` maps `settings/field-settings` to this repo's own
`FieldConfigurationComponent`, not to the shared `FieldConfigurationComponent` in
`blg-shared-utilities`. (The repo does carry the shared-utilities submodule, but only for the
settings shell, the permission screens and the personalization sidebar.) The screen is labelled
**Application Settings** in the sidebar.

All eighteen controls are declared in the form group, rendered as controls in the template, and
written by one **SAVE** button that dispatches `saveMasterSettingsInit` with the whole form value.
They are stored as one `APPLET_SETTINGS` JSON row on `bl_applet_ext` for the applet — the packed-list
scan screen reads that row back directly, which is where the storage shape is visible. Every control
starts as an empty `UntypedFormControl`, so the **default for every row below is off / unset** until
the tenant saves the screen once.

Anyone who can open Settings can change them; they are tenant-wide, not per branch and not per user.

**Inbound Process tab**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `ENABLE_AUTO_ITEM_ALLOCATION_TO_CONTAINER` | Which endpoint the **FINAL** button on the Receiving Doc *listing* calls | Off | On: FINAL calls `auto-allocate-items`, which creates containers for the received lines as well as the processing-queue rows. Off: FINAL calls the plain processing-queue insert and containers are allocated by hand in the Processing Queue. |
| `SET_ITEM_CODE_AS_CONTAINER_UPON_ALLOCATION` | The `setItemCodeAsContainerName` flag sent with both FINAL calls | Off | On: auto-created containers are named after the item code instead of a generated code. |
| `ENABLE_BUNDLE_CONFIG_UPON_FINAL` | Nothing in this applet | Off | **No effect.** The setting is declared, rendered and saved, but no component or service reads it, and no Java class reads it either. The matching backend endpoint (`wms-grn-processing-queues/bundled-items-insert`) exists and is wrapped by `PQService.insertBundledGrnProcessingQueue`, but nothing calls that method. |
| `ENABLE_CAMERA_SCANNER` | Nothing | Off | **No effect.** Not read anywhere in the applet or the backend. The Scan Session screen initialises the camera unconditionally. Turning it on only forces `ENABLE_SCAN_CODE_SEARCH` off in the form. |
| `ENABLE_SCAN_CODE_SEARCH` | Nothing | Off | **No effect**, same as above. Turning it on forces `ENABLE_CAMERA_SCANNER` off in the form. |
| `ENABLE_PUTAWAY_ALLOCATION` | The putaway-allocation control on the Processing Queue container listing | Off | On: the control is rendered (`*ngIf`), letting the operator push the container into the putaway list from that screen. |
| `ENABLE_BULK_CONTAINER_UPDATE` | The bulk container-update block on the same screen | Off | On: the bulk update panel is rendered, so several queue rows can be allocated to one container in a single action. |

**Outbound Settings tab**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `ENABLE_CONSOLIDATED_PACKING_LIST` | The consolidated-picking-list action on the Picking List listing | Off | On: `showConsolidatedPickingList` becomes true and the action appears. Note the toggle's *label* in the template reads `ENABLE_CONSOLIDATED_PACKING_LIST_CONVERSION`, but the control it is bound to is `ENABLE_CONSOLIDATED_PACKING_LIST`; the longer name is not a setting. |
| `ENABLE_MULTI_PACKING_LIST_CONVERSION` | The multi-picking-list action on the same listing | Off | On: `showMultiPickingList` becomes true. |
| `ENABLE_MANUAL_CART_SCAN` | Whether the **Add to Cart** tab is rendered on the Picking List editor | Off | On: the *Add to Cart* tab is hidden (`*ngIf="!…"`), leaving only *Add to Cart Scan*. Off: both tabs are shown. |
| `ENABLE_CART_SCAN_BY_CONTAINER` | Cart scan mode: container only | Off | On: scanning a container code creates the picking-cart rows for everything in that container. Mutually exclusive with the next row — the settings form clears one when you set the other. |
| `ENABLE_CART_SCAN_BY_CONTAINER_AND_ITEM_CODE` | Cart scan mode: container **and** item code | Off | On: the item scan-code field takes focus and a cart row is created only when every field on the form is filled. |
| `ENABLE_PACKED_LIST_SCAN_BY_CONTAINER` | Packed-product scan mode: container only | Off | On: scanning a container packs everything in it; the per-item block on the create form is hidden. Mutually exclusive with the next row. |
| `ENABLE_PACKED_LIST_SCAN_BY_CONTAINER_AND_ITEM_CODE` | Packed-product scan mode: container **and** item code | Off | On: a packed line is created per scanned item, only when every field is filled. |
| `ENABLE_PACKED_LIST_LINE_DELETE_BUTTON` | The `deleteAction` column on the packed-list scan grid | Off | On (strictly `=== true`): the delete column is made visible so a mis-scanned packed line can be removed. |
| `DEFAULT_PRICING_SCHEME` | Pricing scheme sent to *Batch Process DO* on the Packing List listing | Unset | Set: the generated Delivery Order lines are priced from that scheme. Unset: `null` is sent and the source document's prices are copied. |
| `DEFAULT_COMPANY` | Company pre-filled on the Packing List → Stock Transfer form | Unset | Set: the form's company code/GUID are patched from the company record. Unset: the operator must pick a company; the field is required. |
| `DEFAULT_BRANCH` | Branch pre-filled on the same form; also merged into the applet-settings object read by the Receiving Doc create screen and the Space Container Allocation create/edit screens | Unset | Set: branch code/GUID are patched. Unset: the required branch field stays empty. |

Two keys are read at runtime without a control on this screen:

- `DEFAULT_LOCATION` — read by the Receiving Doc create screen and by Space Container Allocation
  create/edit, which merge the personal value over the applet value. The only screens that *write*
  it are the two Default Selection screens described below, and neither works.
- `ENABLE_BRANCH_FILTER` — declared in `applet-settings.model.ts` only. Not rendered, not saved,
  not read. Not a setting.

### Default Selection (applet and personal)

`Settings › Default Selection` and `Personalization › Default Selection` render *Default Branch* and
*Default Location* drop-downs over an `APPLET_SETTINGS` extension row.

{{< callout type="warning" >}}
**Neither screen works.** Both components declare `appletContainer: AppletContainerModel` and never
assign it: the applet-level component has no subscription that would populate it, and in the personal
component the subscription that used to do so is commented out. Their value-change handlers
dereference `this.appletContainer.bl_applet_exts`, so choosing a branch or a location throws before
anything is stored; the **SAVE** button emits an `@Output` that nobody is bound to, because both
components are routed directly rather than embedded in a parent. Set `DEFAULT_BRANCH` from
**Application Settings** instead; `DEFAULT_LOCATION` currently has no working control anywhere in
the applet.
{{< /callout >}}

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Pick/pack queue push | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — Pick Pack Queue listing, *Send to Warehouse Picking Queue* | Moves `bl_fi_pick_pack_queue` rows into `bl_wms_pick_pack_queue` and deletes the finance-side rows. Until this is done, the Picking Queue here is empty. |
| Pricing scheme definition | [Pricebook](/applets/master-data/pricebook-applet/) | Supplies the scheme referenced by `DEFAULT_PRICING_SCHEME`. |
| Company / branch / location records | [Organisation](/applets/master-data/organisation-applet/) | Supply the values `DEFAULT_COMPANY` and `DEFAULT_BRANCH` point at, and the from/to locations on the stock-transfer conversion. |
| Delivery Order and Stock Transfer document settings | [Delivery Order (Internal, outbound)](/applets/sales-workflow/internal-outbound-delivery-order-applet/), [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) | Govern what happens when the document this applet created in `DRAFT` is finalised. |

### Feature visibility and permissions

- **Feature Visibility is a stub.** The shared component renders one *Teams* panel whose only content
  is a select with three hard-coded options (`Team 1`, `Team 2`, `Team 3`), an add button with no
  click handler, and a **SAVE** button with no click handler. Nothing it shows is persisted, and
  nothing in this applet reads a feature-visibility value.
- **No client-side permission codes are seeded for this applet.** `bl_applet_client_side_perm_dfn`
  in `akaun_master` has no rows joined to `bl_applet_hdr.code = 'warehouse_management_system_applet'`
  (checked 2026-09-06), and the applet source contains no `hasPermission()` calls and no
  `SHOW_*`/`HIDE_*` constants of its own. Menu items and buttons are therefore not gated per role
  from inside the applet.
- **Server-side permissions** are the standard shared screens (Permission Wizard, Permission Set,
  User Permission, Role Permission). This applet's `PermissionResolver` additionally registers the
  **Warehouse** target view, so a permission can be scoped to specific warehouses, listed by
  Warehouse Code and Warehouse Title.
- The one live `HIDE_*` reference in the applet
  (`!appletSettings.HIDE_UNIT_PRICE_STD_PRICING_SCHEME || SHOW_UNIT_PRICE_STD_PRICING_SCHEME` on the
  receiving line-link forms) reads a key that is in no settings model and a component property that
  is never declared, so the guarded UOM control is always shown. It is not a setting.

## Fields

### Warehouse

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Warehouse Code | Unique code used on every WMS record | Yes | |
| Warehouse Title | Display name | Yes | |
| Description | Free text | No | |
| Status | `ACTIVE` / `INACTIVE` | Yes | |
| Type | Warehouse classification (e.g. private, public, fulfilment centre, reverse logistics) | Yes | Stored on `bl_wms_warehouse_hdr.type`. |

### Warehouse Layout (per warehouse)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Name | Layout name | Yes | |
| Code | Layout code | Yes | |
| Floor | Floor identifier | Yes on create | Not required on the edit form. |
| Description | Free text | No | |
| Status | `ACTIVE` / `INACTIVE` | Yes | |

### Layout Node

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Node Name | Zone / rack / shelf / bin name | Yes | |
| Node Type | Node classification from the node-type register | Yes | |
| Status | `ACTIVE` / `INACTIVE` | Yes | |
| Scan code | Barcode used to identify the space when scanning | No | `bl_wms_warehouse_layout_node_hdr.scan_code`; Space Container Allocation matches on it exactly. |
| Parent node | Node this one sits under | No | Nodes form a tree of any depth via `parent_guid`. |
| Position and dimensions | `pos_x/y/z`, `dim_x/y/z`, `dim_max_weight` | No | Stored on the node row. |

### Receiving Doc — Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Doc No | Running document number | — | Disabled on the form; filled from `server_doc_1`. |
| Warehouse | Receiving warehouse | No validator | Selected by a search drop-down on the create screen. |
| Transaction Date | Delivery date | No validator | |
| PIC | Person in charge (`owner_entity_hdr_guid`) | No validator | |
| Reference | Free-text reference (`reference_no`) | No validator | |
| Description | Free text (`descr`) | No validator | |
| Tracking ID | Carrier or supplier tracking reference | No validator | |
| Status | `ACTIVE` / `INACTIVE` | No validator | Record status, not posting status. |

Editing an existing Receiving Doc adds *Account* (supplier entity, billing and shipping address),
*Lines*, *Generic Document*, *External Generic Document* (link a receiving line to a generic document
line) and *Attachments* tabs. The create screen has only *Main Details*, *Lines* and *GenDoc*.

### Receiving Line

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item | Financial, inventory or WMS item | — | Resolved into `fi_item_hdr_guid`, `inv_item_hdr_guid` or `wms_item_hdr_guid`. |
| Qty | Quantity received | Yes, minimum 1 | |
| UOM | Unit of measure | No validator | |
| Tracking ID | Supplier lot / delivery reference | No validator | |
| Split Qty | Split quantity for container allocation | Yes on the linked-line form, minimum 1 | |

Line sub-tabs:

| Tab | Fields | Notes |
|---|---|---|
| Serial Number | Serial values, entered manually, by scan, or imported with a delimiter (required on the import dialog) | |
| Batch Number | Batch No, Qty (min 1), Issue Date, Expiry Date — all required | |
| Bin Number | Bin Code, Container Measure, Container Qty, Qty (min 1) — all required | **The form has no save handler.** It validates but dispatches nothing, so nothing is stored. It does not write the bin tables used by [Stock Reservation](/applets/inventory-workflow/stock-reservation-applet/). |

### Container

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Container Code | Unique container code | No validator | |
| Container Name | Display name | No validator | |
| Split Qty | Split quantity | No validator | |
| Type | Container type (`obj_type`) | No validator | |
| Max Weight, Height, Width, Length | Physical limits (`dim_w/x/y/z`) | No validator | |
| Scan Code | Barcode (`machine_code`) | No validator | Required in practice for every scan-based flow. |
| Description | Free text | No validator | |

### Picker

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Warehouse | Warehouse the picker works in | No validator | |
| Employee | Entity registered as the picker | No validator | Stored as `bl_wms_entity_picker_label` — a link row, not a separate person record. |
| Email, Phone No. | Contact details shown on the form | No validator | |

### Picking List — Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Picking Date | Date of the picking task | Yes | |
| Picker | Registered picker | Yes | |
| Warehouse | Warehouse | Yes | |

### Packing List — Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Packing Date | Date of packing | Yes | |
| Packer | Registered picker acting as packer | Yes | |
| Warehouse | Warehouse | Yes | |
| Reference No, Tracking ID, Description, Remarks | Free text on `bl_wms_packing_list_hdr` | No validator | |

The *Account* tab requires an Entity (customer) before it can be saved.

### Packing List → Stock Transfer (Doc Conversion tab)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company | Owning company | Yes (code and GUID) | Pre-filled from `DEFAULT_COMPANY`. |
| Branch | Owning branch | Yes (code and GUID) | Pre-filled from `DEFAULT_BRANCH`. |
| From Location | Source stock location | Yes | Becomes `guid_store` on the generated document. |
| To Location | Destination stock location | Yes | Becomes `guid_store_2`. |
| Transaction Date | Document date | Yes | Defaults to now. |
| Tracking ID, Description | Copied to `tracking_id` and `doc_remarks` | No validator | |

### Space Container Allocation

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Scan Code | Scratch field used to look a record up | No | Typing a code searches containers by `machine_code` and spaces by `scan_code`, then fills the fields below. |
| Container Scan Code, Container Name | The container being placed | Yes | |
| Space Scan Code, Space Name, Space Description | The layout node it is placed in | Yes | |

### WMS Item

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Warehouse | Warehouse the WMS item belongs to | No validator | |
| Item Code, Item Name, Item Type, UOM, Description, Status | The WMS item register (`bl_wms_item_hdr`) | No validator | A WMS item is a separate record from the inventory item; receiving lines can point at either. |
| Created By / Date, Modified By / Date | Audit fields | — | Read-only on the edit form. |

WMS Item Category and WMS Item Category Group both require Category Code and Category Name; the
group form additionally requires a parameter code and parameter name.

## Lifecycle and effects

### Posting proof

| Aspect | Value |
|---|---|
| Server document type | None. `bl_wms_grn_hdr`, `bl_wms_picking_list_hdr` and `bl_wms_packing_list_hdr` are not generic documents and have no `*DataConsistencyObject` in `FinancialDocDataConsistencyObject/`. |
| Amount signum | Not applicable — no amount is posted by any WMS record. |
| Quantity signum | Not applicable — no `bl_inv_txn_line` is written by any WMS record. |
| Dr/Cr equation | None. No `JournalPostingTypeHandler` entry exists for any `bl_wms_*` table. |
| GL precedence | Not applicable. |
| Stock processor | None inside the applet. Stock moves only through the generic document the Packing List is converted into. |
| What VOID reverses | The applet has no VOID. Voiding the *source* Sales Order runs `FINANCIAL_PICK_PACK_QUEUE_VOID_PROCESSOR` (below). |

The two documents this applet creates carry the signums of their own types:

| Created document | Amount signum | Quantity signum | Created with |
|---|---|---|---|
| `INTERNAL_OUTBOUND_DELIVERY_ORDER` | `0` | `0` | `posting_status = DRAFT` — moves no stock even when finalised. |
| `INTERNAL_OUTBOUND_STOCK_TRANSFER` | `0` | `-1` | `posting_status = DRAFT` — removes stock from the *from* location when finalised in the Stock Transfer applet. |

### Inbound

1. **Receiving Doc** is created with `posting_status = DRAFT` (`WmsPostingStatusColumn` has exactly
   two values, `DRAFT` and `FINAL`). The **FINAL** button on the editor is disabled while the header
   has no lines.
2. **FINAL** sets `posting_status = FINAL` on the header and creates one
   `bl_wms_grn_processing_queue` row per receiving line. `base_bal_qty` is taken from the line's WMS
   quantity if present, otherwise the item quantity.
3. **Processing Queue.** Allocating a container updates the queue row and the container. When the
   remaining balance reaches zero the queue row is **permanently deleted** (not soft-deleted) and only
   the container is updated.
4. **Putaway.** Pushing a container into the putaway list creates a `bl_wms_putaway_list` row plus a
   `bl_wms_putaway_processing_queue` row. Process status is `PLANNED_ALLOCATION` when the container's
   `property_json.layout_node_guid` already names a node, and `PENDING_ALLOCATION` when it does not.
5. **Slotting** a container creates the `bl_wms_warehouse_layout_node_container_link` row, sets the
   putaway row to `COMPLETED_ALLOCATION`, and deletes the putaway processing-queue row.

Space Container Allocation writes the same link row directly, without going through putaway.

### Outbound

1. Order lines arrive in `bl_wms_pick_pack_queue` only when someone presses *Send to Warehouse
   Picking Queue* in the Sales Order (Internal) applet. That call copies each
   `bl_fi_pick_pack_queue` row and **deletes the finance-side row**.
2. **Picking Queue** lists those rows joined to their generic document. The listing hard-codes
   `server_doc_type: "INTERNAL_SALES_ORDER"` in both its search and its refresh, so only sales orders
   are ever shown regardless of what else was pushed in. It shows `qty_ledger` from the location and
   company stock balances beside each line.
3. **Create Picking List** groups the selected queue rows by *source document header* and creates one
   picking list per header. It then walks **every line of that document**, not only the lines you
   selected, and sets `qty_to_pick` to the line's `quantity_base` — the queue's remaining balance is
   not used. All selected WMS queue rows are deleted in the same transaction. The header is created
   with `packing_status = PENDING_PICKING`.
4. **Picking** happens through the cart screens; discrepancies are recorded on
   `bl_wms_picking_discrepancy` and discarded carts can be restored.
5. **Send to packing** creates the Packing List and sets the picking list to
   `packing_status = IN_PACKING_STATION`. Packing list lines start `UNPACKED` and become `PACKED` as
   they are scanned.
6. As quantities are packed, the *source* generic document's header and lines are moved to
   `IN_PROGRESS` and then to `COMPLETED` once everything is packed.
7. **Conversion.** From the Packing List listing, *Create DO* consolidates the selected `DRAFT`
   packing lists into one `INTERNAL_OUTBOUND_DELIVERY_ORDER`, and *Batch Process DO* creates one per
   packing list using `DEFAULT_PRICING_SCHEME`. Only lines with `packing_status = PACKED` are carried
   over. From the *Doc Conversion* tab, a Packing List becomes an
   `INTERNAL_OUTBOUND_STOCK_TRANSFER`. Both are written in `posting_status = DRAFT` and linked back
   through `bl_wms_packing_gendoc_link`.

### VOID of the source order

Voiding an Internal Sales Order queues `FINANCIAL_PICK_PACK_QUEUE_VOID_PROCESSOR`. It deletes the
order's remaining `bl_fi_pick_pack_queue` rows and its picking list — **but only while the picking
list is still `PENDING_PICKING`**. Once the list has reached `IN_PACKING_STATION` the processor does
nothing, and the picking list, the packing list and any converted document survive the void. The
processor also never touches `bl_wms_pick_pack_queue`, so rows already pulled into the warehouse
Picking Queue are left behind.

## Related applets

- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — the only source of
  Picking Queue rows, and the document whose packing status this applet updates.
- [Delivery Order (Internal, outbound)](/applets/sales-workflow/internal-outbound-delivery-order-applet/)
  — receives the draft document that *Create DO* / *Batch Process DO* produces.
- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — receives the draft outbound
  transfer produced by the Doc Conversion tab; that is the only path in this flow that moves stock.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and
  [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — supply the location
  and company `qty_ledger` columns shown on the Picking Queue.
- [Stock Reservation](/applets/inventory-workflow/stock-reservation-applet/) — separate mechanism; the
  bin tables it reserves against are **not** written by this applet.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — the items that
  receiving lines, containers and picking lines point at.
- [Organisation](/applets/master-data/organisation-applet/) — companies, branches and stock locations
  used by the conversions. Warehouses here are a *separate* hierarchy, not stock locations.
- [Employee](/applets/master-data/employee-applet/) — the entities registered as pickers.
- [Pricebook](/applets/master-data/pricebook-applet/) — the scheme referenced by `DEFAULT_PRICING_SCHEME`.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The Picking Queue is empty even though sales orders are finalised | Nothing in this applet fills the queue. Rows only appear after *Send to Warehouse Picking Queue* is pressed on the Sales Order (Internal) applet's Pick Pack Queue screen. | Push the orders from the sales side. |
| A queued document that is not a sales order never appears | The Picking Queue listing hard-codes `server_doc_type: "INTERNAL_SALES_ORDER"`. | Only sales orders can be worked in this queue today. |
| A picking list contains lines nobody selected, with the full ordered quantity | `createPickingList` groups by source document and copies every line of it, using `quantity_base` rather than the queue balance. | Select whole documents, and treat partial picking as a picking-list edit rather than a queue selection. |
| Partly-shipped orders show a picking quantity that is too high | Same cause — the outstanding balance in the queue is ignored when the list is built. | Adjust `qty_to_pick` on the picking list lines. |
| Fractional quantities are rounded down on a picking list | `qty_to_pick` and `qty_picked` are integers on `bl_wms_picking_list_line`; the value is truncated with `intValue()`. | Use a base UOM whose quantities are whole numbers for items that go through picking. |
| Turning `ENABLE_AUTO_ITEM_ALLOCATION_TO_CONTAINER` off does not stop auto-allocation | Only the **FINAL** button on the Receiving Doc *listing* honours the setting. The FINAL button inside the Receiving Doc *editor* dispatches an action whose effect always calls `insertToProcessingQueueByAutoAllocation`. | Finalise from the listing when you want the setting respected. |
| Every putaway row sits at `PENDING_ALLOCATION` | The container has no `layout_node_guid` in its `property_json`, so no node could be planned. | Allocate the container to a layout node first (Space Container Allocation), or create the layout nodes the warehouse is missing. |
| Scanning a container or a space finds nothing | The lookups match `bl_wms_container_hdr.machine_code` and `bl_wms_warehouse_layout_node_hdr.scan_code` exactly and take the first result. A container or node saved without a scan code can never be found. | Populate the scan code on the container and on the node. |
| Duplicate container/space links | The create screen calls `check-for-duplicate-links` and `check-for-duplicate-container-allocation` before saving. | Review the existing link rather than creating a second one. |
| "Customers are not the same for consolidated DO" | *Create DO* consolidates several packing lists into one Delivery Order and requires every selected header to have the same customer entity. | Select packing lists for one customer, or use *Batch Process DO*. |
| A consolidated Delivery Order is missing lines | Only packing list lines with `packing_status = PACKED` are carried into the conversion. | Scan the remaining lines into the packed list first. |
| "Financial Item not found." / "Inventory Item not found." / "WMS Item not found." on a cart scan | The scanned container line points at an item GUID that no longer resolves. | Check the container's contents; re-create the container allocation for the correct item. |
| Voiding a sales order leaves an orphan picking list | The void processor only cleans up while the picking list is `PENDING_PICKING`; after it is sent to packing nothing is removed, and it never touches `bl_wms_pick_pack_queue`. | Delete the picking or packing list manually, and clear the stale warehouse queue row. |
| Changing branch or location under Settings › Default Selection has no effect | Both Default Selection screens are unwired (see *Configuration*). | Set `DEFAULT_BRANCH` under Application Settings. There is no working control for `DEFAULT_LOCATION`. |
| Feature Visibility saves nothing | The screen is a stub with hard-coded team options and no save handler. | Use the server-side permission screens instead. |
| Settings › Release Notes or Audit Trail shows the 404 screen | The shared settings sidebar links `./release-notes` and `./applet-log`, which this applet does not route. | Expected; there is no applet log screen here. |
| Bin numbers entered on a receiving line disappear | The Bin Number tab validates but has no save handler. | Record bin placement through containers and layout nodes instead. |

## Related documentation

- [Inventory module](/modules-v2/inventory/) — where this applet sits.
- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) and
  [Delivery Order (Internal, outbound)](/applets/sales-workflow/internal-outbound-delivery-order-applet/)
  — the applets that finalise what this one drafts.
- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — the upstream applet
  that feeds the Picking Queue.
