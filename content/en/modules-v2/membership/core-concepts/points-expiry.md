---
title: "Points Expiry"
description: "Points expiration rules, liability management, and engagement strategies"
weight: 24
---

Points expiry is both a financial necessity and a strategic engagement tool in loyalty programs. BigLedger's expiry engine provides sophisticated configuration options that go far beyond simple time-based expiration, enabling businesses to balance financial liability management with customer satisfaction and program engagement.

## Why Points Expire

Points expiry serves multiple business objectives that make it essential for most loyalty programs:

### Financial Liability Management

Outstanding points balances represent a financial liability on the balance sheet. Without expiry, this liability grows indefinitely:

**Example Liability Growth Without Expiry**:
```
Year 1: 1,000,000 points issued → Liability: $10,000 (at $0.01/point)
Year 2: 1,500,000 points issued → Liability: $25,000 (cumulative)
Year 3: 2,000,000 points issued → Liability: $45,000 (cumulative)
Year 5: 3,000,000 points issued → Liability: $95,000 (cumulative)

Without expiry and with only 60% redemption, liability becomes unmanageable.
```

**With Strategic Expiry**:
```
Year 1: 1,000,000 issued, 600,000 redeemed, 300,000 expired → Liability: $1,000 (100,000 active)
Year 2: 1,500,000 issued, 900,000 redeemed, 450,000 expired → Liability: $2,500 (250,000 active)
Year 3: 2,000,000 issued, 1,200,000 redeemed, 600,000 expired → Liability: $4,000 (400,000 active)

Expiry keeps liability manageable and predictable.
```

### Engagement and Urgency

Points with expiration dates create healthy urgency that drives member engagement:

- Members check their account more frequently
- Redemption activity increases as expiry approaches
- Earning activity increases to maximize value before expiry
- Program stays "top of mind" through expiry communications

### Inactive Account Management

Members who stop engaging with the business but retain point balances create "dead" liability. Expiry provides a mechanism to clean up inactive accounts while giving members fair warning and opportunity to use their points.

### Program Economics

Breakage (points that expire unredeemed) improves program economics and allows businesses to be more generous with earning rates:

**Program Economics Example**:
```
Without Breakage:
- Earning rate: $1 = 1 point
- Redemption value: 100 points = $1
- Program cost: 100% of points issued must be funded

With 30% Breakage:
- Same earning and redemption rates
- Effective cost: Only 70% of points redeemed
- Can afford to be more generous or maintain profitability
```

## Types of Expiry Rules

BigLedger supports multiple expiry rule types that can be combined to create sophisticated policies:

### Fixed-Term Expiry

Points expire a fixed duration after they are earned.

**Configuration Example**:
```
Rule: Points expire 24 months after earning date
Implementation: Each points lot tracks earning date
System: Automatically expires points on earning date + 24 months
```

**Use Cases**:
- Standard expiry policy for most programs
- Straightforward for members to understand
- "Earn by March 2023, expire March 2025"

**Member Experience**:
```
Points Earned: March 15, 2023 → 1,000 points
Expiry Date: March 15, 2025
Member sees: "1,000 points expire on March 15, 2025"
```

**Advantages**:
- Simple to communicate
- Predictable for financial planning
- Fair to members (generous time window)

**Considerations**:
- Must track expiry date per points lot (batch of points earned together)
- Members with infrequent earning may lose track of expiry dates
- Bulk expiry events can create customer service spikes

### Rolling Expiry with Activity Extension

Points expire after a period of inactivity, but any account activity resets the expiry clock.

**Configuration Example**:
```
Rule: Points expire after 12 months of account inactivity
Activity Definition: Any purchase, redemption, or points earning event
Reset Behavior: Any activity extends all points by 12 months
```

**Use Cases**:
- Programs prioritizing engagement over liability control
- Service businesses wanting to maintain customer relationships
- Premium tiers as a benefit (never expire if you stay active)

**Member Experience**:
```
Last Activity: January 15, 2024
Current Date: November 18, 2024
Expiry Date: January 15, 2025 (12 months from last activity)

Member makes purchase: November 20, 2024
New Expiry Date: November 20, 2025 (12 months from new activity)
All existing points get extended
```

**Advantages**:
- Rewards active customers with indefinite points validity
- Encourages consistent engagement
- Activity extension feels generous and fair

**Considerations**:
- Less predictable liability (active members never expire)
- Requires activity tracking and expiry recalculation
- Must clearly define what counts as "activity"

### Calendar-Based Expiry

Points expire at a specific calendar date regardless of earning date.

