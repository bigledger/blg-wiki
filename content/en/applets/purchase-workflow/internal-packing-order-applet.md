---
title: "Internal Packing Order Applet"
description: "Supplier workspace to create and manage internal packing orders with knock-off support for sales orders, jobsheets, quotations, and delivery orders."
tags:
- purchase-workflow
- supplier-access
- outbound-delivery
- packing-order
- logistics
- stock-conversion
weight: 268
---

## Purpose and Overview

The **Internal Packing Order Applet** is the supplier-facing workspace in BigLedger (including **akaun.com**) for documenting goods **leaving** your warehouse toward the buyer. Each packing order captures the dispatching branch, location, the items being shipped, and how the movement links to upstream documents like Sales Orders and Jobsheets.

Think of it as **your dispatch paperwork, digitised**: you record what is going out, pull items automatically from existing orders, and lock the document when it is ready so the buyer's receiving team can match against what you shipped.

{{< callout type="info" >}}
Menus, tabs, and buttons can vary by **posting status**, **feature visibility**, and **permissions**. If something described here does not appear on your screen, ask your administrator.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Supplier Operations & Warehouse Staff:**
- Centralised view of all outbound packing orders
- Fast line creation via Search Item or Knock-Off (KO)
- Real-time tracking of shipment statuses
- Print-ready delivery documentation for drivers

**Logistics Coordinators:**
- Clear visibility into which **branch** and **location** stock is dispatched from
- Ability to reconcile outbound movements with upstream orders

**Administrators:**
- Full control over field requirements, KO availability, permission sets, and printable layouts

### What Problems Does This Solve?

Without a central record, outbound shipments are tracked in spreadsheets or email chains, making it difficult to match what left the warehouse to what the buyer expects. This applet solves that by providing:

- **One unified listing** for all packing orders with search, filtering, and bulk actions
- **Structured details** capturing the exact branch, location, and movement classification
- **Automated knock-off flows** to pull items directly from Sales Orders, Jobsheets, Quotations, or Delivery Orders—eliminating manual re-entry
- **Financial summaries** on each order: Total Transaction Amount, SST/VAT/GST, and Rounding

{{< cards >}}
  {{< card title="Listing" subtitle="Search, filter, create, and manage from the grid" link="#the-listing-view" >}}
  {{< card title="Create & Edit" subtitle="Main Details, Lines, and Matchings tabs" link="#create-and-edit" >}}
  {{< card title="Lines & Knock-Off" subtitle="Search items or import from existing documents" link="#lines-and-knock-off-ko" >}}
  {{< card title="Quick Start" subtitle="Step-by-step for your first packing order" link="#quick-start-guide" >}}
  {{< card title="Sidebar Modules" subtitle="Manual Packing, Operator Queue, Coil, and more" link="#understanding-your-sidebar-modules" >}}
{{< /cards >}}

{{< figure src="/images/internal-packing-order-applet/internal-packing-order-overview-infographic.png" alt="Internal Packing Order Applet Overview — from order creation to dispatch" caption="Internal Packing Order at a glance: create orders, add lines manually or via knock-off, review totals, print, and finalise for dispatch." >}}

---

## Key Concepts

### Document Flow

**Open Listing** &rarr; **Create (+)** &rarr; **Fill Main Details** &rarr; **Save** &rarr; **Add Lines** (Manual or Knock-Off) &rarr; **Matchings** (optional) &rarr; **Finalise** (when ready to dispatch)

### Technical Terms Explained

| Term | What It Means |
|------|---------------|
| **Branch** | Your organisational site or division. The order records which branch the goods leave from. |
| **Location** | A specific warehouse or dispatch point under your branch. |
| **Conversion Code / Name** | The system's classification for this outbound stock movement type. Your admin defines the allowed values. |
| **KO (Knock-Off)** | Automatically importing line items from an existing document (Sales Order, Jobsheet, Quotation, or Delivery Order) instead of typing them in manually. |
| **Matchings** | A tab used to link this packing order to other related documents in the system. May be empty if your workflow does not require it. |
| **Posting Status** | Indicates whether the order is still editable or has been finalised. |
| **Jobsheet** | An internal tracking document detailing materials and labour for a production job. Used here as a source document for knock-off. |

---

## Quick Start Guide

### For Supplier Operations: Create Your First Packing Order

