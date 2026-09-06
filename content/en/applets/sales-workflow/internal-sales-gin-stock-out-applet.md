---
title: "Sales GIN Stock Out (Internal) Applet"
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

The **Sales GIN Stock Out (Internal) Applet** is where your team records goods leaving the warehouse for an internal sales transaction. It is the control point between the sales order, the warehouse pick, and the stock reduction that happens when the document is posted.

{{< callout type="info" >}}
**Core Concept**: A GIN is the official proof that goods have left the warehouse. Once the document is finalized, the system reduces stock at the selected branch and location and keeps the transaction available for sales and audit follow-up.
{{< /callout >}}

The applet fits in the middle of the sales fulfillment chain:

| Stage | What happens |
|------|--------------|
| Upstream | A sales order or other sales request creates demand |
| This applet | Warehouse staff pick the goods and create the GIN |
| Downstream | Sales invoice, delivery documentation, or correction documents use the GIN as the stock-out reference |

### Who Uses This Applet?

**Warehouse staff:**
- Pick and issue stock against the sales request.
- Record the quantity leaving the warehouse and the location it comes from.
- Keep the stock-out record aligned with what was physically dispatched.

**Sales operations:**
- Track whether the order has been fulfilled.
- Confirm which sales order lines were issued.
- Use the GIN as the bridge to downstream billing and delivery work.

**Inventory managers:**
- Monitor stock leaving each branch and location.
- Review line-item movement history across documents.
- Spot stock mismatches early.

**Finance teams:**
- Reconcile goods issued with sales and costing records.
- Use the GIN as audit evidence for stock reduction.
- Review posting status before reporting or invoice work.

### What Problems Does This Solve?

Without a controlled GIN workflow, warehouse teams often issue stock from memory or informal notes, which causes inventory mismatches, missing traceability, and sales disputes.

This applet solves that by providing:

- **Controlled stock deduction** when the document is finalized.
- **Line-level stock-out tracking** for each issued item.
- **Branch and location control** so stock comes out of the right place.
- **KO-based picking** from upstream sales documents so users do not retype every item.
- **Audit-ready history** for warehouse, sales, and finance.

---

## Before You Start

- Confirm the sales order or sales reference exists if you intend to use a KO tab.
- Confirm the item master data already exists and the item is active.
- Confirm the customer or receiving entity is set up if the header requires it.
- Confirm the branch and warehouse location where stock should be issued from.
- Confirm the user has permission to create, save, and finalize GIN documents.
- If the item is controlled, prepare serial numbers before you begin.
- If the item is batch- or bin-controlled, prepare the batch and bin information before you post.

{{< callout type="info" >}}
**Search Item vs KO tabs**: use **Search Item** when you want to pick items manually. Use a **KO by / KO for Sales Order Item** tab when you want to pull lines from an upstream sales document instead of typing them one by one.
{{< /callout >}}

---

## Document Status Reference

| Status | Meaning | What the user can do |
|--------|---------|----------------------|
| **DRAFT** | The GIN is not posted yet | Edit header fields, add or change lines, save, or delete if allowed |
| **FINAL** | The GIN has been posted | Review the record, print/export it, and use it for audit or downstream follow-up |

{{< callout type="warning" >}}
This applet does not expose a separate VOID or DISCARD action in the current UI. For a posted document, the normal operational state is **FINAL**. If a document must be corrected, use the available delete or reversal path defined by your workflow owner.
{{< /callout >}}

{{< callout type="info" >}}
**What FINAL does**: the stock-out is posted immediately. The selected warehouse location is reduced, and the document becomes the official issue record.
{{< /callout >}}

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

### Three-Way Traceability

The GIN helps sales, warehouse, and finance follow the same transaction from order to issue:

| Question | Answered by |
|----------|-------------|
| What was ordered? | Sales order or other upstream sales request |
| What was issued? | GIN line items and quantities |
| Where did it leave from? | Branch and Location |
| Has it been posted? | Posting status |
| Can I still change it? | DRAFT can be changed; FINAL is the posted record |

### Key Terms

| Term | Definition | Example |
|------|------------|---------|
| **GIN** | Goods Issue Note — document authorizing stock release | GIN-2024-001234 |
| **Stock Out** | Physical removal of inventory from warehouse | 50 units of SKU-A001 issued |
| **Line Item** | Individual product entry within a GIN | Item: Laptop, Qty: 5, Location: W-001 |
| **Sales Agent** | Person responsible for the sales transaction | John (Sales Rep) |
| **Credit Terms** | Payment terms linked to the transaction | Net 30, COD |

### Worked Example

Example stock-out scenario:

- Sales GIN No: **SGIN-000428**
- Branch: **HQ Retail**
- Location: **Main Warehouse**
- Customer: **ABC Trading Sdn Bhd**
- Sales Agent: **Amir**
- Item: **SKU-A001 Office Chair**
- Quantity issued: **5 units**
- Reference: **SO-10488**

In this example, the warehouse picks 5 chairs, confirms the quantity, then clicks **FINAL** so stock at Main Warehouse is reduced immediately.

---

## Quick Start Guide

