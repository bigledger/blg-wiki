---
title: "Data Hub Membership API"
description: "Architecture and technical specifications of the Data Hub Membership API"
weight: 1
---

The Data Hub Membership API serves as the central integration point for all membership-related operations within the BigLedger ecosystem. Built on modern microservices architecture, the API provides scalable, reliable, and secure access to membership data and functionality.

## Architecture Overview

The Data Hub Membership API is architected as a stateless RESTful service that processes requests independently without maintaining session state. This design enables horizontal scalability, allowing the system to handle increased load by adding more service instances without coordination overhead.

### Service Layers

**API Gateway Layer** handles all incoming requests, providing request routing, authentication, rate limiting, and protocol translation. The gateway implements security policies, validates request signatures, and enforces access controls before forwarding requests to backend services. This centralized security checkpoint ensures consistent protection across all endpoints.

**Business Logic Layer** contains the core membership functionality including member management, points calculation, tier evaluation, and reward processing. This layer implements business rules, validates data integrity, and orchestrates operations across multiple data stores. The business logic is implemented using domain-driven design principles, organizing code around membership concepts rather than technical concerns.

**Data Access Layer** provides abstracted access to persistence stores, isolating business logic from database specifics. This layer handles query optimization, connection pooling, and transaction management. Support for multiple database technologies enables optimal storage strategies for different data types.

**Integration Layer** manages connections to external systems including POS terminals, e-commerce platforms, email services, and analytics systems. This layer implements retry logic, circuit breakers, and fallback mechanisms to ensure resilient integration even when external systems experience issues.

### Data Storage Architecture

The API utilizes a polyglot persistence approach, selecting storage technologies based on specific data characteristics:

**Relational Database** stores structured membership data including member profiles, transaction records, tier definitions, and configuration settings. PostgreSQL provides ACID transactions, complex querying capabilities, and referential integrity essential for financial data accuracy.

**Document Store** maintains semi-structured data such as member preferences, behavioral analytics, and customization settings. MongoDB enables flexible schema evolution and efficient retrieval of nested data structures.

**Cache Layer** uses Redis for high-performance caching of frequently accessed data including member lookups, points balances, and tier information. Caching reduces database load and improves response times for common operations.

**Object Storage** manages binary content such as member profile images, reward product images, and document attachments. Amazon S3 provides durable, scalable storage with CDN integration for efficient content delivery.

## Base URL Configuration

### Production Environment

The production API endpoint serves live customer data and processes real transactions:

```
https://datahub.bigledger.com/api/v1/membership
```

Production access requires valid credentials issued through the BigLedger administrative console. Production API keys are restricted to specific IP addresses and include usage monitoring for security and compliance purposes.

### Sandbox Environment

The sandbox environment provides isolated testing with synthetic data:

```
https://sandbox-datahub.bigledger.com/api/v1/membership
```

Sandbox credentials are separate from production and provide unrestricted testing capabilities. The sandbox environment resets data periodically, typically every 24 hours, allowing developers to experiment freely without affecting real data. Rate limits in sandbox are more lenient to facilitate load testing and development workflows.

### Environment Differences

While sandbox and production environments share identical API contracts, some behavioral differences exist:

**Data Persistence**: Sandbox data is ephemeral and may be reset without notice, while production data is permanently stored with comprehensive backups.

**Rate Limits**: Sandbox allows higher request rates to facilitate testing, while production enforces stricter limits to ensure fair resource allocation.

**Webhook Delivery**: Sandbox webhooks are delivered with delays and may be dropped under high load, while production webhooks guarantee delivery with retry mechanisms.

**Email Notifications**: Sandbox emails are redirected to designated test addresses regardless of member email addresses, while production sends to actual member emails.

## API Endpoint Organization

Endpoints are organized hierarchically by resource type, following RESTful conventions:

### Member Resources

**Base path**: `/members`

Member resources represent individual membership accounts with complete profile information, points balances, tier assignments, and transaction history.

```
GET    /members              List all members with filtering and pagination
POST   /members              Create new member account
GET    /members/{memberId}   Retrieve specific member details
PUT    /members/{memberId}   Update member profile
PATCH  /members/{memberId}   Partial update of member fields
DELETE /members/{memberId}   Deactivate member account
```

Member identifiers use the format `MEM-{numeric-id}` for consistency and readability. The identifier is immutable once assigned and serves as the permanent reference for all member-related operations.

### Points Resources

**Base path**: `/points`

Points resources manage all aspects of points transactions including earning, redemption, adjustments, and expiration.

```
GET    /points/balance/{memberId}        Get current points balance
POST   /points/earn                      Award points to member
POST   /points/redeem                    Redeem points for rewards
GET    /points/transactions/{memberId}   List points transaction history
POST   /points/adjust                    Manual points adjustment
GET    /points/expiring/{memberId}       Query expiring points
```

Points transactions are atomic and implement optimistic locking to prevent race conditions when multiple operations attempt to modify the same balance simultaneously. Transaction records are immutable, ensuring complete audit trails.

### Membership Tier Resources

**Base path**: `/tiers`

Tier resources define membership levels, qualification criteria, and associated benefits.

```
GET    /tiers                List all active tiers
POST   /tiers                Create new tier definition
GET    /tiers/{tierId}       Retrieve tier details
PUT    /tiers/{tierId}       Update tier configuration
DELETE /tiers/{tierId}       Remove tier definition
GET    /tiers/{tierId}/members   List members at specific tier
```

Tier configurations include qualification thresholds, benefit specifications, and progression rules. Changes to tier definitions affect future evaluations but do not retroactively modify existing member assignments unless explicitly requested.

### Reward Resources

**Base path**: `/rewards`

