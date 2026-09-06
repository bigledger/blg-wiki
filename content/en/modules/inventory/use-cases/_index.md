---
aliases:
- /modules-v2/inventory/use-cases/
title: "Use Cases"
description: "Real-world business reference architectures for multi-warehouse distribution, batch tracking, and kitting assembly."
weight: 40
bookCollapseSection: false
---

The Inventory Module flexibly supports diverse supply chain workflows across distribution centers, manufacturing, and retail networks.

## 1. Central Logistics Distribution (Multi-Warehouse Transit)

**Business Scenario:** A regional distributor manages one central logistics hub supplying 12 regional distribution warehouses and retail stores.

- **Primary Applets:** [Warehouse Management Applet](/applets/inventory-workflow/warehouse-management-applet/), [Stock Transfer Applet](/applets/inventory-workflow/stock-transfer-applet/), [Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/)
- **Operational Flow:** Central hub dispatches stock transfer note → items marked in-transit → receiving warehouse executes stock-in receipt → real-time balances update across all branches.

---

## 2. Pharmaceutical & Food Lot Control (Batch Expiry Management)

**Business Scenario:** A food distributor manages perishable inventory requiring FEFO (First-Expired, First-Out) picking enforcement and lot recall traceability.

- **Primary Applets:** [Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/), [Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/)
- **Operational Flow:** Inbound supplier shipment received with manufacturing and expiry dates → system automatically recommends picking oldest batches first → full lot tracking maintained for audit reporting.

---

## 3. Light Assembly & Kitting (Item Bundling)

**Business Scenario:** A retail merchant bundles multiple individual stock SKUs into promotional gift boxes or assembly kits.

- **Primary Applets:** [Stock Conversion Applet](/applets/inventory-workflow/stock-conversion-applet/), [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/)
- **Operational Flow:** Assembly order initiated → individual component SKUs deducted from inventory → finished kit SKU balance increased → asset valuation reallocated automatically.
