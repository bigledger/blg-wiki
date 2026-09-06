---
title: "Debtor Report Applet"
description: "Accounts-receivable reporting for finance and credit-control teams: outstanding customer documents, aging, statements of account, historical snapshots, AR transactions and the salesman collection report, plus contra of open customer documents."
applet_code: "debtor_report_applet"
applet_repo: "blg-applet-wavelet-debtor-report-applet-V2"
modules: [financial-accounting, crm-digital]
related_applets:
  - creditor-report-applet
  - debtor-and-creditor-report-applet
  - internal-receipt-voucher-applet
  - internal-sales-invoice-applet
  - internal-sales-credit-note-applet
  - internal-sales-debit-note-applet
  - internal-sales-return-applet
  - entity-applet
  - organisation-applet
  - financial-report-applet
  - ledger-and-journal-applet
  - sales-report-applet
  - commission-scheme-applet
guides:
  - /user-guide/reports-analytics/
sources:
  screens:
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/app.routing.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/menu-items.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/services/api-service.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-view/outstanding-document-report-view.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-view/contra/contra.component.html
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/entity-soa-aging/entity-soa-aging.component.html
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/collection-invoice-aging/collection-invoice-aging/collection-invoice-aging.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/txn-history-container/txn-history-listing/txn-history-listing.component.ts
  configuration:
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/settings-container/printable-format-settings-container/add-printable-format/add-printable-format.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-listing/outstanding-document-report-listing.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/outstanding-aging-report-container/outstanding-aging-report-listing/outstanding-aging-report-listing.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/entity-soa-txn/entity-soa-txn.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/entity-soa-aging/entity-soa-aging.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/components/outstanding-document-report-container/outstanding-document-report-view/contra-select-document/contra-select-document.component.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/app.component.ts
    - blg-shared-utilities/dialogues/akaun-generic-doc-view-dialog/akaun-generic-doc-view-dialog.component.ts
    - blg-shared-utilities/utilities/select-multi-branch-drop-down/select-multi-branch-drop-down.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-shared-utilities/modules/aging-period/aging-period-container/aging-period-listing/aging-period-listing.component.ts
    - akaun_master.bl_applet_client_side_perm_dfn
  fields:
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/advanced-search-models/outstanding-document-report.model.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/advanced-search-models/outstanding-aging-report.model.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/advanced-search-models/outstanding-entity-report.model.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/advanced-search-models/txn-history-report.model.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/advanced-search-models/historical-debtor-report.model.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/advanced-search-models/ar-transaction-report.model.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/advanced-search-models/collection-invoice-aging.model.ts
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/models/advanced-search-models/contra-select-document.model.ts
  lifecycle:
    - blg-applet-wavelet-debtor-report-applet-V2/micro-fe/projects/wavelet-erp/applets/debtor-report-applet-V2/src/app/services/api-service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentArapContraController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentArapContraService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentArapContraDco.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityOutstandingDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityOutstandingAgingController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityReportController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityStatementOfAccountController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/reports/TransactionHistoryReportController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityArApReportUow/EntityReportUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityArApReportUow/EntityOutstandingDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/TransactionHistoryReportUow.java
  troubleshooting:
    - gh:bigledger/blg-applet-wavelet-debtor-report-applet-V2#1
    - gh:bigledger/blg-applet-wavelet-debtor-report-applet-V2#3
    - gh:bigledger/blg-applet-wavelet-debtor-report-applet-V2#6
    - gh:bigledger/blg-applet-wavelet-debtor-report-applet-V2#8
    - gh:bigledger/blg-applet-wavelet-debtor-report-applet-V2#9
    - gh:bigledger/blg-intranet#4948
    - gh:bigledger/blg-int-general-task#6484
    - gh:bigledger/blg-int-general-task#7077
    - gh:bigledger/blg-wiki#32
    - gh:bigledger/blg-wiki#53
    - customer-issue trackers referenced by commits in the applet repo (anonymised; see kb/topics/debtor-report-applet.md)
weight: 40
tags:
- finance
- accounts-receivable
- debtor-report
- aging-analysis
- statement-of-account
- credit-control
---

## Overview

The **Debtor Report Applet** gives your finance and credit-control team one place to see everything about money your customers owe you. You can list unpaid customer documents, review aging, pull a statement of account for any customer, trace the position at the end of a past month, review AR movements between two dates, and see which invoices each salesman still has to collect — without moving between the sales and receipt applets. It reads the same documents those applets create; the only thing it writes is a **contra** between two open customer documents.

{{< callout type="info" >}}
**In plain English:** a "debtor" is any customer that owes you money. Every screen in this applet answers a question about that money: which documents are still open, how old the balances are, what a customer's statement looks like, and what the position was at the end of a past month.
{{< /callout >}}

In the product the applet is titled **Debtor Report** and its route root is `applet/tnt/wavelet/erp/debtor-report-applet`. It is the accounts-receivable counterpart of the [Creditor Report Applet](/applets/finance/creditor-report-applet/); the [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/) applet carries both sides in one menu but without most of the settings described here.

