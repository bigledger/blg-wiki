---
title: "Manufacturing Module"
description: "Production planning, shop floor execution, multi-level BOMs, MRP planning, and job order execution for discrete and process manufacturing."
weight: 55
---

## 1. Module Overview

The **Manufacturing Module** is a comprehensive manufacturing execution system (MES) managing the complete production lifecycle — from product engineering and recipes through master scheduling, MRP planning, shop floor execution, and quality control. Built around a three-stage framework (Configure → Plan → Execute), it bridges the gap between sales orders and physical factory floor operations.

**Business Value:**
- **Flexible Manufacturing Models**: Support Make-to-Order (MTO), Make-to-Stock (MTS), Configure-to-Order (CTO), and mixed-mode production in a single workspace.
- **Accurate Product Costing**: Capture real-time labor, raw material consumption, and machine overheads to calculate standard vs. actual cost variances.
- **Granular Inventory Traceability**: End-to-end bin-level material genealogy tracks ingredients or parts from supplier receipt through to the final finished product.
- **Supervisor Quality Gates**: Built-in quality inspection checkpoints and sign-offs prevent defective goods from moving to packaging or shipping.

### Core Capabilities

- **Production Planning & MRP**: Master Production Scheduling (MPS) and Material Requirements Planning (MRP) automate component procurement and workload scheduling.
- **Product Engineering (BOM & Routing)**: Build multi-level bills of materials (BOM), create alternate routings, manage BOM versions, and set up phantom assemblies.
- **Shop Floor Control**: Dispatch job queues to specific work centers, track machine operator run-times, log scrap rates, and manage equipment capacity.
- **Specialized Production Support**: Mapped processes for Discrete Manufacturing (machining, assembly) and Process Manufacturing (recipe batching, mixing, continuous flow).

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Job Order** | A formal manufacturing instruction specifying what to produce, raw material allocations, and due dates. |
| **BOM (Bill of Materials)** | The structured engineering list of components, raw materials, and sub-assemblies required to build a product. |
| **Routing** | The sequential list of operational steps (and work centers) required to manufacture an item. |
| **Work Center / Machine** | A specific physical area or piece of equipment where a production operation is executed. |
| **Material Requirement Planning (MRP)** | An automated logic calculating raw material orders and job start dates based on inventory levels and order demands. |
| **Process Template** | An individual manufacturing step defining inputs (materials consumed) and outputs (products created) with ratios. |
| **Work Log** | A shop floor record capturing operator run-times, material batches consumed, inspection measurements, and output counts. |
| **Overall Equipment Effectiveness (OEE)** | The core metric evaluating machine availability, performance efficiency, and output quality. |

---

## 3. Included Applets

### Product Engineering & Configuration

| Applet | Purpose |
|--------|---------|
| [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) | Define machines, operational routing steps, process templates (BOMs), and master job recipes. |
| [Inventory Item Maintenance Applet](/applets/inventory-workflow/inv-item-maintenance-applet/) | *(Shared)* Maintain standard unit costs, raw material packaging, and minimum replenishment levels. |

### Production Planning & Control

| Applet | Purpose |
|--------|---------|
| [Production Planning & Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/) | Core planner console to monitor incoming Sales Orders, trigger job orders, schedule work centers, and run MRP cycles. |

### Shop Floor & Quality Execution

| Applet | Purpose |
|--------|---------|
| [Manufacturing Operations Applet](/applets/manufacturing/manufacturing-operation-applet/) | Touch-friendly shop floor terminal for operators to view queues, clock into jobs, log raw material batches, and record outputs. |
| [Internal Stock Adjustment Applet](/applets/inventory-workflow/internal-stock-adjustment-applet/) | *(Shared)* Process scrap sheets, waste logs, and standard inventory balance corrections directly from the production line. |

---

## 4. Standard Business Workflows

### Workflow 1: Make-to-Order Production (MTO)

```
Sales Order ──▶ Production Request ──▶ Job Order ──▶ Shop Floor Execution ──▶ Quality Check ──▶ Stock In
```

**Steps:**
1. A confirmed B2B customer **Sales Order** triggers a **Production Request**.
2. Production planner reviews requests, combines quantities, and generates a **Job Order** referencing the Job Template.
3. System allocates raw materials from the default staging bins.
4. Job is dispatched; floor operators clock in, consume batch lot ingredients, and log output via the **Manufacturing Operations Applet**.
5. Supervisor verifies quality inspection data and signs off on the **Work Log**.
6. Finished goods are automatically stocked into the warehouse and mapped to the original Sales Order.

