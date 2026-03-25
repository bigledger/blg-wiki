---
title: "Debtor Report Applet"
description: "Comprehensive Accounts Receivable reporting for tracking outstanding balances, debt aging, and transaction history."
weight: 40
tags:
- finance
- accounts-receivable
- debtor-report
- aging-analysis
---

## Purpose and Overview

The **Debtor Report Applet** (often referred to as the Creditor/Debtor Report workspace in its latest version) provides specialized views for monitoring **Accounts Receivable (AR)**. It is essentially the counterpart to the Creditor Report Applet, focusing on what your customers owe you.

This applet is used for debt collection follow-up, credit control analysis, and reconciling historical balances with customers.

{{< callout type="info" >}}
**Core Concept**: This applet centralizes all customer-facing financial reports, moving from high-level aging summaries down to individual outstanding invoice details.
{{< /callout >}}

## Key Features & Reports

### 1. Outstanding Aging Report
The primary tool for credit controllers to evaluate payment delays:
- **Bucket-based Analysis**: View balances categorized by time periods (e.g., 0-30 days, 31-60 days).
- **Custom Aging Periods**: Configure specific aging buckets via **Settings > Aging Period Settings**.
- **Real-time Snapshots**: Review balances as of today or a specific historical date.

### 2. Outstanding Document & Entity Reports
- **Outstanding Document Report**: A granular list of every unpaid or partially paid invoice. Essential for answering customer queries about specific documents.
- **Outstanding Entity Report**: A consolidated summary grouped by Customer/Entity, showing the total exposure per account.

### 3. Transaction History & Historical Analysis
- **Txn History Report**: A chronological audit trail of all financial movements per customer (Invoices, Receipts, Credit Notes).
- **Historical Creditor/Debtor Report**: Provides a "back-in-time" view of balances for audit and month-end reconciliation.

### 4. Specialized Reconciliation Views
- **PV with Purchase Invoice (Credit-side link)**: Monitor payment vouchers linked to invoices.
- **Purchase Invoice with Settlement**: Track the relationship between billing and the final payment status.

---

## Feature Navigation

{{< cards >}}
  {{< card title="Aging Report" subtitle="Bird's eye view of overdue balances" link="#outstanding-aging-report" >}}
  {{< card title="Document Report" subtitle="Granular list of all unpaid invoices" link="#outstanding-document-report" >}}
  {{< card title="Txn History" subtitle="Full ledger history for specific customers" link="#txn-history-report" >}}
  {{< card title="Aging Settings" subtitle="Configure custom time buckets" link="#config--settings" >}}
{{< /cards >}}

---

## Quick Start Guide

### Monitoring Overdue Accounts

1. **Select Perspective**: Open the applet and ensure your filters are set to the correct branch.
2. **Review Aging**: Open the **Outstanding Aging Report**. Identify customers in the "90+ Day" buckets.
3. **Drill Down**: Click on a customer record to view their **Outstanding Document Report**.
4. **Export for Follow-up**: Use the export function to generate a list for your collection team or to send as a reminder to the customer.

### Reconciling Customer Statements

1. Open the **Txn History Report**.
2. Filter by the specific **Customer Entity** and date range.
3. Compare the opening balance, transaction flow, and closing balance with the customer's own records.

---

## Config & Settings

| Setting | Usage |
| :--- | :--- |
| **Aging Period Settings** | Define the intervals for your aging reports (e.g. 30/60/90/120 days). |
| **Default Selection** | Speed up reporting by setting a default branch or currency. |
| **Field Configuration** | Customize which columns are visible in the large ag-grid tables. |
| **Printable Format** | Setup how the PDF versions of your reports appear. |

---

## Frequently Asked Questions

**Q: Why does the report show "Creditor" in some labels?**
A: Many organizations use a unified **Debtor & Creditor Report V2** framework. Simply adjust the filters to "AR" (Accounts Receivable) or "Debtor" mode to see customer data.

**Q: Can I see balances as of last month?**
A: Yes, use the **Historical Report** menu and set the "Report Date" to the end of the previous month.

**Q: How do I find specific unallocated receipts?**
A: Use the **Outstanding Document Report**. Unallocated receipts often appear as negative outstanding amounts or separate document items waiting to be "knocked off" against an invoice.

---

{{< callout type="tip" >}}
**Reporting Tip**: Most tables use **Ag-Grid**, allowing you to right-click on any column header to apply multi-level filters or to group data by Branch or Currency.
{{< /callout >}}

