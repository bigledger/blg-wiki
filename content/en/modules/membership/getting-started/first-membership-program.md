---
title: "First Membership Program"
description: "Complete walkthrough to create a production-ready retail loyalty program with tiers, points, and redemption"
weight: 40
---

Build your first complete membership program with this hands-on walkthrough. You'll create a realistic retail loyalty program with three tiers, points earning rules, and flexible redemption options.

## What You'll Build

A complete retail loyalty program called "Rewards Plus" with:

**Three Membership Tiers:**
- Bronze (Entry level) - 1x points earning
- Silver (Mid tier) - 1.5x points earning
- Gold (Premium tier) - 2x points earning

**Loyalty Points System:**
- Earn points on every purchase
- Tier-based earning multipliers
- Birthday bonus points
- Welcome bonus for new members

**Flexible Redemption:**
- Convert points to cash discount
- Minimum redemption thresholds
- Member-exclusive special offers
- Points never expire (configurable alternative shown)

**Time Required:** 30-60 minutes

**Skill Level:** Intermediate

**Prerequisites:** Core Module applets configured (see [Installation Requirements](/modules/membership/getting-started/installation-requirements/))

## Program Overview

### Business Scenario

You operate a retail store called "Urban Style Boutique" and want to:
- Increase customer retention
- Drive repeat purchases
- Reward loyal customers
- Gather customer data for marketing

### Program Economics

**Earning Rate:**
- Bronze: $1 spent = 1 point
- Silver: $1 spent = 1.5 points
- Gold: $1 spent = 2 points

**Redemption Rate:**
- 100 points = $1 discount
- Minimum redemption: 500 points ($5 value)

**Tier Progression:**
- Bronze: Default for all new members
- Silver: Earn 2,000 points in a year
- Gold: Earn 5,000 points in a year

**Member Benefits by Tier:**

| Benefit | Bronze | Silver | Gold |
|---------|--------|--------|------|
| Points Earning | 1x | 1.5x | 2x |
| Birthday Bonus | 100 pts | 250 pts | 500 pts |
| Welcome Bonus | 50 pts | 50 pts | 50 pts |
| Member Pricing | 5% off | 10% off | 15% off |
| Early Sale Access | No | Yes | Yes |
| Free Shipping | $50+ | $30+ | All orders |

## Before You Begin

### Verify Prerequisites

Confirm these applets are configured:

- [x] Organization Applet - with active location
- [x] Customer Maintenance Applet - operational
- [x] Doc Item Maintenance Applet - can create FI-ITEM
- [x] Pricebook Applet - tier pricing ready
- [x] Membership Points Currency Applet - installed
- [x] Membership Program Applet - installed
- [x] Membership Admin Console - installed

### Gather Information

Have these details ready:

- [ ] Company legal name
- [ ] Operating locations
- [ ] GL accounts for membership revenue
- [ ] Tax treatment for membership (usually exempt)
- [ ] Member communication channels (email, SMS)

## Phase 1: Create Points Currency

### Step 1.1: Create Loyalty Points Currency

Navigate to **Applets** > **PTS CCY Module**

Click **"+"** to create new currency

**Configuration:**

| Field | Value | Notes |
|-------|-------|-------|
| Currency Code | `RWDPTS` | "Rewards Points" - unique identifier |
| Currency Name | `Rewards Plus Points` | Display name for members |
| Description | `Urban Style Boutique loyalty points` | Internal reference |
| Status | `Active` | Enable immediately |
| Symbol | `pts` | Display symbol (optional) |

Click **"Create"** to save

**✓ Checkpoint:** RWDPTS currency appears in currency list

### Step 1.2: Configure Currency Settings (Optional)

If your applet supports advanced settings:

**Point Valuation:**
- Accounting value per point: $0.01 (for financial reporting)
- Minimum balance: 0 points
- Maximum balance: 999,999 points (prevent abuse)

**Display Settings:**
- Decimal places: 0 (whole points only)
- Rounding: Round down (prevent fractional points)

## Phase 2: Create Membership Products

Membership products represent the membership offering in your inventory system.

### Step 2.1: Bronze Membership Product

Navigate to **Doc Item Maintenance Applet**

Click **"+"** to create new item

