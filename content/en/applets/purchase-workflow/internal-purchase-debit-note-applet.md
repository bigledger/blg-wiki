---
title: "Purchase Debit Note (Internal)"
description: "Reference for the Purchase Debit Note (Internal) applet, used by accounts-payable clerks and finance administrators: the document you raise against a supplier to reduce what you owe them, its screens, the settings that actually exist, its fields, the backend posting rules and known failure modes."
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
  - cashbook-applet
  - my-e-invoice-admin-applet
guides:
  - /guides/einvoice-guides/myinvois-setup/
  - /guides/einvoice-guides/einvoice-validation/
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/settings-container/branch-settings/branch/branch-details/branch-details.component.html
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/state-controllers/branch-settings-controller/effects/branch-settings.effects.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/state-controllers/purchase-debit-note-controller/store/effects/purchase-debit-note.effects.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-listing/purchase-debit-note-listing.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-listing/purchase-debit-note-listing.component.html
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-edit/purchase-debit-note-edit.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/purchase-debit-note-create.component.html
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/line-item-add/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/line-items/line-items-create/search-item/line-search-item-listing.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/account/account-entity-details/select-supplier/supplier-edit/supplier-edit.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/utilities/date-cell-renderer/date-cell-renderer.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/settings/applet-settings-toggle/applet-settings-toggle.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-edit/purchase-debit-note-edit.component.html
    - planning/lanes/lane-3/perm-dfn/internal_purchase_debit_note_applet.tsv
  fields:
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-create/line-item-add/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/components/purchase-debit-note-container/purchase-debit-note-edit/search-documents/search-purchase-invoice/search-purchase-invoice.component.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/models/constants/snack-bar.constants.ts
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/models/constants/applet-constants.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseDebitNoteDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/journalPosting/JournalPostingJobProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidGenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/purchase/PurchaseReportUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEInvoiceGenDocToIrbCancellationQueueService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/eInvoice/EInvoicePurchaseDocMatchingQueueProcessor.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceConstants.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/state-controllers/purchase-debit-note-controller/store/effects/purchase-debit-note.effects.ts
    - gh:bigledger/blg-int-general-task#8958
    - gh:bigledger/blg-int-general-task#7268
    - gh:bigledger/blg-applet-wavelet-internal-purchase-debit-note-applet#5
tags:
- purchase-management
- intercompany
- debit-note
- financial-control
- internal-procurement
weight: 70
aliases: []
---

## Overview

The **Purchase Debit Note (Internal)** applet records a debit note that your company raises against a supplier. Finalising one **reduces the amount you owe that supplier**: the backend posts a debit to the supplier's payable account and a credit to the purchase account (or to the GL code chosen on each line), and the document then sits alongside payment vouchers as something that knocks off outstanding purchase invoices. Accounts-payable clerks open it after a purchase invoice has been posted and the supplier's balance needs to come down — an overcharge, a price correction, a short delivery, a rebate.

A short introduction to the applet:

{{< youtube lsNRnSRHHT8 >}}

It is one of the four purchase-side adjustment documents in the platform (server document type `INTERNAL_PURCHASE_DEBIT_NOTE`). It carries amounts but never moves stock. It can be keyed manually, pulled from an existing purchase invoice through the **Search Document** tab, uploaded from a CSV through **File Import**, or created automatically by intercompany processing when a related company finalises a **Sales Debit Note (Internal)** against your company.

