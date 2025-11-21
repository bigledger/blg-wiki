---
title: "Configuration"
description: "Complete guide to configuring the Membership Module including member setup, points systems, and rewards programs"
weight: 30
bookCollapseSection: false
---

The Configuration section provides comprehensive guidance for setting up and managing all aspects of the Membership Module. This is where you establish the foundation of your membership program, including member profiles, points currencies, conversion rules, and reward structures.

## Configuration Overview

Configuring the Membership Module involves three main areas that work together to create a complete loyalty program:

**Member Setup** establishes who your members are and how they're organized. This includes creating individual member records, defining member classes for tier-based programs, applying labels for segmentation, and importing large member databases efficiently.

**Points Setup** defines your virtual currency systems and how points flow through your ecosystem. You'll configure point currencies, establish conversion rates between different point types, set up cash redemption rules for POS transactions, and implement expiry policies to maintain program health.

**Rewards Setup** determines what benefits members receive and how they access them. This involves configuring special pricing schemes, setting up pricebooks for member-exclusive offers, and implementing voucher-based rewards as alternatives to immediate discounts.

## Configuration Workflow

The recommended workflow for configuring a new membership program follows a logical sequence:

**Phase 1: Foundation** begins with creating your member classes and labels. These organizational structures should be established before you create individual members, as they determine what options are available during member creation. Define your tier structure, segmentation strategy, and any class-specific benefits during this phase.

**Phase 2: Member Records** involves creating or importing your member database. For small programs, manual creation through the interface works well. For larger programs with hundreds or thousands of members, use the bulk import functionality to load member data from CSV files. During creation, you'll link members to existing customer records and assign them to the appropriate classes and labels.

**Phase 3: Points System** establishes your virtual currency ecosystem. Create point currencies first, then configure conversion rates between them. Set up cash conversion rules for POS redemption, and finally implement expiry rules to manage point liability. Each step builds on the previous configuration.

**Phase 4: Rewards Structure** defines what members can access. Configure pricing schemes in Doc Item Maintenance to enable member-specific pricing, set up pricebooks that reference these schemes, and optionally configure voucher-based rewards for promotional campaigns. This phase connects your membership program to your product catalog.

**Phase 5: Testing and Refinement** validates your configuration before launching to all members. Create test members in different classes, simulate point earning and redemption scenarios, verify that rewards appear correctly in transactions, and confirm that expiry rules behave as expected. Make adjustments based on test results.

## Configuration Dependencies

Understanding configuration dependencies helps you avoid errors and rework:

Member classes must exist before you can assign members to them. While you can create members without classes, tier-based programs require class definitions first.

Point currencies must be configured before you can set up conversion rates or expiry rules. The currency defines what you're converting or expiring.

Pricing schemes must be configured in Doc Item Maintenance before you can reference them in pricebooks. The scheme defines the special price; the pricebook controls who sees it.

Member records must be linked to customer records. If you're importing members, ensure the corresponding customer records exist in BigLedger first, or plan to create them as part of the import process.

## Configuration Best Practices

**Start Simple, Then Expand.** Begin with a basic configuration—one member class, one point currency, a few reward items. Test this simple setup thoroughly, then add complexity gradually. This approach makes troubleshooting easier and helps users understand the system incrementally.

**Document Your Decisions.** Record why you configured things in a particular way. Document your tier criteria, point expiry rationale, and reward selection logic. This documentation becomes invaluable when training new staff or reviewing program performance.

**Plan for Scale.** Even if you're starting with a small program, configure in a way that supports growth. Use member labels for segmentation rather than creating multiple classes. Design point currencies that can handle future conversion scenarios. Structure pricebooks to accommodate expanding product lines.

**Consider User Experience.** Configure with your members in mind. Choose point currency names that members will understand. Set conversion rates that make redemption calculations simple. Create pricebooks that highlight genuinely valuable rewards.

**Maintain Data Hygiene.** Establish processes for keeping member data current. Plan how you'll update member classes as customers qualify for new tiers. Define how you'll remove inactive labels. Schedule regular reviews of expired points and obsolete pricebook entries.

## Multi-Membership Considerations

BigLedger supports multiple memberships per customer, which adds flexibility but also complexity:

**Separate Contexts.** Each membership operates independently with its own point balances, tier status, and reward eligibility. A customer might be a Gold member in your retail program and a Silver member in your wholesale program, with different points and benefits in each.

**Clear Communication.** When a customer has multiple memberships, ensure your staff understands which membership applies in each transaction context. POS systems should prompt for membership selection if multiple memberships are eligible.

**Consistent Configuration.** If you're using multiple membership programs, maintain configuration consistency where appropriate. Use similar naming conventions, comparable tier structures, and aligned point values to reduce confusion.

## Integration Points

The Membership Module configuration integrates with several other BigLedger modules:

**Sales & CRM** provides the customer records that members link to. Customer master data flows into member records, keeping contact information synchronized.

**Financial Accounting** receives point liability transactions when points are issued and redeemed. Your point currency configuration affects how these transactions are valued.

**POS Systems** use your points setup and rewards configuration during checkout. Point redemption rates and member pricing schemes must be configured before they'll work at the point of sale.

**E-Commerce** can display member-specific pricing based on your pricebook configuration. Ensure pricebook effective dates align with your online promotion calendar.

## Getting Started

The subsections in this Configuration guide follow the recommended workflow sequence:

**Member Setup** covers creating and organizing member records, including bulk import for large-scale programs.

**Points Setup** explains configuring point currencies, conversion rates, cash redemption, and expiry rules.

**Rewards Setup** details pricing schemes, pricebooks, and voucher-based rewards.

Work through these subsections in order for the smoothest configuration experience, or jump to specific topics as needed for program modifications.
