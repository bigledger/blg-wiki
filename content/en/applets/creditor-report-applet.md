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

### Video Overview

{{< youtube BVuTwlyGJ4Y >}}

The walkthrough follows the same flows as this guide: **Outstanding Document Report** (today’s balances), **Aging Report**, **Statement of Account**, **Historical** reports, and the **AP & payment** reports.

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

**Goal:** Find all outstanding supplier documents quickly.

1. Click **Outstanding Document Report** in the sidebar
2. Use the filters at the top (for example **Entity**, **Supplier Category**, **Company**, **Branch**, or **Currency**), then click **Search**
3. Review the list: each row shows **balances** and, when the system has them, **GRN** and **PO** references. This screen is **as of today** — there is **no date range** here; everything listed is still **unpaid right now**
4. Click any row to open the full document — review the **Details**, **Settlement**, and **Line Items** tabs
5. Click **PRINT** to generate a printable copy

**Pro Tip:** The **Settlement** tab shows you which payments have already been applied against this invoice.

**Need a past period?** Use **Statement of Account** after you pick a supplier, then set **Month From** / **Month To** on the statement tab.

---

### Finance Executive: Review Aging

**Goal:** Understand how long your payables have been outstanding.

1. Click **Aging Report** in the sidebar
2. Choose **Company** first (this is how most teams scope the list), then optionally pick one **supplier** or leave **Entity** empty to include **all** suppliers. Click **Search**. If you search by keyword, enter **at least three characters**
3. Read the grid: **scroll sideways** to see every **time bucket** column. Where rows are **grouped by supplier**, use **expand** or **collapse** to show or hide the lines under each supplier
4. Click a supplier row to open **Aging Report Transactions**
5. Review the **Main** tab for aging bucket breakdown and **Outstanding Docs** tab for the underlying documents
6. Use **EXPORT** in the header to download the data

---

### Finance Controller: Pull a Supplier Statement

**Goal:** Get a full statement of account for any supplier.

1. Click **Statement of Account** in the sidebar
2. Set filters at the top (for example **Entity**, **Company**, **Branch** if shown), then click **Search**. If you search by keyword, enter **at least three characters**
3. The first grid is a **supplier summary** — click a **supplier row** to open **Entity Report Transactions**
4. Open the **Transaction Docs** tab to see all movements, or the **Statement Of Account** tab for the formatted run. On **Statement Of Account**, set **Month From** and **Month To**, click **Search**, then read **opening balance**, each line, and **closing balance** (money in and out). Use **Export to PDF** when you need a file
5. Open the **Aging** tab for an aging-style view for that supplier: set **Month To** only, click **Search**, then **Export to PDF** if you need a copy (**Month From** is not used on this tab)

---

### Audit User: Trace Historical Transactions

**Goal:** Look at the AP position as it was in a **past month** (not “today”).

1. Click **Historical Transaction Aging Analysis Report** in the sidebar
2. Set **As Of Date** (pick the **month** you want), plus **Company**, **Entity**, **Branch**, or other filters your team uses, then click **Search**
3. Click any row to open **View Document** — check **Details**, **Settlement**, and **Line Items**
4. For a **supplier-level summary** for the same kind of “as of” month, open **Historical Creditor Report** instead, set **As Of Date** and filters, then **Search**

**Why two historical reports?** The **transaction aging** view is **line-by-line** for audits. The **historical creditor** view is a **shorter balance per supplier**. A document can still look **outstanding** in an older month even if something newer was created later—the report shows **what was owed back then**, which helps tie numbers to month-end or balance-sheet work.

---

## Reports in Detail

### Outstanding Document Report

This is your go-to report for **daily AP monitoring**. It lists every supplier document (invoices, debit notes, and so on) that still has an **open balance as of today**. There is **no calendar date range** on this screen—if you need a statement for a past month, use **Statement of Account** instead.

| What you can do | How |
|---|---|
| See all unpaid supplier documents | Set filters at the top (supplier, category, company, branch, currency as needed) → click **Search** |
| See balance and linked order references on the list | Stay on the listing—check **balance** and **GRN** / **PO** columns when they appear |
| Drill into a document | Click any row → **View Outstanding Document** |
| Review payment history on a doc | Open the **Settlement** tab |
| Print the document | Click **PRINT** in the detail header |

**Available detail tabs:** Details · Account · Line Items · Settlement · Contra · Delivery Details · Department · Doc Link

---

### Aging Report

The Aging Report answers one key question: **"How old is our money owed to suppliers?"** It groups outstanding amounts into time buckets — so you can see at a glance if most of your payables are current (0–30 days) or overdue (90+ days). Like the outstanding list, it reflects **balances through today**; bucket labels follow your **Field Settings** (**Day** or **Month** ranges).

| What you can do | How |
|---|---|
| Load the aging grid | Open **Aging Report** → pick **Company**, then narrow with **Entity** (supplier), **Supplier Category**, or keyword if needed → click **Search** |
| Read all bucket columns | **Scroll horizontally** across the grid |
| Work with supplier groups | Use **expand** / **collapse** on grouped supplier rows to show or hide detail lines |
| See individual transactions behind a bucket | Click a row → **Aging Report Transactions** → **Outstanding Docs** tab |
| Export the aging data | Click **EXPORT** in the detail header |

{{< callout type="tip" >}}
**You can control how aging buckets are defined.** Go to **Settings → Field Settings** and set **Aging Period Type** to **Month** (calendar months) or **Day** (day ranges). This affects all aging reports.
{{< /callout >}}

---

### Statement of Account

