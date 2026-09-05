---
title: "Shopping Cart (Internal)"
description: "Back-office listing and editor for INTERNAL_SHOPPING_CART documents — carts raised by staff, by customer logins, or by CP Commerce storefront checkouts — with FINAL and delete, no posting"
applet_code: "InternalShoppingCart"
page_type: applet
applet_repo: "blg-applet-wavelet-internal-shopping-cart-applet"
modules: [ecommerce]
related_applets:
  - internal-shopping-cart-customer-access-applet
  - cp-commerce-admin-applet
  - internal-sales-order-applet
  - internal-receipt-voucher-applet
  - customer-maintenance-applet
  - cashbook-applet
  - organisation-applet
  - tax-configuration-applet
  - doc-item-maintenance-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/settings-container/printables/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/models/constants/printable-format-constants.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-container.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-view/internal-shopping-cart-view.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-create/internal-shopping-cart-create.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-add-line-item/add-line-item-item-details/add-line-item-item-details.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-add-line-item/add-line-item-item-details/add-line-item-item-details.component.html
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-edit-line-item/edit-line-item-item-details/edit-line-item-item-details.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-edit-line-item/edit-line-item-item-details/edit-line-item-item-details.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-shared-utilities/modules/settings/settings.component.html
    - blg-shared-utilities/modules/settings/feature-visibility/feature-visibility.component.ts
    - blg-shared-utilities/modules/settings/webhook/webhook.component.ts
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/internal-sales-order-container/internal-sales-order-create/import-knock-off/import-knock-off.component.ts
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/internal-sales-order-container/internal-sales-order-view/search-documents/search-sc/search-sc.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/cpCommerce/LineIntegrityConfig.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
  fields:
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-create/internal-shopping-cart-create-main/internal-shopping-cart-create-main.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-create/internal-shopping-cart-create-main/internal-shopping-cart-create-main.component.html
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-create/internal-shopping-cart-create-account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-create/internal-shopping-cart-create-account/internal-shopping-cart-create-account.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-create/internal-shopping-cart-create-line-items/internal-shopping-cart-create-line-items.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-create/internal-shopping-cart-create-payment/internal-shopping-cart-create-payment.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-add-payment/internal-shopping-cart-add-payment.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-add-payment/internal-shopping-cart-add-payment.component.html
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-create-line-item/line-search-item/line-search-item.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-listing/internal-shopping-cart-listing.component.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/models/advanced-search-models/internal-shopping-cart.model.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/services/internal-shopping-cart-pages.service.ts
  lifecycle:
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/state-controllers/internal-shopping-cart-controller/store/effects/internal-shopping-cart.effects.ts
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-view/internal-shopping-cart-view.component.html
    - blg-applet-wavelet-internal-shopping-cart-applet/micro-fe/projects/wavelet-erp/applets/internal-shopping-cart-applet/src/app/components/internal-shopping-cart-container/internal-shopping-cart-listing/internal-shopping-cart-listing.component.html
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-shopping-carts.service.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/ShoppingCartDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/shoppingCart/InternalShoppingCartController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InternalShoppingCartService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/cpCommerce/CpCommerceShoppingCartService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/cpCommerce/CartLineIntegrityHashService.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/cpCommerce/CartLineIntegrityHashService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InternalShoppingCartService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - gh:bigledger/blg-applet-wavelet-internal-shopping-cart-applet#1
    - gh:bigledger/blg-int-general-task#6539
    - gh:bigledger/blg-int-general-task#4383
tags:
  - shopping-cart
  - cp-commerce
  - entity-credit
  - settlement-methods
  - customer-management
weight: 170
aliases:
  - /applets/shopping-cart-applet/
---

## Overview

