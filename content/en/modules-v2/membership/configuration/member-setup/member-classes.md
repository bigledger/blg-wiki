---
title: "Member Classes"
description: "Creating and configuring member classes for tier-based loyalty programs"
weight: 20
---

Member classes define tiers or categories within your membership program. Classes enable you to segment members based on status, provide differentiated benefits, and create progression paths that encourage increased engagement and spending.

## Understanding Member Classes

A member class represents a tier, level, or category within your membership structure. Common examples include:

- **Tier Programs:** Bronze, Silver, Gold, Platinum
- **Subscription Levels:** Basic, Premium, VIP
- **Customer Types:** Retail, Wholesale, Corporate
- **Status Levels:** Standard, Preferred, Elite

Each member can be assigned to one class at a time. Members may progress between classes based on qualifying criteria such as annual spending, tenure, or manual assignment. The class assignment determines what benefits, rewards, and pricing the member is eligible for.

## When to Use Member Classes

Use member classes when you want to:

**Implement Tier-Based Programs.** If your loyalty program offers different benefit levels based on member status, classes provide the structure to define and manage these tiers.

**Differentiate Pricing.** Classes can control access to different pricing schemes. Gold members might see prices 10% lower than Silver members through class-specific pricebook assignments.

**Control Reward Eligibility.** Certain rewards or exclusive products can be made available only to specific member classes, creating aspirational benefits for tier progression.

**Segment Reporting.** Classes provide a primary dimension for analyzing program performance—points earned by tier, redemption rates by class, or tier distribution over time.

**Drive Progression Behavior.** Visible tier structures motivate members to increase spending or engagement to reach the next tier level and unlock better benefits.

## When Not to Use Member Classes

Member classes are not the right solution for every segmentation need:

**Avoid classes for temporary attributes.** If a characteristic is temporary or changes frequently (like "participated in summer promotion"), use member labels instead. Classes represent more permanent status levels.

**Don't multiply classes for orthogonal attributes.** If you need to track both tier level AND customer type, don't create classes like "Gold-Retail," "Gold-Wholesale," "Silver-Retail," "Silver-Wholesale." Instead, use classes for tier (Gold, Silver) and labels for customer type (Retail, Wholesale).

**Don't use classes for non-exclusive categories.** If a member can belong to multiple categories simultaneously (like interest in both "Electronics" and "Home Goods"), use labels. A member can only have one class at a time.

**Avoid classes for marketing segmentation alone.** If the segmentation is purely for marketing campaigns and doesn't affect benefits or pricing, labels provide more flexibility without complicating the tier structure.

## Creating Member Classes

To create a new member class:

**Access Class Configuration.** Navigate to the Membership Module administration area and locate the member class configuration function. This is typically under Membership Setup > Member Classes or similar menu path.

**Initiate New Class.** Click "New" or "Create Class" to open the class definition form.

**Define Class Code.** Enter a unique code to identify this class in the system. Class codes are typically short alphanumeric identifiers like "GOLD," "SLV," or "PLAT." Once created, class codes generally cannot be changed, so choose carefully.

**Enter Class Name.** Provide a descriptive name that will appear in member-facing communications and reports. Examples: "Gold Member," "Silver Tier," "Platinum Status."

**Set Class Description.** Add a detailed description explaining what this class represents, what benefits it includes, and what qualifies a member for this tier. This description helps staff understand the class purpose.

**Assign Class Rank.** Enter a numeric rank to establish the hierarchy of classes. Rank 1 might be your entry-level tier, rank 2 the next level up, and so on. Rank determines sort order in reports and may control upgrade/downgrade logic.

**Configure Point Multipliers.** If your program offers class-based point earning multipliers, configure them here. For example, Gold members might earn 1.5x points on purchases while Silver earns 1x. This multiplier applies to all point-earning transactions for members in this class.

**Set Default Point Currency.** Specify which point currency members in this class primarily use if you have multiple currencies. Most single-currency programs can leave this as the default.

**Define Effective Dates.** Set when this class becomes available for assignment and when it expires (if applicable). Most ongoing tiers have an open-ended effective period, but limited-time promotional tiers might have specific date ranges.

