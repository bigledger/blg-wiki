---
title: "Manufacturing Module"
description: "Production execution engine managing Work-in-Progress (WIP), Bill of Materials (BOM), shop floor routings, and finished goods costing."
weight: 50
---

The **Manufacturing Module** is BigLedger's shop floor execution and cost absorption engine. It manages multi-level Bills of Materials (BOM), production scheduling, work center routing, raw material issuance, Work-in-Progress (WIP) tracking, and finished goods inventory stock-ins integrated with Inventory and Financial Accounting.

## Architecture & Data Flow

Manufacturing bridges operational production schedules with financial cost accounting. Raw materials issued to production exit inventory asset ledgers and enter Work-in-Progress (WIP). Upon production order completion, direct labor and machine overhead absorb into final finished goods asset valuations.

| Architecture Layer | System Component | Primary Role in Production Operations |
|-------------------|------------------|---------------------------------------|
| **Execution Engine** | [Production Planning and Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/) | Central production scheduling, master work order release, and batch tracking. |
| **Process Routing** | [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) | Defining work centers, machine operations, labor rates, and routing sequences. |
| **Shop Floor Operations** | [Manufacturing Operation Applet](/applets/manufacturing/manufacturing-operation-applet/) | Real-time work center execution, material issuance logging, and quality inspection. |
| **Packing & Storage** | [Internal Packing Order Applet](/applets/manufacturing/internal-packing-order-applet/) | Finished goods secondary packaging, batch labeling, and warehouse stock-in. |

---

## Who Uses This Module

| Role | Primary Responsibilities | Core Applets Used |
|------|--------------------------|-------------------|
| **Production Planner** | Schedule work orders, analyze material requirements (MRP), monitor batch completion deadlines | [Production Planning and Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/) |
| **Process Engineer** | Configure multi-level Bill of Materials (BOM), setup work centers, establish machine cycle times | [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) |
| **Shop Floor Supervisor** | Log raw material issues to WIP, track machine downtime, record completed stage output | [Manufacturing Operation Applet](/applets/manufacturing/manufacturing-operation-applet/) |
| **Packaging Coordinator** | Generate internal packing orders, assign finished goods batch numbers, execute stock-in | [Internal Packing Order Applet](/applets/manufacturing/internal-packing-order-applet/) |

---

## Four Production Milestone Concepts Every Team Must Differentiate

Confusing manufacturing milestones creates inventory valuation inaccuracies and absorption variance errors:

| Production Concept | Business Purpose | Inventory Impact | Financial Accounting Impact |
|-------------------|------------------|------------------|-----------------------------|
| **Bill of Materials (BOM)** | Master recipe defining exact component quantities for 1 finished unit | None | Standard Cost Baseline established |
| **Material Issue to WIP** | Releasing raw materials from warehouse to the factory floor | Raw Material Inventory Decreases | Work-in-Progress (WIP) Asset Increases |
| **Overhead Absorption** | Adding direct machine and labor operating costs to active work orders | None | Direct Labor & Overhead Applied to WIP Asset |
| **Finished Goods Receipt** | Completing production and transferring finished units to warehouse | Finished Goods Inventory Increases | WIP Asset Cleared, Finished Goods Asset Debited |

---

## Applet Map

| Applet | What it does in this module |
|--------|-----------------------------|
| [Production Planning and Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/) | Master production scheduling, MRP material availability tracking, and work order release |
| [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) | Work center definitions, machine operations setup, labor rate matrices, and routing workflows |
| [Manufacturing Operation Applet](/applets/manufacturing/manufacturing-operation-applet/) | Shop floor execution tracking, raw material issue logging, scrap reporting, and output entry |
| [Internal Packing Order Applet](/applets/manufacturing/internal-packing-order-applet/) | Secondary packaging execution, finished product batch assignment, and warehouse stock-in |

---

## ERP Dependency Table

| Connected Module | What Manufacturing needs from it |
|------------------|----------------------------------|
| **Core** | Finished goods SKUs, raw material SKUs, units of measure (UOM), branch locations |
| **Inventory** | Raw material stock availability, warehouse bin locations, finished goods stock-in posting |
| **Purchasing** | Material Requirements Planning (MRP) triggers to purchase raw material shortages |
| **Financial Accounting** | WIP asset accounts, Direct Labor absorption GLs, Overhead variance accounts |

---

## Go-Live Checklist

- [x] Raw material and finished product master SKUs established in Core
- [ ] Multi-level Bills of Materials (BOM) configured and verified for all manufactured items
- [ ] Work centers, machine labor rates, and operational routings defined in Process Maintenance
- [ ] Work-in-Progress (WIP) GL asset accounts mapped in Financial Accounting
- [ ] Shop floor material issuance and finished goods receiving workflows verified
- [ ] Production cost absorption and variance analysis rules reconciled with Finance

---

## Module Learning Roadmap

Follow the documentation in this sequence to master the Manufacturing Module:

1. **[Core Concepts](core-concepts/)** *(Next Step)* — Understand BOM hierarchies, WIP cost absorption, and shop floor routings.
2. **[Configuration](configuration/)** — Step-by-step setup guides for work centers, process routings, and BOM recipes.
3. **[Use Cases](use-cases/)** — Real-world reference architectures for discrete manufacturing, process batching, and custom job shops.
4. **[API Reference](api-reference/)** — Direct reference link to official developer manufacturing APIs.
5. **[Best Practices](best-practices/)** — Operational recommendations for scrap reporting, machine utilization, and WIP variance audits.
6. **[Reports & Analytics](reports/)** — Scenario guide for choosing the best production yield and costing reports.
7. **[Related Applets](related-applets/)** — Complete guide to native applet dependencies across the BigLedger ecosystem.

---

{{< callout type="info" >}}
**Ready to explore production execution architecture?**  
Proceed to **[Core Concepts →](core-concepts/)** to understand work order lifecycles and cost absorption.
{{< /callout >}}
