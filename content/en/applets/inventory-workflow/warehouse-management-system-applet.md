---
title: "Warehouse Management System Applet"
description: "Complete warehouse operations management — inbound receiving, putaway, space allocation, outbound picking, packing, and container tracking"
tags:
- inventory
- warehouse-management
- wms
- inbound-outbound
- stock-management
weight: 160
---

## Purpose and Overview

The **Warehouse Management System (WMS) Applet** provides end-to-end warehouse operations management within BigLedger. It handles every stage of warehouse activity — from receiving goods inbound, allocating storage space, and putting items away, through to picking, packing, and dispatching orders outbound.

{{< callout type="info" >}}
**Inventory Module Applet**: This applet is part of the Inventory & Warehouse module and replaces manual warehouse tracking with a structured, digital workflow that ensures traceability at every step.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Warehouse Managers:**
- Full visibility into warehouse capacity and space utilization
- Real-time tracking of inbound and outbound operations
- Container and picker management
- Space allocation optimization

**Warehouse Staff / Operators:**
- Step-by-step inbound receiving and putaway workflows
- Pick list and packing list generation
- Scan session support for barcode/QR-based operations
- Processing queue management

**Logistics & Supply Chain Teams:**
- End-to-end traceability from receiving to dispatch
- Integration with Purchase GRN and Sales Delivery Orders
- Stock movement audit trail
- Multi-warehouse support

**Management / Finance:**
- Warehouse utilization reporting
- Operational efficiency insights
- Inventory accuracy improvements
- Reduced stock discrepancies

### What Problems Does This Solve?

**The Manual Warehouse Problem:**

Traditional warehouse management relies on paper-based tracking and manual processes. Common issues include:
- Lost or misplaced inventory within the warehouse
- No visibility into warehouse space utilization
- Manual putaway decisions leading to inefficient storage
- Picking errors and delayed order fulfillment
- No traceability for stock movements within the warehouse

**The WMS Applet Solution:**

- **Digital receiving** — Receive goods against Purchase GRN documents with full line-item verification
- **Automated putaway** — System-guided putaway with processing queues for efficient storage
- **Space allocation** — Manage warehouse containers and space assignments
- **Structured picking** — Generate picking lists from sales orders with queue-based processing
- **Scan sessions** — Barcode/QR scanning for fast, error-free operations
- **Full traceability** — Complete audit trail from dock to stock to dispatch

## Key Features Overview

{{< cards >}}
  {{< card title="Warehouse Listing" subtitle="Create & manage warehouse profiles" link="#warehouses" >}}

  {{< card title="Inbound Process" subtitle="Receiving, putaway & scan sessions" link="#inbound-process" >}}

  {{< card title="Space Allocation" subtitle="Container & space management" link="#space-container-allocation" >}}

  {{< card title="Outbound Process" subtitle="Picking queues, pick lists & packing" link="#outbound-process" >}}

  {{< card title="Containers" subtitle="Storage container management" link="#containers" >}}

  {{< card title="Pickers" subtitle="Warehouse picker assignment" link="#pickers" >}}

  {{< card title="Settings" subtitle="Application & item configuration" link="#settings" >}}

  {{< card title="Personalization" subtitle="User-level default preferences" link="#personalization" >}}
{{< /cards >}}

## Key Concepts

### Understanding the WMS Framework

The WMS Applet structures warehouse operations around two core flows and supporting master data:

| Concept | Component | Description |
|---------|-----------|-------------|
| **Inbound** | Receiving → Processing → Putaway | Goods arrive, are verified, processed, and stored |
| **Outbound** | Picking → Packing → Dispatch | Orders are picked, packed, and shipped |
| **Storage** | Warehouses → Containers → Spaces | Physical locations where stock is stored |
| **People** | Pickers | Staff assigned to pick/putaway operations |

{{< callout type="tip" >}}
**Real-World Example**: A Purchase GRN arrives at the dock. The warehouse clerk creates a **Receiving Document**, records each item against the **Receiving Line**. The items enter the **Processing Queue**, where a **Putaway List** is generated and assigned to a **Picker** who stores the items in designated **Containers**.
{{< /callout >}}

### Warehouse Hierarchy

```
Organization
│
├── Warehouse (physical location)
│   ├── Containers (storage units — shelves, bins, racks)
│   │   └── Spaces (individual positions within containers)
│   │
│   ├── Inbound Process
│   │   ├── Receiving Doc (link to PO/GRN)
│   │   ├── Receiving Line (line-level items)
│   │   ├── Processing Queue (items awaiting putaway)
│   │   ├── Putaway List (storage assignments)
│   │   ├── Putaway Processing (execution queue)
│   │   └── Scan Session (barcode/QR scanning)
│   │
│   └── Outbound Process
│       ├── Picking Queue (orders awaiting pick)
│       ├── Picking List (consolidated pick instructions)
│       └── Packing List (pack verification)
│
└── Pickers (warehouse staff)
```

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### Step 1: Set Up Your Warehouse

