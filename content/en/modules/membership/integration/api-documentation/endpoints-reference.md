---
title: "Endpoints Reference"
description: "Complete API endpoint specifications with request and response schemas"
weight: 3
---

This comprehensive reference documents all available API endpoints for the Membership Module, including request parameters, response formats, and practical examples.

## Member Management Endpoints

Member management endpoints provide complete lifecycle management for membership accounts including creation, retrieval, updates, and deactivation.

### List Members

Retrieve a paginated list of members with optional filtering and sorting.

**Endpoint**: `GET /api/v1/membership/members`

**Authentication**: Required (OAuth with `membership:read` scope or API key)

**Query Parameters**:

- `limit` (integer, optional): Number of results per page (default: 50, max: 200)
- `cursor` (string, optional): Pagination cursor for next page
- `tier` (string, optional): Filter by membership tier ID
- `status` (string, optional): Filter by status (`active`, `inactive`, `suspended`)
- `search` (string, optional): Search members by name, email, or phone
- `sort` (string, optional): Sort field and direction (e.g., `-createdAt`, `points`)

**Example Request**:

```http
GET /api/v1/membership/members?tier=GOLD&status=active&limit=25&sort=-points
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Example Response**:

```json
{
  "success": true,
  "data": [
    {
      "memberId": "MEM-789012",
      "firstName": "Sarah",
      "lastName": "Johnson",
      "email": "sarah.johnson@example.com",
      "phone": "+60123456789",
      "tier": "GOLD",
      "tierName": "Gold Member",
      "points": 8750,
      "status": "active",
      "joinDate": "2023-06-15",
      "birthDate": "1985-03-22",
      "lastActivityDate": "2024-01-10"
    },
    {
      "memberId": "MEM-789013",
      "firstName": "Michael",
      "lastName": "Chen",
      "email": "m.chen@example.com",
      "phone": "+60198765432",
      "tier": "GOLD",
      "tierName": "Gold Member",
      "points": 7240,
      "status": "active",
      "joinDate": "2023-08-03",
      "birthDate": "1990-11-08",
      "lastActivityDate": "2024-01-12"
    }
  ],
  "pagination": {
    "limit": 25,
    "returned": 2,
    "hasMore": false,
    "nextCursor": null
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T14:30:00Z",
    "requestId": "req_abc123"
  }
}
```

### Create Member

Create a new member account with provided profile information.

**Endpoint**: `POST /api/v1/membership/members`

**Authentication**: Required (OAuth with `membership:write` scope or API key)

**Request Body**:

```json
{
  "firstName": "Jennifer",
  "lastName": "Wong",
  "email": "jennifer.wong@example.com",
  "phone": "+60187654321",
  "birthDate": "1992-07-14",
  "gender": "female",
  "address": {
    "street": "45 Jalan Ampang",
    "city": "Kuala Lumpur",
    "state": "Wilayah Persekutuan",
    "postalCode": "50450",
    "country": "Malaysia"
  },
  "preferences": {
    "language": "en",
    "emailOptIn": true,
    "smsOptIn": true
  },
  "customFields": {
    "referralSource": "friend",
    "interests": ["fashion", "technology"]
  }
}
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "memberId": "MEM-789014",
    "firstName": "Jennifer",
    "lastName": "Wong",
    "email": "jennifer.wong@example.com",
    "phone": "+60187654321",
    "tier": "BRONZE",
    "tierName": "Bronze Member",
    "points": 0,
    "status": "active",
    "joinDate": "2024-01-15",
    "birthDate": "1992-07-14",
    "gender": "female",
    "address": {
      "street": "45 Jalan Ampang",
      "city": "Kuala Lumpur",
      "state": "Wilayah Persekutuan",
      "postalCode": "50450",
      "country": "Malaysia"
    }
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T14:35:00Z",
    "requestId": "req_def456"
  }
}
```

### Get Member Details

Retrieve complete information for a specific member.

**Endpoint**: `GET /api/v1/membership/members/{memberId}`

**Authentication**: Required (OAuth with `membership:read` scope or API key)

**Path Parameters**:

- `memberId` (string, required): Member identifier

**Example Request**:

```http
GET /api/v1/membership/members/MEM-789012
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "memberId": "MEM-789012",
    "firstName": "Sarah",
    "lastName": "Johnson",
    "email": "sarah.johnson@example.com",
    "phone": "+60123456789",
    "tier": "GOLD",
    "tierName": "Gold Member",
    "tierBenefits": ["10% discount", "Birthday bonus", "Priority support"],
    "points": 8750,
    "lifetimePoints": 15420,
    "status": "active",
    "joinDate": "2023-06-15",
    "birthDate": "1985-03-22",
    "gender": "female",
    "address": {
      "street": "123 Jalan Sultan Ismail",
      "city": "Kuala Lumpur",
      "state": "Wilayah Persekutuan",
      "postalCode": "50250",
      "country": "Malaysia"
    },
    "preferences": {
      "language": "en",
      "emailOptIn": true,
      "smsOptIn": true
    },
    "statistics": {
      "totalTransactions": 47,
      "averageTransactionValue": 215.50,
      "lastPurchaseDate": "2024-01-10",
      "daysSinceLastPurchase": 5
    }
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T14:40:00Z",
    "requestId": "req_ghi789"
  }
}
```

### Update Member

Update member profile information.

**Endpoint**: `PUT /api/v1/membership/members/{memberId}`

**Authentication**: Required (OAuth with `membership:write` scope or API key)

**Path Parameters**:

- `memberId` (string, required): Member identifier

**Request Body**:

```json
{
  "email": "sarah.j.new@example.com",
  "phone": "+60123456000",
  "address": {
    "street": "789 New Street",
    "city": "Kuala Lumpur",
    "state": "Wilayah Persekutuan",
    "postalCode": "50450",
    "country": "Malaysia"
  },
  "preferences": {
    "emailOptIn": false
  }
}
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "memberId": "MEM-789012",
    "email": "sarah.j.new@example.com",
    "phone": "+60123456000",
    "updatedAt": "2024-01-15T14:45:00Z"
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T14:45:00Z",
    "requestId": "req_jkl012"
  }
}
```

### Deactivate Member

Deactivate a member account (soft delete).

**Endpoint**: `DELETE /api/v1/membership/members/{memberId}`

**Authentication**: Required (OAuth with `membership:admin` scope or API key)

**Path Parameters**:

- `memberId` (string, required): Member identifier

**Query Parameters**:

- `reason` (string, optional): Deactivation reason

**Example Request**:

```http
DELETE /api/v1/membership/members/MEM-789012?reason=member_request
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "memberId": "MEM-789012",
    "status": "inactive",
    "deactivatedAt": "2024-01-15T14:50:00Z",
    "reason": "member_request"
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T14:50:00Z",
    "requestId": "req_mno345"
  }
}
```

## Points Management Endpoints

Points endpoints handle all aspects of points transactions including earning, redemption, adjustments, and balance queries.

### Get Points Balance

Retrieve current points balance for a member.

**Endpoint**: `GET /api/v1/membership/points/balance/{memberId}`

**Authentication**: Required (OAuth with `points:read` scope or API key)

**Path Parameters**:

- `memberId` (string, required): Member identifier

**Example Request**:

```http
GET /api/v1/membership/points/balance/MEM-789012
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "memberId": "MEM-789012",
    "currentPoints": 8750,
    "lifetimePoints": 15420,
    "expiringPoints": 500,
    "nextExpirationDate": "2024-06-30",
    "tier": "GOLD",
    "lastUpdated": "2024-01-10T16:22:00Z"
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T15:00:00Z",
    "requestId": "req_pqr678"
  }
}
```

### Award Points

Award points to a member for specific activities or purchases.

**Endpoint**: `POST /api/v1/membership/points/earn`

**Authentication**: Required (OAuth with `points:write` scope or API key)

**Request Body**:

```json
{
  "memberId": "MEM-789012",
  "points": 250,
  "reason": "Purchase transaction",
  "referenceId": "TXN-2024-001234",
  "metadata": {
    "transactionAmount": 500.00,
    "location": "Store-KL-Central",
    "earnRate": 0.5
  }
}
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "transactionId": "PT-789012-20240115-001",
    "memberId": "MEM-789012",
    "type": "earn",
    "points": 250,
    "previousBalance": 8750,
    "newBalance": 9000,
    "reason": "Purchase transaction",
    "referenceId": "TXN-2024-001234",
    "expirationDate": "2025-01-15",
    "processedAt": "2024-01-15T15:10:00Z"
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T15:10:00Z",
    "requestId": "req_stu901"
  }
}
```

### Redeem Points

Process points redemption for rewards or discounts.

**Endpoint**: `POST /api/v1/membership/points/redeem`

**Authentication**: Required (OAuth with `points:write` scope or API key)

**Request Body**:

```json
{
  "memberId": "MEM-789012",
  "points": 1000,
  "rewardId": "RWD-DISCOUNT-50",
  "reason": "RM50 discount voucher",
  "referenceId": "RED-2024-005678"
}
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "transactionId": "PT-789012-20240115-002",
    "memberId": "MEM-789012",
    "type": "redeem",
    "points": -1000,
    "previousBalance": 9000,
    "newBalance": 8000,
    "rewardId": "RWD-DISCOUNT-50",
    "reason": "RM50 discount voucher",
    "referenceId": "RED-2024-005678",
    "voucherCode": "DISC50-ABC123",
    "processedAt": "2024-01-15T15:20:00Z"
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T15:20:00Z",
    "requestId": "req_vwx234"
  }
}
```

### Get Points Transactions

Retrieve points transaction history for a member.

**Endpoint**: `GET /api/v1/membership/points/transactions/{memberId}`

**Authentication**: Required (OAuth with `points:read` scope or API key)

**Path Parameters**:

- `memberId` (string, required): Member identifier

**Query Parameters**:

- `limit` (integer, optional): Number of results (default: 50)
- `cursor` (string, optional): Pagination cursor
- `type` (string, optional): Filter by type (`earn`, `redeem`, `adjust`, `expire`)
- `startDate` (string, optional): Filter from date (ISO 8601)
- `endDate` (string, optional): Filter to date (ISO 8601)

**Example Request**:

```http
GET /api/v1/membership/points/transactions/MEM-789012?limit=10&type=earn
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Example Response**:

