---
title: "Inventory Module"
description: "Real-time inventory control engine managing multi-warehouse stock balances, lot/batch tracking, stock transfers, and valuation."
weight: 30
---

The **Inventory Module** is BigLedger's centralized stock control engine. It tracks real-time inventory balances, warehouse bin locations, batch/serial lot numbers, stock transfers, physical stock takes, and cost valuations integrated directly with Purchasing, Sales & POS, and Financial Accounting.

## Architecture & Data Flow

Inventory acts as the physical fulfillment nexus between supply chain procurement and commercial sales. Every stock receipt (GRN) or stock-out (Sales Dispatch / POS Sale) updates inventory balances and posts financial asset valuations in real-time.

| Architecture Layer | System Component | Primary Role in Inventory Operations |
|-------------------|------------------|--------------------------------------|
| **Inventory Engine** | Stock Balance & Valuation Engine | Central tracking of warehouse stock balances, batch/serial allocations, and perpetual cost valuation. |
| **Inbound Movements** | Purchasing & Production Stock-In | Receiving supplier goods via Goods Received Notes (GRN) or finished production assembly stock-in. |
| **Internal Controls** | Warehouse Control Applets | Inter-branch stock transfers, cycle counts, physical stock takes, and write-off adjustments. |
| **Outbound Movements** | Sales & POS Fulfillment | Releasing inventory for B2B commercial delivery orders or retail POS counter checkouts. |
| **Financial Accounting** | General Ledger Valuation | Real-time posting of Inventory Asset GL balances, Cost of Goods Sold (COGS), and variance accounts. |

---

## Who Uses This Module

| Role | Primary Responsibilities | Core Applets Used |
|------|--------------------------|-------------------|
| **Warehouse Manager** | Manage warehouse bin locations, authorize inter-branch stock transfers, oversee physical stock counts | [Warehouse Management Applet](/applets/inventory-workflow/warehouse-management-applet/), [Stock Transfer Applet](/applets/inventory-workflow/stock-transfer-applet/) |
| **Store Inventory Clerk** | Perform daily cycle counts, verify receiving quantities, log damaged stock write-offs | [Stock Take Applet](/applets/inventory-workflow/stock-take-applet/), [Stock Adjustment Applet](/applets/inventory-workflow/stock-adjustment-applet/) |
| **Stock Controller** | Monitor real-time item availability, maintain reorder thresholds, track batch/expiry dates | [Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/) |
| **Cost Accountant** | Reconcile physical inventory asset values with General Ledger balances, audit COGS allocations | [Stock Report Applet](/applets/inventory-workflow/stock-report-applet/) |

---

## Four Inventory Transactions Every Team Must Differentiate

Confusing inventory transaction types leads to stock discrepancies and balance sheet audit failures:

| Inventory Transaction | When it is used | Stock Impact | Accounting Impact |
|----------------------|-----------------|--------------|-------------------|
| **Stock Transfer** | Moving physical stock between internal warehouses or retail stores | Net Zero Overall (Decreases Source Location, Increases Target Location) | None (unless cross-company intercompany transfer) |
| **Stock Adjustment** | Correcting quantity discrepancies, damaged goods, or write-offs | Increases or Decreases stock quantity | Debits/Credits Inventory Asset GL & Expense Variance GL |
| **Stock Take (Physical Audit)** | Auditing physical warehouse inventory against system records | Adjusts system balance to match physical count | Debits/Credits Inventory Shrinkage/Variance GL |
| **Stock Conversion (Assembly)** | Bundling multiple component SKUs into a finished kit or assembly | Decreases component stock, Increases finished kit stock | Reallocates component asset costs to finished kit asset |

---

## Applet Map

| Applet | What it does in this module |
|--------|-----------------------------|
| [Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/) | Real-time warehouse inventory inquiry, quantity-on-hand tracking, and batch/serial lookup |
| [Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/) | Multi-warehouse stock availability check, reserved stock breakdown, and reorder alerts |
| [Stock Transfer Applet](/applets/inventory-workflow/stock-transfer-applet/) | Inter-branch stock transfers, transit tracking, and receiving store confirmations |
| [Stock Adjustment Applet](/applets/inventory-workflow/stock-adjustment-applet/) | Manual quantity and cost corrections, stock write-offs, and damage logging |
| [Stock Take Applet](/applets/inventory-workflow/stock-take-applet/) | Physical inventory cycle counting, stock audit sheets, and variance posting |
| [Stock Conversion Applet](/applets/inventory-workflow/stock-conversion-applet/) | Kitting, item bundling, assembly disassembly, and component stock conversions |
| [Warehouse Management Applet](/applets/inventory-workflow/warehouse-management-applet/) | Warehouse structure definition, bin locations, aisle mapping, and stock location rules |

---

## ERP Dependency Table

| Connected Module | What Inventory needs from it |
|------------------|------------------------------|
| **Core** | Item master SKUs, units of measure (UOM), organization branch locations |
| **Purchasing** | Inbound Goods Received Notes (GRN) to trigger automated stock-in |
| **Sales & POS** | Outbound Delivery Orders and POS counter sales to trigger automated stock-out |
| **Financial Accounting** | Inventory Asset GL accounts, COGS expense accounts, inventory shrinkage GLs |

---

## Go-Live Checklist

- [x] Item master SKUs, categories, and units of measure (UOM) configured in Core
- [ ] Warehouse locations and storage bins defined in Warehouse Management Applet
- [ ] Perpetual inventory valuation methods (FIFO, Moving Average) established
- [ ] Initial opening stock balances uploaded and reconciled with GL asset accounts
- [ ] Inter-branch stock transfer permissions and locations configured and tested (stock transfers have no approval workflow)
- [ ] Barcode scanning hardware verified for physical stock takes
- [ ] Finance team aligned on month-end inventory valuation reconciliation

---

## Module Learning Roadmap

Follow the documentation in this sequence to master the Inventory Module:

1. **[Core Concepts](core-concepts/)** *(Next Step)* — Understand perpetual inventory valuation, stock allocation mechanics, and batch lot tracking.
2. **[Configuration](configuration/)** — Step-by-step setup guides for warehouse structures, stock movement controls, and GL mapping.
3. **[Use Cases](use-cases/)**
4. **[Reports 3. **[Use Cases](use-cases/)** Analytics](reports/)** — Scenario guide for choosing the best inventory valuation and stock reports. — Real-world reference architectures for multi-warehouse distribution, batch/serial tracking, and kitting assembly.
4. **[API Reference](api-reference/)** — Direct reference link to official developer inventory APIs.
5. **[Related Applets](related-applets/)** — Complete guide to native applet dependencies across the BigLedger ecosystem.

---

{{< callout type="info" >}}
**Ready to explore inventory architecture?**  
Proceed to **[Core Concepts →](core-concepts/)** to understand stock movement lifecycles and valuation models.
{{< /callout >}}