{{< callout type="warning" >}}
**Direction of the posting.** In BigLedger a *Purchase* Debit Note always posts **Dr Creditor / Cr Purchase** — it lowers the supplier's balance. If you need to record an *extra* charge from a supplier (their debit note to you, which raises what you owe), that is the [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) in this platform's naming, or a further purchase invoice. The *Posting proof block* under *Lifecycle and effects* shows where this is fixed in the backend.
{{< /callout >}}

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules-v2/purchasing/), [Financial Accounting](/modules-v2/financial-accounting/), [E-Invoice](/modules-v2/e-invoice/) | Purchase-side adjustment that posts to the General Ledger and is an e-Invoice purchase document type. |
| Upstream | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The invoice whose value is being reduced. The **Search Document → Purchase Invoice** tab lists FINAL purchase invoices, copies their lines into the debit note and links the two documents. |
| Upstream (knock-off) | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | The create screen's **KO For** tab lets a debit-note line knock off an open purchase-order or GRN line. |
| Upstream (intercompany) | [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) | When intercompany processing is set up between two companies in the tenant, finalising the seller's Sales Debit Note queues a Purchase Debit Note in the buyer's company (`IntercompanyProcessingService`, the `INTERNAL_SALES_DEBIT_NOTE → INTERNAL_PURCHASE_DEBIT_NOTE` pair). |
| Downstream | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), the **Contra** tab | The debit note's open balance is consumed by contra against purchase invoices. The [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) treats `INTERNAL_PURCHASE_DEBIT_NOTE` and `INTERNAL_PAYMENT_VOUCHER` as the two settlement document types against purchase invoices (`PurchaseReportUow`). |
| Downstream | [Creditor Report](/applets/finance/creditor-report-applet/) | Shows the debit note's ARAP balance against the supplier. |
| Downstream | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | `INTERNAL_PURCHASE_DEBIT_NOTE` is in the platform's e-Invoice purchase-document set; a FINAL debit note enters the purchase-document *matching* queue (or the submission flow when marked self-billed). |
| Sibling | [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | The other purchase adjustment documents. Purchase Return also has amount signum +1 but moves stock; Purchase Credit Note has amount signum −1 (same side as an invoice). |

## Screens and menus

The applet's sidebar has three working menus plus **Settings** and **Personalization**:

| Menu | Route | What it is |
|---|---|---|
| **Purchase Debit Note** | `internal-purchase-debit-note` | The listing, with create / edit / bulk actions. |
| **Line Items** | `line-items` | A cross-document grid of every debit-note line, for analysis and line-level edits. |
| **File Import** | `debit-note-file-listing` | CSV upload that creates many debit notes at once. Removed from the sidebar when the `HIDE_FILE_IMPORT_MENU` setting is on and the user lacks the `SHOW_FILE_IMPORT_MENU` client-side permission (`app.component.ts`, `updateMenuItem`). |
| **Settings** | `settings/…` | Default Selection, Application Settings (`field-settings`), Printable Format Settings, Webhook, Feature Visibility, Branch Settings, Email Template, Client Side Permission, Role Pricing Scheme Link, Permission Wizard / Permission Set / User / Team / Role Permission, Release Notes, Applet Log. |
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
| **DISCARD** | Sets every selected DRAFT to DISCARDED. No GL impact. Client-side confirmation dialog *Are you sure you want to DISCARD selected documents?* | No row selected, or a selected row is not DRAFT. |
| **VOID** | Reverses every selected FINAL document. Client-side confirmation dialog *Are you sure you want to VOID selected documents?* | No row selected, or a selected row is not FINAL. |
| **SINGLE/MULTIPLE PRINT** | Generates PDFs of the selection with the default printable format. | The applet setting `PRINTABLE` (default printable format) is not set. |
| **SELF-BILLED** | Sets `einvoice_self_billed = true` on the selection so the e-Invoice is treated as a self-billed document. | No row selected. |
| **SEND EMAIL** | Emails PDFs of the selection using the Email Template, Recipient Email and CC List fields on the same row. | The applet setting `HIDE_SEND_EMAIL_BUTTON` is on (hides the button and its three fields). |

{{< figure src="/images/internal-purchase-debit-note-applet/send-email-dropdown.png" alt="SEND EMAIL inline row showing the SEND EMAIL button, Email Template dropdown opened with a searchable template list, Recipient Email dropdown, and CC List text field - all on a single toolbar row" caption="SEND EMAIL row — Email Template, Recipient Email (Billing and Shipping / Billing only / Shipping only) and CC List." >}}

Documents are grouped by recipient address; a document with no address for the chosen recipient type is skipped and reported. The template list is **applet-local** — it comes from this applet's *Settings → Email Template*.

### Create and edit forms

The **create** screen (the `+` button) has seven tabs: Main Details, Account, Line Items, Payment, Department Hdr, KO For and Contra. Payment, Department Hdr and KO For disappear when `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB` or `HIDE_KO_FOR_TAB` is on (`purchase-debit-note-create.component.html`).

The **edit** screen (opening a saved document) has the full set of tabs below — or stacked expansion panels when `VERTICAL_ORIENTATION` is on. Their order is set in *Settings → Default Selection → Details Tab Ordering*.

| Tab | Purpose | Hidden by |
|---|---|---|
| **Search Document** | Find a FINAL purchase invoice and pull its lines in (`posting_statuses: ["FINAL"]`). Creates a document link (`INTERNAL_PURCHASE_INVOICE` → `INTERNAL_PURCHASE_DEBIT_NOTE`). Only offered while the document is still a draft. | `HIDE_SEARCH_BY_DOCUMENT_BUTTON` |
| **Main Details** | Company, branch, location, purchaser, dates, currency and rate, references, external document references. | — |
| **E-Invoice** | Sub-tabs Submission, Progress, Notification, Cancellation, Matched History and (when `ENABLE_IMPORT_EXPORT` is on) Import/Export. Buttons: Submit, Send, Request for Rejection, Pushback to Queues, Export, Select From Another Supplier. | — |
| **Account** | Supplier (entity), entity branch, Bill To and Ship To addresses, contacts. | — |
| **Lines** | Line items with pricing, tax, WHT, department tags, costing details. | — |
| **ARAP** | Product-and-services amount, settlement, contra, document open and balance for this document. | `HIDE_MAIN_ARAP_TAB` |
| **Payment** | Settlement lines (settlement method, amount, date). | `HIDE_MAIN_PAYMENT_TAB` |
| **Department Hdr** | Header-level segment, dimension, profit centre, project. | `HIDE_DEPARTMENT_HDR_TAB` |
| **Trace Document** | Journal, cashbook, tax and inventory transactions the posting created. | `HIDE_TRACE_DOCUMENT_TAB` |
| **Contra** | Offset this debit note against the supplier's outstanding purchase invoices. | `HIDE_MAIN_CONTRA_TAB` |
| **Doc Link** | Links to and from other documents. | `HIDE_DOC_LINK_TAB` |
| **Attachment** | Uploaded supporting files. | `HIDE_ATTACHMENT_TAB` |
| **Export** | Print the document with a printable format. | `HIDE_EXPORT_TAB` |

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

The CSV carries header columns repeated on every line of the same document (branch, location, purchaser, transaction number and date, reference, credit terms, description, remarks, currency, tracking ID, entity code, billing and shipping name/email/phone/address, supplier TIN and e-Invoice identity fields, segment / dimension / profit centre / project, GL code, settlement amount and remarks) and line columns (item reference number, transaction type, quantity, UOM, amount and unit price including tax, GST and WHT code and %, batch, bin, tracking ID, serial number, posting status). Common rejections: an unknown branch, location, entity, item or tax code; a blank or non-numeric amount; a posting status that is not `DRAFT`, `FINAL`, `VOID` or `DISCARDED`; and a column header that does not match the sample.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Company, branch and location are the three required header fields. Branch `MAIN_LOCATION` fills the default location. |
| Supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) | The Account tab selects an entity flagged as supplier; its AR/AP object type decides whether the posting goes to `CREDITOR` (AP trade) or `CREDITOR_NON_TRADE` (AP other) — `JournalPostingService.resolveArap`. |
| Company default GL codes | [Chart of Account](/applets/master-data/chart-of-account-applet/) → company GL-code links | The creditor mapping (`CREDITOR` or `CREDITOR_NON_TRADE`) is a **hard stop**: without it FINAL fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` (`JournalPostingService.java` L335–L341). `PURCHASE` and `INPUT_TAX` are the last fallback for lines and tax lines; if nothing resolves, the journal line is silently omitted (L236, L271) and the journal then fails its balance check — see *Lifecycle and effects*. |
| Items with a purchase GL code | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Each line is an item. A `PNS` line's GL code resolves as **line GL code → document header GL code → item-company link with txn code `PURCHASE` → company default `PURCHASE`** (`JournalPostingService.java` L139–L190). |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | GST/SST and WHT codes on lines. Selectors hidden when `HIDE_TAX_CONFIG_SELECTION` / `HIDE_WHT_CONFIG_SELECTION` are on. |
| Cashbook / settlement methods | [Cashbook](/applets/master-data/cashbook-applet/) | Only if you record a settlement on the Payment tab: a settlement-method item must map to a cashbook with a GL code, else FINAL fails with `MISSING_CASHBOOK: STL_MTHD [code]` / `MISSING_GL_CODE: STL_MTHD [code]` (`JournalPostingService.java` L191–L213). |
| Fiscal period open | [Chart of Account](/applets/master-data/chart-of-account-applet/) → fiscal years | FINAL is refused with `FISCAL_PERIOD_LOCKED` — *The selected date falls within a locked fiscal period* — when the transaction date is in a `LOCK_ALL` / `LOCK_TXN` period (`GenericDocumentService.java` L1681–L1696). |
| e-Invoice setup | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Needed only if the document takes part in e-Invoice processing. `skip_einvoice` on the document, the branch or the supplier bypasses it (`GenericDocumentService.isSkipEInvoice`). |
| Permissions | This applet → Settings → Permission Wizard / Client Side Permission | Server-side create/read/update/delete on `INTERNAL_PURCHASE_DEBIT_NOTE`; client-side switches listed below. |

### Applet settings

Settings live in four places (`app.routing.ts`): **Default Selection** and **Branch Settings** are applet-local components; **Application Settings** (`field-settings`) is the *shared* `FieldConfigurationComponent` from `blg-shared-utilities`, which shows the sections gated for `appletCode === 'internal_purchase_debit_note_applet'` plus the ungated sections, and saves the whole form as this applet's master settings (`field-configuration.component.ts` L2689); and the **inline gear** — the shared `app-applet-settings-toggle` panel embedded in 23 of this applet's screens (listing, edit, create, line item, payment, contra, supplier edit…), each passing its own `appletSettingsKeys` list. The gear appears only when `ENABLE_INLINE_APPLET_CONFIG` is on (the first toggle on the Application Settings screen, ungated; `applet-settings-toggle.component.ts` L92–L99); Owners and Admins can save through it to the tenant-wide master settings or to their personal overlay, other users to their personal overlay only (L133, L250–L275). A personal `true` overlays the master value; a personal `false` removes the personal key rather than storing `false`. Anyone with access to the applet's Settings menu can change all of them; **Personalization → Default Selection** lets each user override the defaults for themselves.

Every key below passes four checks — declared in `applet-settings.model.ts`, rendered as a control for this applet, saved by the settings screen, and read by the applet's code. Keys that fail one of them are listed separately at the end.

{{< callout type="info" >}}
**Fresh tenants see every column until Application Settings is saved once.** The shared screen's `shouldHideSetting()` pre-ticks the price, quantity, discount and tax `HIDE_*` toggles for the applets in its list (`field-configuration.component.ts` L2333–L2358 — the list carries the hyphenated spelling `internal-purchase-debit-note-applet`), but the document form reads only *stored* values. Until someone opens Application Settings and clicks SAVE, nothing is stored and every line column is visible.
{{< /callout >}}

**Settings → Default Selection** (`default-selection`):

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_BRANCH` | Branch pre-selected on new documents. Choosing a branch also stores `DEFAULT_COMPANY` (the branch's company) and `DEFAULT_LOCATION` (the branch's `MAIN_LOCATION` parameter). | Empty — the form is patched from the saved value, `null` when nothing was saved (`default-settings.component.ts` L50–L59). | New documents open with these values; a user's personal default overrides them. |
| `DEFAULT_LOCATION` | Location pre-selected on new documents. | Empty, as above. | As above. |
| `PURCHASE_DEBIT_NOTE_DETAILS_TAB_ORDER` | Drag-and-drop order of the edit-form tabs. | Code order (Search Document … Export). Saved orders are merged with tabs added by a later release, which are appended at the end (L61–L77). | Tabs re-order for every user. **Reset** saves `null` for the three defaults and the current tab order (L106–L111). |

