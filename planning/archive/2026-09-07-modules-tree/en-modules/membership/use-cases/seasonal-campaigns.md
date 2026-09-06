---
title: "Seasonal Campaigns and Promotions"
description: "Time-limited campaigns, holiday promotions, temporary currencies, and event-based rewards"
weight: 50
---

## Business Context

Glamour Cosmetics is a beauty and personal care retailer with 40 stores and a growing e-commerce presence. Operating in a highly seasonal industry with major sales peaks during Chinese New Year, Raya, Christmas, and Valentine's Day, plus beauty-specific events like anniversary sales and product launches, the company needed a flexible membership system that could support dynamic seasonal campaigns while maintaining a consistent underlying loyalty program.

### Seasonal Dynamics in Beauty Retail

The beauty industry experiences significant seasonal fluctuations driven by cultural celebrations, gifting occasions, and product launch cycles. Glamour Cosmetics saw annual patterns:

**Peak Seasons**
- Chinese New Year (January/February): 180% of baseline sales
- Valentine's Day (February): 140% of baseline
- Raya (Ramadan/Eid): 200% of baseline sales
- Christmas (December): 160% of baseline
- Anniversary Sale (July): 220% of baseline sales

**Shoulder Periods**
- Post-holiday slumps (February, August): 60% of baseline
- Back-to-school season (January): 85% of baseline
- Mid-year lull (April-May): 70% of baseline

### Business Challenges

**Revenue Concentration**: 65% of annual revenue occurred during just 4-5 peak weeks, creating capacity and inventory challenges.

**Member Engagement Drops**: Member activity fell sharply during shoulder periods, with 40% of members not making any purchases for 3+ months.

**Promotional Fatigue**: Constant sales and promotions during peak periods diminished brand perception and margins.

**Inventory Management**: Difficult to forecast and manage inventory with extreme seasonal swings.

**New Product Launches**: Launching new beauty lines required special promotional mechanics to drive trial and adoption.

### Campaign Objectives

**Flatten Revenue Curve**: Use targeted campaigns to drive traffic during shoulder periods, reducing revenue concentration.

**Maintain Engagement**: Keep members active year-round with varied, exciting campaign mechanics.

**Drive Category Adoption**: Use campaigns to introduce members to new product categories and expand basket diversity.

**Controlled Promotional Investment**: Deliver compelling member value while maintaining margin targets.

**Create Urgency**: Use time-limited campaigns to drive immediate action and reduce procrastination.

## Campaign Framework

### Campaign Types

**1. Holiday Seasonal Campaigns**
Major cultural and commercial holidays with broad appeal and high participation rates. Typically 2-4 weeks duration with significant promotional investment.

**2. Shoulder Period Stimulation**
Targeted campaigns during slow periods to drive incremental traffic. Focus on value-adds rather than discounts to protect margins.

**3. Product Launch Campaigns**
Time-bound promotions to drive trial of new products or categories. Combine with temporary currencies for gamification.

**4. Member Milestone Campaigns**
Celebrate member anniversaries, birthdays, and tier achievements with personalized offers.

**5. Flash Campaigns**
Ultra-short duration (24-72 hours) to create urgency and excitement. Often unannounced to create surprise.

## Holiday Seasonal Campaign: Chinese New Year

### Campaign Overview

**Campaign Name**: Prosperity Rewards - CNY 2024
**Duration**: January 15 - February 15 (4 weeks, covering pre-CNY shopping and post-holiday redemption)
**Objective**: Drive gift purchases, increase basket size, introduce temporary currency for gamification

### Temporary Currency: Lucky Coins

In addition to regular points, introduce a temporary Chinese New Year currency called "Lucky Coins" that creates urgency and drives specific behaviors.

**Lucky Coins Configuration**
```yaml
Currency Code: CNY-COIN-2024
Currency Name: Lucky Coins
Currency Type: Temporary event currency
Display Symbol: 🧧
Validity Period: January 15 - February 28, 2024
Earning Method: Purchase thresholds and special activities
Redemption Method: Exclusive CNY rewards catalog
Cannot Convert: Not convertible to regular points
Expiry: Hard expiry on February 28, no extensions
```

