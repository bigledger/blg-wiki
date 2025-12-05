---
title: "Cash & Banking"
description: "Evaluate cashbook management, bank reconciliation, and payment processing"
weight: 6
---

## What You'll Learn

In this module, you'll explore how UTM manages its bank accounts. From tracking cash balances to reconciling bank statements to generating payment files - it all happens in **Cash Management**.

{{< callout type="info" >}}
**Time Required:** 15 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.56
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **Cashbook** | A record of all transactions for a specific bank account |
| **Bank Reconciliation** | Matching your records with the bank's records |
| **IBG** | Interbank GIRO - electronic bank transfers |
| **Settlement Method** | How you pay or receive money (cash, cheque, bank transfer) |
| **Cash Transfer** | Moving money between your own bank accounts |
| **Outstanding Items** | Transactions in your books but not yet on bank statement (or vice versa) |

---

## Why This Module Matters

Cash Management is critical because:

- **Know your cash position** - How much money do you have right now?
- **Reconcile with bank** - Make sure your records match the bank's
- **Generate payment files** - Create files for bank uploads
- **Track all movements** - Complete audit trail of every transaction

{{< callout type="info" >}}
**For UTM:** This addresses requirement 9.56 covering cashbook management and internet banking integration.
{{< /callout >}}

---

## Test Scenario 1: View Your Bank Accounts

**Objective:** See all bank accounts and their current balances

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Cashbook → Cashbook List

2. **View** the list of bank accounts

3. **Note** the information displayed:
   | Column | What It Shows |
   |--------|---------------|
   | Account Name | Description of the account |
   | Bank | Financial institution |
   | Account Number | Bank account number |
   | Currency | MYR, USD, etc. |
   | Current Balance | Real-time balance |

4. **Click** on any account to see more details

### What to Notice

- Balances update in real-time as transactions post
- Each account links to a GL account
- You can drill down to see all transactions

{{< callout type="info" >}}
**BigLedger Advantage:** Multi-currency support means you can manage accounts in USD, SGD, or any currency, with automatic exchange rate handling.
{{< /callout >}}

---

## Test Scenario 2: View Cashbook Transactions

**Objective:** See the transaction history for a bank account

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Cashbook → Query Cashbook Transaction

2. **Select** a cashbook (bank account)

3. **Set** a date range (e.g., last month)

4. **Click** Search

### What You'll See

| Column | Description |
|--------|-------------|
| Date | Transaction date |
| Reference | Document number |
| Description | What the transaction was for |
| Debit | Money coming in |
| Credit | Money going out |
| Balance | Running balance |

### Try This

- **Click on any transaction** to see the source document (invoice, payment, etc.)
- **Export to Excel** for further analysis
- **Print** for your records

---

## Test Scenario 3: Transfer Between Bank Accounts

**Objective:** Move money from one account to another

**Time:** 3 minutes

### When You'd Do This

- Replenish petty cash
- Move funds to a different currency account
- Transfer to savings account

### Step-by-Step Instructions

1. **Navigate to:** Finance → Cashbook → Cash Transfer

2. **Create** a new transfer:
   | Field | Example |
   |-------|---------|
   | From Account | Main Operating Account |
   | To Account | Petty Cash |
   | Amount | RM 5,000 |
   | Reference | Petty cash replenishment |

3. **Submit** the transfer

### What Happens

- Both accounts update simultaneously
- Journal entry is created automatically
- Complete audit trail recorded

{{< callout type="warning" >}}
**Note:** Transfers may require approval depending on your organization's policies.
{{< /callout >}}

---

## Test Scenario 4: Bank Reconciliation

**Objective:** Match your records with the bank statement

**Time:** 5 minutes

### Why This Is Important

Even if your records are accurate, they might differ from the bank because:
- Cheques not yet cashed
- Bank fees not yet recorded
- Deposits in transit
- Errors (yours or the bank's)

### Step-by-Step Instructions

1. **Navigate to:** Finance → Bank Reconciliation → New Session

2. **Select** the bank account to reconcile

3. **Enter** the statement details:
   | Field | Example |
   |-------|---------|
   | Statement Date | End of month |
   | Opening Balance | From bank statement |
   | Closing Balance | From bank statement |

4. **Upload** the bank statement (CSV or Excel format)

5. **Run** auto-matching

### What Happens

The system automatically matches transactions based on:
- Amount (exact match)
- Date (within range)
- Reference number

**You'll see:**
| Status | Meaning |
|--------|---------|
| **Matched** | Found in both your records and bank statement |
| **Unmatched (Your Side)** | In your books, not on statement (e.g., outstanding cheque) |
| **Unmatched (Bank Side)** | On statement, not in your books (need to record) |

### Try This

- Click "Match" to manually match items
- Create missing entries directly from the reconciliation screen
- Generate the reconciliation report

{{< callout type="info" >}}
**BigLedger Advantage:** Supports multiple bank statement formats including CSV, Excel, and MT940. Auto-matching rules are configurable.
{{< /callout >}}

---

## Test Scenario 5: Cash Position Report

**Objective:** See your overall cash situation

**Time:** 2 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Cashbook → Reports → Cash Position

2. **Generate** the report

3. **Review** the summary:
   | Information | Description |
   |-------------|-------------|
   | Opening Balance | Start of period |
   | Receipts | Money received |
   | Payments | Money paid out |
   | Closing Balance | Current position |
   | By Currency | Breakdown if multi-currency |

### What to Notice

- All bank accounts are summarized
- Real-time data (as of now)
- Export available for management reports

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Viewed bank accounts | ⬜ |
| 2. Explored cashbook transactions | ⬜ |
| 3. Created a cash transfer | ⬜ |
| 4. Performed bank reconciliation | ⬜ |
| 5. Generated cash position report | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| Feature | What It Does |
|---------|-------------|
| **Multiple Bank Accounts** | Manage all your accounts in one place |
| **Real-Time Balances** | Know your cash position instantly |
| **Auto-Matching** | Reconciliation made faster and easier |
| **Bank File Generation** | Payment files in bank-specific formats |
| **Multi-Currency** | Handle foreign currency accounts |
| **Audit Trail** | Complete record of all cash movements |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| View bank accounts | Finance → Cashbook → Cashbook List |
| Cashbook transactions | Finance → Cashbook → Query Cashbook Transaction |
| Cash transfers | Finance → Cashbook → Cash Transfer |
| Bank reconciliation | Finance → Bank Reconciliation |
| Cash position report | Finance → Cashbook → Reports → Cash Position |
| Payment methods | Finance → Cashbook → Settlement Method |

---

## What's Next?

You've completed the Cash Management evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../asset-management" title="Asset Management" subtitle="Track equipment and property" >}}
  {{< card link="../financial-reporting" title="Financial Reporting" subtitle="Generate financial statements" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

