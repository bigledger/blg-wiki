---
title: "Quick Start Guide"
description: "5-minute setup guide for your first membership program with minimal configuration"
weight: 20
---

Get your first membership program up and running in just 5 minutes. This quick start guide focuses on the essential configurations needed to create a basic loyalty program with points earning and redemption.

## What You'll Build

By the end of this guide, you'll have a working loyalty program with:

- **Single membership tier** - "Standard Member"
- **Points currency** - Loyalty Points (LOYPTS)
- **Simple earning rule** - $1 spent = 1 point earned
- **Basic redemption** - 100 points = $1 discount
- **Test member account** - Ready to demonstrate functionality

**Time Required:** 5-10 minutes

**Skill Level:** Beginner

**Prerequisites:** Access to BigLedger with Organization and Customer Maintenance applets configured

## Before You Start

Ensure you have:

- [ ] Administrative access to BigLedger
- [ ] Organization Applet configured with at least one location
- [ ] Customer Maintenance Applet accessible
- [ ] Permission to install/configure applets

{{< callout type="info" >}}
**Note**: This quick start uses minimal configuration. For production deployments, follow the complete [First Membership Program](/modules/membership/getting-started/first-membership-program/) guide.
{{< /callout >}}

## Step 1: Create Points Currency

**Time: 1 minute**

Points currency defines the "money" of your loyalty program.

### Navigate to Points Currency Module

1. Go to **Applets** menu
2. Find and open **PTS CCY Module** (Points Currency)
3. Click the **"+"** button to create new currency

### Configure Currency

Enter these values:

| Field | Value | Purpose |
|-------|-------|---------|
| **Currency Code** | `LOYPTS` | Unique identifier (all caps, no spaces) |
| **Currency Name** | `Loyalty Points` | Display name for members |
| **Status** | `Active` | Enable for immediate use |

Click **"Create"** to save.

**✓ Checkpoint:** You should see "LOYPTS - Loyalty Points" in the currency list.

## Step 2: Create Membership Product

**Time: 2 minutes**

Membership products represent the membership offering in your inventory system.

### Navigate to Doc Item Maintenance

1. Go to **Applets** menu
2. Open **Doc Item Maintenance Applet**
3. Click **"+"** to create new item
4. Select item type: **FI-ITEM** (Financial Item)

### Configure Membership Item

Enter these details:

| Field | Value | Notes |
|-------|-------|-------|
| **Item Code** | `MEM-STD` | Internal reference code |
| **Item Name** | `Standard Membership` | Customer-facing name |
| **Item Type** | `FI-ITEM` | Financial item (non-inventory) |
| **Unit Price** | `0.00` | Free membership (or set fee if needed) |
| **GL Account** | Select revenue account | For financial tracking |
| **Tax Code** | Select appropriate tax | Usually exempt for membership |

Click **"Save"** to create the item.

**✓ Checkpoint:** MEM-STD should appear in your item list.

## Step 3: Configure Member Class

**Time: 1 minute**

Member class defines the tier and associated benefits.

### Access Membership Program Applet

1. Navigate to **Applets** > **Membership Program Applet**
2. Go to **Member Classes** section
3. Click **"+"** to create new class

### Create Standard Member Class

| Field | Value | Purpose |
|-------|-------|---------|
| **Class Code** | `STANDARD` | Internal identifier |
| **Class Name** | `Standard Member` | Display name |
| **Points Currency** | `LOYPTS` | Link to currency created in Step 1 |
| **Default Tier** | `Yes` | Auto-assign to new members |
| **Status** | `Active` | Enable for use |

Click **"Create"** to save.

**✓ Checkpoint:** STANDARD class visible in member class list.

## Step 4: Set Up Earning Rule

**Time: 1 minute**

Define how members earn points on purchases.

### Navigate to Earning Rules

1. Within **Membership Program Applet**
2. Select **Earning Rules** section
3. Click **"+"** to create new rule

### Configure Basic Earning Rule

