---
title: "Stock Reservation Applet"
description: "Reserve a quantity of one inventory item at one location for a customer, with an expiry date, so that stock availability shows it as promised; optionally pin the reservation to warehouse bins."
applet_code: "stock-reservation-applet"
page_type: applet
applet_repo: "blg-applet-wavelet-stock-reservation-applet"
modules: [inventory, manufacturing]
related_applets: [stock-availability-applet, stock-balance-applet, related-applets-stock-balance, warehouse-management-applet, internal-sales-order-applet, internal-packing-order-applet, stock-replenishment-applet, inv-item-maintenance-applet, customer-maintenance-applet, organisation-applet]
guides: []
sources:
  screens:
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-listing/stock-reservation-listing.component.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-create/stock-reservation-create.component.html
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-edit/stock-reservation-edit.component.html
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/bin-reservation-container/bin-reservation-listing/bin-reservation-listing.component.html
  configuration:
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/models/constants/printable-format-constants.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/resolver/permission.resolver.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/personalization/personalization.component.html
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/inventoryItem/InventoryStockReservationHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/InvBinReservationGenDocLinkController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunTenantPermissionsV3.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/ExpiredStockReservationRemovalProcessorProperties.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/inventory/TemporaryReservedStockRemovalProcessorProperties.java
  fields:
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-create/main-details/main-details.component.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-create/main-details/main-details.component.html
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-create/main-details/line-item/line-search-item/line-search-item.component.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-create/account/account.component.html
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-create/bin-reservation-listing/bin-reservation-listing.component.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-create/bin-reservation-listing/select-bin-no/select-bin-no.component.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/bin-reservation-container/bin-reservation-create/main-details/main-details.component.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/bin-reservation-container/bin-reservation-create/main-details/main-details.component.html
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/state-controllers/draft-controller/store/reducers/hdr.reducers.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/state-controllers/bin-draft-controller/store/reducers/link.reducers.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_stock_reservation_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/bl_inv_bin_reservation_gen_doc_link.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryItemDataConsistencyObjects/InventoryStockReservationHdrDataConsistencyObject.java
  lifecycle:
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/state-controllers/stock-reservation-controller/store/effects/stock-reservation.effects.ts
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/components/stock-reservation-container/stock-reservation-edit/stock-reservation-edit.component.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/stock-service/stock-reservation.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/stock-service/stock-reservation-update-status.service.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/StockReservationStatusColumn.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/inventoryItem/InventoryStockReservationHdrController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InventoryStockReservationHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InventoryStockReservationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/InventoryItemUows/InventoryStockReservationHdrUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryStockReservationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/stockAdjustment/ExpiredStockReservationRemovalProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/TemporaryReservedStockRemovalProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockSummaryService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/binUows/BinUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/utils/RunningNumberGeneratorUtil.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InventoryStockReservationHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryItemDataConsistencyObjects/InventoryStockReservationHdrDataConsistencyObject.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/stockAdjustment/ExpiredStockReservationRemovalProcessor.java
    - blg-applet-wavelet-stock-reservation-applet/micro-fe/projects/wavelet-erp/applets/stock-reservation-applet/src/app/models/advanced-search-models/stock-reservation.model.ts
    - gh:bigledger/blg-applet-wavelet-stock-reservation-applet#1
tags:
- inventory-management
- stock-reservation
- demand-planning
- order-fulfillment
- warehouse-control
weight: 120
aliases:
- /applets/stock-reservation-applet/
---

## Overview

The Stock Reservation applet records a promise: *this many units of this item, at this location, are held for this customer until this date*. A reservation does not move stock and posts nothing to the ledger; when it is set to **RESERVED** it adds its quantity to the *reserved* column of the stock balance, and the [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) screens subtract that column from what can still be sold. It is opened by sales or warehouse staff who need to hold stock ahead of a sales order, and it is also written to by the Sales Order, Job Order and Packing Order applets when they reserve stock or bins for a document.

For items tracked by warehouse bin, a reservation can be pinned to specific bin lines, and the applet's second menu, **Bin Reservation**, lets you create a bin-level hold against a sales order line on its own.

## Where it fits