**Earning Lucky Coins**
```yaml
Purchase-Based Earning:
  - RM100 purchase = 1 Lucky Coin
  - RM300 purchase = 4 Lucky Coins (1 bonus)
  - RM500 purchase = 7 Lucky Coins (2 bonus)
  - RM800+ purchase = 12 Lucky Coins (4 bonus)

Activity-Based Earning:
  - First purchase during campaign: 2 bonus Lucky Coins
  - Shopping at 2+ locations during campaign: 3 bonus Lucky Coins
  - Online + In-store purchase: 2 bonus Lucky Coins
  - Refer friend who makes purchase: 5 Lucky Coins

Social Engagement:
  - Share CNY collection on social media: 1 Lucky Coin
  - Write product review during campaign: 1 Lucky Coin per review (max 3)
  - Participate in in-store fortune telling event: 1 Lucky Coin

Daily Bonuses:
  - Lucky draw spin in mobile app (daily): Chance to win 1-10 Lucky Coins
  - Check-in at store during campaign: 1 Lucky Coin (max 5 times)
```

**Lucky Coins Redemption Catalog**
```yaml
Beauty Hampers:
  5 Lucky Coins: Deluxe sample set (RM50 value)
  8 Lucky Coins: Skincare starter kit (RM120 value)
  12 Lucky Coins: Premium beauty hamper (RM200 value)
  20 Lucky Coins: Luxury gift set (RM400 value)

Limited Edition Items:
  15 Lucky Coins: CNY limited edition lipstick set
  18 Lucky Coins: Zodiac-themed makeup palette
  25 Lucky Coins: Premium skincare set with red & gold packaging

Experiences:
  30 Lucky Coins: Personal makeup consultation (1 hour)
  40 Lucky Coins: VIP shopping experience + gift
  50 Lucky Coins: Grand prize draw entry (luxury beauty package worth RM2,000)

Gift Vouchers:
  10 Lucky Coins: RM100 gift voucher (valid March-April)
  20 Lucky Coins: RM250 gift voucher (valid March-April)
```

### Regular Points Bonus During CNY

In addition to Lucky Coins, enhance regular points earning during the campaign period.

**Points Multiplier**
```yaml
Campaign Points Boost:
  Base: Regular points earning continues (1 point per RM1)
  Campaign Multiplier: 2x points on all purchases
  Tier Stacking: Campaign multiplier stacks with tier multipliers

  Example for Gold Member (1.5x tier multiplier):
    RM300 purchase
    Base points: 300 points
    Tier multiplier: 300 × 1.5 = 450 points
    Campaign multiplier: 450 × 2 = 900 points total

Category-Specific Bonuses:
  Gift Sets: 3x points (instead of 2x)
  Limited Edition CNY Collections: 4x points
  Skincare category: 2.5x points
  Makeup category: 2x points (standard)
```

### Campaign Configuration Steps

**Step 1: Create Temporary Currency**
```yaml
Access: Membership Admin Console → Currencies → Create Temporary Currency

Configuration:
  Currency Code: CNY-COIN-2024
  Display Name: Lucky Coins
  Icon Upload: Red packet emoji/icon
  Start Date: 2024-01-15 00:00:00
  End Date: 2024-02-28 23:59:59
  Earning Rules: Manual configuration (purchase thresholds)
  Redemption Catalog: Create separate CNY rewards catalog
  Expiry Behavior: Hard delete all balances on end date
  Communication: Auto-reminder 7 days before expiry
```

**Step 2: Configure Earning Rules**
```yaml
Rule 1: Purchase Threshold Earning
  Trigger: Transaction completion
  Condition: Transaction total ≥ RM100
  Award Calculation:
    - RM100-299: 1 coin
    - RM300-499: 4 coins
    - RM500-799: 7 coins
    - RM800+: 12 coins
  Frequency: Per transaction
  Channel: All channels (in-store, online, mobile)

Rule 2: Multi-Location Bonus
  Trigger: Purchase at 2nd location during campaign
  Condition: 2+ different store locations
  Award: 3 bonus coins (one-time)
  Tracking: System tracks location history

Rule 3: Omnichannel Bonus
  Trigger: Purchase in both online and physical store
  Condition: At least 1 online AND 1 in-store transaction
  Award: 2 bonus coins (one-time)
  Tracking: Channel history during campaign period

Rule 4: Referral Bonus
  Trigger: Referred friend makes first purchase
  Condition: Friend enrolled during campaign, made qualifying purchase
  Award: 5 Lucky Coins to referrer
  Limit: Maximum 10 referrals per member
```

