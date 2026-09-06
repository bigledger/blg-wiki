---
title: "E-Commerce Module"
description: "Omnichannel digital commerce engine managing online B2B/B2C storefronts, marketplace integrations, and automated ERP order processing."
weight: 40
---

The **E-Commerce Module** is BigLedger's omnichannel digital commerce engine. It powers customer-facing web portals, online shopping carts, multi-channel marketplace sync (Shopee, Lazada, TikTok Shop), and automated order injection directly into Sales, Inventory, and Financial Accounting.

## Architecture & Data Flow

E-Commerce connects digital buyer touchpoints directly into core ERP fulfillment pipelines. When an online customer places an order, payment gateways authorize funds while BigLedger allocates stock and schedules packing fulfillment automatically.

| Architecture Layer | System Component | Primary Role in E-Commerce Operations |
|-------------------|------------------|---------------------------------------|
| **E-Commerce Engine** | [CP-Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/) | Central management of digital product catalogs, webstore pricing rules, and online buyer accounts. |
| **Buyer Storefront** | [Shopping Cart Applet](/applets/ecommerce/shopping-cart-applet/) | Customer browsing, online product search, shopping cart management, and payment gateway checkout. |
| **Multi-Channel Sync** | [Seller Admin Applet](/applets/ecommerce/seller-admin-applet/) | Synchronizing product inventory and sales orders across external marketplaces and B2B portals. |
| **Fulfillment & Accounting** | Sales, Inventory & Finance | Automated sales order creation, stock reservation, courier dispatch, and gateway settlement posting. |

---

## Who Uses This Module

| Role | Primary Responsibilities | Core Applets Used |
|------|--------------------------|-------------------|
| **E-Commerce Manager** | Maintain online product catalogs, configure promotional banners, set webstore pricing schemes | [CP-Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/) |
| **Marketplace Specialist** | Synchronize inventory stock balances across external marketplaces (Shopee, Lazada, TikTok Shop) | [Seller Admin Applet](/applets/ecommerce/seller-admin-applet/), [Seller Applet](/applets/ecommerce/seller-applet/) |
| **Online Buyer / Client** | Browse product catalogs, manage shopping cart items, complete credit card or FPX checkout | [Shopping Cart Applet](/applets/ecommerce/shopping-cart-applet/) |
| **Order Fulfillment Clerk** | Monitor incoming webstore orders, generate shipping labels, track courier dispatches | [Internal Packing Order Applet](/applets/manufacturing/internal-packing-order-applet/) |

---

## Four E-Commerce Touchpoints Every Team Must Differentiate

Confusing online touchpoints leads to catalog sync errors and payment reconciliation discrepancies:

| Touchpoint Component | Business Purpose | Inventory Impact | Financial Accounting Impact |
|----------------------|------------------|------------------|-----------------------------|
| **Digital Catalog** | Online product listing showcasing SKUs, images, and public web prices | None | None |
| **Shopping Cart Checkout** | Online customer basket authorization and payment gateway capture | Soft Stock Allocation | Payment Gateway Holding Accrual |
| **ERP Order Injection** | Converting webstore checkout into an official ERP Sales Order | Hard Stock Reservation | None (Unbilled Order recorded) |
| **Gateway Settlement** | Reconciling online payment processor net payouts into company bank ledgers | None | Bank Debited, Gateway Holding Cleared, Merchant Fees Expensed |

---

## Applet Map

| Applet | What it does in this module |
|--------|-----------------------------|
| [CP-Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/) | Central e-commerce control hub — webstore settings, product catalog publishing, and buyer access |
| [Shopping Cart Applet](/applets/ecommerce/shopping-cart-applet/) | Customer-facing web shopping cart, shipping rate calculator, and payment gateway integration |
| [Seller Admin Applet](/applets/ecommerce/seller-admin-applet/) | Multi-vendor seller management, B2B supplier portal configuration, and marketplace sync |
| [Seller Applet](/applets/ecommerce/seller-applet/) | Vendor portal dashboard for third-party marketplace merchants to process orders and track payouts |

---

## ERP Dependency Table

| Connected Module | What E-Commerce needs from it |
|------------------|-------------------------------|
| **Core** | Customer master records, organization branch entities, currency conversion rates |
| **Sales & POS** | Sales Order generation pipeline, commercial pricing schemes, tax invoice rules |
| **Inventory** | Real-time stock availability, multi-warehouse allocation, packing dispatch verification |
| **Financial Accounting** | Chart of accounts mapping, payment gateway clearing accounts, merchant fee GLs |

---

## Go-Live Checklist

- [x] Webstore domain and SSL certificates configured in CP-Commerce Admin Applet
- [ ] Product master SKUs, images, and digital descriptions published from Inventory
- [ ] Payment gateway merchant accounts (Stripe, FPX, PayPal) connected and tested
- [ ] Shipping carrier API integrations and shipping rate calculation matrices verified
- [ ] Automated webstore sales order injection mapped to ERP Sales & POS
- [ ] Payment gateway fee reconciliation GL accounts established in Finance

---

## Module Learning Roadmap

Follow the documentation in this sequence to master the E-Commerce Module:

1. **[Core Concepts](core-concepts/)** *(Next Step)* — Understand digital order injection, inventory stock sync, and payment gateway clearing mechanics.
2. **[Configuration](configuration/)** — Step-by-step setup guides for webstore themes, payment gateways, and shipping rules.
3. **[Use Cases](use-cases/)** — Real-world reference architectures for B2C webstores, B2B portal ordering, and multi-channel marketplace sync.
4. **[API Reference](api-reference/)** — Direct reference link to official developer e-commerce APIs.
5. **[Best Practices](best-practices/)** — Operational recommendations for cart abandonment, inventory buffers, and gateway reconciliation.
6. **[Reports & Analytics](reports/)** — Scenario guide for choosing the best online sales and conversion reports.
7. **[Related Applets](related-applets/)** — Complete guide to native applet dependencies across the BigLedger ecosystem.

---

{{< callout type="info" >}}
**Ready to explore digital commerce architecture?**  
Proceed to **[Core Concepts →](core-concepts/)** to understand webstore order lifecycles and stock sync.
{{< /callout >}}
