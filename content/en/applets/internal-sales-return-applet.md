---
title: "Internal Sales Return Applet"
description: "Comprehensive sales return management system for processing customer returns, refunds, and inventory adjustments with multi-level workflow approvals"
tags:
- sales-return
- customer-returns
- refund-management
- inventory-adjustment
- workflow-approval
weight: 65
---

## Purpose and Overview

The **Internal Sales Return Applet** is a powerful tool designed to streamline the entire customer return process. It moves beyond simple return tracking by integrating inventory management, financial settlements, approval workflows, and intercompany transaction handling.

{{< callout type="info" >}}
**Core Concept**: The system links **what** is being returned (Items) to **who** is returning (Customer) and **how** it's processed (Workflow & Settlement).
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales Teams:**
- Easy creation of return documents
- Quick customer lookup and selection
- Real-time return status tracking
- Clear visibility of return reasons

**Warehouse & Inventory Staff:**
- Accurate inventory adjustments upon returns
- Serial number and batch tracking
- Bin location management
- Return item inspection tracking

**Finance Teams:**
- Automated refund calculations
- Credit note generation
- Settlement and contra processing
- Complete financial audit trail

**Customer Service Representatives:**
- Fast return authorization
- Customer return history visibility
- Multi-channel return processing
- Efficient dispute resolution

**Managers & Approvers:**
- Return approval workflow
- Return pattern analysis
- Cost control and monitoring
- Policy compliance enforcement

**Executive Leadership:**
- Return rate analytics
- Revenue impact visibility
- Fraud prevention controls
- Customer satisfaction insights

### What Problems Does This Solve?

**The Manual Return Process Problem:**

Traditional return management relies on paper forms and disconnected systems. Common issues include:
- Lost return documentation
- Inventory discrepancies
- Delayed refunds to customers
- No visibility into return patterns
- Manual financial reconciliation
- Fraud and abuse risks

**The Internal Sales Return Applet Solution:**

- **Digital processing** - Create and track returns from anywhere
- **Automated workflows** - Intelligent routing based on return value and type
- **Real-time inventory updates** - Instant stock adjustments when returns are processed
- **Financial integration** - Automatic credit note and refund processing
- **Complete traceability** - Full audit history for every return
- **Flexible reporting** - Analyze returns by product, customer, or reason
- **Multi-location support** - Handle returns across branches and warehouses

## Key Features Overview