| Position | Applet / object | Why |
|---|---|---|
| Master data | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | The item picker lists only inventory items that have stock at the chosen location. |
| Master data | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | Every reservation must name a customer entity (Account tab). |
| Master data | [Organization](/applets/master-data/organisation-applet/) | Company, branch and location the stock is held at. |
| Master data | [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) | Bin headers and lines that a bin reservation points at. |
| Upstream (writers) | [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), Job Order (no wiki page yet), [Packing Order](/applets/manufacturing/internal-packing-order-applet/) | Create, reserve and release reservations and bin links through the same backend endpoints. |
| Downstream (readers) | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/) | Read the reserved quantity from the balance row or sum the RESERVED headers. |
| Background | Scheduler crontab | The expiry job only runs if a crontab entry for it exists (see Lifecycle). |

See [Related applets: stock balance](/applets/inventory-workflow/related-applets-stock-balance/) for the full map of what writes and reads the balance tables.

## Screens and menus

**Sidebar:** *Stock Reservation* (default screen) and *Bin Reservation*. The route is `applet/tnt/wavelet/erp/stock-reservation-applet`. A *Sales Group* menu exists in the source but is commented out.

**Stock Reservation Listing** — columns Doc No, Item Name, Branch, Location, UOM, Reserved Qty, Status, newest first. Click a row to open it in *Edit Stock Reservation*; the **+** button opens *Create Stock Reservation*.

{{< figure src="/images/stock-reservation-applet/reservation-listing.png" alt="Stock Reservation Listing" caption="Stock Reservation Listing — one RELEASED reservation. Doc No is a plain running number." >}}

**Create / Edit Stock Reservation** — three tabs:

- *Main Details* — Branch, Location, Item Name (opens the *Select Item* column), Item Code, Reserve Qty, UOM, Reservation Expiry (date), Serial Number, Status, CRM Contract, Description.
- *Account* — sub-tabs *Entity Details* (Entity Id opens *Select Customer*, which also lets you create a customer without leaving the applet), *Bill To* and *Ship To*.
- *Bin Number* — only shown when the selected item's sub-type is `BIN_NUMBER`; a grid of bin lines with **+** (opens *Select Bin No*) and a delete button.

The header buttons are **CREATE** (create), and on edit **RESERVE** (TMP or DRAFT), **RELEASE** (RESERVED) and **SAVE**; a **DELETE** button sits under the Main Details tab unless the reservation is RESERVED. Reserve, Release and Delete are two-click confirmations ("CLICK AGAIN TO …", reset after 3 seconds).

{{< figure src="/images/stock-reservation-applet/reservation-details.png" alt="Edit Stock Reservation — Main Details" caption="Edit Stock Reservation on a RELEASED reservation: Branch, Location, Item and Status are read-only; SAVE is disabled." >}}

**Bin Reservation Listing / Create / Edit** — a single *Main Details* tab: Sales Order Number (picker over sales-order lines showing their MRP statuses), Customer, Branch, Location, Item Code (picker), Item Name, Bin Hdr Code / Bin Line Code (picker, enabled once item and location are set), Container Measure, UOM, Reserved Container Qty, Reserved Base Qty, Reservation Type, Start Date, Expiry Date, Remarks.

**Settings** (gear): *Application Settings*, *Default Selection*, *Printable Format Settings*, plus the shared Triggers (webhook), Permission Set / User / Role permission and Applet Access screens. **Personalization:** *Field Settings* and *Default Selection*.

## Configuration

### Before you can use it

- **Company, branch and location** exist in [Organization](/applets/master-data/organisation-applet/). The backend rejects a reservation whose company or location is missing (`INV_STOCK_RESERVATION_HDR_GUID_COMP_IS_NULL_OR_EMPTY`, `…_GUID_STORE_IS_NULL_OR_EMPTY`) or does not exist (`…_DOES_NOT_EXIST`); branch is optional but must exist if given.
- **Inventory items with stock at that location.** The *Select Item* column queries the item-pricing-stock-balance endpoint with `txn_class = PNS`, `txn_types = BASIC_ITEM, BUNDLE`, `basic_qty_ledger_greater_than = 0` and `stock_location_guid` = the chosen location, so an item that has never had a positive ledger quantity there cannot be reserved. Set items up in [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/).
- **A customer entity** — the create form's `entity_guid` control is required, so CREATE stays disabled until a customer is chosen on the Account tab ([Customer Maintenance](/applets/master-data/customer-maintenance-applet/)).
- **Bins** (only for bin-tracked items) — bin headers and lines for the item at the location, maintained in [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/).
- **Server-side permissions** — see *Feature visibility / permissions* below.
- **A Scheduler crontab** for `EXPIRED_STOCK_RESERVATION_REMOVAL_PROCESSOR` if you want expiry dates to do anything (see Lifecycle). Nothing in the backend schedules it by itself.