**Save the Class.** Click "Save" to create the member class. The class is now available for assignment during member creation and for existing member updates.

## Configuring Class-Based Benefits

After creating the class structure, configure what benefits each class receives:

**Class-Specific Pricing.** In the Pricing Scheme configuration (Doc Item Maintenance), create pricing schemes that reference specific member classes. A scheme might specify "10% discount for Gold members" or "Special price $49.99 for Platinum members." The pricing engine automatically applies the correct price based on the member's class during transaction processing.

**Point Earning Rates.** Configure different point accrual rates by class. This can be done through:
- Class-level multipliers that apply to all earning transactions
- Campaign-specific earning rules that vary by class
- Promotion definitions that target specific classes

**Reward Access.** In pricebook configuration, specify which classes can access particular rewards. Exclusive items might be available only to Platinum members, while basic rewards are open to all classes.

**Service Levels.** Document in class descriptions what service benefits each tier receives (priority support, dedicated account managers, expedited shipping, etc.). While these may not be system-enforced, documenting them provides clarity for staff and members.

## Tier Progression Configuration

Define the criteria and process for members to progress between classes:

**Qualifying Criteria.** Document what qualifies a member for each tier. Common criteria include:
- Annual spending thresholds (e.g., spend $5,000 to reach Gold)
- Point earning levels (e.g., earn 50,000 points to reach Platinum)
- Tenure milestones (e.g., 5 years membership for VIP)
- Transaction frequency (e.g., 12 purchases per year for Premium)

