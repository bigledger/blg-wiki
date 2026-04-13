---
title: "Sales Delivery Order Stock Out (Internal) Applet"
description: "Create and manage customer Delivery Orders while automatically reducing warehouse stock — combining delivery documentation and inventory management in one step."
tags:
- delivery-order
- stock-out
- sales-fulfillment
- inventory-management
- warehouse-operations
- logistics
weight: 45
---

## Purpose and Overview

The **Internal Sales Delivery Order Stock Out Applet** handles two things at once: it creates the **Delivery Order (DO)** document that goes with the goods to the customer, and it automatically **reduces your warehouse stock** the moment the DO is finalized.

Instead of managing delivery paperwork in one place and updating inventory in another, this applet ties them together — so when goods leave the warehouse, both the delivery record and the stock count update in a single action.

{{< callout type="info" >}}
**In plain English:** A Delivery Order is the document that travels with the goods and the customer signs upon receipt. This applet creates that document and simultaneously removes the items from your warehouse stock count.
{{< /callout >}}

### Who Benefits from This Applet?

**Warehouse & Logistics Teams:**
- Create DO documents directly from confirmed sales orders
- Know exactly what to pick, pack, and dispatch for each delivery
- Stock automatically updates — no separate stock-out step needed
- Record vehicle, driver, and transport company details per delivery

**Sales Operations:**
- Track which orders have been dispatched and which are pending
- Ensure every delivery has a proper document before goods leave the warehouse
- Link deliveries back to the originating Sales Order or Invoice
- Monitor delivery status from the listing view

**Inventory Managers:**
- Real-time stock deduction as deliveries are confirmed
- Line-item level view of all goods dispatched across all DOs
- Multi-branch and multi-location support
- Spot fulfilment trends and identify slow-moving stock

**Finance Teams:**
- Maintain a traceable link between delivery and invoice
- Audit-ready records with clear timestamps and user trail
- Reconcile dispatched goods with billing records

---

### What Problems Does This Solve?

**Before this applet**, teams often dealt with:
- Delivery dockets created manually on paper or in Word/Excel
- Stock updated separately (or forgotten entirely) after goods were dispatched
- No link between the delivery document and the original sales order
- Disputes with customers because there's no signed delivery record
- Warehouse staff unsure of quantities to pack without a formal picking document

**With this applet, you get:**
- **Delivery + stock-out in one action** — finalize a DO and stock deducts automatically
- **Clear delivery documentation** — professional, printable DO for the customer to sign
- **Full traceability** — every DO is linked to the sales transaction that triggered it
- **Consistent process** — every delivery follows the same documented workflow
- **Multi-location** — issue from the correct branch and warehouse location every time

---

## Key Features Overview

