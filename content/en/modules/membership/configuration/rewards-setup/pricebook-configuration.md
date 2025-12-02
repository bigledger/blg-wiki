---
title: "Pricebook Configuration"
description: "Creating and managing pricebooks to control member access to pricing scheme rewards"
weight: 20
---

Pricebooks are the bridge between pricing schemes and member access. While pricing schemes (configured in Doc Item Maintenance) define what special prices exist, pricebooks determine which members can access those prices based on member class, labels, or other eligibility criteria.

## Understanding Pricebooks

A pricebook in BigLedger's Membership Module is a collection of references to pricing schemes combined with eligibility rules that control who can access those prices. Think of a pricebook as a "catalog of special pricing" that specific member segments can see and use.

**Pricebook Components:**
- **Name and Description:** Identifies the pricebook and its purpose
- **Pricing Scheme References:** Links to specific pricing schemes from FI-ITEM
- **Eligibility Rules:** Defines which members can access this pricebook
- **Effective Dates:** Controls when the pricebook is active
- **Priority:** Determines which pricebook applies if member qualifies for multiple

**How Pricebooks Work in Transactions:**
1. Member is identified during transaction (POS, online, sales order)
2. System determines which pricebooks the member is eligible for
3. System retrieves pricing schemes referenced by eligible pricebooks
4. Special pricing applies automatically to qualifying items
5. Member receives best available price if multiple schemes could apply

## When to Use Pricebooks

Pricebooks enable several program scenarios:

**Tier-Based Pricing.** Create separate pricebooks for each member class:
- Bronze pricebook with basic member pricing
- Silver pricebook with intermediate discounts
- Gold pricebook with premium discounts
- Platinum pricebook with VIP pricing

**Segment-Based Pricing.** Target specific member segments using labels:
- "VIP-Service" label qualifies for VIP pricebook
- "Email-Subscriber" label qualifies for exclusive online pricing
- "Trade-Professional" label qualifies for trade pricebook

**Promotional Pricebooks.** Create temporary pricebooks for campaigns:
- "Spring2024-Promo" pricebook with special campaign pricing
- Available to all members during promotion period
- Expires automatically when campaign ends

**Channel-Specific Pricebooks.** Different pricing for different channels:
- "In-Store-Member" pricebook for POS transactions
- "Online-Member" pricebook for e-commerce
- "Mobile-App" pricebook for app purchases

**Geographic Pricebooks.** Regional pricing variations:
- "North-Region" pricebook with regional member pricing
- "South-Region" pricebook with different regional pricing
- Based on member location or store location

## Creating a Pricebook

To create a new pricebook in BigLedger:

**Access Pricebook Configuration.** Navigate to the Membership Module and locate the pricebook setup function. This is typically under Membership Setup > Pricebooks or Rewards > Pricebook Configuration.

**Initiate New Pricebook.** Click "New" or "Create Pricebook" to open the pricebook creation form.

**Define Pricebook Code.** Enter a unique code identifying this pricebook. Use meaningful codes like "GOLD-PBOOK," "VIP-PRICING," or "PROMO-2024Q1" that indicate the pricebook's purpose.

**Enter Pricebook Name.** Provide a descriptive name that appears in reports and administrative interfaces: "Gold Member Pricing," "VIP Member Benefits," "Spring 2024 Promotion."

**Set Pricebook Description.** Add detailed description explaining:
- What pricing schemes this pricebook includes
- Which members should have access
- When and why the pricebook was created
- Any special handling requirements

**Configure Effective Dates.** Define when this pricebook is active:
- **Start Date:** When the pricebook becomes available
- **End Date:** When the pricebook expires (optional, leave open for ongoing pricebooks)
- Dates control automatic activation and expiration

**Set Pricebook Priority.** Assign a priority number if members might qualify for multiple pricebooks:
- Lower numbers typically mean higher priority
- Priority determines which pricebook's pricing applies when conflicts exist
- Example: Priority 1 for VIP pricebook, Priority 2 for standard member pricebook

**Define Eligibility Rules.** Specify which members can access this pricebook:
- **By Member Class:** "Available to member class Gold"
- **By Member Label:** "Available to members with label VIP-Service"
- **By Combination:** "Available to Gold members with label Email-Subscriber"
- **Universal:** "Available to all active members"

