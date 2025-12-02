---
title: "POS Integration"
description: "Integrate membership functionality with point-of-sale systems using the POS General Applet"
weight: 2
---

The Membership Module integrates seamlessly with BigLedger's POS General Applet, enabling comprehensive membership functionality at physical checkout locations. This integration provides real-time member identification, automatic points accrual, redemption processing, and tier-based benefits application during point-of-sale transactions.

## Integration Overview

POS integration enables cashiers to identify members, view their membership status, apply tier-based discounts, award points based on purchase amounts, process points redemptions, and complete transactions with full membership functionality without interrupting the checkout flow.

The integration operates through a combination of local POS terminal capabilities and cloud-based membership services, ensuring rapid response times while maintaining data accuracy and synchronization with the central membership system.

## Member Identification Methods

### Membership Card Scanning

Members can present physical membership cards with barcodes or QR codes for instant identification. The POS terminal scans the card, extracts the member ID, and retrieves the member profile from the membership system.

**Barcode Format**: Member IDs are encoded in Code 128 format, providing reliable scanning across standard barcode readers. The encoded value matches the member ID format `MEM-{numeric-id}`.

**QR Code Format**: QR codes contain JSON payloads with member ID and verification checksum:

```json
{
  "memberId": "MEM-789012",
  "type": "membership",
  "checksum": "a7b3c9d2"
}
```

The POS system validates the checksum before accepting the member ID, preventing fraudulent card usage.

### Phone Number Lookup

When members don't have their cards, cashiers can look up membership accounts by phone number. The system searches for exact phone number matches and displays member information for cashier verification.

```javascript
async function lookupMemberByPhone(phoneNumber) {
  const result = await api.request('GET', `/members?search=${phoneNumber}&limit=5`);

  if (result.data.length === 0) {
    return null;
  }

  if (result.data.length === 1) {
    return result.data[0];
  }

  // Multiple matches - cashier selects correct member
  return displayMemberSelection(result.data);
}
```

### Email Address Lookup

Similar to phone lookup, members can provide email addresses for account identification. Email lookups perform case-insensitive matching and display results for cashier confirmation.

### Mobile App Integration

Members with the BigLedger mobile app can present dynamic QR codes generated within the app. These codes expire after 60 seconds, providing enhanced security compared to static card codes.

The dynamic QR payload includes timestamp and signature:

```json
{
  "memberId": "MEM-789012",
  "timestamp": 1705329600,
  "signature": "e8f4a2c7d9b1"
}
```

The POS terminal verifies the signature and timestamp before accepting the identification.

## Points Earning at Checkout

### Automatic Points Calculation

Points are calculated automatically based on purchase amount, tier multipliers, and active promotional rules. The POS terminal sends transaction details to the membership API, which applies all relevant rules and returns the calculated points.

```javascript
async function calculatePoints(memberId, purchaseAmount, transactionItems) {
  const member = await getMemberDetails(memberId);

  // Base points calculation
  const baseEarnRate = 0.5; // 1 point per 2 MYR
  let basePoints = Math.floor(purchaseAmount * baseEarnRate);

  // Apply tier multiplier
  const tierMultipliers = {
    'BRONZE': 1.0,
    'SILVER': 1.25,
    'GOLD': 1.5,
    'PLATINUM': 2.0
  };

  const multiplier = tierMultipliers[member.tier] || 1.0;
  const totalPoints = Math.floor(basePoints * multiplier);

  return {
    basePoints: basePoints,
    tierMultiplier: multiplier,
    totalPoints: totalPoints,
    tier: member.tier
  };
}
```

### Transaction Processing

When the transaction is completed, the POS terminal awards points to the member account:

```javascript
async function completePurchaseWithPoints(memberId, transactionData) {
  // Calculate points
  const pointsCalc = await calculatePoints(
    memberId,
    transactionData.totalAmount,
    transactionData.items
  );

  // Award points
  const pointsResult = await api.request('POST', '/points/earn', {
    memberId: memberId,
    points: pointsCalc.totalPoints,
    reason: 'Purchase transaction',
    referenceId: transactionData.transactionId,
    metadata: {
      transactionAmount: transactionData.totalAmount,
      location: transactionData.storeLocation,
      earnRate: 0.5,
      tierMultiplier: pointsCalc.tierMultiplier
    }
  });

  // Print points summary on receipt
  return {
    success: true,
    pointsEarned: pointsCalc.totalPoints,
    previousBalance: pointsResult.data.previousBalance,
    newBalance: pointsResult.data.newBalance,
    transactionId: pointsResult.data.transactionId
  };
}
```

### Category-Based Multipliers

Different product categories may have different earning rates. The POS system applies category multipliers when calculating points:

```javascript
function calculateCategoryPoints(transactionItems) {
  const categoryMultipliers = {
    'electronics': 1.0,
    'fashion': 1.5,
    'grocery': 0.5,
    'beauty': 1.25
  };

  let totalPoints = 0;

  transactionItems.forEach(item => {
    const basePoints = item.amount * 0.5;
    const multiplier = categoryMultipliers[item.category] || 1.0;
    const itemPoints = Math.floor(basePoints * multiplier);
    totalPoints += itemPoints;
  });

  return totalPoints;
}
```

