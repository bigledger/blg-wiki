---
title: "Reward Types and Redemption Mechanisms"
description: "Three reward mechanisms in BigLedger - Pricing Schemes, Pricebooks, and Vouchers"
weight: 25
---

BigLedger's Membership Module provides three distinct redemption mechanisms for rewarding members: Pricing Schemes (via FI-ITEM), Pricebooks, and Vouchers. Understanding when and how to use each mechanism is essential for designing effective loyalty programs. Each approach serves different business needs, offers unique capabilities, and integrates with different applets in the BigLedger ecosystem.

## Overview of the Three Mechanisms

### Quick Comparison

| Mechanism | Primary Use Case | Granularity | Integration Point | Best For |
|-----------|-----------------|-------------|-------------------|----------|
| **Pricing Scheme (FI-ITEM)** | Member-specific pricing | Individual item level | Doc Item Maintenance Applet | Personalized discounts, member-only pricing |
| **Pricebook** | Tier-based pricing | Product catalog level | Pricebook Applet | Tiered pricing strategies, wholesale clubs |
| **Voucher** | Points-funded rewards | Transaction level | Voucher Maintenance Applet | Gift cards, promotional rewards, flexible redemption |

### Strategic Positioning

**Pricing Scheme / FI-ITEM**: "This member gets this specific price on this specific item"

**Pricebook**: "This tier of members gets this pricing structure across product categories"

**Voucher**: "Members redeem points for vouchers with monetary value"

Each mechanism can be used independently, or all three can be combined in a sophisticated loyalty program.

## Mechanism 1: Pricing Scheme / FI-ITEM Method

### What is FI-ITEM Pricing?

The FI-ITEM (Financial Item) pricing method allows you to define member-specific or member-class-specific pricing at the individual product level. This is the most granular reward mechanism, enabling precise control over which members get which discounts on which products.

### How It Works

**Configuration via Doc Item Maintenance Applet**:

The [Doc Item Maintenance Applet](/applets/doc-item-maintenance-applet/) is where you configure member-specific pricing:

1. Select a product (Doc Item)
2. Define pricing rules for specific members or member classes
3. Set discount types (percentage or fixed amount)
4. Specify effective dates and quantity breaks

**Example Configuration**:
```
Product: Premium Widget (SKU: WIDGET-001)
Regular Price: $100

Member Class Pricing (FI-ITEM):
- Bronze Members: $95 (5% discount)
- Silver Members: $90 (10% discount)
- Gold Members: $85 (15% discount)
- Platinum Members: $80 (20% discount)

Specific Member Override:
- Member #LOY-12345 (VIP): $75 (25% discount - special relationship)
```

### Transaction Flow

**At Point of Sale**:
1. Member identified (scan card, login, phone number)
2. System retrieves member class or member ID
3. For each item in cart, system checks for FI-ITEM pricing rule
4. If rule exists, applies member-specific price
5. If no specific rule, falls back to member class price
6. If no member class price, uses regular retail price

**Receipt Example**:
```
Premium Widget
Regular Price: $100.00
Gold Member Discount: -$15.00
Your Price: $85.00 ✓

Standard Widget
Regular Price: $50.00
(No member discount on this item)
Your Price: $50.00

Total Savings Today: $15.00
```

### Use Cases

**Use Case 1: Category-Specific Member Benefits**

A grocery store chain wants to reward members with discounts on fresh produce but not on alcohol:

```
Fresh Produce (all SKUs):
- All members: 10% discount via FI-ITEM rules

Organic Products:
- Silver and above: 15% discount

Alcohol:
- No member discount (excluded from FI-ITEM configuration)
```

**Use Case 2: Member-Specific Relationship Pricing**

A B2B wholesale distributor has negotiated custom pricing with specific corporate accounts:

```
Product: Industrial Equipment (SKU: EQUIP-5000)
Regular Price: $10,000

Member-Specific FI-ITEM:
- Corporate Account ABC (Member #CORP-001): $8,500
- Corporate Account XYZ (Member #CORP-002): $9,000
- All other Gold Members: $9,500

Each corporate customer has unique pricing based on volume commitment
```

**Use Case 3: Promotional Pricing for Member Classes**

A fashion retailer runs a member-exclusive preview sale before public launch:

```
New Collection Launch (Sept 1)

FI-ITEM Pricing (Aug 25-31 - Member Preview):
- Gold Members: 20% off (Preview access)
- Silver Members: 15% off (Preview access)
- Bronze Members: 10% off (Preview access)

Regular Public Sale (Sept 1+):
- Everyone: 10% off
```

### Advantages

**Precision Control**: Exact pricing for specific items and specific members

**Flexibility**: Can override class-based pricing with individual member pricing

**Margin Protection**: Choose which items get discounts, protecting low-margin products

**Relationship Pricing**: Support negotiated pricing for B2B or VIP customers

**Category Exclusions**: Easily exclude categories (alcohol, tobacco, gift cards) from discounts

### Limitations

**Configuration Overhead**: Requires setup per product or product category

**Maintenance Complexity**: Changes require updating FI-ITEM rules

**Communication Challenge**: Members may not know which items have member pricing until checkout

**System Performance**: Large product catalogs with many member classes require careful indexing

### Integration Details

**Applet Integration**:
- **[Doc Item Maintenance Applet](/applets/doc-item-maintenance-applet/)**: Configure FI-ITEM pricing rules
- **Sales Module**: Automatic price lookup at transaction time
- **POS Module**: Real-time member price display
- **E-Commerce Module**: Member pricing shown after login

**Data Structure**:
```
FI-ITEM Table:
- Item ID (product SKU)
- Member ID (specific member) OR Member Class ID (tier)
- Price Type (fixed price, percentage discount, fixed discount)
- Price Value
- Effective Date Range
- Minimum Quantity
- Maximum Quantity
```

## Mechanism 2: Pricebook Method

### What is a Pricebook?

A Pricebook is a comprehensive pricing structure that defines prices for entire product catalogs based on customer type, member tier, or sales channel. Instead of per-item configuration, Pricebooks provide systematic pricing rules across products.

### How It Works

**Configuration via Pricebook Applet**:

The Pricebook Applet allows you to create multiple pricing structures:

1. Create named Pricebooks (e.g., "Retail Pricebook", "Member Pricebook", "Gold Tier Pricebook")
2. Define pricing rules that apply to product categories or entire catalogs
3. Assign Pricebooks to member classes or channels
4. System automatically uses appropriate Pricebook based on customer context

**Example Configuration**:
```
Pricebooks Defined:

1. Standard Retail Pricebook (Default)
   - All products at regular retail price
   - Used for: Non-members, general public

2. Member Pricebook
   - 5% off all products (except exclusions)
   - Used for: Bronze and Silver members

3. Premium Member Pricebook
   - 10% off all products (except exclusions)
   - 15% off premium product line
   - Used for: Gold members

4. VIP Pricebook
   - 15% off all products (except exclusions)
   - 20% off premium product line
   - Wholesale pricing on bulk items
   - Used for: Platinum members
```

### Transaction Flow

**At Point of Sale**:
1. Member identified and tier determined
2. System selects appropriate Pricebook based on member class
3. All items priced according to selected Pricebook
4. Single Pricebook applies to entire transaction
5. Discount applied systematically without per-item configuration

**Receipt Example**:
```
Shopping as: Gold Member (Premium Member Pricebook Applied)

Widget A: $90.00 (Regular: $100, saved $10)
Widget B: $45.00 (Regular: $50, saved $5)
Premium Item: $85.00 (Regular: $100, saved $15 - Premium discount)

Your Total Savings: $30.00
Gold Member Benefits Applied
```

### Use Cases

**Use Case 1: Wholesale Club Membership Model**

A warehouse club charges annual membership fee and provides member-only pricing:

```
Pricebook Structure:

Public Pricebook (Non-Members):
- Cannot shop (membership required)
- OR: Regular retail prices (30% markup to incentivize membership)

Member Pricebook:
- Wholesale pricing (cost + 15% margin)
- All products
- Exclusions: Gift cards, alcohol (regulated)

Business Member Pricebook:
- Wholesale pricing (cost + 10% margin)
- Bulk quantity discounts
- Extended payment terms
```

**Use Case 2: Tiered SaaS Pricing**

A software company offers different pricing based on subscription tier:

```
Pricebook Structure:

Starter Pricebook:
- Add-on Feature A: $29/month
- Add-on Feature B: $49/month
- Professional Services: $150/hour

Professional Pricebook:
- Add-on Feature A: $19/month (33% off)
- Add-on Feature B: $39/month (20% off)
- Professional Services: $120/hour (20% off)

Enterprise Pricebook:
- Add-on Features: Included (100% off)
- Professional Services: $100/hour (33% off)
- Dedicated Support: Included
```

**Use Case 3: Multi-Channel Retail**

A retailer operates multiple sales channels with different pricing:

```
Pricebook Structure:

Retail Store Pricebook:
- Full retail pricing
- Local market adjustments

E-Commerce Pricebook:
- 5% lower (no store overhead)
- Free shipping threshold pricing

B2B Wholesale Pricebook:
- 30% off retail
- Minimum order quantities
- Net 30 payment terms

Partner Pricebook:
- 40% off retail (reseller margin)
- Special partner products access
```

### Advantages

**Systematic Pricing**: Apply pricing structure across entire catalog automatically

**Easy Management**: Change one Pricebook to update pricing for entire tier

**Consistency**: Ensures all products follow same pricing logic for a tier

**Scalability**: Works efficiently for large product catalogs

**Channel Flexibility**: Different Pricebooks for retail, online, B2B, etc.

### Limitations

**Less Granularity**: Cannot easily vary discount by individual product

**Override Complexity**: Exceptions to Pricebook rules require additional configuration

**Communication**: Members need to understand tier-based pricing structure

**Testing**: Changes to Pricebook affect all members in that tier simultaneously

### Integration Details

**Applet Integration**:
- **Pricebook Applet**: Create and manage Pricebooks
- **Sales Module**: Pricebook selection based on customer type
- **Member Management**: Assign Pricebooks to member classes
- **E-Commerce Module**: Display member-appropriate prices after login

**Data Structure**:
```
Pricebook Table:
- Pricebook ID
- Pricebook Name
- Description
- Effective Date Range
- Status (Active/Inactive)

Pricebook Rules:
- Pricebook ID
- Product Category (or All Products)
- Price Adjustment Type (percentage, fixed amount)
- Adjustment Value
- Exclusion Rules

Member Class Assignment:
- Member Class ID
- Pricebook ID
- Priority (if multiple Pricebooks could apply)
```

## Mechanism 3: Voucher Method

### What is a Voucher?

A Voucher is a points-funded redemption instrument that provides monetary value applicable to future purchases. Members redeem points to purchase vouchers, which are then applied at checkout like gift cards or discount codes.

### How It Works

**Configuration via Voucher Maintenance Applet**:

The Voucher Maintenance Applet enables voucher creation and management:

1. Define voucher types (gift card, discount voucher, experience voucher)
2. Set points redemption cost
3. Configure voucher monetary value
4. Define usage rules (validity period, category restrictions, minimum purchase)
5. Members redeem points to receive voucher code

**Example Configuration**:
```
Voucher Catalog:

$10 Gift Voucher:
- Cost: 1,000 Loyalty Points
- Value: $10.00
- Validity: 90 days from issue
- Usage: Any product, any time
- Minimum Purchase: None

$25 Birthday Voucher:
- Cost: FREE (birthday reward)
- Value: $25.00
- Validity: Birthday month only
- Usage: Any product
- Minimum Purchase: $50

$50 Premium Voucher:
- Cost: 4,500 Loyalty Points (10% bonus value)
- Value: $50.00
- Validity: 180 days
- Usage: Any product
- Minimum Purchase: None

Exclusive Experience Voucher:
- Cost: 50,000 Loyalty Points
- Value: VIP Concert Tickets
- Validity: Event date
- Usage: Non-transferable
- Limit: One per member
```

### Transaction Flow

**Voucher Redemption Process**:

**Step 1 - Member Redeems Points for Voucher**:
```
Member: Sarah Johnson
Points Balance: 5,000 Loyalty Points

Action: Redeem 1,000 points for $10 Gift Voucher

Result:
- Points Balance: 4,000 Loyalty Points (-1,000)
- Voucher Issued: CODE-ABC123 ($10 value, expires Feb 28, 2025)
- Delivery: Email + SMS with voucher code
```

**Step 2 - Member Uses Voucher at Checkout**:
```
Shopping Cart:
Item A: $30.00
Item B: $25.00
Subtotal: $55.00

Apply Voucher: CODE-ABC123
Voucher Discount: -$10.00

Total: $45.00
```