**Goal:** Create your first warehouse profile.

1. **Navigate**: Go to **Warehouses** from the sidebar
2. **Create**: Click **"+"** → Enter warehouse name and details
3. **Configure**: Set the warehouse address, contact person, and operating parameters
4. **Save**: Click **Save** to create the warehouse

### Step 2: Set Up Containers

**Goal:** Define storage locations within your warehouse.

1. **Navigate**: Go to **Containers** from the sidebar
2. **Create**: Click **"+"** → Enter container details (name, type, capacity)
3. **Assign**: Link the container to your warehouse
4. **Save**: Click **Save**

### Step 3: Receive Inbound Goods

**Goal:** Process goods arriving at your warehouse.

1. **Navigate**: Go to **Inbound Process** → **Receiving Doc**
2. **Create**: Click **"+"** → Select the source document (e.g., Purchase GRN)
3. **Add Lines**: Add or verify receiving lines against the source document
4. **Submit**: Submit the receiving document for processing

### Step 4: Putaway Items

**Goal:** Store received goods in designated locations.

1. **Navigate**: Go to **Inbound Process** → **Putaway List**
2. **Review**: Check the system-generated putaway assignments
3. **Execute**: Assign pickers and process the putaway
4. **Confirm**: Mark items as stored in their designated containers

### Step 5: Pick Outbound Orders

**Goal:** Fulfill customer orders.

1. **Navigate**: Go to **Outbound Process** → **Picking Queue**
2. **Select**: Choose orders to pick
3. **Generate**: Create a picking list for the selected orders
4. **Pick & Pack**: Execute the pick, then generate the packing list for verification

---

## Sidebar Menu Reference

### Warehouses

The **Warehouses** listing is the master data screen for managing all warehouse profiles in your organization.

**Listing View:**
- Displays all registered warehouses with key details
- Search and filter by warehouse name, status, or location
- Click any row to edit warehouse details
- Click **"+"** to create a new warehouse

**Create / Edit View:**
- **Warehouse Name** — Name identifying the warehouse
- **Address** — Physical location details
- **Contact Person** — Primary contact for warehouse operations
- **Status** — Active / Inactive
- **Operating Parameters** — Capacity, operating hours, and other configurations

---

### Inbound Process

The inbound process handles goods arriving at the warehouse. It consists of 6 sub-modules, each managing a stage of the receiving-to-storage workflow.

#### Receiving Doc

Receiving Documents record the arrival of goods at the warehouse, typically linked to a Purchase GRN or inter-branch transfer.

**Listing View:**
- Lists all receiving documents with status indicators (Draft, Processing, Completed)
- Filter by date range, source document, or status
- Click any row to view or edit

**Create / Edit View:**
- **Source Document** — Link to originating Purchase GRN or Transfer document
- **Warehouse** — Destination warehouse
- **Expected Date** — When items are expected
- **Line Items** — Individual items being received with quantities
- **Status** — Draft → Processing → Completed

{{< callout type="warning" >}}
**Important**: Only submit a Receiving Document after verifying the physical goods match the document quantities. Discrepancies should be noted before submission.
{{< /callout >}}

#### Receiving Line

Provides a consolidated view of all individual receiving lines across documents.

**Listing View:**
- Aggregated view of all receiving line items
- Filter by item, warehouse, receiving document, or status
- Useful for tracking partial receipts and outstanding items

#### Processing Queue

Items that have been received but not yet put away appear in the Processing Queue.

**Listing View:**
- Lists all items awaiting putaway processing
- Shows item details, received quantity, and target storage location
- Actions: Assign to putaway list, assign to picker

#### Putaway List

Generated lists of items to be stored in specific warehouse locations.

**Listing View:**
- Lists all putaway assignments
- Shows target container, picker assignment, and status
- Filter by picker, warehouse, or date

**Processing:**
- Assign pickers to putaway tasks
- Track completion of each putaway instruction
- Confirm storage when items reach their destination

#### Putaway Processing

Execution queue for putaway operations, providing a workflow view for warehouse staff.

**Listing View:**
- Active putaway tasks in queue
- Priority ordering
- Picker assignment and progress tracking

#### Scan Session

Barcode/QR-based scanning interface for warehouse operations.

