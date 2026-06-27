---
title: "Use Cases"
description: "Real-world business reference architectures for B2C retail webstores, B2B wholesale portals, and multi-channel marketplace selling."
weight: 40
bookCollapseSection: false
---

The E-Commerce Module flexibly supports diverse digital sales models across consumer retail, corporate wholesale, and marketplace channels.

## 1. Direct-to-Consumer (B2C) Retail Webstore

**Business Scenario:** A consumer brand operates a brand webstore accepting credit card and e-wallet payments with automated courier shipping label generation.

- **Primary Applets:** [CP-Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/), [Shopping Cart Applet](/applets/ecommerce/shopping-cart-applet/), [Internal Packing Order Applet](/applets/manufacturing/internal-packing-order-applet/)
- **Operational Flow:** Customer checks out on webstore → payment gateway captures funds → order injected into ERP as confirmed Sales Order → warehouse receives packing list and dispatches shipment via courier integration.

---

## 2. B2B Client Ordering Portal (Corporate Account Selling)

**Business Scenario:** A wholesale distributor provides corporate clients with a password-protected ordering portal featuring customized contract pricing, credit term validation, and bulk order upload.

- **Primary Applets:** [CP-Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/), [Sales Order Applet](/applets/sales-workflow/internal-sales-order-applet/), [Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/)
- **Operational Flow:** Corporate buyer logs in → system displays client-specific pricebook → buyer submits bulk order against approved credit limit → Sales Order routed for fulfillment.

---

## 3. Multi-Channel Marketplace Synchronization (Shopee, Lazada, TikTok Shop)

**Business Scenario:** A merchant sells across multiple third-party online marketplaces and requires centralized inventory synchronization to prevent overselling.

- **Primary Applets:** [Seller Admin Applet](/applets/ecommerce/seller-admin-applet/), [Seller Applet](/applets/ecommerce/seller-applet/), [Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/)
- **Operational Flow:** Orders from external marketplaces ingested automatically → inventory stock balances synchronized across all connected stores → centralized fulfillment managed from a single central warehouse.