### Use Cases

**Use Case 1: Flexible Points Redemption**

A retail loyalty program offers vouchers as primary redemption:

```
Voucher Redemption Tiers:

$5 Voucher: 500 points (1:100 ratio)
$10 Voucher: 1,000 points (1:100 ratio)
$25 Voucher: 2,400 points (1:96 ratio - 4% bonus)
$50 Voucher: 4,500 points (1:90 ratio - 10% bonus)
$100 Voucher: 8,500 points (1:85 ratio - 15% bonus)

Strategy: Larger vouchers offer better value, encouraging points accumulation
```

**Use Case 2: Birthday and Anniversary Rewards**

Automated voucher issuance for special occasions:

```
Birthday Month:
- Automatic: $25 Birthday Voucher (no points cost)
- Valid: Entire birthday month
- Minimum: $50 purchase
- Personalized message included

Membership Anniversary:
- Year 1: $10 voucher
- Year 2: $15 voucher
- Year 3: $20 voucher
- Year 5+: $50 voucher
```

**Use Case 3: Partner Network Integration**

Vouchers redeemable across partner ecosystem:

```
Loyalty Points → Partner Vouchers:

Restaurant Vouchers:
- $25 Dining Voucher: 2,500 points
- Valid at 50+ partner restaurants
- No minimum purchase

Hotel Vouchers:
- $100 Hotel Credit: 12,000 points
- Valid at partner hotel chain
- Minimum 2-night stay

Retail Partner Vouchers:
- $50 Fashion Voucher: 5,500 points
- Valid at partner fashion retailers
- Exclusions: Sale items
```

**Use Case 4: Experiential Rewards**

High-value experience vouchers for premium redemptions:

```
Exclusive Experiences:

VIP Concert Package:
- Cost: 50,000 points
- Includes: 2 tickets + backstage pass + meet & greet
- Validity: Specific event date
- Non-transferable

Luxury Spa Day:
- Cost: 25,000 points
- Includes: Full day spa access + treatments
- Validity: 6 months
- Reservation required

Cooking Class with Chef:
- Cost: 15,000 points
- Includes: 3-hour private class + meal
- Validity: 12 months
- Guest allowed
```

### Advantages

**Flexibility**: Members choose when and how to use vouchers

**Delay Redemption**: Vouchers provide time separation between points redemption and purchase

**Gifting**: Vouchers can be gifted to others (viral acquisition)

**Partner Integration**: Easy to integrate partner rewards without complex pricing integrations

**Experience Rewards**: Enable non-merchandise redemptions (events, services, experiences)

**Clear Value**: Monetary value is explicit and easy to understand

### Limitations

**Two-Step Process**: Members must redeem points for voucher, then use voucher (not instant)

**Expiry Management**: Vouchers add another expiry layer beyond points expiry

**Code Management**: Requires voucher code generation and validation system

**Partial Use Complexity**: Handling unused voucher balance can be complex

**Fraud Risk**: Voucher codes can be shared or stolen if not properly secured

### Integration Details

**Applet Integration**:
- **Voucher Maintenance Applet**: Create and configure voucher types
- **[Membership Admin Console](/applets/membership-admin-console-applet/)**: Issue vouchers, view voucher history
- **Sales Module**: Validate and apply vouchers at checkout
- **E-Commerce Module**: Online voucher redemption and application

**Data Structure**:
```
Voucher Type Table:
- Voucher Type ID
- Type Name
- Points Cost
- Monetary Value
- Validity Period (days)
- Usage Rules (category restrictions, minimum purchase)
- Availability (always, or limited quantity)

Voucher Instance Table:
- Voucher Code (unique)
- Voucher Type ID
- Member ID (who redeemed points for it)
- Issue Date
- Expiry Date
- Current Balance (if partial use allowed)
- Status (Active, Used, Expired, Cancelled)
- Transaction ID (when used)
```

## Combining Multiple Mechanisms

Sophisticated loyalty programs often use all three mechanisms strategically:

### Hybrid Strategy Example

**Coffee Chain Loyalty Program**:

**FI-ITEM Pricing** (Member Benefits):
```
All Beverages:
- Bronze: 5% discount
- Silver: 10% discount
- Gold: 15% discount

Food Items:
- All members: No discount (protect food margins)
```

