---
title: "Goods Dispatch Note (Internal) Applet"
description: "Standardized warehouse management system for recording and tracking the physical dispatch of goods including logistics and vehicle details"
tags:
- inventory-workflow
- goods-dispatch
- warehouse-logistics
- outbound-tracking
- gate-pass-management
weight: 60
---

{{< callout type="warning" >}}
**Internal Goods Dispatch Note Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Internal Goods Dispatch Note (GDN) Applet** is a critical component of the warehouse outbound process. It provides a formal system for recording the exact moment goods physically leave a warehouse location. By capturing essential logistics information—such as transport providers, vehicle numbers, and itemized lists—the applet ensures a complete and auditable record of every dispatch event.

{{< callout type="info" >}}
**Core Concept**: A **Goods Dispatch Note** serves as the "Gate Pass" for inventory, bridging the gap between internal order processing and external transport fulfillment.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Warehouse Supervisors & Dispatch Officers:**
- Formalized procedure for gate clearance and vehicle loading
- Centralized tracking of every vehicle that enters and exits the facility
- Real-time confirmation of quantities dispatched versus orders received
- Reduction in loading errors through itemized verification

**Logistics Coordinators:**
- Precise visibility into the performance of different transport partners
- Consolidated records of vehicle numbers for tracking and security
- Better coordination between warehouse availability and carrier arrivals
- Fast retrieval of dispatch details for shipment status inquiries

**Inventory Controllers & Auditors:**
- Accurate timestamps for physical stock reductions and departures
- Immutable record of transport providers for shipping dispute resolution
- Complete audit trails of all outbound inventory movements
- Elimination of undocumented "leakage" through standardized gate controls

### What Problems Does This Solve?

**The "Undocumented Departure" Problem:**

Often, goods leave the warehouse without a formal logistics record, leading to significant visibility gaps:
- Lack of accountability for which courier or vehicle took specific stock
- Difficulty in proving that an item actually left the facility during shipping disputes
- Incomplete records of transport company performance and carrier reliability
- Manual gate logs that are easily lost, illegible, or unsearchable
- Discrepancies between system fulfillment and actual physical dispatch

**The Goods Dispatch Note Solution:**

- **Formalized Logistics Documentation** - Capture vehicle, driver, and carrier details for every outbound note
- **Itemized Verification Engine** - Ensure the exact items and quantities are recorded at the point of departure
- **Searchable Dispatch Repository** - A central, filterable listing of all past dispatch events for quick reference
- **Integrated Audit Logic** - Every GDN is a permanent system record tied to a specific warehouse and user
- **Mobile-Ready Gate Access** - (Where deployed) Allows gate staff to verify and record dispatches in real-time

## Key Features Overview

{{< cards >}}
  {{< card title="Dispatch Entry" subtitle="Formally record the outbound movement of goods" link="#creating-dispatch-notes" >}}

  {{< card title="Logistics Tracking" subtitle="Log vehicle numbers and courier partners for every note" link="#logistics-configuration" >}}

  {{< card title="Itemized Listing" subtitle="Detailed view of all products and quantities dispatched" link="#item-verification" >}}

  {{< card title="Dispatch Archive" subtitle="Centralized history of all past outbound shipments" link="#viewing-all-notes" >}}

  {{< card title="Stock Accuracy" subtitle="Maintain precise timestamps for inventory departures" link="#inventory-integrity" >}}

  {{< card title="Audit & Search" subtitle="Instantly find notes by vehicle, date, or customer" link="#search-and-audit" >}}
{{< /cards >}}

## Key Concepts

### Understanding the Dispatch Framework

To maintain logistics integrity, the system organizes every dispatch according to three core pillars:

| Pillar | Component | Practical Example |
|--------|-----------|------------------|
| **Entity** | Destination & Consignee | Branch A, Global Customer Inc., Retail Hub 1 |
| **Logistics** | Transport & Vehicle Info | Lalamove, Truck No. ABC-123, FedEx |
| **Asset** | Itemized Content | 5x SKU-001, 20x SKU-005 |

{{< callout type="tip" >}}
**Real-World Example**: A dispatch officer prepares a shipment for an inter-branch transfer. They select the destination, enter the transport provider (In-house truck) and the vehicle number (BL-456). They verify the quantity of items being loaded and finalize the note. The system now has a permanent record of EXACTLY which truck took the goods and when.
{{< /callout >}}

### The Dispatch Workflow

The GDN acts as the final physical step in the outbound logistics chain:

```
Order Fulfillment
│
├── Sales/Delivery Order ──→ The document requiring fulfillment
│   │
│   └── Goods Dispatch Note ──→ The physical record of departure
│       │
│       └── External Tracking ──→ Carrier-side delivery monitoring
```

---

## Quick Start Guide

### For Dispatch Staff: Creating Your First GDN

**Goal:** Record a physical shipment in 5 steps.

1. **Navigate**: Go to **Internal Goods Dispatch Note** and click **"+"**.
2. **Select Destination**: Choose the Branch or Customer receiving the goods.
3. **Log Logistics**: Enter the **Vehicle Number** and choose the **Transport Provider/Courier**.
4. **Item Verification**: 
   - Go to the **Line Items** tab.
   - select and add the items being physically loaded.
   - Double-check quantities against the physical load.
5. **Finalize**: Click **Create/Final**. The record is now permanently logged.

---

### For Coordinators: Reviewing Dispatch History

**Goal:** Track carrier performance and investigate shipment status.

1. **Review Notes**: Open the **Dispatch Listing** to see a history of all notes.
2. **Filter by Vehicle**: Use the filters to find all dispatches associated with a specific truck number or carrier.
3. **Verify Times**: Double-check the creation timestamps against warehouse gate logs for accuracy.
4. **Export Reports**: Generate a daily export for logistics reconciliation to verify carrier billing.

---

## Configuration & Settings

Fine-tune the dispatch environment through the **Settings** section:

- **Transport Providers**: Maintain the list of preferred courier and logistics partners.
- **Branch Configurations**: Set up destination branches for internal transfers.
- **Custom Parameters**: (Where applicable) Add fields for driver names or container IDs.
- **Listing Personalization**: Define which columns are visible (e.g., "Vehicle Number", "Courier") to optimize the daily listing view.

---

## FAQ

**Q: Can I edit a Goods Dispatch Note after it has been finalized?**
A: Typically, GDNs are immutable after finalization for security and audit purposes. If a mistake was made, a reversal or a new note may be required depending on your organization’s policy.

**Q: Does creating a GDN automatically reduce my inventory?**
A: This depends on your system configuration. In many setups, the GDN acts as the formal record of stock departure, which corresponds with the physical stock reduction.

**Q: Can I print a copy of the GDN for the driver?**
A: Yes. The system supports printing a PDF copy of the Goods Dispatch Note, which can serve as a gate-pass or proof-of-dispatch for the driver.

**Q: Is there a way to link a GDN to an existing Sales Order?**
A: Yes, you can use the searching and referencing capabilities in the applet to link the dispatch note to original source documents like Sales Tours or Delivery Orders.

---