**Save the Pricebook Shell.** Click "Save" to create the pricebook structure. Now you'll add pricing scheme references.

## Adding Pricing Schemes to Pricebooks

After creating the pricebook shell, add references to pricing schemes:

**Access Pricing Scheme Assignment.** Within the pricebook configuration, locate the section for adding pricing schemes. This might be a "Pricing Schemes" tab or "Add Schemes" button.

**Select Pricing Schemes to Include.** Choose which pricing schemes from FI-ITEM should be included in this pricebook:
- Search for schemes by code or description
- Select multiple schemes to add simultaneously
- Or add schemes individually for precise control

**Add Scheme References.** Click "Add" or "Include Scheme" to link the selected pricing schemes to this pricebook:
- The pricebook now references these schemes
- When eligible members transact, these schemes' pricing applies
- Schemes can be referenced by multiple pricebooks

**Verify Scheme Inclusion.** Review the list of pricing schemes now included in the pricebook:
- Confirm all intended schemes are listed
- Verify scheme codes and descriptions are correct
- Check that no unintended schemes were added

**Set Scheme-Specific Rules (if available).** Some implementations allow additional rules per scheme:
- Scheme applies only to specific transaction types
- Scheme applies only at certain locations
- Scheme requires minimum purchase quantities

**Save Pricebook with Schemes.** Save the completed pricebook. It's now functional and will apply pricing to eligible members.

## Configuring Eligibility Rules

Eligibility rules determine who can access each pricebook:

**Class-Based Eligibility.** Most common approach:
- Select one or more member classes that qualify
- Example: "Gold" and "Platinum" classes can access this pricebook
- Members in these classes automatically qualify

**Label-Based Eligibility.** Flexible segmentation:
- Select one or more member labels that qualify
- Example: Members with "VIP-Service" OR "High-Spender" labels qualify
- Labels provide dynamic segmentation independent of tiers

**Combined Class and Label Rules.** More sophisticated targeting:
- Require both class AND label: "Must be Gold AND have VIP-Service label"
- Or combinations: "Must be Gold OR have VIP-Service label"
- Boolean logic creates precise member segments

**Universal Eligibility.** Available to all members:
- No class or label restrictions
- Any active member qualifies
- Used for baseline member benefits

**Exclusion Rules.** Some systems support negative rules:
- Available to all members EXCEPT those with "Excluded" label
- Useful for temporarily removing access
- Supports program discipline scenarios

**Custom Eligibility Criteria.** Advanced implementations may offer:
- Minimum account age
- Minimum spending thresholds
- Geographic restrictions
- Transaction history requirements

## Managing Multiple Pricebooks

Members might qualify for multiple pricebooks simultaneously:

**Priority Resolution.** When multiple pricebooks apply:
- System checks priority of eligible pricebooks
- Applies pricing from highest-priority pricebook first
- If item not in highest-priority pricebook, checks next priority
- Continues until pricing is found or standard pricing applies

**Best Price Logic.** Some systems use best-price instead of priority:
- Check all eligible pricebooks
- Compare pricing from each
- Apply the lowest price to member
- Ensures member always gets best available deal

**Scheme Overlap Handling.** If multiple pricebooks reference same schemes:
- Typically the scheme only applies once (not compounded)
- System applies scheme from highest-priority pricebook
- Or system applies best result if schemes differ

**Testing Multiple Pricebooks.** Verify behavior with test members:
- Create member qualifying for multiple pricebooks
- Process test transaction
- Confirm correct pricebook's pricing applies
- Verify priority or best-price logic works as configured

## Tier-Based Pricebook Strategy

Common pattern for tier programs:

**Create Pricebook per Tier.** Separate pricebook for each member class:
- "Bronze-Member-Pricing" pricebook
- "Silver-Member-Pricing" pricebook
- "Gold-Member-Pricing" pricebook
- "Platinum-Member-Pricing" pricebook

**Differentiate Pricing Schemes.** Each pricebook references tier-appropriate schemes:
- Bronze pricebook: References "BRONZE-PRICE" schemes (5% off)
- Silver pricebook: References "SILVER-PRICE" schemes (10% off)
- Gold pricebook: References "GOLD-PRICE" schemes (15% off)
- Platinum pricebook: References "PLATINUM-PRICE" schemes (20% off)

