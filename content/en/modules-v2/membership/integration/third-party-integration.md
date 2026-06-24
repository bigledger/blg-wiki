---
title: "Third-Party Integration"
description: "Connect external systems and services to the Membership Module"
weight: 4
---

The Membership Module provides flexible integration capabilities for connecting with external systems including CRM platforms, marketing automation tools, analytics services, payment processors, and custom applications. These integrations enable comprehensive business ecosystems where membership data flows seamlessly across platforms.

## Integration Patterns

### Real-Time API Integration

Real-time integration uses synchronous API calls to exchange data immediately when events occur. This pattern is ideal for operations requiring instant feedback such as member validation at checkout, real-time points balance queries, immediate redemption processing, and live tier status verification.

**Implementation Example**:

```javascript
// External system calls Membership API in real-time
async function validateMemberAtCheckout(memberId, externalSystemId) {
  try {
    const member = await membershipAPI.request('GET', `/members/${memberId}`);

    if (member.data.status !== 'active') {
      return {
        valid: false,
        reason: 'Member account is not active'
      };
    }

    // Return member data for immediate use
    return {
      valid: true,
      tier: member.data.tier,
      points: member.data.points,
      benefits: member.data.tierBenefits
    };
  } catch (error) {
    console.error('Member validation failed:', error);
    return {
      valid: false,
      reason: 'Unable to validate member'
    };
  }
}
```

### Webhook Integration

Webhooks enable event-driven integrations where the Membership Module pushes notifications to external systems when specific events occur. This pattern eliminates the need for constant polling and ensures external systems stay synchronized with membership data.

**Supported Events**:

- `member.created` - New member account created
- `member.updated` - Member profile information changed
- `member.tier.changed` - Member tier upgraded or downgraded
- `points.earned` - Points awarded to member
- `points.redeemed` - Points redeemed by member
- `reward.claimed` - Reward claimed by member
- `points.expiring` - Points approaching expiration

**Webhook Configuration**:

```javascript
// Register webhook endpoint with Membership API
async function registerWebhook(webhookURL, events) {
  const webhookConfig = {
    url: webhookURL,
    events: events,
    secret: generateWebhookSecret(),
    active: true
  };

  const result = await membershipAPI.request('POST', '/webhooks', webhookConfig);

  // Store webhook secret securely for signature verification
  await storeWebhookSecret(result.data.webhookId, webhookConfig.secret);

  return result.data;
}

// Example registration
const webhook = await registerWebhook(
  'https://yourapp.com/webhooks/membership',
  ['member.created', 'points.earned', 'points.redeemed']
);
```

**Webhook Handler**:

```javascript
const express = require('express');
const crypto = require('crypto');

const app = express();

app.post('/webhooks/membership', express.json(), async (req, res) => {
  // Verify webhook signature
  const signature = req.headers['x-webhook-signature'];
  const webhookSecret = await getWebhookSecret(req.body.webhookId);

  const expectedSignature = crypto
    .createHmac('sha256', webhookSecret)
    .update(JSON.stringify(req.body))
    .digest('hex');

  if (signature !== expectedSignature) {
    return res.status(401).json({ error: 'Invalid signature' });
  }

  // Process webhook event
  const { eventType, data } = req.body;

  try {
    await processWebhookEvent(eventType, data);
    res.status(200).json({ received: true });
  } catch (error) {
    console.error('Webhook processing failed:', error);
    res.status(500).json({ error: 'Processing failed' });
  }
});

async function processWebhookEvent(eventType, data) {
  switch (eventType) {
    case 'member.created':
      await handleNewMember(data);
      break;
    case 'points.earned':
      await handlePointsEarned(data);
      break;
    case 'points.redeemed':
      await handlePointsRedeemed(data);
      break;
    case 'member.tier.changed':
      await handleTierChange(data);
      break;
  }
}
```

### Batch Synchronization

Batch integration processes data in scheduled batches, suitable for non-time-sensitive operations such as daily member data synchronization, bulk points adjustments, nightly reporting and analytics, and periodic data backups.

**Batch Export Example**:

```javascript
async function exportMemberDataBatch(startDate, endDate) {
  const batchSize = 100;
  let cursor = null;
  const allMembers = [];

  do {
    const queryParams = new URLSearchParams({
      limit: batchSize,
      cursor: cursor || '',
      startDate: startDate,
      endDate: endDate
    });

    const result = await membershipAPI.request(
      'GET',
      `/members?${queryParams}`
    );

    allMembers.push(...result.data);
    cursor = result.pagination.nextCursor;

  } while (cursor);

  return allMembers;
}

// Schedule daily batch export
async function scheduledDailyExport() {
  const yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);

  const startDate = yesterday.toISOString().split('T')[0];
  const endDate = new Date().toISOString().split('T')[0];

  const members = await exportMemberDataBatch(startDate, endDate);

  // Send to external system
  await sendToCRM(members);
  await sendToAnalytics(members);

  console.log(`Exported ${members.length} member records`);
}
```