The Shopping Cart (Internal) applet is the back-office window onto `INTERNAL_SHOPPING_CART` documents (short code `SHPCRT`). A cart is a pre-order: a customer, a branch and location, a list of items and, optionally, a list of payments the customer has already made. Carts reach this listing from three places — staff create them here, customer logins create them in the [Shopping Cart Customer Access (Internal)](/applets/ecommerce/internal-shopping-cart-customer-access-applet/) applet, and CP Commerce storefronts create them at checkout or point-purchase. Staff open a cart to correct the customer, addresses, items or payments, then set it to FINAL so a Sales Order can be raised against it, or delete it.

A cart is not an accounting document. Its amount and quantity signums are both zero, so FINAL writes no journal and moves no stock. What FINAL does is make the cart lines available to the [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) applet's "Search Shopping Cart" / "Shopping Cart" knock-off tabs — provided the company's Knock Off Configuration has a Shopping Cart → Sales Order row.

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Shopping Cart Customer Access (Internal)](/applets/ecommerce/internal-shopping-cart-customer-access-applet/) | Customer logins create and edit their own `INTERNAL_SHOPPING_CART` through `core2/tnt/dm/ecom/internal-shopping-carts` (one cart per customer entity, login must be linked to the entity). The same rows appear in this listing. |
| Upstream | [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) storefronts | Storefront checkout and point purchases create carts through `core2/tnt/dm/cp-commerce/internal-shopping-carts`; `CpCommerceShoppingCartService.convertShoppingCartToSalesOrder` turns a paid cart into an `INTERNAL_SALES_ORDER` without visiting this applet. |
| Master data | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Organisation](/applets/master-data/organisation-applet/) | Customer (with addresses, credit terms and limits), items (`txn_class = PNS`), settlement methods (`STL_MTHD` items), SST / WHT codes, branch and location. |
| Downstream | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) (v2 applet) | After FINAL, cart lines enter the generic line open queue (`INTERNAL_SHOPPING_CART` → `INTERNAL_SALES_ORDER`) and are picked up by the Sales Order's "Search Shopping Cart" tab and "Shopping Cart" knock-off panel. |
| Downstream (not wired) | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | The code contains a "convert to receipt voucher" effect (create an `INTERNAL_RECEIPT_VOUCHER` from the payment lines, then delete the cart) but no button calls it — see Lifecycle. |

## Screens and menus

The sidebar has one menu item, **Shopping Cart**. Screens are the usual two-column stack: the listing on the left, the selected screen on the right.

- **Internal Shopping Cart Listing** — ag-grid, client-side pagination (first 50 carts by `updated_date` descending). Columns: Doc Short Code (checkbox), Doc No (`server_doc_1`), Branch, Posting Status (blank shown as `DRAFT`), Customer Name, Creation Date, Sales Agent, Amount Txn, Updated Date, Doc Remarks. Branch, sales agent and customer names are resolved row by row with three extra calls per cart. The **FINAL** button above the grid finalises every ticked row that is not already FINAL. Advanced search: free-text keyword (matched against cart search word, branch name and customer name, union of results, 500 each) or the fields Customer Name, Creation Date from/to, Branch.
- **Internal Shopping Cart Create** — buttons RESET and **Create** (disabled while Main Details is invalid or no customer is selected). Four tabs: Main Details, Account (Entity Details / Bill To / Ship To), Line Items, Payment. In vertical orientation the tabs become expansion panels.
- **Internal Shopping Cart View** — buttons RESET, **Final**, **SAVE** (disabled while Main Details is invalid), and a **DELETE** button at the bottom that needs a second click (`CLICK AGAIN TO CONFIRM`, 3-second window). Same four tabs. Once the cart is FINAL, Branch, Location, Member Card and Currency are locked.
- Pickers opened from the form: Select Member, Select Customer, Select Billing Address, Select Shipping Address, Add Payment, Select Line Item (item search with `txn_class = PNS`, columns Item Code, Item Name, UOM, Unit Price, System Stock Balance), Add Line Item, Edit Line Item.
- **Customer create/edit** — the Select Customer screen has a select/edit toggle; edit mode opens a full customer editor (Main, Category, Login, Payment Config, Tax, Address, Contact, Branch, Item Pricing, Credit Term, Credit Limit) that writes to the same entity tables as the Customer Maintenance applet.
- **Settings** (gear): System Configuration › Application Settings, Default Selection, Printables; Server Side Permissions › Permission Wizard, Permission Set, User Permission, Role Permission; Developer Tools › Release Notes, Audit Trail. The routes `feature-visibility` and `webhook` also exist (and `settings` with no sub-path redirects to `feature-visibility`) but have no menu link; the shared Feature Visibility screen only logs the permission list and the shared Webhook screen is a sample-data stub.
- **Personalization**: Default Selection only.

