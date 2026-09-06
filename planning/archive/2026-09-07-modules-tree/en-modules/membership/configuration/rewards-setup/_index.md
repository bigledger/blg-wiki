---
title: "Rewards Setup"
description: "Configuring pricing schemes, pricebooks, and voucher rewards for member benefits"
weight: 30
bookCollapseSection: false
---

Rewards Setup defines what benefits and special pricing members receive through your loyalty program. This section covers configuring member-specific pricing schemes, creating pricebooks that control reward access, and implementing voucher-based rewards as alternatives to immediate discounts.

## What You'll Configure

**Pricing Scheme Rewards** use BigLedger's pricing scheme functionality in Doc Item Maintenance to create special member prices. These schemes define discounted or exclusive pricing that applies automatically when members transact.

**Pricebook Configuration** determines which members can access which pricing schemes. Pricebooks act as catalogs that reference pricing schemes and control member eligibility based on member class, labels, or other criteria.

**Voucher Rewards** provide an alternative to immediate pricing discounts. Vouchers are issued to members and can be redeemed during future transactions, supporting promotional campaigns and deferred benefits.

## How Rewards Work in BigLedger

The rewards system follows a three-layer architecture:

**Layer 1: Pricing Schemes (FI-ITEM)** define the actual special prices in Doc Item Maintenance. A pricing scheme specifies that Item ABC sells for $19.99 instead of the standard $29.99, or that members receive a 15% discount off regular price.

**Layer 2: Pricebooks** reference these pricing schemes and control who can access them. A pricebook might say "Gold members can access the Gold-Pricing scheme" or "Members with the VIP label can access Exclusive-Pricing scheme."

**Layer 3: Member Assignment** links members to pricebooks through their member class or labels. When a Gold member transacts, the system checks which pricebooks they can access, finds the relevant pricing schemes, and applies the special pricing.

This layered architecture provides flexibility to create sophisticated reward structures while maintaining clean separation between price definition, eligibility rules, and member attributes.

## Rewards vs. Points Redemption

Your program can offer benefits through both reward pricing and point redemption:

**Reward Pricing Benefits:**
- Automatic discounts or special prices for members
- No point deduction required
- Applied based on member status (class or labels)
- Encourages membership for access to ongoing benefits
- Creates tier differentiation when different classes get different pricing

**Point Redemption Benefits:**
- Members spend accumulated points for rewards
- Points are deducted from balance
- Available to any member with sufficient points
- Encourages earning behavior to accumulate points
- Provides flexible value application

Many programs offer both: members enjoy special pricing as a membership benefit while also accumulating points they can redeem for additional rewards. These approaches complement rather than replace each other.

## Configuration Sequence

Follow this recommended order for rewards setup:

1. **Configure Pricing Schemes** in Doc Item Maintenance for items you want to offer as member rewards
2. **Create Pricebooks** that reference these pricing schemes and define member eligibility
3. **Verify Member Assignments** ensure members have the classes or labels that qualify them for pricebooks
4. **Configure Voucher Rewards (Optional)** if using voucher-based benefits

This sequence ensures that pricing exists before pricebooks reference it, and that eligibility criteria (classes/labels) are established before pricebooks use them for member selection.

## Pricing Schemes vs. Pricebooks

Understanding the distinction is critical:

**Pricing Schemes (FI-ITEM):**
- Define WHAT the special price is
- Configured in Doc Item Maintenance module
- Specify actual prices or discount percentages
- Apply to specific items or item categories
- Are referenced by pricebooks

**Pricebooks:**
- Define WHO can access pricing schemes
- Configured in Membership module
- Control member eligibility by class, label, or other attributes
- Reference one or more pricing schemes
- Determine when pricing is available (effective dates)

**Example Relationship:**
- Pricing Scheme "Gold-Discount": 10% off regular price for electronics category
- Pricebook "Gold-Member-Benefits": References "Gold-Discount" scheme, available to member class "Gold"
- Result: Gold members automatically receive 10% off electronics when they purchase