**Settings → Application Settings** (`field-settings`). Toggles are labelled by their key; every toggle starts *off* (the shared form is built empty and patched from saved values). Grouped by what they do:

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_POSTING_STATUS` | Posting statuses the listing loads on open. | Unset → no status filter; `ALL` behaves the same (`purchase-debit-note-listing.component.ts` L1679–L1682). | Pick `DRAFT` / `FINAL` / `VOID` / `DISCARDED` to load only that status. |
| `DEFAULT_TRANSACTION_DATE` | The transaction-date window the listing loads on open. | Unset → one month back to today (L1668–L1677). | `1_week` → last seven days; `1_day` → today only. |
| `DISABLE_GEN_DOC_LISTING` | Stops the listing auto-loading on open. | Off (auto-load, L903). | Users must search or filter before rows appear. |
| `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON` | Remove FINAL / VOID / DISCARD / SAVE from the listing and edit screens. | Off. | Hidden for everyone; the matching `SHOW_GENDOC_*_BUTTON` client-side permission reopens the button for its holders (see *Feature visibility*). |
| `HIDE_CLONE_BUTTON` | Remove the Clone action. | Off. | Reopened per user by `SHOW_CLONE_BUTTON`. |
| `HIDE_FILE_IMPORT_MENU` | Remove the File Import sidebar menu. | Off. | Reopened per user by `SHOW_FILE_IMPORT_MENU` (`app.component.ts` L57–L75). |
| `HIDE_SERVER_DOC_1`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3` | Hide the tenant / company / branch running-number columns (labelled HIDE_DOC_NO_TENANT / COMPANY / BRANCH on the screen). | Off. | Column hidden unless the user holds `SHOW_DOC_NO_*` (L193–L195). |
| `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1` … `HIDE_CLIENT_DOC_5` | Hide the supplier's own document type / reference fields. | Off. | Reopened per user by `SHOW_CLIENT_DOC_*`. |
| `HIDE_REMARKS_MAIN_LISTING`, `HIDE_REFERENCE_MAIN_LISTING` | Hide the Remarks / Reference columns on the listing. | Off. | Columns removed. |
| `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Hide individual ARAP figures. | Off. | Figure removed from the ARAP tab. |
| `VERTICAL_ORIENTATION` | Stacked expansion panels instead of tabs on the edit screen. | Off (tabs). | Panels; `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_MAIN_ARAP`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_MAIN_CONTRA`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT` open the named panel by default (`purchase-debit-note-edit.component.ts` L156–L168). |
| `HIDE_SEARCH_BY_DOCUMENT_BUTTON`, `HIDE_MAIN_ARAP_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_KO_FOR_TAB` | Remove whole tabs / panels (see the tab table above). | Off. | Tab removed for everyone. |
| `ENABLE_DUPLICATE_REFERENCE_CHECK` | Look up the Reference value as you type. | Off. | Shows the banner *Duplicate Reference.* when another debit note already carries it (`main-details.component.ts` L498–L515). Warning only — saving is not blocked. |
| `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY`, `HIDE_CREDIT_TERMS`, `HIDE_REMARKS`, `HIDE_REFERENCE` | Hide the named Main Details field. | Off. | Field removed from the form. |
| `SHOW_FOREX_DATA_SOURCE` | Replace the free currency / rate pair with a forex-source selector. | Off. | Rate comes from the selected forex source. |
| `CANNOT_EDIT_CURRENCY_RATE` | Lock the currency rate. | Off. | Rate read-only on the form. |
| `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Fill Purchaser from the logged-in employee on create. | Off. | Purchaser pre-filled (`main-details.component.ts` L295). |
| `SHOW_CUSTOM_DOC_NO` | Expose a custom document-number field. | Off. | Field shown. |
| `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_OTHERS` and `MANDATORY_QUOTATION`, `MANDATORY_ORDER`, `MANDATORY_DELIVERY_ORDER`, `MANDATORY_INVOICE`, `MANDATORY_OTHERS` (+ `…_DATE`) | The five **External Documents** reference / date pairs on Main Details (`xtn_doc_ref_1..5`). This panel is rendered only for this applet's code (`field-configuration.component.html` L2236, L6406). | Off. | `HIDE_` removes the pair; `MANDATORY_` adds a required validator (`main-details.component.ts` L523–L532). |
| `ENABLE_IMPORT_EXPORT` | Add the Import/Export sub-tab to the E-Invoice tab. | Off. | Sub-tab shown. |
| `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT` | Hide the billing / shipping contact blocks on the Account tab. | Off. | Block removed. |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | Quantity columns on lines. | Off. | Column hidden unless the user holds the matching `SHOW_QTY_*` permission. |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_LAST_PURCHASE_PRICE` | Unit-price columns on lines. | Off. | Column hidden unless the matching `SHOW_UNIT_PRICE_*` permission is held. |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN` | Discount and amount columns on lines. | Off. | As above, with `SHOW_UNIT_DISCOUNT*` / `SHOW_AMOUNT_*`. |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Tax and WHT selectors on lines. | Off. | Hidden unless `SHOW_TAX_CONFIG_SELECTION` / `SHOW_WHT_CONFIG_SELECTION` is held. |
| `HIDE_LINE_ITEMS_GL_CODE` | The per-line GL code field (labelled HIDE_GL_CODE on the screen). | Off. | Users can no longer override the purchase GL code per line. |
| `ENABLE_EDITING_UNIT_PRICE_STD` | Make the standard unit price editable on a line. | Off — read-only (`line-item-add/…/main-details.component.ts` L688, L735). | Editable. The control sits under a gate written as `appletCode==='…' \|\| 'InternalDeliveryApplet' \|\| 'salesInvoiceApplet'`, which is always true, so it renders for this applet too. |
| `DISABLE_EDITING_AMOUNT_TXN` | Lock the transaction amount on a line. | Off. | Read-only. The `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` permission controls who can see this toggle. |
| `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT` | Cap the item-name length on a line. | Off / empty. | Names truncated to the limit. |
| `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_SERIAL_NUMBER`, `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_ISSUE_LINK`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT`, `HIDE_DOC_LINK`, `HIDE_DELIVERY_DETAILS` | Sub-panels of a line. | Off. | Sub-panel removed (`SHOW_COSTING_DETAILS` reopens costing per user). |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`; `MANDATORY_SEGMENT`, `MANDATORY_DIMENSION`, `MANDATORY_PROFIT_CENTER`, `MANDATORY_PROJECT` | Hide or require each accounting dimension on header and lines. | Off. | Hidden, or required at save. |
| `ENABLE_EDIT_PAYMENT_DATE` | Let the settlement date on the Payment tab differ from the document date. | Off. | Date editable. |
| `EDIT_CONTRA_TXN_DATE` | Let the contra date differ from the document date. | Off — the date cell is read-only (`date-cell-renderer.component.ts` L29). | Date picker opens on the Contra tab. |

