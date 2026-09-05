---
title: "Customer Consignment Applet"
description: "Reference for the Customer Consignment Applet: send stock you still own to a customer's premises (Transfer Out), bring it back (Transfer Receive), and see what is still out there (Transfer Queue). Stock only, no journal."
applet_code: "customerConsignmentApplet"
applet_repo: "blg-applet-wavelet-customer-consignment-applet"
modules: [inventory, pos]
related_applets: [consignee-stock-transfer-applet, stock-transfer-applet, internal-stock-requisition-applet, internal-purchase-grn-applet, internal-consignment-billing-applet, internal-consignor-purchase-billing-applet, internal-consignment-grn-applet, stock-balance-applet, stock-report-applet, organisation-applet, inv-item-maintenance-applet]
guides: [/guides/inventory-guides/stock-management/]
sources:
  configuration:
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/app.routing.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/app.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/models/constants/printable-format-constants.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/settings-container/custom-status/custom-status.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/settings-container/custom-status/custom-status-settings/custom-status-settings.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/settings-container/outbound-printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/state-controllers/outbound-printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/internal-outbound-customer-consignment-transfer-listing/internal-outbound-customer-consignment-transfer-listing.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/internal-outbound-stock-transfer-container.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/internal-outbound-stock-transfer-view/internal-outbound-stock-transfer-view.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/internal-outbound-stock-transfer-view/internal-outbound-stock-transfer-view-export/internal-outbound-stock-transfer-view-export.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-inbound-stock-transfer-container/internal-inbound-stock-transfer-listing/internal-inbound-stock-transfer-listing.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-stock-queue-container/internal-stock-queue-container.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/state-controllers/draft-controller/store/effects/pns.effects.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - akaun_master.bl_applet_client_side_perm_dfn (applet code customerConsignmentApplet, 0 rows)
    - akaun_master.app_perm_template_hdr / app_perm_template_line (CUSTOMER_CONSIGNMENT_COMMON, CUSTOMER_CONSIGNMENT_LOCATION)
  fields:
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/internal-outbound-stock-transfer-create/internal-outbound-stock-transfer-create-main/internal-outbound-stock-transfer-create-main.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/internal-outbound-stock-transfer-create/internal-outbound-stock-transfer-create-main/internal-outbound-stock-transfer-create-main.component.html
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/internal-outbound-stock-transfer-add-line-item/add-line-item-item-details/internal-outbound-stock-transfer-add-line-item-main/internal-outbound-stock-transfer-add-line-item-main.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/internal-outbound-stock-transfer-add-line-item/internal-outbound-stock-transfer-add-line-item.component.html
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-outbound-stock-transfer-container/import-knock-off/import-knock-off.component.html
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-inbound-stock-transfer-container/internal-inbound-stock-transfer-create/internal-inbound-stock-transfer-create-main/internal-inbound-stock-transfer-create-main.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-inbound-stock-transfer-container/internal-inbound-stock-transfer-create/internal-inbound-stock-transfer-create-main/internal-inbound-stock-transfer-create-main.component.html
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-inbound-stock-transfer-container/internal-inbound-stock-transfer-add-line-item/add-line-item-item-details/internal-inbound-stock-transfer-add-line-item-main/internal-inbound-stock-transfer-add-line-item-main.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-inbound-stock-transfer-container/import-knock-off/knock-off-cc-gin/knock-off-cc-gin.component.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/utilities/select-location-drop-down-customer-consignment/select-location-drop-down-customer-consignment/select-location-drop-down-customer-consignment.component.ts
  lifecycle:
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/models/constants/applet-constants-outbound.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/models/constants/applet-constants-inbound.ts
    - blg-applet-wavelet-customer-consignment-applet/micro-fe/projects/wavelet-erp/applets/customer-consignment-applet/src/app/components/internal-stock-queue-container/internal-inbound-stock-transfer-listing/internal-inbound-stock-transfer-listing.component.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalCustomerConsignmentsOutDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalCustomerConsignmentsInDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/VoidInventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentHdrLineLinkOpenQueueUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
  troubleshooting:
    - gh:bigledger/blg-applet-wavelet-customer-consignment-applet#4
    - gh:bigledger/blg-applet-wavelet-customer-consignment-applet#5
    - gh:bigledger/blg-applet-wavelet-customer-consignment-applet#6
    - gh:bigledger/blg-applet-wavelet-customer-consignment-applet#7
    - gh:bigledger/blg-applet-wavelet-customer-consignment-applet#10
    - gh:bigledger/blg-wiki#50
