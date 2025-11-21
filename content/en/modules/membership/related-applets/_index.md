---
title: "Related Applets"
description: "Key applets that integrate with and support membership and loyalty programs"
weight: 60
---

The Membership Module in BigLedger works seamlessly with multiple applets across different modules to deliver comprehensive loyalty and membership program functionality. Understanding these related applets and their integration points is essential for implementing and managing effective membership programs.

## Core Membership Applets

These applets provide the foundation for membership program management and operations.

{{< cards >}}
  {{< card link="/applets/membership-admin-console-applet" title="Membership Admin Console Applet" subtitle="Central administration console for managing membership programs, points currencies, tier configurations, and member administration" >}}
  {{< card link="/applets/membership-program" title="Membership Program Applet" subtitle="Core program setup and configuration for loyalty programs, defining program rules, earning mechanisms, and member benefits" >}}
  {{< card link="/applets/membership-points-currency" title="Membership Points Currency Applet" subtitle="Configure and manage points currencies, earning rates, redemption rules, and currency expiry policies" >}}
{{< /cards >}}

### Integration Overview

**Membership Admin Console Applet** serves as the central command center for all membership operations. Program administrators use this applet to:

- Create and configure membership programs
- Define membership tiers and qualification thresholds
- Set up points currencies and earning rules
- Configure tier-specific benefits and rewards
- Manage member accounts and profiles
- Process manual points adjustments
- Generate membership reports and analytics
- Configure redemption catalogs
- Set up seasonal campaigns and promotions

**Membership Program Applet** handles the core program logic and configuration:

- Program structure definition
- Tier progression rules
- Grace period configuration
- Anniversary reward setup
- Welcome benefit configuration
- Program-level settings and policies

**Membership Points Currency Applet** manages all aspects of points currencies:

- Currency creation and configuration
- Earning rate definition
- Redemption rules and limits
- Expiry policies and tracking
- Multi-currency support
- Temporary campaign currencies
- Currency conversion rules

## Customer Master Data Management

Customer information is the foundation of any membership program. These applets handle customer data and profile management.

{{< cards >}}
  {{< card link="/applets/customer-maintenance-applet" title="Customer Maintenance Applet" subtitle="Comprehensive customer master data management, storing customer profiles, contact information, and preferences integrated with membership accounts" >}}
{{< /cards >}}

### Customer-Membership Integration

The **Customer Maintenance Applet** provides the customer data foundation that membership programs build upon:

**Unified Customer Profile**: Every member is first a customer in the BigLedger system. The Customer Maintenance Applet stores essential information including:
- Personal details (name, contact, date of birth)
- Communication preferences
- Multiple addresses
- Payment methods
- Purchase history
- Customer segmentation

**Membership Account Linkage**: When a customer enrolls in a membership program, their customer record links to their membership account, creating a unified view:
- Single customer ID across all systems
- Consistent data across POS, e-commerce, and membership
- Centralized communication preferences
- Unified transaction history
- Cross-channel recognition

**Data Synchronization**: Changes to customer data automatically synchronize with membership records:
- Updated contact information flows to membership communications
- Birthday changes trigger membership birthday reward recalculation
- Address updates ensure correct reward fulfillment
- Communication opt-outs respected across all channels

## Product and Pricing Management

Effective membership programs often include tier-specific pricing, member discounts, and exclusive product access.

{{< cards >}}
  {{< card link="/applets/doc-item-maintenance-applet" title="Doc Item Maintenance Applet" subtitle="Product master data management for maintaining items, SKUs, categories, and attributes used in membership reward catalogs" >}}
  {{< card link="/applets/pricebook-applet" title="Pricebook Applet" subtitle="Configure tier-specific pricing, member discounts, and promotional pricing that integrates with membership tier status" >}}
{{< /cards >}}

### Product Integration for Membership

**Doc Item Maintenance Applet** manages product data crucial for membership programs:

**Reward Catalog Products**: Define products available exclusively through point redemption:
- Dedicated reward SKUs separate from regular inventory
- Product attributes for catalog display
- Stock management for reward items
- Product categories for reward organization
- Images and descriptions for member-facing catalogs

**Points Eligibility Configuration**: Configure which products earn points and at what rate:
- Excluded categories (gift cards, services)
- Bonus point categories (new launches, featured items)
- Category-specific earning multipliers
- Product tags for campaign targeting

**Pricebook Applet** enables sophisticated tier-based pricing:

**Tier-Specific Pricing**: Create different price points based on membership tier:
- Silver member pricing
- Gold member discounts (5-10% off)
- Platinum member VIP pricing (10-15% off)
- Diamond member exclusive pricing (15-20% off)