| Field | Value | Description |
|-------|-------|-------------|
| **Rule Name** | `Purchase Points` | Descriptive name |
| **Member Class** | `STANDARD` | Apply to standard members |
| **Trigger** | `Sales Transaction` | Earn on purchases |
| **Calculation** | `Amount-based` | Based on purchase value |
| **Earning Rate** | `1` point per `1` dollar | Simple 1:1 ratio |
| **Points Currency** | `LOYPTS` | Credit to loyalty points |
| **Status** | `Active` | Enable immediately |

Click **"Save"** to activate the rule.

**✓ Checkpoint:** Purchase Points rule shows as Active.

## Step 5: Configure Redemption Option

**Time: 1 minute**

Set up how members can use their points.

### Create Redemption Rule

1. In **Membership Program Applet**
2. Navigate to **Redemption Rules** section
3. Click **"+"** to create new rule

### Configure Points-to-Discount Redemption

| Field | Value | Purpose |
|-------|-------|---------|
| **Redemption Name** | `Points Discount` | Rule identifier |
| **Redemption Type** | `Points to Cash` | Convert points to money off |
| **Conversion Rate** | `100` points = `1` dollar | Redemption ratio |
| **Minimum Redemption** | `100` points | Lowest amount redeemable |
| **Member Class** | `STANDARD` | Available to standard members |
| **Status** | `Active` | Enable for use |

Click **"Save"** to complete setup.

**✓ Checkpoint:** Points Discount redemption rule is active.

## Step 6: Create Test Member

**Time: 1 minute**

Create a test member account to verify everything works.

### Create Customer with Membership

1. Navigate to **Customer Maintenance Applet**
2. Click **"+"** to create new customer
3. Enter basic customer information:

**Customer Details:**
```
Name: Test Member
Email: test.member@example.com
Phone: (555) 123-4567
Status: Active
```

4. In the **Membership** section:
   - Check **"Enroll in Membership Program"**
   - Select Member Class: **STANDARD**
   - Points Currency: **LOYPTS** (auto-selected)
   - Initial Points Balance: **0** (or award welcome points if desired)

5. Click **"Save"** to create customer with membership

**✓ Checkpoint:** Customer created with active membership in STANDARD tier.

## Step 7: Test the Program

**Time: 2 minutes**

Verify your membership program is working correctly.

### Test Points Earning

Create a test transaction to earn points:

1. Go to **POS** or **Sales** module (whichever you use)
2. Create a sale for your test member
3. Transaction amount: **$25.00**
4. Complete the transaction
5. Check member's point balance

**Expected Result:** Member should have **25 LOYPTS** (based on $1 = 1 point rule)

### Test Points Redemption

Redeem points on a purchase:

1. Create another transaction for test member
2. Transaction amount: **$15.00**
3. Member requests to use points
4. Apply redemption: Use **500 points** (if they have enough)
5. Discount applied: **$5.00** (500 points ÷ 100 = $5)
6. Final amount: **$10.00**

**Expected Result:** Points deducted, discount applied correctly.

## Success Checklist

Verify these items are complete:

### Configuration Complete

- [x] Points currency (LOYPTS) created and active
- [x] Membership product (MEM-STD) created in Doc Item Maintenance
- [x] Member class (STANDARD) configured
- [x] Earning rule (Purchase Points) active
- [x] Redemption rule (Points Discount) functional

### Testing Complete

- [x] Test member account created
- [x] Points earned on transaction
- [x] Points balance updated correctly
- [x] Points redeemed successfully
- [x] Discount applied accurately

## What You've Accomplished

Congratulations! You've successfully set up a basic membership program with:

✅ **Loyalty Points System** - Members earn points on every purchase
✅ **Automatic Earning** - Points calculated and awarded in real-time
✅ **Flexible Redemption** - Members can use points for discounts
✅ **Working Test Account** - Proven functionality with test transactions

## Next Steps

Now that you have a basic program running, consider these enhancements:

### Immediate Enhancements

1. **Add Welcome Bonus** - Award 100 points to new members
2. **Birthday Rewards** - Configure birthday month bonus points
3. **Multiple Earning Rules** - Different rates for product categories
4. **Minimum Purchase** - Require minimum spend to earn points

### Advanced Features

