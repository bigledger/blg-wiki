---
title: "Debtor and Creditor Report Applet"
description: "Real-time aging analysis, outstanding balance tracking, and financial health reporting for Accounts Receivable and Accounts Payable teams"
tags:
- accounts-receivable
- accounts-payable
- debtor-report
- creditor-report
- aging-analysis
- financial-reports
weight: 70
---

## Purpose and Overview

The **Debtor and Creditor Report Applet** is the financial intelligence center for your organization's cash flow. It answers two of the most critical questions in business: **"Who owes us money, and how old is that debt?"** and **"Who do we owe money to, and when is it due?"**

Instead of manually pulling data from dozens of invoices and payment records, this applet automatically calculates aging buckets, tracks outstanding balances in real-time, and generates professional statements — all from a single screen.

{{< callout type="info" >}}
**Core Concept: Debtors vs Creditors**
- **Debtor (Accounts Receivable):** A customer who owes *you* money. They bought your goods but haven't paid yet.
- **Creditor (Accounts Payable):** A supplier *you* owe money to. They delivered materials but you haven't paid yet.
{{< /callout >}}

### Who Benefits from This Applet?

| Role | How they use it |
|------|-----------------|
| **AR Collection Officers** | Identifying which customers are 90+ days overdue and prioritizing collection calls. |
| **AP Payment Officers** | Planning the weekly payment run by seeing which supplier invoices are about to become overdue. |
| **Finance Managers** | Running month-end aging reports to present the company's receivable/payable health to management. |
| **CFOs / Management** | Monitoring the net cash position (Total Receivables vs Total Payables) to make strategic decisions. |
| **External Auditors** | Pulling aging confirmation letters and outstanding document trails during annual audits. |

---

## What Problems Does This Solve?

**Without This Applet:**
- Aging calculations are done manually in spreadsheets, often with formula errors that misclassify 90-day debts as 30-day.
- Finance staff open invoices one-by-one to figure out which customers haven't paid.
- There's no single "source of truth" — the AR team's number never matches the GL team's number.
- Creating a customer statement for a collection letter takes an hour of copy-pasting.

**With Debtor & Creditor Report Applet:**
- ✓ **Automated Aging Buckets** — The system instantly classifies every outstanding amount into Current, 1-30, 31-60, 61-90, and 90+ day buckets based on invoice due dates.
- ✓ **Real-Time Balances** — Numbers update the moment a payment is posted or an invoice is finalized. No more stale data.
- ✓ **Drill-Down Traceability** — Click any customer's total to see the exact invoices, credit notes, and partial payments that make up that balance.
- ✓ **One-Click Export** — Generate Excel reports for pivot table analysis or PDF statements for customer communication.

{{< figure src="/images/debtor-and-creditor-report-applet/debtor-creditor-infographic.jpg" alt="Master Your Cash Flow: A Guide to the Debtor & Creditor Report Applet - showing the Core Fundamentals, Aging Engine, Risk Levels, Role-Based Workflows, and Drill-Down Traceability Features" caption="Master Your Cash Flow: A Guide to the Debtor & Creditor Report Applet. From core AR/AP fundamentals through the aging engine and risk levels to role-based workflows and one-click exports." >}}

---

## The Aging Framework: Understanding the Numbers

Before diving into the reports, you must understand how the system calculates "aging." This is the single most important concept in this applet.

### The Aging Buckets

| Bucket | Meaning | Risk Level | Action Required |
|--------|---------|------------|-----------------|
| **Current** | Invoice is NOT yet due. The customer still has time to pay within their agreed terms. | 🟢 Low | Monitor only. |
| **1-30 Days** | Invoice is 1 to 30 days *past* its due date. | 🟡 Medium | Send a friendly payment reminder. |
| **31-60 Days** | Invoice is 31 to 60 days overdue. | 🟠 High | Escalate. Make a collection call. |
| **61-90 Days** | Invoice is 61 to 90 days overdue. Payment is significantly delayed. | 🔴 Very High | Issue a formal demand letter. Consider putting the customer's account on hold. |
| **90+ Days** | Invoice has been overdue for over 3 months. This debt is at serious risk of becoming a bad debt. | ⛔ Critical | Escalate to management. Consider engaging a collection agency or initiating write-off procedures. |

