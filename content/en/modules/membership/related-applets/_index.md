---
aliases:
- /modules-v2/membership/related-applets/
title: "Related Applets"
description: "Key applets that integrate with and support membership and loyalty programs in BigLedger"
weight: 60
---

The Membership Module in BigLedger works seamlessly with core and supporting applets across different modules to deliver comprehensive loyalty and membership functionality. Understanding these applets and their integration points is essential for implementing and managing effective membership programs.

## Core Membership Applets

These applets provide the primary functional components for managing membership programs, campaigns, and receipt claims.

{{< cards >}}
  {{< card link="/applets/membership/membership-admin-applet" title="Membership Admin Applet" subtitle="Central administration hub for managing member profiles, point currencies, conversion rates, classes, labels, and manual adjustments" >}}
  {{< card link="/applets/membership/voucher-management-applet" title="Voucher Management Applet" subtitle="Comprehensive engine for managing promotional campaigns, discount vouchers, recurring loyalty rewards, and event ticketing" >}}
  {{< card link="/applets/membership/ocr-cash-bill-applet" title="OCR Cash Bill Applet" subtitle="Automated processing and AI-assisted verification of scanned cash bills for member loyalty point claims" >}}
{{< /cards >}}

### Integration Overview

**Membership Admin Applet** serves as the central command center for all membership operations. Program administrators use this applet to:

- Manage member accounts and profiles
- Define membership classes (tiers) and qualification rules
- Create member labels for targeted marketing segmentation
- Set up points currencies (PTS CCY) and conversion rates to money (PTS to CCY Config)
- Perform manual point adjustments with full audit tracking
- Upload bulk member records and historical transaction logs
- Generate membership analytics and reports

**Voucher Management Applet** manages promotional reward logic and campaigns:

- Create and issue discount and reward vouchers
- Generate individual ticket serial numbers for secure validation
- Manage recurring voucher distribution schedules (e.g., birthday or anniversary rewards)
- Track scanned event redemptions across physical and digital channels

**OCR Cash Bill Applet** handles receipt claims for offline transactions:

- Scan and digitize physical cash bills submitted by members
- Verify store, item, and purchase value automatically
- Post loyalty points directly to the member's account upon verification

## Customer Master Data Management

Customer information is the foundation of any membership program. Every member record links back to a customer profile in Core.

{{< cards >}}
  {{< card link="/applets/master-data/customer-maintenance-applet" title="Customer Maintenance Applet" subtitle="Comprehensive customer master data management, storing customer profiles, contact information, and preferences integrated with membership accounts" >}}
{{< /cards >}}

### Customer-Membership Integration

The **Customer Maintenance Applet** provides the master customer record:

- **Unified Customer Profile**: Every member is first a customer record in BigLedger containing personal details, contact information, and address records.
- **Membership Account Linkage**: When a customer joins a loyalty program, their customer record is linked to their membership profile in the Membership Admin Applet.

## Product and Pricing Management

Membership programs interact with product catalogs and tier-specific pricing structures.

{{< cards >}}
  {{< card link="/applets/master-data/doc-item-maintenance-applet" title="Doc Item Maintenance Applet" subtitle="Product master data management for maintaining items, SKUs, categories, and service items" >}}
  {{< card link="/applets/master-data/pricebook-applet" title="Pricebook Applet" subtitle="Configure tier-specific pricing and member discounts linked directly to member class status" >}}
{{< /cards >}}

### Pricing & Product Integration

- **Member-Specific Pricing**: Pricebooks connect to Member Classes so that members automatically receive tier-based discounts at checkout.
- **Reward Products**: Non-inventory or service reward items configured in Doc Item Maintenance can be redeemed via vouchers or points.

## Point of Sale Integration

Seamless store checkout integration ensures cashiers can easily identify members and apply rewards.

{{< cards >}}
  {{< card link="/applets/sales-workflow/pos-general-applet" title="POS General Applet" subtitle="Store counter checkout interface enabling instant member lookup, points earning, and point or voucher redemptions" >}}
{{< /cards >}}

### POS Checkout Integration

The **POS General Applet** connects counter operations to membership:

- **Member Lookup**: Cashiers identify members via phone number, member card barcode, or member ID.
- **Automatic Points Earning**: Completed sales automatically post points to the member's active balance according to business rules.
- **Redemption at Counter**: Cashiers apply points redemptions or vouchers to offset checkout totals.
