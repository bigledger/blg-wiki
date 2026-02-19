---
title: "Debtor and Creditor Report Applet"
description: "Financial reporting for Accounts Receivable (Debtors) and Accounts Payable (Creditors) with aging analysis"
tags:
- accounts-receivable
- accounts-payable
- debtor-report
- creditor-report
- aging-analysis
- financial-reports
---

## Purpose and Overview

The **Debtor and Creditor Report Applet** provides comprehensive financial reporting for managing your organization's receivables (money owed to you) and payables (money you owe). It offers powerful aging analysis and outstanding balance tracking.

{{< callout type="info" >}}
**Core Concept**: **Debtors** are customers who owe you money (Accounts Receivable). **Creditors** are vendors/suppliers you owe money to (Accounts Payable).
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance Teams:**
- Monitor outstanding receivables and payables
- Track aging of invoices
- Ensure timely collections and payments
- Generate financial reports for audits

**Accounts Receivable (AR) Teams:**
- Track customer outstanding balances
- Identify overdue accounts
- Prioritize collection efforts
- Monitor customer payment patterns

**Accounts Payable (AP) Teams:**
- Track vendor outstanding balances
- Plan payment schedules
- Ensure timely supplier payments
- Monitor payment terms compliance

**Management & Executives:**
- Dashboard view of cash flow position
- Monitor working capital
- Identify credit risks
- Make data-driven collection decisions

### What Problems Does This Solve?

**Traditional AR/AP Challenges:**
- No consolidated view of outstanding balances
- Manual aging calculations prone to errors
- Difficulty identifying overdue accounts
- Lack of visibility into payment patterns
- Time-consuming report generation

**The Solution:**
- **Real-time reporting** - Up-to-date balance information
- **Automated aging** - Instant aging bucket calculations
- **Multi-currency support** - View balances in any currency
- **Flexible filtering** - Drill down by customer, vendor, date
- **Export options** - Generate Excel/PDF reports easily

## Key Features Overview

{{< cards >}}
  {{< card title="Debtor Aging Report" subtitle="AR aging analysis by customer" link="#debtor-aging-report" >}}

  {{< card title="Creditor Aging Report" subtitle="AP aging analysis by vendor" link="#creditor-aging-report" >}}

  {{< card title="Outstanding Summary" subtitle="Balance overview dashboard" link="#outstanding-summary" >}}

  {{< card title="Detailed Reports" subtitle="Transaction-level details" link="#detailed-reports" >}}

  {{< card title="Export & Print" subtitle="Generate PDF and Excel reports" link="#export--print" >}}

  {{< card title="Settings" subtitle="Configure report options" link="#configuration--settings" >}}
{{< /cards >}}

---

## Key Concepts

### Debtor vs Creditor

| Term | Also Known As | Description | Example |
|------|---------------|-------------|---------|
| **Debtor** | Customer, Accounts Receivable | Someone who owes you money | Customer with unpaid invoices |
| **Creditor** | Vendor/Supplier, Accounts Payable | Someone you owe money to | Supplier with unpaid bills |

### Aging Buckets

Aging analysis categorizes outstanding amounts by how long they've been due:

| Bucket | Description | Risk Level |
|--------|-------------|------------|
| **Current** | Not yet due | Low |
| **1-30 Days** | 1-30 days overdue | Medium |
| **31-60 Days** | 31-60 days overdue | High |
| **61-90 Days** | 61-90 days overdue | Very High |
| **90+ Days** | Over 90 days overdue | Critical |

### Outstanding vs Overdue

- **Outstanding**: Total amount not yet paid (includes current and overdue)
- **Overdue**: Amounts past the payment due date
- **Current**: Amounts not yet due (within payment terms)

---

## Quick Start Guide

### For Finance: Run Debtor Aging Report

**Goal:** View all customer outstanding balances with aging.

1. **Navigate**: Go to **Debtor Aging Report** from the sidebar
2. **Set Filters**:
   - **As of Date**: Report date (usually today)
   - **Company**: Select your company
   - **Currency**: Reporting currency
3. **Generate**: Click **Search** or **Generate Report**
4. **Review**: See customers grouped by aging buckets
5. **Export**: Click **Export to Excel** for further analysis