## Where it fits

| Position | Applet / document | Why |
|---|---|---|
| Upstream (documents it reads) | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Credit Note](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Return](/applets/sales-workflow/internal-sales-return-applet/), cash bills | Every FINAL customer document with an AR/AP balance (`arap_bal`) is a row in the outstanding, aging, statement and historical reports. Draft or voided documents never appear. |
| Upstream (settlement) | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | Receipts and their settlement lines feed the Settlement tab, the *AR Transaction Report* and *Collection Invoice with Aging*. |
| Upstream (master data) | [Entity](/applets/master-data/entity-applet/), [Organisation](/applets/master-data/organisation-applet/) | Customers are entities whose AR/AP type is `AR_TRADE`, `AR_OTHER`, `AR_MERCHANT` or `AR_EMPLOYEE` (on the entity or on its company link); companies and branches are the filters and permission targets. Credit term and credit limit shown on the listings come from the entity. |
| Sibling reports | [Creditor Report Applet](/applets/finance/creditor-report-applet/), [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/), [Sales Report](/applets/sales-workflow/sales-report-applet/) | Same report engine on the payable side; sales analysis by document, item and salesman. |
| Downstream (reconciliation, commission) | [Financial Report](/applets/finance/financial-report-applet/), [Ledger And Journal](/applets/finance/ledger-and-journal-applet/), [Commission Scheme](/applets/membership/commission-scheme-applet/) | The customer balances here are the sub-ledger behind the trade-debtor lines of the Balance Sheet; collection-based commission schemes read the same settlements. |

## Screens and menus

The left menu has seven reports. Each opens a listing with an advanced-search bar (keyword plus filters), an AG Grid with export, and a drill-down that opens in the right-hand column.

| Menu item | Route | Backend call | What it shows |
|---|---|---|---|
| **Outstanding Document Report** (default landing page) | `outstanding-document-report` | `POST …/entity-ar-ap-report/outstanding-documents/backoffice-ep` | One row per open customer document as of today with an **Aging Summary** strip above the grid (one tile per bucket plus a total). Columns include Company, Entity Code/Name, Credit Limit, Credit Term, Doc Short Code, Document, Reference, Remarks, Txn Date, Due Date, Aging, Currency, ARAP Doc Open, ARAP Contra, ARAP Balance, Branch Name; rows past their due date are shown in red. Click a row for **View Outstanding Document**. |
| **Aging Report** | `outstanding-aging-report` | `POST …/entity-ar-ap-report/outstanding-aging/details` | Open documents grouped by customer with bucket columns and an *Aging Summary* strip; footer totals per group. Click a row for **Aging Report Transactions** (*Main*, *Outstanding Docs*); document numbers open the shared document popup. |
| **Statement of Account** | `outstanding-entity-report` | `GET …/entity-reports/entity/backoffice-ep` | One row per customer and currency: PNS Amount, Settlement Amount, Docs Open, Contra, Balance, Reference, Employee. Click a row for **Entity Report Transactions** with tabs *Entity Details*, *Transaction Docs*, *Statement Of Account* (sub-tabs *Transaction* and *Aging*, each with SEARCH, **Preview** and **Download**). Document numbers on both sub-tabs are links that open the document popup. |
| **Historical Transaction Aging Analysis Report** | `txn-history-report` | `POST …/reports/transaction-history/debtor` | Line-level aging as at the end of the chosen month, read from the historical-ageing snapshot; grouped by branch, company and customer; columns add Sales Agent, Credit Term, Credit Limit, Created By and Client Doc 1–5. Click a row for **View Document**. |
| **Historical Debtor Report** | `historical-debtor` | `GET …/entity-reports/historical-debtor/backoffice-ep` | One balance per customer as at the end of the chosen month (PNS Amount, Settlement, Amount, Contra, Balance). Click a row for *Entity Details* / *Transaction Docs*. |
| **AR Transaction Report** | `ar-transaction` | `POST …/entity-reports/arap-transations/backoffice-ep` | All AR movements in a date range, grouped by customer, with Debit, Credit, Contra, running Balance and Sales Man. Click a row to open the document. |
| **Collection Invoice with Aging** | `collection-invoice-aging` | `POST …/entity-reports/dynamic-report/backoffice-ep` | Sales invoices and cash bills paired with the receipts and credit notes that settled them, grouped by salesman and customer: Terms, Doc Type, Doc No, Date, Invoice Amt, Cost, GP, Invoice Bal, Payment Days, aging buckets, Total. Receipts, credit notes and returns are shown as negative amounts in red. |

{{< figure src="/images/debtor-report-applet/Historical-Transaction-Aging-Analysis-Report.png" alt="Historical Transaction Aging Analysis Report listing with an As of Date, an aging summary strip and rows grouped by branch, company and customer" caption="Historical Transaction Aging Analysis Report: month-end position from the historical-ageing snapshot, grouped by Branch Name, Company Code, Entity Code and Entity Name, with the Aging Summary strip above the grid." >}}

