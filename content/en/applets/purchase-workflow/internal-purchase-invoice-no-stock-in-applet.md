---
title: "Purchase Invoice No Stock In Applet"
description: "Process and manage purchase invoices for non-inventory expenses—services, overheads, and intangible purchases—without triggering stock movements"
tags:
- purchase-invoice
- no-stock-in
- accounts-payable
- service-invoice
- overhead-expenses
- purchase-workflow
weight: 50
---

## Purpose and Overview

The **Purchase Invoice No Stock In Applet** enables your finance and procurement teams to record and process purchase invoices for purchases that do **not** involve physical stock movement. Whether it's a service contract, rental, professional fee, utility bill, or any other non-inventory expense, this applet ensures accurate accounts payable recording without creating erroneous stock entries.

{{< callout type="info" >}}
**Core Concept**: This applet decouples **invoice processing** from **stock receiving**. It links **who** is invoicing you (Supplier) to **what** expense you're recording (Service/Overhead) and **how** it flows through Finance (GL posting, AP, tax compliance).
{{< /callout >}}

## Applet Value & Benefits

### Who Benefits from This Applet?

**Finance & Accounts Payable Teams:**
- Record supplier invoices for services and overhead costs instantly
- Maintain a clean accounts payable ledger without phantom stock entries
- Automate GL posting to the correct cost accounts
- Manage multi-currency invoices with built-in exchange rate handling

**Procurement & Operations Teams:**
- Submit non-inventory purchase invoices for approval
- Link invoices back to purchase orders for 3-way matching on services
- Track recurring service costs (e.g. monthly retainer, SaaS subscriptions)
- Attach supporting documents (contracts, statements of work) directly on the invoice

**Management & Approvers:**
- Gain full visibility into non-inventory spend by supplier, department, or cost center
- Enforce approval workflows before any liability is posted to the books
- Monitor overhead spending against budget in real time
- Drill into invoice lines for granular cost analysis

**External Auditors & Compliance:**
- Complete audit trail from invoice creation to GL posting
- Tax (SST/GST/VAT) computation recorded per line
- Supporting attachments stored alongside each invoice

### What Problems Does This Solve?

**The Non-Inventory Invoice Problem:**

Many ERP systems force every purchase invoice through a goods receipt process, causing issues for service-based or overhead purchases:
- Stock modules report phantom stock movements for services
- Finance teams create workarounds that break audit trails
- Service invoices are delayed waiting for a GRN that will never exist
- Cost allocation to correct departments is manual and error-prone

**The Purchase Invoice No Stock In Solution:**

- **Straight-through processing** — Post service invoices directly to the AP ledger without a GRN
- **Flexible cost allocation** — Allocate costs to departments, profit centers, and projects on each line
- **Tax-ready** — Compute SST, GST, or VAT per line automatically
- **PO-linked or standalone** — Reference a purchase order or record as a standalone invoice
- **Full approval workflow** — Route invoices through configurable multi-level approval before posting
- **Document attachments** — Store contracts, delivery confirmations, or statements directly on the invoice

## Key Features Overview

{{< cards >}}
  {{< card title="Invoice Listing" subtitle="Browse, search, and filter all non-stock invoices" link="#invoice-listing" >}}

  {{< card title="Create & Edit Invoice" subtitle="Header details, supplier, currency, and line items" link="#for-finance-create-your-first-invoice" >}}

  {{< card title="Line Item Management" subtitle="Cost allocation, tax, and quantities per line" link="#line-item-management" >}}

  {{< card title="File Import & Export" subtitle="Bulk import invoices or export data" link="#file-import--export" >}}

  {{< card title="Document Attachments" subtitle="Link contracts, SOWs, and supporting docs" link="#document-attachments" >}}

  {{< card title="GL Posting & Tax" subtitle="Automated posting and tax computation" link="#gl-posting--tax" >}}

  {{< card title="Configuration & Settings" subtitle="Defaults, field settings, permissions, and printable formats" link="#configuration--settings" >}}

  {{< card title="Reporting & Audit" subtitle="Line reports, cost analysis, and audit trail" link="#reporting--audit" >}}
{{< /cards >}}

![Purchase Invoice No Stock In Overview](/images/Purchase-Invoice-No-Stock%20In-applet/Purchase-Invoice-No-Stock%20In-applet-overview-infographic.png)

## Key Concepts