**Goal:** Create a packing order, add items, and dispatch.

1. **Navigate:** Open the sidebar and go to the **Internal Packing Order** applet. You will land on the **Listing** view.
2. **Create:** Click the **+** button (tooltip: "Create").
3. **Fill Main Details:**
   - Select your **Branch** and **Location** (both required).
   - Enter the **Conversion Code** and **Conversion Name** (both required).
   - Optionally add a **Description**.
4. **Save:** Click **SAVE**. The system generates your document record and switches to the Edit screen.
5. **Add Lines:** Open the **Lines** tab, then click the **+** button to add a line.
   - Use **Search Item** to manually pick items from the catalogue.
   - Or use a **Knock-Off (KO)** tab (e.g., **KO For Sales Order**) to automatically pull items from an existing document.
6. **Review Totals:** Check the **Total Txn Amount** and **SST/VAT/GST Amount** displayed above the line grid.
7. **Print:** Click the **Print** icon to generate a PDF for your logistics driver.
8. **Finalise:** When ready, click **FINAL** to lock the document for dispatch.

{{< callout type="tip" >}}
If you are new to this applet, create one **test** packing order end-to-end (save, add a line, finalise) before using it for live shipments.
{{< /callout >}}

---

### For Supplier Operations: Edit an Existing Packing Order

**Goal:** Open a saved order, update its details or lines, and save your changes.

1. **Find the order:** On the **Listing** view, use the search bar or scroll to locate your packing order. Click on the row to open it.
2. **Edit Main Details:** On the **Main Details** tab, update any field (Branch, Location, Conversion Code, Conversion Name, or Description).
3. **Edit Lines:** Switch to the **Lines** tab.
   - **To add a new line:** Click the **+** button, select items via Search Item or a KO tab, and confirm.
   - **To edit an existing line:** Click on a row in the line grid to open and modify it.
   - **To delete a line:** Click the **delete** action on the line row and confirm the deletion.
4. **Save:** Click **SAVE** to apply your changes.
5. **Undo changes:** If you made a mistake, click **RESET** to discard all unsaved changes and reload the last saved state.

{{< callout type="warning" >}}
**RESET** discards all unsaved changes without confirmation. If you have already clicked **SAVE**, those changes are permanent and RESET will not undo them.
{{< /callout >}}

---

### For Supplier Operations: Using Knock-Off (KO) to Import Lines

**Goal:** Automatically pull line items from an upstream document instead of typing them manually.

1. Open your packing order (create a new one or edit an existing one).
2. Go to the **Lines** tab and click the **+** button to add a line.
3. On the **Select Item** screen, choose the appropriate KO tab:

| Tab | Use When |
|-----|----------|
| **KO For Sales Order** | You are fulfilling a confirmed sales order |
| **KO For Jobsheet** | You are dispatching items produced against a manufacturing jobsheet |
| **KO For Sales Quotation** | You are packing items quoted to a buyer |
| **KO For Delivery Order** | You are completing an existing delivery order |

4. Browse or search the listed source documents and select the one you want to knock off from.
5. The system pulls the line items into your packing order automatically.
6. **Adjust quantities** if needed (e.g., only shipping a partial quantity).
7. Click **Back** to return to the Lines tab — your imported lines now appear in the grid.

{{< callout type="info" >}}
You can mix methods on a single order: knock off some items from a Sales Order and manually add others via **Search Item**.
{{< /callout >}}

---

### For Administrators: First-Time Setup

**Goal:** Ensure your team can create, save, and use the applet.

1. Open **Settings** &rarr; **Feature Visibility** and ensure the applet appears for the correct roles.
2. Review **Field Settings** to confirm which Main Details fields are mandatory.
3. Configure **Printable Format Settings** if printed packing orders are required.
4. Set **Permissions** so only intended users can create, edit, or finalise.
5. Run a full test: create a packing order, add a line, save, and test the full workflow.

---

## For Supplier Operations

### The Listing View

The **Internal Packing Order Listing** is your control centre for all packing orders.

| Action | How |
|--------|-----|
| **Create** | Click the **+** button to open a new packing order |
| **Search** | Use the search bar or advanced search to filter by branch, reference, date, or status |
| **Open** | Click any row to open the full edit screen |
| **Multi-select** | Select multiple rows to apply bulk actions (e.g., finalise) |
| **Paginate** | Adjust page size and navigate through pages |

