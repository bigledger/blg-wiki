---
title: "Internal Sales Refund Note Applet"
description: "Process customer refund notes for returned goods or credit adjustments — with intercompany support, line item management, and file import/export"
tags:
- sales
- refund-note
- credit-adjustment
- returns-management
- intercompany
weight: 120
---

## Purpose and Overview

The **Internal Sales Refund Note Applet** manages the creation and processing of refund notes issued to customers. When goods are returned, pricing adjustments are needed, or credit notes must be issued, this applet handles the end-to-end workflow — from creating the refund note header, adding line items, processing intercompany transactions, through to finalization and export.

{{< callout type="info" >}}
**Sales Module Applet**: This applet is part of the Sales & CRM module and works alongside Sales Invoice, Credit Note, and Receipt Voucher applets to manage the complete sales-to-refund lifecycle.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Accounts Receivable Staff:**
- Create and manage refund notes for customer returns
- Add detailed line items with quantities and pricing
- Process refunds through structured approval workflows
- Export refund data for reporting

**Sales Team:**
- Track refund notes linked to customer accounts
- View refund history per customer
- Understand return reasons through configured reason codes

**Finance Managers:**
- Approval workflow for refund authorization
- Intercompany refund processing for multi-entity organizations
- Printable format configuration for official documents
- Branch-level refund tracking and reporting

**System Administrators:**
- Configure return reason codes
- Set up branch-level settings
- Define approval workflows
- Manage printable format templates

### What Problems Does This Solve?

**The Manual Refund Problem:**

Processing customer refunds manually creates significant risks:
- No standardized process for recording refund reasons
- Difficult to track refund status across departments
- Manual intercompany reconciliation for multi-entity refunds
- No centralized refund reporting
- Paper-based approvals causing delays

**The Refund Note Applet Solution:**

- **Structured refund creation** — Standardized header + line item structure with mandatory fields
- **Reason tracking** — Configurable return reason codes for every refund
- **Approval workflows** — Multi-level approval before refund processing
- **Intercompany support** — Automatic cross-company transaction handling
- **File import/export** — Bulk operations via file upload and data export
- **Printable formats** — Professional refund note documents for customers

## Key Features Overview

{{< cards >}}
  {{< card title="Refund Note Listing" subtitle="Create & manage refund notes" link="#internal-sales-refund-note" >}}

  {{< card title="Line Items" subtitle="Manage refund line item details" link="#line-items" >}}

  {{< card title="Intercompany" subtitle="Cross-company refund processing" link="#intercompany" >}}

  {{< card title="File Export" subtitle="Export refund data" link="#file-export" >}}

  {{< card title="File Import" subtitle="Bulk import refund notes" link="#file-import" >}}

  {{< card title="Settings" subtitle="6 configurable settings areas" link="#settings" >}}
{{< /cards >}}

## Key Concepts

### Understanding the Refund Note Framework

Every refund note follows a structured process from creation to settlement:

| Stage | Component | Description |
|-------|-----------|-------------|
| **Create** | Refund Note Header | Customer, branch, dates, and refund metadata |
| **Detail** | Line Items | Individual items being refunded with quantities and amounts |
| **Approve** | Workflow | Multi-level approval based on configured rules |
| **Process** | Intercompany (if applicable) | Cross-entity transaction posting |
| **Export** | File Export | Generate data exports for reporting or integration |

{{< callout type="tip" >}}
**Real-World Example**: A customer returns 5 units of Widget-A (RM 50 each) due to defects. The AR clerk creates a Refund Note, adds the line item (5 × RM 50 = RM 250), selects reason "Defective Product", and submits for manager approval. Once approved, the refund posts to the customer's account and the general ledger.
{{< /callout >}}

### Refund Note Lifecycle

```
Create (Draft)
│
├── Add Line Items
│   ├── Select items / enter quantities
│   ├── Apply pricing / discounts
│   └── Assign return reason
│
├── Submit for Approval
│   └── Routes to configured approver(s)
│
├── Approved
│   ├── Posts to customer account
│   ├── Creates GL entries
│   └── Triggers intercompany posting (if applicable)
│
└── Finalized / Exported
    ├── Print refund note document
    └── Export for reporting
```

