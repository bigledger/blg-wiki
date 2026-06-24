---
title: "Voucher Rewards"
description: "Implementing voucher-based rewards as alternatives to immediate pricing discounts"
weight: 30
---

Voucher rewards provide an alternative to immediate pricing discounts and point redemption by issuing vouchers that members redeem during future transactions. Vouchers support promotional campaigns, deferred benefits, gift certificates, and other reward scenarios where immediate pricing isn't appropriate.

## Understanding Voucher Rewards

A voucher is a digital or physical certificate that represents a specific value or benefit that can be redeemed during transactions. Unlike pricing schemes that apply discounts automatically, vouchers are issued to members and then explicitly presented during checkout to receive the benefit.

**How Vouchers Differ from Pricing Schemes:**
- **Pricing Schemes:** Apply automatically based on member eligibility
- **Vouchers:** Require explicit presentation and redemption action
- **Pricing Schemes:** Continuous benefits as long as member qualifies
- **Vouchers:** One-time use that expires after redemption

**How Vouchers Differ from Point Redemption:**
- **Point Redemption:** Reduces accumulated point balance
- **Vouchers:** Separate instrument that doesn't affect point balance
- **Point Redemption:** Flexible value application
- **Vouchers:** Fixed value or benefit specified by voucher

**When to Use Vouchers:**
- Birthday or anniversary benefits
- Referral rewards
- Campaign incentives and bonuses
- Gift certificates
- Service recovery compensation
- Welcome bonuses for new members
- Tier upgrade rewards
- Surprise and delight moments

## Types of Voucher Rewards

Different voucher types serve different purposes:

**Cash Value Vouchers** represent specific monetary amounts:
- "$10 Off Your Next Purchase" voucher
- "$25 Gift Certificate" voucher
- Redeemable toward any transaction up to voucher value
- Most flexible voucher type

**Percentage Discount Vouchers** provide percentage-based discounts:
- "20% Off Your Next Purchase" voucher
- "Save 15% This Month" voucher
- Applied to transaction total or specific categories
- Useful for variable-value rewards

**Free Item Vouchers** entitle bearer to specific products:
- "Free Coffee" voucher
- "Free Product of Your Choice" voucher
- Redeemable for designated items only
- Promotes trial of specific products

**Category-Specific Vouchers** limit redemption to categories:
- "$15 Off Electronics" voucher
- "25% Off Apparel" voucher
- Drives behavior toward strategic categories
- Combines value with category targeting

**Minimum Purchase Vouchers** require threshold spending:
- "$5 Off Orders Over $50" voucher
- "Free Shipping on $100+ Orders" voucher
- Encourages larger basket sizes
- Protects margins on small transactions

**Experiential Vouchers** provide service benefits:
- "Free Gift Wrapping" voucher
- "Express Checkout Access" voucher
- "Personal Shopping Session" voucher
- Creates memorable experiences beyond discounts

## Creating Vouchers in BigLedger

The specific process for creating vouchers varies by BigLedger implementation:

**Access Voucher Configuration.** Navigate to the voucher management function within BigLedger. This might be:
- In the Membership Module under Rewards > Vouchers
- In a Promotions module if separate from Membership
- Within Sales & CRM if vouchers are treated as promotional instruments
- Consult your implementation documentation for the exact location

**Initiate New Voucher.** Click "New Voucher" or "Create Voucher" to open the voucher definition form.

**Define Voucher Type.** Select the voucher category:
- Cash value voucher
- Percentage discount voucher
- Free item voucher
- Custom benefit voucher

**Enter Voucher Details:**

**Voucher Code.** Assign a unique identifier:
- Auto-generated code for system-issued vouchers
- Custom code for specific campaigns (e.g., "WELCOME10")
- Codes used for redemption and tracking

**Voucher Name and Description.** Provide clear details:
- Name: "Welcome Bonus - $10 Off"
- Description: "$10 discount on any purchase over $50"
- Description appears in member communications

**Set Voucher Value.** Define the benefit:
- Fixed amount: $10, $25, $50
- Percentage: 10%, 15%, 20%
- Free item: Specify item code
- Service benefit: Describe clearly

**Configure Redemption Rules:**

**Minimum Purchase Requirement.** Set thresholds if applicable:
- Minimum transaction amount for redemption
- Prevents redeeming large vouchers on small purchases

**Maximum Discount Cap.** Limit the benefit:
- Percentage vouchers might cap at maximum dollar amount
- "Save 20% up to $50 maximum" prevents excessive discounts on high-value purchases

**Category Restrictions.** Limit where voucher applies:
- Specific product categories only
- Exclude certain items (clearance, gift cards)
- Restrict to online or in-store only

**Quantity Limits.** Control redemption scope:
- Single-use (one voucher per transaction)
- Multi-use (voucher can be applied to multiple items)
- Combination rules (can/cannot combine with other promotions)

**Set Effective Dates:**

**Issue Date.** When voucher becomes available to member

**Expiration Date.** When voucher becomes invalid:
- Fixed date: "Expires December 31, 2024"
- Relative date: "Valid for 30 days from issue"
- Choose based on campaign objectives

