---
title: "Points Setup"
description: "Configuring point currencies, conversion rates, cash redemption, and expiry rules"
weight: 20
bookCollapseSection: false
---

Points Setup establishes the virtual currency ecosystem that powers your loyalty program's earning and redemption mechanics. This section covers creating point currencies, defining conversion rates between them, enabling cash redemption at POS, and implementing expiry rules to manage program liability.

## What You'll Configure

**Point Currencies** are the virtual currencies members earn and redeem. These might be called "Rewards Points," "Miles," "Tokens," or any name that fits your brand. You can configure multiple currencies for different program contexts.

**Conversion Rates** define how points translate between different currencies or into monetary value. You might convert promotional points to standard rewards points, or convert rewards points to cash for POS redemption.

**Cash Conversion** enables members to use points as payment at point of sale. This critical configuration determines how many points equal one dollar (or your local currency) during checkout transactions.

**Expiry Rules** automatically expire points after defined periods, managing program liability and encouraging member engagement. Rules can vary by point currency, earning method, or member tier.

## Points System Architecture

Understanding the architecture helps you configure effectively:

**Point Currencies (PTS CCY)** are the foundation. Each currency has a unique code, name, and configuration. Examples: "REWARDS" for standard loyalty points, "PROMO" for promotional bonus points, "MILES" for travel programs.

**Point-to-Point Conversion (PTS to PTS)** allows translation between currencies. You might convert temporary promotional points to permanent rewards points, or convert points earned in one region to points usable in another.

**Point-to-Cash Conversion (PTS to CCY)** enables redemption as payment. This is typically configured for POS systems where members can redeem points to reduce transaction amounts.

**Expiry Policies** attach to currencies or earning transactions to automatically remove points after defined periods. This prevents indefinite liability accumulation and motivates timely redemption.

## Configuration Sequence

Follow this recommended order for points setup:

1. **Create Point Currencies** - Define your virtual currency types first
2. **Configure Conversion Rates** - Set up point-to-point conversions
3. **Enable Cash Conversion** - Configure POS redemption rates
4. **Implement Expiry Rules** - Define when points become invalid

This sequence ensures that currencies exist before you create rules that reference them, and that conversion mechanics are established before setting expiry policies that affect point values.

## Single vs. Multiple Currency Designs

**Single Currency Programs** use one point type for all earning and redemption:
- Simpler for members to understand
- Easier to administer and explain
- No conversion complexity
- All points have equivalent value

**Multiple Currency Programs** use different point types for different purposes:
- Separate promotional points from earned points
- Distinguish transferable from non-transferable points
- Create premium currencies for VIP benefits
- Support program partnerships with different point types

Most programs start with a single currency and add additional currencies only when there's a clear business need.

## Integration Points

Points configuration integrates with several modules:

**Financial Accounting** receives journal entries when points are issued (creating liability) and redeemed (reducing liability). Your conversion rates determine how point transactions are valued in accounting records.

**POS Systems** use your cash conversion rates during checkout when members redeem points as payment. The configuration must be complete and tested before POS deployment.

**Sales & CRM** point earning may be configured through sales rules that trigger point credits when transactions occur. The point currency must exist before earning rules can reference it.

**E-Commerce** platforms can display point balances and allow online redemption using your configured currencies and conversion rates.

## Liability Management

Points represent financial liability that must be managed:

**Accrued Liability.** Every point issued creates a liability on your balance sheet equal to its estimated redemption value. This liability remains until points are redeemed or expired.

**Breakage.** Not all issued points are ever redeemed. "Breakage" refers to points that expire or are never used. Conservative financial planning assumes lower breakage; aggressive planning assumes higher breakage.

**Expiry as Liability Management.** Point expiry rules help manage liability by automatically removing aged points that members are unlikely to redeem. This is both a financial control and a member engagement motivator.

**Cash Conversion Impact.** Enabling cash redemption at POS increases redemption likelihood (lower breakage) because redemption is convenient. Factor this into liability projections.

**Accounting Coordination.** Work with your finance team to ensure point transactions flow correctly to your general ledger and that liability accounts accurately reflect issued but unredeemed points.

## Testing Points Configuration

Before launching to members, thoroughly test your points setup:

**Test Point Earning.** Create test transactions that should earn points. Verify correct point amounts credit to member balances in the expected currency.

**Test Point-to-Point Conversion.** If configured, test converting points from one currency to another. Verify conversion rates apply correctly and balances update appropriately.

**Test Cash Redemption.** At a POS terminal, test redeeming points as payment. Verify the conversion rate calculates correctly and the transaction completes with the proper point deduction and payment reduction.

**Test Expiry Rules.** If possible, test that expiry rules execute correctly. This may require manipulating test dates or waiting for scheduled expiry processes to run.

**Verify Accounting Integration.** Review financial transactions generated by test point activity. Confirm that liability accounts update correctly and journal entries make sense to your accounting team.

## Points Setup Best Practices

**Start Simple.** Begin with one point currency and straightforward conversion rates. Add complexity only when business requirements clearly demand it.

**Choose Round Numbers.** Use conversion rates that are easy for members to calculate mentally. "1,000 points = $10" is clearer than "847 points = $10."

**Document Rationale.** Record why you set conversion rates and expiry rules as you did. This documentation helps future staff understand the program design and supports consistent decision-making.

**Consider Member Experience.** Configure points in ways members will find intuitive. Complicated conversion schemes frustrate members even if they make business sense.

**Plan for Adjustment.** Build in flexibility to adjust rates and rules as your program matures. Initial assumptions about redemption rates or liability may need refinement based on actual member behavior.

**Monitor Liability.** Regularly review point liability reports. If liability is growing faster than expected, you may need to adjust earning rates, expiry rules, or redemption incentives.

## Explore This Section

The Points Setup subsection contains detailed guides for each configuration area:

- **Currency Configuration** - Creating and managing point currencies
- **Conversion Rates** - Setting up point-to-point conversions
- **Cash Conversion** - Enabling point redemption as payment at POS
- **Expiry Rules** - Configuring automatic point expiration

Work through these topics in sequence for initial setup, or reference specific guides when modifying your existing points system.