tags:
- consignment-management
- stock-transfer
- inventory-tracking
- off-site-stock
weight: 170
aliases:
- /applets/customer-consignment-applet/
---

## Overview

The **Customer Consignment Applet** records stock that you send to a customer's premises but still own, and stock that comes back. Warehouse or store staff raise a **Transfer Out** when goods leave your location for the customer's consignment location, and a **Transfer Receive** when unsold goods return. The **Transfer Queue** lists every Transfer Out line that has not yet been received back, and lets you create the Receive straight from it so the two documents stay linked. Both documents move quantity only: they carry no value and post no journal. Invoicing what the customer has sold is done elsewhere (see [Related applets](#related-applets)).

{{< callout type="info" >}}
Server document types `INTERNAL_CUSTOMER_CONSIGNMENT_OUT` (short code **CCSOUT**, quantity signum **−1**, amount signum **0**) and `INTERNAL_CUSTOMER_CONSIGNMENT_IN` (**CCSINN**, quantity signum **+1**, amount signum **0**). The customer's premises are modelled as a stock location of class **CCSG** (consignee) — the same location class used by [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/).
{{< /callout >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | Locations of class CCSG ([Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/) › Consignee Listing, or [Organisation](/applets/master-data/organisation-applet/)) | Transfer Out's *Location To* is filtered to CCSG locations; Transfer Receive's *Location From* is the CCSG location |
| Upstream | [Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Basic items with an inventory link; serial, batch and bin sub-items |
| Upstream (optional knock-off) | [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/), [Stock Requisition](/applets/inventory-workflow/internal-stock-requisition-applet/), a prior Transfer Receive | Transfer Out › **KO For** tabs *GRN*, *Stock Requisition* and *CC-GRN* copy open lines from these documents |
| Downstream | Transfer Receive (this applet) | Knocks off Transfer Out lines through the Transfer Queue or the **KO For › CC-GIN** tab |
| Downstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/) | FINAL writes one ledger line at your location and a mirrored line (`CSG`) at the customer location |
| Sibling | [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/) | One-document alternative that moves both sides without a queue |
| Sibling | [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) | Same UI template, but between your own locations and with stock-in-transit |

## Screens and menus

Sidebar: **Transfer Out**, **Transfer Queue**, **Transfer Receive**. The applet opens on Transfer Out.

**Transfer Out listing** (*Internal Outbound Customer Consignment Transfer Listing*): columns Doc Short Code, Doc No (Tenant / Company / Branch), Posting Status, Tracking ID, Location From, Location To, Transaction Date; buttons **+** (create — needs the create permission, see below), **SINGLE/MULTIPLE PRINT** and **FINAL** for the ticked rows. The filter panel offers Location From, Location To, Created Date From/To and Txn Date From/To.

{{< figure src="/images/customer-consignment-applet/create-transfer.png" alt="Create Internal Outbound Customer Consignment Transfer form" caption="Transfer Out › Details tab: date, Location From, Location To, Tracking ID, Reference #, Remarks, Doc Description." >}}

**Transfer Out create**: tabs **Details**, **Line**, **KO For** (sub-tabs *GRN*, *CC-GRN*, *Stock Requisition*). **Transfer Out view**: **Details**, **Line**, **Doc Link**, **Attachments**, **Export** (order configurable), with **RESET**, **FINAL**, **SAVE** in the header and **EXPORT AS PDF** / **DELETE** on the Export tab.

{{< figure src="/images/customer-consignment-applet/cust-print.png" alt="Export tab of a Transfer Out" caption="Export tab: choose a printable format and export the document as PDF." >}}

**Transfer Queue** (*Internal Customer Consignment Queue Listing*): every FINAL Transfer Out line with open (not yet received) quantity — columns Doc Short Code, Doc No, Posting Status, Tracking ID, Location From, Location To, Transaction Date. There is no create button: clicking a row opens a Transfer Receive pre-filled with the open lines and knock-off links, and a **FINAL** action posts the ticked Receives in bulk.

**Transfer Receive listing** (*Internal Customer Consignment Transfer Receive Listing*): same columns; **+** and **FINAL** (no bulk print). Custom status columns appear here when enabled. **Transfer Receive create**: **Details**, **Line**, **KO For** (sub-tab *CC-GIN* = open Transfer Out lines); the template also carries *Account*, *Contra*, *Delivery Details*, *Department Hdr* and *Settlement* tabs inherited from the stock-transfer template. **Transfer Receive view**: **Main**, **Line Items**, **Status**, **Doc Link**, **Attachments**, **Export** (order configurable).

{{< figure src="/images/customer-consignment-applet/transfer-listing-add.png" alt="Create Internal Customer Consignment Receive form" caption="Transfer Receive › Details tab. Location From is the customer's consignment location; Location To is your stock location." >}}

**Line item dialog** (both documents): **Item Details**, **Serial Number**, **Batch Number**, **Bin Number**.

**Settings** (gear): *System Configuration* — Application Settings (shared screen), Default Selection, Outbound Printable Format, Receive Printable Format, Custom Status; *Server Side Permissions* — Permission Wizard, Permission Set, User Permission, Role Permission (Team Permission is routed but not listed); *Developer Tools* — Release Notes, Audit Trail. The settings area lands on Feature Visibility, which is routed but not in the menu. **Personalization**: Default Selection, Sidebar.

## Configuration

### Before you can use it

- **A CCSG location per customer site.** Create it in [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/) › Consignee Listing (Location Class = CCSG) or in the location master. When *Location From* on a Transfer Out is not itself a CCSG location, the *Location To* dropdown shows CCSG locations only.
- **Location access.** The dropdowns list only the locations in the user's `…_LOCATION_TO_READ_TGT_GUID` permission target; tenant admins and owners see every location.
- **Permissions.** Use **Settings › Permission Wizard** with the two seeded templates: `CUSTOMER_CONSIGNMENT_COMMON` (23 read permissions for companies, branches, locations, entities, items, serial numbers, tax codes, attachments, document links) and `CUSTOMER_CONSIGNMENT_LOCATION` (20 per-location permissions). The location template deliberately carries **both** the `TNT_API_DOC_INTERNAL_CUSTOMER_CONSIGNMENT_{IN,OUT}_*` permissions that the backend enforces and the `TNT_API_DOC_INTERNAL_{INBOUND,OUTBOUND}_STOCK_TRANSFER_*` permissions that the applet's menus and **+** buttons check — a user needs both sets.
- **Items** must be basic items linked to an inventory item; serial-, batch- and bin-tracked items need their sub-items maintained in [Item Maintenance](/applets/master-data/inv-item-maintenance-applet/).
- **Printable formats.** Upload a Jasper template under *Outbound Printable Format* and *Receive Printable Format* and tick **Default Selection**; bulk printing refuses to run without a default.
- **Document numbers** (Doc No Tenant / Company / Branch) are generated by the backend per document type, company and location; nothing to configure in the applet.
- **Fiscal periods.** A locked fiscal period rejects FINAL for both documents (see Lifecycle).

### Applet settings

Settings live in four places: the **shared** Application Settings screen (`FieldConfigurationComponent` from blg-shared-utilities, keyed by applet code), the **applet-local** Default Selection and Custom Status screens, the **printable-format** screens (which write their own applet extension, not `APPLET_SETTINGS`), and **Personalization › Default Selection** (per user). Tenant admins and owners change them; users change only their personal default.

Only the keys below pass all four proofs (declared, rendered, saved, read). The shared screen also shows many `HIDE_*` toggles (for example `HIDE_DOC_NO_TENANT`) that this applet never reads — switching them has no effect here.

| Setting | Screen | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| `SHOW_ITEM_STOCK_BALANCE` ("Disallow negative stock for basic item (validate stock balance)") | Application Settings › Lines Settings | On Transfer Out, shows the stock balance at *Location From* in the item search and caps the line **Quantity** at that balance (client validator, basic items only); the listing's bulk FINAL then also sends `validate_stock_balance = true` | off (unset) | Turning it **off** removes the client-side cap only — the backend validates stock on FINAL regardless (see Lifecycle) |
| `SORT_ORDER` ("Sorting Order") | Application Settings › Gen Doc Listing Settings | Column the three listings are ordered by | `date_txn` when unset | Listings re-order on next load |
| `DISABLE_GEN_DOC_LISTING` | Application Settings › Gen Doc Listing Settings | When on, the listings do not load rows until you search | off | Faster opening on large tenants; users must search first |
| `HIDE_CREATED_BY_DETAILS` | Application Settings › Doc Settings | Hides the Created By / Modified By / dates block on both Details tabs | off | Block disappears from the create forms |
| `INTERNAL_OUTBOUND_STOCK_TRANSFER_DETAILS_TAB_ORDER` | Default Selection › Outbound Details Tab Order (drag list) | Tab order of the Transfer Out view | Details, Line, Doc Link, Attachments, Export | Saved order applies; tabs added later are appended |
| `INTERNAL_INBOUND_STOCK_TRANSFER_DETAILS_TAB_ORDER` | Default Selection › Inbound Details Tab Order | Tab order of the Transfer Receive view | Main, Line Items, Status, Doc Link, Attachments, Export | As above |
| `ENABLE_CUSTOM_STATUS_1..5`, `ENABLE_CUSTOM_STATUS_HDR_n`, `NAME_CUSTOM_STATUS_HDR_n`, `LIST_CUSTOM_STATUS_HDR_n` | Custom Status | Up to five named header statuses, each with its own value list and a default; shown as extra columns on the **Transfer Receive** and **Transfer Queue** listings and on the Receive view's Status tab | all off | Transfer Out ignores them; the `*_LINE_n` toggles are saved but read by nothing |
| Default printable format (applet extension `INTERNAL_CUSTOMER_CONSIGNMENT_OUT_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_…` / `…_IN_…`) | Outbound / Receive Printable Format › Default Selection checkbox | Format used by **SINGLE/MULTIPLE PRINT** on the Transfer Out listing | none | Bulk print works; the Export tab still needs a manual pick (it reads `PRINTABLE`, which this applet never writes) |
| `DEFAULT_LOCATION` (personal) | Personalization › Default Selection | Pre-fills *Location From* on both create forms for that user | none | Overrides the applet-level value |

{{< callout type="warning" >}}
**Default Selection › Default Branch / Default Location do not save.** The two dropdowns are bound to loose controls, and SAVE writes the previously stored `DEFAULT_BRANCH` / `DEFAULT_LOCATION` back unchanged. Only the tab-order lists on that screen persist. Set a default location per user under Personalization instead.
{{< /callout >}}

Keys read at runtime **without a control** in this applet: `ENABLE_FILTER_BY_TODAYS_TXN` (listings default to today from 06:00 instead of the last month), `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` (serial-number draft-lock check when serials are added) and `PRINTABLE` (Export tab pre-selection). They can only be set through another applet that shares the same tenant setting screen. `DEFAULT_BRANCH` is saved but read by nothing.

{{< figure src="/images/customer-consignment-applet/setting-page-1.png" alt="Application Settings screen" caption="Application Settings is the shared screen; only four of its keys are read by this applet." >}}

{{< figure src="/images/customer-consignment-applet/setting-page-2.png" alt="Custom Status settings" caption="Custom Status: header statuses apply to Transfer Receive and the Transfer Queue." >}}

{{< figure src="/images/customer-consignment-applet/con-printable.png" alt="Receive Printable Format listing" caption="Receive Printable Format: tick Default Selection on the format bulk print should use." >}}

### Document behaviour settings

- **Posting status**: DRAFT → FINAL, from the view header or in bulk from the listing (rows that are not DRAFT/ACTIVE are skipped with a "n/m selected documents cannot be finalized" snackbar). The applet exposes no VOID action; **DELETE** on the Export tab (click twice to confirm) calls the document delete endpoint.
- **Stock validation on FINAL** is a backend default, not a setting (see Lifecycle).
- **Printables**: Jasper templates per direction; Export tab exports one PDF, the Transfer Out listing prints several.
- No approval workflow, no e-Invoice submission, no custom line statuses.

### Feature visibility / permissions

`bl_applet_client_side_perm_dfn` has **no rows** for this applet, yet the code checks four client-side permission codes. Because none is seeded, they are all off for every user:

| Code checked in code | What it would unlock |
|---|---|
| `SHOW_TRANSACTION_DATE` | Makes the *Good Issue Date* / *Good Receive Date* editable. Without it the field is disabled and stays at today's date |
| `SHOW_UNIT_PRICE_STD_PRICING_SCHEME` | Shows a pricing-scheme unit price on Transfer Out lines |
| `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH` | Excludes account-code items from the item search |
| `DISABLE_ADD_WHEN_KO` | Blocks adding free lines to a document created by knock-off |

Server-side permissions are the two templates above (Settings › Permission Wizard); Permission Set, User, Team and Role screens are the shared assignment screens.

{{< figure src="/images/customer-consignment-applet/setting-page-3.png" alt="Permission Wizard listing the two templates" caption="Permission Wizard: CUSTOMER_CONSIGNMENT_COMMON and CUSTOMER_CONSIGNMENT_LOCATION." >}}

## Fields

### Transfer Out — Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Customer Consignment Transfer Good Issue Date | Transaction date | Yes | Defaults to today; editable only with `SHOW_TRANSACTION_DATE` |
| Location From | Your stock location (`guid_store`) | Yes | Limited to the user's location target; company is derived from it; pre-filled from the personal default location |
| Location To | Customer's consignment location (`guid_store_2`) | Yes | Filtered to class CCSG unless Location From is itself CCSG |
| Tracking ID, Reference #, Remarks, Doc Description | Free text | No | — |
| Doc Short Code, Doc No (Tenant / Company / Branch) | Generated numbers | — | Read-only; shown in view mode |
| Created By / Date, Modified By / Date | Audit | — | Read-only; hidden by `HIDE_CREATED_BY_DETAILS` |

### Transfer Receive — Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Customer Consignment Good Receive Date | Transaction date | Yes | As above |
| Location From | Customer's consignment location (`guid_store_2`) | Yes | Pre-filled from the knocked-off Transfer Out or the personal default location |
| Location To | Your receiving stock location (`guid_store`) | Yes | Limited to the user's location target |
| Tracking Id, Reference #, Remarks, Doc Description | Free text | No | — |

### Line (both documents)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item Code | Item searched from the item master | Yes | Item Name and UOM fill in |
| Quantity | Quantity in the chosen UOM | Yes | Minimum 1; on Transfer Out, maximum = ledger balance at Location From for basic items when `SHOW_ITEM_STOCK_BALANCE` is on |
| Location From / Location To, Tracking ID | Copied from the header | No | Line-level copies |
| Remarks, Doc Description, Doc Reference | Free text | No | — |
| GRN No, ST-GRN ID (Out) / ST-GIN ID (Receive) | Source document reference | No | Filled when the line was created by knock-off |
| Serial Number / Batch Number / Bin Number tabs | Sub-item detail | Per item | Quantities must agree with the line on FINAL (backend check) |

## Lifecycle and posting

**Statuses**: DRAFT on create; FINAL from the view or the listing; DELETE from the Export tab. VOID exists in the backend for these document types (it reverses the ledger lines) but has no button in this applet.

**Posting proof**

| Item | Transfer Out | Transfer Receive |
|---|---|---|
| Server document type | `INTERNAL_CUSTOMER_CONSIGNMENT_OUT` (CCSOUT) | `INTERNAL_CUSTOMER_CONSIGNMENT_IN` (CCSINN) |
| Amount signum | 0 | 0 |
| Quantity signum | −1 | +1 |
| Dr / Cr equation | none — neither type is registered in `JournalPostingTypeHandler`, so FINAL creates no journal | none |
| GL precedence | not applicable | not applicable |
| Stock processor | `InventoryTransactionLineProcessor` on FINAL: one ledger line per stock line at `guid_store` (−qty), then `createConsignmentTxns` clones it to `guid_store_2` (+qty) with `txn_code_02 = CSG` and the transaction time shifted +0.1 s; costs on the clone are recomputed | Same processor: +qty at `guid_store` (Location To), clone −qty at `guid_store_2` (Location From) shifted −0.1 s |
| What VOID reverses | `VoidInventoryTransactionLineProcessor` negates every ledger line the document created (including the CSG clone) with `txn_code = VOID` and unlocks draft-locked serial numbers | Same |

The signums are fixed by `InternalCustomerConsignmentsOutDataConsistencyObject` / `…InDataConsistencyObject` (`checkAmountSignum`, `fillQuantitySignumAndAmountSignumForLine`); the applet constants carry the same values.

**Backend checks on FINAL** (`GenericDocumentService.validateGenericDocumentOnFinal`, all hard rejections):

- Serial, bin and batch quantities must match the line quantity.
- **Stock balance**: `updatePostingStatus` defaults `validate_stock_balance` to **true** when the request omits it, so every Transfer Out line with negative signum, basic item and PNS type is checked against the ledger at Location From; failure returns `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION` — *"Not Enough Stock for item …"*. The `SHOW_ITEM_STOCK_BALANCE` toggle only adds the client-side cap; it cannot switch the backend check off.
- Transaction date and company must be present; `guid_store` must be set (`GENERIC_DOC_HDR_GUID_STORE_IS_NULL_OR_EMPTY`).
- A locked fiscal period rejects with `FISCAL_PERIOD_LOCKED`. The exemption in that check covers only the plain `INTERNAL_OUTBOUND/INBOUND_STOCK_TRANSFER` types, not the consignment types.
- There is **no check that Location From and Location To belong to the same company** (open issue, see Troubleshooting).

**Open queue and knock-off**: when a Transfer Out is FINAL its lines appear in `bl_fi_generic_doc_line_open_queue` with `server_doc_type_1 = INTERNAL_CUSTOMER_CONSIGNMENT_OUT` and `server_doc_type_2 = INTERNAL_CUSTOMER_CONSIGNMENT_IN`; the Transfer Queue and the Receive's *CC-GIN* tab query exactly that pair (`GenericDocumentHdrLineLinkOpenQueueUow`). Creating a Receive from the queue copies each open line with `quantity_base = qty_open` and a `bl_fi_generic_doc_link` of `txn_type = KO`, `quantity_signum = −1`, `quantity_contra = qty_open`; the Transfer Out's own *KO For* tabs work the same way against Purchase GRN (`INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE → OUT`), Stock Requisition (`INTERNAL_STOCK_REQUISITION → OUT`) and a prior Receive (`IN → OUT`, the *CC-GRN* tab).

## Related applets

- [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/) — creates the CCSG locations this applet transfers to, and offers a single-document issue/receive note without a queue.
- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — the template this applet was derived from; use it for movements between your own locations.
- [Stock Requisition](/applets/inventory-workflow/internal-stock-requisition-applet/) and [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/) — documents a Transfer Out can knock off.
- [Consignment Billing Applet (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/) — bills the customer for consignment stock they have sold; this applet only moves quantity.
- [Consignor Purchase Billing Applet (Internal)](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) and [Consignment GRN Applet (Internal)](/applets/inventory-workflow/internal-consignment-grn-applet/) — the supplier-side (you are the consignee) mirror of this process.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Stock Report](/applets/inventory-workflow/stock-report-applet/) — where the ledger lines at your location and at the CCSG location show up.
- [Organisation](/applets/master-data/organisation-applet/) — companies, branches and locations.
- [Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — items, serial numbers, batches and bins.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL on a Transfer Out fails with *"Not Enough Stock for item …"* | The ledger at Location From holds less than the line quantity; the backend validates by default | Receive the stock into that location first or reduce the quantity. Turn on `SHOW_ITEM_STOCK_BALANCE` so the cap is visible while keying |
| *Location To* dropdown is empty or the customer site is missing | Location From is not CCSG, so the list is filtered to class CCSG — the site's location is not CCSG, or it is outside the user's location target | Set the location class to CCSG in Consignee Listing; add the location to the user's `…_LOCATION_TO_READ` target |
| Date field is greyed out | `SHOW_TRANSACTION_DATE` is not seeded for this applet | Raise a request to seed the client-side permission; until then the date is today |
| **+** button missing although the consignment permissions were granted | The applet gates the button on `TNT_API_DOC_INTERNAL_OUTBOUND_STOCK_TRANSFER_CREATE_TGT_GUID` (and the inbound equivalent), not on the consignment codes | Assign through the `CUSTOMER_CONSIGNMENT_LOCATION` template, which carries both |
| *"Default printable format not configured"* on SINGLE/MULTIPLE PRINT | No format ticked as Default Selection | Outbound Printable Format › tick Default Selection |
| Default Branch / Location under Settings › Default Selection revert after SAVE | The controls are not bound to the saved form | Use Personalization › Default Selection per user |
| Stock ended up at another company's location | No backend check that both locations belong to one company (issue #4, open) | Check the company of Location To before FINAL; keep one CCSG location per customer per company |
| Queue bulk FINAL: *"Unable to post the document to FINAL: … Serial numbers are invalid"* | A copied line still carries serial numbers marked INVALID | Open the Receive, fix the serial numbers on the line, then FINAL |
| FINAL rejected with `FISCAL_PERIOD_LOCKED` | Transaction date is in a locked period; consignment types are not exempt | Unlock the period or use an open date (needs `SHOW_TRANSACTION_DATE`) |
| Listing filter *Posting Status* ignored, page number advancing on empty pages, *Location From* filter pre-filled on open | Listing bugs reported 2026-04 (issues #5, #6, #10 — fixed); rows-per-page limit (#7) still open | Update the applet; for #7 use the search filters |

## Related documentation

- [Stock Management guide](/guides/inventory-guides/stock-management/)
- [Inventory module](/modules-v2/inventory/)
- [POS module › related applets](/modules-v2/pos/related-applets/)
