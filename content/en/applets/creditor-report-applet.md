---
title: "Creditor Report Applet"
description: "Your one-stop dashboard for tracking what your company owes to suppliers — with aging analysis, statements, payment history, and more."
tags:
- finance
- creditor-report
- accounts-payable
- aging-analysis
- statement-of-account
---

## Purpose and Overview

The **Creditor Report Applet** gives your finance team a single place to see everything related to money your company owes to suppliers. Instead of hunting through spreadsheets or multiple systems, all your creditor reports are here — from checking what invoices are still unpaid, to seeing how long balances have been sitting, to pulling a full statement for any supplier.

{{< callout type="info" >}}
**In plain English:** A "creditor" is any supplier or vendor you owe money to. This applet helps you track, review, and report on all of that in one place.
{{< /callout >}}

### Who Benefits from This Applet?

**Accounts Payable (AP) Team:**
- Quickly see which supplier invoices are still unpaid
- Track documents by supplier without exporting to Excel
- Print document details for payment processing

**Finance Controllers & Managers:**
- Get a full aging picture — know exactly how long balances have been outstanding
- Pull a Statement of Account for any supplier at any time
- Monitor historical trends to spot payment pattern issues

**Audit & Compliance:**
- Drill into any transaction for full document details
- Export reports as evidence for audits
- Access a complete historical record of all AP activity

**Senior Management:**
- High-level view of total outstanding payables
- Understand company's payment exposure at a glance

---

### What Problems Does This Solve?

**Before this applet**, AP teams typically had to:
- Manually compile aging schedules in spreadsheets
- Call suppliers to reconcile statements
- Dig through multiple screens to find one document's payment history
- Produce inconsistent reports depending on who ran them

**With this applet**, you get:
- **All reports in one sidebar** — no switching between modules
- **Drill-down capability** — click any row to see the full document detail
- **Consistent defaults** — set your preferred branch and location once, and every report uses it
- **Export & print ready** — PDF and Excel output built into every report

---

## Key Features Overview

