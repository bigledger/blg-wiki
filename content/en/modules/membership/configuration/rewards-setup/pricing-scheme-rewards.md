---
title: "Pricing Scheme Rewards"
description: "Creating member-specific pricing schemes in Doc Item Maintenance (FI-ITEM) for loyalty rewards"
weight: 10
---

Pricing scheme rewards use BigLedger's item pricing functionality to provide special member pricing. By configuring pricing schemes in Doc Item Maintenance (FI-ITEM module), you create discounted or exclusive prices that automatically apply to qualified members during transactions.

## Understanding Pricing Schemes in Membership Context

Pricing schemes are a core feature of BigLedger's item master data management in the FI-ITEM (Doc Item Maintenance) module. While pricing schemes serve many purposes across BigLedger, they're particularly powerful for membership programs because they enable automatic, rule-based member pricing without requiring point redemption or manual discounts.

**How Pricing Schemes Enable Member Rewards:**
- Define special pricing for specific items or item categories
- Pricing schemes are referenced by pricebooks
- Pricebooks control which members can access which schemes
- When qualifying members transact, special pricing applies automatically
- Members receive benefits simply by being members, without redemption actions

**Pricing Schemes vs. Manual Discounts:**
- Pricing schemes are systematic and automatic
- Manual discounts require staff action at POS
- Schemes ensure consistency across channels (POS, e-commerce, sales orders)
- Schemes provide audit trails and reporting on member pricing usage
- Schemes scale to large programs without operational burden

## Accessing Doc Item Maintenance

Pricing schemes are configured in the Doc Item Maintenance module, not in the Membership module:

**Navigate to FI-ITEM Module.** Locate Doc Item Maintenance in BigLedger's module menu. This module manages all item master data including descriptions, standard pricing, cost information, and pricing schemes.

**Understanding Module Context.** When configuring pricing schemes for membership rewards, you're working across modules:
- FI-ITEM defines what the special price is
- Membership pricebooks define who can access it
- Integration between modules enables the complete reward experience

**Permissions Required.** Ensure your user role has permissions to:
- Access Doc Item Maintenance
- Modify item pricing schemes
- Create and edit pricing scheme definitions

If you don't see pricing scheme options in Doc Item Maintenance, contact your system administrator to verify permissions.

## Types of Pricing Schemes for Member Rewards

Different pricing scheme types serve different reward strategies:

**Fixed Price Schemes** define absolute prices for items:
- Item ABC normally $29.99, member price $24.99
- Straightforward for members to understand
- Best when member pricing is static
- Requires updates if standard pricing changes

**Percentage Discount Schemes** apply percentage reductions:
- Members receive 10% off regular price
- Automatically adjusts when standard prices change
- Easier to maintain than fixed prices
- Clear value communication ("Save 10% as a member")

**Category-Based Schemes** apply pricing to entire item categories:
- All electronics receive 15% member discount
- Saves configuration effort for large catalogs
- Ensures new items in category automatically include member pricing
- Scales well for programs with many items

**Tiered Schemes** provide different pricing based on quantity or member level:
- Buy 1-5 units: 10% off
- Buy 6-10 units: 15% off
- Buy 11+ units: 20% off
- Can combine with member classes for sophisticated structures

**Time-Based Schemes** offer pricing during specific periods:
- Member pricing available 9am-11am for early bird benefit
- Weekend member specials
- Seasonal member pricing promotions
- Adds temporal dimension to rewards

## Creating a Fixed Price Scheme

To create a fixed price scheme for member rewards:

**Open Item Record.** In Doc Item Maintenance, search for and open the item record you want to add member pricing to.

**Navigate to Pricing Section.** Locate the pricing configuration area within the item record. This section displays standard pricing and available pricing schemes.

**Create New Pricing Scheme.** Click "Add Pricing Scheme" or similar button to create a new scheme for this item.

**Define Scheme Code.** Enter a unique code identifying this pricing scheme. Use meaningful codes like "GOLD-PRICE," "MEM-DISC-10," or "VIP-PRICE" that indicate the scheme's purpose.

**Enter Scheme Description.** Provide a clear description: "Gold Member Pricing - 10% discount" or "VIP Member Exclusive Price."

**Select Scheme Type.** Choose "Fixed Price" as the scheme type.

**Enter Member Price.** Input the special price members will pay:
- Standard price: $29.99
- Member price: $24.99
- Savings: $5.00 (16.7%)

**Set Effective Dates.** Specify when this pricing is valid:
- Start date: When member pricing becomes available
- End date: When pricing expires (leave open for ongoing pricing)

**Configure Currency.** Ensure the pricing scheme uses the correct currency for your market (USD, EUR, MYR, etc.).

**Set Priority (if applicable).** If multiple pricing schemes could apply, priority determines which takes precedence. Lower numbers typically mean higher priority.

**Save the Scheme.** Click "Save" to create the pricing scheme. It's now available to be referenced by pricebooks.

