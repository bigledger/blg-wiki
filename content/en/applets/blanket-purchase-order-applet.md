---
title: "Blanket Purchase Order Applet"
description: "Long-term purchase agreements and recurring supplier contracts with release management"
tags:
- procurement
- purchase-agreements
- supplier-management
- contract-purchasing
- cost-control
weight: 200
---

## Purpose and Overview

The **Blanket Purchase Order Applet** streamlines the management of long-term purchase agreements with suppliers. Instead of creating individual purchase orders for recurring needs, you establish a single agreement covering multiple deliveries over time—saving administrative effort, negotiating better prices through volume commitment, and simplifying supplier relationships.

{{< callout type="info" >}}
**Core Concept**: A Blanket PO is like a "purchasing credit line" with a supplier—you agree on terms, prices, and total value upfront, then make individual releases as needed without renegotiating each time.
{{< /callout >}}

### What is a Blanket Purchase Order?

Think of it as a **standing agreement** with your supplier:

**Traditional Approach (Without Blanket PO):**
```
Month 1: Create PO #001 for office supplies → Negotiate → Approve → Order
Month 2: Create PO #002 for office supplies → Negotiate → Approve → Order
Month 3: Create PO #003 for office supplies → Negotiate → Approve → Order
```
*Result: Repetitive work, inconsistent pricing, high admin overhead*

**Blanket PO Approach:**
```
Jan 1: Create Blanket PO #2024-OFFICE-SUPPLIES
       Agreement: $50,000 over 12 months
       Pre-negotiated prices for 200+ items
       
Then throughout the year:
Week 5: Release $1,200 → Paper, pens, folders
Week 12: Release $800 → Toner cartridges
Week 20: Release $1,500 → Office chairs
```
*Result: One-time negotiation, consistent pricing, minimal admin work*

---

### Why Use Blanket Purchase Orders?

**Problem Solved:**

Traditional procurement involves repetitive PO creation for regular purchases—t same supplier, similar items, predictable needs. This creates:
- ❌ Redundant administrative work
- ❌ Inconsistent pricing (no volume leverage)
- ❌ Slow response to urgent needs (approval delays)
- ❌ Poor spend visibility (scattered across many small POs)
- ❌ Weak supplier relationships (transactional, not strategic)

**Benefits:**

✓ **Reduce Admin Work** — Create once, release many times  
✓ **Better Pricing** — Volume commitment = supplier discounts  
✓ **Faster Fulfillment** — Pre-approved, just release and deliver  
✓ **Budget Control** — Fixed maximum spend with real-time tracking  
✓ **Simplified Compliance** — One contract, one approval, many transactions  
✓ **Stronger Supplier Partnerships** — Long-term commitment builds trust

---

## Key Features Overview

- **Long-term agreements** — Define 3-month, 6-month, or yearly purchase contracts
- **Maximum value contracts** — Set spending caps with automatic tracking
- **Release management** — Create multiple delivery releases against one agreement
- **Pre-negotiated pricing** — Lock in prices for the contract duration
- **Multi-item contracts** — Cover multiple SKUs in a single blanket PO
- **Validity period tracking** — Monitor active, expiring, and expired agreements
- **Spend monitoring** — Track committed vs. available balance in real-time
- **Flexible releases** — Release full quantities or partial amounts as needed
- **Supplier relationship** — Build long-term partnerships with preferred vendors
- **Audit trail** — Complete history of all releases against each agreement

