---
title: "Accounts Receivable (Collections)"
description: "Evaluate debtor management, invoicing, and receipt processing"
weight: 4
---

## What You'll Learn

In this module, you'll explore how UTM collects money from students, organizations, and other parties. From invoicing to receipt processing to collection follow-ups - that's **Accounts Receivable (AR)**.

{{< callout type="info" >}}
**Time Required:** 20 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.16a
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **Accounts Receivable (AR)** | Money owed to you - invoices you've sent that haven't been paid yet |
| **Debtor** | Someone who owes you money (students, organizations, sponsors) |
| **Credit Terms** | How many days the debtor has to pay (e.g., "Net 30" = 30 days) |
| **Aging** | How old unpaid invoices are (current, 30 days, 60 days, etc.) |
| **E-Invoice** | Electronic invoice required by LHDN for tax compliance |
| **Collection** | The process of following up on unpaid invoices |

---

## Why This Module Matters

Accounts Receivable is where UTM:

- **Tracks who owes money** - Students, sponsors, corporate partners
- **Sends invoices** - Bills for tuition, services, rentals, etc.
- **Records payments** - When money comes in
- **Follows up on overdue accounts** - Collection reminders and escalation

{{< callout type="info" >}}
**For UTM:** This addresses requirement 9.16(a) for debtor registration and e-Perolehan integration.
{{< /callout >}}

---

## Test Scenario 1: Register a New Debtor

**Objective:** Add a new customer/debtor to the system

**Time:** 5 minutes

### When You'd Do This

Before you can invoice someone, they need to be registered with their contact details and credit terms.

### Step-by-Step Instructions

1. **Navigate to:** Sales → Customer Maintenance

2. **Click** "New Customer"

3. **Fill in the customer details:**

   | Tab | Information to Enter |
   |-----|---------------------|
   | **Main** | Customer name, Registration no. (if company), TIN |
   | **Contact** | Contact person, phone, email |
   | **Address** | Billing and delivery addresses |
   | **Credit** | Credit limit, payment terms (e.g., 30 days) |

4. **Click "Save"**

### What to Verify

- Customer code is generated automatically
- Duplicate checking prevents double entries
- Credit limit is recorded

{{< callout type="info" >}}
**BigLedger Advantage:** For corporate debtors, the system can validate TIN numbers against LHDN for e-invoice compliance.
{{< /callout >}}

---

## Test Scenario 2: Create a Sales Invoice

**Objective:** Generate an invoice for services or fees

**Time:** 5 minutes

### Step-by-Step Instructions

1. **Navigate to:** Sales → Sales Invoice → New Invoice

2. **Select the customer** from the dropdown

3. **Fill in invoice details:**

   | Field | What to Enter |
   |-------|---------------|
   | Invoice Date | Today's date |
   | Due Date | Automatically calculated from credit terms |
   | Reference | Any internal reference number |

4. **Add line items:**
   | Column | Example |
   |--------|---------|
   | Description | "Training Program Fee" |
   | Quantity | 1 |
   | Unit Price | RM 5,000 |
   | Tax | SST if applicable |

5. **Save and Post** the invoice

### What Happens Next

- Invoice number is generated automatically
- GL entries are created (Debit: AR, Credit: Revenue)
- E-invoice is submitted to LHDN (if configured)
- Customer balance is updated

{{< callout type="info" >}}
**E-Invoice Note:** For invoices above certain thresholds, the system automatically generates and submits e-invoices to LHDN's MyInvois portal.
{{< /callout >}}

---

## Test Scenario 3: Track E-Invoice Status

**Objective:** See how e-invoices are submitted and tracked

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → E-Invoice → Submission Status

2. **View** the list of recent invoices

3. **Check the status:**

   | Status | What It Means |
   |--------|---------------|
   | **Pending** | Waiting to be submitted |
   | **Submitted** | Sent to LHDN, awaiting response |
   | **Validated** | LHDN approved - QR code available |
   | **Rejected** | Error found - needs correction within 72 hours |

### What to Notice

- Each validated invoice has a unique QR code
- You can download the validated e-invoice
- Rejection reasons are clearly displayed

---

## Test Scenario 4: Record a Payment (Receipt)

**Objective:** Record when a customer pays their invoice

**Time:** 5 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Accounts Receivable → Receipts → New Receipt

2. **Select the customer**

3. **Enter payment details:**
   | Field | Example |
   |-------|---------|
   | Payment Amount | RM 5,000 |
   | Payment Method | Bank Transfer |
   | Bank Reference | Transaction reference |
   | Date Received | When the money arrived |

4. **Allocate to invoices:**
   - The system shows outstanding invoices
   - Select which invoice(s) this payment is for
   - For partial payments, enter the amount for each invoice

5. **Save** the receipt

### What Happens

- Customer balance is reduced
- Invoice status changes to "Paid" (or "Partial")
- Bank account balance increases
- GL entries are posted automatically

{{< callout type="info" >}}
**BigLedger Advantage:** The system can auto-allocate payments to the oldest invoices, or you can manually choose which invoices to pay off.
{{< /callout >}}

---

## Test Scenario 5: View Customer Aging

**Objective:** See how much is owed and how old the debts are

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Accounts Receivable → Reports → Aging Analysis

2. **Generate** the report

3. **Review** the aging buckets:

| Age | What It Means | Action Needed |
|-----|---------------|---------------|
| Current | Within payment terms | Normal |
| 30 Days | Slightly overdue | Send reminder |
| 60 Days | Moderately overdue | Follow up call |
| 90+ Days | Seriously overdue | Escalate |

### Try This

- Click on any customer to see their individual invoices
- Export to Excel for analysis
- Use this report for collection priority

---

## Test Scenario 6: Generate Customer Statement

**Objective:** Create a statement of account for a customer

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Accounts Receivable → Statements

2. **Select** one or more customers

3. **Choose options:**
   | Option | Description |
   |--------|-------------|
   | Period | Date range to include |
   | Format | Summary or Detailed |
   | Delivery | Print, Email, or Download |

4. **Generate** the statement

### What's on the Statement

- Opening balance
- All invoices in the period
- Payments received
- Closing balance owed
- Aging summary

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Registered a new customer | ⬜ |
| 2. Created a sales invoice | ⬜ |
| 3. Tracked e-invoice status | ⬜ |
| 4. Recorded a payment receipt | ⬜ |
| 5. Reviewed customer aging | ⬜ |
| 6. Generated customer statement | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| Feature | What It Does |
|---------|-------------|
| **Customer Master** | Complete debtor information management |
| **Invoicing** | Multiple invoice types with automatic numbering |
| **E-Invoice** | Automatic LHDN submission and QR codes |
| **Receipt Processing** | Multiple payment methods, auto-allocation |
| **Aging Analysis** | Clear view of overdue accounts |
| **Collections** | Automated reminders and follow-up tracking |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| Manage customers | Sales → Customer Maintenance |
| Create invoices | Sales → Sales Invoice |
| E-invoice status | Finance → E-Invoice → Submission Status |
| Record receipts | Finance → Accounts Receivable → Receipts |
| Customer aging | Finance → Accounts Receivable → Reports → Aging |
| Statements | Finance → Accounts Receivable → Statements |

---

## What's Next?

You've completed the Accounts Receivable evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../journal-module" title="Journal Module" subtitle="Learn about adjustments and corrections" >}}
  {{< card link="../cash-management" title="Cash Management" subtitle="Explore banking and reconciliation" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