**Key Insight:** Large amounts in 90+ days need immediate collection attention.

---

### For Finance: Run Creditor Aging Report

**Goal:** View all vendor outstanding balances with aging.

1. **Navigate**: Go to **Creditor Aging Report** from the sidebar
2. **Set Filters**:
   - **As of Date**: Report date
   - **Company**: Select your company
   - **Currency**: Reporting currency
3. **Generate**: Click **Search** or **Generate Report**
4. **Review**: See vendors grouped by aging buckets
5. **Plan**: Identify payments due soon to manage cash flow

**Key Insight:** Focus on 1-30 days bucket for immediate payment planning.

---

### For Managers: Monitor Outstanding Balances

**Goal:** Get a quick overview of AR/AP position.

1. **Check Summary**: Review the Outstanding Summary dashboard
2. **Compare**: 
   - Total Receivables vs Total Payables
   - Overdue amounts in each category
3. **Drill Down**: Click on any amount to see details
4. **Take Action**: Assign follow-ups for critical accounts

---

## Debtor Aging Report

### What It Shows

The Debtor Aging Report displays:
- Customer/debtor name and code
- Total outstanding amount
- Breakdown by aging bucket (Current, 1-30, 31-60, 61-90, 90+)
- Invoice details (optional drill-down)

### Report Columns

| Column | Description |
|--------|-------------|
| Customer Code | Unique customer identifier |
| Customer Name | Customer/debtor name |
| Current | Amounts not yet due |
| 1-30 Days | 1-30 days overdue |
| 31-60 Days | 31-60 days overdue |
| 61-90 Days | 61-90 days overdue |
| 90+ Days | Over 90 days overdue |
| Total | Total outstanding balance |

### Filter Options

| Filter | Description |
|--------|-------------|
| As of Date | Calculate aging as of this date |
| Company | Filter by company |
| Customer | Specific customer (optional) |
| Currency | Reporting currency |
| Include Zero Balances | Show customers with no outstanding |

### Use Cases

**Collections Prioritization:**
```
Sort by 90+ Days Descending → Focus on oldest debts first
```

**Customer Credit Review:**
```
Filter by Customer → See payment history and patterns
```

**Monthly Reporting:**
```
As of Date = Month End → Generate for management reporting
```

### Viewing Aging Report Details - 2 Tabs

When you click on a customer row in the Debtor Aging Report, the view shows:

| Tab | Purpose |
|-----|---------|
| **Main** | Summary of the customer's aging breakdown, payment history |
| **Outstanding Docs** | List of individual documents (invoices, credit notes) that make up the balance |

{{< callout type="tip" >}}
**Drill-Down Tip**: Use the Outstanding Docs tab to see exactly which invoices are aging, then click on individual documents for full details.
{{< /callout >}}

---

## Creditor Aging Report

### What It Shows

The Creditor Aging Report displays:
- Vendor/supplier name and code
- Total outstanding amount owed
- Breakdown by aging bucket
- Invoice details (optional drill-down)

### Report Columns

| Column | Description |
|--------|-------------|
| Vendor Code | Unique vendor identifier |
| Vendor Name | Vendor/supplier name |
| Current | Amounts not yet due |
| 1-30 Days | 1-30 days overdue |
| 31-60 Days | 31-60 days overdue |
| 61-90 Days | 61-90 days overdue |
| 90+ Days | Over 90 days overdue |
| Total | Total outstanding balance |

### Use Cases

**Payment Planning:**
```
Filter: 1-30 Days → Identify payments due this month
```

**Cash Flow Management:**
```
Review Total column → Plan cash requirements
```

**Vendor Relationship:**
```
Monitor 90+ Days → Avoid damaging supplier relationships
```

---

## Outstanding Summary

### Dashboard Overview

The summary view provides:
- **Total Debtors Outstanding**: Sum of all receivables
- **Total Creditors Outstanding**: Sum of all payables
- **Net Position**: Debtors minus Creditors
- **Aging Distribution**: Visual breakdown by bucket

### Key Metrics