Reward resources represent items available for points redemption including products, discounts, and experiences.

```
GET    /rewards              List available rewards
POST   /rewards              Create new reward item
GET    /rewards/{rewardId}   Retrieve reward details
PUT    /rewards/{rewardId}   Update reward configuration
DELETE /rewards/{rewardId}   Remove reward from catalog
POST   /rewards/redeem       Process reward redemption
```

Reward availability is controlled through inventory management, eligibility rules, and member tier restrictions. The system ensures rewards cannot be redeemed when inventory is depleted or member qualifications are not met.

### Transaction Resources

**Base path**: `/transactions`

Transaction resources provide comprehensive access to all membership activities including points earned, points redeemed, tier changes, and reward fulfillment.

```
GET    /transactions                Query transactions with filters
GET    /transactions/{transactionId} Retrieve transaction details
POST   /transactions/void           Void or reverse transaction
GET    /transactions/export         Export transactions to CSV/JSON
```

Transactions include complete metadata for reporting and reconciliation including timestamps, amounts, reference identifiers, processing status, and related entity references.

## Response Format Specifications

### Standard Success Response

All successful operations return responses following this structure:

```json
{
  "success": true,
  "data": {
    // Resource-specific data
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T14:30:00Z",
    "requestId": "req_abc123xyz789"
  }
}
```

The `requestId` field provides a unique identifier for request tracing and support inquiries. This identifier is logged throughout the processing pipeline, enabling comprehensive troubleshooting.

### Paginated Response

Endpoints returning collections include pagination metadata:

```json
{
  "success": true,
  "data": [
    // Array of resource objects
  ],
  "pagination": {
    "limit": 50,
    "returned": 50,
    "hasMore": true,
    "nextCursor": "eyJpZCI6MTUwMCwidiI6MX0=",
    "prevCursor": null
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T14:30:00Z",
    "requestId": "req_abc123xyz789"
  }
}
```

Cursor values are base64-encoded JSON objects containing pagination state. Clients should treat cursors as opaque values and not attempt to construct or modify them.

### Error Response Format

Error responses provide detailed information for debugging:

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "One or more validation errors occurred",
    "fields": {
      "email": "Invalid email format",
      "points": "Points value must be positive"
    },
    "documentation": "https://docs.bigledger.com/api/errors/VALIDATION_ERROR"
  },
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-01-15T14:30:00Z",
    "requestId": "req_abc123xyz789"
  }
}
```

Error codes are consistent across endpoints, allowing applications to implement centralized error handling logic. The documentation URL provides detailed information about the error condition and recommended resolution steps.

## Request Validation

The API implements comprehensive request validation to ensure data integrity and provide early feedback on malformed requests:

### Schema Validation

All request bodies are validated against JSON schemas that define required fields, data types, format constraints, and value ranges. Validation failures return HTTP 400 with detailed field-level error messages.

### Business Rule Validation

Beyond schema validation, business rules are enforced including member uniqueness constraints, points balance sufficiency, tier eligibility requirements, and reward availability verification. Business rule violations return HTTP 422 with specific error codes indicating the violated constraint.

### Idempotency

Certain operations support idempotency keys to prevent duplicate processing. Clients can include an `Idempotency-Key` header with a unique value. If multiple requests are submitted with the same idempotency key within 24 hours, only the first is processed while subsequent requests receive the original response.

```http
POST /api/v1/membership/points/earn
Idempotency-Key: unique-operation-identifier-123
Content-Type: application/json

{
  "memberId": "MEM-789012",
  "points": 500,
  "reason": "Purchase transaction"
}
```

Idempotency is particularly valuable for retry scenarios where network failures may leave request outcomes uncertain.

## Performance Characteristics

The API is designed for high performance with typical response times under 100 milliseconds for simple queries and under 500 milliseconds for complex operations. Performance is achieved through:

**Connection Pooling** maintains persistent database connections, eliminating connection establishment overhead for each request.

**Query Optimization** uses indexed lookups, query plan analysis, and result caching to minimize database processing time.

**Asynchronous Processing** handles long-running operations through background jobs, immediately returning operation identifiers while processing continues independently.

**Content Compression** reduces response payload size by up to 80% through gzip compression, significantly improving transfer times for large responses.

**Distributed Caching** stores frequently accessed data in memory caches distributed across API service instances, providing sub-millisecond retrieval times.

## Monitoring and Observability

The API implements comprehensive monitoring and logging:

**Request Logging** captures all API requests including endpoints, parameters, response codes, and processing duration. Logs are retained for 90 days for troubleshooting and compliance purposes.

**Performance Metrics** track response times, throughput, error rates, and resource utilization. Metrics are aggregated and visualized in monitoring dashboards accessible through the developer portal.

**Distributed Tracing** follows requests through the entire processing pipeline, capturing timing and status for each component involved in fulfilling requests. Trace data enables detailed performance analysis and bottleneck identification.

**Health Endpoints** provide service status information:

```
GET /api/v1/health          Overall service health
GET /api/v1/health/detailed Detailed component status
```

Health checks are used by load balancers and monitoring systems to detect service degradation and automatically route traffic away from unhealthy instances.

## Service Level Objectives

The API maintains the following service level objectives (SLOs):

**Availability**: 99.9% uptime calculated on monthly basis, excluding scheduled maintenance windows.

**Response Time**: 95th percentile response time under 200ms for read operations and under 500ms for write operations.

**Error Rate**: Less than 0.1% of requests result in 5xx server errors.

**Data Durability**: 99.999999999% (11 nines) durability for all persisted data through redundant storage and backup systems.

Current performance against these objectives is published on the API status page and updated in real-time based on monitoring data.