{{< figure src="/images/shopping-cart-applet/shopping-cart-create-main.png" alt="Line Items panel of a new shopping cart with an empty grid" caption="Line Items panel on a new cart: the + button opens the item search, totals sit above the grid." >}}

{{< figure src="/images/shopping-cart-applet/shopping-cart-edit-details.png" alt="Entity Details panel with Bill To and Ship To sub-panels above the Line Items grid" caption="Account panel in vertical orientation: Entity Details, then Bill To and Ship To, then Line Items." >}}

{{< figure src="/images/shopping-cart-applet/shopping-cart-edit-lines.png" alt="Line Items grid showing one test item with the Delivery slider" caption="Line Items grid: Item Code, Item Name, UOM, Delivery slider, Qty, then Unit Price, SST/VAT/GST and Txn Amount to the right." >}}

{{< figure src="/images/shopping-cart-applet/shopping-cart-edit-payment.png" alt="Payment panel with Total and Outstanding and an empty payments grid" caption="Payment panel: Total is the sum of payment lines, Outstanding is the line-item total minus payments." >}}

## Configuration

### Before you can use it

- **Company, branch and location** in the [Organisation applet](/applets/master-data/organisation-applet/). Branch and Location are required on every cart; selecting a branch fills Company and Currency, and the branch's `MAIN_LOCATION` extension fills Location.
- **Knock Off Configuration** (Organisation › Company): a `LINE` flow row `INTERNAL_SHOPPING_CART` → `INTERNAL_SALES_ORDER`, enabled. Without it, FINAL creates no open-queue rows and the Sales Order applet hides its Shopping Cart knock-off panel (`import-knock-off.component.ts` reads `bl_fi_comp_gendoc_flow_config`).
- **Customers** in [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) with at least one address; the Bill To / Ship To pickers list only the selected customer's addresses.
- **Sales agents** — employee entities; Sales Agent is required.
- **Items** with `txn_class = PNS` in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/); pricing schemes if the Add Line Item dialog should offer them.
- **Settlement methods** in the [Cashbook applet](/applets/master-data/cashbook-applet/): `STL_MTHD` items whose `SETTLEMENT_TYPE` extension is one of `CASH`, `CASH_BACK`, `CREDIT_CARD`, `VOUCHER`, `BANK_TRANSFER`, `MEMBERSHIP_POINT_CURRENCY`, `CHEQUE`. The Add Payment dialog switches its fields on this value.
- **Tax codes** (SST and WHT) in [Tax Configuration](/applets/master-data/tax-configuration-applet/), unless the tax selectors are hidden.
- **Server-side permissions** `TNT_API_DOC_INTERNAL_SHOPPING_CARTS_CREATE_TGT_GUID`, `…_READ_TGT_GUID`, `…_UPDATE_TGT_GUID`, `…_DELETE_TGT_GUID` assigned through Settings › Permission Set / User Permission / Role Permission. FINAL uses the UPDATE permission; DELETE uses the DELETE permission.

### Applet settings

Settings live in four places: the **shared** `FieldConfigurationComponent` from blg-shared-utilities (Settings › Application Settings, saved into `bl_applet_ext.APPLET_SETTINGS` by `saveMasterSettingsInit`), the **applet-local** Default Selection screen (same `APPLET_SETTINGS` record), the applet-local **Printables** screen, and **Personalization › Default Selection** (per-login `USER_SETTINGS`). There is no inline gear (`app-applet-settings-toggle` is not used), and the applet's own `field-configuration.component` is an empty, unrouted stub. Anyone with access to the applet's Settings menu can change master settings; personal settings are per login and override master values where both exist.

