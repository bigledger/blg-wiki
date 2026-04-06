---
title: "Internal Sales Quotation Applet"
description: "Comprehensive quotation management system for creating professional quotes, pricing proposals, and converting quotes to sales orders"
tags:
- sales-management
- quotation-processing
- pricing-proposals
- sales-workflow
- customer-management
weight: 70
---

## Purpose and Overview

The **Internal Sales Quotation Applet** is a powerful tool designed to streamline the entire quotation creation and management process. It moves beyond simple quote generation by integrating pricing schemes, customer management, approval workflows, and seamless conversion to sales orders.

{{< callout type="info" >}}
**Core Concept**: The system links **what** you're quoting (Items) to **who** you're quoting (Customers) and **how much** to charge (Pricing Schemes), creating professional quotations that can be converted to orders.
{{< /callout >}}

### Introduction to Sales Quotation Strategy

Within the BigLedger ERP ecosystem, the Sales Quotation (SQ) serves as the primary strategic instrument for establishing price floors and locking in trading terms for goods and services. By formalizing a proposal before a transaction is executed, the SQ provides a transparent framework for negotiations, ensuring both the provider and the client remain aligned on fiscal expectations and service delivery scopes.

Architecturally, the SQ is defined as a non-posting document. This is a critical design feature for pre-sales workflows: because the SQ does not trigger journal entries or physical stock deductions, it allows sales teams to issue multiple iterations and refine proposals without compromising the integrity of financial ledgers or inventory accuracy. This non-deductive nature provides the flexibility required for high-frequency quoting environments while maintaining a rigorous audit trail of pre-sale commitments. Once finalized, these terms become the authoritative data source for all subsequent downstream documents.

## Key Features Overview

### Who Benefits from This Applet?

**Sales Representatives:**
- Quick quote creation with professional formatting
- Real-time pricing from price books and schemes
- Easy conversion of quotes to confirmed orders
- Customer-specific pricing visibility
- Template-based quote generation for recurring customers

**Sales Managers:**
- Approval workflow for high-value quotations
- Team performance tracking and quote conversion rates
- Pricing control and discount management
- Quote expiry tracking and follow-up reminders

**Finance & Pricing Teams:**
- Consistent pricing across all quotations
- Price book integration ensures accurate pricing
- Discount approval workflows
- Quote profitability analysis

**Customer Service Teams:**
- Professional quote presentation
- Quick quote retrieval and modification
- Customer communication tracking
- Quote history and comparison

### What Problems Does This Solve?

**The Manual Quotation Process Problem:**

Traditional quotation management relies on Word documents, Excel spreadsheets, and email chains. Common issues include:
- Inconsistent pricing across quotes
- Manual calculations leading to errors
- Lost quotations and poor version control
- Difficult tracking of quote status and conversions
- No centralized quote repository

**The Sales Quotation Applet Solution:**

- **Digital creation** - Generate professional quotes with consistent formatting
- **Automated pricing** - Real-time pricing from price books and schemes
- **Approval workflows** - Route high-value quotes for management approval
- **Complete traceability** - Full history of quote versions and changes
- **Seamless conversion** - Convert approved quotes to sales orders with one click
- **Integration ready** - Connects with sales orders, invoices, and customer management

## Key Features Overview

{{< cards >}}
  {{< card title="Quote Creation" subtitle="Professional quote generation with templates" link="#for-sales-representatives-create-your-first-quotation" >}}

  {{< card title="Pricing Integration" subtitle="Real-time pricing from price books" link="#pricing-integration" >}}

  {{< card title="Approval Workflow" subtitle="Multi-level approval for high-value quotes" link="#approval-settings" >}}

  {{< card title="Quote Conversion" subtitle="Convert quotes to sales orders instantly" link="#quote-conversion-to-orders" >}}

  {{< card title="Quote Templates" subtitle="Reusable quote structures for efficiency" link="#quote-templates" >}}

  {{< card title="Quote Tracking" subtitle="Monitor quote status and conversion rates" link="#quote-tracking--reporting" >}}

  {{< card title="Customer Management" subtitle="Customer-specific pricing and terms" link="#customer-integration" >}}

  {{< card title="Reporting & Analytics" subtitle="Quote performance and conversion analysis" link="#quote-tracking--reporting" >}}
{{< /cards >}}

{{< figure src="/images/internal-sales-quotation-applet/sales-quotation-overview-infographic.png" alt="From Messy Papers to 1-Click Orders: Your Guide to the Sales Quotation Applet" caption="From Messy Papers to 1-Click Orders: The Old Way (manual calculators, inconsistent pricing, lost emails) vs The New Way (digital price books, instant manager approval, 1-click order conversion)." >}}

## Key Concepts

### Understanding the Quotation Framework

Every quotation system must address three fundamental aspects. The Sales Quotation Applet provides structured handling:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is the quote for? | Customer | ABC Corporation, XYZ Trading |
| **What** is being quoted? | Items & Pricing | Product SKU-001, Service Package A |
| **How** is it processed? | Approval & Conversion | Manager approval, Convert to order |

{{< callout type="tip" >}}
**Real-World Example**: A sales rep (WHO) creates a quote for ABC Corp (Customer) for 100 units of Product X (WHAT) at RM 50 each. The system applies customer-specific pricing, routes to manager for approval (HOW), and upon customer acceptance, converts to a sales order.
{{< /callout >}}

### Quotation Hierarchy Structure

Think of the quotation process as a structured flow:

```
Organization
│
├── Customers ──→ WHO is the quote for?
│   │
│   └── Pricing Schemes ──→ WHAT pricing applies?
│       │
│       └── Quote Items ──→ SPECIFIC products/services
│           │
│           └── Price Books ──→ Standard pricing reference
│
└── Approval Workflow ──→ HOW quotes are approved
    │
    └── Quote Expiry ──→ WHEN quotes are valid
```

**Flow Through the Hierarchy:**

1. **Organization**: Company-wide pricing policies
2. **Customer**: Customer-specific pricing and terms
3. **Pricing Scheme**: Applied pricing rules
4. **Quote Items**: Specific products/services quoted
5. **Price Book**: Standard pricing reference
6. **Approval**: Routing to approvers
7. **Expiry**: Validity period

This structure enables:
- **Precise control** over pricing
- **Flexible reporting** by customer, product, or sales rep
- **Clear accountability** for approvals
- **Period-based analysis** for sales performance

### The "Golden Triangle" of Quotations

To effectively manage the system, it is crucial to understand how **Customers**, **Pricing Schemes**, and **Quote Items** work together.