**Repeat for Additional Items.** Create pricing schemes for each item that should have member pricing.

## Creating a Percentage Discount Scheme

Percentage discounts are often preferable to fixed prices:

**Open Item Record.** In Doc Item Maintenance, access the item you want to configure.

**Create New Pricing Scheme.** Add a new pricing scheme to the item.

**Define Scheme Details.** Enter code (e.g., "MEM-10PCT") and description ("Member 10% Discount").

**Select Scheme Type.** Choose "Percentage Discount" or "Markup/Markdown" depending on your system's terminology.

**Enter Discount Percentage.** Input the discount value:
- 10 for 10% off
- 15 for 15% off
- 20 for 20% off

**Choose Calculation Base.** Specify whether discount applies to:
- Regular selling price
- List price
- Current transaction price
- Most commonly, discount applies to standard selling price

**Set Rounding Rules.** Determine how calculated prices round:
- Round to nearest cent
- Round down to nearest cent
- Round to nearest nickel (for cash transactions)

**Configure Combination Rules.** Specify whether this discount can combine with:
- Other promotional discounts
- Volume discounts
- Sale pricing
- Most member pricing is exclusive (doesn't combine)

**Set Effective Dates.** Define the period when this discount is valid.

**Save the Scheme.** Save to make the percentage discount available for pricebook assignment.

## Creating Category-Based Pricing

For programs with many items, category pricing is efficient:

**Identify Item Categories.** Determine which product categories should have member pricing:
- Electronics
- Apparel
- Home Goods
- Premium Items

**Define Category Pricing Rule.** In pricing scheme configuration, select category-based pricing:
- Choose the category (e.g., "Electronics")
- Define the pricing rule (e.g., 15% off regular price)
- Set scheme code (e.g., "MEM-ELEC-15PCT")

**Apply to Category.** The pricing scheme automatically applies to all items in the category:
- Existing items immediately receive member pricing
- New items added to category automatically inherit pricing
- Removes need to configure individual items

**Test Category Coverage.** Verify that items in the category show the member pricing:
- Query items in the category
- Confirm pricing scheme appears in their pricing configuration
- Test transactions to ensure pricing applies

**Monitor Category Changes.** When items are added to or removed from categories:
- They gain or lose member pricing automatically
- Review category assignments periodically
- Ensure categorization aligns with your member pricing strategy

## Configuring Multi-Tier Pricing Schemes

Create different pricing for different member tiers:

**Create Tier-Specific Schemes.** For the same item, create separate schemes for each tier:
- Scheme 1: "BRONZE-PRICE" - 5% off
- Scheme 2: "SILVER-PRICE" - 10% off
- Scheme 3: "GOLD-PRICE" - 15% off
- Scheme 4: "PLATINUM-PRICE" - 20% off

**Differentiate Scheme Details.** Each scheme has distinct:
- Discount percentage or fixed price
- Scheme code indicating tier
- Description explaining which tier it serves

**Link to Pricebooks.** Later, when configuring pricebooks:
- Bronze pricebook references BRONZE-PRICE schemes
- Silver pricebook references SILVER-PRICE schemes
- Gold pricebook references GOLD-PRICE schemes
- Each member class sees their tier's pricing

**Create Clear Value Progression.** Ensure pricing creates meaningful tier differentiation:
- Bronze: 5% off
- Silver: 10% off (double Bronze value)
- Gold: 15% off (triple Bronze value)
- Clear progression motivates tier advancement

**Test Tier Pricing.** Verify that members in different tiers see different prices:
- Create test members in each tier
- Process test transactions for each
- Confirm correct pricing applies based on tier

## Exclusive Member Items

Some items can be available only to members:

**Configure Member-Only Pricing.** Create items with no standard pricing, only member pricing:
- Standard price: Not available (or set very high)
- Member price: Actual selling price
- Result: Only members can purchase at reasonable price

**Mark Items as Member Exclusive.** If your system supports item flags:
- Flag item as "Member Only"
- Display "Members Only" badge in catalogs
- Prevent purchase by non-members at POS and online

**Use Member-Only Categories.** Create product categories exclusively for members:
- "Member Exclusives" category
- Items in this category available only through member pricing
- Creates aspirational value for membership

**Featured Member Items.** Promote exclusive items in member communications:
- "New member-only products available this month"
- "Exclusive access for Gold members"
- Highlights membership value beyond discounts

## Managing Pricing Scheme Complexity

As programs grow, pricing scheme management becomes critical:

**Use Consistent Naming Conventions.** Establish naming patterns:
- Tier-based: "GOLD-", "SILVER-", "BRONZE-" prefixes
- Discount-based: "MEM-10PCT", "MEM-15PCT"
- Category-based: "MEM-ELEC", "MEM-APRL" (Electronics, Apparel)

**Document Scheme Purposes.** Maintain documentation of:
- What each scheme is for
- Which member tiers use it
- When it was created and why
- Expected usage volume

**Limit Active Schemes.** Avoid creating dozens of pricing schemes:
- More schemes increase complexity and maintenance
- Focus on schemes that drive program objectives
- Retire obsolete schemes when campaigns end

**Centralize Scheme Management.** Designate responsibility:
- Who can create new pricing schemes
- Who approves member pricing structures
- Who maintains scheme documentation
- Prevents proliferation of redundant schemes

**Regular Review Process.** Schedule periodic reviews:
- Are all active schemes still necessary?
- Should expired schemes be retired?
- Do schemes align with current program strategy?
- Are naming conventions still followed?

## Pricing Scheme Maintenance

Ongoing management keeps pricing current:

**Updating Scheme Values.** When you need to change member pricing:
- Locate the pricing scheme in Doc Item Maintenance
- Update the fixed price or discount percentage
- Save changes
- New pricing applies to all members accessing that scheme

**Scheme Effective Dates.** Use effective dates for:
- Launching new member pricing on specific dates
- Automatically expiring promotional pricing
- Seasonal pricing adjustments
- Aligns with marketing campaign timing

**Bulk Updates.** For widespread pricing changes:
- Export items with pricing schemes
- Update pricing in bulk file
- Reimport to update many schemes simultaneously
- Useful for annual pricing reviews or program restructures

**Archiving Old Schemes.** When schemes are no longer needed:
- Verify no pricebooks reference the scheme
- Mark scheme as inactive or delete it
- Maintain historical records for audit purposes
- Clean archived data periodically

## Integration with Pricebooks

Pricing schemes only affect members when referenced by pricebooks:

**Schemes are Inactive Alone.** Creating a pricing scheme doesn't automatically give anyone access. The scheme must be referenced by a pricebook, and members must be eligible for that pricebook.

**Pricebook References Schemes.** Pricebooks are configured in the Membership module (covered in the next section) to reference specific pricing schemes created in FI-ITEM.

**Member Eligibility.** Pricebooks define which members can access the referenced schemes based on member class, labels, or other criteria.

**Complete Flow Example:**
1. FI-ITEM: Create "GOLD-PRICE" scheme with 15% discount
2. Membership: Create "Gold-Member-Benefits" pricebook referencing "GOLD-PRICE"
3. Membership: Configure pricebook eligibility for member class "Gold"
4. Result: Gold members automatically receive 15% discount

**Testing the Integration.** Verify complete flow:
- Scheme exists in FI-ITEM
- Pricebook references scheme
- Members have qualifying class/labels
- Transaction applies special pricing

## Reporting on Pricing Schemes

Monitor member pricing usage:

**Scheme Usage Reports.** Track which pricing schemes are used most:
- Transaction volume by scheme
- Revenue impact by scheme
- Member segments using each scheme

**Discount Analysis.** Measure financial impact:
- Total discounts provided through member pricing
- Average discount per transaction
- Margin impact of member pricing
- Compare to sales lift from membership

**Item Performance with Member Pricing.** Analyze:
- Which items with member pricing sell best
- Whether member pricing drives volume increases
- Profitability of items with member pricing
- ROI of member pricing investments

**Scheme Effectiveness.** Evaluate:
- Are members aware of and using special pricing?
- Does member pricing drive tier progression?
- Which schemes provide best ROI?
- Should scheme structures be adjusted?

## Best Practices for Pricing Scheme Rewards

**Start with Key Items.** Don't try to create member pricing for every item initially. Focus on:
- Popular items that drive traffic
- High-margin items where discounts are sustainable
- Items that differentiate your program
- Expand coverage over time based on results

**Use Percentages for Maintenance.** Percentage discounts automatically adjust when standard pricing changes, reducing maintenance. Fixed prices require updates whenever base prices change.

**Create Clear Tier Value.** If using tier-based pricing, ensure meaningful differentiation between tiers. 5% vs. 6% isn't meaningful; 5% vs. 10% vs. 15% is.

**Test Thoroughly.** Before launching member pricing:
- Test scheme creation and configuration
- Verify pricing applies correctly in transactions
- Test across POS, e-commerce, and sales order channels
- Confirm accounting integration works correctly

**Document Completely.** Maintain comprehensive documentation:
- What each scheme provides
- How schemes align with program strategy
- Who manages each scheme
- When schemes were created and why

**Monitor Margin Impact.** Regularly review:
- Gross margin on items with member pricing
- Whether discounts are sustainable
- Adjustments needed based on cost changes
- Overall program profitability

**Coordinate with Merchandising.** Work with merchandising teams:
- Which categories should have member pricing
- What discount levels preserve margins
- Seasonal or promotional pricing alignment
- New item pricing strategies

**Communicate Value.** Ensure members understand their pricing benefits:
- "As a Gold member, you save 15% on electronics"
- Show original price and member price
- Highlight savings on receipts
- Reinforce value regularly

Pricing schemes are the foundation of automated member rewards. Configure them strategically to provide meaningful value that drives membership engagement while maintaining healthy program economics.
