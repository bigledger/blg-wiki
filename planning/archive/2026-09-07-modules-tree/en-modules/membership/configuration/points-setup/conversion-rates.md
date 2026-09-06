---
title: "Conversion Rates"
description: "Configuring point-to-point (PTS to PTS) conversion rates between different point currencies"
weight: 20
---

Point-to-point conversion rates enable your loyalty program to translate points from one currency to another. This functionality supports promotional strategies, program partnerships, and flexible redemption options by allowing members to convert between different point types within your ecosystem.

## Understanding Point-to-Point Conversion

Point-to-point conversion (PTS to PTS) defines the exchange rate between two different point currencies in your program. When a member or system process converts points, the conversion rate determines how many points of the source currency translate to how many points of the target currency.

**Example Conversion:** If you configure a conversion rate of 2:1 from BONUS to REWARDS, then 2,000 BONUS points would convert to 1,000 REWARDS points. The member gives up 2,000 BONUS and receives 1,000 REWARDS in return.

**Directional Conversion.** Conversion rates are directional—they specify conversion FROM one currency TO another. A rate from BONUS to REWARDS is distinct from a rate from REWARDS to BONUS. You can configure one direction without enabling the other.

**Multiple Conversion Paths.** Complex programs might have multiple currencies with various conversion paths: PROMO converts to BONUS, BONUS converts to REWARDS, and PARTNER converts directly to REWARDS. Each path has its own rate.

## When to Use Point-to-Point Conversion

Conversion rates serve several business purposes:

**Consolidating Promotional Points.** Issue temporary promotional currencies (BONUS, PROMO) that automatically convert to your standard currency (REWARDS) after validation periods. This protects against immediate redemption of bonus points while allowing flexibility.

**Partner Program Integration.** When integrating with partner loyalty programs, convert partner-issued points to your program's currency (or vice versa) to enable cross-program redemption.

**Tier Progression Incentives.** Award premium currency to higher-tier members that converts to standard currency at favorable rates, creating additional tier value.

**Regional Program Consolidation.** Allow members who relocate or travel to convert regional currencies to a universal currency, enabling seamless program participation across geographies.

**Temporary to Permanent Points.** Issue points with pending status that convert to permanent points after return windows close or services are completed, protecting against point erosion from refunds.

**Clearing Obsolete Currencies.** When retiring a currency, provide conversion to a continuing currency so members retain value from their earned points.

## Configuring Conversion Rates

To configure a point-to-point conversion rate in BigLedger:

**Access Conversion Configuration.** Navigate to the Membership Module and locate the point conversion configuration function. This is typically under Membership Setup > Point Conversions or Points Configuration > Conversion Rates.

**Initiate New Conversion.** Click "New" or "Create Conversion Rate" to open the conversion definition form.

**Select Source Currency.** Choose the point currency that will be converted FROM. This is the currency members will give up. Use the dropdown to select from your configured point currencies (e.g., BONUS).

**Select Target Currency.** Choose the point currency that will be converted TO. This is the currency members will receive. Select from available currencies (e.g., REWARDS).

**Define Conversion Rate.** Enter the exchange rate as a ratio:
- **From Amount:** Number of source currency points required
- **To Amount:** Number of target currency points received
- Example: From Amount = 2, To Amount = 1 means 2 BONUS points convert to 1 REWARDS point

**Set Effective Dates.** Specify when this conversion rate is valid:
- **Start Date:** When the rate becomes active
- **End Date:** When the rate expires (optional, leave open for ongoing conversions)

**Configure Conversion Type.** Specify whether conversion is:
- **Automatic:** System converts points automatically based on rules
- **Manual:** Members or staff initiate conversions explicitly
- **Scheduled:** Conversion occurs on specific dates (e.g., monthly)

**Set Minimum Conversion Amount.** Enter the minimum number of source points required for conversion. This prevents tiny conversions that aren't meaningful (e.g., require at least 100 BONUS points to convert).

**Define Maximum Conversion Limits.** Optionally set:
- Maximum points per conversion transaction
- Maximum conversions per member per period
- Total conversion caps for the program

