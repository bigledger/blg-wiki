---
title: "Debtor Report Applet"
description: "Your one-stop dashboard for tracking what customers owe your company — with aging analysis, statements, AR transaction history, collection reports, and more."
weight: 40
tags:
- finance
- accounts-receivable
- debtor-report
- aging-analysis
- statement-of-account
- credit-control
---

## Purpose and Overview

The **Debtor Report Applet** gives your finance and credit control team a single place to see everything related to money your customers owe you. Instead of exporting to spreadsheets or switching between multiple screens, all your accounts receivable reports are here — from checking which invoices are still unpaid, to seeing how long balances have been sitting, to pulling a full statement for any customer.

{{< callout type="info" >}}
**In plain English:** A "debtor" is any customer that owes you money. This applet helps you track, review, and report on all of that in one place.
{{< /callout >}}

### Who Benefits from This Applet?

**Accounts Receivable (AR) Team:**
- Quickly see which customer invoices are still unpaid
- Track documents by customer without exporting to Excel
- Print document details for collection follow-up

**Credit Controllers & Finance Managers:**
- Get a full aging picture — know exactly how long balances have been outstanding
- Pull a Statement of Account for any customer at any time
- Monitor historical trends to spot overdue payment patterns

**Sales & Collection Teams:**
- Use the Collection Invoice with Aging report to track salesman-level outstanding invoices
- Follow up on customers by drilling into specific document details

**Audit & Compliance:**
- Drill into any transaction for full document details
- Export reports as evidence for audits
- Access a complete historical record of all AR activity

**Senior Management:**
- High-level view of total outstanding receivables
- Understand company's collection exposure at a glance

---

### What Problems Does This Solve?

**Before this applet**, AR teams typically had to:
- Manually compile aging schedules in spreadsheets
- Call customers to reconcile statements
- Dig through multiple screens to find one document's payment history
- Produce inconsistent reports depending on who ran them

**With this applet**, you get:
- **All reports in one sidebar** — no switching between modules
- **Drill-down capability** — click any row to see the full document detail
- **Consistent defaults** — set your preferred branch and location once, and every report uses it
- **Export and print ready** — PDF and Excel output built into every report

---

## Key Features Overview

{{< cards >}}
  {{< card title="Outstanding Document Report" subtitle="See all unpaid customer invoices at a glance" link="#outstanding-document-report" >}}
  {{< card title="Aging Report" subtitle="Find out how long money has been owed, grouped by time periods" link="#aging-report" >}}
  {{< card title="Statement of Account" subtitle="Full transaction history with any customer, like a bank statement" link="#statement-of-account" >}}
  {{< card title="Historical Reports" subtitle="Look back at past aging snapshots and debtor balances" link="#historical-reports" >}}
  {{< card title="AR Transaction Report" subtitle="Track AR movements and see how invoices were settled" link="#ar-transaction-report" >}}
  {{< card title="Collection Invoice with Aging" subtitle="Salesman-level collection tracking with aging buckets" link="#collection-invoice-with-aging" >}}
  {{< card title="Settings and Defaults" subtitle="Configure aging periods, default filters, and print formats" link="#configuration--settings" >}}
{{< /cards >}}

---

## Quick Start Guide

### AR Analyst: Check Unpaid Customer Invoices

**Goal:** Find all outstanding customer documents quickly.

1. Click **Outstanding Document Report** in the sidebar
2. Use the filters at the top (for example **Entity**, **Customer Category**, **Company**, **Branch**, **ARAP Type**, or **Currency**), then click **Search**
3. Review the list: each row shows an unpaid document with its remaining balance. This screen is **as of today** — there is **no date range** here; everything listed is still **unpaid right now**
4. Click any row to open the full document — review the **Details**, **Settlement**, **Line Items**, and other tabs
5. Click **PRINT** to generate a printable copy

**Pro Tip:** The **Settlement** tab shows you which receipts have already been applied against this invoice.

**Need a past period?** Use **Statement of Account** after you pick a customer, then set **Month From** / **Month To** on the statement tab.

---

### Credit Controller: Review Aging

