---
title: "Consignment GIN Applet (Internal)"
description: "Reference for the Consignment GIN Applet (Internal) — the goods issue note that takes supplier-owned consignment stock out of one of your locations: screens, settings, fields, what FINAL does to stock and to the ledger, and the errors you will meet."
applet_code: "internalConsignmentGINApplet"
applet_repo: "blg-applet-wavelet-internal-consignment-gin-applet"
modules: [purchasing, inventory]
related_applets: [internal-consignment-grn-applet, internal-consignment-return-applet, internal-consignment-purchase-order-applet, internal-consignment-billing-applet, internal-consignor-purchase-billing-applet, doc-item-maintenance-applet, supplier-applet-1, employee-applet, organisation-applet, tax-configuration-applet, chart-of-account-applet, stock-balance-applet, stock-report-applet, creditor-report-applet, debtor-and-creditor-report-applet]
guides: [/guides/purchasing-guides/consignment-purchasing/]
sources:
  configuration:
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/internal-consignment-gin-create.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-edit/internal-consignment-gin-edit.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-edit/internal-consignment-gin-edit.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-edit/export/export.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/add-line-item/add-line-item.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/add-line-item/item-details/item-details.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/add-line-item/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/line-item/line-item-create/search-item/line-search-item-listing.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/main-details/select-purchaser/select-purchaser-listing.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/account/account-entity-details/select-supplier/select-supplier-listing.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/resolver/permission.resolver.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/main.ts
    - blg-akaun-mf-app-ng/micro-fe/projects/akaun-platform/shells/akaun-shell/src/app/modules/applet-loader/applet-loader.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet internalConsignmentGINApplet, 0 rows on 2026-09-05)
  fields:
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/line-item/line-item-create/line-item-create.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/add-line-item/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/add-line-item/batch-number/batch-number.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/add-line-item/bin-number/bin-number.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/payment/add-payment/add-payment.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/contra/add-contra/add-contra.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-listing/internal-consignment-gin-listing.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/models/advanced-search-models/internal-consignment-gin.model.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/models/advanced-search-models/line-item.models.ts
  lifecycle:
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-edit/internal-consignment-gin-edit.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-listing/internal-consignment-gin-listing.component.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/state-controllers/internal-consignment-gin-controller/store/effects/internal-consignment-gin.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseConsignmentGinDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/BackdatedInvTxnLineService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-view/contra-select-document/contra-select-document.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/constants/server-doc-type.constant.ts
    - blg-applet-wavelet-stock-report-applet/micro-fe/projects/wavelet-erp/applets/stock-report-applet/src/app/models/advanced-search-models/stock-report-search.model.ts
  troubleshooting:
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/state-controllers/internal-consignment-gin-controller/store/effects/internal-consignment-gin.effects.ts
    - blg-applet-wavelet-internal-consignment-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-gin-applet/src/app/components/internal-consignment-gin-container/internal-consignment-gin-create/line-item/line-item-create/search-item/line-search-item-listing.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/TntErpErrorCodesConstantsV2.java
    - gh:bigledger/blg-applet-wavelet-internal-consignment-gin-applet#5
    - gh:bigledger/blg-wiki#64
tags:
  - applets
  - consignment
  - goods-issue-note
  - inventory-management
  - sales-operations
weight: 185
---

## Overview

The Consignment GIN Applet (Internal) raises a **goods issue note for consignment stock** — stock a supplier (the consignor) has placed at one of your locations and still owns. Finalising a consignment GIN takes the quantity out of the location named on the document and, where your company posts journals for it, reduces the amount recorded against that consignor. It is the outbound mirror of the [Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/), which brought the stock in: the GRN's signums are quantity +1 / amount −1, the GIN's are quantity −1 / amount +1.

Server document type `INTERNAL_PURCHASE_CONSIGNMENT_GIN`, short code `CSGGIN`. The applet does not say *why* stock is being issued — return to the consignor, transfer out, write-off — it only records the issue; your consignment process decides which cases use it and which use the [Consignment Return](/applets/purchase-workflow/internal-consignment-return-applet/) document instead.