**Configure Conversion Fees.** If applicable, specify fees:
- Fixed point deduction from conversion result
- Percentage-based reduction in conversion rate
- Most programs don't charge fees for internal conversions

**Add Conversion Description.** Enter a clear description explaining what this conversion rate is for, helping staff understand when it applies.

**Save the Conversion Rate.** Click "Save" to activate the conversion rate. It becomes available based on the effective dates configured.

## Conversion Rate Calculations

Understanding how conversion rates calculate point amounts:

**Standard Ratio Calculation.** The conversion rate ratio (From Amount : To Amount) determines the math:
- Rate: 2:1 (2 BONUS to 1 REWARDS)
- Member converts: 10,000 BONUS points
- Calculation: 10,000 ÷ 2 × 1 = 5,000 REWARDS points
- Result: Member loses 10,000 BONUS, gains 5,000 REWARDS

**Fractional Rates.** Some conversions use fractional rates:
- Rate: 1:1.5 (1 PROMO to 1.5 REWARDS)
- Member converts: 1,000 PROMO points
- Calculation: 1,000 ÷ 1 × 1.5 = 1,500 REWARDS points
- Result: Member loses 1,000 PROMO, gains 1,500 REWARDS

**Rounding Rules.** When conversions result in partial points:
- Most systems round down (member receives whole points, remainder stays unconverted)
- Some systems round to nearest whole number
- Few systems support fractional point balances

**Minimum Amount Validation.** Before processing conversion:
- Verify member has sufficient source currency balance
- Check that conversion amount meets minimum requirements
- Confirm result meets minimum target amount if configured

## Automatic vs. Manual Conversion

Conversion can occur through different triggers:

**Automatic Conversion** happens without member or staff action:
- **Rule-Based:** Points automatically convert when conditions are met (e.g., BONUS points convert to REWARDS after 30 days)
- **Scheduled:** System runs batch processes that convert eligible points (e.g., monthly conversion of aged promotional points)
- **Transaction-Triggered:** Earning or redemption events trigger immediate conversion (e.g., earning PARTNER points triggers instant conversion to REWARDS)

**Manual Conversion** requires explicit action:
- **Member-Initiated:** Members log into their account and request conversion from one currency to another
- **Staff-Initiated:** Customer service representatives process conversion requests on behalf of members
- **Administrative:** Program managers perform bulk conversions for maintenance or program changes

**Hybrid Approaches** combine automatic and manual elements:
- Automatic conversion with member opt-out (system converts unless member blocks it)
- Manual conversion with automatic recommendation (system suggests conversion but requires approval)
- Scheduled conversion with member adjustment (system converts on schedule but members can adjust amounts)

Most programs favor automatic conversion for simplicity, reserving manual conversion for special cases or member-controlled scenarios.

## Common Conversion Rate Scenarios

Different program needs require different rate structures:

**Equal Value Conversion (1:1):** Source and target currencies have the same underlying value.
- Rate: 1 BONUS = 1 REWARDS
- Use Case: Promotional points that convert to standard points after validation period
- Member Experience: Seamless, no loss of value

**Discounted Conversion (2:1 or higher):** Source currency is worth less than target.
- Rate: 2 BONUS = 1 REWARDS
- Use Case: Easy-to-earn bonus points convert at discount to premium rewards points
- Member Experience: Members understand bonus points are less valuable but still useful

**Premium Conversion (1:2 or richer):** Source currency is worth more than target.
- Rate: 1 VIP = 2 REWARDS
- Use Case: Exclusive currency for top-tier members converts favorably
- Member Experience: Demonstrates VIP status value through enhanced conversion

**Time-Decay Conversion:** Rate becomes less favorable over time.
- Rate: 1:1 for first 30 days, 2:1 after 30 days, 3:1 after 60 days
- Use Case: Encourages early redemption, discourages hoarding
- Member Experience: Creates urgency to convert or redeem before value declines

