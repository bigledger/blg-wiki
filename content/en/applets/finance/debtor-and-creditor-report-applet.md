---
title: "Debtor and Creditor Report"
description: "One applet with both sides of the sub-ledger: outstanding documents, aging, statements of account, historical snapshots and transaction reports for customers (AR) and suppliers (AP), plus the salesman collection report and the two payment/settlement reports."
applet_code: "debtor-and-creditor-report-applet"
applet_repo: "blg-applet-wavelet-debtor-and-creditor-report-applet"
modules: [financial-accounting, crm-digital, purchasing]
related_applets:
  - debtor-report-applet
  - creditor-report-applet
  - internal-receipt-voucher-applet
  - internal-payment-voucher-applet
  - internal-sales-invoice-applet
  - internal-purchase-invoice-no-stock-in-applet
  - entity-applet
  - organisation-applet
  - financial-report-applet
  - ledger-and-journal-applet
guides:
  - /user-guide/reports-analytics/
sources:
  screens:
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/app.routing.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/services/api-service.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/services/creditor-outstanding-document-report-pages.service.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/outstanding-document-report-container/outstanding-document-report-view/outstanding-document-report-view.component.html
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/outstanding-document-report-container/outstanding-document-report-view/contra/contra.component.html
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/outstanding-entity-report-view.component.html
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/creditor-outstanding-entity-report-container/outstanding-entity-report-view/outstanding-entity-report-view.component.html
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/state-controllers/creditor-outstanding-document-report-controller/store/effects/outstanding-document-report.effects.ts
  configuration:
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/settings-container/settings-container.component.html
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/settings-container/printable-format-settings-container/add-printable-format/add-printable-format.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/constants/server-doc-type.constant.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/outstanding-aging-report-container/outstanding-aging-report-listing/outstanding-aging-report-listing.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/txn-history-container/txn-history-listing/txn-history-listing.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/historical-creditor-container/historical-creditor-report-listing/historical-creditor-report-listing.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/outstanding-entity-report-container/outstanding-entity-report-view/entity-soa-txn/entity-soa-txn.component.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/app.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - akaun_master.bl_applet_client_side_perm_dfn
  fields:
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/outstanding-document-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/creditor-outstanding-document-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/outstanding-aging-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/creditor-outstanding-aging-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/outstanding-entity-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/creditor-outstanding-entity-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/txn-history-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/creditor-txn-history-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/historical-debtor-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/historical-creditor-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/ar-transaction-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/ap-transaction-report.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/collection-invoice-aging.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/pv-with-purchase-invoice.model.ts
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/models/advanced-search-models/purchase-invoice-with-settlement.model.ts
  lifecycle:
    - blg-applet-wavelet-debtor-and-creditor-report-applet/micro-fe/projects/wavelet-erp/applets/debtor-and-creditor-report-applet/src/app/components/outstanding-document-report-container/outstanding-document-report-view/contra/contra.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityOutstandingDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityReportController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entityArApReport/EntityStatementOfAccountController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/reports/TransactionHistoryReportController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/reports/purchase/PurchaseReportController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityArApReportUow/EntityReportUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityArApReportUow/EntityOutstandingDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/TransactionHistoryReportUow.java
  troubleshooting:
    - gh:bigledger/blg-applet-wavelet-debtor-and-creditor-report-applet#1
    - gh:bigledger/blg-applet-wavelet-debtor-and-creditor-report-applet#2
    - gh:bigledger/blg-wiki#52
    - customer-issue trackers referenced by commits in the applet repo (anonymised; see kb/topics/debtor-and-creditor-report-applet.md)
tags:
- accounts-receivable
- accounts-payable
- debtor-report
- creditor-report
- aging-analysis
- financial-reports
weight: 70
aliases:
- /applets/debtor-and-creditor-report-applet/
---

## Overview