**Basic Information:**

| Field | Value |
|-------|-------|
| Item Type | `FI-ITEM` (Financial Item) |
| Item Code | `MEM-BRONZE` |
| Item Name | `Rewards Plus Bronze Membership` |
| Description | `Entry-level membership with standard benefits` |
| Category | `Membership` (create if needed) |
| Status | `Active` |

**Pricing:**

| Field | Value |
|-------|-------|
| Unit Price | `0.00` (Free membership) |
| Currency | Your local currency |

**Financial Settings:**

| Field | Value |
|-------|-------|
| GL Account | Revenue account for memberships |
| Tax Code | `EXEMPT` or `ZERO-RATED` |
| Tax Treatment | Usually exempt for membership fees |

**Membership Attributes:**

| Field | Value |
|-------|-------|
| Membership Tier | `Bronze` |
| Validity Period | `12 months` |
| Auto-Renewal | `Yes/No` (based on policy) |

Click **"Save"**

### Step 2.2: Silver Membership Product

Repeat the process for Silver tier:

| Field | Value |
|-------|-------|
| Item Code | `MEM-SILVER` |
| Item Name | `Rewards Plus Silver Membership` |
| Description | `Mid-tier membership with enhanced benefits` |
| Unit Price | `0.00` (Free upgrade based on points) |
| GL Account | Same revenue account |
| Tax Code | `EXEMPT` |

### Step 2.3: Gold Membership Product

Create Gold tier membership:

| Field | Value |
|-------|-------|
| Item Code | `MEM-GOLD` |
| Item Name | `Rewards Plus Gold Membership` |
| Description | `Premium membership with exclusive benefits` |
| Unit Price | `0.00` (Free upgrade based on points) |
| GL Account | Same revenue account |
| Tax Code | `EXEMPT` |

**✓ Checkpoint:** Three membership products (MEM-BRONZE, MEM-SILVER, MEM-GOLD) visible in item list

## Phase 3: Configure Member Classes

Member classes define the tier structure and associated benefits.

### Step 3.1: Create Bronze Member Class

Navigate to **Membership Program Applet** > **Member Classes**

Click **"+"** to create new class

**Basic Configuration:**

| Field | Value | Purpose |
|-------|-------|---------|
| Class Code | `BRONZE` | Unique tier identifier |
| Class Name | `Bronze Member` | Display name |
| Description | `Entry-level Rewards Plus member` | Internal notes |
| Points Currency | `RWDPTS` | Link to currency created earlier |
| Status | `Active` | Enable for enrollment |
| Default Class | `Yes` | Auto-assign to new members |

**Tier Properties:**

| Field | Value |
|-------|-------|
| Tier Level | `1` | Lowest tier |
| Points Multiplier | `1.0` | Base earning rate |
| Color Code | `#CD7F32` | Bronze color for UI |
| Icon | Upload bronze badge icon (optional) |

**Progression Rules:**

| Field | Value |
|-------|-------|
| Entry Requirement | `None` | Default tier |
| Upgrade To | `SILVER` | Next tier |
| Upgrade Criteria | `2000 points in 12 months` | Promotion rule |
| Downgrade To | `None` | Can't go lower |
| Downgrade Criteria | `N/A` | Not applicable |

**Benefits Configuration:**

| Benefit | Value |
|---------|-------|
| Points Earning Rate | `1x` (base rate) |
| Birthday Bonus | `100 points` |
| Welcome Bonus | `50 points` |
| Member Discount | `5%` (configure via Pricebook) |
| Priority Support | `No` |

Click **"Create"**

### Step 3.2: Create Silver Member Class

Create the mid-tier class:

| Field | Value |
|-------|-------|
| Class Code | `SILVER` |
| Class Name | `Silver Member` |
| Description | `Mid-tier Rewards Plus member` |
| Points Currency | `RWDPTS` |
| Status | `Active` |
| Default Class | `No` |
| Tier Level | `2` |
| Points Multiplier | `1.5` |
| Color Code | `#C0C0C0` |

**Progression Rules:**

| Field | Value |
|-------|-------|
| Entry Requirement | `2000 points in 12 months` |
| Upgrade To | `GOLD` |
| Upgrade Criteria | `5000 points in 12 months` |
| Downgrade To | `BRONZE` |
| Downgrade Criteria | `Less than 2000 points in 12 months` |

