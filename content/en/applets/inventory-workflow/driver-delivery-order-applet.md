---
title: "Driver Delivery Order Applet"
description: "Reference for the Driver Delivery Order applet — a driver's view of the internal outbound delivery orders assigned to them, where the vehicle number, delivery date and time slot are updated in the field."
applet_code: "driverDeliveryOrderApplet"
applet_repo: "blg-applet-wavelet-driver-delivery-order-applet"
modules: [inventory]
related_applets: [internal-delivery-order-applet, internal-outbound-delivery-order-applet, supplier-delivery-order-applet, delivery-installation-applet, delivery-installation-driver-applet, stock-availability-applet, organisation-applet, customer-maintenance-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/app.routing.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/app.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/settings-container.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/custom-status/custom-status.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/custom-status/custom-status.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/custom-status/custom-status-settings/custom-status-settings.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/applet-log/applet-log.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/settings-container/release-notes/release-notes.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-container.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-listing/sales-invoice-listing.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-listing/sales-invoice-listing.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/sales-invoice-edit.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/sales-invoice-edit.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/line-item/line-item-listing.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/state-controllers/sales-invoice-controller/store/effects/sales-invoice.effects.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/settings/settings.component.html
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet driverDeliveryOrderApplet — no rows)
  fields:
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.html
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/line-item/line-item-listing.component.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/state-controllers/draft-controller/store/reducers/hdr.reducers.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/models/advanced-search-models/internal-sales-invoice.model.ts
  lifecycle:
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/state-controllers/sales-invoice-controller/store/effects/sales-invoice.effects.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/services/sales-invoice-pages.service.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalOutboundDeliveryOrderDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_generic_doc_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/criteria/GenericDocumentQueryCriteria.java
    - blg-applets-wavelet-erp-v3/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/select-delivery-driver/select-delivery-driver.component.ts
  troubleshooting:
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/state-controllers/sales-invoice-controller/store/effects/sales-invoice.effects.ts
    - blg-applet-wavelet-driver-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/driver-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/sales-invoice-edit.component.ts
    - gh:bigledger/blg-applet-wavelet-driver-delivery-order-applet#1
    - gh:bigledger/blg-applet-wavelet-driver-delivery-order-applet#2
    - gh:bigledger/blg-int-general-task#6157
    - gh:bigledger/blg-int-general-task#6488
    - gh:bigledger/blg-wiki#57
tags:
- delivery-management
- driver-app
- logistics
- order-tracking
- status-updates
weight: 170
aliases:
- /applets/driver-delivery-order-applet/
---

## Overview

The Driver Delivery Order applet is a driver's window onto the delivery orders assigned to them. It lists the **Delivery Order (Internal)** documents (server document type `INTERNAL_OUTBOUND_DELIVERY_ORDER`) whose delivery driver is the person logged in, and lets that person record the **vehicle number**, the **delivery date** and a **morning / afternoon / evening time slot**, then save. The line items are shown read-only so the driver can check what is on the van.

It does not create delivery orders, does not finalise, void or discard them, and does not post anything. The documents come from the [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) applet (or from the sales documents converted into delivery orders there); this applet only edits three header fields on them. It is used by drivers and, for oversight, by the dispatcher who assigns the driver.