**Goal:** Understand how long your receivables have been outstanding.

1. Click **Aging Report** in the sidebar
2. Choose **Company** first (this is how most teams scope the list), then optionally pick one **customer** or leave **Entity** empty to include **all** customers. Click **Search**. If you search by keyword, enter **at least three characters**
3. Read the grid: **scroll sideways** to see every **time bucket** column. Where rows are **grouped by customer**, use **expand** or **collapse** to show or hide the lines under each customer
4. Click a customer row to open **Aging Report Transactions**
5. Review the **Main** tab for aging bucket breakdown and **Outstanding Docs** tab for the underlying documents
6. Use **EXPORT** in the header to download the data

---

### Finance Controller: Pull a Customer Statement

**Goal:** Get a full statement of account for any customer.

1. Click **Statement of Account** in the sidebar
2. Set filters at the top (for example **Entity**, **Company**, **Branch**, **Currency**), then click **Search**. If you search by keyword, enter **at least three characters**
3. The first grid is a **customer summary** — click a **customer row** to open **Entity Report Transactions**
4. Open the **Transaction Docs** tab to see all movements, or the **Statement Of Account** tab for the formatted run. On **Statement Of Account**, set **Month From** and **Month To**, click **Search**, then read **opening balance**, each line, and **closing balance**. Use **Export to PDF** when you need a file
5. Open the **Aging** tab for an aging-style view for that customer: set **Month To** only, click **Search**, then **Export to PDF** if you need a copy (**Month From** is not used on this tab)

---

### Audit User: Trace Historical Transactions

**Goal:** Look at the AR position as it was in a **past month** (not "today").

1. Click **Historical Transaction Aging Analysis Report** in the sidebar
2. Set **As Of Date** (pick the **month** you want), plus **Company**, **Entity**, **Branch**, **Currency**, or other filters your team uses, then click **Search**
3. Click any row to open **View Document** — check **Details**, **Settlement**, and **Line Items**
4. For a **customer-level summary** for the same kind of "as of" month, open **Historical Debtor Report** instead, set **As Of Date** and filters, then **Search**

**Why two historical reports?** The **transaction aging** view is **line-by-line** for audits. The **historical debtor** view is a **shorter balance per customer**. A document can still look **outstanding** in an older month even if something newer was created later — the report shows **what was owed back then**, which helps tie numbers to month-end or balance-sheet work.

---

### Collection Manager: Review by Salesman

**Goal:** See which invoices are outstanding and how old they are, grouped by salesman.

1. Click **Collection Invoice with Aging** in the sidebar
2. Set filters: **Branch**, **Salesman** (Employee), **Entity**, **Shipping Entity**, and **Transaction Date** range, then click **Search**
3. Review the collection list — each row shows the customer, the invoice, and which aging bucket the balance falls into
4. Use this report during collection review meetings to track salesman performance and prioritize follow-ups

---

## Reports in Detail

### Outstanding Document Report

This is your go-to report for **daily AR monitoring**. It lists every customer document (invoices, debit notes, and so on) that still has an **open balance as of today**. There is **no calendar date range** on this screen — if you need a statement for a past month, use **Statement of Account** instead.

| What you can do | How |
|---|---|
| See all unpaid customer documents | Set filters at the top (customer, category, company, branch, ARAP type, currency as needed) then click **Search** |
| Filter by AR type | Use **ARAP Type** filter — defaults to AR Trade, AR Other, AR Merchant |
| Drill into a document | Click any row to open **View Outstanding Document** |
| Review payment history on a doc | Open the **Settlement** tab |
| See line items | Open the **Line Items** tab |
| See contra entries | Open the **Contra** tab |
| Print the document | Click **PRINT** in the detail header |

**Available detail tabs:** Details · Account · Line Items · Settlement · Contra · Delivery Details · Department · Doc Link

{{< callout type="tip" >}}
**Tab order is customizable.** Go to **Settings → Default Selection** and drag the tabs into the order that suits your team's workflow. Click **SAVE** when done.
{{< /callout >}}

---

### Aging Report

