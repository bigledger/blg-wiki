---
title: "Creditor Report Applet"
description: "Accounts-payable reporting for finance teams: outstanding supplier documents, aging, statements of account, historical snapshots, AP transactions and settlement detail, plus contra of open supplier documents."
applet_code: "creditor_report_applet"
applet_repo: "blg-applet-wavelet-creditor-report-applet-V2"
modules: [financial-accounting, purchasing]
related_applets:
  - debtor-report-applet
  - debtor-and-creditor-report-applet
  - internal-payment-voucher-applet
  - internal-purchase-invoice-no-stock-in-applet
  - internal-purchase-grn-stock-in-applet
  - internal-purchase-grn-applet
  - internal-purchase-order-applet
  - internal-purchase-debit-note-applet
  - internal-purchase-credit-note-applet
  - internal-purchase-return-applet
  - entity-applet
  - organisation-applet
  - financial-report-applet
  - ledger-and-journal-applet
  - purchase-report-applet
guides:
  - /user-guide/reports-analytics/
sources:
  screens:
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/app.routing.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/menu-items.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-view/outstanding-document-report-view.component.html
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/outstanding-entity-report-view.component.html
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/services/api-service.ts
  configuration:
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/settings-container/printable-format-settings-container/add-printable-format/add-printable-format.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/settings-container/printable-format-settings-container/edit-printable-format/edit-printable-format.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/helpers/external-documents.helper.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-listing/outstanding-document-report-listing.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-aging-report-container/outstanding-aging-report-listing/outstanding-aging-report-listing.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/txn-history-container/txn-history-listing/txn-history-listing.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/entity-soa-txn/entity-soa-txn.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/entity-soa-aging/entity-soa-aging.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-view/contra-select-document/contra-select-document.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/app.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-shared-utilities/modules/aging-period/aging-period-container/aging-period-listing/aging-period-listing.component.ts
    - blg-shared-utilities/modules/aging-period/aging-period-container/aging-period-create/aging-period-create.component.ts
    - blg-shared-utilities/modules/aging-period/aging-period-container/aging-period-edit/aging-period-edit.component.ts
    - blg-shared-utilities/utilities/select-multi-branch-drop-down/select-multi-branch-drop-down.component.ts
    - akaun_master.bl_applet_client_side_perm_dfn
  fields:
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/outstanding-document-report.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/outstanding-aging-report.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/outstanding-entity-report.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/txn-history-report.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/historical-creditor-report.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/ap-transaction-report.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/pv-with-purchase-invoice.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/purchase-invoice-with-settlement.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/models/advanced-search-models/contra-select-document.model.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/entity-soa-txn/entity-soa-txn.component.html
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/entity-soa-aging/entity-soa-aging.component.html
  lifecycle:
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-view/contra/contra.component.ts
    - blg-applet-wavelet-creditor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/creditor-report-applet-V2/src/app/state-controllers/outstanding-document-report-controller/store/effects/outstanding-document-report.effects.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentArapContraController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentArapContraService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentArapContraDco.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityOutstandingDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityReportController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityStatementOfAccountController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/reports/TransactionHistoryReportController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/reports/purchase/PurchaseReportController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityArApReportUow/EntityReportUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityArApReportUow/EntityOutstandingDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityArApReportUow/EntityStatementOfAccountUowHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/TransactionHistoryReportUow.java
  troubleshooting:
    - gh:bigledger/blg-intranet#901
    - gh:bigledger/blg-intranet#5252
    - gh:bigledger/blg-int-general-task#6479
    - gh:bigledger/blg-applet-wavelet-creditor-report-applet-V2#7
    - customer-issue trackers referenced by commits in the applet repo (anonymised; see kb/topics/creditor-report-applet.md)
tags:
  - finance
  - creditor-report
  - accounts-payable
  - aging-analysis
  - statement-of-account
weight: 41
aliases:
  - /applets/creditor-report-applet/
---

## Overview

The **Creditor Report Applet** gives your finance team one place to review money the company owes to suppliers. You can list unpaid supplier documents, review aging, pull supplier statements, trace historical balances, and see how payment vouchers settled purchase invoices, without moving between the purchase and payment applets. It reads the same documents those applets create; the only thing it writes is a **contra** between two open supplier documents.

{{< callout type="info" >}}
**In plain English:** a "creditor" is any supplier or vendor you owe money to. Every screen in this applet answers a question about that money: which documents are still open, how old the balances are, what a supplier's statement looks like, and what the position was at the end of a past month.
{{< /callout >}}