**Configuration Example**:
```
Rule: All points expire on December 31 of the year earned
Implementation: Points earned any time in 2024 expire Dec 31, 2024
System: Batch expiry process runs annually
```

**Use Cases**:
- Programs with annual membership cycles
- Seasonal businesses (ski resorts, summer camps)
- Simplifying financial accounting (annual liability reset)

**Member Experience**:
```
Points earned January 2024: Expire December 31, 2024 (11 months validity)
Points earned November 2024: Expire December 31, 2024 (1 month validity)
Member knows: "Use points by end of year"
```

**Advantages**:
- Simple annual cycle
- Clear communication (use by year-end)
- Predictable expiry date for budgeting

**Considerations**:
- Unfair to members earning late in period
- Creates December redemption rush
- Aggressive for long-term liability management

### Tiered Expiry

Different expiry rules apply based on member tier or points currency.

**Configuration Example**:
```
Bronze Members: Points expire 12 months after earning
Silver Members: Points expire 24 months after earning
Gold Members: Points expire 36 months after earning
Platinum Members: Points never expire
```

**Use Cases**:
- Tier benefit differentiation
- Rewarding loyalty with longer validity
- Competitive differentiation in premium tiers

**Member Experience**:
```
Member: Sarah (Gold tier)
Points Balance: 15,000 points
Expiry: 36 months from earning (some earned in 2022, some in 2024)

Sarah upgrades to Platinum
New Expiry: All points now never expire
Benefit: Lifetime validity as Platinum tier benefit
```

**Advantages**:
- Strong tier differentiation
- Motivates tier progression
- Rewards best customers with peace of mind

**Considerations**:
- Complex when members change tiers
- Must decide if new tier rules apply retroactively to old points
- Communication must be clear about tier-based differences

### Selective Currency Expiry

Different points currencies have different expiry rules.

**Configuration Example**:
```
Loyalty Points (Base): Never expire
Bonus Points (Promotional): Expire 6 months after earning
Gift Points (Transferable): Expire 90 days after receiving
Partner Points: Expire 18 months after earning
```

**Use Cases**:
- Matching expiry to currency purpose
- Creating urgency for promotional points
- Managing partner liability separately

**Member Experience**:
```
Member Balance Summary:
- Loyalty Points: 10,000 (never expire)
- Bonus Points: 2,000 (expire June 30, 2024)
- Gift Points: 500 (expire January 15, 2024)

Member sees urgency to use Bonus and Gift points first
```

**Advantages**:
- Flexibility to match currency to purpose
- Promotional points can be aggressive (high breakage) while base is generous
- Clear liability separation

**Considerations**:
- Must communicate different expiry rules clearly
- Members may be confused by multiple expiry dates
- System must track expiry per currency

## Expiry Configuration Examples

### Example 1: Conservative Standard Program

**Business Context**: Established retail loyalty program prioritizing customer satisfaction.

**Expiry Policy**:
```
Base Expiry: Points expire 36 months after earning
Activity Extension: Any purchase extends expiry by 12 months
Tier Exception: Platinum members' points never expire
Grace Period: 90-day grace period with warning notifications
```

**Why This Works**:
- 36 months is generous and member-friendly
- Activity extension rewards engagement
- Platinum benefit creates tier aspiration
- Grace period reduces negative reactions

**Financial Impact**:
- Moderate breakage rate (~20-25%)
- Predictable liability with long time horizon
- Lower customer service complaints

### Example 2: Aggressive Promotional Program

**Business Context**: New brand launch using loyalty to drive trial and rapid engagement.

**Expiry Policy**:
```
Welcome Bonus Points: Expire 90 days after enrollment
Purchase Points: Expire 12 months after earning
Referral Bonus: Expire 6 months after friend's first purchase
No Extensions: Expiry is fixed, no activity extensions
```

**Why This Works**:
- Short expiry creates urgency to try products
- Referral expiry motivates friend activation quickly
- Aggressive breakage improves program economics during growth phase
- Can offer generous earning rates due to high breakage

**Financial Impact**:
- High breakage rate (~40-50%)
- Low liability burden during growth
- Drives rapid member activation

### Example 3: Premium Subscription Model

**Business Context**: Paid membership program where annual fee is primary revenue.

**Expiry Policy**:
```
Member Status: Active subscription
Points Earning: Cash-back points on purchases
Expiry During Active Status: No expiry while subscription active
Expiry After Cancellation: Points expire 30 days after subscription cancels
Reactivation: Points restored if subscription renewed within 6 months
```

**Why This Works**:
- No expiry during active status is a membership benefit
- Post-cancellation expiry motivates renewal
- Restoration grace period allows customer to return without losing value
- Aligns expiry with subscription lifecycle