**Step 3: Create Redemption Catalog**
```yaml
Catalog Name: CNY Lucky Coins Rewards 2024
Availability: January 15 - February 28, 2024
Currency: CNY-COIN-2024 only (cannot mix with regular points)

Catalog Items Setup:
  Item: Premium Beauty Hamper
  SKU: CNY-HAMPER-001
  Points Cost: 12 Lucky Coins
  Stock: 500 units
  Image: CNY-themed hamper photo
  Description: "Curated selection of bestsellers in festive packaging"
  Fulfillment: Ship within 3 days
  Limit: 1 per member
  Availability: While stocks last

  Item: Grand Prize Draw Entry
  SKU: CNY-DRAW-2024
  Points Cost: 50 Lucky Coins
  Stock: Unlimited (draw entries)
  Description: "Enter grand draw for luxury beauty package worth RM2,000"
  Fulfillment: Draw date February 16, 2024
  Limit: 5 entries per member
  Notification: Winners announced February 18
```

**Step 4: Configure Regular Points Multiplier**
```yaml
Campaign Promotion: CNY 2x Points
Access: Membership Admin Console → Campaigns → Create Multiplier Campaign

Settings:
  Campaign Code: CNY2024-2X
  Campaign Name: Chinese New Year 2x Points
  Type: Points Multiplier
  Multiplier: 2.0x
  Start Date: 2024-01-15
  End Date: 2024-02-15
  Apply To: All members, all tiers
  Stack With Tier Multipliers: Yes (multiplicative)
  Excluded Categories: Gift cards, services
  Channels: All (online, in-store, mobile)

Category-Specific Multipliers:
  Category: Gift Sets
  Multiplier: 3.0x (overrides campaign base)

  Category: CNY Limited Edition
  Multiplier: 4.0x (overrides campaign base)
```

### Campaign Communication Plan

**Pre-Launch (1 week before)**
```yaml
Week of January 8:
  Email: Teaser email "Prosperity is coming..."
  Content: Mysterious hints about Lucky Coins
  Call-to-action: Mark calendar for January 15

  Social Media: Countdown posts
  Content: Daily countdown with sneak peeks of rewards
  Engagement: Comment to win early access Lucky Coins

  In-Store: Teaser posters
  Content: Visual displays hinting at campaign
```

**Launch Day (January 15)**
```yaml
Email Blast:
  Subject: "🧧 Collect Lucky Coins & Win Big This CNY!"
  Content:
    - Campaign overview and duration
    - How to earn Lucky Coins
    - Rewards catalog preview
    - Link to full catalog in app
  Segment: All active members (purchased in last 6 months)

SMS:
  Message: "CNY Prosperity Rewards starts today! Earn Lucky Coins with every purchase. Shop now: [link]"
  Timing: 10 AM

Mobile App:
  Push Notification: "🧧 Lucky Coins campaign is live! Start earning now"
  In-App: Full-screen campaign splash on app open
  Homepage: Featured banner with campaign details

In-Store:
  POS Prompts: Cashiers informed to mention campaign
  Displays: Window displays and checkout counters
  Staff Training: Brief on Lucky Coins mechanics
```

**Mid-Campaign (Week 2)**
```yaml
Progress Updates:
  Email: "You've collected 8 Lucky Coins - 4 more for the Premium Hamper!"
  Personalized: Show individual progress toward next reward tier
  Motivation: Highlight close rewards to encourage additional purchase

Social Proof:
  Email: "10,000 members have collected Lucky Coins - join them!"
  Content: Community participation stats
  Featured: Member testimonials and reward photos

Reminder:
  App Notification: "Lucky Coins expire February 28 - don't miss out!"
  Timing: Daily during last 2 weeks
```

