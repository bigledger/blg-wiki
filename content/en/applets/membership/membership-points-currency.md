---
bookHidden: true
title: "Membership Points Currency Configuration"
description: "Set up and manage loyalty points currency for membership programs"
weight: 160
---
bookHidden: true

# Points Currency Configuration Guide

The PTS CCY (Points Currency) Module allows you to create and manage custom point currencies for your membership and loyalty programs.

## Overview

Point currencies enable flexible loyalty programs where customers earn and redeem points based on various business rules. You can create multiple point currencies for different programs or tiers.

## Creating Point Currency

### Step 1: Access the Module

1. Navigate to **Applets** > **PTS CCY Module**
2. Click the **"+"** button to create a new membership point currency

### Step 2: Fill Required Information

Complete the following mandatory fields:

| Field | Description | Example |
|-------|-------------|---------|
| **Currency Code** | Unique identifier for the point currency | `LOYPTS`, `GOLDPTS`, `VIPPTS` |
| **Currency Name** | Display name for the currency | `Loyalty Points`, `Gold Points` |

### Step 3: Create Currency

Click **"Create"** to add the new membership point currency to your system.

## Managing Point Currencies

### Viewing Currencies

After creation, all point currencies are listed in the main page showing:
- Currency code
- Currency name
- Status (Active/Inactive)
- Actions (Edit/Delete)

### Editing Currency Details

To modify an existing point currency:

1. Click on the currency in the listing
2. Edit available fields:
   - **Currency Name** - Update the display name
   - **Status** - Activate or deactivate the currency

3. Click **"Save"** to apply changes

### Deleting Currency

To remove a point currency:
1. Click on the currency in the listing
2. Click **"Delete"** button
3. Confirm the deletion

{{< callout type="warning" >}}
**Caution**: Deleting a point currency will affect all members with existing point balances. Ensure all points are cleared or transferred before deletion.
{{< /callout >}}

## Use Cases

### Multi-Tier Loyalty Programs

Create different point currencies for various membership tiers:
- **Basic Points** - Standard earning rate
- **Silver Points** - 1.5x earning rate
- **Gold Points** - 2x earning rate
- **Platinum Points** - 3x earning rate

### Campaign-Specific Points

Set up temporary point currencies for promotions:
- **Holiday Points** - Double points during festive seasons
- **Birthday Points** - Special birthday month rewards
- **Referral Points** - Points earned from referrals

### Partner Programs

Manage points from partner collaborations:
- **Airline Miles** - Convert to flight rewards
- **Hotel Points** - Redeem for accommodations
- **Dining Points** - Restaurant partnerships

## Configuration Best Practices

### Naming Conventions

- Use clear, descriptive names
- Include tier or program identifier
- Avoid special characters in codes

### Point Values

Consider these factors when setting point values:
- Purchase frequency
- Average transaction value
- Redemption thresholds
- Competitor programs

### Expiration Policies

Implement point expiration rules:
- Annual expiration
- Rolling expiration
- No expiration for premium tiers

## Integration with Other Modules

### Sales Module
- Automatic point earning on purchases
- Point redemption at checkout
- Point balance display

### Member Management
- Track individual point balances
- Point transaction history
- Tier progression tracking

### Reporting
- Point liability reports
- Redemption analytics
- Program performance metrics

## Common Configurations

### Standard Loyalty Program

```
Currency Code: LOYPTS
Currency Name: Loyalty Points
Earning Rate: $1 = 1 point
Redemption Rate: 100 points = $1
```

### Premium Member Program

```
Currency Code: PREMPTS
Currency Name: Premium Points
Earning Rate: $1 = 2 points
Redemption Rate: 50 points = $1
```

### Referral Rewards

```
Currency Code: REFPTS
Currency Name: Referral Points
Earning: 500 points per referral
Redemption: Special rewards catalog
```

## Troubleshooting

### Points Not Accumulating
- Verify currency status is Active
- Check member enrollment status
- Review earning rules configuration

### Cannot Delete Currency
- Ensure no active point balances
- Check for pending transactions
- Remove from active promotions

### Currency Not Appearing
- Confirm creation was successful
- Check user permissions
- Refresh the module page

## Related Documentation

- [Membership Admin Console](/applets/membership-admin-console-applet/)
- [Membership Program Setup](/applets/membership-program/)
- [Member Class Configuration](/user-guide/member-class/)
- [Points Redemption Rules](/guides/)