**Evaluation Period.** Define when tier qualifications are evaluated. Options include:
- Real-time promotion as soon as criteria are met
- Periodic reviews (monthly, quarterly, annually)
- Anniversary-based evaluation (on each member's join date anniversary)

**Upgrade Process.** Determine whether upgrades happen automatically based on system criteria or require manual review and approval. Automated upgrades provide instant gratification but require robust business rules. Manual upgrades allow for exceptions and judgment.

**Downgrade Rules.** Specify if and when members can be downgraded to lower tiers. Many programs offer "tier protection" for a grace period (e.g., maintain Gold status for 6 months after failing to re-qualify). Others immediately downgrade at the evaluation period.

**Communication of Changes.** Plan how you'll notify members of tier changes. Upgrades should be celebrated with congratulatory messages highlighting new benefits. Downgrades require sensitive communication explaining what happened and how to re-qualify.

## Class Hierarchy and Ranking

Proper class ranking ensures logical tier ordering:

**Numeric Ranking.** Assign rank numbers that clearly indicate the hierarchy. Using ranks like 10, 20, 30, 40 (rather than 1, 2, 3, 4) leaves room to insert new tiers later without renumbering everything.

**Consistent Ordering.** Ensure rank numbers align with benefit levels—higher rank numbers should correspond to higher benefit tiers, or vice versa, consistently throughout your configuration.

**Default Class.** Designate which class new members are assigned to by default if no class is specified during creation. This is typically your entry-level tier.

**Display Ordering.** Reports and dropdowns will typically order classes by rank. Verify that this ordering makes sense from a user perspective.

## Practical Class Configurations

Different program types use classes in distinct ways:

**Traditional Tier Program:** Three to five classes representing clear benefit levels.
- Bronze (Rank 10): Entry level, standard benefits
- Silver (Rank 20): 1.25x points, 5% member pricing
- Gold (Rank 30): 1.5x points, 10% member pricing, exclusive rewards
- Platinum (Rank 40): 2x points, 15% member pricing, VIP services

**Subscription-Based Program:** Classes represent different paid membership levels.
- Free (Rank 10): Basic access, standard pricing
- Premium (Rank 20): Monthly fee, enhanced benefits
- Ultimate (Rank 30): Annual fee, all benefits unlocked

**Customer Type Program:** Classes segment by business relationship rather than status progression.
- Retail (Rank 10): Consumer customers, retail pricing
- Trade (Rank 20): Professional contractors, trade pricing
- Wholesale (Rank 30): Business customers, wholesale pricing

**Hybrid Program:** Combines tier progression with customer type.
- Retail-Standard (Rank 10)
- Retail-Premium (Rank 20)
- Business-Standard (Rank 30)
- Business-Premium (Rank 40)

Choose the structure that best matches your business model and member value proposition.

## Class Lifecycle Management

Member classes require ongoing management:

**Reviewing Class Structure.** Periodically review whether your class structure still serves your business objectives. Are there too many tiers? Too few? Do the qualification thresholds make sense given current spending patterns?

**Modifying Existing Classes.** You can typically update class names, descriptions, and benefit configurations. However, changing class codes or ranks may have system implications. Test changes in a development environment before applying to production.

**Retiring Classes.** If you need to discontinue a class, first move all members out of that class to another appropriate tier. Once no members are assigned, you can mark the class as inactive or delete it (if your system allows). Never delete a class with active members assigned.

**Introducing New Classes.** Adding a new tier to an existing program requires careful planning. Determine where in the rank hierarchy it fits, define its benefits clearly relative to existing tiers, and communicate to existing members how this new tier affects their program experience.

**Seasonal or Promotional Classes.** Some programs create temporary classes for special promotions or limited-time status offers. Use effective dates to control when these classes are available, and have a plan for transitioning members out when the period ends.

## Class Assignment and Reassignment

Managing class assignments for individual members:

**Initial Assignment.** During member creation, assign the appropriate class based on enrollment criteria. Most new members start in the entry-level class unless they qualify for immediate higher tier placement.

**Manual Reassignment.** To change a member's class, access their member record, update the class field, and save. Document the reason for manual class changes in notes or audit fields.

**Bulk Reassignment.** For tier evaluation periods that affect many members, use bulk update functionality or import processes to reassign classes efficiently. Export members who qualify for upgrades/downgrades, update their class in the export file, then reimport with updated class assignments.

**Effective Dating.** Some implementations allow you to schedule future class changes. For example, a member qualifies for Gold effective next month. Set the class change with a future effective date so it automatically applies on the scheduled date.

**Audit Trail.** Maintain records of class changes for each member. Audit trails should show what class the member was assigned to, when it changed, who made the change, and ideally why it changed. This history is valuable for member inquiries and program analysis.

## Reporting and Analytics by Class

Member classes provide powerful reporting dimensions:

**Membership Distribution.** Track how many active members are in each class. Monitor distribution trends over time—a healthy program typically shows growth in higher tiers as members engage and progress.

**Performance by Class.** Analyze key metrics by class:
- Average transaction value by tier
- Purchase frequency by class
- Point redemption rates by tier
- Program ROI by class level

**Progression Analytics.** Measure how members move between classes. What percentage of Bronze members reach Silver within one year? How long does it take on average to progress from Gold to Platinum? What's your retention rate by tier?

**Benefit Utilization.** Track which class-specific benefits are most valued. If Platinum members rarely use certain exclusive rewards, those might not be compelling tier benefits.

**Class Value Assessment.** Calculate lifetime value by class to understand which tiers are most profitable. This informs where to invest in acquisition and retention efforts.

## Common Configuration Mistakes

Avoid these common pitfalls when configuring member classes:

**Too Many Tiers.** Creating 8-10 tiers makes progression confusing and dilutes the meaning of each tier. Three to five tiers is optimal for most programs.

**Unclear Benefit Differentiation.** If benefits between adjacent tiers are too similar, members won't be motivated to progress. Ensure meaningful benefit gaps between classes.

**Impossible Qualification Thresholds.** Setting Gold qualification at $100,000 annual spend when your average customer spends $2,000 creates an unreachable tier that frustrates rather than motivates.

**No Entry-Level Class.** Every program needs a starting point. Don't make your lowest tier difficult to qualify for—it should be achievable for new members.

**Inconsistent Naming.** Mixing naming conventions (Bronze/Silver/Gold combined with Level 1/Level 2) creates confusion. Choose one naming scheme and stick with it.

**Forgetting to Configure Benefits.** Creating class structures without actually configuring different benefits means classes are meaningless. Ensure pricing schemes, point multipliers, and reward access align with class definitions.

Member classes are the backbone of tier-based loyalty programs. Configure them thoughtfully to create clear progression paths, meaningful benefits, and lasting member engagement.
