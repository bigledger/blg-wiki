---
title: "Core Concepts"
description: "Fundamental architectural concepts of BigLedger's Inventory Module — stock lifecycles, valuation methods, and lot tracking."
weight: 20
bookCollapseSection: false
---

Understanding core inventory concepts is essential before configuring warehouse locations or executing physical stock takes. These concepts explain **how inventory movements flow through the ERP** and how stock allocations interact with financial ledgers.

## The Stock Movement Lifecycle

Inventory operations follow a structured 5-step movement lifecycle. Each step represents a physical movement or stock balance modification.

| Step | Movement Stage | Business Purpose | Applet Used |
|------|----------------|------------------|-------------|
| **1** | **Stock Inbound** | Receiving supplier goods via GRN or production assembly stock-in | [Goods Received Note GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/) |
| **2** | **Warehouse Storage** | Bin location putaway, batch/lot tracking, and stock reservation | [Warehouse Management Applet](/applets/inventory-workflow/warehouse-management-applet/) |
| **3** | **Inter-Warehouse Transfer** | Moving stock between internal branches or retail stores | [Stock Transfer Applet](/applets/inventory-workflow/stock-transfer-applet/) |
| **4** | **Physical Audit & Adjustment** | Cycle counting, physical stock takes, and variance write-offs | [Stock Take Applet](/applets/inventory-workflow/stock-take-applet/) / [Stock Adjustment Applet](/applets/inventory-workflow/stock-adjustment-applet/) |
| **5** | **Stock Outbound** | Fulfilling commercial sales delivery orders or retail POS checkouts | [POS General Applet](/applets/sales-workflow/pos-general-applet/) / Delivery Orders |

---

## Perpetual Inventory Valuation Methods

BigLedger maintains perpetual real-time inventory valuation. Every stock movement updates your balance sheet asset value automatically using one of two supported costing methods:

1. **FIFO (First-In, First-Out):** Assumes the oldest inventory items are sold or consumed first. Ideal for perishable goods or businesses with shifting vendor purchase costs.
2. **Moving Average Cost (MAC):** Re-calculates the weighted average cost per unit every time new inventory is received via GRN. Ideal for standard retail trading items.

---

## Batch & Serial Lot Tracking

For regulated industries (pharmaceuticals, F&B) or high-value electronics, BigLedger provides granular tracking:
- **Batch / Lot Control:** Tracks manufactured batches with manufacturing dates, supplier lot numbers, and expiration dates.
- **Serial Number Tracking:** Assigns a unique individual identifier to every single item unit for warranty enforcement and trace analysis.

---

## What to Read Next

- **[Configuration](/modules-v2/inventory/configuration/)** — Set up warehouse bin structures, stock movement rules, and GL account mappings.
- **[Use Cases](/modules-v2/inventory/use-cases/)** — Review reference architectures for multi-warehouse distribution, batch tracking, and kitting.