**Pricebook** (Merchandise):
```
Branded Merchandise Pricebook (Members Only):
- All members: 20% off mugs, tumblers, beans
- Gold members: 30% off merchandise
```

**Vouchers** (Points Redemption):
```
Free Drink Voucher:
- Cost: 125 points (Bronze/Silver) or 100 points (Gold)
- Value: 1 regular beverage
- Validity: 30 days

Free Food Voucher:
- Cost: 200 points
- Value: 1 breakfast sandwich or pastry
- Validity: 30 days

Birthday Reward:
- Cost: Free (auto-issued)
- Value: Any handcrafted beverage
- Validity: Birthday week
```

**How They Work Together**:

Member Sarah (Gold tier) shops:
1. **FI-ITEM**: Orders latte ($5.00), gets 15% discount = $4.25
2. **Pricebook**: Buys travel mug ($25.00), gets 30% Gold discount = $17.50
3. **Voucher**: Applies free food voucher (200 points redeemed last week) = $0.00 for pastry

Total: $21.75 (saved $8.25 through combined mechanisms)

### Decision Framework

**When to use FI-ITEM Pricing**:
- Need precise control over which products have member discounts
- Want to protect margins on specific categories
- Have negotiated pricing for specific members (B2B)
- Different member tiers get different discount levels per product

**When to use Pricebook**:
- Want systematic tier-based pricing across catalog
- Operate multiple sales channels with different pricing
- Have large product catalog (FI-ITEM would be too complex)
- Tier benefits include different pricing structures

**When to use Vouchers**:
- Want members to explicitly redeem points (not automatic discounts)
- Offer experiential or partner rewards beyond product discounts
- Need time separation between earning and redemption
- Want gifting and viral mechanics
- Periodic rewards (birthdays, anniversaries)

### Combined Benefits

**For Business**:
- Maximum flexibility to design sophisticated programs
- Protect margins where needed (FI-ITEM selectivity)
- Systematic tier differentiation (Pricebook)
- Explicit redemption tracking (Vouchers)

**For Members**:
- Automatic discounts at checkout (FI-ITEM, Pricebook)
- Choice in redemption timing (Vouchers)
- Diverse reward options (products, discounts, experiences)
- Clear value communication

## Implementation Best Practices

### Start Simple, Add Complexity

**Phase 1**: Launch with one mechanism
- Example: FI-ITEM pricing for member discounts only

**Phase 2**: Add tier differentiation
- Example: Introduce Pricebook for Gold tier with better pricing structure

**Phase 3**: Add explicit redemption
- Example: Vouchers for points-funded rewards

### Match Mechanism to Business Model

**Retail**: FI-ITEM + Vouchers (selective discounts + flexible redemption)

**Wholesale/Clubs**: Pricebook (membership-based pricing structure)

**Service Business**: Vouchers (appointment-based redemptions)

**E-Commerce**: All three (maximum flexibility)

**B2B**: FI-ITEM + Pricebook (relationship pricing + tier structure)

### Communication Clarity

**Member Education**:
- Explain how each mechanism works
- Show examples of savings in each category
- Provide redemption guides

**Transparency**:
- Show regular price vs member price clearly
- Display tier-based pricing benefits
- Show voucher value and terms upfront

**Consistency**:
- Use consistent terminology across channels
- Unified member experience (in-store, online, mobile)

## Summary

BigLedger's three redemption mechanisms provide comprehensive flexibility for loyalty program design:

**Pricing Scheme / FI-ITEM**:
- Granular, item-level member pricing
- Configured via [Doc Item Maintenance Applet](/applets/doc-item-maintenance-applet/)
- Best for selective discounts and margin protection

**Pricebook**:
- Systematic, tier-based pricing structures
- Configured via Pricebook Applet
- Best for comprehensive tier differentiation

**Voucher**:
- Points-funded redemption instruments
- Configured via Voucher Maintenance Applet
- Best for flexible, explicit redemptions and experiences

**Strategic Approach**:
- Use one, two, or all three mechanisms based on business needs
- Start simple, add complexity as program matures
- Match mechanisms to business model and customer behavior
- Communicate clearly how each mechanism benefits members

Understanding these reward mechanisms completes the core concepts foundation for implementing effective membership programs in BigLedger. With knowledge of customer-membership relationships, points currencies, tiers, expiry, and reward types, you're ready to design comprehensive loyalty strategies.
