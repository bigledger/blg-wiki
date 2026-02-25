---
title: "Stock Report Applet"
description: "Comprehensive stock and inventory reporting with movement analysis, aging reports, balance tracking, and sales/purchase insights"
tags:
- stock-report
- inventory-management
- warehouse
- stock-analysis
- stock-balance
---

## Purpose and Overview

The **Stock Report Applet** provides a comprehensive suite of inventory reports to help you monitor and analyze stock across your organization. From tracking daily stock movements to analyzing aging inventory and evaluating sales vs. purchase trends, this applet consolidates all your stock reporting needs into a single, powerful interface.

{{< callout type="info" >}}
**This is a read-only reporting applet.** It does not create, edit, or delete any stock or inventory data. All reports pull live data from your inventory system and display it for analysis and export. The only configurable items are applet settings (defaults, field visibility, permissions) and personal preferences.
{{< /callout >}}

{{< callout type="info" >}}
**Core Concept**: Each report pulls live data from your inventory system and displays it in an interactive AG Grid. Use **Advanced Search** to filter data, **Column Toggle** to customize visible columns, and **Export** to download reports to Excel or PDF.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Warehouse Managers:**
- Monitor stock movements in and out of locations
- Identify aging or slow-moving inventory
- Track stock balances across all locations
- Ensure optimal stock levels

**Inventory Controllers:**
- Analyze historical stock balance trends
- Review batch expiry dates to prevent write-offs
- Audit stock values by item category levels
- Verify stock balance accuracy

**Finance Teams:**
- Evaluate inventory valuation (MA Cost, Last Purchase Cost)
- Compare sales vs. purchase quantities by item
- Track Gross Profit by item code
- Export data for financial reporting and audits

**Purchasing Teams:**
- Review stock sales vs. purchase activity by item
- Identify items needing reorder based on balance reports
- Analyze supplier-linked stock balances

### What Problems Does This Solve?

**Traditional Inventory Reporting Challenges:**
- Scattered data across spreadsheets and systems
- No consolidated view of stock health
- Difficulty identifying slow-moving or expiring stock
- Manual, time-consuming report generation
- Limited drill-down and filtering capabilities

**The Stock Report Applet Solution:**
- **Centralized reports** — All stock reports accessible from a single sidebar menu
- **Advanced filtering** — Filter by location, date range, item code, item categories, and more
- **Real-time data** — Reports pull live inventory data
- **Flexible views** — Toggle columns on/off, group by categories, and pivot data
- **Export capabilities** — Export any report to Excel or PDF via the status bar

## Key Features Overview

{{< cards >}}
  {{< card title="Stock Movement Report" subtitle="Track all stock in/out transactions with full document traceability" link="#stock-movement-report" >}}

  {{< card title="Stock Aging Report" subtitle="Analyze inventory age by configurable day or month periods" link="#stock-aging-report" >}}

  {{< card title="Stock Summary by Location" subtitle="View stock quantities and values grouped by location" link="#stock-summary-report-by-location" >}}

  {{< card title="Historical Stock Balance" subtitle="Review stock balance snapshots over a period of time" link="#historical-stock-balance" >}}

  {{< card title="Stock Balance Report" subtitle="Current stock balances with unit cost and total cost" link="#stock-balance-report" >}}

  {{< card title="Stock Sales & Purchase by Item" subtitle="Compare sales vs. purchase activity with GP analysis" link="#stock-sales--purchase-by-item-code" >}}

  {{< card title="Stock Value by Level" subtitle="Aggregate stock values grouped by item categories and locations" link="#stock-value-by-level" >}}

  {{< card title="Batch & Expiry Date Report" subtitle="Track items approaching or past their expiry dates" link="#batch--expiry-date-report" >}}

  {{< card title="Stock Balance (Supplier & Serial)" subtitle="View stock balances grouped by supplier with serial number details" link="#stock-balance-supplier--serial" >}}

  {{< card title="Stock Balance (Item, Supplier & Batch)" subtitle="Cross-reference stock by item, supplier, and batch number" link="#stock-balance-by-item-supplier--batch" >}}

  {{< card title="Settings" subtitle="Configure default selections, field visibility, aging periods, and permissions" link="#configuration--settings" >}}

  {{< card title="Personalization" subtitle="Set personal defaults and customize your sidebar" link="#personalization" >}}
{{< /cards >}}

{{< figure src="/images/stock-report-applet/stock-report-applet-overview-infographic.png" alt="Stock Report Applet Overview Infographic">}}

