---
title: "Seller Applet"
description: "Comprehensive multi-seller management system for product listings, orders, and financial settlements"
tags:
  - seller-management
  - e-commerce
  - order-processing
  - financial-settlement
  - branch-management
weight: 70
---

## Purpose and Overview

The **Seller Applet** is a robust platform designed to manage the entire lifecycle of third-party sellers within your ecosystem. It streamlines the onboarding of sellers, product synchronization, order fulfillment, and complex financial reconciliations between the platform and its sellers.

{{< callout type="info" >}}
**Core Concept**: The system manages the relationship between the **Seller Account** (Who), their **Marketplace Products** (What), and the **Pick & Pack Queue** (How) that drive business growth. It acts as a bridge between your core business and external partners.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales & Procurement Teams:**

- **Standardized Onboarding**: Capture essential details including ID Numbers, Tax Registration, and Accounting Categories.
- **Centralized Catalog**: Manage marketplace items (MKP Items) linked directly to your Financial Items (FI Items).
- **Logistics Oversight**: Automated routing of orders to specific seller branches or stores.
- **Unified Inventory**: Real-time stock visibility across the entire seller network with granular inventory tracking.

**Finance & Accounting Teams:**

- **Automated Settlement Flow**: Seamlessly transition from Seller Orders to Purchase Invoices (PI) and Payment Vouchers (PV).
- **Flexible Payouts**: Support for multiple settlement types including Bank Transfer, FPX e-Mandate, e-Wallets, and Membership Point Currency.
- **Credit & Limit Control**: Manage seller credit terms and limits directly within their entity profiles.
- **Transparent Auditing**: Full audit trails for every financial interaction through the Applet Log.

**Sellers & Partners:**

- **Self-Service Dashboard**: Manage product listings, descriptions, and high-quality image assets.
- **Pick & Pack Queue**: Granular visibility into the fulfillment status of every order line.
- **Settlement Transparency**: View pending and historical payouts with itemized breakdowns.
- **Branch Support**: Ability to manage multiple operational locations within a single seller account.

{{< figure src="/images/seller-applet/seller-account-listing.png" alt="Seller Account Listing" caption="The Seller Account Listing page provides a centralized view of all registered sellers and their marketplace statuses." >}}

### What Problems Does This Solve?

**The Manual Marketplace Problem:**
Traditional marketplace management often suffers from fragmented data and manual bottlenecks. Common issues include:

- **Data Inconsistency**: Disparate product formats across different sellers leading to a messy customer experience.
- **Fulfillment Chaos**: Difficulty coordinating Pick & Pack operations across multiple external partners.
- **Settlement Errors**: Manual calculation of payouts resulting in reconciliation headaches and payment delays.
- **Inventory Blind Spots**: Lack of real-time visibility into whether a seller can actually fulfill an order.
- **Compliance Risks**: Incomplete seller documentation and unverified tax status.

**The Seller Applet Solution:**

- **Entity Attribute Mapping** - Standardize seller data (ID, Tax, Accounting) for 100% compliance.
- **Integrated Pick & Pack Queue** - Convert customer sales orders into streamlined fulfillment tasks for sellers.
- **Automated Settlement Triangle** - Link Orders, Invoices, and Vouchers in a single, error-free chain.
- **Store-Level Inventory Control** - Enable/disable inventory tracking at the individual branch level.
- **Extensible Configuration** - Customize fields, printable formats, and webhooks to match your specific needs.

## Key Features Overview

{{< cards >}}
{{< card title="Seller Account" subtitle="Manage entity headers, tax info, and credit terms" link="#seller-account-management" >}}

{{< card title="Product Sync" subtitle="Map Marketplace Items to Financial Inventory" link="#product-and-catalog-sync" >}}

{{< card title="Pick & Pack Queue" subtitle="Fulfill orders with granular status tracking" link="#seller-order-workflow" >}}

{{< card title="Purchase Invoice" subtitle="Automated settlement record generation" link="#accounts-payable--settlement" >}}

{{< card title="Payment Voucher" subtitle="Multi-channel seller payout processing" link="#accounts-payable--settlement" >}}

{{< card title="Branch/Store Mapping" subtitle="Support for localized multi-store operations" link="#multi-branch-support" >}}
{{< /cards >}}

{{< figure src="/images/seller-applet/product-listing.png" alt="Product Listing Page" caption="Track and manage marketplace products, inventory levels, and synchronization status across the platform." >}}

---

## Key Concepts

### Understanding the Seller Ecosystem

To effectively manage the system, it is crucial to understand how **Sellers**, **Branches**, and **Products** interact.

| Component             | Definition                               | Role in Workflow                                                |
| --------------------- | ---------------------------------------- | --------------------------------------------------------------- |
| **Seller Account**    | The `mst_entity` profile of the partner. | Owns the tax registration (Tax Reg No) and accounting category. |
| **Seller Branch**     | A physical store or branch location.     | The fulfillment point linked to specific inventory stores.      |
| **Pick & Pack Queue** | The real-time order fulfillment engine.  | Manages the transition from customer order to seller shipment.  |

### The "Settlement Triangle"

The Seller Applet ensures financial accuracy through a linked three-step process:

