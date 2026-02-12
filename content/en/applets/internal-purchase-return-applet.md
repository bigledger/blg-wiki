---
title: "Internal Purchase Return Applet"
description: "Comprehensive purchase return management system for handling supplier returns, inventory adjustments, and financial reconciliation."
tags:
- purchase-management
- supplier-returns
- inventory-adjustment
- financial-posting
- document-tracing
weight: 102
date: 2026-02-06
draft: false
---

## Purpose and Overview

The **Internal Purchase Return Applet** is used to record and manage the return of goods to a supplier. A purchase return typically results in a **refund**, **credit note**, or **contra against an existing purchase invoice**.

{{< callout type="info" >}}
**Core Concept**: This applet bridges **Procurement** (Purchase Documents) with **Financial Control** (Supplier Accounts), ensuring accurate inventory adjustments and proper supplier account reconciliation.
{{< /callout >}}

This applet ensures:
- Accurate inventory adjustments  
- Proper supplier account reconciliation  
- Full audit trail and document traceability  

### Common Use Cases
- Incorrect items received  
- Damaged or defective goods  
- Excess quantity received or ordered  
- Pricing or system errors in the original purchase transaction  

---

## Key Features Overview

{{< cards >}}
  {{< card title="Transaction Listing" subtitle="View and track all purchase returns" link="#listing-capabilities" >}}

  {{< card title="Create from Document" subtitle="Link returns to existing PO/GRN" link="#method-2-create-from-existing-document-recommended" >}}

  {{< card title="e-Invoice" subtitle="Submit self-billed returns for compliance" link="#e-invoice" >}}

  {{< card title="ARAP" subtitle="Track supplier payable impact" link="#arap-accounts-receivable--accounts-payable" >}}

  {{< card title="Contra" subtitle="Offset against purchase invoices" link="#contra" >}}

  {{< card title="Settlement" subtitle="Record cash refunds from suppliers" link="#settlement" >}}

  {{< card title="Document Tracing" subtitle="Full audit trail and linkage" link="#trace-document--link" >}}

  {{< card title="Attachments" subtitle="Upload supporting documents" link="#attachment" >}}
{{< /cards >}}

---

## Applet Navigation & Listing View

The listing screen provides a centralized view of all purchase return transactions.

### Listing Capabilities
- **Advanced Search**
  - Filter by:
    - Supplier
    - Branch
    - Transaction date
    - Purchaser
    - Posting status
    - GL dimension
- **Customizable Grid View**
  - Drag, reorder, or hide columns
  - Save preferred views for daily operations
- **Line Item Listing**
  - Switch to item-level view
  - Review returned quantities and values across multiple documents
- **Export Function**
  - Export listings for reporting, reconciliation, or audit purposes

---

## Creating a Purchase Return

There are **two supported methods** to create a purchase return document.

---

### Method 1: Manual Creation
Use this method when the return is **not linked** to any existing purchase document.

#### Steps
1. Click the **➕ (Add)** button
2. **Main Details**
   - Branch
   - Location
   - Delivery branch & location
   - Currency
   - Transaction date (auto-populated)
   - Purchaser (optional)
3. **Account**
   - Select the supplier account
4. **Line Items**
   - Search and add items
   - Enter return quantity and unit price
5. **Save Options**
   - **Save** → Document remains in *Draft* status
   - **Final** → Document moves to *Final* status and may trigger a printable document

#### Notes
- Draft documents do **not** affect inventory or accounting
- Only finalized documents post financial and stock impact

---

### Method 2: Create from Existing Document (Recommended)
This method improves accuracy and reduces manual input.

#### Steps
1. Click **➕ (Add)** and use **Search Existing Document**
2. Search by:
   - Supplier
   - Purchase Invoice
   - Goods Received Note (GRN)
   - Serial number
3. **Item Selection**
   - **Add All** → Return all items from the source document
   - **Add Selected** → Specify exact quantities per item
4. Review auto-loaded information
5. Click **Final** to complete the transaction

#### Advantages
- Ensures correct pricing and item references
- Maintains clear document linkage and traceability

---

## Document Status Lifecycle

A purchase return document follows a standard lifecycle:

| Status | Description | System Impact |
|--------|-------------|---------------|
| **Draft** | Working document, editable | No accounting or inventory impact |
| **Final** | Locked document | Inventory adjusted, Supplier account updated |

---

## Document Tabs & Functional Modules

Each purchase return document includes multiple functional tabs to support advanced operations.

### e-Invoice
- Used for:
  - Self-billed purchase returns
  - Credit note or debit note processing
- Submit eligible documents for e-invoice validation and LHDN compliance

### ARAP (Accounts Receivable / Accounts Payable)
- Displays:
  - Outstanding balances
  - Impact on supplier payable accounts
- Track the financial effect of the return on your AP ledger

