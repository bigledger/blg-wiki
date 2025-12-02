---
title: "Points Currencies"
description: "Multi-currency points systems, conversion mechanics, and flexible reward economics"
weight: 22
---

One of BigLedger's most powerful membership features is support for multiple points currencies within a single program or across related programs. This capability enables sophisticated loyalty economics that go far beyond simple point-per-dollar earning schemes. Understanding how to design and implement multi-currency systems is essential for creating flexible, scalable membership programs.

## What are Points Currencies?

A points currency is a defined unit of value within your loyalty ecosystem. Just as different countries use different monetary currencies, membership programs can use different points currencies to represent value in various contexts.

### Basic Currency Characteristics

Every points currency has these core attributes:

**Currency Code**: A unique identifier for system use (e.g., LOYPTS, BONUSPTS, GIFTPTS)

**Currency Name**: The customer-facing display name (e.g., "Loyalty Points", "Bonus Miles", "Gift Rewards")

**Status**: Active or Inactive flag controlling whether the currency can be earned or redeemed

**Earning Rules**: How members accumulate this currency (conversion rates, qualifying activities)

**Redemption Rules**: How members exchange this currency for value (redemption ratios, eligible rewards)

**Expiry Rules**: How and when points in this currency expire (can vary by currency)

### Why Multiple Currencies?

Multiple points currencies enable business scenarios that would be difficult or impossible with a single currency:

1. **Differentiated Expiry**: Base points never expire, but promotional bonus points expire after 90 days
2. **Source Tracking**: Separate currencies for purchases vs referrals vs engagement activities
3. **Partner Integration**: Partner-earned points separate from directly-earned points
4. **Promotional Campaigns**: Temporary currency for limited-time campaigns
5. **Gift Economics**: Transferable gift points separate from non-transferable earned points
6. **Category Restrictions**: Food points only redeemable for dining, merchandise points for retail

## Single Currency vs Multi-Currency Programs

### Single Currency Model

Many traditional programs use one currency for simplicity:

**Example - Coffee Shop Loyalty**:
- Currency: "Coffee Points"
- Earning: 1 point per $1 spent
- Redemption: 100 points = 1 free regular coffee
- Expiry: Points expire after 12 months of account inactivity

**Advantages**:
- Simple to understand for customers
- Easy to communicate
- Straightforward liability tracking
- Minimal configuration complexity

**Limitations**:
- All points have same expiry rules
- Promotions must give more of the same currency (dilutes value perception)
- Cannot restrict redemption by point source
- Difficult to separate owned vs partner points

### Multi-Currency Model

Advanced programs leverage multiple currencies for flexibility:

**Example - Travel Rewards Program**:
- **Base Miles**: Earned from flights, never expire, redeemable for flights and upgrades
- **Bonus Miles**: Earned from promotions, expire annually, redeemable for flights and merchandise
- **Partner Points**: Earned from hotels/car rentals, convertible to Base Miles at 3:1, expire after 18 months
- **Gift Miles**: Received from other members, same redemption as Base Miles, expire in 90 days

**Advantages**:
- Flexible expiry management
- Clear promotional value differentiation
- Partner economics separated from core program
- Gifting mechanics without cannibalizing earned points
- Category-specific redemption options

**Complexities**:
- Customer communication requires clarity
- System configuration more involved
- Financial liability tracking per currency
- Potential for customer confusion if poorly designed

## Common Multi-Currency Scenarios

### Scenario 1: Base + Bonus Currency Structure

The most common multi-currency approach separates standard earning from promotional bonuses.

**Implementation**:

**Primary Currency - "Loyalty Points"**:
- Earned on all purchases at base rate (1 point per $1)
- Never expires
- Full redemption flexibility
- Represents core value proposition

**Secondary Currency - "Bonus Points"**:
- Earned during promotions, special events, bonus multipliers
- Expires 6 months after earning
- Same redemption value as Loyalty Points
- Creates urgency to redeem

**Business Benefits**:
- Promotional points create separate liability bucket with shorter duration
- Breakage (expiry) is higher on Bonus Points, improving program economics
- Members perceive bonus as "extra" value rather than just more of the same
- Can set different accounting treatment for bonus vs base points

**Customer Experience**:
- Clear differentiation between "money earned" vs "bonuses received"
- Urgency to use bonus points drives redemption behavior
- Members feel rewarded when receiving bonus points
- Expiry of bonus points less painful than base points expiring