## CRM Integration

### Customer Profile Synchronization

Synchronize membership data with CRM systems to maintain unified customer profiles:

```javascript
async function syncMemberToCRM(memberId) {
  // Fetch complete member profile
  const [member, balance, transactions] = await Promise.all([
    membershipAPI.request('GET', `/members/${memberId}`),
    membershipAPI.request('GET', `/points/balance/${memberId}`),
    membershipAPI.request('GET', `/points/transactions/${memberId}?limit=10`)
  ]);

  // Map to CRM format
  const crmContact = {
    externalId: member.data.memberId,
    firstName: member.data.firstName,
    lastName: member.data.lastName,
    email: member.data.email,
    phone: member.data.phone,
    customFields: {
      membershipTier: member.data.tier,
      membershipPoints: balance.data.currentPoints,
      lifetimePoints: balance.data.lifetimePoints,
      memberSince: member.data.joinDate,
      lastActivity: transactions.data[0]?.processedAt
    },
    tags: [`membership-${member.data.tier.toLowerCase()}`]
  };

  // Update CRM
  await crmAPI.upsertContact(crmContact);
}
```

### Bidirectional Sync

Maintain consistency between Membership Module and CRM:

```javascript
class BidirectionalSync {
  constructor(membershipAPI, crmAPI) {
    this.membershipAPI = membershipAPI;
    this.crmAPI = crmAPI;
  }

  // Sync from Membership to CRM
  async syncMembershipToCRM(memberId) {
    const member = await this.membershipAPI.request('GET', `/members/${memberId}`);
    await this.crmAPI.updateContact(memberId, {
      tier: member.data.tier,
      points: member.data.points
    });
  }

  // Sync from CRM to Membership
  async syncCRMToMembership(contactId) {
    const contact = await this.crmAPI.getContact(contactId);

    if (contact.email || contact.phone) {
      await this.membershipAPI.request('PUT', `/members/${contact.membershipId}`, {
        email: contact.email,
        phone: contact.phone,
        address: contact.address
      });
    }
  }

  // Handle conflicts
  async resolveConflict(memberId, membershipData, crmData) {
    // Use timestamp-based conflict resolution
    const membershipTimestamp = new Date(membershipData.updatedAt);
    const crmTimestamp = new Date(crmData.updatedAt);

    if (membershipTimestamp > crmTimestamp) {
      await this.syncMembershipToCRM(memberId);
    } else {
      await this.syncCRMToMembership(crmData.id);
    }
  }
}
```

## Marketing Automation Integration

### Segment Synchronization

Push membership segments to marketing automation platforms:

```javascript
async function syncMembershipSegments() {
  // Define segments
  const segments = [
    {
      name: 'Gold Members',
      filter: { tier: 'GOLD', status: 'active' }
    },
    {
      name: 'High Points Balance',
      filter: { minPoints: 5000, status: 'active' }
    },
    {
      name: 'Inactive Members',
      filter: { daysSinceLastActivity: 90 }
    }
  ];

  for (const segment of segments) {
    const members = await queryMemberSegment(segment.filter);

    await marketingAPI.createOrUpdateSegment({
      name: segment.name,
      members: members.map(m => ({
        email: m.email,
        memberId: m.memberId,
        tier: m.tier,
        points: m.points
      }))
    });
  }
}

async function queryMemberSegment(filter) {
  const queryParams = new URLSearchParams();

  if (filter.tier) queryParams.append('tier', filter.tier);
  if (filter.status) queryParams.append('status', filter.status);

  const result = await membershipAPI.request('GET', `/members?${queryParams}`);

  // Apply additional filters
  let members = result.data;

  if (filter.minPoints) {
    members = members.filter(m => m.points >= filter.minPoints);
  }

  if (filter.daysSinceLastActivity) {
    const cutoffDate = new Date();
    cutoffDate.setDate(cutoffDate.getDate() - filter.daysSinceLastActivity);

    members = members.filter(m =>
      new Date(m.lastActivityDate) < cutoffDate
    );
  }

  return members;
}
```

### Triggered Campaigns

Trigger marketing campaigns based on membership events:

```javascript
async function handleTierUpgrade(data) {
  const { memberId, previousTier, newTier } = data;

  // Trigger congratulations email campaign
  await marketingAPI.triggerCampaign({
    campaignId: 'tier-upgrade-congratulations',
    recipientEmail: data.email,
    variables: {
      firstName: data.firstName,
      previousTier: previousTier,
      newTier: newTier,
      tierBenefits: data.tierBenefits
    }
  });

  // Add to tier-specific segment
  await marketingAPI.addToSegment(memberId, `membership-${newTier.toLowerCase()}`);
}

async function handlePointsExpiring(data) {
  const { memberId, expiringPoints, expirationDate } = data;

  if (expiringPoints >= 500) {
    await marketingAPI.triggerCampaign({
      campaignId: 'points-expiring-reminder',
      recipientEmail: data.email,
      variables: {
        firstName: data.firstName,
        expiringPoints: expiringPoints,
        expirationDate: formatDate(expirationDate),
        redeemURL: `https://shop.example.com/rewards?member=${memberId}`
      }
    });
  }
}
```

## Analytics Integration

### Event Tracking

Send membership events to analytics platforms:

```javascript
async function trackMembershipEvent(eventType, data) {
  const analyticsEvent = {
    eventName: eventType,
    timestamp: new Date().toISOString(),
    userId: data.memberId,
    properties: {
      tier: data.tier,
      points: data.points,
      tierName: data.tierName
    }
  };

  // Send to multiple analytics platforms
  await Promise.all([
    sendToGoogleAnalytics(analyticsEvent),
    sendToMixpanel(analyticsEvent),
    sendToSegment(analyticsEvent)
  ]);
}

async function sendToGoogleAnalytics(event) {
  // Google Analytics 4 Measurement Protocol
  await fetch('https://www.google-analytics.com/mp/collect', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      client_id: event.userId,
      events: [{
        name: event.eventName,
        params: event.properties
      }]
    })
  });
}
```

### Customer Lifetime Value Calculation

Integrate membership data for CLV analysis:

```javascript
async function calculateMemberCLV(memberId) {
  const [member, transactions] = await Promise.all([
    membershipAPI.request('GET', `/members/${memberId}`),
    membershipAPI.request('GET', `/points/transactions/${memberId}?type=earn&limit=1000`)
  ]);

  // Calculate total spend (assuming 1 point = 2 MYR spend)
  const totalSpend = transactions.data
    .filter(t => t.type === 'earn')
    .reduce((sum, t) => sum + (t.points * 2), 0);

  // Calculate average order value and frequency
  const orderCount = transactions.data.length;
  const avgOrderValue = totalSpend / orderCount;

  // Calculate customer tenure
  const joinDate = new Date(member.data.joinDate);
  const tenureMonths = (Date.now() - joinDate.getTime()) / (1000 * 60 * 60 * 24 * 30);

  // Simple CLV calculation
  const avgOrdersPerMonth = orderCount / tenureMonths;
  const projectedLifetimeMonths = 36; // 3-year projection
  const clv = avgOrderValue * avgOrdersPerMonth * projectedLifetimeMonths;

  return {
    memberId: memberId,
    totalSpend: totalSpend,
    orderCount: orderCount,
    avgOrderValue: avgOrderValue,
    tenureMonths: tenureMonths,
    avgOrdersPerMonth: avgOrdersPerMonth,
    projectedCLV: clv,
    tier: member.data.tier
  };
}
```

## Payment Processing Integration

### Payment Gateway Integration

Link membership benefits with payment processing:

```javascript
async function processPaymentWithMembershipBenefits(paymentData, memberId) {
  // Get member tier
  const member = await membershipAPI.request('GET', `/members/${memberId}`);

  // Apply tier-based payment benefits
  const paymentConfig = {
    amount: paymentData.amount,
    currency: 'MYR',
    metadata: {
      memberId: memberId,
      tier: member.data.tier
    }
  };

  // Premium tiers get installment options
  if (['GOLD', 'PLATINUM'].includes(member.data.tier)) {
    paymentConfig.installmentOptions = [3, 6, 12];
  }

  // Process payment
  const paymentResult = await paymentGateway.createPayment(paymentConfig);

  return paymentResult;
}
```

## Single Sign-On Integration

### OAuth Integration

Implement SSO for unified authentication:

```javascript
async function authenticateWithSSO(ssoToken) {
  // Verify SSO token with identity provider
  const ssoUser = await identityProvider.verifyToken(ssoToken);

  // Map SSO user to membership account
  const member = await membershipAPI.request(
    'GET',
    `/members?email=${ssoUser.email}&limit=1`
  );

  if (member.data.length === 0) {
    // Create membership account for new SSO user
    const newMember = await membershipAPI.request('POST', '/members', {
      firstName: ssoUser.firstName,
      lastName: ssoUser.lastName,
      email: ssoUser.email,
      externalId: ssoUser.id
    });

    return {
      authenticated: true,
      memberId: newMember.data.memberId,
      newAccount: true
    };
  }

  return {
    authenticated: true,
    memberId: member.data[0].memberId,
    newAccount: false
  };
}
```

## Data Warehouse Integration

### ETL Pipeline

Extract membership data for data warehouse:

```javascript
async function extractMembershipData(startDate, endDate) {
  // Extract members
  const members = await exportMemberDataBatch(startDate, endDate);

  // Extract transactions
  const transactions = await extractTransactions(startDate, endDate);

  // Transform to warehouse schema
  const transformedData = {
    members: members.map(m => ({
      member_id: m.memberId,
      first_name: m.firstName,
      last_name: m.lastName,
      email: m.email,
      tier: m.tier,
      join_date: m.joinDate,
      current_points: m.points,
      lifetime_points: m.lifetimePoints,
      extracted_at: new Date().toISOString()
    })),
    transactions: transactions.map(t => ({
      transaction_id: t.transactionId,
      member_id: t.memberId,
      transaction_type: t.type,
      points: t.points,
      processed_at: t.processedAt,
      reference_id: t.referenceId,
      extracted_at: new Date().toISOString()
    }))
  };

  // Load to warehouse
  await loadToWarehouse(transformedData);
}