### Contra
- Offset the purchase return against:
  - Existing purchase invoices
- Commonly used when suppliers issue credits instead of cash refunds
- Reduces manual payment processing

### Settlement
- Used when the supplier provides a **cash refund**
- Record payment method, amount, and settlement details
- Creates corresponding payment transaction

### Trace Document & Link
- View all related upstream and downstream documents
- Supports audit review and transaction tracking
- Links to: Purchase Order, GRN, Purchase Invoice, Payments

### Attachment
- Upload supporting documents such as:
  - Supplier emails
  - Photos of damaged goods
  - Credit note references
- All attachments stored with the document for audit purposes

### Export
- Generate and print the official printable version of the purchase return document
- Customize format via Printable Format Settings

---

## Applet Reference

This section provides a comprehensive reference of all menu items and settings available in the Internal Purchase Return Applet.

### Menu Items

The following main navigation menu items are available in the applet:

| Menu Item | Description | Route Path |
|-----------|-------------|------------|
| **Purchase Return** | Main listing of all purchase return transactions | `/purchase-return` |
| **Line Items** | Detailed line-by-line item reports for granular analysis | `/line-items` |
| **Settings** | Administrative configuration panel | `/settings` |
| **Personalization** | User-specific preference settings | `/personalization` |

### Settings Sub-Menu Items

The Settings panel contains the following configuration sections:

| Setting | Description | Route Path |
|---------|-------------|------------|
| **Default Selection** | Configure default branch, location, and other selection defaults | `/settings/default-selection` |
| **Field Settings** | Toggle visibility and behavior of form fields | `/settings/field-settings` |
| **Printable Format Settings** | Customize PDF layouts for Purchase Return documents | `/settings/printable-format-settings` |
| **Webhook** | Set up event-driven integrations with external systems | `/settings/webhook` |
| **Feature Visibility** | Control which features are visible to users | `/settings/feature-visibility` |
| **Permission Set Listing** | Manage predefined permission sets | `/settings/permission-set-listing` |
| **User Permission Listing** | Configure individual user permissions | `/settings/user-permission-listing` |
| **Team Permission Listing** | Configure team-based permissions | `/settings/team-permission-listing` |
| **Role Permission Listing** | Configure role-based permissions | `/settings/role-permission-listing` |
| **Client-Side Permission Listing** | Manage UI/display-level permissions | `/settings/client-side-permission-listing` |

### Personalization Sub-Menu Items

User-level personalization options:

| Setting | Description | Route Path |
|---------|-------------|------------|
| **Personal Default Selection** | Set personal defaults for branch, location, etc. | `/personalization/personal-default-selection` |
| **Sidebar** | Customize sidebar layout and menu visibility | `/personalization/sidebar` |

---

## Configuration & User Permissions

Users with appropriate administrative access can configure the applet via **Settings**.

{{< figure src="/images/internal-sales-invoice-applet/settings-page.png" alt="Applet Settings Interface" caption="Configure default branches, layouts, and permissions." >}}

### Configurable Options
- Show or hide specific tabs
- Control visibility of action buttons (e.g., Contra, Settlement)
- Restrict fields or functions based on user roles

### Purpose
- Simplify user workflows
- Enforce internal controls
- Align system behavior with company policies

### Permission Types

The applet supports **multiple permission levels** for granular access control:

{{< figure src="/images/claim-applet/pending-approvals.png" alt="Permission Management" caption="Centralized dashboard for managing user and role permissions." >}}

| Permission Type | Description |
|-----------------|-------------|
| **Permission Set** | Predefined bundles of permissions that fa can be assigned to users/roles |
| **User Permission** | Direct permission assignments to individual users |
| **Team Permission** | Permissions granted to all members of a team |
| **Role Permission** | Permissions based on organizational roles |
| **Client-Side Permission** | UI-level feature visibility controls |

---

## Operational Best Practices

1. **Always link to original purchase documents when possible**
   - Improves traceability and ensures correct pricing
2. **Review quantities carefully before finalizing**
   - Finalized documents cannot be edited
3. **Attach supporting evidence for audit clarity**
   - Photos of damaged goods, supplier correspondence
4. **Use Contra or Settlement tabs appropriately based on supplier arrangement**
   - Contra for credit offsets, Settlement for cash refunds
5. **Verify e-Invoice compliance before submission**
   - Ensure all required fields are populated

---

## Summary

The **Internal Purchase Return Applet (PUR RTN)** provides a structured and auditable process for handling supplier returns. Proper usage ensures accurate inventory records, compliant accounting entries, and clear transaction traceability across the ERP system.

Key benefits:
- **Inventory Accuracy**: Automatic stock adjustments on finalization
- **Financial Integrity**: Proper AP posting and supplier account reconciliation
- **Compliance Ready**: e-Invoice support for self-billed returns
- **Full Auditability**: Document tracing and attachment support