**Example Balance Statement**:
```
Your Points Summary:
- Loyalty Points: 12,450 (Never expire)
- Bonus Points: 3,200 (Expire June 30, 2024)
Total Redeemable: 15,650 points
```

### Scenario 2: Category-Specific Currencies

Different currencies redeemable for different product categories.

**Implementation**:

**Retail Chain with Grocery + Pharmacy + Gas Stations**:

**Grocery Points**:
- Earned: 1 point per $1 on grocery purchases
- Redeemable: Grocery products only
- Expiry: 12 months

**Pharmacy Points**:
- Earned: 2 points per $1 on pharmacy purchases (higher margin)
- Redeemable: Pharmacy and health products
- Expiry: 24 months (encourage medication adherence)

**Fuel Points**:
- Earned: 1 point per $1 on any purchase
- Redeemable: Gas station discounts only
- Expiry: End of month (creates urgency for frequent fill-ups)

**Business Benefits**:
- Margins protected by category-specific redemption
- High-margin categories can offer richer earning
- Fuel points drive traffic to gas stations
- Cross-category shopping encouraged

**Customer Experience**:
- Choice in redemption category
- Perceived value higher when specialized
- Frequent fuel purchases drive engagement

### Scenario 3: Partner Network Integration

Managing points from partner organizations with conversion mechanics.

**Implementation**:

**Airline + Hotel + Credit Card Partnership**:

**SkyMiles (Airline owned)**:
- Earned from flights at base rate
- Redeemable for flights, upgrades, hotel transfers
- Never expire for active members
- Conversion: None needed (native currency)

**Hotel Reward Points (Partner earned)**:
- Earned from partner hotel stays
- Stored separately to track partner liability
- Convertible to SkyMiles at 3:1 ratio
- Expire 18 months after earning

**Card Bonus Points (Credit card partner)**:
- Earned from credit card purchases
- Convertible to SkyMiles at 1:1 ratio
- Expire 36 months after earning
- Can be held unconverted for flexibility

**Business Benefits**:
- Clear separation of airline liability vs partner liability
- Conversion creates "friction" that reduces redemption rate
- Partners manage their own point issuance
- Airline controls conversion ratios to protect margins

**Customer Experience**:
- Flexibility to earn from multiple sources
- Choice to convert or hold in original currency
- Unified redemption once converted
- Transparency on conversion rates

**Conversion Example**:
```
Member has:
- 50,000 SkyMiles
- 30,000 Hotel Points (= 10,000 SkyMiles when converted)
- 15,000 Card Bonus Points (= 15,000 SkyMiles when converted)

Unconverted total: 95,000 points across 3 currencies
Potential SkyMiles if all converted: 75,000 SkyMiles
```

### Scenario 4: Transferable vs Non-Transferable Points

Controlling which currencies can be gifted or transferred between members.

**Implementation**:

**Membership Program with Gifting Feature**:

**Earned Points (Non-transferable)**:
- Earned from personal purchases
- Cannot be transferred to other members
- Full redemption flexibility
- Standard expiry rules

**Gift Points (Transferable)**:
- Received from other members or as gifts
- Can be transferred to other members
- Same redemption value
- Shorter expiry (encourages use)

**Promotional Codes (Transferable)**:
- Issued via promotional campaigns
- Can be shared (one-time use code)
- Limited redemption options
- Fixed expiry date

**Business Benefits**:
- Prevents "point trading" gray markets
- Gift points create viral acquisition (members recruit friends to receive their gifts)
- Promotional codes provide marketing flexibility
- Liability control through transferability restrictions

**Customer Experience**:
- Ability to gift points to family/friends creates goodwill
- Recipients value free points highly (acquisition tool)
- Clear rules prevent confusion about what can be shared
- Promotional codes feel special and valuable

## Currency Conversion Mechanics

When multiple currencies exist, conversion between them is often needed. BigLedger supports two primary conversion models:

### Points-to-Points Conversion

Converting from one points currency to another within the membership ecosystem.

**Conversion Ratio Example**:
- 3 Bonus Points = 1 Loyalty Point
- 2 Partner Points = 1 Loyalty Point
- 1 Premium Point = 2 Loyalty Points

**Implementation Considerations**:

**One-Way Conversion**: Typically only convert from lower-value to higher-value currency (prevents gaming)

