---
title: "Expiry Rules"
description: "Configuring automatic point expiration to manage liability and encourage engagement"
weight: 40
---

Point expiry rules automatically remove points from member balances after defined periods, managing program liability and motivating members to engage regularly with your program. Properly configured expiry rules balance financial prudence with member satisfaction.

## Understanding Point Expiry

Point expiry is the automatic invalidation of points after a specified time period. When points expire, they are removed from the member's balance and the corresponding liability is relieved from your financial statements.

**Example Expiry:** If your program has a 24-month expiry rule, points earned on January 1, 2024 would expire on January 1, 2026 if not redeemed. On the expiry date, those points are automatically deducted from the member's balance.

**Expiry Serves Two Purposes:**
- **Financial:** Limits indefinite liability accumulation by removing aged points that likely won't be redeemed
- **Behavioral:** Motivates members to stay engaged and redeem regularly rather than letting points accumulate indefinitely

**Not All Programs Use Expiry.** Some programs offer "points never expire" as a member benefit. This creates indefinite liability but may enhance member perception of program value and fairness.

## Expiry Rule Types

Different expiry approaches serve different program needs:

**Rolling Expiry** expires points based on when they were earned:
- Points earned January 2024 expire January 2026 (24-month rule)
- Points earned February 2024 expire February 2026
- Each point has its own expiry date based on earning date
- Most common approach for loyalty programs

**Fixed Expiry** expires all points on specific calendar dates:
- All points expire December 31 each year
- Or points expire at fiscal year-end
- All members' points expire simultaneously regardless of earning date
- Common in annual membership programs

**Activity-Based Expiry** expires points only if member is inactive:
- Points expire after 12 months of no account activity
- Any earning or redemption transaction resets the expiry clock
- Encourages ongoing engagement without penalizing active members
- Common in programs prioritizing engagement over liability management

**Tiered Expiry** varies expiry period by member class:
- Bronze members: Points expire in 12 months
- Silver members: Points expire in 24 months
- Gold members: Points never expire
- Creates aspirational tier benefit

**Hybrid Expiry** combines approaches:
- Rolling 24-month expiry for standard earned points
- Fixed annual expiry for promotional bonus points
- Different currencies have different expiry rules

## Configuring Expiry Rules

To configure point expiry in BigLedger:

**Access Expiry Configuration.** Navigate to the Membership Module and locate the point expiry setup. This is typically under Membership Setup > Point Expiry, Points Configuration > Expiry Rules, or similar menu path.

**Initiate New Expiry Rule.** Click "New" or "Create Expiry Rule" to open the configuration form.

**Select Point Currency.** Choose which point currency this expiry rule applies to. Different currencies can have different expiry rules—standard points might expire in 24 months while promotional points expire in 6 months.

**Define Expiry Type.** Select the expiry approach:
- Rolling expiry based on earning date
- Fixed expiry on calendar date
- Activity-based expiry
- Member class-based expiry

**Set Expiry Period.** For rolling expiry, define the time period:
- **Months:** Points expire X months after earning (e.g., 24 months)
- **Days:** Points expire X days after earning (e.g., 730 days)
- Most programs use months for easier member communication

**Set Fixed Expiry Date.** For fixed expiry, specify:
- Month and day when points expire (e.g., December 31)
- Whether to include current year or only future years
- Behavior for points earned after the annual expiry date

**Configure Activity Grace Period.** For activity-based expiry:
- Define inactivity period (e.g., 12 months of no transactions)
- Specify what counts as activity (earning only, or earning and redemption)
- Set warning period before expiry

**Define Member Class Variations.** If expiry varies by tier:
- Specify expiry period for each member class
- Or designate certain classes as "no expiry"
- Tier-based expiry creates tangible tier value

**Set Warning Period.** Configure when to notify members of approaching expiry:
- 30 days before expiry
- 60 days before expiry
- Multiple warnings (60 days, 30 days, 7 days)