### Workflow 2: Bill of Materials (BOM) & Routing Engineering

```
Define Machine ──▶ Create Routing Steps ──▶ Map Inputs & Outputs ──▶ Roll up Costs ──▶ Approve Recipe
```

**Steps:**
1. Engineer defines work centers and machines in **Process Maintenance**.
2. Define the routing sequence (e.g., Step 10: Machining, Step 20: Polishing, Step 30: Quality Control).
3. Map material input requirements and product outputs in the **Process Template**.
4. System executes a cost roll-up calculating standard product cost based on BOM component costs and routing labor rates.
5. Save and version-lock the template as active.

### Workflow 3: Material Requirements Planning (MRP)

```
Analyze Sales Demand ──▶ Check Stock Levels ──▶ Run MRP Calculation ──▶ Auto-Generate Purchase Requisitions
```

**Steps:**
1. Planner runs the MRP engine to analyze active sales demand and forecast needs.
2. System subtracts available warehouse stock and transit receipts.
3. System applies safety stock rules and lead-time configurations to calculate net component shortages.
4. MRP generates recommended purchase requisitions for short items and schedules production runs for sub-assemblies.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **Production Engineer** | Process Maintenance | Maintain multi-level BOM templates, configure routing steps, manage recipe versions and costing roll-ups |
| **Production Planner** | Production Planning & Monitoring | Run MRP, create job schedules, dispatch work orders, coordinate raw material levels |
| **Production Supervisor** | Manufacturing Operations | Set work queues, verify operator log entries, approve scrap variances, manage quality gates |
| **Machine Operator** | Manufacturing Operations | View work assignments, record starting/stopping times, input material batch numbers, log finished output |
| **QC Inspector** | Manufacturing Operations | Perform in-process and final audits, log measurements, issue certificates of analysis (CoA) |

---

## 6. Prerequisites / Initial Setup

Before going live with the Manufacturing Module, ensure:

- [x] **Core Module** — Cost locations, branches, and employee tables exist
- [x] **Inventory Module** — Raw materials and finished goods warehouses are mapped with staging bins
- [ ] Production machines and capacity rates are registered in Process Maintenance
- [ ] Process sequence routings are verified by production engineers
- [ ] Material consumption ratios and output expectations are configured in Process Templates
- [ ] Manufacturing variance accounts and WIP ledger accounts are defined in Chart of Accounts

### Implementation Phasing

- **Phase 1: Engineering Setup**: Define work centers, routing codes, build multi-level BOMs, and set standard costs.
- **Phase 2: Operational Flow**: Launch Job Order dispatching, implement labor log tracking, and connect inventory issues/receipts.
- **Phase 3: Sourcing & Scheduling**: Connect Sales Order demand to MPS, deploy MRP automatic purchasing, and establish OEE tracking.

---

## 7. FAQs & Troubleshooting

**Q: A Job Order shows "Insufficient Material." Can I still proceed?**
A: Yes, the system permits job release, but operators will not be able to complete Work Logs if raw material bins are empty. Run MRP or coordinate with Purchasing to resolve component shortages.

**Q: How do we handle batch/lot expiration dates for raw ingredients?**
A: Ensure batch tracking is active on the inventory item. Operators must scan or select the specific active batch/lot number in the **Manufacturing Operations Applet**, which checks SLED data.

**Q: What is a "Phantom BOM"?**
A: A phantom BOM is a pass-through assembly. The system will not generate a separate job order or stock card for it; instead, its raw components are pulled directly into the higher-level parent job order.

### Troubleshooting Common Issues

- **Resource Scheduling Bottlenecks**: Check machine capacity factors. Re-sequence routing steps in the **Production Planning Applet** or re-allocate tasks to alternate machines.
- **Yield Variance Discrepancies**: If actual outputs are consistently lower than BOM expectations, review raw material quality metrics in the **Purchase Report Applet** or audit work center labor tracking.
- **Quality Rejection Loops**: If a process step fails quality gates, the supervisor must log a non-conformance ticket. Scrap materials via **Internal Stock Adjustment** and raise a corrective rework order.
