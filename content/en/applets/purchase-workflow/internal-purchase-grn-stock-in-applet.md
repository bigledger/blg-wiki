---
title: "Internal Purchase GRN Stock In Applet"
description: "Goods Received Note (GRN) management for processing stock-in operations linked to internal purchase transactions"
tags:
- grn
- goods-received-note
- stock-in
- purchase-receiving
- inventory-management
- warehouse-operations
---

## Purpose and Overview

The **Internal Purchase GRN Stock In Applet** manages the creation and processing of Goods Received Notes (GRN) for internal purchase transactions. A GRN is the document that records and confirms the physical receipt of goods into a warehouse, linking the received stock to the originating purchase order.

{{< callout type="info" >}}
**Core Concept**: A GRN is your proof that goods have arrived at the warehouse. It connects a purchase transaction to the actual physical stock received, ensuring inventory records and supplier accounts stay accurate.
{{< /callout >}}

### Who Benefits from This Applet?

**Warehouse / Receiving Staff:**
- Record goods received from suppliers accurately
- Verify received quantities against purchase order quantities
- Specify delivery branch and location for multi-location operations
- Generate receiving documentation

**Purchasing Teams:**
- Track fulfillment status of purchase orders
- Monitor supplier delivery performance
- Link GRN records to purchase invoices for three-way matching

**Inventory Managers:**
- Monitor real-time stock-in movements
- View line-item level receiving history across all transactions
- Reconcile physical receipts with expected deliveries

**Finance Teams:**
- Enable three-way matching (PO â†’ GRN â†’ Invoice)
- Track supplier credit terms and foreign exchange rates
- Maintain complete audit trail for goods received
- Support multi-currency purchasing

### What Problems Does This Solve?

**Traditional Goods Receiving Challenges:**
- Manual stock-in records leading to inventory inaccuracies
- No systematic way to verify what was ordered vs. what was received
- Poor reconciliation between purchasing, warehouse, and finance
- Forex rate discrepancies on international purchases
- No paper trail for goods entering the warehouse

**The GRN Stock In Solution:**
- **Automated stock addition** â€” Stock levels update automatically when a GRN is finalized
- **Purchase linkage** â€” Every GRN ties back to the originating purchase transaction
- **Multi-currency support** â€” Handle forex rates and base currency conversion
- **Delivery branch tracking** â€” Record goods received at a different branch than the ordering branch
- **Custom status workflows** â€” Define custom status fields to track receiving stages
- **Printable formats** â€” Generate professional GRN documents for suppliers and internal records

## Key Features Overview

{{< cards >}}
  {{< card title="GRN Stock In" subtitle="Create and manage Goods Received Notes for purchase fulfillment" link="#grn-stock-in" >}}

  {{< card title="Line Items" subtitle="View all GRN line items across transactions" link="#line-items" >}}

  {{< card title="Settings" subtitle="Configure defaults, branch settings, custom statuses, and print formats" link="#configuration--settings" >}}

  {{< card title="Personalization" subtitle="Set your personal default preferences" link="#personalization" >}}
{{< /cards >}}

---

## Key Concepts

### GRN Stock In Lifecycle

```
Purchase Order Placed â†’ Goods Arrive â†’ GRN Created â†’ Items Verified â†’ GRN Finalized â†’ Stock Added
          â”‚                  â”‚              â”‚               â”‚               â”‚               â”‚
          â”‚                  â”‚              â”‚               â”‚               â”‚               â””â”€â”€ Inventory updated
          â”‚                  â”‚              â”‚               â”‚               â””â”€â”€ Document locked
          â”‚                  â”‚              â”‚               â””â”€â”€ Qty checked vs PO
          â”‚                  â”‚              â””â”€â”€ GRN header + lines created
          â”‚                  â””â”€â”€ Physical delivery received
          â””â”€â”€ Originating purchase transaction
```

### Three-Way Matching

The GRN is a critical component of **three-way matching** in the procure-to-pay process:

| Step | Document | What It Proves |
|------|----------|---------------|
| **1** | **Purchase Order (PO)** | What was ordered and at what price |
| **2** | **GRN** | What was physically received |
| **3** | **Purchase Invoice** | What the supplier is billing |

