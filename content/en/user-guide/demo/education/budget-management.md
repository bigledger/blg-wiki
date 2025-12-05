---
title: "Budget & Vote Book Management"
description: "Evaluate budget allocation, monitoring, and the Vote Book (Buku Vot) system"
weight: 2
---

## What You'll Learn

In this module, you'll explore the **Budget and Vote Book (Buku Vot)** system - the heart of government financial control. You'll see how BigLedger prevents overspending and gives you real-time visibility into budget utilization.

{{< callout type="info" >}}
**Time Required:** 20-25 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.23-9.55
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **Vote Book (Buku Vot)** | The official budget record that tracks all allocations and spending for a department |
| **PTJ (Pusat Tanggungjawab)** | Responsibility Center - a department or unit with its own budget |
| **Budget Allocation** | The amount of money assigned to a specific purpose |
| **Commitment** | Money set aside for approved purchases (like a Purchase Order) that hasn't been paid yet |
| **Virement** | Moving budget from one category to another (requires approval) |
| **Available Balance** | Allocation minus commitments minus actual spending = what you can still spend |

---

## Why This Module Matters

The Vote Book is **critical for government agencies** because:

- **Prevents overspending** - The system blocks transactions that exceed your budget
- **Real-time tracking** - Know exactly how much budget remains at any moment
- **Audit compliance** - Complete record of all budget movements
- **Better planning** - Historical data helps plan future budgets

{{< callout type="info" >}}
**For UTM:** This directly addresses requirements 9.23-9.55 of the tender, covering all Vote Book operations from viewing to transfers.
{{< /callout >}}

---

## Test Scenario 1: View Your Vote Book

**Objective:** See the Vote Book display and understand the budget status

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Login** to the demo system

2. **Navigate to:** Finance → Budget → Vote Book Exposure

3. **Select a PTJ** (department) from the dropdown

4. **View the Vote Book display**

### What You'll See

The Vote Book shows your budget at a glance:

| Column | What It Means |
|--------|---------------|
| **Budget Item** | What the money is for (e.g., "Travel", "Supplies") |
| **Allocation** | Total approved budget for this item |
| **Commitment** | Money reserved for approved POs (not yet paid) |
| **Expenditure** | Money already spent |
| **Available** | What you can still spend (Allocation - Commitment - Expenditure) |

### Try This

- Look for **color indicators**: Green = healthy, Yellow = caution, Red = near/over limit
- Click on any line to see detailed transactions
- Try changing the period (month/quarter/year)

{{< callout type="info" >}}
**BigLedger Advantage:** The Vote Book updates in real-time. The moment a PO is approved or payment is made, balances change instantly.
{{< /callout >}}

---

## Test Scenario 2: Create a Budget (for Finance Staff)

**Objective:** See how finance staff can set up budgets without IT help

**Time:** 5 minutes

### Why This Matters

UTM Requirement 9.24 specifies that **financial staff** (not IT) should be able to maintain the Vote Book. No programming or technical skills needed.

### Step-by-Step Instructions

1. **Navigate to:** Finance → Budget → Vote Book Organizer

2. **Click** "New Vote Book" or select an existing one

3. **Fill in the basics:**
   | Field | Example |
   |-------|---------|
   | Year | 2025 |
   | PTJ | Faculty of Engineering |
   | Description | Operating Budget 2025 |

4. **Add budget line items:**
   - Click "Add Item"
   - Select expense category
   - Enter allocation amount

5. **Save** the Vote Book

### What to Notice

- Forms use plain language (no codes required)
- Help text explains each field
- Dropdown menus for standard categories
- Error messages are clear and helpful

{{< callout type="warning" >}}
**Demo Note:** In production, new Vote Books typically require approval. The demo may skip this step.
{{< /callout >}}

---

## Test Scenario 3: Budget Blocking (The Most Important Feature!)

**Objective:** See how the system prevents overspending

**Time:** 5 minutes

### Why This Is Critical

