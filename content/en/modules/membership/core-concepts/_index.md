---
title: "Core Concepts"
description: "Fundamental principles and architectural design of BigLedger's Membership Module"
weight: 20
---

Understanding the core concepts of BigLedger's Membership Module is essential for designing effective loyalty programs and making full use of the system's capabilities. This section explains the fundamental architectural principles, key terminology, and design patterns that differentiate BigLedger's approach from traditional loyalty systems.

## Architectural Overview

The Membership Module is built on a flexible, multi-dimensional architecture that supports complex business requirements while maintaining operational simplicity. The design philosophy centers on three core principles:

1. **Separation of customer identity from membership participation**
2. **Multiple concurrent currency systems for flexible reward economics**
3. **Configurable rule engines for earning, expiry, and redemption**

This architecture enables businesses to model real-world loyalty scenarios that go beyond simple "earn and burn" programs.

## The Multi-Dimensional Model

Traditional loyalty systems often create a one-to-one relationship between customers and memberships, with a single points currency and linear tier progression. BigLedger's Membership Module breaks this constraint through a multi-dimensional design:

### Customer Layer

The customer represents the business relationship and transaction history. Customers exist independently of membership programs and maintain their transactional data regardless of program participation.

### Membership Layer

Memberships are participation records in specific programs. A single customer can hold multiple memberships simultaneously, each with its own:
- Points balances across multiple currencies
- Tier status and progression tracking
- Earning and redemption history
- Expiry schedules and lifecycle management

### Program Layer

Programs define the business rules and economic model:
- Which points currencies are active
- How members earn and redeem points
- Tier progression criteria and benefits
- Expiry policies and exclusions

This layered approach provides unprecedented flexibility for complex loyalty ecosystems.

## Key Terminology

Understanding these terms is crucial for working effectively with the Membership Module:

### Customer vs Member

**Customer**: An entity in the BigLedger system with transactional history, contact information, and business relationship data. Customers exist independently of membership programs.

**Member**: A customer's participation record in a specific membership program. One customer can be a member of multiple programs simultaneously.

**Example**: Jane Smith is a *customer* with transaction history dating back three years. She holds two *memberships*: a standard loyalty membership and a premium subscription membership.

### Member Class vs Member Label

**Member Class**: The tier or classification within a membership program that determines benefits, pricing, and earning rates. Member classes typically form a hierarchy (Bronze, Silver, Gold, Platinum).

**Member Label**: A flexible tagging system for segmentation and targeting that operates independently of member classes. Labels can represent any business logic (VIP, Seasonal Shopper, Partner Employee, Early Adopter).

**Example**: A member's *class* might be "Gold" based on annual spending, while their *labels* include "VIP" and "Seasonal Shopper" based on purchasing patterns.

### Points Currency vs Points Balance

**Points Currency**: A configured unit of value within the loyalty ecosystem. Multiple currencies can exist simultaneously (Loyalty Points, Bonus Points, Partner Points).

**Points Balance**: The actual quantity of a specific points currency that a member holds at any given time. Each membership maintains separate balances for each active currency.

**Example**: The program defines three *points currencies*: Standard Points, Bonus Points, and Gift Points. A member's *points balances* might be 5,000 Standard Points, 1,200 Bonus Points, and 500 Gift Points.

### Earning vs Redemption

**Earning**: The process by which members accumulate points through qualifying activities (purchases, referrals, engagement actions). Earning rules define conversion rates and qualifying criteria.

**Redemption**: The process by which members exchange points for value (discounts, products, services, cash). Redemption can occur through three distinct mechanisms in BigLedger.

### Expiry vs Forfeiture

**Expiry**: Automated removal of points based on time-based rules (e.g., points expire 12 months after earning). Expiry rules can be complex with multiple conditions and exclusions.

**Forfeiture**: Manual or rule-based removal of points due to policy violations, account termination, or administrative actions. Forfeiture is an operational action rather than an automated lifecycle event.

## Core Design Patterns

### One-to-Many Customer-Membership Relationship

The ability for one customer to hold multiple memberships is a fundamental architectural feature. This pattern enables:

- Concurrent participation in multiple programs
- Different benefit structures for different business units
- Segmented loyalty strategies without customer account duplication
- Partner program integration with distinct memberships

**Business Scenario**: A retail group operates three brands (Fashion, Electronics, Home Goods). A customer can be a member of all three programs, each with independent points balances, tiers, and benefits, while maintaining a single customer identity for consolidated analytics.

### Multi-Currency Points Economy

Multiple points currencies within a single program or across related programs create flexible reward economics. This pattern supports:

- Base currency for standard transactions
- Bonus currency for promotions with different expiry rules
- Partner currencies with conversion mechanics
- Gift currencies that can be transferred between members