**Final Week (February 8-15)**
```yaml
Urgency Messaging:
  Email: "Final week to earn Lucky Coins!"
  Content: Emphasize campaign ending, last chance to earn
  Highlight: Most popular rewards and remaining stock

Daily Flash Bonuses:
  Notification: "Today only: Double Lucky Coins on RM300+ purchases!"
  Create: Additional urgency and drive immediate action

Redemption Reminders:
  Email: "You have 15 Lucky Coins - redeem before February 28!"
  Segment: Members with unspent Lucky Coins
  Content: Quick redemption options and links
```

**Post-Campaign (February 16-28)**
```yaml
Redemption Period:
  Email: "Redemption deadline approaching - use your Lucky Coins!"
  Frequency: Weekly, then daily in final 3 days
  Content: Show balance, suggest redemptions

Final Reminder:
  Email: "LAST DAY to redeem Lucky Coins!"
  Timing: February 28, 9 AM
  Urgency: Bold subject line, clear expiry notice

Campaign Wrap-Up:
  Email: "Thank you for celebrating CNY with us!"
  Content: Campaign highlights, total Lucky Coins distributed
  Teaser: Hint at next seasonal campaign
  Gift: Small bonus regular points as thank you
```

## Shoulder Period Campaign: Post-CNY Reactivation

### Campaign Overview

**Campaign Name**: Beauty Refresh - March Madness
**Duration**: March 1-31 (immediately following CNY)
**Objective**: Re-engage members after holiday spending, drive shoulder period traffic
**Strategy**: Focus on personal indulgence and self-care after gift-giving season

### Campaign Mechanics

**No Temporary Currency**: Avoid fatigue after CNY Lucky Coins campaign

**Tiered Purchase Bonuses**: Reward increasing purchase amounts with gifts and bonuses

**Redemption Incentive**: Encourage point redemption to reduce liability and drive traffic

**New Product Focus**: Highlight spring product launches

**Tiered Reward Structure**
```yaml
Tier 1: RM100 Purchase
  Bonus: Choose 1 deluxe sample from selection of 5
  Additional: 200 bonus points
  Qualifying Products: Any purchase except sale items

Tier 2: RM200 Purchase
  Bonus: Choose 1 full-size product from selection of 8 mid-range items
  Additional: 500 bonus points
  Gift: Exclusive makeup bag
  Qualifying Products: Any purchase

Tier 3: RM350 Purchase
  Bonus: Premium gift set (worth RM80)
  Additional: 1,000 bonus points
  Gift: Deluxe travel set
  Special: Free shipping for online orders
  Qualifying Products: Any purchase

Tier 4: RM500+ Purchase
  Bonus: Luxury gift set (worth RM150)
  Additional: 2,000 bonus points
  Gift: Premium cosmetics organizer
  Special: Complimentary 30-minute makeup consultation
  Qualifying Products: Any purchase
```

**Redemption Bonus**
```yaml
Incentive: Bonus value when redeeming points in March
Offer: Redeem points for 15% extra value
Example:
  - 1,000 points normally = RM100
  - During campaign = RM115 value
Application: Automatically applied at checkout when redeeming points
Minimum: 500 points redemption to qualify for bonus
Maximum: 5,000 points bonus redemption per member
Objective: Drive point redemption and reduce liability
```

**New Product Launch Integration**
```yaml
Spring Collection Bonus:
  Product Category: Spring 2024 makeup collection
  Bonus: Triple points on all spring collection purchases
  Additional: Exclusive spring gift with any spring collection purchase over RM150
  Duration: Full campaign period
  Objective: Drive new product adoption and trial
```

### Configuration

**Tiered Rewards Setup**
```yaml
Campaign Type: Purchase Threshold Rewards
Campaign Code: MARCH-REFRESH-2024

Tier Configuration:
  Tier 1 (RM100):
    Threshold: RM100
    Gift: Sample selection (member chooses during checkout)
    Points Bonus: 200 points
    Fulfillment: Immediate at POS, online selection during checkout

  Tier 2 (RM200):
    Threshold: RM200
    Gift: Full-size product selection + makeup bag
    Points Bonus: 500 points
    Fulfillment: Cashier provides selection options, auto-added online

  Tier 3 (RM350):
    Threshold: RM350
    Gift: Premium gift set + travel set
    Points Bonus: 1,000 points
    Special Benefit: Free shipping (auto-applied online)
    Fulfillment: Packaged with order

  Tier 4 (RM500+):
    Threshold: RM500
    Gift: Luxury gift set + organizer
    Points Bonus: 2,000 points
    Special Benefit: Makeup consultation booking
    Fulfillment: Gifts with purchase, consultation booking follow-up
```

