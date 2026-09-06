---
aliases:
- /modules-v2/manufacturing/core-concepts/
title: "Core Concepts"
description: "Fundamental architectural concepts of BigLedger's Manufacturing Module — BOM structures, WIP absorption, and process routings."
weight: 20
bookCollapseSection: false
---

Understanding core manufacturing concepts is essential before building Bills of Materials (BOM) or releasing production work orders. These concepts explain **how raw materials transform into finished goods** and how shop floor operations absorb labor and machine overhead costs.

## The Production Order Lifecycle

Manufacturing execution follows a structured 5-step lifecycle. Each step represents a physical shop floor milestone and financial ledger re-allocation.

| Step | Milestone | Business Purpose | Applet Used |
|------|-----------|------------------|-------------|
| **1** | **BOM & Process Design** | Defining multi-level raw material recipes, work center operations, and machine cycle times | [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) |
| **2** | **Production Order Creation** | Scheduling master work orders, reserving raw material components, and issuing batch numbers | [Production Planning and Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/) |
| **3** | **Material Issue to WIP** | Releasing raw materials from warehouse to factory floor; transferring value to WIP asset | [Manufacturing Operation Applet](/applets/manufacturing/manufacturing-operation-applet/) |
| **4** | **Shop Floor Operations** | Executing work center operations, logging machine hours, direct labor, and packing secondary goods | [Manufacturing Operation Applet](/applets/manufacturing/manufacturing-operation-applet/) / [Internal Packing Order Applet](/applets/manufacturing/internal-packing-order-applet/) |
| **5** | **Finished Goods Receiving** | Transferring completed product units to warehouse; clearing WIP and posting finished inventory asset | [Internal Packing Order Applet](/applets/manufacturing/internal-packing-order-applet/) |

---

## Work-in-Progress (WIP) Cost Absorption Mechanics

BigLedger calculates the final standard or actual cost of manufactured inventory through real-time WIP absorption:

```
┌────────────────────────────────┐
│   Raw Material Component Cost  │
└───────────────┬────────────────┘
                │
                ├───> ┌────────────────────────────────┐     ┌────────────────────────────────┐
                │     │   Work-in-Progress (WIP) GL    │────>│ Finished Goods Inventory Asset │
                ├───> └────────────────────────────────┘     └────────────────────────────────┘
                │
┌───────────────┴────────────────┐
│ Direct Labor & Overhead Cost   │
└────────────────────────────────┘
```

- **Material Costs:** Added to WIP when raw materials are physically issued from warehouse to factory floor.
- **Conversion Costs:** Direct labor hours and machine operating overhead are absorbed into WIP as work centers record operational progress.
- **Finished Valuation:** Total accumulated WIP costs are transferred to the Finished Goods Asset account upon work order completion.

---

## What to Read Next

- **[Configuration](/modules/manufacturing/configuration/)** — Set up work centers, process routings, and Bill of Materials (BOM) recipes.
- **[Use Cases](/modules/manufacturing/use-cases/)** — Review reference architectures for discrete assembly, process batch manufacturing, and packing operations.