The table lists only keys that are declared in `applet-settings.model.ts`, rendered by a control, persisted, and read by the cart screens (four proofs, checked against the shared component at the submodule commit `f90a5c7` the applet pins and at `a8c38a2`; the results are identical for these keys).

| Setting | Where | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` | Application Settings › Line Items | Pricing-scheme / UOM selector in Add and Edit Line Item | Off (nothing is pre-hidden for this applet code) | Field disappears unless the login holds the matching `SHOW_*` client-side permission |
| `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_INCL_TAX` | same | Standard unit price excl./incl. tax (read-only) | Off | same |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX` | same | Unit discount, unit discount by UOM, discount amount | Off | same |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | same | Quantity, quantity by UOM, UOM-to-base ratio | Off | same. Hiding both quantity inputs leaves the line at its default quantity |
| `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN` | same | The by-UOM and net/transaction unit prices | Off | same |
| `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN` | same | Standard, net and transaction line amounts | Off | same |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | same | SST selector + rate + amount; WHT selector + rate + amount | Off | same. With the tax selector hidden the line keeps the item's default tax code |
| `SHOW_DOCUMENT_DELETE_BUTTON` | Application Settings › Gen Doc Listing | The DELETE button at the bottom of the View screen | Off — no DELETE button | Read directly from `bl_applet_ext.APPLET_SETTINGS` when the View screen opens; never shown on a FINAL cart |
| `VERTICAL_ORIENTATION` | Application Settings › Gen Doc Listing | Tabs (off) or expansion panels (on) on Create, View and Edit Line Item | Off | Personal `DEFAULT_ORIENTATION` overrides it: `HORIZONTAL` forces tabs, `VERTICAL` forces panels |
| `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS` | Application Settings › Gen Doc Listing | Which panel opens first in vertical orientation | Off (first panel) | The first key that is on wins; panels marked on stay expanded |
| `DEFAULT_LANGUAGE_CODE` | Default Selection › Default Language | Applet UI language (`bl_applet_hdr.default_language_code`) | `en` | Personal language (Personalization › Default Selection) takes precedence |
| `DEFAULT_TOGGLE_COLUMN` (personal) | Personalization › Default Selection | Listing layout `SINGLE` / `DOUBLE` | Unset (double column on desktop) | Evaluated together with `VERTICAL_ORIENTATION` in the container |
| `DEFAULT_ORIENTATION` (personal) | Personalization › Default Selection | `HORIZONTAL` / `VERTICAL` form layout | Unset (follows master `VERTICAL_ORIENTATION`) | See `VERTICAL_ORIENTATION` |

Keys the screens read without a control on the shared screen for this applet code: `EXPAND_PAYMENTS` (the Create/View panel list expects it; the shared screen renders `EXPAND_SETTLEMENT` instead, so the Payment panel can never be pre-expanded).

Keys rendered and saved but never read by the cart form:

- `DEFAULT_BRANCH`, `DEFAULT_LOCATION` — Default Selection saves them into master settings (and the personal screen into personal settings), but neither the Create form nor the Add Line Item dialog reads them: a new cart always starts with an empty Branch and Location. The master screen also pre-fills its own controls from the *personal* settings, so what it shows after a reload may not be what it saved.
- Everything else the shared Application Settings screen renders for this applet code (about 200 toggles at commit `f90a5c7`, e.g. `DISALLOW_SELL_BELOW_MIN_PRICE`, `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID`, `HIDE_SALES_AGENT`, `HIDE_SERVER_DOC_1..3`, `DEFAULT_POSTING_STATUS`, `ENABLE_AUTO_PRINT`, `CANNOT_EDIT_CURRENCY_RATE`, `FINAL_STATUS_GUID`). None of them is consumed by this applet's code. In particular `LOCK_PURCHASER_TO_CURRENT_USER`, the `HIDE_DOC_NO_*` keys and a "mandatory reason" setting, listed by an earlier version of this page, do not exist in the applet.
- **Printables** (Settings › Printables): the screen uploads Jasper formats and stores the default under the extension `INTERNAL_SALES_QUOTATION_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_INTERNAL_SALES_QUOTATION`, and its listing is filtered to `txn_type = INTERNAL_SALES_QUOTATION` — constants copied from the Sales Quotation applet. The print effect (`printJasperPdf$`) is commented out and the Export tab is not rendered, so nothing in this applet prints.