The Aging Report answers one key question: **"How old is the money our customers owe us?"** It groups outstanding amounts into time buckets — so you can see at a glance if most of your receivables are current (0–30 days) or seriously overdue (90+ days). Bucket labels follow your **Field Settings** (**Day** or **Month** ranges).

| What you can do | How |
|---|---|
| Load the aging grid | Open **Aging Report** → pick **Company**, then narrow with **Entity** (customer), **Customer Category**, **Employee** (salesman), or keyword → click **Search** |
| Read all bucket columns | **Scroll horizontally** across the grid |
| Work with customer groups | Use **expand** / **collapse** on grouped customer rows to show or hide detail lines |
| See individual transactions behind a bucket | Click a row to open **Aging Report Transactions** → **Outstanding Docs** tab |
| Export the aging data | Click **EXPORT** in the detail header |

{{< callout type="tip" >}}
**You can control how aging buckets are defined.** Go to **Settings → Field Settings** and set **Aging Period Type** to **Month** (calendar months) or **Day** (day ranges). This affects all aging reports.
{{< /callout >}}

---

### Statement of Account

Think of this like a **bank statement — but for a customer**. You start from a **customer summary** list; after you **open a customer**, you can switch between **transaction lines**, a **formatted statement**, and an **aging** view for that customer.

| What you can do | How |
|---|---|
| Find customers | Open **Statement of Account** from the left menu → set filters → click **Search** |
| See the summary list | Stay on the first grid — one row per customer with headline figures |
| See every movement | Click a customer row → open the **Transaction Docs** tab |
| See a formal statement with balances | Open **Statement Of Account** tab → set **Month From** and **Month To** → click **Search** → read **opening balance**, lines, and **closing balance** → **Export to PDF** if needed |
| See aging for that customer only | Open the **Aging** tab → set **Month To** (this tab does **not** use **Month From**) → click **Search** → **Export to PDF** if needed |

**Available filter options:** Entity, Customer Category, Company, Branch, Shipping Entity, Employee, Transaction Date, Currency, Outstanding Only toggle

---

### Historical Reports

Use these when you need **balances or aging as of a past month**, not "today."

**Shared workflow:** Open the report from the left menu → set **As Of Date** (pick the **month**) and the other filters shown on that screen → click **Search** → click rows to open document detail when you need to drill down.

**Historical Transaction Aging Analysis Report**
- **Line-level** aging and documents for the month you pick — best for **audits** and tracing **what was still open then**
- Available filters: Entity, Customer Category, Company, Branch, Shipping Entity, As Of Date (required), Currency
- A document can appear **outstanding** in an older month even if related paperwork was created later — the grid reflects **what was owed in that historical month**

**Historical Debtor Report**
- **Summary** balance **per customer** for the same **As Of Date** — best when you want a **short comparison** across months
- Available filters: Entity, Customer Category, Company, As Of Date (required), Shipping Entity
- When you use the **same month and matching filters** as the transaction aging report, the **totals should line up**; one view is detail, the other is the headline balance

---

### AR Transaction Report

Focused on **AR activity within a date range** — useful for reconciliation, audits, and reviewing all movements between two dates.

| What you can do | How |
|---|---|
| See AR activity between two dates | Open **AR Transaction Report** → choose **Company** (required) → set **Transaction Date** **from** and **to** → optional **Entity** / **Branch** / **Sort by** → click **Search** |
| Read the running balance | Rows group by customer — **expand** a customer to see each line; the **Balance** column walks through your dates so you can see the position **before** your start date and **through** the end date |
| Open the source document | Click any row to open **Generic Document View** and review the original document |

**Available filter options:** Entity, Company (required), Branch, Transaction Date (from/to), Sort By, Shipping Entity, Customer Category

---

### Collection Invoice with Aging

A specialized report for **sales and collection teams** to see invoices grouped by salesman, with aging buckets showing how long each invoice has been unpaid.

| What you can do | How |
|---|---|
| See collection list by salesman | Open **Collection Invoice with Aging** → set **Branch**, **Salesman** (Employee), **Entity**, **Shipping Entity**, and **Transaction Date** range → click **Search** |
| Identify overdue invoices | Read the aging bucket columns to see how old each invoice is |
| Use in collection meetings | Export the grid data and present per-salesman outstanding balances |

