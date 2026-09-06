---
aliases:
- /modules-v2/ecommerce/reports/
title: "Reports & Analytics"
description: "Practical scenario guide and reporting matrix for online sales conversion, shopping cart abandonment, and gateway settlement tracking."
weight: 45
bookCollapseSection: false
---

The E-Commerce Module provides digital commerce analytics for online store managers, marketing specialists, and finance teams to track webstore conversion rates, evaluate marketplace sales, and reconcile online payment processor payouts.

## Reporting Scenario Decision Matrix ("Which Report to Use When")

Select the appropriate report based on your specific operational or business decision scenario:

| Business Scenario / Question | Recommended Report | Primary Applet | Key Metrics & Decision Value | Actionable Business Outcome |
|------------------------------|--------------------|----------------|------------------------------|-----------------------------|
| **"What is our overall online sales revenue breakdown across Webstore vs. Shopee vs. Lazada?"** | Omnichannel Sales Channel Performance Summary | [CP-Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/) | Total gross sales by channel, order volume, average order value (AOV). | Re-allocates digital marketing ad spend to the highest performing online sales channel. |
| **"Which online buyers abandoned their shopping carts before completing payment checkout?"** | Shopping Cart Abandonment Log | [Shopping Cart Applet](/applets/ecommerce/shopping-cart-applet/) | Abandoned cart IDs, items left in cart, total lost revenue potential, customer email. | Triggers automated cart recovery email campaigns with promotional discount codes. |
| **"Did our online payment processor (Stripe/FPX) settle all funds accurately into our bank account?"** | Payment Gateway Settlement & Fee Reconciliation | Financial Accounting / E-Commerce Reports | Gross customer payments, payment processor merchant fees deducted, net bank payout balance. | Identifies payment gateway fee discrepancies and clears pending gateway holding accounts. |
| **"What are the top-searched product items on our webstore catalog?"** | Catalog Search & Item Velocity Report | [CP-Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/) | Product page views, search keyword frequency, add-to-cart conversion rate %. | Optimizes product catalog placement and highlights trending items on home page banners. |

---

## Detailed Operational Reporting Guides

### 1. Channel Revenue Breakdown
- **Purpose:** Analyzes sales performance across webstores, mobile apps, and third-party marketplaces.
- **Key Parameters:** Filter by Channel Code (Web vs Marketplace), Date Range, and Product Category.
- **Operational Utility:** Provides executive visibility into digital channel growth and helps negotiate merchant fee structures.

### 2. Gateway Settlement Audit
- **Purpose:** Reconciles gross customer checkout charges against net bank deposits received from online payment gateways.
- **Key Parameters:** Filter by Payment Gateway Provider (Stripe, FPX, PayPal), Settlement Batch ID, and Transaction Date.
- **Operational Utility:** Prevents financial leakages caused by un-cleared processor payouts or hidden processing fees.
