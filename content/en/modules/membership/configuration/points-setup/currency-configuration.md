---
title: "Currency Configuration"
description: "Creating and managing point currencies (PTS CCY) for your loyalty program"
weight: 10
---

Point currencies (PTS CCY) are the foundation of your loyalty program's earning and redemption mechanics. Each currency represents a distinct type of virtual value that members can accumulate and use. Configuring currencies properly ensures clear member communication, accurate accounting, and flexible program management.

## Understanding Point Currencies

A point currency in BigLedger is a defined unit of virtual value within your membership program. Just as your business operates in monetary currencies like USD or EUR, your loyalty program operates in point currencies you create and configure.

**Point currencies have distinct identities.** Each currency has its own code, name, and configuration. "REWARDS" might be your standard loyalty points, while "BONUS" could be a promotional currency with different rules.

**Members hold balances in each currency.** A member might have 5,000 REWARDS points and 1,200 BONUS points simultaneously. These balances are tracked separately and may have different earning, redemption, and expiry rules.

**Currencies can be converted.** You can configure conversion rates between currencies (covered in the Conversion Rates section) allowing points to flow from one currency type to another.

## When to Create Multiple Currencies

Most programs start with a single currency and add more only when specific needs arise:

**Single Currency Simplicity.** One currency for all earning and redemption is easiest for members to understand and simplest to administer. Members earn "points," accumulate "points," and redeem "points."

**Reasons for Multiple Currencies:**
- **Promotional Points:** Temporary bonus currencies that convert to standard points after validation periods
- **Restricted Points:** Non-transferable points earned through specific channels that have usage restrictions
- **Partner Points:** Points earned through partners that may have different values or redemption options
- **Tier-Specific Points:** Premium currencies available only to higher-tier members
- **Regional Currencies:** Different point types for programs operating across regions with distinct rules

**Avoid Unnecessary Complexity.** Don't create multiple currencies just for organizational convenience. Each additional currency increases member confusion and administrative overhead.

## Creating a Point Currency

To create a new point currency, access the Membership Points Currency applet through BigLedger's configuration interface.

For detailed step-by-step instructions on creating and managing point currencies, refer to the dedicated applet documentation:

**[Membership Points Currency Applet](/applets/membership-points-currency.md)**

The applet documentation covers:
- Accessing the point currency configuration interface
- Creating new point currency records
- Defining currency codes and names
- Configuring currency-specific settings
- Managing existing currencies
- Best practices for currency maintenance

This section focuses on configuration strategy and business considerations for your points system. The applet documentation provides the detailed operational procedures.

## Currency Configuration Strategy

When planning your point currency structure:

**Choose Descriptive Currency Codes.** Currency codes are typically 3-10 character identifiers used internally in BigLedger. Examples: "REWARDS," "BONUS," "PROMO," "MILES." Choose codes that clearly indicate the currency's purpose.

**Select Member-Friendly Names.** Currency names appear in member-facing communications and interfaces. Names like "Rewards Points," "Bonus Points," or "Travel Miles" are clearer to members than internal codes.

**Define Currency Purpose.** Document what each currency is for, when it's earned, how it can be redeemed, and any restrictions. This documentation ensures consistent administration and clear member communication.

**Plan Currency Relationships.** If using multiple currencies, map out how they relate. Can promotional points convert to rewards points? At what rate? Are any currencies isolated from conversions?

**Consider Accounting Implications.** Each currency may require separate liability tracking in your financial system. Coordinate with your accounting team on how different currencies should be valued and reported.

## Currency-Specific Settings

Different currencies may have different operational characteristics:

**Display Settings** control how the currency appears to members. Specify:
- Display name (what members see)
- Decimal places (typically 0 for points, though some programs use decimals)
- Symbol or icon if used in visual displays

**Earning Rules** may vary by currency:
- REWARDS points earned on all purchases
- BONUS points earned only through promotional campaigns
- PROMO points earned for specific product categories

**Redemption Rules** can be currency-specific:
- REWARDS points redeemable for any reward or cash
- BONUS points redeemable only for specific items
- PROMO points must be converted to REWARDS before redemption

**Transfer Rules** determine if points can move between members:
- Standard REWARDS points are non-transferable
- GIFT points can be transferred to other members
- CORPORATE points are non-transferable and non-refundable

