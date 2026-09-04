---
title: "Purchase Debit Note (Internal)"
description: "Reference for the Purchase Debit Note (Internal) applet: the document you raise against a supplier to reduce what you owe them, its screens, every configuration switch, fields, posting rules and known failure modes."
applet_code: "internal_purchase_debit_note_applet"
applet_repo: "blg-applet-wavelet-internal-purchase-debit-note-applet"
modules: [purchasing, financial-accounting, e-invoice]
related_applets:
  - internal-purchase-invoice-applet
  - internal-purchase-credit-note-applet
  - internal-purchase-order-applet
  - internal-purchase-grn-applet
  - internal-purchase-return-applet
  - internal-payment-voucher-applet
  - internal-sales-debit-note-applet
  - creditor-report-applet
  - purchase-report-applet
  - chart-of-account-applet
  - doc-item-maintenance-applet
  - tax-configuration-applet
  - supplier-applet-1
  - organisation-applet
  - my-e-invoice-admin-applet
guides:
  - /guides/einvoice-guides/myinvois-setup/
  - /guides/einvoice-guides/einvoice-validation/
sources:
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/ui-navigation/applet-settings/applet-settings-navigation.config.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-listing/purchase-debit-note-listing.component.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-edit/purchase-debit-note-edit.component.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/line-item-add/item-details/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/app.component.ts
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseDebitNoteDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/purchase/PurchaseReportUow.java
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceConstants.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code internal_purchase_debit_note_applet)
tags:
- purchase-management
- intercompany
- debit-note
- financial-control
- internal-procurement
weight: 70
---

## Overview

The **Purchase Debit Note (Internal)** applet records a debit note that your company raises against a supplier. Finalising one **reduces the amount you owe that supplier**: the engine posts a debit to the supplier's payable account and a credit to the purchase (or the GL code chosen on each line), and the document then sits alongside payment vouchers as something that knocks off outstanding purchase invoices. Accounts-payable clerks open it after a purchase invoice has been posted and the supplier's balance needs to come down — an overcharge, a price correction, a short delivery, a rebate.

A short introduction to the applet:

{{< youtube lsNRnSRHHT8 >}}

It is one of the four purchase-side adjustment documents in the platform (`INTERNAL_PURCHASE_DEBIT_NOTE`, short code `PURDBN`). It carries amounts but never moves stock. It can be keyed manually, pulled from an existing purchase invoice through the **Search Document** tab, uploaded from a CSV through **File Import**, or created automatically by intercompany processing when a related company finalises a **Sales Debit Note (Internal)** against your company.

