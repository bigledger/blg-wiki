---
title: "Stock Adjustment Applet"
description: "Inventory adjustment and correction tool for managing stock quantities, serial numbers, batch numbers, and moving averages"
tags:
- stock-adjustment
- inventory-management
- serial-adjustment
- batch-adjustment
- inventory-correction
- stock-reconciliation
aliases:
- /applets/inventory-workflow/internal-stock-adjustment-applet/
---

## Purpose and Overview

The **Stock Adjustment Applet** is your tool for correcting inventory discrepancies — whether from physical counts, damaged goods, write-offs, or data migration issues. It supports quantity adjustments, serial and batch number corrections, bulk imports, and moving average cost resets.

{{< callout type="info" >}}
**Core Concept**: Stock adjustments are the bridge between your **physical inventory** and your **system inventory**. After every physical count or stock discrepancy, use this applet to bring the system in line with reality — with a full audit trail.
{{< /callout >}}

### Who Benefits from This Applet?

**Warehouse Managers:**
- Correct stock discrepancies after physical counts
- Adjust inventory for damaged or lost items
- Process write-offs and write-ons

**Inventory Controllers:**
- Reconcile system vs physical stock
- Adjust serial and batch number records
- Reset moving average costs when needed

**Finance Teams:**
- Review stock adjustment impact on inventory valuation
- Track inventory value changes
- Audit adjustment history

**Operations Teams:**
- Process bulk adjustments via file import
- Fix serial number data issues
- Manage batch quantity corrections

### What Problems Does This Solve?

**Traditional Adjustment Challenges:**
- Manual stock count reconciliation
- Difficulty adjusting serialized inventory
- No audit trail for inventory changes
- Complex moving average recalculations

**The Stock Adjustment Solution:**
- **Easy quantity adjustments** — Adjust-In to add stock or Adjust-Out to remove stock with remarks
- **Serial/Batch adjustments** — Correct tracked item records
- **Bulk import** — Process multiple adjustments from files
- **Moving average reset** — Recalculate item costs accurately
- **Complete audit trail** — Track all adjustment history

## Key Features Inventory

{{< cards >}}
  {{< card title="Stock Adjustment" subtitle="Standard multi-line quantity adjustments" link="#stock-adjustment" >}}

  {{< card title="Stock Adjustment By Batch Item" subtitle="Adjust batch-tracked items" link="#stock-adjustment-by-batch-item" >}}

  {{< card title="Serial Number Adjustment" subtitle="Adjust-In/Out for serialized items" link="#serial-number-adjustment" >}}

  {{< card title="File Import" subtitle="Bulk adjustments from files" link="#file-import" >}}

  {{< card title="Reset Moving Average" subtitle="Recalculate item costs" link="#reset-moving-average-ma" >}}

  {{< card title="Reset MA By Location" subtitle="Location-level cost reset" link="#reset-ma-by-location" >}}
{{< /cards >}}

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-overview-infographic.png" alt="Mastering Inventory: The Streamlined Stock Adjustment Workflow - showing adjustment lifecycle, specialized correction tools including bulk file import, serial & batch precision, and moving average reset" caption="Mastering Inventory: The complete stock adjustment workflow from identifying discrepancies through posting, with specialized tools for bulk imports, serial/batch adjustments, and moving average recalculation." >}}

---

## Prerequisites

Before using the Stock Adjustment Applet, ensure the following are set up:

| Prerequisite | Where to Configure |
|-------------|-------------------|
| **Branches and Locations** | Configured in the system administration module |
| **Items** | Created in the Item Maintenance Applet with correct tracking types (standard, serial, batch) |
| **GL Codes** | Chart of Account Applet — required for financial posting of adjustments |
| **User Permissions** | `Settings > Permission Set` — users need CREATE, READ, UPDATE permissions |
| **Menu Visibility** | `Settings > Application Settings` — ensure relevant sidebar menus are visible for the user's role |

---

## Key Concepts

### Adjustment Methods

Line items in a stock adjustment use one of two methods:

| Method | Description | Use Case |
|--------|-------------|----------|
| **Adjust-In** | Add stock quantity into inventory | Found items during count, returns, received gifts, corrections |
| **Adjust-Out** | Remove stock quantity from inventory | Damaged goods, theft, write-offs, expired items |

{{< callout type="warning" >}}
The documentation previously referenced "Increase/Decrease/Transfer/Correction" types. The actual applet UI uses **Adjust-In** and **Adjust-Out** on each line item.
{{< /callout >}}