| Metric | Formula | Interpretation |
|--------|---------|----------------|
| **DSO** (Days Sales Outstanding) | (Avg AR / Revenue) × Days | Lower is better |
| **DPO** (Days Payable Outstanding) | (Avg AP / COGS) × Days | Depends on strategy |
| **Overdue %** | Overdue / Total Outstanding | Lower is better |

---

## Outstanding Document Report

The **Outstanding Document Report** provides transaction-level detail for each document (invoice, credit note, payment) affecting balances.

### Viewing a Document - 8 Tabs

When you select a document from the report, you see detailed information across multiple tabs:

| Tab | Purpose |
|-----|---------|
| **Details** | Document header info: number, date, entity, amounts, status |
| **Account** | GL account breakdown and accounting entries |
| **Line Items** | Individual line items on the document |
| **Delivery Details** | Shipping/delivery information (for sales documents) |
| **Settlement** | Payment history and settlement transactions |
| **Department** | Department allocation and cost center breakdown |
| **Contra** | Contra entries and offsetting transactions |
| **Doc Link** | Links to related documents (POs, invoices, payments) |

{{< callout type="tip" >}}
**Settlement Tab**: This is especially useful for AR/AP reconciliation—see exactly which payments settled which invoices.
{{< /callout >}}

### Key Use Cases

**Invoice Investigation:**
- Open the document → Check **Details** for basic info
- Go to **Line Items** to see what was sold/purchased
- Check **Settlement** to see payment status

**Document Tracing:**
- Use **Doc Link** tab to trace the document chain
- See related PO → Invoice → Payment connections

---

## Outstanding Entity Report

The **Outstanding Entity Report** shows balances grouped by customer or vendor entity.

### What It Shows

- Entity name and code
- Total outstanding amount
- Document count
- Last transaction date
- Contact information

### Statement Generation

Generate customer/vendor statements showing:
- Opening balance
- All transactions in period
- Payments received/made
- Closing balance

---

## Export & Print

### Export Options

| Format | Use Case |
|--------|----------|
| **Excel (.xlsx)** | Further analysis, pivot tables |
| **PDF** | Formal reports, attachments |
| **Print** | Physical copies for review |

### Export Steps

1. Run the desired report
2. Click **Export** button
3. Select format (Excel/PDF)
4. Download file

---

## Configuration & Settings

### Default Settings (`Settings > Default Settings`)

Configure default values for reports:

| Setting | Purpose |
|---------|---------|
| **Default Company** | Pre-selects your primary company |
| **Default Currency** | Reporting currency preference |
| **Default Date Range** | How far back to load data |

---

### Field Configuration (`Settings > Field Configuration`)

Customize which columns appear in report listings and their order.

---

### Printable Format Settings (`Settings > Printable Format Settings`)

Configure print templates for reports.

**Edit View Tabs:**
| Tab | Purpose |
|-----|---------|
| **Details** | Template name, header/footer settings |
| **Line** | Line item layout and column configuration |

---

### Release Notes (`Settings > Release Notes`)

View applet version history and feature updates.

---

## Personalization

### Personal Default Settings
Save your preferred filters and report options.

### Favorite Reports
Bookmark frequently used reports for quick access.

---

## FAQ

**Q: What's the difference between "As of Date" and "Report Date"?**
A: "As of Date" determines which invoices are included and how aging is calculated. Setting it to month-end shows the position at that point in time.

**Q: Why do some customers show zero balance but appear in the report?**
A: Check if "Include Zero Balances" filter is enabled. Disable it to show only customers with outstanding amounts.

**Q: Can I see the original invoice details?**
A: Yes, click on any customer/vendor row to drill down and see individual invoice details.

**Q: How is aging calculated?**
A: Aging is calculated from the invoice due date (not invoice date) to the "As of Date" you selected.

**Q: Can I export reports to send to customers?**
A: Yes, use the Export to PDF option to generate professional statements for customers.

**Q: Why do my totals differ from the GL?**
A: Ensure you're using the same "As of Date" and currency. Also verify all documents are posted and finalized.

**Q: Can I customize the aging buckets?**
A: Yes, administrators can configure custom aging periods in Settings.

**Q: How often is the data updated?**
A: Reports run in real-time against current data. Refresh the report to see the latest information.
