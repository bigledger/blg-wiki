---
aliases:
- /modules-v2/inventory/related-applets/
title: "Related Applets"
description: "Complete guide to native BigLedger applet connections and dependencies supporting the Inventory Module."
weight: 70
---

The Inventory Module integrates seamlessly with core and supporting applets across BigLedger to deliver end-to-end stock control.

## Core Inventory Control Applets

{{< cards >}}
  {{< card link="/applets/inventory-workflow/stock-balance-applet" title="Stock Balance Applet" subtitle="Real-time warehouse inventory inquiry, quantity-on-hand tracking, and batch/serial lookup" >}}
  {{< card link="/applets/inventory-workflow/stock-transfer-applet" title="Stock Transfer Applet" subtitle="Inter-branch stock transfers, transit tracking, and receiving store confirmations" >}}
  {{< card link="/applets/inventory-workflow/stock-take-applet" title="Stock Take Applet" subtitle="Physical inventory cycle counting, stock audit sheets, and variance posting" >}}
  {{< card link="/applets/inventory-workflow/warehouse-management-applet" title="Warehouse Management Applet" subtitle="Warehouse structure definition, bin locations, aisle mapping, and stock location rules" >}}
{{< /cards >}}

## Supporting Inventory Applets

- **[Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/)**: Multi-warehouse availability lookup and stock reservation breakdown.
- **[Stock Adjustment Applet](/applets/inventory-workflow/stock-adjustment-applet/)**: Manual quantity/cost corrections and damage write-offs.
- **[Stock Conversion Applet](/applets/inventory-workflow/stock-conversion-applet/)**: Kitting, assembly bundling, and component conversions.
- **[Stock Report Applet](/applets/inventory-workflow/stock-report-applet/)**: Comprehensive inventory valuation, movement audit logs, and stock aging reports.

## Ecosystem Master Data Dependencies

- **[Organisation Applet](/applets/master-data/organisation-applet/)**: Organization branch locations and warehouse entities.
- **[Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/)**: Item master SKUs, descriptions, and purchasing units of measure.
- **[Inventory Item Maintenance Applet](/applets/master-data/inv-item-maintenance-applet/)**: Item attributes, categories, and inventory tracking rules.
