---
title: "E-Commerce Module"
description: "Multi-channel online selling with marketplace integration, product catalog management, order synchronization, and B2B wholesale portals."
weight: 50
---

## 1. Module Overview

The **E-Commerce Module** enables businesses to sell online through multiple channels, including their own brand storefronts, third-party marketplaces, and B2B customer portals. It synchronizes product catalogs, pricing, orders, and inventory across all platforms, bridging the gap between online sales channels and offline warehouse operations.

**Business Value:**
- **Multi-Channel Sales**: Publish a single product catalog to multiple websites and marketplaces (Lazada, Shopee, Shopify, WooCommerce).
- **Prevent Overselling**: Real-time inventory synchronization across channels utilizing buffer stocks and stock allocation rules.
- **Unified Operations**: Consolidate online orders into a single picking and invoicing workflow alongside offline sales.
- **B2B Wholesale Portals**: Offer custom catalogs, tiered pricing, and credit terms to trade customers online.

### Core Capabilities

- **EcomSync Integration**: Connect and manage Lazada, Shopee, Shopify, and WooCommerce stores from a central dashboard.
- **CP-Commerce Storefronts**: Build and customize mobile-responsive retail websites, content pages, blogs, and SEO tags.
- **B2B Customer Portals**: Provide trade customers self-service checkout with specific pricebooks, volume discounts, and credit limit checks.
- **Unified Order Processing**: Automatically import, track, and sync shipping statuses and tracking numbers back to original marketplaces.

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **E-Commerce Catalog** | The product listing published to online channels, including images, descriptions, and pricing. |
| **Seller / Merchant** | An account configured to sell through the BigLedger marketplace or external platforms. |
| **PDG (Product Data Gateway)** | The background engine for synchronizing product listings, attributes, and images with marketplaces. |
| **EcomSync** | The integration bridge coordinating order consolidation and stock levels between channels and BigLedger. |
| **CP-Commerce** | BigLedger's built-in content and commerce platform for hosting independent websites. |
| **B2B Portal** | A secured customer-facing login where wholesale buyers order under specific credit and pricing terms. |
| **Buffer Stock** | A set quantity of stock reserved offline and hidden from marketplaces to prevent overselling. |

---

## 3. Included Applets

### Multi-Channel Sync & Gateways

| Applet | Purpose |
|--------|---------|
| [EcomSync Applet](/applets/ecommerce/ecomsync-applet/) | Central integration hub for mapping product catalogs, managing pricing, and tracking sync logs across channels. |
| [PDG Applet](/applets/ecommerce/pdg-applet/) | Product Data Gateway for defining schema attributes and publishing item listings to external platforms. |
| [Shopify Connector Applet](/applets/ecommerce/shopify-connector/) | Dedicated integration manager for Shopify store syncing. |
| [Lazada Integration Applet](/applets/ecommerce/lazada-integration/) | Manage Lazada API keys, categories, pricing, and order routing. |
| [Shopee Integration Applet](/applets/ecommerce/shopee-integration/) | Manage Shopee API keys, product mappings, and order queues. |

### Web Storefronts & Portals

| Applet | Purpose |
|--------|---------|
| [CP-Commerce Applet](/applets/ecommerce/cp-commerce/) | Customize brand website templates, layout menus, static pages, blogs, and SEO keywords. |
| [B2B Portal Applet](/applets/ecommerce/b2b-portal/) | Set up customer-specific portals, wholesale catalogs, credit checking rules, and quick checkout forms. |
| [Shopping Cart Applet](/applets/ecommerce/shopping-cart-applet/) | Configure customer-facing cart rules, discount coupon codes, and payment gateway rules. |

### Merchant Administration

| Applet | Purpose |
|--------|---------|
| [Seller Admin Applet](/applets/ecommerce/seller-admin-applet/) | Set up seller accounts, configure multi-merchant commissions, and manage channel approvals. |
| [Seller Applet](/applets/ecommerce/seller-applet/) | Dashboard for third-party sellers to upload products, review orders, and trace payment cycles. |

---

## 4. Standard Business Workflows

### Workflow 1: Online Order Fulfillment

```
Customer Orders ──▶ Order Auto-Import ──▶ Inventory Reserved ──▶ Pack & Ship ──▶ Tracking Sent ──▶ Invoice Issued
   (Marketplace)         (EcomSync)           (Warehouse)       (DO Applet)     (Auto-update)    (Auto-GL post)
```

