---
title: "Creditor Report Applet"
description: "Your one-stop dashboard for tracking what your company owes to suppliers — with aging analysis, statements, payment history, and more."
weight: 41
tags:
- finance
- creditor-report
- accounts-payable
- aging-analysis
- statement-of-account
aliases:
- /applets/creditor-report-applet/
---

## Purpose and Overview

The **Creditor Report Applet** gives your finance team one place to review money the company owes to suppliers. You can list unpaid documents, review aging, pull supplier statements, and trace historical balances without moving between unrelated tools.

{{< callout type="info" >}}
**In plain English:** A "creditor" is any supplier or vendor you owe money to. This applet helps you track, review, and report on all of that in one place.
{{< /callout >}}

### Video Overview

{{< youtube BVuTwlyGJ4Y >}}

The walkthrough follows the same flows as this guide: **Outstanding Document Report**, **Aging Report**, **Statement of Account**, historical reports, and **AP & Payment** reports.

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

## Before you begin

A few **Settings** and **Personalization** choices affect lists, aging columns, and defaults across the applet. You can run reports without changing them first. When instructions later mention **Field Settings** or **defaults**, use this list to find the full detail.

- **[Field Settings](#field-settings)** — **Aging Period Type** (calendar months vs day ranges for buckets) and **Document Types to Exclude** from creditor reports.
- **[Default Selection (Applet-Wide)](#default-selection-applet-wide)** — Default branch, location, and document tab order for **all** users when they open a report.
- **[Personal Default Selection](#personal-default-selection)** — Your own branch and location defaults. They override the applet-wide defaults for your login only.

---

## Quick Start Guide

### AP Analyst: Check Unpaid Invoices

**Goal:** Find all outstanding supplier documents quickly.

1. In the sidebar, click **Outstanding Document Report**.
2. Set filters at the top (for example Entity, Supplier Category, Company, Branch, or Currency). Click the **Search** button.
3. Review the list. Each row shows balances and, when the system provides them, GRN and PO references. The list is **as of today**: there is no date range, and every line is still unpaid.
4. Click a row to open the document. Review the Details, Settlement, and Line Items tabs.
5. Click the **PRINT** button to generate a printable copy.

{{< callout type="tip" >}}
Open the **Settlement** tab to see which payments have already been applied to the invoice.
{{< /callout >}}

{{< callout type="tip" >}}
For a past period, open **Statement of Account**, choose a supplier, then set **Month From** and **Month To** on the **Statement Of Account** tab.
{{< /callout >}}

---

### Finance Executive: Review Aging

**Goal:** Understand how long your payables have been outstanding.

1. In the sidebar, click **Aging Report**.
2. Choose **Company** first. Optionally pick one supplier, or leave Entity empty to include all suppliers. Click the **Search** button. For a keyword search, enter at least three characters.

{{< callout type="tip" >}}
Most teams scope the list by choosing **Company** before the other filters.
{{< /callout >}}

3. Read the grid. Scroll sideways to read every time-bucket column. When rows are grouped by supplier, use expand or collapse to show or hide the lines under each supplier.
4. Click a supplier row to open **Aging Report Transactions**.
5. Review the **Main** tab for the aging bucket breakdown. Open the **Outstanding Docs** tab for the underlying documents.
6. Click the **EXPORT** button in the header to download the data.

---

### Finance Controller: Pull a Supplier Statement

**Goal:** Get a full statement of account for any supplier.

1. In the sidebar, click **Statement of Account**.
2. Set filters at the top (Entity, Company, Branch if shown). Click the **Search** button. For a keyword search, enter at least three characters.
3. The first grid is the supplier summary. Click a supplier row to open **Entity Report Transactions**.
4. Open the **Transaction Docs** tab to see all movements, or the **Statement Of Account** tab for the formatted statement. On **Statement Of Account**, set **Month From** and **Month To**, click the **Search** button, then read the opening balance, each line, and the closing balance. Use **Export to PDF** when you need a file.
5. Open the **Aging** tab for an aging-style view for that supplier. Set **Month To** only, click the **Search** button, then use **Export to PDF** if you need a copy.

{{< callout type="tip" >}}
On the supplier **Aging** tab, **Month From** is not used. Only **Month To** applies on that tab.
{{< /callout >}}

---

### Audit User: Trace Historical Transactions

**Goal:** Review the AP position as it stood in a **past month**, not as of today.

1. In the sidebar, click **Historical Transaction Aging Analysis Report**.
2. Set **As Of Date** to the month you need. Add **Company**, **Entity**, **Branch**, or any other filters your team uses. Click the **Search** button.
3. Click a row to open **View Document**. Check the Details, Settlement, and Line Items tabs.
4. For a supplier-level summary for the same “as of” idea, open **Historical Creditor Report**. Set **As Of Date** and your filters, then click the **Search** button.

**Why two historical reports?** **Historical Transaction Aging Analysis Report** is line-by-line. It suits audits and tracing what was still open at the time. **Historical Creditor Report** is a shorter balance per supplier.

A document can still appear outstanding in an older month even if newer activity was recorded later. Each report shows what was owed **as of** the date you chose. That snapshot helps tie figures to month-end or balance-sheet work.

---

## Reports in Detail

### Outstanding Document Report

This report supports **daily AP monitoring**. It lists every supplier document (invoices, debit notes, and similar) that still has an open balance **as of today**. There is no calendar date range on this screen. For a past month, use **Statement of Account** instead.

{{< figure src="/images/creditor-report-applet/outstanding-document-report.png" alt="Outstanding Document Report listing with filters and search" caption="Outstanding Document Report — filter by entity, category, company, branch, or currency, then search to list unpaid supplier documents as of today." >}}

| What you can do | How |
|---|---|
| See all unpaid supplier documents | Set filters at the top (supplier, category, company, branch, currency as needed), then click the **Search** button |
| See balance and linked order references on the list | Stay on the listing. Check the balance and GRN / PO columns when they appear |
| Drill into a document | Click any row to open **View Outstanding Document** |
| Review payment history on a doc | Open the **Settlement** tab |
| Print the document | Click the **PRINT** button in the detail header |

**Available detail tabs:** Details · Account · Line Items · Settlement · Contra · Delivery Details · Department · Doc Link

---

### Aging Report

The Aging Report answers one question: how long money has been owed to suppliers. It groups outstanding amounts into time buckets. You can see at a glance whether payables are mostly current (for example 0–30 days) or overdue (for example 90+ days). Like the outstanding list, balances are **through today**. Bucket labels follow **Field Settings** (**Day** or **Month** ranges).

{{< figure src="/images/creditor-report-applet/aging-report.png" alt="Aging Report grid with time-bucket columns and current date" caption="Aging Report — time-bucket columns show how long payables have been outstanding; scroll horizontally to read every bucket." >}}

| What you can do | How |
|---|---|
| Load the aging grid | Open **Aging Report**. Pick **Company**, then narrow with Entity (supplier), Supplier Category, or a keyword if needed. Click the **Search** button |
| Read all bucket columns | Scroll horizontally across the grid |
| Work with supplier groups | Use expand or collapse on grouped supplier rows to show or hide detail lines |
| See individual transactions behind a bucket | Click a row to open **Aging Report Transactions**. Open the **Outstanding Docs** tab |
| Export the aging data | Click the **EXPORT** button in the detail header |

{{< callout type="tip" >}}
You can control how aging buckets are defined. Go to **Settings → Field Settings** and set **Aging Period Type** to **Month** (calendar months) or **Day** (day ranges). This affects all aging reports.
{{< /callout >}}

---

### Statement of Account

Think of this screen as a bank statement for a supplier. You start from a supplier summary list. After you open a supplier, you can switch between transaction lines, a formatted statement, and an aging view for that supplier.

{{< figure src="/images/creditor-report-applet/statement-of-account.png" alt="Statement of Account supplier summary or drill-down view" caption="Statement of Account — start from the supplier summary, then open a supplier for transaction docs, statement of account, or aging." >}}

| What you can do | How |
|---|---|
| Find suppliers | Open **Statement of Account** from the left menu. Set filters, then click the **Search** button |
| See the summary list | Stay on the first grid. You see one row per supplier with headline figures |
| See every movement | Click a supplier row. Open the **Transaction Docs** tab |
| See a formal statement with balances | Open the **Statement Of Account** tab. Set **Month From** and **Month To**, then click the **Search** button. Read the opening balance, each line, and the closing balance. Use **Export to PDF** if needed |
| See aging for that supplier only | Open the **Aging** tab. This tab does not use **Month From**. Set **Month To**, click the **Search** button, then use **Export to PDF** if needed |

---

### Historical Reports

Use these reports when you need balances or aging **as of a past month**, not as of today.

**Shared workflow:** Open the report from the left menu. Set **As Of Date** to the month you need, together with the other filters on that screen (for example Company, Entity, Branch, or Currency on the transaction report). Click the **Search** button. Click a row when you need to open document detail.

**Historical Transaction Aging Analysis Report**

- Line-level aging and documents for the month you choose. Use it for audits and for tracing what was still open at that time.
- A document can appear outstanding in an older month even if related paperwork was created later. The grid reflects what was owed in that historical month.

{{< figure src="/images/creditor-report-applet/historical-transaction-aging.png" alt="Historical Transaction Aging Analysis Report with As Of Date and results grid" caption="Historical Transaction Aging Analysis Report — set As Of Date and filters, then search for line-level aging as of that month." >}}

**Historical Creditor Report**

- Summary balance per supplier for the same **As Of Date** idea. Use it when you want a short comparison across months.
- Use **Outstanding Only** when you want the list limited to suppliers that still had an open balance in that month.
- When you use the same month and matching filters as the transaction aging report, the totals should line up. One view is detail; the other is the headline balance.

---

### AP & Payment Reports

These three reports focus on payment activity and invoice settlement. Open each one from the left menu using the exact names below.

{{< figure src="/images/creditor-report-applet/purchase-invoice-with-settlement-details.png" alt="Purchase Invoice with Settlement Details report listing" caption="Purchase Invoice with Settlement Details — branch, date range, and optional entity filters; lists invoices with their settlement lines." >}}

| What you can do | How |
|---|---|
| See AP activity between two dates | Open **AP Transaction Report**. Choose **Company** (required). Set **Transaction Date** from and to. Optionally set Entity, Branch, or Sort by. Click the **Search** button. Rows group by supplier: expand a supplier to see each line. The **Balance** column shows the position before your start date and through the end date |
| See which invoices a payment cleared | Open **Payment Details with Purchase Invoice**. Click the **Search** button. Each line shows the payment and the purchase invoice (or similar document) it settled. This helps when one payment covers several invoices or when a debit note reduced an invoice |
| See settlement lines per purchase invoice | Open **Purchase Invoice with Settlement Details**. Choose **Branch** and the **Transaction Date** range. Optionally set Entity. Click the **Search** button. By default the list focuses on invoices with settlement. Tick **Show purchase invoice without settlement details** if you also need invoices that do not yet have settlement lines |

---

## Configuration & Settings

The topics below expand on what you read in [Before you begin](#before-you-begin).

### Field Settings

These options apply to everyone who uses the applet. Go to **Settings → Field Settings**, adjust the table below, then click the **SAVE** button.

| Setting | What it does |
|---|---|
| **Aging Period Type** | Choose **Month** (default) to group aging by calendar month, or **Day** to group by number of days |
| **Document Types to Exclude** | Hide selected document types from creditor reports |

---

### Default Selection (Applet-Wide)

Go to **Settings → Default Selection**. Set default filters that apply to all users when they open a report.

- **Default Branch** — pre-select a branch so users don't have to pick one every time
- **Default Location** — same as above for location
- **Details Tab Ordering** — changes the order of tabs when you open a document from **Outstanding Document Report** (for example Details, Settlement, Line Items). Click and hold a tab name, drag it left or right, then release. Click the **SAVE** button when you are done

---

### Printable Format Settings

Upload custom print templates for reports. Use the **Upload File(s)** button to add a template. Manage existing templates from the list.

---

### Personal Default Selection

Each user can set personal Branch and Location defaults. These override the applet-wide defaults for that user only. Go to **Personalization → Default Selection**, then click the **SAVE** button.

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

Use the **Outstanding Document Report**. It lists every supplier document that still has an open balance. Click any row to open the full detail, including payments that have already been applied.

---

### 2. What's the difference between the Aging Report and the Outstanding Document Report?

- **Outstanding Document Report** — individual unpaid documents (one row per document).
- **Aging Report** — outstanding amounts by supplier and by how long they have been unpaid (one row per supplier, with amounts in time buckets).

Use **Outstanding Document Report** for day-to-day follow-up. Use **Aging Report** for a high-level payables health check.

---

### 3. Can I set it so the system always defaults to my branch?

Yes. Go to **Personalization → Default Selection**. Set **Default Branch** and **Default Location**, then click the **SAVE** button. These personal defaults apply each time you open a report.

---

### 4. How do I change whether aging is shown by month or by day?

Go to **Settings → Field Settings**. Change **Aging Period Type** to **Month** or **Day**, then click the **SAVE** button. This affects all aging reports for all users.

---

### 5. How do I get a statement to send to a supplier for reconciliation?

Open **Statement of Account**. Set filters, click the **Search** button, then click the supplier row. Open the **Statement Of Account** tab (next to **Transaction Docs**). Set **Month From** and **Month To**, click the **Search** button, then use **Export to PDF** for a shareable copy.

---

### 6. What's the difference between Historical Transaction Aging Analysis Report and Historical Creditor Report?

- **Historical Transaction Aging Analysis Report** — individual transactions as they aged at a historical point in time. More detailed.
- **Historical Creditor Report** — balance per creditor at a historical point in time. More of a summary snapshot.

Use the first for transaction-level audits. Use the second for period-end balance comparisons.

---

### 7. How do I know if a payment has already been applied to an invoice?

Open the document from **Outstanding Document Report**, or from any report that lets you drill into a document. On the detail screen, open the **Settlement** tab. You can see how payments or credits were applied to that invoice.

---

### 8. Why does my Aging Report show different amounts than my Outstanding Document Report?

The two screens answer different questions. **Outstanding Document Report** lists each unpaid document on its own row. **Aging Report** rolls amounts up by supplier and splits them into time buckets (how long the balance has been outstanding). Totals can also differ if you used different filters on each screen (for example Branch or Currency on **Outstanding Document Report**), or if you compare one supplier aging row to many separate document lines.

---

### 9. Can I filter the Statement of Account by date range?

The first **Statement of Account** screen is for finding a supplier. After you click a supplier row, open the **Statement Of Account** tab. Set **Month From** and **Month To**, then click the **Search** button to show that period, including opening and closing balances. Use **Export to PDF** when you need a file to share. On the supplier **Aging** tab in the same screen, only **Month To** applies. Set it, click the **Search** button, then export if needed.