---

## Quick Start Guide

### For AR Staff: Create Your First Refund Note

**Goal:** Create a customer refund note in 5 steps.

1. **Navigate**: Go to **Internal Sales Refund Note** from the sidebar
2. **Create Header**: Click **"+"** → Select **Customer** → Choose **Branch** → Set **Date** → **Create**
3. **Add Line Items**:
   - Click **"Add Line"** or navigate to the **Line Items** tab
   - Select the **Item** being refunded
   - Enter **Quantity** and verify **Unit Price**
   - Select **Return Reason** (e.g., Defective, Wrong Shipment)
   - Add a **Description** or note if needed
4. **Review**: Verify all amounts and tax calculations
5. **Submit**: Click **Submit** → Refund note routes to approver

**What happens next?** The approver reviews and approves the refund note. Once approved, the credit posts to the customer account.

### For Managers: Approve a Refund Note

**Goal:** Review and approve a pending refund note.

1. **Navigate**: Go to **Internal Sales Refund Note** from the sidebar
2. **Filter**: Filter by **Pending Approval** status
3. **Review**: Open the refund note, check customer details, line items, amounts, and return reasons
4. **Decide**: Click **Approve** or **Reject** with comments

---

## Sidebar Menu Reference

### Internal Sales Refund Note

The main listing and management screen for all refund notes.

**Listing View:**
- Displays all refund notes with status indicators (Draft, Submitted, Approved, Rejected, Finalized)
- Columns: Refund Note No., Customer, Date, Amount, Status, Branch
- Search by refund note number, customer name, or date range
- Filter by status, branch, or date
- Click any row to view or edit

**Create / Edit View:**

The refund note form contains the following fields:

| Field | Description | Required |
|-------|-------------|----------|
| **Refund Note No.** | Auto-generated sequential number | Auto |
| **Customer** | Select the customer receiving the refund | ✅ |
| **Branch** | Originating branch | ✅ |
| **Date** | Refund note date | ✅ |
| **Reference** | External reference number (e.g., original invoice) | Optional |
| **Currency** | Transaction currency | ✅ |
| **Description** | General notes or reason for refund | Optional |
| **Subtotal** | Sum of all line items | Auto |
| **Tax** | Applied tax amount | Auto |
| **Total** | Final refund amount | Auto |

**Status Transitions:**
- **Draft** → Edit freely, not yet submitted
- **Submitted** → Sent for approval, no further edits
- **Approved** → Credit posted to customer account
- **Rejected** → Returned to creator with comments
- **Finalized** → Completed and locked

{{< callout type="warning" >}}
**Important**: Once a refund note is **Finalized**, it cannot be edited or deleted. If a correction is needed, create a new refund note or use a Debit Note to reverse the credit.
{{< /callout >}}

---

### Line Items

The Line Items view provides a consolidated listing of all refund line items across all refund notes.

**Listing View:**
- Aggregated view of all line items across all refund notes
- Columns: Item Code, Item Name, Quantity, Unit Price, Amount, Refund Note No., Customer
- Search and filter by item, customer, or refund note
- Useful for analyzing refund patterns by product

**Line Item Fields:**

| Field | Description |
|-------|-------------|
| **Item** | Product/service being refunded |
| **Description** | Line-level description |
| **Quantity** | Number of units being refunded |
| **Unit Price** | Price per unit |
| **Discount** | Line-level discount (if applicable) |
| **Tax Code** | Applied tax code |
| **Tax Amount** | Calculated tax |
| **Amount** | Line total (Qty × Price − Discount + Tax) |
| **Return Reason** | Reason code for the refund |
| **Remarks** | Additional notes |

---

### Intercompany

Handles cross-company refund transactions for organizations with multiple legal entities.

**Key Features:**
- Automatic creation of corresponding intercompany transactions
- Maps the selling entity's refund to the receiving entity's accounts
- Maintains audit trail across entities
- Supports multi-currency intercompany postings

**When to Use:**
- Customer purchased from Company A but returns to Company B
- Centralized refund processing across multiple entities
- Inter-entity billing adjustments

---

