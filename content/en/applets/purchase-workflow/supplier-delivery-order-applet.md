---
title: "Supplier Delivery Order Applet"
description: "Lets a login that is linked to a supplier record create and maintain outbound delivery orders for that supplier, and register the supplier's drivers, inside the tenant's BigLedger."
applet_code: "supplierDeliveryOrderApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-supplier-delivery-order-applet"
modules: [purchase-workflow, inventory-workflow]
related_applets: [internal-outbound-delivery-order-applet, driver-delivery-order-applet, internal-sales-order-applet, internal-sales-invoice-applet, supplier-applet-1, organisation-applet, internal-purchase-order-supplier-access-applet, internal-purchase-grn-supplier-access-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/app.routing.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/models/constants/printable-format-constants.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/app.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-listing/sales-invoice-listing.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-listing/sales-invoice-listing.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/sales-invoice-edit.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/sales-invoice-edit.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/line-item/line-item-listing.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/line-item/line-item-create/line-item-create.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/line-item/line-item-create/line-item-create.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/add-line-item.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/item-details.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/edit-line-item/edit-line-item.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/settings-container/custom-status/custom-status.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/settings-container/email-template-container/email-template-create/email-template-create.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/state-controllers/sales-invoice-controller/store/effects/sales-invoice.effects.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/state-controllers/draft-controller/store/effects/pns.effects.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
  fields:
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/account/account.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/account/account-entity-details/select-customer/select-customer-listing.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/line-item/line-item-create/search-item/line-search-item-listing.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/driver-login-container/driver-login/driver-login.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/driver-login-container/driver-login/login-create/login-create.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/driver-login-container/driver-login/login-edit/login-edit.component.html
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/state-controllers/driver-controller/effects/driver.effects.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/state-controllers/draft-controller/store/reducers/hdr.reducers.ts
  lifecycle:
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/state-controllers/sales-invoice-controller/store/effects/sales-invoice.effects.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-listing/sales-invoice-listing.component.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/sales-invoice-edit.component.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-outbound-delivery-order.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/supplier-deliver-order.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/shared/base-api-template-service.model.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalOutboundDeliveryOrderDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityCreditLimitUows/CompanyEntitySalesCreditLimitUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/GenericDocumentConverterFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
  troubleshooting:
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/state-controllers/sales-invoice-controller/store/effects/sales-invoice.effects.ts
    - blg-applet-wavelet-supplier-delivery-order-applet/micro-fe/projects/wavelet-erp/applets/supplier-delivery-order-applet/src/app/components/sales-invoice-container/sales-invoice-edit/sales-invoice-edit.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - gh:bigledger/blg-wiki#151
    - gh:bigledger/blg-applet-wavelet-supplier-delivery-order-applet#1
    - gh:bigledger/blg-int-general-task#6585
tags:
  - purchase-workflow
  - supplier-delivery-order
  - procurement
  - logistics
  - delivery-management
weight: 265
date: 2026-04-06
lastmod: 2026-09-05
draft: false
---

## Overview

The **Supplier Delivery Order Applet** is a supplier-access applet. A user whose login is linked to one or more **supplier** records (see [Supplier Applet](/applets/master-data/supplier-applet-1/)) opens it to create and maintain delivery orders on behalf of those suppliers, and to register the supplier's **drivers** as BigLedger logins. The document it writes is the tenant's ordinary **Internal Outbound Delivery Order** (`INTERNAL_OUTBOUND_DELIVERY_ORDER`, short code `OBDODR`) with the supplier as the document entity — the same document the [Delivery Order Applet (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/) works on, seen through a supplier's window. A delivery order created here can pull lines from an open Sales Order, appears in the driver's [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) once a driver is assigned, and is later knocked off by a Sales Invoice.

It is *not* a purchase-side document: it does not sit between a Purchase Order and a GRN, it moves no stock and posts no journal (see [Lifecycle and effects](#lifecycle-and-effects)).

## Where it fits

| Position | Document / applet | Link |
|---|---|---|
| Upstream (optional) | Sales Order — lines can be knocked off into the delivery order when the company has a `SALES ORDER → OUTBOUND DELIVERY ORDER` line flow | [Sales Order Applet (Internal)](/applets/sales-workflow/internal-sales-order-applet/) |
| Master data | Supplier record the login is linked to; the login itself | [Supplier Applet](/applets/master-data/supplier-applet-1/) |
| Master data | Company, branch, location; Knock Off Configuration (document flow rows) | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Same document, full applet | Internal Outbound Delivery Order — FINAL, VOID, print, e-mail happen there | [Delivery Order Applet (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/) |
| Downstream | Driver's view of the delivery orders assigned to them | [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) |
| Downstream | Sales Invoice knocks off FINAL delivery-order lines (`OUTBOUND DELIVERY ORDER → SALES INVOICE` flow) | [Sales Invoice Applet (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) |
| Sibling supplier-access applets | Supplier views of the purchase-side documents | [Purchase Order Supplier Access](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/), [Purchase GRN Supplier Access](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) |

Modules: Purchase Workflow (supplier access), Inventory Workflow (delivery).

## Screens and menus

Sidebar: **Supplier Delivery Order** (listing) and **Driver Listing**; **Settings** and **Personalization** at the bottom.

{{< figure src="/images/supplier-delivery-order-applet/main-listing-page.png" alt="Supplier Delivery Order Listing on the left, Edit Supplier Delivery Order with Main Details, Account and Lines tabs on the right" caption="Clicking + creates the document immediately and opens it in the Edit column; the Doc Short Code shows OBDODR because the record is an internal outbound delivery order." >}}

**Supplier Delivery Order Listing** — grid columns Doc No, Doc Status, Doc Date, Doc validity date, Branch, Location, Destination, Vehicle No, Delivery Date, Created Date, Modified Date; **+** (Create), search / advanced search, column toggle, pagination. The grid allows multi-select, but the status bar is an empty stub, so there are no batch actions.

**Edit Supplier Delivery Order** — opened by **+** or by clicking a row. Tabs **Main Details**, **Account** (sub-tabs Entity Details, Bill To, Ship To), **Lines**. Header actions: **SAVE**; **DELETE** below the tabs (two clicks to confirm) when enabled. FINAL, DISCARD, VOID and CLOSE exist as handlers but their buttons are commented out of the template, so they are not shown for anyone.

**Lines** — line list with **+** (Add Line Item, disabled once the document is FINAL / VOID / DISCARDED) and totals. Add Line Item opens **Line Item Create** with tabs **Search Item**, **KO For Sales Order** (only when the company has an enabled `INTERNAL_SALES_ORDER → INTERNAL_OUTBOUND_DELIVERY_ORDER` LINE flow) and **KO For Sales Invoice** (only when an `INTERNAL_OUTBOUND_DELIVERY_ORDER` LINE flow exists — the tab is labelled "Sales Invoice" but is wired to pull Sales Invoice lines into the delivery order; see [Troubleshooting](#troubleshooting)). Selecting an item opens **Add Line Item** with **Item Details** (Main Details, Department, Doc Link, Delivery Details, Delivery Trips) and **Pricing Details**; editing a saved line adds Serial / Batch / Bin Number, Costing Details and Issue Link tabs.

**Driver Listing** — grid of driver logins (User, Supplier, Status, Modified Date) for the suppliers the current login is linked to; **+** opens **Driver Login Create** (supplier, e-mail or phone, verify / send TAC / send invite, status); a row opens **Driver Login Edit** (rank, status, Remove).

**Settings** (System Configuration group): Application Settings, Default Selection, Printable Format Settings, Custom Status, Email Template. Routes also exist for Webhook, Feature Visibility, permission wizard / set / user / team / role / client-side listings, Release Notes and Applet Log; the shared settings shell adds its own permission and developer-tool links. **Personalization**: Default Selection (Sidebar route exists, not in the menu).

## Configuration

### Before you can use it

- **A login linked to a supplier.** The listing, the supplier picker and Driver Listing all start from `bl_fi_mst_entity_login_subject_link` rows for the current login, keep only entities with `is_supplier = true`, and filter by those entity GUIDs. A login with no supplier link sees an empty listing and an empty picker, whatever its permissions. Create the link in the [Supplier Applet](/applets/master-data/supplier-applet-1/) (Supplier → Login).
- **Server-side permission targets** for the *internal outbound delivery order* document type: `TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` (`GenericDocumentTypeHandler` L121-127; `TntErpPermissions` L1051+). The **+** button needs CREATE (or `TNT_TENANT_ADMIN` / `TNT_TENANT_OWNER`); **SAVE** needs UPDATE; the listing is filtered by the READ targets' branches. Assign them through Settings → Permission Wizard.
- **Company, branch, location** in the [Organisation Applet](/applets/master-data/organisation-applet/) — Company, Branch and Location are required on Main Details.
- **Knock Off Configuration** (Organisation → Company) if lines are to be pulled from Sales Orders (`INTERNAL_SALES_ORDER → INTERNAL_OUTBOUND_DELIVERY_ORDER`, flow type LINE, enabled) or if Sales Invoices must later find these delivery orders (`INTERNAL_OUTBOUND_DELIVERY_ORDER → INTERNAL_SALES_INVOICE`). Without the second row FINAL (done in the Internal applet) creates no open-queue rows.
- **Items** with transaction class `PNS` in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the item search filters `txn_class = PNS`.
- No GL codes, tax codes, cashbooks or document numbering are needed: the document has no journal and the Doc No fields are free text.

### Applet settings

Settings live in the **shared** `FieldConfigurationComponent` from blg-shared-utilities (Settings → Application Settings, route `field-settings`, keyed by `sessionStorage.appletCode = supplierDeliveryOrderApplet`), plus an applet-local **Default Selection** (master) and **Personalization → Default Selection** (personal). There is no inline gear on any screen, and the applet-local `field-configuration.component` is an unrouted stub with unbound toggles. The shared screen renders roughly 400 controls for this applet code; the table lists only the keys the applet reads on a reachable screen (four proofs: shared form control, `saveMasterSettingsInit`, consumer file cited in `sources`). Verified at the shared-utilities commit pinned by the applet (`e2f57c4`) and at HEAD (`a8c38a2`) — identical for every key below. Anyone with access to the Settings menu can change them; they are tenant-wide.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_POSTING_STATUS` | Posting-status filter applied to the listing on open (`ALL`, `DRAFT`, `FINAL`, `VOID`, `DISCARDED`) | unset (no filter) | `ALL` or unset shows every status; any other value restricts the listing until the user searches |
| `SORT_ORDER` | Listing sort column | unset (`updated_date`) | Reorders the listing |
| `HIDE_LOCATION` | Location picker on Main Details | off | Hides the picker; Location stays required, so a document without one cannot be saved (see Troubleshooting) |
| `HIDE_DELIVERY_BRANCH` / `HIDE_DELIVERY_LOCATION` | Delivery Branch / Delivery Location pickers on Main Details | off | Hides the picker; the header values are still copied to every line on SAVE |
| `HIDE_CREATED_BY_DETAILS` | Created By / Created Date / Modified By / Modified Date block | off | Hides the block |
| `HIDE_GENDOC_SAVE_BUTTON` | The SAVE button on the edit screen | off | With it on there is no way to save — the only other action is DELETE |
| `SHOW_DOCUMENT_DELETE_BUTTON` | DELETE button on the edit screen (read raw from `bl_applet_ext` `APPLET_SETTINGS` when the screen opens) | off | Shows DELETE for documents that are not FINAL |
| `HIDE_TOTAL_DISCOUNT_AMOUNT` | Total-discount line in the Lines footer | off | Hides the figure |
| `HIDE_DEPARTMENT` | Department tab on Add / Edit Line Item | off | Hides the tab and skips department defaults on the line |
| `HIDE_DELIVERY_DETAILS` | Delivery Details tab on Add / Edit Line Item | off | Hides the per-line delivery branch / location / instructions |
| `HIDE_DOC_LINK`, `HIDE_DELIVERY_TRIPS` | Doc Link and Delivery Trips tabs (edit mode only) | off | Hides the tab |
| `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER` | Serial / Batch / Bin Number tabs for items of that sub-type | off | Hides the tab; quantities are still validated against serial counts at FINAL time in the Internal applet |
| `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_ISSUE_LINK` | Costing, Pricing and Issue Link tabs on Edit Line Item | off | Hides the tab |
| `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT` | Caps the item-name length on the line (`maxlength` on the input); the number field renders only when the toggle is on | off / empty | Longer names are truncated at entry |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | SST/VAT and WHT selectors on the line | off | Hides the selector |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | Quantity columns on the line form | off | Hides the field |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX` | Standard unit-price fields | off | Hides the field |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX` | Discount fields | off | Hides the field |
| `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX` | Net / transaction unit-price fields | off | Hides the field |
| `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN` | Line amount fields | off | Hides the field |
| `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` | Passes `checkDraftLock` to serial-number validation when a serialised line is added or the document is finalised | off | On: a serial number already locked by another draft document is rejected with "One of the serial numbers is already locked" |

**Default Selection (master, applet-local)** — `DEFAULT_COMPANY`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION` (branch and location pickers; saved with `saveMasterSettingsInit`). Consumed: the effects load company/branch from them when a document opens and Main Details pre-fills the location. RESET nulls the three keys plus `DEFAULT_VALIDITY_DAYS`.

**Personalization → Default Selection** — personal `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`, `DEFAULT_TOGGLE_COLUMN` (`SINGLE` collapses the listing to one column). Personal values win over master when present.

**Read at runtime without a live control or without effect** (do not expect them to do anything here):

- `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_CLOSE_BUTTON` — rendered on the shared screen and read by `showFinal()` / `showDiscard()` / `showClose()`, but those methods are only referenced from commented-out buttons.
- `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` — read by the FINAL effect; the shared screen does not render it for this applet code and FINAL is unreachable here.
- `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_KO_FOR_TAB`, `HIDE_POSTING_TAB`, `HIDE_DEPARTMENT_HDR_TAB` — read only by the standalone Create screen, which no route or button reaches (**+** creates a TEMP document and opens Edit directly); the tab-hide toggles are also not rendered for this code (`tabMappings` has no `supplierDeliveryOrderApplet` entry).
- `PRINTABLE` — read as the default printable format for batch print, which is dead (below); no control writes this key here.
- `DEFAULT_CUST_TYPE`, `DEFAULT_COUNTRY`, `DEFAULT_CURRENCY` — read by the embedded "create entity" form inside the supplier picker; no control on any screen.
- `ENABLE_CUSTOM_STATUS_{1..5}` / `_HDR_` / `_LINE_` (Custom Status screen) — rendered and saved, but the header reducer always writes `custom_status: null`; nothing consumes them.
- `ENABLE_AUTO_POPUP`, `HIDE_CUSTOMER_CODE` — commented-out consumers only.

### Document behaviour settings

- **Status flow** — no applet setting. SAVE on a new document converts TEMP → ACTIVE/DRAFT; FINAL, VOID, DISCARD and CLOSE have no button in this applet (handlers exist for listing multi-select and the edit header, both unbound). Use the [Delivery Order Applet (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/) to finalise.
- **Printables** — Settings → Printable Format Settings lists formats with `txn_type = INTERNAL_OUTBOUND_DELIVERY_ORDER` and stores the default under the extension code `INTERNAL_OUTBOUND_DELIVERY_ORDER_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_INTERNAL_OUTBOUND_DELIVERY_ORDER`. The applet's batch-print effect calls the endpoint `supplier-delivery-orders`, which has no backend handler (only `internal-outbound-delivery-orders` is registered), so printing from this applet cannot work; there is no print button in the template either.
- **Email Template** — templates are saved with `txn_type = INTERNAL_OUTBOUND_DELIVERY_ORDER_EMAIL_TEMPLATE` (shared with the Internal applet); the send-email effect in this applet is commented out, so templates created here are only usable from the Internal applet.
- **Workflow / approval, e-Invoice** — no exposed control found (routes, `menu-items.ts`, edit and listing templates checked at commit `b55dd81`).

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Supplier ↔ login link (`bl_fi_mst_entity_login_subject_link`, `is_supplier`) | Supplier Applet → Login | Defines which suppliers (and therefore which documents and drivers) the user sees |
| Knock Off Configuration rows `INTERNAL_SALES_ORDER → INTERNAL_OUTBOUND_DELIVERY_ORDER` (LINE) | Organisation → Company | Shows the KO For Sales Order tab in Line Item Create |
| Knock Off Configuration row `INTERNAL_OUTBOUND_DELIVERY_ORDER → INTERNAL_SALES_INVOICE` (LINE) | Organisation → Company | Lets FINAL (in the Internal applet) create open-queue rows that the Sales Invoice applet's KO tab finds; also shows the mislabelled "KO For Sales Invoice" tab here |
| `posting_final_json` include / exclude processor list | Organisation → Company | Decides which FINAL processors run for the document (journal, stock, open queue); the document is signum 0/0 so only the open-queue processor has an effect |
| Printable formats for `INTERNAL_OUTBOUND_DELIVERY_ORDER` | Delivery Order Applet (Internal) → Printable Format Settings | Same records as this applet's Printable Format Settings screen |

### Feature visibility / permissions

- **Server-side**: `TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` (plus `TNT_TENANT_ADMIN` / `TNT_TENANT_OWNER` as overrides for create and save). DELETE is enforced by the backend (`deletePerm`) even when the button is visible.
- **Client-side codes checked in code**: `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON` (listing and edit). **None are seeded** in `bl_applet_client_side_perm_dfn` for `supplierDeliveryOrderApplet` (0 rows), and `app.component.ts` builds the permission list but never dispatches it to the store (the `map` callback has no return), so even seeded codes would not take effect. The Settings → Feature Visibility route renders the shared stub.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Doc Short Code | Backend short code | — | Read-only; always `OBDODR` |
| Doc No (Tenant) | Tenant-level number | — | Read-only, assigned by the backend |
| Doc No (Company), Doc No (Branch) | Free-text references (`company_doc_no`, `branch_doc_no`) | No | Not generated |
| Company | Owning company | Yes | Set through the Branch picker |
| Branch | Owning branch (`guid_branch`) | Yes | Branch picker (branches the READ targets allow) |
| Location | Stock location (`guid_store`) | Yes | Hidden by `HIDE_LOCATION` but still required |
| Delivery Branch, Delivery Location | Where the goods go (`delivery_branch_guid`, `delivery_location_guid`) | No | Copied to every line on SAVE, with the codes |
| Reference | `reference` | No | Free text |
| Delivery Driver | `delivery_driver_guid` — a driver login registered under Driver Listing | No | Picker of entity-driver links; this is what makes the document appear in the Driver Delivery Order applet |
| Vehicle No | `vehicle_registration_no` | No | Free text |
| Delivery Date | `delivery_date_expected` | No | Read-only in this build (populated on load only) |
| Transaction Date | `date_txn` | No | Read-only; defaults to the creation time and is re-applied by the server on SAVE |
| Base Currency, Currency Rate | `base_doc_ccy` (disabled), `base_doc_xrate` | No | SAVE is refused client-side when the currencies differ and the rate is ≤ 0 ("The currency rate cannot be ZERO or negative."); the backend repeats the check at FINAL (`FOREX_DOC_REQUIRES_NON_ZERO_XRATE`) |
| Ship Via, Tracking ID, Remarks, External Remarks | `ship_via`, `tracking_id`, `remarks`, `external_remarks` | No | Free text |
| Created By / Date, Modified By / Date | Audit block | — | Read-only; hidden by `HIDE_CREATED_BY_DETAILS` |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity Id | The supplier the document belongs to (`doc_entity_hdr_guid`) | Yes | **Select Supplier** lists only suppliers linked to the current login; the tab turns red while empty |
| Status, Identity Type, Currency, Description, Entity Name, Entity Type, ID Number, Email, Phone Number | Snapshot of the selected supplier (`doc_entity_hdr_json`) | — | Filled from the supplier record; edit them in the Supplier Applet |
| Bill To, Ship To | Billing / shipping address and contact | No | Chosen from the supplier's addresses; only `Entity Id` is validated |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | `PNS` item from the item search | Yes | Item search is limited to `txn_class = PNS` |
| Quantity (UOM / base) | `quantity`, `quantity_base` | Yes | Minimum 1 |
| UOM, UOM-to-base ratio | Unit of measure | No | |
| Unit price (std / net / txn), discount, tax, WHT | Pricing columns | Net / tax-inclusive / transaction amounts are required, minimum 0 | Recalculated by the pricing helpers; amount signum is forced to 0 by the backend |
| Serial / Batch / Bin numbers | Per sub-item type | Only when the item's sub-type needs them | Serial count must equal quantity at FINAL (`GENERIC_DOC_LINE_QTY_BASE_AND_SERIAL_NUMBER_QTY_DOES_NOT_MATCH`) |
| Department (segment, dimension, profit centre, project), Delivery Details, Delivery Trips, Doc Link, Issue Link | Optional tabs | No | Delivery Details falls back to the header delivery branch / location |

At least one line is required before SAVE is enabled (`disableSave()`).

### Driver Login (Driver Listing)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Supplier | Supplier the driver works for (`entity_hdr_guid`) | Yes | Only the login's linked suppliers are offered |
| User email or phone number | The driver's BigLedger login | Yes | E-mail or phone pattern; **Verify** looks the login up; **Send Invite** creates it; **Send Tac** / **Verify Tac Code** confirm a phone |
| Status | `ACTIVE` / `INACTIVE` | Yes | Defaults to ACTIVE |
| Rank (edit only) | Free text stored on the link | No | |

Saving posts a `bl_fi_mst_entity_login_subject_link` row and, if none exists, a `bl_fi_mst_entity_driver_link` row for the same subject — the pair the Delivery Driver picker and the [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) rely on.

## Lifecycle and effects

| Status (`status` / `posting_status`) | How you get there | What you can do |
|---|---|---|
| TEMP / — | **+** on the listing (`POST …/internal-outbound-delivery-orders/temp/backoffice-ep`). A TEMP row and a temp-queue entry are created before you type anything | Fill the header, pick the supplier, add lines; SAVE; DELETE |
| ACTIVE / DRAFT | First SAVE (`PUT …/internal-outbound-delivery-orders` with `status = ACTIVE`; the backend sets `posting_status = DRAFT`) | Edit and SAVE again; add / edit / delete lines; DELETE |
| ACTIVE / FINAL | Not reachable from this applet (no button). Finalise in the Delivery Order Applet (Internal) | Header and lines are locked; DELETE hidden |
| VOID, DISCARDED | Not reachable from this applet | Read-only |
| DELETED | DELETE (`DELETE …/internal-outbound-delivery-orders/{guid}`; needs the DELETE permission) | Row disappears from the listing |

Leaving the edit screen without SAVE leaves the TEMP row behind; TEMP rows are excluded from the listing.

**Posting proof block** (backend, commit `1ff620ef0e`):

- *Server document type*: `INTERNAL_OUTBOUND_DELIVERY_ORDER`. The applet's own constants say `SUPPLIER_DELIVERY_ORDER` (`AppletConstants.docType`, the header's initial state, the discount and rounding lines), but the backend has no such type: `createTemp` overwrites the header with the handler's `INTERNAL_OUTBOUND_DELIVERY_ORDER` (`GenericDocumentController` L3320), and every later PUT is validated by `InternalOutboundDeliveryOrderDataConsistencyObject.checkServerDocType` — a header with any other value is rejected with `GENERIC_DOC_HDR_INVALID_SERVERDOCTYPE`. `client_doc_type` stays `SUPPLIER_DELIVERY_ORDER`, which is the only marker distinguishing these rows from delivery orders created in the Internal applet.
- *Amount signum*: `0` (`correctAmountSignum = BigDecimal.ZERO`, DCO L16). *Quantity signum*: `0` (L17). `fillQuantitySignumAndAmountSignumForLine` stamps both on every line.
- *Dr/Cr equation*: none. `JournalPostingTypeHandler` has no entry for this type and the fallback name check (`contains("SALES")` / `contains("PURCHASE")`) yields an empty sub-ledger list, so `JournalPostingService.createJournalGenDocPosting` builds zero lines and throws `NO_JOURNAL_CREATED` (L580) if the journal processor is ever invoked; there is no AR/AP entry.
- *GL precedence*: not applicable (no journal).
- *Stock processor*: none — quantity signum 0 means no `bl_inv_txn_line` rows. Open DO quantity is *reported* as committed stock (`do_qty` in `StockAvailabilityUow` L1005-1008) and counts toward the customer's open credit (`CompanyEntitySalesCreditLimitUow` L277-278).
- *FINAL* (in the Internal applet): `validateGenericDocumentOnFinal` — fiscal-period lock (`FISCAL_PERIOD_LOCKED`), forex rate (`FOREX_DOC_REQUIRES_NON_ZERO_XRATE`), blacklisted entity (`disallowBlacklistedCustomer`, applied to this type at L1650), serial count = quantity; then `GenericDocumentPrimaryProcessor` runs the processors the company's `posting_final_json` allows, of which only `GenericDocLineOpenQueueProcessor` does anything here — it writes `bl_fi_generic_doc_line_open_queue` rows for each enabled `bl_fi_comp_gendoc_flow_config` row whose `server_doc_type_1 = INTERNAL_OUTBOUND_DELIVERY_ORDER`. The `DeliveryOrderToSalesInvoiceConverter` (`GenericDocumentConverterFactory` L20) can turn the FINAL DO into a Sales Invoice.
- *VOID* (in the Internal applet): refused while any active link has this document as source (`GENERIC_DOCUMENT_HAS_TARGET_LINKS`, controller L2940-2958) or when e-Invoice is enabled for the tenant; otherwise the open-queue rows are cancelled. Nothing to reverse in the ledger or stock.

**Knock-off links** — when lines are pulled in from a Sales Order, the applet posts `bl_fi_generic_doc_link` rows (`guid_doc_2_hdr` = this document) and re-syncs them on every SAVE (`syncGenDocLinksWithGenDocHdr`, DRAFT); the Sales Order's `qty_open` is reduced only when the DO is FINAL.

## Related applets

- [Delivery Order Applet (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/) — the same document type with the full action set; finalise, void, print and e-mail there.
- [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) — drivers registered under Driver Listing see the delivery orders whose Delivery Driver is them.
- [Sales Order Applet (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — source of the KO For Sales Order tab.
- [Sales Invoice Applet (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — knocks off FINAL delivery-order lines through the company flow row.
- [Supplier Applet](/applets/master-data/supplier-applet-1/) — supplier records and the supplier ↔ login links that scope everything in this applet.
- [Organisation Applet](/applets/master-data/organisation-applet/) — company, branch, location and Knock Off Configuration.
- [Purchase Order Supplier Access](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/) and [Purchase GRN Supplier Access](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) — the other supplier-facing applets, built on the same login-link filter.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Listing is empty although documents exist; Select Supplier shows nothing | The login has no `entity_login_subject_link` to an entity flagged as supplier — the applet filters every query by those links | Link the login to the supplier in the Supplier Applet (Supplier → Login); check `is_supplier` on the entity |
| **+** is greyed out | No `…OUTBOUND_DELIVERY_ORDER_CREATE_TGT_GUID` target (and not tenant admin / owner) | Grant the create permission target in Settings → Permission Wizard |
| SAVE stays disabled | Company / Branch / Location or Entity Id missing (red tab), or no lines, or no UPDATE permission target | Complete the red tab; add a line; grant the update target |
| Location is required but the picker is missing | `HIDE_LOCATION` is on — the validator stays | Turn the setting off, or rely on `DEFAULT_LOCATION` in Default Selection, which pre-fills the hidden control |
| "The currency rate cannot be ZERO or negative." on SAVE | Header currency differs from the base currency with an empty rate | Enter the rate (client-side check; the backend repeats it at FINAL) |
| "One of the serial numbers is already locked" | `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` is on and another draft holds the serial (`…DRAFT_LOCK_SERIAL_NUMBER…ALREADY_EXISTS`) | Release the serial from the other draft or pick another unit |
| Where are FINAL / VOID / DISCARD / Print / Email? | Their buttons are commented out of this applet's templates and the batch-print effect targets an endpoint (`supplier-delivery-orders`) that the backend does not register | Finalise, void and print in the Delivery Order Applet (Internal); the document is the same row |
| The document shows Doc Short Code `OBDODR` and appears in the Internal delivery-order listing | By design — it *is* an internal outbound delivery order with the supplier as entity (`client_doc_type = SUPPLIER_DELIVERY_ORDER` is the only marker) | Filter the Internal listing by entity if the two populations must be kept apart |
| Backend rejects a PUT with `GENERIC_DOC_HDR_INVALID_SERVERDOCTYPE` | The header `server_doc_type` was changed from `INTERNAL_OUTBOUND_DELIVERY_ORDER` (e.g. by an import or a stale client) | Keep the backend value; the applet's `SUPPLIER_DELIVERY_ORDER` constant is only used for `client_doc_type` and for discount / rounding *lines* |
| Discount or rounding lines carry `server_doc_type = SUPPLIER_DELIVERY_ORDER` while item lines say `INTERNAL_OUTBOUND_DELIVERY_ORDER` | The applet stamps the two generated lines with its own constant and the backend keeps a non-null line value | Harmless for posting (signum 0) but reports that filter lines by document type will miss them; raised as an applet bug in the lane findings |
| "KO For Sales Invoice" tab appears / does not appear | The tab is gated by any enabled `INTERNAL_OUTBOUND_DELIVERY_ORDER` LINE flow row and is wired as `INTERNAL_SALES_INVOICE → INTERNAL_OUTBOUND_DELIVERY_ORDER` (copy of the Internal applet's tab set) | Treat it as unsupported here; pull lines from Sales Orders only |
| Driver cannot see the delivery order in the Driver Delivery Order applet | Delivery Driver not set on Main Details, or the driver login was created without the `entity_driver_link` row | Register the driver under Driver Listing (this creates both links), then pick them as Delivery Driver and SAVE |
| Sales Invoice cannot find the delivery order for knock-off | FINAL was never done (this applet cannot), or the company has no enabled `INTERNAL_OUTBOUND_DELIVERY_ORDER → INTERNAL_SALES_INVOICE` row | Finalise in the Internal applet; add the flow row under Organisation → Company → Knock Off Configuration |
| Reviewer question from the guide tracker: "why does the create screen say Internal Delivery Order?" | The standalone Create screen is unreachable in the current build; **+** opens **Edit Supplier Delivery Order** directly | No action — the screenshot above shows the actual flow |

Known issues: the only repo issue is the Angular 14 migration (applet #1, closed 2026-03); the sub-query removal task (general task #6585, closed 2026-08) replaced the listing's snapshot queries — no functional change.

## Related documentation

- [Purchase Workflow applets](/applets/purchase-workflow/) — the supplier-access family this applet belongs to.
- [Delivery Order Applet (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/) — full lifecycle of the same document.
- [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) — the driver's side.
- [Supplier Applet](/applets/master-data/supplier-applet-1/) — supplier ↔ login links.
- No user guide covers this applet yet (wiki tracker #151 closed as pending).