{{< figure src="/images/driver-delivery-applet/driver-delivery-overview.png" alt="Driver Delivery Order Applet Dashboard Overview" caption="The Driver Delivery Order listing." >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) / [Internal Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/) | The `INTERNAL_OUTBOUND_DELIVERY_ORDER` documents this applet lists; the driver must be set on the document header (`delivery_driver_guid`) before it appears here |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Branches on the documents; the branch targets of the driver's read permission decide which branches are visible |
| Upstream | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | The customer (Account) shown on each delivery order |
| Sideways | [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) | Same header fields and the same driver picker (entity driver link), but for supplier documents — those do **not** appear in this applet |
| Sideways | [Delivery & Installation](/applets/delivery-installation/delivery-installation-applet/), [Delivery Installation Driver](/applets/delivery-installation/delivery-installation-driver-applet/) | The trip / job based alternative for larger fleets; independent of this applet's driver field |
| Downstream | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | Open delivery-order lines are counted as committed quantity (`do_qty`); this applet does not change quantities |

Module: Inventory (fulfilment).

## Screens and menus

The applet has a single menu item, **Driver Delivery Order**, which opens the listing. Everything else is under the gear (Settings) and Personalisation menus.

### Driver Delivery Order listing

Columns: Doc Short Code (`OBDODR`), Doc No, Status, Branch, Currency, Location, Customer Name, Tracking Id, Created Date, Modified Date, Transaction Date, Created by, Modified by. Posting Status and Sales Agent columns exist in the code but are commented out.

The listing is always filtered to documents whose `delivery_driver_guid` equals the logged-in login subject — the filter is added in the search effect on every search, and there is no way to switch it off. On top of that the **Advanced Search** offers: Branch (limited to the branches targeted by the driver's read permission), Sales Agent, Creation Date range, Transaction Date range, Est Delivery Date range, Status (`ACTIVE` / `INACTIVE`), Order By, plus a keyword search. A Posting Status filter is present in the model but commented out.

{{< figure src="/images/driver-delivery-applet/advance-filter.png" alt="Driver Delivery Order Advanced Filtering" caption="Advanced search: branch, sales agent, date ranges, status and sort order." >}}

There is no **+** (create) control on the listing. A create screen ("Create Internal Delivery Order") and an `onAdd()` handler exist in the code, but nothing in the listing template calls them, so drivers cannot create delivery orders here.

### Edit Driver Delivery Order

Click a row to open the document. Two tabs:

- **Main Details** — Document No and Account (read-only), Vehicle No, Delivery Date, Delivery time slot, and a Created By / Created Date / Modified By / Modified Date block.
- **Lines** — read-only grid of the delivery order lines with a quick filter and the discount / tax / rounding / transaction-amount totals.

Buttons: **SAVE** (top right) and **DELETE** (bottom, only when enabled — see permissions). FINAL, DISCARD, VOID and CLOSE buttons are commented out in the template.

### Settings (gear) menu

Under the applet's own **System Configuration** group: **Application Settings** (route `field-settings` — the shared field-configuration screen), **Default Selection**, **Printable Format Settings**, **Custom Status**, **Email Template**. The shared settings shell adds **Client Side Permissions** (Applet Access), **Server Side Permissions** (Permission Wizard, Permission Set, User Permission, Role Permission), **Integration** (Triggers) and **Developer Tools** (Release Notes).

{{< figure src="/images/driver-delivery-applet/setting-page.png" alt="Driver Delivery Order Settings Page" caption="The settings menu." >}}

{{< callout type="warning" >}}
**Printable Format Settings** and **Email Template** are menu entries without a route in `app.routing.ts` — clicking them lands on the applet's 404 page. The **Release Notes** screen is a static page (version 1.00, 2024-08-06, "Support forex currency"), and the `applet-log` route renders only an "Audit Trail" heading with no data.
{{< /callout >}}

Personalisation: **Default Selection** (per-user default branch, location and toggle column) and **Sidebar**.

## Configuration

### Before you can use it

1. **A delivery driver on the document.** The listing shows a delivery order only when its header `delivery_driver_guid` equals the login subject of the person logged in (`bl_fi_generic_doc_hdr.delivery_driver_guid` is a foreign key to `app_login_subject`). The driver is chosen through an *entity driver link* picker — present in the [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) applet's Main Details; when a document is converted from a source document the driver is copied across (`GenericDocLinkService` L654). See *Troubleshooting* if the listing is empty.
2. **Server-side read permission on internal outbound delivery orders.** `TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_READ_TGT_GUID` assigned to the driver (via Permission Wizard / Permission Set / User or Role Permission) with the branches they deliver for as targets. The branch targets feed both the listing filter and the Advanced Search branch list.
3. **Update permission to save.** `TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_UPDATE_TGT_GUID`, or `TNT_TENANT_ADMIN` / `TNT_TENANT_OWNER`; without it the SAVE button is disabled.
4. **Branches and locations** in [Organisation](/applets/master-data/organisation-applet/) — every document must carry a company, branch and location or the edit form is invalid and SAVE stays disabled.

### Applet settings

Settings live in four places: the **shared field-configuration screen** from `blg-shared-utilities` (menu label *Application Settings*, route `field-settings`), the applet-local **Default Selection** and **Custom Status** screens, and the per-user **Personalisation › Default Selection**. All are saved as the applet's master settings (`saveMasterSettingsInit` / `savePersonalSettingsInit`) and can be changed by anyone who can open the Settings menu — normally the tenant admin.

Only the keys below are read by this applet's code. The shared screen renders about 60 toggles for this applet (line-price hides, tab hides, item-name limit, and so on); the rest are saved but nothing in this applet reads them — the Lines grid has fixed columns.

| Setting (screen) | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_POSTING_STATUS` — *Default Posting Status* (Application Settings › Gen Doc Listing Settings) | Initial posting-status filter of the listing: `ALL`, `DRAFT`, `FINAL`, `VOID`, `DISCARDED` | unset → no filter (all statuses) | Set to `FINAL` to show drivers only finalised delivery orders; `DRAFT` hides everything the office has not yet released |
| `SORT_ORDER` — *Sorting Order* (same section) | Column the listing is sorted by (descending): `created_date`, `updated_date`, `date_txn`, `doc_reference_date_txn` | unset → `updated_date` | Takes effect on the next search; an Order By chosen in Advanced Search overrides it for the session |
| `HIDE_GENDOC_SAVE_BUTTON` — *HIDE_SAVE_BUTTON* (same section) | Hides the SAVE button on the edit screen | off | Turns the applet read-only for everyone (the driver can still open documents) |
| `HIDE_CREATED_BY_DETAILS` (Application Settings › Doc Settings) | Hides the Created By / Created Date / Modified By / Modified Date block on Main Details | off | Cosmetic |
| `HIDE_DELIVERY_LOCATION` (Application Settings › Doc Settings) | Intended to hide delivery branch / location; in this applet those controls are not rendered, but the flag also gates the patching of **Account** and **Delivery time slot** into the form | off | When **on**, Account and Delivery time slot show blank on every document, and saving writes the blank time slot back — leave it off |
| `HIDE_TOTAL_DISCOUNT_AMOUNT` (Application Settings › Lines Settings) | Hides the Discount Amount total above the Lines grid | off | Cosmetic |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` (Default Selection) | Fallback company / branch / location for the edit form when a document has none; choosing a branch fills its `MAIN_LOCATION` and company | null (RESET writes null) | Rarely visible — every delivery order already carries its own branch and location |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_TOGGLE_COLUMN` (Personalisation › Default Selection) | Per-user override of the defaults above; toggle column `SINGLE` / `DOUBLE` | null | Branch list is limited to the user's read-permission branch targets; no consumer of `DEFAULT_TOGGLE_COLUMN` was found in this applet's own code (the shared layout may read it) |

{{< figure src="/images/driver-delivery-applet/application-setting-driver-do.png" alt="Application setting for driver delivery order applet" caption="Application Settings: the shared field-configuration screen. Only the handful of keys listed above are read by this applet." >}}

{{< figure src="/images/driver-delivery-applet/default-selection.png" alt="Default selection on Driver Delivery Order Applet" caption="Default Selection: default branch and location." >}}

**Rendered but not consumed (no effect in this applet).** `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_CLOSE_BUTTON` are read by `showFinal()` / `showDiscard()` / `showClose()`, but the buttons those methods guard are commented out of the template. `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` is read by a bulk-final handler that no control calls. `PRINTABLE` is loaded into a printable-format control that is never shown. `DISABLE_GEN_DOC_LISTING` is copied into the container and never tested. The **Custom Status** screen (`ENABLE_CUSTOM_STATUS_1..5`, `ENABLE_CUSTOM_STATUS_HDR_n`, `ENABLE_CUSTOM_STATUS_LINE_n`, `LIST_CUSTOM_STATUS_HDR_n` / `LINE_n`, `NAME_CUSTOM_STATUS_*`) saves its lists, but no screen in this applet reads them: the header reducer always writes `custom_status: null`, and the edit form has no status control.

{{< figure src="/images/driver-delivery-applet/custom-status.png" alt="Custom status on Driver Delivery Order Applet" caption="Custom Status: the lists are saved, but nothing in this applet displays or applies them (checked at commit 385299a)." >}}

### Document behaviour settings

No exposed control found: the applet has no FINAL, VOID, DISCARD or CLOSE control, no printable selection and no e-Invoice or workflow toggle (routes, `menu-items.ts`, the edit template and the settings components checked at commit 385299a65b). Posting status is set in the upstream [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) applet.

### Feature visibility / permissions

**Server-side (what actually gates the applet).** The backend's document-type handler for `INTERNAL_OUTBOUND_DELIVERY_ORDER` uses four permissions (`TntErpPermissions`):

| Permission | Effect in this applet |
|---|---|
| `TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_READ_TGT_GUID` | Required to list; its branch targets (`bl_fi_mst_branch`) become the listing's branch filter and the Advanced Search / Personalisation branch lists |
| `TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_UPDATE_TGT_GUID` | Enables SAVE (`hasUpdatePermission`); `TNT_TENANT_ADMIN` and `TNT_TENANT_OWNER` also pass |
| `TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_CREATE_TGT_GUID` | Computed (`hasCreatePermission`) but unused — there is no create control |
| `TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_DELETE_TGT_GUID` | Checked by the backend when DELETE is used |

{{< figure src="/images/driver-delivery-applet/permission-wizard.png" alt="Permission wizard on Driver Delivery Order Applet" caption="Permission Wizard: assign the outbound delivery order permissions with branch targets." >}}

{{< figure src="/images/driver-delivery-applet/permission-set.png" alt="Permission set on Driver Delivery Order Applet" caption="Permission Set: bundle the permissions for reuse in User / Role Permission." >}}

{{< figure src="/images/driver-delivery-applet/role-permission.png" alt="Role permission on Driver Delivery Order Applet" caption="Role Permission: give a driver role the read and update permissions." >}}

**Client-side permission codes checked in code but not seeded.** The code looks for `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON` and `SHOW_TRANSACTION_DATE`; `bl_applet_client_side_perm_dfn` holds **no** rows for `driverDeliveryOrderApplet`, and the buttons the first three would reveal are commented out anyway. Applet Access (client-side permission listing) therefore has nothing applet-specific to assign.

**DELETE button.** Shown only when the applet's own settings extension (`bl_applet_ext` with `param_code = APPLET_SETTINGS`) has `SHOW_DOCUMENT_DELETE_BUTTON: true` **and** the document is not `FINAL`. It is a two-click confirm ("CLICK AGAIN TO CONFIRM", 3-second window) and calls the delete endpoint of the internal outbound delivery order service.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Document No | `server_doc_1` (tenant document number) | — | Read-only |
| Account | Customer name from `doc_entity_hdr_json.entityName` | — | Read-only; blank when `HIDE_DELIVERY_LOCATION` is on |
| Vehicle No | `bl_fi_generic_doc_hdr.vehicle_registration_no` | No | Free text (max 100 chars in the table) |
| Delivery Date | `delivery_date_expected` | No | Date picker (touch UI); "Estimated date is not valid" if unparseable |
| Delivery time slot | `track_delivery_remarks` | No | Select: Morning / Afternoon / Evening (stored as `morning` / `afternoon` / `evening`) |
| Created By / Created Date / Modified By / Modified Date | Audit columns | — | Read-only; hidden by `HIDE_CREATED_BY_DETAILS` |

Hidden controls: company, branch and location are in the form with `Validators.required` and are filled from the document (falling back to the Default Selection values). If a document reaches the driver without one of them the form is invalid and SAVE is disabled. When the document is `FINAL`, `VOID`, `DISCARDED` or not `ACTIVE`, branch, company, location, sales agent, transaction date, credit terms, due date, member card, currency and delivery branch / location are disabled — Vehicle No, Delivery Date and time slot stay editable.

### Lines

Read-only grid: Item Code, Item Name, UOM, Qty (`quantity_base`), Unit Price (Inclusive of Tax) (`unit_price_txn`), SST/VAT/GST (`amount_tax_gst`), Txn Amount (`amount_txn`). Only `ACTIVE` lines are shown. Rows whose serial-number list contains an `INVALID` entry are highlighted. Totals above the grid: Discount Amount (hidden by `HIDE_TOTAL_DISCOUNT_AMOUNT`), Tax Amount, Rounding (only when the document has a rounding item) and Txn Amount, each with the foreign-currency equivalent when the document currency differs from the base currency.

## Lifecycle and effects

This applet reads and updates; it never finalises or posts. The only writes are:

- **SAVE** → `PUT` of the whole document container through `InternalOutboundDeliveryOrderService` (`editSalesInvoice$` effect) with the three header fields changed. Before sending, the client refuses to save a foreign-currency document whose `base_doc_xrate` is zero or negative ("The currency rate cannot be ZERO or negative." — a client-side toast, not a backend rejection). A document in `TEMP` status would instead be converted to `ACTIVE`, but no such document can be reached because there is no create control.
- **DELETE** → `DELETE` on the same service (see permissions). Backend permission: `..._DELETE_TGT_GUID`.

**Posting proof block** (for the document type this applet edits; posting happens in the upstream applet, never here):

- *Server document type*: `INTERNAL_OUTBOUND_DELIVERY_ORDER`, short code `OBDODR` (`ServerDocShortCodes` L44).
- *Amount signum*: **0**; *quantity signum*: **0** (`InternalOutboundDeliveryOrderDataConsistencyObject` L16–17). Every line is filled with zero signums (L38, L43).
- *Dr/Cr equation*: none — `JournalPostingTypeHandler` has no entry for this type, so FINAL posts no journal.
- *GL precedence*: not applicable (no journal).
- *Stock processor*: none — a zero quantity signum moves no stock. Open delivery-order lines are, however, counted as committed quantity in [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) (`StockAvailabilityUow` L1005–1008, `do_qty` from the open-line queue).
- *FINAL-time validations in the backend* (`GenericDocumentService`): blacklisted-customer check for outbound delivery orders (L1650); serial-number count must equal `quantity_base` (L1858); when the caller sets `validate_serial_signum_zero` / stock-balance validation for signum-zero documents, serial and stock-balance checks also run for this type (L1858–1860, L2083–2092). These fire when the office finalises the delivery order, not from this applet.
- *What VOID reverses*: nothing financial — no journal and no stock movement exist to reverse. VOID is not available here.

**Driver filter.** `GenericDocumentQueryCriteria.delivery_driver_guids` is applied as `AND hdr.delivery_driver_guid IN (:delivery_driver_guids)` in the header / snapshot queries (`GenericDocumentUow` L684, L2835; `GenericDocumentHdrUow` L275). The applet always sends the logged-in login subject's guid, so the backend — not the client — does the restriction.

**Editing a finalised document.** The form leaves Vehicle No, Delivery Date and time slot editable on `FINAL` documents and SAVE still submits. No backend rule that blocks header edits on a `FINAL` outbound delivery order was found in `GenericDocumentService` (commit 871dbf5c96); treat this as "allowed by the code as read", not as a guarantee.

## Related applets

- [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) — creates and finalises the documents; where the office sets up the delivery order.
- [Internal Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/) — the same document type's full applet page.
- [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) — has the *Delivery Driver* picker (entity driver link → login subject) that writes `delivery_driver_guid`; useful reference for how a driver is linked to a login.
- [Delivery & Installation](/applets/delivery-installation/delivery-installation-applet/) and [Delivery Installation Driver](/applets/delivery-installation/delivery-installation-driver-applet/) — trip and job based delivery execution for larger operations; not connected to this applet's driver field.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — shows open delivery-order quantity as committed stock.
- [Organisation](/applets/master-data/organisation-applet/) — branches used as permission targets.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — the customer on the document.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The listing is empty although delivery orders exist | The driver is not set on the document (`delivery_driver_guid` ≠ the driver's login subject), or the driver lacks `..._READ_TGT_GUID`, or the documents' branches are outside the permission's branch targets | Set the delivery driver on the delivery order; grant the read permission with the right branch targets |
| Only some posting statuses show | `DEFAULT_POSTING_STATUS` is set (for example `DRAFT`) | Set it to `ALL` or clear it; the Advanced Search has no posting-status filter to override it |
| Account and Delivery time slot are blank on every document | `HIDE_DELIVERY_LOCATION` is on — it also skips patching those two fields | Turn it off in Application Settings › Doc Settings |
| SAVE is greyed out | No `..._UPDATE_TGT_GUID` (and not tenant admin / owner), or the document is missing company / branch / location | Grant the update permission; fix the document upstream |
| "The currency rate cannot be ZERO or negative." | Foreign-currency document with `base_doc_xrate` ≤ 0 | Correct the rate in the upstream applet |
| "One of the serial numbers is already locked" on save | Backend error `..._DRAFT_LOCK_SERIAL_NUMBER_..._COMBINATION_ALREADY_EXISTS` — a serial on the lines is draft-locked by another document | Resolve the serial conflict in the sales / delivery order applet |
| Printable Format Settings or Email Template opens a 404 page | Menu entries without routes | Not configurable here; use the upstream applet's printable / email settings |
| Custom statuses were set up but drivers cannot choose one | The Custom Status screen saves lists that nothing in this applet reads | Track delivery outcomes in the upstream applet or the Delivery & Installation applet |
| Listing behaves differently after an upgrade | The listing moved from sub-query search to the snapshot custom header/lines query (Sub Query Remove, 2026-08); the applet was migrated to Angular 14 (2026-04) | No action; report regressions with the document number |

## Related documentation

- [Inventory module](/modules/inventory/)
- [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/)
- [Delivery & Installation applet](/applets/delivery-installation/delivery-installation-applet/)