{{< cards >}}
  {{< card title="Outstanding Document Report" subtitle="See all unpaid supplier invoices at a glance" link="#outstanding-document-report" >}}
  {{< card title="Aging Report" subtitle="Find out how long money has been owed, grouped by time periods" link="#aging-report" >}}
  {{< card title="Statement of Account" subtitle="Full transaction history with any supplier, like a bank statement" link="#statement-of-account" >}}
  {{< card title="Historical Reports" subtitle="Look back at past aging snapshots and creditor balances" link="#historical-reports" >}}
  {{< card title="AP & Payment Reports" subtitle="Track AP transactions and see how invoices were settled" link="#ap--payment-reports" >}}
  {{< card title="Settings & Defaults" subtitle="Configure aging periods, default filters, and print formats" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/creditor-report-applet/creditor-report-applet-overview.png" alt="Creditor Report Applet Overview — your one-stop dashboard for supplier payables" caption="All your supplier payable reports — outstanding documents, aging, statements, and payment history — in one place." >}}

---

## Quick Start Guide

### AP Analyst: Check Unpaid Invoices

**Goal:** Find all outstanding supplier documents in 3 steps.

1. Click **Outstanding Document Report** in the sidebar
2. Set your search filters (supplier, date range, branch) and click **Search**
3. Click any row to open the full document — review the **Details**, **Settlement**, and **Line Items** tabs
4. Hit **PRINT** to generate a printable copy

**Pro Tip:** The **Settlement** tab shows you which payments have already been applied against this invoice.

---

### Finance Executive: Review Aging

**Goal:** Understand how long your payables have been outstanding.

1. Click **Aging Report** in the sidebar
2. Run the search to load your creditor aging data
3. Click a supplier row to open **Aging Report Transactions**
4. Review the **Main** tab for aging bucket breakdown and **Outstanding Docs** tab for the underlying documents
5. Use **EXPORT** in the header to download the data

---

### Finance Controller: Pull a Supplier Statement

**Goal:** Get a full statement of account for any supplier.

1. Click **Statement of Account** in the sidebar
2. Search and select a supplier
3. Open the row to see **Entity Report Transactions**
4. Go to the **Statement Of Account** tab for the formatted statement
5. Use **Export to PDF** for a shareable copy

---

### Audit User: Trace Historical Transactions

**Goal:** Look at the AP position as it was at a past date.

1. Click **Historical Transaction Aging Analysis Report** in the sidebar
2. Set your historical date and search
3. Click any row to open **View Document** — check **Details**, **Settlement**, and **Line Items**
4. For a creditor-level historical snapshot, use **Historical Creditor Report** instead

---

## Reports in Detail

### Outstanding Document Report

This is your go-to report for **daily AP monitoring**. It shows every supplier document (invoices, debit notes, etc.) that hasn't been fully paid yet.

| What you can do | How |
|---|---|
| See all unpaid supplier documents | Run search from the listing |
| Drill into a document | Click any row → **View Outstanding Document** |
| Review payment history on a doc | Open the **Settlement** tab |
| Print the document | Click **PRINT** in the detail header |

**Available detail tabs:** Details · Account · Line Items · Settlement · Contra · Delivery Details · Department · Doc Link

---

### Aging Report

The Aging Report answers one key question: **"How old is our money owed to suppliers?"** It groups outstanding amounts into time buckets — so you can see at a glance if most of your payables are current (0–30 days) or overdue (90+ days).

| What you can do | How |
|---|---|
| See aging buckets per supplier | Run search from the Creditor Aging Report listing |
| See individual transactions behind a bucket | Click a row → **Aging Report Transactions** → **Outstanding Docs** tab |
| Export the aging data | Click **EXPORT** in the detail header |

{{< callout type="tip" >}}
**You can control how aging buckets are defined.** Go to **Settings → Field Settings** and set **Aging Period Type** to either **MONTH** (groups by calendar month) or **DAY** (groups by number of days). This affects all aging reports.
{{< /callout >}}

---

### Statement of Account

Think of this like a **bank statement — but for a supplier**. It shows every transaction (invoices, payments, credit notes) between your company and a supplier over a chosen period, along with the running balance.

| What you can do | How |
|---|---|
| Get a full supplier transaction history | Search from the Statement of Account listing |
| See the formatted statement | Open a row → **Statement Of Account** tab |
| View individual transaction docs | Open a row → **Transaction Docs** tab |
| Export as PDF | Click **Export to PDF** inside the statement |

---

### Historical Reports

Two reports let you **look back in time** at the AP position:

**Historical Transaction Aging Analysis Report**
- Shows the aging analysis as it was on a specific past date
- Useful for month-end reconciliation and audits
- Drill into any row for full document detail

**Historical Creditor Report**
- Shows creditor balances as they were historically
- Good for comparing current position against a prior period

---

### AP & Payment Reports

Three reports focused on **payment activity and invoice settlement**:

**AP Transaction Report**
- A full log of all accounts payable transactions
- Great for reconciling your AP ledger

**Payment Details with Purchase Invoice**
- Links each payment back to the specific purchase invoice it was for
- Answers: "Which invoices did this payment cover?"

**Purchase Invoice with Settlement Details**
- Shows each purchase invoice alongside its settlement history
- Answers: "How was this invoice paid?"

---

## Configuration & Settings

### Field Settings

Control the **core behavior** of all reports in the applet.

| Setting | What it does |
|---|---|
| **Aging Period Type** | Choose **MONTH** (default) to group aging by calendar month, or **DAY** to group by number of days |
| **Document Types to Exclude** | Select specific document types that should be excluded from creditor reports |

Click **SAVE** after making changes.

---

### Default Selection (Applet-Wide)

Set **default filters** that apply to all users when they open any report.

- **Default Branch** — pre-select a branch so users don't have to pick one every time
- **Default Location** — same as above for location
- **Details Tab Ordering** — drag and drop to change the order of tabs in the document detail view

---

### Printable Format Settings

Upload custom print templates for reports. Use the **Upload File(s)** button to add a template, and manage existing ones from the list.

---

### Personal Default Selection

Each user can set their **own** preferred Branch and Location defaults. These override the applet-wide defaults for that user only. Go to **Personalization → Default Selection** and click **SAVE**.

---

## Glossary

New to AP terminology? Here's what the key terms mean in plain English.

| Term | What it means |
|---|---|
| **Creditor** | A supplier or vendor that your company owes money to. When you buy goods or services on credit, the supplier becomes a creditor. |
| **Accounts Payable (AP)** | The total money your company owes to suppliers for purchases already made but not yet paid for. |
| **Outstanding Document** | Any invoice, debit note, or other document from a supplier that hasn't been fully paid or matched with a payment yet. |
| **Aging / Aging Analysis** | A breakdown of outstanding amounts grouped by how long they've been unpaid — e.g., 0–30 days, 31–60 days, 61–90 days, 90+ days. The older the bucket, the more overdue the payment. |
| **Aging Period** | The unit used to define aging buckets. Set to **Month** (groups Jan, Feb, etc.) or **Day** (groups 1–30, 31–60, etc.). |
| **Statement of Account** | A summary from a supplier showing all transactions — invoices issued, payments received, credits applied — and the resulting balance. Like a bank statement, but for your supplier relationship. |
| **Settlement** | The process of matching a payment to one or more invoices. When an invoice is "settled," it means a payment has been linked to it, reducing or clearing the balance. |
| **Purchase Invoice** | A bill sent by your supplier after you receive goods or services. It tells you how much you owe and when payment is due. |
| **AP Transaction** | Any financial movement in the accounts payable ledger — this includes invoices received, payments made, credit notes, and debit notes. |
| **Contra** | A contra entry is when two parties owe each other money and agree to offset the amounts. For example, if a supplier also buys from you, you can net off what each owes the other. |
| **Debit Note** | A document you send to a supplier to request a reduction in the amount you owe — for example, if goods were returned or incorrectly invoiced. |
| **Credit Note** | A document a supplier sends to reduce the amount you owe them — essentially a partial refund on an existing invoice. |

---

## FAQ

### 1. Which report should I use to find unpaid supplier invoices?

Use the **Outstanding Document Report**. It lists every supplier document that still has an open balance. Click any row to see the full detail, including what payments have already been applied.

---

### 2. What's the difference between the Aging Report and the Outstanding Document Report?

- **Outstanding Document Report** — shows individual unpaid documents (one row = one document)
- **Aging Report** — groups the outstanding amounts by supplier and by how long they've been unpaid (one row = one supplier, with amounts split into time buckets)

Use Outstanding Document for day-to-day follow-up. Use Aging for a high-level payables health check.

---

### 3. Can I set it so the system always defaults to my branch?

Yes. Go to **Personalization → Default Selection**, set your **Default Branch** and **Default Location**, and click **SAVE**. These personal defaults will apply every time you open a report.

---

### 4. How do I change whether aging is shown by month or by day?

Go to **Settings → Field Settings**, change the **Aging Period Type** to `MONTH` or `DAY`, and click **SAVE**. This affects all aging reports for all users.

---

### 5. How do I get a statement to send to a supplier for reconciliation?

Open **Statement of Account**, search for the supplier, click the row, and go to the **Statement Of Account** tab. Use **Export to PDF** to download a shareable copy.

---

### 6. What's the difference between Historical Transaction Aging Analysis Report and Historical Creditor Report?

- **Historical Transaction Aging Analysis Report** — shows individual transactions as they aged at a historical point in time. More detailed.
- **Historical Creditor Report** — shows the balance per creditor at a historical point in time. More of a summary snapshot.

Use the first for transaction-level audits. Use the second for period-end balance comparisons.