### Document behaviour settings

No exposed control found: the applet reads no `FINAL_STATUS_GUID`, workflow, void-reason, auto-print or e-Invoice key (routes and settings components checked at applet commit `5627dab`, shared-utilities `f90a5c7`). FINAL, delete and the missing VOID / DISCARD are fixed in code — see Lifecycle.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Knock Off Configuration row `INTERNAL_SHOPPING_CART` → `INTERNAL_SALES_ORDER`, flow type `LINE`, enabled | [Organisation](/applets/master-data/organisation-applet/) › Company | Whether FINAL writes line open-queue rows (`GenericDocLineOpenQueueProcessor`) and whether the Sales Order v2 applet shows its Shopping Cart knock-off panel |
| `HIDE_SEARCH_BY_SHOPPING_CART_TAB`, `HIDE_KO_SHOPPING_CART_TAB` | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) v2 › Application Settings | Hide the tabs through which a FINAL cart is turned into a Sales Order |
| Settlement method items (`SETTLEMENT_TYPE`) | [Cashbook](/applets/master-data/cashbook-applet/) | Which payment types the Add Payment dialog offers and which fields it asks for |
| `bl_cms_website_hdr.property_json.line_integrity_config` (`enabled`, `day_limit`, optional `secret`) | Website record of the [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) applet (no admin screen; set in the website JSON) | When enabled for any website, storefront and customer-access carts get an HMAC token per line and the storefront checkout verifies it. Edits made from this applet go through the plain back-office `PUT gen-doc/internal-shopping-carts`, which does not re-stamp lines — see Troubleshooting |

### Feature visibility / permissions

`bl_applet_client_side_perm_dfn` seeds 21 client-side permissions for `InternalShoppingCart`: the 20 `SHOW_*` counterparts of the line-detail `HIDE_*` settings above, plus `SHOW_COSTING_DETAILS`. The Add and Edit Line Item dialogs show a field when `!HIDE_X || SHOW_X` — so a tenant-wide hide can be reopened for a role or user by granting the `SHOW_X` permission. `SHOW_COSTING_DETAILS` is seeded but not read by this applet. No permission gates Create, FINAL or DELETE on the client; those are enforced by the server-side `TNT_API_DOC_INTERNAL_SHOPPING_CARTS_*` permissions (Settings › Permission Set).

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Doc Short Code | `SHPCRT` | — | Read-only |
| Doc No Tenant / Company / Branch | `server_doc_1..3` | — | Edit mode only; editable text inputs |
| Branch | `guid_branch`; fills Company and Currency | Yes | Locked once FINAL |
| Location | `guid_store` | Yes | Pre-filled from the branch `MAIN_LOCATION`; locked once FINAL |
| Sales Agent | Employee entity, stored in `doc_entity_hdr_json.salesAgent` | Yes | Listing shows the agent name |
| Currency | `doc_ccy` | Yes | From branch; locked once FINAL |
| Credit Terms, Credit Limit | Copied from `doc_entity_hdr_json` | Marked required but disabled | Disabled controls do not block Save; display only |
| Transaction Date | `date_txn` | No | Date picker; on SAVE the server's stored date is re-applied |
| Sales Lead | Corporate / Non-Corporate | No | Defaults to Corporate |
| Permit No, Tracking ID, CRM Contact | Header extensions | No | Free text |
| Member Card | `member_guid` via the Select Member screen | No | Locked once FINAL |
| Remarks | `doc_remarks` | No | Shown in the listing's Doc Remarks column |