**Redemption Bonus Configuration**
```yaml
Promotion Type: Point Redemption Bonus
Promotion Code: MARCH-REDEEM-15
Bonus Percentage: 15%
Minimum Redemption: 500 points
Maximum Bonus Value: RM75 (5,000 points with bonus)
Calculation: Automatic at checkout
Application: Apply bonus value on top of standard redemption value

Example Calculations:
  Redeem 1,000 points:
    Standard value: RM100
    Bonus 15%: RM15
    Total discount: RM115

  Redeem 3,000 points:
    Standard value: RM300
    Bonus 15%: RM45
    Total discount: RM345
```

## Product Launch Campaign: New Skincare Line

### Campaign Overview

**Campaign Name**: Glow Up Challenge
**Duration**: 6 weeks (April 1 - May 15)
**Product**: New anti-aging skincare line (8 products)
**Objective**: Drive trial, gather reviews, create social buzz

### Gamification: Glow Points Challenge

Create a temporary engagement currency focused on product trial and content creation.

**Glow Points Configuration**
```yaml
Currency Code: GLOW-PTS-2024
Display Name: Glow Points
Icon: ✨
Duration: April 1 - May 15, 2024
Purpose: Encourage product trial, reviews, and social engagement
Expiry: May 31, 2024 (2-week redemption window after earning period)

Earning Activities:
  Purchase New Line:
    - Buy any 1 product: 10 Glow Points
    - Buy 2 products: 25 Glow Points
    - Buy 3+ products: 50 Glow Points
    - Buy full 8-product collection: 100 Glow Points + bonus gift

  Content Creation:
    - Write product review: 15 Glow Points per review (max 8 products)
    - Upload before/after photo with review: +10 bonus Glow Points
    - Share on social media (verified): 5 Glow Points per share (max 5)
    - Create video review (verified): 30 Glow Points (max 1)

  Engagement:
    - Attend in-store skincare workshop: 20 Glow Points
    - Complete online skincare quiz: 5 Glow Points
    - Refer friend who purchases new line: 25 Glow Points
    - Post progress update (week 2, 4, 6): 10 Glow Points each

  Daily Activities:
    - Check-in to app daily: 1 Glow Point (max 42 over 6 weeks)
    - Share daily skincare tip: 2 Glow Points (max 12 total)
```

**Glow Points Redemption**
```yaml
Immediate Rewards:
  25 Glow Points: Travel-size product from new line
  50 Glow Points: Full-size bonus product from new line
  75 Glow Points: Deluxe gift set (3 products)
  100 Glow Points: VIP skincare consultation + gift

Grand Prizes (Draw Entries):
  150 Glow Points: Entry to win 1-year supply of new skincare line
  200 Glow Points: Entry to win trip to skincare brand HQ + spa retreat

Exclusive Access:
  300 Glow Points: Beta tester for next product launch
  500 Glow Points: Lifetime VIP early access to all new launches
```

### Six-Week Challenge Structure

**Week 1-2: Product Discovery**
```yaml
Focus: Try products, learn about ingredients
Activities:
  - Purchase discount: 20% off new line
  - In-store demos every Saturday
  - Skincare quiz in app (earn 5 Glow Points)
  - Email series: Product education (1 product per 2 days)
Goal: Drive initial purchases and education
```

**Week 3-4: Engagement and Reviews**
```yaml
Focus: Share experiences, write reviews
Activities:
  - Review bonus: Triple Glow Points for reviews this week (15 → 45 points)
  - Social media contest: Best before/after photo wins bonus 100 Glow Points
  - In-store workshop: Skincare routine building (earn 20 Glow Points)
  - Email: "Share your glow story"
Goal: Generate user-generated content and social proof
```

