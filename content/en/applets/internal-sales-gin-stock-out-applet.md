---
title: "Internal Sales GIN Stock Out Applet"
description: "Goods Issue Note (GIN) management for processing stock-out operations linked to internal sales transactions"
tags:
- gin
- goods-issue-note
- stock-out
- sales-fulfillment
- inventory-management
- warehouse-operations
---

## Purpose and Overview

The **Internal Sales GIN Stock Out Applet** manages the creation and processing of Goods Issue Notes (GIN) for internal sales transactions. A GIN is the document that authorizes and records the physical release of stock from a warehouse location when fulfilling a sales order.

{{< callout type="info" >}}
**Core Concept**: A GIN is your proof that goods have left the warehouse. It connects a sales transaction to the actual physical stock movement, ensuring your inventory records stay accurate.
{{< /callout >}}

### Who Benefits from This Applet?

**Warehouse Staff:**
- Process stock-out requests efficiently
- Record which items are being issued and from which location
- Generate picking and packing documentation

**Sales Operations:**
- Track fulfillment status of sales orders
- Ensure goods are dispatched on time
- Link GIN records to sales invoices for complete traceability

**Inventory Managers:**
- Monitor real-time stock movements
- Identify stock discrepancies early
- View line-item level stock-out history across all transactions

**Finance Teams:**
- Reconcile physical stock movements with financial records
- Track cost of goods sold accurately
- Maintain audit trail for stock issues

### What Problems Does This Solve?

**Traditional Stock-Out Challenges:**
- Manual stock tracking leading to inventory mismatches
- No paper trail for goods leaving the warehouse
- Poor visibility into which sales orders have been fulfilled
- Difficult reconciliation between sales and warehouse teams

**The GIN Stock Out Solution:**
- **Automated stock deduction** — Stock levels update automatically when a GIN is finalized
- **Sales linkage** — Every GIN ties back to the originating sales transaction
- **Multi-location support** — Issue stock from the correct branch and location
- **Printable formats** — Generate professional GIN documents for warehouse and customer records

## Key Features Overview

{{< cards >}}
  {{< card title="GIN Stock Out" subtitle="Create and manage Goods Issue Notes for sales fulfillment" link="#gin-stock-out" >}}

  {{< card title="Line Items" subtitle="View all GIN line items across transactions" link="#line-items" >}}

  {{< card title="Settings" subtitle="Configure default selections and print formats" link="#configuration--settings" >}}

  {{< card title="Personalization" subtitle="Set your personal default preferences" link="#personalization" >}}
{{< /cards >}}

---

## Key Concepts

### GIN Stock Out Lifecycle

```
Sales Order Received → GIN Created → Items Picked → GIN Finalized → Stock Deducted
        │                   │             │              │                │
        │                   │             │              │                └── Inventory updated
        │                   │             │              └── Document locked
        │                   │             └── Warehouse picks items
        │                   └── GIN header + line items created
        └── Originating sales transaction
```

### Key Terms

| Term | Definition | Example |
|------|------------|---------|
| **GIN** | Goods Issue Note — document authorizing stock release | GIN-2024-001234 |
| **Stock Out** | Physical removal of inventory from warehouse | 50 units of SKU-A001 issued |
| **Line Item** | Individual product entry within a GIN | Item: Laptop, Qty: 5, Location: W-001 |
| **Sales Agent** | Person responsible for the sales transaction | John (Sales Rep) |
| **Credit Terms** | Payment terms linked to the transaction | Net 30, COD |

---

## Quick Start Guide

### For Warehouse Staff: Process a Stock Out

**Goal:** Create a GIN to issue stock for a sales order

1. **Navigate**: Go to **Internal Sales GIN Stock Out** from the sidebar
2. **Create New**: Click **"+"** to create a new GIN
3. **Fill Header Details**:
   - Select **Company** and **Branch**
   - Select **Location** (warehouse)
   - Select **Sales Agent** (if applicable)
   - Set **Transaction Date**
   - Add **Reference** number (e.g., sales order number)
4. **Add Line Items**:
   - Select items to be issued
   - Enter quantities
   - Verify stock availability
5. **Finalize**: Submit or finalize the GIN to trigger stock deduction

### For Managers: Review Stock Movements

**Goal:** Monitor stock-out activity across the team

1. **Navigate**: Go to **Line Items** from the sidebar
2. **Filter**: Use column filters to find specific items, dates, or branches
3. **Review**: Check item quantities and transaction details
4. **Export**: Use the export feature for reporting