The applet is a single-document applet: one listing, a create/edit form, a cross-document line-item listing, and the standard settings pages. Nothing in the consignment family knocks a consignment GIN off into another document.

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Consignment GRN Applet (Internal)](/applets/inventory-workflow/internal-consignment-grn-applet/) | Brings consignment stock into the location; the GIN can only issue what the location holds (the backend checks the balance on FINAL) |
| Upstream | [Consignment Purchase Order](/applets/purchase-workflow/internal-consignment-purchase-order-applet/) | The agreement under which the stock arrived; not linked to the GIN by the applet |
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Only items with the **Consignment Item** flag appear in the GIN's item search |
| Upstream | [Supplier](/applets/master-data/supplier-applet-1/), [Employee Maintenance](/applets/master-data/employee-applet/) | The consignor is a supplier entity; the Purchaser is an employee entity |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Company, branch and location on the header; the company's posting configuration decides whether FINAL creates a journal |
| Downstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/) | Show the quantity leaving the location; the Stock Report's document-type filter lists `INTERNAL_PURCHASE_CONSIGNMENT_GIN` |
| Downstream | [Creditor Report](/applets/finance/creditor-report-applet/), [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/) | Treat the GIN as a supplier-side (AP) document: it can be selected for contra in the Creditor Report and is excluded from the debtor side |
| Sibling | [Consignment Return (Internal)](/applets/purchase-workflow/internal-consignment-return-applet/), [Consignment Billing](/applets/sales-workflow/internal-consignment-billing-applet/), [Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) | The other consignment documents; none of them reads the GIN |

Modules: [Purchasing](/modules-v2/purchasing/), [Inventory](/modules-v2/inventory/).

## Screens and menus

| Menu | Purpose |
|---|---|
| **Internal Consignment GIN** | Listing of consignment GINs with create, edit and a bulk **FINAL** button for the selected rows |
| **Line Items** | One row per active line across all consignment GINs; opening a row opens the parent document |

Gear (Settings) menu, group *System Configuration*: **Application Settings**, **Default Selection**, **Printable Format Settings**. The shared settings shell adds the platform pages (Webhook, Feature Visibility, permission listings, Release Notes, Audit Trail). Personalisation: **Default Selection** and **Sidebar**.

### Listing

The listing shows a **FINAL** button that posts every selected DRAFT row. Columns: Consignment GIN No (`server_doc_1`), Posting Status, Branch, Supplier Name, Purchaser, Updated Date, Created Date, Transaction Date, Created by. Advanced search: Consignment GIN No, Branch Name, Supplier Name, Created Date (from/to), Transaction Date (from/to), Created by. The quick search box matches document number, branch name, supplier name and the creator.

### Create / edit form

Tabs on create: **Main Details**, **Account**, **Lines**, **Payment** (unless `HIDE_MAIN_PAYMENT_TAB`), **Department Hdr** (unless `HIDE_DEPARTMENT_HDR_TAB`). Edit adds **Contra**, **Doc Link**, **Attachments** and **Export** (each hideable by the matching `HIDE_*_TAB` setting), plus **SAVE**, **RESET**, **FINAL** and — for non-final documents when `SHOW_DOCUMENT_DELETE_BUTTON` is on — **DELETE** (two clicks: the first arms a confirmation, the second deletes).

The **Lines** tab has one way to add a line: **Search Item**. Knock-off tabs for sales order, jobsheet, delivery order, purchase order, requisition, quotation, invoice and return exist in the source but are commented out, so a consignment GIN is always keyed in from the item master.

### Line Items

{{< figure src="/images/internal-consignment-gin-applet/line-items.png" alt="Line Items listing across all consignment GINs" caption="Line Items: Consignment GIN No, Item Code, Item Name, Qty, Unit Price (Inclusive of Tax), SST/VAT/GST, Txn Amount." >}}

Advanced search: Consignment GIN No., Item Code, Item Name, Txn Amt (range). Only `ACTIVE` lines of `INTERNAL_PURCHASE_CONSIGNMENT_GIN` documents are listed.

### Settings