## Integration with Other Modules

Rewards configuration integrates across BigLedger:

**Doc Item Maintenance (FI-ITEM)** is where pricing schemes are created. This is part of the item master data configuration, not the membership module. You'll configure item pricing, then reference it from membership pricebooks.

**Sales & CRM** uses pricebooks during transaction processing. When a sale occurs, the system checks the customer's memberships, determines eligible pricebooks, and applies the best available pricing automatically.

**POS Systems** leverage pricebook pricing at checkout. When a member is identified at the POS terminal, the system automatically applies member pricing without cashier intervention.

**E-Commerce** can display member-specific pricing when customers log in as members. Product pages show special prices available to the logged-in member based on their pricebook eligibility.

## Reward Design Considerations

Design rewards that support your program objectives:

**Tier Differentiation.** Use different pricing schemes and pricebooks for different member classes to create clear tier value. Gold members get 15% off, Silver get 10% off, Bronze get 5% off.

**Category Targeting.** Apply member pricing to specific product categories to drive behavior. Offer member discounts on high-margin items or categories you want to promote.

**Exclusivity.** Some rewards can be exclusive to members—not just discounted pricing but access to limited items. "Members-Only" products available only through member pricing schemes.

**Margin Management.** Configure member pricing to preserve acceptable margins. Not all items need member pricing—focus on items where discounts drive volume without eroding profitability.

**Simplicity.** Especially at launch, start with simple reward structures. Overly complex pricing schemes and pricebook rules confuse both members and staff.

**Value Perception.** Ensure member pricing provides meaningful value. If member discounts are 2-3% while competitors offer 10%, members won't perceive value.

## Testing Rewards Configuration

Before launching rewards to members:

**Test Pricing Scheme Application.** Create test items with member pricing schemes. Process test transactions to verify pricing applies correctly.

**Test Pricebook Eligibility.** Create test members in different classes with different labels. Verify each sees the pricing appropriate to their profile.

**Test Transaction Processing.** Process various transaction scenarios:
- Member eligible for single pricebook
- Member eligible for multiple pricebooks (verify best price applies)
- Member not eligible for any pricebooks (regular pricing applies)
- Mix of items with and without member pricing

**Test POS Integration.** If using POS systems, test that:
- Member lookup succeeds
- Special pricing displays correctly
- Pricing applies automatically at checkout
- Receipts show member pricing clearly

**Test E-Commerce Display.** For online programs:
- Members see special pricing when logged in
- Non-members see regular pricing
- Pricing updates dynamically based on login status

**Verify Accounting Impact.** Review transaction accounting:
- Sales revenue recognized correctly
- Member discounts recorded appropriately
- Margin calculations reflect member pricing

## Communication and Promotion

Members need to know about reward benefits:

**Enrollment Communications.** Explain reward benefits during enrollment:
- "As a Silver member, you'll save 10% on all electronics"
- "Gold members enjoy exclusive pricing on premium items"
- Set expectations for what benefits membership provides

**Ongoing Reminders.** Regularly remind members of available rewards:
- Email campaigns highlighting member pricing on featured products
- In-app notifications about exclusive member items
- POS displays showing member savings during checkout

**Tier Progression Messaging.** When members advance tiers:
- "Congratulations on reaching Gold! You now receive 15% off instead of 10%"
- Highlight improved benefits as motivation for tier achievement

**Redemption Guidance.** Help members understand how to access rewards:
- "Your member pricing applies automatically at checkout"
- "Log in online to see your special member prices"
- "Show your member card at POS for instant savings"

## Explore This Section

The Rewards Setup subsection contains detailed guides for each configuration area:

- **Pricing Scheme Rewards** - Creating member pricing in Doc Item Maintenance
- **Pricebook Configuration** - Setting up pricebooks for member reward access
- **Voucher Rewards** - Implementing voucher-based benefits as reward alternatives

Work through these topics in sequence for initial setup, or reference specific guides when expanding your rewards offering.