### Document Lifecycle

Stock adjustment documents follow the standard DRAFT → FINAL lifecycle:

| Status | Description | What You Can Do |
|--------|-------------|----------------|
| **DRAFT** | Document created but not yet posted | Edit all fields, add/remove line items, delete the document |
| **FINAL** | Document posted — stock quantities and GL updated | Cannot edit; create a counter-adjustment to correct |
| **VOID** | Document voided — reverses the stock and GL impact | Used to cancel a posted adjustment |
| **DISCARDED** | Document discarded before posting | Used to abandon a draft without posting |

{{< callout type="info" >}}
**Key Actions:**
- **SAVE** = keeps the document in DRAFT status for further editing
- **FINAL** = posts the adjustment, updates stock quantities and generates GL journal entries
- **CLONE** = duplicates an existing adjustment document as a new DRAFT
- You **cannot delete** a FINAL document. To correct a mistake, create a counter-adjustment with the opposite Adjust-In/Adjust-Out quantities.
{{< /callout >}}

### Costing Methods (Base On)

When adding a line item, you select a **Base On** value that determines how the unit price is calculated:

| Base On | Description |
|---------|-------------|
| **cost_ma_price** | Moving Average unit cost (most common) |
| **cost_fifo_price** | First-In-First-Out cost |
| **cost_lifo_price** | Last-In-First-Out cost |

---

## Sidebar Menu Reference

The applet sidebar contains the following menu items (some may be hidden via Application Settings):

| Sidebar Menu | Purpose | When to Use |
|-------------|---------|-------------|
| **Stock Adjustment** | Standard multi-line quantity adjustments | General stock count corrections, write-offs, write-ons |
| **Stock Adjustment By Batch Item** | Batch-tracked item adjustments | Correcting batch quantities, expiry-tracked items |
| **Serial Number Adjustment** | Serial adjust-in/adjust-out | Adding or removing specific serial numbers |
| **File Import** | Bulk quantity adjustments from spreadsheet | Large-scale corrections (e.g., annual stock take) |
| **Reset MA** | Global moving average cost reset | Correcting item cost across all locations |
| **Reset MA By Location** | Location-level moving average reset | Correcting item cost at a specific warehouse |
| **File Import Reset MA** | Bulk MA reset from spreadsheet | Mass cost corrections during system go-live |
| **Stock Adjustment by Reset MA** | Combined quantity + MA cost reset | Adjusting both quantity and cost in one step |

---

## Quick Start Guide

### Step 1: Create a Stock Adjustment

1. Go to **Stock Adjustment** from the sidebar
2. Click **"+"** to create a new adjustment document
3. On the **Main Details** tab, set:
   - **Location** — the warehouse or store location
   - **Transaction Date** — the date of the adjustment

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-edit-details.png" alt="Stock Adjustment Details Tab" caption="Main Details tab: Set the location, transaction date, and other header-level information." >}}

### Step 2: Add Line Items

1. Click the **Line Items** tab
2. Click **"+"** to add an item
3. For each line item, configure:
   - **Item** — select the product to adjust
   - **Adjust-In** or **Adjust-Out** — choose the adjustment direction
   - **Quantity** — the number of units to adjust
   - **Base On** — the costing method (e.g., `cost_ma_price`)
   - **Unit Price** — auto-populated based on Base On, or enter manually
   - **Remarks** — reason for the adjustment (e.g., "Damaged during transit")
4. The **Current Location Stock Balance** and **Current Moving Average Unit Cost** fields display the current values for reference

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-edit-lines.png" alt="Stock Adjustment Lines Tab" caption="Line Items tab: Add items with Adjust-In/Adjust-Out, quantity, base on, unit price, and remarks." >}}

### Step 3: Handle Tracked Items (if applicable)

For items with tracking enabled, additional tabs appear on the line item:

| Tracking Type | Tab | What to Do |
|--------------|-----|-----------|
| **Serial Number** | Serial Number tab | Enter or scan individual serial numbers |
| **Batch Number** | Batch Number tab | Select batch and enter quantity per batch |
| **Bin Number** | Bin Number tab | Specify bin locations for the adjustment |

### Step 4: Save and Finalize

1. Click **SAVE** to keep the document as DRAFT
2. Review all line items and remarks
3. Click **FINAL** to post the adjustment — this updates stock quantities and generates GL journal entries

---

## Stock Adjustment

