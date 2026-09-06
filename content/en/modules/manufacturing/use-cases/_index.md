---
aliases:
- /modules-v2/manufacturing/use-cases/
title: "Use Cases"
description: "Real-world business reference architectures for discrete manufacturing assembly, process batch manufacturing, and secondary packaging."
weight: 40
bookCollapseSection: false
---

The Manufacturing Module flexibly supports diverse production models across discrete assembly, process chemical batching, and secondary packaging lines.

## 1. Discrete Machinery & Electronics Assembly (Make-to-Order)

**Business Scenario:** An industrial equipment manufacturer builds customized machinery against confirmed commercial sales orders requiring multi-level BOM explosion and sub-assembly staging.

- **Primary Applets:** [Production Planning and Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/), [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/), [Manufacturing Operation Applet](/applets/manufacturing/manufacturing-operation-applet/)
- **Operational Flow:** Commercial sales order triggers work order release → MRP calculates sub-assembly shortages → sub-assemblies built at dedicated work centers → final machine assembly completed and tested.

---

## 2. Process Chemical & Food Batch Manufacturing (Make-to-Stock)

**Business Scenario:** A beverage processing plant manufactures liquids in large automated batches requiring strict component mixing ratios, quality inspection checkpoints, and lot tracing.

- **Primary Applets:** [Production Planning and Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/), [Manufacturing Operation Applet](/applets/manufacturing/manufacturing-operation-applet/), [Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/)
- **Operational Flow:** Master batch scheduled → raw ingredients weighed and issued to mixing tanks → Quality Assurance approves lab sample → liquid transferred to filling line with lot number assignment.

---

## 3. Secondary Packaging & Retail Kitting Operations

**Business Scenario:** A consumer goods distributor repackages bulk manufactured products into retail-ready multipacks or seasonal promotional gift sets.

- **Primary Applets:** [Internal Packing Order Applet](/applets/manufacturing/internal-packing-order-applet/), [Stock Conversion Applet](/applets/inventory-workflow/stock-conversion-applet/)
- **Operational Flow:** Bulk finished inventory issued to packing line → custom barcode packaging materials applied → internal packing order completed → retail multipack stock-in posted.