In the product the applet is titled **Creditor Report** and its route root is `applet/tnt/wavelet/erp/creditor-report-applet`. It is the accounts-payable counterpart of the [Debtor Report Applet](/applets/finance/debtor-report-applet/); the [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/) applet carries both sides in one menu.

## Where it fits

| Position | Applet / document | Why |
|---|---|---|
| Upstream (documents it reads) | [Purchase Invoice No Stock In](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/), [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/), [Purchase Debit Note](/applets/purchase-workflow/internal-purchase-debit-note-applet/), [Purchase Credit Note](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Return](/applets/purchase-workflow/internal-purchase-return-applet/) | Every FINAL supplier document with an AR/AP balance (`arap_bal`) is a row in the outstanding, aging, statement and historical reports. Draft or voided documents never appear. |
| Upstream (settlement) | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | Payments and their settlement lines feed the Settlement tab, the *AP Transaction Report* and the two payment/settlement reports. |
| Upstream (master data) | [Entity](/applets/master-data/entity-applet/), [Organisation](/applets/master-data/organisation-applet/) | Suppliers are entities whose AR/AP type is one of `AP_TRADE`, `AP_OTHER`, `AP_MERCHANT`, `AP_EMPLOYEE` (on the entity or on its company link); companies and branches are the filters and permission targets. |
| Upstream (references shown) | [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/) | The *GRN No* and *PO No* columns link back to the source documents. |
| Sibling reports | [Debtor Report Applet](/applets/finance/debtor-report-applet/), [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/), [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) | Same report engine on the receivable side; purchase analysis by document or item. |
| Downstream (reconciliation) | [Financial Report](/applets/finance/financial-report-applet/), [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) | The supplier balances here are the sub-ledger behind the trade-creditor lines of the Balance Sheet. |

## Screens and menus

The left menu has eight reports. Each one opens a listing with an advanced-search bar (keyword plus filters), an AG Grid with export, and a drill-down that opens in the right-hand column.

| Menu item | Route | Backend call | What it shows |
|---|---|---|---|
| **Outstanding Document Report** (default landing page) | `outstanding-document-report` | `POST …/entity-ar-ap-report/outstanding-documents/backoffice-ep` | One row per open supplier document as of today, with an **Aging Summary** strip (one tile per aging bucket plus a total) above the grid. Rows past their due date are shown in red. Click a row to open **View Outstanding Document**. |
| **Aging Report** | `outstanding-aging-report` | `POST …/entity-reports/aging/backoffice-ep` | Open documents grouped by supplier, with bucket columns; footer totals per group. Click a row for **Aging Report Transactions** (Main, Outstanding Docs tabs). |
| **Statement of Account** | `outstanding-entity-report` | `GET …/entity-reports/entity/backoffice-ep` | One row per supplier and currency: PNS Amount, Settlement Amount, Docs Open, Contra, Balance. Click a row for **Entity Report Transactions** with tabs *Entity Details*, *Transaction Docs*, *Statement Of Account* (sub-tabs *Transaction* and *Aging*, each with SEARCH, **Export to PDF** and **Preview**). |
| **Historical Transaction Aging Analysis Report** | `txn-history-report` | `POST …/reports/transaction-history/creditor` | Line-level aging as at the end of the chosen month, read from the historical-ageing snapshot; grouped by branch, company and supplier. Click a row for **View Document**. |
| **Historical Creditor Report** | `historical-creditor` | `GET …/entity-reports/historical-debtor/backoffice-ep` | One balance per supplier as at the end of the chosen month, six calendar-month columns plus *6 Month+*. Click a row for **Transaction Docs**. |
| **AP Transaction Report** | `ap-transaction` | `POST …/entity-reports/arap-transations/backoffice-ep` | All AP movements in a date range, grouped by supplier, with Debit, Credit, Contra and a running Balance (opening balance before the start date, then each line). |
| **Payment Details with Purchase Invoice** | `pv-with-purchase-invoice` | `POST …/reports/purchase/payment-detail-with-purchase-invoice/backoffice-ep` | Each payment document and the purchase invoices it settled (settlement amount, outstanding, invoice date and amount). |
| **Purchase Invoice with Settlement Details** | `purchase-invoice-with-settlement` | `POST …/reports/purchase/purchase-invoice-settlement-details/backoffice-ep` | Each purchase invoice and its settlement lines (type, document, date, amount, reference). |

{{< youtube BVuTwlyGJ4Y >}}