**Benefits:**

| Benefit | Value |
|---------|-------|
| Points Earning Rate | `1.5x` |
| Birthday Bonus | `250 points` |
| Welcome Bonus | `50 points` |
| Member Discount | `10%` |
| Early Sale Access | `Yes` |

Click **"Create"**

### Step 3.3: Create Gold Member Class

Create the premium tier:

| Field | Value |
|-------|-------|
| Class Code | `GOLD` |
| Class Name | `Gold Member` |
| Description | `Premium Rewards Plus member` |
| Points Currency | `RWDPTS` |
| Status | `Active` |
| Default Class | `No` |
| Tier Level | `3` |
| Points Multiplier | `2.0` |
| Color Code | `#FFD700` |

**Progression Rules:**

| Field | Value |
|-------|-------|
| Entry Requirement | `5000 points in 12 months` |
| Upgrade To | `None` | Highest tier |
| Upgrade Criteria | `N/A` |
| Downgrade To | `SILVER` |
| Downgrade Criteria | `Less than 5000 points in 12 months` |

**Benefits:**

| Benefit | Value |
|---------|-------|
| Points Earning Rate | `2x` |
| Birthday Bonus | `500 points` |
| Welcome Bonus | `50 points` |
| Member Discount | `15%` |
| Concierge Service | `Yes` |

Click **"Create"**

**✓ Checkpoint:** Three member classes (BRONZE, SILVER, GOLD) configured with progression rules

## Phase 4: Configure Earning Rules

Define how members earn points across different scenarios.

### Step 4.1: Standard Purchase Earning (All Tiers)

Navigate to **Membership Program Applet** > **Earning Rules**

Click **"+"** to create new earning rule

**Rule: Bronze Purchase Points**

| Field | Value |
|-------|-------|
| Rule Name | `Bronze Purchase Points` |
| Rule Code | `EARN-BRONZE-PURCH` |
| Description | `Standard earning for Bronze members` |
| Member Class | `BRONZE` |
| Trigger Event | `Sales Transaction - Complete` |
| Status | `Active` |

**Calculation Method:**

| Field | Value |
|-------|-------|
| Calculation Type | `Amount-Based` |
| Base Amount | `Transaction Total (excluding tax)` |
| Earning Rate | `1 point per $1` |
| Multiplier | `1.0` (Bronze base rate) |
| Rounding | `Round down to nearest whole point` |

**Conditions:**

| Field | Value |
|-------|-------|
| Minimum Purchase | `$5.00` (prevent tiny transactions) |
| Maximum Points Per Transaction | `10,000` (fraud prevention) |
| Excluded Categories | `Gift Cards, Memberships` |
| Excluded Payment Types | `None` |

**Points Award:**

| Field | Value |
|-------|-------|
| Points Currency | `RWDPTS` |
| Award Timing | `Immediate upon transaction completion` |
| Reversal Rule | `Reverse points if transaction refunded` |

Click **"Save"**

**Rule: Silver Purchase Points**

Create similar rule for Silver:

| Field | Value |
|-------|-------|
| Rule Name | `Silver Purchase Points` |
| Member Class | `SILVER` |
| Earning Rate | `1.5 points per $1` |
| Multiplier | `1.5` |

**Rule: Gold Purchase Points**

Create for Gold tier:

| Field | Value |
|-------|-------|
| Rule Name | `Gold Purchase Points` |
| Member Class | `GOLD` |
| Earning Rate | `2 points per $1` |
| Multiplier | `2.0` |

### Step 4.2: Welcome Bonus Rule

Create earning rule for new member enrollment:

**Configuration:**

| Field | Value |
|-------|-------|
| Rule Name | `New Member Welcome Bonus` |
| Rule Code | `EARN-WELCOME` |
| Description | `One-time bonus for joining` |
| Member Class | `All Classes` |
| Trigger Event | `Member Enrollment - First Time` |
| Status | `Active` |

**Award Details:**

| Field | Value |
|-------|-------|
| Points Type | `Fixed Amount` |
| Points Awarded | `50 points` |
| Points Currency | `RWDPTS` |
| Award Timing | `Immediate upon enrollment` |
| One-Time Only | `Yes` |
| Expiry | `Points follow standard expiry rules` |