**Financial Impact**:
- Low breakage for active members (good for retention)
- Breakage occurs when members churn
- Liability tied to active subscriber base

### Example 4: Multi-Currency Strategy

**Business Context**: Complex loyalty ecosystem with multiple currency types.

**Expiry Policy**:
```
Base Loyalty Points:
- Never expire for active members
- "Active" defined as any activity within 24 months
- Expire 24 months after last activity for inactive members

Bonus Points:
- Expire 12 months after earning
- No extensions
- Used first in redemption (FIFO)

Partner Points:
- Expire 18 months after earning
- Must be converted to Base Loyalty Points to extend
- Conversion ratio: 3 Partner Points = 1 Base Loyalty Point

Gift Points:
- Expire 90 days after receiving
- Cannot be extended
- Highly transferable to encourage viral spread
```

**Why This Works**:
- Each currency serves different purpose with appropriate expiry
- Base points never expire rewards core loyalty
- Bonus and Gift points create urgency
- Partner expiry reflects different liability source
- Conversion to base extends partner points (drives engagement)

**Financial Impact**:
- Base points: Low breakage (~10%)
- Bonus points: High breakage (~35%)
- Partner points: Moderate breakage (~25%, or converted)
- Gift points: Very high breakage (~60% - many never claim)
- Overall balanced liability management

## Implementation Considerations

### Lot-Based Tracking

Points expiry requires tracking when each batch (lot) of points was earned:

**Points Lot Table Structure**:
```
Lot ID: PTLOT-8829301
Member ID: LOY-443829
Currency: Loyalty Points
Points Earned: 1,500
Earned Date: March 15, 2024
Expiry Date: March 15, 2026 (24-month rule)
Current Balance: 1,200 (300 redeemed)
Status: Active
```

**When members redeem points**, system determines which lot to deduct from based on redemption rule (FIFO, closest to expiry, member choice, etc.).

**Example Redemption**:
```
Member has three lots:
Lot A: 1,000 points, expires June 2024
Lot B: 2,000 points, expires September 2024
Lot C: 1,500 points, expires January 2025

Member redeems 1,500 points using FIFO (first to expire first):
- Lot A: Fully redeemed (1,000 points)
- Lot B: Partially redeemed (500 points), 1,500 remaining
- Lot C: Untouched, 1,500 remaining

Remaining balance: 3,000 points
Next expiry: 1,500 points on September 2024 (Lot B)
```

### Expiry Processing

**Scheduled Batch Processing**:
- Daily job checks for lots past expiry date
- Expired points moved from active balance to expired balance
- Expiry transactions recorded for audit trail
- Member notification triggered

**Real-Time Expiry**:
- Expiry check before transaction processing
- Prevents redemption of expired points
- Shows accurate available balance
- May have performance considerations

**Best Practice**: Combination approach
- Nightly batch for bulk expiry processing
- Real-time check for transaction accuracy
- Cache available balance for performance

### Member Communication

Effective communication prevents negative experiences:

**Pre-Expiry Warnings**:
```
Warning Schedule:
- 90 days before expiry: Email reminder
- 30 days before expiry: Email + SMS reminder
- 7 days before expiry: Urgent email + push notification
- 1 day before expiry: Final warning
```

**Warning Message Example**:
```
Subject: Don't Lose Your Points! 2,000 points expiring soon

Hi Sarah,

You have 2,000 Loyalty Points expiring on December 31, 2024 (30 days from now).

Your points are worth $20 in rewards!

Redeem now:
- Shop online and use points at checkout
- Visit any store location
- Get a reward voucher for later use

Check your balance: [View My Account]
```

**Post-Expiry Communication**:
```
Subject: Points Expiry Notice

Hi Sarah,

As per our program terms, 1,200 Loyalty Points expired on December 31, 2024.

Current Active Balance: 8,300 points

Your next points (500 points) expire on March 31, 2025.

Continue earning and redeeming: [Shop Now]

Questions? Contact us: support@example.com
```

### Exception Handling

**Customer Service Expiry Reversals**:
- Allow CS to reverse expiry within grace period (30 days)
- Require manager approval for reversals
- Track reversal reasons for pattern analysis
- Set caps on reversals per member (prevent abuse)

**System Errors**:
- If expiry processed incorrectly, provide reversal mechanism
- Audit trail of all expiry reversals
- Automated alerts for unusual expiry volumes

**Special Circumstances**:
- Account closure: Immediate expiry or grace period
- Account fraud: Freeze expiry during investigation
- System downtime: Extend expiry if members couldn't redeem due to technical issues

## Financial Accounting

### Breakage Recognition