## Points Redemption

### Redemption Workflow

Members can redeem points for discounts or rewards during checkout. The POS system validates available points, processes the redemption, and applies the discount to the current transaction.

**Step 1: Display Available Redemptions**

The POS terminal queries available rewards based on the member's points balance and tier:

```javascript
async function getAvailableRedemptions(memberId) {
  const balance = await api.request('GET', `/points/balance/${memberId}`);
  const rewards = await api.request('GET', '/config/rewards?available=true');

  // Filter rewards member can afford
  const availableRewards = rewards.data.filter(reward => {
    return reward.pointsCost <= balance.data.currentPoints &&
           isEligibleForReward(balance.data.tier, reward.minimumTier);
  });

  return availableRewards;
}

function isEligibleForReward(memberTier, requiredTier) {
  const tierHierarchy = ['BRONZE', 'SILVER', 'GOLD', 'PLATINUM'];
  const memberLevel = tierHierarchy.indexOf(memberTier);
  const requiredLevel = tierHierarchy.indexOf(requiredTier);

  return memberLevel >= requiredLevel;
}
```

**Step 2: Process Redemption**

When the member selects a reward, the POS system processes the redemption:

```javascript
async function processRedemption(memberId, rewardId, transactionId) {
  // Get reward details
  const rewards = await api.request('GET', '/config/rewards');
  const reward = rewards.data.find(r => r.rewardId === rewardId);

  if (!reward) {
    throw new Error('Reward not found');
  }

  // Process redemption
  const redemptionResult = await api.request('POST', '/points/redeem', {
    memberId: memberId,
    points: reward.pointsCost,
    rewardId: rewardId,
    reason: reward.name,
    referenceId: transactionId
  });

  return {
    success: true,
    pointsRedeemed: reward.pointsCost,
    newBalance: redemptionResult.data.newBalance,
    rewardName: reward.name,
    discountAmount: reward.value,
    voucherCode: redemptionResult.data.voucherCode
  };
}
```

**Step 3: Apply Discount**

The POS system applies the redemption discount to the current transaction:

```javascript
function applyRedemptionDiscount(transaction, redemption) {
  transaction.discounts.push({
    type: 'points_redemption',
    description: redemption.rewardName,
    amount: redemption.discountAmount,
    voucherCode: redemption.voucherCode
  });

  transaction.totalAmount -= redemption.discountAmount;

  // Ensure total doesn't go negative
  if (transaction.totalAmount < 0) {
    transaction.totalAmount = 0;
  }

  return transaction;
}
```

## Tier-Based Benefits

### Automatic Discount Application

Members receive tier-based discounts automatically when identified at checkout:

```javascript
async function applyTierDiscount(memberId, purchaseAmount) {
  const member = await getMemberDetails(memberId);

  const tierDiscounts = {
    'BRONZE': 0,
    'SILVER': 5,
    'GOLD': 10,
    'PLATINUM': 15
  };

  const discountPercentage = tierDiscounts[member.tier] || 0;
  const discountAmount = purchaseAmount * (discountPercentage / 100);

  return {
    tier: member.tier,
    discountPercentage: discountPercentage,
    discountAmount: discountAmount,
    finalAmount: purchaseAmount - discountAmount
  };
}
```

### Exclusive Offers

Certain products or promotions may be exclusive to specific tiers. The POS system validates tier eligibility and applies exclusive offers:

```javascript
function validateTierExclusiveOffer(memberTier, offerRequirement) {
  const tierHierarchy = ['BRONZE', 'SILVER', 'GOLD', 'PLATINUM'];
  const memberLevel = tierHierarchy.indexOf(memberTier);
  const requiredLevel = tierHierarchy.indexOf(offerRequirement);

  if (memberLevel >= requiredLevel) {
    return {
      eligible: true,
      message: 'Tier-exclusive offer applied'
    };
  }

  return {
    eligible: false,
    message: `This offer requires ${offerRequirement} tier or higher`
  };
}
```

## Offline Capability

POS terminals may experience network connectivity issues. The integration includes offline capability to ensure uninterrupted service.

### Local Caching

Member profiles and points balances are cached locally on the POS terminal:

```javascript
class OfflineCache {
  constructor() {
    this.cache = new Map();
    this.pendingSync = [];
  }

  cacheMember(member) {
    this.cache.set(member.memberId, {
      data: member,
      cachedAt: Date.now(),
      synced: true
    });
  }

  getMember(memberId) {
    const cached = this.cache.get(memberId);
    if (!cached) return null;

    // Cache expires after 1 hour
    if (Date.now() - cached.cachedAt > 3600000) {
      return null;
    }

    return cached.data;
  }

  queueTransaction(transaction) {
    this.pendingSync.push({
      ...transaction,
      timestamp: Date.now(),
      synced: false
    });
  }

  async syncPendingTransactions() {
    const pending = this.pendingSync.filter(t => !t.synced);

    for (const transaction of pending) {
      try {
        await syncTransactionToCloud(transaction);
        transaction.synced = true;
      } catch (error) {
        console.error('Sync failed for transaction:', transaction.transactionId);
      }
    }

    // Remove synced transactions older than 24 hours
    this.pendingSync = this.pendingSync.filter(t =>
      !t.synced || (Date.now() - t.timestamp < 86400000)
    );
  }
}

const offlineCache = new OfflineCache();
```

### Offline Transaction Processing

When offline, the POS terminal processes transactions using cached data and queues updates for synchronization:

```javascript
async function processTransactionOffline(memberId, transactionData) {
  const cachedMember = offlineCache.getMember(memberId);

  if (!cachedMember) {
    throw new Error('Member profile not available offline');
  }

  // Calculate points using cached tier information
  const pointsCalc = calculatePoints(
    memberId,
    transactionData.totalAmount,
    transactionData.items,
    cachedMember.tier
  );

  // Queue transaction for sync
  offlineCache.queueTransaction({
    type: 'points_earn',
    memberId: memberId,
    points: pointsCalc.totalPoints,
    transactionId: transactionData.transactionId,
    amount: transactionData.totalAmount
  });

  return {
    success: true,
    offline: true,
    pointsEarned: pointsCalc.totalPoints,
    message: 'Transaction will be synchronized when connection is restored'
  };
}
```

### Synchronization

When connectivity is restored, pending transactions are synchronized with the cloud:

```javascript
async function syncTransactionToCloud(transaction) {
  if (transaction.type === 'points_earn') {
    await api.request('POST', '/points/earn', {
      memberId: transaction.memberId,
      points: transaction.points,
      reason: 'Purchase transaction (offline sync)',
      referenceId: transaction.transactionId,
      metadata: {
        offlineSync: true,
        originalTimestamp: transaction.timestamp
      }
    });
  }
}

// Periodic sync check
setInterval(async () => {
  if (isOnline()) {
    await offlineCache.syncPendingTransactions();
  }
}, 30000); // Every 30 seconds
```

## Receipt Integration

Membership information is printed on customer receipts including points earned, current balance, tier status, and expiring points notifications.

```javascript
function generateMembershipReceiptSection(member, transaction) {
  const receiptLines = [];

  receiptLines.push('MEMBERSHIP DETAILS');
  receiptLines.push(`Member: ${member.firstName} ${member.lastName}`);
  receiptLines.push(`Tier: ${member.tierName}`);
  receiptLines.push('');

  if (transaction.tierDiscount) {
    receiptLines.push(`Tier Discount (${transaction.tierDiscount.percentage}%): -RM${transaction.tierDiscount.amount.toFixed(2)}`);
  }

  if (transaction.pointsEarned) {
    receiptLines.push(`Points Earned: ${transaction.pointsEarned}`);
  }

  if (transaction.pointsRedeemed) {
    receiptLines.push(`Points Redeemed: -${transaction.pointsRedeemed}`);
  }

  receiptLines.push(`Points Balance: ${transaction.newBalance}`);

  if (member.expiringPoints > 0) {
    receiptLines.push('');
    receiptLines.push(`NOTICE: ${member.expiringPoints} points expiring on ${member.nextExpirationDate}`);
  }

  return receiptLines.join('\n');
}
```

## Performance Considerations

POS integrations require minimal latency to avoid slowing checkout processes. Optimize performance through local caching of member data, asynchronous API calls for non-critical operations, connection pooling for API requests, and progressive loading of member details.

The member lookup should complete within 500 milliseconds, points calculation within 200 milliseconds, and redemption processing within 1 second to maintain smooth checkout flow.

## Security Measures

POS terminals implement security measures including encrypted communication using TLS 1.2 or higher, secure credential storage for API keys, cashier authentication for sensitive operations, and audit logging of all membership transactions.

API keys used by POS terminals have restricted permissions limited to member lookup, points operations, and redemption processing. Administrative functions are not accessible from POS terminals.

## Testing and Validation

Before deploying POS integration to production, thoroughly test member identification using all supported methods, points calculation across different scenarios, redemption processing including edge cases, offline capability and synchronization, receipt generation with membership details, and error handling for network failures.

Use the sandbox environment for integration testing with synthetic member data that won't affect production records. The sandbox provides realistic response times and error conditions for comprehensive testing.

## Troubleshooting

Common issues and resolutions include member not found errors (verify member ID format and check account status), points calculation discrepancies (confirm tier multiplier and category rules), redemption failures (check points balance and reward availability), offline sync failures (review transaction queue and connectivity logs), and slow response times (optimize caching strategy and check network performance).

POS integration logs should capture all API interactions, including request IDs returned by the membership API. These request IDs enable support teams to trace issues through the entire system for rapid resolution.
