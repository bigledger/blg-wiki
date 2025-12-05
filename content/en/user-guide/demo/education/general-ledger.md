---
title: "General Ledger & Chart of Accounts"
description: "Evaluate the core accounting structure - the foundation of the financial system"
weight: 1
---

## What You'll Learn

In this module, you'll explore the **General Ledger (GL)** and **Chart of Accounts (COA)** - the foundation of any accounting system. By the end, you'll understand how BigLedger organizes financial data to meet SAGA requirements.

{{< callout type="info" >}}
**Time Required:** 15-20 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.18, 9.19
{{< /callout >}}

---

## Before You Begin: Key Terms Explained
<img width="3462" height="2620" alt="image" src="https://github.com/user-attachments/assets/a5262283-4ee0-4e0d-b2ae-648a0572bbde" />

| Term | What It Means |
|------|---------------|
| **General Ledger (GL)** | The master record of all financial transactions - like a comprehensive financial diary |
| **Chart of Accounts (COA)** | A list of all account categories, organized like folders for different types of money |
| **GL Code** | A unique number for each account (e.g., 4001 for "Tuition Fees Income") |
| **SAGA** | Standard Accounting System for Government Agencies - the rules UTM must follow |
| **Period** | An accounting month (Period 1 = January, Period 12 = December) |
| **Month 13** | A special adjustment period at year-end for auditor corrections |

---

## Why This Module Matters

The General Ledger is like the **foundation of a building** - everything else depends on it:

- All financial reports pull data from here
- Budget tracking connects to GL accounts
- Every payment and receipt flows through the GL
- Auditors review this first

{{< callout type="info" >}}
**For UTM:** Your existing account codes (Hasil, Belanja, Aset, Liabiliti, Ekuiti) are fully supported. No need to change your account structure.
{{< /callout >}}

---

## Test Scenario 1: View the Chart of Accounts

**Objective:** See how accounts are organized in BigLedger

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Login** to the demo system at [demo-v1.bigledger.com](https://demo-v1.bigledger.com)

2. **Look at the left menu** and click on **Finance**

3. **Click on** "Chart of Accounts"

4. **You should see** a list of accounts organized in a tree structure

### What to Look For

You'll see five main account types (this matches UTM's structure):

| Account Type | Malay Name | Example |
|-------------|------------|---------|
| **Revenue** | Hasil | Tuition fees, grants received |
| **Expenses** | Belanja | Salaries, utilities, supplies |
| **Assets** | Aset | Cash, equipment, buildings |
| **Liabilities** | Liabiliti | Loans, amounts owed to suppliers |
| **Equity** | Ekuiti | University funds, accumulated surplus |

### Try This

- **Click the arrow** next to any account type to expand it
- **Use the search box** to find a specific account (try typing "cash")
- **Notice the GL codes** - each account has a unique number

{{< callout type="info" >}}
**BigLedger Advantage:** The hierarchical view lets you see summary totals at any level - from grand totals down to individual accounts.
{{< /callout >}}

---

## Test Scenario 2: Create a New Account

**Objective:** See how easy it is to add new accounts when needed

**Time:** 5 minutes

### Why You'd Do This

Universities often need new accounts for:
- New programs or courses
- Special grants or projects
- New expense categories

### Step-by-Step Instructions

1. **Navigate to:** Finance → Chart of Accounts

2. **Click** the "+ New" or "Add Account" button

3. **Fill in these details:**
   | Field | What to Enter |
   |-------|---------------|
   | GL Code | 5099 |
   | Account Name | Training Expenses (Perbelanjaan Latihan) |
   | Account Type | Select "Expense" |
   | Category | Operating Expenses |
   | Status | Active |

4. **Click "Save"**

### What Should Happen

- The system checks if the code already exists (no duplicates allowed)
- The new account appears in the list under Expenses
- An audit trail records who created it and when

{{< callout type="warning" >}}
**Demo Note:** In the demo environment, you can create accounts freely. In production, this would typically require Finance Manager approval.
{{< /callout >}}

---

## Test Scenario 3: View Account Details and Mappings

**Objective:** Understand how accounts connect to financial statements

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Chart of Accounts

2. **Click on any account** (e.g., search for "Cash" and click on it)

3. **View the details panel** that appears

### What to Look For

| Section | What It Shows |
|---------|---------------|
| **Basic Info** | Account code, name, type, status |
| **Balance Sheet Mapping** | Where this appears on the Balance Sheet |
| **Income Statement Mapping** | Where this appears on the P&L (if applicable) |
| **Cash Flow Mapping** | Operating, Investing, or Financing category |
| **Budget Link** | Connected Vote Book codes |