No GL code, tax code, cashbook or document-numbering setup is needed: a reservation posts no journal, and its Doc No comes from the platform sequence counter for the reservation table, not from the document-numbering configuration.

### Applet settings

Where settings live (from `app.routing.ts` and the settings container): *Application Settings* is the **shared** `FieldConfigurationComponent` from blg-shared-utilities (submodule pinned at 0614ae3, 2026-01-19); *Default Selection* and the personal *Default Selection* are **applet-local** components; there is no branch-level settings screen. Anyone who can open the applet's Settings menu can change them; the applet has no client-side permission gating of its own.

**No applet setting is consumed by this applet.** Every settings read in the applet was checked (plain-grep second pass for each key in `applet-settings.model.ts`, `selectMasterSettings`, `selectPersonalSettings`, `appletSettings`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `HIDE_*`, `ENABLE_*`, `PRINTABLE`): the only reads are inside the settings screens themselves. The screens below render and save values that nothing in this applet reads back.

| Screen | What it renders | Saved to | Read by |
|---|---|---|---|
| Settings → Application Settings | The whole shared document-settings form. Because no tab mapping or `appletCode` gate in the shared template targets `stock-reservation-applet`, the untargeted controls all render: 208 at the pinned submodule commit, 297 at shared-utilities HEAD (gates.py, both commits). Examples: `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `DEFAULT_POSTING_STATUS`, `WORKFLOW_PROCESS_GUID`, `EMAIL_SENDER`. | Applet master settings (`saveMasterSettingsInit`) | Nothing in this applet. The reservation form has no line grid, pricing, workflow, e-mail or printing code. |
| Settings → Default Selection | *Default Branch*, *Default Location* (auto-filled from the branch's `MAIN_LOCATION` when a branch is picked); `DEFAULT_COMPANY` is set silently from the branch. | Applet master settings | Nothing. The create form starts from an empty draft (`initState`: all nulls, `posting_status = "DRAFT"`, `quantity_base = 0`); it never reads the master or personal settings. |
| Settings → Printable Format Settings | Upload / star printable formats; the chosen one is stored in the applet extension parameter `STOCK_RESERVATION_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_STOCK_RESERVATION`. | Applet ext | Nothing — the applet has no print or export button (checked every template outside the settings folder). |
| Personalization → Default Selection | Same two drop-downs, labelled "This will override Applet Default Settings". | Personal settings (`savePersonalSettingsInit`) | Nothing. |
| Personalization → Field Settings | Menu entry only: the personalization routes have no `field-settings` child, so the link lands on the applet's 404 page. | — | — |

An applet-local `field-configuration` component (Lines Settings: Unit Discount, SST/VAT/GST, WHT, Blanket Order; Department Settings: Segment, G/L Dimension, Profit Center, Project) also exists in the repo, but it is not routed and its toggles are unbound — it is dead code, not a setting.

### Document behaviour settings

None are configurable in the applet. The behaviour is fixed in code:

- New reservations start as **DRAFT** (form initial value); the Status drop-down also offers **TEMP** (`TMP`). RESERVED and RELEASED are shown read-only once reached.
- If a caller creates a header without a posting status, the backend defaults it to `TMP` (`fillMissingDataForCreation`).
- Reserve Qty must be at least 1 on the client (`Validators.min(1)`); the backend's null check on `quantity_base` compares `String.valueOf(...)` and therefore never fires.
- Bin-pinned reservations are validated against bin availability on RESERVE; plain reservations are **not** validated against the stock balance (see Lifecycle).

### Background job settings

The two removal jobs are configured, if at all, through the Scheduler (`bl_sch_crontab_hdr`, Scheduler applet) by picking the processor and giving it a JSON property block:

| Job (queue code) | Properties | What it does |
|---|---|---|
| `EXPIRED_STOCK_RESERVATION_REMOVAL_PROCESSOR` | `limit` (default 10), `by_exact_date` (declared, unused) | Marks up to `limit` reservation headers whose `expiry_date <= now()` as `status = DELETED` (and their active bin links), whatever their posting status. Also discards MRP job-order temporary reservations. |
| `TEMPORARY_RESERVED_STOCK_REMOVAL_PROCESSOR` | `limit`, `time_to_live` (minutes) | Loads up to `limit` `TMP` headers and, for those whose `created_date + time_to_live` is **still in the future**, subtracts their quantity from the reserved column (see Lifecycle for why this is unsafe). |

### Settings in other applets that control this applet

None found. Reservations created from other applets carry their own defaults (for example the Job Order's stock-planning screen sets the bin link's expiry to start + 24 hours); those are documented on the calling applet's page.

### Feature visibility / permissions

- **Client-side:** the applet has no permission checks of its own (`hasPermission` is not called anywhere in the reservation or bin components) and no rows are seeded for it in `bl_applet_client_side_perm_dfn` (checked 2026-09-05). The *Applet Access* screen is the shared one.
- **Server-side (reservation header, `inventory-stock-reservation-hdrs`):** `API_TNT_DM_ERP_INVENTORY_STOCK_RESERVATION_HDR_OWNER / ADMIN / MEMBER / CREATE / UPDATE / DELETE / READ` (`TntErpPermissions`). Each endpoint accepts OWNER, ADMIN or the matching verb: READ for listing and query, CREATE for create and the two auto-bin-reservation endpoints, UPDATE for edit, **update-posting-status** and **validate-reserve-with-bin**, DELETE for delete. There is no separate "reserve" or "release" permission — whoever can edit can reserve and release.
- **Server-side (bin links, `inv/bin-reservation-gen-doc-links`):** `API_TNT_DM_INV_BIN_RESERVATION_GEN_DOC_LINK_OWNER / ADMIN / CREATE / UPDATE / DELETE / READ` (`AkaunTenantPermissionsV3`).
- The permission-set screen's target picker (`permission.resolver.ts`) offers Company, Branch, Location, Entity, Customer, Supplier, Employee, Team, Applet, Tenant, financial item, Dimension, Segment, Project, Profit Center, Printable Format, Batch, Client Side Permission, Pricing Scheme and Membership Card targets.

## Fields

### Stock Reservation — Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Branch | Branch holding the stock; sets the company silently. | Yes | Read-only on edit. |
| Location | Location (store) holding the stock; filtered by branch. | Yes | Read-only on edit. Must be chosen before Item Name (hint "Please select Location first"). |
| Item Name | Opens *Select Item*; the list shows Item Code, Item Name, UOM and System Stock Balance (ledger qty at the location, rounded). | Yes | Only PNS-class basic items and bundles with ledger qty > 0 at the location. Read-only on edit. |
| Item Code | Filled from the selected item. | Yes | Read-only. |
| Reserve Qty | Quantity in base UOM (`quantity_base`). | Yes | Minimum 1. Read-only and equal to the sum of the Bin Number tab when the item sub-type is `BIN_NUMBER`. |
| UOM | Filled from the item; editable text. | No | Stored in `uom_json.uom`. |
| Reservation Expiry (date) | Date after which the expiry job soft-deletes the reservation. | Yes | Date picker; stored as `expiry_date`. |
| Serial Number | Free text. | No | Stored as `serial_number`; not validated against serial-number records. |
| Status | TEMP or DRAFT on create. | Yes | Default DRAFT. Disabled once RESERVED or RELEASED. |
| CRM Contract | Free text. | No | **Not saved** — the form control has no mapping in the draft reducer. |
| Description | Free text. | No | Stored as `description`. |

### Stock Reservation — Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity Id (Entity Details) | Customer entity the stock is held for; opens *Select Customer*. | Yes | Stored as `entity_fi_item_link_guid`. The create button is disabled until it is set. |
| Entity Name, Status, Entity Type, Identity Type, ID Number, Currency, Email, Description, Phone Number | Read-only details of the chosen entity. | No | Display only. |
| Bill To / Ship To | Address pickers. | No | Displayed but **not saved** with the reservation — the create and edit screens do not bind the address outputs and the header has no address columns. |

### Stock Reservation — Bin Number (bin-tracked items only)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Bin Hdr Code / Bin Line Code | Bin chosen in *Select Bin No* (bins for the item at the location). | Yes per line | *Select Bin No* shows Ctn Measure, Ctn Qty, Base Qty and an editable **Reservation Ctn Qty**. |
| Container Measure, Container Qty, Base Quantity | `ctn_measure`, `reserved_container_qty`, `reserved_qty`. | — | Base = Reservation Ctn Qty × Container Measure. Client-side: Reservation Ctn Qty must be > 0 and ≤ the bin's Ctn Qty. |

Each line is saved as a `bl_inv_bin_reservation_gen_doc_link` row linked to the header (`stock_reservation_hdr_guid`), type `PARTIAL`, start time = now, expiry = the header's expiry date. Lines are created and updated with the header; deleting an existing line sets its `status = DELETED`.

### Bin Reservation (standalone)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Sales Order Number | Sales-order line picker (PNS lines; columns include production / schedule / existing-stock MRP statuses, order qty, customer, sales agent). | No | Fills customer, company, branch, location and `gen_doc_guid`. |
| Customer | Entity the bin is held for. | Yes | Picker; `entity_guid`. |
| Branch, Location | Where the bin is. | Yes | |
| Item Code / Item Name | Inventory item; picker. | Yes | |
| Bin Hdr Code / Bin Line Code | Bin picker, enabled once item and location are set ("Please select item and location first"). | Yes | |
| Container Measure, UOM, Reserved Container Qty | From the bin line. | — | Read-only. |
| Reserved Base Qty | `reserved_qty`. | Yes | Read-only; computed from the bin picker. |
| Reservation Type | `FULL` or `PARTIAL`. | No | |
| Start Date | `reservation_start_time`. | Yes | |
| Expiry Date | `reservation_expiry_date`. | No | |
| Remarks | `reservation_remarks`. | No | |

A standalone bin reservation writes only the link table; it creates **no** stock reservation header and therefore never touches the reserved column of the stock balance — it only reduces the bin's available quantity.

## Lifecycle and effects

### Statuses

`posting_status` (`StockReservationStatusColumn`): **TMP → DRAFT → RESERVED → RELEASED**, plus the row `status` ACTIVE / DELETED (soft delete).

| From | Action (UI) | Backend call | To |
|---|---|---|---|
| — | CREATE | `POST …/inventory-stock-reservation-hdrs/backoffice-ep`, then one `POST …/bin-reservation-gen-doc-links` per bin line | TMP or DRAFT (as chosen) |
| TMP / DRAFT | SAVE | `PUT …/backoffice-ep` (+ bin links) | unchanged |
| TMP / DRAFT, no bin lines | RESERVE (click twice) | `PUT` the header, then `PUT …/backoffice-ep/update-posting-status` with `RESERVED` | RESERVED |
| TMP / DRAFT, with bin lines | RESERVE (click twice) | `PUT` the header, then `PUT …/backoffice-ep/validate-reserve-with-bin/{guid}` | RESERVED (header and active links, by direct SQL) |
| RESERVED | RELEASE (click twice) | `PUT` the header, `update-posting-status` with `RELEASED`, then each bin link re-`PUT` with posting status RELEASED | RELEASED |
| RELEASED | — | `update-posting-status` answers HTTP 403 `YOU_ARE_NOT_AUTHORIZED_TO_UPDATE_THE_POSTING_STATUS` whenever the current status is RELEASED — RELEASED is terminal. SAVE is disabled in the UI. | — |
| TMP / DRAFT / RELEASED | DELETE (click twice) | Existing bin links `PUT` with `status = DELETED`, then `DELETE …/backoffice-ep/{guid}` | row status DELETED |

The UI hides DELETE while RESERVED and disables SAVE and the bin add/delete buttons while RESERVED or RELEASED; the endpoints themselves do not enforce any of that beyond the RELEASED check above.

### Posting proof block

- **Server document type:** none — `bl_inv_stock_reservation_hdr` is its own table, not a generic document; `server_doc_1` (Doc No) is drawn from the platform sequence counter for that table (`RunningNumberGeneratorUtil`).
- **Amount signum / Dr-Cr equation / GL precedence:** not applicable — no `JournalPostingService` path exists for reservations; nothing is posted to the general ledger.
- **Quantity signum / stock processor:** no `bl_inv_txn_line` is written and `qty_ledger` never changes. Setting the status to RESERVED or RELEASED through `update-posting-status` queues `INVENTORY_STOCK_RESERVATION_PROCESSOR` (RUN_NOW, `InventoryStockReservationHdrService.updatePostingStatus`), which loads the location and company balance rows for the item and:
  - RESERVED → `qty_reserved += quantity_base` on `bl_inv_current_location_stock_balance` and `bl_inv_current_company_stock_balance` (`InventoryStockReservationService.processForReservedStatus`);
  - RELEASED → `qty_reserved -= quantity_base` on both (`processForReleasedStatus`).
  Both branches are guarded by "the balance row exists": if the item has no balance row at that company / location, nothing is written and nothing is reported.
- **No availability check for plain reservations:** neither the DCO nor the processor compares `quantity_base` with `qty_ledger` or `qty_available`; a reservation larger than the stock on hand is accepted and drives availability negative.
- **Bin-pinned reservations take a different path:** `validateAndReserveBin` requires the item sub-type to be `BIN_NUMBER`, the header to be DRAFT ("Stock Is Already Reserved" otherwise), at least one link, and for every link an available bin quantity ≥ the reserved quantity ("Reserved Qty is Bigger than Available Qty For Bin Code: …"). It then sets `posting_status = RESERVED` on the header and its ACTIVE links by direct SQL (`updateReservationStatusAndBinLink`) **without queueing the processor** — the balance's `qty_reserved` is not increased; only the bin availability query (`BinUow`: available − reserved − locked) reflects the hold. Releasing such a reservation later does go through `update-posting-status`, so the processor subtracts a quantity that was never added.
- **What VOID reverses:** there is no VOID. RELEASE is the reversal (subtracts the same `quantity_base`); DELETE soft-deletes the row without touching the balance.

### Who reads the reservation

- `StockAvailabilityUow` (the availability endpoint used by Stock Availability, Stock Balance and the document applets' stock checks): location available = `qty_ledger + signum × open − qty_reserved` from the balance row (L84). Its details query instead sums `quantity_base` of headers with `status <> DELETED AND posting_status = RESERVED` per item and location (`stk_reserve` CTE, L1015–1024) into `stock_reserve_qty` / `total_qty`. The two sources agree only while every RESERVED header has been added to the balance and nothing has been soft-deleted without a RELEASE.
- `StockSummaryService.addReservationQty` (sales-order stock summary) subtracts the company-level `qty_reserved` from the job quantity.
- [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/) snapshots the company `qty_reserved` onto its order-quantity lines (it does not change the reorder quantity).
- The Sales Order applet's *availability by job* dialog, the Job Order's production-request stock planning (creates a DRAFT header linked to the sales-order line, sets it RESERVED, and adds bin links that expire 24 hours after the start time) and the Packing Order's pick queue (loads RESERVED bin links for the location and item and sets both link and header to RELEASED when it consumes them) use the same endpoints.

### Expiry and temporary reservations

- **Expiry is a scheduled job, not a status.** `EXPIRED_STOCK_RESERVATION_REMOVAL_PROCESSOR` runs only if a Scheduler crontab exists for it. Each run selects up to `limit` (default 10) headers with `expiry_date <= now()` and `status <> DELETED` — **regardless of posting status** — and sets `status = DELETED` on the header and its ACTIVE bin links. It does **not** set RELEASED and does **not** subtract from `qty_reserved`. An expired RESERVED reservation therefore disappears from the listing and from the availability details sum but keeps reducing the balance-row availability until someone corrects `qty_reserved`. Release reservations before they expire if you rely on the balance row.
- **TMP** is a status you can pick on create (TEMP) and the backend default when a caller omits the status. `TEMPORARY_RESERVED_STOCK_REMOVAL_PROCESSOR` (if scheduled, with `limit` and `time_to_live` minutes) loads TMP headers and calls `processMultipleReleasedStatus` for those whose `created_date + time_to_live` is after now — i.e. the ones still inside their time-to-live, not the expired ones — subtracting their quantity from `qty_reserved` although a TMP header never added to it, and leaving the status at TMP. Do not schedule this job until it is fixed.

## Related applets

- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — shows reserved and available quantities; the reason reservations exist.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Related applets: stock balance](/applets/inventory-workflow/related-applets-stock-balance/) — this applet is the only writer of the balance tables' `qty_reserved` column.
- [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) — bin headers and lines that bin reservations point at; bin availability nets off reserved and locked quantities.
- [Sales Order](/applets/sales-workflow/internal-sales-order-applet/) — the usual source of a reservation; open orders also reduce availability in their own right.
- [Packing Order](/applets/manufacturing/internal-packing-order-applet/) and the Job Order applet (no wiki page yet) — release and reserve stock and bins for picking and production through the same endpoints.
- [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/) — reads the reserved quantity when it snapshots stock positions.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Organization](/applets/master-data/organisation-applet/) — the master data a reservation is made of.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| RESERVE succeeds but Stock Availability shows no reserved quantity | The item has no balance row at that company / location, so the processor's "row exists" guard skips the update; or the reservation is bin-pinned (the bin path never queues the processor). | Check the item has a stock balance at the location; for bin-pinned holds use the bin availability view, not the balance row. |
| Reserved quantity is larger than stock on hand; available goes negative | No backend check compares the reservation with the balance (plain reservations). | Release or delete the excess reservation; check quantities before reserving. |
| A reservation vanished from the listing on its expiry date but availability is still reduced | The expiry job soft-deletes the header without releasing it; `qty_reserved` on the balance keeps the old value. | Release reservations before expiry. For rows already deleted, the reserved column needs a data fix. |
| Expired reservations never disappear | No Scheduler crontab for `EXPIRED_STOCK_RESERVATION_REMOVAL_PROCESSOR`, or the backlog exceeds `limit` (default 10) per run. | Create / adjust the crontab in the Scheduler applet. |
| RELEASE of a bin-pinned reservation makes `qty_reserved` negative | Bin reservations reach RESERVED by direct SQL without adding to the balance, but RELEASE subtracts through the processor. | Correct `qty_reserved`; treat bin holds as bin-level only. |
| "Stock Is Already Reserved" on RESERVE | The bin path requires the header to be DRAFT; a TMP header, or one already RESERVED, is rejected. | Save the header as DRAFT first, or open the existing RESERVED reservation. |
| "Selected Stock Is Not A Bin Item" | The item's sub-type is not `BIN_NUMBER` but bin lines were attached. | Remove the bin lines or use a bin-tracked item. |
| "No Bin Reservation Gen Doc Link To Reserve" | The Bin Number tab is empty for a bin-tracked item, or the links failed to save (toast "n/m bin reservations failed"). | Add bin lines, save, then reserve. |
| "No Available Bin For Bin Code: …" / "Reserved Qty is Bigger than Available Qty For Bin Code: …" | The bin line no longer has enough available quantity (available − reserved − locked). | Pick another bin or reduce the container quantity. |
| HTTP 403 `YOU_ARE_NOT_AUTHORIZED_TO_UPDATE_THE_POSTING_STATUS` | The reservation is RELEASED; RELEASED is terminal. | Create a new reservation. |
| `INVENTORY_STOCK_RESERVATION_OBJECT_GUID_DOES_NOT_EXIST` on reserve / release | The header was deleted (for example by the expiry job) between opening and clicking. | Reload the listing. |
| The item is not in *Select Item* | Location not chosen yet, ledger quantity at that location is 0 or negative, or the item is not a PNS basic item / bundle. | Choose the location first; receive stock at that location. |
| CREATE stays disabled | Customer not selected on the Account tab, expiry date empty, or Reserve Qty below 1. | Fill the three. |
| Default Branch / Location from Settings do not pre-fill the form | The defaults are saved but never read by the form. | Pick branch and location on each reservation. |
| Personalization → Field Settings shows the 404 page | The menu entry has no route. | Use Settings → Application Settings (which this applet does not consume either). |
| CRM Contract or Bill To / Ship To entries are lost after CREATE | Not mapped to the header; display only. | Record the contract in Description. |
| Advanced search on the listing returns the same rows | The listing's `onSearch` handler is empty and the search model is a copy from a receipt-voucher applet (labels "Reservation Code / Name", conditions on customer and branch name and `INTERNAL_RECEIPT_VOUCHER`). | Use the grid's column filters instead. |
| Old page text: "at midnight the status changes to Expired and the quantity is restored" | No such status or restore exists (see Expiry above). | — |

The applet repository has one GitHub issue (#1, the Angular 14 migration, closed); no user-reported failure modes exist there yet.

## Related documentation

- [Inventory module](/modules-v2/inventory/) and its [related applets](/modules-v2/inventory/related-applets/).
- [Manufacturing module](/modules-v2/manufacturing/) — job-order and packing-order reservations.
- [Standard sales workflow](/guides/sales-guides/standard-sales-workflow/) — where reserving stock sits in the order-to-cash flow.
