---
title: "Accounts Payable (Payments)"
description: "Evaluate supplier management, invoice processing, and payment workflows"
weight: 3
---

## What You'll Learn

In this module, you'll explore how UTM pays its suppliers. From registering vendors to processing invoices to generating payment files for the bank - everything happens in **Accounts Payable (AP)**.

{{< callout type="info" >}}
**Time Required:** 20 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.16b
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **Accounts Payable (AP)** | Money you owe to suppliers - bills you need to pay |
| **Creditor** | Another word for supplier - someone you owe money to |
| **Purchase Order (PO)** | Official request to buy something |
| **GRN (Goods Received Note)** | Confirmation that items were received |
| **Three-Way Matching** | Verifying PO + GRN + Invoice all match before paying |
| **e-Perolehan** | Government e-procurement system |
| **IBG/GIRO** | Interbank transfer methods for payments |

---

## Why This Module Matters

Accounts Payable is where UTM:

- **Manages all suppliers** - Keep track of who you buy from
- **Processes invoices** - Record what you owe
- **Controls payments** - Ensure you only pay for what you ordered and received
- **Generates bank files** - Create payment files for bank processing

{{< callout type="info" >}}
**For UTM:** This addresses requirement 9.16(b) for creditor registration and integration with e-Perolehan.
{{< /callout >}}

---

## Test Scenario 1: Register a New Supplier

**Objective:** Add a new supplier to the system

**Time:** 5 minutes

### When You'd Do This

Before you can pay a supplier, they need to be registered in the system with their bank details, tax number, and other information.

### Step-by-Step Instructions

1. **Navigate to:** Purchasing → Supplier Maintenance

2. **Click** "New Supplier"

3. **Fill in the supplier details:**

   | Tab | Information to Enter |
   |-----|---------------------|
   | **Main** | Company name, Registration no., TIN |
   | **Contact** | Contact person name, phone, email |
   | **Address** | Business address |
   | **Bank** | Bank name, account number |
   | **Terms** | Payment terms (30 days, 60 days, etc.) |

4. **Click "Save"**

### What to Verify

- The system checks for duplicate registrations
- A unique supplier code is generated automatically
- All required fields are marked clearly

{{< callout type="info" >}}
**BigLedger Advantage:** Supplier records can be synced with e-Perolehan, so registered government suppliers are pre-loaded.
{{< /callout >}}

---

## Test Scenario 2: View Supplier Details

**Objective:** See all information about a supplier

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Purchasing → Supplier Maintenance

2. **Search** for a supplier (try typing part of a name)

3. **Click** on the supplier to open their profile

4. **Explore the tabs:**
   - Main information
   - Contact persons
   - Multiple addresses
   - Bank accounts
   - Payment terms
   - Transaction history

### What to Notice

- You can see all past transactions with this supplier
- Outstanding invoices are visible
- Payment history shows when they were paid

---

## Test Scenario 3: Process a Purchase Invoice

**Objective:** Record a supplier invoice and understand three-way matching

**Time:** 7 minutes

### The Three-Way Match Concept

Before paying a supplier, the system checks:

1. **Purchase Order** - Did we actually order this?
2. **GRN** - Did we receive it?
3. **Invoice** - Does the amount match what we ordered and received?

### Step-by-Step Instructions

1. **Navigate to:** Purchasing → Purchase Invoice → New Invoice

2. **Select the supplier** from the dropdown

3. **Link to PO/GRN:**
   - Select the Purchase Order reference
   - The system auto-fills items from the PO
   - GRN information is validated

4. **Enter invoice details:**
   | Field | Description |
   |-------|-------------|
   | Supplier Invoice No. | The invoice number from the supplier |
   | Invoice Date | Date on the supplier's invoice |
   | Due Date | When payment is due |
   | Items | Pre-filled from PO, verify against invoice |

5. **Submit for approval**

### What to Notice

| Check | System Behavior |
|-------|-----------------|
| Quantity matches | Green checkmark |
| Quantity differs | Warning message |
| Price differs | Requires explanation |
| No PO exists | Can flag for review |

{{< callout type="warning" >}}
**Demo Note:** The system may require approval for invoices that don't perfectly match the PO/GRN.
{{< /callout >}}

---

## Test Scenario 4: Budget Check During Invoice Processing

**Objective:** See how the budget is validated when recording invoices

**Time:** 3 minutes

### What Happens

When you process an invoice, the system automatically:
1. Checks available budget
2. Shows current allocation and spending
3. Warns if approaching limit
4. Blocks if over budget

### Try This

During invoice processing, look for the **budget panel** that shows:

| Information | What It Means |
|-------------|---------------|
| Allocation | Total budget for this category |
| Committed | Reserved by outstanding POs |
| Spent | Already paid invoices |
| Available | What remains for new spending |

---

## Test Scenario 5: Process Payments

**Objective:** See how payments are generated

**Time:** 5 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Accounts Payable → Payment Processing

2. **View** the list of approved invoices due for payment

3. **Select** invoices to pay (checkboxes)

4. **Choose payment method:**
   | Method | Use Case |
   |--------|----------|
   | Bank Transfer (IBG) | Most common for suppliers |
   | Cheque | When required by supplier |
   | Online Banking | Direct bank integration |

5. **Generate** the payment batch

### What to Verify

- Payment file is generated in bank format
- Download is available for upload to bank
- Payment status is tracked
- Supplier balances update after payment

{{< callout type="info" >}}
**BigLedger Advantage:** Supports multiple Malaysian banks including CIMB, Maybank, Public Bank, and others. Files are generated in each bank's required format.
{{< /callout >}}

---

## Test Scenario 6: View Supplier Aging

**Objective:** See how much is owed to suppliers and for how long

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Accounts Payable → Reports → Aging Analysis

2. **Generate** the aging report

3. **Review** the aging buckets:
   | Bucket | Meaning |
   |--------|---------|
   | Current | Due within normal terms |
   | 30 Days | 1-30 days overdue |
   | 60 Days | 31-60 days overdue |
   | 90+ Days | Seriously overdue |

### Try This

- Click on any supplier to see their individual invoices
- Export to Excel for further analysis
- Look for patterns in late payments

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Registered a new supplier | ⬜ |
| 2. Viewed supplier details | ⬜ |
| 3. Processed a purchase invoice | ⬜ |
| 4. Observed budget checking | ⬜ |
| 5. Generated a payment batch | ⬜ |
| 6. Reviewed supplier aging | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| Feature | What It Does |
|---------|-------------|
| **Supplier Master** | Complete vendor information management |
| **e-Perolehan Ready** | API integration with government procurement |
| **Three-Way Matching** | Prevents paying for unordered/unreceived items |
| **Budget Validation** | Stops over-budget spending |
| **Bank File Generation** | Automated payment processing |
| **E-Invoice Compliance** | Self-billed invoices for LHDN |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| Manage suppliers | Purchasing → Supplier Maintenance |
| Process invoices | Purchasing → Purchase Invoice |
| Process payments | Finance → Accounts Payable → Payment Processing |
| Supplier aging | Finance → Accounts Payable → Reports → Aging |
| E-invoice (self-billed) | Finance → E-Invoice → Self-Billed |

---

## What's Next?

You've completed the Accounts Payable evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../accounts-receivable" title="Accounts Receivable" subtitle="Learn how collections work" >}}
  {{< card link="../cash-management" title="Cash Management" subtitle="Explore banking and reconciliation" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