## Key Concepts

### Report Structure

All reports in this applet share a consistent layout:

| Element | Description |
|---------|-------------|
| **Title Bar** | Displays the report name |
| **Advanced Search** | Expandable panel with filters specific to each report (location, date range, item code, categories, etc.) |
| **Column Toggle** | Show/hide columns to customize your view |
| **AG Grid** | Interactive data grid with sorting, grouping, and totals |
| **Status Bar** | Shows record count, export options (Excel/PDF), and report subtitle |

### Common Search Filters

Most reports support the following filters in the Advanced Search panel:

| Filter | Description |
|--------|-------------|
| **Location** | Filter by warehouse/storage location |
| **Item Code** | Search by specific item code or keyword |
| **Item Range** | Filter items within a code range (From → To) |
| **Item Type** | Filter by item transaction type |
| **Item Status** | Filter by item status (Active, Inactive) |
| **Item Category Levels** | Filter by up to 20 item category levels |
| **Date Range** | Filter by transaction date (From → To) |
| **Location Labels** | Filter by location label groups |

### Permission-Controlled Columns

Some columns are only visible based on your permissions and admin settings:

| Column Group | Setting | Permission |
|-------------|---------|------------|
| **MA Cost** (Unit Cost, Total Cost) | `HIDE_MA_COST` | `SHOW_MA_COST` |
| **Gross Profit (GP)** | `HIDE_GP` | `SHOW_GP` |
| **GP Percentage** | `HIDE_GP_PERCENTAGE` | — |

Admins can toggle these in **Settings > Application Settings** under the "Stock Report Listing" tab.

---

## Quick Start Guide

### For All Users: Running a Report

**Goal:** Generate any stock report in 3 steps.

1. **Select Report**: Click the desired report from the sidebar (e.g., **Stock Movement Report**)
2. **Apply Filters**: Click the **Advanced Search** panel → Set your filters (location, date range, item code, etc.) → Click **Search**
3. **View & Export**: Data loads in the grid. Use the **Column Toggle** to show/hide columns. Use the **Status Bar** to export to Excel or PDF.

---

### For Inventory Managers: Analyzing Stock Health

**Goal:** Identify slow-moving or expiring inventory.

1. **Open Stock Aging Report** → Filter by location → Search
2. Review aging columns to identify stock sitting too long
3. **Open Batch & Expiry Date Report** → Filter by date range → Search
4. Review items approaching expiry and plan accordingly

---

### For Admins: Configuring the Applet

**Goal:** Set up defaults, toggle menu items, and configure aging periods.

1. **Set Defaults**: Go to **Settings > Default Selection** → Set default branch, location, and language
2. **Configure Fields**: Go to **Settings > Application Settings** → Toggle sidebar menu items and report columns on/off
3. **Set Aging Periods**: In **Application Settings** → Select aging period type (Day or Month)
4. **Manage Permissions**: Go to **Settings > Permissions** → Assign read/create/update/delete permissions

---

## Stock Movement Report
{{< figure src="/images/stock-report-applet/stock-movement-report.png" alt="Stock Movement Report" caption="Detailed transaction log of all stock movements grouped by item code." >}}

The **Stock Movement Report** provides a detailed transaction log of all stock movements—goods received, goods issued, transfers, adjustments, and more—grouped by item code.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Item Code** | Item identifier (used as row group header) |
| **Txn Date** | Transaction date |
| **Location** | Warehouse/location where the transaction occurred |
| **Doc Short Code** | Document type abbreviation |
| **Doc No** | Document number |
| **Serial** | Serial number (if applicable) |
| **Unit Price** | Price per unit for the transaction |
| **Qty In** | Quantity received/added |
| **Qty Out** | Quantity issued/removed |
| **Bal Qty** | Running balance quantity after the transaction |

**Use Cases:**
- Trace where specific items have moved over a period
- Audit individual transactions by document number
- Identify unusual movement patterns (e.g., spikes in qty out)
- Reconcile physical stock counts against system records

#### Business Context
- **Inventory Management**: Used to investigate stock discrepancies (e.g., "Why is our count short by 5 units?").
- **Audit & Compliance**: Provides a complete audit trail of every stock movement for internal controls.

#### Data Source & Logic
- **Source**: Fetches raw transaction records from the **Stock Transaction Ledger**.
- **Logic**: Every single inventory event (Purchase, Sale, Transfer, Adjustment) creates a strict debit/credit entry here. This is the "source of truth" for all stock movements.