### Creating Adjustments

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-listing.png" alt="Stock Adjustment Listing" caption="Main Stock Adjustment listing showing all adjustment records with status, location, and transaction details." >}}

The main Stock Adjustment screen is a multi-line adjustment document. Each document can contain multiple line items for different products, all posted together as a single transaction.

### Edit Tabs

When editing a stock adjustment, the following tabs are available:

| Tab | Purpose |
|-----|---------|
| **Main Details** | Location, transaction date, and header-level fields |
| **Line Items** | Add items with Adjust-In/Out, quantity, unit price, and remarks |
| **Attachment** | Upload supporting documents (count sheets, photos) |
| **Export** | Export the adjustment data |

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-edit-attachment.png" alt="Stock Adjustment Attachment Tab" caption="Attachment tab: Upload supporting documents such as count sheets and photos." >}}

### Line Item Fields

| Field | Description | Required |
|-------|-------------|----------|
| **Item** | Product to adjust | Yes |
| **Adjust-In / Adjust-Out** | Direction of the adjustment | Yes |
| **Current Location Stock Balance** | Current stock quantity at the location (read-only) | — |
| **Current Moving Average Unit Cost** | Current MA cost per unit (read-only) | — |
| **Quantity** | Number of units to adjust | Yes |
| **Base On** | Costing method (`cost_ma_price`, `cost_fifo_price`, `cost_lifo_price`) | Yes |
| **Unit Price** | Cost per unit (auto-populated or manual) | Yes |
| **Remarks** | Reason for the adjustment | No |

---

## Stock Adjustment By Batch Item

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-batch-item.png" alt="Stock Adjustment By Batch Item" caption="Stock Adjustment By Batch Item: Adjust batch-tracked inventory." >}}

Items tracked by batch (e.g., food, pharmaceuticals, chemicals) require adjustments at the batch level to maintain traceability and expiry compliance.

**How to Use:**
1. Go to **Stock Adjustment By Batch Item** from the sidebar
2. Click **"+"** to create a new batch adjustment
3. Select the item and batch number
4. Choose **Adjust-In** or **Adjust-Out**
5. Enter the quantity and remarks
6. **SAVE**, then **FINAL** to post

---

## Serial Number Adjustment

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-serial-item.png" alt="Serial Number Adjustment" caption="Serial Number Adjustment: Adjust-In or Adjust-Out for serialized inventory items." >}}

The **Serial Number Adjustment** sidebar menu opens the serial adjust-in/adjust-out screen for items tracked by serial number.

**How to Use:**
1. Go to **Serial Number Adjustment** from the sidebar
2. Click **"+"** to create a new serial adjustment
3. Select the item and enter/scan the serial number
4. Choose **Adjust-In** (to add the serial to inventory) or **Adjust-Out** (to remove it)
5. Enter remarks
6. **SAVE**, then **FINAL** to post

---

## File Import

### Bulk Adjustment Import

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-file-import.png" alt="Stock Adjustment File Import" caption="File Import: Bulk adjustments from spreadsheets." >}}

Process large numbers of adjustments from a spreadsheet — ideal for annual stock takes or data migrations.

**How to Use:**
1. Go to **File Import** from the sidebar
2. Click **"+"** to create a new import
3. **Download Template** — get the correctly formatted Excel template
4. **Fill in Data** — populate the template with adjustment details:

| Template Column | Description |
|----------------|-------------|
| **Branch Code** | The branch identifier |
| **Location Code** | The warehouse/store location |
| **Item Code** | The product SKU/code |
| **GL Code** | General Ledger account for the adjustment |
| **Quantity** | Positive for Adjust-In, negative for Adjust-Out |
| **Serial Number** | For serial-tracked items |
| **Batch Number** | For batch-tracked items |
| **Remarks** | Reason for the adjustment |

5. **Upload** the completed file
6. **Review** — the system validates all rows and flags errors
7. **Fix Errors** — correct any validation failures and re-upload if needed
8. **Process** — confirm and post all valid adjustments

### Supported Formats
- Excel files (.xlsx)
- CSV files

---

## Reset Moving Average (MA)

### Recalculating Inventory Valuation

{{< figure src="/images/stock-adjustment-applet/stock-adjustment-reset-ma.png" alt="Reset Moving Average" caption="Reset Moving Average: Recalculate item costs for accurate inventory valuation." >}}