### Account

| Sub-tab | Field | Required | Notes |
|---|---|---|---|
| Entity Details | Entity ID (opens Select Customer) | Yes | The only required Account field; Create is disabled until it is set |
| Entity Details | Name, Type, ID Number, GL Code, Email, Phone, Status | — | Read-only, from the customer record |
| Bill To | Name, Email, Phone; Address (opens Select Billing Address); Address Line 1–5, City, State, Postcode, Country | No | Address fields read-only; picker limited to the customer's addresses |
| Ship To | Same as Bill To for the recipient | No | |

### Line Items and Add / Edit Line Item

Grid columns: Item Code, Item Name, UOM, Delivery (slider bound to `quantity_base`), Qty, Unit Price, SST/VAT/GST, Txn Amount; Total and Tax above the grid. The + button opens the item search (`txn_class = PNS`).

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item Code / Item Name | From the selected item | — | Code read-only, name editable |
| Pricing Scheme / UOM | Pricing-scheme UOM selector | — | Hidden by `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` |
| Unit Price STD (excl. / incl. tax), by UOM | Standard prices | — | Read-only; hidden by the matching `HIDE_*` |
| Unit Discount, Unit Discount by UOM, Discount Amount | Discounts | No | Hidden by the matching `HIDE_*` |
| Quantity, Quantity by UOM, UOM to Base Ratio | Quantities | — | Ratio read-only |
| Unit Price Net / Txn, Std / Net / Txn Amount | Computed amounts | — | Read-only except where the template leaves them editable |
| Tax Code, Tax %, Tax Amount | SST selector and computed values | — | Hidden together by `HIDE_TAX_CONFIG_SELECTION` |
| WHT Code, WHT %, WHT Amount | Withholding tax | — | Hidden together by `HIDE_WHT_CONFIG_SELECTION` |
| Remarks | `item_remarks` | No | |

### Payment and Add Payment

Grid columns: Date, Amount (`amount_net`), Details (`item_name` of the settlement method), Remarks. Total = sum of payment lines; Outstanding = line-item total − payments. Payment lines are saved as `bl_fi_generic_doc_line` rows with `txn_type = STL_MTHD` and `server_doc_type` `INTERNAL_RECEIPT_VOUCHER` (`INTERNAL_PAYMENT_VOUCHER` for `CASH_BACK`).

| Settlement type | Required fields | Extra fields |
|---|---|---|
| `CASH` | Date, Amount (≥ 0.01) | — |
| `CASH_BACK` | Date, Cash Back, Amount | Cash Back for Settlement (read-only) |
| `CREDIT_CARD` | Date, Amount, Card No, Name on Card, Card Issuer (VISA / MASTERCARD), Year, Month, CVV | Card Type (Gold / Silver / Rebate Point) |
| `VOUCHER` | Amount, Voucher No | — |
| `BANK_TRANSFER` | Date, Amount, Transaction No | — |
| `MEMBERSHIP_POINT_CURRENCY` | Date, Amount | Points selection, point currency value |
| `CHEQUE` | Date, Amount | Cheque No |

## Lifecycle and effects

**Endpoints.** The applet uses `InternalShoppingCartsService` from blg-akaun-ts-lib, i.e. the generic document controller at `core2/tnt/dm/erp/gen-doc/internal-shopping-carts`: `POST` (Create), `PUT` (SAVE, after re-reading the server revision), `PUT …/update-posting-status/{guid}` (Final, bulk FINAL) and `DELETE …/{guid}` (DELETE). It does **not** use the ecom endpoint (`core2/tnt/dm/ecom/internal-shopping-carts`, `InternalShoppingCartController`), whose one-cart-per-entity rule (`SHOPPING_CART_ALREADY_EXIST`) and login-entity check apply only to the Customer Access applet.