{{< cards >}}
  {{< card title="Return Document Creation" subtitle="Easy digital return processing with customer lookup" link="#for-sales-teams-create-your-first-return" >}}
  {{< card title="Line Item Management" subtitle="Detailed item tracking with serial/batch numbers" link="#line-items-tracking-what-was-returned" >}}
  {{< card title="Approval Workflows" subtitle="Multi-level approval routing" link="#approval-workflows-controlling-the-process" >}}
  {{< card title="Inventory Integration" subtitle="Real-time stock adjustments" link="#inventory-integration" >}}
  {{< card title="Financial Settlement" subtitle="Automated refund and credit processing" link="#financial-settlement-processing-refunds" >}}
  {{< card title="Intercompany Returns" subtitle="Cross-company return handling" link="#intercompany-transactions-cross-company-returns" >}}
  {{< card title="File Import/Export" subtitle="Bulk data processing capabilities" link="#file-import--export-bulk-operations" >}}
  {{< card title="Configuration & Settings" subtitle="Customize workflows and fields" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-sales-return-applet/return-process-flow.png" alt="Return Process Flow" caption="Return journey: Request → Approval → Inventory Return → Refund" >}}

---

## 📋 Admin Setup Checklist

**Setting up returns for the first time?** Complete these steps in order:

- [ ] **Step 1**: Review [Before You Begin](#before-you-begin) business decisions (30 mins)
- [ ] **Step 2**: Create Return Reasons → [Guide](#return-reasons-settings)
- [ ] **Step 3**: Set Default Settings → [Guide](#default-settings)
- [ ] **Step 4**: Configure Field Visibility → [Guide](#field-configuration)
- [ ] **Step 5**: Set Up Approval Workflows → [Guide](#workflow-settings)
- [ ] **Step 6**: Design Print Templates → [Guide](#printable-format-settings)
- [ ] **Step 7**: Assign Permissions → [Guide](#permission-settings)
- [ ] **Step 8**: Test with Dummy Return → [Guide](#for-sales-teams-create-your-first-return)
- [ ] **Step 9**: Train staff on daily tasks
- [ ] **Step 10**: Launch to customers! 🎉

**Estimated time**: 3-4 hours for basic setup

---

## Before You Begin

Before configuring the return system, make these key business decisions. These choices will shape how your entire return process works:

### 1. Define Your Return Policy Window

**Decision:** How long do customers have to return items?

**Common Options:**
- **7 days** (strict - electronics, perishables)
- **14 days** (standard retail - clothing, accessories)
- **30 days** (extended - furniture, appliances)
- **90 days** (warranty period - B2B, industrial equipment)
- **No time limit** (lifetime warranty - premium brands)

**Why This Matters:** Longer periods = happier customers but higher costs (storage, restocking, depreciation). Most businesses use 14-30 days as the sweet spot.

**Real-World Example:**
- Fashion retailer: 14 days (fast inventory turnover)
- Electronics store: 7 days (technology depreciates quickly)
- B2B supplier: 30 days (relationship-focused)

---

### 2. Decide on Restocking Fees

**Decision:** Do you charge fees for returns?

**Common Options:**
- **0%** - Free returns (customer defect or our mistake)
- **10-15%** - Customer preference returns (changed mind, wrong color)
- **20-25%** - Opened/used items (partial value loss)
- **100% restocking fee** - Special order items (non-returnable)

**Why This Matters:** Fees discourage frivolous returns but may reduce customer satisfaction. Balance cost recovery with customer experience.

**Decision Framework:**

| Return Reason | Your Fault? | Restocking Fee |
|---------------|-------------|----------------|
| Defective Product | Yes | 0% ✓ |
| Wrong Item Shipped | Yes | 0% ✓ |
| Customer Changed Mind | No | 10-15% |
| Opened/Used Item | No | 20-25% |
| Special Order | No | 100% (no return) |

---

### 3. Plan Approval Levels

**Decision:** Who needs to approve what value returns?

**Common Structures:**

**Simple (2-level):**
```
< RM 1,000 → Sales Supervisor (auto-approve)
RM 1,000-5,000 → Department Manager
> RM 5,000 → General Manager
```

**Standard (3-level):**
```
< RM 500 → Sales Supervisor
RM 500-2,000 → Department Manager  
RM 2,000-10,000 → Finance Manager
> RM 10,000 → Director + Finance (both must approve)
```

**Enterprise (4-level with conditions):**
```
< RM 1,000 + Reason = "Defective" → Auto-approve
< RM 1,000 + Reason = "Changed Mind" → Sales Manager
RM 1,000-5,000 → Department Manager
RM 5,000-10,000 → Finance Manager
> RM 10,000 → Director + CFO (sequential)
```

**Why This Matters:** Too many approvals = slow process. Too few = fraud risk. Balance speed with control.

---

### 4. Choose Settlement Methods

**Decision:** How will you refund customers?

**Option 1: Credit Note (No Cash Out)**
- **Best for:** B2B customers, regular buyers
- **How it works:** Customer gets store credit for next purchase
- **Pros:** No cash outflow, encourages repeat business, simple
- **Cons:** Customer can't get cash, may not return

**Option 2: Direct Refund (Cash/Bank)**
- **Best for:** B2C customers, one-time buyers
- **How it works:** Money transferred back to customer's payment method
- **Pros:** Customer satisfaction, expected for retail
- **Cons:** Cash outflow, processing fees (credit cards)

**Option 3: Contra (Offset Invoices)**
- **Best for:** B2B with outstanding invoices
- **How it works:** Return amount offsets what customer owes you
- **Pros:** No cash movement, simplifies reconciliation
- **Cons:** Only works if customer has unpaid invoices

**Option 4: Exchange Only**
- **Best for:** Final sale items, special circumstances
- **How it works:** Customer swaps for different item, no refund
- **Pros:** Retain revenue, customer still gets product
- **Cons:** Limited flexibility

**Most Common Strategy:** Credit Note for B2B, Direct Refund for B2C, Contra when applicable.

---

### 5. Design Your Return Reasons Strategy

**Decision:** What categories of returns will you track?

**Essential Return Reasons (Every Business):**
```
1. Defective/Damaged (quality issue)
2. Wrong Item Sent (order fulfillment error)
3. Customer Changed Mind (preference)
```

**Extended Return Reasons (Retail):**
```
4. Wrong Size/Color
5. Arrived Too Late
6. Better Price Elsewhere
7. Duplicate Order
```

**Advanced Return Reasons (B2B/Manufacturing):**
```
8. Quality Does Not Meet Specs
9. Overstocked/Excess Inventory
10. Product Expired
11. Warranty Claim
12. Recall
```

**Why This Matters:** More reasons = better analytics to fix root causes. Too many = confusing for staff.

**Pro Tip:** Start with 5-7 core reasons. Add more based on patterns you discover.

---

{{< callout type="warning" >}}
**Pro Tip:** Start simple! Most businesses launch with:
- **14-day return window**
- **0% restocking fee for defects, 10% for preference returns**
- **2-level approval** (Supervisor + Manager)
- **Credit Note for B2B, Refund for B2C**
- **5 basic return reasons**

You can always add complexity later once you understand return patterns.
{{< /callout >}}

---

## Key Concepts

### Understanding the Return Framework

Every return system must address three fundamental aspects. The Internal Sales Return Applet provides structured handling:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is returning? | Customer/Account | Retail customer, B2B client |
| **What** is being returned? | Items & Reason | Defective product, Wrong size |
| **How** is it processed? | Workflow & Settlement | Manager approval, Full refund |

{{< callout type="tip" >}}
**Real-World Example**: A customer (WHO) returns a defective laptop (WHAT) for RM 3,500. The system routes to manager for approval (HOW), updates inventory upon receipt, and issues a credit note for subsequent refund.
{{< /callout >}}

### Return Document Hierarchy

Think of the return process as a structured flow:

```
Organization
│
├── Customer/Account ──→ WHO is returning?
│   │
│   └── Return Document (Header) ──→ When & Why?
│       │
│       └── Return Lines (Items) ──→ WHAT specific items?
│           │
│           ├── Serial Numbers ──→ Exact item tracking
│           ├── Batch Numbers ──→ Manufacturing batch
│           └── Bin Location ──→ Where to store
│
└── Approval Workflow ──→ HOW returns are authorized
    │
    └── Settlement Process ──→ HOW refunds are processed
```

**Flow Through the Hierarchy:**

1. **Customer**: Who is making the return
2. **Return Document**: Header information (date, reason, total)
3. **Return Lines**: Individual items being returned
4. **Item Details**: Serial numbers, batches, quantities
5. **Approval**: Routing to authorized approvers
6. **Settlement**: Refund/credit processing

This structure enables:
- **Precise tracking** of each returned item
- **Flexible reporting** by customer, product, or reason
- **Clear accountability** for approvals
- **Accurate financial reconciliation**

### Return Status Lifecycle

Understanding return statuses helps track progress:

```
DRAFT → SUBMITTED → APPROVED → GOODS RECEIVED → SETTLED → CLOSED
  ↓         ↓           ↓            ↓              ↓         ↓
Create   Review    Authorize    Inspect &      Issue      Archive
                                 Stock In      Refund
```

**Status Definitions:**

| Status | Meaning | Actions Available |
|--------|---------|-------------------|
| **DRAFT** | Being created | Edit, Submit |
| **SUBMITTED** | Waiting for approval | Approve, Reject |
| **APPROVED** | Authorized to proceed | Receive goods |
| **GOODS RECEIVED** | Items back in inventory | Process refund |
| **SETTLED** | Refund processed | Close |
| **CLOSED** | Completed | View only |
| **REJECTED** | Return denied | Review reason |
| **VOID** | Cancelled | View only |

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Sales Teams: Create Your First Return

**Goal:** Create a sales return document in 6 simple steps.

1. **Navigate:** Go to Internal Sales Return > Click "+"
2. **Main Details:** Select date, branch, return reason, add remarks
3. **Select Customer:** Search and select customer (auto-fills addresses)
4. **Add Items:** Click "Add Line Item"
   - Select product, enter quantity, price
   - Specify return reason and condition
   - Add serial/batch numbers if applicable
5. **Review:** Check total refund, add adjustments, select settlement method
6. **Submit:** Click "Submit" - routes to approver

**What's next?** Manager approves → Warehouse receives goods → Finance processes refund → Customer gets credit/refund (7-14 days)

**Pro Tip:** Save as Draft to gather more information before submitting.

---

### For Managers: Approve Your First Return

**Goal:** Review and approve customer returns in 4 steps.

1. **Access:** Go to Internal Sales Return > Filter by Status: "Submitted"
2. **Review:** Click return to see customer info, return reason, items, original invoice, refund amount
3. **Verify:** Check return is within policy, items match order, reason is valid, quantities reasonable
4. **Decide:**
   - **Approve:** Click "Approve" - moves to warehouse
   - **Reject:** Click "Reject" + enter reason - customer notified
   - **Query:** Click "Query" + request info - returns to sales for response

**Best Practices:** Review daily, check for fraud patterns, be consistent, document reasons clearly, set up delegation when on leave.

---

### For Warehouse Staff: Process Returned Goods

**Goal:** Receive returned items and update inventory in 5 steps.

1. **Access:** Go to Internal Sales Return > Filter by Status: "Approved"
2. **Prepare:** Print picking list/return receipt
3. **Inspect:** Verify quantity, check condition, verify serial/batch numbers, document issues
4. **Update:** Go to Line Items tab, confirm quantities received, update condition status, enter bin locations, scan serial numbers
5. **Complete:** Click "Goods Received" - inventory updates automatically, finance notified

{{< callout type="warning" >}}
Always inspect items before confirming receipt. Once marked as received, inventory is automatically updated.
{{< /callout >}}

**Common Scenarios:** Defective items → receive into "Defective Goods" bin (non-saleable). Restockable items → receive into regular bin (saleable). Partial returns → update quantity to actual received.

---

### For Finance Teams: Process Refund

**Goal:** Complete financial settlement and issue refund.

1. **Access:** Go to Internal Sales Return > Filter by Status: "Goods Received"
2. **Review:** Check original invoice, return amount, adjustments, net refund
3. **Choose Method:** Credit Note (no cash), Direct Refund (payment to customer), Contra (offset invoices), or Exchange
4. **Process:** Select method, enter details, generate credit note/refund voucher, click "Process Settlement"
5. **Close:** Verify accounting entries, send confirmation to customer, mark as "Settled"

{{< callout type="tip" >}}
If integrated with accounting, entries are automatically posted to GL accounts.
{{< /callout >}}

---

### For Admins: Initial System Setup

**Goal:** Configure the return system in 7 steps.

1. **Return Reasons** (`Settings > Return Reasons`) - Create reasons: Defective, Wrong Product, Wrong Size, Changed Mind, Warranty Return, DOA
2. **Field Settings** (`Settings > Field Settings`) - Set required fields, show/hide fields, configure permissions
3. **Approval Workflows** (`Settings > Workflow Settings`) - Define rules (e.g., <RM 500 → Supervisor, >RM 2000 → Manager)
4. **Default Settings** (`Settings > Default Selection`) - Set default branch, return reason, settlement method
5. **Printable Formats** (`Settings > Printable Format`) - Design return receipt and credit note templates
6. **Permissions** (`Settings > Permission Set`) - Define who can create, approve, receive goods, process refunds
7. **Test** - Create test return, approve, receive goods, process settlement - verify complete flow

**Ongoing:** Review settings quarterly, update approval thresholds, train new staff

---

{{< callout type="tip" >}}
**New to the system?** Start with the basics:
1. Sales teams should explore **Return Creation** and submit a test return
2. Managers should practice **Approval Workflow** 
3. Warehouse should test **Goods Receipt Process**
4. Admins should review **Configuration & Settings** for detailed setup guides
{{< /callout >}}

---

## 📄 Quick Reference Cards

### Return Processing Cheat Sheet

**When to Use:**
- Customer brings item back to store
- Wrong item was shipped
- Product is defective
- Customer changed their mind

**How to Process (6 Steps):**
1. Create return document → Click "+"
2. Select customer → Auto-fills details
3. Add line items → Product + quantity + reason
4. Submit for approval → Routes automatically
5. Receive goods → Update inventory
6. Process refund → Issue credit note or payment

**Best Practices:**
- ✅ Always take photos of defective items
- ✅ Verify serial numbers match original sale
- ✅ Check return is within policy window
- ❌ Never approve without manager confirmation for high-value returns
- ❌ Don't skip goods inspection step

---

### Common Return Scenarios

**Scenario 1: Defective Product (Most Common)**

```
Customer: Sarah Chen bought a laptop for RM 5,500
Problem: Screen flickering after 10 days
Process:
  1. Return Reason → "Defective"
  2. Restocking Fee → 0% (our quality issue)
  3. Approval → Auto-approved (within 30 days)
  4. Settlement → Full refund RM 5,500
  5. Inventory → Receive into "Defective Goods" bin
  6. Next Step → Send to repair or supplier
```

**Scenario 2: Customer Changed Mind**

```
Customer: John Tan bought shoes for RM 250
Problem: Doesn't like the color
Process:
  1. Return Reason → "Changed Mind"
  2. Check Policy → Is it within 14 days? ✓ Yes
  3. Restocking Fee → 10% = RM 25
  4. Approval → Manager required
  5. Settlement → Refund RM 225 (250 - 25 fee)
  6. Inventory → Receive into regular stock (resell)
```

**Scenario 3: Wrong Item Shipped**

```
Customer: ABC Company ordered 100 units of SKU-001
Problem: We sent 100 units of SKU-002 by mistake
Process:
  1. Return Reason → "Wrong Item Shipped"
  2. Restocking Fee → 0% (our fulfillment error)
  3. Approval → Auto-approved (company fault)
  4. Settlement → Full refund + ship correct item
  5. Priority → High (customer waiting)
  6. Inventory → Receive returned goods, fulfill correct order
```

**Scenario 4: Warranty Claim (B2B)**

```
Customer: XYZ Manufacturing, purchased RM 50,000 equipment
Problem: Motor failed after 8 months (under 1-year warranty)
Process:
  1. Return Reason → "Warranty Claim"
  2. Verification → Check purchase date, warranty terms
  3. Approval → Manager + QC inspection
  4. Settlement → Replace with new unit (no refund)
  5. Old Unit → Return to supplier for warranty credit
  6. Cost Recovery → Claim from manufacturer
```

---

### Quick Decision Tree

**"Should I approve this return?"**

```
START: Customer requests return
  ↓
  Is item defective? 
    → YES → APPROVE (0% fee)
    → NO → Continue...
  ↓
  Is return within policy window (14 days)?
    → NO → REJECT (outside policy)
    → YES → Continue...
  ↓
  Did we ship wrong item?
    → YES → APPROVE (0% fee, priority)
    → NO → Continue...
  ↓
  Customer changed mind? Item unused and resellable?
    → YES → APPROVE (10% restocking fee)
    → NO → Continue...
  ↓
  Item opened/used?
    → YES → Check value:
        • < RM 500 → Supervisor decides
        • > RM 500 → Manager approval + 20% fee
    → NO → REJECT (not resellable)
```

---

### Most Common Daily Tasks

**Task: Create a return for walk-in customer**
→ `Internal Sales Return` → Click `+` → Fill customer details → Add items → Submit

**Task: Approve pending return**
→ Filter Status: `Submitted` → Open return → Review details → Click `Approve`

**Task: Receive returned goods into warehouse**
→ Filter Status: `Approved` → Open return → Update quantities → Enter bin location → Click `Goods Received`

**Task: Process customer refund**
→ Filter Status: `Goods Received` → Select settlement method → Generate credit note → Process payment

**Task: Check why a return was rejected**
→ Find return → View status history → Read rejection reason in comments

**Task: Export returns for monthly report**
→ Set date filter → Select status: `Closed` → Click `Export` → Choose format

---

### Approval Limits Quick Reference

| Role | Can Approve Returns Up To | Special Conditions |
|------|---------------------------|-------------------|
| **Sales Supervisor** | RM 1,000 | Defective items only (auto-approve) |
| **Department Manager** | RM 5,000 | All return reasons |
| **Finance Manager** | RM 20,000 | Requires QC report for defects |
| **General Manager** | Unlimited | Approval required for > RM 20,000 |

---

### Restocking Fee Guide

| Return Reason | Fee % | Goes To | Notes |
|---------------|-------|---------|-------|
| **Defective** | 0% | None | Our quality issue |
| **Wrong Item Sent** | 0% | None | Our fulfillment error |
| **Damaged in Transit** | 0% | None | Carrier/our packaging fault |
| **Changed Mind** | 10% | Company | Standard preference fee |
| **Opened/Used** | 20% | Company | Partial value loss |
| **Special Order** | 100% | None | Non-returnable |

---

## Core Features

### Return Document Management

**Create, track, and manage customer return documents.**

**Header Information:**
- Transaction date, branch/location, customer details
- Document numbers (server-generated and client reference)
- Return reason and current status
- Billing and shipping addresses

**Financial Summary:**
- Total return amount, adjustments, net refund
- Settlement method and payment status

**Document Statuses:**

| Status | Meaning | Next Action |
|--------|---------|-------------|
| **DRAFT** | Being created | Edit, Submit |
| **SUBMITTED** | Waiting approval | Approve, Reject |
| **APPROVED** | Authorized | Receive goods |
| **GOODS RECEIVED** | Items in inventory | Process refund |
| **SETTLED** | Refund processed | Close |
| **CLOSED** | Completed | View only |
| **REJECTED** | Denied | Review reason |
| **VOID** | Cancelled | View only |

---

### Line Items - Tracking What Was Returned

**Detailed item-level tracking ensures accuracy and accountability.**

{{< callout type="info" >}}
**📖 This section is detailed (100+ lines).** For most returns:
- Product + Quantity + Reason is sufficient
- Add Serial Numbers only for electronics/high-value items
- Add Batch Numbers only for perishables/regulated products

[Skip to Approval Workflows](#approval-workflows-controlling-the-process) if you don't use serial/batch tracking.
{{< /callout >}}

#### Adding Line Items

For each returned item, capture:

**Basic Item Information:**
- **Product/Item Code**: What is being returned
- **Description**: Item name and details
- **Quantity**: How many units
- **Unit of Measure**: Pieces, boxes, kg, etc.
- **Unit Price**: Original selling price
- **Total Amount**: Quantity × Unit Price

**Return-Specific Details:**
- **Return Reason**: Why this specific item is returned
- **Condition**: New, Used, Damaged, Defective, DOA
- **Inspection Notes**: Warehouse observations
- **Return Action**: Restock, Repair, Scrap, Return to Vendor

**Advanced Tracking:**

**Serial Number Tracking:**

For serialized items (laptops, phones, appliances):

**Real-World Example: Sarah Chen Returns a Laptop**

```
Customer: Sarah Chen
Purchase Date: January 15, 2026  
Original Invoice: INV-2024-5431
Item: Dell Laptop XPS 15 - RM 5,500
Serial Number Sold: SN-DL-001234

Problem: Screen flickering after 10 days

Return Process:
  1. Sales creates return document
  2. Enters Serial Number: SN-DL-001234
  3. System verifies: ✓ Match found
     - Sold to: Sarah Chen ✓
     - Date: Jan 15, 2026 ✓  
     - Invoice: INV-2024-5431 ✓
  4. Return Reason: "Defective - Screen Issue"
  5. Manager approves (defect within 30-day warranty)
  6. Warehouse receives laptop into "Defective Goods" Bin D-12
  7. QC inspection confirms screen defect
  8. Finance issues full refund: RM 5,500
  9. Laptop sent to Dell for warranty claim
```

**Why Serial Numbers Matter:**
- **Proves authenticity**: Sarah actually bought THIS laptop from us
- **Prevents fraud**: Can't return a different laptop or one from competitor
- **Tracks warranty**: System knows purchase date automatically  
- **Identifies patterns**: If 10 laptops from same batch have screen issues, recall entire batch
- **Recover costs**: Use serial to claim warranty reimbursement from Dell

**Without Serial Numbers:**
```
❌ Sarah could return ANY Dell XPS 15 (even one she didn't buy from us)
❌ Can't verify purchase date (warranty might be expired)
❌ Can't track which specific unit had the problem
❌ Difficult to claim from supplier without proof
```

**Batch Number Tracking:**
For batch-managed items (food, pharmaceuticals, chemicals):
```
Item: Vitamin C Tablets
Batch: BATCH-2024-001
Expiry: 2025-12-31
Quantity: 100 bottles
Reason: Customer over-ordered
```

Benefits:
- Quality control
- Expiry management
- Supplier communication
- Recall management

**Bin Location Management:**
Specify where returned items are stored:
```
Item: LED TV 55"
Condition: Damaged
Bin Location: RETURNS-DAMAGED-A01
Next Action: Send for inspection
```

Benefits:
- Organized warehouse
- Easy item retrieval
- Condition segregation
- Inspection workflow

#### Line Item Features

**Bulk Operations:**
- Add multiple items at once
- Import from Excel
- Copy from original invoice
- Duplicate line items

**Item Validation:**
- Check if item was originally sold to customer
- Verify within return policy period
- Validate serial numbers match
- Confirm batch numbers exist

**Pricing Controls:**
- Use original selling price
- Allow price adjustments (damage depreciation)
- Apply restocking fees
- Add inspection charges

**Reporting:**
- Most returned items
- Return reasons by product
- Return rate by product category
- Value of returns by item

---

### Approval Workflows - Controlling the Process

**Multi-level approval ensures proper authorization based on return value and type.**

---

#### Quick Comparison: Simple vs Complex Approval Workflows

**Which approval structure fits YOUR business?**

| Factor | Simple Workflow (2-Level) | Complex Workflow (4-Level) | Recommendation |
|--------|---------------------------|----------------------------|----------------|
| **Business Size** | Small business (<20 staff) | Large corporation (>100 staff) | Start simple; add complexity only when needed |
| **Approval Levels** | 1. Staff RM 0-500<br>2. Manager >RM 500 | 1. Staff RM 0-500<br>2. Supervisor RM 500-2,000<br>3. Manager RM 2,000-10,000<br>4. Director >RM 10,000 | More levels = slower processing but tighter control |
| **Processing Time** | ⚡ **30 minutes - 2 hours** (fast approval) | 🐌 **1-3 days** (multiple approvals) | Balance speed with control |
| **Flexibility** | High (manager decides based on situation) | Low (must follow defined rules) | Flexibility good for small teams |
| **Fraud Risk Control** | Moderate (fewer checkpoints) | High (multiple reviewers catch issues) | High-value/high-risk products need more levels |
| **Staff Satisfaction** | 😊 High (less bureaucracy, faster decisions) | 😐 Moderate (waiting for multiple approvals frustrating) | Too many levels = staff bypass the system |
| **Best For** | Retail stores, Small businesses, Trusted staff | Large distributors, High-value products (electronics, jewelry), Multi-branch operations | Match complexity to actual risk |

**Real-World Example - Simple Workflow:**
```
TechMart Electronics (15 staff):
├─ Sales Staff: Can approve up to RM 500 (routine returns like cables, accessories)
└─ Store Manager: Approves everything above RM 500 (laptops, phones, TVs)

Result: 80% of returns processed in under 1 hour (most are under RM 500)
```

**Real-World Example - Complex Workflow:**
```
MegaCorp Distribution (500 staff, 20 branches):
├─ Branch Staff: RM 0-500 (small items, office supplies)
├─ Branch Supervisor: RM 500-2,000 (routine branch returns)
├─ Branch Manager: RM 2,000-10,000 (significant returns, escalations)
└─ Regional Director + Finance: >RM 10,000 (major returns, fraud checks)

Result: Tighter control, catches more fraud, but takes 1-2 days for high-value returns
```

**Quick Decision Guide:**
- **Start with 2-level workflow** (Staff + Manager) for the first 3 months
- **Track how many returns wait > 24 hours** for approval
- **If <5% are waiting**, stick with simple workflow (working well!)
- **If >20% are waiting OR fraud detected**, add a 3rd level (Supervisor between Staff and Manager)

---

#### Workflow Configuration

**Setup Approval Rules:**

Admins can define rules based on:

**Return Value:**
```
< RM 500      → Sales Supervisor
RM 500-2000   → Department Manager  
RM 2000-5000  → General Manager
> RM 5000     → GM + Finance Director
```

**Return Reason:**
```
Wrong Item/Size     → Auto-approve (if within 7 days)
Defective          → QC Manager
Customer Changed Mind → Sales Manager
Warranty Claim     → Warranty Team + Sales Manager
```

**Customer Type:**
```
VIP Customers       → Fast-track approval
Regular Customers   → Standard workflow
New Customers       → Additional verification
```

**Branch/Location:**
```
HQ Branch          → Department Manager
Regional Branches  → Regional Manager → HQ Manager
```

#### Approval Process

**For Approvers:**

**Step 1: Notification**
- Email alert when return assigned to you
- Dashboard badge showing pending count
- Mobile push notification (if enabled)

**Step 2: Review**
Access return details:
- Customer information and history
- Items being returned with reasons
- Original sale invoice
- Return photos/documentation
- Financial impact

**Step 3: Decision**

**Approve:**
- One-click approval
- Add approval comments
- Set conditions (e.g., "Approve subject to inspection")

**Reject:**
- Must provide rejection reason
- Customer and sales team notified
- Return can be revised and resubmitted

**Request More Info:**
- Query specific details
- Request photos or documentation
- Ask for clarification on reason
- Return goes back to originator

**Escalate:**
- Send to higher authority
- Add escalation notes
- Flag for special attention

**Step 4: Documentation**
System automatically records:
- Who approved/rejected
- When (date and time)
- Approval comments
- Any conditions

#### Advanced Workflow Features

**Parallel Approval:**
Multiple approvers must approve simultaneously:
```
Return > RM 10,000
  ├── Sales Director (must approve)
  ├── Finance Director (must approve)
  └── All must approve to proceed
```

**Sequential Approval:**
Approval moves through levels:
```
Stage 1: Sales Supervisor → Approve
Stage 2: Department Manager → Approve  
Stage 3: Finance → Approve
```

**Conditional Routing:**
Workflow changes based on conditions:
```
If (Return Reason = "Defective")
  → Route to QC Manager
  → If QC confirms defect → Route to Sales Manager
  → If QC says not defective → Reject
```

**Delegation:**
Approvers can delegate during absence:
```
Manager A on leave Dec 20-31
Delegate to Manager B
All returns auto-route to Manager B
```

**Approval Limits:**
Set monetary limits per approver:
```
Supervisor: Can approve up to RM 2,000
Manager: Can approve up to RM 10,000
Director: No limit
```

#### Monitoring & Reporting

**For Managers:**
- Pending approvals count
- Average approval time
- Approval vs rejection rate
- Returns approved by each approver

**For Admins:**
- Workflow bottlenecks
- Slow-moving approvals
- Approval policy compliance
- Escalation frequency

---

### Financial Settlement - Processing Refunds

**Handle the financial aspects of returns with multiple settlement options.**

{{< callout type="info" >}}
**📖 This section is detailed (140+ lines).** For most businesses:
- Use **Credit Note** for B2B customers (simplest, no cash out)
- Use **Direct Refund** for B2C customers (expected, customer satisfaction)
- Choose **Contra** only if customer has outstanding invoices

[Skip to Configuration](#configuration--settings) if you just need basic setup.
{{< /callout >}}

---

#### Quick Comparison: Which Settlement Method Should I Use?

| Settlement Method | Best For | Cash Flow Impact | Processing Time | Accounting Complexity | Customer Satisfaction | Example Use Case |
|-------------------|----------|------------------|-----------------|----------------------|----------------------|------------------|
| **Credit Note** | B2B customers, Regular customers | ✅ **No cash outflow** (keeps money in business) | ⚡ **Instant** (auto-generated) | ⭐ **Simple** (one GL entry) | 🙂 **Good** (B2B expect this) | ABC Manufacturing returns RM 5,000 parts → Get credit note → Use on next order |
| **Direct Refund** | B2C customers, One-time buyers | ❌ **Immediate cash out** (affects working capital) | 🐌 **3-5 days** (bank processing) | ⭐⭐ **Moderate** (bank reconciliation needed) | 😊 **Excellent** (cash in hand) | Sarah returns a laptop → RM 3,500 refunded to her bank account within 5 days |
| **Contra Entry** | Customers with outstanding invoices | ✅ **No cash involved** (offsets debt) | ⚡ **Instant** (reduces receivables) | ⭐⭐⭐ **Complex** (affects multiple documents) | 🙂 **Good** (settles both sides) | XYZ Company owes RM 10,000, returns RM 3,000 goods → New balance: RM 7,000 owed |
| **Exchange** | Same item replacement (size/color), Warranty claims | ✅ **No cash/credit issued** (just swap item) | ⚡ **Instant** (inventory swap) | ⭐ **Simple** (no financial entries) | 😊 **Excellent** (gets working item) | Customer bought wrong shoe size → Exchange size 8 for size 9 |

**Quick Decision Tree:**
```
Is the customer a business (B2B)?
├─ Yes → Use Credit Note (they'll use it on next order)
└─ No (B2C/Individual)
    │
    Do they have outstanding invoices with you?
    ├─ Yes → Consider Contra Entry (settles both debts)
    └─ No → Use Direct Refund (cash back)
```

**Pro Tip:** Most retail businesses use **80% Credit Notes + 20% Direct Refunds**. This protects cash flow while keeping customers happy.

---

#### Settlement Methods

**1. Credit Note**

Most common for B2B transactions:

**Real-World Example: ABC Manufacturing (B2B Customer)**

```
ABC Manufacturing returns RM 5,000 worth of industrial parts
↓
Sales creates return document RET-2024-001
↓
Manager approves (items restockable)
↓
Warehouse receives goods into Bin A-15
↓
System generates Credit Note CN-2024-098
↓
ABC's account now shows: RM 5,000 credit balance
↓
Next month, ABC orders RM 8,000 worth of new parts
↓
Invoice: RM 8,000 - RM 5,000 (credit) = RM 3,000 to pay
↓
ABC pays only RM 3,000, credit note fully utilized
```

**Advantages:**
- No cash outflow
- Encourages future business
- Simple accounting
- Fast processing

**Use when:**
- B2B customers
- Regular customers
- Company policy prefers credit
- Cash flow management

**2. Direct Refund**

Cash or bank transfer back to customer:

**How it works:**
```
Customer returns RM 1,200 worth of goods
↓
Finance processes refund payment
↓
RM 1,200 transferred to customer's bank account
↓
Customer receives refund in 3-5 business days
```

**Refund Methods:**
- Bank transfer
- Check
- Cash (if within limit)
- Original payment method (credit card, e-wallet)

**Use when:**
- B2C customers
- High-value returns
- Customer insists on cash refund
- Closing customer account

**3. Contra Entry**

Offset against customer's outstanding invoices:

**How it works:**
```
Customer has:
- Outstanding Invoice: RM 8,000 (owes company)
- Return: RM 5,000 (company owes customer)

Contra Entry:
- Reduce invoice balance by RM 5,000
- Customer now owes: RM 3,000
- No cash movement
```

**Advantages:**
- Settles both obligations
- No cash handling
- Reduces receivables
- Efficient for both parties

**Use when:**
- Customer has unpaid invoices
- Both parties agree
- Simplifies cash flow
- Reduces transaction costs

**4. Exchange**

Replace returned item with another:

**How it works:**
```
Customer returns: Product A (RM 1,000)
Customer takes: Product B (RM 1,200)
Customer pays difference: RM 200
```

**Use when:**
- Wrong size/color
- Product upgrade
- Same-value exchange
- Customer preference

#### Processing Settlement

**Settlement Process:**

1. **Verify Return Completion** - Ensure return is approved and goods received
2. **Calculate Net Amount** - Apply restocking fees, inspection charges, or shipping refunds
3. **Select Settlement Method** - Choose credit note, refund, contra, or exchange
4. **Generate Documents** - System creates credit note, accounting entries, and customer updates
5. **Notify Customer** - Email credit note and update customer portal

#### Financial Adjustments

**Common Adjustments:**
- **Restocking Fee:** Percentage deducted for non-defective returns
- **Shipping Charges:** Refund if defective, deduct if customer preference
- **Inspection Charges:** Fee if customer damage found
- **Depreciation:** Reduce value for used/damaged items

#### Accounting Integration

**Automatic GL Postings:**
When credit note issued, system automatically debits Sales Returns & Allowances and credits Accounts Receivable, plus inventory adjustments.

**Financial Reports:** Sales returns by period, settlement method breakdown, outstanding credit notes, customer refund history

---

### Intercompany Transactions - Cross-Company Returns

{{< callout type="warning" >}}
**⚠️ Advanced Feature** - Skip this section if you're just getting started.

This feature is only needed if:
- Your business has multiple legal entities (separate companies)
- You transfer goods between sister companies
- You need to track cross-company returns for tax/consolidation purposes

**Most businesses don't need this.** Come back when you have this specific requirement.
{{< /callout >}}

**Handle returns between related companies within the same corporate group.**

#### What are Intercompany Returns?

When your business has multiple legal entities (companies) and goods are transferred between them, returns may need to be processed across company boundaries.

**Common Scenarios:**

**Scenario 1: Warehouse Transfer**
```
Company A (Manufacturing)
    ↓ Sold goods
Company B (Distribution)
    ↓ Company B returns defective items
Company A (Must accept return from sister company)
```

**Scenario 2: Regional Operations**
```
Company A (Singapore Entity)
    ↓ Cross-border sale
Company B (Malaysia Entity)  
    ↓ Return due to wrong specification
Company A (Process intercompany return)
```

**Scenario 3: Branch Sales**
```
Company A (Head Office)
    ↓ Stock transferred
Company B (Branch - separate legal entity)
    ↓ Excess stock return
Company A (Receive back stock)
```

#### How Intercompany Returns Work

**Process:**

1. **Initiate Transaction** - Go to Intercompany section, select from/to companies
2. **Enter Return Details** - Include intercompany relationship and transfer pricing
3. **Match Original Sale** - Link to original intercompany invoice
4. **Dual Entry Creation** - System creates documents in both companies automatically
5. **Settlement** - Update intercompany accounts with no external cash movement

#### Intercompany Features

- **Automatic Matching:** System matches outgoing and incoming documents, validates amounts
- **Transfer Pricing:** Apply group transfer pricing policy for tax compliance
- **Currency Handling:** Multi-currency support with exchange rates
- **Consolidation:** Eliminate IC transactions in group reporting

**Reporting:** Intercompany return transactions, outstanding IC balances, transfer pricing validation

---

### File Import / Export - Bulk Operations

{{< callout type="warning" >}}
**⚠️ Advanced Feature** - Skip this section if you're just getting started.

This feature is only needed if:
- You process 50+ returns per day (bulk operations)
- You receive return data from external systems (e-commerce platforms, POS)
- You need to export data for accounting software integration

**Most businesses enter returns manually** (faster for small volumes). Come back when you need automation.
{{< /callout >}}

**Process large volumes of returns efficiently with bulk data operations.**

#### File Import

**How to Import:**

1. **Download Template** - Get Excel template with required columns
2. **Prepare Data** - Fill in customer code, items, quantities, prices, return reasons
3. **Upload File** - Upload your Excel/CSV file
4. **Validate** - System checks for errors (customer exists, valid items, correct formats)
5. **Review Results** - Fix any errors and re-upload if needed

**Import Options:**
- Create as Draft (requires manual submission)
- Auto-Submit (automatically submit after validation)
- Auto-Approve (skip approval if permitted)

**Use Cases:** Migrate historical data, bulk create returns, process e-commerce returns

#### File Export

**How to Export:**

1. **Set Filters** - Date range, customer, branch, status, return reason
2. **Select Format** - Excel, CSV, PDF, or custom template
3. **Choose Fields** - Select which columns to export
4. **Generate** - Large exports process in background
5. **Download** - Get notified when ready, download file

**Export Features:**
- Schedule automatic exports (daily, weekly, monthly)
- Save export templates for reuse
- Email notifications when complete
- Export history tracking

**Use Cases:** Management reports, accounting integration, data analysis, regulatory compliance

---

## Configuration & Settings

### Default Settings

**Configure system-wide defaults to streamline data entry.**

**Access:** `Settings > Default Selection`

**Configurable Defaults:**

**Branch & Location:**
- Default branch for new returns
- Default warehouse location
- Default bin for returned goods

**Document Defaults:**
- Default return reason
- Default good condition status
- Default settlement method
- Default approval route

**Financial Defaults:**
- Default restocking fee percentage
- Default adjustment GL account
- Default tax treatment
- Default payment terms

**Behavior Defaults:**
- Auto-save draft frequency
- Default listing view (grid/list)
- Default date range (last 30 days)
- Default sort order

**Benefits:**
- Faster data entry
- Consistency across users
- Reduced errors
- New user friendly

---

### Return Reasons Settings

**Define and manage standard return reason codes.**

**Access:** `Settings > Return Reasons Settings`

**Why Return Reasons Matter:**
- **Analytics**: Identify common return causes
- **Quality Control**: Flag product issues
- **Process Improvement**: Reduce avoidable returns
- **Financial Planning**: Forecast return provisions

**How to Configure:**

**Create Return Reasons:**
1. Click **"Add Return Reason"**
2. Enter:
   - **Code**: DEFECT, WRONGITEM, SIZE, etc.
   - **Description**: "Product Defective or Damaged"
   - **Category**: Quality, Order Error, Customer Preference
   - **Active**: Yes/No
   - **Requires Approval**: Yes/No (auto-approve some reasons)
   - **Allow Restocking**: Yes/No
   - **Default Condition**: Damaged, Used, New

**Example Return Reasons:**

```
Code: DEFECT
Description: Product Defective or Damaged
Category: Quality Issue
Requires Approval: Yes (Manager review)
Allow Restocking: No (send to quality)
Default Condition: Damaged

Code: WRONGITEM
Description: Wrong Item Delivered
Category: Order Error
Requires Approval: No (auto-approve, our fault)
Allow Restocking: Yes (item is new)
Default Condition: New

Code: CHANGEOFMIND
Description: Customer Changed Mind
Category: Customer Preference
Requires Approval: Yes (check return policy)
Allow Restocking: Yes (if within 7 days)
Default Condition: New
Restocking Fee: 10%
```

**Advanced Options:**

**Conditional Logic:**
- If reason = "DEFECT" → Route to QC
- If reason = "CHANGEOFMIND" → Charge restocking fee
- If reason = "WRONGITEM" → Auto-approve & waive fees

**Reporting by Reason:**
- Top return reasons report
- Return reason trends
- Cost by return reason
- Product-specific return reasons

---

#### Real-World Setup Examples by Business Type

**Retail Store (B2C) - Clothing & Accessories:**

```
Reasons to Create:
1. WRONGSIZE - Wrong Size/Doesn't Fit
   → Restocking Fee: 0%
   → Auto-approve if within 14 days
   → Allow restocking: Yes
   
2. WRONGCOLOR - Wrong Color/Style  
   → Restocking Fee: 10%
   → Requires manager approval
   → Allow restocking: Yes

3. DEFECT - Defective/Damaged
   → Restocking Fee: 0%
   → Auto-approve
   → Send to supplier

4. CHANGEDMIND - Customer Changed Mind
   → Restocking Fee: 15%
   → Manager approval required
   → Allow restocking: Only if tags still attached

5. TOOLATE - Arrived Too Late
   → Restocking Fee: 0% (our shipping fault)
   → Auto-approve
   → Allow restocking: Yes
```

**Electronics Store (B2C):**

```
Reasons to Create:
1. DOA - Dead On Arrival (product doesn't turn on)
   → Restocking Fee: 0%
   → Auto-approve within 7 days
   → Serial number verification required
   → Exchange or full refund

2. DEFECT - Product Defective (works but has issues)
   → Restocking Fee: 0%
   → Requires QC inspection
   → Serial number required
   → Send to repair center

3. WRONGSPEC - Wrong Specifications Ordered
   → Restocking Fee: 10%
   → Manager approval
   → Only if unopened

4. BETTERPRICE - Found Better Price Elsewhere
   → Restocking Fee: 15%
   → Price match policy (refund difference instead)
   → Manager approval

5. NOTCOMPATIBLE - Not Compatible with Device
   → Restocking Fee: 10%
   → Only if unopened
   → Sales should have verified at purchase
```

**B2B Distributor (Industrial Parts):**

```
Reasons to Create:
1. QUALITYISSUE - Does Not Meet Quality Specs
   → No restocking fee
   → Requires QC inspection + report
   → Batch/Serial tracking required
   → Send to supplier for credit

2. OVERSTOCKED - Customer Overstocked
   → Restocking Fee: 5-10%
   → Only within 30 days
   → Items must be unopened
   → Manager approval

3. WRONGITEM - We Shipped Wrong Item
   → No restocking fee
   → Priority return
   → Auto-approve
   → Ship correct item immediately

4. WARRANTY - Warranty Claim
   → No restocking fee
   → Serial number required
   → Verify warranty period
   → Send to manufacturer

5. EXPIRED - Product Expired
   → Check expiry date on invoice
   → If expired before delivery: 0% fee
   → If customer stored too long: Not accepted
```

**E-Commerce (Online Retail):**

```
Reasons to Create:
1. NOTASDESCRIBED - Not as Described on Website
   → Restocking Fee: 0%
   → Auto-approve
   → Marketing team reviews listing
   → Full refund + return shipping

2. DAMAGEDSHIPPING - Damaged in Shipping
   → Restocking Fee: 0%
   → Photo required
   → Claim from courier
   → Immediate replacement

3. WRONGITEM - We Sent Wrong Item
   → Restocking Fee: 0%
   → Auto-approve
   → Warehouse audit required
   → Send correct item

4. NOLONGERNEEDED - Customer No Longer Needs
   → Restocking Fee: 10%
   → Within 30 days
   → Item unopened
   → Customer pays return shipping

5. GIFTRETURN - Gift Return (no receipt)
   → Store credit only
   → No cash refund
   → Manager verification
```

---

#### Decision Framework: Which Return Reasons Do I Need?

**Start with these 5 essential reasons (Every business needs these):**

| Return Reason | Fee | Approval | Use Case |
|---------------|-----|----------|----------|
| **Defective** | 0% | Auto | Product doesn't work |
| **Wrong Item** | 0% | Auto | We shipped incorrectly |
| **Changed Mind** | 10% | Manager | Customer preference |
| **Damaged in Transit** | 0% | Auto | Shipping damage |
| **Wrong Size/Spec** | 10% | Manager | Customer ordered incorrectly |

**Add these if you sell electronics/appliances:**
- DOA (Dead on Arrival)
- Not Compatible
- Better Price Elsewhere

**Add these if you sell food/pharmaceuticals:**
- Expired Product
- Batch Recall
- Temperature Issue

**Add these for B2B:**
- Quality Does Not Meet Specs
- Overstocked
- Warranty Claim

**Add these for e-commerce:**
- Not as Described on Website
- Arrived Too Late
- Gift Return (no receipt)

---

### Field Configuration

**Customize which fields are shown, required, or hidden.**

**Access:** `Settings > Field Settings`

{{< callout type="info" >}}
**Decision Framework: Which Fields Should I Require?**

Use this table to decide which fields are essential for YOUR business:

| Field | Retail Store | E-Commerce | B2B Distributor | Reason |
|-------|--------------|------------|-----------------|--------|
| **Return Reason** | Required | Required | Required | Track why items come back - essential for all businesses |
| **Serial Number** | Optional | Optional | Required (electronics) | Only if you sell trackable items (laptops, phones, machines) |
| **Batch Number** | Hidden | Hidden | Required (food/pharma) | Only if products have expiry dates or need recalls |
| **Original Invoice** | Optional | Required | Required | B2B and E-commerce need proof of purchase; retail can be flexible |
| **Customer Remarks** | Optional | Optional | Required | B2B customers provide detailed explanations; retail less critical |
| **Photo Upload** | Hidden | Required | Optional | E-commerce can't see item in person; others can inspect physically |
| **Department** | Hidden | Hidden | Required (multi-branch) | Only if you have multiple departments or cost centers |
| **Bin Location** | Required | Optional | Required | Essential if warehouse is organized by bins; optional for small stores |

**Quick Rules:**
- **Start with 3 required fields only**: Return Reason, Quantity, Original Invoice Number
- **Add more requirements gradually** as staff get comfortable
- **Too many required fields = staff frustration** and slower processing
{{< /callout >}}

---

**Why Customize Fields:**
- Simplify forms (hide unused fields)
- Enforce data quality (make fields required)
- Role-based visibility (finance sees cost, sales doesn't)
- Adapt to business process

**Field Types to Configure:**

**Header Fields:**
- Transaction Date (always required)
- Client Document Number (optional/required/hidden)
- Return Reason (required/optional)
- Department (hidden/visible)
- GL Dimension (hidden/visible)
- Remarks (optional)

**Line Item Fields:**
- Item Description (always visible)
- Serial Number (hidden/required/optional)
- Batch Number (hidden/required/optional)
- Bin Location (hidden/visible)
- Costing Details (hidden for sales, visible for finance)
- Profit Margin (hidden for most users)

**Customer Fields:**
- Billing Address (required)
- Shipping Address (optional)
- Phone Number (required/optional)
- Email (required for notifications)

**Field Configuration Options:**

**Visibility:**
- **Always Show**: Field is visible to all users
- **Role-Based**: Show only to specific roles (e.g., cost to finance only)
- **Always Hide**: Field not used

**Required Level:**
- **Required**: Must be filled before saving
- **Optional**: Can be blank
- **Conditional**: Required based on other fields (e.g., Serial Number required if item is serialized)

**Permission:**
- **Read-Only**: Can view but not edit
- **Editable**: Can modify
- **Hidden**: Cannot see at all

**Example Configuration:**

```
Field: Serial Number
- Visibility: Show if item type = "Serialized"
- Required: Yes (if serialized)
- Permission: 
  - Sales: Can view
  - Warehouse: Can edit
  - Finance: Read-only

Field: Cost Price
- Visibility: Hidden
- Permission:
  - Sales: Hidden
  - Warehouse: Hidden
  - Finance: Can view
  - Management: Can view
```

**Benefits:**
- Cleaner user interface
- Faster data entry
- Better data quality
- Role-appropriate access

---

### Workflow Settings

**Configure multi-level approval workflows.**

**Access:** `Settings > Workflow Settings`

{{< callout type="info" >}}
**Decision Framework: Setting Approval Limits**

How much authority should each person have? Use these guidelines:

| Business Size | Sales Staff | Supervisor | Manager | Director/Owner | Rationale |
|---------------|-------------|------------|---------|----------------|-----------|
| **Small Retail (<20 staff)** | RM 0 - 200 | RM 200 - 1,000 | RM 1,000 - 5,000 | Above RM 5,000 | Simple structure, owner involved in major returns |
| **Medium Business (20-100 staff)** | RM 0 - 500 | RM 500 - 3,000 | RM 3,000 - 10,000 | Above RM 10,000 | More delegation, manager handles daily operations |
| **Large Corporation (>100 staff)** | RM 0 - 1,000 | RM 1,000 - 5,000 | RM 5,000 - 20,000 | Above RM 20,000 | Higher thresholds, owner only sees major issues |
| **High-Risk Products (Electronics, Jewelry)** | RM 0 - 100 | RM 100 - 500 | RM 500 - 2,000 | Above RM 2,000 | Lower limits due to fraud risk and high value |

**Special Cases - Require Manager Approval Regardless of Amount:**
- ✅ Returns without original receipt (fraud risk)
- ✅ Returns older than 90 days (outside normal policy)
- ✅ Returns with "Changed Mind" reason for non-refundable items (policy exceptions)
- ✅ Returns involving intercompany transactions (accounting complexity)
- ✅ Returns where restocking fee is waived (policy override)

**Quick Start Recommendation:**
If you're unsure, start conservative:
- Sales Staff: **RM 0 - 300** (low-risk, routine returns only)
- Supervisor: **RM 300 - 1,500** (daily operations)
- Manager: **RM 1,500 - 5,000** (escalations)
- Director: **Above RM 5,000** (major issues)

You can always increase limits later once you build trust and see patterns.
{{< /callout >}}

---

**Covered earlier in:**  [Approval Workflows](#approval-workflows-controlling-the-process)

Additional settings:

**Workflow Rules:**
- Priority rules (high-value returns escalate)
- SLA timers (approve within 24 hours)
- Auto-escalation (if not approved in time)
- Notification frequency

**Approval Limits:**
- Set per-user limit
- Role-based limits
- Branch-based limits

---

### Printable Format Settings

**Design custom print templates for return documents.**

**Access:** `Settings > Printable Format Settings`

**Customizable Documents:**

**1. Return Receipt**
Given to customer when items are received:
- Company logo and info
- Return document number
- Customer details
- Items returned with quantities
- Condition assessment
- Acknowledgment signature section

**2. Credit Note**
Official document for customer accounting:
- Legal document formatting
- Credit note number
- Reference to original invoice
- Item-wise breakdown
- Tax calculations
- Total credit amount
- Terms and conditions

**3. Goods Received Note (GRN)**
Internal warehouse document:
- Items received details
- Serial/batch numbers
- Bin locations
- Inspection results
- Warehouse staff signature

**4. Pick List**
For warehouse to prepare return receiving:
- Expected items
- Quantities
- Serial numbers to verify
- Inspection checklist

**How to Customize:**

**Step 1: Select Template**
- Choose document type
- Select base template (standard/minimal/detailed)

**Step 2: Design Layout**
Drag-and-drop editor:
- Add company logo
- Position fields
- Choose fonts and colors
- Add/remove sections

**Step 3: Configure Fields**
Select which data to print:
- Header info (doc number, date, customer)
- Line items (item code, description, quantity)
- Financial details (prices, taxes, totals)
- Custom fields
- QR code (for mobile scanning)

**Step 4: Preview & Test**
- Generate sample print
- Review layout
- Print test document
- Adjust as needed

**Step 5: Set as Default**
- Save template
- Set as default for document type
- Assign to branches (different templates per branch)

**Advanced Features:**

**Conditional Printing:**
- Print batch numbers only if present
- Show cost only for internal prints
- Different layout for credit vs cash returns

**Multi-Language Support:**
- Templates in multiple languages
- Auto-select based on customer language
- Switch language on print

**Barcode/QR Code:**
- Include document barcode
- QR code for mobile verification
- Serial number barcodes

---

### Permission Settings

**Control who can access and perform actions in the applet.**

**Access:** `Settings > Permission Set Listing`

**Permission Levels:**

- **Create:** Who can create new returns
- **View:** Own returns, branch returns, or all returns
- **Edit:** Creator only, branch staff, or supervisors
- **Delete/Void:** Supervisors, finance, or restricted
- **Approve:** Supervisors (with limits), managers, finance
- **Financial:** View/edit costs, prices, process refunds
- **Settings:** System administrators only

**Pre-defined Roles:**

- **Sales Representative:** Create/view own returns
- **Sales Supervisor:** Create, view branch, approve up to limit
- **Warehouse Staff:** View approved, update goods receipt
- **Finance Officer:** View all, view costs, process settlements
- **Branch Manager:** View/create/edit branch, approve up to limit
- **System Administrator:** Full access

**How to Configure:**

1. Create permission set
2. Set access levels (None, Read, Write, Delete, Approve)
3. Assign to users or roles
4. Test with different user logins

---

### Webhooks

**Integrate with external systems via real-time event notifications.**

**Access:** `Settings > Webhook`

**Available Events:** Return created, submitted, approved, rejected, goods received, settled, voided, credit note generated, refund processed, stock returned

**How to Configure:**

1. **Set Up Webhook** - Add name, URL, select triggering events
2. **Configure Payload** - Choose data to send (document number, customer, items, amounts, status)
3. **Security** - Set up API key, OAuth, or basic authentication
4. **Test** - Send test webhook and verify receiving system

**Features:**
- Retry logic with exponential backoff
- Webhook history and status tracking
- Filter by branch, amount, customer type, or return reason
- Manual retry for failed webhooks

**Use Cases:** Notify CRM on return creation, update e-commerce on refund, send to accounting system, alert inventory system

---

### Feature Visibility

**Control which features are enabled in the applet.**

**Access:** `Settings > Feature Visibility`

**Why Control Feature Visibility:**
- Simplify UI (hide unused features)
- Phased rollout (enable features gradually)
- License control (premium features)
- User training (start simple, add complexity later)

**Features You Can Toggle:**

**Core Features:**
- ☑ Serial Number Tracking (On/Off)
- ☑ Batch Number Tracking (On/Off)
- ☑ Bin Location Management (On/Off)
- ☑ Intercompany Returns (On/Off)

**Advanced Features:**
- ☐ Approval Workflow (can disable for auto-approve)
- ☐ Multi-Currency (if not needed)
- ☐ GL Dimension (if not using)
- ☐ Project Tracking
- ☐ Department Tracking

**Integration Features:**
- ☐ Webhooks
- ☐ File Import
- ☐ File Export
- ☐ API Access

**Financial Features:**
- ☑ Show Cost Prices
- ☑ Show Profit Margins
- ☑ Settlement Processing
- ☑ Credit Note Generation

**How to Configure:**

Simply check/uncheck features:
- ☑ Enabled (feature visible and usable)
- ☐ Disabled (feature hidden from all users)

**Impact of Disabling:**
- Menu items removed
- Related fields hidden
- Processes simplified
- Documentation updated

---

### Branch Settings

**Configure branch-specific return policies and settings.**

**Access:** `Settings > Branch Settings`

**Branch-Level Configuration:**

**Return Policies by Branch:**
```
Head Office Branch:
- Return period: 30 days
- Approval required: Yes
- Restocking fee: 10%

Retail Outlets:
- Return period: 14 days
- Approval required: Only > RM 500
- Restocking fee: 15%

Online Store:
- Return period: 45 days (plus shipping time)
- Approval required: No (for defects)
- Restocking fee: None (online purchases)
```

**Branch-Specific Options:**

**Approval Routes:**
- Different approvers per branch
- Branch manager approval limits
- Regional manager escalation

**Default Settings:**
- Default warehouse per branch
- Default bin locations
- Branch-specific return reasons

**Documentation:**
- Branch-specific print templates
- Branch logo and details
- Local language templates

---

### Release Notes

**View applet version history and new features.**

**Access:** `Settings > Release Notes`

Stay updated on:
- New features added
- Bug fixes
- Performance improvements
- Breaking changes
- Migration guides

---

### Applet Log

**View system activity and audit trail.**

**Access:** `Settings > Applet Log`

**What's Logged:**
- User actions (create, edit, delete, approve)
- System events (auto-approval, workflow routing)
- Integration calls (webhooks, API)
- Errors and exceptions

**Log Details:**
- Timestamp
- User
- Action
- Affected document
- Old value → New value
- IP address
- Browser/device

**Use Cases:**
- Audit compliance
- Troubleshooting errors
- User activity monitoring
- Security investigation
- Data change history

---

## Advanced Features

**Issue Linking:** Link returns to issue tracking systems, defect reports, quality complaints, or warranty claims for full problem history.

**Advanced Costing:** View cost prices, calculate return loss/gain, track margin erosion (Finance/Management only).

**Group Items:** Create return templates with multiple items for fast data entry of common bundles or kits.

**Payment Against Return:** Apply customer payments directly - customer pays for replacement, pays difference for exchange, or deduct from refund.

**Knock-Off Import:** Import automatic settlement data from bank reconciliation or payment gateways for bulk settlement.

**Advanced Search:** Filter by customer, dates, branch, status, amount range, return reason, sales agent, GL dimensions, segments, profit centers, or projects. Save common searches for quick access.

---

## Reporting & Analytics

**Built-In Reports:**

- **Sales Return Summary:** Total returns, return rate, top returned products, top reasons, branch comparison
- **Customer Analysis:** Returns by customer, frequent returners, high-value customer returns
- **Financial Reports:** Return value by period, settlement breakdown, outstanding credit notes, refund processing time
- **Inventory Impact:** Stock returned by item, warehouse volume, damaged vs restockable ratio
- **Approval Analytics:** Pending count, average approval time, approval vs rejection rate

**Custom Reports:**

Use report builder to select fields, apply filters, group/sort data, add calculations, and save as templates. Schedule reports for automatic delivery.

---

## Best Practices

**Sales Teams:**
- Verify customer eligibility and get proof of purchase
- Document return reasons clearly with photos if defective
- Complete all required fields before submission

**Managers:**
- Review returns daily to avoid delays
- Check customer return history for patterns
- Be consistent with policy application

**Warehouse Staff:**
- Inspect items carefully before confirming receipt
- Verify quantities and serial/batch numbers
- Update bin locations accurately

**Finance Teams:**
- Verify goods received before processing refunds
- Apply correct restocking fees per policy
- Reconcile credit notes regularly

**Administrators:**
- Review settings quarterly
- Monitor workflow bottlenecks
- Keep permissions updated as roles change

---

## Integration Points

**ERP Integration:** Automatic GL postings, AR/AP updates, inventory adjustments

**CRM Integration:** Customer return history, service ticket linking, warranty claims

**E-Commerce:** Online return requests, customer portal, auto-refund processing

**Mobile Access:** Mobile-responsive interface, barcode scanning, photo uploads, mobile approvals

---

## Troubleshooting

**Cannot Submit Return:** Check all required fields are filled (marked with red asterisks)

**Return Not Routing to Approver:** Verify workflow settings and approver is assigned and active

**Serial Number Not Found:** Verify serial number from original invoice, check for typos

**Credit Note Not Generated:** Check settlement status and verify accounting integration

**Import File Fails:** Download fresh template, verify data format and required columns

**Intercompany Documents Not Matching:** Check both company records, verify amounts and currency align

---

## FAQs

**Q: What is the difference between voiding and rejecting a return?**  
A: **Reject** means the manager denies the return request (never happened). **Void** means canceling an approved return (was approved but later cancelled).

**Q: Can a customer return part of an order?**  
A: Yes. Simply add line items for the items being returned. You don't need to return everything from the original invoice.

**Q: What happens if the approver is on leave?**  
A: Use delegation feature in Settings > Approval Delegation to assign someone else to approve during their absence.

**Q: Can we have different approval workflows for different branches?**  
A: Yes. Configure branch-specific workflows in Settings > Workflow Settings.

**Q: Can we apply different restocking fees based on return reason?**  
A: Yes. Configure fees per return reason in Settings > Return Reasons (e.g., Defective: 0%, Changed Mind: 10%).

**Q: What happens to returned defective items?**  
A: Set condition as "Defective" and specify a quarantine bin. Items aren't added to available inventory until inspected.

**Q: Can we return items to a different warehouse than the original sale?**  
A: Yes. Select the receiving warehouse during return creation. System handles inter-location transfers.

**Q: Do both companies see intercompany return transactions?**  
A: Yes. System creates linked documents in both companies for reconciliation.

**Q: Can we access the applet from mobile devices?**  
A: Yes. The interface is responsive and works on tablets and smartphones.

**Q: How do we prevent return abuse/fraud?**  
A: Use built-in controls: customer return history tracking, serial number verification, approval workflows, photo requirements, and audit logs.

---

## Glossary

**Simple definitions for technical terms used in this system**

**Approval Workflow**
The chain of people who must say "yes" before a return is accepted. Like getting permission from your supervisor, then their manager, then the director.

**Batch Number**
A code showing which group of products were manufactured together. Example: "BATCH-2024-001" means all items made in January 2024. Important for recalls or quality issues.

**Bin Location**
The specific spot in the warehouse where an item is stored. Like an address for inventory: "Aisle 3, Shelf B, Bin 5."

**Contra Entry**
When you cancel out two debts instead of paying cash. Example: Customer owes you RM 1,000, you owe them RM 500 for a return → Net result: Customer owes RM 500.

**Credit Note**
An official document saying "We owe the customer this much money." Like a gift card they can use on their next purchase instead of getting cash.

**Dead on Arrival (DOA)**
A product that doesn't work when first opened. Common with electronics - the item arrived broken or defective.

**GL (General Ledger)**
The company's main accounting book where all financial transactions are recorded. Like the master ledger for all money in and out.

**Goods Received**
The status when returned items physically arrive back at your warehouse and are inspected. Before this, the return is just approved on paper.

**Intercompany Transaction**
When two companies owned by the same parent company do business with each other. Example: Your retail store returns goods to your manufacturing division.

**QC (Quality Control)**
The process of inspecting products to make sure they meet standards. QC team checks returned items to confirm if they're really defective.

**Quarantine Bin**
A special storage area for items that can't be sold yet. Example: Defective products stored in quarantine until inspected or sent back to supplier.

**Restocking Fee**
A charge for returning items that aren't defective. Example: Customer changed their mind → charge 10% of the price to cover handling costs.

**RMA (Return Merchandise Authorization)**
A number given to authorize a return. Like a ticket number that tracks the return through the entire process.

**Serial Number**
A unique ID for one specific item. Like your phone's IMEI number - no two items have the same serial. Used to track individual products.

**Settlement**
How the customer gets their money back. Options: refund (cash), credit note (store credit), contra (offset invoices), or exchange (swap for different item).

**UOM (Unit of Measure)**
How you count items. Examples: pieces, boxes, kilograms, liters. A return of "10" needs to specify: 10 pieces? 10 boxes? 10 kg?

**Void**
Canceling a document as if it never happened. Different from deleting - voiding leaves a record that it was canceled, showing the audit trail.

**Warranty Claim**
A return of a defective product that's still under warranty (guarantee period). Customer gets a refund or replacement at no cost if within warranty period.

**Write-Off**
Officially recording a loss when returned goods can't be resold. Example: Damaged items worth RM 1,000 are written off as a loss in accounting.

---

{{< callout type="info" >}}
**Still confused by a term?** Contact your system administrator or refer to your company's return policy documentation for specific definitions related to your business.
{{< /callout >}}

---

**Document Version:** 1.0  
**Last Updated:** February 2026