### File Export

Export refund note data for external reporting, integration, or archival.

**Available Export Options:**
- Export by date range, customer, branch, or status
- Supported formats: CSV, Excel
- Includes header and line item details
- Configurable column selection

**How to Export:**
1. Navigate to **File Export** from the sidebar
2. Set filters (date range, status, customer, etc.)
3. Select export format
4. Click **Export** → File downloads to your device

---

### File Import

Bulk import refund notes from external files.

**Supported Import Format:**
- CSV or Excel files with predefined column structure
- Template available for download within the import screen

**How to Import:**
1. Navigate to **File Import** from the sidebar
2. Download the import template
3. Fill in refund note data following the template format
4. Upload the completed file
5. Preview and validate the imported data
6. Confirm import → Refund notes are created as Drafts

{{< callout type="warning" >}}
**Important**: Imported refund notes are always created in **Draft** status. Each must be reviewed and submitted individually for approval.
{{< /callout >}}

---

## Settings

{{< callout type="info" >}}
**Access Required**: Settings are only accessible to users with **Owner** or **Admin** roles.
{{< /callout >}}

Access Settings from the gear icon (⚙️) at the bottom of the sidebar.

### Application Settings (Settings → Application Settings)

Control applet-level field visibility, mandatory fields, and system behavior.

**Key Configurations:**
- Toggle field visibility for listing columns and edit forms
- Set mandatory fields for data entry
- Configure default values for frequently used fields
- Enable/disable specific features (e.g., intercompany, file import)

### Default Selection (Settings → Default Selection)

Pre-set default values that auto-populate when creating new refund notes.

**Available Defaults:**
- Default Branch
- Default Currency
- Default Tax Code
- Default Reason Code

### Printable Format Settings (Settings → Printable Format Settings)

Configure the layout and content of printed refund note documents.

**Key Configurations:**
- Select template layout (standard, compact, detailed)
- Configure company header (logo, address, registration number)
- Toggle optional sections (terms & conditions, bank details, notes)
- Set paper size and orientation
- Footer customization

### Return Reasons Settings (Settings → Return Reasons Settings)

Manage the list of return reason codes available when creating refund line items.

**Key Features:**
- Create custom reason codes (e.g., Defective, Wrong Item, Price Adjustment, Warranty Claim)
- Activate or deactivate reason codes
- Set default reason code
- Reason codes appear as dropdown selections in line items

### Branch Settings (Settings → Branch Settings)

Configure branch-specific behavior for refund note processing.

**Key Configurations:**
- Branch-level numbering sequences
- Branch-specific approval routing
- Default GL accounts per branch
- Branch operating parameters

### Workflow Settings (Settings → Workflow Settings)

Define approval workflows for refund note processing.

**Key Configurations:**
- Set approval levels (e.g., single approver, multi-level)
- Define approval thresholds (e.g., auto-approve below RM 500)
- Configure approver assignments (by role, department, or specific user)
- Set notification preferences for approval requests

---

## Personalization

Access Personalization from the profile icon at the bottom of the sidebar.

### Default Selection (Personalization → Default Selection)

Set your personal default values that auto-populate when **you** create refund notes. These override company-level defaults for your account only.

**Available Personal Defaults:**
- Your preferred default branch
- Your preferred default currency
- Your preferred listing filters and sorting

---

## Integration Points

### Related Applets

| Applet | Integration | Data Flow |
|--------|-------------|-----------|
| **[Sales Invoice Applet](/applets/sales-invoice-applet/)** | Original invoice referenced by refund note | Invoice → Refund Note |
| **[Sales Credit Note Applet](/applets/sales-credit-note-applet/)** | Credit notes for non-return adjustments | Complementary applets |
| **[Receipt Voucher Applet](/applets/receipt-voucher-applet/)** | Refund settlement via payment reversal | Refund Note → Settlement |
| **[Customer Applet](/applets/customer-applet/)** | Customer master data | Customer → Refund Note |
| **[Sales Return Applet](/applets/sales-return-applet/)** | Physical goods return processing | Return → Refund Note |
| **[Chart of Account Applet](/applets/chart-of-account-applet/)** | GL account posting | Refund → GL Entries |