### Understanding the Invoice Framework

Every purchase invoice processed through this applet must address three fundamental aspects:

| Aspect | Component | Practical Example |
|--------|-----------|-------------------|
| **Who** is invoicing? | Supplier / Vendor | Acme Consulting (supplier) |
| **What** is being charged? | Invoice Line Items & Cost Accounts | Professional Services Fee — RM 5,000 |
| **How** is it processed? | Approval Workflow & GL Posting | HOD approval → Finance posting → AP settled |

{{< callout type="tip" >}}
**Real-World Example**: Your IT managed services provider (WHO) sends a monthly invoice for server hosting fees (WHAT) of RM 3,500. Finance raises the invoice in this applet, HOD approves it, and it automatically posts to the correct IT Overhead GL account (HOW)—no stock movement involved, no workarounds needed.
{{< /callout >}}

### Invoice Hierarchy Structure

```
Organisation
│
├── Supplier ──→ WHO is billing you?
│   │
│   └── Purchase Invoice (No Stock In) ──→ WHAT is being charged?
│       │
│       ├── Invoice Header ──→ Date, currency, credit terms, reference
│       │
│       └── Invoice Lines ──→ Service description, amount, tax, GL account
│           │
│           └── Cost Allocation ──→ Department, Profit Center, Project
│
└── Approval Workflow ──→ HOW it gets authorised and posted
    │
    └── GL Posting ──→ AP ledger + Cost account + Tax account
```

### Key Distinction: With vs. Without Stock In

| Feature | Purchase GRN / Standard Invoice | Purchase Invoice No Stock In |
|---------|--------------------------------|------------------------------|
| Stock movement | ✓ Yes — creates stock entries | ✗ No — no stock impact |
| Requires GRN | ✓ Yes | ✗ No |
| Suitable for | Physical goods, raw materials | Services, overheads, intangibles |
| Examples | Office furniture, spare parts | IT subscriptions, legal fees, rent |
| AP posting | After GRN is posted | Direct upon invoice approval |

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Finance: Create Your First Invoice

**Goal:** Record a service invoice from a supplier in 5 steps.

1. **Navigate**: Go to **Purchase Invoice (No Stock In)** from the sidebar
2. **Create Header**: Click **"+"** → Fill in:
   - **Supplier**: Select your vendor (e.g., "Acme Consulting Sdn Bhd")
   - **Transaction Date**: Date on the supplier's invoice
   - **Credit Terms**: Net 30, Net 60, or as agreed
   - **Reference No**: The supplier's invoice number (for reconciliation)
   - **Currency**: MYR or foreign currency (system will apply exchange rate)
   - **Branch / Location**: Your company branch receiving the service
3. **Add Lines**: Click **"Add Line"** for each expense:
   - **Description**: What the service is (e.g., "Monthly SaaS Subscription – April")
   - **Account**: GL cost account (e.g., "IT Expenses")
   - **Quantity & Unit Price**: e.g., 1 × RM 2,500
   - **Tax Code**: Select SST/GST/VAT code if applicable
   - **Department / Profit Center / Project**: Cost allocation
4. **Attach Supporting Docs**: Upload the supplier's invoice PDF or any contract
5. **Verify Tax & Totals**: Ensure the calculated tax amount matches the physical supplier invoice.
6. **Submit / Finalize**: Save the invoice to finalize it and automatically post to the AP ledger.

{{< callout type="tip" >}}
**Pro Tip:** Always enter the supplier's own invoice number in the **Reference No** field. This makes reconciliation against supplier statements and payment matching far easier.
{{< /callout >}}

**What happens next?** Your approver receives a notification. Upon approval, the invoice is posted to the AP ledger and cost accounts automatically.

---

### For Operations: Import Invoices via File

**Goal:** Bulk create multiple invoices without manual entry.

1. **Navigate**: Go to **File Import** from the sidebar
2. **Download Template**: Click to download the standard import CSV/Excel template
3. **Prepare Data**:
   - Fill in Supplier, Date, Reference No, Currency, Branch
   - Add line item details (Description, Amount, Tax, GL Account)
4. **Upload**: Select your completed file and click **Upload**
5. **Verify**: The system will validate the file. Check for any errors (e.g., missing mandatory fields or invalid GL accounts).
6. **Process**: Once validated, click **Process Import** to create the invoices.