### Warehouse Receiver: Create and finalize a GIN

**Goal:** Issue stock for a sales order and post the stock-out record.

1. **Navigate**: Go to **Sales GIN Stock Out (Internal)** from the sidebar
2. **Create New**: Click **Create** to open a new draft GIN.
3. **Fill the header**: On the GIN form, choose the company, branch, and warehouse location. Add the sales agent if your process uses one, then set the transaction date and sales reference.
4. **Add items**: Open the **Line Items** area and choose either **Search Item** for manual selection or a **KO by / KO for Sales Order Item** tab to pull items from the upstream sales document.
5. **Enter quantities**: For each line, enter the actual quantity leaving the warehouse. If the sales order says 10 but only 8 are picked, post 8 and leave the rest unissued.
6. **Check stock balance**: In Search Item, the **System Stock Balance** column shows the stock currently available. Use that to confirm whether the requested quantity can be issued.
7. **Save if needed**: Click **SAVE** if the record is not ready to post yet.
8. **Finalize**: Click **FINAL** to post the GIN and reduce stock immediately.

### What happens next

- The GIN moves to **FINAL**.
- Stock at the selected location decreases immediately.
- The listing shows the posted status for audit and follow-up.
- Sales and finance can use the record for fulfillment and traceability.

### Finance / manager review

**Goal:** Review issued stock and confirm posted documents.

1. **Navigate**: Go to **Line Items** from the sidebar
2. **Filter**: Use column filters to find item code, item name, document number, branch, or amount
3. **Review**: Confirm which items were issued and which document posted them
4. **Export**: Use the export tools for reporting or audit checks

---

## Detailed Walkthrough

### GIN Listing

The listing is the main queue for stock-out documents.

- Search, filter, and sort by document number, posting status, branch, customer, sales agent, and dates.
- Select one or more rows and click **FINAL** to post eligible documents from the listing.
- Double-click a row to open the document for review or editing.

### Main/Header Information

Common header fields include:

| Field | What to enter | Why it matters |
|------|---------------|-----------------|
| **Company** | The legal entity issuing the stock | Sets the business owner of the stock-out |
| **Branch** | The branch that issues the goods | Controls where the stock is deducted from |
| **Location** | The warehouse or storage location | Determines the exact stock source |
| **Sales Agent** | The sales representative linked to the order | Helps sales follow up on the issue |
| **Member Card** | Loyalty or member reference if used | Useful when the process is tied to a member account |
| **Transaction Date** | The date the goods leave the warehouse | Used for posting and reporting |
| **Credit Terms** | Payment terms if your process uses them | Helps downstream billing and reconciliation |
| **Reference** | Sales order number or delivery reference | Links the GIN to the upstream document |
| **Remarks** | Internal notes for the warehouse or sales team | Helps explain partial issue or special handling |
| **Permit No** | Permit reference if the shipment requires one | Needed for controlled or regulated stock |
| **Currency** | Transaction currency | Used when the document carries pricing values |
| **Tracking ID** | Courier or shipment tracking number | Useful for dispatch follow-up |
| **Due Date** | Date expected for payment or follow-up | Used if your process tracks a due date |

### Additional sections

- **Department Details** - Segment, Dimension, Profit Center, Project
- **Billing Info** - Customer billing name, email, phone
- **Billing Address** - Full billing address with country, city, state, postcode
- **Shipping Info** - Recipient name, email, phone
- **Shipping Address** - Full delivery address

### Line Items Workspace

The Line Items page gives a flattened view of individual items across all GIN documents.

Use it to:
- find every issue of a specific item,
- review items across dates or branches,
- trace a line back to its parent GIN,
- check whether a stock-out pattern looks unusual.

### Search Item tab

Use **Search Item** when you want to add items manually.

The search results show:
- **Item Code**
- **Item Name**
- **UOM**
- **System Stock Balance**

Use **System Stock Balance** to check whether the warehouse has enough available stock before you add the line.

### KO by / KO for Sales Order Item tabs

Use the KO tabs when you want to pull items from an upstream sales document instead of keying lines manually.

- **KO by Sales Order Item** - view items already on the source document and knock off from them.
- **KO for Sales Order Item** - view the items to be taken into the GIN from the source document.

The same pattern exists for the other KO tabs shown in the applet. The document currently exposes:
- KO by Sales Order Item
- KO for Sales Order Item
- KO by Jobsheet Item
- KO for Jobsheet Item
- KO by Delivery Order Item
- KO for Delivery Order Item
- KO by Purchase Order Item
- KO for Purchase Order Item
- KO by Purchase Requisition Item
- KO for Purchase Requisition Item
- KO by Purchase Quotation Item
- KO for Purchase Quotation Item
- KO by Purchase Invoice Item
- KO for Purchase Invoice Item

Use the tab that matches the upstream document your team is working from.

### Item entry rule

Enter the quantity that is actually leaving the warehouse, not the quantity that was requested on paper.

If the order is for 10 units but only 8 are picked, post 8 units now and issue the remaining 2 later if needed.

### Posting actions

