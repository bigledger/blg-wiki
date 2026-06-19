---
title: "Inventory & Warehouse Module"
description: "Real-time stock tracking, multi-location warehouse management, stock transfers, and replenishment controls."
weight: 40
---

## 1. Module Overview

The **Inventory & Warehouse Module** gives you complete control over physical stock — from basic stock tracking to complex multi-zone warehouse logistics and distribution. It supports real-time balance tracking, bin-level slotting optimization, pick-path routing, automated replenishment rules, and advanced stock costing methods (FIFO, LIFO, Weighted Average, Standard Cost) with landed cost allocations.

**Business Value:**
- **Prevent Stockouts & Overstocking**: Real-time multi-location stock visibility and automated reorder points (EOQ, safety stock).
- **Optimize Warehouse Space**: Bin-specific slotting algorithms, put-away rules, and picking wave planning reduce foot travel and storage costs.
- **Precision Order Fulfillment**: Multi-modal picking strategies (piece, case, batch, zone, or voice/RF) ensure shipping accuracy.
- **Accurate Stock Valuation**: Double-entry inventory tracking dynamically updates asset values, including freight, duties, and landed cost allocations.
- **Traceability & Compliance**: Strict serial number, batch/lot tracking, and shelf-life expiration date (SLED) controls support recall procedures.

### Core Capabilities

- **Warehouse Management (WMS)**: Zone management, Slotting optimization, directed put-away, and pick path planning.
- **Stock Movement Audits**: Complete transaction logs for stock adjustments, inter-location/inter-company transfers, and stock conversions.
- **Advanced Fulfillment**: Wave planning, batch picking, cross-docking (bypassing storage for direct delivery), kitting, and custom packaging.
- **Multi-Client 3PL Support**: Client-segregated inventories, service level agreement (SLA) monitors, and client-specific billing reports.

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Stock Balance** | The current quantity of an item at a specific location, warehouse, or bin. |
| **Stock Transfer** | The movement of inventory between locations (warehouse-to-warehouse or bin-to-bin). |
| **Stock Take** | A physical inventory count compared against system records to identify and reconcile variances. |
| **Stock Conversion** | Transforming raw materials into finished components or bundling items into kits (Kitting/Assembly). |
| **Stock Reservation** | Earmarking specific stock quantities for confirmed sales orders, projects, or production tasks. |
| **Slotting Optimization** | The strategic placement of products within warehouse zones based on demand, velocity, and size. |
| **Wave Planning** | Grouping multiple customer orders into a single picking wave to optimize picking path efficiency. |
| **Landed Cost** | The total cost of an imported product including purchase price, freight, customs, duties, and transport. |
| **Cross-Docking** | Unloading incoming materials from a supplier and routing them directly to outgoing shipping docks. |
| **FIFO / LIFO** | Costing methods where oldest (FIFO) or newest (LIFO) inventory layers are cleared first. |

---

## 3. Included Applets

### Stock Tracking & Visibility

| Applet | Purpose |
|--------|---------|
| [Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/) | View real-time stock levels across all locations, warehouses, and bins. |
| [Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/) | Check available-to-promise quantities considering reservations and pending orders. |
| [Stock Report Applet](/applets/inventory-workflow/stock-report-applet/) | Generate detailed stock movement, valuation (FIFO/Weighted Avg), and aging reports. |

### Stock Operations & Replenishment

| Applet | Purpose |
|--------|---------|
| [Stock Transfer Applet](/applets/inventory-workflow/stock-transfer-applet/) | Manage stock movements between warehouses, locations, or bins. |
| [Stock Adjustment Applet](/applets/inventory-workflow/stock-adjustment-applet/) | Process manual corrections to stock quantities with reason codes and supervisor approvals. |
| [Internal Stock Adjustment Applet](/applets/inventory-workflow/internal-stock-adjustment-applet/) | Internal variant of stock adjustments for department-level corrections. |
| [Stock Conversion Applet](/applets/inventory-workflow/stock-conversion-applet/) | Assemble kits, build bundle products, or process raw material disassembly. |
| [Stock Reservation Applet](/applets/inventory-workflow/stock-reservation-applet/) | Precision inventory allocation to secure items for VIP clients or urgent orders. |
| [Stock Take Applet](/applets/inventory-workflow/stock-take-applet/) | Conduct physical inventory counts, log cycle counts, and approve variance adjustments. |
| [Stock Replenishment Applet](/applets/stock-replenishment/stock-replenishment-applet/) | Automated restocking generator based on safety stock levels and lead times. |

### Warehouse & Logistics Management

| Applet | Purpose |
|--------|---------|
| [Warehouse Management Applet](/applets/inventory-workflow/warehouse-management-applet/) | Full WMS configuration: zone routing, bin location mapping, and pick path optimization. |
| [Internal Inbound Delivery Order Applet](/applets/inventory-workflow/internal-inbound-delivery-order-applet/) | Manage inbound deliveries from suppliers or inter-branch transfers. |
| [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) | Assign and track driver deliveries with route optimization and mobile proof-of-delivery (POD). |
| [Internal Consignment GIN Applet](/applets/inventory-workflow/internal-consignment-gin-applet/) | Track inventory placed at partner or customer sites before final invoicing. |
| [Non-Stock & Trade-In Applet](/applets/inventory-workflow/non-stock-and-trade-in-applet/) | Process non-inventoried services or customer trade-in credit adjustments. |
| [Inventory Item Maintenance Applet](/applets/inventory-workflow/inv-item-maintenance-applet/) | Define barcode SKUs, assign units of measure (UOM), and link items to default bins. |

---

## 4. Standard Business Workflows

### Workflow 1: Inbound Receiving & Directed Put-Away