**Going on leave?** Ensure another team member has permission to run imports by checking `Settings > Permissions`.

---

### For Admins: Initial System Setup

**Goal:** Configure the applet before Finance starts processing invoices.

**Step 1: Knock Off Settings** (`Settings > Knock Off Settings`)
- Configure auto knock-off preferences for how invoices match and settle against payments or credit notes

**Step 2: Default Selections** (`Settings > Default Selection`)
- Pre-fill Branch, Location, and Currency to speed up data entry

**Step 3: Field Settings** (`Settings > Field Settings`)
- Make required fields mandatory (e.g., Reference No, Cost Account)
- Hide fields irrelevant to your business (e.g., Permit No)

**Step 4: Tax Configuration**
- Ensure SST/GST/VAT tax codes are set up in master data
- Map tax codes to the correct tax GL accounts

**Step 5: Permissions** (`Settings > Permissions`)
- Assign create/edit rights to Finance team
- Assign approval rights to managers and HODs
- Restrict GL account access by role if needed

**Step 6: Printable Format** (`Settings > Printable Format Settings`)
- Configure the invoice print layout for internal voucher printing

**Step 7: Test**
- Create a test invoice, approve it, and verify the GL posting is correct

---

{{< callout type="tip" >}}
**New to the applet?** Start here:
1. **Finance** — Create a test invoice using a dummy supplier to get familiar with the line entry
2. **Approvers** — Open **Pending Approvals** and practice the approve/query/reject actions
3. **Admins** — Review **Configuration & Settings** below before going live
{{< /callout >}}

---

## Invoice Listing

The main landing view shows all non-stock purchase invoices your user has access to, with server-side pagination and advanced search.

**Typical columns:**
- Invoice No
- Supplier Name
- Transaction Date
- Total Amount
- Currency
- Posting Status (Draft / Submitted / Approved / Posted / Void)
- Created By
- Updated Date

**Advanced search criteria:** Supplier, Branch, Date range (Transaction Date, Created Date), Posting Status, Reference No, Amount range, GL Dimension, Profit Center, Project.

---

## Line Item Management

Each invoice can have multiple lines. Each line captures:

| Field | Description |
|-------|-------------|
| **Description** | Narrative of the service or expense |
| **GL Account** | Cost account the expense is charged to |
| **Quantity** | Number of units (often 1 for services) |
| **Unit Price** | Price per unit |
| **Tax Code** | SST/GST/VAT code (auto-computes tax amount) |
| **Taxable Amount** | Pre-tax subtotal |
| **Tax Amount** | Computed tax |
| **Total Amount** | Taxable + Tax |
| **Department** | Cost centre allocation |
| **Profit Center** | P&L segment |
| **Project** | Project code for project-based costing |

{{< callout type="info" >}}
**Multi-line Invoices**: You can split a single supplier invoice across multiple GL accounts. For example, a managed services invoice covering both IT infrastructure (70%) and telecoms (30%) can be recorded as two lines pointing to different GL accounts—no need to split into separate invoices.
{{< /callout >}}

---

## Document Attachments

Supporting documents can be attached directly to each invoice:

- **PDF invoices** from the supplier
- **Contracts or SOWs** for service-based purchases
- **Email approvals** or correspondence
- **Delivery confirmations** (proof of service rendered)

Navigate to the **Attachments** tab on any invoice to upload or view files. Each attachment is logged with the uploader's name and timestamp for audit purposes.

---

## GL Posting & Tax

Upon invoice approval, the system automatically generates the following accounting entries:

```
DR  Cost Account (e.g., IT Expenses)         RM 3,500.00
DR  Tax Account (Input Tax / Claimable SST)     RM 210.00
    CR  AP Control Account (Supplier Payable)           RM 3,710.00
```

- **Multi-currency**: Foreign currency invoices are converted using the rate on the transaction date. Exchange gain/loss is posted automatically upon payment.
- **Tax compliance**: Each tax code maps to a dedicated input tax GL account, ensuring SST/GST returns are accurate.
- **Posting status**: Invoices remain in **Draft** or **Submitted** until approved. Only approved invoices generate GL entries.

---

## Configuration & Settings

Access **Settings** from the sidebar to configure applet behaviour.

#### Default Selection (`Settings > Default Selection`)
- **Branch**: Default branch pre-filled when creating a new invoice
- **Location**: Default location
- **Currency**: Default currency (e.g., MYR)