**Statuses.** `posting_status` empty (shown as `DRAFT`) → `FINAL`. FINAL is one-way; pressing Final on a FINAL cart shows the toast *This document has been posted* without calling the server. There is no VOID or DISCARD button (the backend `…/discard/backoffice-ep/{guid}` endpoint exists but is not called). DELETE is offered only on non-FINAL carts and only when `SHOW_DOCUMENT_DELETE_BUTTON` is on; the backend checks `TNT_API_DOC_INTERNAL_SHOPPING_CARTS_DELETE_TGT_GUID` and removes the header with its lines, links, extensions and events (`GenericDocumentUow.delete`) — it is not a DISCARD and the listing no longer shows the cart.

**Posting proof block.**

- Server document type: `INTERNAL_SHOPPING_CART` (`ServerDocTypes.INTERNAL_SHOPPING_CART(0,0)`, short code `SHPCRT`).
- Amount signum: **0**; quantity signum: **0** (`ShoppingCartDataConsistencyObject`: `checkAmountSignum(container, ZERO)` on create and update, line signums filled 0/0). A header sent with a non-zero `amount_signum` is rejected by the DCO.
- Dr/Cr equation: none. `JournalPostingTypeHandler.handlers` has no `INTERNAL_SHOPPING_CART` entry; the fallback in `JournalPostingService` maps the type to an empty sub-ledger list (its name contains neither `SALES` nor `PURCHASE`), and with zero-signum amounts the journal totals are 0/0, which ends the journal job with `NO_JOURNAL_CREATED` (`JournalPostingService`, the `totalDebit.signum() == 0 && totalCredit.signum() == 0` check). No `bl_fi_jrnl_*` rows.
- GL precedence: not applicable.
- Stock processor: none — quantity signum 0 means no `bl_inv_txn_line` rows and no cost update.
- What VOID reverses: nothing; there is no VOID.