Click **"Save"**

### Step 4.3: Birthday Bonus Rules

Create birthday earning rules for each tier:

**Bronze Birthday Bonus:**

| Field | Value |
|-------|-------|
| Rule Name | `Bronze Birthday Bonus` |
| Member Class | `BRONZE` |
| Trigger Event | `Member Birthday Month` |
| Points Awarded | `100 points` |
| Award Timing | `First day of birthday month` |
| Frequency | `Annual` |

**Silver Birthday Bonus:**

| Field | Value |
|-------|-------|
| Rule Name | `Silver Birthday Bonus` |
| Member Class | `SILVER` |
| Points Awarded | `250 points` |

**Gold Birthday Bonus:**

| Field | Value |
|-------|-------|
| Rule Name | `Gold Birthday Bonus` |
| Member Class | `GOLD` |
| Points Awarded | `500 points` |

**✓ Checkpoint:** Earning rules configured for purchases, welcome bonus, and birthday bonuses

### Step 4.4: Test Earning Calculation

Before proceeding, test the earning logic:

**Test Scenario:**
- Bronze member purchases $50 of products
- Expected: 50 points (50 × 1.0)

**Test Scenario:**
- Silver member purchases $100 of products
- Expected: 150 points (100 × 1.5)

**Test Scenario:**
- Gold member purchases $100 of products
- Expected: 200 points (100 × 2.0)

## Phase 5: Configure Redemption Options

Define how members can use their points.

### Step 5.1: Points-to-Cash Redemption

Navigate to **Membership Program Applet** > **Redemption Rules**

Click **"+"** to create redemption rule

**Configuration:**

| Field | Value |
|-------|-------|
| Redemption Name | `Points to Cash Discount` |
| Redemption Code | `REDEEM-CASH` |
| Description | `Convert points to purchase discount` |
| Redemption Type | `Points to Cash` |
| Status | `Active` |
| Available To | `All Member Classes` |

**Conversion Rate:**

| Field | Value |
|-------|-------|
| Points Required | `100 points` |
| Cash Value | `$1.00` |
| Conversion Ratio | `100:1` |

**Redemption Limits:**

