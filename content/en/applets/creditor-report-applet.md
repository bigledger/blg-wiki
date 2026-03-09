---
title: "Creditor Report Applet"
description: "Run creditor-focused outstanding, aging, statement, and transaction reports with drill-down tabs, export actions, and configurable defaults."
tags:
- finance
- creditor-report
- accounts-payable
- aging-analysis
- statement-of-account
---

## Purpose and Overview

The **Creditor Report** applet consolidates creditor/AP reporting into one workspace with multiple report views, drill-down tabs, and export actions. It is designed for teams that need fast visibility into outstanding balances, aging position, historical movement, and settlement-related detail.

Main sidebar report entries (exact UI labels):
- **Outstanding Document Report**
- **Aging Report**
- **Statement of Account**
- **Historical Transaction Aging Analysis Report**
- **Historical Creditor Report**
- **AP Transaction Report**
- **Payment Details with Purchase Invoice**
- **Purchase Invoice with Settlement Details**

## Who Benefits

- **AP Operations**: Track creditor balances and open documents quickly from **Outstanding Document Report** and **Aging Report**.
- **Finance Controllers**: Review consolidated exposure using **Statement of Account** and **Historical Creditor Report**.
- **Audit and Compliance**: Drill from listing to detail tabs and use print/export actions for evidence.
- **Management**: Monitor movement trends via **Historical Transaction Aging Analysis Report** and settlement-oriented views.

## What Problems This Solves

- Replaces manual AP aging consolidation across spreadsheets.
- Reduces time to find document-level evidence behind balance figures.
- Standardizes reporting entry points and default filters across users.
- Improves consistency with built-in applet and personal default settings.

## Key Features Overview

{{< cards >}}
  {{< card title="Outstanding Document Report" subtitle="Creditor outstanding at document level with row drill-down" link="#outstanding-document-report" >}}
  {{< card title="Aging Report" subtitle="Creditor aging with detail and outstanding docs view" link="#aging-report" >}}
  {{< card title="Statement of Account" subtitle="Entity-level position with statement tabs" link="#statement-of-account" >}}
  {{< card title="Historical Views" subtitle="Historical Transaction Aging Analysis Report and Historical Creditor Report" link="#historical-views" >}}
  {{< card title="AP and Settlement Reports" subtitle="AP Transaction Report, Payment Details with Purchase Invoice, Purchase Invoice with Settlement Details" link="#ap-and-settlement-reports" >}}
  {{< card title="Configuration" subtitle="Field Settings, Default Selection, Printable Format Settings, Aging Period Settings, and Personal Default Selection" link="#configuration--settings" >}}
{{< /cards >}}

## Role-Based Quick Start

### AP Analyst: Outstanding Document Follow-Up

1. Open **Outstanding Document Report** from the sidebar.
2. Use the search panel and run query from the listing titled **Creditor Outstanding Document Report**.
3. Click a row to open **View Outstanding Document**.
4. Review tabs (exact defaults in code): **Details**, **Account**, **Line Items**, **Settlement**, **Contra**, **Delivery Details**, **Department**, **Doc Link**.
5. Use **PRINT** for document output.

### Finance Executive: Aging Review

1. Open **Aging Report** from the sidebar.
2. Run search from listing **Creditor Aging Report**.
3. Open a row to **Aging Report Transactions**.
4. Review **Main** and **Outstanding Docs** tabs.
5. Use **EXPORT** in the detail header when output is needed.

### Controller: Statement-Level Review

1. Open **Statement of Account** from the sidebar.
2. Run search from listing **Statement of Account**.
3. Open a row to **Entity Report Transactions**.
4. Review tabs: **Entity Details**, **Transaction Docs**, **Statement Of Account**.
5. Inside statement components, current actions include **SEARCH** and **Export to PDF**.

### Audit User: Historical Trace

1. Open **Historical Transaction Aging Analysis Report** and run search.
2. Open a row to **View Document**.
3. Review tabs: **Details**, **Account**, **Line Items**, **Delivery Details**, **Settlement**, **Department**, **Contra**, **Doc Link**.
4. For creditor historical snapshot, use **Historical Creditor Report** listing and open detail rows.

### Notes on Current UI Labels

- The historical detail header currently renders **Historical Debtor Report Transactions** in code under the creditor applet detail view.
- Keep this in mind during user training to avoid naming confusion.

## Report and Detail Areas

### Outstanding Document Report

- Listing title: **Creditor Outstanding Document Report**
- Listing IDs in source: `creditorOutstandingDocument`, `creditorOutstandingDocumentListing`
- Detail title: **View Outstanding Document**
- Detail action: **PRINT**

### Aging Report

- Listing title: **Creditor Aging Report**
- Listing IDs in source: `creditorAging`, `creditorAgingListing`
- Detail title: **Aging Report Transactions**
- Detail action: **EXPORT**

### Statement of Account

- Listing title: **Statement of Account**
- Listing IDs in source: `creditorEntity`, `creditorEntityListing`
- Detail title: **Entity Report Transactions**

### Historical Views

- **Historical Transaction Aging Analysis Report** listing IDs: `creditorTxnHistory`, `creditorTxnHistoryListing`
- **Historical Creditor Report** listing IDs: `creditorHistorical`, `creditorHistoricalListing`

### AP and Settlement Reports

- **AP Transaction Report** listing ID: `apTransaction`, `apTransactionListing`
- **Payment Details with Purchase Invoice** listing title: **Payment Details with Purchase Invoice**
- **Purchase Invoice with Settlement Details** listing title: **Purchase Invoice with Settlement Details**

## Configuration and Settings

System settings group (exact menu labels):
- **Field Settings**
- **Default Selection**
- **Printable Format Settings**
- **Aging Period Settings**

Personalization group (exact menu label):
- **Default Selection**

### Field Settings

- Action button: **SAVE**
- Verified options:
- **Aging Period Type**: `MONTH (DEFAULT)` or `DAY`
- **Document Types to Exclude** -> **Document Type** (multi-select, bound to `CREDITOR_EXCLUDE_SERVER_DOC_TYPES`)

### Default Selection (Applet)

- Action button: **SAVE**
- Section: **Applet Default Settings**
- Fields: **Default Branch**, **Default Location**
- Section: **Details Tab Ordering** (drag/drop ordering)

### Printable Format Settings

- Create action exposed with tooltip **Create**
- Add screen action: **ADD**
- Edit screen action: **Save**
- File control label: **Upload File(s)**

### Default Selection (Personalization)

- Action button: **SAVE**
- Section: **User Default Settings**
- Fields: **Default Branch**, **Default Location**

## FAQ

### 1. Which menu should I use for document-level AP balances?
Use **Outstanding Document Report**. It opens **View Outstanding Document** with tabs including **Details**, **Settlement**, and **Doc Link**.

### 2. Where do I review creditor aging buckets quickly?
Use **Aging Report**. From detail view **Aging Report Transactions**, review **Main** and **Outstanding Docs**.

### 3. Can users set defaults for branch and location?
Yes. Both **Default Selection** under settings and personalization provide **Default Branch** and **Default Location**, each saved with **SAVE**.

### 4. Where is statement-oriented creditor analysis?
Use **Statement of Account**. The detail view provides **Entity Details**, **Transaction Docs**, and **Statement Of Account**.

### 5. Is there a historical movement report separate from statement summary?
Yes. Use **Historical Transaction Aging Analysis Report** for transaction-centric history and **Historical Creditor Report** for historical creditor balance perspective.

### 6. Which configuration controls aging model behavior?
In **Field Settings**, set **Aging Period Type** to `MONTH (DEFAULT)` or `DAY`.