| Component | Analogy | Definition | Example |
|-----------|---------|------------|---------|
| **Customer** | The "Recipient" | The entity receiving the quotation. May have special pricing or terms. | **ABC Corporation** |
| **Pricing Scheme** | The "Rule Book" | The pricing rules that determine how items are priced for this customer. | **Corporate Discount Scheme** |
| **Quote Item** | The "Product" | The actual product or service being quoted. Links to price books for base pricing. | **Product SKU-001**, **Service Package** |

**How they link:**
1. You select a **Customer** (e.g., ABC Corporation).
2. System applies the **Pricing Scheme** assigned to that customer (e.g., 15% corporate discount).
3. You add **Quote Items** (e.g., Product SKU-001).
4. System calculates price: Base price from Price Book × Pricing Scheme discount = Final quoted price.

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Sales Representatives: Create Your First Quotation

**Goal:** Create a professional quotation and send it to a customer in 5 simple steps.

1. **Navigate**: Go to **Sales Quotations** from the sidebar
2. **Create Quote**: Click **"+"** → Select **Customer** → Enter quote reference → **Create**
3. **Add Items**: 
   - Click **"Add Line"**
   - Select **Item** (e.g., "Product SKU-001")
   - System auto-populates **Price** from price book
   - Enter **Quantity** (e.g., 100 units)
   - System calculates **Total** automatically
   - Add **Description** if needed
4. **Review Pricing**: Check that pricing scheme is applied correctly
5. **Submit**: Click **Submit** → Quote goes to manager (if approval required) or becomes **Active**

**What happens next?** You can print or email the quote to the customer. When they accept, convert it to a sales order with one click.

**Pro Tip:** Use quote templates for recurring customers to save time on frequently quoted items.

---

### For Sales Managers: Approve Your First Quotation  

**Goal:** Review and approve sales quotations in 3 steps.

