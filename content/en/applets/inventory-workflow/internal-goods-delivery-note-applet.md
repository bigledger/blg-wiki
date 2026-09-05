---
title: "Goods Delivery Note (Internal)"
description: "Reference for the Goods Delivery Note (Internal) applet — the customer-facing delivery record that knocks off sales orders, jobsheets and outbound delivery orders without moving stock or posting to the ledger: screens, settings, fields, what FINAL does and does not do, and the errors you will meet."
applet_code: "InternalGoodsDeliveryNote"
applet_repo: "blg-applet-wavelet-internal-goods-delivery-note-applet"
modules: [inventory]
related_applets: [internal-sales-order-applet, internal-jobsheet-applet, internal-outbound-delivery-order-applet, internal-delivery-order-applet, internal-sales-gin-stock-out-applet, customer-maintenance-applet, employee-applet, membership-admin-applet, organisation-applet, doc-item-maintenance-applet, warehouse-management-applet, tax-configuration-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/models/constants/printable-format-constants.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/main.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/settings-container/settings-container.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/add-line-item/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/add-line-item/add-line-item.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-edit/goods-delivery-note-edit.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-edit/export/export.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/app.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-akaun-mf-app-ng/micro-fe/projects/akaun-platform/shells/akaun-shell/src/app/modules/applet-loader/applet-loader.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - akaun_master.bl_applet_hdr (code InternalGoodsDeliveryNote, property_json.es_module_url, read 2026-09-05)
    - akaun_master.bl_applet_client_side_perm_dfn (applet_guid 923e047b-…, 22 rows on 2026-09-05)
  fields:
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/goods-delivery-note-create.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/goods-delivery-note-create.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/account/account-billing-address/account-billing-address.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/account/account-shipping-address/account-shipping-address.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/department/department.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/line-item/line-item-create/line-item-create.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/add-line-item/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/add-line-item/batch-number/batch-number.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/add-line-item/bin-number/bin-number.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/settlement/add-settlement/add-settlement.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-listing/goods-delivery-note-listing.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/models/internal-goods-delivery-note.model.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/models/advanced-search-models/internal-goods-delivery-note.model.ts
  lifecycle:
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-edit/goods-delivery-note-edit.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-edit/goods-delivery-note-edit.component.html
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-listing/goods-delivery-note-listing.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/state-controllers/internal-goods-delivery-note-controller/store/effects/internal-goods-delivery-note.effects.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/line-item/line-item-create/ko-for-delivery-order-item/ko-for-delivery-order-item.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-edit/edit-line-item/knockoff-add/knockoff-add.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalGoodsDeliveryNoteDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/journalPosting/JournalPostingJobProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/journalPosting/JournalPostingJobProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - akaun_master.bl_applet_trigger_template_processor_link (subscribers of BLG_ERP_GENERIC_DOCUMENT_PRIMARY_PROCESSOR, read 2026-09-05)
  troubleshooting:
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/goods-delivery-note-create.component.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/models/constants/toast.constants.ts
    - blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/state-controllers/internal-goods-delivery-note-controller/store/effects/internal-goods-delivery-note.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - gh:bigledger/blg-applet-wavelet-internal-goods-delivery-note-applet#1
    - gh:bigledger/blg-applet-wavelet-internal-goods-delivery-note-applet#3
    - gh:bigledger/blg-applet-wavelet-internal-goods-delivery-note-applet#5
    - gh:bigledger/blg-wiki#69
    - gh:bigledger/blg-wiki#70
tags:
- inventory-workflow
- goods-delivery-note
- delivery
- knock-off
- sales-fulfilment
weight: 60
aliases:
- /applets/inventory-workflow/internal-goods-dispatch-note-applet/
---

## Overview

The Goods Delivery Note (Internal) is the document you raise when goods are handed to a customer against a sales order, a jobsheet or an outbound delivery order. It carries the customer, the delivery address, the sales agent and the itemised lines, and it knocks off the open lines of the upstream document so that the order shows what has been delivered. It is a **non-posting** document: FINAL neither moves stock nor writes to the general ledger (both signums are fixed at 0 in the backend — see [Lifecycle and effects](#lifecycle-and-effects)). Stock leaves the location through the stock-out document you use alongside it (delivery order stock-out or sales GIN).

{{< callout type="info" >}}
This page replaces the earlier "Goods Dispatch Note (Internal)" page. The applet registry has exactly one ACTIVE row for this document, `InternalGoodsDeliveryNote` "Goods Delivery Note (Internal)". A sibling code base for a *Goods Dispatch Note* (server document type `INTERNAL_GOODS_DISPATCH_NOTE`, short code `GDSPNT`) exists in the backend and as a separate front-end repository, but no applet is registered for it and it cannot be installed on a tenant; nothing on this page describes it.
{{< /callout >}}

The applet was cloned from the Sales Credit Note applet. That is why the create/edit screens still carry a Settlement tab and a Contra tab, why the header model is named `ISCNMain` and why the success toast after Create reads *Sales CreditNote created successfully*. These are cosmetic leftovers; the document type sent to the server is always `INTERNAL_GOODS_DELIVERY_NOTE`.

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) | *KO For Sales Order Item* lists the order's open lines; each line you take becomes a delivery-note line linked to the order line. |
| Upstream | [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) | *KO For Jobsheet Item*, same mechanism. |
| Upstream | [Outbound Delivery Order (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/) | *KO For Delivery Order Item* (filters links whose source line is `INTERNAL_OUTBOUND_DELIVERY_ORDER`). |
| Upstream (copy) | Sales Quotation | *Copy Quotation Item* copies quotation lines without a knock-off link. |
| Alongside | [Sales GIN (Stock Out)](/applets/sales-workflow/internal-sales-gin-stock-out-applet/), [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) | The stock movement. A delivery note on its own leaves the stock balance untouched. |
| Downstream | — | No document type in the backend's connector lists consumes a Goods Delivery Note; nothing knocks it off. |
| Master data | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Employee](/applets/master-data/employee-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Organisation](/applets/master-data/organisation-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) | Customer (Account tab), sales agent and member card (Main Details), items (Lines), company / branch / location (Main Details). |

Module: [Inventory](/modules-v2/inventory/).

## Screens and menus

**Left menu**

- **Internal Goods Delivery Note** — the document listing. Columns: Goods DeliveryNote No, Posting Status, Status, Branch, Customer Name, Sales Agent, Created Date, Created by. The listing has a **+** button (create), a column toggle, and a **FINAL** button that finalises every selected row that is not yet FINAL (bulk FINAL).
- **Line Items** — a cross-document listing of delivery-note lines (Goods DeliveryNote No, Item Code, Item Name, Qty, Unit Price, SST/VAT/GST, Txn Amount) with a line editor.

**Create screen** — buttons RESET and CREATE (CREATE is disabled while the Main Details form or the Account > Entity Details form is invalid). Tabs: Main Details, Account (sub-tabs Entity Details, Bill To, Ship To), Lines, Settlement, Department Hdr, Contra.

**Edit screen** — buttons RESET, FINAL, SAVE. Tabs as on the create screen plus Attachments and Export. A **DELETE** button (two-click confirm) appears below the tabs only when the setting `SHOW_DOCUMENT_DELETE_BUTTON` is on and the document is not FINAL.

**Adding a line** — the line picker opens with tabs Search Item, KO By Sales Order Item, KO For Sales Order Item, KO By Jobsheet Item, KO For Jobsheet Item, KO By Delivery Order Item, KO For Delivery Order Item, Copy Quotation Item. The item form then shows Main Details, Delivery Instruction, Department, Costing Details (hideable), Pricing Details and Issue Link, plus a Serial Number, Batch Number or Bin Number tab depending on the item's sub-type.

**Settings menu** (System Configuration): Application Settings, Default Selection, Printable Format Settings. The routes also expose Webhook, Feature Visibility, Client-Side Permission, Permission Set, User / Team / Role Permission screens from the shared library; the settings landing page redirects to Feature Visibility.

**Personalization menu**: Default Selection, Sidebar.

No screenshots are available for this applet yet (the previous page had none either).

## Configuration

### Before you can use it

- **Company, branch and location** in the [Organisation applet](/applets/master-data/organisation-applet/). Branch, Location and Company are required on the Main tab; selecting a branch fills the company.
- **Knock-off configuration** on the company (Organisation → Company → Knock Off Configuration, table `bl_fi_comp_gendoc_flow_config`). The *KO For* tabs only list lines that the upstream document's FINAL placed in the open-line queue; without an enabled source → `INTERNAL_GOODS_DELIVERY_NOTE` row there is nothing to knock off.
- **Customers** in [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — Entity Id is required on the Account tab; the customer's credit terms feed the Credit Terms drop-down.
- **Employees** in the [Employee applet](/applets/master-data/employee-applet/) — the Sales Agent field is required by the form.
- **Member cards** in [Membership Admin](/applets/membership/membership-admin-applet/) — the Member Card field is declared required by the form (see [Troubleshooting](#troubleshooting)).
- **Items** in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/); serial / batch / bin sub-types drive the extra line tabs. Tax codes for the line SST/GST/VAT and WHT selectors come from [Tax Configuration](/applets/master-data/tax-configuration-applet/).
- **Permissions** — the backend checks the targeted permissions `TNT_API_DOC_INTERNAL_GOODS_DELIVERY_NOTE_CREATE_TGT_GUID`, `…_UPDATE_TGT_GUID`, `…_READ_TGT_GUID` and `…_DELETE_TGT_GUID` (TntErpPermissions L5683-5689), assigned through the Permission Set / User / Team / Role screens under Settings.
- **A printable format** uploaded under Settings → Printable Format Settings for transaction type `INTERNAL_GOODS_DELIVERY_NOTE`, if you want to print or export the note.

### Applet settings

Settings live in three places. Anyone with access to the applet's Settings menu can change them; there is no per-setting authority.

1. **Application Settings** is the *shared* `FieldConfigurationComponent` from blg-shared-utilities (route `settings/field-settings`). The screen is keyed by `sessionStorage.appletCode`, which the platform shell sets to the registry code `InternalGoodsDeliveryNote`. That code has **no entry in the screen's tab map** (`getTabValue()`, field-configuration.component.ts L2386-2426), so the ten tab-hide toggles that depend on it (`HIDE_KO_FOR_TAB`, `ENABLE_MULTIPLE_KO`, `HIDE_MAIN_PAYMENT_TAB`, `ENABLE_EDIT_PAYMENT_DATE`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_EXPORT_TAB`) never render for this applet. What remains is 138 toggles and inputs, saved as one JSON under the applet's `APPLET_SETTINGS` extension when you press Save.
2. **Default Selection** (applet-local, and the same screen again under Personalization) shows Default Branch and Default Location. It is not functional: the component never loads the current settings (no subscription to `appletSettings$`), its `save` output has no listener on the route, and no form in the applet reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION`. Changing a value throws in the browser console because the applet container is undefined. Leave it alone.
3. **Printable Format Settings** (applet-local) lists the formats uploaded for `INTERNAL_GOODS_DELIVERY_NOTE` and lets you mark one as default; that writes `PRINTABLE` into `APPLET_SETTINGS`.

Of the 138 controls rendered on Application Settings, **22 are read by this applet's code** (declared in `applet-settings.model.ts`, rendered, persisted, consumed). They are all line-level:

| Setting (Application Settings label) | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_QTY_BASE` | Quantity Base field on the line form | off (field shown; control starts as `null`) | Field disappears from the line Main Details unless the user holds the matching `SHOW_QTY_BASE` permission |
| `HIDE_QTY_UOM` | Quantity by UOM | off | same pattern, permission `SHOW_QTY_UOM` |
| `HIDE_UOM_TO_BASE_RATIO` | UOM to Base Ratio | off | permission `SHOW_UOM_TO_BASE_RATIO` |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` | pricing-scheme price selector | off | permission `SHOW_UNIT_PRICE_STD_PRICING_SCHEME` |
| `HIDE_UNIT_PRICE_STD_EXCL_TAX` / `_INCL_TAX` | Unit Price STD (exclusive / inclusive of tax) | off | permissions `SHOW_UNIT_PRICE_STD_EXCL_TAX` / `_INCL_TAX` |
| `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX` / `_UOM_INCL_TAX` | Unit Price STD by UOM | off | matching `SHOW_…` permissions |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX` | Unit Discount, Unit Discount by UOM | off | matching `SHOW_…` permissions |
| `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX` | Unit Price Net, Unit Price Net by UOM | off | matching `SHOW_…` permissions |
| `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX` | Unit Price Transaction, by UOM | off | matching `SHOW_…` permissions |
| `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN` | STD Amount, Discount Amount, Amount Net, Txn Amount | off | matching `SHOW_…` permissions |
| `HIDE_TAX_CONFIG_SELECTION` | SST/GST/VAT selector on the line | off | permission `SHOW_TAX_CONFIG_SELECTION` |
| `HIDE_WHT_CONFIG_SELECTION` | WHT selector on the line | off | permission `SHOW_WHT_CONFIG_SELECTION` |
| `HIDE_COSTING_DETAILS` ("Hide Costing Details", section *Hide Line Item Main Tabs*) | Costing Details tab on the line form (add, edit, and the Line Items menu) | off (tab shown) | Tab disappears unless the user holds `SHOW_COSTING_DETAILS` |
| `PRINTABLE` (set from Printable Format Settings, not from Application Settings) | Format pre-selected on the Export tab | none | Export tab opens with that format selected; the user can still pick another |

Every `HIDE_*` row is evaluated in the template as `!appletSettings.HIDE_X || SHOW_X`, where `SHOW_X` is the client-side permission of the same name — a tenant-wide hide can be reopened per role (all 22 `SHOW_*` codes are seeded for this applet, see [Feature visibility](#feature-visibility--permissions)).

**Read at runtime without a model declaration**

- `SHOW_DOCUMENT_DELETE_BUTTON` — rendered on Application Settings (section *Doc Settings*), saved with the rest, and read by the edit screen straight from the applet extension (goods-delivery-note-edit.component.ts L97-109). On: the DELETE button appears on non-FINAL documents. Off / unset: no delete from the UI.

**Rendered and saved, but read by nothing in this applet** — the remaining ~116 controls on Application Settings: the listing group (`HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `DEFAULT_TRANSACTION_DATE`, `SORT_ORDER`, `DEFAULT_POSTING_STATUS`, `SHOW_DRAFT_BUTTON` …), the header field hides (`HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_REFERENCE`, `HIDE_REMARKS`, `HIDE_CREDIT_TERMS`, `HIDE_LOCATION`, `HIDE_CURRENCY` …), the *Vertical UI*, *External Documents*, *Entity Details*, *Billing / Shipping*, *Department*, *Contra* and *Email* groups, `ENABLE_AUTO_POPUP`, `ENABLE_PRINT_FINAL_GEN_DOC_ONLY`, the line-item sub-tab hides (`HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT`, `HIDE_DOC_LINK`, `HIDE_DELIVERY_DETAILS`, `HIDE_ATTACHMENT_TAB`, `HIDE_BIN_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_ISSUE_LINK`), `DISALLOW_LINE_ITEM_EDIT`, `SHOW_FOREX_DATA_SOURCE` / `CANNOT_EDIT_CURRENCY_RATE`, and the `HIDE_ARAP_*` / `HIDE_KO_*` toggles. Switching any of them changes nothing on this applet's screens. The applet's `app.component.ts` does not implement `HIDE_*_MENU` either.

### Document behaviour settings

- **Status flow** — not configurable. The only transition offered is to FINAL (edit screen button, or the listing's bulk FINAL). No workflow / `FINAL_STATUS_GUID` is read.
- **Posting** — not configurable and, for this document type, absent: see [Lifecycle and effects](#lifecycle-and-effects).
- **Printables** — Settings → Printable Format Settings uploads Jasper formats with `txn_type = INTERNAL_GOODS_DELIVERY_NOTE` and stores the default in `PRINTABLE`. The Export tab prints through the shared Jasper endpoint with service code `CP_COMMERCE_INTERNAL_SALES_ORDERS_JASPER_PRINT_SERVICE` (effects L294-297) and downloads `<document no>.pdf`.
- **Approval / e-Invoice** — no controls found (routes and settings components checked at commit 0f242a9 of the applet repository, af523eb of blg-shared-utilities).

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Knock Off Configuration (`bl_fi_comp_gendoc_flow_config`) | Organisation → Company | Decides whether FINAL of a sales order / jobsheet / outbound delivery order creates open-line-queue rows that the *KO For* tabs can list, and whether this note's own FINAL creates any. |
| `posting_final_json` include / exclude processor list | Company record (backend; no applet screen found) | `GenericDocumentPrimaryProcessor.setPostingFinalValues` (L103-115) lets a company exclude subscriber processors such as `JOURNAL_POSTING_JOB_PROCESSOR` for every FINAL document. Relevant because the journal job fails for this document type (see Lifecycle). |

### Feature visibility / permissions

`bl_applet_client_side_perm_dfn` holds **22 ACTIVE client-side permission codes** for this applet (all `CLIENT_SIDE_PERM`): `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_COSTING_DETAILS`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_WHT_CONFIG_SELECTION`.

- 21 of them re-enable the line field hidden by the `HIDE_*` setting of the same suffix for the roles that hold them; `SHOW_COSTING_DETAILS` re-enables the Costing Details tab.
- `SHOW_LAST_PURCHASE_PRICE` is seeded but nothing in this applet checks it (the field it would reopen is not on the line form).
- The delete button is governed by the *setting* `SHOW_DOCUMENT_DELETE_BUTTON`, not by a permission; no `SHOW_VOID_BUTTON` / `SHOW_TRANSACTION_DATE` codes exist for this applet.
- The **Feature Visibility** screen under Settings is the shared menu-hiding component; the applet has only two menu items (listing, Line Items).
- Backend (targeted) permissions: `TNT_API_DOC_INTERNAL_GOODS_DELIVERY_NOTE_{CREATE,UPDATE,READ,DELETE}_TGT_GUID`, granted through Permission Set / User / Team / Role Permission. Without READ the listing is empty; without CREATE the POST is refused.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Document Type, Document No (Tenant / Company / Branch) | Server document type and the running numbers | — | Read-only; shown only once the document exists. |
| Branch | Issuing branch | Yes | Selecting it fills Company (`onBranchSelected`) and filters Location. Disabled after FINAL. |
| Location | Issuing location | Yes | Filtered by branch. Disabled after FINAL. |
| Company | Owning company | Yes | Hidden control, set from the branch. |
| Sales Agent | Employee credited with the delivery | Yes (`Validators.required`) | Shared employee picker. |
| Member Card | Membership card number | Yes (`Validators.required`) | Click opens the member picker; stored in `property_json.memberCardNo`. Disabled after FINAL. |
| Transaction Date | Date of the note | No | Defaults to today (`moment()` in `main-details.component.ts`); date picker; disabled after FINAL. |
| Credit Terms | Customer's credit terms | Required, but the control is **disabled** until a customer with credit terms is selected — disabled controls do not block CREATE | Options come from the selected customer. |
| Reference, Remarks, Permit No, Tracking ID | Free text | No | Remarks shows a character count. All disabled after FINAL. |
| Currency | Document currency | No | Shared currency component; disabled after FINAL. |
| Customer | Selected customer's name | Yes | Read-only echo of the Account tab selection. |

### Account

| Sub-tab | Fields | Required | Notes |
|---|---|---|---|
| Entity Details | Entity Id, Status, Identity Type, Currency, Description, Phone Number, Entity Name, Entity Type, ID Number, GL Code, Email | Entity Id | Everything except Entity Id is read-only and filled from the customer record. CREATE stays disabled while Entity Id is empty. |
| Bill To | Name, Phone No, Email, Billing Address (picker), Address Line 1-5, Country, City, State, Postcode | No | Pre-filled from the customer's billing address; editable. |
| Ship To | Recipient Name, Phone No, Email, Shipping Address (picker), Address Line 1-5, Country, City, State, Postcode | No | Pre-filled from the customer's shipping address; editable. |

### Lines (line Main Details)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item Code, Item Name | The item | Yes (picked) | From Search Item, a KO tab or Copy Quotation. |
| Quantity Base, Quantity by UOM, UOM to Base Ratio | Quantity | Quantity (`qty`) required | Hideable per setting / permission. |
| Unit Price STD (excl / incl tax), by UOM; Unit Discount, by UOM; Unit Price Net, by UOM; Unit Price Transaction, by UOM | Pricing chain | — | Hideable; pricing scheme selector when `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` is off. |
| STD Amount, Discount Amount, Amount Net, SST/GST/VAT, Tax Amount, Net Amount (with tax), WHT, WHT Amount, Txn Amount | Amounts | `txnAmt`, `netAmt`, `netAmtWithTax` required | Computed; amounts are stored but never posted (amount signum 0). |
| Sales Order No., Jobsheet No., Delivery Order No. | Source document references | — | Filled by the KO tabs. (Purchase Requisition / Quotation / Order / Invoice No. fields also exist on the form — inherited, never filled here.) |
| Remarks | Line remark | No | |
| Delivery Instruction (sub-tab) | From, To, Message, delivery date | No | Saved as a document extension `REQUESTED_DELIVERY_DATE` with the instruction JSON (effects L60-70). |
| Serial Number / Batch Number / Bin Number (sub-tab by item sub-type) | Serial list; batch_no, issue_date, expiry_date, qty; bin_code, container_measure, container_qty, qty | Batch and bin fields are all required when the tab applies | Serial numbers can be scanned or imported. |

### Settlement, Department Hdr, Contra

- **Settlement** — inherited from the credit-note clone. Add Settlement asks, per settlement method type, for Date and Amount (all types), Cash Back, Card No / Name on Card / Card Issuer / Type / Card Expiry / CVV, Voucher #, Transaction No, points; the starred ones are required by the form. Nothing on the backend side turns these into receipts for this document type.
- **Department Hdr** — Segment, G/L Dimension, Profit Centre, Project (all optional; stored on the header).
- **Contra** — select another document to contra against. Inherited; no ARAP balance exists for a signum-0 document, so there is nothing to contra.

## Lifecycle and effects

**Statuses.** A new note is created without a posting status (the header's `posting_status` is `null` until you press FINAL; the advanced search offers DRAFT / FINAL / VOID as filter values). Transitions available in the applet:

- **Create / Save** — `POST` / `PUT …/internal-goods-delivery-notes` through the generic document API; the backend's `InternalGoodsDeliveryNoteDataConsistencyObject` checks the server document type and forces amount signum 0 and quantity signum 0 on every line.
- **FINAL** — the edit screen's FINAL button (refused client-side with *This document has been posted* if already FINAL) or the listing's bulk FINAL. Both send `{posting_status: 'FINAL'}` to the posting-status endpoint. Backend rejections: HTTP 403 *Generic Document has already been posted to FINAL* (GenericDocumentService L361-364); `FISCAL_PERIOD_LOCKED` — *The selected date falls within a locked fiscal period* — when the transaction date sits in a period locked `LOCK_ALL` or `LOCK_TXN` (L1681-1695). Serial and batch quantity checks are skipped for signum-0 lines unless the caller sends `validate_serial_signum_zero` (this applet does not; L1839-1845), the bin check runs only for lines that carry bin numbers, and the stock-balance check ignores signum-0 lines (L2088-2092). The blacklisted-customer check applies to cashbill / invoice / order / outbound DO only, not to this type (L1650-1655).
- **After FINAL** — the Main tab controls are disabled in the UI (`main-details.component.ts` L97-117); RESET is refused; the SAVE button stays enabled (`disableSave()` is empty).
- **VOID** — no VOID control exists in this applet (edit and listing screens checked). The backend's generic `updatePostingStatusToVoid` would have nothing to reverse for this type.
- **DELETE** — with `SHOW_DOCUMENT_DELETE_BUTTON` on and the document not FINAL, DELETE (click twice within 3 seconds) calls `DELETE …/internal-goods-delivery-notes/{guid}`. The controller checks the delete permission, removes attached files and deletes header, lines, extensions and events (`GenericDocumentController.executeDocumentDeletionTransaction`), then fires the `INTERNAL_GOODS_DELIVERY_NOTE_DELETED` webhook. The FINAL guard is client-side only; the deletion transaction has none.

**Posting proof block**

| Item | Value |
|---|---|
| Server document type | `INTERNAL_GOODS_DELIVERY_NOTE`, short code `GDLYNT` (`ServerDocShortCodes` L47), `ServerDocTypes.INTERNAL_GOODS_DELIVERY_NOTE(0,0)` |
| Amount signum | `0` (`InternalGoodsDeliveryNoteDataConsistencyObject` L17-18, applied to every line) |
| Quantity signum | `0` (same) |
| Dr / Cr equation | **None.** `JournalPostingTypeHandler.handlers` has no entry for this type and the name contains neither `SALES` nor `PURCHASE`, so the fallback resolves to an empty handler list (`JournalPostingService` L68-83); every line is skipped because its amount signum is 0 (L96); the empty journal then throws `NO_JOURNAL_CREATED` (L579-582). |
| GL precedence | Not applicable — no journal line is ever built. |
| Stock processor | `InventoryTransactionLineProcessorService.createInventoryTxnFromGenericDoc` keeps only lines whose quantity signum is non-zero (L40, L75) — **no inventory transaction line, no stock-balance change**. |
| Open-line queue | `GENERIC_DOC_LINE_OPEN_QUEUE_PROCESSOR` runs on FINAL and consumes / creates open-queue rows according to the company's Knock Off Configuration; this is the only lasting effect of FINAL. |
| What VOID reverses | Nothing — there is no journal or stock line to reverse, and the applet exposes no VOID. |

**Why the journal queue shows an error for every FINAL note.** In `akaun_master.bl_applet_trigger_template_processor_link` the subscriber `JOURNAL_POSTING_JOB_PROCESSOR` of `BLG_ERP_GENERIC_DOCUMENT_PRIMARY_PROCESSOR` carries no `serverDocTypes` constraint, so it is queued for every FINAL document regardless of type (only five customer-specific sales-order subscribers are constrained). For a Goods Delivery Note the job then fails with `NO_JOURNAL_CREATED` (or earlier with `COMPANY_DEFAULT_GL_CODE_NOT_EXIST` when the company has no default GL mapping). The failure is confined to the job queue: the document is already FINAL, and the missing journal is correct. A company can silence it by listing `JOURNAL_POSTING_JOB_PROCESSOR` in `posting_final_json.excludeJobProcessorCode` — at the cost of every other document type, so in practice the failed job is left alone.

## Related applets

- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — the usual source; its open lines are consumed by *KO For Sales Order Item*.
- [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) — alternative source through *KO For Jobsheet Item*.
- [Outbound Delivery Order (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/) — alternative source through *KO For Delivery Order Item*.
- [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) and [Sales GIN (Stock Out)](/applets/sales-workflow/internal-sales-gin-stock-out-applet/) — the documents that actually move the stock a delivery note describes.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — customer, credit terms, billing and shipping addresses.
- [Employee](/applets/master-data/employee-applet/) — sales agent.
- [Membership Admin](/applets/membership/membership-admin-applet/) — member card.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — items, sub-types (serial / batch / bin), pricing schemes.
- [Organisation](/applets/master-data/organisation-applet/) — company, branch, location, Knock Off Configuration.
- [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) — locations and bins referenced on the lines.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — SST/GST/VAT and WHT codes on the lines.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| CREATE stays greyed out although the customer and lines are filled | The Main Details form declares Branch, Location, Sales Agent, **Member Card** and Customer as required (`main-details.component.ts` L54-61), and the Account form requires Entity Id; CREATE is disabled while either form is invalid. | Pick a sales agent and a member card (the picker opens on click) and select the customer on the Account tab. Credit Terms does not block: it is disabled until a customer with credit terms is chosen. |
| Application Settings shows no toggles for the Payment, KO, Delivery Details, Department Hdr, ARAP, Trace Document, Doc Link or Export tabs | The shared settings screen keys those sections by applet code and has no entry for `InternalGoodsDeliveryNote`. | Nothing to configure; the tabs on the document follow the code, not a setting. Reported as a product finding. |
| A toggle on Application Settings was switched but the screen did not change | Only the 22 line-level `HIDE_*` keys, `HIDE_COSTING_DETAILS`, `PRINTABLE` and `SHOW_DOCUMENT_DELETE_BUTTON` are read by this applet; the other ~116 controls are saved but never read. | Use the settings in the table above; ignore the rest. |
| Default Selection does not keep the branch / location; the console shows an error | The Default Selection component never loads or saves (no subscription, `save` output unhandled). | Choose branch and location on each document; the Personalization copy has the same defect. |
| FINAL fails with *The selected date falls within a locked fiscal period* | Transaction date is inside a fiscal period locked `LOCK_ALL` or `LOCK_TXN` (`validateGenericDocumentOnFinal` L1681-1695). | Change the transaction date, or have the period unlocked in the fiscal-year settings. |
| FINAL from the listing reports *Generic Document has already been posted to FINAL* (HTTP 403) | Bulk FINAL sends one request per selected row; a row that became FINAL between refresh and click is refused by the backend (L361-364). | Refresh the listing; nothing else to do. |
| The stock balance did not fall after FINAL | By design — quantity signum 0; the inventory processor skips every line. | Raise the delivery-order stock-out or Sales GIN for the physical movement. |
| Job-queue log shows `NO_JOURNAL_CREATED` (or `COMPANY_DEFAULT_GL_CODE_NOT_EXIST`) for the note | The journal-posting subscriber runs for every FINAL document and this type builds no journal lines. | Expected; no ledger entry is missing. Do not add GL mappings to "fix" it. |
| *KO For Sales Order Item* (or Jobsheet / Delivery Order) is empty although the order is FINAL | The order's FINAL did not create open-queue rows for `INTERNAL_GOODS_DELIVERY_NOTE`, or the queue rows were consumed by another document. | Check Organisation → Company → Knock Off Configuration for an enabled source → Goods Delivery Note row; then re-check the order's remaining open quantity. |
| Export tab prints nothing / no format to pick | No printable format uploaded for transaction type `INTERNAL_GOODS_DELIVERY_NOTE`. | Settings → Printable Format Settings → upload, then mark it default (`PRINTABLE`). |
| DELETE button missing on a draft | `SHOW_DOCUMENT_DELETE_BUTTON` is off. | Turn it on under Application Settings → Doc Settings and reopen the document. It never shows on FINAL documents. |
| Success toast says *Sales CreditNote created successfully* | Leftover from the credit-note clone (`toast.constants.ts`). | Cosmetic; the document created is a Goods Delivery Note. |

The applet repository's own issues (#1 deployment-script clean-up, #3 import errors after the monorepo split, #5 Angular 14 migration) are engineering chores; none reports a functional defect. The wiki tracker holds the documentation requests #69 (this page) and #70 (the former dispatch-note page).

## Related documentation

- [Inventory module](/modules-v2/inventory/)
- [Standard sales workflow](/guides/sales-guides/standard-sales-workflow/) and [Partial delivery workflow](/guides/sales-guides/partial-delivery-workflow/) — where delivery documents sit in the sales flow (these guides do not yet cover the Goods Delivery Note itself).
- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Outbound Delivery Order (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/), [Sales GIN (Stock Out)](/applets/sales-workflow/internal-sales-gin-stock-out-applet/)