{{< callout type="warning" >}}
**Critical Distinction: Invoice Date vs Due Date.** Aging is calculated from the **Due Date**, not the Invoice Date. If you issue an invoice on Jan 1st with 30-day payment terms, the Due Date is Jan 31st. The aging clock only starts ticking on Feb 1st.
{{< /callout >}}

### Outstanding vs Overdue — Know the Difference

- **Outstanding**: The *total* unpaid amount. This includes invoices that are not yet due (Current) *and* invoices that are past due. An outstanding balance is not necessarily a problem.
- **Overdue**: *Only* the amounts that have passed their due date. An overdue balance *is* a problem and requires action.

---

## Role-Based Quick Start Guides

### For AR Officers: Hunt Down Overdue Receivables
Your goal is to identify which customers need a collection call today.

1. Go to **Debtor Aging Report** from the sidebar.
2. Set the **As of Date** to today's date.
3. Select your **Company**.
4. Click **Search / Generate Report**.
5. The report loads, showing every customer with an outstanding balance, broken down by aging bucket.
6. **Sort the `90+ Days` column from highest to lowest.** The customer at the top of this list is your #1 priority.
7. Click on that customer's row to drill down into their **Outstanding Docs** tab.
8. You can now see *exactly* which invoices are causing the overdue amount (e.g., Invoice #INV-2024-0234, RM 15,000, issued 4 months ago).
9. Export the customer's details to PDF to attach to your collection email.

### For AP Officers: Plan the Weekly Payment Run
Your goal is to identify which suppliers need to be paid this week to avoid damaging relationships.

1. Go to **Creditor Aging Report** from the sidebar.
2. Set the **As of Date** to today's date.
3. Click **Search / Generate Report**.
4. **Focus on the `Current` and `1-30 Days` columns.** These are the invoices that are either about to become due or have just become overdue.
5. Sort by `1-30 Days` descending to see which supplier is owed the most overdue money.
6. Use this report as the basis for your weekly payment batch in the Payment Voucher applet.

### For Finance Managers: The Month-End Aging Snapshot
Your goal is to generate the official month-end aging report for the management meeting.

1. Go to **Debtor Aging Report**.
2. Set the **As of Date** to the **last day of the month** (e.g., `31 Jan 2025`). This is critical — it freezes the report in time, showing the exact position at month-end.
3. Click **Generate**.
4. Click **Export to Excel**.
5. Repeat the process for the **Creditor Aging Report**.
6. You now have a matched pair of AR/AP aging reports that represent the company's receivable and payable health at a single point in time.

---

## Deep-Dive: The Report Workspaces

### 1. Debtor Aging Report (The AR Command Center)
This is the primary report for tracking money owed *to* your company.

**Report Columns:**

| Column | What it shows |
|--------|---------------|
| **Customer Code** | The unique identifier for the customer from the Customer Maintenance Applet. |
| **Customer Name** | The customer's business name. |
| **Current** | Total amount of invoices that are NOT yet due. |
| **1-30 Days** | Total amount of invoices that are 1-30 days past their due date. |
| **31-60 Days** | Total of invoices 31-60 days overdue. |
| **61-90 Days** | Total of invoices 61-90 days overdue. |
| **90+ Days** | Total of invoices more than 90 days overdue. This is the danger column. |
| **Total** | The grand total of all outstanding amounts for that customer. |

**Filters:**

| Filter | Purpose |
|--------|---------|
| **As of Date** | The most important filter. It determines *when* aging is calculated. Setting it to a past date lets you generate historical reports. |
| **Company** | Filter by your legal entity. Essential for multi-company organizations. |
| **Customer** | Narrow down to a specific customer for a focused view. |
| **Currency** | Switch the reporting currency. |
| **Include Zero Balances** | Toggle on to show customers who have fully paid up (useful for audits). |

**Drill-Down Tabs (Click on any customer row):**

| Tab | Purpose |
|-----|---------|
| **Main** | A summary of the customer's overall aging breakdown and their payment behavior pattern. |
| **Outstanding Docs** | The critical detail view — lists every individual invoice, credit note, and debit note that makes up the customer's total balance. Click any document to trace it back to the original transaction. |

{{< callout type="tip" >}}
**Pro Tip:** Use the **Outstanding Docs** tab during collection calls. You can tell the customer exactly: *"Invoice #INV-0234 for RM 15,000 dated Oct 5th is now 90 days overdue."* This level of specificity accelerates payment.
{{< /callout >}}

### 2. Creditor Aging Report (The AP Command Center)
This is the mirror image of the Debtor report, but it tracks money *you owe* to suppliers.

The column structure and filters are identical to the Debtor Aging Report, but the perspective is reversed:
- **Current** = Supplier invoices you haven't paid yet, but they are not due yet. You're within terms.
- **90+ Days** = Supplier invoices you are severely late on. This risks damaged supplier relationships, late fees, or supply disruption.

### 3. Outstanding Document Report (The Transaction-Level Audit Trail)
This is the most granular report in the applet. It shows *every single document* (invoice, credit note, debit note, payment) across all customers or vendors.

**Document Detail Tabs (8 Tabs):**

| Tab | Purpose |
|-----|---------|
| **Details** | Document header: number, date, entity, total amount, status. |
| **Account** | The General Ledger (GL) account breakdown and accounting double-entry. |
| **Line Items** | Individual line items on the invoice (e.g., 10x Laptops @ RM 3,000 each). |
| **Delivery Details** | Shipping and delivery information (for sales-related documents). |
| **Settlement** | **The Reconciliation Powerhouse.** Shows exactly which payments settled which invoices, including partial payments. |
| **Department** | Department allocation and cost center breakdown for internal reporting. |
| **Contra** | Contra entries and offsetting transactions between AR and AP. |
| **Doc Link** | **The Paper Trail.** Links to all related documents (Purchase Order → GRN → Invoice → Payment) for full end-to-end traceability. |

{{< callout type="tip" >}}
**Auditor's Best Friend:** When an external auditor asks, *"Show me the payment trail for Invoice #5567,"* open the document, go to the **Settlement** tab to see the payment, then go to **Doc Link** to show the original PO and GRN. The entire audit trail is one click away.
{{< /callout >}}

### 4. Outstanding Entity Report (The Customer/Vendor Summary)
This report groups balances by entity (customer or vendor) and is the primary source for generating **Statements of Account**.

- **Statement Generation:** Generate a professional document showing a customer's opening balance, all transactions in a given period, all payments received, and the closing balance. This is the document you attach to a formal collection letter.

---

## Applet Configuration (For Admins)

Navigate to **Settings** in the sidebar to configure the applet.

### Default Settings
Pre-set values that auto-populate when running reports, saving repetitive clicks.

| Setting | Purpose | Example |
|---------|---------|---------|
| **Default Company** | Auto-selects your primary legal entity so you don't have to pick it every time. | *BigLedger Sdn Bhd* |
| **Default Currency** | Sets the reporting currency. | *MYR* |
| **Default Date Range** | Controls how far back the report loads data by default. | *Current Month* |

### Field Configuration
Customize which columns appear in each report listing and their display order. Use this to hide columns that are irrelevant to your team's workflow and reduce visual clutter.

### Printable Format Settings
Configure the templates used when exporting to PDF or printing.

| Tab | Purpose |
|-----|---------|
| **Details** | Control the header and footer of the printed report (company logo, address, footer notes). |
| **Line** | Control the column layout and ordering on the printed line items. |

---

## Common Real-World Scenarios

### Scenario 1: The Month-End Collection Blitz
**The Situation:** It's January 31st. The CFO wants to reduce the company's overdue receivables by 20% before the board meeting next week.
**The Workflow:**
1. AR Manager opens the **Debtor Aging Report** with As of Date = Jan 31.
2. Sorts the `90+ Days` column descending. The top 5 customers account for RM 500,000 of the RM 800,000 total overdue.
3. For each of these 5 customers, the AR Manager clicks into the **Outstanding Docs** tab and identifies the specific invoices.
4. The AR Manager exports each customer's aging detail to **PDF** and distributes them to 5 AR Officers, one customer per officer.
5. Each officer calls their assigned customer with the exact invoice numbers and amounts, accelerating the collection process.

### Scenario 2: The Supplier Threatening to Stop Delivery
**The Situation:** A key raw materials supplier calls and says, *"You owe us RM 120,000. If you don't pay by Friday, we are suspending all deliveries."*
**The Workflow:**
1. AP Officer opens the **Creditor Aging Report** and filters by that specific Vendor.
2. The report confirms: RM 45,000 in the `Current` bucket, RM 50,000 in the `1-30 Days` bucket, and RM 25,000 in the `61-90 Days` bucket.
3. AP clicks into the **Outstanding Docs** tab. The RM 25,000 in the 61-90 bucket is a single invoice from 2 months ago that was somehow missed.
4. AP immediately creates a priority payment for the RM 25,000 overdue invoice and communicates the plan to the supplier, preserving the relationship and the supply chain.

### Scenario 3: The External Audit Confirmation
**The Situation:** External auditors require a list of all outstanding receivables as of Dec 31st for year-end confirmation letters.
**The Workflow:**
1. Finance Manager opens the **Debtor Aging Report** with As of Date = `31 Dec 2024`.
2. Enables **Include Zero Balances** to capture the complete customer list.
3. Exports the full report to **Excel**.
4. For each material customer, opens the **Outstanding Entity Report** and generates a **Statement of Account** for the period Jan 1 - Dec 31.
5. The Statement is exported to PDF and attached to the auditor's confirmation letter, showing opening balance, all transactions, payments, and closing balance.

---

## FAQs

**Q: What is the most important filter in this applet?**
A: The **As of Date**. It determines *when* the aging is calculated. If you set it to Dec 31st, the report shows you the exact financial position at that date, even if you run it in February. This is how you generate historical, point-in-time reports for audits and board meetings.

**Q: Why does my aging report total not match the General Ledger balance?**
A: This is one of the most common questions. Check three things:
1. Ensure you are using the exact same **As of Date** in both the aging report and the GL Trial Balance.
2. Ensure you are filtering by the same **Company** and **Currency**.
3. Verify that all relevant invoices and payments have been **Finalized/Posted**. Draft or unposted documents will not appear in the aging report but may exist in the GL.

**Q: Can I see why a customer's balance is so high?**
A: Yes. Click on the customer's row in the Debtor Aging Report. Go to the **Outstanding Docs** tab. This lists every single unpaid invoice, credit note, and debit note. You can see the exact document numbers, dates, and amounts that make up their total balance.

**Q: How is aging calculated — from Invoice Date or Due Date?**
A: Aging is always calculated from the **Due Date** to the **As of Date** you selected. The Invoice Date is irrelevant for aging purposes. This means if you issue an invoice on Jan 1st with Net 30 terms (Due Date = Jan 31st), the invoice will remain in the "Current" bucket until Feb 1st.

**Q: Can I generate a formal Statement of Account to send to a customer?**
A: Yes. Use the **Outstanding Entity Report**, select the customer, and use the Statement Generation feature. It produces a professional document showing Opening Balance → Transactions → Payments → Closing Balance for a given period.

**Q: I see some customers with zero balance in the report. How do I hide them?**
A: Uncheck the **Include Zero Balances** filter before generating the report. This keeps the listing clean and focused on customers who actually owe money.

**Q: How often does this data update?**
A: In real-time. The moment a payment is posted or an invoice is finalized in the system, the aging report reflects the change immediately. Simply refresh or re-generate the report to see the latest data.
