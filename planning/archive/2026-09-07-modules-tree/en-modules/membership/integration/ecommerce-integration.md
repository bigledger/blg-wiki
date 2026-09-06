---
title: "E-commerce Integration"
description: "Integrate membership functionality with CP-Commerce and online shopping platforms"
weight: 3
---

The Membership Module integrates comprehensively with BigLedger's CP-Commerce platform and other e-commerce systems, providing seamless online membership experiences including member portals, automatic points accrual on purchases, real-time redemption during checkout, and personalized shopping experiences based on tier status.

## Integration Architecture

E-commerce integration operates through multiple touchpoints including customer account portal, shopping cart and checkout, order processing pipeline, customer communications, and administrative interfaces.

The integration follows a headless architecture pattern, separating backend membership services from frontend presentation. This approach allows brands to customize customer-facing experiences while maintaining standardized backend operations through the Membership API.

## Member Portal Integration

### Account Dashboard

The member portal provides a centralized dashboard where customers view their membership information, points balance, transaction history, tier status and benefits, and available rewards.

**Dashboard Implementation**:

```javascript
async function loadMemberDashboard(memberId) {
  // Fetch member data in parallel for fast loading
  const [member, balance, transactions, rewards] = await Promise.all([
    api.request('GET', `/members/${memberId}`),
    api.request('GET', `/points/balance/${memberId}`),
    api.request('GET', `/points/transactions/${memberId}?limit=10`),
    api.request('GET', `/config/rewards?tier=${memberTier}`)
  ]);

  return {
    profile: {
      name: `${member.data.firstName} ${member.data.lastName}`,
      email: member.data.email,
      memberId: member.data.memberId,
      memberSince: member.data.joinDate
    },
    tier: {
      current: member.data.tierName,
      level: member.data.tier,
      benefits: member.data.tierBenefits,
      progress: calculateTierProgress(member.data)
    },
    points: {
      current: balance.data.currentPoints,
      lifetime: balance.data.lifetimePoints,
      expiring: balance.data.expiringPoints,
      expirationDate: balance.data.nextExpirationDate
    },
    recentTransactions: transactions.data,
    availableRewards: filterAffordableRewards(rewards.data, balance.data.currentPoints)
  };
}

function calculateTierProgress(member) {
  const tierThresholds = {
    'BRONZE': { next: 'SILVER', points: 1000 },
    'SILVER': { next: 'GOLD', points: 5000 },
    'GOLD': { next: 'PLATINUM', points: 15000 },
    'PLATINUM': { next: null, points: null }
  };

  const current = tierThresholds[member.tier];
  if (!current.next) {
    return { isMaxTier: true };
  }

  const pointsToNext = current.points - member.lifetimePoints;
  const progressPercentage = (member.lifetimePoints / current.points) * 100;

  return {
    nextTier: current.next,
    pointsRequired: current.points,
    pointsEarned: member.lifetimePoints,
    pointsRemaining: pointsToNext,
    progressPercentage: Math.min(progressPercentage, 100)
  };
}
```

### Profile Management

Members can update their profile information through the portal:

```javascript
async function updateMemberProfile(memberId, updates) {
  // Validate updates before sending
  const validatedUpdates = validateProfileUpdates(updates);

  try {
    const result = await api.request('PUT', `/members/${memberId}`, validatedUpdates);

    // Update local session/cache
    updateLocalSession(result.data);

    return {
      success: true,
      message: 'Profile updated successfully',
      data: result.data
    };
  } catch (error) {
    return {
      success: false,
      message: 'Failed to update profile',
      errors: parseAPIErrors(error)
    };
  }
}

function validateProfileUpdates(updates) {
  const validated = {};

  // Email validation
  if (updates.email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(updates.email)) {
      throw new Error('Invalid email format');
    }
    validated.email = updates.email;
  }

  // Phone validation
  if (updates.phone) {
    const phoneRegex = /^\+?[1-9]\d{1,14}$/;
    if (!phoneRegex.test(updates.phone)) {
      throw new Error('Invalid phone format');
    }
    validated.phone = updates.phone;
  }

  // Address validation
  if (updates.address) {
    validated.address = {
      street: updates.address.street || '',
      city: updates.address.city || '',
      state: updates.address.state || '',
      postalCode: updates.address.postalCode || '',
      country: updates.address.country || 'Malaysia'
    };
  }

  return validated;
}
```