**Member-Exclusive Promotions**: Configure promotions available only to members:
- Early access to sales (tier-based timing)
- Members-only flash sales
- Tier-specific promotional pricing
- Birthday month special pricing

**Integration with Points Earning**: Pricebook works with membership to ensure:
- Points calculated on correct price tier
- Member discounts applied before points calculation
- Tier multipliers applied appropriately
- Promotional pricing reflected in point earning

## Point of Sale Integration

Seamless POS integration is critical for membership programs to function effectively at checkout.

{{< cards >}}
  {{< card link="/applets/pos-terminal-applet" title="POS Terminal Applet" subtitle="Point of sale terminal integration enabling member identification, real-time points earning and redemption at checkout" >}}
{{< /cards >}}

### POS-Membership Workflow

**POS Terminal Applet** integrates membership functionality directly into the checkout process:

**Member Identification**: Multiple methods to identify members at POS:
- Phone number lookup (fastest)
- Member card barcode scan
- QR code scan from mobile app
- Email address search
- Manual member ID entry

**Real-Time Balance Display**: Once member identified, POS displays:
- Current points balance
- Current membership tier
- Available rewards and vouchers
- Points expiring soon
- Birthday month status

**Transaction Processing**: During checkout, POS handles:
- Automatic points accrual calculation based on purchase
- Tier multiplier application
- Promotional bonus points
- Real-time points posting to account
- Receipt printing with points earned and new balance

**Redemption at Checkout**: Members can redeem points during payment:
- View available balance
- Select redemption amount
- System validates redemption rules (minimums, maximums)
- Generate discount voucher if applicable
- Apply discount to transaction
- Deduct points from balance
- Print redemption confirmation on receipt

**Offline Mode Support**: POS maintains functionality even without internet:
- Queue member transactions for later sync
- Display last-known points balance
- Process transactions normally
- Sync points when connection restored
- Prevent redemption in offline mode (safety measure)

## E-Commerce Integration

For businesses with online channels, e-commerce integration extends membership benefits to digital storefronts.

{{< cards >}}
  {{< card link="/modules/cp-commerce" title="CP-Commerce Module" subtitle="Comprehensive e-commerce platform with built-in membership integration for online earning, redemption, and account management" >}}
{{< /cards >}}

### E-Commerce Membership Features

**CP-Commerce Module** provides full-featured membership integration for online stores:

**Member Account Portal**: Customers access membership features through online account:
- View points balance and transaction history
- Current tier status and progress
- Available rewards and redemption catalog
- Tier benefits and qualifications
- Upcoming points expiry
- Birthday reward status

**Online Earning**: Points earned automatically on e-commerce purchases:
- Same earning rates as in-store
- Tier multipliers applied
- Online-specific promotions
- Order-based bonuses
- Review and engagement points

**Online Redemption**: Full redemption capabilities in e-commerce checkout:
- Display points balance during checkout
- Slider to select redemption amount
- Real-time validation and limit checking
- Apply discount before shipping calculation
- Generate vouchers for future use
- Partial redemption support

**Omnichannel Consistency**: Unified experience across channels:
- Same member account online and in-store
- Unified points balance
- Consistent tier benefits
- Cross-channel transaction history
- Single enrollment and profile

**Mobile App Integration**: If using CP-Commerce with mobile app:
- Digital member card with QR code
- Push notifications for points earned
- Mobile-exclusive earning opportunities
- App-based redemption
- Real-time balance updates

## Voucher and Gift Management

Membership programs often generate vouchers as part of redemption or rewards.

**Note**: While there isn't a dedicated "Voucher Maintenance Applet" visible in the current system, voucher functionality is typically built into the Membership Admin Console and POS Terminal Applets. Vouchers are generated through:

- Points redemption (converting points to vouchers)
- Automatic rewards (birthday vouchers, tier benefits)
- Promotional campaigns (bonus vouchers)
- Gift voucher sales linked to membership

Vouchers integrate with membership through:
- Member account tracking of issued vouchers
- Expiry date management
- Usage tracking and validation
- Restriction enforcement (member-only, category-specific)
- Balance tracking for partial-use vouchers

## Implementation Considerations

### Applet Deployment Sequence

When implementing a membership program, deploy applets in this recommended order:

**Phase 1: Foundation (Week 1-2)**
1. Customer Maintenance Applet - ensure customer data is clean and complete
2. Membership Admin Console Applet - configure program structure
3. Membership Program Applet - define program rules
4. Membership Points Currency Applet - set up currencies