**Redemption Period.** Optional additional windows:
- Blackout dates when voucher can't be used
- Specific days/times when voucher is valid

**Configure Issuance Parameters:**

**Issuance Method.** How vouchers are distributed:
- Manual issuance by staff
- Automatic issuance based on triggers
- Bulk issuance to member segments
- Member self-service generation

**Target Audience.** Who can receive vouchers:
- Specific member classes
- Members with particular labels
- All active members
- Individual members by selection

**Save Voucher Configuration.** Click "Save" to create the voucher template. It's now ready for issuance to members.

## Issuing Vouchers to Members

Once vouchers are configured, they need to be issued:

**Manual Issuance to Individual Member:**
1. Access the member's record
2. Navigate to vouchers section
3. Select voucher to issue
4. Specify quantity (usually 1)
5. Save to issue voucher to member
6. Member receives notification with voucher code

**Bulk Issuance to Member Segment:**
1. Define target segment (e.g., all Gold members)
2. Select voucher to issue
3. Specify issuance criteria
4. Execute bulk issuance process
5. System issues voucher to all qualifying members
6. Batch notification sent to recipients

**Automated Trigger-Based Issuance:**
- Birthday: Automatically issue birthday voucher on member's birthday
- Anniversary: Issue voucher on membership anniversary date
- Milestone: Issue voucher when member reaches spending threshold
- Referral: Issue voucher when referred member makes first purchase

**Member Self-Service Issuance:**
- Member earns voucher through achievement
- Voucher appears in member's account
- Member activates voucher for use
- Provides sense of control and discovery

**Campaign-Driven Issuance:**
- Promotional campaign distributes vouchers to participants
- Email campaign includes unique voucher codes
- In-app notification delivers voucher to member's wallet
- POS staff distribute printed vouchers

## Voucher Redemption Process

How members use vouchers during transactions:

**Member Presents Voucher.** During checkout:
- Member mentions they have a voucher
- Staff asks for voucher code
- Member provides code verbally, shows digital voucher, or presents physical voucher

**System Validates Voucher.** POS or e-commerce system checks:
- Is voucher code valid?
- Has it already been redeemed?
- Is it within valid date range?
- Does member qualify to use it?
- Does transaction meet voucher requirements (minimum purchase, category, etc.)?

**Validation Passes.** If voucher is valid:
- System applies voucher benefit to transaction
- Discount or free item is added
- Transaction total is reduced
- Voucher is marked as redeemed

**Transaction Completes.** Final processing:
- Member pays adjusted total
- Receipt shows voucher benefit applied
- Voucher status updated to "Redeemed"
- Redemption recorded in member and transaction history

**Validation Fails.** If voucher is invalid:
- System displays error message explaining why
- Staff communicates issue to member
- Options: Correct the error if possible, or proceed without voucher
- Member may contact customer service if dispute arises

## Voucher Campaign Design

Using vouchers effectively in campaigns:

**Welcome Campaign Vouchers.** New member incentives:
- Issue "$10 off your first purchase" welcome voucher at enrollment
- Short expiry (30-60 days) drives early engagement
- Minimum purchase requirement protects margins
- Tracks new member activation rate

**Birthday/Anniversary Vouchers.** Celebratory rewards:
- Automatically issue on member's birthday
- "Happy Birthday! Enjoy $15 off this month"
- Creates positive emotional connection
- Valid for birth month only

**Referral Vouchers.** Incentivize member referrals:
- Referring member receives "$20 Off" voucher when referral makes first purchase
- Referred member receives "Welcome: $10 Off" voucher at signup
- Both parties benefit, driving viral growth
- Track referral attribution through voucher usage

**Reactivation Vouchers.** Win back lapsed members:
- Issue "We miss you! $25 off your next visit" to inactive members
- Generous value acknowledges absence
- Limited-time expiry creates urgency
- Monitor reactivation conversion rates

**Tier Upgrade Vouchers.** Reward tier progression:
- "Congratulations on reaching Gold! Here's $50 to celebrate"
- Reinforces value of tier achievement
- Encourages spending in new tier
- Builds loyalty through recognition

**Apology/Service Recovery Vouchers.** Compensate for issues:
- Issue vouchers to resolve complaints
- Value commensurate with problem severity
- Demonstrates commitment to making things right
- Tracks service recovery costs

## Managing Voucher Inventory

For physical or limited-quantity vouchers:

**Voucher Inventory Tracking.** Monitor available vouchers:
- Total quantity issued
- Quantity redeemed
- Quantity expired
- Quantity still outstanding

**Budget Management.** Control voucher liability:
- Set maximum quantity for campaign
- Track cumulative value issued
- Monitor redemption rates
- Forecast financial impact

**Expiration Management.** Handle expired vouchers:
- Automatically mark vouchers as expired on expiry date
- Relief of liability for expired unredeemed vouchers
- Report on expiry rates and patterns
- Adjust expiry periods based on redemption behavior

**Extension Requests.** Handle member requests to extend vouchers:
- Customer service can extend expiry dates
- Document extension policy and authorization levels
- Track extension volume for policy review
- Balance member satisfaction with liability management