{{< cards >}}
  {{< card title="Delivery Order" subtitle="Create and manage DOs with full customer and delivery details" link="#delivery-order" >}}
  {{< card title="Stock Out" subtitle="Automatic inventory deduction when a DO is finalized" link="#stock-out-and-inventory" >}}
  {{< card title="Line Items" subtitle="Cross-transaction view of all items dispatched" link="#line-items" >}}
  {{< card title="KO (Knock-Off)" subtitle="Link DOs directly to Sales Orders or Invoices" link="#ko-knock-off" >}}
  {{< card title="Print & Export" subtitle="Generate delivery dockets and dispatch documents" link="#print--export" >}}
  {{< card title="Settings" subtitle="Configure defaults, permissions, and print templates" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-sales-delivery-order-stock-out-applet/internal-sales-delivery-order-stock-out-applet-overview-infographic.png" alt="Internal Sales Delivery Order Stock Out Applet Overview — create delivery orders and update inventory in one step" caption="From confirmed sale to dispatched goods — create the delivery document and reduce warehouse stock in a single finalized action." >}}

---

## Quick Start Guide

### Warehouse Staff: Create and Dispatch a Delivery Order

**Goal:** Process a delivery for a confirmed sales order.

1. Go to **Delivery Order** from the sidebar → click **"+"**
2. Fill in the header:
   - **Company** and **Branch** (where stock is being issued from)
   - **Location** (the specific warehouse location)
   - **Customer** (who the goods are going to)
   - **Delivery Date** (when it will be dispatched)
3. Add delivery details (optional but recommended):
   - **Vehicle** — the delivery vehicle
   - **Driver** — who is delivering
   - **Transport Company** — if using a third-party courier
4. Add line items — click **"+"** in the Lines section:
   - Select the **Item**
   - Enter the **Quantity** to deliver
   - Verify the **Location** the stock is coming from
5. Review all details → click **FINAL** to confirm the DO
6. Stock is automatically deducted and the DO is locked for printing

**Pro Tip:** Use the **KO (Knock-Off)** button to pull items directly from a Sales Order — saves re-entering every line item manually.

---

### Sales Operations: Track Delivery Status

**Goal:** See which orders have been dispatched and which haven't.

1. Go to **Delivery Order** from the sidebar
2. Use the search filters — filter by **Status**, **Customer**, **Date Range**, or **Branch**
3. Drafted DOs = not yet dispatched
4. Finalized DOs = goods have left the warehouse, stock has been deducted
5. Click any row to open the full DO record and see all delivery details

---

### Manager: Review All Dispatched Items

**Goal:** Get a line-item level view of everything dispatched.

1. Go to **Line Items** from the sidebar
2. Filter by item code, date range, branch, or customer
3. Use **Export** to download the data for reporting or reconciliation

---

## Features in Detail

### Delivery Order

The Delivery Order is the core document of this applet — it is the formal record of what goods are leaving the warehouse, when, and to whom.

**Header Fields:**

| Field | Description | Required |
|---|---|---|
| **Company** | The company entity dispatching the goods | Yes |
| **Branch** | Branch the stock is dispatched from | Yes |
| **Location** | Specific warehouse location | Yes |
| **Customer** | The customer receiving the goods | Yes |
| **Transaction Date** | Date of the delivery order | Yes |
| **Delivery Date** | When the goods will be/were delivered | No |
| **Reference** | External reference (e.g., customer PO number) | No |
| **Currency** | Transaction currency | Yes |
| **Credit Terms** | Payment terms for this delivery | No |
| **Sales Agent** | The salesperson responsible | No |
| **Tracking ID** | Courier tracking number | No |
| **Remarks** | Additional notes for the delivery | No |

**Delivery-Specific Fields:**

| Field | Description |
|---|---|
| **Vehicle** | Vehicle plate number or identifier |
| **Driver** | Name of the delivery driver |
| **Transport Company** | Third-party logistics provider |
| **Permit No** | Import/export permit if applicable |

**Additional Sections:**
- **Department Details** — Segment, Dimension, Profit Center, Project
- **Billing Info** — Customer billing name, email, phone
- **Billing Address** — Full billing address
- **Shipping Info** — Recipient name, email, phone
- **Shipping Address** — Full delivery address (can differ from billing)

---

### Stock Out and Inventory

When a Delivery Order is **finalized**, the system automatically:

1. Deducts the quantities in each line item from the specified warehouse location
2. Records a stock movement entry with the DO reference
3. Updates the available stock count in real time

{{< callout type="tip" >}}
**Stock only deducts on FINAL.** A DO in Draft status does not affect stock. This means you can create and review a DO without committing the inventory movement until you're ready to dispatch.
{{< /callout >}}

---

### KO (Knock-Off)

KO (Knock-Off) lets you **pull items directly from an existing Sales Order or Sales Invoice** into the Delivery Order, instead of manually entering every line item.

**How to use it:**
1. Open a new or draft DO
2. In the Lines section, click the **KO** button
3. Select the source document type (Sales Order or Sales Invoice)
4. Find and select the relevant document
5. The items and quantities are automatically populated into the DO lines

**Why this matters:** Without KO, staff would need to manually re-enter every item from the sales order into the DO — error-prone and time-consuming. KO makes the link automatic and ensures the DO exactly matches what was ordered.

---

### Line Items

The Line Items page gives you a **cross-transaction, flat view** of every individual item dispatched across all Delivery Orders. This is separate from looking inside a single DO.

Use this page to:
- Find how many units of a specific item have been dispatched over a period
- Audit individual dispatch records at the item level
- Filter by item code, date, branch, customer, or location
- Export dispatch data for reporting

---

### Print & Export

Each finalized Delivery Order can be printed as a delivery docket — the document that travels with the goods and the customer signs upon receipt.

- Click **PRINT** inside any finalized DO to generate the document
- Multiple print format templates can be configured via **Settings → Printable Format Settings**
- Use **EXPORT** from the listing for bulk data export

---

## Configuration & Settings

### Default Selection
Set default **Branch** and **Location** values that auto-fill when creating new DOs. Saves time for warehouse staff who always work from the same location.

### Printable Format Settings
Upload and manage print templates for Delivery Order documents. Configure which Jasper report format is used for the delivery docket that customers sign.

### Permission Settings
Control who can create, edit, finalize, or void Delivery Orders. Permissions can be assigned by user, team, or role.

---

## Personalization

Each user can set their own preferred **Branch** and **Location** defaults under **Personalization → Default Selection**. These override the system-wide defaults for that individual user only.

---

## Glossary

| Term | Plain English meaning |
|---|---|
| **Delivery Order (DO)** | A document that authorizes the release and delivery of goods to a customer. The customer typically signs it as proof of receipt. |
| **Stock Out** | The process of physically removing items from warehouse inventory when goods are dispatched. |
| **KO / Knock-Off** | Linking a new document (like a DO) to an existing upstream document (like a Sales Order) so items are pulled across automatically rather than re-entered manually. |
| **Finalize** | The action of locking a document as complete. For a DO, this triggers the stock deduction and prevents further editing. |
| **Line Item** | A single product entry within a Delivery Order — specifying the item, quantity, and location it's dispatched from. |
| **GIN (Goods Issue Note)** | A related document type that records the internal warehouse release of stock. A DO is customer-facing; a GIN is more internal. Some workflows use both. |
| **Branch** | A physical operating location of the company (e.g., KL Branch, JB Branch). |
| **Location** | A specific area within a branch, typically a warehouse or stockroom (e.g., Main Warehouse, Rack A). |
| **Transport Company** | A third-party logistics or courier company used to deliver goods to the customer. |
| **Credit Terms** | The agreed payment terms for the transaction (e.g., Cash on Delivery, Net 30 days). |

---

## FAQ

### 1. What is the difference between a Delivery Order (DO) and a Goods Issue Note (GIN)?

Both involve stock leaving the warehouse, but they serve different purposes:

- **Delivery Order** — customer-facing. It's the document the customer receives and signs. It confirms what was delivered, when, and by whom.
- **GIN (Goods Issue Note)** — more internal. It records the warehouse release of stock without necessarily being tied to a customer delivery.

In many workflows, a DO triggers a GIN behind the scenes, or they are used interchangeably. This applet specifically manages the DO side with the stock-out built in.

---

### 2. When exactly does stock get deducted?

Stock is deducted **only when the DO is finalized (FINAL status)**. A DO in Draft does not affect stock. This gives you the flexibility to prepare and review a delivery before committing the inventory movement.

---

### 3. Can I create a DO without linking it to a Sales Order?

Yes. You can create a DO manually by entering items in the Lines section directly. However, using the **KO (Knock-Off)** feature to pull from a Sales Order is recommended — it's faster and ensures the DO matches the original order exactly.

---

### 4. Can I edit a finalized DO?

No. Once a DO is finalized, it is locked. If you need to make changes, you would need to void or reverse it and create a new DO with the correct details.

---

### 5. Can I deliver partial quantities from a Sales Order?

Yes. When using KO to link to a Sales Order, you can adjust the quantities in the DO lines to reflect only the partial quantity being delivered in this shipment. The remaining quantity stays open on the Sales Order for a future delivery.

---

### 6. How do I print the delivery docket for the customer to sign?

Open the finalized DO → click **PRINT**. Select the appropriate print format if multiple templates are configured. The document can be printed or saved as a PDF to share with the driver or customer.