**Phase 2: Product Integration (Week 3-4)**
5. Doc Item Maintenance Applet - configure reward catalog products
6. Pricebook Applet - set up tier pricing if applicable

**Phase 3: Channel Integration (Week 5-6)**
7. POS Terminal Applet - integrate at checkout points
8. CP-Commerce Module - enable online earning and redemption
9. Mobile App - if applicable

**Phase 4: Testing and Launch (Week 7-8)**
- End-to-end testing across all channels
- Staff training on all applets
- Soft launch with pilot group
- Full rollout

### Data Flow Between Applets

Understanding data flow is crucial for troubleshooting and optimization:

```
Customer Maintenance ──→ Membership Program
        │                        │
        │                        ↓
        │              Points Currency Configuration
        │                        │
        ↓                        ↓
    POS Terminal ←──────────────┤
        │                        │
        ↓                        ↓
Transaction Processing    Points Posting
        │                        │
        └────→ Balance Update ←──┘
```

**Enrollment Flow**:
1. Customer record created/updated (Customer Maintenance)
2. Membership enrollment triggered (Membership Program)
3. Initial points or welcome bonus (Points Currency)
4. Confirmation and card generation (Membership Admin Console)

**Purchase Flow**:
1. Member identified at POS (POS Terminal)
2. Product prices retrieved (Pricebook - tier pricing if applicable)
3. Transaction processed (POS Terminal)
4. Points calculated (Membership Points Currency rules)
5. Points posted to account (Membership Admin Console)
6. Balance updated (real-time or batch)

**Redemption Flow**:
1. Member requests redemption (POS/E-Commerce)
2. Balance validated (Membership Admin Console)
3. Redemption rules checked (Points Currency)
4. Voucher generated or discount applied
5. Points deducted
6. Transaction completed

### Cross-Module Integration Points

Membership functionality spans multiple BigLedger modules:

**Core Module Integration**:
- Customer Maintenance Applet (customer master data)
- Organization Applet (multi-location membership management)
- Employee Maintenance Applet (staff access and permissions)

**Sales & CRM Integration**:
- Sales Order processing with member pricing
- Quotations with tier-specific pricing
- Customer analytics with membership segmentation

**Financial Accounting Integration**:
- Points liability tracking
- Revenue recognition for point redemptions
- Financial reporting of program costs
- Voucher liability management

**E-Commerce Integration**:
- Online member enrollment
- Web-based redemption
- Digital member cards
- Online account management

**POS Integration**:
- In-store member identification
- Checkout earning and redemption
- Receipt printing with points
- Offline transaction queuing

### Best Practices for Multi-Applet Management

**Centralized Configuration**: Use Membership Admin Console as single source of truth for all membership rules and configurations.

**Regular Synchronization**: Ensure customer data syncs regularly between Customer Maintenance and Membership systems, especially for:
- Contact information updates
- Birthday changes
- Communication preferences
- Address updates

**Consistent Testing**: When making configuration changes, test across all integrated applets:
- POS transactions
- E-commerce purchases
- Mobile app functionality
- Admin console reporting

**Staff Training**: Ensure staff understand the relationship between applets:
- Which applet to use for which task
- How changes in one applet affect others
- Troubleshooting integration issues
- Escalation paths for technical problems

**Performance Monitoring**: Track integration performance metrics:
- POS transaction speed with member lookup
- Points posting latency
- E-commerce checkout performance
- Mobile app sync speed
- Report generation time

## Related Resources

For detailed configuration and usage of each applet, refer to the individual applet documentation:

- [Membership Admin Console User Guide](/applets/membership-admin-console-applet)
- [Customer Maintenance Configuration](/applets/customer-maintenance-applet)
- [POS Terminal Setup Guide](/applets/pos-terminal-applet)
- [Pricebook Configuration](/applets/pricebook-applet)
- [CP-Commerce Module Overview](/modules/cp-commerce)

For implementation guidance and best practices, see:
- [Program Design Best Practices](/modules/membership/best-practices/program-design)
- [Data Management Best Practices](/modules/membership/best-practices/data-management)
- [Security and Compliance](/modules/membership/best-practices/security-compliance)
- [Troubleshooting Guide](/modules/membership/best-practices/troubleshooting)

{{< callout type="tip" >}}
**Integration Tip**: When implementing membership programs, start with solid customer data in the Customer Maintenance Applet. Clean, complete customer records are the foundation for successful membership programs. Invest time upfront in data quality to avoid issues downstream.
{{< /callout >}}
