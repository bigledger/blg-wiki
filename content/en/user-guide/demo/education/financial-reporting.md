---
title: "Financial Reports"
description: "Evaluate financial statement generation and compliance reports"
weight: 8
---

## What You'll Learn

In this module, you'll explore how BigLedger generates financial reports - from daily cash reports to full year-end financial statements. You'll see how reports are formatted for SAGA compliance and how easily they can be exported.

{{< callout type="info" >}}
**Time Required:** 15 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.20
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **Balance Sheet** | A snapshot of what you own (assets) and owe (liabilities) at a point in time |
| **Income Statement** | Revenue minus expenses = surplus or deficit for a period |
| **Cash Flow Statement** | Where cash came from and where it went |
| **SAGA** | Standard Accounting System for Government Agencies - government format requirements |
| **MPSAS** | Malaysian Public Sector Accounting Standards |
| **Drill-Down** | Clicking on a total to see the details behind it |

---

## Why This Module Matters

Financial Reporting is essential because:

- **Statutory compliance** - Government agencies must submit specific reports
- **Decision making** - Management needs accurate financial information
- **Audit support** - Auditors review these statements
- **Transparency** - Stakeholders need to see how money is used

{{< callout type="info" >}}
**For UTM:** This addresses requirement 9.20 for generating the full set of financial statements and SAGA-compliant reports.
{{< /callout >}}

---

## Test Scenario 1: Generate Balance Sheet

**Objective:** Produce the Statement of Financial Position (Penyata Kedudukan Kewangan)

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Financial Reports → Financial Statements

2. **Select:** Balance Sheet (or Penyata Kedudukan Kewangan)

3. **Set parameters:**
   | Field | Example |
   |-------|---------|
   | As of Date | End of current month |
   | Comparison | Previous year |
   | Format | SAGA Format |

4. **Generate** the report

### What You'll See

| Section | Contents |
|---------|----------|
| **Assets (Aset)** | Cash, receivables, equipment, buildings |
| **Liabilities (Liabiliti)** | Payables, loans, obligations |
| **Equity (Ekuiti)** | Accumulated funds, reserves |

**Key Check:** Assets = Liabilities + Equity (must always balance!)

### Try This

- Click on any line item to drill down to the underlying accounts
- Export to Excel or PDF
- Compare with previous period

{{< callout type="info" >}}
**BigLedger Advantage:** Reports are generated in seconds, not hours. Real-time data means you always see current figures.
{{< /callout >}}

---

## Test Scenario 2: Generate Income Statement

**Objective:** Produce the Statement of Comprehensive Income (Penyata Pendapatan Komprehensif)

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Financial Reports → Financial Statements

2. **Select:** Income Statement

3. **Set parameters:**
   | Field | Example |
   |-------|---------|
   | Period | Year to Date |
   | Comparison | Previous Year |
   | Detail Level | Summary or Detailed |

4. **Generate** the report

### What You'll See

| Section | Contents |
|---------|----------|
| **Revenue (Hasil)** | Grants, fees, other income |
| **Expenses (Belanja)** | Salaries, utilities, supplies |
| **Surplus/Deficit** | Revenue minus Expenses |

### Try This

- View by month to see trends
- Filter by department (PTJ)
- Look at percentage changes from prior year

---

## Test Scenario 3: Cash Flow Statement

**Objective:** Produce the Statement of Cash Flows (Penyata Aliran Tunai)

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Financial Reports → Financial Statements

2. **Select:** Cash Flow Statement

3. **Generate** the report

### What You'll See

The cash flow is divided into three activities:

| Activity | What It Includes |
|----------|-----------------|
| **Operating** | Day-to-day cash from operations |
| **Investing** | Buying/selling assets |
| **Financing** | Loans, grants, capital movements |

**Key Check:** Opening Cash + Net Cash Flow = Closing Cash

{{< callout type="info" >}}
**UTM Requirement (9.20b-iv):** The system must generate cash flow statements showing operating, investing, and financing activities.
{{< /callout >}}

---

## Test Scenario 4: Trial Balance

**Objective:** See all account balances at a glance

**Time:** 2 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Financial Reports → Trial Balance

2. **Set parameters:**
   | Field | Example |
   |-------|---------|
   | As of Date | End of month |
   | Level | Summary or Detailed |

3. **Generate** the report

### What You'll See

| Account | Debit | Credit |
|---------|-------|--------|
| Cash at Bank | RM 500,000 | |
| Accounts Receivable | RM 150,000 | |
| Revenue | | RM 1,000,000 |
| ... | ... | ... |
| **Total** | RM 2,500,000 | RM 2,500,000 |

**Key Check:** Total Debits must equal Total Credits

### Why This Matters

The trial balance is used to verify that your books are in balance before generating financial statements. If it doesn't balance, there's an error somewhere.

---

## Test Scenario 5: Budget vs Actual Report

**Objective:** Compare planned budget with actual spending

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Budget → Reports

2. **Select:** Budget vs Actual

3. **Set parameters:**
   | Field | Example |
   |-------|---------|
   | Period | Current Year |
   | PTJ | All or specific |
   | Detail | Summary or Line Item |

4. **Generate** the report

### What You'll See

| Item | Budget | Actual | Variance | % |
|------|--------|--------|----------|---|
| Travel | RM 50,000 | RM 35,000 | RM 15,000 | 30% under |
| Training | RM 30,000 | RM 45,000 | (RM 15,000) | 50% over |

### Try This

- Look for significant variances
- Drill down to see transactions
- Export for management presentation

---

## Test Scenario 6: Export and Print Reports

**Objective:** Get reports out of the system

**Time:** 2 minutes

### Step-by-Step Instructions

1. **Generate** any report from above

2. **Click** the Export button

3. **Choose format:**
   | Format | Best For |
   |--------|----------|
| Excel | Further analysis, manipulation |
   | PDF | Distribution, printing |
   | Print | Physical copies |

4. **Download** or print

### What to Notice

- Excel exports maintain formulas for drill-down
- PDFs are properly formatted for presentation
- Headers and footers include report details

{{< callout type="info" >}}
**BigLedger Advantage:** Reports can be scheduled to generate automatically and email to recipients.
{{< /callout >}}

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Generated Balance Sheet | ⬜ |
| 2. Generated Income Statement | ⬜ |
| 3. Generated Cash Flow Statement | ⬜ |
| 4. Viewed Trial Balance | ⬜ |
| 5. Ran Budget vs Actual report | ⬜ |
| 6. Exported a report | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| Feature | What It Does |
|---------|-------------|
| **Full Set of Statements** | Balance Sheet, Income Statement, Cash Flow, Changes in Equity |
| **SAGA Compliance** | Reports formatted per government requirements |
| **Real-Time Data** | Always current - no waiting for month-end close |
| **Drill-Down** | Click any number to see details |
| **Export Options** | Excel, PDF, print |
| **Comparison** | Prior period, budget, other PTJ |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| Financial statements | Finance → Financial Reports → Financial Statements |
| Trial balance | Finance → Financial Reports → Trial Balance |
| General ledger | Finance → Financial Reports → General Ledger |
| Budget reports | Finance → Budget → Reports |
| Dashboard | Finance → Dashboard |

---

## What's Next?

You've completed the Financial Reporting evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../user-access-control" title="Security & Access" subtitle="See user permissions and audit trails" >}}
  {{< card link="../tax-management" title="Tax Management" subtitle="Explore tax configuration" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

