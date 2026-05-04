---
title: "Stock Availability Applet"
description: "Real-time inventory visibility, advanced bin tracking, and serial/batch traceability for warehouse and sales operations"
tags:
- inventory-management
- stock-tracking
- supply-chain
- warehouse-operations
- serial-tracing
---

## Purpose and Overview

The **Stock Availability Applet** is the central nervous system for your inventory. It sits on top of all other supply chain modules (Purchasing, Sales, Manufacturing, Warehouse) to provide a single, unified view of exactly what you have, where it is, and what its status is. 

It is a **read-only** applet. You do not *make* changes here (you make changes in Goods Receipt or Delivery applets). You *look* here to make critical business decisions.

{{< callout type="info" >}}
**Core Concept: Understanding "Availability"**
Having 100 laptops in the warehouse does NOT mean you can sell 100 laptops. 
The Stock Availability Applet exists to calculate your **True Available Stock** by subtracting items promised to customers and adding items promised from suppliers.
{{< /callout >}}

### Who Benefits from This Applet?

| Role | How they use it |
|------|-----------------|
| **Sales Reps** | Checking if a product is in stock *before* committing to a customer order. |
| **Procurement** | Checking running low stock to know what needs to be reordered. |
| **Quality/Compliance** | Tracing a defective Serial Number back to its original supplier. |

---

## What Problems Does This Solve?

**Without Stock Availability Tracking:**
- Sales reps sell items that are already promised to other customers, causing fulfillment failures.
- Warehouse staff spend hours searching for items because they don't know the specific bin location.
- Expired medical supplies or food items cannot be easily traced.
- Recalling a specific defective batch takes days of manual paperwork auditing.

**With Stock Availability Applet:**
- ✓ **Real-time Formulas** - Instantly calculate *Physical - Reserved = Available*
- ✓ **Bin-Level Precision** - Know exactly which shelf an item is sitting on.
- ✓ **End-to-End Traceability** - Trace a Serial Number from the Supplier PO all the way to the Customer Invoice.
- ✓ **Aging Analytics** - Spot dead stock before it loses complete value.

{{< figure src="/images/stock-availability-applet/stock-availability-infographic.jpg" alt="Mastering Real-Time Inventory: The Stock Availability Applet - showing the Master Formula (A = P - R), Strategic Visibility, End-to-End Audit Trails, and a Role-Specific Quick Reference Guide" caption="Mastering Real-Time Inventory: The Stock Availability Applet. A visual overview of the Master Formula, Bin-Level Precision, Aging Analytics, and Role-Specific Visibility." >}}

---

## The Master Inventory Formula

To use this applet effectively, you must understand the four pillars of inventory calculation:

1. **Physical Quantity (`P`)**: The actual, physical number of items sitting in your warehouse right now.
2. **Reserved Quantity (`R`)**: Items that are physically in the warehouse, but have been booked by confirmed Sales Orders. *You cannot sell these.*
3. **Incoming Quantity (`I`)**: Items that are not in the warehouse yet, but have been ordered from suppliers via confirmed Purchase Orders.
4. **Available Quantity (`A`)**: The true amount you can currently sell to a new customer.

**The Formula:**
`Available (A) = Physical (P) - Reserved (R)`

*Note: Some businesses configure their setup to include Incoming stock in their Availability calculation (`A = P - R + I`), allowing sales reps to sell stock that is currently in transit.*

---

## Role-Based Quick Start Guides

### For Sales Reps: The Pre-Sale Check
Your goal is to ensure you don't sell stock you don't have, and to manage customer expectations. Since you often need to know *why* stock is unavailable or *when* it will arrive, you should primarily use the **Stock Availability Details** listing.

1. Go to **Stock Availability Details** listing.
2. Search for the Item Code (e.g., *LAPTOP-PRO*).
3. If the **Available** column is 0, check the breakdown rows for that item.
4. You will see specific **Sales Orders** holding the stock, or **Purchase Orders** that show when the next shipment from the supplier is arriving.

