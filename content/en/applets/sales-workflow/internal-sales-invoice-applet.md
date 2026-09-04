---
title: "Sales Invoice (Internal)"
description: "Reference for the Sales Invoice (Internal) applet: screens, configuration, fields, posting behaviour and troubleshooting for the document that bills a customer and moves stock out."
applet_code: "salesInvoiceApplet"
applet_repo: "blg-applet-wavelet-internal-sales-invoice-applet"
modules: [financial-accounting, inventory, e-invoice, crm-digital]
related_applets: [internal-sales-order-applet, internal-sales-quotation-applet, internal-jobsheet-applet, internal-delivery-order-applet, internal-sales-return-applet, internal-sales-credit-note-applet, internal-sales-debit-note-applet, internal-sales-invoice-no-stock-out-applet, internal-receipt-voucher-applet, internal-purchase-invoice-applet, pos-general-applet, recurring-sales-invoice-applet, sales-contract-applet, sales-commission-applet, my-e-invoice-portal-applet, customer-applet, tax-configuration-applet, chart-of-account-applet, cashbook-applet, pricebook-applet, stock-balance-applet, membership-admin-applet, workflow-design-applet]
guides: [/guides/sales-guides/standard-sales-workflow/, /guides/sales-guides/credit-sales-workflow/, /guides/sales-guides/partial-delivery-workflow/, /guides/sales-guides/returns-exchanges-workflow/]
sources:
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/app.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/constants/einvoice.constants.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/constants/settlement-type.constants.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/item-txn-client-side-permissions.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/custom-field-screens.config.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/settings-container/workflow-settings-container/company-workflow-create/company-workflow-create.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/account/account-entity-details/account-entity-details.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/batch-number/batch-number.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/line-approval/line-approval.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/payment/add-payment/add-payment.component.ts
  - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/search-documents/search-documents.component.html
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
  - blg-shared-utilities/modules/settings/feature-visibility/feature-visibility.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesInvoiceDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/entity/EntityCreditAvailabilityService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code salesInvoiceApplet)
tags:
- sales-management
- invoice-processing
- financial-posting
- stock-control
- intercompany-transactions
weight: 30
date: 2026-02-06
draft: false
aliases:
- /applets/internal-sales-invoice-applet/
---

## Overview

The **Sales Invoice (Internal)** applet creates the document that bills a customer and, on finalisation, deducts stock, posts the sale to the General Ledger and opens a receivable against the customer. It is opened by sales administrators and accounts staff. Upstream it is usually created by knocking off a Sales Order, Delivery Order, Jobsheet or Sales Quotation; downstream it feeds the Pick & Pack queue, receipts and contra settlement, sales returns and credit notes, e-Invoice submission, sales commission and membership points.

{{< callout type="info" >}}
Server document type `INTERNAL_SALES_INVOICE`. Amount signum **+1**, quantity signum **−1** (every line takes stock *out*). If you bill without moving stock, use [Sales Invoice (No Stock Out)](/applets/sales-workflow/internal-sales-invoice-no-stock-out-applet/) instead.
{{< /callout >}}