```
Supplier Delivery ──▶ Inbound DO ──▶ Quality Inspection ──▶ Slotting Rules Applied ──▶ Put-Away to Bin
```

**Steps:**
1. Supplier delivery arrives at the dock; staff verify items against the **Inbound DO**.
2. Items undergo quality checks (statistical sampling/damage review).
3. System applies slotting rules based on product weight and sales velocity.
4. Staff put away goods into the system-directed bin location (e.g., Aisle 2, Bin C-4) and scan the bin code.
5. Central inventory levels update immediately.

### Workflow 2: Wave Planning & Optimized Picking

```
Release Orders ──▶ Wave Planning ──▶ Pick Path Optimization ──▶ Batch Picking ──▶ Pack & Ship
```

**Steps:**
1. A batch of customer sales orders is released for fulfillment.
2. Store manager opens **Warehouse Management Applet** to run a wave planning cycle, grouping orders.
3. System outputs optimized pick sheets sorting items by warehouse aisle sequences.
4. Pickers gather multiple orders simultaneously (batch picking) to minimize travel time.
5. Items are brought to sorting stations, verified, packed, and loaded for shipping.

### Workflow 3: Cross-Docking Operations

```
Supplier Arrival ──▶ Dock Scheduling ──▶ Match Outbound SO ──▶ Staging ──▶ Outbound Dispatch
```

**Steps:**
1. Sourcing team arranges an inbound shipment for backordered customer items.
2. Upon dock arrival, system maps the inbound items to pending outbound **Sales Orders**.
3. Items bypass storage aisles and route directly to outbound staging zones.
4. Warehouse staff pack items directly into customer delivery vehicles.
5. System logs the receipt and shipping dispatch simultaneously.

### Workflow 4: Cycle Counting & Balance Verification

```
Trigger Count Sheet ──▶ Physical Count ──▶ Variance Verification ──▶ Post Adjustment ──▶ Ledger Match
```

**Steps:**
1. **Stock Take Applet** triggers a cyclical count sheet for high-value A-class items.
2. Staff check bin locations, scan barcodes, and input physical counts.
3. System flags any variance exceptions between physical counts and system balances.
4. Supervisor investigates discrepancies and approves the variance.
5. **Stock Adjustment** is created and posted, adjusting the balance sheet inventory accounts.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **Warehouse Operator** | Stock Balance, Stock Transfer, Inbound DO, WMS | Execute pick paths, record inbound receiving, scan items to bins, log transfer orders |
| **Warehouse Supervisor** | Warehouse Management, Stock Take, Stock Adjustment | Define slotting layouts, create wave plans, review variance reports, approve stock adjustments |
| **Inventory Controller** | Stock Report, Availability, Stock Replenishment | Define safety stock margins, compile turnover rate analyses, run obsolescence reviews |
| **Logistics Coordinator** | Driver Delivery Order | Group delivery runs, assign delivery routes, verify customer signatures/PODs |
| **Finance Manager** | Stock Report | Audit costing layers (FIFO matches), check landed cost allocations, review stock value balances |

---

## 6. Prerequisites / Initial Setup

Before going live with the Inventory & Warehouse Module, ensure:

- [x] **Core Module** — Organisation profile, branch networks, and default warehouses exist
- [ ] **Chart of Accounts** — Mapped accounts for inventory assets, cost of goods sold, and variance adjustments
- [ ] Mapped warehouse layouts (aisle, shelf, and bin numbering scheme)
- [ ] Mapped units of measure (UOM) conversion factors (e.g., Box of 12 to Pieces)
- [ ] Mapped tax configuration codes matching import/landed cost rules
- [ ] User profiles created for warehouse operators with mobile/RF scanner rights

### Implementation Phasing

- **Phase 1: Warehouse Foundation**: Establish location hierarchies (bins), design slotting/put-away rules, and map supplier catalogs.
- **Phase 2: Operational Workflows**: Roll out inbound receiving, cycle counting matrices, picking paths, and POS/Sales reservation syncs.
- **Phase 3: Optimization & Costing**: Setup landed cost allocations, blanket release workflows, safety stock algorithms, and 3PL multi-client configurations.

---

## 7. FAQs & Troubleshooting

**Q: Stock Balance shows a negative quantity for an item. How is this possible?**
A: Negative stock occurs if the system allows transaction posting without checking physical stock availability. Check the **Stock Report** for the transaction history and run a corrective **Stock Take** or **Stock Adjustment**.

**Q: A stock transfer was created but the destination hasn't received the quantity yet.**
A: Inter-warehouse stock transfers require a two-step confirmation process. The originating site deducts stock (status: "In Transit"), and the receiving site must confirm physical receipt via the **Stock Transfer Applet** to close the ticket.

**Q: How do we allocate landed costs (freight/duty) to inventory?**
A: Use the **Landed Cost Allocation** panel inside the **Stock Balance Applet** or **Purchase GRN Applet**. Select the inbound GRN shipment, enter the freight invoice amount, and choose to allocate cost by weight, value, or quantity across the line items.

### Troubleshooting Common Issues

- **Pick Path Inefficiencies**: Verify location master coordinates in the WMS. If aisle sequences are wrong, the pick sheet will direct pickers to double-back. Re-run slotting optimization to relocate fast-moving items.
- **Wave Planning Delays**: Check queue bottlenecks. Ensure sufficient labor resources are assigned to the wave. If orders contain missing stock items, pause the wave and re-allocate stock via the **Stock Reservation Applet**.
- **Sync Integration Failures**: If sales orders from E-Commerce fail to reserve inventory, verify API webhook connection statuses. Run the reconciliation reports in **Stock Availability** to highlight failed allocations.