- **Create** opens a new draft GIN.
- **SAVE** keeps the document in draft while you are still checking it.
- **FINAL** posts the document and reduces stock.

After FINAL, the listing treats the document as posted and the stock-out becomes part of the official inventory history.

### Edit rules

Use the edit screen when you need to review a draft or posted document.

- Draft documents can still be changed.
- Posted documents are treated as final records.
- The **RESET** button returns the form to its last saved state.

---

## Configuration & Settings

The Settings area is for administrators and power users.

### Application Settings

Use this to control which fields or features appear in the applet.

### Default Selection

Use this to pre-fill the branch and location for new GIN records.

### Printable Format Settings

Use this to choose how GIN documents print for warehouse or customer records.

### Feature Visibility

Use this to turn optional features on or off when your process does not need them.

### Permission settings

| Setting | What it means in plain English |
|---------|-------------------------------|
| Permission Set | A named group of permissions for a role or team |
| Client Side Permission | Controls what the user sees or can click in the UI |
| User Permission | Gives a specific user access to the app or action |
| Team Permission | Shares access with everyone in a team |
| Role Permission | Grants access based on the user’s role |

If a user cannot create or finalize a GIN, the usual cause is that one of these permission layers is missing.

### Personalization

The Personalization menu lets each user set their own default branch and location.

This saves time for users who always issue stock from the same warehouse.

---

## Troubleshooting

| Symptom | Likely Cause | What To Do |
|---------|--------------|------------|
| **Create button is disabled** | Missing permission or required header data is incomplete | Fill the header first, then confirm the user has create access |
| **SAVE button is disabled** | Required fields or line items are incomplete | Check company, branch, location, reference, and at least one line item |
| **FINAL button is unavailable or does nothing** | The document is not ready or the selected rows are not eligible | Recheck the document status and make sure the rows are draft documents |
| **Search Item shows no results** | The item code, item name, or availability filter does not match | Try a broader search term or confirm the item is active |
| **System Stock Balance looks wrong** | The item has already been reserved or issued elsewhere | Check the item’s current stock history before posting |
| **KO tab is empty** | No matching upstream document lines were found | Confirm the sales order or other source document exists and is active |
| **Pricing values are hidden** | User does not have pricing display permission | Ask the administrator to check the pricing visibility setting |
| **Posted rows stay at FINAL** | That is the expected posted state | Use the posted record for audit and downstream follow-up |

---

## FAQ

**Q: What is the minimum I must complete before I can create or save a GIN?**
A: You need the header data required by your setup and at least one line item. In most cases that means company, branch, location, transaction date, and the item(s) to issue.

**Q: What happens after I click FINAL?**
A: The document is posted, the stock decreases at the selected warehouse location, and the GIN becomes the official stock-out record.

**Q: What is the difference between DRAFT and FINAL?**
A: DRAFT means the document can still be changed. FINAL means the stock-out has been posted and the document is treated as the official record.

**Q: Can I edit a document after FINAL?**
A: Not in the same way as a draft. Finalized documents should be treated as posted records. If something is wrong, use the correction path allowed by your workflow owner.

**Q: Why is CREATE or SAVE disabled?**
A: Usually because a required header field is still empty, there is no line item yet, or the user does not have the right permission.

**Q: Why can’t I see the Search Item or KO tabs?**
A: The tabs can be hidden by feature settings or by the current screen orientation. If they are missing, check the applet settings and the current layout.

**Q: Can I issue only part of a sales order?**
A: Yes. If the warehouse can only pick part of the order, post the actual quantity issued now and leave the remaining quantity for a later document.

**Q: What happens to stock when I post this document?**
A: Stock is reduced immediately from the selected branch and location once the GIN is finalized.

**Q: Can one GIN use multiple branches or locations?**
A: The header is tied to one branch and one location. If stock comes from more than one place, create separate documents.

**Q: What should I use after the GIN?**
A: Use the GIN as the stock-out reference for sales invoice work, delivery follow-up, and inventory audit checks.

---

## Glossary

| Term | Meaning |
|------|---------|
| **GIN** | Goods Issue Note, the document that records stock leaving the warehouse |
| **Stock Out** | The act of reducing inventory because goods were issued |
| **KO** | Knock-Off, a way to pull lines from an upstream document into the GIN |
| **Sales Order** | The document that says what the customer requested |
| **Sales Invoice** | The billing document used after goods are issued |
| **Branch** | The business unit or warehouse group that owns the document |
| **Location** | The physical warehouse or storage area |
| **Posting Status** | The document state that shows whether it is still draft or already posted |

---

## Related Applets

- **[Sales Order Applet](/applets/sales-workflow/internal-sales-order-applet/)** - upstream demand document that can feed the GIN KO flow.
- **[Sales Invoice Applet](/applets/sales-workflow/internal-sales-invoice-applet/)** - downstream billing document that uses the issued stock record.
- **[Sales Return Applet](/applets/sales-workflow/internal-sales-return-applet/)** - correction path when issued goods need to come back.
- **[Purchase-style KO source documents](/applets/purchase-workflow/)** - the same knock-off concept appears in other workflows and can help users understand the pattern.

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
