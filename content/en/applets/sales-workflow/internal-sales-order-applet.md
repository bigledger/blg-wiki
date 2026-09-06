---
title: "Sales Order (Internal)"
description: "Reference for the Sales Order (Internal) applet: order entry, approval, stock reservation, pick-pack and delivery planning, marketplace sync, and knock-off into invoices."
applet_code: "erp_internal_sales_order_applet_v2"
applet_repo: "blg-applet-wavelet-internal-sales-order-applet-v2"
modules: [inventory, ecommerce, crm-digital, financial-accounting]
related_applets: [internal-sales-quotation-applet, internal-sales-inquiry-applet, internal-sales-invoice-applet, internal-delivery-order-applet, internal-outbound-delivery-order-applet, internal-packing-order-applet, internal-jobsheet-applet, internal-receipt-voucher-applet, internal-purchase-order-applet, stock-availability-applet, stock-reservation-applet, delivery-installation-applet, customer-applet, pricebook-applet, chart-of-account-applet, cashbook-applet, workflow-design-applet]
guides: [/guides/sales-guides/standard-sales-workflow/, /guides/sales-guides/partial-delivery-workflow/, /guides/sales-guides/installation-scheduling-workflow/]
sources:
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/app.routing.ts
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/app.component.ts
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/settings-container/custom-status/
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/settings-container/sales-order-status-container/
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/settings-container/branch-settings/
  - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/internal-sales-order-container/ (create, add-line-item, add-settlement, add-contra, edit-line-item validators; search-documents tabs)
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesOrderDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentSOSpecificService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockAvailabilityService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/entity/EntityCreditAvailabilityService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/GenericDocumentConverterFactory.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code erp_internal_sales_order_applet_v2)
tags:
- sales-order
- order-management
- fulfillment
- delivery-planning
- ecomsync
weight: 20
---

## Overview

The **Sales Order (Internal)** applet records what a customer has agreed to buy before anything is invoiced or shipped. Sales administrators create and finalise orders; the warehouse works them through the Pick Pack Queue and Delivery Items; the order is then knocked off into a Sales Invoice, Delivery Order or Packing Order. It also hosts the marketplace (Ecomsync) order feed, delivery planning and stock reservation.

{{< callout type="info" >}}
Server document type `INTERNAL_SALES_ORDER`. Amount signum **0** and quantity signum **0**: a FINAL sales order posts nothing to the General Ledger and moves no stock. It does count against *available* stock and against the customer's credit, and it can hold reservations.
{{< /callout >}}