### For Warehouse Pickers: Finding an Item
Your goal is to find where 5 specific mice are located in a massive warehouse.

1. Go to **Bin Availability Listing**.
2. Search for the Item Code.
3. The system will show you the exact breakdown:
   - *Aisle 2, Bin A: 3 units*
   - *Aisle 4, Bin C: 2 units*
4. Use this precise location map to pick the items efficiently.

### For Compliance Officers: Tracing a Defect
A customer reported a defect with Serial Number `SN-998877`. Your goal is to find out which supplier gave it to you.

1. Go to **Serial / Batch Trace Listing**.
2. Type in the Serial Number `SN-998877`.
3. The system maps the entire lifecycle:
   - *Received from Supplier X on Jan 5th (Goods Receipt #102)*
   - *Moved from Bin A to Bin B on Jan 10th (Stock Transfer #44)*
   - *Sold to Customer Y on Jan 15th (Delivery Order #88)*

---

## Deep-Dive: The UI Workspaces

### 1. Stock Availability Listing (The Global View)
This is the highest-level view. It aggregates stock across all your locations.

{{< figure src="/images/stock-availability-applet/stock-availability-listing.png" alt="Stock Availability Listing showing company-wide inventory levels with branch filters and color-coded status indicators." caption="Stock Availability Listing: A global snapshot of total physical and available stock across all locations." >}}

- **Multi-Branch View:** If you have warehouses in KL, Penang, and Johor, you can see the total company-wide stock, or filter down to a specific branch to see local availability.
- **Color Indicators:** Configurable warning colors (e.g., Red) highlight items that have fallen below their required Minimum Stock levels.

### 2. Stock Availability Details (The primary operational view)
While the main listing gives you a simple physical snapshot, the **Details Listing** is the most frequently used workspace because it answers the "Why?". It provides a granular view of exactly which operational documents are affecting your inventory levels.

{{< figure src="/images/stock-availability-applet/stock-availability-details.png" alt="Stock Availability Details view highlighting reserved quantities and pending transactions." caption="Stock Availability Details: Deep-dive into the documents (Sales Orders, Purchase Orders) affecting your available stock." >}}

**Primary Use Cases:**
- **Troubleshooting "Missing" Availability:** When a sales rep complains, *"It says we physically have 50 items, but 0 available. Why?"* The details listing shows the exact Sales Orders (SO) that have reserved those 50 items.
- **Managing Incoming Stock:** If an item is out of stock, this view shows the specific Purchase Orders (PO) or Goods Receive Notes (GRN) incoming, allowing sales reps to tell customers exactly when stock will arrive.
- **Advanced Search & Filtering ("Optional" Field):** The advanced search includes an **Optional** multi-select dropdown designed to declutter your view. By default, it hides zero balances and pending document balances (`HIDE_ZERO_BALANCE`, `HIDE_GOODS_RECEIVE_NOTE_BALANCE`, `HIDE_PURCHASE_ORDER_BALANCE`, `HIDE_SALES_ORDER_BALANCE`). You can uncheck these to explicitly isolate and view pending documents and balances.

### 3. Stock Aging Report
Identifies "Dead Stock."

{{< figure src="/images/stock-availability-applet/stock-aging-report.png" alt="Stock Aging Report showing inventory grouped by time periods (e.g., February, March, April, May)." caption="Stock Aging Report: Identify items that have been sitting in the warehouse for extended periods to prevent obsolescence." >}}

- Groups inventory by how long it has been sitting in your warehouse (e.g., *0-30 days, 31-60 days, 90+ days*).

- Allows Procurement and Sales to run targeted discounts to clear out 90+ day old stock before it becomes obsolete.

### 4. Stock Availability with SO and PO
A dedicated consolidated workspace focused purely on stock movement tied explicitly to ongoing Sales and Purchase Orders, providing a streamlined view for fulfillment teams.

{{< figure src="/images/stock-availability-applet/stock-availability-with-so-po.png" alt="Stock Availability with SO and PO view showing specific document links and outstanding quantities." caption="SO & PO Tracking: Monitor inventory specifically committed to or expected from open documents." >}}

### 5. Trace Serial No
Crucial for electronics, machinery, and high-value items tracked individually.

{{< figure src="/images/stock-availability-applet/trace-serial-no.png" alt="Trace Serial Number view showing the full stock movement history of a specific serial number." caption="Trace Serial No: View the complete lifecycle and transaction history of any serialized item." >}}

- **Dedicated Search:** Search by exact Serial Number, Keyword, or Date Range to find specific item histories.

- **Forward Tracing:** Trace a serial number from the moment it was received from a Supplier PO all the way to the Customer Invoice.
- **Backward Tracing:** "Customer brought back a broken TV. Which container did this specific TV arrive in, so we can claim warranty from the manufacturer?"

### 6. Serial Number Balance
- View the exact current physical balance of items tracked by a specific Serial Number within your warehouses.

{{< figure src="/images/stock-availability-applet/serial-number-balance.png" alt="Serial Number Balance view showing quantities and specific serial numbers currently in stock." caption="Serial Number Balance: Instantly verify which serial numbers are physically present in each location." >}}

- Utilizes an Advanced Search grid with column toggling, allowing for highly specific filtering and reporting of serialized inventory.


### 7. Trace Batch No
Crucial for food, pharmaceuticals, and items with expiry dates.

{{< figure src="/images/stock-availability-applet/trace-batch-no.png" alt="Trace Batch Number view showing movement history for batch-tracked items." caption="Trace Batch No: Track stock movements and transactions for specific batch numbers." >}}

- **Dedicated Search:** Search by exact Batch Number, Keyword, or Date Range to trace all related transactions.

- **Recall Management:** "We just realized Batch #XYZ of flour is contaminated. Which customers did we sell bread to using this flour?" Instantly identify all affected parties for a recall.

### 8. Bin Availability Listing (The Micro View)
While the main listing tells you *if* you have stock, this listing tells you *exactly where* it is.

{{< figure src="/images/stock-availability-applet/bin-availability.png" alt="Bin Availability Report showing item locations and quantities across different bins." caption="Bin Availability: Precise location mapping for every item in your warehouse." >}}

{{< callout type="tip" >}}

**Why Use Bins?** If you have 10,000 screws in a warehouse, knowing you have 10,000 is useless if you don't know which box they are in. Bins represent the physical shelves, racks, or boxes in your facility.
{{< /callout >}}

---

## Configuration & Settings

The Stock Availability applet is highly configurable. Administrators can tailor the workspace to hide unnecessary complexity from warehouse staff while enabling deep financial tracking for controllers.

### 1. Application Settings (System-Wide)

Accessed via `Settings > Application Settings`, these toggles change how the applet looks and functions for all users.

**A. Tailoring the Sidebar (Menu Visibility)**
To prevent mistakes or clutter, administrators can hide sidebar menus that their layout doesn't use. 

| Setting | What It Does |
|---------|--------------|
| `Hide Trace Serial No Menu` | Removes the Serial Trace tracking tools. Turn on if you don't sell serialized goods. |
| `Hide Trace Batch No Menu` | Removes the Batch tracking tools. Turn on if you don't track expiry dates. |
| `Hide Stock Aging Report Menu` | Removes the aging report from non-finance staff to simplify their UI. |

**B. Tailoring the Listing (Field Visibility)**
You can hide sensitive financial information from standard warehouse staff, or declutter the main stock availability listing.

| Setting | What It Does |
|---------|--------------|
| `Hide Listing Avg Cost` | Hides the Average Cost column, preventing standard users from seeing your inventory valuation. |
| `Hide Listing Last Purchase Cost` | Hides the Last Purchase Cost column to protect supplier pricing visibility. |
| `Hide Listing Sales Price` | Hides the default selling price from the stock listing view. |
| `Hide Report Inventory Value` | Hides total inventory valuation data from reports. |
| `Pricing Schemes` & `Price Metrics` | Globally defines which pricing structures and metrics to use when displaying costs/prices in the listings. |

**C. Tailoring Item Categories**
Administrators can enable up to 20 custom Item Category Groups and toggle their visibility across the application.

| Setting | What It Does |
|---------|--------------|
| `Item Category Group 1-20` | Defines multi-level categorization for inventory grouping. |
| `Hide Item Category Group` | Toggles the visibility of specific category groupings to clean up the UI if they aren't needed. |

### 2. Permissions Governance

Access to inventory data is managed through a layered permission system in the Settings menu:

- **Permission Wizard:** A guided tool to set up basic access levels.
- **Role Permission:** Grant access by job title (e.g., "Sales Reps can View Availability, but only Finance can View Cost").
- **User/Team Permission:** Grant granular exceptions to specific individuals or squads.

---

## Personalization

Individual users can override certain system defaults to speed up their daily workflow via the **Personalization** sidebar menu.

### Personal Default Settings

To save clicks on every single lookup, users should set their defaults:

| Setting | Why use it? |
|---------|-------------|
| **Default Branch** | If you only work at the "Penang Hub", set this so you never have to select it from the dropdown again. |
| **Default Location** | If you only manage "Aisle B", set this as your default location. |
| **Default Toggle Column** | Set your personal preference for reading forms in a `SINGLE` (narrow) or `DOUBLE` (wide) column layout based on your monitor size. |

---

## Common Real-World Scenarios

### Scenario 1: The Urgent Sales Order Committment
**The Situation:** A major client wants 50 "Enterprise Servers" delivered tomorrow.
**The Workflow:**
1. Sales Rep opens **Stock Availability Listing** and searches for the server.
2. The UI shows: Physical: 60, Reserved: 20, Available: 40.
3. The Rep cannot fulfill the order of 50. 
4. The Rep opens the **Stock Availability Details** menu. 
5. They see an Incoming PO for 30 servers expected *today* at 3:00 PM.
6. The Rep confidently tells the client, "Yes, we can deliver tomorrow," knowing the stock will arrive today.

### Scenario 2: The Expiring Medicine (Batch Tracing)
**The Situation:** A pharmacy warehouse realizes a specific batch of insulin (`BATCH-NOV24`) expires next month.
**The Workflow:**
1. Warehouse Manager opens **Trace Batch No**.
2. Filters by the specific Batch Number.
3. Identifies that 500 units of `BATCH-NOV24` are currently sitting in Bin `COLD-STORAGE-A`.
4. Manager immediately issues a priority transfer to move them to the front-of-store shelves with a 50% discount to clear them before expiry.

### Scenario 3: Investigating Missing Stock in Bins
**The Situation:** The system says there are 5 laptops in Bin `A-1`, but the picker says the shelf is empty.
**The Workflow:**
1. Operations opens the **Bin Availability Listing** and clicks on the laptop item in Bin `A-1`.
2. They view the transaction history for that specific interaction.
3. The log shows that earlier that morning, a different picker did a *Stock Transfer* from `A-1` to the *QA/Testing* Bin, but the original picker didn't know.
4. The original picker goes to the QA bin and finds the laptops.

---

## FAQs

**Q: Can I manually change the Available quantity here?**
A: No. The Stock Availability Applet is uniquely a **read-only** module. To change physical stock, you must use operational applets (Goods Receipt, Delivery Order, Stock Adjustment). This strict rule prevents inventory manipulation.

**Q: Why does my Available stock show a negative number?**
A: This happens if your organization allows "Negative Inventory" in the backend settings. It usually means a Sales Order was fulfilled (deducting stock) *before* the warehouse processed the incoming Goods Receipt for that item. 

**Q: I just created a Sales Order. Why didn't the Physical stock decrease?**
A: Creating a standard Sales Order only decreases the **Available** stock (by increasing Reserved items). The **Physical** stock is only deducted when the product leaves the building via a **Delivery Order / Goods Issue**. 

**Q: How frequently does the data update?**
A: In absolute real-time. The moment a warehouse worker clicks "Confirm" on a Goods Receipt on their scanner, the availability numbers update globally for all users.