**Steps:**
1. A customer purchases an item on Shopify or Shopee.
2. The order is automatically imported to the system via the **EcomSync Applet**.
3. System allocates and reserves stock from the mapped warehouse location.
4. Warehouse staff pick, pack, and generate a Delivery Order.
5. Shipping status and tracking numbers are synced back to the original marketplace platform.
6. The sale automatically generates an invoice and posts to the General Ledger.

### Workflow 2: Product Listing & Channel Publishing

```
Create Product ──▶ Configure PDG ──▶ Map Channels ──▶ Publish Listing ──▶ Verify Active Status
 (Item Maintain)      (Attributes)       (EcomSync)       (API Push)           (Marketplace)
```

**Steps:**
1. Create the product SKU, dimensions, and baseline pricing in **Inventory Item Maintenance**.
2. Configure e-commerce attributes (images, long descriptions, search tags) in the **PDG Applet**.
3. Choose the target sales channels in **EcomSync**.
4. Push the listing to Lazada, Shopee, or Shopify.
5. Verify that the product is active and pricing displays correctly on the front-end channels.

### Workflow 3: Automated Stock Level Synchronization

```
Warehouse Stock Updates ──▶ EcomSync Stock Re-calculation ──▶ API Sync Push ──▶ Channel Stock Reflected
```

**Steps:**
1. Warehouse receives physical stock via a Purchase GRN, raising local inventory.
2. **EcomSync** detects the stock change, deducts configured buffer levels, and calculates available marketplace stock.
3. System triggers an API push to Shopee, Lazada, and Shopify.
4. Channel listing quantities are instantly updated, preventing stock outs and overselling.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **E-Commerce Manager** | Seller Admin, Catalog, EcomSync | Configure gateway connections, set buffer stock rules, manage channels and pricing adjustments |
| **Catalog Manager** | E-Commerce Catalog, PDG | Maintain product imagery, write product descriptions, publish listings to channels |
| **Warehouse Fulfillment** | Delivery Order, Seller Applet | Pick and pack e-commerce orders, paste courier shipping labels, register tracking codes |
| **Seller / Merchant** | Seller Applet | For multi-vendor setups: manage merchant catalog listings, process orders, review balances |

---

## 6. Prerequisites / Initial Setup

Before going live with the E-Commerce Module, ensure:

- [x] **Core Module** — Organisation and locations are configured
- [ ] **Inventory Module** — Stock tracking is active for SKUs, and default fulfillment warehouses are assigned
- [ ] Marketplace API keys and developer account credentials are verified
- [ ] Mapped Chart of Accounts records exist for marketplace sales, commission charges, and payment fees
- [ ] Shipping provider rules, delivery rates, and regions are set up in the Shipping Pricebook
- [ ] Website theme layouts and payment processors (e.g., Stripe, PayPal) are configured in CP-Commerce

### Setup Sequence

1. **Prerequisite Setup**: Verify products are defined with dimensions and barcodes in Inventory Item Maintenance.
2. **EcomSync Configuration**: Set up sync frequency, buffer stocks, and connect API accounts.
3. **Channel Mapping**: Link BigLedger SKUs to existing marketplace listings.
4. **Fulfillment Rule Setup**: Set default warehouses for incoming channel orders.
5. **Testing**: Run a test transaction in draft mode to ensure tax mapping, inventory reservation, and invoicing route correctly.

---

## 7. FAQs & Troubleshooting

**Q: Products aren't appearing on the marketplace after publishing.**
A: Check the sync status in the **PDG Applet** or **EcomSync Applet** error log. Common causes include missing mandatory fields (like package weights, dimensions, or images) or expired API tokens.

**Q: An order came in from Shopify but stock wasn't reserved.**
A: Verify that inventory sync is enabled in **EcomSync**. Check the integration logs for API errors or SKU mismatches where the channel SKU does not match the system SKU.

**Q: How does the system prevent overselling during flash sales?**
A: You should configure **Buffer Stocks** in the store settings. For example, if you set a buffer of 5, the marketplace will show 0 stock when your actual warehouse stock reaches 5, saving inventory for physical walk-ins or sync delays.

### Common Sync Issues

- **Products Not Syncing**: Verify API credentials and connections, check product mapping rules, and check validation logs for required fields.
- **Order Import Failures**: Verify customer profiles exist, check tax code mappings, and review inventory availability in the default warehouse.
- **Inventory Discrepancies**: Run a stock reconciliation check, adjust sync frequency rules, and verify multi-location warehouse allocations in EcomSync.