**Available filter options:** Branch, Salesman (Employee), Entity, Shipping Entity, Transaction Date (from/to)

---

## Configuration & Settings

### Field Settings

These options apply to **everyone** who uses the applet. Go to **Settings → Field Settings**, adjust the settings, then click **SAVE**.

| Setting | What it does |
|---|---|
| **Aging Period Type** | Choose **Month** (default) to group aging by calendar month, or **Day** to group by number of days |
| **Document Types to Exclude** | Hide selected document types from debtor reports |

---

### Aging Period Settings

Go to **Settings → Aging Period Settings** to define the specific time buckets used in aging reports. For example, you can set buckets of 30 / 60 / 90 / 120+ days, or define month-based ranges. Changes here affect all aging views in the applet.

---

### Default Selection (Applet-Wide)

Go to **Settings → Default Selection**. Set **default filters** that apply to all users when they open a report.

- **Default Branch** — pre-select a branch so users do not have to pick one every time
- **Default Location** — same as above for location
- **Details Tab Ordering** — changes the order of tabs when you open a document from **Outstanding Document Report** (for example **Details**, **Settlement**, **Line Items**). Click and hold a tab name, drag it left or right, then release. Click **SAVE** when you are done

**Available tabs to reorder:** Details · Account · Line Items · Settlement · Contra · Delivery Details · Department · Doc Link

---

### Printable Format Settings

Upload custom print templates for reports. Use the **Upload File(s)** button to add a template, and manage existing ones from the list. Printable formats affect how PDF exports look when you click **PRINT** or **Export to PDF** from any report.

---

### Personal Default Selection

Each user can set their **own** preferred Branch and Location defaults. These override the applet-wide defaults for that user only. Go to **Personalization → Default Selection**, set your preferred **Default Branch** and click **SAVE**.

---

## Related Modules and Applets

The Debtor Report Applet works alongside these other parts of the system:

| Related Applet / Module | How it connects |
|---|---|
| **[Accounts Receivable Applet](/applets/finance/accounts-receivable-applet/)** | The transaction-processing side — invoices, receipts, and credit notes created there appear as documents in this applet |
| **[General Ledger Applet](/applets/finance/general-ledger-applet/)** | AR transactions post to the GL; use this applet to verify the customer-level detail behind GL AR balances |
| **[Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/)** | Customer payments processed here are reflected in the Settlement tabs of this applet |
| **[Entity Applet](/applets/master-data/entity-applet/)** | Customer master data — the customers you see in filters here come from the Entity Applet |
| **[Creditor Report Applet](/applets/creditor-report-applet/)** | The AP counterpart — same report structure but focused on what you owe suppliers |
| **Accounting Module** | Opening balance AR uploads use this applet to verify that customer balances were correctly imported |

{{< callout type="info" >}}
**Used in the Accounting Module opening balance process:** After uploading customer outstanding invoices, go to **Debtor Report Applet → Outstanding Document Report** to verify that all customer balances appear correctly before going live.
{{< /callout >}}

---

## Glossary

New to AR terminology? Here is what the key terms mean in plain English.