{{< figure src="/images/internal-sales-invoice-applet/infographic.png" alt="Process Flow Infographic" caption="Sales invoice lifecycle at a glance." >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/), Stock Transfer | Knocked off in the **KO For** tab; lines and customer are copied in |
| Upstream | [Customer](/applets/master-data/customer-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/) | Master data the invoice reads |
| Downstream | [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) | Reverse or adjust a FINAL invoice |
| Downstream | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), Contra tab | Settle the receivable |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | LHDN e-Invoice submission of FINAL invoices |
| Downstream | [Sales Commission](/applets/sales-workflow/sales-commission-applet/), [Sales Contract](/applets/sales-workflow/sales-contract-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) | Commission, contract and reward-point processors run off FINAL invoices |
| Sibling | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The mirror document created in the receiving company for intercompany sales |
| Sibling | [POS General](/applets/sales-workflow/pos-general-applet/) | Cash bills (`INTERNAL_SALES_CASHBILL`) share the same posting engine and return path |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/internal-sales-invoice-applet/`.

| Menu item | Route | What it shows |
|---|---|---|
| **Sales Invoice** | `sales-invoice` | Listing with advanced search, create and edit |
| **Line Items** | `line-items` | One row per invoice line, for line-level reporting |
| **Pick Pack Queue** | `pick-pack-queue` | Warehouse view of FINAL invoices awaiting picking, packing and delivery jobs |
| **Sales Invoice Template** | `sales-invoice-template` | Reusable invoice skeletons (`TMPL_INTERNAL_SALES_INVOICE`) |
| **Approval** | `approval-permission` | Sell-below-price approval requests raised from line items |
| **File Import** | `file-import` | Bulk create invoices from CSV |
| **Intercompany** | `intercompany` | Manual intercompany queue (invoice → purchase invoice in another company) |
| **File Export** | `file-export` | Map source fields to target headers and export |
| **Swap Serial Number** | `swap-serial` | Replace the serial number on a FINAL invoice without voiding |
| **Settings** | `settings/…` | Administrator configuration (see below) |
| **Personalization** | `personalization/…` | Per-user Default Selection and sidebar |

{{< figure src="/images/internal-sales-invoice-applet/main-listing-page.png" alt="Sales Invoice (Internal) Main Listing" caption="The listing is the entry point to create, edit, print and void." >}}

{{< figure src="/images/internal-sales-invoice-applet/search-filter.png" alt="Advanced Search Drawer" caption="Advanced search: filter by document number ranges, dates, customer, branch and status." >}}

### The create / edit form

The form is a set of tabs whose order is configurable (Settings → Default Selection → *Details Tab Ordering*). The full set is: **Search Document**, **Main Details**, **E-Invoice**, **Account**, **Lines**, **Delivery Details**, **KO For**, **ARAP**, **Delivery Trips**, **Settlement**, **Settlement Adjustment**, **Department Hdr**, **Posting**, **TraceDocument**, **Contra**, **Doc Link**, **Export**, **Attachments**, **Gross Profit**, **Service Notes**. Most tabs can be hidden with the `HIDE_*_TAB` toggles listed under Configuration.

{{< figure src="/images/internal-sales-invoice-applet/create-form.png" alt="Invoice Creation Form — Main Details" caption="Main Details: company, branch, location, delivery branch/location, sales agent, transaction date, currency." >}}

{{< figure src="/images/internal-sales-invoice-applet/ko-search-document.png" alt="KO For — Search Sales Order" caption="KO For: knock off a Sales Order, Delivery Order, Jobsheet, Sales Quotation, Stock Transfer or another Sales Invoice." >}}

{{< figure src="/images/internal-sales-invoice-applet/entity-selection.png" alt="Entity Selection — Account Tab" caption="Account: pick the customer entity; credit terms, currency and billing address are copied in." >}}

{{< figure src="/images/internal-sales-invoice-applet/item-selection.png" alt="Select Item Dialog" caption="Lines: item search with stock balance visible when SHOW_ITEM_STOCK_BALANCE is on." >}}

{{< figure src="/images/internal-sales-invoice-applet/e-invoice-submission.png" alt="E-Invoice Submission details tab" caption="E-Invoice: buyer identification, submission type and billing period for LHDN." >}}

{{< figure src="/images/internal-sales-invoice-applet/arap-settlement.png" alt="ARAP Settlement tab showing Doc Open Amount and Contra values" caption="ARAP: open amount, settlements and contra against this invoice." >}}

{{< figure src="/images/internal-sales-invoice-applet/pick-pack-queue.png" alt="Pick Pack Queue Listing with Delivery Job drawer" caption="Pick Pack Queue: create delivery jobs from FINAL invoices." >}}

{{< figure src="/images/internal-sales-invoice-applet/delivery-details.png" alt="Delivery Details tab for assigning logistics" caption="Delivery Details: delivery entity and address for the shipment." >}}

### Settings menu

| Settings entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | Every hide/show, mandatory and behaviour toggle (shared *Field Configuration* screen) |
| Default Selection | `settings/default-selection` | Default branch, location, pricing scheme, pricebook, decimal precision, transaction-date logic, tab order |
| Printable Format Settings | `settings/printable-format-settings` | Register printable formats for `INTERNAL_SALES_INVOICE` |
| Branch Settings | `settings/branch-settings` | Per-branch header/footer, images and PIN |
| Workflow Settings | `settings/workflow-settings` | Link a company to a workflow process for this document type |
| Email Template | `settings/email-template` | Choose the template code used when emailing an invoice |
| Custom Resource Bundle Configuration | `settings/translation-settings` | Relabel any field or menu |
| Custom Field Placement | `settings/custom-field-placement` | Place tenant custom fields on the Main, Account, E-Invoice and Line Item tabs |
| Webhook | `settings/webhook` | Subscribe external endpoints to document events |
| Feature Visibility | `settings/feature-visibility` | Team-level feature access |
| Permission Set / User / Team / Role / Client-Side Permission / Permission Wizard / Role Pricing Scheme Link | `settings/*-listing` | Access control (shared permission module) |
| Release Notes, Applet Log | `settings/release-notes`, `settings/applet-log` | Version history and audit of settings changes |

{{< figure src="/images/internal-sales-invoice-applet/settings-page.png" alt="Applet Settings" caption="Settings landing page." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why the invoice needs it |
|---|---|---|
| Company, branch and location | [Organisation](/applets/master-data/organisation-applet/) | Main Details requires all three; a branch's `MAIN_LOCATION` pre-fills the location |
| Company default GL codes for `DEBTOR` (and `DEBTOR_NON_TRADE`), `SALES`, `SALES_DISCOUNT`, `OUTPUT_TAX`, `COGS`, `FOREX_GAIN`, `FOREX_LOSS` | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Journal posting stops with `MISSING_DEFAULT_GL_CODE: DEBTOR` (or `COMPANY_DEFAULT_GL_CODE_NOT_EXIST`) when one is absent |
| Tax codes and, for withholding, WHT codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Each line carries a tax code; the tax amount posts to `OUTPUT_TAX` |
| Customer entities with AR type (`AR_TRADE` or `AR_OTHER`), credit terms and, optionally, `CREDIT_LIMITS` | [Customer](/applets/master-data/customer-applet/) | The AR type decides whether the receivable posts to `DEBTOR` or `DEBTOR_NON_TRADE`; blacklisted customers cannot be finalised |
| Inventory items with stock at the invoicing location | [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Quantity signum is −1; serial, batch and bin items must have matching allocations on FINAL |
| Pricing scheme and pricebook | [Pricebook](/applets/master-data/pricebook-applet/) | Default Selection points the applet at a retail pricing scheme and a pricebook |
| Settlement methods with a cashbook and GL code | [Cashbook](/applets/master-data/cashbook-applet/) | Payment tab lines fail posting with `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` otherwise |
| Document numbering | Tenant running-number setup | Tenant, company and branch running numbers are generated in one transaction at FINAL |
| API permissions `TNT_API_DOC_INTERNAL_SALES_INVOICE_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` | Settings → Permission Set / User / Team / Role | Without READ on a branch target the user sees no invoices; branch targets also filter the Default Selection branch list unless the user is `TNT_TENANT_ADMIN` or `TNT_TENANT_OWNER` |
| Workflow process (optional) | [Workflow Design](/applets/master-data/workflow-design-applet/) then Settings → Workflow Settings | Enables the Workflow Status / Resolution fields and the *Final button status* option |
| E-Invoice profile (optional) | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | `INTERNAL_SALES_INVOICE` is one of the e-Invoice document types; `skip_einvoice` is copied from the customer entity at FINAL |

### Applet settings

**Default Selection** (`settings/default-selection`) — six values plus tab ordering. All are tenant-wide master settings; a user can override branch and location under Personalization.

| Setting | Key | What it controls | Default |
|---|---|---|---|
| Default Branch | `DEFAULT_BRANCH` (+ `DEFAULT_COMPANY`) | Pre-fills company and branch on a new invoice; picking a branch also pre-fills its `MAIN_LOCATION` | none |
| Default Location | `DEFAULT_LOCATION` | Pre-fills the stock location | none |
| Default Pricing Scheme | `PRICING_RETAIL_GUID` | Pricing scheme used when items are added | none |
| Default Pricebook | `DEFAULT_PRICEBOOK` | Pricebook used for unit prices | none |
| Unit Price Decimal Precision | `DEFAULT_DECIMAL_PRECISION` / `DEFAULT_DECIMAL_STEP` | Decimal places on unit prices, 2 to 4 | 2 |
| Transaction Date Logic | `DATE_TXN_LOGIC` | Which date the listing filters and reports treat as the transaction date: Finalized Date, Created Date, Updated Date or Transaction Date | Transaction Date (`USE_DATE_TXN`) |
| Details Tab Ordering | `SALES_INVOICE_DETAILS_TAB_ORDER` | Drag-and-drop order of the form tabs; new tabs are appended | order listed above |

**Application Settings** (`settings/field-settings`) is the shared Field Configuration screen. The toggles below are the ones this applet reads; anything not listed is ignored by this applet even if the screen shows it. Toggles are off unless stated.

*Behaviour toggles* — these change what the applet does, not just what it shows:

| Section | Setting | Effect when on |
|---|---|---|
| Gen Doc Listing | `DISABLE_GEN_DOC_LISTING` | Listing does not load rows until a search is run |
| Gen Doc Listing | `ENABLE_CREDIT_LIMIT_FILTER` | Shows available credit for the selected customer (credit limit − AR balance − open amounts) |
| Gen Doc Listing | `DEFAULT_TRANSACTION_DATE` | Listing opens pre-filtered to a default date range |
| Gen Doc Listing | `DEFAULT_POSTING_STATUS` | Listing opens pre-filtered to DRAFT or FINAL |
| Gen Doc Listing | `SORT_ORDER` | Listing sort direction |
| Gen Doc Listing | `DISABLE_BACK_BUTTON_POP_UP` | No "discard changes?" prompt on Back |
| Create and print | `ENABLE_AUTO_POPUP` | Opens the printable as soon as the document is saved |
| Doc Settings | `ENABLE_DUPLICATE_REFERENCE_CHECK` | Blocks a second invoice with the same Reference |
| Doc Settings | `ENABLE_SALES_AGENT_AUTOFILL` | Sales agent pre-filled from the logged-in employee |
| Doc Settings | `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Detects the employee record behind the login |
| Doc Settings | `ALLOW_EDIT_SALES_AGENT_FINAL` | Sales agent stays editable after FINAL |
| Doc Settings | `DISABLE_LINES_FOLLOWING_HDR_SALES_AGENT` / `DISABLE_LINES_FOLLOWING_HDR_BUDGET` | Line sales agent / budget no longer copied from the header |
| Doc Settings | `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE` | Lock the exchange rate; show where the rate came from |
| Doc Settings | `SIMPLIFIED_UI` | Hides group discount, trade-in and other advanced line features |
| Doc Settings | `SHOW_CUSTOM_DOC_NO` | Exposes the Custom Document Number field |
| Workflow selection | `FINAL_STATUS_GUID` | Workflow status that the Final button sets |
| Workflow selection | `ENABLE_IMPORT_EXPORT` | Enables the Import and Export tabs on the form |
| Entity details | `ENABLE_BRANCH_FILTER` | Customer search limited to the selected branch |
| Entity details | `ENABLE_VEHICLE_TAB` | Vehicle number on the Account tab (workshop use) |
| Shipping | `SELECT_SHIPPING_ENTITY` | Ship-to can be a different entity from the bill-to |
| Lines | `SHOW_ITEM_STOCK_BALANCE` | Stock balance column in item search; disallows negative stock for basic items |
| Lines | `VALIDATE_STOCK_ON_FINALIZE` | **Client-side** stock check before FINAL: the applet compares line quantities with stock balance and shows a warning dialog the user can confirm past (`services/stock-validation.service.ts`). It is not a backend hard stop; the backend does not reject a FINAL on this setting |
| Lines | `ALLOW_NEGATIVE_AMOUNT_TXN_IN_LINES` | Negative line amounts accepted |
| Lines | `ENABLE_EDITING_UNIT_PRICE_STD` | Standard unit price editable in the line |
| Lines | `DISABLE_LINE_ITEM_NAME_EDIT` | Item name locked to master data |
| Lines | `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT` | Maximum item-name length |
| Lines | `HIGHLIGHT_STOCK_COST_ROWS` | Highlights lines priced at or below cost |
| Lines | `SHOW_PACKING_DIMENSIONS`, `SHOW_BUDGET` | Extra line sections |
| Line permission | `DISALLOW_SELL_BELOW_MIN_PRICE` / `…_REPLACEMENT_PRICE` / `…_MA_COST` | Blocks the line unless the user holds the matching `ALLOW_SELL_BELOW_*` client-side permission or gets a line approval |
| Line permission | `DISALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX` | Blocks prices above the standard price |
| Line permission | `HIDE_PRICE_SELL_BELOW_*` | Hides the reference price in the warning |
| Line permission | `WARN_ZERO_UNIT_PRICE_BEFORE_ADD` | Confirmation prompt when adding a zero-price line |
| Line permission | `DISABLE_EDITING_AMOUNT_TXN` | Transaction amount locked (price × quantity only) |
| Line permission | `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` | Price editable only with the per-item-type `ALLOW_<TYPE>_ITEM_PRICE_EDIT` permission |
| KO For | `ENABLE_MULTIPLE_KO` | Knock off several source documents into one invoice |
| KO For | `FILTER_ITEMS_BY_REQUIRED_DELIVERY` | KO listing shows only lines still to be delivered |
| KO For | `ENABLE_AUTO_FINAL` | Invoice created from a knock-off is finalised immediately |
| KO For | `ENABLE_EDIT_PAYMENT_DATE`, `ENABLE_EDIT_SETTLEMENT_FINAL`, `ENABLE_EDIT_SETTLEMENT_DATE` | Settlement lines editable, including on FINAL documents (total must not change) |
| Credit Card | `MANDATORY_CARD_NO`, `MANDATORY_NAME`, `MANDATORY_CARD_ISSUER`, `MANDATORY_CARD_EXPIRY`, `MANDATORY_APPROVAL_CODE`, `MANDATORY_BATCH`, `MANDATORY_CARD_TYPE`, `MANDATORY_CVV` | Card fields required on a card settlement line |
| Server doc type | `DISABLE_EXPORT_PRINT_ON_DRAFT` | Print and export only on FINAL |
| Contra | `EDIT_CONTRA_TXN_DATE`, `HIDE_DELETE_CONTRA` | Contra date editable; delete-contra hidden |
| Applet-specific (top of screen) | `POS_FOC_ITEM` | Allow marking a line free-of-charge |
| Applet-specific | `HIDE_LINE_ITEMS_MENU`, `HIDE_PICK_PACK_QUEUE_MENU`, `HIDE_SALES_INVOICE_TEMPLATE_MENU`, `HIDE_FILE_IMPORT_MENU`, `HIDE_INTERCOMPANY_MENU`, `HIDE_FILE_EXPORT_MENU`, `HIDE_APPROVAL_MENU`, `HIDE_SWAP_SERIAL_NUMBER_MENU` | Removes the sidebar item for everyone except users holding the matching `SHOW_*` client-side permission |

*Hide / show and expand toggles* — purely cosmetic, grouped by screen section:

| Section | Toggles available (`HIDE_…` unless stated) |
|---|---|
| Gen Doc Listing | `SERIAL_NUMBER`, `GENDOC_FINAL_BUTTON`, `GENDOC_DISCARD_BUTTON`, `GENDOC_VOID_BUTTON`, `GENDOC_SAVE_BUTTON`, `CLONE_BUTTON`, `SEND_EMAIL_BUTTON` |
| Gen Doc Fields | `SERVER_DOC_1/2/3` (tenant / company / branch numbers), `CLIENT_DOC_TYPE`, `CLIENT_DOC_1…5`, `DESCRIPTION`, `ARAP_PNS`, `ARAP_SETTLEMENT`, `ARAP_DOC_OPEN`, `ARAP_CONTRA`, `ARAP_BAL`, `MARKETPLACE_ORDER_NO` |
| Vertical UI | `VERTICAL_ORIENTATION` and `EXPAND_*` for each tab |
| Doc Settings (Main Details) | `PREFIX`, `GENERATE_BUTTON`, `TRACKING_ID`, `PERMIT_NO`, `CREATED_BY_DETAILS`, `SOURCE_DOC_NO`, `LOCATION`, `DELIVERY_BRANCH`, `DELIVERY_LOCATION`, `MAIN_DETAILS_SALES_AGENT`, `CRM_CONTACT`, `BASE_CURRENCY`, `CURRENCY`, `CREDIT_TERMS`, `CREDIT_LIMIT`, `DUE_DATE`, `REMARKS`, `EXTERNAL_REMARKS`, `REFERENCE`, `FOREX_HISTORY`, `MEMBER_CARD`, `SALES_LEAD`, `WORKFLOW_STATUS`, `WORKFLOW_RESOLUTION` |
| E-Invoice | `SUBMISSION_TAB`, `NOTIFICATION_TAB`, `SHOW_EMP_REF_NO`, `SHOW_API_UPLOAD`, and one `HIDE_E_INVOICE_*` per field (submission type, number, UUID, document no/type/date, billing frequency and period, tax exemption, buyer name/ID/TIN/SST/email/contact, address lines, country, state, city, postcode) |
| Account sub-tabs | `MEMBER_TAB`, `SHIP_FROM_TAB`, `INTERCOMPANY_TAB`, `BILL_TO_TAB`, `SHIP_TO_TAB`, `ACCOUNT_BILLING_CONTACT`, `ACCOUNT_SHIPPING_CONTACT` |
| Lines | `SALES_AGENT`, `LINE_ITEM_CLIENT_DOC_1`, `UNIT_PRICE_STD_PRICING_SCHEME`, `UNIT_PRICE_STD_INCL_TAX`, `UNIT_PRICE_STD_EXCL_TAX`, `UNIT_PRICE_STD_UOM_INCL_TAX`, `UNIT_PRICE_STD_UOM_EXCL_TAX`, `UNIT_PRICE_NET_UOM_EXCL_TAX`, `UNIT_PRICE_NET_EXCL_TAX`, `UNIT_DISCOUNT`, `QTY_BASE`, `QTY_UOM`, `UOM_TO_BASE_RATIO`, `UNIT_DISCOUNT_UOM_EXCL_TAX`, `UNIT_PRICE_TXN_UOM_INCL_TAX`, `AMOUNT_STD_EXCL_TAX`, `DISCOUNT_AMOUNT_EXCL_TAX`, `AMOUNT_NET_EXCL_TAX`, `TAX_CONFIG_SELECTION`, `WHT_CONFIG_SELECTION`, `UNIT_PRICE_TXN`, `AMOUNT_TXN`, `TOTAL_DISCOUNT_AMOUNT`, `LINE_ITEMS_GL_CODE`, `LINE_ITEMS_BRANCH`, `LINE_LISTING_TOTAL_AMOUNT`, `LINE_LISTING_TOTAL_QTY`, `LINE_LISTING_TAX_AMOUNT`, `REBATE_FROM`, `REBATE_TO`, `LINE_ITEM_TRADE_IN`, `GROUP_DISCOUNT_PERCENTAGE`, `LINE_ITEM_DETAILS_REMARKS`, `LINE_ITEM_TAX_EXEMPTION`, `LINE_ITEM_EINVOICE_DETAILS` |
| Department | `SEGMENT`, `DIMENSION`, `PROFIT_CENTER`, `PROJECT` |
| Line item main tabs | `BIN_NUMBER`, `BATCH_NUMBER`, `BATCH_ISSUE_DATE`, `BATCH_EXPIRY_DATE`, `COSTING_DETAILS`, `PRICING_DETAILS`, `ISSUE_LINK`, `SALES_HISTORY`, `SWAP_SERIAL_NUMBER` |
| Line item sub-tabs | `MULTI_DISCOUNT`, `DELIVERY_INSTRUCTION`, `DEPARTMENT`, `DOC_LINK`, `RELATED_DOCUMENTS`, `DELIVERY_DETAILS`, `DELIVERY_TRIPS`, `ATTACHMENT_TAB` |
| Credit Card | `CARD_NO`, `NAME`, `CARD_ISSUER`, `CARD_EXPIRY`, `APPROVAL_CODE`, `BATCH`, `CARD_TYPE`, `CVV`; also `SEARCH_TAB`, `COLLECTION_TAB`, `STATUS_TAB`, `EXPENSES_TAB`, `SALES_COMMISSION_TAB`, `CONVERT_TAB` |
| Header tabs | `SERVER_DOC_TYPE`, `DOC_SHORT_CODE_PREFIX`, `SEARCH_BY_DOCUMENT_BUTTON`, `DELIVERY_DETAILS_TAB`, `TRACE_DOCUMENT_TAB`, `DOC_LINK_TAB`, `DOC_LINK_FROM`, `DOC_LINK_TO`, `EXPORT_TAB`, `SETTLEMENT_TAB`, `POSTING_TAB`, `DELIVERY_TRIPS_TAB`, `GROSS_PROFIT_TAB` |

{{< callout type="warning" >}}
For this applet the shared screen **defaults the detailed pricing columns and the department fields to hidden** (unit price by UOM, net/discount amounts, tax and WHT code selection, GL code on lines, Segment / Dimension / Profit Centre / Project) until an administrator saves them otherwise. If a column is missing from the Lines grid, look here first.
{{< /callout >}}

{{< figure src="/images/internal-sales-invoice-applet/settings-gen-doc.png" alt="Applet Settings - Gen Doc Listing toggles" caption="Application Settings → Gen Doc Listing." >}}

{{< figure src="/images/internal-sales-invoice-applet/settings-main-details.png" alt="Applet Settings - Main Details toggles" caption="Application Settings → Doc Settings (Main Details)." >}}

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Status flow | Fixed: DRAFT → FINAL → VOID. No custom statuses are exposed in this applet's settings screens (the `ENABLE_CUSTOM_STATUS_*` keys exist in the model but have no UI). |
| Posting at FINAL | Decided by the company's `posting_final_json` (`includeJobProcessorCode` / `excludeJobProcessorCode`) read by the Generic Document Primary Processor — not by an applet setting. |
| Workflow / approval | Settings → Workflow Settings links a **company** to a **workflow process** for `INTERNAL_SALES_INVOICE` (fields: Company, Process, Description). Line-level sell-below-price approvals are separate and need no workflow. |
| Printables | Settings → Printable Format Settings registers formats under `INTERNAL_SALES_INVOICE_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_INTERNAL_SALES_INVOICE`; the listing resolves the format per company/branch at print time. |
| Email | Settings → Email Template selects the template code; sending is queued through the message-template processor at FINAL and from the Send Email button. |
| e-Invoice | No applet switch. `skip_einvoice` is copied from the customer entity when the invoice goes FINAL; submission and cancellation are handled by the My E-Invoice Portal queues. Editing submission fields needs `ENABLE_EDIT_EINVOICE_SUBMISSION_FIELDS` or `ENABLE_EDIT_ALL_EINVOICE_FIELDS`. |
| Webhooks | Settings → Webhook. At FINAL the backend emits `INTERNAL_SALES_INVOICE_CREATED` (full and minimal payloads) to subscribed endpoints. |
| Intercompany | Intercompany menu queues the invoice; the processor creates the mirror `INTERNAL_PURCHASE_INVOICE` (or `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`) in the target company and links the two. Failures land in an error queue visible in the same menu. |

### Feature visibility / permissions

API permissions (server-side, target = branch / company / customer): `TNT_API_DOC_INTERNAL_SALES_INVOICE_CREATE_TGT_GUID`, `…_READ_TGT_GUID`, `…_UPDATE_TGT_GUID`, `…_DELETE_TGT_GUID`; templates use the `TNT_API_DOC_TMPL_INTERNAL_SALES_INVOICE_*` set.

Client-side permissions (`bl_applet_client_side_perm_dfn`, assigned per user, team or role under Settings → Client-Side Permission Listing):

| Group | Permission codes | Gate |
|---|---|---|
| Re-enable a hidden menu for some users | `SHOW_SWAP_SERIAL_NUMBER` plus the `SHOW_*_MENU` counterparts of the `HIDE_*_MENU` settings | Overrides the tenant-wide hide |
| Buttons | `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_SAVE_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_CLONE_BUTTON`, `SHOW_DELETE_CONTRA` | Who may finalise, void, discard, clone, delete contra |
| Pricing columns | `SHOW_UNIT_PRICE_STD_*`, `SHOW_UNIT_PRICE_NET_*`, `SHOW_UNIT_PRICE_TXN*`, `SHOW_UNIT_DISCOUNT*`, `SHOW_AMOUNT_*`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_COSTING_DETAILS`, `SHOW_GROSS_PROFIT`, `SHOW_LAST_PURCHASE_PRICE`, `HIDE_PRICE`, `INTERNAL_SALES_INVOICE_DISPLAY_PRICING` | Reveal or hide cost and margin data per role |
| Document numbers | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1…5`, `SHOW_TRANSACTION_DATE` | Column visibility |
| Selling below cost | `ALLOW_SELL_BELOW_MIN_PRICE`, `ALLOW_SELL_BELOW_REPLACEMENT_PRICE`, `ALLOW_SELL_BELOW_MA_COST`, `ALLOW_SELL_BELOW_MA_COST_WHOLE_DOCUMENT`, `ALLOW_APPROVE_SELL_BELOW_PRICE` | Bypass the `DISALLOW_SELL_BELOW_*` settings, or approve someone else's line (approver enters email/mobile and password in the line dialog) |
| Price editing by item type | `ALLOW_ALL_ITEM_PRICE_EDIT` or one of `ALLOW_BASIC_ITEM_PRICE_EDIT`, `ALLOW_GROUPED_ITEM_PRICE_EDIT`, `ALLOW_BUNDLE_ITEM_PRICE_EDIT`, `ALLOW_COUPON_ITEM_PRICE_EDIT`, `ALLOW_SERVICE_ITEM_PRICE_EDIT`, `ALLOW_WARRANTY_ITEM_PRICE_EDIT`, `ALLOW_GL_CODE_ITEM_PRICE_EDIT`, `ALLOW_DOC_HEADER_ADJUSTMENT_ITEM_PRICE_EDIT`, `ALLOW_MEMBERSHIP_ITEM_PRICE_EDIT`, `ALLOW_MADE_TO_ORDER_ITEM_PRICE_EDIT`, `ALLOW_DIGITAL_GOODS_ITEM_PRICE_EDIT`, `ALLOW_FIXED_ASSET_REGISTER_ITEM_PRICE_EDIT`, `ALLOW_SALES_CONTRACT_ITEM_PRICE_EDIT`, `ALLOW_DELIVERY_CHARGE_ITEM_PRICE_EDIT`, `ALLOW_NSTI_ITEM_PRICE_EDIT`, `ALLOW_GROUP_DISCOUNT_ITEM_PRICE_EDIT`, `ALLOW_CURRENCY_ITEM_PRICE_EDIT` | Used only when `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` is on |
| Other | `ALLOW_VIEW_ALL_SALESMAN_TRANSACTION`, `ENABLE_SALES_AGENT_LOGIN_FILTER`, `ALLOW_CREDIT_LIMIT_FILTERING`, `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH`, `DELETE_ROUNDING_ITEM`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`, `ENABLE_EDIT_EINVOICE_SUBMISSION_FIELDS`, `ENABLE_EDIT_ALL_EINVOICE_FIELDS` | Listing scope by sales agent, credit filter, item search, rounding line, e-Invoice edits |

Settings → Feature Visibility currently exposes a single **Teams** panel (team access) and nothing else.

## Fields

**Main Details** (`bl_fi_generic_doc_hdr`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Location | Selling company, branch and stock location | Yes | Location list follows the branch; hidden Location still needs a value |
| Delivery Branch / Location | Where goods ship from if different | No | Hide with `HIDE_DELIVERY_BRANCH` / `HIDE_DELIVERY_LOCATION` |
| Transaction Date | Accounting date | Yes (backend) | Must not fall in a locked fiscal period |
| Currency, Currency Rate, Base Currency | Document currency and rate to base | Currency yes | Rate must be non-zero when currencies differ; lock with `CANNOT_EDIT_CURRENCY_RATE` |
| Sales Agent | Employee credited with the sale | Optional; `MANDATORY_MAIN_DETAILS_SALES_AGENT` in model | Autofill from login with `ENABLE_SALES_AGENT_AUTOFILL` |
| Credit Terms, Credit Limit, Due Date | Copied from the customer | No | Due date derived from terms |
| Reference, Remarks, External Remarks | Free text | No | Reference can be forced unique |
| Doc Short Code, Tenant / Company / Branch Doc No, Custom Document Number | Numbering | Generated at FINAL | Custom number needs `SHOW_CUSTOM_DOC_NO` |
| Client Document Type, Client Doc 1–5 No | Customer-side references (PO number etc.) | No | |
| Workflow Status / Resolution | From the linked workflow process | No | Only meaningful with Workflow Settings |
| Permit No, CRM Contact, MemberCard, Sales Lead, Prefix, Tracking ID, Budget fields, Source Doc | Optional header attributes | No | `SALES_LEAD_OPTIONS` supplies the Sales Lead list |

**Account**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Entity ID | The customer | Yes | Copies name, currency, credit terms, billing and shipping addresses; blacklisted customers are rejected at FINAL |
| Billing / Shipping address and contacts | Addresses printed and used for delivery | No | Ship-to may be another entity with `SELECT_SHIPPING_ENTITY` |
| Member, Intercompany, Vehicle sub-tabs | Membership card, target company, vehicle number | No | Each can be hidden |

**Lines** (`bl_fi_generic_doc_line`, `txn_type = PNS`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item Code / Name | Inventory or service item | Yes | Name editable unless `DISABLE_LINE_ITEM_NAME_EDIT` |
| Branch | Branch the line belongs to | Yes | Defaults from header |
| Quantity, Quantity by UOM, UOM, UOM to Base Ratio | Quantity sold | Yes, ≥ 0 | Quantity signum −1 is filled by the backend |
| Unit Price STD (incl/excl tax), Unit Discount, Unit Price Net, Unit Price Transaction, STD / Discount / Net / Txn amounts | Pricing chain | Derived | Below-cost checks compare Unit Price Net against min price, replacement price and MA cost |
| Tax Code, SST/GST/VAT, Tax Amount, WHT Code, WHT Amount, Tariff Code | Tax | Tax code from item or scheme | Tax posts to `OUTPUT_TAX` |
| GL Code | Overrides the company `SALES` account for this line | No | Hidden by default |
| Serial Number, Batch Number (with Issue / Expiry Date), Bin Number tabs | Allocations for tracked items | Match line quantity at FINAL | Batch issue and expiry dates are optional; bin lines need bin code, container UOM and quantity ≥ 1 |
| FOC, Trade-in Serial Number, Rebate Date From/To, Remarks, E-Invoice UOM, Tax Exemption Details / Amount, Product Tariff Code, Country of Origin | Optional attributes | No | |
| Segment, G/L Dimension, Profit Center, Project | Department analysis | Per `MANDATORY_*` toggles | Hidden by default for this applet |

**E-Invoice**: Submission Type (and Type 2), E-invoice Number, UUID, Document No / Type / Date, EMP Ref Number, Skip E-Invoice, Billing Frequency and Period, Tax Exemption, Buyer Name / ID Type / ID No / TIN / SST ID / Email / Contact, buyer address lines, Country, State, City, Postcode, Validation URL. All optional at save; LHDN validation happens in the e-Invoice queue.

**Settlement (Payment tab)** — one line per payment (`txn_type = STL_MTHD`). Types: Bank Transfer, Cash, Cheque, Post Dated Cheque, Credit Card, Debit Card, e-Wallet, FPX e-Mandate, Membership Point Currency, Open Credit, Others, PGW Merchant, PGW Provider Seamless, Voucher, TT Payment.

| Field | Required |
|---|---|
| Date, Amount (≥ 0.01) | Always |
| Cheque No (cheque), Cheque Date (post-dated), Transaction No (bank transfer / e-wallet), Voucher No (voucher), Reference (others), Points and Point Currency (membership points), Cash Back (cash) | Per type |
| Card No, Name on Card, Issuer, Expiry, Approval Code, Batch, Card Type, CVV | Per `MANDATORY_*` setting |

**Delivery Details**: delivery entity (required when a delivery record is added), address, instructions; feeds the Pick Pack Queue and Delivery Trips.

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable; no stock, GL or AR effect; no running number | FINAL, or delete |
| **FINAL** | Numbered and posted. Header and line amounts locked; settlement lines may still be edited if the total is unchanged; sales agent editable only with `ALLOW_EDIT_SALES_AGENT_FINAL` | VOID |
| **VOID** | Reversed with a mandatory void reason | none |

**What FINAL checks before it saves** (in this order): exchange rate present when document and base currency differ; customer not blacklisted; serial-number, bin and batch quantities equal the line quantity; stock balance at the location (only when `VALIDATE_STOCK_ON_FINALIZE` is on); selling below cost (when `DISALLOW_SELL_BELOW_MA_COST` is on and no permission/approval); redeemed membership points do not exceed the balance; transaction date and company present; date not inside a locked fiscal period (`FISCAL_PERIOD_LOCKED`).

**What FINAL does** once validation passes: copies `skip_einvoice` from the customer entity; generates tenant, company and branch running numbers in one transaction; queues the Generic Document Primary Processor, which runs the company's enabled posting processors (inventory, journal, AR, cashbook); emits the `INTERNAL_SALES_INVOICE_CREATED` webhook; queues the sales-contract processor, the message-template (email) processor, the membership reward-point processor and the e-commerce stock-availability sync.

**Journal** (company default GL codes from the `SALES` posting handler; amounts in document currency, converted at the header rate):

| Dr | Cr | Amount | GL code source |
|---|---|---|---|
| Debtor (`DEBTOR`, or `DEBTOR_NON_TRADE` for `AR_OTHER` customers) | | Total including tax | Company default GL |
| | Sales (`SALES`) | Net amount per line | Line GL code if set, else company default |
| Sales Discount (`SALES_DISCOUNT`) | | Discount lines | Company default GL |
| | Output tax (`OUTPUT_TAX`) | Tax amount | Company default GL |
| Cost of goods sold (`COGS`) | Stock | Moving-average cost × quantity | Company default GL and the item's stock account |
| Cashbook GL (settlement line) | Debtor | Each Payment-tab line | Settlement method's GL code and cashbook |
| Forex gain / loss (`FOREX_GAIN` / `FOREX_LOSS`) | | Rounding on multi-currency documents | Company default GL |

Stock: each PNS line writes an inventory transaction with quantity × −1 at the line branch and location; serial, batch and bin allocations are locked to the document.

**VOID** sets `posting_status = VOID` and the void reason, queues the void primary processor (reverses inventory, journal and AR postings), removes the document from the e-Invoice submission queue, and voids the forex shadow document if one exists. A FINAL invoice that has already been settled or knocked off should be reversed with a Sales Return or Credit Note rather than voided.

**Editing settlement on a FINAL invoice**: the backend rejects the change if the document is not FINAL, if the new total differs from the old ("The total settlement amount must be the same as the previous"), or if nothing changed. Accepted changes reverse and re-create the journal and cashbook lines.

## Related applets

- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — the usual source document; KO For copies its lines and the order is marked delivered.
- [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/) and [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) — other KO sources.
- [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) — invoice after delivery, or deliver from the Pick Pack Queue after invoicing.
- [Sales Invoice (No Stock Out)](/applets/sales-workflow/internal-sales-invoice-no-stock-out-applet/) — same posting without the inventory movement.
- [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) — reversals and adjustments against a FINAL invoice.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — settles the receivable; Contra settles it against other documents at the latest of the documents' dates.
- [Recurring Sales Invoice](/applets/sales-workflow/recurring-sales-invoice-applet/) — generates invoices of this type on a schedule.
- [Sales Contract](/applets/sales-workflow/sales-contract-applet/), [Sales Commission](/applets/sales-workflow/sales-commission-applet/) — processors triggered at FINAL.
- [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) — submission, validation and cancellation of the e-Invoice.
- [POS General](/applets/sales-workflow/pos-general-applet/) — cash bills use the same engine; both feed Sales Return.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — created automatically in the buying company for intercompany sales.
- [Customer](/applets/master-data/customer-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) — master data read at entry and posting time.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A "not enough stock" warning appears at FINAL, naming an item code | Stock at the line's location is below the line quantity and `VALIDATE_STOCK_ON_FINALIZE` is on; this is the applet's confirmation dialog, not a backend rejection | Check the location on the line and the stock balance; confirm the dialog to finalise anyway, or correct the quantity/location |
| Final fails with `MISSING_DEFAULT_GL_CODE: DEBTOR` (or `SALES`, `OUTPUT_TAX`, `COGS`) | Company default GL codes not set | Set them in [Chart of Account](/applets/master-data/chart-of-account-applet/) for the selling company |
| Posting fails with `MISSING_GL_CODE: STL_MTHD [code]` or `MISSING_CASHBOOK` | A settlement method used on the Payment tab has no GL code or cashbook | Complete the settlement method in [Cashbook](/applets/master-data/cashbook-applet/) |
| "The selected date falls within a locked fiscal period." | Transaction date inside a closed period | Change the date or reopen the period |
| Customer cannot be finalised; blacklist warning on the Account tab | Entity flagged blacklisted (outstanding balance above limit) | Clear the flag in [Customer](/applets/master-data/customer-applet/) after settlement |
| Line rejected for selling below cost / min price / replacement price | `DISALLOW_SELL_BELOW_*` on and user lacks `ALLOW_SELL_BELOW_*` | Grant the permission, or have an approver with `ALLOW_APPROVE_SELL_BELOW_PRICE` approve the line (Approval menu) |
| Cannot add a batch line — ADD stays disabled | Older builds required batch Issue and Expiry dates | Fixed: both dates are optional; upgrade the applet |
| Zero-price line saved silently | `WARN_ZERO_UNIT_PRICE_BEFORE_ADD` off | Turn it on in Application Settings → Line permission |
| Pricing columns or Segment/Project fields missing from the Lines grid | This applet defaults them to hidden | Application Settings → Lines / Department, switch the `HIDE_*` toggle off |
| A sidebar item (Pick Pack Queue, Intercompany, Swap Serial…) missing for one user | `HIDE_*_MENU` on tenant-wide | Grant that user the matching `SHOW_*` client-side permission |
| Print / Export greyed out on a draft | `DISABLE_EXPORT_PRINT_ON_DRAFT` | Finalise first, or turn the setting off |
| Wrong printable format opens from the listing | Format resolved per company/branch | Register the format for that company in Printable Format Settings |
| Second invoice with the same Reference rejected | `ENABLE_DUPLICATE_REFERENCE_CHECK` | Use a unique reference or turn the check off |
| Contra posted on an unexpected date | Contra date is always the latest date among the documents knocked off | Expected behaviour; `EDIT_CONTRA_TXN_DATE` allows an override |
| Serial number corrected with Swap Serial but grids still show the old one | Older builds did not resync after the swap was processed | Fixed; reopen the document or upgrade |
| Editing a FINAL invoice's quantity shows 1 for basic-quantity items | Older edit-mode bug | Fixed; upgrade the applet |
| E-Invoice warning badge "entity differs" | Account entity and E-Invoice submission entity are different | Align the buyer on the E-Invoice tab with the Account entity |
| Intercompany mirror document not created | Processing queue error (missing target company mapping or GL) | Open the Intercompany menu, read the error queue entry, fix the target company setup and re-queue |

## Related documentation

- [Standard Sales Workflow](/guides/sales-guides/standard-sales-workflow/), [Credit Sales Workflow](/guides/sales-guides/credit-sales-workflow/), [Partial Delivery Workflow](/guides/sales-guides/partial-delivery-workflow/), [Returns and Exchanges Workflow](/guides/sales-guides/returns-exchanges-workflow/)
- [Financial Accounting module](/modules-v2/financial-accounting/), [Inventory module](/modules-v2/inventory/), [E-Invoice module](/modules-v2/e-invoice/)
- [Sales Workflow applets](/applets/sales-workflow/)