The Moving Average (MA) is the weighted average cost of your inventory. System adjustments, incorrect purchase receipts, or data migrations can sometimes skew this valuation. The **Reset MA** tools allow finance teams to manually correct the item cost to reflect reality.

{{< callout type="warning" >}}
**Accounting Impact**: Resetting the Moving Average directly impacts your **Inventory Valuation** on the Balance Sheet and **Cost of Goods Sold (COGS)** on your Income Statement. This should only be performed by authorized finance personnel.
{{< /callout >}}

**How to Use:**
1. Go to **Reset MA** from the sidebar
2. Click **"+"** to create a new reset
3. Select the **Company** and **Item**
4. Enter the **Date**, **Quantity**, **Old MA Cost**, and **New MA Cost**
5. **SAVE**, then **FINAL** to post the cost correction

### Reset MA By Location

Same as Reset MA, but resets the cost for an item **only within a specific warehouse or location** rather than globally.

**When to Use:** When the cost discrepancy is isolated to a single location (e.g., a branch received goods at the wrong price).

### File Import Reset MA

Bulk reset moving average costs for many items at once from a spreadsheet. Typically used during initial system go-live or after a major data migration.

### Stock Adjustment by Reset MA

Perform a **quantity adjustment and cost reset in a single combined step**. Use this when both the quantity and the moving average cost need correction simultaneously.

---

## Common Scenarios

### Scenario 1: End-of-Year Physical Inventory Validation

**Situation:** The warehouse conducts its annual physical count. The results show 450 discrepancies across 12,000 SKUs. Manually entering 450 adjustments is too slow.

**The Workflow:**
1. The inventory controller downloads the template from **File Import**
2. They populate the spreadsheet with the 450 SKUs, entering positive quantities for found items (Adjust-In) and negative quantities for missing items (Adjust-Out), with remarks like "EOY-COUNT-2026"
3. They upload the file — the system validates all 450 lines instantly
4. After reviewing and fixing any validation errors, they click **FINAL** to post all adjustments, updating the stock ledger and generating corresponding GL journal entries

### Scenario 2: Writing Off Damaged Serialized Goods

**Situation:** A forklift operator accidentally damages a pallet containing 5 serialized laptops.

**The Workflow:**
1. The warehouse manager opens **Serial Number Adjustment**
2. They create a new adjustment and select the item
3. They enter each damaged laptop's serial number with **Adjust-Out**
4. They add remarks: "Damaged during warehouse handling"
5. They click **SAVE**, review, then **FINAL** to post the write-off

---

## Configuration & Settings

### Application Settings (`Settings > Application Settings`)

System-wide settings that affect all users.

**Menu Visibility:**

| Setting | What It Does |
|---------|--------------|
| `HIDE_SERIAL_DATA_FIX_MENU` | Hides the Serial Number Adjustment menu |
| `HIDE_FILE_IMPORT_RESET_MA_MENU` | Hides the File Import Reset MA menu |
| `HIDE_STOCK_ADJUSTMENT_RESET_MA_MENU` | Hides the Stock Adjustment by Reset MA menu |
| `HIDE_CLONE_BUTTON` | Removes the Clone button from adjustment documents |
| `HIDE_GENDOC_FINAL_BUTTON` | Hides the FINAL button (prevents direct posting) |

**Field Visibility:**

| Setting | What It Does |
|---------|--------------|
| `INCLUDE_SEGMENT` | Shows the Segment/Dimension dropdown on the form |
| `INCLUDE_SST` | Shows SST-related fields |
| `INCLUDE_WHT` | Shows Withholding Tax fields |
| `DEFAULT_ADJUSTMENT_METHOD` | Sets the default Adjust-In/Adjust-Out method |
| `RESET_MA_DATE_NOT_EDITABLE` | Locks the date field on Reset MA forms |
| `Hide Amount / Unit Price` | Hides financial values — keeps warehouse staff focused on quantities |

**Layout:**

| Setting | What It Does |
|---------|--------------|
| `Default Toggle Column` | `DOUBLE` for two-column layout (large monitors), `SINGLE` for standard |
| `Hide Save Button` | Forces users to use FINAL immediately, preventing DRAFT pile-up |

### Field Settings (`Settings > Field Settings`)

Configure which fields are visible and mandatory on the adjustment form.

### Permissions

Access is managed through a layered permission system:

| Permission Type | Location | Purpose |
|----------------|----------|---------|
| **Applet Access** | `Settings > Applet Access` | Control who can access the applet |
| **Permission Wizard** | `Settings > Permission Wizard` | Guided setup for basic access |
| **Permission Set** | `Settings > Permission Set` | Define named permission sets (Client Side and Server Side) |
| **User Permission** | `Settings > User Permission` | Assign permissions to individual users |
| **Team Permission** | `Settings > Team Permission` | Assign permissions to entire teams |
| **Role Permission** | `Settings > Role Permission` | Assign permissions by organisational role |

### Other Settings

| Setting | Location | Purpose |
|---------|----------|---------|
| **Triggers** | `Settings > Triggers` | Configure automated triggers based on adjustment events |
| **Printable Format Settings** | `Settings > Printable Format Settings` | Design custom PDF templates for printed adjustment reports |
| **Release Notes** | `Settings > Release Notes` | View applet version history |
| **Applet Log** | `Settings > Applet Log` | View audit trail of all adjustment actions |
| **Reset Applet State** | `Settings > Reset Applet State` | Reset applet configuration to defaults |

---

## Personalization

Individual users can override certain system defaults via the **Personalization** sidebar menu.

| Setting | Purpose |
|---------|---------|
| **Default Branch** | Pre-fills branch selection when creating new adjustments |
| **Default Location** | Pre-fills location selection when creating new adjustments |
| **Default Toggle Column** | Personal preference for `SINGLE` or `DOUBLE` column layout |

---

## FAQ

**Q: What is the difference between DRAFT and FINAL?**
A: **DRAFT** is a saved document that can still be edited. **FINAL** posts the adjustment — stock quantities are updated, GL journal entries are generated, and the document becomes read-only.

**Q: How do I adjust multiple items at once?**
A: Use the **File Import** feature to upload multiple adjustments from an Excel (.xlsx) or CSV template. Alternatively, add multiple line items within a single Stock Adjustment document.

**Q: What happens to the cost when I adjust stock?**
A: The moving average cost is recalculated based on the adjustment quantity and current value. Use the **Reset MA** tools for precise, manual control over this valuation.

**Q: Can I reverse an adjustment?**
A: You cannot delete a FINAL adjustment because it is a fixed financial ledger entry. To correct a mistake, create a counter-adjustment with the opposite Adjust-In/Adjust-Out direction. The original adjustment remains in the audit trail.

**Q: Where can I see who made an adjustment?**
A: The **Applet Log** (found in Settings) provides a complete, immutable audit trail of every adjustment created, edited, or finalized in the system.

**Q: What is the difference between Reset MA and Reset MA By Location?**
A: **Reset MA** corrects the moving average cost for an item across all locations globally. **Reset MA By Location** corrects the cost only at a specific warehouse or branch — use this when the cost discrepancy is isolated to one location.

---

## Glossary

| Term | Definition |
|------|-----------|
| **Adjust-In** | Adding stock quantity into inventory (e.g., found items, returns) |
| **Adjust-Out** | Removing stock quantity from inventory (e.g., damaged, stolen, written off) |
| **Moving Average (MA)** | The weighted average cost of inventory, recalculated with each stock movement |
| **DRAFT** | A saved adjustment document that has not yet been posted |
| **FINAL** | A posted adjustment — stock and GL are updated, document is locked |
| **VOID** | A cancelled posted adjustment — reverses stock and GL impact |
| **Base On** | The costing method used to determine unit price (MA, FIFO, LIFO) |
| **Serial Tracking** | Items tracked by unique serial number (e.g., electronics, equipment) |
| **Batch Tracking** | Items tracked by batch/lot number with expiry dates (e.g., food, pharmaceuticals) |
| **Bin Tracking** | Items tracked by physical bin location within a warehouse |
| **Counter-Adjustment** | A new adjustment with opposite direction to correct a previously posted adjustment |

---

## Related Modules

| Module / Applet | Relationship |
|----------------|-------------|
| **Item Maintenance Applet** | Items must be created here before they can be adjusted. Item tracking type (standard, serial, batch) determines which adjustment tools are available |
| **Stock Take Applet** | Conduct physical counts that identify discrepancies to be corrected via Stock Adjustment |
| **GRN / Stock In Applets** | Stock received via GRN increases inventory; adjustments correct discrepancies after receipt |
| **GIN / Stock Out Applets** | Stock issued via GIN decreases inventory; adjustments correct discrepancies after issuance |
| **Chart of Account Applet** | GL codes referenced in adjustments must exist here |
| **General Ledger** | FINAL adjustments generate journal entries that post to the GL |