#### Field Settings (`Settings > Field Settings`)
Control which fields are mandatory, optional, or hidden for your users. For example:
- Make **Reference No** mandatory to ensure supplier invoice numbers are always recorded
- Hide **Permit No** if not relevant to your business

#### Branch Settings (`Settings > Branch Settings`)
Manage specific branch rules or branch-specific visibility for invoices.

#### Knock Off Settings (`Settings > Knock Off Settings`)
Configure how credit matching and settlement occurs when applying payments or credit notes against these invoices.

#### Printable Format Settings (`Settings > Printable Format Settings`)
Define the layout and fields for printed or exported payment vouchers and invoice documents.

#### Feature Visibility (`Settings > Feature Visibility`)
Control which features are accessible to which user roles. For example, restrict the ability to void posted invoices to Finance Managers only.

#### Permissions (`Settings > Permissions`)
- **Client-Side Permission Listing** — Configure component-level visibility
- **Permission Wizard Listing** — Fast role permission assignments
- **Permission Set Listing** — Define role-based permission sets
- **User / Team / Role Permission Listing** — Assign permissions at the user, team, or role level

#### Applet Log & Release Notes (`Settings > Applet Log / Release Notes`)
View system logs of automated actions, application state changes, and version release notes directly from your workspace.

#### Webhook (`Settings > Webhook`)
Configure outbound webhooks to notify external systems (e.g., ERP, expense management) on invoice events such as creation, approval, or posting.

---

## Personalization

#### Default Selection (`Personalization > Default Selection`)
Individual users can set their own preferred Branch, Location, and Currency so they don't need to re-select them on every new invoice.

#### Sidebar (`Personalization > Sidebar`)
Reorder or hide sidebar items to match your preferred workflow.

---

## Reporting & Audit

### Invoice Report
View a summary of all invoices by supplier, date range, status, or cost account — useful for month-end AP reconciliation.

### Line Report
Drill into individual invoice lines across all invoices. Filter by:
- GL Account (e.g., "show all IT expenses")
- Supplier
- Date range
- Department / Profit Center / Project

**Export to Excel** for further analysis or sharing with management.

### Audit Trail
Every action on an invoice is logged:
- Date & time of creation, edit, submission, approval/rejection
- User who performed each action
- Before/after values for any field changes

This ensures full traceability for internal audits and external compliance reviews.

---

## FAQ

**Q: When should I use this applet instead of the standard Purchase Invoice?**
A: Use this applet whenever the purchase does **not** involve receiving physical stock into your warehouse. Common examples: professional fees, SaaS subscriptions, utilities, rent, insurance, advertising, and training. If physical goods are involved, use the standard Purchase Invoice (with GRN) instead.

**Q: Can I link a non-stock invoice to a Purchase Order?**
A: Yes. In the invoice header, use the **Doc Link** or **Reference** field to reference the originating Purchase Order. This maintains a full procurement paper trail even for service purchases and supports 2-way matching (PO vs. Invoice).

**Q: What happens if I entered the wrong GL account after the invoice is posted?**
A: Posted invoices cannot be edited directly. You will need to raise a **Purchase Credit Note** to reverse the incorrect entry, then create a new invoice with the correct GL account. Contact your Finance Manager if you are unsure of the process.

**Q: Can one invoice have multiple currencies?**
A: No. Each invoice is in a single currency (set at the header level). If a supplier bills you in multiple currencies in the same invoice, split it into separate invoices per currency.

**Q: How do I handle recurring monthly service invoices (e.g., monthly office rental)?**
A: You can use the **Copy Invoice** function to duplicate last month's invoice, update the date and reference number, and submit for approval. This avoids re-entering the same line items each month.

**Q: Where can I see all invoices pending payment?**
A: Use the **Invoice Listing** with a filter on Posting Status = **Approved / Posted** and Payment Status = **Unpaid**. This gives you the AP aging view for cash flow planning.

**Q: Can I attach multiple files to a single invoice?**
A: Yes. The **Attachments** tab supports multiple file uploads per invoice. There is no strict file count limit, though large files should be compressed before uploading to maintain system performance.

**Q: Who can void a posted invoice?**
A: Voiding a posted invoice requires permission that is typically restricted to Finance Managers or System Admins. This action is logged in the audit trail with the reason for voiding.