{{< figure src="/images/internal-sales-order-applet/internal-sales-order-overview.png" alt="Sales Order (Internal) Applet overview showing the flow from order entry to fulfillment and reporting" caption="Order entry, fulfilment, delivery planning and reporting in one flow." >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/), shopping cart (e-commerce), intercompany [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Searched in the **KO For** tab; lines and customer copied in |
| Upstream | [Customer](/applets/master-data/customer-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | Customer, prices, available quantity |
| Downstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) | Knock-off (`SalesOrderToSalesInvoiceConverter`); the *SO Line with SI KO* menu shows what is still open |
| Downstream | [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/), [Outbound Delivery Order (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/), [Packing Order (Internal)](/applets/manufacturing/internal-packing-order-applet/) | Fulfilment documents; Packing Order lists `INTERNAL_SALES_ORDER` as its source type |
| Downstream | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | Deposits and prepayments against the order (Receipt Voucher tab) |
| Downstream | [Delivery Installation](/applets/delivery-installation/delivery-installation-applet/) | Delivery plans and calendar sessions |
| Sibling | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Intercompany mirror in the buying company; auto-purchase of stock when configured |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/internal-sales-order-applet/`.

| Menu item | Route | What it shows |
|---|---|---|
| **Sales Order** | `internal-sales-order` | Listing with advanced search, bulk FINAL / DRAFT / DISCARD / VOID / PRINT, email |
| **Line Items** | `line-items` | One row per order line |
| **SO Line with SI KO** | `so-line-with-si-ko` | Order lines against invoiced quantity; close a line that will never be invoiced |
| **File Import** | `file-import` | Bulk create orders from a delimited file |
| **SO Detailed Report** | `sales-order-detailed-report` | Grouped order/line report by date range |
| **Pick Pack Queue** | `pick-pack-queue` | FINAL order lines grouped for picking and packing |
| **Delivery Items** | `delivery-items` | Line-level delivery list with batch/bin editing and printing |
| **Approval** | `approval-permission` | Sell-below-price approval requests |
| **Ecomsync** › Dashboard, Scheduler, Reply To Review, Replied Review | `ecomsync-*` | Marketplace order sync and review replies |
| **Batch Printing** | `batch-printing` | Print many orders at once |
| **Delivery Plan**, **Calendar** | `delivery-plan`, `delivery-plan-calendar` | Delivery sessions (code, name, start date, session duration) and their calendar |
| **File Export** | `file-export` | Generate and download exports |
| **Intercompany** | `intercompany` | Intercompany queue |
| **Audit Trail** | `audit-trail` | Field-level change history |
| **Settings** / **Personalization** | `settings/…`, `personalization/…` | Configuration |

{{< figure src="/images/internal-sales-order-applet/so-main-listing.png" alt="Sales Order main listing page with filters, bulk actions, and grid results" caption="Listing: search, bulk actions, print and email." >}}

### The create / edit form

Tabs, in the default order (re-orderable under Default Selection): **Search Document**, **Main Details**, **Account**, **Lines**, **ARAP**, **Delivery Details**, **Delivery Trips**, **Delivery Plans**, **Settlement**, **KO For**, **Receipt Voucher**, **Department Hdr**, **TraceDocument**, **Contra**, **Doc Link**, **Attachments**, **Export**, **Ecomsync**, **Status**, **Events**, **Gross Profit**. Search Document and KO For are shown for TEMP/DRAFT documents only.

| Tab | What it is for |
|---|---|
| Search Document | Find a source document to base the order on |
| Main Details | Branch, location, transaction date, currency, sales agent, credit terms/limit, reference, remarks, workflow status, sales-order status, custom statuses; the DRAFT / FINAL / VOID buttons |
| Account | Entity details, Bill To, Ship To, Intercompany sub-tabs |
| Lines | Order lines with pricing, tax, discount, serial/batch/bin, reservation and delivery fields |
| ARAP, Contra, Settlement, Receipt Voucher | Open amount, offsets, deposit lines and receipt vouchers linked to the order |
| Delivery Details, Delivery Trips, Delivery Plans | Delivery branch/location, requested dates, PIC, trips and planned sessions |
| KO For | Knock off Sales Quotation, Jobsheet, Shopping Cart, Sales Order or intercompany Purchase Order lines |
| Department Hdr, TraceDocument, Doc Link, Attachments, Export | Header analysis codes, posting trace, linked documents, files, export |
| Ecomsync | Marketplace status, sync details and marketplace printables |
| Status, Events | Custom status values; system event history |
| Gross Profit | Margin per order (permission-gated) |

Inside a line: **Item Details**, **Grouped Item**, **Serial Number** (with import), **Batches**, **Bin**, **Stock Availability** (including availability by job and temporary reservation), **Reserved Stock**, **MRP** (job-order link), **Costing Details**, **Issue Link**, **Sales History**, **Membership Points**, **Attachment**, **Ecom Sync**.

{{< figure src="/images/internal-sales-order-applet/so-create-form.png" alt="Create form in Sales Order Applet" caption="Create form." >}}

{{< figure src="/images/internal-sales-order-applet/so-branch.png" alt="branch dropdown, location and transaction date" caption="Main Details: branch, delivery location and transaction date." >}}

{{< figure src="/images/internal-sales-order-applet/so-entity.png" alt="Entity details field" caption="Account: entity details come from the Customer applet." >}}

{{< figure src="/images/internal-sales-order-applet/so-sales-agent.png" alt="Sales Agent in the create/edit Sales Order form" caption="Sales Agent: picked from the dropdown or auto-filled from the entity." >}}

{{< figure src="/images/internal-sales-order-applet/so-bill-to.png" alt="Bill to and Ship to tab" caption="Bill To and Ship To sub-tabs." >}}

{{< figure src="/images/internal-sales-order-applet/so-select-billing.png" alt="Select Billing button" caption="Select a billing address from the customer's address book." >}}

{{< figure src="/images/internal-sales-order-applet/so-line.png" alt="line items tab" caption="Lines tab." >}}

{{< figure src="/images/internal-sales-order-applet/so-line-search.png" alt="SO line search" caption="Item search — includes parent/alias item family search." >}}

{{< figure src="/images/internal-sales-order-applet/so-quantity.png" alt="line items tab" caption="Quantity, price and discounts on a line." >}}

{{< figure src="/images/internal-sales-order-applet/so-batch.png" alt="batch tab" caption="Batch number, quantity, issue and expiry date." >}}

{{< figure src="/images/internal-sales-order-applet/so-delivery.png" alt="delivery branch and location field" caption="Delivery branch and location." >}}

{{< figure src="/images/internal-sales-order-applet/so-create-4.png" alt="Input for billing address" caption="Ship To: delivery details." >}}

{{< figure src="/images/internal-sales-order-applet/so-settlement.png" alt="Settlement tab" caption="Settlement: add a deposit line and choose its type." >}}

{{< figure src="/images/internal-sales-order-applet/so-cash.png" alt="cash type settlement type" caption="Settlement type: Cash." >}}

{{< figure src="/images/internal-sales-order-applet/so-create-5.png" alt="Save button to save the sales order" caption="Save keeps the order in DRAFT." >}}

{{< figure src="/images/internal-sales-order-applet/so-create-6.png" alt="Final button" caption="Final locks the order and releases it to fulfilment." >}}

{{< figure src="/images/internal-sales-order-applet/so-line-manage.png" alt="Line item management" caption="Line Items menu." >}}

{{< figure src="/images/internal-sales-order-applet/so-line-edit.png" alt="Line item edit" caption="Editing a line." >}}

### Fulfilment screens

{{< figure src="/images/internal-sales-order-applet/pick-pack.png" alt="Search filter in Pick Pack Queue" caption="Pick Pack Queue: search filter." >}}

{{< figure src="/images/internal-sales-order-applet/so-pick-pack.png" alt="Pick Pack Queue listing with grouped sales orders and line items" caption="Pick Pack Queue: grouped lines for picking and packing." >}}

{{< figure src="/images/internal-sales-order-applet/so-delivery-plan.png" alt="Delivery plan to create and view scheduled delivery sessions" caption="Delivery Plan: sessions with code, name, start date and duration." >}}

{{< figure src="/images/internal-sales-order-applet/so-calendar.png" alt="Delivery plan calendar view showing scheduled delivery sessions" caption="Calendar view of delivery sessions." >}}

{{< figure src="/images/internal-sales-order-applet/so-shopee-ecomsync.png" alt="Ecomsync dashboard showing marketplace sync status and order updates" caption="Ecomsync dashboard (marketplace A)." >}}

{{< figure src="/images/internal-sales-order-applet/so-lazada-ecomsync.png" alt="Ecomsync dashboard showing marketplace sync status and order updates" caption="Ecomsync dashboard (marketplace B)." >}}

{{< figure src="/images/internal-sales-order-applet/so-detailed-report.png" alt="Sales Order Detailed Report with date range filtering and grouped results" caption="SO Detailed Report." >}}

{{< figure src="/images/internal-sales-order-applet/so-file-import.png" alt="File Import page with CSV upload and delimiter selection" caption="File Import." >}}

{{< figure src="/images/internal-sales-order-applet/so-file-export.png" alt="File Export listing showing report generation status and download actions" caption="File Export." >}}

### Settings menu

| Settings entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | Shared Field Configuration screen (240 toggles apply to this applet) |
| Default Selection | `settings/default-selection` | Branch, location, pricing scheme, pricebook, currency, decimal precision, tab order |
| Printable Format Settings, Printables | `settings/printable-format-settings`, `settings/printables` | Register formats; tick one as default |
| Branch Settings | `settings/settlement-settings` | Per-branch header/footer, level, priority (the route name is historical) |
| Workflow Settings | `settings/workflow-settings` | Company ↔ workflow process for `INTERNAL_SALES_ORDER` |
| Custom Status | `settings/custom-status` | Up to five header and five line custom statuses (name, values, default) plus five client-document statuses |
| Email Template | `settings/email-template` | Template used when emailing |
| Sales Order Status | `settings/sales-order-status` | Your own order-status list (code, name, sort order) shown on Main Details |
| Custom Resource Bundle Configuration, Custom Field Placement | `settings/translation-settings`, `settings/custom-field-placement` | Relabel; place tenant custom fields |
| Webhook, Feature Visibility | `settings/webhook`, `settings/feature-visibility` | Event subscriptions; team access |
| Permission listings, Role Pricing Scheme Link, Permission Wizard, Client-Side Permission | `settings/*-listing` | Access control |
| Audit Trail, Release Notes, Applet Log | `settings/audit-trail`, … | History |

{{< figure src="/images/internal-sales-order-applet/so-setting-page.png" alt="Settings page for Sales Order (Internal) Applet showing configuration modules" caption="Settings landing page." >}}

{{< figure src="/images/internal-sales-order-applet/so-def-branch.png" alt="Settings for default branch and location" caption="Default Selection." >}}

{{< figure src="/images/internal-sales-order-applet/so-set-vis.png" alt="Applet sub menu setting" caption="Application Settings: menu visibility toggles." >}}

{{< figure src="/images/internal-sales-order-applet/so-print.png" alt="Printable format setting" caption="Printable Format Settings: tick the default." >}}

{{< figure src="/images/internal-sales-order-applet/so-add-print.png" alt="Add printable format setting" caption="Add a printable format." >}}

{{< figure src="/images/internal-sales-order-applet/so-set-branch.png" alt="Add or edit branch" caption="Branch Settings." >}}

{{< figure src="/images/internal-sales-order-applet/so-email-temp.png" alt="Add email template to be used in the applet" caption="Email Template." >}}

{{< figure src="/images/internal-sales-order-applet/so-status.png" alt="Add or edit Sales Order Status" caption="Sales Order Status list." >}}

{{< figure src="/images/internal-sales-order-applet/so-perm.png" alt="Add or edit user permission" caption="User permissions." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Header requires them; Default Selection pre-fills |
| Customers with credit terms and, optionally, `CREDIT_LIMITS`; not blacklisted | [Customer](/applets/master-data/customer-applet/) | Blacklisted customers are rejected at FINAL; available credit = limit − AR balance − open amounts |
| Items, and stock at the location if you want availability shown | [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | Sales orders reduce *available* stock (order quantity is subtracted alongside invoices) |
| Pricing scheme and pricebook | [Pricebook](/applets/master-data/pricebook-applet/) | Default Selection points at both |
| Settlement methods with cashbook and GL (only if deposits are taken on the Settlement tab) | [Cashbook](/applets/master-data/cashbook-applet/) | Deposit lines post through the receipt-voucher path |
| API permissions `TNT_API_DOC_INTERNAL_SALES_ORDER_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` | Settings → permission listings | Branch targets scope the listing |
| Workflow process (optional) | [Workflow Design](/applets/master-data/workflow-design-applet/) | For Workflow Status and *Final Button Status* |
| Branch intercompany setting in AUTO mode with an auto-stock-purchase entity (optional) | Branch intercompany configuration | Lets a FINAL sales order queue an automatic intercompany purchase of stock |
| Marketplace connection (optional) | E-commerce / Ecomsync setup | Needed for the Ecomsync dashboard and scheduler |

### Applet settings

**Default Selection** (`settings/default-selection`)

| Setting | Key | What it controls | Default |
|---|---|---|---|
| Default Branch / Default Location | `DEFAULT_BRANCH`, `DEFAULT_LOCATION` (+ `DEFAULT_COMPANY`) | Pre-filled header | none |
| Default Pricing Scheme | `PRICING_RETAIL_GUID` | Scheme used when adding items | none |
| Default Pricebook | `DEFAULT_PRICEBOOK` | Pricebook for unit prices | none |
| Default Currency | `DEFAULT_CURRENCY` | Document currency on new orders | company base |
| Unit Price Decimal Precision | `DEFAULT_DECIMAL_PRECISION` / `DEFAULT_DECIMAL_STEP` | 2–4 decimals | 2 |
| Details tab ordering | `DETAILS_TAB_ORDER` | Order of the 21 form tabs | as listed above |

**Application Settings** (`settings/field-settings`) — behaviour toggles this applet reads (off unless stated):

| Section | Setting | Effect when on |
|---|---|---|
| Top of screen | `SHOW_ITEM_DETAIL_AFTER_SCAN` | Opens the line dialog after a barcode scan |
| Top of screen | `AUTO_UI` | Simplified auto-flow form (sub-keys `AUTO_UI_ENTITY`, `_BILLING`, `_SHIPPING`, `_SALES_AGENT`, `_CREDIT_TERM`, `_CREDIT_LIMIT`, `_LINE_ITEM` exist in the model without UI) |
| Gen Doc Listing | `DISABLE_GEN_DOC_LISTING`, `SORT_ORDER`, `DEFAULT_POSTING_STATUS` | Listing loads on search only; sort; default status filter |
| Gen Doc Listing | `ENABLE_CREDIT_LIMIT_FILTER` | Shows the customer's available credit |
| Gen Doc Listing | `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` | Serial and batch quantities must match line quantity at FINAL (backend `validateSNForSignumZero` for signum-0 sales documents) |
| Gen Doc Listing | `SHOW_DRAFT_BUTTON` | Lets a FINAL order be returned to DRAFT (user also needs the `SHOW_DRAFT_BUTTON` client-side permission) |
| Create & Print | `ENABLE_AUTO_POPUP` | Opens the printable after save |
| Doc Settings | `ENABLE_SALES_AGENT_AUTOFILL`, `ALLOW_EDIT_SALES_AGENT_FINAL`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `DISABLE_LINES_FOLLOWING_HDR_BUDGET`, `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE`, `SIMPLIFIED_UI` | As in the Sales Invoice applet |
| Workflow Selection | `FINAL_STATUS_GUID` | Workflow status set by the Final button |
| Entity Details | `ENABLE_BRANCH_FILTER`, `ENABLE_CUSTOMER_FILTER_FROM_ACCOUNT_TAB` | Customer search scoped by branch / by the Account tab |
| Intercompany | `INTERCOMPANY_ENABLE_AUTO_PURCHASE_STOCK` | Enables the automatic intercompany stock purchase queued at FINAL (branch must be in AUTO mode) |
| Lines | `DISABLE_LINE_ITEM_NAME_EDIT`, `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT`, `HIGHLIGHT_STOCK_COST_ROWS`, `SHOW_BUDGET` | Line editing rules |
| Lines | `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` | Serial numbers on a DRAFT order are locked so another document cannot take them |
| Lines | `SHOW_REMARKS_WITH_DROPDOWN` | Line remarks become a configured dropdown |
| Lines | `SORT_LINE_ITEM_POSITION_ID_DESCENDING_ORDER` | Newest line first |
| Lines | `MRP_MANDATORY_FOR_NON_FINISHED_GOODS` | Non-finished-goods lines must be linked to a job order (MRP tab) |
| Line Permission | `DISALLOW_SELL_BELOW_MIN_PRICE` / `…_REPLACEMENT_PRICE` / `…_MA_COST`, `DISALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX` | Price floors/ceilings; bypass with `ALLOW_SELL_BELOW_*` or a line approval |
| Line Permission | `WARN_ZERO_UNIT_PRICE_BEFORE_ADD`, `DISABLE_EDITING_AMOUNT_TXN` | Zero-price prompt; locked transaction amount |
| KO For | `ENABLE_MULTIPLE_KO` | Several source documents into one order |
| Hide Buttons | `DISABLE_LINE_ITEM_QUEUE_LISTING` | Pick Pack Queue does not auto-load |
| Delivery | `DEFAULT_PACKING_LOCATION_GUID` | Location proposed when packing from the queue |
| Contra / Settlement | `EDIT_CONTRA_TXN_DATE`, `ENABLE_EDIT_SETTLEMENT_DATE` | Editable dates |
| Bank Transfer | `MANDATORY_TRANSACTION_NO` | Transaction number required on bank-transfer deposits |
| Menus | `HIDE_AUDIT_TRAIL_MENU`, `HIDE_SO_DETAILED_REPORT_MENU`, `HIDE_SO_LINE_WITH_SI_KO_MENU`, `HIDE_LINE_ITEMS_MENU`, `HIDE_PICK_PACK_QUEUE_MENU`, `HIDE_DELIVERY_ITEMS_MENU`, `HIDE_ECOMSYNC_MENU`, `HIDE_BATCH_PRINTING_MENU`, `HIDE_DELIVERY_PLAN_MENU`, `HIDE_CALENDER_MENU`, `HIDE_FILE_IMPORT_MENU`, `HIDE_INTERCOMPANY_MENU`, `HIDE_FILE_EXPORT_MENU`, `HIDE_APPROVAL_MENU` | Remove a sidebar item for everyone except holders of the matching `SHOW_*_MENU` client-side permission |

*Hide / show, mandatory and expand toggles* (cosmetic; `HIDE_…` unless stated):

| Section | Toggles |
|---|---|
| Gen Doc Listing | `SERIAL_NUMBER`, `GENDOC_FINAL_BUTTON`, `GENDOC_DISCARD_BUTTON`, `GENDOC_VOID_BUTTON`, `GENDOC_SAVE_BUTTON`, `CLOSE_BUTTON`, `CLONE_BUTTON`, `SEND_EMAIL_BUTTON`, `TRANSACTION_DATE` |
| Gen Doc Fields | `SERVER_DOC_1/2/3`, `REFERENCE_MAIN_LISTING`, `REMARKS_MAIN_LISTING`, `CLIENT_DOC_TYPE`, `CLIENT_DOC_1…5`, `DESCRIPTION`, `ARAP_PNS`, `ARAP_SETTLEMENT`, `ARAP_DOC_OPEN`, `ARAP_CONTRA`, `ARAP_BAL`, `DOCUMENT_LINKS`, `TRACKING_ID_GEN_DOC`, `TRACKING_ID_LISTING`, `STATUS_GEN_DOC` |
| Vertical UI | `VERTICAL_ORIENTATION`, `EXPAND_*` per tab |
| Doc Settings | `TRACKING_ID`, `PERMIT_NO`, `DOC_SHORT_CODE`, `CREATED_BY_DETAILS`, `SOURCE_DOC_NO`, `LOCATION`, `DELIVERY_BRANCH`, `DELIVERY_LOCATION`, `MAIN_DETAILS_SALES_AGENT`, `CRM_CONTACT`, `BASE_CURRENCY`, `CURRENCY_RATE`, `CREDIT_TERMS`, `CREDIT_LIMIT`, `DUE_DATE`, `REMARKS`, `EXTERNAL_REMARKS`, `INTERNAL_REMARKS`, `REFERENCE`, `SALES_LEAD`, `WORKFLOW_STATUS`, `WORKFLOW_RESOLUTION`, `MEMBERCARD`, `SALES_ORDER_STATUS`, `CLIENT_KEY`, `CLIENT_VALUE`, `MARKETPLACE_SHIPPING_FEE`, `COURIER_SERVICE_PROVIDER_LINK` |
| Account | `INTERCOMPANY_TAB`, `BILL_TO_TAB`, `SHIP_TO_TAB`, `ACCOUNT_BILLING_CONTACT`, `ACCOUNT_SHIPPING_CONTACT`, and per-field `ENTITY_BRANCH`, `ENTITY_DETAILS_CURRENCY`, `…_STATUS`, `…_IDENTITY_TYPE`, `…_DESCRIPTION`, `…_TYPE`, `…_ID_NUMBER`, `…_EMAIL`, `…_PHONE_NUMBER` |
| Lines | `LINE_ITEM_CLIENT_DOC_1`, `SALES_AGENT`, all `UNIT_PRICE_*` and `UNIT_DISCOUNT*` columns, `QTY_BASE`, `QTY_UOM`, `UOM_TO_BASE_RATIO`, `AMOUNT_STD_EXCL_TAX`, `DISCOUNT_AMOUNT_EXCL_TAX`, `AMOUNT_NET_EXCL_TAX`, `AMOUNT_TXN`, `TAX_CONFIG_SELECTION`, `WHT_CONFIG_SELECTION`, `LAST_PURCHASE_PRICE`, `LAST_SALES_PRICE`, `GROUP_DISCOUNT_PERCENTAGE`, `TOTAL_DISCOUNT_AMOUNT`, `LINE_ITEMS_GL_CODE`, `LINE_LISTING_TAX_AMOUNT`, `REBATE_FROM`, `REBATE_TO` |
| Department | `SEGMENT`, `DIMENSION`, `PROFIT_CENTER`, `PROJECT` |
| Line item tabs | `RESERVED_STOCK`, `BIN_NUMBER`, `BATCH_NUMBER`, `BATCH_ISSUE_DATE`, `BATCH_EXPIRY_DATE`, `COSTING_DETAILS`, `ISSUE_LINK`, `SALES_HISTORY`, `STOCK_AVAILABILITY`, `MEMBERSHIP_POINTS`, `ATTACHMENT`, `ECOM_SYNC`, `MULTI_DISCOUNT`, `DELIVERY_INSTRUCTION`, `DEPARTMENT`, `DELIVERY_DETAILS`, `DELIVERY_TRIPS`, `ATTACHMENT_TAB` |
| KO For / Search | `KO_FOR_TAB`, `KO_SALES_QUOTATION_TAB`, `KO_JOB_SHEET_TAB`, `KO_SHOPPING_CART_TAB`, `SEARCH_BY_DOCUMENT_BUTTON`, `SEARCH_BY_SALES_ORDER_TAB`, `SEARCH_BY_JOB_SHEET_TAB`, `SEARCH_BY_SHOPPING_CART_TAB`, `SEARCH_BY_SALES_QUOTATION_TAB` |
| Header tabs | `DELIVERY_DETAILS_TAB`, `DEPARTMENT_HDR_TAB`, `MAIN_ARAP_TAB`, `DELIVERY_PLANS_TAB`, `RECEIPT_VOUCHER_TAB`, `ECOMSYNC_TAB`, `TRACE_DOCUMENT_TAB`, `DOC_LINK_TAB`, `DOC_LINK_FROM`, `DOC_LINK_TO`, `EXPORT_TAB`, `EVENTS_TAB`, `MAIN_CONTRA_TAB`, `SETTLEMENT_TAB`, `DELIVERY_TRIPS_TAB`, `GROSS_PROFIT_TAB`, `STATUS_TAB`, `DELETE_CONTRA` |
| Credit Card | `CARD_NO`, `NAME`, `CARD_ISSUER`, `CARD_EXPIRY`, `APPROVAL_CODE`, `BATCH`, `CARD_TYPE`, `CVV`, each with a `MANDATORY_*` partner; `TRANSACTION_NO` |

Keys in the model with no UI on this screen (configured elsewhere or unused): the `AUTO_UI_*` sub-keys, `ENABLE_CUSTOM_STATUS_*` / `NAME_CUSTOM_STATUS_*` / `LIST_CUSTOM_STATUS_*` (set under Settings → Custom Status), `ENABLE_MRP_JOB_ORDER_LINK`, `HIDE_MRP_JOB_ORDER_LINK_CREATE_BUTTON`, `DISABLE_PICK_PACK_QUEUE_LISTING`, `ENABLE_TXN_DATE_DEFAULT_FILTER`, `GL_CODE_CHECK_FILTER`, `HIDE_UNWRAPPED_ITEMS`, `HIDE_MARKETPLACE_STATUS_UPDATE_PAGE`, `HIDE_PAYMENT_CONFIG`, `HIDE_ENTITY_CATEGORY`, `INCLUDE_*` / `ENABLE_*` / `MANDATORY_*` department and tax flags, `WORKFLOW_PROCESS_GUID`, `PRINTABLE`.

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Status flow | DRAFT → FINAL → VOID, plus DRAFT ← FINAL when `SHOW_DRAFT_BUTTON` is on and the user holds the permission. Discard deletes a draft. **Close** is a per-line action (close an order line that will not be invoiced, from the line editor or *SO Line with SI KO*), not a document status. |
| Custom statuses | Settings → Custom Status: enable up to five header and five line custom statuses, name them and list their values with a default; five client-document statuses likewise. Values are edited on the order's Status tab. |
| Sales Order Status | Settings → Sales Order Status: a free list (code, name, sort order) shown as a dropdown on Main Details, independent of posting status. |
| Workflow | Settings → Workflow Settings for `INTERNAL_SALES_ORDER`; `FINAL_STATUS_GUID` picks the status applied at Final. |
| Reservation | Lines can reserve stock (Reserved Stock tab, temporary reservation by job); reserved rows are highlighted and show who reserved them. |
| Printables | Settings → Printable Format Settings / Printables; batch printing from the Batch Printing menu; a client-side permission gates printing drafts (`ALLOW_PRINT_DRAFT_GEN_DOC`). |
| Marketplace | Ecomsync dashboard and scheduler pull marketplace orders; FINAL orders that belong to a subscribed e-commerce feed are queued to the commerce SO processor. |
| Intercompany | Intercompany menu; mapping `INTERNAL_SALES_ORDER` ↔ `INTERNAL_PURCHASE_ORDER`; in AUTO mode with an auto-stock-purchase entity, FINAL queues an automatic intercompany stock purchase. |
| Webhooks | Settings → Webhook. |

### Feature visibility / permissions

API: `TNT_API_DOC_INTERNAL_SALES_ORDER_{CREATE,READ,UPDATE,DELETE}_TGT_GUID`.

Client-side permissions registered for this applet (25):

| Group | Codes |
|---|---|
| Buttons | `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_DRAFT_BUTTON` (return a FINAL order to draft), `SHOW_DELETE_CONTRA`, `ALLOW_PRINT_DRAFT_GEN_DOC` |
| Pricing | `ALLOW_SELL_BELOW_MIN_PRICE`, `ALLOW_SELL_BELOW_REPLACEMENT_PRICE`, `ALLOW_SELL_BELOW_MA_COST`, `SHOW_COSTING_DETAILS`, `SHOW_GROSS_PROFIT`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` |
| Document numbers | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1…5`, `SHOW_TRANSACTION_DATE` |
| Screens | `SHOW_INTERCOMPANY_SO_SCREEN` (Intercompany tab on the order) |

The app also reads `SHOW_SO_DETAILED_REPORT_MENU`, `SHOW_PICK_PACK_QUEUE_MENU`, `SHOW_DELIVERY_ITEMS_MENU`, `SHOW_ECOMSYNC_MENU`, `SHOW_BATCH_PRINTING_MENU`, `SHOW_DELIVERY_PLAN_MENU`, `SHOW_CALENDER_MENU`, `SHOW_FILE_EXPORT_MENU` and `ALLOW_APPROVE_SELL_BELOW_PRICE`; these are not in the registry for this applet (see Troubleshooting).

## Fields

**Main Details**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Location | Selling branch and stock location | Yes | Defaults from Default Selection |
| Transaction Date | Order date | Yes | Locked-period check applies at FINAL |
| Currency, Currency Rate | Document currency | Currency yes | `DEFAULT_CURRENCY`; rate lockable |
| Sales Agent | Employee credited | No | Autofill from customer |
| Credit Terms, Credit Limit, Due Date | From the customer | No | Available credit shown with `ENABLE_CREDIT_LIMIT_FILTER` |
| Sales Order Status | Your configured status list | No | Settings → Sales Order Status |
| Workflow Status / Resolution | From the workflow process | No | |
| Custom Status 1–5 (header) | Configured under Custom Status | Per configuration | |
| Reference, Remarks, External Remarks, Internal Remarks, Tracking ID, Permit No, Client Key/Value, Marketplace Shipping Fee, Courier Service Provider | Optional header attributes | No | Marketplace fields are filled by Ecomsync |

**Account**: Entity ID (required); billing and shipping contacts and addresses; Intercompany sub-tab (permission-gated).

**Lines**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item | Product or service; parent/alias family search supported | Yes | Bundle and grouped items expand into child lines |
| Quantity, UOM | Ordered quantity | Yes, ≥ 0 | Quantity signum 0 — no stock movement, but availability is reduced |
| Unit price, discount, net and transaction amounts, tax code | Pricing | Derived | Floors/ceilings per Line Permission settings |
| Serial Number, Batches (batch no, qty, issue/expiry date), Bin (bin code, container UOM/measure/qty, qty) | Allocations | Match line quantity when `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` is on | Serials can be imported from a delimited file; DRAFT serials can be locked |
| Reserved Stock / Stock Availability | Reservation and availability by location and by job | No | Reserved rows highlighted with the reserving entity |
| MRP | Link to a job order | Per `MRP_MANDATORY_FOR_NON_FINISHED_GOODS` | |
| Remarks | Free text or configured dropdown | No | `SHOW_REMARKS_WITH_DROPDOWN` |
| Custom Status 1–5 (line) | Configured under Custom Status | Per configuration | |
| Segment, Dimension, Profit Center, Project | Department analysis | No | |

**Settlement (deposits)**: date and amount always required; card fields per `MANDATORY_*`; cheque number for cheques; transaction number for bank transfer when `MANDATORY_TRANSACTION_NO`.

**Contra**: contra amount required.

**Delivery Plan**: code, name, start date and session duration required.

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **TEMP** | Created by an integration (marketplace, cart) before a user touches it; gets its tenant running number when it becomes ACTIVE | DRAFT |
| **DRAFT** | Editable; counts against available stock only if reservations are used | FINAL, Discard |
| **FINAL** | Numbered, locked, visible in Pick Pack Queue and Delivery Items; knock-off source for invoices and delivery documents | VOID; DRAFT (with `SHOW_DRAFT_BUTTON`) |
| **VOID** | Cancelled with a reason | none |

**FINAL validation** (backend): exchange rate when currencies differ; customer not blacklisted (sales orders are in the blacklist-checked set); serial/batch/bin quantities when `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL`; stock balance for signum-0 sales documents only when the stock-balance-for-signum-zero flag is passed; date and company present; fiscal period not locked.

**What FINAL does**: generates running numbers; queues the primary processor (no journal, inventory or AR postings result because both signums are 0 — only document-link and downstream processors run); queues the commerce SO processor for orders on a subscribed marketplace feed; in AUTO intercompany mode queues the automatic stock purchase; message-template (email) processor.

**Journal**: none. **Stock**: no inventory transaction; the order quantity is subtracted from *available* quantity (`StockAvailabilityService` treats `INTERNAL_SALES_ORDER` with signum −1 alongside `INTERNAL_SALES_INVOICE`) and, where used, reservations hold specific quantities, serials or bins.

**Knock-off**: an invoice created from the order carries `server_doc_type_doc_1_hdr = INTERNAL_SALES_ORDER` links per line; the *SO Line with SI KO* menu compares ordered against invoiced quantity and lets you close the remainder.

**VOID** sets the status and reason and queues the void processor (releases document links and reservations).

## Related applets

- [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) — knock-off sources.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the usual next document; converter `SalesOrderToSalesInvoiceConverter`.
- [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/), [Outbound Delivery Order (Internal)](/applets/sales-workflow/internal-outbound-delivery-order-applet/), [Packing Order (Internal)](/applets/manufacturing/internal-packing-order-applet/) — fulfilment.
- [Delivery Installation](/applets/delivery-installation/delivery-installation-applet/) — delivery sessions planned here.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — deposits against the order.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — intercompany mirror and auto stock purchase.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Reservation](/applets/inventory-workflow/stock-reservation-applet/) — what an open order does to available stock.
- [Customer](/applets/master-data/customer-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Workflow Design](/applets/master-data/workflow-design-applet/) — master data and workflow.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Final rejected: serial/batch quantity does not match | `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` on and allocations short; the grid marks the line red | Complete the Serial Number / Batches tab; the message now names the item |
| Customer cannot be finalised (blacklist) | Entity flagged blacklisted | Clear in [Customer](/applets/master-data/customer-applet/) |
| Batch picker shows a stale batch or does not return | Older build bug on create/edit line | Fixed; upgrade |
| Line positions reassigned to the wrong rows after deleting a line | Older build bug | Fixed; upgrade |
| Grid resets after Save / Final | Older build bug | Fixed |
| Bundle item saved with wrong child JSON | Older build bug | Fixed |
| Knock-off created without a document-link header | Older build bug | Fixed; re-create the knock-off |
| Zero-price line saved silently | `WARN_ZERO_UNIT_PRICE_BEFORE_ADD` off | Turn it on |
| Line blocked for selling below cost / min price | `DISALLOW_SELL_BELOW_*` on | Grant `ALLOW_SELL_BELOW_*`, or use the line approval (`ALLOW_APPROVE_SELL_BELOW_PRICE` is not registered for this applet — request it) |
| A menu (Pick Pack Queue, Ecomsync, Delivery Plan, Calendar, File Export, SO Detailed Report…) missing for one user | `HIDE_*_MENU` on and the corresponding `SHOW_*_MENU` codes are not in the registry for this applet | Turn the hide off, or ask BigLedger to register the `SHOW_*_MENU` codes for `erp_internal_sales_order_applet_v2` |
| Print greyed out on a draft | Missing `ALLOW_PRINT_DRAFT_GEN_DOC` | Grant it |
| Custom fields did not save | Older build had a stray "retry saving custom fields" button | Fixed; use Custom Field Placement |
| Marketplace order stuck in TEMP | Integration created it; a user must open and save it | Open the order; the tenant running number is assigned when it becomes ACTIVE |
| Available stock lower than stock balance | Open FINAL sales orders reduce availability | Expected; close or void lines that will not ship |

## Related documentation

- [Standard Sales Workflow](/guides/sales-guides/standard-sales-workflow/), [Partial Delivery Workflow](/guides/sales-guides/partial-delivery-workflow/), [Installation Scheduling Workflow](/guides/sales-guides/installation-scheduling-workflow/)
- [Inventory module](/modules-v2/inventory/), [E-Commerce module](/modules-v2/ecommerce/), [Financial Accounting module](/modules-v2/financial-accounting/)
- [Sales Workflow applets](/applets/sales-workflow/)