---

## Stock Aging Report
{{< figure src="/images/stock-report-applet/stock-aging-report.png" alt="Stock Aging Report" caption="Analyze inventory age with configurable aging buckets." >}}

The **Stock Aging Report** breaks down your inventory by how long items have been in stock. Aging periods are dynamically configurable—you can choose between **day-based** or **month-based** aging buckets.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Category 1–10** | Item category levels (hidden by default, reveal as needed) |
| **Item Code** | Item identifier |
| **Item Name** | Item description |
| **Dynamic Aging Columns** | Generated based on your aging period settings (e.g., 0–30 days, 31–60 days, etc.) |

**Aging Period Configuration:**

The aging report uses the **Aging Period Settings** configured in Application Settings. You can set the period type to:
- **Day** — Buckets in day ranges (e.g., 0–30, 31–60, 61–90, etc.)
- **Month** (Default) — Buckets by month count

**Use Cases:**
- Identify slow-moving or dead stock that needs discounting or disposal
- Support warehouse optimization by highlighting old inventory
- Provide data for inventory write-down decisions

#### Business Context
- **Accounting**: Used to calculate **Inventory Obsolescence Provision** (write-downs) for financial statements.
- **Warehouse Management**: Identifies "dead stock" taking up valuable space that should be cleared or discounted.

#### Key Calculations
- **Aging Buckets**: Items are categorized into buckets (e.g., 0-30 days, 31-60 days) based on the time elapsed since they were received or last moved.
- **Value**: The report calculates total value in each bucket using the item's **Moving Average (MA) Cost**.

#### Data Source & Logic
The report queries the **historical stock transaction ledger**. It looks at the *remaining quantity* of each inbound shipment (GRN, Adjustment In) and calculates its age:
`Age = Current Date - Transaction Date`
It then sums up the value of these specific aged quantities to give you the total aging value.



---

## Stock Summary Report by Location
{{< figure src="/images/stock-report-applet/stock-summary-report-by-location.png" alt="Stock Summary Report by Location" caption="High-level summary of stock quantities and values per location." >}}

A high-level summary of stock quantities and values grouped by location. Use this to quickly compare inventory distribution across your warehouses.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Item Code / Item Name** | Item identification |
| **Category 1–10** | Item category classifications |
| **Location-based data** | Quantities and values per location |

#### Business Context
- **Executive Overview**: Used by management to quickly see how much stock value is sitting in each warehouse branch.
- **Logistics**: Helps decide if stock needs to be transferred from a surplus location to a deficit location.

#### Data Source & Logic
- **Source**: Aggregates data from the **Item Location Balance** table.
- **Logic**: Sums up the `Quantity` and `Value` (Qty × Cost) for all items, grouped strictly by **Location ID**.

---

## Historical Stock Balance
{{< figure src="/images/stock-report-applet/historical-stock-balance.png" alt="Historical Stock Balance" caption="Stock balance snapshots over a selected date range." >}}

The **Historical Stock Balance** report shows stock balance snapshots over a selected date range. This lets you track how stock levels changed over time.

**Use Cases:**
- Compare stock levels at different points in time
- Identify seasonal demand patterns
- Support inventory forecasting and planning
- Audit historical inventory records

#### Business Context
- **Supply Chain Planning**: Analyzing historical trends helps predict future stock needs based on past consumption patterns.
- **Accounting**: Used to reconstruct inventory value at a specific past date (e.g., for month-end or year-end closing verification).

#### Data Source & Logic
- **Source**: **Transaction History** + **Current Balance**.
- **Calculation**: It starts with the *current* stock balance and "rolls back" transactions (reversing In/Out movements) to calculate what the balance *must have been* on the selected date.



---

## Stock Balance Report
{{< figure src="/images/stock-report-applet/stock-balance-report.png" alt="Stock Balance Report" caption="Current stock balance overview with valuation metrics." >}}

The **Stock Balance Report** shows the current stock balance for each item across your company, with cost valuations.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Company** | Company name |
| **Category 1–10** | Item category levels (hidden by default) |
| **Item Code** | Item identifier |
| **Item Name** | Item description |
| **Type / Sub Type** | Item transaction type and sub-type (hidden by default) |
| **UOM** | Unit of measurement (hidden by default) |
| **Bal Qty** | Current ledger balance quantity |
| **Unit Cost** | Moving Average (MA) cost per unit |
| **Total Cost** | MA cost × balance quantity |
| **Unit Last Cost** | Last purchase cost per unit |
| **Total Last Cost** | Last purchase cost × balance quantity |