## Voucher Reporting and Analytics

Monitor voucher program performance:

**Issuance Reports.** Track voucher distribution:
- Number of vouchers issued by type
- Member segments receiving vouchers
- Issuance timing and volume
- Cost of vouchers issued (potential liability)

**Redemption Reports.** Measure voucher usage:
- Redemption rate (redeemed ÷ issued)
- Average time from issuance to redemption
- Transaction size with voucher vs. without
- Member segments with highest redemption rates

**Financial Impact Reports.** Assess costs and benefits:
- Total discount value provided through vouchers
- Revenue generated from voucher-driven transactions
- Incremental margin from larger basket sizes
- ROI of voucher campaigns

**Campaign Performance Reports.** Evaluate specific campaigns:
- Welcome voucher conversion rate
- Birthday voucher redemption timing
- Referral voucher impact on acquisition
- Reactivation voucher success rate

**Expiry Analysis.** Understand unredeemed vouchers:
- Percentage of vouchers expiring unredeemed
- Time patterns in expiry (do vouchers expire before members can use them?)
- Member segments with higher expiry rates
- Adjustments needed to expiry periods

## Accounting for Vouchers

Vouchers create financial obligations:

**Liability Recognition.** When vouchers are issued:
- Debit: Voucher expense or marketing expense
- Credit: Voucher liability
- Amount: Face value of voucher or estimated redemption value

**Liability Reduction.** When vouchers are redeemed:
- Debit: Voucher liability
- Credit: Discount or promotion expense
- Amount: Actual value redeemed

**Breakage Recognition.** When vouchers expire unredeemed:
- Debit: Voucher liability
- Credit: Other income or breakage income
- Amount: Value of expired unredeemed vouchers

**Transaction Accounting.** Sales with voucher redemption:
- Gross sale minus voucher discount
- Net sales recorded
- Voucher liability relieved

**Audit Trail.** Maintain records:
- Voucher issuance details
- Redemption transactions
- Expiry processing
- Member and transaction linkage

## Integration with Other Reward Types

Vouchers complement other reward mechanisms:

**Vouchers + Point Redemption.** Combined approach:
- Members earn points on purchases
- Members also receive periodic vouchers
- Vouchers encourage transactions where points are earned
- Points provide flexible ongoing rewards

**Vouchers + Member Pricing.** Layered benefits:
- Members receive automatic pricing discounts via pricebooks
- Members also receive vouchers for special occasions
- Vouchers apply on top of member pricing (or policy may restrict)
- Creates comprehensive reward structure

**Vouchers + Tier Benefits.** Tier-specific vouchers:
- Higher tiers receive more valuable or frequent vouchers
- Vouchers demonstrate tangible tier benefit
- Aspirational motivation to reach higher tiers

**Combination Rules.** Define how vouchers interact:
- Can vouchers combine with member pricing? (Usually yes)
- Can vouchers combine with other promotions? (Varies)
- Can multiple vouchers be used in one transaction? (Usually no)
- Clear rules prevent confusion and disputes

## Best Practices for Voucher Rewards

**Choose Appropriate Expiry Periods.** Balance urgency with fairness:
- Welcome vouchers: 30-60 days (drive early engagement)
- Birthday vouchers: 30 days (create birthday month urgency)
- General vouchers: 60-90 days (reasonable time to use)
- Service recovery vouchers: Longer (1 year) to demonstrate goodwill

**Set Reasonable Minimum Purchases.** Protect margins while providing value:
- For $5 voucher: $25 minimum purchase (20% discount)
- For $10 voucher: $50 minimum purchase (20% discount)
- For $25 voucher: $100 minimum purchase (25% discount)
- Adjust based on your margins and strategy

**Communicate Clearly.** Voucher terms must be transparent:
- "Valid until December 31, 2024"
- "Minimum purchase $50 required"
- "Cannot be combined with other offers"
- "One voucher per transaction"
- Include terms in voucher notification and physical voucher

**Make Redemption Easy.** Reduce friction in voucher use:
- Simple redemption process at POS and online
- Clear instructions for members
- Staff training on voucher processing
- Digital wallet integration when possible

**Track and Analyze.** Monitor voucher performance:
- Are redemption rates meeting expectations?
- Are expiry periods appropriate?
- Are minimum purchases set correctly?
- Which voucher types drive best results?
- Adjust program based on data

**Budget Appropriately.** Manage voucher costs:
- Estimate redemption rates conservatively
- Set maximum issuance caps for campaigns
- Monitor actual redemption vs. projections
- Reserve budget for voucher liability

**Personalize When Possible.** Targeted vouchers perform better:
- Birthday vouchers feel personal and valued
- Category-specific vouchers match member interests
- Value tiers based on member segment
- Timing based on member behavior patterns

**Test Campaigns.** Before large-scale voucher campaigns:
- Test with small member segment
- Measure redemption rate and transaction impact
- Refine value, expiry, and terms based on results
- Scale successful campaigns to full member base

Voucher rewards add flexibility and promotional power to your membership program. Configure them strategically to drive desired behaviors, create memorable moments, and provide targeted benefits that complement your core pricing and point-based rewards.