**What FINAL does do.** `GenericDocumentService.updatePostingStatus` runs `validateGenericDocumentOnFinal` — no cart-specific rule, but the shared checks apply: serial / bin / batch quantity checks on lines that carry them, and `FISCAL_PERIOD_LOCKED` when `date_txn` falls in a company period locked with `LOCK_ALL` or `LOCK_TXN`. On success the cart is queued to `GenericDocumentPrimaryProcessor`, whose subscribers (filtered by the company's `posting_final_json` include/exclude list) include `GenericDocLineOpenQueueProcessor`: with an enabled `INTERNAL_SHOPPING_CART` → `INTERNAL_SALES_ORDER` line-flow row it writes open-queue rows, which the Sales Order v2 applet queries with `line_open_queue_server_doc_type_1 = INTERNAL_SHOPPING_CART` and `…_2 = INTERNAL_SALES_ORDER`. Webhook `…_CREATED` / `…_MINIMALLY_CREATED` events and message-template events are queued as for every generic document; the custom-processing filter processor runs asynchronously afterwards.

**Convert and Print.** `convertShoppingCart$` builds an `INTERNAL_RECEIPT_VOUCHER` (`amount_signum = -1`) from the cart's payment lines, posts it and then deletes the cart — but the Convert tab and the Export tab are commented out of the View template, and the print effect is commented out, so neither can be triggered from the UI. Storefront carts are converted to Sales Orders by the backend (`CpCommerceShoppingCartService.convertShoppingCartToSalesOrder`, after `verifyCartLineIntegrityAtCheckout`), not by this applet.

## Related applets

- [Shopping Cart Customer Access (Internal)](/applets/ecommerce/internal-shopping-cart-customer-access-applet/) — the customer-facing twin: same document type, ecom endpoint with one cart per customer entity; staff review those carts here.
- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — storefront checkouts and point purchases create carts of this type; the website's `line_integrity_config` decides whether lines carry an HMAC token.
- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — the only document that consumes a FINAL cart (Search Shopping Cart / Shopping Cart knock-off, v2 applet).
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — the payment lines are shaped as receipt-voucher lines; the cart-to-RV conversion exists in code without a button.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — customer, addresses, credit terms and limits; the embedded customer editor here writes the same records.
- [Cashbook](/applets/master-data/cashbook-applet/) — settlement methods offered by Add Payment.
- [Organisation](/applets/master-data/organisation-applet/) — branch main location, and the Knock Off Configuration row that connects carts to sales orders.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) and [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — tax codes and the `PNS` items offered by the item search.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The Sales Order applet's "Search Shopping Cart" tab shows nothing, or the "Shopping Cart" knock-off panel is missing | The cart is not FINAL, or the company has no enabled `INTERNAL_SHOPPING_CART` → `INTERNAL_SALES_ORDER` `LINE` row in Knock Off Configuration (the panel is shown only when that row is enabled; open-queue rows are written only through it) | FINAL the cart; add / enable the row in Organisation › Company › Knock Off Configuration, then re-FINAL a fresh cart (existing FINAL carts get no queue rows retroactively) |
| No DELETE button on a cart | `SHOW_DOCUMENT_DELETE_BUTTON` is off, or the cart is FINAL | Turn the setting on in Application Settings; FINAL carts cannot be deleted from the UI |
| Final shows *This document has been posted* | The cart is already FINAL; the client refuses a second FINAL | Nothing to do; there is no un-FINAL |
| Final fails with `FISCAL_PERIOD_LOCKED` | `date_txn` falls in a company fiscal period locked with `LOCK_ALL` / `LOCK_TXN` (`validateGenericDocumentOnFinal`) | Change the transaction date on the Main Details tab and SAVE, or unlock the period |
| A price, discount or tax field is missing from Add / Edit Line Item | The matching `HIDE_*` setting is on and the login lacks the `SHOW_*` client-side permission | Turn the setting off, or grant the `SHOW_*` permission to the role |
| Default Branch / Location saved in Default Selection never appear on a new cart | The cart form does not read `DEFAULT_BRANCH` / `DEFAULT_LOCATION`; the Default Selection screen also displays personal values rather than master values | Select Branch and Location on every cart; treat the Default Selection screen as inert |
| Storefront checkout fails with `CLIENT_CART_LINE_INTEGRITY_HASH_MISMATCH` after a staff edit | Line integrity is enabled for the website; back-office edits from this applet use the plain `PUT gen-doc/internal-shopping-carts`, which does not re-stamp lines, so the storefront's `verifyForCheckout` sees a token that no longer matches the price | Have the customer re-add the line from the storefront (new lines are stamped), or disable `line_integrity_config` for that website |
| Storefront checkout fails with `CLIENT_CART_LINE_INTEGRITY_HASH_MISSING` | Line integrity was enabled after the cart's lines were created | Same as above |
| A customer's cart created from the storefront or Customer Access applet fails with `SHOPPING_CART_ALREADY_EXIST` | The ecom endpoint allows one non-deleted cart per customer entity | Delete or FINAL the existing cart here, then retry |
| Nothing prints; no Convert action | The Export and Convert tabs are commented out and the print effect is disabled; the Printables screen targets the Sales Quotation extension code | Print from the Sales Order once the cart is knocked off; treat Printables as inert |
| Keyword search returns unrelated carts | The keyword is matched separately against carts, branch names and customer names and the results are unioned | Use the Customer Name / Branch fields of the advanced search instead |
| Listing is slow with many carts | Each of the first 50 rows triggers three extra reads (branch, agent, customer) | Known cost of the client-side listing; narrow with the advanced search |

The applet repository's only issue is the Angular 14 migration (gh:bigledger/blg-applet-wavelet-internal-shopping-cart-applet#1); the shared task tracker holds repo-hygiene items (sub-query removal, node_modules clean-up) and a meeting note on restricting CP Commerce checkout and payment, none of which describes a user-facing failure.

## Related documentation

- [E-Commerce module](/modules-v2/ecommerce/) — where the cart sits between storefront and sales order.
- [Shopping Cart Customer Access (Internal)](/applets/ecommerce/internal-shopping-cart-customer-access-applet/) — the customer-side applet.
- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — knocking a FINAL cart off into an order.