This is the **core purpose** of the Vote Book - stopping transactions that would exceed the budget.

### Step-by-Step Instructions

1. **First, check available budget:**
   - Go to Finance → Budget → Vote Book Exposure
   - Note the "Available" amount for any budget item

2. **Try to exceed it:**
   - Go to Purchasing → Purchase Order → New
   - Create a PO for an amount **larger** than available budget
   - Try to submit it

3. **Observe the system response**

### What Should Happen

The system should:
1. **Show a warning** when you're close to the limit
2. **Block submission** when you exceed the budget
3. **Display a clear message** explaining why
4. **Offer options**: Request exception, modify amount, or cancel

{{< callout type="info" >}}
**BigLedger Advantage:** Budget checking happens at the exact moment of transaction, not at month-end when it's too late.
{{< /callout >}}

---

## Test Scenario 4: Budget Virement (Transfer)

**Objective:** See how to move budget from one item to another

**Time:** 5 minutes

### When You'd Use This

Imagine you budgeted RM10,000 for travel but only spent RM3,000. Meanwhile, you need more money for training. A virement lets you move the unused travel budget to training.

### Step-by-Step Instructions

1. **Navigate to:** Finance → Budget → Budget Virement

2. **Create a new virement request:**
   | Field | Example |
   |-------|---------|
   | From | Travel Expenses (underspent) |
   | To | Training Expenses (needs more) |
   | Amount | RM 5,000 |
   | Reason | Training needs exceeded initial estimate |

3. **Submit for approval**

4. **Observe the workflow:**
   - Request goes to approver
   - Both budget items are "locked" pending approval
   - Once approved, balances update automatically

### What to Verify

- The system validates that the source has enough funds
- Shows impact on both budgets before you confirm
- Tracks the complete approval history

{{< callout type="info" >}}
**UTM Requirement (9.29):** The system must support transfer between objects within the same General Object, with appropriate approvals based on amount.
{{< /callout >}}

---

## Test Scenario 5: Budget Reports

**Objective:** See the various budget monitoring reports

**Time:** 5 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Budget → Reports

2. **Try these reports:**

| Report | What It Shows |
|--------|---------------|
| **Budget Summary** | High-level overview of all budgets |
| **Budget vs Actual** | Comparison of planned vs. spent |
| **Utilization Rate** | Percentage of budget used |
| **Commitment Report** | Outstanding POs and their amounts |

3. **Export a report:**
   - Click on any report
   - Click "Export" → Choose Excel or PDF
   - Download and open

### Try This

- Use the drill-down feature: Click on any total to see the transactions behind it
- Change date ranges to see different periods
- Filter by PTJ to focus on specific departments

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Viewed Vote Book display | ⬜ |
| 2. Explored budget creation | ⬜ |
| 3. Tested budget blocking | ⬜ |
| 4. Created a virement request | ⬜ |
| 5. Generated budget reports | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| UTM Requirement | How BigLedger Meets It |
|-----------------|----------------------|
| **9.23** Vote Book Display | User-friendly interface with real-time balances |
| **9.24** Staff Maintenance | Finance staff can manage without IT |
| **9.25** Logic Configuration | Configurable rules for validation and approval |
| **9.26-9.28** Budget Application | Different budget types with approval workflow |
| **9.29** Virement | Transfer between budget items with controls |
| **9.30-9.55** Other Operations | Full range of budget management features |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| View Vote Book | Finance → Budget → Vote Book Exposure |
| Maintain Vote Book | Finance → Budget → Vote Book Organizer |
| Request virement | Finance → Budget → Budget Virement |
| Budget adjustment | Finance → Budget → Budget Adjustment |
| Budget reports | Finance → Budget → Reports |

---

## What's Next?

You've completed the Budget Management evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../accounts-payable" title="Accounts Payable" subtitle="Learn how supplier payments work" >}}
  {{< card link="../accounts-receivable" title="Accounts Receivable" subtitle="See how collections are managed" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