**Read at runtime without a model declaration.** These keys have a control on the shared screen and are read by the applet, but are not declared in `applet-settings.model.ts`:

| Setting | What it controls | Default |
|---|---|---|
| `DEFAULT_STATUS` | Record status the listing loads (`ACTIVE` / `ALL`). | Unset → `ACTIVE` (`purchase-debit-note-listing.component.ts` L1686–L1689). |
| `SORT_ORDER` | Listing sort column. | Unset → `updated_date` (L977). |
| `FUZZY_SEARCH_COLUMNS` | Columns the listing's fuzzy search box scans. | Unset → the built-in column list (L1694–L1695). |
| `ENABLE_AUTO_POPUP` | Open the printable PDF in a new tab after FINAL. | Off. Needs `PRINTABLE`; otherwise the toast *No Default Printable Selected* (`purchase-debit-note.effects.ts` L2128–L2140). |
| `HIDE_SEND_EMAIL_BUTTON` | Hide the SEND EMAIL button and its three fields on the listing. | Off (`purchase-debit-note-listing.component.html` L64–L88). |
| `DISABLE_ITEM_LISTING` | Stop the line-item picker auto-loading. | Off (`line-search-item-listing.component.ts` L81–L82). |
| `ENABLE_INLINE_APPLET_CONFIG` | Show the in-page gear icon that opens the inline settings panel on each screen. | Off — the gear is opt-in (`applet-settings-toggle.component.ts` L92–L99). |

