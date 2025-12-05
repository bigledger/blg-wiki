---
title: "Journal Entries"
description: "Evaluate auto-generated and manual journal entries"
weight: 5
---

## What You'll Learn

In this module, you'll explore **journal entries** - the behind-the-scenes records that track every financial transaction. You'll see how most entries happen automatically, and how to make manual adjustments when needed.

{{< callout type="info" >}}
**Time Required:** 15 minutes | **Skill Level:** Intermediate | **UTM Requirements:** 9.21, 9.22
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **Journal Entry** | A record of a financial transaction showing debits and credits |
| **Debit** | Left side of an entry - increases assets/expenses, decreases liabilities/income |
| **Credit** | Right side of an entry - decreases assets/expenses, increases liabilities/income |
| **Auto Journal** | Entry created automatically when you post an invoice, payment, etc. |
| **Manual Journal** | Entry created by hand for adjustments, corrections, accruals |
| **Month 13** | Special period for year-end adjustments (auditor corrections) |

### Understanding Debits and Credits (The Simple Version)

| Transaction Type | What Gets Debited | What Gets Credited |
|------------------|-------------------|-------------------|
| Customer pays you | Bank (goes up) | Accounts Receivable (goes down) |
| You pay supplier | Accounts Payable (goes down) | Bank (goes down) |
| Record expense | Expense account | Bank or AP |
| Record income | Bank or AR | Income account |

---

## Why This Module Matters

Journals are the **core accounting record** - they:

- Create an **audit trail** of every transaction
- Ensure books **balance** (debits = credits)
- Allow **corrections** without deleting original entries
- Support **month-end and year-end** processes

{{< callout type="info" >}}
**For UTM:** This addresses requirement 9.21 (Auto Journal) and 9.22 (Manual Journal) from the tender.
{{< /callout >}}

---

## Test Scenario 1: View Auto-Generated Journals

**Objective:** See how journals are created automatically from transactions

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Ledger and Journal → Journal Transaction

2. **Search** for recent journals (leave filters blank, click Search)

3. **Click** on any journal entry to view details

### What to Look For

When you view an auto-generated journal (e.g., from a sales invoice):

| Line | Account | Debit | Credit |
|------|---------|-------|--------|
| 1 | Accounts Receivable | RM 5,300 | |
| 2 | Revenue | | RM 5,000 |
| 3 | SST Payable | | RM 300 |

Notice:
- **Total Debits = Total Credits** (the entry is "balanced")
- **Source Document** link takes you back to the original invoice
- **Auto-Created** badge shows it wasn't manual

{{< callout type="info" >}}
**BigLedger Advantage:** Every transaction creates a journal automatically. No manual posting required for routine transactions.
{{< /callout >}}

---

## Test Scenario 2: Create a Manual Journal Entry

**Objective:** Make a manual adjustment entry

**Time:** 5 minutes

### When You'd Do This

- Month-end accruals (expenses incurred but not yet invoiced)
- Corrections to previously posted entries
- Cost allocations between departments
- Year-end adjustments (Month 13)

### Step-by-Step Instructions

1. **Navigate to:** Finance → Ledger and Journal → Journal Transaction → New

2. **Fill in the header:**
   | Field | Example |
   |-------|---------|
   | Reference | ADJ-2025-001 |
   | Description | Monthly rental accrual |
   | Period | Current month |

3. **Add journal lines:**
   | Account | Description | Debit | Credit |
   |---------|-------------|-------|--------|
   | 5100 (Rental Expense) | Dec rental accrual | RM 10,000 | |
   | 2300 (Accrued Expenses) | Dec rental accrual | | RM 10,000 |

4. **Verify**: The totals must balance (Debit = Credit)

5. **Save and Post**

### What to Notice

- System validates that debits equal credits
- You can add as many lines as needed
- Approval workflow may be required
- Audit trail records who created it and when

{{< callout type="warning" >}}
**Tip:** If your journal doesn't balance, the system won't let you post it. Check your amounts!
{{< /callout >}}

---

## Test Scenario 3: Month 13 (Year-End) Journals

**Objective:** Understand how year-end adjustments work

**Time:** 3 minutes

### What is Month 13?

Government accounting allows a special **Period 13** after the fiscal year ends for:
- Auditor adjustments
- Corrections discovered after year-end
- Reclassifications

### Step-by-Step Instructions

1. **Navigate to:** Finance → Ledger and Journal → Journal Transaction → New

2. **In the Period dropdown**, look for Period 13 (Year-End)

3. **Observe** that Period 13 is available but may require special permission

### What to Verify

- Period 13 exists in the system
- Only authorized users can post to it
- Period 13 entries affect the previous year's financial statements

{{< callout type="info" >}}
**UTM Requirement (9.22a):** The system must support Jernal Bulan 13 for annual account closure adjustments.
{{< /callout >}}

---

## Test Scenario 4: Reverse a Journal Entry

**Objective:** See how to correct a posted journal

**Time:** 3 minutes

### Why Reverse Instead of Delete?

In accounting, you **never delete** transactions because:
- Audit trail must be complete
- Regulators require full history
- Errors should be visible and corrected, not hidden

### Step-by-Step Instructions

1. **Navigate to:** Finance → Ledger and Journal → Journal Transaction

2. **Find** the journal you want to reverse

3. **Click** "Void (Reverse)"

4. **Confirm** the reversal

### What Happens

- Original journal stays in the system (marked as "Reversed")
- New journal is created with opposite entries
- Net effect on balances is zero
- Audit trail shows both transactions

---

## Test Scenario 5: Import Journals from Excel

**Objective:** See how to bulk-load journals

**Time:** 3 minutes

### When You'd Do This

- Importing data from another system (e.g., payroll)
- Bulk adjustments at month-end
- Migration of historical data

### Step-by-Step Instructions

1. **Navigate to:** Finance → Ledger and Journal → Import Journal

2. **Download** the template

3. **Review** the template structure:
   | Column | Description |
   |--------|-------------|
   | COMPANY_CODE | Company identifier |
   | REFERENCE | Journal reference |
   | GL_CODE | Account code |
   | DEBIT | Debit amount |
   | CREDIT | Credit amount |
   | DESCRIPTION | Line description |

4. **Observe** the import process:
   - Upload your filled template
   - System validates all rows
   - Valid rows are posted
   - Error report shows any issues

{{< callout type="info" >}}
**BigLedger Advantage:** The import validates account codes and ensures each journal balances before posting.
{{< /callout >}}

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Viewed auto-generated journals | ⬜ |
| 2. Created a manual journal entry | ⬜ |
| 3. Explored Month 13 journals | ⬜ |
| 4. Saw how to reverse a journal | ⬜ |
| 5. Reviewed journal import process | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| UTM Requirement | How BigLedger Meets It |
|-----------------|----------------------|
| **9.21** Auto Journal | Automatic entries from all modules (AR, AP, etc.) |
| **9.21b** External Integration | Import from HR, payroll, research systems |
| **9.22** Manual Journal | Flexible entry for adjustments and corrections |
| **9.22a** Period 13 | Year-end adjustment period supported |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| View all journals | Finance → Ledger and Journal → Journal Transaction |
| Create manual journal | Finance → Ledger and Journal → Journal Transaction → New |
| Import journals | Finance → Ledger and Journal → Import Journal |
| View ledger | Finance → Ledger and Journal → Ledger |

---

## What's Next?

You've completed the Journal Module evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../cash-management" title="Cash Management" subtitle="Explore banking and reconciliation" >}}
  {{< card link="../financial-reporting" title="Financial Reporting" subtitle="See how reports are generated" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