```json
{
  "success": true,
  "data": [
    {
      "transactionId": "PT-789012-20240115-001",
      "type": "earn",
      "points": 250,
      "balanceAfter": 9000,
      "reason": "Purchase transaction",
      "referenceId": "TXN-2024-001234",
      "processedAt": "2024-01-15T15:10:00Z"
    },
    {
      "transactionId": "PT-789012-20240110-003",
      "type": "earn",
      "points": 500,
      "balanceAfter": 8750,
      "reason": "Purchase transaction",
      "referenceId": "TXN-2024-001100",
      "processedAt": "2024-01-10T16:22:00Z"
    }
  ],
  "pagination": {
    "limit": 10,
    "returned": 2,
    "hasMore": true,
    "nextCursor": "eyJpZCI6MjAwLCJ2IjoxfQ=="
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T15:30:00Z",
    "requestId": "req_yzab567"
  }
}
```

### Adjust Points

Manually adjust member points balance (administrative operation).

**Endpoint**: `POST /api/v1/membership/points/adjust`

**Authentication**: Required (OAuth with `points:admin` scope or API key)

**Request Body**:

```json
{
  "memberId": "MEM-789012",
  "points": -500,
  "reason": "Correction for duplicate transaction",
  "adminNote": "Removed duplicate points from TXN-2024-001234",
  "referenceId": "ADJ-2024-000123"
}
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "transactionId": "PT-789012-20240115-003",
    "memberId": "MEM-789012",
    "type": "adjust",
    "points": -500,
    "previousBalance": 9000,
    "newBalance": 8500,
    "reason": "Correction for duplicate transaction",
    "referenceId": "ADJ-2024-000123",
    "processedAt": "2024-01-15T15:40:00Z",
    "processedBy": "admin@bigledger.com"
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T15:40:00Z",
    "requestId": "req_cdef890"
  }
}
```

