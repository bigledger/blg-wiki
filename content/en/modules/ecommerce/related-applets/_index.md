---
aliases:
- /modules-v2/ecommerce/related-applets/
title: "Related Applets"
description: "Complete guide to native BigLedger applet connections and dependencies supporting the E-Commerce Module."
weight: 70
---

The E-Commerce Module integrates seamlessly with core and supporting applets across BigLedger to deliver end-to-end digital commerce.

## Core E-Commerce Applets

{{< cards >}}
  {{< card link="/applets/ecommerce/cp-commerce-admin-applet" title="CP-Commerce Admin Applet" subtitle="Central e-commerce control hub — webstore settings, product catalog publishing, and buyer access" >}}
  {{< card link="/applets/ecommerce/shopping-cart-applet" title="Shopping Cart Applet" subtitle="Customer-facing web shopping cart, shipping rate calculator, and payment gateway integration" >}}
  {{< card link="/applets/ecommerce/seller-admin-applet" title="Seller Admin Applet" subtitle="Multi-vendor seller management, B2B supplier portal configuration, and marketplace sync" >}}
  {{< card link="/applets/ecommerce/seller-applet" title="Seller Applet" subtitle="Vendor portal dashboard for third-party marketplace merchants to process orders and track payouts" >}}
{{< /cards >}}

## Marketplace Synchronisation (EcomSync)

EcomSync is the name for keeping Lazada, Shopee, TikTok Shop and Shopify in step with the ERP. It is not one applet — the screens are spread across Organisation, Doc Item Maintenance and Sales Order (Internal), and the synchronisation runs as background jobs on the server.

- **[EcomSync — which applet holds each step](/applets/integrations/90-ecomsync-related-applets/)**: the setup order, the marketplaces that have a full sync cycle, the background jobs, and the troubleshooting table.

## Ecosystem Master Data Dependencies

- **[Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/)**: Product master SKUs, web descriptions, and images.
- **[Pricebook Applet](/applets/master-data/pricebook-applet/)**: Customer tier pricing and web promotional pricebooks.
- **[Sales Order Applet](/applets/sales-workflow/internal-sales-order-applet/)**: Automated digital sales order injection and credit verification.
- **[Warehouse Management Applet](/applets/inventory-workflow/warehouse-management-applet/)**: Fulfillment warehouse stock allocation and packing dispatch.