The **Debtor and Creditor Report** applet is one workspace for reviewing both sides of the sub-ledger: money customers owe you (accounts receivable, "debtors") and money you owe suppliers (accounts payable, "creditors"). Its left menu carries fifteen reports — a debtor and a creditor version of the outstanding-document, aging, statement-of-account, historical-aging and historical-balance reports, plus the AR and AP transaction reports, the salesman collection report and the two payment/settlement reports. It reads the same FINAL documents that the sales, purchase, receipt and payment applets create and **writes nothing**.

{{< callout type="info" >}}
**In plain English:** open a *Debtor …* report when the question is about a customer's balance, a *Creditor …* report when it is about a supplier's balance. The screens on the two sides are copies of each other; only the entity types and the document types they include differ.
{{< /callout >}}

In the product the applet is titled **Debtor & Creditor Report** and its route root is `applet/tnt/wavelet/erp/debtor-and-creditor-report-applet`. It is a separate product from the single-sided [Debtor Report Applet](/applets/finance/debtor-report-applet/) and [Creditor Report Applet](/applets/finance/creditor-report-applet/), which share its report engine but carry their own settings screens (this applet has almost none — see [Configuration](#configuration)). Choose this applet when one team reviews both sides; choose the single-sided applets when you need aging periods, excluded document types, contra creation or the salesman-code and popup settings.

## Where it fits

| Position | Applet / document | Why |
|---|---|---|
| Upstream (customer documents) | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) and the other sales documents, [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | Every FINAL customer document with an AR/AP balance (`arap_bal`) is a row in the *Debtor …* reports; receipts and their settlement lines feed the Settlement tabs, the *AR Transaction Report* and *Collection Invoice with Aging*. |
| Upstream (supplier documents) | [Purchase Invoice No Stock In](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) and the other purchase documents, [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | Every FINAL supplier document with a balance is a row in the *Creditor …* reports; payments feed the *AP Transaction Report* and the two payment/settlement reports. |
| Upstream (master data) | [Entity](/applets/master-data/entity-applet/), [Organisation](/applets/master-data/organisation-applet/) | Which side an entity appears on is decided by its AR/AP type (`AR_*` or `AP_*`, on the entity or on its company link); companies and branches are the filters and the permission targets. |
| Sibling reports | [Debtor Report Applet](/applets/finance/debtor-report-applet/), [Creditor Report Applet](/applets/finance/creditor-report-applet/) | The single-sided applets: same endpoints, more settings, contra creation. |
| Downstream (reconciliation) | [Financial Report](/applets/finance/financial-report-applet/), [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) | The balances here are the sub-ledger behind the trade-debtor and trade-creditor lines of the Balance Sheet. |

## Screens and menus

Every menu item opens a listing with an advanced-search bar (keyword plus filters), a *Current DateTime* or *As of Date* label, an AG Grid with export, and — where the repo has one — a drill-down that opens in the right-hand column. The default landing page is *Debtor Outstanding Document Report*.

| Menu item | Route | Backend call | What it shows / drill-down |
|---|---|---|---|
| **Debtor Outstanding Document Report** (default) | `outstanding-document-report` | `POST …/entity-ar-ap-report/outstanding-documents/backoffice-ep` | One row per open customer document as of today, with an *Aging Summary* strip above the grid. Click a row for **View Outstanding Document** (tabs *Details, Account, Line Items, Delivery Details, Settlement, Department, Contra, Doc Link*; header **PRINT**). The *Contra* tab lists existing contras only — there is no add button in this applet. |
| **Creditor Outstanding Document Report** | `creditor-outstanding-document-report` | same endpoint, supplier types | Same listing and *Aging Summary* for supplier documents. The container registers only the listing column: clicking a row loads the document and greys the row, but **no View Outstanding Document column opens** (current repo). |
| **Debtor Aging Report** | `outstanding-aging-report` | `POST …/entity-ar-ap-report/outstanding-aging/details` | Open customer documents grouped by customer with month bucket columns. Click a row for **Aging Report Transactions** (*Main*, *Outstanding Docs* → document details with *Main Details, Line Items, Cashbook, Contra, Doc Link, Journal Txn*). |
| **Creditor Aging Report** | `creditor-outstanding-aging-report` | same endpoint (the backend's `/creditor/details` variant is not called) | Listing only; no drill-down column in the current repo. |
| **Debtor Statement of Account** | `outstanding-entity-report` | `GET …/entity-reports/entity/backoffice-ep` | One row per customer and currency: PNS Amount, Settlement Amount, Docs Open, Contra, Balance. Click a row for **Entity Report Transactions** — tabs *Entity Details*, *Transaction Docs*, *Statement Of Account* (sub-tabs *Transaction* and *Aging*, each with SEARCH, **Export to PDF** and **Preview**). |
| **Creditor Statement of Account** | `creditor-outstanding-entity-report` | same endpoint | Same three-tab view for suppliers. |
| **Debtor Historical Transaction Aging Analysis Report** | `txn-history-report` | `POST …/reports/transaction-history/debtor` | Line-level aging as at the end of the chosen month, from the historical-ageing snapshot. Listing only. |
| **Creditor Historical Transaction Aging Analysis Report** | `creditor-txn-history-report` | `POST …/reports/transaction-history/creditor` | Same for suppliers. Listing only. |
| **Debtor Historical Report** | `historical-debtor` | `GET …/entity-reports/historical-debtor/backoffice-ep` | One balance per customer as at month end, six calendar-month columns plus *6 Month+*. Click a row for *Entity Details* / *Transaction Docs*. |
| **Creditor Historical Report** | `historical-creditor` | same endpoint, supplier types | Same for suppliers, with the same two-tab view. |
| **AR Transaction Report** | `ar-transaction` | `POST …/entity-reports/arap-transations/backoffice-ep` | All AR movements in a date range grouped by customer, with Debit, Credit, Contra and running Balance. |
| **AP Transaction Report** | `ap-transaction` | same endpoint | Same for suppliers. |
| **Collection Invoice with Aging** | `collection-invoice-aging` | `POST …/entity-reports/dynamic-report/backoffice-ep` | Sales invoices / cash bills paired with the receipts and credit notes that settled them, grouped by salesman and customer, with *Payment Days* and aging buckets. |
| **Payment Details with Purchase Invoice** | `pv-with-purchase-invoice` | `POST …/reports/purchase/payment-detail-with-purchase-invoice/backoffice-ep` | Each payment document and the purchase invoices it settled. |
| **Purchase Invoice with Settlement Details** | `purchase-invoice-with-settlement` | `POST …/reports/purchase/purchase-invoice-settlement-details/backoffice-ep` | Each purchase invoice and its settlement lines. |

The **Settings** menu (group *System Configuration*) has **Field Settings**, **Default Selection** and **Printable Format Settings**; the settings route also reaches the shared Webhook, Client Side Permission, Permission Set, User/Team/Role Permission and Release Notes screens. There is **no Aging Period Settings** item in this applet. **Personalization** has one item, **Default Selection**.

{{< figure src="/images/debtor-and-creditor-report-applet/debtor-creditor-printable-format-settings.png" alt="Printable Format Settings listing inside the Debtor and Creditor Report applet settings" caption="Settings → Printable Format Settings: the only settings screen in this applet that persists anything. The screenshot predates the June 2026 menu expansion, so the sidebar shows three reports instead of fifteen." >}}

The keyword box requires at least three characters; the two payment/settlement reports do not support keyword search at all (advanced search only).

## Configuration

### Before you can use it

- **Documents must be FINAL.** Every query filters `posting_status = 'FINAL'` and an active status (`EntityReportUow.generateWhereClauseForEntityReport`, `EntityOutstandingDocumentUow` L101–L117, `TransactionHistoryReportUow` where-clauses). Draft or voided documents never appear.
- **Entities need an AR or AP type.** The *Debtor …* screens return entities whose default AR/AP type (or company link) is an `AR_*` type; the *Creditor …* screens use the `AP_*` types. Set it in the [Entity Applet](/applets/master-data/entity-applet/) or on the company link.
- **Companies and branches** come from the [Organisation Applet](/applets/master-data/organisation-applet/). *AR Transaction Report* and *AP Transaction Report* require **Company**; *Purchase Invoice with Settlement Details* requires **Branch** (*"Please select branch."*).
- **Server-side read permissions** for each report (see [Feature visibility / permissions](#feature-visibility--permissions)), granted *with company targets* for users who are not tenant admin or owner.
- **A `.jrxml` printable format** of type `STATEMENT_OF_ACCOUNT_TRANSACTION` and/or `STATEMENT_OF_ACCOUNT_AGING`, flagged **Default**, before anyone uses **Export to PDF** / **Preview** on a statement.

### Applet settings

Where settings live: this applet does **not** use the shared `FieldConfigurationComponent` from blg-shared-utilities and has no applet-level settings form of its own. Of the three screens under *Settings*, only **Printable Format Settings** persists anything; it writes two keys into the applet's `APPLET_SETTINGS` JSON (`bl_applet_ext`) through its own `saveSettings` effect, which **merges** with the keys already stored. Every listing still *reads* the same keys the single-sided applets use (see the runtime-only list below), so a tenant that needs day-range buckets or excluded document types here has to have those keys written by another means.

Who can change them: anyone who can open the applet's **Settings** menu. The registry holds **no client-side permission definitions** for this applet (0 rows in `bl_applet_client_side_perm_dfn` on 2026-09-05), so nothing in the menu is gated in the UI.

**Settings → Field Settings** (`field-configuration.component.html`) — renders two panels, *Lines Settings* (Unit Discount, SST/VAT/GST, WHT, Blanket Order) and *Department Settings* (Segment, G/L Dimension, Profit Center, Project), but **none of the eight toggles is bound to a form control, nothing is loaded, and the SAVE button has no click handler** (`field-configuration.component.ts` is an empty component). No exposed control found; the screen is a placeholder (routes and settings components checked at commit `0567e78`, 2026-08-26).

**Settings → Default Selection** (`default-settings.component.html`) — renders *Default Branch* and *Default Location* dropdowns, but the component never receives the applet container (`appletSettings$` is declared and never subscribed, `appletContainer` stays undefined), so choosing a branch throws in the browser console and **SAVE emits to no listener**. Nothing is persisted; `DEFAULT_BRANCH` / `DEFAULT_LOCATION` cannot be set from this applet.

**Settings → Printable Format Settings** (applet-local; `.jrxml` only — **ADD** / **SAVE** stay disabled until a `.jrxml` file is attached; `add-printable-format.component.ts` L40–L41, L93)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Type** `STATEMENT_OF_ACCOUNT_TRANSACTION` + **Default** ticked | `PRINTABLE_STATEMENT_OF_ACCOUNT_TRANSACTION` (format GUID) | The template used by **Export to PDF** / **Preview** on the *Statement Of Account → Transaction* tab of both statement views (`POST …/statement-of-accounts/transactions/print-jasper-pdf`). | Empty → the buttons show *"The default print preferences have not been configured"*. | Deleting the default format clears the key (`printable-format.effects.ts` L190–L228). |
| **Type** `STATEMENT_OF_ACCOUNT_AGING` + **Default** ticked | `PRINTABLE_STATEMENT_OF_ACCOUNT_AGING` | Same for the *Aging* tab (`…/statement-of-accounts/aging/print-jasper-pdf`). | Empty → same message. | Same. |

The listing shows *Format Code, Format Name, File Name, File Size, Uploaded Date, Uploaded By*; edit offers download and delete.

**Personalization → Default Selection** — renders *User Default Settings* (Default Branch, Default Location) but, exactly like the applet-wide screen, never loads values and its SAVE has no listener. Nothing is persisted.

**Keys read at runtime that have no control in this applet** (settings are stored per applet, so values saved in the Debtor or Creditor Report Applet do not carry over; these can only be set by editing this applet's `APPLET_SETTINGS` JSON):

| Key | Read by | Effect |
|---|---|---|
| `AGING_PERIOD_TYPE`, `AGING_PERIOD_HDR_GUID` | both aging listings, both historical aging listings, both outstanding-document listings, Collection Invoice with Aging | `DAY` plus a DAY aging period GUID gives day-range bucket columns; otherwise calendar-month columns (six, or the period's month count). With nothing set the applet shows six month columns plus *6M+* (`outstanding-aging-report-listing.component.ts` L286–L318). |
| `ENABLE_BRANCH_FILTER_PERMISSION` | the same listings | Switches the Branch filter from the company-permission-filtered dropdown to the standard branch dropdown. |
| `USE_SALESMAN_CODE_INSTEAD_OF_NAME` | outstanding-document and aging listings (both sides) | Shows the salesman code instead of the name. |
| `ENABLE_PORTRAIT_HISTORICAL_TRANSACTION_AGING_ANALYSIS_REPORT` | both historical aging listings | Portrait instead of landscape print/export (`txn-history-listing.component.ts` L357). |
| `ENABLE_DEFAULT_DATE_FROM` | the *Statement Of Account* tabs | When true, the Transaction statement ignores *Month From* and starts from 2000-01-01 (`entity-soa-txn.component.ts` L207, L338–L342). |
| `CREDITOR_EXCLUDE_SERVER_DOC_TYPES` | **Creditor Historical Report only** (`historical-creditor-report-listing.component.ts` L191) | Extra document types to exclude from that one report. |

**Excluded document types are hard-coded here.** Every other listing sends a fixed list as `exclude_server_doc_types` (`models/constants/server-doc-type.constant.ts`): the *Debtor …* screens exclude 22 purchase-side types (purchase invoices, GRNs, debit/credit notes, payment vouchers, consignment documents, goods delivery/dispatch notes, `INTERNAL_PURCHASE_GRN_STOCK_IN`), the *Creditor …* screens exclude 25 sales-side types (sales invoices, cash bills, receipt vouchers, credit/debit notes, returns, jobsheets, packing orders, customer consignments, plus `INTERNAL_PURCHASE_GRN_STOCK_IN`, added July 2026 after a customer saw GRN stock-ins double-counted). A GRN stock-in with an open supplier balance therefore never appears in this applet's creditor reports, and there is no setting to change that.

### Document behaviour settings

Not applicable — this is a report applet with no write action.

### Feature visibility / permissions

No client-side permission definitions exist for `debtor-and-creditor-report-applet` in the registry (checked 2026-09-05). Access is enforced by the backend per endpoint. At start-up the applet asks the permission-inquiry service for (`app.component.ts` L26–L72): `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_CREDITOR_OUTSTANDING_DOCUMENT_READ`, `…_CREDITOR_OUTSTANDING_ENTITY_READ`, `…_CREDITOR_OUTSTANDING_AGING_READ`, `…_DEBTOR_OUTSTANDING_DOCUMENT_READ`, `…_DEBTOR_OUTSTANDING_ENTITY_READ`, `…_DEBTOR_OUTSTANDING_AGING_READ`, `API_TNT_DM_ERP_CREDITOR_TRANSATION_HISTORY_REPORT_READ`, `API_TNT_DM_ERP_DEBTOR_TRANSATION_HISTORY_REPORT_READ`, `API_TNT_DM_ERP_PURCHASE_INVOICE_SETTLEMENT_DETAIL_REPORT_READ`, `API_TNT_DM_ERP_PAYMENT_DETAIL_PURCHASE_INVOICE_REPORT_READ`, `API_TNT_DM_ERP_ARAP_TRANSACTION_READ`, `TNT_DEBTOR_REPORT_BRANCH_TGT_READ`, `TNT_TENANT_ADMIN`, `TNT_TENANT_OWNER`.

| Report | Backend permission checked (READ, or the matching ADMIN/OWNER) | Company scope used by the listing's dropdowns |
|---|---|---|
| Debtor / Creditor Outstanding Document Report | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_OUTSTANDING_DOCUMENT_READ` (`EntityOutstandingDocumentController` L138–L147) | targets of `…_DEBTOR_OUTSTANDING_DOCUMENT_READ` — **on both sides** |
| Debtor / Creditor Aging Report | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_OUTSTANDING_AGING_READ` (`EntityOutstandingAgingController` L81–L90) | targets of `…_DEBTOR_OUTSTANDING_ENTITY_READ` — both sides |
| Debtor / Creditor Statement of Account (listing) | `API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_DEBTOR_OUTSTANDING_ENTITY_READ` (`EntityReportController` L47–L57) | targets of the same — both sides |
| Statement tabs, Export / Preview | `API_TNT_DM_ERP_STATEMENT_OF_ACCOUNT_READ` (`EntityStatementOfAccountController` L33–L116) | — |
| Debtor Historical Transaction Aging Analysis | `API_TNT_DM_ERP_DEBTOR_TRANSATION_HISTORY_REPORT_READ` (`TransactionHistoryReportController` L47–L54) | targets of the same |
| Creditor Historical Transaction Aging Analysis | `API_TNT_DM_ERP_CREDITOR_TRANSATION_HISTORY_REPORT_READ` (L75–L82) | targets of `…_DEBTOR_TRANSATION_HISTORY_REPORT_READ` |
| Debtor / Creditor Historical Report | `API_TNT_DM_ERP_ENTITY_AR_AP_HISTORICAL_DEBTOR_READ` (`EntityReportController` L124–L134) | targets of `…_DEBTOR_OUTSTANDING_ENTITY_READ` |
| AR / AP Transaction Report | `API_TNT_DM_ERP_ARAP_TRANSACTION_READ` (L150–L159) | AR: targets of `…_DEBTOR_OUTSTANDING_DOCUMENT_READ`; AP: targets of `…_ARAP_TRANSACTION_READ` |
| Collection Invoice with Aging | `API_TNT_DM_ERP_ARAP_TRANSACTION_READ` (`/dynamic-report`, L182–L188) | targets of `…_DEBTOR_OUTSTANDING_DOCUMENT_READ` |
| Payment Details with Purchase Invoice | `API_TNT_DM_ERP_PAYMENT_DETAIL_PURCHASE_INVOICE_REPORT_READ` (`PurchaseReportController` L164–L176) | targets of the same |
| Purchase Invoice with Settlement Details | `API_TNT_DM_ERP_PURCHASE_INVOICE_SETTLEMENT_DETAIL_REPORT_READ` (L136–L148) | targets of the same |

Because the creditor screens were copied from the debtor ones, a role built only from `CREDITOR_*` permissions gets an **empty company dropdown** on the creditor listings; the practical minimum for an AP-only user is the debtor outstanding-document and outstanding-entity READ permissions with company targets as well. Branch dropdowns are scoped by the targets of `TNT_DEBTOR_REPORT_BRANCH_TGT_READ` on both sides. Tenant admins and owners see all companies.

## Fields

There is no create/edit form; the fields are the advanced-search filters of each report and the two statement tabs.

**Report filters** (`models/advanced-search-models/*.ts`; ✓ = present, **R** = required before search)

| Filter | Debtor Outstanding Doc | Creditor Outstanding Doc | Debtor Aging | Creditor Aging | Debtor SOA | Creditor SOA | Debtor Hist. Aging | Creditor Hist. Aging | Debtor Hist. | Creditor Hist. | AR Txn | AP Txn | Collection | Payment Details | PI w/ Settlement |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Entity (multi) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Customer Category / Supplier Category | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | – | – | – |
| Company | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | **R** | **R** | – | ✓ | – |
| Branch | ✓ | ✓ | ✓ | – | ✓ | ✓ | ✓ | ✓ | – | – | ✓ | ✓ | ✓ | ✓ | **R** |
| Shipping Entity | ✓ | – | ✓ | – | ✓ | – | ✓ | – | ✓ | – | ✓ | – | ✓ | – | – |
| Employee / Salesman | ✓ | – | ✓ | – | ✓ | – | – | – | – | – | – | – | ✓ | – | – |
| Currency | ✓ | ✓ | – | – | ✓ | – | ✓ | ✓ | – | – | – | – | – | – | – |
| As Of Date (month picker) | – | – | – | – | – | – | **R** | **R** | **R** | **R** | – | – | – | – | – |
| Transaction Date (from/to) | – | – | ✓ | – | ✓ | – | – | – | – | – | ✓ | ✓ | ✓ | ✓ | ✓ |
| Sort By | – | – | – | – | – | – | – | – | – | – | ✓ | ✓ | – | – | – |
| Cashbook | – | – | – | – | – | – | – | – | – | – | – | – | – | ✓ | – |
| Show purchase invoice without settlement details | – | – | – | – | – | – | – | – | – | – | – | – | – | – | ✓ |

There is **no ARAP Type filter** on any listing; the side is fixed by the menu item. Keyword search needs at least three characters; with no currency filter, foreign-currency amounts are shown in base currency (divided by the document rate), and a non-MYR currency filter shows document-currency amounts.

**Statement Of Account tabs** (inside *Entity Report Transactions*, both sides)

| Tab | Field | Required | Notes |
|---|---|---|---|
| Transaction | Month From, Month To | Yes | Opening balance before *Month From*, one line per document, closing balance; **Export to PDF** / **Preview** need the default `STATEMENT_OF_ACCOUNT_TRANSACTION` format. *Month From* is ignored when `ENABLE_DEFAULT_DATE_FROM` is set. |
| Aging | Month To | Yes | Month From is not used (`date_from` fixed at 2000-01-01); **Export to PDF** / **Preview** need the default `STATEMENT_OF_ACCOUNT_AGING` format. |

## Lifecycle and effects

**What the reports read.** Only `bl_fi_generic_doc_hdr` rows with `posting_status = 'FINAL'` and an active status, restricted to the side's entity types and filtered by the hard-coded excluded document types (`EntityOutstandingDocumentUow` L101–L117, `EntityReportUow` L182–L194). Balances are the header's `arap_doc_open`, `arap_contra` and `arap_bal` (`arap_bal = arap_doc_open + arap_contra`). "As of today" reports query live headers; the four historical reports read the **historical-ageing snapshot** (`bl_fi_generic_doc_historical_ageing`, joined to FINAL headers with `date_txn < month end + 1 day`, `TransactionHistoryReportUow` L268–L299, `EntityReportUow` L440–L500), which the backend maintains as documents are finalised. *Collection Invoice with Aging* is a dynamic report that pairs `INTERNAL_SALES_INVOICE` / `INTERNAL_SALES_CASHBILL` headers with the `INTERNAL_RECEIPT_VOUCHER` / `INTERNAL_SALES_CREDIT_NOTE` documents settling them.

**What it writes.** Nothing. The *Contra* tabs read `bl_fi_generic_doc_arap_contra` rows (`contra.component.ts` L77, `getByCriteria`); the contra-create endpoint is declared in `api-service.ts` but no screen in this applet calls it, and there is no add button on any Contra tab. No document status changes, no journal, no stock movement. To create a contra use the [Debtor Report Applet](/applets/finance/debtor-report-applet/) or [Creditor Report Applet](/applets/finance/creditor-report-applet/).

## Related applets

- [Debtor Report Applet](/applets/finance/debtor-report-applet/) — the receivable side on its own, with Field Settings, aging periods, personal defaults and contra creation.
- [Creditor Report Applet](/applets/finance/creditor-report-applet/) — the payable side on its own, same additions.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) and [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — create the settlements shown in the Settlement tabs, the transaction reports and the payment/settlement reports.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Purchase Invoice No Stock In](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) — the main documents carrying customer and supplier balances.
- [Entity Applet](/applets/master-data/entity-applet/) — AR/AP type decides the side; [Organisation Applet](/applets/master-data/organisation-applet/) — companies and branches.
- [Financial Report](/applets/finance/financial-report-applet/), [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) — the GL side to reconcile against.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Field Settings toggles (Unit Discount, SST/VAT/GST, Segment, …) never stay on after SAVE. | The screen is a placeholder: no control is bound and SAVE has no handler. | Nothing to configure here; the toggles have no effect on any report. |
| Default Branch does not stick; the browser console shows an error when a branch is picked. | *Default Selection* (applet-wide and personal) never loads or saves the applet container. | Not available in this applet. Use the Debtor or Creditor Report Applet if a default branch is needed. |
| Aging columns are always calendar months; no way to set 30/60/90-day buckets. | No *Aging Period Settings* menu, and `AGING_PERIOD_TYPE` / `AGING_PERIOD_HDR_GUID` have no control here. | Use the single-sided applets, or have the two keys written into this applet's `APPLET_SETTINGS` JSON. |
| The **Statement** / **Statement(aging)** buttons described in older documentation are missing from *Entity Report Transactions*. | Removed; the header now has only the back button. The print code behind them (`onPrintStatement*`) is unreachable. | Open the *Statement Of Account* tab and use **Export to PDF** / **Preview** on the *Transaction* or *Aging* sub-tab. |
| *"The default print preferences have not been configured"* on Export to PDF / Preview. | No `.jrxml` format of the matching type is flagged **Default**. | *Settings → Printable Format Settings*: add or edit the format with the right **Type** and tick **Default**. |
| *"No data to print. Please run the search first."* | Export/Preview clicked before SEARCH on the statement tab. | Set the months, click SEARCH, then export. |
| *"Please select branch."* | Branch left empty on *Purchase Invoice with Settlement Details*. | Choose a branch; the search is not sent otherwise. |
| Clicking a row on *Creditor Outstanding Document Report* (or *Creditor Aging Report*) only highlights it. | Those containers register the listing column only; the debtor side has the view columns. | Use *Creditor Statement of Account → Transaction Docs* for supplier document detail, or the Creditor Report Applet. |
| A GRN stock-in with an open supplier balance never shows on the creditor reports. | `INTERNAL_PURCHASE_GRN_STOCK_IN` is in the hard-coded exclusion list on both sides (added after a double-counting report, July 2026). | By design here. The Creditor Report Applet makes the exclusion configurable. |
| Company dropdown is empty for an AP-only user on the creditor listings. | The creditor listings scope companies by the targets of the **debtor** outstanding-document / outstanding-entity READ permissions. | Grant those two debtor READ permissions with company targets as well, or make the user tenant admin. |
| *Debtor Historical Report* or *Creditor Historical Report* returns *not authorised* although the aging permissions are granted. | The endpoint checks `API_TNT_DM_ERP_ENTITY_AR_AP_HISTORICAL_DEBTOR_READ`, which the applet's start-up inquiry does not even ask for. | Add that permission to the role (for both sides). |
| Totals do not agree with the Balance Sheet. | The reports show document balances of FINAL documents after the hard-coded exclusions and forex conversion at the document rate; the Balance Sheet shows GL journal balances including manual journals. | Compare the *AR* / *AP Transaction Report* for the period with the GL account in [Ledger And Journal](/applets/finance/ledger-and-journal-applet/). |
| Applet failed to load after the December 2025 repository split / March 2026 Angular 14 migration. | Build and dependency issues tracked as repo issues #1 and #2. | Resolved in the current build; clear the browser cache if an old bundle is still served. |

## Related documentation

- [Reports & Analytics](/user-guide/reports-analytics/) — where this applet sits among the finance reports.
- [Financial Accounting module](/modules-v2/financial-accounting/), [Digital CRM module](/modules-v2/crm-digital/) and [Purchasing module](/modules-v2/purchasing/).
- [Debtor Report Applet](/applets/finance/debtor-report-applet/) and [Creditor Report Applet](/applets/finance/creditor-report-applet/) — the single-sided reference pages.
