---
title: "Purchase Invoice No Stock In (Internal) Applet"
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
- Create non-inventory purchase invoices and finalize when ready
- Link invoices back to purchase orders for 3-way matching on services
- Track recurring service costs (e.g. monthly retainer, SaaS subscriptions)
- Attach supporting documents (contracts, statements of work) directly on the invoice

**Management & Finance Leads:**
- Gain full visibility into non-inventory spend by supplier, department, or cost center
- Control document lifecycle with FINAL, VOID, and DISCARD actions
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
- **Document lifecycle control** — DRAFT → FINAL → VOID/DISCARD with permission-based access
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
| **How** is it processed? | Document Lifecycle & GL Posting | CREATE (draft) → FINAL (post to AP) → Settlement |

{{< callout type="tip" >}}
**Real-World Example**: Your IT managed services provider (WHO) sends a monthly invoice for server hosting fees (WHAT) of RM 3,500. Finance raises the invoice in this applet, clicks FINAL to finalize, and it automatically posts to the correct IT Overhead GL account (HOW)—no stock movement involved, no workarounds needed.
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
└── Document Lifecycle ──→ HOW it gets finalized and posted
    │
    └── DRAFT → FINAL → GL Posting ──→ AP ledger + Cost account + Tax account
```

### Key Distinction: With vs. Without Stock In

| Feature | Purchase GRN / Standard Invoice | Purchase Invoice No Stock In |
|---------|--------------------------------|------------------------------|
| Stock movement | ✓ Yes — creates stock entries | ✗ No — no stock impact |
| Requires GRN | ✓ Yes | ✗ No |
| Suitable for | Physical goods, raw materials | Services, overheads, intangibles |
| Examples | Office furniture, spare parts | IT subscriptions, legal fees, rent |
| AP posting | After GRN is posted | Direct upon invoice finalization (FINAL) |

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
{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/create-search-document.png" alt="Create Invoice - Search Document Tab" caption="The Search Document tab allows you to search and clone from an existing Purchase Invoice, Purchase Order, or Purchase GRN." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/create-main-details.png" alt="Create Invoice - Main Details Tab" caption="The Main Details tab with Branch selection, Delivery Location, Purchaser, and Transaction Date fields." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/create-account-select-supplier.png" alt="Create Invoice - Account Tab with Supplier Selection" caption="The Account tab showing Entity Details fields alongside the Select Supplier dialog for choosing from available suppliers." >}}

3. **Add Lines**: Click **"Add Line"** for each expense:
   - **Description**: What the service is (e.g., "Monthly SaaS Subscription – April")
   - **Account**: GL cost account (e.g., "IT Expenses")
   - **Quantity & Unit Price**: e.g., 1 × RM 2,500
   - **Tax Code**: Select SST/GST/VAT code if applicable
   - **Department / Profit Center / Project**: Cost allocation
{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/create-line-items-select-item.png" alt="Create Invoice - Line Items with Item Type Selection" caption="The Line Items tab showing the Select Item dialog with Item Type filter options: BASIC_ITEM, MADE_TO_ORDER, BUNDLE, NSTI, VOUCHER, and ACCOUNT_CODE." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/create-contra-tab.png" alt="Create Invoice - Contra Tab" caption="The Contra tab with the Select Document to Contra With dialog, listing available purchase invoices for offsetting." >}}

4. **Attach Supporting Docs**: Upload the supplier's invoice PDF or any contract
5. **Verify Tax & Totals**: Ensure the calculated tax amount matches the physical supplier invoice.
6. **Create**: Click **CREATE** to save the invoice as a **DRAFT**.
7. **Finalize**: When ready, click **FINAL** from the listing or edit screen to finalize the invoice and post to the AP ledger. You can also use **SAVE** to update a draft without finalizing.

{{< callout type="tip" >}}
**Pro Tip:** Always enter the supplier's own invoice number in the **Reference No** field. This makes reconciliation against supplier statements and payment matching far easier.
{{< /callout >}}

**What happens next?** Once finalized (FINAL), the invoice is posted to the AP ledger and cost accounts automatically. Use **VOID** to reverse a finalized invoice, or **DISCARD** to remove a draft.

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

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/file-import-listing.png" alt="File Import Listing" caption="The File Import Listing showing uploaded CSV files with File Name, File Size, Format, Status, Process Status, Error Message, and Created Date." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/file-import-details.png" alt="File Import - Details Tab" caption="The File Details panel showing File Name, File Size, Import Format, Process Status, Error Message, Created By, and Creation Date." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/file-import-checking.png" alt="File Import - Checking Tab" caption="The File Details Checking tab showing validation errors per line with Line Number, Processed status, Validation Error details, and Branch Code." >}}

**Going on leave?** Ensure another team member has permission to run imports by checking `Settings > Permissions`.

---

### For Admins: Initial System Setup

**Goal:** Configure the applet before Finance starts processing invoices.

**Step 1: Application Settings** (`Settings > Application Settings`)
- Make required fields mandatory (e.g., Reference No, Cost Account)
- Hide fields irrelevant to your business (e.g., Permit No)

**Step 2: Default Selections** (`Settings > Default Selection`)
- Pre-fill Branch and Location to speed up data entry
- Set Floating Point Precision (2–4 decimal places)
- Configure Transaction Date Logic and Details Tab Ordering

**Step 3: Printable Format** (`Settings > Printable Format Settings`)
- Configure the invoice print layout for internal voucher printing

**Step 4: Branch Settings** (`Settings > Branch Settings`)
- Configure per-branch settings: Item Category Filter, Pricing Scheme, Default Settlement Method

**Step 5: Permissions** (via platform settings)
- Assign create/edit rights to Finance team
- Control visibility of FINAL, VOID, DISCARD, CLONE actions per role
- Configure file import/export menu visibility

**Step 6: Knock Off Settings** (`Settings > Knock Off Settings`, if used)
- Configure knock-off preferences for how invoices match and settle against payments or credit notes

**Step 7: Test**
- Create a test invoice, finalize it (FINAL), and verify the GL posting is correct

---

{{< callout type="tip" >}}
**New to the applet?** Start here:
1. **Finance** — Create a test invoice using a dummy supplier to get familiar with the line entry
2. **Finance Leads** — Practice the **FINAL**, **VOID**, and **DISCARD** actions on a test document
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
- Document Status (DRAFT / FINAL / VOID / DISCARDED)
- Created By
- Updated Date

**Advanced search criteria:** Supplier, Branch, Date range (Transaction Date, Created Date), Document Status, Reference No, Amount range, GL Dimension, Profit Center, Project.

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/invoice-listing.png" alt="Invoice Listing Screen" caption="The Internal Purchase Invoice No Stock In Listing screen showing all invoices with Doc Short Code, E-Invoice Running No, Doc No, Posting Status, Branch Code, and Currency columns." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/listing-search-filter.png" alt="Listing Search and Filter Panel" caption="The search and filter panel with Supplier selection, date range filters for Created Date, Updated Date, and E-Invoice Billing Frequency." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/listing-search-filter-extended.png" alt="Listing Search and Filter Panel - Extended Filters" caption="Extended search filters showing E-Invoice Billing Period, E-Invoice Date, External Quotation, Order, Delivery Order, Invoice, and Other date range filters." >}}

---

## Viewing & Editing Invoices

Below are screenshots of an existing invoice showing the completed tabs:

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/edit-main-details.png" alt="Edit Invoice - Main Details Tab" caption="The Main Details tab of an existing invoice showing Doc Short Code, Branch, Location, Delivery Branch, and Delivery Location fields." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/edit-e-invoice-tab.png" alt="Edit Invoice - E-Invoice Tab" caption="The E-Invoice tab showing Submission Type, Document No, Document Type, E-Invoice Number, UUID, Document Date, and Billing Frequency fields." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/edit-account-tab.png" alt="Edit Invoice - Account Tab" caption="The Account tab showing Entity Details with Entity ID, Entity Name, Entity Type, Status, Identity Type, Currency, and contact information." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/edit-line-items.png" alt="Edit Invoice - Line Items Tab" caption="The Line Items tab showing item lines with Item Code, Item Name, UOM, and Remarks columns, along with Total Transaction Amount and SST/VAT/GST totals." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/edit-delivery-details.png" alt="Edit Invoice - Delivery Details Tab" caption="The Delivery Details tab with Tracking ID, Delivery Type, Delivery Branch, Delivery Location fields and Apply to Lines buttons for bulk assignment." >}}

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

### Line Items Listing

The **Line Items** sidebar route provides a flat grid of all invoice line items across all invoices, making it easy to search and analyse costs by item, supplier, or branch.

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/line-items-listing.png" alt="Line Items Listing" caption="The Line Items Listing showing all invoice line items across all documents with Purchase Invoice No, Transaction Date, Branch Code, Supplier Name, Item Code, Item Name, and quantities." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/line-items-search-filter.png" alt="Line Items Search and Filter Panel" caption="The Line Items search and filter panel with options to filter by Branch, Item Code/Name, date ranges, and State." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/edit-line-item-doc-link.png" alt="Edit Line Item - Doc Link Tab" caption="The Edit Line Item view showing the Doc Link tab with linked documents such as Purchase GRN references." >}}

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
- **Document status**: Invoices remain in **DRAFT** until finalized. Only **FINAL** invoices generate GL entries.

---

## Configuration & Settings

Access **Settings** from the sidebar to configure applet behaviour.

#### Default Selection (`Settings > Default Selection`)
- **Branch**: Default branch pre-filled when creating a new invoice
- **Location**: Default location
- **Floating Point Precision**: Decimal places (2–4)
- **Transaction Date Logic**: Finalized / Created / Updated / Transaction Date
- **Details Tab Ordering**: Drag-and-drop reorder of invoice tabs

#### Application Settings (`Settings > Application Settings`)
Control which fields are mandatory, optional, or hidden for your users. For example:
- Make **Reference No** mandatory to ensure supplier invoice numbers are always recorded
- Hide **Permit No** if not relevant to your business

#### Branch Settings (`Settings > Branch Settings`)
Manage specific branch rules or branch-specific visibility for invoices.

#### Knock Off Settings (`Settings > Knock Off Settings`)
Configure how credit matching and settlement occurs when applying payments or credit notes against these invoices.

#### Printable Format Settings (`Settings > Printable Format Settings`)
Define the layout and fields for printed or exported payment vouchers and invoice documents.

{{< callout type="info" >}}
**Note**: The settings visible in the sidebar are: Application Settings, Default Selection, Printable Format Settings, and Branch Settings. The following settings are accessible via platform navigation or direct URL, not the applet sidebar menu.
{{< /callout >}}

#### Feature Visibility
Control which features are accessible to which user roles. For example, restrict the ability to void invoices to Finance Managers only.

#### Permissions
- **Client-Side Permission Listing** — Configure component-level visibility (show/hide FINAL, VOID, DISCARD, CLONE, file import/export menus, ARAP columns, etc.)
- **Permission Wizard Listing** — Fast role permission assignments
- **Permission Set Listing** — Define role-based permission sets
- **User / Team / Role Permission Listing** — Assign permissions at the user, team, or role level

#### Release Notes
View version release notes (v1.00–v1.17) for version-specific behaviour changes.

#### Webhook (`Settings > Webhook`)
Configure outbound webhooks to notify external systems (e.g., ERP, expense management) on invoice events such as creation, approval, or posting.

---

## Personalization

#### Default Selection (`Personalization > Default Selection`)
Individual users can set their own preferences:
- **Default Branch / Location** — pre-filled when creating a new invoice
- **Default Toggle Column** — SINGLE or DOUBLE column layout
- **Default Item Search Item Type** — pre-select which item types appear in search
- **Default Tab Orientation** — HORIZONTAL or VERTICAL tab layout

#### Sidebar (`Personalization > Sidebar`)
Reorder or hide sidebar items to match your preferred workflow.

---

## Reporting & Audit

This applet does not have a dedicated Reports menu. Instead, use the following built-in tools for reporting and analysis:

### Invoice Listing Export
Use the main **Invoice Listing** grid to filter invoices by supplier, date range, status, or branch, then export the results to Excel/CSV for AP reconciliation.

### Line Items Listing
The **Line Items** sidebar route provides a flat grid of all invoice line items across all invoices. Filter by GL Account, Supplier, Date range, Department, Profit Center, or Project — then export for cost analysis.

### File Export
Use **File Export** from the sidebar to generate CSV exports by transaction date range. Downloads are processed asynchronously — check the listing for completed files.

### Per-Invoice Export
On any individual invoice, use the **Export** tab to generate a PDF using your configured printable format.

### Audit Trail
Every action on an invoice is logged:
- Date & time of creation, edit, finalization, voiding
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
A: You can use the **Clone** function (from the edit screen dropdown menu) to duplicate last month's invoice, update the date and reference number, and finalize. This avoids re-entering the same line items each month.

**Q: Where can I see all invoices pending payment?**
A: Use the **Invoice Listing** and check the **ARAP columns** (Doc Open Amount, Settlement, Balance). Invoices with a remaining Doc Open Amount are still pending payment. You can sort or filter by these columns for AP aging review.

**Q: Can I attach multiple files to a single invoice?**
A: Yes. The **Attachments** tab supports multiple file uploads per invoice. There is no strict file count limit, though large files should be compressed before uploading to maintain system performance.

**Q: Who can void a finalized invoice?**
A: Voiding a FINAL invoice requires permission that is typically restricted to Finance Managers or System Admins. Note: VOID is blocked if the invoice is linked to a purchase return or if e-invoice is enabled on edit. This action is logged in the audit trail.