{{< figure src="/images/internal-consignment-gin-applet/settings-page.png" alt="Applet Settings page of the Consignment GIN applet" caption="Settings: Application Settings, Default Selection and Printable Format Settings under System Configuration; the permission pages come from the shared settings shell." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Items flagged **Consignment Item** | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | The item search on the Lines tab sends `consignment_flg = true`; an unflagged item cannot be added |
| Consignment stock at the issuing location | [Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/) | FINAL validates the stock balance by default and rejects lines the location cannot cover |
| The consignor as a supplier entity, with its AR/AP type set | [Supplier](/applets/master-data/supplier-applet-1/) | The Account tab lists suppliers; if a journal is posted, `AP_TRADE` maps to the `CREDITOR` default GL code and `AP_OTHER` to `CREDITOR_NON_TRADE` |
| Employee entities | [Employee Maintenance](/applets/master-data/employee-applet/) | The Purchaser picker lists employees |
| Company, branch and location | [Organisation](/applets/master-data/organisation-applet/) | Branch, company and location are required on the header |
| Document numbering for `CSGGIN` | Organisation > document numbering | The running number shown as Consignment GIN No |
| Tax codes (optional) | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | The line's SST/GST/VAT and WHT selectors |
| Default GL codes `CREDITOR` / `CREDITOR_NON_TRADE`, `PURCHASE`, `INPUT_TAX` — only if the company posts journals for this document | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | See *Lifecycle and posting*; a missing creditor mapping makes FINAL fail with `MISSING_DEFAULT_GL_CODE` |
| Printable formats (optional) | Settings > Printable Format Settings | Needed for the Export tab |
| API permissions | Settings > Permission Set / User / Team / Role | `TNT_API_DOC_INTERNAL_PURCHASE_CONSIGNMENT_GIN_CREATE / READ / UPDATE / DELETE` |

### Applet settings

**Settings > Application Settings** routes to the shared field-configuration screen from blg-shared-utilities (`app.routing.ts` maps `field-settings` to the shared `FieldConfigurationComponent`; the applet's own `settings-container/field-configuration` folder is an unrouted stub). The shared screen keys its per-applet sections by the applet code the platform shell stores at launch — the registry code `internalConsignmentGINApplet` (`applet-loader.component.ts` L195). Its tab map only has an entry for `internal-consignment-gin-applet`, the value the applet's own `main.ts` sets in development builds (L14), so on a live tenant the map never matches: the shared screen renders every control that is not fenced to a named applet, but the **Payment, Department Hdr, Doc Link and Export tab toggles stay hidden** (their sections are gated by `showPaymentTab` etc., which default to false, shared ts L60–L87, L2389–L2436). It saves the whole form into the applet's `APPLET_SETTINGS` extension (`onSave()`, shared ts L2686). Of the keys the applet declares in `applet-settings.model.ts`, the following are rendered by the shared screen **and** read by the applet. All are tenant-wide; only a user who can open the applet's Settings can change them. Every key defaults to *off* (the shared screen patches `undefined` as falsy; the seventeen line-price keys go through `shouldHideSetting()`, which returns `false` for this applet code, shared ts L2333–L2358).

| Setting | What it controls | Effect when changed |
|---|---|---|
| `HIDE_MAIN_CONTRA_TAB`, `HIDE_ATTACHMENT_TAB` | Contra and Attachments tabs on edit | Tab disappears (the Contra section is on by default, shared ts L66; the Attachments toggle sits in the ungated *Hide Line Item Sub Tabs* panel, shared html L3481–L3521) |
| `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO` | Tracking ID and Permit No on Main Details | Field hidden |
| `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER` | The tracking sub-tab of a line (shown only for items of that sub-type) | Hiding the tab does not remove the backend's serial / batch / bin quantity checks on FINAL |
| `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_ISSUE_LINK` | Costing Details, Pricing Details and Issue Link tabs of a line | `HIDE_COSTING_DETAILS` is overridden per user by the `SHOW_COSTING_DETAILS` permission |
| `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT`, `HIDE_DOC_LINK`, `HIDE_DELIVERY_DETAILS` | Sub-tabs under a line's Item Details | Doc Link and Delivery Details only exist in edit mode anyway |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_AMOUNT_TXN` | One price, quantity or amount field each on the line's Main Details | Each is reopened per user by the matching `SHOW_*` client-side permission (see below) |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | The tax-code selector with its rate and amount; the WHT selector with its rate and amount | Reopened by `SHOW_TAX_CONFIG_SELECTION` / `SHOW_WHT_CONFIG_SELECTION` |
| `PRINTABLE` | The printable format pre-selected on the Export tab | Set by choosing a default under Settings > Printable Format Settings (saved into `APPLET_SETTINGS.PRINTABLE`, printable-format effects L179) |

Keys read by the applet **without a control on the shared screen for this applet code** (they can only be set by another route, such as the API): `HIDE_MAIN_PAYMENT_TAB` and `HIDE_DEPARTMENT_HDR_TAB` (Payment and Department Hdr tabs on create and edit), `HIDE_DOC_LINK_TAB` and `HIDE_EXPORT_TAB` (Doc Link and Export tabs on edit; `HIDE_EXPORT_TAB` would remove the only print path) — their toggles are inside the `showPaymentTab` / `showDepartmentHdrTab` / `showDocLinkTab` / `showExportTab` sections (shared html L3708, L4238, L4323, L4443) that the tab map never enables for the live applet code; and `HIDE_CURRENCY` (read on Main Details, but the shared toggle sits inside blocks fenced to other applets at shared html L1775 and L6136). Keys read **without a model declaration**: `SHOW_DOCUMENT_DELETE_BUTTON` (rendered ungated on the shared screen at L1592, persisted, and read straight from the `APPLET_SETTINGS` extension in `internal-consignment-gin-edit.component.ts` L108 to show DELETE on non-final documents).

Declared but not usable: `HIDE_LAST_PURCHASE_PRICE` has a shared control but nothing in this applet reads it; the `INCLUDE_*` / `ENABLE_*` segment, dimension, profit-centre, project, SST and WHT keys, the `ENABLE_CUSTOM_STATUS_*` keys and `DEFAULT_BRANCH` / `DEFAULT_LOCATION` are in the model but no component reads them (repo commit 04acb95).

**Settings > Default Selection** and **Personalisation > Default Selection** show a Default Branch and Default Location, but neither saves: the component's `save` output has no listener, its `appletSettings$` input is never bound, and no form reads `DEFAULT_BRANCH` or `DEFAULT_LOCATION`. Changing either drop-down throws in the console (`appletContainer` is undefined, default-settings ts L31–L67). New documents therefore always start with an empty Branch and Location.

### Document behaviour settings

| Setting | Effect |
|---|---|
| `SHOW_DOCUMENT_DELETE_BUTTON` | Adds DELETE to the edit form for documents that are not `FINAL` |
| `HIDE_EXPORT_TAB` (no control for this applet, see above), `PRINTABLE` | Whether the Export tab exists and which format it pre-selects |
| `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER` | Whether users can enter tracking details; the backend still validates them on FINAL |

There is no setting that hides or forces FINAL, no auto-final, no VOID button, no approval workflow, no stock-validation toggle (the backend validates by default) and no e-Invoice submission for this document (repo commit 04acb95, routes and settings components checked).

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| **Consignment Item** flag (`consignment_flg`) | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), item header | Only flagged items are listed by the Lines tab's Search Item (`line-search-item-listing.component.ts` L90) |
| Supplier AR/AP type (`AP_TRADE` / `AP_OTHER`) | [Supplier](/applets/master-data/supplier-applet-1/) | Picks `CREDITOR` or `CREDITOR_NON_TRADE` as the entity side of the journal, when one is posted (`JournalPostingService` L84, L1561–L1575) |
| Company `posting_final_json` include / exclude list and job-template subscriptions | [Organisation](/applets/master-data/organisation-applet/) / platform | Decide which processors (stock, journal, webhook…) run on FINAL for this company (`GenericDocumentPrimaryProcessor` L71–L112) |
| Fiscal period status `LOCK_TXN` / `LOCK_ALL` | Organisation > fiscal years | FINAL is rejected with `FISCAL_PERIOD_LOCKED` when the transaction date falls in a locked period; consignment GINs are not exempt (`GenericDocumentService` L1682–L1695) |
| Company default GL codes | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | Used by the fallback purchase journal (see below) |

### Feature visibility / permissions

`bl_applet_client_side_perm_dfn` holds **no rows** for `internalConsignmentGINApplet` (checked 2026-09-05), so nothing can be reopened per role from the registry. The code nevertheless checks these client-side codes on the line's Main Details, each overriding the matching `HIDE_*` setting when granted: `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_DISCOUNT`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_UNIT_PRICE_TXN`, `SHOW_AMOUNT_TXN`, and `SHOW_COSTING_DETAILS` on the line tabs. They take effect only once seeded for this applet.

Server-side, create / read / update / delete of the document are governed by `TNT_API_DOC_INTERNAL_PURCHASE_CONSIGNMENT_GIN_CREATE_TGT_GUID`, `_READ_TGT_GUID`, `_UPDATE_TGT_GUID` and `_DELETE_TGT_GUID` (`TntErpPermissions` L7335–L7343), assigned through the Permission Set / User / Team / Role pages; the permission resolver offers Company, Branch, Location, Entity, Item and the other standard targets.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Branch | Issuing branch | Yes | Sets Company; locked once the document is `FINAL` |
| Location | Location the stock leaves | Yes | Stock and serial / batch / bin checks run against this location |
| Purchaser | Employee responsible | No | Picker lists employee entities (Employee ID, name, phone) |
| Transaction Date | Business date | No (defaults to today) | Checked against the fiscal-period lock on FINAL; locked once `FINAL` |
| Credit Terms | Terms from the supplier | Yes | Disabled until a supplier is chosen on Account ("Entity ID must be selected first"); drives Due Date |
| Due Date | Derived from Credit Terms | No | Date picker |
| Reference, Remarks | Free text | No | Remarks become the journal description of the entity line, if one is posted |
| Permit No, Tracking ID | Free text | No | Hidden by `HIDE_PERMIT_NO` / `HIDE_TRACKING_ID` |
| Currency | Document currency | Yes | Defaults to the company base currency; hidden by `HIDE_CURRENCY`; locked once `FINAL` |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity Id | The consignor (supplier entity) | Yes | Picker lists supplier entities; the rest of the tab (Status, Identity Type, Currency, Description, Phone Number, Entity Name, Entity Type, ID Number, GL Code, Email) is read-only from the entity |
| Bill To, Ship To | Billing and shipping addresses of the supplier | No | Chosen from the entity's address list |

### Lines

Add a line with **Search Item** (consignment items only; the grid shows Item Code, Item Name and a *System Stock Balance* column), then complete the line's tabs.

| Field (Item Details > Main Details) | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item Code, Item Name | From the item master | — | Read-only |
| Pricing scheme / UOM | Scheme and unit of measure | No | `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` |
| Unit Price STD (excl. / incl. tax), by UOM variants | Standard prices | — | Read-only, from the pricing scheme |
| Unit Discount, Unit Discount by UOM | Discount per unit | No | — |
| Quantity Base | Quantity issued in base UOM | Yes | Must match the serial / batch / bin quantities entered |
| Quantity by UOM, UOM to Base Ratio | Quantity in the selected UOM | No | Ratio is read-only |
| STD Amount, Discount Amount, Amount Net | Computed amounts | Yes (net) | Read-only |
| SST/GST/VAT code, rate, Tax Amount | Tax on the line | No | `HIDE_TAX_CONFIG_SELECTION`; from [Tax Configuration](/applets/master-data/tax-configuration-applet/) |
| WHT code, rate, WHT Amount | Withholding tax | No | `HIDE_WHT_CONFIG_SELECTION` |
| Unit Price Transaction (incl. tax), Txn Amount | Transaction price and amount | Yes (Txn Amount) | The Txn Amount is what leaves the company's cost pool (see *Lifecycle and posting*) |
| Remarks | Line remarks | No | Becomes the journal line description, if posted |

Other line tabs: **Serial Number** (list, import, scan), **Batch Number** (batch no, quantity ≥ 1, issue date and expiry date all required), **Bin Number** (bin code, container measure, container quantity, quantity ≥ 1 all required) — one of the three appears according to the item's sub-type; **Costing Details**; **Pricing Details** (sales and purchase min / max / unit prices, all required when edited); **Issue Link** (link the line to an Issue Tracker issue). Item Details sub-tabs: **Delivery Instruction**, **Department**, **Doc Link** and **Delivery Details** (the last two in edit mode only).

### Payment, Contra, Department Hdr

**Payment** records settlement lines against the document (date and amount ≥ 0.01 required; card, voucher, transfer, cheque and points methods ask for their reference fields). Settlement lines are saved as lines of the same document. **Contra** (edit only) offsets the document against another `ACTIVE` document of the same entity; the contra amount must not exceed that document's AR/AP balance (`add-contra.component.ts` L83–L84). **Department Hdr** tags the header with a department.

## Lifecycle and posting

| Status (`posting_status`) | Meaning | Allowed next |
|---|---|---|
| `DRAFT` | Saved; editable; deletable when `SHOW_DOCUMENT_DELETE_BUTTON` is on | `FINAL` |
| `FINAL` | Posted; header and lines locked | — (the applet has no VOID button) |

FINAL is sent from the edit form's **FINAL** button or from the listing's bulk **FINAL** (every selected row that is not already `FINAL`), as a posting-status update carrying only `{ posting_status: 'FINAL' }` (`edit` ts L214–L231; `listing` ts L265–L284; effects L519–L536). Because the request carries no `validate_stock_balance` flag, the backend validates stock (`GenericDocumentService` L390–L392 defaults it to `true`). A finalised consignment GIN cannot be reversed from this applet: no VOID action exists in the code, so the only correction path is a compensating [Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/).

Posting proof (backend at commit 871dbf5c96):

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_PURCHASE_CONSIGNMENT_GIN` (short code `CSGGIN`) | `InternalPurchaseConsignmentGinDataConsistencyObject` L15; `GenericDocServerDocTypeEnum` L59 |
| Amount signum | **+1** | DCO L16; `ServerDocTypes` L40 |
| Quantity signum | **−1** (stock out) | DCO L17; `ServerDocTypes` L40 |
| Create / update validation | Server doc type must match (`GENERIC_DOC_HDR_INVALID_SERVERDOCTYPE`) and header amount signum must be +1 (`GENERIC_DOC_INVALID_SIGNUM`); line signums are filled in server-side | DCO L20–L43; `GenericDocumentDataConsistencyObject` L1189–L1213 |
| FINAL validation | Stock balance at the location for every basic-item line (`STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION`), serial / batch / bin quantities, fiscal-period lock (`FISCAL_PERIOD_LOCKED`, no exemption for this type) | `GenericDocumentService` L1627–L1700, L2062–L2216 |
| Stock processor | Quantity × −1 posted against the header location; the document type is in `MA_WA_SERVER_DOC_TYPES`, so the line's Txn Amount (× signum) is subtracted from the company's moving-average cost pool and counts in the weighted-average calculation | `StockBalanceHelper` L40–L42, L166–L170, L217–L221; `BackdatedInvTxnLineService` L80 |
| Journal | Only if the company's job-template subscriptions and `posting_final_json` run the journal processor for this document. The type has **no handler of its own**: `JournalPostingService` falls back to the generic `PURCHASE` handler because the name contains "PURCHASE" | `JournalPostingService` L64–L81; `JournalPostingTypeHandler` L53–L63; `GenericDocumentPrimaryProcessor` L71–L112 |
| Dr/Cr equation (when posted) | Line amount × amount signum (+1) → **credit** the purchase side (`PURCHASE`; tax lines → `INPUT_TAX`); the balancing entity line is a **debit** to `CREDITOR` (`AP_TRADE`) or `CREDITOR_NON_TRADE` (`AP_OTHER`) — a reduction of what you owe the consignor | `JournalPostingService` L95–L128, L318–L345, L1561–L1575 |
| GL precedence | line GL → header GL → item-company link → company default; an unmapped creditor default throws `MISSING_DEFAULT_GL_CODE: CREDITOR` | `JournalPostingService` L189–L190, L338–L340 |
| What VOID reverses | Not reachable from this applet (no VOID action in the code) | repo commit 04acb95 |

Two consequences worth knowing. First, the cost pool moves by the **document's Txn Amount**, not by the running moving-average cost: a consignment GIN keyed at a price other than the current moving-average price shifts the item's moving-average price for everything left in stock. Second, unlike its GRN and Return siblings — which post to `CONSIGNMENT_LIABILITY` / `CONSIGNMENT_STOCK` because they are in the backend's consignment list (`JournalPostingService` L64–L66) — the GIN is **not** in that list, so a posted GIN hits the ordinary creditor and purchase accounts.

## Related applets

- [Consignment GRN Applet (Internal)](/applets/inventory-workflow/internal-consignment-grn-applet/) — the inbound half; brings the consignment stock the GIN issues.
- [Consignment Return (Internal)](/applets/purchase-workflow/internal-consignment-return-applet/) — the other outbound consignment document; it posts to the consignment liability and stock accounts, the GIN does not.
- [Consignment Purchase Order](/applets/purchase-workflow/internal-consignment-purchase-order-applet/) — the agreement the stock arrived under.
- [Consignment Billing](/applets/sales-workflow/internal-consignment-billing-applet/) and [Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) — the billing documents of the consignment family; neither reads a consignment GIN.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the Consignment Item flag that gates the item search.
- [Supplier](/applets/master-data/supplier-applet-1/) and [Employee Maintenance](/applets/master-data/employee-applet/) — the consignor and the purchaser.
- [Organisation](/applets/master-data/organisation-applet/) — branch, location, document numbering, fiscal periods and the posting configuration.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) and [Chart of Accounts](/applets/master-data/chart-of-account-applet/) — line tax codes and the default GL codes used if a journal is posted.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Stock Report](/applets/inventory-workflow/stock-report-applet/) — where the issued quantity shows up.
- [Creditor Report](/applets/finance/creditor-report-applet/) and [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/) — list the GIN among supplier-side documents.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL fails with *Unable to post the document to FINAL: There's not enough stock for item …* | `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION`: the header Location holds less than the line quantity (`GenericDocumentService` L2213–L2216; message rewritten by effects L553–L555) | Check [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) for that item and location; receive the stock with a Consignment GRN first, or change the Location |
| FINAL fails with *The selected date falls within a locked fiscal period* | `FISCAL_PERIOD_LOCKED`; consignment GINs are not exempt from `LOCK_TXN` / `LOCK_ALL` | Move the Transaction Date into an open period or reopen the period in Organisation |
| FINAL fails with a serial-number message | `BL_INV_SERIAL_NUMBER_HDR_OBJECT_SERIAL_NUMBER_DOES_NOT_EXIST_AT_LOCATION`, `GENERIC_DOC_LINE_QTY_BASE_AND_SERIAL_NUMBER_QTY_DOES_NOT_MATCH` or `GENERIC_DOC_LINE_SERIAL_NUMBER_ID_IS_DUPLICATED` (`TntErpErrorCodesConstantsV2`) | Enter exactly as many serial numbers as Quantity Base, each present at the Location and listed once |
| FINAL fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` (or `CREDITOR_NON_TRADE`) | The company runs the journal processor for this document and has no default GL code mapped for the supplier's AR/AP type (`JournalPostingService` L338–L340) | Map the code in [Chart of Accounts](/applets/master-data/chart-of-account-applet/), or exclude the journal processor for this document type in the company's posting configuration if a consignment GIN should not post |
| The item you want is not in Search Item | The item search is filtered to `consignment_flg = true` | Tick **Consignment Item** on the item in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) |
| Credit Terms is greyed out and CREATE stays disabled | Credit Terms is required and is enabled only after a supplier is selected on the Account tab (`main-details.component.ts` L55, L104–L107) | Select the Entity Id first |
| No switch to hide the Payment, Department Hdr, Doc Link or Export tab under Application Settings | The shared settings screen's tab map is keyed `internal-consignment-gin-applet` while the live applet code is `internalConsignmentGINApplet`, so those sections never render for this applet (shared ts L2424) | Set the key through the applet-settings API, or ask for the map entry to be corrected; the Contra and Attachments toggles do work |
| No DELETE button on a draft | `SHOW_DOCUMENT_DELETE_BUTTON` is off, or the document is already `FINAL` | Switch the setting on under Application Settings; a `FINAL` document cannot be deleted |
| No VOID button on a finalised GIN | The applet has no VOID action | Post a compensating Consignment GRN |
| Default Branch / Location chosen under Settings > Default Selection never appear on new documents | The Default Selection screens do not save (no listener on `save`, `appletContainer` undefined) | Choose Branch and Location on each document; report the screen if you rely on it |
| Moving-average cost of the item jumped after a GIN | The GIN's Txn Amount, not the running average, left the cost pool (`StockBalanceHelper` L166–L170) | Key consignment GINs at the agreed consignment price consistently; check with Stock Report cost columns before month-end |
| *This document has been posted* toast on FINAL | The document was already `FINAL` (`edit` ts L226–L229) | Nothing to do; refresh the listing |

Known housekeeping: the applet is still on the pre-Angular-14 toolchain (open migration issue) and its FINAL error handler passes two arguments to `String.includes()` (effects L544), so only `FISCAL_PERIOD_LOCKED` is matched by that clause; the other codes are still matched by the following clauses.

## Related documentation

- [Consignment Purchasing guide](/guides/purchasing-guides/consignment-purchasing/) — the end-to-end process the GIN belongs to.
- [Purchasing module](/modules-v2/purchasing/) and [Inventory module](/modules-v2/inventory/).