{{< callout type="tip" >}}
**Why Three-Way Matching Matters**: Before paying a supplier, finance verifies that the invoice matches both the PO (price) and the GRN (quantity). This prevents overpayment, duplicate billing, and payment for goods never received.
{{< /callout >}}

### Key Terms

| Term | Definition | Example |
|------|------------|---------|
| **GRN** | Goods Received Note â€” document confirming physical receipt of goods | GRN-2024-005678 |
| **Stock In** | Physical addition of inventory into the warehouse | 100 units of SKU-B002 received |
| **Delivery Branch** | The branch where goods are physically received (may differ from ordering branch) | Penang Warehouse |
| **Credit Terms** | Supplier payment terms | Net 60, Net 30 |
| **Forex Rate** | Currency exchange rate for international purchases | 1 USD = 4.47 MYR |
| **Custom Status** | User-defined status fields for tracking receiving workflows | Quality Check, Shelf Allocation |

---

## Quick Start Guide

### For Receiving Staff: Process a Goods Receipt

**Goal:** Create a GRN to record goods received from a supplier

1. **Navigate**: Go to **Internal Purchase GRN Stock In** from the sidebar
2. **Create New**: Click **"+"** to create a new GRN
3. **Fill Header Details**:
   - Select **Company** and **Branch**
   - Select **Location** (receiving warehouse)
   - Select **Purchaser** (buyer responsible)
   - Set **Transaction Date**
   - Set **Delivery Branch** and **Delivery Location** (if different from ordering branch)
   - Select **Currency** and verify **Currency Rate**
   - Add **Reference** number (e.g., purchase order number)
4. **Add Line Items**:
   - Select items received
   - Enter received quantities
   - Verify against purchase order
5. **Finalize**: Submit the GRN to trigger stock-in

### For Purchasing Managers: Track Receipts

**Goal:** Monitor goods received across all purchase orders

1. **Navigate**: Go to **Line Items** from the sidebar
2. **Filter**: Use column filters to find items by supplier, date, or branch
3. **Verify**: Compare received quantities against purchase orders
4. **Export**: Generate reports for analysis

---

## GRN Stock In

The GRN Stock In listing is the main entry point for viewing and managing all Goods Received Notes. Each row represents a GRN document.

### Listing View

The listing displays all GRN records with key columns including GRN number, transaction date, branch, location, supplier, currency, and status. You can search, filter, and sort by any column.

### Create a GRN

Click the **"+"** button to create a new GRN. The create form includes:

**Main Details:**

| Field | Description | Required |
|-------|-------------|----------|
| **Doc Description** | Description for the GRN document | No |
| **Company** | The company entity receiving goods | Yes |
| **Branch** | Branch that placed the purchase order | Yes |
| **Location** | Warehouse location for stock-in | Yes |
| **Purchaser** | Buyer responsible for the purchase | No |
| **Transaction Date** | Date goods were received | Yes |
| **Credit Terms** | Supplier payment terms | No |
| **Credit Limit** | Supplier credit limit | No |
| **Reference** | External reference (PO number, DO number) | No |
| **Remarks** | Internal notes | No |
| **External Remarks** | Remarks visible on external documents | No |
| **Permit No** | Import permit number if applicable | No |
| **Base Currency** | Organization's base currency | Auto |
| **Currency** | Transaction currency | Yes |
| **Currency Rate** | Exchange rate (base to transaction currency) | Auto/Manual |
| **Tracking ID** | Shipment tracking reference | No |
| **Delivery Branch** | Branch where goods are delivered (if different from ordering branch) | No |
| **Delivery Location** | Specific delivery location within the delivery branch | No |

**Additional Sections:**
- **Department Details** â€” Segment, Dimension, Profit Center, Project
- **Billing Info & Address** â€” Supplier billing details including contact person, email, phone, and full address
- **Shipping Info & Address** â€” Delivery recipient details including contact person, email, phone, and full address
- **Custom Document References** â€” Up to 5 custom reference fields (xtn_doc_ref_1 through xtn_doc_ref_5)
- **Custom Status Fields** â€” Up to 5 configurable status fields for workflow tracking

### View / Edit a GRN

Double-click any row in the listing to open the full GRN record. You can view all header details, line items, attachments, and related documents.

---

## Line Items

The Line Items page provides a flattened, cross-transaction view of all individual items across all GRN documents. This is useful for:

- **Tracking specific products** â€” Find every receipt of a particular item across all GRNs
- **Supplier analysis** â€” Review what has been received from specific suppliers
- **Quantity verification** â€” Cross-reference received quantities against purchase orders
- **Audit purposes** â€” Trace individual line items back to their parent GRN documents
- **Filtering and search** â€” Filter by item code, description, branch, supplier, or date range

---

## Configuration & Settings

The Settings page provides access to system configuration options for the GRN Stock In applet.

### Application Settings

Configure field-level visibility, access controls, and feature toggles for various modules within the applet. Control which fields are required, optional, or hidden.

### Default Selection

Set the default **Branch** and **Location** values that will be pre-filled when creating new GRN records. This saves time for users who primarily receive goods at a single location.

### Printable Format Settings

Manage the available print templates for GRN documents. Configure which Jasper report formats are available for generating printable GRN documents for supplier acknowledgment and internal records.

### Branch Settings

Configure branch-specific settings that control behavior per branch. This is particularly useful in multi-branch operations where different branches may have different receiving workflows or requirements.

### Custom Status

Define custom status fields that can be used to track additional workflow stages beyond the standard GRN lifecycle. For example:
- **Quality Inspection** â€” Pending / Passed / Failed
- **Shelf Allocation** â€” Unassigned / Assigned / Stocked

Custom statuses allow you to extend the applet's tracking capabilities to match your organization's receiving processes.

**Summary of Settings:**

| Setting | Purpose |
|---------|---------|
| Application Settings | Toggle field visibility and feature access |
| Default Selection | Pre-fill Branch and Location for new records |
| Printable Format Settings | Configure print templates for GRN documents |
| Branch Settings | Branch-specific receiving configurations |
| Custom Status | Define custom workflow status fields |

**Server Side Permissions (accessible from Settings):**

| Setting | Purpose |
|---------|---------|
| Permission Wizard | Guided permission setup |
| Permission Set | Define permission groups |
| Client Side Permission | Configure UI-level permissions |
| Role Pricing Scheme Link | Link pricing schemes to user roles |
| User Permission | Assign permissions to specific users |
| Team Permission | Assign permissions to teams |
| Role Permission | Assign permissions by role |

**Developer Tools (accessible from Settings):**

| Setting | Purpose |
|---------|---------|
| Release Notes | View applet version history |
| Applet Log | Check applet activity and error logs |

---

## Personalization

The Personalization section lets individual users set their own preferences that override the system-wide defaults.

### Default Selection

Set your personal default **Branch** and **Location**. When you create a new GRN, these values will be pre-filled instead of the system defaults.

---

## FAQ

**Q: What is the difference between Branch and Delivery Branch?**
A: **Branch** is the organizational branch that placed the purchase order. **Delivery Branch** is where the goods are physically received. These may differ when a central purchasing team orders on behalf of a regional warehouse.

**Q: Does finalizing a GRN automatically increase stock?**
A: Yes. Once a GRN is finalized, the system automatically adds the received quantities to the inventory at the specified delivery branch and location.

**Q: How do I handle partial deliveries?**
A: Create a GRN for the quantity actually received. The remaining items can be recorded in a subsequent GRN when they arrive. Each GRN document records what was physically received at a specific point in time.

**Q: Can I receive goods in a different currency?**
A: Yes. The applet supports multi-currency transactions. Select the supplier's currency and set the exchange rate. The system will convert to your base currency for accounting purposes.

**Q: What are the Custom Status fields used for?**
A: Custom Status fields allow you to track additional workflow stages specific to your organization. For example, you might add statuses for "Quality Check," "Shelf Allocation," or "Manager Approval." Configure these in **Settings > Custom Status**.

**Q: How do I link a GRN to a Purchase Invoice?**
A: The GRN is typically linked via the Reference field or through the purchase document flow (Purchase Order â†’ GRN â†’ Purchase Invoice). This enables three-way matching for payment verification.

**Q: Can I reverse or cancel a finalized GRN?**
A: Finalized GRNs cannot be directly edited. You would need to create a purchase return or adjustment document to reverse the stock-in movement.

**Q: What are the extra document reference fields (xtn_doc_ref) for?**
A: These are five flexible reference fields that can be used to store additional document references specific to your business process, such as customs declaration numbers, container numbers, or logistics tracking IDs.