| Term | What it means |
|---|---|
| **Debtor** | A customer that owes your company money. When you sell goods or services on credit, the customer becomes a debtor. |
| **Accounts Receivable (AR)** | The total money customers owe your company for sales already made but not yet paid for. |
| **Outstanding Document** | Any invoice, debit note, or other document from a customer that has not been fully paid or matched with a receipt yet. |
| **Aging / Aging Analysis** | A breakdown of outstanding amounts grouped by how long they have been unpaid — for example, 0–30 days, 31–60 days, 61–90 days, 90+ days. The older the bucket, the more overdue the collection. |
| **Aging Period** | The unit used to define aging buckets. Set to **Month** (groups Jan, Feb, etc.) or **Day** (groups 1–30, 31–60, etc.). |
| **Statement of Account** | A summary showing all transactions with a customer — invoices issued, payments received, credits applied — and the resulting balance. Like a bank statement, but for your customer relationship. |
| **Settlement** | The process of matching a receipt to one or more invoices. When an invoice is "settled," it means a payment has been linked to it, reducing or clearing the balance. |
| **Sales Invoice** | A bill you send to your customer after delivering goods or services. It tells them how much they owe and when payment is due. |
| **AR Transaction** | Any financial movement in the accounts receivable ledger — this includes invoices raised, receipts collected, credit notes issued, and debit notes. |
| **Contra** | A contra entry is when two parties owe each other money and agree to offset the amounts. For example, if a customer also supplies to you, you can net off what each owes the other. |
| **Debit Note** | A document a customer sends to request a reduction in the amount they owe you — for example, if goods were returned or incorrectly invoiced. |
| **Credit Note** | A document you send to a customer to reduce the amount they owe — essentially a partial refund on an existing invoice. |
| **ARAP Type** | Accounts Receivable / Accounts Payable type. Common AR types: **AR Trade** (regular sales), **AR Other**, **AR Merchant**. |
| **As Of Date** | The month-end snapshot date used by historical reports — shows the AR position as it was at the end of that month. |

---

## FAQ

### 1. Which report should I use to find unpaid customer invoices?

Use the **Outstanding Document Report**. It lists every customer document that still has an open balance. Click any row to see the full detail, including what receipts have already been applied.

---

### 2. What is the difference between the Aging Report and the Outstanding Document Report?

- **Outstanding Document Report** — shows individual unpaid documents (one row = one document)
- **Aging Report** — groups the outstanding amounts by customer and by how long they have been unpaid (one row = one customer, with amounts split into time buckets)

Use Outstanding Document for day-to-day follow-up on specific invoices. Use Aging for a high-level receivables health check.

---

### 3. Can I set it so the system always defaults to my branch?

Yes. Go to **Personalization → Default Selection**, set your **Default Branch** and **Default Location**, and click **SAVE**. These personal defaults will apply every time you open a report.

---

### 4. How do I change whether aging is shown by month or by day?

Go to **Settings → Field Settings**, change the **Aging Period Type** to **Month** or **Day**, and click **SAVE**. This affects all aging reports for all users.

---

### 5. How do I get a statement to send to a customer for reconciliation?

Go to **Statement of Account**, search for the customer, click their row, then open the **Statement Of Account** tab. Set **Month From** and **Month To** to cover the period the customer is asking about, click **Search**, and then click **Export to PDF**.

---

### 6. What is the difference between the two historical reports?

- **Historical Transaction Aging Analysis Report** — line-by-line detail for audits and tracing exactly which documents were open in a past month
- **Historical Debtor Report** — a shorter summary showing one balance per customer for the same past month

Both use **As Of Date** (a month picker). Use the transaction report for audits. Use the debtor report for quick monthly comparisons.

---

### 7. Why does a document still appear in a historical report even though it was paid later?

Historical reports show the AR position **as of the month you selected**, not today. If an invoice was still unpaid at the end of that month, it appears outstanding — even if a receipt was applied in a later month. This is by design, and is exactly what you need for month-end reconciliation and audit purposes.

---

### 8. What does the Collection Invoice with Aging report show that the Aging Report does not?

The **Collection Invoice with Aging** report is filtered and grouped by **Salesman**, making it ideal for sales review meetings. It shows which salesman owns each outstanding invoice and how old it is. The standard **Aging Report** is grouped by customer and is better for credit control.

---

### 9. Can I customise which tabs appear when I open a document?

Yes. Go to **Settings → Default Selection** and use the **Details Tab Ordering** section. Click and hold any tab name, drag it to a new position, and click **SAVE**. This changes the tab order for all users of the applet.

---

### 10. How do I verify that opening balance AR uploads were done correctly?

After uploading customer outstanding invoices using the CSV import process, open this applet and go to **Outstanding Document Report**. Filter by the relevant company and branch, and check that all uploaded invoices appear with the correct balances. For a summary view, use **Statement of Account** to see the opening balance per customer.