async function extractTransactions(startDate, endDate) {
  const allTransactions = [];
  let cursor = null;

  do {
    const result = await membershipAPI.request(
      'GET',
      `/transactions?startDate=${startDate}&endDate=${endDate}&limit=100&cursor=${cursor || ''}`
    );

    allTransactions.push(...result.data);
    cursor = result.pagination.nextCursor;
  } while (cursor);

  return allTransactions;
}
```

## Integration Testing

### End-to-End Testing

Test complete integration flows:

```javascript
describe('Third-Party Integration', () => {
  test('should sync new member to CRM', async () => {
    // Create member in Membership Module
    const member = await membershipAPI.request('POST', '/members', {
      firstName: 'Test',
      lastName: 'User',
      email: 'test@example.com'
    });

    // Wait for webhook to trigger CRM sync
    await waitForWebhook('member.created', member.data.memberId);

    // Verify member exists in CRM
    const crmContact = await crmAPI.getContactByEmail('test@example.com');

    expect(crmContact).toBeDefined();
    expect(crmContact.externalId).toBe(member.data.memberId);
    expect(crmContact.customFields.membershipTier).toBe('BRONZE');
  });

  test('should trigger marketing campaign on tier upgrade', async () => {
    const memberId = 'MEM-TEST-001';

    // Upgrade member tier
    await membershipAPI.request('POST', '/tiers/assign', {
      memberId: memberId,
      tierId: 'GOLD'
    });

    // Verify campaign triggered
    const campaigns = await marketingAPI.getTriggeredCampaigns(memberId);

    expect(campaigns).toContainEqual(
      expect.objectContaining({
        campaignId: 'tier-upgrade-congratulations'
      })
    );
  });
});
```

## Monitoring Integration Health

### Integration Metrics

Track integration performance and reliability:

```javascript
class IntegrationMonitor {
  constructor() {
    this.metrics = {
      webhookDeliveries: { successful: 0, failed: 0 },
      apiCalls: { successful: 0, failed: 0 },
      syncOperations: { successful: 0, failed: 0 },
      averageLatency: 0
    };
  }

  recordWebhookDelivery(success, latency) {
    if (success) {
      this.metrics.webhookDeliveries.successful++;
    } else {
      this.metrics.webhookDeliveries.failed++;
    }
    this.updateLatency(latency);
  }

  recordAPICall(success, latency) {
    if (success) {
      this.metrics.apiCalls.successful++;
    } else {
      this.metrics.apiCalls.failed++;
    }
    this.updateLatency(latency);
  }

  updateLatency(latency) {
    const total = this.metrics.apiCalls.successful + this.metrics.apiCalls.failed;
    this.metrics.averageLatency =
      (this.metrics.averageLatency * (total - 1) + latency) / total;
  }

  getHealthStatus() {
    const totalWebhooks =
      this.metrics.webhookDeliveries.successful + this.metrics.webhookDeliveries.failed;
    const webhookSuccessRate = totalWebhooks > 0
      ? (this.metrics.webhookDeliveries.successful / totalWebhooks) * 100
      : 100;

    const totalAPICalls =
      this.metrics.apiCalls.successful + this.metrics.apiCalls.failed;
    const apiSuccessRate = totalAPICalls > 0
      ? (this.metrics.apiCalls.successful / totalAPICalls) * 100
      : 100;

    return {
      healthy: webhookSuccessRate >= 95 && apiSuccessRate >= 95,
      webhookSuccessRate: webhookSuccessRate.toFixed(2) + '%',
      apiSuccessRate: apiSuccessRate.toFixed(2) + '%',
      averageLatency: Math.round(this.metrics.averageLatency) + 'ms'
    };
  }
}
```

These integration patterns and examples provide comprehensive guidance for connecting external systems with the Membership Module, enabling sophisticated business ecosystems and unified customer experiences across platforms.