**Set Appropriate Priorities.** If overlap could occur:
- Platinum pricebook: Priority 1
- Gold pricebook: Priority 2
- Silver pricebook: Priority 3
- Bronze pricebook: Priority 4
- Ensures higher tiers get their pricing if member has multiple classes

**Communicate Tier Benefits.** Clearly explain what pricing each tier receives:
- "Bronze members save 5%"
- "Silver members save 10%"
- "Upgrade to Gold for 15% savings"

## Promotional Pricebook Implementation

Using pricebooks for limited-time promotions:

**Create Temporary Pricebook.** New pricebook for campaign:
- Code: "SPRING2024-PROMO"
- Name: "Spring 2024 Member Promotion"
- Description: "Special member pricing for spring product lineup"

**Set Campaign Dates.** Effective dates align with promotion:
- Start Date: March 1, 2024
- End Date: May 31, 2024
- Pricebook automatically activates and deactivates

**Reference Promotional Schemes.** Include campaign-specific pricing schemes:
- "SPRING-FEATURED-ITEMS" scheme with deep discounts on featured products
- "SPRING-CATEGORY-DISCOUNT" scheme with category-wide promotional pricing

**Broad or Targeted Eligibility.** Decide who qualifies:
- **Universal:** All members get promotional pricing (high engagement)
- **Targeted:** Only specific tiers or labels (exclusive promotion)
- **Invitation Only:** Members with "Spring2024-Invite" label

**High Priority for Promotion.** Set promotional pricebook priority higher than standard:
- Promotional pricebook: Priority 1
- Standard tier pricebooks: Priority 2+
- Ensures promotional pricing overrides standard member pricing during campaign

**Remove After Campaign.** Post-campaign cleanup:
- Pricebook automatically deactivates on end date
- Review whether to archive or delete pricebook
- Remove promotional labels from members if used

## Channel-Specific Pricebooks

Different pricing for different sales channels:

**In-Store Pricebook.** For POS transactions:
- "In-Store-Member-Pricing"
- References schemes for in-store member benefits
- May include items not available online

**Online Pricebook.** For e-commerce:
- "Online-Member-Pricing"
- References schemes for online-exclusive member pricing
- May differ from in-store to account for fulfillment costs

**Mobile App Pricebook.** For app purchases:
- "Mobile-App-Member-Pricing"
- May include app-only specials to drive app adoption
- Can reference more aggressive pricing to encourage channel shift

**Implementation Approach.** Channel identification:
- Transaction source determines which channel-specific pricebook to check
- Member might have access to multiple channel pricebooks
- But only the pricebook for current transaction channel applies

**Rationale for Channel Pricing.** Different channels have different economics:
- E-commerce may have lower overhead, allowing better member pricing
- In-store provides immediacy, justifying different pricing
- App may be strategic channel to promote, warranting special incentives

## Pricebook Reporting and Analytics

Monitor pricebook performance:

**Pricebook Usage Reports.** Track which pricebooks are used:
- Transaction volume by pricebook
- Number of members utilizing each pricebook
- Revenue through each pricebook

**Pricing Scheme Utilization within Pricebooks.** Analyze scheme usage:
- Which schemes in each pricebook are used most
- Items with highest member pricing redemption
- Schemes with no usage (candidates for removal)

**Member Eligibility Analysis.** Understand member distribution:
- How many members qualify for each pricebook
- Percentage of members utilizing available pricebooks
- Members qualifying for multiple pricebooks

**Discount Impact by Pricebook.** Measure financial effects:
- Total discounts provided through each pricebook
- Average discount per transaction by pricebook
- Margin impact by pricebook
- ROI of pricebook pricing investments

**Comparison Across Pricebooks.** Benchmark performance:
- Transaction size by pricebook
- Frequency by pricebook
- Member satisfaction by pricebook access
- Which pricebooks drive most engagement

## Pricebook Maintenance

Ongoing management keeps pricebooks effective:

**Regular Content Review.** Periodically review pricebook contents:
- Are all included pricing schemes still relevant?
- Should new schemes be added?
- Should obsolete schemes be removed?

**Eligibility Rule Updates.** Adjust who can access pricebooks:
- Add new member classes to eligibility
- Include new labels as program evolves
- Tighten or broaden access based on program strategy