**Conversion Fees**: Optional fee (5% of points lost in conversion) to create friction

**Minimum Conversion**: Require minimum amount (e.g., 1,000 points minimum)

**Conversion Limits**: Daily or monthly conversion caps

**Expiry Impact**: Converted points inherit destination currency's expiry rules

**Business Use Cases**:
- Consolidating points before expiry
- Converting partner points to native currency
- Combining multiple balances for large redemption
- Simplifying member's portfolio

**Example Conversion Transaction**:
```
Before Conversion:
- Bonus Points: 6,000 (expiring in 30 days)
- Loyalty Points: 10,000 (never expire)

Conversion Action:
Convert 6,000 Bonus Points → Loyalty Points at 3:1 ratio

After Conversion:
- Bonus Points: 0
- Loyalty Points: 12,000 (never expire)

Member saved 6,000 points from expiring by converting to 2,000 Loyalty Points
```

### Points-to-Cash Conversion

Converting points to monetary value for flexible redemption.

**Redemption Ratio Example**:
- 100 Loyalty Points = $1 cash value
- 200 Bonus Points = $1 cash value
- 50 Premium Points = $1 cash value

**Implementation Considerations**:

**Redemption Threshold**: Minimum points required (e.g., 5,000 points = $50 minimum)

**Redemption Method**: Statement credit, bank transfer, check, or cash card

**Redemption Frequency**: Monthly or quarterly redemption windows

**Tax Implications**: May need to report as income depending on jurisdiction

**Fraud Prevention**: Enhanced verification for cash redemptions

**Business Use Cases**:
- "Cash back" reward programs (credit cards)
- Flexible redemption when merchandise catalog is limited
- High-value rewards for premium members
- Alternative to complex reward catalogs

**Example Cash Redemption**:
```
Member Balance: 50,000 Loyalty Points
Cash Conversion Rate: 100 points = $1
Available Cash Value: $500

Redemption Options:
1. Apply $500 statement credit to credit card account
2. Transfer $500 to bank account
3. Receive $500 check by mail
4. Load $500 to prepaid debit card

Member chooses statement credit, 50,000 points deducted
```

### Hybrid Conversion (Points + Cash)

Some programs allow members to combine points and cash for higher-value redemptions.

**Example - Premium Redemption**:
```
Luxury Hotel Room: $400 per night

Redemption Options:
1. Pure Points: 80,000 Loyalty Points
2. Pure Cash: $400
3. Hybrid: 40,000 Points + $200 cash
4. Hybrid: 60,000 Points + $100 cash

Member chooses option 3: 40,000 Points + $200 cash
Benefits:
- Preserves some points balance
- Makes high-value redemption accessible with fewer points
- Improves program economics (cash portion has no liability)
```

## Multi-Currency Balance Management

### Balance Tracking

Each membership maintains separate balances for each active currency:

**Member Balance Table Example**:
```
Member: Sarah Johnson (#LOY-443829)
As of: November 18, 2025

Currency         | Current Balance | Lifetime Earned | Lifetime Redeemed | Next Expiry
-----------------|-----------------|-----------------|-------------------|-------------
Loyalty Points   | 12,450          | 48,200          | 35,750           | None
Bonus Points     | 3,200           | 18,900          | 15,700           | 1,200 on Dec 31
Partner Points   | 8,500           | 12,000          | 3,500            | 2,000 on Jan 15
Gift Points      | 1,000           | 5,500           | 4,500            | 1,000 on Nov 30
-----------------|-----------------|-----------------|-------------------|-------------
Total            | 25,150          | 84,600          | 59,450           | -
```

### Transaction Attribution

Each earning or redemption transaction must specify which currency:

**Earning Transaction Example**:
```
Transaction ID: TXN-8829301
Date: November 18, 2025
Purchase Amount: $150
Member: Sarah Johnson

Points Earned:
- Loyalty Points: +150 (base earning: $1 = 1 point)
- Bonus Points: +150 (active promotion: double points)
Total Points: +300 points
```

**Redemption Transaction Example**:
```
Transaction ID: RDM-4456092
Date: November 18, 2025
Redemption Value: $25 discount

Points Redeemed:
- Bonus Points: -2,500 (used first due to earlier expiry)
Remaining Balance:
- Bonus Points: 700
```

### Automatic Currency Selection

Programs can implement rules for which currency to use automatically:

**First-In-First-Out (FIFO)**: Redeem oldest points first (minimizes expiry)

**First-to-Expire First**: Redeem points closest to expiry first (member-friendly)

**Lowest-Value First**: Redeem lower-value currencies before higher-value (optimizes member's total value)

**Member Choice**: Allow member to explicitly select which currency to redeem

## Configuration Best Practices

### Naming Currencies

Choose names that clearly communicate purpose and value:

**Good Names**:
- "Base Miles" vs "Bonus Miles" (clear differentiation)
- "Rewards Points" vs "Gift Points" (functional distinction)
- "Cash Back Points" (communicates redemption method)

**Poor Names**:
- "Points A" and "Points B" (no context)
- "Gold Points" and "Silver Points" (confusing with tier names)
- "Special Points" (vague purpose)

### Setting Conversion Ratios

Establish ratios that protect program economics:

**Fair Value Exchange**: Conversion should reflect relative earning difficulty
- If Bonus Points are "easier" to earn (promotions), convert at worse ratio
- Example: 3 Bonus Points = 1 Base Point reflects that Bonus Points are promotional

**Prevent Gaming**: Ensure no conversion path creates free value
- Check all conversion loops to prevent arbitrage
- Example: If A→B at 2:1 and B→C at 2:1, ensure no C→A path at better than 4:1

**Partner Economics**: Reflect partner cost in conversion ratio
- If partner pays you $0.005 per point issued, ensure conversion doesn't exceed this cost
- Example: If partner points cost $0.005 and your base points cost $0.01, convert at 2:1

### Expiry Policy Alignment

Match expiry rules to currency purpose:

**Base Currency**: Generous expiry (never expire, or activity-based extension)

**Promotional Currency**: Aggressive expiry (create urgency)

**Gift Currency**: Moderate expiry (balance urgency with goodwill)

**Partner Currency**: Partner-dictated expiry (match partner's policies)

## Financial Implications

### Liability Tracking

Each currency represents a separate financial liability:

**Balance Sheet Impact**:
```
Loyalty Points Liability:
- Outstanding Balance: 12,450,000 points
- Cost per Point: $0.01
- Total Liability: $124,500

Bonus Points Liability:
- Outstanding Balance: 3,200,000 points
- Cost per Point: $0.01
- Total Liability: $32,000

Total Points Liability: $156,500
```

### Breakage Recognition

Points that expire without redemption represent breakage (profit recognition):

**Breakage by Currency**:
```
Loyalty Points (Never Expire):
- Expected Breakage: 10% (members become inactive)

Bonus Points (Expire 6 months):
- Expected Breakage: 35% (aggressive expiry)

Partner Points (Expire 18 months):
- Expected Breakage: 25% (moderate expiry)
```

Higher breakage on promotional currencies improves program economics significantly.

## Integration with Reward Mechanisms

Different redemption mechanisms interact with currencies differently:

### FI-ITEM Pricing Method

Member-specific pricing can vary by currency:
- Redeeming Loyalty Points: 10% discount
- Redeeming Bonus Points: 8% discount
- Redeeming Premium Points: 15% discount

### Pricebook Method

Tier-based pricing typically uses a primary currency:
- All redemptions draw from Loyalty Points balance
- Bonus Points must be converted to Loyalty Points first

### Voucher Method

Vouchers can be purchased with specific currencies:
- $10 Gift Voucher: 1,000 Loyalty Points OR 1,500 Bonus Points
- Exclusive Experience Voucher: 50,000 Premium Points only (not available for other currencies)

## Summary

Multiple points currencies transform simple loyalty programs into sophisticated reward ecosystems:

**Strategic Benefits**:
- Flexible expiry management improves program economics
- Partner integration with clear liability separation
- Promotional mechanics without devaluing base currency
- Category restrictions protect margins

**Operational Considerations**:
- Clear communication essential to prevent confusion
- Balance tracking more complex but manageable
- Financial reporting by currency provides better insights
- System configuration requires careful planning

**Customer Experience**:
- Perceived value higher when currencies are well-differentiated
- Flexibility in earning and redemption appreciated
- Urgency created by differential expiry drives engagement
- Transparency in conversion builds trust

Understanding multi-currency systems is essential for leveraging the full power of BigLedger's Membership Module. Next, explore how [Membership Tiers](../membership-tiers/) work with points currencies to create comprehensive loyalty programs.