**Expiry Policies** often differ by currency:
- REWARDS points expire after 24 months
- BONUS points expire after 6 months
- LIFETIME points never expire

## Common Currency Structures

Successful programs use various currency structures:

**Single Currency Model:**
- "REWARDS" for all earning and redemption
- Simplest model, most common for retail loyalty programs

**Two-Currency Model:**
- "REWARDS" for standard earned points
- "BONUS" for promotional points that convert to REWARDS
- Allows promotional flexibility while maintaining standard point value

**Tier Currency Model:**
- "STANDARD" points for all members
- "PREMIUM" points earned only by VIP tier members
- Creates aspirational value for tier progression

**Partnership Model:**
- "RETAIL" points earned in-store
- "PARTNER" points earned through partner brands
- May have different redemption values or options

**Regional Model:**
- "US-POINTS" for United States program
- "EU-POINTS" for European program
- Separate currencies for distinct regional programs

## Currency Naming Best Practices

Names matter for member understanding and engagement:

**Use Familiar Terms.** "Points," "Miles," "Rewards," and "Credits" are well-understood in loyalty contexts. Avoid inventing terminology that requires explanation.

**Match Your Brand.** If your brand is playful, point names can be creative ("Kudos," "Perks"). If your brand is professional, stick with standard terms ("Rewards Points").

**Be Specific When Needed.** Multiple currencies require distinct names: "Bonus Points" vs. "Rewards Points" vs. "Promotional Points" clarifies which currency is which.

**Avoid Abbreviations in Member-Facing Names.** "RWRDS PTS" might save characters but "Rewards Points" is clearer to members.

**Consistency Across Channels.** Use identical currency names in POS systems, online accounts, mobile apps, and printed communications.

## Currency Activation and Lifecycle

Currencies have lifecycles that should be managed:

**Planning Phase:** Define currency purpose, earning rules, redemption options, and lifecycle before creating the currency in the system.

**Creation Phase:** Create the currency record in BigLedger with appropriate settings. Test earning and redemption with test members.

**Active Phase:** Currency is live and members are earning/redeeming it. Monitor usage patterns, liability levels, and member feedback.

**Modification Phase:** Adjust currency settings based on program performance. Changes might include altering expiry rules, adjusting earning rates, or modifying redemption options.

**Retirement Phase:** When a currency is no longer needed, stop new earning, allow existing balances to be redeemed or expire, then retire the currency once all balances are cleared.

## Multi-Currency Member Experience

When members interact with multiple currencies:

**Clear Balance Display.** Member statements and online accounts should clearly show balances in each currency separately. Don't combine different currency balances into a single number.

**Currency Context in Communications.** When sending point earning notifications, specify which currency was earned: "You earned 500 Bonus Points" not just "You earned 500 points."

**Redemption Currency Selection.** If redemption can use multiple currencies, make it clear which currency applies. POS interfaces should prompt: "Redeem from Rewards Points or Bonus Points?"

**Conversion Transparency.** If points convert between currencies, explain when and how: "Bonus Points automatically convert to Rewards Points after 30 days."

**Unified Value Communication.** If different currencies have different values, help members understand equivalency: "1,000 Rewards Points or 1,200 Bonus Points can redeem this reward."

## Currency and Accounting Integration

Point currencies create financial liability:

**Liability Valuation.** Each point in each currency has an estimated redemption value. If 1,000 REWARDS points redeem for $10, each point represents $0.01 of liability.

**Separate Liability Accounts.** Different currencies may map to separate liability accounts in your general ledger, especially if they have different estimated redemption values.

**Journal Entry Templates.** Configure journal entry templates that correctly post point earning (increasing liability) and redemption (decreasing liability) for each currency to the appropriate accounts.

**Liability Reporting.** Financial reports should show total point liability by currency. This helps track which currencies represent the largest liability concentrations.

**Audit Requirements.** Ensure your currency configuration provides the transaction detail and audit trail that your financial auditors require for loyalty program liability valuation.

## Currency-Specific Earning Configuration

Different currencies may be earned through different mechanisms:

**Transaction-Based Earning.** Configure sales rules that credit specific currencies based on transaction attributes:
- Spend $1, earn 1 REWARDS point
- Purchase from promotional category, earn 5 BONUS points
- VIP members earn in PREMIUM currency

**Campaign-Based Earning.** Promotional campaigns may award specific currencies:
- "Spring 2024" campaign awards PROMO points
- Referral program awards REFERRAL points
- Birthday bonus awards BONUS points

**Manual Crediting.** Staff or automated processes may manually credit specific currencies:
- Customer service resolution credits GOODWILL points
- Contest winners receive PRIZE points
- Service recovery awards APOLOGY points

**Partner Transfers.** External systems may transfer points into specific currencies:
- Credit card partner transfers to PARTNER currency
- Airline program transfers to MILES currency
- Hotel program transfers to HOTEL currency

## Currency Conversion Planning

If using multiple currencies, plan conversion strategy:

**Conversion Direction.** Typically, temporary or promotional currencies convert to permanent currencies, not vice versa. BONUS → REWARDS is common; REWARDS → BONUS is rare.

**Conversion Timing.** Decide when conversions occur:
- Immediate automatic conversion upon earning
- Delayed automatic conversion after waiting period
- Manual member-initiated conversion
- Scheduled batch conversion processes

**Conversion Rates.** Define the rate at which currencies convert. Common approaches:
- 1:1 conversion (1 BONUS = 1 REWARDS)
- Discounted conversion (2 BONUS = 1 REWARDS)
- Premium conversion (1 VIP = 2 REWARDS)

**Conversion Restrictions.** Specify any limits or conditions:
- Minimum conversion amounts
- Maximum conversions per period
- Member tier requirements
- Currency age requirements

Detailed conversion configuration is covered in the Conversion Rates section.

## Testing Currency Configuration

Before launching a new currency to members:

**Create Test Members.** Set up test member accounts with balances in the new currency.

**Test Earning Transactions.** Process test transactions that should credit the new currency. Verify correct amounts post to member balances.

**Test Balance Display.** Confirm the currency appears correctly in member account views, statements, and reports.

**Test Redemption.** Attempt to redeem the new currency for rewards or payment. Verify that redemption works as configured.

**Test Accounting Integration.** Review financial transactions generated by test activity. Ensure journal entries post to the correct liability accounts.

**Test Member Communications.** Generate member statements and notifications. Verify the currency displays with the correct name and formatting.

**Test Reporting.** Run point balance and transaction reports. Confirm the new currency appears correctly in all relevant reports.

## Currency Documentation

Maintain comprehensive documentation for each currency:

**Configuration Documentation.** Record technical details:
- Currency code and name
- Creation date and creator
- Configuration settings
- Accounting account mappings

**Business Rules Documentation.** Document program rules:
- How members earn this currency
- What they can redeem it for
- Expiry rules specific to this currency
- Any restrictions or special handling

**Member Communication Standards.** Define how to communicate about this currency:
- Official name for member communications
- Explanation of the currency's purpose
- How it differs from other currencies
- Where members can learn more

**Staff Training Materials.** Create resources to help staff:
- When to use each currency
- How to explain currencies to members
- How to troubleshoot currency issues
- Who to escalate complex currency questions to

## Currency Management Ongoing Tasks

Once currencies are live, regular management is required:

**Monitor Liability Levels.** Track total outstanding points in each currency. Growing liability may signal earning is outpacing redemption.

**Review Earning Patterns.** Analyze which transactions or campaigns are driving point earning in each currency. Ensure earning aligns with program goals.

**Track Redemption Rates.** Monitor what percentage of points in each currency are being redeemed. Low redemption may indicate clarity issues or unattractive rewards.

**Assess Member Understanding.** Through surveys or customer service feedback, gauge whether members understand your currency structure. Confusion may require simplified communication or consolidated currencies.

**Evaluate Currency Performance.** Regularly assess whether each currency serves its intended purpose. Currencies that don't drive desired behaviors should be reconsidered.

**Coordinate with Finance.** Maintain alignment with your accounting team on liability valuation, especially if redemption patterns or conversion rates change.

Point currencies are the fundamental building blocks of your loyalty program's points economy. Configure them with clarity, consistency, and careful attention to both member experience and business requirements.