---

## GIN Stock Out

The GIN Stock Out listing is the main entry point for viewing and managing all Goods Issue Notes. Each row represents a GIN document.

### Listing View

The listing displays all GIN records with key columns including GIN number, transaction date, branch, location, customer, currency, and status. You can search, filter, and sort by any column.

### Create a GIN

Click the **"+"** button to create a new GIN. The create form includes:

**Main Details:**

| Field | Description | Required |
|-------|-------------|----------|
| **Company** | The company entity issuing goods | Yes |
| **Branch** | Branch the stock is issued from | Yes |
| **Location** | Specific warehouse location | Yes |
| **Sales Agent** | Sales representative for this transaction | No |
| **Member Card** | Customer loyalty/member card number | No |
| **Transaction Date** | Date of the goods issue | Yes |
| **Credit Terms** | Payment terms | No |
| **Reference** | External reference number | No |
| **Remarks** | Additional notes | No |
| **Permit No** | Import/export permit if applicable | No |
| **Currency** | Transaction currency | Yes |
| **Tracking ID** | Shipment or tracking reference | No |
| **Due Date** | Payment due date | No |

**Additional Sections:**
- **Department Details** — Segment, Dimension, Profit Center, Project
- **Billing Info** — Customer billing name, email, phone
- **Billing Address** — Full billing address with country, city, state, postcode
- **Shipping Info** — Recipient name, email, phone
- **Shipping Address** — Full delivery address

### View / Edit a GIN

Double-click any row in the listing to open the full GIN record. You can view all header details, line items, attachments, and related documents.

---

## Line Items

The Line Items page provides a flattened, cross-transaction view of all individual items across all GIN documents. This is useful for:

- **Tracking specific products** — Find every instance of a particular item across all GINs
- **Bulk analysis** — View aggregate quantities issued over a period
- **Audit purposes** — Cross-reference individual line items with their parent GIN documents
- **Filtering and search** — Filter by item code, description, branch, or date range

---

## Configuration & Settings

The Settings page provides access to system configuration options for the GIN Stock Out applet.

### Application Settings

Configure field-level visibility and access controls for various modules and features within the applet. Toggle which fields are required, optional, or hidden.

### Default Selection

Set the default **Branch** and **Location** values that will be pre-filled when creating new GIN records. This saves time for users who primarily work from a single location.

### Printable Format Settings

Manage the available print templates for GIN documents. Configure which Jasper report formats are available for generating printable GIN documents for warehouse operations and customer records.

**Common System Configuration Settings (via Settings gear icon):**

| Setting | Purpose |
|---------|---------|
| Application Settings | Toggle field visibility and feature access |
| Default Selection | Pre-fill Branch and Location for new records |
| Printable Format Settings | Configure print templates for GIN documents |

**Server Side Permissions (accessible from Settings):**

| Setting | Purpose |
|---------|---------|
| Permission Set | Define permission groups |
| Client Side Permission | Configure UI-level permissions |
| User Permission | Assign permissions to specific users |
| Team Permission | Assign permissions to teams |
| Role Permission | Assign permissions by role |

---

## Personalization

The Personalization section lets individual users set their own preferences that override the system-wide defaults.

### Default Selection

Set your personal default **Branch** and **Location**. When you create a new GIN, these values will be pre-filled instead of the system defaults.

---

## FAQ

**Q: What is the difference between GIN and GDN (Goods Delivery Note)?**
A: A **GIN (Goods Issue Note)** records the physical release of stock from the warehouse. A **GDN (Goods Delivery Note)** records the delivery to the customer. A GIN may trigger a GDN, but they are separate documents.

**Q: Does finalizing a GIN automatically reduce stock?**
A: Yes. Once a GIN is finalized, the system automatically deducts the issued quantities from the specified warehouse location's inventory.

**Q: Can I issue stock from multiple locations in one GIN?**
A: Each GIN header is tied to a specific Branch and Location. To issue from multiple locations, create separate GIN documents.

**Q: Can I reverse or cancel a finalized GIN?**
A: Finalized GINs cannot be directly edited. You would need to create a return or adjustment document to reverse the stock movement.

**Q: How do I link a GIN to a Sales Invoice?**
A: The GIN is typically linked via the Reference field or through the upstream sales document flow (Sales Order → GIN → Invoice).

**Q: What currencies are supported?**
A: The applet supports multi-currency transactions. Select the appropriate currency when creating the GIN, and ensure your currency settings are configured in the system.
