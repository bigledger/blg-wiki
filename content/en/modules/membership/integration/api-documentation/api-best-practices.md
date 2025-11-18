---
title: "API Best Practices"
description: "Performance optimization, error handling, and security guidelines for API integration"
weight: 5
---

Following best practices when integrating with the Membership API ensures optimal performance, reliability, and security. This guide covers essential patterns and techniques for building production-ready integrations.

## Performance Optimization

### Implement Caching Strategies

Caching frequently accessed data reduces API calls, improves response times, and prevents rate limit exhaustion.

**Member Profile Caching**

Member profiles change infrequently and are ideal for caching. Implement time-based expiration with a reasonable TTL (time-to-live):

```javascript
class MemberCache {
  constructor(ttl = 300000) { // 5 minutes default TTL
    this.cache = new Map();
    this.ttl = ttl;
  }

  set(memberId, data) {
    this.cache.set(memberId, {
      data: data,
      expiry: Date.now() + this.ttl
    });
  }

  get(memberId) {
    const cached = this.cache.get(memberId);
    if (!cached) return null;

    if (Date.now() > cached.expiry) {
      this.cache.delete(memberId);
      return null;
    }

    return cached.data;
  }

  invalidate(memberId) {
    this.cache.delete(memberId);
  }
}

const memberCache = new MemberCache();

async function getMemberWithCache(memberId) {
  // Check cache first
  let member = memberCache.get(memberId);

  if (!member) {
    // Cache miss - fetch from API
    const result = await api.request('GET', `/members/${memberId}`);
    member = result.data;
    memberCache.set(memberId, member);
  }

  return member;
}
```

**Points Balance Caching**

Points balances change with transactions, requiring cache invalidation on updates:

```javascript
async function awardPointsWithCacheInvalidation(memberId, points, transactionId) {
  const result = await api.request('POST', '/points/earn', {
    memberId: memberId,
    points: points,
    referenceId: transactionId
  });

  // Invalidate cached balance after update
  memberCache.invalidate(memberId);

  return result.data;
}
```

### Use Connection Pooling

Maintain persistent HTTP connections to reduce connection establishment overhead:

```javascript
const axios = require('axios');
const https = require('https');

// Configure connection pooling
const httpsAgent = new https.Agent({
  keepAlive: true,
  keepAliveMsecs: 30000,
  maxSockets: 50,
  maxFreeSockets: 10
});

const api = axios.create({
  baseURL: 'https://datahub.bigledger.com/api/v1/membership',
  httpsAgent: httpsAgent,
  headers: {
    'X-API-Key': process.env.BIGLEDGER_API_KEY
  }
});
```

### Batch Operations When Possible

Instead of making individual API calls for each operation, batch related operations to reduce network overhead:

```javascript
async function processBatchOperations(operations) {
  // Group operations by type
  const batches = {
    earnPoints: [],
    updateMembers: []
  };

  operations.forEach(op => {
    if (op.type === 'earn') batches.earnPoints.push(op);
    if (op.type === 'update') batches.updateMembers.push(op);
  });

  // Process batches concurrently
  const results = await Promise.allSettled([
    processBatchEarnPoints(batches.earnPoints),
    processBatchUpdateMembers(batches.updateMembers)
  ]);

  return results;
}
```

### Minimize Payload Size

Request only necessary fields using field selection to reduce response size:

```javascript
// Good - request only needed fields
const member = await api.request('GET', '/members/MEM-789012?fields=memberId,email,points');

// Avoid - requesting full object when only specific fields needed
const member = await api.request('GET', '/members/MEM-789012');
```

### Implement Response Compression

Enable gzip compression to reduce bandwidth usage:

```javascript
const api = axios.create({
  baseURL: 'https://datahub.bigledger.com/api/v1/membership',
  headers: {
    'X-API-Key': process.env.BIGLEDGER_API_KEY,
    'Accept-Encoding': 'gzip'
  }
});
```

## Error Handling Strategies

### Categorize Errors for Appropriate Responses

Different error types require different handling strategies:

```javascript
class APIError extends Error {
  constructor(message, code, statusCode) {
    super(message);
    this.code = code;
    this.statusCode = statusCode;
  }
}

function handleAPIError(error) {
  const statusCode = error.response?.status;
  const errorData = error.response?.data?.error;

  if (statusCode === 400) {
    // Client error - validation failure
    throw new APIError(
      'Invalid request data',
      errorData.code,
      statusCode
    );
  } else if (statusCode === 401) {
    // Authentication failure
    throw new APIError(
      'Authentication failed - check API credentials',
      'AUTH_FAILED',
      statusCode
    );
  } else if (statusCode === 403) {
    // Permission denied
    throw new APIError(
      'Insufficient permissions for this operation',
      'FORBIDDEN',
      statusCode
    );
  } else if (statusCode === 404) {
    // Resource not found
    throw new APIError(
      'Requested resource not found',
      'NOT_FOUND',
      statusCode
    );
  } else if (statusCode === 422) {
    // Business rule violation
    throw new APIError(
      errorData.message,
      errorData.code,
      statusCode
    );
  } else if (statusCode === 429) {
    // Rate limit exceeded
    throw new APIError(
      'Rate limit exceeded - retry after delay',
      'RATE_LIMITED',
      statusCode
    );
  } else if (statusCode >= 500) {
    // Server error
    throw new APIError(
      'Server error - retry operation',
      'SERVER_ERROR',
      statusCode
    );
  }

  throw error;
}
```

### Implement Retry Logic with Exponential Backoff

Automatically retry transient failures with increasing delays:

```javascript
async function apiRequestWithRetry(method, endpoint, data, options = {}) {
  const maxRetries = options.maxRetries || 3;
  const baseDelay = options.baseDelay || 1000;
  const maxDelay = options.maxDelay || 30000;

  for (let attempt = 1; attempt <= maxRetries; attempt++) {
    try {
      return await api.request(method, endpoint, data);
    } catch (error) {
      const statusCode = error.response?.status;

      // Don't retry client errors (4xx except 429)
      if (statusCode >= 400 && statusCode < 500 && statusCode !== 429) {
        throw error;
      }

      // Don't retry on last attempt
      if (attempt === maxRetries) {
        throw error;
      }

      // Calculate exponential backoff delay
      const delay = Math.min(baseDelay * Math.pow(2, attempt - 1), maxDelay);

      // Add jitter to prevent thundering herd
      const jitter = Math.random() * 0.3 * delay;
      const totalDelay = delay + jitter;

      console.log(`Retry attempt ${attempt} after ${Math.round(totalDelay)}ms`);
      await new Promise(resolve => setTimeout(resolve, totalDelay));
    }
  }
}
```

### Handle Rate Limiting Gracefully

Respect rate limits and implement proper backoff when limits are reached:

```javascript
class RateLimitHandler {
  constructor() {
    this.requestQueue = [];
    this.processing = false;
    this.rateLimitReset = null;
  }

  async execute(requestFn) {
    return new Promise((resolve, reject) => {
      this.requestQueue.push({ requestFn, resolve, reject });
      this.processQueue();
    });
  }

  async processQueue() {
    if (this.processing || this.requestQueue.length === 0) {
      return;
    }

    this.processing = true;

    while (this.requestQueue.length > 0) {
      // Wait if rate limit reset time is in the future
      if (this.rateLimitReset && Date.now() < this.rateLimitReset) {
        const delay = this.rateLimitReset - Date.now();
        console.log(`Rate limited - waiting ${delay}ms`);
        await new Promise(resolve => setTimeout(resolve, delay));
      }

      const { requestFn, resolve, reject } = this.requestQueue.shift();

      try {
        const response = await requestFn();

        // Update rate limit info from response headers
        const resetHeader = response.headers['x-ratelimit-reset'];
        if (resetHeader) {
          this.rateLimitReset = parseInt(resetHeader) * 1000;
        }

        resolve(response);
      } catch (error) {
        if (error.response?.status === 429) {
          // Rate limited - put request back in queue
          this.requestQueue.unshift({ requestFn, resolve, reject });

          const retryAfter = error.response.headers['retry-after'];
          this.rateLimitReset = Date.now() + (parseInt(retryAfter) * 1000);
        } else {
          reject(error);
        }
      }
    }

    this.processing = false;
  }
}

const rateLimitHandler = new RateLimitHandler();

// Usage
const result = await rateLimitHandler.execute(() =>
  api.request('GET', `/members/${memberId}`)
);
```

### Log Errors Comprehensively

Implement structured logging for effective troubleshooting:

```javascript
function logAPIError(error, context) {
  const logEntry = {
    timestamp: new Date().toISOString(),
    level: 'error',
    operation: context.operation,
    memberId: context.memberId,
    requestId: error.response?.data?.metadata?.requestId,
    statusCode: error.response?.status,
    errorCode: error.response?.data?.error?.code,
    errorMessage: error.response?.data?.error?.message,
    stackTrace: error.stack
  };

  console.error(JSON.stringify(logEntry));

  // Send to monitoring service
  if (process.env.NODE_ENV === 'production') {
    sendToMonitoring(logEntry);
  }
}

// Usage
try {
  await awardPoints(memberId, points, transactionId);
} catch (error) {
  logAPIError(error, {
    operation: 'awardPoints',
    memberId: memberId,
    points: points,
    transactionId: transactionId
  });
  throw error;
}
```

## Security Best Practices

### Secure Credential Management

Never hardcode credentials or commit them to version control:

```javascript
// Good - credentials from environment
const apiKey = process.env.BIGLEDGER_API_KEY;

// Good - credentials from secure vault
const apiKey = await secretsManager.getSecret('bigledger-api-key');

// Bad - hardcoded credentials
const apiKey = 'blg_live_abc123xyz789'; // NEVER DO THIS
```

### Validate Input Data

Always validate and sanitize input before sending to the API:

```javascript
function validateMemberData(data) {
  const errors = {};

  // Email validation
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!data.email || !emailRegex.test(data.email)) {
    errors.email = 'Invalid email format';
  }

  // Phone validation
  const phoneRegex = /^\+?[1-9]\d{1,14}$/;
  if (!data.phone || !phoneRegex.test(data.phone)) {
    errors.phone = 'Invalid phone format';
  }

  // Points validation
  if (data.points !== undefined) {
    if (typeof data.points !== 'number' || data.points < 0) {
      errors.points = 'Points must be a positive number';
    }
    if (data.points > 10000) {
      errors.points = 'Points exceed maximum allowed per transaction';
    }
  }

  if (Object.keys(errors).length > 0) {
    throw new ValidationError('Input validation failed', errors);
  }

  return true;
}

// Usage
async function createMember(memberData) {
  validateMemberData(memberData);
  return await api.request('POST', '/members', memberData);
}
```

### Implement Request Signing

For sensitive operations, implement request signing for additional security:

```javascript
const crypto = require('crypto');

function signRequest(method, endpoint, body, apiSecret) {
  const timestamp = Date.now();
  const payload = `${method}:${endpoint}:${timestamp}:${JSON.stringify(body)}`;

  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(payload)
    .digest('hex');

  return {
    timestamp: timestamp,
    signature: signature
  };
}

// Usage
async function secureRequest(method, endpoint, data) {
  const { timestamp, signature } = signRequest(
    method,
    endpoint,
    data,
    process.env.BIGLEDGER_API_SECRET
  );

  return await api.request(method, endpoint, data, {
    headers: {
      'X-Request-Timestamp': timestamp,
      'X-Request-Signature': signature
    }
  });
}
```

### Use HTTPS Only

Always use HTTPS and verify SSL certificates:

```javascript
const https = require('https');

// Good - enforce HTTPS and certificate validation
const api = axios.create({
  baseURL: 'https://datahub.bigledger.com/api/v1/membership',
  httpsAgent: new https.Agent({
    rejectUnauthorized: true // Verify SSL certificates
  })
});

// Bad - disabling certificate validation (security risk)
const api = axios.create({
  httpsAgent: new https.Agent({
    rejectUnauthorized: false // NEVER DO THIS IN PRODUCTION
  })
});
```

### Implement IP Whitelisting

For server-to-server integrations, restrict API access to known IP addresses through the BigLedger admin console.

### Rotate API Keys Regularly

Implement periodic API key rotation:

```javascript
async function rotateAPIKey() {
  // 1. Generate new API key through admin API
  const newKey = await adminAPI.generateAPIKey({
    name: 'Production Integration Key',
    permissions: ['membership:read', 'membership:write']
  });

  // 2. Update application configuration
  await updateConfiguration({ apiKey: newKey.key });

  // 3. Test new key
  const testResult = await testAPIConnection(newKey.key);

  if (testResult.success) {
    // 4. Revoke old key after successful migration
    await adminAPI.revokeAPIKey(oldKeyId);
    console.log('API key rotation completed successfully');
  } else {
    throw new Error('New API key validation failed');
  }
}
```

## Monitoring and Observability

### Track API Metrics

Monitor key performance indicators to detect issues early:

```javascript
class APIMetrics {
  constructor() {
    this.metrics = {
      totalRequests: 0,
      successfulRequests: 0,
      failedRequests: 0,
      totalLatency: 0,
      errorsByType: {}
    };
  }

  recordRequest(startTime, success, error = null) {
    const latency = Date.now() - startTime;

    this.metrics.totalRequests++;
    this.metrics.totalLatency += latency;

    if (success) {
      this.metrics.successfulRequests++;
    } else {
      this.metrics.failedRequests++;
      const errorType = error?.code || 'UNKNOWN';
      this.metrics.errorsByType[errorType] =
        (this.metrics.errorsByType[errorType] || 0) + 1;
    }
  }

  getStats() {
    const avgLatency = this.metrics.totalRequests > 0
      ? this.metrics.totalLatency / this.metrics.totalRequests
      : 0;

    const successRate = this.metrics.totalRequests > 0
      ? (this.metrics.successfulRequests / this.metrics.totalRequests) * 100
      : 0;

    return {
      totalRequests: this.metrics.totalRequests,
      successRate: successRate.toFixed(2) + '%',
      averageLatency: Math.round(avgLatency) + 'ms',
      errorsByType: this.metrics.errorsByType
    };
  }
}

const metrics = new APIMetrics();

// Wrap API calls with metrics tracking
async function trackedRequest(method, endpoint, data) {
  const startTime = Date.now();
  try {
    const result = await api.request(method, endpoint, data);
    metrics.recordRequest(startTime, true);
    return result;
  } catch (error) {
    metrics.recordRequest(startTime, false, error);
    throw error;
  }
}
```

### Implement Health Checks

Regularly verify API connectivity and performance:

```javascript
async function performHealthCheck() {
  const healthStatus = {
    timestamp: new Date().toISOString(),
    status: 'healthy',
    checks: {}
  };

  try {
    // Test API connectivity
    const startTime = Date.now();
    await api.request('GET', '/health');
    const latency = Date.now() - startTime;

    healthStatus.checks.api = {
      status: 'up',
      latency: latency + 'ms'
    };

    // Test authentication
    try {
      await api.request('GET', '/members?limit=1');
      healthStatus.checks.auth = { status: 'valid' };
    } catch (error) {
      healthStatus.checks.auth = { status: 'failed' };
      healthStatus.status = 'degraded';
    }

  } catch (error) {
    healthStatus.status = 'unhealthy';
    healthStatus.checks.api = { status: 'down', error: error.message };
  }

  return healthStatus;
}

// Run health checks periodically
setInterval(async () => {
  const health = await performHealthCheck();
  if (health.status !== 'healthy') {
    console.error('Health check failed:', health);
    notifyAdministrators(health);
  }
}, 60000); // Every minute
```

### Use Correlation IDs

Track requests across distributed systems using correlation IDs:

```javascript
const { v4: uuidv4 } = require('uuid');

async function requestWithCorrelation(method, endpoint, data, correlationId = null) {
  const id = correlationId || uuidv4();

  const result = await api.request(method, endpoint, data, {
    headers: {
      'X-Correlation-ID': id
    }
  });

  // Log with correlation ID
  console.log(`[${id}] Request completed: ${method} ${endpoint}`);

  return result;
}
```

## Testing Strategies

### Use Sandbox Environment

Always test integrations in sandbox before deploying to production:

```javascript
const environment = process.env.NODE_ENV || 'development';

const apiConfig = {
  development: {
    baseURL: 'https://sandbox-datahub.bigledger.com/api/v1/membership',
    apiKey: process.env.SANDBOX_API_KEY
  },
  production: {
    baseURL: 'https://datahub.bigledger.com/api/v1/membership',
    apiKey: process.env.PRODUCTION_API_KEY
  }
};

const api = new MembershipAPI(
  apiConfig[environment].apiKey,
  apiConfig[environment].baseURL
);
```

### Implement Integration Tests

Create comprehensive integration tests covering common scenarios:

```javascript
describe('Membership API Integration', () => {
  test('should create member and award points', async () => {
    // Create member
    const member = await createMember({
      firstName: 'Test',
      lastName: 'User',
      email: `test-${Date.now()}@example.com`,
      phone: '+60123456789'
    });

    expect(member.memberId).toBeDefined();
    expect(member.points).toBe(0);

    // Award points
    const pointsResult = await awardPoints(member.memberId, 100, 'TEST-001');

    expect(pointsResult.newBalance).toBe(100);
    expect(pointsResult.points).toBe(100);
  });

  test('should handle insufficient points gracefully', async () => {
    const member = await createTestMember();

    await expect(
      redeemPoints(member.memberId, 1000, 'RWD-TEST')
    ).rejects.toThrow('INSUFFICIENT_POINTS');
  });
});
```

These best practices ensure your Membership API integration is performant, reliable, secure, and maintainable in production environments.