1.  **Seller Order**: Customer pays; the system creates a Marketplace Seller Order.
2.  **Purchase Invoice**: Upon shipment/delivery, the system generates a PI (Purchase record).
3.  **Payment Voucher**: Finance processes the settlement via the selected mode (Bank Transfer, FPX, etc.).

---

## Quick Start Guide

Get your marketplace operations running quickly with these essential workflows.

### For Admins: Initial System Setup

**Goal:** Prepare the environment for seller onboarding in 6 steps.

1.  **Verify Accounting Categories**: Define `AKN_ETY_CTG` labels to classify your sellers (e.g., Corporate vs. Individual).
2.  **Setup Printable Formats** (`Settings > Printable Format`): Customize the look of Invoices and Payment Vouchers with your branding.
3.  **Configure Branches/Stores**: Map out the physical locations in `Settings > Branches`.
4.  **Define Webhooks** (`Settings > Webhook`): Enable external notifications for new orders or inventory changes.
5.  **Establish Permission Sets**: Define granular access for Sales, Finance, and Seller roles.
6.  **Set Settlement Types**: Enable relevant payment modes like Bank Transfer or e-Wallet for your region.

{{< figure src="/images/seller-applet/seller-applet-settings.png" alt="Seller Applet Settings" caption="Configure system-wide settings, printable formats, webhooks, and granular user permissions." >}}

### For Staff: Onboarding a New Seller

**Goal:** Successfully register a seller and their products.

1.  **Create Entity Profile**: Go to **Seller Account** → Click **"+"** → Fill in Legal Name, `ID_NO`, and `TAX_REG_NO`.
2.  **Set Credit Terms**: Define `CREDIT_LIMIT_TERMS` to manage the financial relationship.
3.  **Assign Operating Stores**: Link the seller to specific branches to enable store-based inventory.
4.  **Map Financial Items**: Link new Marketplace Products to existing `FI_Items` for accurate stock accounting.
5.  **Review & Approve**: Verify documentation and click **Approve** to activate the seller account.

{{< figure src="/images/seller-applet/seller-account-form.png" alt="Seller Account Form" caption="Detailed onboarding form for capturing legal entity information, tax registration, and relationship terms." >}}

### For Sellers: Managing Daily Operations

**Goal:** Fulfill orders and track payments efficiently.

1.  **Monitor Pick/Pack Queue**: Check for new orders in the **Seller Order** dashboard.
2.  **Fulfill Orders**:
    - Pick the items from the allocated store.
    - Pack the items and click **Issue GIN** (Goods Issued Note).
    - The status automatically updates to "Shipped" for the customer.
3.  **Verify Settlements**: Review generated **Purchase Invoices** to confirm the amount owed for the period.
4.  **Download Vouchers**: View your **Payment Vouchers** to confirm when funds are released.

{{< figure src="/images/seller-applet/seller-order-listing.png" alt="Seller Order / Pick & Pack Queue" caption="Monitor and fulfill customer orders through the integrated Pick & Pack fulfillment queue." >}}

---

## Configuration & Settings

### Seller Account Management

- **Entity Attributes**: Customize `mst_entity_ext` parameters like Website URL or Seller Remarks.
- **Status Lifecycle**: Manage accounts through states: `Active`, `Inactive`, or `Pending Approval`.

### Product & Inventory Logic

- **Require Delivery/Production**: Toggle these flags per product to trigger different fulfillment workflows.
- **UOM Management**: Set multi-unit measurements and pricing schemes for complex product catalogs.

### Accounts Payable & Settlement

- **Settlement Modes**: Configure regional payment gateways or membership currency options.
- **Batch Processing**: Group multiple Seller Orders into a single settlement cycle for efficiency.

{{< figure src="/images/seller-applet/purchase-invoice-listing.png" alt="Purchase Invoice Listing" caption="Automated generation of purchase records following successful order fulfillment." >}}

{{< figure src="/images/seller-applet/payment-voucher-listing.png" alt="Payment Voucher Listing" caption="Streamlined tracking and processing of seller payouts across multiple settlement channels." >}}

{{< figure src="/images/seller-applet/branch-listing.png" alt="Branch and Store Listing" caption="Manage physical locations and map them to inventory stores for intelligent order routing." >}}

---

## FAQ

**Q: What is the benefit of the Pick & Pack Queue?**
A: It provides real-time visibility into the fulfillment progress of every item within a multi-vendor order, ensuring customers get accurate shipping updates.

**Q: Can we capture different tax categories for different sellers?**
A: Yes, using the `TAX_REG_NO` and specific `TAX_DETAILS` fields in the Seller Account profile, you can manage unique tax requirements for each partner.

**Q: How does the system handle "Pre-Order" items?**
A: You can enable the `preOrderItem` flag on the product listing, which adjusts the Pick & Pack Queue to allow for longer fulfillment lead times.

**Q: Can a seller be paid via Membership Points?**
A: Yes, the Seller Applet supports `MEMBERSHIP_POINT_CURRENCY` as a valid settlement type, allowing for creative ecosystem-based rewards.

**Q: How do we track image assets for products?**
A: Use the **Manage Image** feature within the Product listing to upload, tag, and set "Public" status for product photos.
