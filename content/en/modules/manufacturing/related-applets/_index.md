---
aliases:
- /modules-v2/manufacturing/related-applets/
title: "Related Applets"
description: "Complete guide to native BigLedger applet connections and dependencies supporting the Manufacturing Module."
weight: 70
---

The Manufacturing Module integrates seamlessly with core and supporting applets across BigLedger to deliver end-to-end shop floor execution.

## Core Manufacturing Applets

{{< cards >}}
  {{< card link="/applets/manufacturing/production-planning-and-monitoring-applet" title="Production Planning Applet" subtitle="Master production scheduling, MRP material availability tracking, and work order release" >}}
  {{< card link="/applets/manufacturing/process-maintenance-applet" title="Process Maintenance Applet" subtitle="Work center definitions, machine operations setup, labor rate matrices, and routing workflows" >}}
  {{< card link="/applets/manufacturing/manufacturing-operation-applet" title="Manufacturing Operation Applet" subtitle="Shop floor execution tracking, raw material issue logging, scrap reporting, and output entry" >}}
  {{< card link="/applets/manufacturing/internal-packing-order-applet" title="Internal Packing Order Applet" subtitle="Secondary packaging execution, finished product batch assignment, and warehouse stock-in" >}}
{{< /cards >}}

## Ecosystem Master Data Dependencies

- **[Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/)**: Raw material component SKUs and finished goods items.
- **[Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/)**: Raw material stock availability and finished goods stock-in posting.
- **[Stock Conversion Applet](/applets/inventory-workflow/stock-conversion-applet/)**: Kitting, assembly bundling, and component conversions.
- **[Purchase Requisition Applet](/applets/purchase-workflow/internal-purchase-requisition-applet/)**: Automated MRP raw material requisition triggers.