**Search Options:**
- Filter by **Company**, **Item Type**, **Item Status**, **Item Range**, and **Item Category Levels 1–20**
- Optionally **Show Zero Balance** items via the optional filters

**Use Cases:**
- Get a snapshot of current inventory and its valuation
- Compare MA cost vs. last purchase cost for pricing decisions
- Identify items with zero balance that may need reordering
- Export for accounting reconciliation

#### Business Context
- **Finance**: Provides the **data source for the Balance Sheet** "Inventory" asset line item.
- **Purchasing**: Used to verify current stock-on-hand before placing new supplier orders to avoid overstocking.

#### Data Source & Calculation
- **Quantity**: Pulled directly from the live **Item Stock Ledger**. It represents the real-time physical quantity available in the system.
- **Value**: Calculated using the **Weighted Moving Average (MA) Cost**.
`Total Cost = Quantity × Current MA Unit Cost`
*Note: This report reflects the status at the exact moment the report is run.*



---

## Stock Sales & Purchase by Item Code
{{< figure src="/images/stock-report-applet/stock-sales-and-purchase-by-item-code.png" alt="Stock Sales & Purchase by Item Code" caption="Comparison of sales vs. purchase activity with Gross Profit analysis." >}}

This report provides a side-by-side comparison of **sales** and **purchase** activity for each item within a date range. It also calculates **Gross Profit (GP)**.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Category 1–10** | Item category classifications (hidden by default) |
| **Location** | Formatted as `Location Code | Location Name` |
| **Item Code / Item Name** | Item identification |
| **Item Description** | Additional description (hidden by default) |
| **Qty Sold** | Total units sold in the period |
| **Sales Amount** | Total revenue from sales |
| **Cost** | Cost of goods sold (permission-controlled) |
| **GP** | Gross Profit = Sales Amount − Cost (permission-controlled) |
| **Purchase Qty** | Total units purchased in the period |
| **Purchase Amount** | Total purchase spending |
| **Bal Qty** | Closing balance quantity |
| **Stock Turn Ratio** | Inventory turnover indicator |
| **Last Purchase** | Date of the most recent purchase |

**Use Cases:**
- Evaluate product profitability (GP analysis)
- Compare sales vs. purchasing volumes per item
- Identify items with declining sales or increasing costs
- Support pricing strategy decisions

#### Business Context
- **Sales & Marketing**: Identifies high-performing items (high sales, high GP) versus loss-leaders.
- **Purchasing**: Helps negotiators compare **Last Purchase Price** trends against sales performance.

#### Data Source & Logic
- **Sales Data**: Aggregated from **Posted Sales Invoices** and **Cash Sales** within the date range.
- **Purchase Data**: Aggregated from **Posted Supplier Invoices** and **GRNs**.
- **Logic**: Matches total sales quantity vs. total purchase quantity for the *same item code* to allow side-by-side comparison.


#### Key Calculations
Assuming permission to view costs:
- **Sales Amount**: `Unit Price × Qty Sold`
- **Cost (COGS)**: `Unit Cost (MA) × Qty Sold`
- **Gross Profit (GP)**: `Sales Amount - Cost`
- **Stock Turn Ratio**: Indicates how many times inventory is sold and replaced over a period (Higher = Better efficiency).


---

## Stock Value by Level
{{< figure src="/images/stock-report-applet/stock-value-by-level-report.png" alt="Stock Value by Level" caption="Aggregated stock values grouped by item category levels and location." >}}

The **Stock Value by Level** report aggregates stock quantity and value data grouped by **item categories** and broken down by **location**. It uses pivot-style columns to show per-location quantities and amounts.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Category 1–10** | Item category levels (Category 1 and 2 used as row groups) |
| **Total Qty** | Aggregated quantity across all locations |
| **Total Amount** | Aggregated MA amount across all locations |
| **Location Columns** | Dynamically generated per-location columns showing Qty and Amount |

**Use Cases:**
- Understand inventory distribution by category and location
- Support category-level inventory valuation
- Compare stock allocation across warehouses

#### Business Context
- **Category Management**: Used by merchandisers to analyze stock investment across different product families (e.g., "Do we have too much value tied up in Accessories vs. Main Units?").

#### Data Source & Logic
- **Source**: **Item Master** (Category Links) + **Stock Balance**.
- **Logic**: Groups all items by their assigned **Category Hierarchy** (Level 1–10) and sums their total stock value. Useful for high-level financial reporting rather than item-level checking.