Think of this like a **bank statement — but for a supplier**. You start from a **supplier summary** list; after you **open a supplier**, you can switch between **transaction lines**, a **formatted statement**, and an **aging** view for that supplier.

| What you can do | How |
|---|---|
| Find suppliers | Open **Statement of Account** from the left menu → set filters → click **Search** |
| See the summary list | Stay on the first grid—one row per supplier with headline figures |
| See every movement | Click a supplier row → **Transaction Docs** tab |
| See a formal statement with balances | Open **Statement Of Account** tab → set **Month From** and **Month To** → click **Search** → read **opening balance**, lines, and **closing balance** → **Export to PDF** if needed |
| See aging for that supplier only | Open the **Aging** tab → set **Month To** (this tab does **not** use **Month From**) → click **Search** → **Export to PDF** if needed |

---

### Historical Reports

Use these when you need **balances or aging as of a past month**, not “today.”

**Shared workflow:** Open the report from the left menu → set **As Of Date** (pick the **month**) and the other filters shown on that screen (for example **Company**, **Entity**, **Branch**, **Currency** on the transaction report) → click **Search** → click rows to open document detail when you need to drill down.

**Historical Transaction Aging Analysis Report**
- **Line-level** aging and documents for the month you pick—best for **audits** and tracing **what was still open then**
- A document can appear **outstanding** in an older month even if related paperwork was created later—the grid reflects **what was owed in that historical month**

**Historical Creditor Report**
- **Summary** balance **per supplier** for the same **As Of Date** idea—best when you want a **short comparison** across months
- Use **Outstanding Only** on that screen when you want the list limited to suppliers that still had an open balance in that month
- When you use the **same month and matching filters** as the transaction aging report, the **totals should line up**; one view is detail, the other is the headline balance

---

### AP & Payment Reports

Three reports focused on **payment activity and invoice settlement**. Open each one from the **left menu** using the names below.

| What you can do | How |
|---|---|
| See AP activity between two dates | Open **AP Transaction Report** → choose **Company** (required) → set **Transaction Date** **from** and **to** → optional **Entity** / **Branch** / **Sort by** → click **Search**. Rows **group by supplier**—**expand** a supplier to see each line; the **Balance** column walks through your dates so you can see the position **before** your start date and **through** the end date |
| See which invoices a payment cleared | Open **Payment Details with Purchase Invoice** → click **Search** → read each line: it shows the **payment** and the **purchase invoice** (or similar document) it settled—helpful when one payment covers several invoices or when a **debit note** reduced an invoice |
| See settlement lines per purchase invoice | Open **Purchase Invoice with Settlement Details** → choose **Branch** and **Transaction Date** range → optional **Entity** → click **Search**. By default the list focuses on invoices **with** settlement; tick **Show purchase invoice without settlement details** if you also need invoices that **do not** yet have settlement lines |

---

## Configuration & Settings

### Field Settings

These options apply to **everyone** who uses the applet. Go to **Settings → Field Settings**, adjust the table below, then click **SAVE**.

| Setting | What it does |
|---|---|
| **Aging Period Type** | Choose **Month** (default) to group aging by calendar month, or **Day** to group by number of days |
| **Document Types to Exclude** | Hide selected document types from creditor reports |

---

### Default Selection (Applet-Wide)

Go to **Settings → Default Selection**. Set **default filters** that apply to all users when they open a report.

- **Default Branch** — pre-select a branch so users don't have to pick one every time
- **Default Location** — same as above for location
- **Details Tab Ordering** — changes the order of tabs when you open a document from **Outstanding Document Report** (for example **Details**, **Settlement**, **Line Items**). **Click and hold** a tab name, **drag** it left or right, then **release**. Click **SAVE** when you are done

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

Go to **Settings → Field Settings**, change the **Aging Period Type** to **Month** or **Day**, and click **SAVE**. This affects all aging reports for all users.

---

### 5. How do I get a statement to send to a supplier for reconciliation?

Open **Statement of Account**, set filters, click **Search**, then click the supplier row. Open the **Statement Of Account** tab (next to **Transaction Docs**), set **Month From** and **Month To**, click **Search**, then use **Export to PDF** for a shareable copy.

---

### 6. What's the difference between Historical Transaction Aging Analysis Report and Historical Creditor Report?

- **Historical Transaction Aging Analysis Report** — shows individual transactions as they aged at a historical point in time. More detailed.
- **Historical Creditor Report** — shows the balance per creditor at a historical point in time. More of a summary snapshot.

Use the first for transaction-level audits. Use the second for period-end balance comparisons.

---

### 7. How do I know if a payment has already been applied to an invoice?

Open the document from **Outstanding Document Report** (or any report that lets you drill into a document). In the detail screen, open the **Settlement** tab. There you can see how payments or credits have been applied to that invoice.

---

### 8. Why does my Aging Report show different amounts than my Outstanding Document Report?

The two screens answer different questions. **Outstanding Document Report** lists **each unpaid document** on its own row. **Aging Report** rolls amounts up **by supplier** and splits them into **time buckets** (how long the balance has been outstanding). Totals can also look different if you used **different filters** on each screen (for example **Branch** or **Currency** on Outstanding Document), or if you are comparing one supplier's aging row to many separate document lines.

---

### 9. Can I filter the Statement of Account by date range?

The first **Statement of Account** screen is for finding a supplier. After you **click a supplier row**, open the **Statement Of Account** tab, set **Month From** and **Month To**, then click **Search** to show that period (with **opening** and **closing** balances). Use **Export to PDF** when you need a file to share. For the supplier’s **Aging** tab inside the same screen, only **Month To** applies—set it, click **Search**, then export if needed.