Points expiry creates breakage revenue that must be recognized properly:

**Accounting Treatment**:
```
When Points Issued:
Debit: Marketing Expense (or Points Expense)
Credit: Points Liability

When Points Redeemed:
Debit: Points Liability
Credit: Revenue (or Contra-Revenue) / Inventory

When Points Expire:
Debit: Points Liability
Credit: Breakage Revenue
```

**Breakage Estimation**:
```
Historical Analysis:
- Total points issued: 10,000,000
- Points redeemed: 6,500,000 (65%)
- Points expired: 2,800,000 (28%)
- Points active: 700,000 (7%)

Breakage Rate Estimate: 28-30% (depending on active points trajectory)

Use for Financial Modeling:
- Issue 1,000,000 new points
- Estimate 280,000 will expire (breakage revenue)
- Budget for 650,000 redemption cost
- 70,000 will remain in liability
```

### Liability Reporting

**Balance Sheet Presentation**:
```
Current Liabilities:
  Points Liability - Expected to Redeem within 12 months: $85,000

Non-Current Liabilities:
  Points Liability - Expected to Redeem after 12 months: $45,000

Total Points Liability: $130,000
```

**Expiry Schedule Report**:
```
Points Expiry Schedule (as of Nov 18, 2025)

Expiring in:            Points        Value      % of Total
------------------------------------------------------------
0-3 months              500,000       $5,000     15%
3-6 months              800,000       $8,000     25%
6-12 months             1,200,000     $12,000    37%
12-24 months            600,000       $6,000     18%
24+ months              150,000       $1,500     5%
------------------------------------------------------------
Total Active            3,250,000     $32,500    100%
```

## Strategy and Best Practices

### Balancing Liability and Experience

**Too Aggressive Expiry**:
- High breakage improves economics short-term
- Customer dissatisfaction increases
- Negative social media and reviews
- Reduced program participation
- Members become cynical about earning points

**Too Generous Expiry**:
- Customer satisfaction high
- Liability grows uncontrolled
- Program becomes unsustainable
- May need to reduce earning rates or benefits

**Sweet Spot**:
- Expiry period feels fair (18-36 months common)
- Clear communication prevents surprises
- Warning system gives members chance to redeem
- Activity extension rewards engaged members
- Tier benefits for premium customers

### Testing Expiry Policies

**Before Launch**:
- Model financial impact of different expiry periods
- Project liability growth under different breakage assumptions
- Test communication effectiveness with focus groups
- Review competitor programs for benchmark

**After Launch**:
- Monitor actual breakage rates vs projections
- Track customer service inquiries about expiry
- Measure redemption behavior around expiry dates
- Survey member satisfaction with expiry policy
- A/B test warning communication timing and messaging

**Adjusting Policy**:
- Communicate changes transparently and in advance
- Grandfather existing points under old rules (goodwill)
- Extend grace period during transition
- Monitor impact on redemption and earning behavior

### Member-Friendly Practices

**Redemption Options Before Expiry**:
- Allow "save my points" conversion to vouchers (extends validity)
- Offer donation option (charity redemption prevents waste)
- Enable gifting to friend (viral acquisition + member satisfaction)

**Transparency**:
- Show expiry dates in member portal prominently
- Include next expiry date in all communications
- Provide expiry history (show what expired and when)
- Clear explanation of expiry policy in terms and conditions

**Flexibility for Special Cases**:
- Military deployment: Freeze expiry during active service
- Medical emergency: Extend expiry with documentation
- Account takeover/fraud: Restore expired points
- System downtime: Automatically extend if members couldn't access redemption

## Summary

Points expiry is a critical component of membership program management that balances financial sustainability with customer satisfaction:

**Strategic Value**:
- Controls long-term liability and makes programs financially sustainable
- Creates healthy urgency that drives engagement and redemption
- Enables more generous earning rates through breakage economics
- Provides mechanism to clean up inactive accounts

**Implementation Keys**:
- Choose expiry rules that match program objectives and customer behavior
- Implement lot-based tracking for accurate expiry management
- Communicate expiry clearly and provide advance warnings
- Design tier-based or currency-based variations for strategic flexibility
- Monitor breakage rates and adjust policy as needed

**Success Factors**:
- Expiry period feels fair to customers (18-36 months common)
- Warning system gives adequate notice and redemption opportunity
- Customer service can handle exceptions appropriately
- Financial accounting properly recognizes breakage revenue
- Policy balances liability management with customer satisfaction

Understanding points expiry configuration enables you to design programs that are both financially sustainable and customer-friendly. Next, explore the different [Reward Types](../reward-types/) and redemption mechanisms available in BigLedger.