### Transaction History

Members can view detailed transaction history with filtering and export capabilities:

```javascript
async function loadTransactionHistory(memberId, filters = {}) {
  const queryParams = new URLSearchParams({
    limit: filters.limit || 50,
    type: filters.type || '',
    startDate: filters.startDate || '',
    endDate: filters.endDate || ''
  });

  const result = await api.request(
    'GET',
    `/points/transactions/${memberId}?${queryParams}`
  );

  return result.data.map(txn => ({
    date: formatDate(txn.processedAt),
    type: formatTransactionType(txn.type),
    description: txn.reason,
    points: txn.points,
    balance: txn.balanceAfter,
    reference: txn.referenceId
  }));
}

function formatTransactionType(type) {
  const typeLabels = {
    'earn': 'Points Earned',
    'redeem': 'Points Redeemed',
    'adjust': 'Adjustment',
    'expire': 'Expired'
  };
  return typeLabels[type] || type;
}
```

## Shopping Cart Integration

### Member Identification

When members log into the e-commerce site, their membership status is loaded and available throughout the shopping session:

```javascript
async function initializeMemberSession(userId) {
  // Map user account to member account
  const memberMapping = await getMemberByUserId(userId);

  if (memberMapping) {
    const member = await api.request('GET', `/members/${memberMapping.memberId}`);
    const balance = await api.request('GET', `/points/balance/${memberMapping.memberId}`);

    // Store in session
    return {
      memberId: member.data.memberId,
      tier: member.data.tier,
      tierName: member.data.tierName,
      points: balance.data.currentPoints,
      benefits: member.data.tierBenefits
    };
  }

  return null;
}
```

### Cart-Level Benefits

Membership tier may affect pricing, shipping, or promotions at the cart level:

```javascript
function applyMemberBenefits(cart, memberSession) {
  if (!memberSession) return cart;

  // Apply tier-based discount
  const tierDiscounts = {
    'BRONZE': 0,
    'SILVER': 5,
    'GOLD': 10,
    'PLATINUM': 15
  };

  const discountPercentage = tierDiscounts[memberSession.tier] || 0;
  if (discountPercentage > 0) {
    const discountAmount = cart.subtotal * (discountPercentage / 100);
    cart.discounts.push({
      type: 'tier_discount',
      description: `${memberSession.tierName} Discount (${discountPercentage}%)`,
      amount: discountAmount
    });
    cart.total -= discountAmount;
  }

  // Free shipping for premium tiers
  if (['GOLD', 'PLATINUM'].includes(memberSession.tier)) {
    cart.shippingCost = 0;
    cart.benefits.push('Free shipping for ' + memberSession.tierName);
  }

  // Calculate points to be earned
  const earnRate = 0.5;
  const tierMultipliers = {
    'BRONZE': 1.0,
    'SILVER': 1.25,
    'GOLD': 1.5,
    'PLATINUM': 2.0
  };

  const multiplier = tierMultipliers[memberSession.tier] || 1.0;
  const pointsToEarn = Math.floor(cart.total * earnRate * multiplier);

  cart.pointsToEarn = pointsToEarn;

  return cart;
}
```

## Checkout Integration

### Points Earning Display

During checkout, display the points customers will earn from their purchase:

```javascript
function renderPointsEarningPreview(orderTotal, memberSession) {
  const earnRate = 0.5;
  const tierMultiplier = getTierMultiplier(memberSession.tier);
  const pointsToEarn = Math.floor(orderTotal * earnRate * tierMultiplier);

  return {
    message: `You will earn ${pointsToEarn} points from this purchase`,
    details: {
      basePoints: Math.floor(orderTotal * earnRate),
      tierBonus: pointsToEarn - Math.floor(orderTotal * earnRate),
      tierMultiplier: tierMultiplier
    }
  };
}
```

### Points Redemption

Allow customers to redeem points for discounts during checkout:

```javascript
async function getCheckoutRedemptionOptions(memberId, orderTotal) {
  const balance = await api.request('GET', `/points/balance/${memberId}`);
  const rewards = await api.request('GET', '/config/rewards?category=voucher&available=true');

  // Filter rewards member can afford
  const affordableRewards = rewards.data.filter(reward =>
    reward.pointsCost <= balance.data.currentPoints &&
    reward.minimumPurchase <= orderTotal
  );

  return affordableRewards.map(reward => ({
    rewardId: reward.rewardId,
    name: reward.name,
    pointsCost: reward.pointsCost,
    discountAmount: reward.value,
    description: reward.description,
    canRedeem: true
  }));
}

async function applyRedemptionToOrder(memberId, rewardId, orderId) {
  try {
    const redemption = await api.request('POST', '/points/redeem', {
      memberId: memberId,
      rewardId: rewardId,
      referenceId: orderId,
      reason: 'Order redemption'
    });

    return {
      success: true,
      pointsRedeemed: redemption.data.points,
      discountAmount: redemption.data.rewardValue,
      voucherCode: redemption.data.voucherCode,
      newBalance: redemption.data.newBalance
    };
  } catch (error) {
    if (error.response?.data?.error?.code === 'INSUFFICIENT_POINTS') {
      return {
        success: false,
        error: 'Insufficient points for this redemption'
      };
    }
    throw error;
  }
}
```

### Checkout Flow

Complete checkout integration with membership:

```javascript
async function processCheckoutWithMembership(orderData, memberSession) {
  // 1. Validate member status
  if (memberSession) {
    const member = await api.request('GET', `/members/${memberSession.memberId}`);
    if (member.data.status !== 'active') {
      throw new Error('Member account is not active');
    }
  }

  // 2. Apply tier benefits
  if (memberSession) {
    orderData = applyMemberBenefits(orderData, memberSession);
  }

  // 3. Process payment
  const paymentResult = await processPayment(orderData);

  if (!paymentResult.success) {
    throw new Error('Payment failed');
  }

  // 4. Create order
  const order = await createOrder(orderData, paymentResult);

  // 5. Award points (if member)
  if (memberSession && orderData.pointsToEarn > 0) {
    try {
      await api.request('POST', '/points/earn', {
        memberId: memberSession.memberId,
        points: orderData.pointsToEarn,
        reason: 'Online purchase',
        referenceId: order.orderId,
        metadata: {
          orderTotal: orderData.total,
          itemCount: orderData.items.length
        }
      });
    } catch (error) {
      // Log but don't fail order if points award fails
      console.error('Failed to award points:', error);
    }
  }

  return {
    success: true,
    orderId: order.orderId,
    pointsEarned: orderData.pointsToEarn || 0,
    tierBenefitsApplied: memberSession ? true : false
  };
}
```

## Order Processing Integration

### Automatic Points Accrual

Points are automatically awarded when orders are completed and paid:

```javascript
async function handleOrderCompleted(order) {
  if (!order.memberId) return;

  const earnRate = 0.5;
  const member = await api.request('GET', `/members/${order.memberId}`);
  const tierMultiplier = getTierMultiplier(member.data.tier);
  const points = Math.floor(order.total * earnRate * tierMultiplier);

  await api.request('POST', '/points/earn', {
    memberId: order.memberId,
    points: points,
    reason: 'Online purchase',
    referenceId: order.orderId,
    metadata: {
      orderTotal: order.total,
      orderDate: order.createdAt,
      itemCount: order.items.length
    }
  });

  // Send confirmation email
  await sendPointsEarnedEmail(order.memberId, points, order.orderId);
}
```

### Order Cancellation Handling

Reverse points when orders are cancelled:

```javascript
async function handleOrderCancelled(order) {
  if (!order.memberId || !order.pointsAwarded) return;

  // Reverse points
  await api.request('POST', '/points/adjust', {
    memberId: order.memberId,
    points: -order.pointsAwarded,
    reason: 'Order cancellation',
    referenceId: order.orderId,
    adminNote: `Points reversed for cancelled order ${order.orderId}`
  });

  // Notify member
  await sendPointsReversalEmail(order.memberId, order.pointsAwarded, order.orderId);
}
```

## Personalization

### Tier-Based Content

Display personalized content based on membership tier:

```javascript
function getPersonalizedContent(memberSession) {
  if (!memberSession) {
    return {
      banner: 'Join our membership program to earn rewards!',
      cta: 'Sign Up Now',
      link: '/membership/register'
    };
  }

  const tierContent = {
    'BRONZE': {
      banner: 'You are earning 1x points. Upgrade to Silver for 1.25x points!',
      cta: 'Learn More',
      link: '/membership/tiers'
    },
    'SILVER': {
      banner: `Welcome ${memberSession.tierName}! Enjoy 5% discount on all purchases.`,
      cta: 'View Benefits',
      link: '/membership/benefits'
    },
    'GOLD': {
      banner: `${memberSession.tierName} Member - Enjoy 10% discount and free shipping!`,
      cta: 'Explore Rewards',
      link: '/membership/rewards'
    },
    'PLATINUM': {
      banner: `Welcome back, ${memberSession.tierName}! You have exclusive access to VIP products.`,
      cta: 'Shop VIP Collection',
      link: '/collections/vip'
    }
  };

  return tierContent[memberSession.tier] || tierContent['BRONZE'];
}
```

### Product Recommendations

Personalize product recommendations based on membership data:

```javascript
async function getPersonalizedRecommendations(memberId) {
  const transactions = await api.request(
    'GET',
    `/points/transactions/${memberId}?limit=50&type=earn`
  );

  // Analyze purchase patterns
  const categoryPreferences = analyzePurchaseHistory(transactions.data);

  // Get tier-exclusive products
  const member = await api.request('GET', `/members/${memberId}`);
  const exclusiveProducts = await getProductsByTier(member.data.tier);

  return {
    basedOnHistory: recommendByCategory(categoryPreferences),
    tierExclusive: exclusiveProducts,
    trending: await getTrendingProducts()
  };
}
```

## Email Integration

### Order Confirmation with Points

Include membership information in order confirmation emails:

```javascript
function generateOrderConfirmationEmail(order, memberSession) {
  const emailTemplate = {
    subject: `Order Confirmation - ${order.orderId}`,
    sections: [
      {
        type: 'order_summary',
        data: order
      }
    ]
  };

  if (memberSession) {
    emailTemplate.sections.push({
      type: 'membership_summary',
      data: {
        pointsEarned: order.pointsEarned,
        newBalance: memberSession.points + order.pointsEarned,
        tier: memberSession.tierName,
        benefits: memberSession.benefits
      }
    });

    // Add expiring points warning if applicable
    if (memberSession.expiringPoints > 0) {
      emailTemplate.sections.push({
        type: 'points_expiration_warning',
        data: {
          expiringPoints: memberSession.expiringPoints,
          expirationDate: memberSession.expirationDate
        }
      });
    }
  }

  return emailTemplate;
}
```

## Guest Checkout with Membership

Allow guests to earn points by providing membership credentials:

```javascript
async function processGuestCheckoutWithMembership(orderData, membershipIdentifier) {
  // Lookup member by email or phone
  const members = await api.request(
    'GET',
    `/members?search=${membershipIdentifier}&limit=5`
  );

  if (members.data.length === 0) {
    return {
      memberFound: false,
      message: 'No membership account found. Complete purchase to create one.'
    };
  }

  if (members.data.length > 1) {
    return {
      memberFound: false,
      message: 'Multiple accounts found. Please log in to continue.'
    };
  }

  const member = members.data[0];

  // Associate order with member
  orderData.memberId = member.memberId;
  orderData.memberSession = {
    memberId: member.memberId,
    tier: member.tier,
    tierName: member.tierName
  };

  // Process with membership benefits
  return await processCheckoutWithMembership(orderData, orderData.memberSession);
}
```

## Performance Optimization

Cache membership data in the session to reduce API calls:

```javascript
class MembershipSessionCache {
  constructor(sessionId) {
    this.sessionId = sessionId;
    this.cache = {};
    this.ttl = 300000; // 5 minutes
  }

  async getMember(memberId) {
    const cacheKey = `member_${memberId}`;
    const cached = this.cache[cacheKey];

    if (cached && Date.now() - cached.timestamp < this.ttl) {
      return cached.data;
    }

    const member = await api.request('GET', `/members/${memberId}`);
    this.cache[cacheKey] = {
      data: member.data,
      timestamp: Date.now()
    };

    return member.data;
  }

  invalidate(memberId) {
    delete this.cache[`member_${memberId}`];
  }
}
```

Implement lazy loading for non-critical membership features and use CDN caching for static tier benefit information to ensure fast page loads and smooth shopping experiences.

## Testing Scenarios

Test e-commerce integration thoroughly including guest checkout without membership, member login and automatic benefits application, points earning on order completion, points redemption during checkout, order cancellation and points reversal, tier upgrades during active sessions, and concurrent checkout sessions for the same member.

Use sandbox environment for comprehensive testing with realistic shopping scenarios before deploying to production.