**Configure Expiry Processing Schedule.** Specify when expiry runs:
- Daily batch process at specific time
- Weekly process on specific day
- Monthly process on specific date
- Real-time as points reach expiry

**Define Grace Period (Optional).** Some programs allow grace period:
- Points technically expire but remain redeemable for 30 additional days
- Provides buffer for members who narrowly miss redemption
- Reduces negative member reactions

**Set Expiry Transaction Description.** Define how expiry appears in member history:
- "Points expired per program rules"
- "24-month expiry - Earned January 2024"
- Clear description helps members understand what happened

**Save the Expiry Rule.** Click "Save" to activate the rule. It will apply based on your configured schedule.

## Expiry Calculation Methods

How systems calculate when points expire:

**Earning Date Basis.** Most common method:
- Track the date each point is earned
- Apply expiry period to each earning transaction
- Points earned January 15 expire January 15 two years later (24-month rule)
- Requires tracking earning date for each point or batch of points

**Anniversary Date Basis.** Alternative method:
- Points expire on member's join anniversary
- All points earned in a membership year expire together
- Simpler tracking, less precise than earning date
- Common in annual membership programs

**Calendar Month Basis.** Simplified approach:
- Points earned anytime in January expire end of January two years later
- Grouped expiry by earning month rather than exact date
- Easier administration at cost of some precision

**FIFO (First In, First Out).** For redemption ordering:
- Oldest points are redeemed first
- Ensures expiring points are used before newer points
- Prevents members from inadvertently letting old points expire while using new points

## Expiry Period Selection

Choosing the right expiry period balances multiple factors:

**Common Expiry Periods:**
- **12 Months:** Aggressive expiry, drives frequent engagement, suitable for high-frequency businesses
- **24 Months:** Standard expiry, balances liability management with member satisfaction
- **36 Months:** Generous expiry, allows time for significant point accumulation
- **No Expiry:** Maximum member satisfaction, requires other liability management

**Factors in Selection:**
- **Purchase Frequency:** Match expiry to how often members typically transact
- **Point Earning Rate:** Slower earning may warrant longer expiry to allow accumulation
- **Average Time to Redemption:** Most members should be able to accumulate and redeem before expiry
- **Liability Concerns:** Shorter expiry provides tighter liability management
- **Competitive Positioning:** What expiry periods do competitors offer?
- **Member Expectations:** Member expectations vary by industry and market

**Industry Benchmarks:**
- Airlines: 12-24 months (or activity-based)
- Credit cards: Points never expire (or very long periods)
- Retail loyalty: 12-36 months
- Restaurant programs: 12-24 months
- Hotel programs: 12-24 months (or activity-based)

## Member Communication About Expiry

Clear communication prevents negative member reactions:

**At Enrollment.** Inform members of expiry rules upfront:
- Include expiry terms in program terms and conditions
- Explain expiry period in welcome materials
- Set expectations from the beginning

**In Ongoing Communications.** Regularly remind members:
- Include expiry information in member statements
- Display "points expiring soon" in member portals
- Send periodic reminders even when expiry isn't imminent

**Expiry Warnings.** Proactively notify members of approaching expiry:
- Email: "You have 2,500 points expiring on March 15"
- SMS: "Use your points soon! 2,500 expire in 30 days"
- App notifications: "Points expiring soon - redeem now"
- Include redemption suggestions in warning messages

**Post-Expiry Communication.** After points expire:
- Send confirmation: "5,000 points expired on March 15 per program rules"
- Explain why expiry occurred
- Remind of current balance and when it expires
- Encourage continued engagement

**Redemption Prompts.** Encourage redemption before expiry:
- "You have points expiring soon - redeem for these rewards"
- Feature redemption options in expiry warning messages
- Make redemption process prominent and easy

## Expiry Warning Systems

Automated warnings help members avoid unwanted expiry:

**Multi-Stage Warnings.** Send warnings at multiple intervals:
- 90 days before expiry: Informational reminder
- 60 days before expiry: Actionable warning with redemption suggestions
- 30 days before expiry: Urgent warning
- 7 days before expiry: Final warning
- 1 day before expiry: Last-chance alert