### Why This Matters

{{< callout type="info" >}}
**SAGA Requirement:** Financial statements must follow MPSAS format. These mappings ensure your reports are automatically compliant.
{{< /callout >}}

---

## Test Scenario 4: Check Period Management

**Objective:** See how BigLedger handles accounting periods (months)

**Time:** 3 minutes

### Background

Government agencies follow a fiscal year (January - December for most). The system needs to:
- Control which periods are open for transactions
- Close periods when the month is finalized
- Support "Month 13" for year-end adjustments

### Step-by-Step Instructions

1. **Navigate to:** Finance → Period Management

2. **View the period list** showing all 12 months (plus Month 13)

3. **Look at the Status column:**
   | Status | What It Means |
   |--------|---------------|
   | **Open** | Transactions can be posted |
   | **Closed** | No changes allowed (month is finalized) |
   | **Future** | Not yet available |

### What You Can Test

- Try to see which periods are currently open
- Note the "Month 13" period for year-end adjustments

{{< callout type="info" >}}
**UTM Requirement (9.19):** The system must support year-end closing with automatic carry-forward of balances to the new year. BigLedger handles this automatically.
{{< /callout >}}

---

## Test Scenario 5: View Ledger Transactions

**Objective:** See how transactions are recorded in the General Ledger

**Time:** 5 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Ledger and Journal → Ledger

2. **Select an account** from the dropdown (e.g., "Cash at Bank")

3. **Set a date range** (e.g., current month)

4. **Click "Search"** or "View"

### What to Look For

| Column | What It Shows |
|--------|---------------|
| Date | When the transaction occurred |
| Reference | Document number (invoice, payment, etc.) |
| Description | What the transaction was for |
| Debit | Money coming in (for asset accounts) |
| Credit | Money going out (for asset accounts) |
| Balance | Running total |

### Try This

- **Click on any transaction** to see more details
- **Drill down** to the original document (invoice, payment, etc.)

{{< callout type="info" >}}
**BigLedger Advantage:** Every transaction links back to its source document. Auditors can trace any number in seconds.
{{< /callout >}}

---

## Test Scenario 6: Multi-Dimensional Tracking

**Objective:** See how BigLedger tracks costs by department, project, and more

**Time:** 3 minutes

### Why This Matters

UTM needs to track spending by:
- **Campus** (JB main, KL branch)
- **Faculty/Department** (PTJ)
- **Project** (research grants, construction)
- **Budget category** (operating, capital)

### Step-by-Step Instructions

1. **Navigate to:** Finance → Ledger and Journal → Journal Transaction

2. **Click "New"** to start a new journal entry

3. **Look at the line item fields** - notice the dimension dropdowns:
   | Dimension | Purpose |
   |-----------|---------|
   | Segment | Campus or division |
   | Profit Center | Faculty/Department (PTJ) |
   | Project | Specific project code |
   | Category | Budget category |

{{< callout type="info" >}}
**SAGA Compliance:** These dimensions map to UTM's chargeable combination codes (Tajuk, Pusat Kos, Aktiviti, Akaun, SODOG) for full government reporting compliance.
{{< /callout >}}

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Viewed Chart of Accounts structure | ⬜ |
| 2. Created a new GL account | ⬜ |
| 3. Viewed account details and mappings | ⬜ |
| 4. Checked period management | ⬜ |
| 5. Viewed ledger transactions | ⬜ |
| 6. Explored multi-dimensional tracking | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| Requirement | How BigLedger Meets It |
|-------------|----------------------|
| **9.18 Chart of Accounts** | Full hierarchical structure with UTM's 5 account types |
| **9.19 Period Management** | 12 months + Month 13, with controlled opening/closing |
| **SAGA Compliance** | Pre-built mappings for government financial statements |
| **Audit Trail** | Every action logged with user and timestamp |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| View all accounts | Finance → Chart of Accounts |
| Create new account | Finance → Chart of Accounts → New |
| View ledger transactions | Finance → Ledger and Journal → Ledger |
| Manage periods | Finance → Period Management |
| Run GL reports | Finance → Financial Reports → General Ledger |

---

## What's Next?

You've completed the General Ledger evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../budget-management" title="Budget & Vote Book" subtitle="Learn how budget control prevents overspending" >}}
  {{< card link="../journal-module" title="Journal Entries" subtitle="See how adjustments and corrections are made" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