**Key Features:**
- Scan items during receiving for fast verification
- Scan during putaway for location confirmation
- Scan during picking for accuracy validation
- Session-based tracking for batch operations

---

### Space Container Allocation

Manage the allocation and utilization of storage containers within warehouses.

#### Listing

**Listing View:**
- Displays all container-space allocations
- Shows container name, assigned warehouse, current utilization
- Filter by warehouse, container type, or availability status

**Create / Edit View:**
- **Container** — Select the storage container
- **Warehouse** — Assign to a warehouse
- **Space** — Define available space / capacity
- **Items Allocated** — View current items stored in this container

---

### Outbound Process

The outbound process manages order fulfillment from pick to dispatch. It consists of 3 sub-modules.

#### Picking Queue

Orders awaiting fulfillment appear in the Picking Queue.

**Listing View:**
- Lists all orders requiring picking
- Shows order priority, items to pick, and warehouse location
- Actions: Generate picking list, assign picker

**Key Features:**
- Priority-based queue ordering
- Multi-order consolidation for batch picking
- Picker assignment

#### Picking List

Consolidated picking instructions generated from the Picking Queue.

**Listing View:**
- Lists all generated picking lists
- Shows assigned picker, item count, and completion status
- Filter by picker, date, or status

**Details View:**
- Item-by-item picking instructions
- Container/location for each item
- Quantity to pick
- Checkbox or scan confirmation for each line

#### Packing List

Verification step after picking, ensuring items are correctly packed for shipment.

**Listing View:**
- Lists all packing lists linked to completed picking lists
- Shows order details, item verification status
- Filter by date, order, or status

**Details View:**
- Item-level packing verification
- Package assignment (which items go in which package)
- Weight and dimension recording
- Shipping label generation support

---

### Containers

Master data management for storage containers used across all warehouses.

**Listing View:**
- Lists all registered containers
- Shows container name, type, warehouse assignment, and capacity
- Search and filter by name, type, or warehouse

**Create / Edit View:**
- **Container Name** — Unique identifier
- **Container Type** — Shelf, Bin, Rack, Pallet, etc.
- **Warehouse** — Assigned warehouse
- **Capacity** — Maximum storage capacity
- **Dimensions** — Physical dimensions (L × W × H)
- **Status** — Active / Inactive / Maintenance

---

### Pickers

Manage warehouse picker profiles and assignments.

**Listing View:**
- Lists all registered pickers
- Shows picker name, assigned warehouse, current task, and status
- Search by name or warehouse

**Create / Edit View:**
- **Picker Name** — Staff name or identifier
- **Assigned Warehouse** — Primary warehouse assignment
- **Skills / Certifications** — Forklift license, hazmat handling, etc.
- **Status** — Active / Inactive / On Leave
- **Current Assignment** — Active picking or putaway task

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
- Enable/disable specific features

### Default Selection (Settings → Default Selection)

Pre-set default values that auto-populate when creating new records.

**Available Defaults:**
- Default Warehouse
- Default Receiving Document Type
- Default Container Type
- Default Picker Assignment

### WMS Item Maintenance (Settings → WMS Item Maintenance)

Manage item-level configurations specific to warehouse operations.

**Key Features:**
- Configure storage requirements per item (temperature, hazmat, fragile)
- Set minimum/maximum stock levels per item per warehouse
- Define default putaway locations
- Map items to WMS categories

### WMS Item Category (Settings → WMS Item Category)

Create and manage item categories for warehouse classification.

**Key Features:**
- Define category hierarchies (e.g., Electronics → Laptops → Chargers)
- Assign storage rules per category
- Group items for batch processing
- Category-based reporting

### WMS Item Category Group (Settings → WMS Item Category Group)

Group multiple WMS Item Categories for higher-level organization.

**Key Features:**
- Create category groups (e.g., Fast-Moving, Slow-Moving, Hazardous)
- Assign multiple categories to a group
- Group-level reporting and analytics
- Storage zone assignment by group

---

## Personalization

Access Personalization from the profile icon at the bottom of the sidebar.

### Default Selection (Personalization → Default Selection)

Set your personal default values that auto-populate when **you** create records. These override company-level defaults for your account only.

**Available Personal Defaults:**
- Your preferred default warehouse
- Your preferred default views and filters

---

## Integration Points

### Related Applets