1. **Multi-Tier Program** - Add Silver and Gold tiers with better benefits
2. **Points Expiry** - Configure expiration rules for liability management
3. **POS Integration** - Enable member card scanning at checkout
4. **E-Commerce Portal** - Let members view balances online

### Production Readiness

Before launching to real customers:

1. **Review [Installation Requirements](/modules/membership/getting-started/installation-requirements/)** - Ensure all dependencies configured
2. **Follow [First Membership Program](/modules/membership/getting-started/first-membership-program/)** - Build production-ready program
3. **Configure Financial Accounting** - Set up proper liability tracking
4. **Set Up Reporting** - Configure program performance dashboards
5. **Train Staff** - Ensure team understands operations
6. **Prepare Communications** - Member enrollment and benefit materials

## Common Quick Start Issues

### Points Not Calculating

**Problem:** Transaction completed but no points awarded

**Solutions:**
- Verify earning rule status is **Active**
- Check member class matches earning rule configuration
- Confirm transaction type is eligible (check trigger setting)
- Review member account status (must be Active)

### Cannot Create Member Class

**Problem:** Error when trying to create member class

**Solutions:**
- Ensure points currency created first (Step 1)
- Verify Organization Applet has active location
- Check user has appropriate permissions
- Confirm unique class code (no duplicates)

### Redemption Not Working

**Problem:** Cannot apply points discount at checkout

**Solutions:**
- Verify member has sufficient point balance
- Check minimum redemption threshold met (100 points minimum)
- Confirm redemption rule is Active
- Ensure POS/Sales module integration configured

### Member Not Found

**Problem:** Cannot find member at checkout

**Solutions:**
- Verify customer membership status is Active
- Check member class assignment
- Confirm customer record saved properly
- Test with customer phone or email lookup

## Expanding Your Program

### Adding More Tiers

To upgrade from single-tier to multi-tier:

1. Create additional member classes (SILVER, GOLD)
2. Configure different earning rates per tier
3. Set up tier progression rules
4. Define tier-specific redemption benefits

**Example:**
```
STANDARD: $1 = 1 point
SILVER:   $1 = 1.5 points
GOLD:     $1 = 2 points
```

### Multiple Points Currencies

Add special campaign points:

1. Create new currency (e.g., PROMOPTS)
2. Configure separate earning rules for promotional periods
3. Set different redemption options for promo points
4. Run limited-time campaigns

### Integration with POS

Enable seamless checkout experience:

1. Configure member identification methods (card, phone, QR)
2. Set up automatic points calculation
3. Enable real-time balance display
4. Configure receipt printing with points balance

## Resources

### Documentation

- [Membership Module Overview](/modules/membership/) - Complete feature guide
- [First Membership Program](/modules/membership/getting-started/first-membership-program/) - Detailed walkthrough
- [Installation Requirements](/modules/membership/getting-started/installation-requirements/) - Prerequisites checklist

### Applet Guides

- [Membership Points Currency](/applets/membership-points-currency/) - Currency configuration
- [Membership Program Applet](/applets/membership-program/) - Program setup
- [Membership Admin Console](/applets/membership-admin-console-applet/) - Administration
- [Customer Maintenance](/applets/customer-maintenance-applet/) - Member management

### Support

- **BigLedger Support** - Technical assistance
- **Implementation Services** - Professional setup help
- **Community Forum** - User discussions and tips
- **Training Videos** - Visual learning resources

## Conclusion

You've successfully completed the Quick Start Guide! Your basic membership program is now operational and ready for testing.

**What's Configured:**
- Points currency for your loyalty program
- Member tier for customer assignment
- Earning rules for automatic points
- Redemption mechanism for points usage
- Test member to validate functionality

**What's Next:**
For production deployment, proceed to the [First Membership Program](/modules/membership/getting-started/first-membership-program/) guide to build a complete, enterprise-ready loyalty program with advanced features.

{{< callout type="tip" >}}
**Pro Tip**: Use this quick start setup as a sandbox environment. Experiment with different configurations, test various scenarios, and gain confidence before implementing your production program.
{{< /callout >}}