**Read by the applet, settable only through the inline gear** (no control on the Application Settings screen): `HIDE_SUPPLIER_CODE`, `HIDE_EMAIL`, `HIDE_PHONE_NUMBER`, `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION`, `HIDE_E_INVOICE_TAB` (inline supplier edit — hide the supplier code, e-mail, phone, SIC / business-activity fields and the supplier's E-Invoice sub-tab; `supplier-edit.component.ts` L161–L165), `HIDE_KO_BY_PURCHASE_ORDER`, `HIDE_KO_FOR_PURCHASE_ORDER`, `HIDE_KO_BY_GRN`, `HIDE_KO_FOR_GRN` (knock-off direction tabs on a line), `EXPAND_E_INVOICE` and the undeclared `EXPAND_PAYMENT` (open the E-Invoice / Payment panel by default in vertical orientation). `DEFAULT_CURRENCY` (default currency for a supplier created inline, `supplier-edit.component.ts` L250–L252) is read but has no control anywhere.

**Declared but never read** (present in `applet-settings.model.ts` only — not documented as settings): `ENABLE_CUSTOM_STATUS_1..5`, `ENABLE_CUSTOM_STATUS_HDR_1..5`, `ENABLE_CUSTOM_STATUS_LINE_1..5`, `ENABLE_SEGMENT` / `ENABLE_DIMENSION` / `ENABLE_PROFIT_CENTER` / `ENABLE_PROJECT`, `INCLUDE_*`, `ENABLE_SST`, `ENABLE_WHT`, `INCLUDE_SST`, `INCLUDE_WHT`, `ENABLE_FILTER_BY_TODAYS_TXN`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_REFERENCE_MAIN_LISTING`, `DEFAULT_TOGGLE_COLUMN`, `HIDE_DESCRIPTION`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_SETTLEMENT_TAB`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_DELIVERY_TRIPS`, `EXPAND_KO_FOR`, `EXPAND_POSTING`, `EXPAND_SETTLEMENT`. Some of these have a toggle on the shared screen; switching it changes nothing in this applet.

### Document behaviour settings

| Behaviour | Where it is set | Notes |
|---|---|---|
| Posting status on create | No control — new documents are DRAFT. `DEFAULT_POSTING_STATUS` only filters the listing. | |
| Transaction date on FINAL | The FINAL request's `date_txn_logic` (`USE_FINAL`, `USE_CREATED`, `USE_UPDATED`) applies only when the header's *use transaction date* flag is off (`GenericDocumentService.java` L371–L385). | Backend rule; no applet toggle. |
| Printable formats | *Settings → Printable Format Settings* (Format Code, Format Name, uploaded template). Marking one as default writes the `PRINTABLE` key (`printable-format.effects.ts` L186). *Branch Settings → Printable Format* overrides it per branch. | Required for SINGLE/MULTIPLE PRINT, SEND EMAIL and `ENABLE_AUTO_POPUP`. |
| Email templates | *Settings → Email Template* — Printable Format, Template Code (dropdown label **and** email subject), Template (body). | Applet-local. |
| Approval workflow | No exposed control found (routes and settings components checked at commit `f3a1875`; the shared screen's *Workflow Selection* section renders only `ENABLE_IMPORT_EXPORT` for this applet). | The workflow columns on the document (`xtn_process_*`) exist in the data model but this applet has no approval screen or binding. |
| e-Invoice | E-Invoice tab → Submission; `skip_einvoice` on the document, on the branch or on the supplier bypasses processing (`GenericDocumentService.isSkipEInvoice`, L3239–L3244); SELF-BILLED on the listing sets `einvoice_self_billed`. | A FINAL purchase document of a company whose e-Invoice status is `ENABLED` and which is *not* self-billed goes to the purchase-document **matching** queue, where the supplier's issued e-Invoice is matched against it (`EInvoicePurchaseDocMatchingQueueProcessor.java` L84–L89). Use *Select From Another Supplier* to correct the issuer details before submitting a self-billed one. |
| Webhooks | *Settings → Webhook* (shared component). | Fires on document events. |

{{< figure src="/images/internal-purchase-debit-note-applet/email-template-settings.png" alt="Email Template settings screen showing the list of templates that are available in this applet's SEND EMAIL dropdown" caption="Settings → Email Template." >}}

### Branch settings

{{< figure src="/images/internal-purchase-debit-note-applet/branch-settings.png" alt="Branch Settings screen showing the listing of branches and the per-branch configuration panel" caption="Settings → Branch Settings — pick a branch on the left." >}}

| Sub-tab | What it controls |
|---|---|
| **Branch Details** | Read-only Branch Name, Branch Code, Company; **Sales Agent**; **Rounding Five Cent** with a rounding item; **Group Discount Item** used for header-level discounts (`branch-details.component.html` L30–L39). |
| **Default Settlement Method** | Settlement method pre-selected on the Payment tab for this branch. |
| **Item Category Filter** | Item categories the line picker offers at this branch. |
| **Menu List** | Sidebar menus shown to users at this branch. |
| **Pricing Scheme** | Pricing schemes used to derive line prices at this branch (also linkable to roles under *Role Pricing Scheme Link*). |
| **Printable Format** | Branch default printable format, overriding `PRINTABLE`. |

{{< callout type="info" >}}
**"Sales Agent" is a UI label, not a purchase-side meaning.** The control is the shared `app-sales-man` picker and it writes the branch's `default_sales_entity_hdr_guid` (`branch-settings.effects.ts` L23). Nothing in this applet reads that value back — the create screen does **not** pre-fill Purchaser from it. Purchaser is filled only by `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` or by hand.
{{< /callout >}}

### Feature visibility / permissions

**Server-side.** Every API call on the document is gated by the four permissions `TNT_API_DOC_INTERNAL_PURCHASE_DEBIT_NOTE_{CREATE,READ,UPDATE,DELETE}_TGT_GUID`, each assignable with a target of type **Company, Branch, Location or Entity** through *Permission Wizard* or *Permission Set*. File Import has its own set, `API_TNT_DM_ERP_INTERNAL_PURCHASE_DEBIT_NOTE_IMPORT_FILE_HDR_{ADMIN,CREATE,READ,UPDATE,DELETE,OWNER,MEMBER}` (READ / UPDATE / DELETE targeted by Company, Branch or Location). Both lists come from the platform's permission registry (`app_perm_dfn`); the extract is in `planning/lanes/lane-3/perm-dfn/internal_purchase_debit_note_applet.tsv`.

**Client-side** permissions seeded for this applet in `bl_applet_client_side_perm_dfn` (assign under *Settings → Client Side Permission*):

| Permission code | Effect |
|---|---|
| `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH` | Show the tenant-, company- and branch-level document numbers even when `HIDE_SERVER_DOC_1..3` are on. |
| `SHOW_TRANSACTION_DATE` | Show the transaction date. |
| `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1..5` | Show the client document type and reference fields even when hidden by setting. |
| `IPDN_HIDE_TRACKING_ID_AND_PERMIT_NO` | Hide Tracking ID and Permit No for the holder. (`IPDN_DISPLAY_TRACKING_ID_AND_PERMIT_NO` is DELETED in the registry.) |
| `INTERNAL_PURCHASE_DEBIT_NOTE_DISPLAY_PRICING` | Show pricing details on lines. |
| `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO` | Quantity columns on lines. |
| `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX` | Unit-price columns on lines. |
| `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX` | Discount columns. |
| `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN` | Amount columns. |
| `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION` | Tax and WHT selectors. |
| `SHOW_COSTING_DETAILS` | Costing sub-panel on lines. |
| `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` | Lets the holder see the *Disable editing amount txn* toggle in Application Settings. |

The applet code also checks `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_CLONE_BUTTON` and `SHOW_FILE_IMPORT_MENU` — each re-enables a button or menu that the matching `HIDE_…` setting removed (pattern `!SHOW && HIDE`). These five are checked in code but **not seeded in the registry** for this applet; create them under *Client Side Permission* before assigning.

*Settings → Feature Visibility* (shared) can hide menus per team.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Company | Legal entity that owns the document. | Yes | Filled from the branch. Drives GL-code lookup and the fiscal-period lock. |
| Branch | Branch recording the liability reduction. | Yes | Default from `DEFAULT_BRANCH` or the personal default. |
| Location | Stock location on the header. | Yes | Default from the branch's `MAIN_LOCATION`. No stock movement is posted. |
| Purchaser | Employee responsible. | No | Auto-filled only when `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` is on. |
| Tenant / Company / Branch Doc No | Three running numbers. | System | Generated by the backend when the document goes FINAL (`GenericDocumentService.java` L638); shown per `SHOW_DOC_NO_*` permission. `SHOW_CUSTOM_DOC_NO` exposes a custom number field. |
| Transaction Date | Accounting date. | Yes | Must fall in an open fiscal period at FINAL (`FISCAL_PERIOD_LOCKED`). |
| Credit Terms | Supplier terms in days. | No | Hidden by `HIDE_CREDIT_TERMS`. |
| Reference, Remarks, Description | Free text. | No | *Duplicate Reference.* banner when `ENABLE_DUPLICATE_REFERENCE_CHECK` is on — a warning, not a block. Remarks become the journal header description. |
| Permit No, Tracking ID | Statutory / logistics references. | No | Hidden by `HIDE_PERMIT_NO` / `HIDE_TRACKING_ID` or by `IPDN_HIDE_TRACKING_ID_AND_PERMIT_NO`. |
| Currency, Base Currency, Currency Rate, Forex Source | Document currency and rate. | Currency yes | Rate locked by `CANNOT_EDIT_CURRENCY_RATE` and after FINAL. The backend re-validates the exchange rate at FINAL (`GenericDocumentService.validateForexExchangeRate`, L1636 and L1702). |
| Server Doc 1–3 | Platform document numbers. | System | Hidden by `HIDE_SERVER_DOC_*`. |
| Client Doc Type, Client Doc 1–5 | Supplier's own document references. | No | Shown per `SHOW_CLIENT_DOC_*` permission. |
| External Documents (Quotation, Order, Delivery Order, Invoice, Others) + dates | Five reference / date pairs (`xtn_doc_ref_1..5`). | Per `MANDATORY_…` settings | Panel rendered only for this applet in Application Settings. |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity (Supplier) | Supplier being debited. | Yes (`entityId` required validator) | Must be an entity flagged as supplier; its AR/AP object type selects `CREDITOR` (AP trade) vs `CREDITOR_NON_TRADE` (AP other). Entity `skip_einvoice` bypasses e-Invoice. |
| Entity Branch | Supplier branch. | No | Validated against the entity. |
| Bill To / Ship To | Name, email, phone, address lines, country, state, city, postcode. | No | Billing / shipping email feed SEND EMAIL. |
| E-Invoice identity | TIN, ID type, ID number, SST number. | For e-Invoice only | Editable inline; *Select From Another Supplier* copies from another entity. |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | Item or GL-code item. | Yes | `GL_CODE` items skip the numeric validators below. |
| Quantity | Units. | Yes (`qty` required, minimum 1) | Quantity signum is 0 — no stock movement. |
| UOM, UOM ratio | Unit of measure. | No | |
| Unit price (std / txn / net, incl. and excl. tax, per UOM) | Pricing. | `netAmt`, `netAmtWithTax`, `txnAmt` required for non-GL items | Minimum 0. Standard price editable only with `ENABLE_EDITING_UNIT_PRICE_STD`; transaction amount locked by `DISABLE_EDITING_AMOUNT_TXN`. |
| Unit discount, discount amount | Line discount. | No | |
| Tax code, tax %, tax amount | GST/SST. | No | Tax % ≥ 0. Posts to the company default `INPUT_TAX`. |
| WHT code, WHT %, WHT amount | Withholding tax. | No | WHT % ≥ 0. |
| Branch (line) | Branch for the journal line. | Yes | Defaults to the header branch (`JournalPostingService.java` L134). |
| Segment, Dimension, Profit Centre, Project | Accounting tags. | Per `MANDATORY_…` | Fall back to header values on the journal line (L135–L138). |
| GL code (line) | Overrides the purchase GL code for this line — first in the precedence. | No | Hidden by `HIDE_LINE_ITEMS_GL_CODE`. |
| Batch, Bin, Serial, Tracking ID | Stock references. | No | Batch / bin sub-forms require batch number, dates and quantity; bin code and quantity. |
| e-Invoice classification, tax type, UOM, tariff code, country of origin | e-Invoice line data. | For e-Invoice only | |
| Remarks | Line text. | No | Becomes the journal line description (L104). |

### Payment, Department Hdr, Contra

| Tab | Fields | Notes |
|---|---|---|
| Payment | Settlement method, amount, date, remarks. | Date editable only with `ENABLE_EDIT_PAYMENT_DATE`. The applet refuses a line above the outstanding balance with the snack-bar *Payment Exceeds Outstanding* (`snack-bar.constants.ts` L7) — a client-side check. |
| Department Hdr | Segment, Dimension, Profit Centre, Project. | Header defaults for every journal line. |
| Contra | Target purchase invoice, contra amount, date. | Date editable only with `EDIT_CONTRA_TXN_DATE`. |

## Lifecycle and effects

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable. No journal, no ARAP. | FINAL, DISCARDED |
| **FINAL** | Posted. Header locked. | VOID |
| **VOID** | Reversed. Reason stored in `void_reason`. | none |
| **DISCARDED** | Abandoned draft. Hidden from the default listing. | none |

**Backend checks on FINAL** (`GenericDocumentService.java`):

| Check | Result when it fails | Where |
|---|---|---|
| Document is not already FINAL | HTTP 403 *Generic Document has already been posted to FINAL* | L361–L364 |
| Exchange rate consistent for a forex document | `validateForexExchangeRate` errors | L1636, L1702 |
| Serial / batch / bin quantities consistent | validation errors (`validate_serial_signum_zero`, `validate_stock_balance` flags in the request) | L386–L390 |
| Transaction date not in a `LOCK_ALL` / `LOCK_TXN` fiscal period | `FISCAL_PERIOD_LOCKED` — *The selected date falls within a locked fiscal period.* | L1681–L1696 |

The listing's DISCARD and VOID confirmation dialogs are client-side prompts, not backend checks.

**What FINAL does** once validation passes: sets `skip_einvoice` from the document / branch / supplier (L630–L632), applies `date_txn_logic` (L371–L385), generates the running numbers (L638), creates a base-currency **shadow** document for a forex document and posts that instead (L402–L437), queues the Generic Document Primary Processor (L644) and the message-template (email / notification) queue (L653). The journal, ARAP amounts and the e-Invoice matching queue are produced by the subscribed job processors of that primary queue.

**Posting proof block**

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_PURCHASE_DEBIT_NOTE` | `InternalPurchaseDebitNoteDataConsistencyObject.java` L15 |
| Amount signum | **+1** (checked on create and update) | same, L16, L21–L34 |
| Quantity signum | **0** (filled on every line) | same, L17, L37–L44 |
| Dr/Cr equation | Line: `amount_signum × sign(amount_net) > 0` → **credit** (`JournalPostingService.java` L123–L131), so each PNS line credits the purchase account; tax lines credit `INPUT_TAX` when `amount_signum ≥ 0` (L257–L263); the balancing entity line takes `Σ(debit − credit)`, which is negative, so it **debits** `CREDITOR` / `CREDITOR_NON_TRADE` (L322–L353). Net effect **Dr Creditor / Cr Purchase, Cr Input Tax** — the supplier balance falls. | `JournalPostingService.java` |
| Handler | No handler is registered for this document type, so the generic `PURCHASE` handler applies (`serverDocType.contains("PURCHASE")`, L76–L84): `PNS_ENTITY = CREDITOR`, `PNS = PURCHASE`, `PNS_TAX = INPUT_TAX`. | `JournalPostingTypeHandler.java` L53–L60 |
| GL precedence for a PNS line | **line GL code** (L139–L149) → **document header GL code** → **item-company GL link** with txn code `PURCHASE` (`ROUNDING` for a header-adjustment item) → **company default** `PURCHASE` (L151–L190). A line whose sub-ledger cannot be resolved at any level is **silently omitted** from the journal (L236); the same applies to a tax line without an `INPUT_TAX` default (L271). | `JournalPostingService.java` |
| Hard stops in posting | `MISSING_DEFAULT_GL_CODE: CREDITOR` / `CREDITOR_NON_TRADE` when the payable account is unmapped (L335–L341); `MISSING_CASHBOOK: STL_MTHD [code]` / `MISSING_GL_CODE: STL_MTHD [code]` for a settlement line whose method has no cashbook or GL code (L191–L213); `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES: Total Debits: …, Total Credits: …` when an omitted line leaves the journal unbalanced (L574–L577); `NO_JOURNAL_CREATED` when no line could be built at all (L579–L582). | `JournalPostingService.java` |
| Settlement lines | Each Payment-tab line posts to the settlement method's cashbook GL (sub-ledger created on the fly if missing) and reduces the creditor line by the same amount. | `JournalPostingService.java` L191–L221 |
| Stock processor | None. `InventoryTransactionLineProcessorService` skips every line whose quantity signum is 0 (L39–L40, L74–L75), so a FINAL debit note writes no inventory transaction. | `InventoryTransactionLineProcessorService.java` |
| What VOID reverses | `updatePostingStatusToNonFinal` (L662–L710) sets `VOID` and the reason, voids the forex shadow document if one exists, queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR` (L698–L699), deletes the document from the e-Invoice submission queue (L700, L3285–L3298) and from historical aging (L701). The subscribed journal processor then posts the mirror-image journal (`JournalPostingJobProcessorService.createReverseJournalContainer`, L92–L108). | `GenericDocumentService.java`, `JournalPostingJobProcessorService.java` |
| Back to DRAFT | Not offered by this applet's UI; the backend path (`BLG_ERP_UNDO_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, L702–L704) exists for other callers. | `GenericDocumentService.java` |