**Effective Date Management.** Maintain date ranges:
- Extend expiring pricebooks if they should continue
- Set end dates for pricebooks that were open-ended but should now end
- Schedule future pricebook activations

**Priority Adjustments.** Revise priorities as needed:
- When new pricebooks are added, fit them into priority hierarchy
- Reorder priorities if business rules change
- Test priority changes with various member scenarios

**Archive Obsolete Pricebooks.** Clean up inactive pricebooks:
- After campaign pricebooks expire, archive or delete them
- Remove pricebooks for discontinued member classes
- Maintain historical data for reporting while removing from active configuration

## Integration with Member Creation

Ensure members can access appropriate pricebooks:

**Class Assignment Drives Access.** When creating members:
- Assign appropriate member class
- This automatically qualifies them for class-based pricebooks
- No additional pricebook assignment needed

**Label Assignment for Special Access.** For label-based pricebooks:
- Apply relevant labels during member creation
- Members immediately qualify for label-based pricebooks
- Add/remove labels as needed to manage pricebook access

**Testing New Member Access.** After creating members:
- Verify they can access expected pricebooks
- Process test transaction to confirm pricing applies
- Check that restrictions work (members don't get unintended access)

## Troubleshooting Pricebook Issues

Common problems and solutions:

**Pricing Not Applying.** Check:
- Does pricebook's effective date range include current date?
- Is member eligible based on class/label rules?
- Are pricing schemes referenced by pricebook still valid?
- Is transaction type eligible for this pricebook?
- Is higher-priority pricebook overriding expected pricing?

**Wrong Pricing Applies.** Verify:
- Member's class and labels match expected eligibility
- Pricebook priority is set correctly
- No conflicting pricebooks with higher priority
- Pricing schemes in pricebook are configured as expected

**Multiple Prices Showing.** Investigate:
- Is member eligible for multiple pricebooks simultaneously?
- Check priority settings to determine which should apply
- Verify best-price logic is working correctly if configured

**No Members Can Access Pricebook.** Review:
- Are eligibility rules too restrictive?
- Do any members have the required class or labels?
- Are class/label codes in eligibility rules spelled correctly?
- Is pricebook marked as active?

**Pricebook Performance Issues.** Address:
- Too many pricing schemes referenced (slow lookup)
- Complex eligibility rules causing processing delays
- Optimize by consolidating similar schemes
- Review pricebook structure for efficiency

## Best Practices for Pricebook Configuration

**Keep Pricebook Structure Simple.** Start with straightforward pricebook design:
- One pricebook per member class initially
- Add complexity only when business needs clearly require it

**Use Descriptive Names.** Choose pricebook names and codes that clearly indicate:
- Who it's for (which members)
- What it provides (pricing benefits)
- When it applies (if time-limited)

**Document Thoroughly.** Maintain documentation of:
- What each pricebook is for
- Which pricing schemes it includes
- Why eligibility rules are configured as they are
- When pricebook was created and expected lifespan

**Test Extensively.** Before activating pricebooks:
- Create test members in each eligible segment
- Process test transactions for each pricebook
- Verify correct pricing applies in all scenarios
- Test priority resolution with overlapping pricebooks

**Monitor Usage.** Regularly review:
- Are members using the pricebooks?
- Is pricing driving desired behaviors?
- Should pricebook contents be adjusted?
- Are there unused pricebooks to retire?

**Coordinate with Merchandising.** Work with merchandising teams:
- Which items should be in member pricebooks
- Seasonal adjustments to pricebook contents
- New product launches and pricebook inclusion
- Margin impact of pricebook pricing

**Communicate to Members.** Ensure members understand their pricing access:
- "As a Gold member, you receive exclusive pricing on thousands of items"
- "Log in to see your member prices online"
- "Your member card automatically applies special pricing at checkout"

**Coordinate with IT/POS Teams.** Ensure systems properly integrate:
- POS terminals can access pricebooks
- E-commerce displays member pricing correctly
- Mobile apps retrieve appropriate pricebooks
- Transaction processing applies pricing accurately

Pricebooks are the control mechanism that transforms pricing schemes into targeted member benefits. Configure them strategically to deliver the right pricing to the right members at the right time, creating a powerful reward structure that drives program engagement and member satisfaction.
