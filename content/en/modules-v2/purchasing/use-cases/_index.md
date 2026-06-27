---
title: "Use Cases"
description: "Real-world business reference architectures for raw material procurement, trading stock reordering, and vendor consignment."
weight: 40
bookCollapseSection: false
---

The Purchasing Module flexibly supports diverse procurement workflows across manufacturing, wholesale trading, and retail operations.

## 1. Manufacturing Raw Material Procurement (MRP-Driven Buying)

**Business Scenario:** A manufacturing plant requires automated raw material purchasing based on Material Requirements Planning (MRP) production schedules and safety stock thresholds.

- **Primary Applets:** [Purchase Requisition Applet](/applets/purchase-workflow/internal-purchase-requisition-applet/), [Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/), [Goods Received Note GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
- **Operational Flow:** MRP engine identifies raw material shortages → automated Requisitions generated → Procurement Officer issues POs with agreed supplier lead times → warehouse receives goods via GRN with batch number logging.

---

## 2. Retail & Wholesale Stock Reordering (Min/Max Replenishment)

**Business Scenario:** A retail business automatically reorders trading inventory when warehouse stock levels fall below established reorder points.

- **Primary Applets:** [Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/), [Goods Received Note GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
- **Operational Flow:** Inventory alert triggers replenishment request → buyer issues PO using contracted vendor pricebooks → supplier dispatches shipment → warehouse executes GRN stock-in.

---

## 3. Vendor Consignment Procurement (Consignee Operations)

**Business Scenario:** A retailer receives stock from a supplier on consignment, storing goods on-site without upfront payment until items are sold to retail customers.

- **Primary Applets:** [Consignment Purchase Order](/applets/purchase-workflow/internal-consignment-purchase-order-applet/), [Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/)
- **Operational Flow:** Consignment PO issued for physical stock transfer → goods stored in dedicated consignment warehouse location → monthly retail sales log reported → consignor billing generates invoice for sold units only.