### Get Expiring Points

Query points that will expire within a specified timeframe.

**Endpoint**: `GET /api/v1/membership/points/expiring/{memberId}`

**Authentication**: Required (OAuth with `points:read` scope or API key)

**Path Parameters**:

- `memberId` (string, required): Member identifier

**Query Parameters**:

- `days` (integer, optional): Number of days to look ahead (default: 30)

**Example Request**:

```http
GET /api/v1/membership/points/expiring/MEM-789012?days=60
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "memberId": "MEM-789012",
    "totalExpiringPoints": 500,
    "expirationSchedule": [
      {
        "points": 300,
        "expirationDate": "2024-02-28",
        "daysUntilExpiration": 44
      },
      {
        "points": 200,
        "expirationDate": "2024-03-15",
        "daysUntilExpiration": 59
      }
    ]
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T15:50:00Z",
    "requestId": "req_ghij123"
  }
}
```

## Membership Tier Endpoints

Tier endpoints manage membership tier definitions and member tier assignments.

### List Tiers

Retrieve all membership tier definitions.

**Endpoint**: `GET /api/v1/membership/tiers`

**Authentication**: Required (OAuth with `tier:read` scope or API key)

**Example Request**:

```http
GET /api/v1/membership/tiers
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Example Response**:

```json
{
  "success": true,
  "data": [
    {
      "tierId": "BRONZE",
      "name": "Bronze Member",
      "level": 1,
      "qualificationPoints": 0,
      "benefits": ["Basic discounts", "Points earning"],
      "earnMultiplier": 1.0,
      "color": "#CD7F32",
      "memberCount": 1250
    },
    {
      "tierId": "SILVER",
      "name": "Silver Member",
      "level": 2,
      "qualificationPoints": 1000,
      "benefits": ["5% discount", "Birthday bonus", "Points earning"],
      "earnMultiplier": 1.25,
      "color": "#C0C0C0",
      "memberCount": 487
    },
    {
      "tierId": "GOLD",
      "name": "Gold Member",
      "level": 3,
      "qualificationPoints": 5000,
      "benefits": ["10% discount", "Birthday bonus", "Priority support", "Exclusive events"],
      "earnMultiplier": 1.5,
      "color": "#FFD700",
      "memberCount": 123
    }
  ],
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T16:00:00Z",
    "requestId": "req_klmn456"
  }
}
```

### Get Tier Details

Retrieve detailed information for a specific tier.

**Endpoint**: `GET /api/v1/membership/tiers/{tierId}`

**Authentication**: Required (OAuth with `tier:read` scope or API key)

**Path Parameters**:

- `tierId` (string, required): Tier identifier

**Example Response**:

```json
{
  "success": true,
  "data": {
    "tierId": "GOLD",
    "name": "Gold Member",
    "level": 3,
    "qualificationPoints": 5000,
    "qualificationPeriod": "12months",
    "benefits": [
      {
        "type": "discount",
        "description": "10% discount on all purchases",
        "value": 10
      },
      {
        "type": "bonus",
        "description": "Birthday bonus points",
        "value": 500
      },
      {
        "type": "service",
        "description": "Priority customer support"
      }
    ],
    "earnMultiplier": 1.5,
    "minimumSpend": 10000,
    "retentionPeriod": "12months",
    "downgradeTier": "SILVER",
    "memberCount": 123
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T16:10:00Z",
    "requestId": "req_opqr789"
  }
}
```

### Assign Member Tier

Manually assign a member to a specific tier.

**Endpoint**: `POST /api/v1/membership/tiers/assign`

**Authentication**: Required (OAuth with `tier:write` scope or API key)

**Request Body**:

```json
{
  "memberId": "MEM-789012",
  "tierId": "PLATINUM",
  "reason": "VIP upgrade",
  "expirationDate": "2024-12-31"
}
```

**Example Response**:

```json
{
  "success": true,
  "data": {
    "memberId": "MEM-789012",
    "previousTier": "GOLD",
    "newTier": "PLATINUM",
    "assignedAt": "2024-01-15T16:20:00Z",
    "expirationDate": "2024-12-31",
    "reason": "VIP upgrade"
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T16:20:00Z",
    "requestId": "req_stuv012"
  }
}
```

## Configuration Endpoints

Configuration endpoints manage system settings and membership program parameters.

### Get Earning Rules

Retrieve points earning rules configuration.

**Endpoint**: `GET /api/v1/membership/config/earning-rules`

**Authentication**: Required (OAuth with `membership:read` scope or API key)

**Example Response**:

```json
{
  "success": true,
  "data": {
    "baseEarnRate": 0.5,
    "currency": "MYR",
    "roundingRule": "down",
    "minimumPurchase": 10.00,
    "tierMultipliers": {
      "BRONZE": 1.0,
      "SILVER": 1.25,
      "GOLD": 1.5,
      "PLATINUM": 2.0
    },
    "categoryMultipliers": {
      "electronics": 1.0,
      "fashion": 1.5,
      "grocery": 0.5
    },
    "promotionalRules": [
      {
        "ruleId": "PROMO-2024-01",
        "description": "2x points on weekends",
        "multiplier": 2.0,
        "startDate": "2024-01-01",
        "endDate": "2024-03-31",
        "conditions": {
          "daysOfWeek": ["Saturday", "Sunday"]
        }
      }
    ]
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T16:30:00Z",
    "requestId": "req_wxyz345"
  }
}
```

### Get Redemption Catalog

Retrieve available rewards for points redemption.

**Endpoint**: `GET /api/v1/membership/config/rewards`

**Authentication**: Required (OAuth with `rewards:read` scope or API key)

**Query Parameters**:

- `tier` (string, optional): Filter rewards by minimum tier
- `category` (string, optional): Filter by reward category
- `available` (boolean, optional): Show only available rewards

**Example Response**:

```json
{
  "success": true,
  "data": [
    {
      "rewardId": "RWD-DISCOUNT-50",
      "name": "RM50 Discount Voucher",
      "description": "RM50 off your next purchase",
      "category": "voucher",
      "pointsCost": 1000,
      "minimumTier": "BRONZE",
      "available": true,
      "inventory": 500,
      "expirationDays": 30,
      "termsAndConditions": "Valid for purchases above RM200"
    },
    {
      "rewardId": "RWD-PRODUCT-123",
      "name": "Wireless Earbuds",
      "description": "Premium wireless earbuds with noise cancellation",
      "category": "product",
      "pointsCost": 5000,
      "minimumTier": "SILVER",
      "available": true,
      "inventory": 25,
      "imageUrl": "https://cdn.bigledger.com/rewards/earbuds.jpg"
    }
  ],
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T16:40:00Z",
    "requestId": "req_abcd678"
  }
}
```

## Error Responses

All endpoints may return error responses with appropriate HTTP status codes:

**400 Bad Request** - Invalid request parameters:

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validation failed",
    "fields": {
      "email": "Invalid email format"
    }
  },
  "metadata": {
    "timestamp": "2024-01-15T16:50:00Z",
    "requestId": "req_error001"
  }
}
```

**404 Not Found** - Resource not found:

```json
{
  "success": false,
  "error": {
    "code": "MEMBER_NOT_FOUND",
    "message": "Member with ID MEM-999999 does not exist"
  },
  "metadata": {
    "timestamp": "2024-01-15T16:55:00Z",
    "requestId": "req_error002"
  }
}
```

**422 Unprocessable Entity** - Business rule violation:

```json
{
  "success": false,
  "error": {
    "code": "INSUFFICIENT_POINTS",
    "message": "Member has insufficient points for redemption",
    "details": {
      "requiredPoints": 1000,
      "availablePoints": 750,
      "shortfall": 250
    }
  },
  "metadata": {
    "timestamp": "2024-01-15T17:00:00Z",
    "requestId": "req_error003"
  }
}
```