| Applet | Integration | Data Flow |
|--------|-------------|-----------|
| **[Purchase GRN Applet](/applets/purchase-grn-applet/)** | Source documents for inbound receiving | GRN → Receiving Doc |
| **[Stock Transfer Applet](/applets/stock-transfer-applet/)** | Inter-branch transfers trigger inbound/outbound | Transfer → Receiving/Picking |
| **[Sales Delivery Order Applet](/applets/sales-delivery-order-applet/)** | Sales orders trigger outbound picking | DO → Picking Queue |
| **[Inventory Item Maintenance Applet](/applets/inventory-item-maintenance-applet/)** | Item master data syncs with WMS items | Item → WMS Item Maintenance |
| **[Stock Report Applet](/applets/stock-report-applet/)** | WMS movements reflect in stock reports | WMS → Stock Balance |

### Module Integration

| Module | Purpose | Data Flow |
|--------|---------|-----------|
| **Purchasing** | Inbound goods from purchase orders | PO → GRN → WMS Inbound |
| **Sales** | Outbound goods for customer orders | SO → DO → WMS Outbound |
| **Inventory** | Stock balance and movement tracking | WMS → Stock Ledger |
| **Logistics** | Delivery scheduling and dispatch | WMS Packing → Delivery |

---

## Troubleshooting

### Common Issues

#### Items Not Appearing in Processing Queue
**Problem**: Received items are not showing in the Processing Queue after submitting a Receiving Document.
**Symptoms**: Processing Queue is empty despite completing a receiving document.
**Solution**:
1. Verify the Receiving Document status is **Completed** (not Draft)
2. Check that the Receiving Lines have quantities entered
3. Ensure the destination warehouse matches your current warehouse filter
**Prevention**: Always verify Receiving Document status transitions from Draft → Completed.

#### Putaway List Not Generating
**Problem**: Items in the Processing Queue are not generating Putaway Lists.
**Symptoms**: Processing Queue shows items but no Putaway Lists are created.
**Solution**:
1. Check that containers with available space exist in the target warehouse
2. Verify WMS Item Maintenance has default putaway locations configured
3. Ensure pickers are registered and active
**Prevention**: Set up containers and default putaway rules before beginning operations.

#### Picking List Shows Wrong Quantities
**Problem**: Generated Picking Lists show incorrect quantities.
**Symptoms**: Pick quantities don't match the original order.
**Solution**:
1. Check the source Sales Delivery Order for the correct quantities
2. Verify stock availability in the source container/location
3. Review any partial picks that may have already been processed
**Prevention**: Always verify stock availability before generating picking lists.

#### Scanner Not Connecting in Scan Session
**Problem**: Barcode/QR scanner is not responding during a Scan Session.
**Symptoms**: Scanned items are not being recognized by the system.
**Solution**:
1. Ensure the scanner is paired/connected to the device
2. Check that the item barcodes match the format configured in WMS Item Maintenance
3. Try creating a new Scan Session if the current session is corrupted
**Prevention**: Test scanner connectivity before starting a scan session.

---

## Best Practices

### Operational Best Practices
- **Receive before putaway** — Always complete receiving verification before moving items to storage
- **Use scan sessions** — Barcode scanning reduces errors by up to 80% compared to manual entry
- **Assign pickers by zone** — Assign pickers to specific warehouse zones for faster operations
- **Batch process orders** — Use the Picking Queue to consolidate multiple orders for efficient picking

### Configuration Best Practices
- **Default putaway rules** — Configure WMS Item Maintenance with default storage locations per item
- **Container naming convention** — Use consistent naming (e.g., `WH01-RACK-A01-BIN-03`) for easy identification
- **Category groups** — Group items by movement speed (Fast/Slow) for optimal storage allocation

### Security Best Practices
- **Access control** — Restrict Settings access to Owners and Admins only
- **Audit trail** — Review processing queues regularly for stuck items
- **Regular reconciliation** — Perform periodic stock counts against WMS container allocations

---

## Related Documentation Links

### Related Applets
- **[Stock Transfer Applet](/applets/stock-transfer-applet/)** — Inter-branch and inter-warehouse transfers
- **[Stock Adjustment Applet](/applets/stock-adjustment-applet/)** — Manual stock corrections and write-offs
- **[Stock Report Applet](/applets/stock-report-applet/)** — Inventory reporting and analytics
- **[Purchase GRN Applet](/applets/purchase-grn-applet/)** — Goods received notes for purchase orders
- **[Sales Delivery Order Applet](/applets/sales-delivery-order-applet/)** — Delivery order management

### Core Documentation
- **[BigLedger User Guide](/user-guide/)** — Overall system documentation
- **[Inventory Module](/modules/inventory/)** — Inventory module overview
- **[Guides](/guides/)** — Getting started and implementation guides

{{< callout type="info" >}}
**Need Help?** For additional support with this applet, contact your system administrator or refer to the [Guides](/guides/) section for implementation assistance.
{{< /callout >}}