**Week 5-6: Challenge Completion**
```yaml
Focus: Complete full regimen, share results
Activities:
  - Final progress post: Share 6-week journey (earn 30 Glow Points)
  - Complete collection bonus: Buy any remaining products at 15% off
  - Leaderboard reveal: Top 10 Glow Points earners win grand prizes
  - Email: Success stories from participants
Goal: Drive collection completion and celebrate results
```

**Post-Challenge (May 16-31)**
```yaml
Focus: Redemption and conversion
Activities:
  - Redemption period for Glow Points
  - Grand prize draw and winner announcement
  - Conversion offer: 30% off repurchase of new line products
  - Email: Thank you + replenishment reminder
Goal: Convert trial to repeat purchase behavior
```

## Flash Campaign: 48-Hour Super Sale

### Campaign Overview

**Campaign Name**: Secret Flash: Members-Only 48-Hour Sale
**Duration**: Friday 6 PM - Sunday 6 PM (48 hours)
**Announcement**: 2 hours before start (creates urgency)
**Objective**: Drive immediate traffic, reduce excess inventory, reward loyal members

### Campaign Mechanics

**Qualification**: Members-only (must have account and be logged in)

**Flash Discounts**
```yaml
Tiered Discounts by Member Tier:
  Silver Members: 25% off entire purchase
  Gold Members: 30% off entire purchase
  Platinum Members: 35% off entire purchase + free gift

Excluded Items:
  - Already on sale items
  - New launches (less than 30 days old)
  - Gift cards

Maximum Discount:
  - Silver: RM200 discount cap
  - Gold: RM400 discount cap
  - Platinum: RM600 discount cap
```

**Points Earning During Flash Sale**
```yaml
Special Rule: Points earned on discounted prices
Calculation: Regular points on amount paid (after discount)
No Multiplier: Flash sale discount replaces points multipliers
Example:
  Purchase: RM300 retail
  Gold Member 30% discount: Pay RM210
  Points earned: 210 points (standard 1 point per RM1)
```

**Inventory Focus**: Select slow-moving inventory categories for deeper discounts

```yaml
Super Flash Categories:
  Fragrance Section: Additional 10% off (on top of tier discount)
  Hair Care: Additional 10% off
  Tools & Accessories: Buy 2 get 1 free

Limited Quantity Lightning Deals (Hourly):
  Hour 1-4: Premium skincare set at 50% off (20 units)
  Hour 5-8: Makeup palette collection at 60% off (30 units)
  Hour 9-12: Hair styling tools at 55% off (15 units)
  Continues every 4 hours...
```

### Configuration and Execution

**Pre-Launch Setup (Confidential)**
```yaml
Campaign Configuration:
  Code: FLASH-WEEKEND-0415
  Type: Time-limited tier-based discount
  Duration: April 15 6PM - April 17 6PM
  Visibility: Hidden until 4 PM April 15

Discount Rules:
  Silver Tier: 25% discount, RM200 cap
  Gold Tier: 30% discount, RM400 cap
  Platinum Tier: 35% discount, RM600 cap
  Application: Automatic at checkout when member identified

Inventory Targeting:
  Select SKUs with 60+ days stock
  Apply additional category discounts
  Lightning deals every 4 hours (pre-configured)

Staff Preparation:
  Briefing: Friday 4 PM (2 hours before launch)
  Additional staff: Scheduled for weekend coverage
  POS Training: Flash sale mechanics
  Customer Service: Prepared for high volume inquiries
```