**Business Scenario**: A airline loyalty program uses Base Miles (never expire), Bonus Miles (expire annually), and Partner Miles (earned from hotel stays, convertible 3:1 to Base Miles).

### Three-Path Redemption Model

BigLedger provides three distinct redemption mechanisms, each suited to different business needs:

1. **Pricing Scheme / FI-ITEM Method**: Member-specific pricing at the item level, managed through Doc Item Maintenance Applet
2. **Pricebook Method**: Tier-based pricing structures for entire product catalogs
3. **Voucher Method**: Points-funded vouchers for flexible redemption

**Business Scenario**: A coffee shop chain uses FI-ITEM pricing for member discounts on all beverages, Pricebook pricing for tier-specific food menu access, and Vouchers for birthday rewards and special promotions.

### Configurable Expiry Engine

Points expiry is not a single date calculation but a rule engine supporting multiple concurrent policies. This pattern enables:

- Fixed-term expiry from earning date
- Rolling expiry with activity-based extension
- Calendar-based expiry (end of year, end of quarter)
- Tiered expiry (premium members have longer validity)
- Selective currency expiry (base points never expire, bonus points do)

**Business Scenario**: A bank's credit card rewards program sets standard points to expire 36 months after earning, but automatically extends expiry by 12 months whenever the member uses the card, and grants lifetime validity to platinum tier members.

## Integration Architecture

The Membership Module does not operate in isolation but integrates deeply with other BigLedger components:

### Transactional Integration

Sales transactions automatically trigger points earning calculations based on configured rules. The integration captures:
- Transaction value and qualifying items
- Member tier at time of transaction
- Applicable promotions and bonus earning rules
- Real-time balance updates

### Financial Integration

Points balances represent a financial liability that must be tracked for accurate financial reporting. The integration ensures:
- Points liability accounts updated in real-time
- Redemption events recorded as expense or contra-revenue
- Breakage recognition for expired points
- Comprehensive audit trails

### Customer Data Integration

Membership data enriches customer profiles with behavioral and engagement metrics:
- Lifetime points earned and redeemed
- Current tier status and progression tracking
- Program engagement scores
- Predictive churn indicators

## Data Model Fundamentals

Understanding the underlying data relationships helps in configuring effective programs:

### Entity Relationships

```
Customer (1) ─── (Many) Memberships
Membership (1) ─── (Many) Points Balances
Membership (1) ─── (Many) Transaction History
Member Class (1) ─── (Many) Memberships
Points Currency (1) ─── (Many) Points Balances
```

### Key Tables and Their Purpose

**Customer Master**: Core customer identity and contact information

**Membership Records**: Links customers to programs with status and dates

**Member Class Configuration**: Defines tiers, progression rules, and benefits

**Points Currency Configuration**: Defines currency types and conversion rules

**Points Balances**: Current balance by member and currency

**Points Transactions**: Complete audit trail of earning and redemption

**Expiry Schedules**: Pending expiry events for each points lot

## Program Design Considerations

When architecting a membership program in BigLedger, consider these strategic questions:

### Membership Structure

- Will customers participate in one program or multiple concurrent programs?
- Should different business units have separate memberships or a unified program?
- How will member data be shared or isolated across programs?

### Points Economics

- How many points currencies are needed to model your reward economics?
- What are the earning ratios and redemption values for each currency?
- Do different currencies serve different business objectives?
- Are currency conversions needed for partner integration?

### Tier Strategy

- What criteria determine tier progression (spending, points, tenure)?
- Should tier status be recalculated continuously or at scheduled intervals?
- What benefits differentiate each tier?
- How do you prevent tier regression from demotivating customers?

### Expiry Policies

- What expiry rules balance engagement incentives with liability management?
- Should expiry vary by currency type or member tier?
- Are there exclusions or extensions for certain member segments?
- How will you communicate expiry to minimize negative customer impact?

### Redemption Strategy

- Which redemption mechanism (FI-ITEM, Pricebook, Voucher) best serves your business model?
- Should redemption be transactional (at checkout) or voucher-based (separate redemption step)?
- What mix of discount percentage vs fixed value works best for your margins?
- How do you ensure redemption options are valuable and attainable?

## Next Steps

With these core concepts understood, you can dive deeper into specific aspects of the Membership Module:

- **[Customer-Membership Relationship](customer-membership-relationship/)**: Explore the one-to-many relationship and its use cases
- **[Points Currencies](points-currencies/)**: Learn about multi-currency systems and conversion mechanics
- **[Membership Tiers](membership-tiers/)**: Understand tier structures, progression, and segmentation
- **[Points Expiry](points-expiry/)**: Master expiry configuration and liability management
- **[Reward Types](reward-types/)**: Compare the three redemption mechanisms and choose the right approach

Each of these topics builds on the foundational concepts introduced here, providing the practical knowledge needed to design and implement sophisticated loyalty programs in BigLedger.