**Personalized Warning Content.** Customize warnings based on:
- Amount of points expiring (larger amounts warrant more urgent communication)
- Member tier (VIP members get personal outreach)
- Member activity level (inactive members need more encouragement)
- Available redemption options (suggest specific rewards member can afford)

**Multi-Channel Warnings.** Use various communication channels:
- Email for detailed expiry information
- SMS for urgent, short warnings
- Mobile app push notifications for immediate alerts
- In-app banners when member logs in
- Display warnings during POS transactions

**Warning Effectiveness Metrics.** Track:
- What percentage of warned members redeem before expiry
- Which warning timing is most effective
- Which communication channels drive action
- Whether multiple warnings increase redemption

## Managing Expiry Exceptions

Most programs need expiry exception handling:

**Extension Requests.** Members may request expiry extensions:
- Customer service representatives review requests
- Common approval reasons: illness, travel, system issues
- Document approval criteria consistently
- Track extensions for audit purposes

**Bulk Extensions.** Temporarily suspend expiry for situations like:
- Pandemic or natural disaster affecting member ability to redeem
- System outages preventing redemption
- Program changes requiring transition period
- Goodwill gesture after negative events

**Reversal of Expired Points.** Occasionally restore expired points:
- Member appeals expiry within reasonable time
- Expiry occurred due to system error
- Customer service resolution of complaint
- Requires proper authorization and audit trail

**Tier-Based Grace Periods.** Provide automatic extensions for valued members:
- VIP members get automatic 90-day grace period
- Long-tenure members get extended expiry
- High-volume members get preferential treatment

**Documentation Required.** For exception handling:
- Record reason for extension/restoration
- Document authorization
- Maintain audit trail of all expiry exceptions
- Review exception patterns to identify policy issues

## Accounting for Point Expiry

Expiry has specific accounting impacts:

**Liability Relief.** When points expire:
- Debit (decrease) point liability account
- Credit (increase) breakage income or other income account
- Amount equals estimated value of expired points

**Journal Entry Example:**
```
Transaction: 5,000 points expire (valued at $50)

Debit:  Loyalty Points Liability    $50.00
Credit: Loyalty Breakage Income     $50.00

Note: 5,000 points at estimated value of $0.01 per point
```

**Financial Statement Impact:**
- Point liability decreases (balance sheet)
- Income increases through breakage recognition (income statement)
- Net effect: Improvement to financial position

**Breakage Recognition Timing.** Two approaches:
- **Expiry-Based:** Recognize breakage income only when points actually expire
- **Actuarial:** Estimate breakage and recognize proportionally over point life

**Tax Considerations.** Consult tax advisors on:
- Tax treatment of breakage income
- Whether expiry creates taxable events
- Reporting requirements for expired points

**Audit Trail.** Maintain records of:
- Member ID and transaction details for each expiry
- Points expired and estimated value
- Date and time of expiry processing
- Batch processing logs for expiry runs

## Expiry Performance Monitoring

Track expiry metrics to manage program health:

**Expiry Rate.** Percentage of earned points that expire unredeemed:
- Total points expired ÷ total points earned
- Industry benchmarks typically 10-30%
- High expiry rates may indicate issues with redemption accessibility or value perception

**Value of Expired Points.** Financial value of expiry activity:
- Total dollar value of points expired per period
- Feeds breakage income recognition
- Helps forecast future liability relief

**Member Impact.** How many members experience expiry:
- Percentage of active members with expiring points
- Concentration of expiry (many small expiries vs. few large)
- Member sentiment after expiry events

**Warning Effectiveness.** How well warnings prevent unwanted expiry:
- Redemption rate after expiry warnings
- Optimal warning timing and frequency
- Channel effectiveness for driving redemption

**Expiry Patterns.** Identify trends:
- Seasonal patterns in expiry
- Correlation between expiry and member characteristics
- Whether certain earning methods have higher expiry rates