1. **Check Pending**: Go to **Pending Approvals** (you'll see a notification badge)
2. **Review Details**:
   - Click on the quote to open
   - Check: Customer, items, pricing, total amount
   - Verify pricing scheme is correctly applied
   - Review discount levels (if any)
3. **Decide**:
   - **Approve**: Click ✓ **Approve** → Quote becomes active and can be sent to customer
   - **Reject**: Click ✗ **Reject** → Add reason → Sales rep notified
   - **Query**: Click **Query** → Ask for clarification or pricing justification

**Going on Leave?** Set up delegation: `Settings > Quotation Approval Delegation Period` → Select someone to approve on your behalf.

---

### For Admins: Initial System Setup

**Goal:** Get the quotation system ready for sales teams in 6 steps.

**Step 1: Configure Price Books** (`Settings > Price Books`)
- Ensure your **Item Master** has the products or services you quote (quotation items are drawn from here)
- Set up standard pricing for all products in the price book
- Create customer-specific price books if needed
- Define pricing tiers and volume discounts

**Step 2: Set Up Pricing Schemes** (`Settings > Pricing Schemes`)  
- Create pricing rules (e.g., "Corporate Discount 15%")
- Link schemes to customer groups or individual customers
- Define discount structures

**Step 3: Configure Quote Settings** (`Settings > Quotation Settings`)
- Set default quote validity period (e.g., 30 days)
- Define quote numbering sequence
- Configure email templates for quote delivery

**Step 4: Set Up Approvals** (`Settings > Quotation Approval Settings`)
- Define approval chains (Sales Rep → Manager → Director)
- Set conditions (quotes > RM 10,000 need extra approval)
- Configure discount approval limits

**Step 5: Create Quote Templates** (`Settings > Quote Templates`)
- Build reusable quote structures for common scenarios
- Pre-populate items for frequent customers
- Save time on repetitive quotes

**Step 6: Test**
- Create a test quote as a sales rep
- Approve it as a manager
- Convert to order to verify the full flow works

**Ongoing:** Monitor quote conversion rates and adjust pricing schemes based on performance.

---

{{< callout type="tip" >}}
**New to the system?** Start with the basics:
1. Sales reps should explore **Sales Quotations** and create a test quote
2. Managers should check **Pending Approvals** to practice the workflow  
3. Admins should review **Configuration & Settings** below for detailed setup guides
{{< /callout >}}

---

## Pricing Integration

Quotations pull prices automatically from your **price books** and **pricing schemes** so that every quote uses the same, up-to-date rates without manual entry.

### What is Pricing Integration?

Pricing Integration means the applet uses your centralized price books and pricing schemes as the single source of truth for quote prices. When a sales rep adds an item to a quote, the system looks up the price (and any customer discount) and fills it in. This removes manual price entry, reduces errors, and keeps quotes aligned with your pricing policy.

**For Sales Representatives:**
- See correct prices automatically when selecting items
- No need to remember or look up prices manually
- Customer-specific pricing applied automatically
- Volume discounts calculated automatically

**For Sales Managers:**
- Ensure all quotes use approved pricing
- Prevent unauthorized discounting
- Track pricing compliance
- Analyze quote profitability

**For Finance/Pricing Teams:**
- Single source of truth for pricing
- Easy price updates propagate to all quotes
- Pricing scheme performance analysis
- Price book utilization tracking

---

### How Pricing Works in Quotations

**Step 1: Base Price from Price Book**
- Each item has a base price in the Price Book
- This is the standard selling price

**Step 2: Apply Pricing Scheme**
- Customer may have a pricing scheme assigned (e.g., "Corporate Discount 15%")
- System applies scheme rules automatically

**Step 3: Calculate Final Price**
- Base Price × (1 - Discount %) = Quoted Price
- Example: RM 100 × (1 - 0.15) = RM 85

**Step 4: Volume Discounts (If Applicable)**
- Some schemes have volume tiers
- Example: 100+ units = additional 5% discount
- System calculates automatically

**Visual Example:**

```
Product: SKU-001
Base Price (Price Book): RM 100.00
Customer: ABC Corp (Corporate Discount Scheme: 15%)
Quantity: 150 units

Calculation:
- Base Price: RM 100.00
- Customer Discount (15%): -RM 15.00
- Volume Discount (150 units, 5%): -RM 4.25
- Final Quoted Price: RM 80.75 per unit
- Total: RM 12,112.50
```

---

### Key Features

**Real-Time Price Updates:**
- Price book changes reflect immediately in new quotes
- Existing quotes maintain locked prices (unless updated)

**Multi-Currency Support:**
- Quote in customer's preferred currency
- Auto-conversion using current exchange rates
- Currency-specific price books

**Customer-Specific Pricing:**
- Different customers can have different pricing schemes
- VIP customers get premium pricing
- Volume customers get better discounts

**Pricing Override Protection:**
- Managers can override prices (with approval trail)
- System tracks all price changes
- Audit trail for compliance

---

### Common Scenarios

**Scenario 1: Standard Customer Quote**

```
Customer: Regular Customer (No special scheme)
Item: Product SKU-001
Base Price: RM 100
Quantity: 50 units

Result: RM 100 × 50 = RM 5,000 (no discount)
```

**Scenario 2: Corporate Customer with Discount**

```
Customer: ABC Corp (Corporate Discount 15%)
Item: Product SKU-001
Base Price: RM 100
Quantity: 100 units

Calculation:
- Base: RM 100
- Corporate Discount: -15% = RM 85
- Volume Discount (100+): -5% = RM 80.75
- Total: RM 8,075
```

**Scenario 3: Price Override Request**

```
Sales Rep creates quote: RM 5,000
Manager sees: "Price below standard (RM 5,500)"
Manager approves override: "Customer loyalty discount approved"
System records: Override reason and approver
```

---

### Tips for Sales Representatives

✓ **Trust the System**: Prices are automatically correct—no need to manually adjust  
✓ **Check Customer Scheme**: Verify the right pricing scheme is applied  
✓ **Volume Discounts**: Order larger quantities to unlock better pricing  
✓ **Contact Pricing Team**: If prices seem wrong, don't override—contact pricing team first

---

## For Sales Representatives

This section is your personal guide to creating and managing quotations.

### My Quotations - Your Sales Hub

**What is My Quotations?**

This is YOUR workspace—where you create, submit, and track all your quotations. Think of it as your personal quote management center that helps you convert quotes to orders.

**What You Can Do:**
- ✓ Create new quotations
- ✓ Edit draft quotes before submitting
- ✓ Track quote status (Draft → Pending Approval → Active → Converted)
- ✓ View quote conversion history
- ✓ Resend quotes to customers
- ✓ Convert approved quotes to sales orders

{{< figure src="/images/internal-sales-quotation-applet/main-listing.png" alt="Internal Sales Quotation main listing page showing all quotations" caption="Fig 1: Main listing page displaying all quotations with status filters and search functionality" >}}

### Navigating the Sales Quotation Listing & Advanced Filtering

The Sales Quotation listing view serves as the operational command center, providing the visibility required to manage high-volume sales pipelines. Effective data management begins here, where administrative efficiency is optimized through granular search capabilities and lifecycle tracking.

**Advanced Search Parameters**

To isolate specific datasets within the listing, users can utilize the "Advanced Search" parameters detailed in the table below:

| Parameter | Technical Utility |
|-----------|------------------|
| **Branch** | Filters records based on specific business units or geographic locations. |
| **Creation/Transaction Date** | Allows for chronological auditing based on when the record was initiated versus when the transaction occurred. |
| **Posting Status** | Segregates documents by their current lifecycle stage: Draft, Final, Void, or Discarded. |

**Document Status Lifecycle**

Managing the document lifecycle is essential for maintaining a clean sales funnel:

1. **Draft**: The initial creation phase. At this stage, the document is fully mutable, allowing users to modify line-item specifications and refine pricing without affecting the master record.
2. **Final**: The confirmed state. Marking a document as Final indicates that the proposal is locked and ready for conversion to the next phase of the sales cycle.
3. **Void/Discarded**: These statuses are used to remove erroneous data entries or invalid proposals from the active workflow, ensuring they do not clutter reporting or conversion queues.

---

**How to Create a Quotation** (The Complete Journey)

#### Core Document Creation: Step-by-Step Execution

The integrity of the entire sales-to-cash cycle depends on the accuracy of the SQ's "Main Details." Precision at this stage prevents downstream errors during the conversion to Sales Orders or Invoices.

**Execution Steps**

1. **Main Details**: Define the foundational parameters, including Branch, Location, Date, and the assigned Sales Agent. This metadata dictates the reporting and commission structures for the transaction.
2. **Account Selection**: The system offers a dual-mode interface. Users can search for existing accounts or toggle the "Select Mode" and click the Plus (+) icon to register a new customer account directly from the SQ interface.
3. **Line Items**: Users must identify the correct Item Codes, specify Quantities, and establish the Selling Price. These line-item specifications form the basis of the contractual agreement.

**KO4 (Convert From) Logic and Configuration**

The "KO4" functionality enables the conversion of a precursor document, such as a Job Sheet, into an SQ. This ensures data continuity and eliminates redundant entry.

* **Strategic Configuration**: If the SQ is the primary document in your workflow, the KO4 feature should be disabled via settings to minimize UI clutter.
* **Workflow Integrity**: Conversely, if the SQ is the result of a previous activity (e.g., an on-site Job Sheet), KO4 must be enabled to pull data forward. The logic dictates that if the SQ is the start of the chain, KO4 is hidden here but enabled in the target app (such as the Sales Order) to pull data from the SQ.

**Step 1: Create the Quote Header**
1. Click **"Sales Quotations"** from the sidebar
2. Click **"+" (Add New)**
3. Fill in:
   - **Customer**: Select from dropdown (system loads customer details)
   - **Quote Reference**: Auto-generated or manual (e.g., "Q-2024-001")
   - **Quote Date**: Today's date (auto-filled)
   - **Valid Until**: Expiry date (default 30 days)
   - **Currency**: Customer's default currency
4. Click **"Create"**

{{< figure src="/images/internal-sales-quotation-applet/create-form.png" alt="Create quotation form showing header fields" caption="Fig 2: Create quotation form with customer selection, quote reference, dates, and currency fields" >}}

**Editing an existing quotation:** From the main listing, click a draft or existing quote to open the same form with fields pre-filled. Update as needed and save.

{{< figure src="/images/internal-sales-quotation-applet/edit-form.png" alt="Edit quotation form with pre-filled data" caption="Fig 2b: Edit quotation form—same layout as create, with existing quote data loaded" >}}

**Step 2: Add Quote Items**
1. Click **"Add Line"**
2. For each item, enter:
   - **Item Code/Name**: Select from item master
   - **Description**: Auto-filled, can customize
   - **Quantity**: How many units
   - **Unit Price**: Auto-filled from price book (can override with approval)
   - **Discount %**: If applicable
   - **Total**: Auto-calculated
3. System shows pricing breakdown (base price, discounts, final price)

{{< figure src="/images/internal-sales-quotation-applet/add-quote-items.png" alt="Add quote items form showing item selection and pricing" caption="Fig 3: Adding quote items with item selection, quantity, pricing, and discount fields" >}}

{{< figure src="/images/internal-sales-quotation-applet/create-lines.png" alt="Create lines tab showing item selection" caption="Fig 4: Adding items under the Line Items tab within the quotation creation form" >}}

**Pro Tip with Templates:**
- If customer has a quote template, click "Load Template"
- System pre-populates common items
- Saves time on repetitive quotes!

**Step 3: Review & Submit**
1. Check all items and prices
2. Verify total amount is correct
3. Add notes or terms if needed
4. Click **"Submit"**
5. If approval required → Goes to manager
6. If no approval → Quote becomes **Active**

**What Happens Next?**
```
You Submit → Manager Approves → Quote Active → Send to Customer → Customer Accepts → Convert to Order
          ↓
    Email at each step
```

---

**Quote Statuses Explained:**

| Status | What It Means | What You Should Do|
|--------|---------------|-------------------|
| **Draft** | Not yet submitted | Finish adding items and submit |
| **Pending Approval** | Waiting for manager | Nothing—wait for approval |
| **Active** | Approved and ready | Send to customer via email/print |
| **Sent** | Quote sent to customer | Follow up if no response |
| **Accepted** | Customer approved quote | Convert to sales order |
| **Converted** | Quote converted to order | Order created—quote archived |
| **Expired** | Past validity date | Create new quote or extend validity |
| **Rejected** | Manager rejected | Read reason, fix and resubmit |

---

**Common Scenarios:**

**Scenario 1: Standard Product Quote**
```
Customer: ABC Corporation
Items:
- Product SKU-001: 100 units @ RM 50 = RM 5,000
- Product SKU-002: 50 units @ RM 30 = RM 1,500

Total: RM 6,500
Valid: 30 days
Status: Active → Sent to customer → Accepted → Converted to Order
```

**Scenario 2: Service Package Quote**
```
Customer: XYZ Trading
Items:
- Installation Service: 1 unit @ RM 2,000
- Training Package: 1 unit @ RM 1,500
- Annual Support: 1 unit @ RM 3,000/year

Total: RM 6,500
Notes: "Includes 3 months free support"
Status: Approved → Customer reviewing
```

**Scenario 3: Rejected Quote (How to Fix)**
```
Submitted: Quote for RM 15,000
Status: Rejected
Reason: "Discount exceeds approval limit. Request manager override."

What to do:
1. Go to My Quotations
2. Find rejected quote
3. Click "Request Override" or adjust discount
4. Add justification
5. Resubmit → Approved!
```

---

**Tips for Faster Approvals:**

✓ **Check Pricing First**: Ensure prices match price book before submitting  
✓ **Add Justification**: For high discounts, explain why (e.g., "Volume customer, strategic account")  
✓ **Complete Information**: Fill all required fields—incomplete quotes get queried  
✓ **Submit Early**: Don't wait until quote expires—submit as soon as ready  
✓ **Use Templates**: For recurring customers, templates save time

❌ **Common Mistakes:**
- Submitting quotes with wrong customer selected
- Forgetting to check pricing scheme application
- Missing expiry date (quotes expire automatically)
- Not following up on sent quotes

---

### Quote Conversion to Orders

**What is Quote Conversion?**

Once a customer accepts your quotation, you can convert it to a sales order with one click. This eliminates manual re-entry and ensures order details match the quote exactly.

**Why This Matters:**

**For You (Sales Rep):**
- No manual data entry
- Faster order creation
- Guaranteed accuracy (quote = order)
- Better customer experience

**How to Convert:**

**Step 1: Customer Accepts Quote**
- Customer confirms acceptance (via email, phone, or system)
- You mark quote as "Accepted" in system

**Step 2: Convert to Order**
1. Open the accepted quote
2. Click **"Convert to Order"** button
3. System creates sales order with:
   - Same customer
   - Same items and quantities
   - Same prices
   - Same terms
4. Order number generated automatically

{{< figure src="/images/internal-sales-quotation-applet/convert-to-order.png" alt="Quote conversion to sales order interface" caption="Fig 5: Converting an accepted quotation to a sales order with one-click conversion" >}}

**Step 3: Review Order**
- Check order details (should match quote)
- Make any final adjustments if needed
- Confirm order

**What Gets Converted:**
- ✓ Customer information
- ✓ All quote items and quantities
- ✓ Pricing (locked from quote)
- ✓ Terms and conditions
- ✓ Delivery address
- ✓ Payment terms

**What Doesn't Get Converted:**
- ✗ Quote validity date (not needed in order)
- ✗ Quote reference (order gets new number)

---

**Real-World Example:**

```
Quote Q-2024-001:
- Customer: ABC Corp
- Items: 100 units Product X @ RM 50
- Total: RM 5,000
- Status: Accepted

Click "Convert to Order"

Result:
- Order SO-2024-045 created
- Same customer, items, prices
- Order ready for fulfillment
- Quote marked as "Converted"
```

---

**Benefits:**

✓ **Time Savings**: 5-minute conversion vs 30-minute manual entry  
✓ **Accuracy**: Zero transcription errors  
✓ **Traceability**: Order linked back to original quote  
✓ **Customer Satisfaction**: Faster order processing

---

### Financial Integration: Deposits and Contra-ing

Securing a transaction often requires a financial commitment at the quotation stage. The BigLedger architecture handles this by integrating the SQ with the Receipt Voucher app.

**The Contra Mechanism**

The "Contra" process allows for the reconciliation of deposits against a specific quotation. For the system to identify and link these documents, it enforces a strict data matching rule: the Receipt Voucher must share the **Same Branch** and the **Same Account** as the Sales Quotation. This integrity in account selection (established in Section 3) is what enables the system to surface outstanding vouchers for reconciliation.

**Settlement Tab Operations**

The relationship between the SQ and financial documents is managed through two primary actions:

* **Voucher Creation**: Initiating a deposit record directly from the "Settlement" tab.
* **Contra Linking**: Using the "Contra" button to search for and bind existing outstanding Receipt Vouchers that meet the matching criteria.

---

## For Sales Managers

This section helps you manage team quotations efficiently and maintain proper oversight.

### Pending Approvals - Your Action Centre

**What is Pending Approvals?**

This is YOUR task list—all quotations waiting for your decision. Think of it as your approval inbox.

**Why This Matters:**

**For You (Manager):**
- Clear queue of what needs your attention
- Quick approve/reject without digging through emails
- Control over pricing and discounting
- Protect company from unprofitable quotes

**For Your Team:**
- Fast approvals = Happy sales reps
- Delayed approvals = Lost opportunities
- Clear feedback on rejections

---

**How to Approve Quotations (Step-by-Step):**

**Step 1: Open Your Queue**
1. Click **"Pending Approvals"** from sidebar
2. See list of all quotes waiting for you
3. Notice: Red badge number = items pending

{{< figure src="/images/internal-sales-quotation-applet/pending-approvals-page.png" alt="Pending approvals page showing quotes awaiting manager approval" caption="Fig 4: Pending approvals page displaying quotations waiting for manager review and approval" >}}

**Step 2: Review Each Quote**
Click on a quote to see:
- **Sales Rep**: Who created it
- **Customer**: Who it's for
- **Items**: What's being quoted
- **Total Amount**: Quote value
- **Pricing**: Applied pricing scheme
- **Discounts**: Any discounts applied
- **Validity**: How long quote is valid

**Key Things to Check:**
- ✓ Pricing scheme correctly applied
- ✓ Discounts are within policy
- ✓ Customer is valid and active
- ✓ Items are available/in stock
- ✓ Terms are reasonable
- ✓ Quote amount is within sales rep's authority

**Step 3: Make Your Decision**

**Option A: Approve ✓**
1. Click **"Approve"** button
2. Quote becomes **Active**
3. Sales rep gets notification
4. Quote can be sent to customer

**Option B: Reject ✗**
1. Click **"Reject"** button
2. **IMPORTANT**: Type rejection reason
   - Good: "Discount exceeds 20% limit. Please reduce to 15% or request director approval."
   - Bad: "Rejected" (sales rep doesn't know why!)
3. Sales rep gets email with your reason
4. They can fix and resubmit

**Option C: Query ?**
1. Click **"Query"** button
2. Ask for clarification: "Why is discount 25%? Is this a strategic account?"
3. Sales rep responds
4. Quote comes back to you for final decision

---

**Quick Approval Tips:**

**Fast-Track (Bulk Approve):**
- Select multiple small, routine quotes (< RM 5,000)
- Verify pricing looks correct
- Click "Approve All"
- Done in seconds!

**Careful Review (High-Value):**
- Quotes > RM 10,000: Take your time
- Check pricing carefully
- Verify customer creditworthiness
- Confirm with sales rep if unclear

---

**Common Approval Scenarios:**

**Scenario 1: Standard Quote**
```
Sales Rep: Sarah
Customer: Regular Customer
Quote: RM 3,500 - Standard products
Pricing: Standard price book, no discount
Your Decision: Approve ✓ (30 seconds)
```

**Scenario 2: High Discount Request**
```
Sales Rep: John
Customer: New Customer
Quote: RM 15,000 - 25% discount requested
Policy: Max discount 20% without director approval

Your Action:
1. Click Query
2. Message: "Discount exceeds limit. Is this a strategic account? Please justify."
3. John responds: "Yes, potential RM 100K annual account"
4. You approve with note: "Strategic account approved" ✓
```

**Scenario 3: Pricing Error**
```
Sales Rep: Mary
Customer: ABC Corp
Quote: RM 8,000
Issue: Prices don't match price book (too low)

Your Action:
1. Reject
2. Reason: "Prices don't match price book. Please verify and resubmit."
3. Mary checks, fixes prices
4. You approve on resubmission
```

**Scenario 4: Expired Quote Resubmission**
```
Sales Rep: Ahmad
Quote: RM 5,000 - Expired, customer wants to proceed

Your Action:
1. Check original quote (expired 2 weeks ago)
2. Verify customer still interested
3. Approve new quote with same terms
4. Note: "Customer confirmed interest"
```

---

**Best Practices for Managers:**

✓ **Daily Check-In**: Review approvals daily (15 mins) rather than weekly  
✓ **Set Expectations**: Team knows you approve every afternoon  
✓ **Be Consistent**: Same rules for everyone (no favouritism)  
✓ **Clear Rejections**: Always explain WHY—helps sales reps learn  
✓ **Use Delegation**: Going on leave? Delegate approvals to your deputy

**Delegation Setup:**
```
Going on holiday Dec 20-31?
1. Go to: `Settings > Quotation Approval Delegation Period`
2. Delegatee: Select your deputy
3. Period: Dec 20 - Dec 31
4. Save

Result: All your pending approvals auto-route to your deputy
Sales rep experience: No delay!
```

---

### Team Reports - Team Oversight Dashboard

**What is Team Reports?**

This shows ALL quotations from your team members—draft, pending, active, converted, expired. It's your team quotation control centre.

**What You Can See:**

- Every quote created by your team
- Who's quoting what
- Quote conversion rates
- Pricing compliance
- Performance trends

**Why Use This?**

**Performance Monitoring:**
- "My team created 50 quotes this month—how many converted?"
- "Who's creating the most quotes? Who's converting best?"

**Trend Analysis:**
- "Quote conversion rate dropped this month—why?"
- "Average quote value increased—good sign!"

**Pricing Compliance:**
- "Are all quotes using correct pricing schemes?"
- "Any unauthorized discounting?"

---

**How to Use Team Reports:**

**View All Team Quotes:**
1. Click **"Team Reports"**
2. See complete list of subordinate quotes
3. Filter by:
   - Sales rep name
   - Date range
   - Status (Active, Converted, Expired)
   - Customer
   - Amount range

{{< figure src="/images/internal-sales-quotation-applet/reports.png" alt="Team reports dashboard showing all team quotations" caption="Fig 9: Team reports page displaying all quotations from team members with filtering options" >}}

**Example View:**
```
Sales Rep | Quote      | Customer      | Amount    | Status   | Date
----------|------------|---------------|------------|----------|----------
Sarah Tan | Q-2024-001 | ABC Corp      | RM 5,000   | Converted| Dec 15
John Lee  | Q-2024-002 | XYZ Trading   | RM 12,000 | Active   | Dec 18
Mary Wong | Q-2024-003 | DEF Ltd       | RM 3,500  | Expired  | Dec 20
Ahmad Ali | Q-2024-004 | GHI Sdn Bhd   | RM 8,000  | Pending  | Dec 22
```

---

**Powerful Filters & Exports:**

**Monthly Team Summary:**
```
Filter:
- Date Range: Nov 1-30, 2024
- All sales reps
- Status: All

Export to Excel
Result: Complete monthly quotation report
```

**Conversion Rate Analysis:**
```
Filter:
- Date Range: Last 3 months
- Status: Converted vs Active

Calculate:
- Total Quotes: 100
- Converted: 45
- Conversion Rate: 45%
- Target: 50% (need improvement)
```

**Individual Performance Check:**
```
Filter:
- Sales Rep: Sarah Tan
- Year: 2024
- All statuses

See:
- Quotes Created: 120
- Converted: 60
- Conversion Rate: 50% (excellent!)
- Average Quote Value: RM 8,500
```

---

**Real-World Management Scenarios:**

**Scenario 1: Monthly Performance Review**
```
Task: Prepare team quotation report for director

Steps:
1. Team Reports
2. Filter: This month, All statuses
3. Group by: Sales Rep
4. Export to Excel
5. Calculate:
   - Total Quotes: 80
   - Converted: 35
   - Conversion Rate: 43.75%
   - Total Value: RM 450,000

Report to Director: "Team created 80 quotes, 35 converted (44%), RM 450K quoted"
```

**Scenario 2: Low Conversion Alert**
```
Notice: Conversion rate dropped to 30% (target: 50%)

Steps:
1. Team Reports
2. Filter: Last month, Status = Active
3. Check: 20 quotes still active, not converted
4. Action: Follow up with sales reps
5. Result: 8 quotes converted after follow-up
```

**Scenario 3: Pricing Compliance Check**
```
Task: Ensure all quotes use correct pricing

Steps:
1. Team Reports
2. Filter: This month, All quotes
3. Spot check: Randomly review 10 quotes
4. Verify: Pricing schemes correctly applied
5. Result: 1 quote had wrong scheme → Corrected
```

---

**Manager Tips:**

✓ **Weekly 15-Min Review**: Check team quotation patterns  
✓ **Spot Check Pricing**: Randomly verify pricing compliance  
✓ **Trend Analysis**: Compare month-to-month to catch issues  
✓ **Support Your Team**: Proactively help with stuck quotes  
✓ **Conversion Focus**: Track conversion rates, not just quote count

---

## Configuration & Settings

#### System Configuration and KO (Conversion) Logic

The Organization App serves as the administrative engine where document flows and conversion rules are defined. This is where the structural "Source vs. Target" logic is finalized.

**KO Configuration Settings**

Within the Organization App's settings for the SQ applet, administrators define the "KO Configuration." A status indicated by a **Blue Color** confirms that the conversion path is **Enabled**. This configuration dictates the SQ’s ability to act as a source document for Sales Orders or other subsequent transactions, ensuring users adhere to the established organizational workflow.

**Analytical Perspectives**

The system provides two distinct views for data export and tracking:

* **Sales Quotation View**: A transactional, document-based perspective focusing on document numbers and aggregate values.
* **Line Item View**: An itemized, granular perspective that breaks down data by item code, providing insights into specific product performance within the quotation phase.
* **Export Functionality**: Both views support Printable Formats, allowing users to generate physical or PDF copies for client distribution.

#### Quotation Settings (`Settings > Quotation Settings`)

The **Quotation Settings** menu defines how quotations behave system-wide. Think of this as building your organization's "quotation rules".

{{< figure src="/images/internal-sales-quotation-applet/quotation-settings.png" alt="Quotation settings configuration page" caption="Fig 6: Quotation settings page showing system-wide configuration options for quotation behavior" >}}

**Creating Quotation Settings - Field-by-Field Guide:**

| Field | Purpose | Why It Matters | Example |
|-------|---------|----------------|---------|
| **Default Validity Period (Days)** | How long quotes remain valid | Prevents sending expired quotes. Standard is 30 days. | 30 days = quotes expire after 30 days |
| **Quote Numbering Sequence** | Format for quote references | Ensures unique, sequential quote numbers. | Q-2024-001, Q-2024-002 |
| **Auto-Apply Pricing Scheme** | Apply customer scheme automatically | Ensures consistent pricing without manual selection | Yes = Always use customer's assigned scheme |
| **Require Approval Above** | Approval threshold amount | High-value quotes need manager approval | RM 10,000 = quotes above need approval |
| **Allow Price Override** | Can sales reps override prices? | Balance flexibility vs control | Yes, with manager approval |
| **Default Currency** | Standard quote currency | Most quotes use company currency | MYR, USD, SGD |
| **Email Template** | Quote delivery email | Professional quote presentation | Custom template with company branding |

**Advanced Configuration:**

- **Quote Expiry Reminder**: Send reminder X days before expiry
- **Auto-Convert on Acceptance**: Convert to order automatically when customer accepts
- **Require Customer Approval**: Customer must accept quote in system before conversion
- **Lock Prices on Approval**: Prevent price changes after manager approval
- **Show Profit Margin**: Display margin to sales reps (or hide for pricing control)

---

#### Pricing Schemes (`Settings > Pricing Schemes`)

Pricing Schemes define the pricing rules applied to quotations. They determine discounts, volume pricing, and customer-specific rates.

{{< figure src="/images/internal-sales-quotation-applet/pricing-schemes-settings.png" alt="Pricing schemes settings page" caption="Fig 7: Pricing schemes configuration page for managing discount rules and customer-specific pricing" >}}

**Creating a Pricing Scheme - Field Guide:**

| Field | Purpose | Why It Matters | Example |
|-------|---------|----------------|---------|
| **Scheme Name** | Display name | What users see when selecting. Keep it descriptive. | "Corporate Discount 15%", "VIP Pricing" |
| **Scheme Code** | Unique identifier | Used for reporting and integrations | CORP-15, VIP-PREM |
| **Discount Type** | How discount is applied | Percentage vs fixed amount | Percentage (15%) or Fixed (RM 100 off) |
| **Discount Value** | The discount amount | The actual discount percentage or amount | 15% or RM 100 |
| **Volume Tiers** | Quantity-based discounts | Larger orders get better pricing | 100+ units = 5% extra discount |
| **Valid From/To** | Scheme validity period | Time-limited promotions | Jan 1 - Dec 31, 2024 |
| **Applied To** | Which customers/items | Scheme scope | All customers, or specific customer groups |

**Real-World Example:**

Creating a "Corporate Discount Scheme":
1. **Name**: Corporate Discount 15%
2. **Code**: CORP-15
3. **Discount Type**: Percentage
4. **Discount Value**: 15%
5. **Volume Tiers**: 
   - 100+ units: Additional 5%
   - 500+ units: Additional 10%
6. **Applied To**: Corporate Customer Group
7. **Valid**: Jan 1 - Dec 31, 2024

---

#### Quote Templates (`Settings > Quote Templates`)

Quote Templates are reusable quote structures that pre-populate items, pricing, and terms. They save time on repetitive quotations.

**Creating a Template - Field Guide:**

| Field | Purpose | Why It Matters | Example |
|-------|---------|----------------|---------|
| **Template Name** | Display name | What sales reps see when selecting | "Standard Product Package", "Service Bundle A" |
| **Template Code** | Unique identifier | Used for quick lookup | STD-PKG, SVC-BUNDLE-A |
| **Customer** | Default customer | Pre-fills customer (can change) | ABC Corporation |
| **Items** | Pre-populated items | Common items for this template | Product SKU-001, SKU-002, SKU-003 |
| **Default Quantities** | Standard quantities | Typical order quantities | 100 units each |
| **Terms & Conditions** | Standard T&C | Reusable contract terms | "Payment: Net 30, Delivery: 2 weeks" |
| **Description** | Template notes | Helps sales reps understand when to use | "Use for standard corporate customers" |

**How Templates Work:**

1. Sales rep selects template: "Standard Product Package"
2. System creates quote with:
   - Pre-filled customer (can change)
   - Pre-populated items and quantities
   - Applied pricing scheme
3. Sales rep adjusts quantities/prices as needed
4. Submit quote

**Real-World Example:**

**Template: "Corporate Starter Package"**
- Customer: (Select per quote)
- Items:
  - Product A: 50 units
  - Product B: 25 units
  - Service Package: 1 unit
- Pricing: Corporate Discount Scheme
- Terms: Net 30, 2-week delivery
- Use Case: New corporate customers

---

#### Approval Settings (`Settings > Quotation Approval Settings`)

Approval Settings define the "approval chain"—who needs to approve quotations, in what order, and under what conditions.

{{< figure src="/images/internal-sales-quotation-applet/quote-templates.png" alt="Quote templates settings page showing printable formats" caption="Fig 8: Quote templates settings page for configuring printable format options" >}}

**Creating an Approval Setting - Field-by-Field Guide:**

**Basic Configuration:**

| Field | Purpose | Example |
|-------|---------|--------|
| **Name** | Approval workflow name | "Standard Quote Approval", "High-Value Quotes" |
| **Code** | Unique identifier | STD-QUOTE, HIGH-VAL |
| **Approval Type** | Type of workflow logic | Amount-based, Role-based, Customer-based |
| **Threshold Amount** | When this workflow applies | RM 10,000 = quotes above need this approval |
| **Default Approver** | Final fallback approver | Sales Director (for top-level approvals) |

**Approval Types:**

1. **Amount-Based:**
   - Quotes above threshold need approval
   - Example: Quotes > RM 10,000 → Manager approval

2. **Role-Based:**
   - Based on sales rep's role/grade
   - Example: Junior reps need approval for all quotes

3. **Customer-Based:**
   - Specific customers need special approval
   - Example: New customers need manager approval

4. **Discount-Based:**
   - High discounts need approval
   - Example: Discounts > 20% need director approval

**Defining Approval Levels:**

Each approval setting can have multiple levels:

| Level Field | Purpose | Example |
|-------------|---------|---------|
| **Approval Type** | How approvers are selected | Direct Manager, Specific Role, Any from List |
| **No of Approvers** | How many people must approve | 1 (manager only) or 2 (any 2 from finance team) |
| **Role** | Which role approves | Sales Manager, Sales Director |

**Real-World Approval Scenarios:**

**Example 1: Simple 2-Level Approval**

```
Name: Standard Quotes
Type: Amount-based
Threshold: RM 10,000

Level 1: Direct Manager (1 approver needed)
Level 2: Sales Director (for quotes > RM 50,000)

Flow: Sales Rep → Manager → (if > RM 50K) Director → Approved
```

**Example 2: Discount-Based Approval**

```
Name: High Discount Approval
Type: Discount-based
Threshold: 20% discount

Level 1: Direct Manager
Level 2: Sales Director (for discounts > 25%)

Flow: Ensures discount control
```

**Example 3: Customer-Based Approval**

```
Name: New Customer Approval
Type: Customer-based
Applied To: Customers created in last 30 days

Level 1: Direct Manager
Level 2: Credit Manager (credit check)

Flow: New customers need extra scrutiny
```

---

#### Quotation Approval Delegation Period (`Settings > Quotation Approval Delegation Period`)

When managers go on leave, quotation approvals shouldn't get stuck. The Delegation feature temporarily transfers approval rights to another person.

**Creating a Delegation:**

| Field | Purpose | Example |
|-------|---------|--------|
| **Delegator** | Who is delegating (going on leave) | John Tan (Sales Manager) |
| **Delegatee** | Who will approve instead | Mary Lim (Acting Manager) |
| **Start Date** | When delegation begins | Dec 20, 2024 |
| **End Date** | When delegation ends | Jan 5, 2025 |
| **Quote Types** | Which quotations to delegate | All, or specific types only |

**How It Works:**

```
Scenario: John Tan on vacation Dec 20 - Jan 5

Setup:
- Delegator: John Tan
- Delegatee: Mary Lim
- Period: Dec 20 - Jan 5

Result during period:
- All quotes normally routed to John → auto-routed to Mary
- Mary sees them in her "Pending Approvals"
- After Jan 5 → reverts to John automatically
```

**Use Cases:**

1. **Annual Leave**: Manager on 2-week vacation
2. **Medical Leave**: Unexpected absence
3. **Business Travel**: Manager overseas with limited access
4. **Sabbatical**: Extended leave (3-6 months)

**Pro Tips:**
- Set up delegation BEFORE leaving (not during)
- Delegatee should have similar authority level
- For critical periods (year-end close), set up dual delegatees
- System sends notification to both delegator and delegatee when active

---

#### Email Templates (`Settings > Email Template`)

Email templates control the automated notifications sent when quotations change status or are delivered to customers.

**Template Types & When They're Sent:**

| Template | Triggered When | Recipient | Purpose |
|----------|----------------|-----------|----------|
| **Quote Created** | Sales rep creates quote | Sales rep | Confirmation |
| **Quote Approved** | Manager approves quote | Sales rep | Notification |
| **Quote Rejected** | Manager rejects quote | Sales rep | Explain why + next steps |
| **Quote Sent to Customer** | Quote emailed to customer | Customer | Professional quote delivery |
| **Quote Expiring Soon** | X days before expiry | Sales rep | Reminder to follow up |
| **Quote Converted** | Quote converted to order | Sales rep | Confirmation |

**Customizing Templates - Available Fields:**

You can insert dynamic placeholders that auto-populate:

```
{{quote_number}} - Quote reference number
{{customer_name}} - Customer name
{{quote_amount}} - Total quote amount
{{quote_date}} - When quote was created
{{valid_until}} - Quote expiry date
{{sales_rep_name}} - Who created the quote
{{approver_name}} - Who approved it
{{quote_link}} - Direct link to view quote
{{items_list}} - List of quoted items
```

**Example Template - Quote Sent to Customer:**

```
Subject: Quotation {{quote_number}} - {{customer_name}}

Dear {{customer_name}},

Thank you for your interest in our products/services.

Please find attached your quotation {{quote_number}} for {{quote_amount}}.

**Quote Details:**
- Reference: {{quote_number}}
- Amount: {{quote_amount}}
- Valid Until: {{valid_until}}
- Prepared by: {{sales_rep_name}}

You can view the full quotation here: {{quote_link}}

If you have any questions or would like to proceed, please contact us.

Best regards,
{{sales_rep_name}}
Sales Team
```

**Best Practices:**

1. **Be Professional**: Use company branding and professional tone
2. **Include Actions**: What should the customer do next?
3. **Add Links**: Direct link to the quote saves time
4. **Set Expectations**: When does the quote expire? What happens next?
5. **Personal Touch**: Include sales rep name for relationship building

---

## Reporting & Audit

#### Reports

- **My Quotations**: Personal dashboard (sales reps)—all your quotes, status, conversion rate
- **Pending Approvals**: Manager dashboard—quotes awaiting your decision
- **Team Reports**: Team oversight—all quotations from your team, conversion rates, performance

---

#### Key Metrics to Track

**Conversion Rate:**
- Formula: (Converted Quotes / Total Quotes) × 100
- Target: 40-50% is good, 60%+ is excellent
- Use: Measure sales effectiveness

**Average Quote Value:**
- Formula: Total Quote Value / Number of Quotes
- Use: Understand quote size trends

**Quote Cycle Time:**
- Formula: Average days from creation to conversion
- Target: 7-14 days is typical
- Use: Identify bottlenecks

**Win Rate by Sales Rep:**
- Compare conversion rates across team
- Use: Performance management and training

#### Audit Trail (`Settings > Applet Log`)

A "black box" recording every system action on quotations.

- **Who**: User ID (who created, edited, approved, or converted the quote)
- **What**: Action (Create, Edit, Submit, Approve, Reject, Convert to Order)
- **When**: Timestamp
- **Data**: Before and After values (useful for pricing overrides and status changes)

{{< figure src="/images/internal-sales-quotation-applet/audit-trail.png" alt="Audit trail showing the applet log with quotation history" caption="Fig 9: Audit trail displaying the complete history of actions performed on quotations" >}}

Use this for compliance checks, dispute resolution, and understanding who changed a quote and when.

---

## Personalization, Settings, and User Permissions

To maximize user productivity, BigLedger provides tools to simplify the interface and automate repetitive tasks, balancing system power with a streamlined user experience.

#### Interface Optimization and "Settings"

The Settings tab allows administrators to hide non-used or unused information—such as the KO4 tab, attachment fields, or specific columns—to reduce the cognitive load on the end-user. By removing irrelevant UI elements, the system ensures that sales personnel focus only on essential data entry.

#### Personalization: The "Gracia" Use Case

The Personalization menu allows for "Default Selection" configurations that significantly accelerate document creation.

* **Example**: A user (e.g., "Gracia") may have permissions to access multiple branches but primarily operates out of one. By setting a **Default Branch** in Personalization, the system automatically populates the branch and location data whenever they create a new SQ, eliminating the need for manual selection and preventing erroneous data entry.

#### Permissions and Security

Security is enforced through **Permission Sets**. Administrators assign specific visibility and action rights (e.g., the right to "Finalize" a document or view "Branch B" records) to different user roles. This ensures that while the system is flexible, data access remains strictly governed by organizational hierarchy.

#### Quote Templates as Favorites

Use **Quote Templates** (`Settings > Quote Templates`) to save reusable quote structures for frequent customers or standard packages. Load a template when creating a new quote to pre-populate items and terms—saving time on repetitive quotations.

#### Default Settings

Set your default **Customer**, **Currency**, or **Valid Until** period in your user or branch settings (if available) to speed up quote creation. Check with your admin for organization-specific options.

As the foundational, non-deductive starting point for the BigLedger sales cycle, the Sales Quotation applet provides the necessary tools to establish the terms of trade with precision and professional integrity.

---

## FAQ

**Q: Why can't I see a specific pricing scheme when creating a quote?**
A: The pricing scheme might not be assigned to the selected customer, or it may have expired. Check customer settings or contact your admin.

**Q: How do I extend a quote's validity period?**
A: If the quote is still Active, you can edit it and change the "Valid Until" date. If it's already expired, create a new quote with updated terms.

**Q: What happens if I convert a quote to an order but prices have changed?**
A: The system locks prices from the quote when converting. The order will use the quoted prices, not current price book prices. This protects both you and the customer.

**Q: Can I convert an expired quote to an order?**
A: Yes, but you may want to create a new quote first to confirm current pricing and terms with the customer. Expired quotes can be converted, but it's best practice to refresh them first.

**Q: How do I track which quotes converted to orders?**
A: Go to **Reporting & Audit > Reports**. Use **My Quotations** (sales reps) or **Team Reports** (managers) and filter by status **Converted**. You can also see the linked order number on the quote detail page.

**Q: What's the difference between a quote template and a pricing scheme?**
A: A **template** pre-populates items and structure for quick quote creation. A **pricing scheme** defines the pricing rules (discounts, tiers) applied to quotes. Templates save time; schemes control pricing.

**Q: Can I edit a quote after it's been sent to the customer?**
A: Yes, but it's best practice to create a revised quote (new version) rather than editing the sent one. This maintains a clear audit trail of what was actually sent to the customer.

**Q: How do I handle a customer who wants to negotiate the quote?**
A: Create a revised quote with the negotiated terms. The system maintains history, so you can compare original vs revised quotes. Once agreed, convert to order.

**Q: Where do I see why my quote was rejected?**
A: Open the rejected quote from **My Quotations** and check the **Rejection Reason** or comments section. You should also receive an email with the reason. Use this feedback to adjust the quote and resubmit.

**Q: How do I print or export a quote to send to the customer?**
A: Open the quote and use the **Print** or **Export PDF** action (location may vary by deployment). The quote will show with your company branding if configured in **Quotation Settings**. You can also use the **Email** action to send the quote directly from the system.

**Q: I'm a manager going on leave. How do I delegate quote approvals?**
A: Go to **Settings > Quotation Approval Delegation Period**. Select the **Delegatee** (person who will approve on your behalf), set the **Start** and **End** dates, and save. All pending approvals will route to them during that period.