**View Outstanding Document** (from Outstanding Document Report) has eight tabs in the order set under *Settings → Default Selection → Details Tab Ordering*: **Details**, **Account** (entity, bill-to, ship-to), **Line Items** (drill to *View Item*), **Settlement** (drill to *View Settlement*), **Contra**, **Delivery Details**, **Department**, **Doc Link** (*Copied From* / *Copied To*). The header **PRINT** button prints the document with the printable format registered for that document type (the one flagged default, otherwise the most recently updated; if none exists nothing is printed). The **Contra** tab lists existing contras, shows *Total Contra*, *Doc Open Amount* and *Doc ARAP Balance*, and offers a **+** button (only while the balance is not zero) that opens **Contra Select Document** — see [Lifecycle and effects](#lifecycle-and-effects).

The **Settings** menu (group *System Configuration*) has **Field Settings**, **Default Selection**, **Printable Format Settings** and **Aging Period Settings**; the settings route also reaches the shared Webhook, Client Side Permission, Permission Wizard, Permission Set, User/Team/Role Permission and Release Notes screens. **Personalization** has one item, **Default Selection**.

All column and row-grouping choices are the standard AG Grid ones (columns panel, *Drag here to set row groups*, export from the status bar). The keyword box requires at least three characters; the two payment/settlement reports do not support keyword search at all (advanced search only).

## Configuration

### Before you can use it

- **Supplier documents must be FINAL.** Every query in this applet filters `posting_status = 'FINAL'` and an active status (`EntityReportUow.generateWhereClauseForEntityReport`, `TransactionHistoryReportUow` where-clauses). Finalise purchase invoices, GRN stock-ins, debit/credit notes and returns in their own applets first.
- **Suppliers need an AP type.** Rows are restricted to entities whose default AR/AP type, or whose company link, is `AP_TRADE`, `AP_OTHER`, `AP_MERCHANT` or `AP_EMPLOYEE` (every listing sends `arap_types` with those four values). Set it in the [Entity Applet](/applets/master-data/entity-applet/) or on the company link.
- **Companies and branches** come from the [Organisation Applet](/applets/master-data/organisation-applet/). Two reports require a choice before searching: *AP Transaction Report* and *Payment Details with Purchase Invoice* require **Company**; *Purchase Invoice with Settlement Details* requires **Branch**.
- **Server-side read permissions** for each report (see [Feature visibility / permissions](#feature-visibility--permissions)). For users who are not tenant admin or owner, the company dropdowns and the default company scope are limited to the companies targeted by the report's READ permission, so assign the permission *with company targets* in *Settings → Permission Set / User Permission*.
- **A `.jrxml` printable format** of type `STATEMENT_OF_ACCOUNT_TRANSACTION` and/or `STATEMENT_OF_ACCOUNT_AGING`, flagged **Default**, before anyone uses **Export to PDF** / **Preview** on a statement (below).
- **An aging period** (optional) if you want day-range buckets instead of calendar months (below).

### Applet settings

Where settings live: this applet does **not** use the shared `FieldConfigurationComponent` from blg-shared-utilities. It has its own small *Field Settings* screen, its own *Default Selection* screen, the shared *Aging Period* module, and a *Printable Format Settings* screen that also writes two settings keys. All of them are stored in one JSON object (`bl_applet_ext` row `APPLET_SETTINGS` of this applet) through the shared session effect, which **merges** the keys you save with the keys already stored (`session.effects.ts` L353–L375), so saving one screen never wipes another. The *Personalization → Default Selection* screen renders but does not persist anything (below).

Who can change them: anyone who can open the applet's **Settings** menu. The registry holds **no client-side permission definitions** for this applet (0 rows in `bl_applet_client_side_perm_dfn` on 2026-09-05), so the menu is not gated in the UI; the save itself is a `PUT` on the tenant applet, and a 403 there is only logged to the browser console.

**Settings → Field Settings** (`field-configuration.component.html`; SAVE sends the whole form)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Aging Period Type** (`MONTH (DEFAULT)` / `DAY`) | `AGING_PERIOD_TYPE` | How bucket columns are built on *Outstanding Document Report*, *Aging Report* and *Historical Transaction Aging Analysis Report*. `MONTH`: one column per calendar month counting back from the report date (six, or the number of months of the selected MONTH aging period) plus `6M+`. `DAY`: one column per range of the selected DAY aging period (`0-30 Days`, `31-60 Days`, …) plus `>N Days`. The *Aging Summary* tiles follow the same choice. | Control starts empty; the code treats anything other than `DAY` as month buckets (`byDays = settings?.AGING_PERIOD_TYPE === 'DAY'`). | Takes effect on the next search. Note that ticking a period under *Aging Period Settings* overwrites this key with that period's type (see below). `DAY` with no DAY aging period selected produces **no bucket columns at all** and a summary that only fills the `>120` fallback. |
| **Document Types to Exclude → Document Type** (multi-select of `INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_RETURN`, `INTERNAL_RECEIPT_VOUCHER`, `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`, `INTERNAL_PURCHASE_GRN_STOCK_IN`) | `CREDITOR_EXCLUDE_SERVER_DOC_TYPES` | Sent as `exclude_server_doc_types` on **every** report, statement tab and transaction-docs drill-down; the backend adds `server_doc_type NOT IN (…)`. | None (`null`, sent as an empty list). | Rows of those document types disappear from all eight reports and from statements immediately. Typical use: exclude `INTERNAL_PURCHASE_GRN_STOCK_IN` once GRN stock-ins are always converted to purchase invoices, so a bill is not listed twice. |
| **External Documents → Hide External Quotation / Order / Delivery Order / Invoice / Others** (five toggles) | `HIDE_EXTERNAL_QUOTATION`, `HIDE_EXTERNAL_ORDER`, `HIDE_EXTERNAL_DELIVERY_ORDER`, `HIDE_EXTERNAL_INVOICE`, `HIDE_EXTERNAL_OTHERS` | Visibility of the external reference columns (`xtn_doc_ref_1…5` and their dates: *Quotation*, *Order*, *Delivery Order No.*, *Invoice Number*, *Others*) on Outstanding Document, Aging, Historical Transaction Aging Analysis, AP Transaction and the two payment/settlement reports. | `true` (hidden) in the form; a key that has **never been saved** also counts as hidden (`isExternalDocumentColumnVisible` returns false for `undefined`). | A column appears only when its key is stored as `false`, so on a fresh tenant you must open Field Settings, switch the toggle off and SAVE once. The matching *External … Date* range filters are always present in advanced search regardless of the toggle. |
| **Misc → Enable Portrait - Historical Transaction Aging Analysis Report** | `ENABLE_PORTRAIT_HISTORICAL_TRANSACTION_AGING_ANALYSIS_REPORT` | Page orientation of the print/export of that one report. | Off → landscape. | On → portrait. |

Declared but not rendered: `TXN_HISTORY_SERVER_DOC_TYPE` ("Include Documents Without Journal") is still in the form model but its control is commented out; it is saved as `null` and read by nothing. The model file also declares `INCLUDE_*`, `ENABLE_*` and `HIDE_COMPANY` keys copied from the document applets; none has a control or a reader here.

**Settings → Default Selection** (`default-settings.component.html`)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Default Branch** | `DEFAULT_BRANCH` | Pre-selects the branch in the shared multi-branch dropdowns used by the Branch filters (Outstanding Document, Historical Transaction Aging Analysis, AP Transaction, Payment Details, Purchase Invoice with Settlement) and the Cashbook filter. | Empty. | Applies to everyone the next time a report is opened. Picking a branch also copies the branch's `MAIN_LOCATION` into Default Location. |
| **Default Location** | `DEFAULT_LOCATION` | Stored for the shared location dropdown. | Empty. | **No effect in this applet** — none of the eight reports has a location filter. |
| **Details Tab Ordering** (drag-and-drop list) | `OUTSTANDING_DOCUMENT_REPORT_DETAILS_TAB_ORDER` | Order of the eight tabs on *View Outstanding Document*. | Details, Account, Line Items, Settlement, Contra, Delivery Details, Department, Doc Link. | Saved order is applied to every user; tabs added in later versions are appended at the end. |

**Settings → Aging Period Settings** (shared `aging-period` module; data in `bl_fi_aging_period_hdr` / `_line`)

| Action | Keys written | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Create / edit a period: **Name**, **Type** `DAY` or `MONTH`; MONTH asks **Specify Number of Month**; DAY has a line table of **Start** / **End** day ranges (overlapping ranges are refused with *"The new period range overlaps with an existing range"*). | none | Defines the buckets. | No periods. | Nothing until a period is selected. |
| Tick the **Default Selection** checkbox on a row in the listing | `AGING_PERIOD_HDR_GUID`, `AGING_PERIOD_TYPE` (set to the row's type) | Which period the three aging listings load their ranges / month count from. Unticking writes both keys as `null`. | None. | Immediate. Because it also rewrites `AGING_PERIOD_TYPE`, the type shown under *Field Settings* changes with it; choose the period first and the type second if they must differ. |

**Settings → Printable Format Settings** (applet-local; `.jrxml` only — **ADD** / **SAVE** stay disabled until a `.jrxml` file is attached)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Type** `STATEMENT_OF_ACCOUNT_TRANSACTION` + **Default** ticked | `PRINTABLE_STATEMENT_OF_ACCOUNT_TRANSACTION` (format GUID) | The template used by **Export to PDF** / **Preview** on the *Statement Of Account → Transaction* tab (`POST …/statement-of-accounts/transactions/print-jasper-pdf`). | Empty → the buttons show *"The default print preferences have not been configured"*. | Deleting the default format clears the key again. |
| **Type** `STATEMENT_OF_ACCOUNT_AGING` + **Default** ticked | `PRINTABLE_STATEMENT_OF_ACCOUNT_AGING` | Same for the *Aging* tab (`…/statement-of-accounts/aging/print-jasper-pdf`). | Empty → same message. | Same. |

The listing shows *Format Code, Format Name, File Name, File Size, Uploaded Date, Uploaded By*; edit offers download and delete (delete asks for a second click within three seconds).

**Personalization → Default Selection** — renders *User Default Settings* (Default Branch, Default Location, "This will override Applet Default Settings") but the component never loads the stored values, its SAVE emits to no listener, and choosing a value fails on an undefined container. Nothing is persisted; per-user branch defaults are not available in this applet.

**Keys read at runtime that have no control in this applet** (they can only be set by editing the `APPLET_SETTINGS` JSON directly, since settings are stored per applet):

- `ENABLE_BRANCH_FILTER_PERMISSION` — on *Historical Transaction Aging Analysis Report* switches the Branch filter from the company-permission-filtered list (`select-multi-branch-comp-perm`, the default) to the plain branch list. The Aging Report reads it too but has no Branch filter, so nothing changes there.
- `SHOW_DOCUMENTS_WITH_ZERO_ARAP_BAL` — in *Contra Select Document*, include documents whose balance is already zero.
- `DEFAULT_TOGGLE_COLUMN` (personal settings, written automatically) — remembers the single/double column layout per user.

### Document behaviour settings

Not applicable — this is a report applet; the only write action (contra) has no settings.

### Feature visibility / permissions

No client-side permission definitions exist for `creditor_report_applet` in the registry (checked 2026-09-05), so nothing in the menu or on the screens is hidden per role. Access is enforced by the backend per endpoint, and the applet asks the permission-inquiry service for these definitions at start-up (`app.component.ts`): `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_CREDITOR_OUTSTANDING_DOCUMENT_READ`, `…_CREDITOR_OUTSTANDING_ENTITY_READ`, `…_CREDITOR_OUTSTANDING_AGING_READ`, `…_DEBTOR_OUTSTANDING_ENTITY_READ`, `API_TNT_DM_ERP_CREDITOR_TRANSATION_HISTORY_REPORT_READ`, `API_TNT_DM_ERP_PURCHASE_INVOICE_SETTLEMENT_DETAIL_REPORT_READ`, `API_TNT_DM_ERP_PAYMENT_DETAIL_PURCHASE_INVOICE_REPORT_READ`, `API_TNT_DM_ERP_ARAP_TRANSACTION_READ`, `TNT_TENANT_ADMIN`, `TNT_TENANT_OWNER`.

| Report | Backend permission checked (READ, or the matching ADMIN/OWNER) | Company scope in the UI |
|---|---|---|
| Outstanding Document Report | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_OUTSTANDING_DOCUMENT_READ` (`EntityOutstandingDocumentController` L138–L147) | targets of `…_CREDITOR_OUTSTANDING_DOCUMENT_READ` |
| Aging Report | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_OUTSTANDING_AGING_READ` (`EntityReportController` L98–L108) | targets of `…_CREDITOR_OUTSTANDING_AGING_READ` |
| Statement of Account (listing) | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_DEBTOR_OUTSTANDING_ENTITY_READ` (`EntityReportController` L47–L57) — note the **debtor** name | targets of `…_CREDITOR_OUTSTANDING_ENTITY_READ` |
| Statement tabs, Export/Preview | `API_TNT_DM_ERP_STATEMENT_OF_ACCOUNT_READ` (`EntityStatementOfAccountController`) | — |
| Historical Transaction Aging Analysis Report | `API_TNT_DM_ERP_CREDITOR_TRANSATION_HISTORY_REPORT_READ` (`TransactionHistoryReportController` L75–L85) | targets of the same |
| Historical Creditor Report | `API_TNT_DM_ERP_ENTITY_AR_AP_HISTORICAL_DEBTOR_READ` (`EntityReportController` L124–L134) — note the **debtor** name | targets of `…_CREDITOR_OUTSTANDING_ENTITY_READ` |
| AP Transaction Report | `API_TNT_DM_ERP_ARAP_TRANSACTION_READ` (`EntityReportController` L150–L159) | targets of the same |
| Payment Details with Purchase Invoice | `API_TNT_DM_ERP_PAYMENT_DETAIL_PURCHASE_INVOICE_REPORT_READ` (`PurchaseReportController` L164–L176) | targets of the same |
| Purchase Invoice with Settlement Details | `API_TNT_DM_ERP_PURCHASE_INVOICE_SETTLEMENT_DETAIL_REPORT_READ` (`PurchaseReportController` L136–L148) | targets of the same |
| Contra (create) | `API_TNT_DM_ERP_FI_GENERIC_DOC_ARAP_CONTRA_UPDATE` (`GenericDocumentArapContraController` L551–L560) | — |

"Company scope": a user with `TNT_TENANT_ADMIN` or `TNT_TENANT_OWNER` sees all companies; anyone else gets the company dropdown, and the implicit `company_guids` sent when no company is chosen, limited to the `bl_fi_mst_comp` targets of the permission named in the last column.

## Fields

There is no create/edit form; the fields are the advanced-search filters of each report, the two statement tabs and the contra picker.

**Report filters** (`models/advanced-search-models/*.ts`; ✓ = present, **R** = required before search)

| Filter | Outstanding Document | Aging | Statement of Account | Historical Txn Aging | Historical Creditor | AP Transaction | Payment Details w/ PI | PI w/ Settlement | Notes |
|---|---|---|---|---|---|---|---|---|---|
| Entity (supplier, multi) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Supplier entities only. |
| Supplier Category (multi) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | – | – | |
| Company (multi) | ✓ | ✓ | ✓ | ✓ | ✓ | **R** (single) | **R** (single) | – | Missing company → *"Please select company."* on the two single-company reports. |
| Branch (multi, filtered by company) | ✓ | – | ✓ | ✓ | – | ✓ | ✓ | **R** | Missing branch → *"Please select branch."*. Historical Txn Aging uses the company-permission-filtered list unless `ENABLE_BRANCH_FILTER_PERMISSION` is set. |
| Currency (single) | ✓ | – | ✓ | ✓ | – | – | – | – | `MYR` is treated as "no filter"; any other currency shows document-currency amounts instead of base-currency amounts. |
| Cashbook (single) | – | – | – | – | – | – | ✓ | – | |
| As Of Date (month picker) | – | – | – | **R** | **R** | – | – | – | Month end is the cut-off (`date_txn < first day of next month`). |
| Transaction Date (from/to) | – | – | – | – | – | ✓ | ✓ | ✓ | Defaults to today–today; empty ends fall back to 2000-01-01 / 2099-12-31. |
| Outstanding Only (checkbox) | – | ✓ (on, informational) | – | – | ✓ (on) | – | – | – | Historical Creditor: `HAVING sum(arap_bal) != 0`. |
| Sort By | – | – | – | – | – | ✓ (`DATE_TXN`) | – | – | |
| Show purchase invoice without settlement details | – | – | – | – | – | – | – | ✓ (off) | Off = only invoices with settlement lines. |
| External Quotation / Order / Delivery Order / Invoice / Others Date (from/to, each with a tick box) | ✓ | ✓ | – | ✓ | – | ✓ | ✓ | ✓ | Applied only when the tick box is on; maps to `xtn_doc_ref_n_date_from/to`. |
| Keyword (search box) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | – | – | Minimum three characters. The two payment/settlement reports reject any keyword. |

**Statement Of Account tabs** (inside *Entity Report Transactions*)

| Tab | Field | Required | Notes |
|---|---|---|---|
| Transaction | Month From, Month To | Yes | Opening balance before *Month From*, one line per document, closing balance; **Export to PDF** / **Preview** need the default `STATEMENT_OF_ACCOUNT_TRANSACTION` format. |
| Aging | Month To | Yes | Month From is not used (`date_from` is fixed at 2000-01-01); **Export to PDF** / **Preview** need the default `STATEMENT_OF_ACCOUNT_AGING` format. |

**Contra Select Document** (opened from the Contra tab of *View Outstanding Document*)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Doc No, Reference, External Doc No (text); Document Type (select); Created Date, Transaction Date (ranges with tick boxes) | Filters for the candidate documents of the same supplier and company. | No | Candidates are documents whose balance has the opposite sign to the open document (`arap_bal_range` POSITIVE/NEGATIVE); zero-balance documents only when `SHOW_DOCUMENTS_WITH_ZERO_ARAP_BAL` is set. |
| Row selection + **Amount Contra** (editable per row) | Amount to offset against the open document. | Yes | Selecting a row proposes the smaller of the row's balance and the remaining open amount; **ADD** is disabled while nothing is selected, while the total contra is 0, or while the total exceeds the open amount (the total turns red). |

## Lifecycle and effects

**What the reports read.** Only `bl_fi_generic_doc_hdr` rows with `posting_status = 'FINAL'` and an active status, restricted to AP entity types (the outstanding-documents query additionally requires `entity.is_supplier = TRUE`), and filtered by the excluded document types (`EntityOutstandingDocumentUow` L101–L117, `EntityStatementOfAccountUowHelper` L348–L355, `EntityReportUow` L182–L187). Balances are the document header's `arap_doc_open`, `arap_contra` and `arap_bal` (`arap_bal = arap_doc_open + arap_contra`); when no currency filter is set, foreign-currency documents are converted to base currency by dividing by the document exchange rate (`arap_bal / base_doc_xrate`, `EntityReportUow.generateSqlForEntityReport`; client side `getBaseAmt`). "As of today" reports (Outstanding Document, Aging, Statement of Account, AP Transaction) query live headers. The two historical reports read the **historical-ageing snapshot** (`bl_fi_generic_doc_historical_ageing`, joined to FINAL headers, `date_txn < month end + 1`), which the backend maintains as documents are finalised and recalculates when a contra is back-dated (`GenericDocumentArapContraService` L387–L390). Nothing in this applet posts a journal or changes a document status.

**Contra — the one write path.** *View Outstanding Document → Contra → + → Contra Select Document → ADD* creates a contra between the open document and each selected document.

| Item | Value |
|---|---|
| Server document type | none — rows are written to `bl_fi_generic_doc_arap_contra` (one row per pair; the service creates the mirrored pair and links them with a `group_guid`), status `ACTIVE`. |
| Amount signum | Client sends the absolute *Amount Contra* multiplied by the sign of the selected document's `arap_bal` (−1 when that balance is negative), rounded to two decimals; the backend re-rounds to two decimals and silently drops zero amounts (`GenericDocumentArapContraService.createContras` L204–L235). |
| Quantity signum | none. |
| Dr/Cr equation | none, except that a **forex journal** is created for cross-currency pairs (`createContras` L362–L380 → `JournalPostingService.createJournalForex`). |
| GL precedence | not applicable. |
| Stock processor | none. |
| What it updates | On both documents, through the contra-calculate-balance queue: `arap_contra = Σ active contras`, `arap_bal = arap_doc_open + arap_contra` (`updateArapBalance`, L125–L139). Back-dated contras trigger a historical-ageing recalculation. |
| Backend validation | `GenericDocumentArapContraDco` checks only that the GUID is new, both document GUIDs exist, the amount is not null, and status/created/updated fields are filled. **There is no server-side check that the contra does not exceed the open balance** — that guard is the client-side ADD button only. |
| Permission | `API_TNT_DM_ERP_FI_GENERIC_DOC_ARAP_CONTRA_UPDATE` (403 → the applet shows *"Documents contra unsuccessfully"*). |
| VOID / delete | Not available in this applet; the Contra tab lists rows with their status but has no delete action. |

## Related applets

- [Debtor Report Applet](/applets/finance/debtor-report-applet/) — the receivable twin (same screens, `AR_*` types, plus a salesman collection report).
- [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/) — a separate applet that carries both sides in one menu; same backend endpoints.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — creates the settlements shown in the Settlement tab and the two payment reports.
- [Purchase Invoice No Stock In](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/), [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/), [Purchase Debit Note](/applets/purchase-workflow/internal-purchase-debit-note-applet/), [Purchase Credit Note](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Return](/applets/purchase-workflow/internal-purchase-return-applet/) — the documents that carry supplier balances.
- [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/) — linked through the *PO No* / *GRN No* columns.
- [Entity Applet](/applets/master-data/entity-applet/) — supplier master and AR/AP type; [Organisation Applet](/applets/master-data/organisation-applet/) — companies and branches.
- [Financial Report](/applets/finance/financial-report-applet/), [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) — the GL side to reconcile against.
- [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) — purchase analysis by document and item.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| *"Search keyword must more than 2 characters."* | Keyword shorter than three characters. | Type at least three characters or use the filters. |
| *"Fuzzy search is not supported. Please use Advanced Search"* | Keyword typed on *Payment Details with Purchase Invoice* or *Purchase Invoice with Settlement Details*. | Those two reports accept filters only. |
| *"Please select company."* / *"Please select branch."* | Company (AP Transaction, Payment Details) or Branch (Purchase Invoice with Settlement) left empty. | Choose one; the search is not sent otherwise. |
| Company dropdown is empty for a user on the historical reports (reported by a customer in early 2026). | The user is not tenant admin/owner and the report's READ permission was granted without company targets. | Grant the READ permission for that report with the companies as targets (Permission Set / User Permission). Fixed in the applet by using company-permission dropdowns (March 2026). |
| Statement of Account or Historical Creditor Report returns *not authorised* although the user has every `CREDITOR_*` permission. | Those two listings are served by the `DEBTOR_OUTSTANDING_ENTITY` and `HISTORICAL_DEBTOR` endpoints. | Add `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_DEBTOR_OUTSTANDING_ENTITY_READ` and `API_TNT_DM_ERP_ENTITY_AR_AP_HISTORICAL_DEBTOR_READ` to the AP role. |
| A bill appears twice: once as a GRN stock-in and once as the purchase invoice it was converted to (customer report, April 2026). | Both documents are FINAL and both carry an AP balance. | Add `INTERNAL_PURCHASE_GRN_STOCK_IN` under *Field Settings → Document Types to Exclude* (the option was added for exactly this case), or void the superseded document. |
| Aging Report / Outstanding Document Report shows no bucket columns. | `AGING_PERIOD_TYPE` is `DAY` but no DAY aging period is ticked as default (or the period has no lines). | Create a DAY period with ranges under *Aging Period Settings* and tick it, or set the type back to MONTH. |
| Aging Period Type keeps changing back after saving Field Settings. | Ticking a period in *Aging Period Settings* rewrites `AGING_PERIOD_TYPE` with the period's type. | Select the period first, then set the type in Field Settings. |
| External reference columns (Quotation, Order, Delivery Order, Invoice, Others) never show, even though the toggles look "off". | The keys have never been saved; an unsaved key is treated as hidden. | Open *Field Settings*, switch the toggle off and click SAVE once. |
| *"The default print preferences have not been configured"* on Export to PDF / Preview. | No `.jrxml` format of the matching type is flagged **Default**. | *Settings → Printable Format Settings*: add or edit the format with the right **Type** and tick **Default**. |
| Personal *Default Selection* does not remember the branch. | The personalization screen does not persist (see Configuration). | Use *Settings → Default Selection* (applet-wide) instead. |
| Creditor total does not agree with the Balance Sheet trade-creditor line (recurring customer question). | The reports show document balances of FINAL supplier documents after excluded types, contras and forex conversion at the document rate; the Balance Sheet shows GL journal balances, which include manual journals and documents posted to other creditor accounts. | Compare *AP Transaction Report* for the period with the GL account in [Ledger And Journal](/applets/finance/ledger-and-journal-applet/); check *Document Types to Exclude* and any non-FINAL documents. |
| Foreign-currency rows showed the wrong currency or a doubled amount on *Transaction Docs* / *Historical Transaction Aging Analysis* (customer reports, July 2026). | Base/document currency handling in the listings. | Fixed in the applet in July 2026; if it recurs, apply the Currency filter to see document-currency amounts. |
| A purchase invoice is missing from a supplier's statement (customer report, May 2026). | The statement's *Month From* / *Month To* window did not include the document, or the document was not FINAL. | Widen the months; confirm the document is FINAL. The month-window handling was corrected in May 2026. |
| *"Documents contra unsuccessfully"* | The backend rejected the contra (most often a missing `API_TNT_DM_ERP_FI_GENERIC_DOC_ARAP_CONTRA_UPDATE` permission). | Grant the permission; retry. The client-side ADD guard already prevents contras larger than the open amount. |

## Related documentation

- [Reports & Analytics](/user-guide/reports-analytics/) — where this applet sits among the finance reports.
- [Financial Accounting module](/modules/financial-accounting/) and [Purchasing module](/modules/purchasing/).
- [Debtor Report Applet](/applets/finance/debtor-report-applet/) and [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/) — the sibling reference pages.