**Launch Sequence**
```yaml
4:00 PM Friday:
  - Campaign activated in system (still hidden)
  - Staff briefing completed
  - Inventory verification final check

4:00 PM Friday - First Communication:
  - Email to Platinum members only (2-hour exclusive access)
  - Subject: "Exclusive: You're invited to a secret flash sale"
  - App push to Platinum: "Your VIP flash sale starts in 2 hours"

6:00 PM Friday - Full Launch:
  - Email blast to all members
  - Subject: "FLASH SALE: 48 hours only - Up to 35% off!"
  - SMS to active members (purchased in last 30 days)
  - App push notification: "Flash Sale is LIVE!"
  - Social media announcement
  - Homepage takeover: Flash sale banner

Every 4 Hours - Lightning Deal Alerts:
  - App push: "NEW Lightning Deal: 50% off premium skincare - 20 units only!"
  - In-app countdown timer
  - Stock counter: "12 remaining"

12 Hours Before End:
  - Email: "Final 12 hours of flash sale!"
  - App push: "Don't miss out - flash sale ends tomorrow 6 PM"

6 Hours Before End:
  - SMS: "LAST CHANCE: Flash sale ends in 6 hours!"

1 Hour Before End:
  - App push: "FINAL HOUR! Flash sale ends in 60 minutes"

6:00 PM Sunday - Campaign End:
  - Automatic deactivation
  - Thank you email next morning
  - Campaign performance summary to management
```

## Best Practices for Seasonal Campaigns

### Campaign Calendar Planning

**Annual Planning**
```yaml
Create 12-Month Campaign Calendar:
  Q1: CNY (January), Valentine's (February), March Refresh
  Q2: Product Launches (April-May), Mid-Year Sale (June)
  Q3: Back-to-Beauty (August), Anniversary Sale (September)
  Q4: Halloween (October), 11.11 (November), Christmas (December)

Spacing Considerations:
  - Minimum 2 weeks between major campaigns
  - 4-6 weeks between temporary currency campaigns (avoid fatigue)
  - Balance discount campaigns with engagement campaigns
  - Coordinate with inventory and product launch cycles
```

### Temporary Currency Best Practices

**When to Use Temporary Currencies**
- Major seasonal campaigns (2-4 times per year maximum)
- Product launches requiring intensive engagement
- Special milestone celebrations (brand anniversary, etc.)

**When NOT to Use**
- Back-to-back campaigns (avoid fatigue)
- Simple discount promotions (regular points work better)
- Short duration (less than 2 weeks - not enough earning time)

**Design Principles**
```yaml
Clear Value: Members must understand earning and redemption immediately
Limited Duration: Create urgency (4-8 weeks maximum)
Compelling Rewards: Exclusive items only available via temporary currency
Simple Mechanics: Easy earning rules, not overly complex
Hard Expiry: No extensions (maintains urgency)
Separate Tracking: Don't mix with regular points to avoid confusion
```

### Communication Cadence

**Campaign Communication Schedule**
```yaml
Pre-Launch:
  -7 days: Teaser to build anticipation
  -3 days: Preview of rewards/mechanics
  -1 day: Final reminder and countdown

Launch Day:
  Hour 0: Full campaign announcement all channels
  Hour 4: App notification reminder
  Day 1: In-store signage and staff mentions

Mid-Campaign:
  Weekly: Progress updates and achievement celebrations
  Bi-weekly: Reminder of campaign end date

Final Week:
  -7 days: Week remaining reminder
  -3 days: Final days urgency message
  -1 day: Last chance messaging
  Last 6 hours: Countdown notifications

Post-Campaign:
  +1 day: Thank you message
  +7 days: Campaign results (if appropriate)
  +14 days: Teaser for next campaign
```

### Performance Tracking

**Campaign KPIs**
```yaml
Participation Metrics:
  - % of members who participated
  - Average transaction value during campaign vs. baseline
  - Transactions per participating member
  - New member enrollments during campaign

Financial Metrics:
  - Total revenue during campaign
  - Incremental revenue vs. baseline period
  - Average margin (campaign vs. regular)
  - ROI of promotional investment

Engagement Metrics:
  - Temporary currency earned distribution
  - Redemption rate of temporary currency
  - Regular points earning during campaign
  - App engagement (opens, time spent)

Long-term Impact:
  - Repeat purchase rate post-campaign
  - Member retention 90 days post-campaign
  - Cross-category purchase behavior change
  - Customer lifetime value impact
```

This seasonal campaigns use case demonstrates how BigLedger's Membership Module supports sophisticated time-limited campaigns with temporary currencies, tiered rewards, flash promotions, and product launch mechanics that drive engagement, manage seasonal business fluctuations, and create excitement throughout the year while maintaining program integrity and profitability.