**View Outstanding Document** (from Outstanding Document Report) has eight tabs in the order set under *Settings → Default Selection → Details Tab Ordering*: **Details**, **Account** (entity, bill-to, ship-to), **Line Items** (drill to *View Item*), **Settlement** (drill to *View Settlement*), **Contra**, **Delivery Details**, **Department**, **Doc Link** (*Copied From* / *Copied To*). The header **PRINT** button prints the document with the printable format registered for that document type. The **Contra** tab lists existing contras and offers a **+** button that opens **Contra Select Document** — see [Lifecycle and effects](#lifecycle-and-effects).

{{< figure src="/images/debtor-report-applet/historical-debtor-report.png" alt="Historical Debtor Report listing with As of Date and the Company, Entity, Shipping, Currency, PNS Amount, Settlement, Amount, Contra and Balance columns" caption="Historical Debtor Report: one balance per customer as at the end of the selected month; rows group by Company by default." >}}

The **Settings** menu (group *System Configuration*) has **Field Settings**, **Default Selection**, **Printable Format Settings** and **Aging Period Settings**; the settings route also reaches the shared Webhook, Client Side Permission, Permission Wizard, Permission Set, User/Team/Role Permission and Release Notes screens. **Personalization** has one item, **Default Selection**.

The keyword box requires at least three characters. On the Statement of Account listing the keyword is URL-encoded, so customer names with special characters search correctly (fixed April 2026).

## Configuration

### Before you can use it

- **Customer documents must be FINAL.** Every query filters `posting_status = 'FINAL'` and an active status (`EntityReportUow.generateWhereClauseForEntityReport`, `EntityOutstandingDocumentUow` L101–L117, `TransactionHistoryReportUow` where-clauses). Finalise invoices, credit/debit notes and returns in their own applets first.
- **Customers need an AR type.** Rows are restricted to entities whose default AR/AP type, or whose company link, is `AR_TRADE`, `AR_OTHER`, `AR_MERCHANT` or `AR_EMPLOYEE`; the outstanding-documents query additionally requires `entity.is_customer = TRUE` (`EntityOutstandingDocumentUow` L115). Set the type in the [Entity Applet](/applets/master-data/entity-applet/) or on the company link.
- **Companies and branches** come from the [Organisation Applet](/applets/master-data/organisation-applet/). *AR Transaction Report* requires **Company** (the search form marks it required).
- **Server-side read permissions** for each report (see [Feature visibility / permissions](#feature-visibility--permissions)). For users who are not tenant admin or owner, the company dropdowns and the implicit company scope are limited to the companies targeted by the report's READ permission; branch dropdowns are limited to the targets of `TNT_DEBTOR_REPORT_BRANCH_TGT_READ`.
- **A `.jrxml` printable format** of type `STATEMENT_OF_ACCOUNT_TRANSACTION`, `STATEMENT_OF_ACCOUNT_AGING` and/or `STATEMENT_OF_ACCOUNT_AGING_CONTRA_DETAIL`, flagged **Default**, before anyone uses **Preview** / **Download** on a statement.
- **An aging period** (optional) if you want day-range buckets instead of calendar months.

### Applet settings

Where settings live: this applet does **not** use the shared `FieldConfigurationComponent` from blg-shared-utilities. It has its own *Field Settings* screen (ten keys), its own *Default Selection* screen, the shared *Aging Period* module, a *Printable Format Settings* screen that also writes three settings keys, and — unlike the Creditor Report Applet — a working *Personalization → Default Selection* screen. Applet-wide keys are stored in one JSON object (`bl_applet_ext` row `APPLET_SETTINGS`) through the shared session effect, which **merges** the keys you save with the keys already stored (`session.effects.ts` L353–L375); personal keys go through `savePersonalSettingsInit`.

Who can change them: anyone who can open the applet's **Settings** menu. The registry holds **no client-side permission definitions** for this applet (0 rows in `bl_applet_client_side_perm_dfn` on 2026-09-05), so the menu is not gated in the UI.

**Settings → Field Settings** (`field-configuration.component.html`; SAVE sends the whole form)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Aging Period → Type** (`MONTH (DEFAULT)` / `DAY`) | `AGING_PERIOD_TYPE` | How bucket columns are built on *Outstanding Document Report*, *Aging Report*, *Historical Transaction Aging Analysis Report* and *Collection Invoice with Aging*. `MONTH`: one column per calendar month counting back from the report date (six, or the selected MONTH period's count) plus `NM+`. `DAY`: one column per range of the selected DAY aging period (`0-30 Days`, `31-60 Days`, …) plus `>N Days`. | Control starts empty; anything other than `DAY` gives month buckets (`byDays = settings?.AGING_PERIOD_TYPE === 'DAY'`, `outstanding-aging-report-listing.component.ts` L306). | Takes effect on the next search. Ticking a period under *Aging Period Settings* overwrites this key with that period's type. `DAY` with no DAY period ticked produces **no bucket columns**. |
| **Document Types to Exclude → Document Type** (multi-select of ten purchase-side types: `INTERNAL_PURCHASE_INVOICE`, `_RETURN`, `_GOODS_RECEIVED_NOTE`, `_GOODS_ISSUED_NOTE`, `_CONSIGNMENT`, `_CONSIGNMENT_GRN`, `_CONSIGNMENT_GIN`, `_CONSIGNMENT_INVOICE`, `_CONSIGNMENT_RETURN`, `_GRN_STOCK_IN`) | `DEBTOR_EXCLUDE_SERVER_DOC_TYPES` | Sent as `exclude_server_doc_types` on every report, statement tab and transaction-docs drill-down; the backend adds `server_doc_type NOT IN (…)`. The list is purchase documents because an entity that is both customer and supplier otherwise shows its purchase documents (negative balances) among its receivables. | None (`null`, sent as an empty list). | Rows of those document types disappear from all seven reports and from statements immediately. |
| **Statement of Account Tab → Enable Default "Date From"** | `ENABLE_DEFAULT_DATE_FROM` | On the *Statement Of Account → Transaction* tab: when on, *Month From* is ignored and the statement runs from 2000-01-01 (no opening balance); when off, the statement opens with the balance brought forward before *Month From* (`entity-soa-txn.component.ts` L338–L344). | Off (an unsaved key is falsy). | Immediate on the next SEARCH. |
| **Statement of Account Tab → Show Contra Detail Report Layout** | `SHOW_CONTRA_DETAILREPORT_LAYOUT` | On the *Aging* sub-tab, replaces the plain Preview/Download buttons with a **Report Layout** radio (*Summary* / *Contra Detail*). *Contra Detail* prints with the `STATEMENT_OF_ACCOUNT_AGING_CONTRA_DETAIL` template through `…/statement-of-accounts/aging/contra-detail/print-jasper-pdf` (`entity-soa-aging.component.html` L24–L68, `.ts` L360–L364). | Off. | Immediate. Added July 2026 for a customer whose statements had to show each contra line. |
| **Salesman → Use Salesman Code Instead of Name** | `USE_SALESMAN_CODE_INSTEAD_OF_NAME` | Shows `sales_entity_hdr_code` instead of the name in the Salesman / Sales Man columns of every listing (`outstanding-document-report-listing.component.ts` L219–L223, `collection-invoice-aging.component.ts` L551). | Off. | Immediate. |
| **Permission → Enable Branch Filter Permission** | `ENABLE_BRANCH_FILTER_PERMISSION` | Switches the Branch filter on every listing from the company-permission-filtered dropdown (`select-multi-branch-comp-perm`, branches of the companies the report permission targets) to the standard branch dropdown (`select-multi-branch`, scoped by `TNT_DEBTOR_REPORT_BRANCH_TGT_READ` targets) (`outstanding-document-report-listing.component.ts` L287–L288). | Off. | Immediate. Turn it on when branch targets are maintained on the branch permission rather than on company targets. |
| **Misc → Enable Portrait - Historical Transaction Aging Analysis Report** | `ENABLE_PORTRAIT_HISTORICAL_TRANSACTION_AGING_ANALYSIS_REPORT` | Page orientation of that report's print/export (`txn-history-listing.component.ts` L357). | Off → landscape. | On → portrait. |
| **Misc → HIDE_DOC_POPUP_COST_AMOUNT** | `HIDE_DOC_POPUP_COST_AMOUNT` | Hides the *Cost Amount* column in the shared document popup opened from document-number links (Aging Report, Statement of Account tabs). Consumed by `akaun-generic-doc-view-dialog.component.ts` L148, which merges applet and personal settings. | Off → column shown. | Immediate. A `SHOW_DOC_POPUP_COST_AMOUNT` client-side permission is checked in the dialog code to re-show the column per role, but it is not seeded in the registry. |
| **Misc → HIDE_DOC_POPUP_GP** | `HIDE_DOC_POPUP_GP` | Same for the *GP* (gross profit) column of the popup (L149; `SHOW_DOC_POPUP_GP`). | Off → column shown. | Immediate. Both popup keys were added June 2026 so that collection staff do not see cost and margin. |

Declared but not rendered: `TXN_HISTORY_SERVER_DOC_TYPE` ("Include Documents Without Journal") is still in the form model but its control is commented out; it is saved as `null` and read by nothing.

**Settings → Default Selection** (`default-settings.component.html`; SAVE sends the form plus the tab order)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Default Branch** | `DEFAULT_BRANCH` | Pre-selects the branch in the shared multi-branch dropdowns used by the Branch filters. | Empty. | Applies to everyone the next time a report is opened. Picking a branch also copies the branch's `MAIN_LOCATION` into Default Location. |
| **Default Location** | `DEFAULT_LOCATION` | Stored for the shared location dropdown. | Empty. | **No effect in this applet** — none of the seven reports has a location filter. |
| **Details Tab Ordering** (drag-and-drop list) | `DEBTOR_REPORT_DETAILS_TAB_ORDER` | Order of the eight tabs on *View Outstanding Document* (`outstanding-document-report-view.component.ts` L74–L77). | Details, Account, Line Items, Settlement, Contra, Delivery Details, Department, Doc Link. | Saved order applies to every user; tabs added in later versions are appended at the end. |

**Settings → Aging Period Settings** (shared `aging-period` module; data in `bl_fi_aging_period_hdr` / `_line`)

| Action | Keys written | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Create / edit a period: **Name**, **Type** `DAY` or `MONTH`; MONTH asks **Specify Number of Month**; DAY has a line table of **Start** / **End** day ranges (overlapping ranges are refused with *"The new period range overlaps with an existing range"*). | none | Defines the buckets. | No periods. | Nothing until a period is selected. |
| Tick the **Default Selection** checkbox on a row in the listing | `AGING_PERIOD_HDR_GUID`, `AGING_PERIOD_TYPE` (set to the row's type) | Which period the four aging listings load their ranges / month count from (`aging-period-listing.component.ts` L358–L371). Unticking writes both keys as `null`. | None. | Immediate. Because it also rewrites `AGING_PERIOD_TYPE`, choose the period first and the type second if they must differ. |

**Settings → Printable Format Settings** (applet-local; `.jrxml` only — **ADD** / **SAVE** stay disabled until a `.jrxml` file is attached)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Type** `STATEMENT_OF_ACCOUNT_TRANSACTION` + **Default** ticked | `PRINTABLE_STATEMENT_OF_ACCOUNT_TRANSACTION` (format GUID) | Template for **Preview** / **Download** on the *Statement Of Account → Transaction* tab (`POST …/statement-of-accounts/transactions/print-jasper-pdf`). | Empty → *"The default print preferences have not been configured"*. | Deleting the default format clears the key (`printable-format.effects.ts` L190–L228). |
| **Type** `STATEMENT_OF_ACCOUNT_AGING` + **Default** ticked | `PRINTABLE_STATEMENT_OF_ACCOUNT_AGING` | Template for the *Aging* sub-tab in *Summary* layout (`…/statement-of-accounts/aging/print-jasper-pdf`). | Empty → same message. | Same. |
| **Type** `STATEMENT_OF_ACCOUNT_AGING_CONTRA_DETAIL` + **Default** ticked | `PRINTABLE_STATEMENT_OF_ACCOUNT_AGING_CONTRA_DETAIL` | Template for the *Aging* sub-tab in *Contra Detail* layout (only reachable when `SHOW_CONTRA_DETAILREPORT_LAYOUT` is on). | Empty → same message. | Same. |

The listing shows *Format Code, Format Name, File Name, File Size, Uploaded Date, Uploaded By*; edit offers download and delete. The statement PDF's page-number parameter was fixed in March 2026 (repo issue #9); the export file name now carries the customer and period (April 2026).

**Personalization → Default Selection** (`personal-default-settings.component.html`; per user, saved through `savePersonalSettingsInit`)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Default Company** (single) | `DEFAULT_COMPANY` (personal) | Stored, and used only to filter the *Default Branch* dropdown on this screen. No listing reads it. | Empty. | None on the reports. |
| **Default Branch** (single, filtered by the company above) | `DEFAULT_BRANCH` (personal) | Pre-selects the branch in the shared multi-branch dropdowns for this user; overrides the applet-wide `DEFAULT_BRANCH` (`select-multi-branch-drop-down.component.ts` L258–L262, L306–L308). | Empty. | Applies the next time this user opens a report. |
| **Default Tab Orientation** (`HORIZONTAL` / `VERTICAL`) | `DEFAULT_ORIENTATION` (personal) | Stored; **no consumer** was found in this applet or in blg-shared-utilities (checked at commit `8b52c84`, 2026-09-02). | Empty. | None. |

**RESET** writes all three personal keys as `null`.

**Keys read at runtime that have no control in this applet**:

- `SHOW_DOCUMENTS_WITH_ZERO_ARAP_BAL` — in *Contra Select Document*, include documents whose balance is already zero (`contra-select-document.component.ts` L247).
- `DEFAULT_TOGGLE_COLUMN` (personal, written automatically) — remembers the single/double column layout per user.

### Document behaviour settings

Not applicable — this is a report applet; the only write action (contra) has no settings.

### Feature visibility / permissions

No client-side permission definitions exist for `debtor_report_applet` in the registry (checked 2026-09-05), so nothing in the menu or on the screens is hidden per role; the `SHOW_DOC_POPUP_*` codes the shared popup checks are likewise not seeded. Access is enforced by the backend per endpoint, and the applet asks the permission-inquiry service for these definitions at start-up (`app.component.ts` L26–L48): `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_DEBTOR_OUTSTANDING_DOCUMENT_READ`, `…_DEBTOR_OUTSTANDING_ENTITY_READ`, `…_DEBTOR_OUTSTANDING_AGING_READ`, `API_TNT_DM_ERP_DEBTOR_TRANSATION_HISTORY_REPORT_READ`, `TNT_DEBTOR_REPORT_BRANCH_TGT_READ`, `TNT_TENANT_ADMIN`, `TNT_TENANT_OWNER`.

| Report | Backend permission checked (READ, or the matching ADMIN/OWNER) | Company scope in the UI |
|---|---|---|
| Outstanding Document Report | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_OUTSTANDING_DOCUMENT_READ` (`EntityOutstandingDocumentController` L138–L147) | targets of `…_DEBTOR_OUTSTANDING_DOCUMENT_READ` |
| Aging Report | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_OUTSTANDING_AGING_READ` (`EntityOutstandingAgingController` L81–L90) | targets of `…_DEBTOR_OUTSTANDING_ENTITY_READ` |
| Statement of Account (listing) | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_DEBTOR_OUTSTANDING_ENTITY_READ` (`EntityReportController` L47–L57) | targets of the same |
| Statement tabs, Preview / Download (all three layouts) | `API_TNT_DM_ERP_STATEMENT_OF_ACCOUNT_READ` (`EntityStatementOfAccountController` L33–L147) | — |
| Historical Transaction Aging Analysis Report | `API_TNT_DM_ERP_DEBTOR_TRANSATION_HISTORY_REPORT_READ` (`TransactionHistoryReportController` L47–L54) | targets of the same |
| Historical Debtor Report | `API_TNT_DM_ERP_ENTITY_AR_AP_HISTORICAL_DEBTOR_READ` (`EntityReportController` L124–L134) — **not in the start-up inquiry** | targets of `…_DEBTOR_OUTSTANDING_ENTITY_READ` |
| AR Transaction Report | `API_TNT_DM_ERP_ARAP_TRANSACTION_READ` (L150–L159) — not in the start-up inquiry | targets of `…_DEBTOR_OUTSTANDING_DOCUMENT_READ` |
| Collection Invoice with Aging | `API_TNT_DM_ERP_ARAP_TRANSACTION_READ` (`/dynamic-report`, L182–L188) | targets of `…_DEBTOR_OUTSTANDING_DOCUMENT_READ` |
| Contra (create) | `API_TNT_DM_ERP_FI_GENERIC_DOC_ARAP_CONTRA_UPDATE` (`GenericDocumentArapContraController` L551–L560) | — |

"Company scope": a user with `TNT_TENANT_ADMIN` or `TNT_TENANT_OWNER` sees all companies; anyone else gets the company dropdown, and the implicit `company_guids` sent when no company is chosen, limited to the `bl_fi_mst_comp` targets of the permission named in the last column.

## Fields

There is no create/edit form; the fields are the advanced-search filters of each report, the statement tabs and the contra picker.

**Report filters** (`models/advanced-search-models/*.ts`; ✓ = present, **R** = required before search)

| Filter | Outstanding Document | Aging | Statement of Account | Historical Txn Aging | Historical Debtor | AR Transaction | Collection Invoice w/ Aging | Notes |
|---|---|---|---|---|---|---|---|---|
| Entity (customer, multi) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Customer entities only. |
| Customer Category (multi) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | – | |
| Company (multi) | ✓ | ✓ | ✓ | ✓ | ✓ | **R** (single) | – | |
| Branch (multi, filtered by company) | ✓ | ✓ | ✓ | ✓ | – | ✓ | ✓ | Dropdown variant depends on `ENABLE_BRANCH_FILTER_PERMISSION`. |
| Shipping Entity (multi) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | |
| Shipping Address | ✓ | – | – | – | – | – | – | Added September 2026. |
| Employee / Salesman (multi) | ✓ | ✓ | ✓ | – | – | – | ✓ | |
| ARAP Type (multi) | ✓ | – | – | – | – | – | – | Default `AR_TRADE, AR_OTHER, AR_MERCHANT`; the fourth option in the list is labelled `AP_EMPLOYEE` (a typo for the employee type). |
| Currency (single) | ✓ | – | ✓ | ✓ | – | – | – | `MYR` is treated as "no filter"; any other currency shows document-currency amounts instead of base-currency amounts. |
| As Of Date (month picker) | – | – | – | **R** | **R** | – | – | Month end is the cut-off (`date_txn < first day of next month`; `date_to` is 23:59:59 local time since June 2026 so the header shows the right month). |
| Transaction Date (from/to) | – | ✓ | ✓ | – | – | ✓ | ✓ | Defaults to today–today on the collection report; empty ends fall back to 2022-01-01 / 2099-12-31 on AR Transaction. |
| Outstanding Only (checkbox) | – | ✓ (on) | – | – | – | – | – | On the Historical Debtor Report the control is commented out; the query still honours `outstanding_filter = OUTSTANDING` if set. |
| Sort By | – | – | – | – | – | ✓ (`DATE_TXN`) | – | |
| Keyword (search box) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Minimum three characters. |

The Aging Report sends `arap_types = AR_TRADE, AR_OTHER, AR_MERCHANT` (no `AR_EMPLOYEE`, `outstanding-aging-report-listing.component.ts` L455); the historical and AR transaction reports send all four types.

**Statement Of Account tabs** (inside *Entity Report Transactions*)

| Tab | Field | Required | Notes |
|---|---|---|---|
| Transaction | Month From, Month To | Yes | Opening balance before *Month From* (unless `ENABLE_DEFAULT_DATE_FROM`), one line per document, closing balance; **Preview** / **Download** need the default `STATEMENT_OF_ACCOUNT_TRANSACTION` format. The last months used are remembered per browser. |
| Aging | Month To; **Report Layout** (*Summary* / *Contra Detail*) when `SHOW_CONTRA_DETAILREPORT_LAYOUT` is on | Yes | Month From is not used (`date_from` fixed at 2000-01-01); needs the default `STATEMENT_OF_ACCOUNT_AGING` or `…_AGING_CONTRA_DETAIL` format. |

**Contra Select Document** (opened from the Contra tab of *View Outstanding Document*)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Doc No, Reference, External Doc No (text); Document Type (select); Created Date, Transaction Date (ranges with tick boxes) | Filters for the candidate documents of the same customer and company. | No | Candidates are documents whose balance has the opposite sign to the open document; zero-balance documents only when `SHOW_DOCUMENTS_WITH_ZERO_ARAP_BAL` is set. |
| Row selection + **Amount Contra** (editable per row) | Amount to offset against the open document. | Yes | Selecting a row proposes the smaller of the row's balance and the remaining open amount; **ADD** is disabled while nothing is selected, while the total contra is 0, or while the total exceeds the open amount. |

## Lifecycle and effects

**What the reports read.** Only `bl_fi_generic_doc_hdr` rows with `posting_status = 'FINAL'` and an active status, restricted to AR entity types (the outstanding-documents query additionally requires `entity.is_customer = TRUE`), and filtered by the excluded document types (`EntityOutstandingDocumentUow` L101–L117, `EntityReportUow` L182–L194). Balances are the document header's `arap_doc_open`, `arap_contra` and `arap_bal` (`arap_bal = arap_doc_open + arap_contra`); when no currency filter is set, foreign-currency documents are converted to base currency by dividing by the document exchange rate (`arap_bal / base_doc_xrate`, `EntityReportUow.generateSqlForEntityReport`; client side `getBaseAmt`). "As of today" reports (Outstanding Document, Aging, Statement of Account, AR Transaction, Collection Invoice with Aging) query live headers. The two historical reports read the **historical-ageing snapshot** (`bl_fi_generic_doc_historical_ageing`, joined to FINAL headers, `date_txn < month end + 1`, `TransactionHistoryReportUow` L268–L299), which the backend maintains as documents are finalised and recalculates when a contra is back-dated (`GenericDocumentArapContraService` L387–L390). Nothing in this applet posts a journal or changes a document status.

**Contra — the one write path.** *View Outstanding Document → Contra → + → Contra Select Document → ADD* creates a contra between the open document and each selected document (`POST …/gen-doc/arap-contras/multi/backoffice-ep`).

| Item | Value |
|---|---|
| Server document type | none — rows are written to `bl_fi_generic_doc_arap_contra` (one row per pair; the service creates the mirrored pair and links them with a `group_guid`), status `ACTIVE`. |
| Amount signum | Client sends the absolute *Amount Contra* multiplied by the sign of the selected document's `arap_bal`, rounded to two decimals; the backend re-rounds to two decimals and silently drops zero amounts (`GenericDocumentArapContraService.createContras` L204–L235). |
| Quantity signum | none. |
| Dr/Cr equation | none, except that a **forex journal** is created for cross-currency pairs (`createContras` L362–L380 → `JournalPostingService.createJournalForex`). |
| GL precedence | not applicable. |
| Stock processor | none. |
| What it updates | On both documents, through the contra-calculate-balance queue: `arap_contra = Σ active contras`, `arap_bal = arap_doc_open + arap_contra` (`updateArapBalance`, L125–L139). Back-dated contras trigger a historical-ageing recalculation. |
| Backend validation | `GenericDocumentArapContraDco` checks only that the GUID is new, both document GUIDs exist, the amount is not null, and status/created/updated fields are filled. **There is no server-side check that the contra does not exceed the open balance** — that guard is the client-side ADD button only. |
| Permission | `API_TNT_DM_ERP_FI_GENERIC_DOC_ARAP_CONTRA_UPDATE` (403 → *"Documents contra unsuccessfully"*). |
| VOID / delete | Not available in this applet; the Contra tab lists rows with their status but has no delete action. |

## Related applets

- [Creditor Report Applet](/applets/finance/creditor-report-applet/) — the payable twin (same screens, `AP_*` types, payment/settlement reports instead of the collection report).
- [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/) — a separate applet that carries both sides in one menu; same endpoints, almost no settings, no contra creation.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — creates the settlements shown in the Settlement tab, the AR Transaction Report and Collection Invoice with Aging; contras created here change the balances its settlement picker offers.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Credit Note](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Return](/applets/sales-workflow/internal-sales-return-applet/) — the documents that carry customer balances.
- [Entity Applet](/applets/master-data/entity-applet/) — customer master, AR/AP type, credit term and credit limit; [Organisation Applet](/applets/master-data/organisation-applet/) — companies and branches.
- [Financial Report](/applets/finance/financial-report-applet/), [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) — the GL side to reconcile against.
- [Sales Report](/applets/sales-workflow/sales-report-applet/) — sales analysis by document, item and salesman; [Commission Scheme](/applets/membership/commission-scheme-applet/) — collection-based commission reads the same settlements.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| *"Search keyword must more than 2 characters."* | Keyword shorter than three characters. | Type at least three characters or use the filters. |
| Aging Report / Outstanding Document Report shows no bucket columns. | `AGING_PERIOD_TYPE` is `DAY` but no DAY aging period is ticked as default (or the period has no lines). | Create a DAY period with ranges under *Aging Period Settings* and tick it, or set the type back to MONTH. |
| Aging Period Type keeps changing back after saving Field Settings. | Ticking a period in *Aging Period Settings* rewrites `AGING_PERIOD_TYPE` with the period's type. | Select the period first, then set the type in Field Settings. |
| *"The default print preferences have not been configured"* on Preview / Download. | No `.jrxml` format of the matching type is flagged **Default** — including the third type when *Contra Detail* is chosen. | *Settings → Printable Format Settings*: add or edit the format with the right **Type** and tick **Default**. |
| *"No data to print. Please run the search first."* | Preview / Download clicked before SEARCH on the statement tab. | Set the months, click SEARCH, then export. |
| Statement PDF shows *null* as the page number (reported early 2026). | Template parameter bug. | Fixed March 2026 (repo issue #9); re-upload the template if it was customised from the old sample. |
| A customer's statement is missing an invoice, or the header shows the wrong month. | The *Month From* / *Month To* window did not include the document, or (before June 2026) the month end was computed in UTC and shifted by eight hours. | Widen the months; confirm the document is FINAL. The month-end handling was corrected in June 2026. |
| Historical Transaction Aging Analysis shows nothing for a month that had open documents (reported May 2026). | Snapshot rows not loaded for that filter combination. | Fixed May 2026; if a month is still empty, confirm the documents were FINAL at that month end. |
| Historical Debtor Report ignores the ARAP-type scope, or foreign-currency rows show the wrong amount (reported June–July 2026). | Filter and forex handling in the listings. | Both fixed (June and July 2026); apply the Currency filter to see document-currency amounts. |
| A shadow (copied) document shows the wrong amount on the Outstanding Document Report (reported July 2026). | Amount taken from the wrong header field for copied documents. | Fixed July 2026. |
| Collection Invoice with Aging does not show credit notes, or shows receipts as positive. | Older build. | Since July 2026 `INTERNAL_SALES_CREDIT_NOTE` is included and receipts / credit notes / returns are shown negative in red. |
| Company dropdown is empty for a user on a report. | The user is not tenant admin/owner and the report's READ permission was granted without company targets. | Grant the READ permission for that report with the companies as targets (Permission Set / User Permission). |
| Historical Debtor Report or AR Transaction Report returns *not authorised* although the four debtor permissions are granted. | Those endpoints check `API_TNT_DM_ERP_ENTITY_AR_AP_HISTORICAL_DEBTOR_READ` and `API_TNT_DM_ERP_ARAP_TRANSACTION_READ`, which the applet's start-up inquiry does not ask for. | Add both to the AR role. |
| Cost and GP columns still appear in the document popup for collection staff. | `HIDE_DOC_POPUP_COST_AMOUNT` / `HIDE_DOC_POPUP_GP` not saved, or the user's personal settings override them. | Switch both toggles on under *Field Settings → Misc* and SAVE; there is no seeded `SHOW_DOC_POPUP_*` permission to re-enable them per role. |
| Personal *Default Tab Orientation* does nothing. | The key is saved but nothing reads it. | Cosmetic; ignore. |
| Debtor total does not agree with the Balance Sheet trade-debtor line (recurring customer question). | The reports show document balances of FINAL customer documents after excluded types, contras and forex conversion at the document rate; the Balance Sheet shows GL journal balances, which include manual journals and documents posted to other debtor accounts. | Compare *AR Transaction Report* for the period with the GL account in [Ledger And Journal](/applets/finance/ledger-and-journal-applet/); check *Document Types to Exclude* and any non-FINAL documents. |
| *"Documents contra unsuccessfully"* | The backend rejected the contra (most often a missing `API_TNT_DM_ERP_FI_GENERIC_DOC_ARAP_CONTRA_UPDATE` permission). | Grant the permission; retry. The client-side ADD guard already prevents contras larger than the open amount. |
| Applet did not load on production (December 2025). | Deployment of the split repository (repo issues #1, #6). | Resolved; clear the browser cache if an old bundle is still served. |

## Related documentation

- [Reports & Analytics](/user-guide/reports-analytics/) — where this applet sits among the finance reports.
- [Financial Accounting module](/modules-v2/financial-accounting/) and [Digital CRM module](/modules-v2/crm-digital/).
- [Creditor Report Applet](/applets/finance/creditor-report-applet/) and [Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/) — the sibling reference pages.