---

### Create and Edit

**Create Screen** — Title: *Create Supplier Outbound Delivery Note*
- Actions available: **Back**, **RESET**, **SAVE**
- **SAVE** is disabled until all required Main Details fields are completed

**Edit Screen** — Title: *Edit Supplier Outbound Delivery Note*
- Actions available: **Back**, **RESET**, **SAVE**, **FINAL** (conditional — only appears when the document is active and not already finalised)

Both screens have three tabs:

| Tab | Purpose |
|-----|---------|
| **Main Details** | Branch, Location, Conversion Code, Conversion Name, Description |
| **Lines** | The list of items being dispatched. This is where you add, edit, and delete line items. |
| **Matchings** | Links this packing order to other documents. Content depends on your company's configuration. |

---

### Lines and Knock-Off (KO)

The **Lines** tab is where you define exactly what is leaving the warehouse.

**Adding a Line:**
1. Click the **+** button on the Lines tab.
2. You will see the **Select Item** screen with the following tabs:

| Tab | When It Appears | What It Does |
|-----|-----------------|--------------|
| **Search Item** | Always available | Manually browse and select items from the catalogue |
| **KO For Sales Order** | When enabled by admin | Pulls line items from an existing **Sales Order** |
| **KO For Jobsheet** | When enabled by admin | Pulls line items from an existing **Jobsheet** |
| **KO For Sales Quotation** | When enabled by admin | Pulls line items from an existing **Sales Quotation** |
| **KO For Delivery Order** | When enabled by admin | Pulls line items from an existing **Delivery Order** |

{{< callout type="warning" >}}
KO tabs are **conditional**. If you do not see a particular KO tab, it has not been enabled for your company. Contact your administrator.
{{< /callout >}}

**Line Grid Summary:** After adding lines, the grid displays running totals:
- **Total Txn Amount** — Sum of all line item values in the document currency
- **Total SST/VAT/GST Amount** — Sum of all tax amounts
- **Rounding** — Displayed when rounding adjustments apply

---

### Common Scenarios

**Scenario 1: Dispatching from a Sales Order (Using Knock-Off)**

A Sales Order #1002 comes in for 50 Laptops.

1. Create a new packing order and fill in the **Main Details**.
2. Click **SAVE**, then open the **Lines** tab.
3. Click **+** and select the **KO For Sales Order** tab.
4. Find and select Sales Order #1002.
5. The system pulls in 50 Laptops automatically. Adjust the quantity if only 40 are going on this truck.
6. Save and finalise when ready.

**Scenario 2: Manual Packing Order**

1. Create a new packing order and fill in the **Main Details**.
2. Click **SAVE**, then open the **Lines** tab.
3. Click **+** and use the **Search Item** tab.
4. Browse or search the catalogue, select items, and enter quantities.
5. Save and finalise when ready to dispatch.

**Scenario 3: Partial Delivery**

Sales Order #2050 requires 100 units. Only 60 are ready.

1. Knock off from Sales Order #2050 — the system imports 100 units.
2. Adjust the quantity to **60** on the line.
3. Save and finalise.
4. When the remaining 40 units are ready, create a **second** packing order and knock off the remaining items.

---

## Understanding Your Sidebar Modules

Depending on your company's configuration, the sidebar may display specialised modules beyond the main listing. These modules represent different stages of the packing and dispatch workflow:

### Core Packing Operations

| Module | Purpose |
|--------|---------|
| **Packing Request** | Formal requests routed from sales or logistics to the packing team. This is where the outbound preparation process begins. |
| **Manual Packing** | For ad-hoc or complex orders where operators must define the packing structure (box by box) manually. |
| **Operator Queue** | The digital task list for warehouse floor staff. Operators use this queue to pick up and process their next assigned packing job. |

### Specialized Manufacturing (Coil)

| Module | Purpose |
|--------|---------|
| **Auto Coil Operator** | An automated interface for operators handling coiled goods (e.g., steel, wire). Integrates with automated winding and packing machinery. |
| **Auto Coil Supervisor** | The management console for automated coil lines. Supervisors monitor output rates, approve overrides, and track operator performance. |

### Production & Inventory

