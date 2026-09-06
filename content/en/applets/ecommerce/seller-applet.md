---
title: "Seller Applet"
description: "Seller-side workspace of the marketplace module: a login linked to a merchant entity maintains that seller's marketplace products and store stock balances, sees the seller orders allocated to it from the tenant's sales orders, and edits the purchase invoices and payment vouchers used to settle with the seller."
applet_code: "seller_applet"
page_type: applet
applet_repo: "blg-applet-wavelet-seller-applet"
modules: [ecommerce]
related_applets: [merchant-applet, internal-sales-order-applet, internal-purchase-invoice-applet, internal-payment-voucher-applet, pricebook-applet, doc-item-maintenance-applet, cashbook-applet, organisation-applet, seller-admin-applet, cp-commerce-admin-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/app.routing.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/app.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/models/constants/purchase-invoice-applet-constants.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/line-item-add/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/purchase-invoice-create.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/internal-payment-voucher-container/internal-payment-voucher-listing/internal-payment-voucher-listing.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/seller-order-container/seller-order-edit/export/export.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/resolver/permission.resolver.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/MkpPermissions.java
  fields:
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/seller-account-container/seller-account-edit/seller-account-login/customer-login.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/seller-account-container/seller-account-edit/seller-account-login/login-create/login-create.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/seller-account-container/seller-account-edit/seller-account-login/login-edit/login-edit.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/products-container/products-listing/products-listing.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/products-container/products-edit/products-edit.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/state-controllers/products-controllers/store/effects/products.effects.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/branch-container/branch-create/branch-create.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/state-controllers/branch-controller/store/effects/branch.effects.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/seller-order-container/seller-order-listing/seller-order-listing.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/seller-order-container/seller-order-edit/seller-order-edit.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/purchase-invoice-edit.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/internal-payment-voucher-container/internal-payment-voucher-create/internal-payment-voucher-create.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/internal-payment-voucher-container/internal-payment-voucher-edit/internal-payment-voucher-edit.component.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/MkpDCO/MkpSellerOrderDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/mkp/MkpSellerOrderService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TmpSellerOrderLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/MkpUows/TmpSellerOrderLineUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/cpcommerce/CpCommerceSalesOrderQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/mkp/MkpTmpSellerOrderLineCreationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/mkp/MkpSellerOrderLineCreationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/mkpControllers/MkpSellerOrderController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/mkpControllers/TmpSellerOrderLineController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/mkpControllers/MkpItemController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/MkpDCO/MkpItemDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/MkpDCO/MkpEntityBranchStockBalanceDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/MkpUows/MkpItemUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/ecomsync/EcomSyncMainStockCalculationService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/state-controllers/seller-order-controller/store/effects/seller-order.effects.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/state-controllers/payment-voucher-controller/store/effects/internal-payment-voucher.effects.ts
  troubleshooting:
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/components/seller-account-container/seller-account-edit/seller-account-login/customer-login.component.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/state-controllers/products-controllers/store/effects/products.effects.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/state-controllers/seller-order-controller/store/effects/seller-order.effects.ts
    - blg-applet-wavelet-seller-applet/micro-fe/projects/wavelet-erp/applets/seller-applet/src/app/state-controllers/branch-controller/store/effects/branch.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TmpSellerOrderLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/ecomsync/EcomSyncMainStockCalculationService.java
    - gh:bigledger/blg-wiki#138
    - gh:bigledger/blg-int-general-task#9789
tags:
  - seller-management
  - e-commerce
  - marketplace
  - order-processing
  - financial-settlement
weight: 70
---

## Overview

The Seller Applet is the **seller-side** workspace of BigLedger's marketplace module. A tenant user who has been linked to one or more **merchant entities** picks a seller in the sidebar and then works on that seller's marketplace product catalogue (`bl_mkp_mst_item_hdr`), the seller's per-store stock balances, the **seller orders** that the tenant allocated to the seller out of its own sales orders, and the purchase invoices and payment vouchers the tenant uses to settle with the seller. The marketplace owner's side of the same process (allocating sales-order lines to sellers) lives in the Seller Admin Applet, and the sales orders themselves come from the [Internal Sales Order](/applets/sales-workflow/internal-sales-order-applet/) applet or a marketplace / storefront sync.

The applet is registered as `seller_applet` ("Seller Applet", type TNT-ADMIN). It is a template clone of the generic document applets: several menus and buttons are present in the user interface but not wired to the backend in the current build. Where that is the case this page says so, with the file that proves it.

## Where it fits

| Direction | Applet / process | Why |
|---|---|---|
| Upstream | [Merchant Applet](/applets/master-data/merchant-applet/) | The seller *is* a merchant entity (`bl_fi_mst_entity_hdr`, type MERCHANT). Only entities the current login is linked to through `bl_fi_mst_entity_login_subject_link` appear in the sidebar. |
| Upstream | [Internal Sales Order](/applets/sales-workflow/internal-sales-order-applet/) | Sales-order lines are copied into a seller allocation queue; allocated lines become seller orders that this applet lists. |
| Upstream | [Pricebook](/applets/master-data/pricebook-applet/) | The Product › Pricing tab links a marketplace item to a pricing scheme flagged `enable_marketplace`; the automatic allocation uses that link to find the seller for a sales-order line. |
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | The tenant's financial item (`bl_fi_mst_item_hdr`) that a marketplace item is meant to represent (`fi_item_guid`); required for allocation and for the Pages tab. |
| Upstream | [Organisation](/applets/master-data/organisation-applet/), [Cashbook](/applets/master-data/cashbook-applet/) | Company Knock Off Configuration for the purchase invoice's KO For tab; cashbook settlement methods for the payment voucher's Payment tab. |
| Same documents | [Internal Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/), [Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/) | The Purchase Invoice and Payment Voucher menus open ordinary `INTERNAL_PURCHASE_INVOICE` / `INTERNAL_PAYMENT_VOUCHER` generic documents — the same rows those applets show. |
| Counterpart | [Seller Admin Applet](/applets/ecommerce/seller-admin-applet/) | Marketplace-owner side: the sales-order line queue and manual allocation to sellers. |
| Downstream | EcomSync / [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) | The seller stock balances entered here feed the EcomSync stock calculation in its seller-stock mode. |

## Screens and menus

Sidebar (`models/menu-items.ts`):

| Menu | Route | What it shows |
|---|---|---|
| Seller Account › **Select User** toggle | — | The merchant entities the login is linked to; picking one scopes the Product and Seller Order menus. |
| Seller Account | `seller-account-listing` | "List of Account User" — the login links of the selected seller (User Email, Rank, Status, Modified Date), with Login Create / Login Edit side panels. The **Edit Seller Account** button has no click handler. There is no seller create form in this applet. |
| Product | `product-listing` | The seller's marketplace items with an Edit Product panel: Information, Label, Dimension Details, Multi UOM, Pricing, Manage Image, Pages, Reviews, Attribute Set, Attribute Link, Stock Availability tabs. |
| Seller Order | `seller-order-listing` | Seller orders (`bl_mkp_seller_order_hdr`) for the selected seller, grouped by document number, with an Edit Seller Order panel (Main Details, Account, Line Item, Export, Event). |
| Purchase Invoice | `purchase-invoice-listing` | "Internal Purchase Invoice Listing" with the standard Create / Edit generic-document panels. |
| Payment Voucher | `payment-voucher-listing` | Internal payment vouchers with Create / Edit panels. |
| Branch | `branch-listing` | The **tenant's** branch master (`bl_fi_mst_branch`), not the seller's stores. |

Settings (`settingItems`): Field Settings, Default Selection, Printable Format Settings; the shell adds Applet Access, Role Pricing Scheme Linking, the server-side permission screens, Triggers and the developer tools. Personalization: Default Selection, Sidebar.

{{< figure src="/images/seller-applet/product-listing.png" alt="Product Listing with the Edit Product panel open on the Information tab" caption="Product › Edit Product. The tabs continue to the right (Multi UOM, Pricing, Manage Image, Pages, Reviews, Attribute Set, Attribute Link, Stock Availability). Currency is required by the form but is not saved — see Fields." >}}

{{< figure src="/images/seller-applet/seller-order-listing.png" alt="Seller Order Listing with the Delivery Type selector and the line columns" caption="Seller Order Listing. Columns: Seller Order No, Requested Delivery Date, Item Code, Item Name, Base Quantity, UOM, Order Status, Delivery Status, Remarks. The Delivery Type selector is not bound to anything in the current build." >}}

{{< figure src="/images/seller-applet/purchase-invoice-listing.png" alt="Internal Purchase Invoice Listing" caption="Purchase Invoice menu: the same INTERNAL_PURCHASE_INVOICE documents the Internal Purchase Invoice applet shows." >}}

{{< figure src="/images/seller-applet/payment-voucher-listing.png" alt="Payment Voucher Listing" caption="Payment Voucher menu: Doc No, Branch, Entity Name, Currency, Payment Amount, Open Amount, Creation Date." >}}

{{< figure src="/images/seller-applet/seller-applet-settings.png" alt="Applet Settings page of the Seller Applet" caption="Applet Settings. Field Settings and Default Selection are present but cannot save in this build; Printable Format Settings is the only working settings writer." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| A merchant entity per seller, and a login link for every user who works for that seller | [Merchant Applet](/applets/master-data/merchant-applet/) (entity of type MERCHANT; `bl_fi_mst_entity_login_subject_link` rows) | `app.component.ts` builds the Select User toggle from `entity-login-subject-links?subject_guid=<login>` and then `entity/merchants?hdr_guids=…`. A login with no link sees an empty toggle and every seller-scoped screen refuses to load ("Please select account in left menu"). Further links can be added from this applet's Seller Account menu once one exists. |
| Seller stores | Entity branches of the merchant (`bl_fi_mst_entity_branch_hdr`, created in the Merchant applet) | Stock Availability rows need `entity_branch_hdr_guid` (NOT NULL in `MkpEntityBranchStockBalanceDataConsistencyObject`). The store drop-down reads `erp/entity-branch-hdrs/login-entity-ep?entity_hdr_guid=<seller>`. |
| A marketplace pricing scheme | [Pricebook](/applets/master-data/pricebook-applet/) — a pricing scheme under the label list `PRICING_SCHEME_ITEM` with `enable_marketplace = true`, owned by the seller entity | The Pricing tab lists only such schemes, and `TmpSellerOrderLineUow.getSellerForSpecificItemQuery` finds the seller for a sales-order line through `bl_mkp_mst_pricing_scheme_link` joined to the scheme's `entity_hdr_guid`. |
| Financial item behind each marketplace item | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Allocation joins `bl_mkp_mst_item_hdr.fi_item_guid` to the sales-order line's item. **No screen in this applet sets `fi_item_guid`** — it must be set by the Seller Admin side or by support. |
| Server-side permissions | Permission Set / User Permission screens of this applet | `mkp/seller-orders/backoffice-ep` needs `API_TNT_DM_MKP_SELLER_ORDER_READ`; the Pricing tab uses `mkp/pricing-scheme-links/backoffice-ep` (`API_TNT_DM_MKP_PRICING_SCHEME_LINK_*`); PI screens check `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_READ/CREATE/UPDATE_TGT_GUID`. The `login-entity-ep` / `login-merchant-ep` endpoints (products, stock, labels, attributes, events) need no permission but require the login to be linked to the entity (`isUserLoginEntity`, HTTP 401 otherwise). |
| Knock-off configuration, settlement methods, printable formats | [Organisation](/applets/master-data/organisation-applet/) › Company › Knock Off Configuration; [Cashbook](/applets/master-data/cashbook-applet/) settlement methods; a `.jrxml` under Settings › Printable Format Settings | PI › KO For reads the company flow rows (`getKOSettingsInit(serverDoc2 = INTERNAL_PURCHASE_INVOICE)`); PV › Payment adds settlement lines of `txn_type = STL_MTHD`; the Export tabs need a printable format. |

### Applet settings

Where settings live (checked at applet commit `6988e15`, shared-utilities `a8c38a2`):

- **Settings › Field Settings** is an applet-local component (`components/settings-container/field-configuration/`), not the shared `FieldConfigurationComponent`. Its eight slide toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) have no form binding and the SAVE button has no handler — it saves nothing.
- **Settings › Default Selection** (`default-settings.component.ts`) and **Personalization › Default Selection** are routed directly with no parent binding their `appletSettings$` input or `save` output; `appletContainer` is never assigned, so changing Branch or Location throws in the `valueChanges` handler and SAVE emits to nothing. They cannot persist `DEFAULT_BRANCH` / `DEFAULT_LOCATION`.
- **Settings › Printable Format Settings** is the only writer of the applet's `APPLET_SETTINGS` row: ticking *Default Selection* on a format calls `TenantAppletService.getByGuid` → merges `{PRINTABLE: <format guid>}` into `bl_applet_ext.value_json` → `PUT core2/tnt/dm/applets` (`printable-format.effects.ts`, `saveSettings`). The listing filters formats by `txn_type = INTERNAL_PAYMENT_VOUCHER` (`models/constants/applet-constants.ts`).
- Every read goes through the shared session store: master = `APPLET_SETTINGS` of the `seller_applet` row, personal = `USER_SETTINGS` on the login-subject link (`blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts`), merged as `{...master, ...personal}` with personal `DEFAULT_BRANCH` / `DEFAULT_LOCATION` overriding master.

Settings are tenant-wide and can be changed by anyone who can open Settings (no permission check in the settings components).

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `PRINTABLE` | The printable format preselected in the Export tab of Seller Order, Purchase Invoice and Payment Voucher (`export.component.ts` in each container). | `null` — no format preselected; the ticked row in Printable Format Settings sets it. | One applet-wide value serves all three export dialogs, although the settings listing only shows `INTERNAL_PAYMENT_VOUCHER` formats. The Seller Order export prints with `printServiceClassName = INTERNAL_PURCHASE_ORDER_PRINT_SERVICE`. |

**Keys read at runtime without a control in this applet.** These are declared in `models/applet-settings.model.ts` and consumed, but no screen here can set them; they take effect only if the `APPLET_SETTINGS` row of `seller_applet` is written by support:

- `DEFAULT_BRANCH`, `DEFAULT_LOCATION` — seed the branch/location of a new purchase invoice, payment voucher and the Seller Order › Main Details form (`purchase-invoice-create.component.ts`, `internal-payment-voucher-create/main-details.component.ts`, `seller-order-edit/main-details.component.ts`).
- `HIDE_COSTING_DETAILS` — hides the Costing Details tab of PI / PV line items.
- `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID` — PI Main Details.
- The 21 line-field keys of the PI and PV line-item forms (`HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_UNIT_PRICE_TXN`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_AMOUNT_TXN`), each evaluated as `HIDE_X && !SHOW_X-permission` (`line-item-add/item-details/main-details/main-details.component.html`).
- `HIDE_SERVER_DOC_1..3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1..5` — PV listing columns.
- `ENABLE_CUSTOM_STATUS_LINE_1..5`, `NAME_CUSTOM_STATUS_LINE_1..5` — extra columns on the Seller Order listing.
- `salesManLabels` — the sales-agent label filter on the PI and Seller Order Main Details forms.
- `HIDE_FINAL_BUTTON` — read only inside a commented-out block of the PI listing; no effect.

### Document behaviour settings

No exposed control found (routes and settings components checked at commit `6988e15`). The purchase invoice and payment voucher behave exactly as in their own applets; the seller order has no posting behaviour (see Lifecycle).

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Login link (rank, status) between a user and a merchant entity | [Merchant Applet](/applets/master-data/merchant-applet/) (or this applet's Seller Account menu, once a first link exists) | Decides which sellers appear in the Select User toggle and which `login-entity-ep` calls succeed. |
| Pricing scheme `enable_marketplace` and its owner entity | [Pricebook](/applets/master-data/pricebook-applet/) | Only such schemes are offered on the Pricing tab; the seller-order auto-allocation resolves the seller through the scheme's `entity_hdr_guid`. |
| Company Knock Off Configuration rows for `INTERNAL_PURCHASE_INVOICE` | [Organisation](/applets/master-data/organisation-applet/) › Company | Which source documents the PI › KO For tab can pull. |
| Settlement methods | [Cashbook](/applets/master-data/cashbook-applet/) | The choices in the PV › Payment tab (`STL_MTHD` lines). The `SettlementTypeOptions` list in `models/seller-account-constants.ts` (Bank Transfer … Membership Point Currency) is not referenced by any routed screen. |
| EcomSync item stock mode `MKP_SELLER_STOCK_BALANCE` | EcomSync item store configuration | `EcomSyncMainStockCalculationService` reads this applet's `bl_mkp_entity_branch_stock_balance` rows in that mode. |

### Feature visibility / permissions

The registry seeds **no** rows in `bl_applet_client_side_perm_dfn` for `seller_applet`, so none of the client-side codes the code checks can be granted from the Applet Access screen:

- `SHOW_INTERCOMPANY_PI_SCREEN` — renders the PI › Create › Search tab (build a PI from a FINAL intercompany sales invoice; `purchase-invoice-create.component.ts`).
- `SHOW_FINAL_BUTTON`, `SHOW_DOCUMENT_DELETE_BUTTON` (the latter read as an applet ext) — PI / PV edit buttons.
- `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1..5` — Seller Order › Main Details.
- The `SHOW_*` partner of every line-field `HIDE_*` key above.
- `INTERNAL_PAYMENT_VOUCHER_DISPLAY_PRICING` — PV line listing.

Server-side gates that do apply: `isUserLoginEntity(subject, entity_hdr_guid)` on every `login-entity-ep` / `login-merchant-ep` call (products, images, labels, attributes, stock balances, seller-order events, seller-order print); `API_TNT_DM_MKP_SELLER_ORDER_{READ,CREATE,UPDATE,DELETE,OWNER,ADMIN,MEMBER}` and `API_TNT_DM_MKP_PRICING_SCHEME_LINK_*`, `API_TNT_DM_MKP_ENTITY_BRANCH_STOCK_BALANCE_*` on the backoffice endpoints (`MkpPermissions.java`); `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_READ/CREATE/UPDATE_TGT_GUID` on the PI screens. The Product entry in `resolver/permission.resolver.ts` maps the permission wizard to `mkp/items/login-entity-ep`.

## Fields

### Seller Account › Login Create / Login Edit

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| User email | Login principal to link to the selected seller | Yes | `Validators.required` + `Validators.email`, max 255. **Verify Email** first: `core2/tnt/dm/users?type=EMAIL_USERNAME`; an unknown address offers **Send Invite** (`core2/platform/dm/iam/user-invitation`, `add_user_to_tenant: true`). Add stays disabled until the address is verified. Read-only on edit. |
| Rank | Role of the user within the seller | Yes | OWNER, ADMIN, MANAGER, MEMBER (default), GUEST, VISITOR, ANNONYMOUS. |
| Status | Link status | Yes | ACTIVE (default) / INACTIVE. Saved to `bl_fi_mst_entity_login_subject_link` (`POST`/`PUT core2/tnt/dm/erp/entity-login-subject-links`). The Delete action on edit dereferences an unset field and fails before saving. |

### Product › Information and Dimension Details

Pressing **+** on the listing immediately creates a `TEMP` item whose code is a random GUID (`products.effects.ts` → `POST mkp/items/new-login-entity-ep`); the Create Product form that follows (Seller Code, Seller Name, Description, Status) re-posts with `entity_hdr_guid = null` and its values are discarded. Rename the TEMP item on the Edit panel.

| Field | Meaning | Required | Saved | Notes |
|---|---|---|---|---|
| Seller Item Code | `bl_mkp_mst_item_hdr.code` | Yes | Yes | No uniqueness check in `MkpItemDataConsistencyObject` (the `MKP_ITEM_HDR_OBJECT_CODE_ALREADY_EXIST` constant is unused). |
| Item Name | `name` | Yes | Yes | |
| Type | `txn_type` | No | Yes | Free text. |
| Sub Item Type | `sub_item_type` | HTML `required` only | Yes | 18 options from `models/sub-item-type-constants.ts`. |
| Base UOM | `uom` | No | Yes | Free text. |
| Status | `status` | Yes | Yes | TEMP / ACTIVE / INACTIVE. |
| Currency | `ccy_code` | Yes | **No** | The effect reads a field the form does not populate; the value is written as `undefined`. |
| Abbreviation, EAN Code, Remarks, Sales Prompt, Purchase Prompt | — | No | **No** | Inputs without a form binding. |
| Height / Length / Width / Weight (Dimension Details) | `dim_*` | No | Yes | Saved with the main SAVE. |

There is no field for the financial item (`fi_item_guid`), pre-order (`cfg_preorder`), require-delivery or require-production flags — the columns exist but nothing in the applet exposes or writes them. Delete is a soft delete of header, lines, exts and image headers (`MkpItemUow.delete`).

### Product › other tabs

| Tab | Writes | Required | Notes |
|---|---|---|---|
| Label | `bl_mkp_mst_label_link` (`mkp/label-links/login-merchant-ep`) | Label | Works; a duplicate label is refused client-side. |
| Pricing | `bl_mkp_mst_pricing_scheme_link` (`mkp/pricing-scheme-links/backoffice-ep`): pricing scheme, purchase unit / min / max price incl. and excl. tax, tax and WHT codes, UOM | Pricing scheme | Works; needs `API_TNT_DM_MKP_PRICING_SCHEME_LINK_*`. Only schemes with `enable_marketplace = true` under `PRICING_SCHEME_ITEM` are listed. |
| Stock Availability | `bl_mkp_entity_branch_stock_balance` (`mkp/entity-branch-stock-balances/login-merchant-ep`): Store, Quantity Balance | Store | **Create works; Edit and Delete dispatch actions with no effect handler.** `qty_balance` is typed by hand; no quantity rule in the DCO (negative accepted). |
| Reviews | `bl_fi_item_review_hdr` (title, default value, rating config, status) and `bl_fi_item_review_vote_hdr` | Title, default value, rating config, status | Works, but stores the marketplace item guid in `fi_item_hdr_guid`. |
| Multi UOM, Manage Image, Attribute Set, Attribute Link | — | — | Read-only in practice: their create / update / delete actions have no effect handler (Manage Image's *Public* checkbox is never persisted). |
| Pages | `bl_fi_mst_item_post_hdr` by `fi_item_guid` | Title, sort order | Throws on every item created from this applet because `fi_item_guid` is null. |

### Seller Order › Edit Seller Order

Tabs: Main Details (document numbers, branch, location, date, remarks, permit no, tracking id, client key/value), Account (entity, billing and shipping address), Line Item (a grid over generic-document lines with a *Delivery* toggle), Export, Event. All three tabs bind to a generic-document draft store, not to `bl_mkp_seller_order_hdr`; **SAVE, FINAL and Delete reach no backend call** (`seller-order.effects.ts` has no handler for `SellerOrder_UPDATE_INIT` / `SellerOrder_DELETE_INIT`; FINAL has no handler at all). Export prints the seller order through `mkp/seller-orders/login-merchant-ep/print-jasper-pdf/{guid}`. Event lists `bl_mkp_seller_order_event` rows — the header filter is commented out, so it shows every event in the tenant.

### Branch

| Field | Meaning | Required | Saved | Notes |
|---|---|---|---|---|
| Branch Code | `bl_fi_mst_branch.code` | Yes | Yes | `POST core2/dm/erp/branches`. |
| Branch Name | — | Yes | **No** | Not mapped by `branch.effects.ts`; the name is lost. |
| Description | `descr` | No | Yes | |
| Status | `status` | Yes | Yes | ACTIVE / INACTIVE. |

The listing's "Address" column is bound to the company field. The Edit panel shows only audit fields and its save sends code/description/status as `undefined`.

### Purchase Invoice and Payment Voucher

The forms are the standard generic-document forms; see the field tables on [Internal Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) and [Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/). Differences in this build:

- **PI:** Create works (`InternalPurchaseInvoiceService.post` after the location code is resolved). On the Edit panel the FINAL, SAVE and DISCARD buttons are bound to methods that are commented out (`purchase-invoice-edit.component.ts`), so they do nothing. Batch FINAL / DISCARD on the listing is inside an HTML comment. The listing is **not** filtered by the selected seller.
- **PV:** Create dispatches an action whose effect is commented out (`internal-payment-voucher.effects.ts`) — nothing is posted. Edit › SAVE (`PUT`) and FINAL (`updatePostingStatus` → `posting_status = FINAL`, toast "Posting Successfully") work; there is no VOID button. Payment lines come from the cashbook settlement methods; Contra links the voucher to any open document, including a PI, through `bl_fi_generic_doc_arap_contra`.

## Lifecycle and effects

### Seller order

The seller order is a marketplace-table record, not a finance document. It is not in `ServerDocTypes`, has no `FinancialDocDataConsistencyObject`, no journal, no `bl_inv_txn_line`, no open queue.

*Posting proof block (from the backend):* server document type `SELLER_ORDER` (string literal on `bl_mkp_seller_order_hdr`, `MkpSellerOrderService.createSellerOrderLinesFromTmpLines`) · amount signum `1` · quantity signum `1` (`MkpSellerOrderDataConsistencyObject`, `correctAmountSignum` / `correctQuantitySignum` — validation constants on the mkp tables; a header with another signum fails `checkAmountSignum`) · Dr/Cr equation: none · GL precedence: none · stock processor: none · VOID: none — the only removal is `DELETE mkp/seller-orders/{backoffice-ep|login-merchant-ep}/{guid}` (`MkpSellerOrderUow.delete`).

How a seller order comes to exist (three queue processors, `JobProcessorClassName`; none is scheduled by this repository — they run only if enqueued or put on a crontab):

1. `CPCOMMERCE_SALES_ORDER_QUEUE_PROCESSOR` — for every `INTERNAL_SALES_ORDER` / `CPCOMMERCE_SALES_ORDER` header with `seller_order_alloc_queue IS NULL`, marks the header and inserts one `bl_mkp_seller_order_allocation_queue` row per line.
2. `MKP_TMP_SELLER_ORDER_LINE_CREATION_PROCESSOR` — for every sales-order line with a `bl_mkp_seller_allocation_queue` row, `getSellerForSpecificItemQuery` joins line → `bl_mkp_mst_item_hdr.fi_item_guid` → `bl_mkp_mst_pricing_scheme_link` → the scheme's seller entity. **Only when exactly one seller matches** it creates a `bl_mkp_tmp_seller_order_line` (`processing_status = TMP_CREATED`, quantity = ordered − allocated, `purchase_price` = the seller's price from the link) and closes the queue row. Items with several candidate sellers wait for manual allocation: `POST mkp/tmp-seller-order-line/tmp-seller-order-line-create/backoffice-ep` with `allocated_qty_to_seller` per seller (`TmpSellerOrderLineController`; permission `API_TNT_DM_MKP_SELLER_ORDER_CREATE`). In both paths `purchase_amount` is set to the **quantity**, not price × quantity (`TmpSellerOrderLineService`).
3. `MKP_SELLER_ORDER_LINE_CREATION_PROCESSOR` or `POST mkp/seller-orders/create-order-from-tmp/backoffice-ep` — each `TMP_CREATED` tmp line becomes one header + one line (`merchant_guid` = seller, `entity_hdr_guid` = customer, `fi_gendoc_hdr_guid` = the sales order, amounts = `purchase_amount`), and the tmp line goes to `FINISHED`. One tmp line = one seller order; nothing groups lines per seller.

Status: `status` is the generic ACTIVE / INACTIVE / DELETED column. `status_server`, `status_client`, `marketplace_status` (shown as *Order Status*) and `track_delivery_sub_status` (*Delivery Status*) are never written for `SELLER_ORDER` rows by any backend or applet code — the fulfilment statuses in the listing stay empty. `bl_mkp_seller_order_event` is an audit row (event code, date, user, device, description) that only the CRUD endpoints create.

### Marketplace item and stock balance

- Item: created `TEMP` (forced by `mkp/items/new-login-entity-ep`), then `ACTIVE` / `INACTIVE` from the Edit panel; delete is a soft delete. Backend validations: `MKP_ITEM_HDR_INV_ITEM_HDR_GUID_DOES_NOT_EXIST` when `inv_item_hdr_guid` is set to a missing item; `client_key + client_source + client_value` must be unique among non-DELETED rows; `comp_guid`, `cashbook_guid`, `label_hdr_guid` must exist when set. `fi_item_guid` is not validated.
- Stock balance: `qty_balance` is whatever the seller typed. `EcomSyncMainStockCalculationService` (seller-stock mode) sets `qty_available = qty_balance − open sales-order quantity` per row and is meant to roll the totals up onto the EcomSync item, but the roll-up adds to immutable `BigDecimal` values and discards the result, so the EcomSync totals stay 0.

### Purchase invoice and payment voucher

Posted by the generic-document engine exactly as documented on [Internal Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) (amount signum −1, quantity signum +1 — stock in; Dr Purchase + Input Tax / Cr Creditor) and [Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/). Nothing links a PI or PV to a seller order — no processor, effect or backend method creates a PI from `bl_mkp_seller_order_*`.

## Related applets

- [Merchant Applet](/applets/master-data/merchant-applet/) — creates the seller entity and the first login links this applet depends on.
- [Seller Admin Applet](/applets/ecommerce/seller-admin-applet/) — the marketplace owner's side: sales-order line queue and manual allocation.
- [Internal Sales Order](/applets/sales-workflow/internal-sales-order-applet/) — source of every seller order.
- [Pricebook](/applets/master-data/pricebook-applet/) — marketplace pricing schemes; the automatic allocation resolves the seller through them.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the financial item behind a marketplace item.
- [Internal Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/), [Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/) — the settlement documents; use those applets to FINAL a PI or to create a PV.
- [Cashbook](/applets/master-data/cashbook-applet/), [Organisation](/applets/master-data/organisation-applet/) — settlement methods and knock-off configuration.
- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — storefront orders that enter the allocation queue as `CPCOMMERCE_SALES_ORDER`.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Toast "Please select account in left menu"; Product / Seller Order listings stay empty | No seller chosen in the Select User toggle, or the toggle is empty because the login has no `bl_fi_mst_entity_login_subject_link` row to a merchant entity. | Link the user to the merchant entity in the Merchant applet (or have an existing seller user add the login under Seller Account), reload, pick the seller. |
| Pressing **+** on Product shows "Error456" and a new item with a long random code appears | The listing's + creates a TEMP item immediately; the Create form's second post fails (`entity_hdr_guid = null`). | Ignore the toast, open the TEMP item and set its code, name and status on the Edit panel. |
| Product › Pages tab: "Cannot read properties of null (reading 'toString')" | The tab queries posts by `fi_item_guid`, which this applet never sets. | Have the financial item link set on the Seller Admin side or by support; until then use Doc Item Maintenance for item pages. |
| Currency, EAN code, remarks or prompts on a product are not saved | Those inputs are unbound, or (Currency) the save effect reads a different field. | Known build defect; there is no workaround in this applet. |
| Seller Order › SAVE / FINAL / Delete do nothing; Delivery Type has no effect; search returns empty rows | No effect handles the update / delete actions; the selector is unbound; the advanced search queries the generic pick-pack queue instead of seller orders. | Use the listing as read-only. Filter with the column filters, not the search bar. |
| Seller orders never appear although the sales order is FINAL | Allocation is automatic only when exactly one seller's marketplace pricing scheme is linked to the item's `fi_item_guid`; the three processors must be enqueued or scheduled; manual allocation needs the backoffice endpoint. | Check `bl_mkp_seller_order_allocation_queue` / `bl_mkp_seller_allocation_queue` rows and `bl_mkp_tmp_seller_order_line.processing_status`; confirm `fi_item_guid` and the pricing-scheme link; run the processors. |
| Seller order amounts equal the quantity | `purchase_amount` is set to the quantity when the tmp line is built. | Backend defect (`TmpSellerOrderLineService`); the seller's price is still on `unit_price_*`. |
| Order Status / Delivery Status columns are always blank | Nothing writes `marketplace_status` / `track_delivery_sub_status` for `SELLER_ORDER` rows. | Expected in the current build. |
| Event tab lists events of other orders | The `hdr_guid` criterion is commented out. | Expected; filter by the Seller Order No column. |
| PI Edit › FINAL / SAVE / DISCARD do nothing | The handlers are commented out. | Finalise or edit the invoice in the Internal Purchase Invoice applet — it is the same document. |
| PV › Create posts nothing | The create effect is commented out. | Create the voucher in the Internal Payment Voucher applet, then edit / FINAL it here if needed. |
| Branch created without a name; Branch edit saves blanks | `branch.effects.ts` does not map Branch Name; the edit form has no editable controls. | Maintain branches in the Organisation applet. |
| Settings › Default Selection throws when a branch is chosen; defaults never stick | The component has no settings container bound. | Support writes `DEFAULT_BRANCH` / `DEFAULT_LOCATION` into the `APPLET_SETTINGS` ext of `seller_applet`; the personal override cannot be set either. |
| Stock Availability edit / delete have no effect; EcomSync seller stock totals stay 0 | No effect handler for update / delete; the backend roll-up discards its `BigDecimal.add` results. | Delete and re-create the balance row; treat EcomSync seller totals as unreliable. |
| Backend error `…COMPOSITE_CLIENT_KEY_AND_CLIENT_SOURCE_AND_CLIENT_VALUE_ALREADY_EXISTS` | Another non-deleted item or seller order carries the same client key / source / value. | Change the client value or reuse the existing record. |
| HTTP 401 on a product, label, stock or event call | `isUserLoginEntity` — the login is not linked to the entity the row belongs to. | Add the login link for that seller. |
| Marketplace (Shopee) sales orders stop arriving, so nothing enters the allocation queue | The platform-wide Shopee partner key expired; every Shopee-connected tenant stopped polling until it was reset (support case, 2026-08). | Not a Seller Applet setting — check the EcomSync credential refresh job and the `remarks` on the Shopee resource rows. |

## Related documentation

- [E-Commerce module](/modules/ecommerce/) — where the marketplace and storefront applets sit.
- [Merchant Applet](/applets/master-data/merchant-applet/) — seller entities and login links.
- [Internal Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) and [Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/) — full field and posting reference for the settlement documents.