**Member Complaints.** Monitor expiry-related complaints:
- Volume of extension requests
- Common reasons for appeals
- Sentiment in customer service interactions
- Whether expiry is causing member attrition

## Activity-Based Expiry Implementation

Special considerations for activity-based expiry:

**Define "Activity" Clearly.** Specify what resets the expiry clock:
- Only point earning transactions
- Both earning and redemption
- Account logins or portal access
- Email engagement or communication responses

**Grace Period for Inactivity.** Most programs allow significant grace:
- 12-18 months of inactivity before expiry
- Longer than rolling expiry for same program
- Balances liability management with member retention

**Reactivation Opportunities.** Before expiring due to inactivity:
- Send reactivation offers ("Earn 100 bonus points with any purchase")
- Provide easy ways to reset the clock (simple online activity)
- Explain how to prevent expiry through activity

**Member Communication.** Clearly explain activity requirements:
- "Points remain active as long as you earn or redeem at least once every 12 months"
- "Keep your account active with any transaction to prevent expiry"
- Show last activity date in member portals

**Implementation Complexity.** Activity-based expiry requires:
- Tracking last activity date per member
- Monitoring for inactivity
- Warning system before expiry
- Processing expiry for inactive accounts only

## Expiry and Member Satisfaction

Balance liability management with member perception:

**Expiry is Often Unpopular.** Members generally dislike expiry:
- Perceive it as taking away earned value
- Feel penalized for not redeeming frequently enough
- May view it as unfair program practice

**Mitigating Negative Perception:**
- Set reasonable expiry periods (24+ months for most programs)
- Provide generous warnings before expiry
- Make redemption convenient and valuable
- Offer exceptions for reasonable circumstances
- Consider activity-based expiry as member-friendly alternative

**Competitive Positioning.** Consider competitor practices:
- If competitors offer "no expiry," yours may seem less attractive
- If your expiry is much shorter than competitors, justify with other benefits
- Industry norms set member expectations

**"Points Never Expire" Alternative.** Some programs skip expiry:
- Maximum member satisfaction and fairness perception
- Requires other liability management strategies
- May be sustainable for programs with high redemption rates
- Works well for credit card and coalition programs

**Test Member Reaction.** Before implementing expiry:
- Survey members on acceptable expiry periods
- Test expiry communication effectiveness
- Prepare customer service for inquiries
- Have clear policy for addressing concerns

## Best Practices for Expiry Configuration

**Choose Member-Friendly Periods.** Set expiry periods generous enough that most active members won't experience unwanted expiry. 24 months is a common standard that balances needs.

**Warn Early and Often.** Multiple warnings at various intervals give members ample opportunity to redeem before expiry. Start warnings 90+ days before expiry.

**Make Redemption Easy.** Ensure redemption is convenient before enforcing expiry. If redemption is difficult, expiry seems punitive.

**Provide Clear Communication.** Expiry terms should be transparent from enrollment through ongoing membership. No surprises.

**Offer Reasonable Exceptions.** Have a clear, fair policy for expiry extensions when circumstances warrant. Document criteria and authorizations.

**Monitor Impact.** Track expiry rates, member complaints, and effectiveness of warnings. Adjust policy if expiry is causing program issues.

**Consider Activity-Based.** Activity-based expiry is often more member-friendly than rolling expiry, especially for programs with variable purchase frequency.

**Test Thoroughly.** Before launching expiry rules, test extensively:
- Verify expiry calculations are correct
- Confirm warnings send as scheduled
- Test accounting integration
- Process test expiry batches

**Document Completely.** Maintain documentation of expiry rules, processing schedules, exception policies, and member communication standards.

**Coordinate with Finance.** Ensure accounting team understands expiry timing, breakage recognition, and financial statement impact.

Point expiry is a powerful tool for liability management and member engagement. Configure it thoughtfully to achieve financial objectives while maintaining member satisfaction and program attractiveness.