| Module | Purpose |
|--------|---------|
| **Job Order** | Links outbound packing to specific manufacturing work orders. Tracks produced goods directly into their dispatched state. |
| **Packing Containers** | Manages physical containers (pallets, crates, boxes, drums) — their inventory, dimensions, and tare weights. |
| **Scrap & Short** | The exception-handling hub. Log materials damaged during packing (**Scrap**) or flag orders that could not be completed due to missing stock (**Short**). |

### System & Testing

| Module | Purpose |
|--------|---------|
| **TESTING** | A diagnostic area for admins and developers to test barcode scanners, packing workflows, or scale integrations without affecting live data. |

{{< callout type="info" >}}
Not all modules appear for every company. Your sidebar is configured by your administrator based on your company's specific workflow requirements.
{{< /callout >}}

---

## For Administrators

### Settings Overview

The applet shares the standard BigLedger settings structure. Key areas include:

| Setting | Purpose |
|---------|---------|
| **Default Selection** | Set default Branch or Location for new documents |
| **Field Settings** | Control which fields appear and whether they are mandatory |
| **Printable Format Settings** | Configure the layout of printed packing orders |
| **Webhook** | Set up automated notifications or external system integrations |
| **Feature Visibility** | Control which menus and actions appear for each role |
| **Permissions** | Manage who can create, edit, finalise, or view packing orders |
| **Personalization** | Allows individual users to set personal defaults (e.g., preferred branch) without affecting company-wide settings |

---

## Related Applets

| Applet | How It Relates |
|--------|----------------|
| [Supplier Delivery Order Applet](/applets/purchase-workflow/supplier-delivery-order-applet/) | Another supplier-facing logistics document; delivery planning may link to packing orders |
| [Internal Purchase GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/) | Buyer-side goods receipt; packing orders from the supplier align with receiving on the buyer side |
| [Blanket Purchase Order Applet (Supplier Access)](/applets/purchase-workflow/blanket-purchase-order-applet-supplier-access-applet/) | Supplier portal for blanket agreements; packing activity may occur within the same procurement context |

---

## FAQ

### Process Questions

**Q: Can I deliver a partial quantity from a Sales Order?**
**A:** Yes. When using the Knock-Off flow, adjust the imported item quantity to match only what you are loading onto the truck. You can create additional packing orders for the remaining items later.

**Q: What if I accidentally finalised the wrong quantity?**
**A:** Once finalised, the document is locked. Depending on your company policy, you may need to void it or create a manual return/adjustment.

**Q: How do I print the packing order for my driver?**
**A:** Once your Main Details and Lines are saved, click the **Print** icon on the Edit screen to generate a PDF.

**Q: Which upstream documents can I knock off from?**
**A:** Depending on your configuration, you can knock off from **Sales Orders**, **Jobsheets**, **Sales Quotations**, and **Delivery Orders**. Only the tabs enabled by your admin will appear.

### System Questions

**Q: Why is SAVE disabled?**
**A:** The Main Details form must be valid. Ensure Branch, Location, Conversion Code, and Conversion Name are all filled in.

**Q: A button is missing (e.g., FINAL) — why?**
**A:** Button visibility depends on the document state and your permissions. For example, FINAL only appears on active, unfinalised documents. If a button is missing, check with your administrator.

**Q: What is the Matchings tab for?**
**A:** It links this packing order to other documents in the system. If the tab is empty, your workflow may not require matching for this document type.

**Q: I don't see a KO tab (e.g., KO For Sales Order) — what's wrong?**
**A:** KO tabs are conditional and controlled by your administrator. If a tab is missing, that particular knock-off flow has not been enabled for your company.

---

## Glossary

- **Branch** — Your organisational site or division. The packing order records which branch the outbound movement is from.
- **Conversion Code / Name** — The system's classification for this outbound stock movement type within inventory rules.
- **Feature Visibility** — Company settings that control which menus and actions appear for each role.
- **Final (FINAL)** — Marks the document as complete and locks it from further editing.
- **Jobsheet** — An internal tracking document detailing materials and labour for a production job. Used here as a source for knock-off.
- **Knock-Off (KO)** — Automatically importing line items from an existing document instead of manual entry.
- **Location** — A specific warehouse or dispatch point under the selected branch.
- **Matchings** — Links this packing order to other related documents when your workflow requires it.
- **Internal Packing Order** — Supplier-originated evidence of goods dispatched toward the buyer.
- **Posting Status** — Whether the document is still editable or has been finalised.
