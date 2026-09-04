---
title: "Purchase Invoice (Internal)"
description: "Record supplier bills, match them to purchase orders and goods received notes, post the supplier liability and stock-in to the ledger, settle by payment or contra, and submit self-billed e-Invoices."
applet_code: "internal_purchase_invoice_applet"
applet_repo: "blg-applet-wavelet-internal-purchase-invoice-applet"
modules: [financial-accounting, purchasing]
related_applets:
  - internal-purchase-order-applet
  - internal-purchase-grn-applet
  - internal-purchase-requisition-applet
  - supplier-delivery-order-applet
  - internal-purchase-return-applet
  - internal-purchase-credit-note-applet
  - internal-purchase-debit-note-applet
  - internal-payment-voucher-applet
  - internal-purchase-invoice-no-stock-in-applet
  - internal-purchase-invoice-supplier-access-applet
  - my-e-invoice-portal-applet
  - supplier-applet-1
  - chart-of-account-applet
  - tax-configuration-applet
  - cashbook-applet
  - organisation-applet
  - ledger-and-journal-applet
guides:
  - /guides/purchasing-guides/standard-procurement-workflow/
  - /guides/purchasing-guides/direct-invoice-workflow/
  - /guides/purchasing-guides/invoice-first-workflow/
  - /guides/einvoice-guides/malaysia-e-invoice-guide/
sources:
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/models/personal-settings.model.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/app.component.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/knock-off-settings/knock-off-settings.component.html
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/printable-format-settings-container/add-printable-format/add-printable-format.component.html
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/main-details/main-details.component.html
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/purchase-invoice-edit.component.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/posting/posting.component.html
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/import-knock-off/knock-off-grn/knock-off-grn.component.ts
  - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/state-controllers/purchase-invoice-controller/store/reducers/purchase-invoice.reducers.ts
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/GenericDocumentConverterFactory.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/genericDocumentConverter/PurchaseGRNToPurchaseInvoiceConverter.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code internal_purchase_invoice_applet)
tags:
- finance
- purchase-invoice
- intercompany
- settlement
- accounts-payable
- e-invoice
- knock-off
- line-items
weight: 120
date: 2026-04-11
lastmod: 2026-09-05
draft: false
---

## Overview

The **Purchase Invoice (Internal)** applet records the bills your suppliers send you. An accounts-payable clerk opens it to key in a supplier invoice — either from scratch or by knocking off (pulling in) a finalised Purchase Order or Purchase GRN — and finalises it. Finalising posts the supplier liability, the purchase and input tax to the General Ledger, and books the invoiced quantities **into stock**. The invoice is then settled from its own Payment tab, by contra against a supplier deposit or credit, or later through a Payment Voucher.

{{< callout type="info" >}}
**Core concept.** The Purchase Invoice is the "truth checker" before money leaves the company: it ties what Procurement ordered (Purchase Order), what the warehouse received (Purchase GRN) and what the supplier is billing into one document, so overpayments and duplicates are caught before settlement.
{{< /callout >}}

In the standard BigLedger purchase flow the **invoice is the document that moves stock**. The Purchase GRN (Internal) records receipt without a stock movement; the Purchase Invoice books the quantities in and updates the last purchase cost. If your business needs stock booked at receipt and invoiced later, use the alternative pair [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) and [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) instead.

## Video overview

{{< youtube 0dGRtyjV7-A >}}