| Field | Value |
|-------|-------|
| Minimum Redemption | `500 points` ($5 value) |
| Maximum Redemption Per Transaction | `10,000 points` ($100 value) |
| Maximum Redemption % of Purchase | `50%` (can't pay entirely with points) |
| Minimum Purchase for Redemption | `$10.00` |

**Restrictions:**

| Field | Value |
|-------|-------|
| Excluded Categories | `Gift Cards, Sale Items, Memberships` |
| Excluded Products | None |
| Combinable with Discounts | `No` (choose one) |
| Combinable with Coupons | `Yes` |

Click **"Save"**

### Step 5.2: Member-Exclusive Redemption Items (Optional)

Create special redemption for exclusive products:

**Configuration:**

| Field | Value |
|-------|-------|
| Redemption Name | `Gold Member Exclusive Gifts` |
| Redemption Type | `Points to Products` |
| Available To | `GOLD members only` |

**Redemption Catalog:**

| Product | Points Required |
|---------|----------------|
| Premium Tote Bag | 1,000 points |
| Luxury Scarf | 2,500 points |
| Designer Sunglasses | 5,000 points |
| VIP Event Ticket | 10,000 points |

**✓ Checkpoint:** Redemption rules configured for cash discount and exclusive items

## Phase 6: Configure Pricebook for Member Pricing

Set up tier-based discounts via Pricebook.

### Step 6.1: Create Member Price Lists

Navigate to **Pricebook Applet**

Click **"+"** to create price list

**Bronze Member Pricing:**

| Field | Value |
|-------|-------|
| Price List Code | `MEMBER-BRONZE` |
| Price List Name | `Bronze Member Pricing` |
| Description | `5% discount for Bronze members` |
| Currency | Your local currency |
| Effective Date | Today's date |
| Expiry Date | `None` (ongoing) |

**Discount Configuration:**

| Field | Value |
|-------|-------|
| Discount Type | `Percentage` |
| Discount Value | `5%` |
| Apply To | `All Products` (or specific categories) |
| Excluded Items | `Sale items, Gift cards` |

**Assignment:**

| Field | Value |
|-------|-------|
| Assigned To | `Customer Group: Bronze Members` |
| Priority | `10` |
| Auto-Apply | `Yes` |

Click **"Save"**

**Silver Member Pricing:**

Create similar price list:

| Field | Value |
|-------|-------|
| Price List Code | `MEMBER-SILVER` |
| Discount Value | `10%` |
| Assigned To | `Customer Group: Silver Members` |

**Gold Member Pricing:**

| Field | Value |
|-------|-------|
| Price List Code | `MEMBER-GOLD` |
| Discount Value | `15%` |
| Assigned To | `Customer Group: Gold Members` |

**✓ Checkpoint:** Member pricing configured with 5%, 10%, and 15% discounts by tier

## Phase 7: Configure Expiry Rules (Optional)

Set up points expiration for liability management.

### Option A: No Expiry (Simplest)

Points never expire. No configuration needed.

**Pros:**
- Simplest to manage
- Most member-friendly
- Encourages long-term engagement

**Cons:**
- Higher liability on balance sheet
- No urgency for redemption

### Option B: Annual Expiry

Points expire at end of each year.

**Configuration:**

Navigate to **Membership Program Applet** > **Expiry Rules**

| Field | Value |
|-------|-------|
| Rule Name | `Annual Points Expiry` |
| Applies To | `All points in RWDPTS currency` |
| Expiry Type | `Fixed Date Annually` |
| Expiry Date | `December 31st` |
| Grace Period | `30 days` (warning period) |
| Notification | `Email 60 days, 30 days, 7 days before` |

### Option C: Rolling Expiry

Points expire 12 months after earning.

**Configuration:**

| Field | Value |
|-------|-------|
| Rule Name | `12-Month Rolling Expiry` |
| Expiry Type | `Rolling from Earn Date` |
| Expiry Period | `12 months` |
| Grace Period | `None` |
| Notification | `Email 30 days before expiry` |

**Recommendation for First Program:** Start with **No Expiry** for simplicity. Add expiration later if needed for liability management.

## Phase 8: Test Complete Member Journey

Thoroughly test all functionality before launch.

### Test 8.1: New Member Enrollment

**Test Steps:**

1. Navigate to **Customer Maintenance Applet**
2. Click **"+"** to create new customer
3. Enter customer details:

```
First Name: Jane
Last Name: Smith
Email: jane.smith@example.com
Phone: (555) 123-4567
Birthday: March 15, 1985
```

4. In Membership section:
   - Check **"Enroll in Membership Program"**
   - Program: **Rewards Plus**
   - Member Class: **BRONZE** (should auto-select as default)
   - Points Currency: **RWDPTS** (auto-selected)

5. Click **"Save"**

**Expected Results:**
- ✓ Customer created successfully
- ✓ Membership active with BRONZE tier
- ✓ Welcome bonus: 50 RWDPTS awarded automatically
- ✓ Member ID generated

**✓ Checkpoint:** Member enrollment works with welcome bonus

### Test 8.2: Points Earning on Purchase

**Test Steps:**

1. Go to **POS** or **Sales** module
2. Create sale for Jane Smith
3. Add products totaling $75.00
4. Complete transaction
5. Check Jane's points balance

**Expected Results:**
- ✓ Transaction completed
- ✓ 75 points earned (75 × 1.0 for Bronze)
- ✓ Total balance: 125 points (50 welcome + 75 earned)
- ✓ Transaction appears in points history

### Test 8.3: Tier Progression

**Simulate progression to Silver tier:**

1. Use **Membership Admin Console**
2. Find Jane Smith's account
3. Manually adjust points to 2,050 (for testing)
4. Trigger tier evaluation (or wait for automated check)

**Expected Results:**
- ✓ Jane automatically upgraded to SILVER tier
- ✓ Earning rate now 1.5x
- ✓ Member discount now 10%
- ✓ Notification sent (if configured)

**Test Silver Earning Rate:**

1. Create $100 purchase for Jane
2. Check points earned

**Expected Results:**
- ✓ 150 points earned (100 × 1.5 for Silver)
- ✓ Confirms multiplier working correctly

### Test 8.4: Points Redemption

**Test Steps:**

1. Jane has 2,200 points total
2. Create new sale: $50.00 worth of products
3. Jane requests to use 1,000 points
4. Apply redemption

**Expected Results:**
- ✓ 1,000 points deducted from balance
- ✓ $10 discount applied (1,000 ÷ 100)
- ✓ New total: $40.00
- ✓ Remaining points: 1,200
- ✓ Redemption recorded in history

### Test 8.5: Birthday Bonus

**Test Steps:**

1. Set system date to March 1st (or use manual trigger)
2. Trigger birthday bonus processing
3. Check Jane's account (birthday March 15)

**Expected Results:**
- ✓ 250 points awarded (Silver birthday bonus)
- ✓ Points added to balance
- ✓ Birthday email sent (if configured)
- ✓ Bonus recorded in transaction history

### Test 8.6: Member Pricing

**Test Steps:**

1. Create sale for Jane Smith (Silver member)
2. Add product with regular price $100
3. Check pricing applied

**Expected Results:**
- ✓ 10% Silver discount applied automatically
- ✓ Price shown: $90.00
- ✓ Discount visible on receipt
- ✓ Member saves $10.00

**✓ Checkpoint:** All core functionality tested and working

## Phase 9: Configure Member Communications

Set up automated communications for member engagement.

### Email Templates

Create templates for these events:

**Welcome Email:**
```
Subject: Welcome to Rewards Plus!

Hi {{FirstName}},

Welcome to Rewards Plus! You've been enrolled as a Bronze Member and
we've added 50 bonus points to your account.

Your Member ID: {{MemberID}}
Current Points: {{PointsBalance}} pts

Start earning:
- 1 point for every $1 spent
- Birthday bonus: 100 points
- 5% member discount on all purchases

[View Your Account] [Shop Now]

Thank you for being a valued customer!
Urban Style Boutique
```

**Points Earned Notification:**
```
Subject: You earned {{PointsEarned}} points!

Hi {{FirstName}},

Thanks for your recent purchase! You've earned {{PointsEarned}} Rewards Plus points.

Transaction: {{TransactionDate}}
Amount: ${{TransactionAmount}}
Points Earned: {{PointsEarned}} pts

Your new balance: {{PointsBalance}} pts
Value: ${{PointsValue}}

[Redeem Points] [View History]

Keep shopping to earn more rewards!
```

**Tier Upgrade Notification:**
```
Subject: Congratulations! You're now a {{NewTier}} Member!

Hi {{FirstName}},

Great news! You've been upgraded to {{NewTier}} membership!

New Benefits:
- {{EarningRate}} earning rate
- {{Discount}}% member discount
- {{BirthdayBonus}} birthday bonus points
- Early access to sales

[See All Benefits] [Shop Now]

Thank you for your loyalty!
```

### SMS Notifications (Optional)

Configure SMS for time-sensitive notifications:

- Welcome enrollment
- Points earned confirmation
- Tier upgrade celebration
- Birthday bonus awarded
- Points expiring soon (if applicable)

## Phase 10: Set Up Reporting

Configure reports for program monitoring.

### Standard Reports to Enable

**Member Growth Report:**
- Total members by tier
- New enrollments by period
- Tier distribution
- Growth trend

**Points Activity Report:**
- Points issued by period
- Points redeemed by period
- Outstanding points liability
- Breakage rate (unredeemed points)

**Program Performance Report:**
- Member purchase frequency
- Average transaction value by tier
- Redemption rate
- Member lifetime value

**Financial Report:**
- Points liability valuation
- Redemption expense
- Membership revenue
- Net program cost

### Dashboard Configuration

Set up real-time dashboard with:

- Total active members
- Points earned today/this week/this month
- Points redeemed today/this week/this month
- New enrollments
- Tier distribution chart
- Top members by points balance

## Phase 11: Staff Training

Prepare your team for program launch.

### Training Materials Needed

**Enrollment Process:**
- How to sign up new members
- Collecting required information
- Issuing member cards
- Explaining program benefits

**Daily Operations:**
- Looking up member accounts
- Processing points earning
- Handling redemptions
- Applying member discounts

**Customer Service:**
- Answering member questions
- Checking points balances
- Explaining tier benefits
- Troubleshooting issues

### Role-Specific Training

**Cashiers/Sales Associates:**
- Member identification at checkout
- Points calculation explanation
- Redemption processing
- Receipt explanation

**Customer Service:**
- Account lookup and management
- Points balance inquiries
- Tier benefit explanations
- Dispute resolution

**Store Managers:**
- Program overview and objectives
- Performance monitoring
- Reporting and analytics
- Exception handling

## Phase 12: Soft Launch (Pilot Program)

Test with limited member group before full launch.

### Pilot Program Plan

**Duration:** 2-4 weeks

**Pilot Group Size:** 50-100 members

**Selection Criteria:**
- Mix of customer types (frequent/occasional)
- Representative demographics
- Willing to provide feedback
- Email contacts for communication

### Pilot Objectives

- Validate earning calculations
- Test redemption workflows
- Confirm tier progression
- Identify operational issues
- Gather member feedback
- Train staff with real members
- Refine communications

### Monitoring During Pilot

**Daily Checks:**
- Enrollment success rate
- Points calculation accuracy
- Redemption processing
- System performance
- Staff feedback

**Weekly Reviews:**
- Member satisfaction survey
- Issue log review
- Staff feedback sessions
- Configuration adjustments
- Communication refinements

### Success Criteria for Full Launch

- [x] 90%+ enrollment success rate
- [x] Zero calculation errors
- [x] Staff confident in operations
- [x] Positive member feedback
- [x] All issues resolved
- [x] Communications effective

## Phase 13: Full Launch

Roll out to all customers.

### Launch Day Checklist

**System Readiness:**
- [x] All configurations verified in production
- [x] Backup completed
- [x] Monitoring enabled
- [x] Support team briefed
- [x] Escalation procedures ready

**Marketing Readiness:**
- [x] In-store signage installed
- [x] Website updated
- [x] Email campaign scheduled
- [x] Social media posts ready
- [x] Staff wearing program badges/shirts

**Operational Readiness:**
- [x] All staff trained
- [x] Member cards/materials stocked
- [x] Enrollment stations set up
- [x] Quick reference guides distributed
- [x] Manager on-site for support

### Launch Day Activities

**Morning:**
- Team huddle to review procedures
- System functionality verification
- Test enrollment processing
- Open communication channels

**Throughout Day:**
- Monitor enrollment volume
- Track issues in real-time
- Provide staff support
- Collect customer feedback

**Evening:**
- Review day's performance
- Document issues and resolutions
- Plan adjustments for next day
- Celebrate successes with team

## Phase 14: Post-Launch Monitoring

Track program performance and optimize.

### First Week Monitoring

**Daily Metrics:**
- New enrollments
- Points earned
- Points redeemed
- System errors
- Customer complaints

**Issue Tracking:**
- Log all issues
- Categorize by type
- Assign resolution priority
- Track resolution time

### First Month Review

**Program Performance:**
- Total members enrolled
- Tier distribution
- Average points earned per member
- Redemption rate
- Member satisfaction score

**Optimization Opportunities:**
- Earning rate adjustments
- Tier criteria refinement
- Redemption threshold changes
- Communication improvements

### Ongoing Management

**Monthly Reviews:**
- Performance vs. objectives
- Financial impact analysis
- Member engagement trends
- Staff feedback

**Quarterly Enhancements:**
- New earning opportunities
- Seasonal promotions
- Tier benefit additions
- Technology improvements

## Success Metrics

Track these KPIs to measure program success:

### Membership Metrics

- **Total Active Members** - Growing member base
- **Enrollment Rate** - % of customers who join
- **Tier Distribution** - Balance across tiers
- **Churn Rate** - Members leaving program

### Engagement Metrics

- **Purchase Frequency** - Transactions per member per year
- **Average Transaction Value** - By tier comparison
- **Points Earning Velocity** - Points earned per member per month
- **Redemption Rate** - % of earned points redeemed

### Financial Metrics

- **Program ROI** - Revenue increase vs. program costs
- **Points Liability** - Outstanding unredeemed points value
- **Breakage Rate** - Points that expire or go unused
- **Member Lifetime Value** - By tier

### Operational Metrics

- **Enrollment Time** - Average time to sign up member
- **System Uptime** - Availability for transactions
- **Error Rate** - Calculation or processing errors
- **Resolution Time** - Issue resolution speed

## Troubleshooting Common Issues

### Members Not Earning Points

**Possible Causes:**
- Member class not assigned → Verify tier assignment
- Earning rule inactive → Check rule status
- Transaction type not eligible → Review trigger conditions
- Points currency mismatch → Confirm currency linkage

### Tier Progression Not Working

**Possible Causes:**
- Progression criteria not met → Verify point thresholds
- Automated evaluation disabled → Enable tier check process
- Time period calculation error → Review evaluation period
- Manual override preventing change → Check admin holds

### Redemption Errors

**Possible Causes:**
- Insufficient points balance → Verify member has enough points
- Below minimum threshold → Check 500-point minimum
- Excluded product category → Review redemption restrictions
- Maximum redemption exceeded → Check transaction limits

### Member Discount Not Applying

**Possible Causes:**
- Pricebook not linked to member class → Verify assignment
- Price list inactive or expired → Check effective dates
- Product excluded from discounts → Review exclusions
- Discount override in place → Check manual price adjustments

## Next Steps After Implementation

### Immediate (Week 1-4)

1. **Monitor Daily** - Track all metrics and resolve issues quickly
2. **Gather Feedback** - Survey members and staff
3. **Document** - Record learnings and best practices
4. **Optimize** - Make small adjustments based on data

### Short Term (Month 2-3)

1. **Marketing Campaigns** - Promote program benefits
2. **Member Segmentation** - Target communications by tier
3. **Performance Analysis** - Deep dive into program data
4. **Staff Recognition** - Reward top enrollment performers

### Medium Term (Month 4-6)

1. **Program Enhancements** - Add new earning opportunities
2. **Seasonal Promotions** - Double points campaigns
3. **Partner Integration** - Cross-promotion opportunities
4. **Technology Upgrades** - Mobile app, digital cards

### Long Term (6+ Months)

1. **Advanced Analytics** - Predictive modeling, churn prevention
2. **Personalization** - AI-driven recommendations
3. **Loyalty Network** - Partner business integration
4. **Gamification** - Badges, challenges, leaderboards

## Congratulations!

You've successfully implemented your first complete membership program!

**What You've Accomplished:**

✅ Created multi-currency points system
✅ Configured three-tier membership structure
✅ Set up earning rules with multipliers
✅ Enabled flexible redemption options
✅ Configured tier-based pricing
✅ Implemented tier progression logic
✅ Tested complete member journey
✅ Launched pilot program
✅ Deployed to production

**Your Program Includes:**

- **Rewards Plus** loyalty program
- **Three tiers** (Bronze, Silver, Gold)
- **Flexible earning** (1x, 1.5x, 2x multipliers)
- **Points redemption** (100 pts = $1)
- **Member pricing** (5%, 10%, 15% discounts)
- **Automated bonuses** (welcome, birthday)
- **Tier progression** (automated upgrades)

## Resources

### Documentation

- [Membership Module Overview](/modules/membership/) - Complete feature reference
- [Membership Admin Console](/applets/membership-admin-console-applet/) - Daily operations
- [Points Currency Configuration](/applets/membership-points-currency/) - Currency management
- [Membership Program Applet](/applets/membership-program/) - Program configuration

### Support

- **BigLedger Support Portal** - Technical assistance
- **Community Forum** - Best practices and tips
- **Implementation Services** - Professional consultation
- **Training Resources** - Video tutorials and guides

### Related Guides

- [POS Integration](/modules/pos/) - Connect to point of sale
- [E-Commerce Integration](/modules/ecommerce/) - Online member portal
- [Financial Accounting](/modules/financial-accounting/) - Liability tracking
- [Advanced Configurations](/modules/membership/configuration/) - Power user features

{{< callout type="tip" >}}
**Pro Tip**: Now that your program is live, focus on member engagement. The best loyalty program is one that members actively use. Regular communication, attractive redemption options, and clear path to tier advancement will drive program success.
{{< /callout >}}