### Module Integration

| Module | Purpose | Data Flow |
|--------|---------|-----------|
| **Sales** | Revenue adjustment and customer credit | Refund → AR Ledger |
| **Finance** | General ledger posting | Refund → GL Journal |
| **Inventory** | Stock-in for returned goods (via Sales Return) | Return → Stock In |
| **Tax** | Tax reversal on refunded amounts | Refund → Tax Adjustment |

---

## Troubleshooting

### Common Issues

#### Refund Note Stuck in "Submitted" Status
**Problem**: A submitted refund note is not progressing to Approved.
**Symptoms**: Status remains "Submitted" for an extended period.
**Solution**:
1. Check **Workflow Settings** to verify the approver is correctly configured
2. Verify the assigned approver has access to the applet
3. Contact the approver to review pending items
4. If the approver is unavailable, an Admin can reassign the approval
**Prevention**: Configure backup approvers in Workflow Settings.

#### Line Item Amount Calculation Error
**Problem**: Line item totals don't match expected amounts.
**Symptoms**: The calculated total differs from the manual calculation.
**Solution**:
1. Verify the **Unit Price** and **Quantity** are correct
2. Check if a **Discount** has been applied at the line level
3. Verify the **Tax Code** and tax rate are correct
4. Check for rounding differences in multi-currency transactions
**Prevention**: Review tax settings and rounding rules in Application Settings.

#### Intercompany Transaction Not Created
**Problem**: Approving a refund note does not create the corresponding intercompany transaction.
**Symptoms**: The receiving entity shows no matching transaction.
**Solution**:
1. Verify the customer is mapped to the correct intercompany entity
2. Check that intercompany settings are enabled in Application Settings
3. Ensure the receiving entity has the corresponding applet installed
**Prevention**: Test intercompany setup with a small transaction before processing in bulk.

#### File Import Validation Errors
**Problem**: Uploaded file shows validation errors during import preview.
**Symptoms**: Red error indicators on specific rows in the import preview.
**Solution**:
1. Download the latest import template to ensure the correct format is used
2. Verify all mandatory columns are populated (Customer, Item, Quantity, Price)
3. Check that customer codes and item codes match existing master data
4. Remove any special characters from text fields
**Prevention**: Always use the latest template and validate data before upload.

---

## Best Practices

### Operational Best Practices
- **Always reference the original invoice** — Link refund notes to the original sales invoice for complete audit trail
- **Use reason codes consistently** — Standardize return reason codes across all branches for accurate reporting
- **Review before finalizing** — Once finalized, refund notes cannot be edited
- **Process refunds promptly** — Delayed refund processing impacts customer satisfaction and aging reports

### Configuration Best Practices
- **Set approval thresholds** — Auto-approve small refunds (e.g., below RM 500) to reduce bottleneck
- **Configure printable formats** — Professional refund note documents build customer confidence
- **Branch-specific numbering** — Use branch prefixes in numbering for easy identification (e.g., KL-RFN-0001)

### Security Best Practices
- **Segregation of duties** — Ensure the refund creator and approver are different people
- **Access control** — Restrict settings to Owners and Admins only
- **Regular audit** — Review refund note reports periodically for unusual patterns

---

## Related Documentation Links

### Related Applets
- **[Sales Invoice Applet](/applets/sales-invoice-applet/)** — Original sales invoice management
- **[Sales Credit Note Applet](/applets/sales-credit-note-applet/)** — Credit note processing
- **[Sales Return Applet](/applets/sales-return-applet/)** — Physical goods return handling
- **[Receipt Voucher Applet](/applets/receipt-voucher-applet/)** — Payment and refund settlement
- **[Customer Applet](/applets/customer-applet/)** — Customer master data management

### Core Documentation
- **[BigLedger User Guide](/user-guide/)** — Overall system documentation
- **[Sales Module](/modules/sales/)** — Sales module overview
- **[Guides](/guides/)** — Getting started and implementation guides

{{< callout type="info" >}}
**Need Help?** For additional support with this applet, contact your system administrator or refer to the [Guides](/guides/) section for implementation assistance.
{{< /callout >}}