{{< callout type="warning" >}}
**Direction of the posting.** In BigLedger a *Purchase* Debit Note always posts **Dr Creditor / Cr Purchase** — it lowers the supplier's balance. If you need to record an *extra* charge from a supplier (their debit note to you, which raises what you owe), that is the [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) in this platform's naming, or a further purchase invoice. Check the Dr/Cr table under *Lifecycle and posting* before you choose.
{{< /callout >}}

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules-v2/purchasing/), [Financial Accounting](/modules-v2/financial-accounting/), [E-Invoice](/modules-v2/e-invoice/) | Purchase-side adjustment that posts to the General Ledger and is an e-Invoice purchase document type. |
| Upstream | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The invoice whose value is being reduced. The **Search Document → Purchase Invoice** tab copies its lines into the debit note and links the two. |
| Upstream (knock-off) | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | The create screen's **Import Knock-Off** panel lets a debit-note line knock off an open purchase-order or GRN line. |
| Upstream (intercompany) | [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) | When intercompany processing is set up between two companies in the tenant, finalising the seller's Sales Debit Note queues a Purchase Debit Note in the buyer's company (amount signum +1, quantity signum 0). |
| Downstream | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), the **Contra** tab | The debit note's open balance is consumed by contra against purchase invoices. The [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) treats `INTERNAL_PURCHASE_DEBIT_NOTE` and `INTERNAL_PAYMENT_VOUCHER` as the two settlement document types against purchase invoices. |
| Downstream | [Creditor Report](/applets/finance/creditor-report-applet/) | Shows the debit note's ARAP balance against the supplier. |
| Downstream | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | `INTERNAL_PURCHASE_DEBIT_NOTE` is in the platform's e-Invoice purchase-document set; the E-Invoice tab submits, cancels and tracks it. |
| Sibling | [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | The other purchase adjustment documents. Purchase Return also has amount signum +1 but moves stock; Purchase Credit Note has amount signum −1 (same side as an invoice). |

## Screens and menus

The applet's sidebar has three working menus plus **Settings** and **Personalization**:

| Menu | Route | What it is |
|---|---|---|
| **Purchase Debit Note** | `internal-purchase-debit-note` | The listing, with create / edit / bulk actions. |
| **Line Items** | `line-items` | A cross-document grid of every debit-note line, for analysis and line-level edits. |
| **File Import** | `debit-note-file-listing` | CSV upload that creates many debit notes at once. Hidden when the `HIDE_FILE_IMPORT_MENU` setting is on and the user lacks the `SHOW_FILE_IMPORT_MENU` client-side permission. |
| **Settings** | `settings/…` | Application Settings, Default Selection, Printable Format Settings, Branch Settings, Email Template, Webhook, Feature Visibility, Client Side Permission, Role Pricing Scheme Link, Permission Wizard / Permission Set / User / Team / Role Permission, Release Notes, Applet Log. |
| **Personalization** | `personalization/personal-default-selection` | Per-user Default Selection. |

### Listing

The listing shows documents filtered by the applet's default posting status and date window (see *Applet settings*). Open the hamburger icon for **Advanced Search**; its **Posting Status** multi-select is the only way to see DISCARDED drafts.

{{< figure src="/images/internal-purchase-debit-note-applet/advanced-search-trigger.png" alt="Listing toolbar with the hamburger icon highlighted - clicking it opens the Advanced Search panel" caption="Advanced Search trigger on the listing toolbar." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/advanced-search-posting-status-filter.png" alt="Advanced Search panel scrolled to the Posting Status multi-select filter showing DRAFT, FINAL, VOID, and DISCARDED options" caption="Advanced Search — Posting Status filter. Tick DISCARDED to surface abandoned drafts." >}}

### Bulk actions on the listing

{{< figure src="/images/internal-purchase-debit-note-applet/bulk-actions-toolbar.png" alt="Listing page bulk action toolbar showing the FINAL, DISCARD, VOID, SINGLE/MULTIPLE PRINT, SELF-BILLED, and SEND EMAIL buttons above the document grid" caption="Bulk actions toolbar above the listing grid. Select rows first." >}}

| Button | What it does | When it is disabled |
|---|---|---|
| **FINAL** | Posts every selected DRAFT (journal, ARAP, queues). | No row selected, or a selected row is not DRAFT. |
| **DISCARD** | Sets every selected DRAFT to DISCARDED. No GL impact. Confirmation dialog. | No row selected, or a selected row is not DRAFT. |
| **VOID** | Reverses every selected FINAL document. Confirmation dialog. | No row selected, or a selected row is not FINAL. |
| **SINGLE/MULTIPLE PRINT** | Generates PDFs of the selection with the default printable format. | The applet setting `PRINTABLE` (default printable format) is not set. |
| **SELF-BILLED** | Sets `einvoice_self_billed = true` on the selection so the e-Invoice is submitted as a self-billed document. | No row selected. |
| **SEND EMAIL** | Emails PDFs of the selection using the Email Template, Recipient Email and CC List fields on the same row. | The applet setting `HIDE_SEND_EMAIL_BUTTON` is on (hides the button and its three fields). |

{{< figure src="/images/internal-purchase-debit-note-applet/send-email-dropdown.png" alt="SEND EMAIL inline row showing the SEND EMAIL button, Email Template dropdown opened with a searchable template list, Recipient Email dropdown, and CC List text field - all on a single toolbar row" caption="SEND EMAIL row — Email Template, Recipient Email (Billing and Shipping / Billing only / Shipping only) and CC List." >}}

Documents are grouped by recipient address; a document with no address for the chosen recipient type is skipped and reported. The template list is **applet-local** — it comes from this applet's *Settings → Email Template*.

### Create / edit form

The form is a set of tabs (or stacked panels when `VERTICAL_ORIENTATION` is on). Their order is set in *Settings → Default Selection → Details Tab Ordering*.

| Tab | Purpose |
|---|---|
| **Search Document** | Find a FINAL purchase invoice for the same supplier and pull its lines in. Creates a document link (`INTERNAL_PURCHASE_INVOICE` → `INTERNAL_PURCHASE_DEBIT_NOTE`). Hidden by `HIDE_SEARCH_BY_DOCUMENT_BUTTON`. |
| **Main Details** | Company, branch, location, purchaser, dates, currency and rate, references, external document references. |
| **E-Invoice** | Sub-tabs Submission, Progress, Notification, Cancellation, Matched History and (when `ENABLE_IMPORT_EXPORT` is on) Import/Export. Buttons: Submit, Send, Request for Rejection, Pushback to Queues, Export, Select From Another Supplier. |
| **Account** | Supplier (entity), entity branch, Bill To and Ship To addresses, contacts. |
| **Lines** | Line items with pricing, tax, WHT, department tags, costing details; **Import Knock-Off** against Purchase Order or Purchase GRN lines. |
| **ARAP** | Product-and-services amount, settlement, contra, document open and balance for this document. |
| **Payment** | Settlement lines (settlement method, amount, date). |
| **Department Hdr** | Header-level segment, dimension, profit centre, project. |
| **Trace Document** | Journal, cashbook, tax and inventory transactions the posting created. |
| **Contra** | Offset this debit note against the supplier's outstanding purchase invoices. |
| **Doc Link** | Links to and from other documents. |
| **Attachment** | Uploaded supporting files. |
| **Export** | Print the document with a printable format. |

{{< figure src="/images/internal-purchase-debit-note-applet/main-details.png" alt="Purchase Debit Note Main Details" caption="Main Details tab." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/account-tab.png" alt="Purchase Debit Note Account Tab" caption="Account tab — supplier and entity branch." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/bill-to-address.png" alt="Bill To Address" caption="Account → Bill To address." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/ship-to-address.png" alt="Ship To Address" caption="Account → Ship To address." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/lines-tab.png" alt="Purchase Debit Note Lines Tab" caption="Lines tab." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/arap-tab.png" alt="Purchase Debit Note ARAP Tab" caption="ARAP tab — amounts, settlement, contra and balance for this document." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/trace-document-tab.png" alt="Purchase Debit Note Trace Document Tab" caption="Trace Document tab — the journal and sub-ledger transactions behind a FINAL document." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/einvoice-attachments-export.png" alt="E-Invoice tab showing the submission status of this Purchase Debit Note to the government tax portal" caption="E-Invoice tab — submission status, UUID and validation results from the tax authority." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/attachments-tab.png" alt="Attachments tab listing supporting files uploaded against this Purchase Debit Note" caption="Attachment tab." >}}

### File Import

**File Import** creates many debit notes from one CSV. Download **Sample Format for Purchase Debit Note**, fill it, choose the delimiter, drop the file and click **ADD**. Open the import record and use the **Checking** tab to see one grid row per CSV row; rows with a validation error are highlighted and the message lands in the paired *… Validation Error* column. Filter that column to see errors only. The **Main** tab shows file name, size, format, process status and any top-level error.

{{< figure src="/images/internal-purchase-debit-note-applet/file-import-upload-screen.png" alt="File Import upload screen showing the Sample Format for Purchase Debit Note download link, the Delimiter selector, and the file drag-and-drop area" caption="File Import — upload screen." >}}

{{< figure src="/images/internal-purchase-debit-note-applet/file-import-checking-tab.png" alt="File Import Checking tab grid showing one imported row per CSV row, with error rows highlighted in red and a Validation Error column on the left" caption="File Import — Checking tab." >}}

The CSV carries header columns repeated on every line of the same document (branch, location, purchaser, transaction number and date, reference, credit terms, description, remarks, currency, tracking ID, entity code, billing and shipping name/email/phone/address, supplier TIN and e-Invoice identity fields, segment / dimension / profit centre / project, GL code, settlement amount and remarks) and line columns (item reference number, transaction type, quantity, UOM, amount and unit price including tax, GST and WHT code and %, batch, bin, tracking ID, serial number, posting status). Common rejections: an unknown branch, location, entity, item or tax code; a blank or non-numeric amount; a posting status that is not `DRAFT`, `FINAL`, `VOID` or `DISCARDED`; and — since the wrong-column check was added to the importer — a column header that does not match the sample.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Company, branch and location are the three required header fields. Branch `MAIN_LOCATION` fills the default location. |
| Supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) | The Account tab selects an entity flagged as supplier; its AR/AP object type decides whether the posting goes to `CREDITOR` (trade) or `CREDITOR_NON_TRADE`. |
| Company default GL codes | [Chart of Account](/applets/master-data/chart-of-account-applet/) → company GL-code links | Posting needs `CREDITOR` (or `CREDITOR_NON_TRADE`) and, for lines without their own GL code, `PURCHASE`; tax lines need `INPUT_TAX`. A missing creditor mapping aborts FINAL with `MISSING_DEFAULT_GL_CODE`. |
| Items with a purchase GL code | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Each line is an item. A `PNS` line takes its GL code from the header GL code, else the item-company link for `PURCHASE`, else the company default. |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | GST/SST and WHT codes on lines. Hidden when `HIDE_TAX_CONFIG_SELECTION` / `HIDE_WHT_CONFIG_SELECTION` are on. |
| Cashbook / settlement methods | [Cashbook](/applets/master-data/cashbook-applet/) | Only if you record a settlement on the Payment tab: a settlement-method item must map to a cashbook with a GL code, else FINAL fails with `MISSING_CASHBOOK` / `MISSING_GL_CODE`. |
| Fiscal period open | [General Ledger](/applets/finance/general-ledger-applet/) | FINAL is refused with *The selected date falls within a locked fiscal period* when the transaction date is in a `LOCK_ALL` / `LOCK_TXN` period. |
| e-Invoice setup | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Needed only if the document must be submitted to the tax authority. Skip flags on the document, branch or supplier bypass submission. |
| Permissions | This applet → Settings → Permission Wizard / Client Side Permission | Server-side create/read/update/delete on `INTERNAL_PURCHASE_DEBIT_NOTE`; client-side switches listed below. |

### Applet settings

**Settings → Default Selection** (`default-selection`) has two panels:

| Setting | What it controls | Default | Effect when changed | Who can change it |
|---|---|---|---|---|
| `DEFAULT_BRANCH` | Branch pre-selected on new documents. Selecting it also stores `DEFAULT_COMPANY` (the branch's company) and `DEFAULT_LOCATION` (the branch's `MAIN_LOCATION`). | none | New documents open with these values; users with a personal default override it. | Tenant admin with access to the applet's Settings menu |
| `DEFAULT_LOCATION` | Location pre-selected on new documents. | none | As above. | Same |
| `PURCHASE_DEBIT_NOTE_DETAILS_TAB_ORDER` | Drag-and-drop order of the form tabs (Search Document, Main Details, E-Invoice, Account, Lines, ARAP, Payment, Department Hdr, Trace Document, Contra, Doc Link, Attachment, Export). | code order | Tabs re-order for everyone; tabs added by a later release are appended. | Same |

**Settings → Application Settings** (`field-settings`) is the shared field-configuration screen. Its toggles are labelled by their key. Every toggle defaults to *off* (unset). The keys the applet reads, by group:

| Group | Keys | What they control |
|---|---|---|
| Listing defaults | `DEFAULT_POSTING_STATUS` (DRAFT / FINAL / VOID / DISCARDED / ALL), `DEFAULT_STATUS`, `DEFAULT_TRANSACTION_DATE` (`1_day` / `1_week` / none), `SORT_ORDER` (defaults to `updated_date`), `FUZZY_SEARCH_COLUMNS`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_REFERENCE_MAIN_LISTING`, `HIDE_REMARKS_MAIN_LISTING`, `HIDE_REFERENCE_MAIN_LISTING`, `DISABLE_GEN_DOC_LISTING`, `ENABLE_FILTER_BY_TODAYS_TXN` | Which documents the listing loads by default, how it sorts and which columns the fuzzy search box scans. `DISABLE_GEN_DOC_LISTING` stops the initial auto-load so users must search. |
| Menus and buttons | `HIDE_FILE_IMPORT_MENU`, `HIDE_SEND_EMAIL_BUTTON`, `HIDE_SEARCH_BY_DOCUMENT_BUTTON`, `HIDE_CLONE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON`, `ENABLE_AUTO_POPUP`, `PRINTABLE` | Hide a menu or button for everyone unless a matching `SHOW_…` client-side permission gives it back to a user. `ENABLE_AUTO_POPUP` opens the printable PDF in a new tab after FINAL (needs `PRINTABLE`). `PRINTABLE` is the default printable-format GUID, set from Printable Format Settings. |
| Header fields | `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY`, `HIDE_CREDIT_TERMS`, `HIDE_REMARKS`, `HIDE_REFERENCE`, `HIDE_DESCRIPTION`, `HIDE_SERVER_DOC_1..3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1..5`, `SHOW_CUSTOM_DOC_NO`, `SHOW_FOREX_DATA_SOURCE`, `CANNOT_EDIT_CURRENCY_RATE`, `ENABLE_DUPLICATE_REFERENCE_CHECK`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Field visibility on Main Details. `SHOW_FOREX_DATA_SOURCE` swaps the free currency/rate pair for a forex-source selector; `CANNOT_EDIT_CURRENCY_RATE` locks the rate; `ENABLE_DUPLICATE_REFERENCE_CHECK` warns when the reference already exists on another debit note; `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` fills Purchaser from the logged-in employee. |
| External Documents (panel shown only for this applet) | `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_OTHERS` and their `MANDATORY_…` / `MANDATORY_…_DATE` pairs | The five external reference number + date pairs on Main Details (`xtn_doc_ref_1..5`). Mandatory flags add a required validator. |
| Account tab | `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT`, `HIDE_SUPPLIER_CODE`, `HIDE_PHONE_NUMBER`, `HIDE_EMAIL`, `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION`, `HIDE_E_INVOICE_TAB`, `DEFAULT_CURRENCY` | Fields shown in the supplier picker and inline supplier edit. |
| Line fields | `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_*`, `HIDE_UNIT_PRICE_NET_*`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LINE_ITEMS_GL_CODE`, `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_ISSUE_LINK`, `HIDE_DOC_LINK`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_SERIAL_NUMBER`, `HIDE_DEPARTMENT`, `ENABLE_EDITING_UNIT_PRICE_STD`, `DISABLE_EDITING_AMOUNT_TXN`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT`, `DISABLE_ITEM_LISTING` | Which price, quantity, tax and sub-panel controls appear on a line. `ENABLE_EDITING_UNIT_PRICE_STD` makes the standard unit price editable; `DISABLE_EDITING_AMOUNT_TXN` locks the transaction amount; `DISABLE_ITEM_LISTING` stops the item picker auto-loading. |
| Knock-off | `HIDE_KO_FOR_TAB`, `HIDE_KO_BY_PURCHASE_ORDER`, `HIDE_KO_FOR_PURCHASE_ORDER`, `HIDE_KO_BY_GRN`, `HIDE_KO_FOR_GRN` | Whether lines can knock off purchase-order and GRN lines, and which direction is offered. |
| Department tags | `ENABLE_SEGMENT` / `ENABLE_DIMENSION` / `ENABLE_PROFIT_CENTER` / `ENABLE_PROJECT`, `INCLUDE_…`, `HIDE_…`, `MANDATORY_…` for segment, dimension, profit centre, project; `ENABLE_SST`, `ENABLE_WHT`, `INCLUDE_SST`, `INCLUDE_WHT` | Show, require or hide each accounting dimension on header and lines. |
| Tabs | `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_SETTLEMENT_TAB`, `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Remove whole tabs, or individual ARAP figures. |
| Layout | `VERTICAL_ORIENTATION`, `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN`, `EXPAND_MAIN_DETAILS`, `EXPAND_E_INVOICE`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_KO_FOR`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_MAIN_ARAP`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT`, `EXPAND_MAIN_CONTRA`, `EXPAND_SETTLEMENT`, `EXPAND_POSTING`, `EXPAND_DELIVERY_TRIPS` | Tabs versus stacked expansion panels, and which panels open expanded. |
| Payment / contra | `ENABLE_EDIT_PAYMENT_DATE`, `EDIT_CONTRA_TXN_DATE` | Allow the settlement date or contra date to differ from the document date. |
| Custom status | `ENABLE_CUSTOM_STATUS_1..5`, `ENABLE_CUSTOM_STATUS_HDR_1..5`, `ENABLE_CUSTOM_STATUS_LINE_1..5` | Expose the five free custom-status fields at header and line level. |
| e-Invoice | `ENABLE_IMPORT_EXPORT` | Adds the Import/Export sub-tab to the E-Invoice tab. |

### Document behaviour settings

| Behaviour | Where it is set | Notes |
|---|---|---|
| Posting status on create | Not configurable — new documents are DRAFT. `DEFAULT_POSTING_STATUS` only filters the listing. | |
| Transaction date on FINAL | The FINAL request's `date_txn_logic` (`USE_FINAL`, `USE_CREATED`, `USE_UPDATED`) applies only when the header's *use transaction date* flag is off. | Backend rule, no applet toggle. |
| Printable formats | *Settings → Printable Format Settings* (Format Code, Format Name, uploaded Jasper template). One is marked default and stored as `PRINTABLE`. *Branch Settings → Printable Format* overrides it per branch. | Required for SINGLE/MULTIPLE PRINT, SEND EMAIL and `ENABLE_AUTO_POPUP`. |
| Email templates | *Settings → Email Template* — Printable Format, Template Code (dropdown label **and** email subject), Template (body). | Applet-local. |
| Approval workflow | Not configurable in this applet. | The workflow fields on the document (`xtn_process_*`) are validated by the backend but the applet has no approval screen. |
| e-Invoice submission | E-Invoice tab → Submission; `skip_einvoice` on the document, on the branch or on the supplier bypasses the queue; SELF-BILLED on the listing sets `einvoice_self_billed`. | Purchase documents are submitted with the supplier as issuer; use *Select From Another Supplier* to correct issuer details. |
| Webhooks | *Settings → Webhook* (shared component). | Fires on document events. |

{{< figure src="/images/internal-purchase-debit-note-applet/email-template-settings.png" alt="Email Template settings screen showing the list of templates that are available in this applet's SEND EMAIL dropdown" caption="Settings → Email Template." >}}

### Branch settings

{{< figure src="/images/internal-purchase-debit-note-applet/branch-settings.png" alt="Branch Settings screen showing the listing of branches and the per-branch configuration panel" caption="Settings → Branch Settings — pick a branch on the left." >}}

| Sub-tab | What it controls |
|---|---|
| **Branch Details** | Read-only Branch Name, Branch Code, Company; **Sales Agent** (default purchaser for the branch); **Rounding Five Cent** with a rounding item; **Group Discount Item** used for header-level discounts. |
| **Default Settlement Method** | Settlement method pre-selected on the Payment tab for this branch. |
| **Item Category Filter** | Item categories the line picker offers at this branch. |
| **Menu List** | Sidebar menus shown to users at this branch. |
| **Pricing Scheme** | Pricing schemes used to derive line prices at this branch (also linkable to roles under *Role Pricing Scheme Link*). |
| **Printable Format** | Branch default printable format, overriding `PRINTABLE`. |

### Feature visibility / permissions

Server-side, every call is gated by the `INTERNAL_PURCHASE_DEBIT_NOTE` create / read / update / delete permissions with a target (company, branch, location, supplier …) assigned through *Permission Wizard* or *Permission Set*.

Client-side permissions defined for this applet in the platform registry (assign under *Settings → Client Side Permission*):

| Permission code | Effect |
|---|---|
| `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH` | Show the tenant-, company- and branch-level document numbers on Main Details. |
| `SHOW_TRANSACTION_DATE` | Show the transaction date. |
| `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1..5` | Show the client document type and reference fields. |
| `IPDN_HIDE_TRACKING_ID_AND_PERMIT_NO` | Hide Tracking ID and Permit No for the holder. |
| `INTERNAL_PURCHASE_DEBIT_NOTE_DISPLAY_PRICING` | Show pricing details on lines. |
| `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO` | Quantity columns on lines. |
| `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX` | Unit-price columns on lines. |
| `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX` | Discount columns. |
| `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN` | Amount columns. |
| `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION` | Tax and WHT selectors. |
| `SHOW_COSTING_DETAILS` | Costing sub-panel on lines. |
| `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` | Lets the holder see the *Disable editing amount* switch. |

The applet code also checks `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_CLONE_BUTTON` and `SHOW_FILE_IMPORT_MENU` — each re-enables a button or menu that the matching `HIDE_…` applet setting removed. These five are not seeded in the registry for this applet; create them under *Client Side Permission* before assigning.

*Settings → Feature Visibility* (shared) can hide menus per team.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Company | Legal entity that owns the document. | Yes | Filled from the branch. Drives GL-code lookup and fiscal-period lock. |
| Branch | Branch recording the liability reduction. | Yes | Default from `DEFAULT_BRANCH` or personal default. |
| Location | Stock location on the header. | Yes | Default from the branch's `MAIN_LOCATION`. No stock movement is posted. |
| Purchaser | Employee responsible. | No | Auto-filled when `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` is on; branch default from *Branch Settings → Sales Agent*. |
| Tenant / Company / Branch Doc No | Three running numbers. | System | Assigned on save/FINAL; shown per `SHOW_DOC_NO_*` permission. `SHOW_CUSTOM_DOC_NO` exposes a custom number field. |
| Transaction Date | Accounting date. | Yes | Must be in an open fiscal period at FINAL. |
| Credit Terms | Supplier terms in days. | No | Hidden by `HIDE_CREDIT_TERMS`. |
| Reference, Remarks, Description | Free text. | No | Duplicate reference warning when `ENABLE_DUPLICATE_REFERENCE_CHECK` is on. |
| Permit No, Tracking ID | Statutory / logistics references. | No | Hidden by settings or `IPDN_HIDE_TRACKING_ID_AND_PERMIT_NO`. |
| Currency, Base Currency, Currency Rate, Forex Source | Document currency and rate. | Currency yes | Rate locked by `CANNOT_EDIT_CURRENCY_RATE` and after FINAL. A rate that does not match the forex source is rejected at FINAL. |
| Server Doc 1–3 | Platform document numbers. | System | Hidden by `HIDE_SERVER_DOC_*`. |
| Client Doc Type, Client Doc 1–5 | Supplier's own document references. | No | Shown per `SHOW_CLIENT_DOC_*` permission. |
| External Documents (Quotation, Order, Delivery Order, Invoice, Others) + dates | Five reference/date pairs. | Per `MANDATORY_…` settings | Panel shown only for this applet in Application Settings. |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity (Supplier) | Supplier being debited. | Yes at FINAL | Must be an entity with `is_supplier`; its AR/AP object type selects `CREDITOR` vs `CREDITOR_NON_TRADE`. Entity `skip_einvoice` bypasses e-Invoice. |
| Entity Branch | Supplier branch. | No | Validated against the entity. |
| Bill To / Ship To | Name, email, phone, address lines, country, state, city, postcode. | No | Billing / shipping email feed SEND EMAIL. |
| E-Invoice identity | TIN, ID type, ID number, SST number. | For e-Invoice only | Editable inline; *Select From Another Supplier* copies from another entity. |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | Item or GL-code item. | Yes | `GL_CODE` items skip the numeric validators below. |
| Quantity | Units. | Yes | Minimum 1. Quantity signum is 0 — no stock movement. |
| UOM, UOM ratio | Unit of measure. | No | |
| Unit price (std / txn / net, incl. and excl. tax, per UOM) | Pricing. | Net and transaction amounts required for non-GL items | Minimum 0. Standard price editable only with `ENABLE_EDITING_UNIT_PRICE_STD`; transaction amount locked by `DISABLE_EDITING_AMOUNT_TXN`. |
| Unit discount, discount amount | Line discount. | No | |
| Tax code, tax %, tax amount | GST/SST. | No | Tax % ≥ 0. Posts to `INPUT_TAX`. |
| WHT code, WHT %, WHT amount | Withholding tax. | No | WHT % ≥ 0. |
| Branch (line) | Branch for the journal line. | Yes | Defaults to header branch. |
| Segment, Dimension, Profit Centre, Project | Accounting tags. | Per `MANDATORY_…` | Fall back to header values on the journal. |
| GL code (line) | Overrides the purchase GL code. | No | Hidden by `HIDE_LINE_ITEMS_GL_CODE`. |
| Batch, Bin, Serial, Tracking ID | Stock references. | No | Validated for quantity consistency at FINAL. |
| e-Invoice classification, tax type, UOM, tariff code, country of origin | e-Invoice line data. | For e-Invoice only | |
| Remarks | Line text. | No | Becomes the journal line description. |

### Payment, Department Hdr, Contra

| Tab | Fields | Notes |
|---|---|---|
| Payment | Settlement method, amount, date, remarks. | Date editable only with `ENABLE_EDIT_PAYMENT_DATE`. Amount above the outstanding balance is rejected (*Payment Exceeds Outstanding*). |
| Department Hdr | Segment, Dimension, Profit Centre, Project. | Header defaults for every journal line. |
| Contra | Target purchase invoice, contra amount, date. | Date editable only with `EDIT_CONTRA_TXN_DATE`. |

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable. No journal, no ARAP. | FINAL, DISCARDED |
| **FINAL** | Posted. Header locked. | VOID |
| **VOID** | Reversed. Reason stored in `void_reason`. | none |
| **DISCARDED** | Abandoned draft. Hidden from the default listing. | none |

**On FINAL** the backend validates, then queues the posting:

1. Rejects if already FINAL (*Generic Document has already been posted to FINAL*).
2. Validates the forex rate, serial/batch/bin quantities, and the fiscal period (`FISCAL_PERIOD_LOCKED`).
3. If the document currency differs from the base currency, creates a **shadow** base-currency document and posts that (no separate job for the original).
4. Writes the journal below, fills ARAP amounts (`arap_pns_amount = +amount` on each `PNS` line), and drops the document into the generic-document queue, the message-template (email/notification) queue and, when not skipped, the e-Invoice queue.
5. If the document was created by intercompany processing, the link to the source Sales Debit Note is kept.

Journal per line (amount signum **+1**, `PURCHASE` handler):

| Account | Dr | Cr | Source of GL code |
|---|---|---|---|
| Creditor (`CREDITOR` or `CREDITOR_NON_TRADE`) | Net of all lines | | Company default GL-code link for the supplier's AR/AP type — mandatory. |
| Purchase / expense (`PURCHASE`) | | Line net amount | Header GL code → item-company `PURCHASE` link → company default `PURCHASE`. |
| Input tax (`INPUT_TAX`) | | Line tax amount | Company default `INPUT_TAX`. |
| Settlement method (cashbook GL) | | Payment amount | Cashbook of the settlement item (Payment tab only). |

Stock: none (quantity signum 0).

**On VOID** the void processor posts the reverse journal (a shadow document is voided with its original), the document is removed from the e-Invoice queue and from historical aging, and the reason is stored. A FINAL document that other documents link *from* (for example a payment voucher that already contra'd it) is not convertible to VOID (`checkIsGenDocConvertibletoVoid`); void the downstream document first.

**Contra and settlement** — the purchase report and the payment voucher treat a FINAL debit note like a payment: its positive ARAP balance is consumed by contra against purchase invoices of the same supplier and currency.

## Related applets

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the document being reduced; Search Document pulls its lines in.
- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — the opposite-sign adjustment (amount signum −1, increases the supplier balance).
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — same sign as this document but moves stock out.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) and [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — knock-off targets on the create screen.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — the other settlement document against purchase invoices.
- [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) — intercompany source that auto-creates this document in the buying company.
- [Creditor Report](/applets/finance/creditor-report-applet/) and [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) — where the balance and settlement show up.
- [Chart of Account](/applets/master-data/chart-of-account-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/) — master data it depends on.
- [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — e-Invoice queue and portal status for purchase documents.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` (or `CREDITOR_NON_TRADE`) | The company has no default GL-code link for the supplier's AR/AP type. | Add the link in Chart of Account → company default GL codes, then FINAL again. |
| FINAL fails with `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` | A settlement line uses a settlement-method item with no cashbook or a cashbook without a GL code. | Map the settlement item to a cashbook with a GL code, or remove the Payment line. |
| *The selected date falls within a locked fiscal period* | Transaction date is in a `LOCK_ALL` / `LOCK_TXN` period. | Change the date or reopen the period. |
| *Generic Document has already been posted to FINAL* | Two users (or bulk FINAL plus the edit screen) posted the same draft. | Refresh; no action needed. |
| FINAL from the edit screen posts stale values | Until the fix tracked as "FINAL button to check before SAVE", unsaved edits could be dropped when FINAL was clicked. | Update the applet; on older builds click SAVE before FINAL. |
| No PDF opens after FINAL although `ENABLE_AUTO_POPUP` is on | No default printable format (`PRINTABLE`) — toast *No Default Printable Selected*. | Mark a format as default in Printable Format Settings. |
| SINGLE/MULTIPLE PRINT greyed out | Same cause — `PRINTABLE` unset. | Same fix. |
| SEND EMAIL missing | `HIDE_SEND_EMAIL_BUTTON` is on. | Turn it off in Application Settings. |
| File Import menu missing | `HIDE_FILE_IMPORT_MENU` is on and the user lacks `SHOW_FILE_IMPORT_MENU`. | Turn the setting off or grant the permission. |
| Import rows rejected for `AMOUNT_TAX_GST` or the e-Invoice tax-exemption columns | Older sample files predate the columns added for purchase uploads (tax amount, `HDR_/LINE_EINVOICE_TAX_EXEMPTION_DETAILS/AMOUNT`). | Download the current Sample Format and re-map. |
| Document submitted to the tax authority although it should not be | No skip flag. | Tick Skip E-Invoice on the document, or set `skip_einvoice` on the branch or the supplier. |
| The supplier's balance went **down**, not up | Expected — this document has amount signum +1 (Dr Creditor). | Use a Purchase Credit Note (Internal) or a purchase invoice for a supplier's extra charge. |
| Debit note not offered in the Payment Voucher contra picker | Different currency, non-FINAL status, or zero ARAP balance. | Check `doc_ccy`, posting status and the ARAP tab. |
| A DRAFT created by intercompany shows lines you did not key | It was generated from a related company's Sales Debit Note. | Review, then FINAL or DISCARD; the source is on Trace Document / Doc Link. |
| Clone does nothing | Clone runs as a background job and polls up to three times. | Wait for *Cloned Document Ready*; if *Cloned document not found*, reload the listing or clone again. |

## Related documentation

- [Purchasing module](/modules-v2/purchasing/) and its [related applets](/modules-v2/purchasing/related-applets/)
- [MyInvois setup](/guides/einvoice-guides/myinvois-setup/) and [e-Invoice validation](/guides/einvoice-guides/einvoice-validation/) — the guides that cover submitting purchase-side documents
- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — the companion reference page