## Where it fits

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/) | Optional knock-off source (switchable in Knock Off settings) |
| Upstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Knock-off source: copies supplier, lines and prices into the invoice |
| Upstream | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | Preferred knock-off source; the backend has a dedicated GRN-to-invoice converter |
| Upstream | [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) | Optional knock-off source |
| Master data | [Supplier Applet](/applets/master-data/supplier-applet-1/) | Supplier entity, AR/AP type, self-billed e-Invoice flag |
| Downstream | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | Settles outstanding invoices in bulk |
| Downstream | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | Returns goods against the invoice; blocks VOID once linked |
| Downstream | [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) / [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) | Adjust a finalised invoice without voiding it |
| Downstream | [My E-invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | Receives self-billed invoices for MyInvois submission |
| Downstream | [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) | Shows the journal FINAL creates |
| Sibling | [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) | The supplier-facing view of the same documents |

Modules: [Financial Accounting](/modules-v2/financial-accounting/) and [Purchasing](/modules-v2/purchasing/).

## Screens and menus

The applet's left-hand menu (`src/app/models/menu-items.ts`) has six workspaces:

| Menu item | Route | What it is |
|---|---|---|
| **Internal Purchase Invoice** | `internal-purchase-invoice` | Listing plus the create/edit form |
| **Line Items** | `line-items` | One grid of every invoice line across all invoices, for bulk price/qty/tax review |
| **File Import** | `file-import` | Upload CSV/Excel of invoices, run helper checking, fix rows in the browser |
| **File Export** | `file-export` | Export invoice listings and bulk-print |
| **Intercompany** | `intercompany` | Inbound / Outbound queues, each split into Unprocessed and Processed |
| **Audit Trail** | `audit-trail` | Change history of documents |

File Import and File Export are hidden when `HIDE_FILE_IMPORT_MENU` / `HIDE_FILE_EXPORT_MENU` are on, unless the user holds the `SHOW_FILE_IMPORT_MENU` / `SHOW_FILE_EXPORT_MENU` client-side permission.

### The edit form tabs

The tabs below appear in this default order; the order can be changed under *Settings > Default Selection > Details Tab Ordering*, and each tab has a `HIDE_..._TAB` switch (see Configuration).

| Tab | Shown when | Purpose |
|---|---|---|
| Search Document | Draft only (`TEMP`) | Sub-tabs *Search Purchase Order*, *Search Purchase GRN*, *Search Purchase Invoice* to look up source documents |
| Main Details | Always | Header: branch, location, dates, currency, references, credit terms |
| E-Invoice | Always (hideable) | MyInvois processing status, failures, self-billed flag |
| Account | Always | Sub-tabs *Entity Details*, *Bill To*, *Ship To*, *Intercompany*; toggle to create a supplier inline |
| Line Items | Always | Grid of items; each line opens sub-tabs *Item Details*, *Pricing Details*, *Costing Details*, *Issue Link* |
| KO For | Draft only | Sub-tabs *Purchase GRN* and *Purchase Order*: pick a finalised source document and click **Knock-off** |
| Delivery Details | Hideable | Delivery branch/location and consignment parameters |
| ARAP | Hideable | Read-only: Product & Services, Settlement, Contra, Outstanding |
| Payment | Hideable | Record settlements against this invoice |
| Department Hdr | Hideable | Dimension, Profit Centre, Project, Segment |
| Posting | Hideable | Journal, Inventory, Membership Points, Cashbook and Tax posting status after FINAL |
| TraceDocument | Hideable | Journal Txn / Inv Txn rows created by FINAL |
| Contra | Hideable | Offset against supplier deposits or credit documents |
| Doc Link | Hideable | Link any other document |
| Attachment | Hideable | Upload supplier PDFs |
| Export | Hideable | Print with a printable format |

{{< figure src="/images/internal-purchase-invoice-applet/create-purchase-invoice.png" alt="Create Purchase Invoice screen showing the initial data entry form" caption="Create Purchase Invoice: header details before adding supplier and line items." >}}
{{< figure src="/images/internal-purchase-invoice-applet/account-tab-select-supplier.png" alt="Account tab with supplier selection in purchase invoice" caption="Account tab: link the invoice to the supplier profile before posting." >}}
{{< figure src="/images/internal-purchase-invoice-applet/ko-for-purhcase-order.png" alt="KO For tab showing source document selection using Purchase Order" caption="KO For tab: select a finalised source document to populate the invoice." >}}

### Top action buttons

| Button | Enabled when | What it does |
|---|---|---|
| **Create** | New document | Saves the draft (document status `ACTIVE`, posting status `DRAFT`). Nothing is posted. |
| **SAVE** | Draft | Saves edits. Nothing is posted. |
| **FINAL** | Draft with valid header, supplier and at least one line | Posts journal, stock and tax; locks the document. |
| **DISCARD** | Draft | Deletes the draft permanently. |
| **VOID** | Finalised, company e-Invoice not enabled, no linked purchase return | Reverses the posting and marks the document `VOID`. |
| **SELF-BILLED** | Draft | Flags the invoice as a self-billed e-Invoice for MyInvois. |
| **BASE** | Any | Toggles display between transaction currency and base currency. |
| **SINGLE / MULTI PRINT** | Any | Prints one document, or several in one job, using a printable format. |
| **CLONE** | Any (hideable) | Copies the document into a new draft. |

### Workflows kept from daily use

**Create from a GRN (recommended).** Click **+**, go straight to the **KO For** tab, select the finalised Purchase GRN, click **Knock-off**, review the lines, click **Create**, then **FINAL**. The source document must be finalised and not already fully knocked off, or it will not appear in the search.

**Create directly.** Click **+**, set Branch, Location, Transaction Date and Currency (a foreign currency fetches the latest rate automatically), pick the supplier on **Account**, add lines on **Line Items**, **Create**, then **FINAL**.

**Record a payment.** On a finalised invoice open **Payment**, click **+**, choose the settlement method (a cashbook-backed method configured in Branch Settings), enter the amount, **Save**. The Outstanding figure on **ARAP** drops immediately. Use **Contra** instead when offsetting a supplier deposit or credit note.

{{< figure src="/images/internal-purchase-invoice-applet/recording-a-payment.png" alt="Payment tab showing payment entry for purchase invoice" caption="Payment tab: settlement entries reduce the outstanding balance." >}}
{{< figure src="/images/internal-purchase-invoice-applet/contra-workflow.png" alt="Contra tab workflow for offsetting purchase invoice with existing credit" caption="Contra tab: offset the invoice with existing deposits or credits." >}}

**Self-billed e-Invoice.** If the supplier profile has *E-Invoice Self-Bill* set to true every invoice for that supplier is flagged automatically; otherwise click **SELF-BILLED** on the draft. After FINAL the document is picked up by the [My E-invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/), where you monitor the submission, read validation errors and download the validated PDF.

{{< figure src="/images/internal-purchase-invoice-applet/self-billed-e-invoice.png" alt="Self-Billed E-Invoice workflow in purchase invoice" caption="Self-billed e-Invoice: flag and track invoices that must go through MyInvois." >}}

**Bulk import.** In **File Import** download the template, fill it (dates `YYYY-MM-DD`, item and supplier codes exactly as in master data), upload it, then open failed rows in the Helper Checking edit form to correct them without re-uploading.

{{< figure src="/images/internal-purchase-invoice-applet/file-import-tab.png" alt="File Import workspace for template download and bulk upload" caption="File Import: download the template and upload invoices in bulk." >}}

**Intercompany.** The **Intercompany** menu shows Inbound and Outbound queues (Unprocessed / Processed) for invoices between companies in the same tenant. The screen is gated by the `SHOW_INTERCOMPANY_PI_SCREEN` permission and the `HIDE_INTERCOMPANY_TAB` setting on the Account tab.

{{< figure src="/images/internal-purchase-invoice-applet/intercomapny-transactions.png" alt="Intercompany transactions screen in purchase invoice applet" caption="Intercompany: inbound and outbound queues between companies in one tenant." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why the invoice needs it |
|---|---|---|
| Company, branch, location | [Organisation Applet](/applets/master-data/organisation-applet/) | Branch and Location are the only two unconditionally required header fields. Set a branch `MAIN_LOCATION` so *Default Selection* can auto-fill the location. |
| Supplier entity with an AR/AP type | [Supplier Applet](/applets/master-data/supplier-applet-1/) | The entity's type decides the payable account: `AP_TRADE` posts to the company default `CREDITOR`, `AP_OTHER` to `CREDITOR_NON_TRADE`. Set *E-Invoice Self-Bill* on the supplier if every invoice should be self-billed. |
| Company default GL codes | [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) (company GL-code links) | FINAL needs `CREDITOR` (or `CREDITOR_NON_TRADE`), `PURCHASE`, `INPUT_TAX`, and — when used — `PURCHASE_DISCOUNT`, `PURCHASE_RETURN`, `FOREX_GAIN`, `FOREX_LOSS`, `SETTLEMENT_CHARGES`. A missing `CREDITOR` mapping makes FINAL fail with `MISSING_DEFAULT_GL_CODE: CREDITOR`. |
| Item GL overrides (optional) | Item maintenance, company GL-code link with transaction code `PURCHASE` | A line posts to the GL code chosen on the line, else the item's `PURCHASE` link, else the company default `PURCHASE`. |
| Tax codes | [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/) | Line tax posts to the company default `INPUT_TAX`. Withholding tax needs `ENABLE_WHT` and a WHT configuration. |
| Cashbook and settlement methods | [Cashbook Applet](/applets/master-data/cashbook-applet/), then *Settings > Branch Settings > Default Settlement Method* | The Payment tab only offers settlement methods assigned to the branch. |
| Document numbering | [Organisation Applet](/applets/master-data/organisation-applet/) (running numbers) | Doc No (Tenant / Company / Branch) are generated at save. Self-billed purchase invoices and sales invoices draw from separate sequences that both start at 1000001, so the same number can exist once as each type. |
| Printable format | *Settings > Printable Format Settings* | Print and auto-print on FINAL need at least one format; the Export tab reports *No Default Printable Selected* otherwise. |
| Permissions | *Settings > Permission Set / User Permission / Team Permission / Role Permission* | Server-side: `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_READ/CREATE/UPDATE/DELETE_TGT_GUID` (targeted by branch), `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_DELIVERY_BRANCH_READ`, or `TNT_TENANT_ADMIN` / `TNT_TENANT_OWNER`. |
| e-Invoice (Malaysia) | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | The company's `einvoice_status` must be `ENABLED` for submission; once enabled the applet hides **VOID** on finalised invoices. |

### Applet settings

The Settings screen (gear icon) has one group, *System Configuration*, with four menu entries — **Application Settings**, **Default Selection**, **Printable Format Settings**, **Branch Settings** — plus permission screens, Webhook, Feature Visibility (team access), Release Notes and Applet Log reached from the same sidebar. Settings are tenant-wide for the applet; a user with the applet's Settings access can change them. *Personalization* (user icon) holds a per-user **Default Selection** and **Sidebar** layout that override the tenant defaults for that user only.

{{< figure src="/images/internal-purchase-invoice-applet/applet-configuration.png" alt="Application settings screen for purchase invoice applet configuration" caption="Application Settings: feature visibility and layout switches." >}}

#### Default Selection

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| Default Branch (`DEFAULT_BRANCH`) | Branch pre-selected on new invoices | none | Selecting a branch also stores its company and pre-fills the location from the branch's `MAIN_LOCATION`. |
| Default Location (`DEFAULT_LOCATION`) | Location pre-selected on new invoices | none | Filtered to the chosen branch. |
| Unit Price Decimal Precision (`DEFAULT_DECIMAL_PRECISION`) | Decimal places for unit prices and the step of price inputs | 2 | Accepts 2–4; the step (`DEFAULT_DECIMAL_STEP`) is derived. Multi-discount lines follow the same precision. |
| Transaction Date Logic (`DATE_TXN_LOGIC`) | Which date becomes the document's transaction date at FINAL | Transaction Date | *Finalized Date*, *Created Date* or *Updated Date* overwrite the keyed date when the document is finalised. |
| Details Tab Ordering (`PURCHASE_INVOICE_DETAILS_TAB_ORDER`) | Order of the edit-form tabs | Search Document, Main Details, E-Invoice, Account, Line Items, KO For, Delivery Details, ARAP, Payment, Department Hdr, Posting, TraceDocument, Contra, Doc Link, Attachment, Export | Drag to reorder; **RESET** restores the default order and clears the defaults above. |

#### Application Settings — listing and buttons

| Setting | What it controls | Default |
|---|---|---|
| `DISABLE_GEN_DOC_LISTING` | Stops the listing from loading documents until a search is run | Off |
| `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON` | Hide the corresponding action button for everyone; a user holding the matching `SHOW_..._BUTTON` permission still sees it | Off |
| `HIDE_PRINT_BUTTON`, `HIDE_EXPORT_AS_PDF_BUTTON`, `HIDE_CLONE_BUTTON` | Hide print, PDF export and clone | Off |
| `DEFAULT_TRANSACTION_DATE` | Default date range of the listing filter | none |
| `ENABLE_FILTER_BY_TODAYS_TXN` | Listing opens filtered to today's transactions | Off |
| `SORT_ORDER` | Listing sort order | none |
| `DEFAULT_POSTING_STATUS` | Listing filter on posting status (DRAFT / FINAL / VOID) | none |
| `DEFAULT_STATUS` | Listing filter on document status | none |
| `FUZZY_SEARCH_COLUMNS` | Columns the quick-search box matches against | none |
| `HIDE_CREATED_DATE`, `HIDE_UPDATED_DATE`, `HIDE_CREATED_BY_DETAILS` | Hide audit columns/fields | Off |
| `HIDE_SEARCH_BY_DOCUMENT_BUTTON` | Hides the *Search Document* tab on drafts | Off |
| `HIDE_FILE_IMPORT_MENU`, `HIDE_FILE_EXPORT_MENU` | Remove the File Import / File Export menu items | Off |
| `ENABLE_IMPORT_EXPORT` | Enables the import/export workflow selection | Off |
| `ENABLE_INLINE_APPLET_CONFIG` | Shows the inline gear icon that opens settings next to the field | Off |
| `ENABLE_AUTO_POPUP` | Opens the printable automatically after **Create**/FINAL, using `PRINTABLE` | Off |
| `PRINTABLE` | Printable format code used by auto-popup | none |

#### Application Settings — document header

| Setting | What it controls | Default |
|---|---|---|
| `HIDE_SERVER_DOC_1/2/3` | Hide Doc No (Tenant / Company / Branch) | Off |
| `SHOW_CUSTOM_DOC_NO` | Shows an editable *Custom Document Number* | Off |
| `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1..5` | Hide Client Doc Short Code and Client Doc 1–5 No | Off |
| `HIDE_SOURCE_DOC_NO` | Hides Source Doc No / Source Doc Short Code | Off |
| `HIDE_REFERENCE`, `MANDATORY_REFERENCE` | Hide, or require, the Reference field (the supplier's invoice number) | Off |
| `ENABLE_DUPLICATE_REFERENCE_CHECK` | Warns when the Reference already exists on another document | Off |
| `HIDE_REMARKS`, `HIDE_EXTERNAL_REMARKS`, `HIDE_DESCRIPTION` | Hide free-text fields | Off |
| `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION` | Hide location and delivery branch/location | Off |
| `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY` | Hide the currency selectors | Off |
| `CANNOT_EDIT_CURRENCY_RATE` | Locks the exchange rate to the fetched value (users with `EDIT_CURRENCY_RATE` permission can still edit) | Off |
| `SHOW_FOREX_DATA_SOURCE` | Shows where the rate came from | Off |
| `HIDE_CREDIT_TERMS`, `HIDE_CREDIT_LIMIT` | Hide the supplier's terms and limit | Off |
| `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO` | Hide Tracking ID and Permit No | Off |
| `ALLOW_EDITING_DOC_REF_DATE` | Makes Doc Reference Date editable | Off |
| `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Pre-fills Purchaser from the logged-in employee (users with `DISABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` permission are exempt) | Off |
| `HIDE_EXTERNAL_QUOTATION/ORDER/DELIVERY_ORDER/INVOICE/OTHERS` | Hide each External document reference and its date | Off |
| `MANDATORY_QUOTATION/ORDER/DELIVERY_ORDER/INVOICE/OTHERS` and `..._DATE` | Make each External reference or its date required before save | Off |
| `HIDE_DOCUMENT_LINKS` | Hides the document-links block on the header | Off |
| `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Hide individual ARAP figures | Off |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT` and `MANDATORY_...` | Hide, or require, each Department header field | Off |
| `INCLUDE_/ENABLE_SST`, `INCLUDE_/ENABLE_WHT` | Enable SST and withholding-tax handling on lines | Off |
| `ENABLE_CUSTOM_STATUS_HDR_1..5`, `ENABLE_CUSTOM_STATUS_LINE_1..5` | Show custom status fields on header / lines | Off |
| `SHOW_BUDGET`, `DISABLE_LINES_FOLLOWING_HDR_BUDGET` | Show budget on lines; stop lines inheriting the header budget | Off |

#### Application Settings — Account tab

| Setting | What it controls | Default |
|---|---|---|
| `ENABLE_BRANCH_FILTER` | Restricts supplier search to the invoice's branch | Off |
| `ENABLE_SELECT_MODE` | Supplier picker opens in select mode | Off |
| `ALLOW_DIFFERENT_PAYEE_THAN_SELECTED_ENTITY` | Lets the payee differ from the selected supplier | Off |
| `HIDE_ENTITY_BRANCH` | Hides the supplier branch selector | Off |
| `HIDE_ENTITY_DETAILS_CURRENCY/STATUS/IDENTITY_TYPE/DESCRIPTION/TYPE/ID_NUMBER/EMAIL/PHONE_NUMBER` | Hide fields on *Entity Details* | Off |
| `HIDE_SUPPLIER_CODE`, `HIDE_EMAIL`, `HIDE_PHONE_NUMBER` | Hide supplier code / contact fields | Off |
| `HIDE_SUPPLIER_CATEGORY_TAB`, `HIDE_SUPPLIER_LOGIN_TAB`, `HIDE_SUPPLIER_PAYMENT_CONFIG_TAB` | Hide tabs of the inline supplier form | Off |
| `HIDE_BILL_TO_TAB`, `HIDE_INTERCOMPANY_TAB` | Hide the *Bill To* / *Intercompany* sub-tabs | Off |
| `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT` | Hide contact blocks on Bill To / Ship To | Off |
| `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION` | Hides the e-Invoice classification fields | Off |

#### Application Settings — Line Items

| Setting | What it controls | Default |
|---|---|---|
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX` | Hide standard-price columns | Off |
| `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX` | Hide net / transaction price columns | Off |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_MULTI_DISCOUNT` | Hide discount columns and the multi-discount sub-tab | Off |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | Hide quantity / UOM columns | Off |
| `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TOTAL_TXN_AMOUNT`, `HIDE_SST_VAT_GST_AMOUNT` | Hide amount columns and totals | Off |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Hide the tax / WHT code pickers on a line | Off |
| `HIDE_LAST_PURCHASE_PRICE`, `HIDE_LANDED_COST`, `HIDE_COSTING_DETAILS` | Hide last purchase price, landed cost and the *Costing Details* sub-tab (users with `SHOW_LAST_PURCHASE_PRICE` / `SHOW_COSTING_DETAILS` still see them) | Off |
| `HIDE_LINE_ITEMS_GL_CODE`, `HIDE_LINE_ITEMS_BRANCH` | Hide the per-line GL code and branch | Off |
| `HIDE_SERIAL_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BATCH_ISSUE_DATE`, `HIDE_BATCH_EXPIRY_DATE` | Hide tracking fields on *Item Details* | Off |
| `HIDE_ISSUE_LINK`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT`, `HIDE_DOC_LINK`, `HIDE_RELATED_DOCUMENTS`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_TRIPS`, `HIDE_CHILD_ITEMS_TAB`, `HIDE_ATTACHMENT_TAB` | Hide line-level sub-tabs | Off |
| `ENABLE_EDITING_UNIT_PRICE_STD` | Lets users overwrite the standard unit price | Off |
| `DISABLE_EDITING_AMOUNT_TXN` | Locks the line amount (gated by `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`) | Off |
| `DISALLOW_LINE_ITEM_EDIT`, `DISABLE_LINE_ITEM_NAME_EDIT` | Make lines, or just the item name, read-only | Off |
| `ENABLE_ITEM_NAME_MAX_LIMIT`, `ITEM_NAME_MAX_LIMIT` | Cap the item name length | Off |
| `DEFAULT_ITEM_SEARCH_ITEM_TYPE` | Item types offered in the line-item search | none |

#### Application Settings — tabs, payment and contra

| Setting | What it controls | Default |
|---|---|---|
| `HIDE_E_INVOICE_TAB`, `HIDE_KO_FOR_TAB`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_POSTING_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_SETTLEMENT_TAB` | Remove a tab from the edit form | Off |
| `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO` | Hide one direction on the Doc Link tab | Off |
| `ENABLE_MULTIPLE_KO` | Allow knocking off more than one source document into one invoice | Off |
| `ENABLE_EDIT_PAYMENT_DATE`, `ENABLE_EDIT_SETTLEMENT_DATE` | Allow the payment / settlement date to differ from today | Off |
| `EDIT_CONTRA_TXN_DATE` | Allow editing the contra transaction date | Off |
| `HIDE_CARD_NO`, `HIDE_NAME`, `HIDE_CARD_ISSUER`, `HIDE_CARD_EXPIRY`, `HIDE_APPROVAL_CODE`, `HIDE_BATCH`, `HIDE_CARD_TYPE`, `HIDE_CVV` and `MANDATORY_...` | Hide, or require, each card field on a card settlement | Off |
| `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_INVOICE_DATE`, `HIDE_OTHERS` | Hide reference fields on the payment line | Off |
| `VERTICAL_ORIENTATION` | Replace horizontal tabs with a scrolling vertical layout | Off |
| `EXPAND_MAIN_DETAILS`, `EXPAND_E_INVOICE`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_KO_FOR`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_MAIN_ARAP`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT`, `EXPAND_MAIN_CONTRA`, `EXPAND_SETTLEMENT`, `EXPAND_POSTING`, `EXPAND_DELIVERY_TRIPS` | In vertical layout, open that panel by default | Off |

#### Knock Off settings

Eight switches decide which document types can be knocked off. `KNOCK_OFF_BY_PURCHASE_GRN / PURCHASE_ORDER / PURCHASE_REQUISITION / SUPPLIER_DELIVERY_ORDER` control the *KO By* direction and `KNOCK_OFF_FOR_...` the *KO For* direction. The screen exists at *settings/knock-off-settings* but its menu entry is commented out in the current build, so it is reachable only by URL; the *KO For* tab itself offers Purchase GRN and Purchase Order.

#### Branch Settings

Per-branch overrides, one record per branch, with six tabs:

| Tab | What you set |
|---|---|
| Branch Details | Branch code, name, company (read-only) and **Rounding Five Cent** for this branch |
| Item Category Filter | Item categories offered in the line-item search for this branch |
| Menu List | Which applet menu items users of this branch see |
| Pricing Scheme | Pricing schemes with *Level* and *Priority* used to resolve standard prices |
| Printable Format | Default printable with branch-specific Header, Footer and Remarks |
| Default Settlement Method | Settlement methods (each backed by a cashbook) available on the Payment tab, and the default |

#### Printable Format Settings

Create a format with **Format Code** and **Format Name**; the layout is a Jasper template maintained by BigLedger. The branch default is chosen in Branch Settings.

### Document behaviour settings

| Behaviour | Controlled by |
|---|---|
| Which date is stamped as the transaction date at FINAL | `DATE_TXN_LOGIC` (Default Selection) |
| Print automatically after Create / FINAL | `ENABLE_AUTO_POPUP` + `PRINTABLE` |
| Duplicate supplier-invoice-number warning | `ENABLE_DUPLICATE_REFERENCE_CHECK` |
| Self-billed e-Invoice | Supplier profile *E-Invoice Self-Bill*, or the **SELF-BILLED** button on the draft; stored on the header as `einvoice_self_billed` |
| Ability to VOID | `HIDE_GENDOC_VOID_BUTTON` / `SHOW_GENDOC_VOID_BUTTON`; VOID is always hidden once the company's e-Invoice status is `ENABLED` |
| Exchange-rate locking | `CANNOT_EDIT_CURRENCY_RATE`, overridden by the `EDIT_CURRENCY_RATE` permission |
| Webhooks on document events | *Settings > Webhook* |

Approval workflow: not configurable in this applet. Use the [Workflow Design Applet](/applets/master-data/workflow-design-applet/) if you need approval steps before FINAL.

### Feature visibility / permissions

Client-side permission definitions (registry table `bl_applet_client_side_perm_dfn`, applet `internal_purchase_invoice_applet`) grant a user, team or role an exception to a `HIDE_...` setting. The ones with an effect beyond a plain `SHOW_` mirror of a setting:

| Permission | Effect |
|---|---|
| `SHOW_FILE_IMPORT_MENU`, `SHOW_FILE_EXPORT_MENU` | Restore the File Import / File Export menus for this user even when hidden tenant-wide |
| `SHOW_INTERCOMPANY_PI_SCREEN` | Shows the Intercompany screen |
| `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_SAVE_BUTTON`, `SHOW_PRINT_BUTTON`, `SHOW_CLOSE_BUTTON`, `SHOW_SEND_EMAIL_BUTTON` | Restore a hidden action button |
| `HIDE_PRICE`, `INTERNAL_PURCHASE_INVOICE_DISPLAY_PRICING` | Hide, or show, all pricing fields for this user |
| `IPI_HIDE_TRACKING_ID_AND_PERMIT_NO` | Hides Tracking ID and Permit No |
| `EDIT_CURRENCY_RATE` | Lets the user edit the exchange rate when `CANNOT_EDIT_CURRENCY_RATE` is on |
| `DISABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Exempts the user from Purchaser auto-fill |
| `HIDE_DRAFT_BUTTON`, `HIDE_CUSTOM_DOC_NO`, `HIDE_DELIVERY_LOCATION`, `HIDE_FOREX_DATA_SOURCE`, `HIDE_EMAIL_PAYMENT_URL_BUTTON` | Hide for this user only |
| `SHOW_VALIDITY_DATE`, `REQUIRE_VALIDITY_DATE` | Show, or require, a validity date |
| `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` | Exposes the `DISABLE_EDITING_AMOUNT_TXN` switch in Application Settings |
| `SHOW_...` for every hideable header, line and card field (`SHOW_REFERENCE`, `SHOW_REMARKS`, `SHOW_CURRENCY`, `SHOW_UNIT_PRICE_TXN`, `SHOW_QTY_BASE`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_DOC_NO_TENANT`, `SHOW_CLIENT_DOC_1..5`, …) | Restore that field for this user |

Server-side API permissions are listed under *Before you can use it*. Read/Create/Update/Delete are branch-targeted, so a user can be limited to invoices of specific branches.

## Fields

### Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Branch | Buying branch | Yes | Drives numbering, permissions and Branch Settings |
| Location | Stock location that receives the goods | Yes | Defaults from the branch `MAIN_LOCATION` |
| Doc No (Tenant / Company / Branch) | System running numbers | Generated | Read-only after save |
| Custom Document Number | Free-form number | No | Only with `SHOW_CUSTOM_DOC_NO` |
| Doc Short Code, Client Doc Short Code, Client Doc 1–5 No | Client-side references | No | Hideable individually |
| Source Doc No (Tenant), Source Doc Short Code | Populated by knock-off | No | Read-only |
| Transaction Date | Invoice date | Yes (defaults to today) | May be overwritten at FINAL by `DATE_TXN_LOGIC` |
| Due Date | Payment due date | No | Derived from Credit Terms |
| Doc Reference Date | Date on the supplier's document | No | Editable only with `ALLOW_EDITING_DOC_REF_DATE` |
| Reference | Supplier's invoice number | Only with `MANDATORY_REFERENCE` | Duplicate warning with `ENABLE_DUPLICATE_REFERENCE_CHECK`; shown on AP reports |
| Purchaser | Buying employee | Yes (marked with an asterisk) | Auto-filled with `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` |
| Base Currency / Currency / Rate | Transaction currency and exchange rate | Yes | A zero rate is rejected: *The currency rate cannot be ZERO.* |
| Credit Terms, Credit Limit | Copied from the supplier | No | Read-only |
| External Quotation / Order / Delivery Order / Invoice / Others and their dates | Supplier-side references | Per `MANDATORY_...` | |
| Tracking ID, Permit No | Logistics references | No | |
| Remarks, External Remarks | Internal and printed notes | No | Remarks become the description of the journal's creditor line |
| Delivery Branch / Location | Where goods are delivered | No | Requires `..._DELIVERY_BRANCH_READ` permission to list |

### Account

Entity Details (supplier code, name, type, identity type and number, currency, status, description, email, phone), Bill To and Ship To addresses and contacts, and Intercompany (target company when billing a sister company). Switch the toggle to *Create* to add a supplier without leaving the invoice.

### Line Items

| Sub-tab | Fields |
|---|---|
| Item Details | Item code and name, quantity (base and UOM), UOM-to-base ratio, serial numbers, bin, batch number / issue / expiry, item remarks, item reference |
| Pricing Details | Standard unit price (pricing scheme, incl./excl. tax, per UOM), unit discount, net unit price, transaction unit price, tax code, WHT code, amounts (standard, discount, net, tax, transaction), multi-discount |
| Costing Details | Landed cost, last purchase price and cost breakdown |
| Issue Link | Link the line to an issue-tracker ticket |

Each line also carries an optional GL code, branch, department fields and delivery instruction. Header adjustment, group discount and rounding lines are generated by the applet, not keyed.

### Payment

Settlement method (from Branch Settings), amount, payment date (editable only with `ENABLE_EDIT_PAYMENT_DATE`), reference fields (quotation, order, delivery order, invoice, invoice date, others) and — for card methods — card number, name, issuer, expiry, approval code, batch, card type, CVV as configured.

## Lifecycle and posting

A purchase invoice has a document status (`TEMP` while the create form is open, then `ACTIVE`) and a posting status:

| Posting status | Meaning | Allowed next step |
|---|---|---|
| `DRAFT` | Saved, editable, nothing posted | FINAL, DISCARD, edit |
| `FINAL` | Posted and locked | VOID (subject to the conditions below), Payment, Contra, Purchase Return, Credit/Debit Note |
| `VOID` | Reversed | none |

**FINAL is enabled only when** the header form is valid, a supplier is selected and valid, there is at least one line, no serial number is duplicated within the document, the document is `ACTIVE` and not locked by another process, and `HIDE_GENDOC_FINAL_BUTTON` is off (or the user holds `SHOW_FINAL_BUTTON`). The backend refuses a second FINAL with *Generic Document has already been posted to FINAL*.

**What FINAL does** (`GenericDocumentService.updatePostingStatusWithChecks` and `JournalPostingService`):

1. Stamps `date_finalized`, applies `DATE_TXN_LOGIC`, validates serial and batch numbers against stock (purchase lines fail if a serial already exists in the company).
2. Creates inventory transaction lines with a positive quantity signum (**stock in**) for every basic-item line, at the invoice's location, and updates the item's last purchase cost (`amount_net / qty_base`) on the company and location stock balances. This applies to directly keyed invoices and to invoices knocked off from a GRN alike — the standard GRN does not move stock.
3. Posts one journal:

| Journal line | Dr | Cr | GL code resolved from |
|---|---|---|---|
| Each item line (net of discount) | Net amount | | Line GL code → item's `PURCHASE` link → company default `PURCHASE` |
| Line tax | Tax amount | | Company default `INPUT_TAX` |
| Discount lines | | Discount | `PURCHASE_DISCOUNT` |
| Supplier | | Invoice total | `CREDITOR` for an `AP_TRADE` supplier, `CREDITOR_NON_TRADE` for `AP_OTHER`, `EMPLOYEE_OTHER_PAYABLE` for `AP_EMPLOYEE` |
| Forex difference on settlement | Loss | Gain | `FOREX_LOSS` / `FOREX_GAIN` |

4. Queues webhooks, membership-point processing and — when the header is self-billed and the company's e-Invoice status is `ENABLED` — the MyInvois submission.

The **Posting** tab shows five statuses (Journal, Inventory, Membership Points, Cashbook, Tax); **TraceDocument** shows the journal and inventory rows.

**VOID** is offered only on a `FINAL` document, when `HIDE_GENDOC_VOID_BUTTON` is off or the user has `SHOW_GENDOC_VOID_BUTTON`, and when the company's e-Invoice status is not `ENABLED`. It is refused with *The invoice has already been linked with a purchase return* if an active return link exists. VOID reverses the journal and inventory posting; to correct a finalised invoice under e-Invoice, raise a Purchase Credit Note or cancel through the e-Invoice portal within the LHDN window.

**Knock-off** writes a document link (`txn_type` knock-off, quantity signum −1 on the link) between the source and the invoice; a source that is fully knocked off no longer appears in *KO For*. A Purchase Return raised against the invoice writes a `RETURN` link that blocks VOID.

## Related applets

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) and [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the documents this applet knocks off; the GRN-to-invoice conversion is a backend converter, not a copy.
- [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/) and [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) — additional knock-off sources when enabled in Knock Off settings.
- [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) — the same document without the stock movement, for tenants that book stock on GRN Stock In.
- [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) — supplier-facing view of these invoices.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — settles several invoices at once; the invoice's own Payment tab settles one.
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/), [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — post-FINAL corrections.
- [Supplier Applet](/applets/master-data/supplier-applet-1/) — the entity, its AR/AP type and the self-billed flag.
- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/), [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/), [Cashbook Applet](/applets/master-data/cashbook-applet/), [Organisation Applet](/applets/master-data/organisation-applet/) — the master data FINAL and Payment depend on.
- [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) — where the posted journal is reviewed.
- [My E-invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) — submission and tracking of self-billed invoices.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` (or `CREDITOR_NON_TRADE`, `INPUT_TAX`, `PURCHASE`) | The company has no default GL code linked for that transaction code | Add the mapping in the Chart of Account applet's company default GL codes, then FINAL again |
| Journal shows a different supplier from the invoice | The journal's creditor line is taken from the supplier at FINAL time; the supplier on the document was changed afterwards by data fix or ETL | Re-post the journal for the document (support task) rather than editing the journal |
| Line posted to the generic `PURCHASE` account instead of the item's expense account | The item has no company GL-code link with transaction code `PURCHASE` and no GL code was chosen on the line | Set the item's purchase GL link (or `HIDE_LINE_ITEMS_GL_CODE` off and choose per line); existing documents need a journal re-post |
| Average cost drops towards zero after invoices | Lines with quantity > 0 but zero or blank amount post quantity without value into the moving-average chain | Never finalise a priced item at 0.00 unless it is genuinely free of charge; correct with a stock adjustment and re-key the value |
| FINAL rejected for serial numbers | A serial on the invoice already exists in the company (purchase lines add serials) or is duplicated within the document | Remove or correct the serial; the error lists the offending `snIds` |
| Same document number seen twice in the e-Invoice listing | A sales invoice and a self-billed purchase invoice share numeric ranges starting at 1000001 | Nothing was submitted twice; check the document type before cancelling anything |
| **VOID** button missing on a finalised invoice | Company e-Invoice status is `ENABLED`, or `HIDE_GENDOC_VOID_BUTTON` is on without `SHOW_GENDOC_VOID_BUTTON` | Raise a Purchase Credit Note, or cancel via the e-Invoice portal; otherwise grant the permission |
| *The invoice has already been linked with a purchase return* on VOID | An active Purchase Return references this invoice | Void the return first, or correct with a credit note |
| *The currency rate cannot be ZERO.* | Rate not fetched for the chosen currency | Enter the rate manually (needs `EDIT_CURRENCY_RATE` if rates are locked) or configure the currency in the Forex applet |
| *No Default Printable Selected* when printing | No printable format, or none set as branch default | Create one under Printable Format Settings and select it in Branch Settings |
| Source document not found on *KO For* | Source is still draft, already fully knocked off, or its type is switched off in Knock Off settings | Finalise the source; check remaining quantity; enable the type |
| File Import / File Export menu missing | `HIDE_FILE_IMPORT_MENU` / `HIDE_FILE_EXPORT_MENU` on | Grant `SHOW_FILE_IMPORT_MENU` / `SHOW_FILE_EXPORT_MENU` to the user or switch the setting off |
| Contra document listed twice | Contra listing pagination returned the same link on two pages (reported and closed in 2026) | Refresh the listing; verify on TraceDocument that the contra was posted once |
| Listing shows posting status DRAFT for invoices believed final | Documents were created by an ETL/migration in DRAFT and never finalised | Open each and FINAL it, or ask support to bulk-finalise |
| Duplicate invoice after migration | A migrated GRN was invoiced twice | Void the duplicate if possible; otherwise correct stock with a stock adjustment |
| User cannot open the applet at all | No `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_READ_TGT_GUID` for the branch | Grant read (and create/update) for the required branches under Permission Set |

## Related documentation

- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/) — PR → PO → GRN → Purchase Invoice → Payment
- [Direct invoice workflow](/guides/purchasing-guides/direct-invoice-workflow/) — invoicing without a GRN
- [Invoice-first workflow](/guides/purchasing-guides/invoice-first-workflow/)
- [Malaysia e-Invoice guide](/guides/einvoice-guides/malaysia-e-invoice-guide/) — self-billed submissions
- [Financial Accounting module](/modules-v2/financial-accounting/) and [Purchasing module](/modules-v2/purchasing/)