`VoidGenericDocumentPrimaryProcessor` itself only fans the event out to the job processors subscribed for the tenant (`findAndTrigger`, L70–L90); which processors run — journal reversal, ARAP, e-Invoice — is tenant job-template configuration, not an applet setting.

**VOID and document links.** The generic VOID path above does not check whether other documents link from this one. The link check `checkIsGenDocConvertibletoVoid` (L3148–L3172: FINAL and no active outgoing document link) is used only by the e-Invoice cancellation flow, which voids the source document after a successful cancellation at the tax authority (`MyEInvoiceGenDocToIrbCancellationQueueService.java` L169–L181). A debit note that has already been contra'd against invoices is therefore voidable from the listing; reverse the contra first if the settlement history must stay consistent.

**Contra and settlement.** The purchase report and the payment voucher treat a FINAL debit note like a payment: its positive ARAP balance is consumed by contra against purchase invoices of the same supplier and currency (`PurchaseReportUow.java` L524).

**Intercompany.** When the seller's Sales Debit Note goes FINAL, `IntercompanyProcessingService` (L110) creates the matching Purchase Debit Note in the buyer's company as a DRAFT with the same lines; it posts nothing until you FINAL it.

## Related applets

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the document being reduced; Search Document pulls its lines in.
- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — the opposite-sign adjustment (amount signum −1, increases the supplier balance).
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — same sign as this document but moves stock out.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) and [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — knock-off targets on the create screen.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — the other settlement document against purchase invoices.
- [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) — intercompany source that auto-creates this document in the buying company.
- [Creditor Report](/applets/finance/creditor-report-applet/) and [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) — where the balance and settlement show up.
- [Chart of Account](/applets/master-data/chart-of-account-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/), [Cashbook](/applets/master-data/cashbook-applet/) — master data it depends on.
- [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — e-Invoice queues and portal status for purchase documents.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` (or `CREDITOR_NON_TRADE`) | The company has no default GL-code link for the supplier's AR/AP type. | Add the link in Chart of Account → company default GL codes, then FINAL again. |
| FINAL fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` | A line (or its tax line) could not resolve a GL code at any level — line, header, item-company link, company default `PURCHASE` / `INPUT_TAX` — and was dropped from the journal. | Map `PURCHASE` and `INPUT_TAX` for the company, or set a GL code on the line, then FINAL again. |
| FINAL fails with `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` | A settlement line uses a settlement-method item with no cashbook, or a cashbook without a GL code. | Map the settlement item to a cashbook with a GL code, or remove the Payment line. |
| *The selected date falls within a locked fiscal period* | Transaction date is in a `LOCK_ALL` / `LOCK_TXN` period. | Change the date or reopen the period. |
| *Generic Document has already been posted to FINAL* | Two users (or bulk FINAL plus the edit screen) posted the same draft. | Refresh; no action needed. |
| FINAL from the edit screen posted stale values | Older builds let FINAL run with unsaved edits (fixed with the "FINAL button to check before SAVE" change). | Update the applet; on older builds click SAVE before FINAL. |
| No PDF opens after FINAL although `ENABLE_AUTO_POPUP` is on | No default printable format (`PRINTABLE`) — toast *No Default Printable Selected*. | Mark a format as default in Printable Format Settings. |
| SINGLE/MULTIPLE PRINT greyed out | Same cause — `PRINTABLE` unset. | Same fix. |
| SEND EMAIL missing | `HIDE_SEND_EMAIL_BUTTON` is on. | Turn it off in Application Settings. |
| File Import menu missing | `HIDE_FILE_IMPORT_MENU` is on and the user lacks `SHOW_FILE_IMPORT_MENU`. | Turn the setting off, or create and grant the permission. |
| FINAL / VOID / DISCARD button missing for one user only | `HIDE_GENDOC_*_BUTTON` is on and the user lacks the `SHOW_GENDOC_*_BUTTON` permission (not seeded by default). | Create the permission under Client Side Permission and assign it, or turn the setting off. |
| A toggle in Application Settings does nothing | It is one of the keys listed under *Declared but never read* — the applet does not consume it. | No fix needed; the key has no effect in this applet. |
| Import rows rejected for `AMOUNT_TAX_GST` or the e-Invoice tax-exemption columns | Older sample files predate the columns added for purchase uploads. | Download the current Sample Format and re-map. |
| Document went into e-Invoice processing although it should not | No skip flag. | Tick Skip E-Invoice on the document, or set `skip_einvoice` on the branch or the supplier. |
| The supplier's balance went **down**, not up | Expected — this document has amount signum +1 (Dr Creditor). | Use a Purchase Credit Note (Internal) or a purchase invoice for a supplier's extra charge. |
| Debit note not offered in the Payment Voucher contra picker | Different currency, non-FINAL status, or zero ARAP balance. | Check `doc_ccy`, posting status and the ARAP tab. |
| A DRAFT shows lines you did not key | It was generated from a related company's Sales Debit Note by intercompany processing. | Review, then FINAL or DISCARD; the source is on Trace Document / Doc Link. |
| Clone does nothing | Clone runs as a background job and polls up to three times. | Wait for *Cloned Document Ready*; if *Cloned document not found*, reload the listing or clone again. |

## Related documentation

- [Purchasing module](/modules-v2/purchasing/) and its [related applets](/modules-v2/purchasing/related-applets/)
- [MyInvois setup](/guides/einvoice-guides/myinvois-setup/) and [e-Invoice validation](/guides/einvoice-guides/einvoice-validation/) — the guides that cover purchase-side e-Invoice processing
- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — the companion reference page