{{< cards >}}
  {{< card title="BPO Listing" subtitle="Manage all blanket purchase orders in one place" link="#blanket-purchase-order-listing---your-agreements-dashboard" >}}
  {{< card title="Line Items" subtitle="Define products and services covered by the agreement" link="#line-items---what-youre-buying" >}}
  {{< card title="Releases" subtitle="Create delivery authorizations against the blanket PO" link="#doc-link---tracking-releases-and-related-documents" >}}
  {{< card title="Supplier Info" subtitle="Manage supplier details and contact information" link="#for-procurement-staff-create-your-first-blanket-po" >}}
  {{< card title="Department" subtitle="Allocate costs to specific cost centers" link="#department-assignment" >}}
  {{< card title="Settings" subtitle="Configure defaults, formats, and permissions" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/blanket-purchase-order-applet/blanket-po-old-way-vs-new-way.png" alt="The Old Way vs The New Way: Traditional PO process compared to Blanket PO approach" caption="From Repetitive Orders to Smart Agreements: The Old Way (create PO every time, renegotiate prices, wait for approval) vs The New Way (one agreement, pre-approved terms, instant releases)." >}}

---

## Key Concepts

### Understanding the Blanket PO Framework

Every blanket purchase order must establish three fundamental agreements. The Blanket Purchase Order Applet provides structured handling:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is the supplier? | Supplier / Account | ABC Office Supplies Ltd. |
| **What** are we buying? | Line Items with agreed prices | Paper (RM 25/box), Pens (RM 15/pack), Toner (RM 120/unit) |
| **How** is it managed? | Agreement terms & releases | Max RM 50,000, valid Jan-Dec 2024, release as needed |

{{< callout type="tip" >}}
**Real-World Example**: A manufacturing company creates a Blanket PO with their steel supplier for RM 2,000,000 over 12 months. They agree on prices for 10 steel grades. Throughout the year, they release steel as production demands—sometimes weekly, sometimes daily—without renegotiating or creating new POs.
{{< /callout >}}

### Blanket PO Lifecycle

```
Annual Planning
│
├── Create Blanket PO ──→ WHO supplies and WHEN is it valid?
│   │
│   └── Main Details (Supplier, Validity Period, Max Value, Reference)
│       │
│       └── Account (Supplier entity, Contact person, Delivery address)
│
├── Line Items ──→ WHAT can be purchased?
│   ├── Item Details (code, description, agreed unit price)
│   ├── Maximum quantity (optional)
│   └── Item-specific terms
│
└── Throughout the Period ──→ HOW are purchases made?
    ├── Release #1 (deliver 500 units to Warehouse A)
    ├── Release #2 (deliver 300 units to Branch B)
    └── Release #N (continue until budget exhausted or period ends)
```

**Flow Through the Lifecycle:**

1. **Agreement Creation**: Procurement negotiates terms and creates the Blanket PO
2. **Approval**: Management approves the maximum spend and period
3. **Activation**: Blanket PO is finalized and becomes active
4. **Release Cycle**: Requesting departments create releases as needed
5. **Delivery & Receipt**: Goods delivered and received against each release
6. **Spend Tracking**: System tracks cumulative spend vs. maximum value
7. **Contract Closure**: At period end, review utilization and renew or close

This structure enables:
- **Centralized negotiation** — One team handles pricing for all departments
- **Decentralized execution** — Departments release as needed without bottlenecks
- **Budget certainty** — Maximum spend is locked, preventing overruns
- **Supplier confidence** — Long-term commitment encourages better service
- **Fast turnaround** — Pre-approved releases ship immediately

### The "Agreement Triangle"

To effectively manage blanket purchase orders, understand how **Line Items**, **Releases**, and **Spend Tracking** work together:

| Component | Analogy | Definition | Example |
|-----------|---------|------------|---------|
| **Blanket PO Header** | The "Contract" | The overall agreement with terms, supplier, and maximum value | BPO-2024-001: ABC Supplies, RM 50,000, Jan-Dec 2024 |
| **Line Item** | The "Price List" | Specific products/services covered with agreed prices | Paper at RM 25/box, Pens at RM 15/pack |
| **Release/Call-Off** | The "Delivery Order" | Individual purchase transaction against the agreement | Release 100 boxes of paper to Warehouse (RM 2,500) |

**How they link:**
1. You create a **Blanket PO Header** (Supplier, Period, Max Value).
2. You add **Line Items** (products with negotiated prices).
3. As needs arise, you create **Releases** (specific quantities to deliver).
4. The system tracks cumulative spend against the maximum value.
5. When the maximum is reached or period expires, the agreement closes.

---

## Quick Start Guide

Get up and running quickly with these role-specific workflows.

### For Procurement Staff: Create Your First Blanket PO

**Goal:** Establish a long-term purchase agreement with a supplier in 7 steps.

1. **Navigate**: Go to **Blanket Purchase Order** from the sidebar
2. **Create New**: Click **"+"** → A blank Blanket PO form opens
3. **Fill Main Details**:
   - Enter **Document Number** (or use auto-numbering)
   - Set **Transaction Date** to today
   - Set **Valid From** and **Valid To** dates (e.g., Jan 1 - Dec 31, 2024)
   - Enter **Reference** (e.g., "2024 Office Supplies Agreement")
   - Set **Maximum Amount** (e.g., RM 50,000)
   - Select **Branch** and **Location**
4. **Select Supplier**: Go to **Account** tab → Search and select supplier (e.g., "ABC Office Supplies Ltd.")
5. **Add Line Items**: Go to **Lines** tab → Click **"Add Line Item"**:
   - Select item code (e.g., "A4 Paper - 80gsm")
   - Enter agreed **Unit Price** (e.g., RM 25.00)
   - Optional: Enter **Maximum Quantity** if applicable
   - Repeat for all items covered by the agreement
6. **Assign Department** (Optional): Go to **Department** tab → Assign cost center or department code
7. **Finalize**: Review all details → Click **FINAL** → Blanket PO is active

{{< figure src="/images/blanket-purchase-order-applet/bpo-listing.png" alt="Blanket Purchase Order Listing showing agreement summary with Supplier, Valid From/To, Maximum Amount, and Status columns" caption="BPO Listing: View all purchase agreements with validity periods and spend tracking at a glance" >}}

**What happens next?** The Blanket PO is now active. Authorized staff can create releases against it. The system tracks cumulative spend and prevents releases exceeding the maximum value.

**Pro Tip:** Always set a realistic **Maximum Amount** based on historical spend data. Over-estimating locks budget unnecessarily; under-estimating requires frequent renewals.

---

### For Requesting Departments: Create a Release Against Blanket PO

**Goal:** Order goods from an active Blanket PO in 4 steps.

1. **Find Active Blanket PO**: Go to **Blanket Purchase Order Listing** → Filter by Supplier or Item
2. **Open the Agreement**: Click on the relevant Blanket PO → View available balance
3. **Create Release**:
   - Go to **Doc Link** tab
   - Click **"Create Release"** or **"Create Purchase Order"**
   - System pre-fills supplier and pricing from Blanket PO
   - Enter required quantity and delivery location
4. **Submit**: Release goes to supplier → Goods delivered → Receive via GRN

**Pro Tip:** Check the **Available Balance** before creating a release. If the Blanket PO is nearly exhausted, coordinate with Procurement for renewal before ordering.

---

### For Procurement Managers: Monitor Agreement Utilization

**Goal:** Track spend and identify expiring agreements in 3 steps.

1. **Review Active Agreements**: Go to **Blanket Purchase Order Listing** → Filter by Status: "Active"
2. **Check Utilization**:
   - Review **Committed Amount** vs. **Maximum Amount** for each agreement
   - Identify agreements with < 20% utilization (underused) or > 90% (near exhaustion)
   - Check **Valid To** dates to spot expiring agreements (< 30 days remaining)
3. **Take Action**:
   - **Underused**: Investigate why departments aren't utilizing the agreements
   - **Near Exhaustion**: Coordinate renewal or increase maximum amount
   - **Expiring Soon**: Renew if needed, or let expire and create new agreement with updated terms

**Going on Leave?** Delegate Blanket PO approval authority to your deputy to avoid blocking urgent releases.

---

### For Finance Teams: Budget Control and Reporting

**Goal:** Monitor procurement spend against approved budgets.

1. **Access Blanket PO Reports**: Go to **Reports** or **Blanket PO Listing**
2. **Filter by Department/Branch**: See committed spend by cost center
3. **Export for Analysis**: Download to Excel for detailed budget variance analysis
4. **Review Releases**: Check **Doc Link** tab on each Blanket PO to see all releases and their status

**What to Watch For:**
- Blanket POs approaching 100% utilization (may need budget increase approval)
- Expired Blanket POs with open releases (clean up or extend agreement)
- Duplicate agreements with the same supplier (consolidation opportunity)

---

### For Admins: Initial System Setup

**Goal:** Get the Blanket PO system ready for your team in 5 steps.

**Step 1: Configure Default Branch and Location** (`Settings > Default Selection`)
- Set the default branch and location for new Blanket POs
- Reduces data entry time for procurement staff

**Step 2: Set Up Field Configuration** (`Settings > Application Settings`)
- Toggle which fields are required, optional, or hidden
- Customize the Blanket PO form for your workflow

**Step 3: Add Printable Formats** (`Settings > Printable Format Settings`)
- Upload templates for Blanket PO documents
- Enable procurement to send professional PDFs to suppliers

**Step 4: Configure Permissions** (`Settings > Permissions`)
- Define who can create, approve, and release Blanket POs
- Typically: Procurement creates, Managers approve, Departments release

**Step 5: Test End-to-End**
- Create a test Blanket PO as procurement staff
- Create a test release as a department user
- Verify approval workflow and reporting

**Ongoing:** Review utilization reports monthly to optimize agreement management.

---

{{< callout type="tip" >}}
**New to Blanket POs?** Start small:
1. Procurement should create 1-2 agreements with high-volume suppliers (office supplies, consumables)
2. Train 2-3 department users on creating releases
3. Monitor utilization for 1-2 months and refine processes
4. Gradually expand to more suppliers and categories
{{< /callout >}}

---

## Blanket Purchase Order Listing - Your Agreements Dashboard

**What is the BPO Listing?**

This is your central command center for all purchase agreements—active, expired, and draft. Think of it as your "contract portfolio view."

{{< figure src="/images/blanket-purchase-order-applet/bpo-listing-with-filters.png" alt="Blanket Purchase Order Listing with filters showing Active, Expired, and Near Exhaustion tabs" caption="BPO Listing: Filter by status, supplier, or validity period to manage your agreement portfolio" >}}

**What You Can Do:**
- ✓ View all Blanket POs with status (Draft, Active, Expired, Voided)
- ✓ Filter by supplier, branch, department, or validity dates
- ✓ See spend utilization (Committed Value vs. Maximum Value)
- ✓ Identify expiring agreements (< 30 days remaining)
- ✓ Create new Blanket POs or edit drafts
- ✓ Generate reports on agreement utilization

---

**Key Columns Explained:**

| Column | What It Means | Why It Matters |
|--------|---------------|----------------|
| **Document No** | Unique Blanket PO number | Reference for releases and reporting |
| **Supplier** | Agreement partner | Quick identification of supplier relationships |
| **Valid From / To** | Contract period | Spot expiring agreements at a glance |
| **Maximum Amount** | Spending cap | Budget control—cannot exceed this |
| **Committed Amount** | Total releases to date | Real-time spend tracking |
| **Available Balance** | Remaining budget | Know how much you can still spend |
| **Status** | Agreement state | Draft / Active / Expired / Voided |
| **Final Date** | When agreement was activated | Audit trail|

---

**Common Scenarios:**

**Scenario 1: Finding an Agreement to Release Against**
```
Task: Department needs to order office supplies

Steps:
1. Open Blanket Purchase Order Listing
2. Filter: Supplier = "ABC Office Supplies"
3. Check: Status = "Active" and Available Balance > 0
4. Open agreement → Create release
```

**Scenario 2: Identifying Expiring Agreements**
```
Task: Avoid disruption from expired contracts

Steps:
1. Open BPO Listing
2. Filter: Valid To = "Next 30 days"
3. Review list of expiring agreements
4. Contact suppliers to renew critical agreements
5. Create new Blanket POs with updated terms
```

**Scenario 3: Per Utilization Review**
```
Task: Identify underused agreements (wasted effort)

Steps:
1. Open BPO Listing
2. Calculate: Committed Amount / Maximum Amount
3. Flag agreements with < 20% utilization after 3+ months
4. Investigate: Why isn't the department using it?
5. Action: Either promote usage or cancel and free up budget
```

---

**Best Practices:**

✓ **Review Weekly**: Spend 15 minutes checking expiring agreements and utilization  
✓ **Use Filters**: Don't scroll—filter by supplier or department to find what you need  
✓ **Monitor Near-Exhaustion**: Agreements at > 90% utilization may need urgent renewal  
✓ **Clean Up Drafts**: Delete or finalize draft Blanket POs older than 30 days

---

## Line Items - What You're Buying

**What are Line Items?**

Line items define **what products or services** are covered by the Blanket PO and at **what pre-negotiated prices**. This is your "shopping catalog" for the agreement period.

{{< figure src="/images/blanket-purchase-order-applet/bpo-add-line-items.png" alt="Blanket PO Line Items form showing Item Code, Description, Unit Price, and Maximum Quantity fields" caption="Add Line Items: Define products, prices, and optional quantity limits for the agreement" >}}

**Key Fields:**

| Field | Purpose | Example |
|-------|---------|---------|
| **Item Code** | Product/service identifier | PAPER-A4-80GSM |
| **Description** | What it is | A4 Paper - 80gsm White |
| **Unit Price** | Agreed price per unit | RM 25.00 per box (500 sheets) |
| **UOM** | Unit of measure | Box, Each, Kg, Litre |
| **Maximum Quantity** (Optional) | Quantity cap for the period | 1,000 boxes (prevents over-ordering) |
| **Tax Code** | Applicable tax | SST, VAT, GST |

---

**How Line Items Work:**

**Without Maximum Quantity:**
- You can release unlimited quantities (up to the overall Blanket PO maximum value)
- Example: "Paper at RM 25/box" — release as much as you need until RM 50,000 total is reached

**With Maximum Quantity:**
- You set a specific quantity limit for that item
- Example: "Paper at RM 25/box, max 1,000 boxes" — system prevents releasing more than 1,000 boxes even if budget remains

**When to Use Maximum Quantity:**
- When supplier offers volume discounts only up to certain quantities
- When storage space limits how much you can receive
- When you want to force variety (don't spend entire budget on one item)

---

**Adding Line Items:**

**Step-by-Step:**

1. Go to **Lines** tab in the Blanket PO
2. Click **"Add Line Item"**
3. **Select Item**: Choose from inventory master or enter custom description
4. **Enter Unit Price**: The negotiated price (this locks the price for all releases)
5. **Set UOM**: Ensure it matches your inventory unit
6. **Optional - Set Maximum Quantity**: If you want a quantity cap
7. **Set Tax Code**: Select applicable tax treatment
8. **Save** → Line item added to agreement

**Repeat** for all products/services covered by the Blanket PO.

---

**Common Scenarios:**

**Scenario 1: Office Supplies Agreement (No Quantity Limits)**
```
Blanket PO: ABC Office Supplies - RM 50,000 - 12 months

Line Items:
1. A4 Paper (500 sheets/box) - RM 25.00/box - No max qty
2. Ballpoint Pens (12/pack) - RM 15.00/pack - No max qty
3. Staples (1000/box) - RM 8.00/box - No max qty
4. Folders (10/pack) - RM 20.00/pack - No max qty

Usage: Departments release as needed until RM 50,000 total is spent
```

**Scenario 2: Steel Supply Agreement (With Quantity Limits)**
```
Blanket PO: XYZ Steel Ltd - RM 2,000,000 - 6 months

Line Items:
1. Steel Grade A (per tonne) - RM 3,500/ton - Max 400 tons
2. Steel Grade B (per tonne) - RM 3,200/ton - Max 300 tons
3. Steel Rebar (per tonne) - RM 2,800/ton - Max 200 tons

Rationale: Supplier offers these prices only up to specified volumes; 
beyond that, pricing changes or availability uncertain.
```

**Scenario 3: IT Services Agreement (Service-Based)**
```
Blanket PO: Tech Solutions Inc - RM 120,000 - 12 months

Line Items:
1. Server Maintenance (per hour) - RM 200/hour - Max 400 hours
2. Help Desk Support (per ticket) - RM 50/ticket - No max
3. Network Cabling (per point) - RM 150/point - Max 200 points

Usage: IT department releases as projects arise
```

---

**Tips for Defining Line Items:**

✓ **Be Specific**: "A4 Paper - 80gsm White" is better than "Paper"  
✓ **Lock Competitive Prices**: Once unit price is in the Blanket PO, it won't change even if market prices rise  
✓ **Use Maximum Quantities Strategically**: For items where you want to force supplier re-negotiation if volumes exceed forecast  
✓ **Include Common Variants**: Don't create a new Blanket PO for every minor variation—add multiple line items  
✓ **Review Periodically**: If an item is never released, remove it on renewal to.simplify the agreement

---

## Doc Link - Tracking Releases and Related Documents

**What is Doc Link?**

The **Doc Link** tab shows all **releases** (call-offs, delivery orders, or purchase orders) created against this Blanket PO. It's your transaction history—connecting the master agreement to actual purchases.

{{< figure src="/images/blanket-purchase-order-applet/bpo-doc-link-releases.png" alt="Doc Link tab showing list of releases against the Blanket PO with Release No, Date, Amount, and Status" caption="Doc Link: Track every release made against the Blanket PO agreement" >}}

**What You Can See:**
- ✓ All releases created from this Blanket PO
- ✓ Release dates and amounts
- ✓ Cumulative spend vs. available balance
- ✓ Status of each release (Draft, Sent, Received, Invoiced)
- ✓ Quick navigation to release documents

---

**Common Release Scenarios:**

**Scenario 1: Department Creates a Release**
```
Active Blanket PO: Office Supplies - RM 50,000 total
Current Committed: RM 12,000
Available Balance: RM 38,000

Department Action:
1. Open Blanket PO → Doc Link tab
2. Click "Create Release" or "Create Purchase Order"
3. System pre-fills:
   - Supplier: ABC Office Supplies
   - Pricing: From Blanket PO line items
4. Enter quantities needed:
   - 50 boxes of A4 Paper @ RM 25 = RM 1,250
   - 20 packs of Pens @ RM 15 = RM 300
   Total Release: RM 1,550
5. Submit → Supplier receives order

Updated Blanket PO:
- Committed: RM 13,550 (was RM 12,000)
- Available: RM 36,450 (was RM 38,000)
```

**Scenario 2: Tracking Multiple Releases Over Time**
```
View in Doc Link Tab:

Release #1 - Jan 15 - RM 1,200 - Status: Received
Release #2 - Jan 28 - RM 800 - Status: Invoiced
Release #3 - Feb 10 - RM 1,550 - Status: Sent
Release #4 - Feb 22 - RM 950 - Status: Draft
...

Total Released: RM 13,550 of RM 50,000 (27% utilized)
```

---

**Key Benefits of Doc Link Tracking:**

✓ **Complete Audit Trail**: See every transaction against the agreement  
✓ **Spend Visibility**: Real-time tracking of committed vs. available budget  
✓ **Fast Navigation**: Click on any release to view or edit details  
✓ **Status Monitoring**: Know which releases are pending, received, or invoiced  
✓ **Supplier Performance**: Identify delivery delays or issues by tracking release fulfillment

---

**Tips:**

✓ **Review Regularly**: Check Doc Link tab weekly to monitor utilization patterns  
✓ **Close Old Releases**: Mark completed releases as "Closed" to keep the list clean  
✓ **Use Release References**: Add clear references (e.g., "Manufacturing Floor - Week 8") for easy tracking  
✓ **Monitor Pending**: Follow up on releases stuck in "Sent" status for too long

---

## Department Assignment

**Why Assign Departments?**

Department assignment allocates the Blanket PO (and its releases) to specific **cost centers** for accounting and budgeting purposes.

**Use Cases:**
- **Budget Allocation**: Track which department's budget is being consumed
- **Cost Control**: Limit release creation to authorized departments
- **Financial Reporting**: Generate spend reports by department or cost center
- **Charge-Back**: Allocate supplier invoices to the correct department for internal billing

**How to Assign:**
1. Go to **Department** tab in the Blanket PO
2. Select **Department** or **Cost Center** from dropdown
3. Save → All releases against this Blanket PO will inherit this assignment

**Tip:** For multi-department agreements (e.g., company-wide IT services), you can either:
- Assign at release level (each department creates their own releases)
- Use a central "Procurement" department and re-allocate costs later via journal entries

---

## Export and Attachments

### Export - Professional Documents

Generate PDF documents for:
- Sending formal Blanket PO agreements to suppliers
- Internal approval documentation
- Audit records

**How to Export:**
1. Go to **Export** tab
2. Select **Printable Format** (e.g., "Standard Blanket PO", "Supplier Copy")
3. Click **Export as PDF**
4. Email to supplier or save for records

---

### Attachments - Supporting Documentation

Store all agreement-related files:
- Supplier quotes and proposals
- Signed contracts
- Approval emails
- Negotiation correspondence
- Supplier certifications

**How to Add Attachments:**
1. Go to **Attachments** tab
2. Click **"Add Attachment"**
3. Upload file (PDF, Excel, Word, images)
4. Add description
5. Save

**Best Practice:** Attach the signed supplier agreement copy for audit compliance.

---

## Configuration & Settings

The Settings page provides system-wide configuration for the Blanket Purchase Order Applet. Navigate via **Settings** in the sidebar.

### Application Settings

**Feature Visibility:**
Toggle which features and menu items are visible within the applet.

**Field Configuration:**
Control field-level behavior on Blanket PO forms:
- Set fields as **Required** — cannot save without completing
- Set fields as **Optional** — shown but not mandatory  
- Set fields as **Hidden** — removed from view

**Workflows:**
Define approval workflows for:
- Blanket PO creation (who must approve new agreements?)
- Release creation (can departments self-serve or need approval?)
- Maximum amount thresholds (agreements > RM 100,000 need CFO approval)

---

### Default Selection

Set defaults that pre-populate when creating new Blanket POs:

| Setting | Purpose | Example |
|---------|---------|---------|
| **Default Branch** | Pre-fills Branch on new Blanket POs | Headquarters |
| **Default Location** | Pre-fills warehouse location | Main Warehouse |
| **Default Validity Period** | Auto-fills "Valid To" date (e.g., +12 months from today) | 12 months |
| **Default Currency** | Pre-selects currency | MYR, USD, SGD |

**How to Configure Defaults:**
1. Go to **Settings** > **Default Selection**
2. Select your defaults
3. Click **Save**

**User Override:** Individual users can set personal defaults under **Personalization** > **Personal Default Selection**.

---

### Printable Format Settings

Manage Blanket PO print templates:

| Field | Description |
|-------|-------------|
| **Format Code** | Template identifier (e.g., BPO-STD) |
| **Format Name** | Display name (e.g., "Standard Blanket PO", "Supplier Agreement") |
| **File Name** | Jasper report filename on server |

**How to Add a Print Format:**
1. Go to **Settings** > **Printable Format Settings**
2. Click **"Add Format"**
3. Enter Format Code, Name, and File Name
4. Save

---

### Webhook

Configure webhook notifications for Blanket PO events:
- New Blanket PO created
- Blanket PO finalized (activated)
- Release created
- Agreement expiring (< 30 days)
- Agreement exhausted (> 95% utilized)

**Use Cases:**
- Push to ERP or accounting system
- Send alerts to Slack or Teams
- Trigger external approval workflows

---

### Permissions

Control who can access and perform actions:

| Permission Type | Description |
|----------------|-------------|
| **Permission Set** | Named groups (e.g., "Procurement Officer", "Department Manager") |
| **User Permission** | Individual user access |
| **Team Permission** | Assign permissions to entire teams |
| **Role Permission** | Assign by organizational role |

**Recommended Permission Levels:**

| Role | Recommended Permissions |
|------|------------------------|
| Procurement Staff | Create Blanket PO, Add Line Items, Edit Draft, View All |
| Procurement Manager | All above + Finalize Blanket PO, Void Blanket PO, Approve |
| Department Users | View Active Blanket POs, Create Releases (against approved BPOs only) |
| Finance Officer | View All, Export Reports, Monitor Spend |
| System Admin | Full Access including Settings and Permission Management |

---

## Personalization

Individual users can set preferences that override system defaults.

### Personal Default Selection

Set your personal default **Branch**, **Location**, and **Currency**. When you create a Blanket PO, these values pre-fill instead of system defaults.

**How to Set:**
1. Go to **Personalization** > **Personal Default Selection**
2. Select preferred Branch, Location, Currency
3. Click **Save**

**Who Should Use This:**
- Procurement staff who always work from one specific location
- Branch managers who handle agreements for their branch only

---

### Sidebar Customization

Customize your sidebar navigation to prioritize frequently used features.

---

## Common Scenarios

### Scenario 1: Annual Office Supplies Agreement

**Business Need:**
Company spends RM 60,000/year on office supplies across 3 branches, ordering monthly from the same supplier.

**Traditional Approach:**
- 12 POs per year × 3 branches = 36 purchase orders
- Each PO requires approval, negotiation, and processing
- Pricing varies month-to-month (no volume discount)

**Blanket PO Solution:**

```javascript
1. Create Blanket PO:
   - Supplier: ABC Office Supplies
   - Period: Jan 1 - Dec 31, 2024
   - Maximum Amount: RM 60,000
   
2. Add Line Items (negotiated prices):
   - A4 Paper (80gsm, 500 sheets/box) - RM 25/box
   - Pens (12/pack Ballpoint Blue) - RM 15/pack
   - Folders (10/pack A4 Manila) - RM 20/pack
   - Staples (1000/box) - RM 8/box
   - Toner (HP CF217A Black) - RM 120/unit
   ...20 more SKUs
   
3. Finalize → Blanket PO Active
   
4. Throughout the year:
   - Branch A releases RM 1,500 in January
   - HQ releases RM 2,200 in January
   - Branch B releases RM 900 in February
   - ...continues monthly
   
   Total released: RM 58,750 (98% utilization)
```

**Results:**
- Reduced from 36 POs to 1 Blanket PO + 36 simple releases
- 15% cost savings from volume pricing
- Procurement time reduced from 40 hours to 8 hours
- Consistent pricing throughout the year

---

### Scenario 2: Manufacturing Raw Materials (Quarterly Agreement)

**Business Need:**
Factory needs steel, aluminum, and copper for production. Demand fluctuates weekly based on orders.

**Blanket PO Solution:**

```javascript
1. Create Blanket PO:
   - Supplier: XYZ Metals Trading
   - Period: Q1 2024 (Jan 1 - Mar 31)
   - Maximum Amount: RM 500,000
   
2. Add Line Items with quantity caps:
   - Steel Plate (Grade A, per tonne) - RM 3,500/ton - Max 100 tons
   - Aluminum Sheet (6mm, per tonne) - RM 8,500/ton - Max 30 tons
   - Copper Wire (per kg) - RM 35/kg - Max 2,000 kg
   
3. Production Planning triggers weekly releases:
   - Week 1: 12 tons steel, 3 tons aluminum (RM 67,500)
   - Week 2: 8 tons steel, 150 kg copper (RM 33,250)
   - Week 3: 15 tons steel, 5 tons aluminum, 200 kg copper (RM 102,000)
   ...continues based on production schedule
```

**Why This Works:**
- Pre-negotiated prices locked for the quarter (price protection)
- Fast releases (no re-negotiation delays)
- Quantity caps prevent over-commitment if market prices drop
- Renew quarterly to adjust for price changes

---

### Scenario 3: IT Services Retainer

**Business Need:**
Company needs ongoing IT support but usage varies monthly.

**Blanket PO Solution:****

```javascript
1. Create Blanket PO:
   - Supplier: Tech Solutions Inc
   - Period: 12 months
   - Maximum Amount: RM 120,000 (RM 10,000/month average)
   
2. Add Service Line Items:
   - Server Maintenance (per hour) - RM 200/hour - Max 400 hours/year
   - Help Desk Support (per ticket) - RM 50/ticket - No max
   - Network Setup (per point) - RM 150/point - Max 200 points
   - Software Installation (per license) - RM 100/license - No max
   
3. IT Department creates releases as needed:
   - January: 15 hours maintenance + 20 tickets (RM 4,000)
   - February: Security audit project (RM 8,500)
   - March: 10 hours maintenance + 15 tickets (RM 2,750)
   - ...varies by IT incidents monthly
```

**Benefits:**
- IT can respond quickly to issues (pre-approved budget)
- Finance has cost certainty (capped at RM 120,000)
- Supplier relationship strengthened (12-month commitment)
- Hour tracking prevents over-billing

---

### Scenario 4: Multi-Branch Uniformed Apparel

**Business Need:**
Retail chain with 10 branches needs staff uniforms. New hires join monthly.

**Blanket PO Solution:**

```javascript
1. Create Blanket PO:
   - Supplier: Corporate Uniforms Ltd
   - Period: 12 months
   - Maximum Amount: RM 150,000
   
2. Add Line Items (all sizes):
   - Polo Shirt (Male, S-XXL, Navy) - RM 45/piece
   - Polo Shirt (Female, S-XXL, Navy) - RM 45/piece
   - Trousers (Male, 28-40, Black) - RM 65/piece
   - Skirt (Female, S-XXL, Black) - RM 60/piece
   - Name Badge - RM 15/piece
   
3. Each branch creates releases:
   - Branch A: New hire in March → 3 shirts, 2 trousers, 1 badge
   - Branch C: Uniform replacement in April → 15 shirts, 10 trousers
   - HQ: Bulk order for 5 new hires → order across all sizes
```

**Why This Works:**
- Branches self-serve (no central bottleneck)
- Consistent branding (same supplier, same styles)
- Cost tracking by branch (department assignment per release)
- Volume pricing across all branches (better rates than individual orders)

---

## FAQ

**Q: What's the difference between a Blanket PO and a regular Purchase Order?**
A: A **Blanket PO** is a long-term agreement covering multiple deliveries over time at pre-negotiated prices. A **regular PO** is a single transaction for immediate delivery. Think: Blanket PO = subscription/contract; Regular PO = one-time purchase.

**Q: Can I modify a Blanket PO after it's finalized?**
A: Generally no—finalized Blanket POs are locked to protect agreement integrity. If terms need changing (e.g., increase maximum amount), you typically create a new Blanket PO or an amendment document. Consult your procurement policy.

**Q: What happens when a Blanket PO reaches its maximum amount?**
A: The system prevents creating new releases once the committed amount reaches the maximum. You'll need to either:
- Create a new Blanket PO with the supplier (if the period is ongoing)
- Request a budget increase and amend the Blanket PO (if permitted by your policy)
- Wait until the period ends and create a new agreement

**Q: Can releases exceed the maximum amount if approved by management?**
A: This depends on your system configuration and company policy. Most systems enforce a hard cap to prevent budget overruns. If you need to exceed the cap, create an additional Blanket PO rather than breaching the original agreement.

**Q: How do I handle price changes from the supplier mid-period?**
A: Blanket POs lock prices for the agreement period—that's their key benefit. If the supplier requests price increases:
- **During the period**: Typically reject (you have a signed agreement)
- **At renewal**: Negotiate new prices for the next Blanket PO period
- **Market volatility clause**: Some agreements include clauses for extraordinary price changes (e.g., steel prices surge 50%)—review your contract terms

**Q: Can multiple departments create releases against the same Blanket PO?**
A: Yes! That's a primary use case. A centralized procurement team creates the Blanket PO, then multiple departments create releases as they need. Each release can be assigned to the requesting department for cost tracking.

**Q: What's the ideal period length for a Blanket PO?**
A: Depends on the category:
- **Office supplies, consumables**: 12 months (annual agreements)
- **Raw materials (volatile pricing)**: 3-6 months (quarterly reviews)
- **Services, maintenance**: 12-24 months (longer relationships)
- **Project-specific**: Duration of the project (may be irregular)

Balance between: (1) Longer periods = less admin work, (2) Shorter periods = flexibility to adjust pricing.

**Q: How do I prevent departments from exceeding their allocated budgets using Blanket POs?**
A: Use **department assignment** + **maximum quantity limits** on line items. Some systems also support "sub-allocation" where you distribute the total Blanket PO budget across departments (e.g., RM 50K total: Dept A = RM 20K, Dept B = RM 15K, Dept C = RM 15K).

**Q: Can I link Blanket POs to specific projects or cost centers?**
A: Yes, use the **Department** or **Cost Center** fields. Some organizations create separate Blanket POs per major project to track project-specific procurement spending.

**Q: What happens to unreleased amounts at the end of the Blanket PO period?**
A: They typically expire. For example, if you have a RM 50,000 Blanket PO but only release RM 35,000 worth, the remaining RM 15,000 becomes unavailable after the "Valid To" date. This prevents budget hoarding—plan utilization carefully.

**Q: How do I track supplier performance against Blanket POs?**
A: Use the **Doc Link** tab to monitor:
- **On-time delivery**: How many releases were delivered late?
- **Quality**: Any rejected deliveries or returns?
- **Responsiveness**: Time from release creation to delivery
- **Utilization**: Are we actually using the agreement (< 50% utilization may indicate pricing isn't competitive)?

**Q: Can I create a Blanket PO with multiple suppliers?**
A: No—each Blanket PO is tied to one supplier. To cover the same items with multiple suppliers (for redundancy or competition), create separate Blanket POs (e.g., BPO-2024-001 with Supplier A, BPO-2024-002 with Supplier B).

**Q: How do I renew an expiring Blanket PO?**
A: Typical process:
1. Review utilization and supplier performance from the expiring agreement
2. Contact supplier 30-45 days before expiry to negotiate renewal terms
3. Create new Blanket PO with updated dates, prices, and maximum amount
4. Finalize new agreement before old one expires
5. Notify departments of the new Blanket PO reference number

**Q: Can I track GRN (goods receipt) against Blanket PO releases?**
A: Yes—when goods are delivered for a release, you create a GRN referencing the release document (which is linked to the Blanket PO). This provides full traceability: Blanket PO → Release → GRN → Invoice.

**Q: What reports should I run regularly for Blanket PO management?**
A: Key reports:
- **Utilization Report**: Committed vs. maximum amount by Blanket PO
- **Expiring Agreements**: Blanket POs with < 30 days remaining
- **Near-Exhaustion**: Blanket POs at > 90% of maximum amount
- **Supplier Spend**: Total released across all Blanket POs by supplier
- **Department Spend**: Total released by cost center or department
- **Underutilized Agreements**: Blanket POs with < 20% utilization (wasted effort)

**Q: Can I set email alerts for Blanket PO events?**
A: Yes (if configured by admin). Common alerts:
- Blanket PO expiring in 30 days (to procurement)
- Blanket PO reaches 80% of maximum amount (to approver)
- New release created (to supplier, optional)
- Blanket PO finalized (to authorized release creators)

Configure via **Settings** > **Webhook** or notification settings.

---

**Need More Help?**

- **For Procurement Questions**: Contact your Procurement Manager
- **For System Configuration**: Contact your System Administrator
- **For Supplier Issues**: Check the **Account** tab for supplier contact details
- **For Technical Support**: Refer to the system help documentation or raise a support ticket