**Tier-Based Conversion:** Rate varies by member class.
- Rate: 1:1 for Platinum, 1.5:1 for Gold, 2:1 for Silver
- Use Case: Tier benefit that provides better conversion rates to higher tiers
- Member Experience: Motivates tier progression for better conversion value

## Conversion Flow and Member Experience

How members experience conversions in practice:

**Automatic Conversion Flow:**
1. Member earns 5,000 BONUS points through promotion
2. System notes points have 30-day conversion waiting period
3. After 30 days, scheduled process automatically converts 5,000 BONUS to 5,000 REWARDS (1:1 rate)
4. Member receives notification: "Your 5,000 Bonus Points have converted to 5,000 Rewards Points"
5. BONUS balance decreases by 5,000, REWARDS balance increases by 5,000

**Manual Conversion Flow:**
1. Member logs into account and views balances: 10,000 BONUS, 3,000 REWARDS
2. Member selects "Convert Points" option
3. System displays available conversions: "BONUS to REWARDS at 2:1 rate"
4. Member enters amount: 10,000 BONUS points
5. System calculates: "You will receive 5,000 REWARDS points"
6. Member confirms conversion
7. System processes: removes 10,000 BONUS, adds 5,000 REWARDS
8. Member sees updated balances: 0 BONUS, 8,000 REWARDS

**Clear Communication is Essential.** Members need to understand:
- Which currencies can be converted
- What rate applies
- Whether conversion is automatic or manual
- Any time limitations or minimums
- Whether conversion is reversible (usually not)

## Conversion Rate Strategy

Design conversion rates that support program objectives:

**Protect Program Economics.** Ensure conversion rates don't allow members to game the system. If BONUS points are easy to earn through low-cost actions and convert 1:1 to REWARDS that redeem for high-value items, members might exploit this path.

**Maintain Consistent Value.** If different currencies ultimately redeem for the same rewards catalog, conversion rates should reflect underlying value consistency. If 1,000 REWARDS = $10 and 1,000 BONUS = $5, then BONUS should convert to REWARDS at 2:1 to maintain value equivalence.

**Create Tier Incentives.** Using conversion rates as tier benefits adds tangible value to tier progression. Gold members converting at 1.5:1 while Silver converts at 2:1 makes Gold status demonstrably more valuable.

**Balance Complexity and Clarity.** Simple conversion rates (1:1, 2:1) are easier for members to understand than complex rates (1.73:1). Prioritize clarity unless complex rates serve critical business needs.

**Consider Tax Implications.** In some jurisdictions, point conversions may have tax implications, especially if they're treated as income or exchanged for cash equivalents. Consult tax advisors when designing conversion programs.

**Plan for Adjustment.** Build in flexibility to adjust rates as you learn how members respond. Initial rate assumptions may need refinement based on conversion volume and program economics.

## Conversion Reporting and Analytics

Monitor conversion activity to understand program dynamics:

**Conversion Volume Reports.** Track how many points are being converted by currency pair:
- Total points converted per period
- Number of conversion transactions
- Number of members participating in conversions

**Conversion Rate Utilization.** Analyze which conversion paths are most used:
- BONUS to REWARDS might see heavy use
- PARTNER to REWARDS might be rarely used
- Identify underutilized conversion paths that might indicate program design issues

**Member Behavior Analysis.** Study conversion patterns:
- How quickly do members convert after earning in source currency?
- What percentage of earned points are converted vs. redeemed directly?
- Do certain member segments favor conversion over direct redemption?

**Economic Impact Assessment.** Calculate the financial impact:
- Liability reduction when converting from higher-value to lower-value currencies
- Liability increase when converting from lower-value to higher-value currencies
- Net liability effect of conversion activity

**Conversion Timing Analysis.** For time-based conversions:
- How long do members hold points before converting?
- Do approaching expiry dates drive conversion spikes?
- Are automatic conversions occurring as scheduled?

## Managing Multiple Conversion Paths

Complex programs with many currencies need structured management:

**Document Conversion Matrix.** Create a matrix showing all conversion paths:
```
           TO:
FROM:      REWARDS  PREMIUM  PARTNER
BONUS      2:1      4:1      Not Allowed
PROMO      1:1      2:1      Not Allowed
PARTNER    1:1      Not Allowed  Not Allowed
```

**Prevent Circular Conversions.** Don't create paths that allow round-trip conversions that could be exploited:
- Avoid: BONUS→REWARDS at 2:1 AND REWARDS→BONUS at 1:2 (would allow infinite point multiplication)
- Ensure conversion paths are one-way or have asymmetric rates that prevent gaming

**Consider Indirect Paths.** Members might convert through multiple hops:
- Direct path: BONUS → REWARDS at 2:1
- Indirect path: BONUS → PROMO at 1:1, then PROMO → REWARDS at 2:1 (effective 2:1)
- Ensure indirect paths don't create more favorable rates than intended direct paths

**Limit Active Conversions.** Too many conversion options create confusion. Most programs operate successfully with 1-3 active conversion paths.

## Conversion and Expiry Interactions

Conversions and expiry rules can interact in important ways:

**Convert Before Expiry.** If source currency has shorter expiry periods than target currency, conversion extends point life. BONUS expires in 6 months but converts to REWARDS that expire in 24 months—members who convert gain extended value.

**Expiry Priority.** When both currencies have expiry rules, determine which points expire first:
- FIFO (First In, First Out): Oldest points expire first regardless of currency
- Currency-specific: Each currency expires independently
- Source-preferred: Favor converting points that would expire sooner

**Automatic Conversion Before Expiry.** Some programs automatically convert expiring points to extend their life:
- BONUS points expiring in 30 days auto-convert to REWARDS
- Gives members maximum value retention
- May increase liability if target currency has longer life

**No Conversion for Expired Points.** Once points expire, they can no longer be converted. Conversion must occur while points are active.

## Troubleshooting Conversion Issues

Common issues and solutions:

**Conversion Not Processing.** Check:
- Are effective dates current? Conversion might not be active yet or may have expired
- Does member have sufficient source balance?
- Does amount meet minimum conversion requirements?
- Are there system errors or scheduled maintenance?

**Incorrect Conversion Amounts.** Verify:
- Conversion rate ratio is configured correctly (FROM:TO)
- Rounding rules are behaving as expected
- No conversion fees being applied unintentionally
- Calculation formula matches intended design

**Members Don't Understand Conversion.** Address through:
- Clearer communication of conversion rates and processes
- Examples showing how conversion calculations work
- FAQ section addressing common conversion questions
- Staff training to explain conversions consistently

**Conversion Causing Liability Issues.** Review:
- Are conversions creating more valuable points than intended?
- Is conversion rate aligned with underlying redemption values?
- Should conversion rates be adjusted to better manage liability?
- Coordinate with finance team on liability implications

## Best Practices for Conversion Configuration

**Use Round Numbers.** Conversion rates like 1:1, 2:1, or 3:1 are easier for members to understand and calculate than 1.73:1 or 5:3.

**Document Thoroughly.** Record the business reason for each conversion rate, when it was created, expected usage patterns, and any special considerations.

**Test Extensively.** Before launching conversion rates to members:
- Test with various point amounts (small, large, fractional)
- Verify calculations produce expected results
- Test automatic and manual conversion processes
- Review generated accounting transactions

**Communicate Clearly.** Ensure members understand:
- Which currencies can be converted
- What rates apply
- Whether conversion is automatic or requires action
- Any restrictions or minimums
- How to initiate conversion if manual

**Monitor Regularly.** Review conversion activity monthly or quarterly:
- Are conversion volumes as expected?
- Are rates achieving desired program objectives?
- Do rates need adjustment based on member behavior?
- Is conversion causing unexpected liability impacts?

**Plan for Changes.** Build flexibility to adjust conversion rates as your program matures. What works at launch may need refinement as you understand member preferences and program economics.

Point-to-point conversion rates add flexibility and strategic capability to multi-currency loyalty programs. Configure them thoughtfully to support your program goals while maintaining clarity for members and economic sustainability for your business.