---

## Batch & Expiry Date Report
{{< figure src="/images/stock-report-applet/batch-and-expiry-date-report.png" alt="Batch & Expiry Date Report" caption="Track items approaching expiry with month-based buckets." >}}

Track items with **batch numbers** and **expiry dates**. The report categorizes items into month-based expiry buckets to help you manage perishable or time-sensitive inventory.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Category 1–10** | Item category classifications (hidden by default) |
| **Item Code / Item Name** | Item identification |
| **Qty** | Current quantity |
| **Amount** | MA price (permission-controlled) |
| **Expiry Date** | The item's expiry date |
| **Dynamic Month Columns** | Items categorized into: 0 Month, 1 Month, 2 Months, 3 Months, 4–6 Months, 7–12 Months, 13–24 Months, >24 Months |

**Use Cases:**
- Identify items nearing expiry for clearance or disposal
- Monitor batch-tracked inventory health
- Support FIFO/FEFO picking strategies
- Generate reports for regulatory compliance

#### Business Context
- **Quality Control**: Critical for FIFO (First-In-First-Out) and FEFO (First-Expired-First-Out) inventory management to prevent spoilage.
- **Compliance**: Required for regulated industries (food, pharma) to trace batch history and expiry.

#### Data Source & Logic
- **Source**: **Batch Master Table**.
- **Logic**: Filters batch records where `Expiry Date` is approaching. It groups items into month-based buckets (e.g., "Expiring in 0 Months", "1 Month", etc.) relative to the **Current Date**.



---

## Stock Balance (Supplier & Serial)
{{< figure src="/images/stock-report-applet/stock-balance-report-by-supplier-with-serial.png" alt="Stock Balance (Supplier & Serial)" caption="Stock balances grouped by supplier with serial number details." >}}

This report shows stock balances **grouped by supplier**, with links to the original purchase documents and **serial number** details for tracked items.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Supplier** | Supplier name and code (used as row group header) |
| **Txn Date** | Transaction date from the purchase document |
| **Doc Short Code / Doc No** | Document type abbreviation and document number |
| **Category 1–10** | Item categories (hidden by default) |
| **Item Code / Item Name** | Item identification |
| **Bal Qty** | Current stock balance |
| **Unit Cost / Total Cost** | MA cost values (permission-controlled) |
| **Serial Numbers** | List of serial numbers for the item (multi-line display) |

**Use Cases:**
- Track which supplier provided which stock
- Manage warranty or after-sales by linking serial numbers back to suppliers
- Audit purchase transactions linked to current inventory

#### Business Context
- **Vendor Management**: Used to evaluate supplier performance and track defective items back to their source.
- **Warranty Claims**: Essential for verifying if a returned item with a specific serial number was indeed purchased from a specific supplier.

#### Data Source & Logic
- **Source**: **Purchase History** linked to **Serial Number Registry**.
- **Logic**: Instead of just showing "Item A: 10 units", it traces each unit back to its original **Goods Received Note (GRN)** to display the *Supplier* who delivered it.



---

## Stock Balance by Item, Supplier & Batch
{{< figure src="/images/stock-report-applet/stock-balance-by-item-supplier-and-batch-expiry-report.png" alt="Stock Balance by Item, Supplier & Batch" caption="Cross-referenced view of items, suppliers, and batch numbers." >}}

A cross-referenced report combining **item**, **supplier**, and **batch** data in one view.

**Key Columns:**

| Column | Description |
|--------|-------------|
| **Item Code / Item Name** | Item identification |
| **Qty** | Current balance |
| **MA Price / MA Amount** | Moving Average cost values (permission-controlled) |
| **Batch Number** | Batch tracking reference |
| **Entity** | Supplier/entity name |

**Use Cases:**
- Comprehensive supplier-batch-item cross-referencing
- Support traceability requirements
- Batch-level valuation analysis

---

## Configuration & Settings

Access settings from the **Settings** menu item in the sidebar. The settings are organized into sections:

### Application Settings (`Settings > Application Settings`)

The Application Settings page has **three tabs**:

**Tab 1: Sidebar Menu**

Toggle which reports appear in the sidebar. Each report can be individually hidden or shown using slide toggles. This is useful for simplifying the interface for users who only need specific reports.

**Tab 2: Stock Report Listing**

Configure report-level settings:

| Setting | Description |
|---------|-------------|
| **HIDE_MA_COST** | Toggle visibility of MA Cost columns across all reports |
| **HIDE_GP** | Toggle visibility of Gross Profit columns |
| **HIDE_GP_PERCENTAGE** | Toggle visibility of GP Percentage columns |
| **Aging Period** | Select between **Month** (default) and **Day** for the Stock Aging Report |
| **Pricing Schemes** | Select which pricing schemes to include in reports |

**Tab 3: Item Category Group**

Configure up to **20 item category groups** used for filtering. Each group links to a label list and can be individually shown or hidden using the visibility toggle.

---

### Default Selection (`Settings > Default Selection`)

Set applet-wide defaults that auto-populate when the applet loads:

| Setting | Description |
|---------|-------------|
| **Default Branch** | Pre-selects the branch for reports |
| **Default Location** | Pre-selects the location for reports |
| **Default Language** | Sets the applet UI language |

A **Reset** button is available to clear all defaults.

---

### Webhook (`Settings > Webhook`)

Configure webhook integrations for automated notifications or data sync with external systems.

---

### Permissions

Permission settings control who can access reports and modify applet settings. Since this is a read-only reporting applet, these permissions do **not** affect stock or inventory data—they only control access to the reports themselves and the applet's configuration.

| Permission Setting | Description |
|-------------------|-------------|
| **Read Permission** | Controls who can view reports — permissions can be targeted to specific locations and branches |
| **Create Permission** | Controls who can create applet setting configurations |
| **Update Permission** | Controls who can update applet settings |
| **Delete Permission** | Controls who can delete applet setting configurations |

---

### Release Notes (`Settings > Release Notes`)

View applet version history and feature updates.

---

### Applet Log (`Settings > Applet Log`)

Audit trail showing configuration changes made within the applet (e.g., changes to default settings, field visibility toggles, permission updates):

| Column | Description |
|--------|-------------|
| **Table Name** | Which setting/configuration was affected |
| **Action** | CREATE, UPDATE, DELETE |
| **Action Date** | When it happened |
| **Description** | Details of the change |

---

## Personalization

Personalization settings allow individual users to override applet-wide defaults for their own experience.

### Personal Default Settings

Set your personal defaults that override the applet-level defaults:

| Setting | Description |
|---------|-------------|
| **Default Branch** | Your preferred branch (overrides applet default) |
| **Default Location** | Your preferred location (overrides applet default) |
| **Default Language** | Your preferred UI language (overrides applet default) |

{{< callout type="info" >}}
**Note**: Personal settings take priority over the applet-level default settings configured by admins.
{{< /callout >}}

### Sidebar Customization

Arrange and customize sidebar menu items to match your preferred workflow.

---

## FAQ

**Q: Why are some columns missing from my report?**
A: Column visibility is controlled by two things: (1) **Application Settings** toggles (e.g., `HIDE_MA_COST`), and (2) **User Permissions** (e.g., `SHOW_MA_COST`). Contact your admin if you need access to hidden columns.

**Q: How do I change the aging period in the Stock Aging Report?**
A: Go to **Settings > Application Settings** → under the "Stock Report Listing" tab, change the **Aging Period** dropdown from Month to Day (or vice versa).

**Q: Why does my search return no results?**
A: Ensure your search keyword is at least 3 characters long. Also check that your location, date range, and other filters are not too restrictive.

**Q: Can I export reports?**
A: Yes. All reports support export via the **Status Bar** at the bottom of the grid. You can export to Excel or PDF.

**Q: Why can't I see certain reports in the sidebar?**
A: Some reports may be hidden via **Settings > Application Settings** (Sidebar Menu tab). Ask your admin to enable the reports you need.

**Q: What is the difference between the various Stock Balance reports?**
A: The applet offers multiple stock balance views for different needs:
- **Stock Balance Report** — Basic balance with MA and last purchase cost
- **Stock Balance (Supplier & Serial)** — Balance grouped by supplier with serial number tracking
- **Stock Balance (Item, Supplier & Batch)** — Balance cross-referenced by item, supplier, and batch number

Choose the one that matches your analysis needs.

**Q: How do item category levels work in the reports?**
A: Item categories (Category 1–10) are additional classification fields on your items. They are hidden by default in most reports but can be revealed using the **Column Toggle**. Use them in the **Advanced Search** filters to narrow results to specific item groups.

**Q: What does "Show Zero Balance" do?**
A: By default, the Stock Balance Report excludes items with zero quantity. Enabling "Show Zero Balance" in the search options includes all items, even those with no current stock.
