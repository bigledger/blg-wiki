---
bookCollapseSection: true
cascade:
  type: docs
description: Complete reference documentation for all BigLedger REST APIs with interactive examples and comprehensive endpoint coverage.
tags:
- api-reference
- rest-api
- endpoints
title: API Reference
weight: 20
---


Complete reference documentation for all BigLedger REST APIs. Since all BigLedger applets are built with Angular, every feature in the BigLedger interface has a corresponding API endpoint, ensuring 100% programmatic access to all functionality.

We will continuously improve this documentation, suggestions are welcome.

{{< callout type="info" >}}
**Interactive Documentation**: This reference includes live examples, sample requests/responses, and interactive testing capabilities. Use our [API Explorer](https://developers.bigledger.com/explorer) to test endpoints directly.
{{< /callout >}}

## Base URLs

### Production Environment
```
https://api.bigledger.com/v1
```

### Sandbox Environment
```
https://sandbox-api.bigledger.com/v1
```

{{< callout type="tip" >}}
**Start with Sandbox**: Always begin development and testing in the sandbox environment. It mirrors production exactly but uses test data.
{{< /callout >}}

## Authentication

All API requests require authentication via API key in the Authorization header:

```http
Authorization: Bearer YOUR_API_KEY
```

## Common Headers

Include these headers in all requests:

```http
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY
X-Company-Id: your-company-id
```

## Core API Modules

### Accounting APIs
Complete accounting operations including chart of accounts, journal entries, and financial reporting.

- **[Accounts API](./accounting#accounts)** - Manage chart of accounts
- **[Journal Entries API](./accounting#journals)** - Create and manage journal entries  
- **[Financial Reports API](./accounting#reports)** - Generate balance sheets, P&L, trial balance

### E-Invoice APIs
PEPPOL and MyInvois compliance with automated validation and submission.

- **[E-Invoice Creation API](./einvoice#create)** - Create compliant e-invoices
- **[Validation API](./einvoice#validate)** - Validate invoice data before submission
- **[Submission API](./einvoice#submit)** - Submit to government portals
- **[Status Tracking API](./einvoice#status)** - Track submission status
- **[Cancellation & Rejection API](./einvoice-api-reference/)** - Direct cancellation and rejection request workflows (Malaysia MyInvois)

### Inventory APIs
Complete inventory management including stock levels, transfers, and adjustments.

- **[Items API](./inventory#items)** - Manage inventory items
- **[Stock Levels API](./inventory#stock)** - Real-time stock tracking
- **[Transfers API](./inventory#transfers)** - Stock transfers between locations
- **[Adjustments API](./inventory#adjustments)** - Stock adjustments and corrections

### Sales & CRM APIs
Customer management, sales orders, quotes, and invoicing.

- **[Customers API](./sales#customers)** - Customer management
- **[Sales Orders API](./sales#orders)** - Create and manage sales orders
- **[Quotes API](./sales#quotes)** - Generate sales quotes
- **[Invoices API](./sales#invoices)** - Invoice creation and management

### POS APIs
Point-of-sale operations, session management, and retail transactions.

- **[Transactions API](./pos#transactions)** - Process POS transactions
- **[Sessions API](./pos#sessions)** - Manage POS sessions
- **[Reports API](./pos#reports)** - Daily sales reports

## API Design Patterns

### RESTful URLs

BigLedger APIs follow RESTful conventions:

```http
GET    /api/v1/customers           # List customers
POST   /api/v1/customers           # Create customer
GET    /api/v1/customers/{id}      # Get specific customer
PUT    /api/v1/customers/{id}      # Update customer
DELETE /api/v1/customers/{id}      # Delete customer
```

### Standard Response Format

All API responses follow this structure:

```json
{
  "success": true,
  "data": {
    // Response data here
  },
  "meta": {
    "timestamp": "2024-01-15T10:30:00Z",
    "requestId": "req_123456789"
  }
}
```

### Error Response Format

Error responses include detailed information:

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid customer data",
    "details": [
      {
        "field": "email",
        "message": "Email format is invalid"
      }
    ]
  },
  "meta": {
    "timestamp": "2024-01-15T10:30:00Z",
    "requestId": "req_123456789"
  }
}
```

### Pagination

For list endpoints, use cursor-based pagination:

```http
GET /api/v1/customers?limit=20&cursor=eyJpZCI6MTIzfQ
```

Response includes pagination metadata:

```json
{
  "success": true,
  "data": [
    // Customer records
  ],
  "pagination": {
    "hasMore": true,
    "nextCursor": "eyJpZCI6MTQzfQ",
    "limit": 20,
    "total": 156
  }
}
```

### Filtering and Sorting

Use query parameters for advanced filtering and sorting:

```http
# Basic filtering
GET /api/v1/invoices?status=draft&customerName=acme

# Date range filtering
GET /api/v1/invoices?fromDate=2024-01-01&toDate=2024-01-31

# Sorting (ascending/descending)
GET /api/v1/invoices?sort=createdAt:desc

# Multiple sort fields
GET /api/v1/invoices?sort=dueDate:asc,total:desc

# Search across multiple fields
GET /api/v1/customers?search=acme&searchFields=name,email,phone

# Complex filtering with operators
GET /api/v1/invoices?total[gte]=1000&total[lte]=5000&status[ne]=cancelled
```

#### Supported Filter Operators

| Operator | Description | Example |
|----------|-------------|----------|
| `eq` | Equal (default) | `status=active` |
| `ne` | Not equal | `status[ne]=cancelled` |
| `gt` | Greater than | `total[gt]=100` |
| `gte` | Greater than or equal | `total[gte]=100` |
| `lt` | Less than | `total[lt]=1000` |
| `lte` | Less than or equal | `total[lte]=1000` |
| `in` | In array | `status[in]=draft,pending` |
| `nin` | Not in array | `status[nin]=cancelled,void` |
| `contains` | Contains text | `name[contains]=acme` |
| `startswith` | Starts with | `name[startswith]=A` |
| `endswith` | Ends with | `email[endswith]=.com` |

## Rate Limiting

API requests are rate limited by API key:

- **Default Limit**: 1000 requests per hour
- **Burst Limit**: 10 requests per second
- **Headers**: Rate limit information is included in response headers

```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1642248000
```

## Bulk Operations

For high-volume operations, use bulk endpoints to process multiple records efficiently:

### Bulk Create
```http
POST /api/v1/bulk/customers
Content-Type: application/json

{
  "operations": [
    {
      "operation": "create",
      "data": {
        "name": "Customer 1",
        "email": "customer1@example.com"
      }
    },
    {
      "operation": "create",
      "data": {
        "name": "Customer 2",
        "email": "customer2@example.com"
      }
    }
  ]
}
```

### Bulk Update
```http
POST /api/v1/bulk/customers
{
  "operations": [
    {
      "operation": "update",
      "id": "cust_123",
      "data": {
        "creditLimit": 15000
      }
    },
    {
      "operation": "update",
      "id": "cust_456",
      "data": {
        "status": "inactive"
      }
    }
  ]
}
```

### Bulk Response Format
```json
{
  "success": true,
  "data": {
    "processed": 2,
    "successful": 1,
    "failed": 1,
    "results": [
      {
        "index": 0,
        "success": true,
        "data": {
          "id": "cust_789",
          "name": "Customer 1"
        }
      },
      {
        "index": 1,
        "success": false,
        "error": {
          "code": "VALIDATION_ERROR",
          "message": "Email already exists"
        }
      }
    ]
  }
}
```

### Bulk Endpoints Available
- `POST /api/v1/bulk/customers` - Bulk customer operations (max 100 records)
- `POST /api/v1/bulk/invoices` - Bulk invoice operations (max 50 records)
- `POST /api/v1/bulk/inventory-adjustments` - Bulk inventory updates (max 200 records)
- `POST /api/v1/bulk/journal-entries` - Bulk accounting entries (max 100 records)
- `POST /api/v1/bulk/payments` - Bulk payment processing (max 100 records)

## Webhooks

Subscribe to real-time events:

```http
POST /api/v1/webhooks/subscribe
{
  "url": "https://your-app.com/webhooks",
  "events": ["invoice.created", "payment.received", "stock.updated"]
}
```

## WebSocket API

For real-time data updates and live synchronization:

### Connection
```javascript
const ws = new WebSocket('wss://api.bigledger.com/v1/stream');

// Authenticate and subscribe
ws.onopen = function() {
  ws.send(JSON.stringify({
    "type": "auth",
    "token": "YOUR_API_KEY",
    "companyId": "YOUR_COMPANY_ID"
  }));
};

// Subscribe to events
ws.send(JSON.stringify({
  "type": "subscribe",
  "channels": ["invoice.updates", "stock.changes", "payment.received"],
  "filters": {
    "invoice.updates": {
      "status": ["draft", "sent"]
    }
  }
}));
```

### Available Channels
- `invoice.created` - New invoice created
- `invoice.updated` - Invoice modified
- `invoice.sent` - Invoice sent to customer
- `payment.received` - Payment recorded
- `stock.updated` - Inventory levels changed
- `customer.created` - New customer added
- `order.status_changed` - Sales order status updated
- `einvoice.submitted` - E-invoice submitted to government
- `report.generated` - Financial report completed

### Message Format
```json
{
  "type": "event",
  "channel": "invoice.created",
  "data": {
    "id": "inv_123",
    "invoiceNumber": "INV-2024-0001",
    "customerId": "cust_456",
    "total": 1060.00,
    "status": "draft",
    "timestamp": "2024-01-15T10:30:00Z"
  },
  "meta": {
    "companyId": "company_abc123",
    "timestamp": "2024-01-15T10:30:00Z",
    "eventId": "evt_789xyz"
  }
}
```

## Common HTTP Status Codes

| Code | Meaning | Description |
|------|---------|-------------|
| 200 | OK | Request successful |
| 201 | Created | Resource created successfully |
| 400 | Bad Request | Invalid request data |
| 401 | Unauthorized | Invalid or missing API key |
| 403 | Forbidden | Insufficient permissions |
| 404 | Not Found | Resource not found |
| 422 | Unprocessable Entity | Validation errors |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Internal Server Error | Server error |

## Testing Your Integration

### Sandbox Environment

Use the sandbox environment for testing:

```
https://api-sandbox.bigledger.com/v1
```

### Interactive API Explorer

Try our interactive API explorer with live testing capabilities:

[Open API Explorer](https://developers.bigledger.com/api-explorer)

Features:
- **Live Testing**: Make real API calls from your browser
- **Authentication**: Built-in API key management
- **Code Generation**: Generate code samples in multiple languages
- **Response Inspector**: Detailed response analysis
- **History**: Track your API testing history

### Postman Collection

Import our comprehensive Postman collection:

[Download BigLedger API Collection](https://developers.bigledger.com/postman/bigledger-api-collection.json)

**Included**:
- All API endpoints with sample requests
- Environment variables for sandbox/production
- Pre-request authentication scripts
- Test scripts for response validation
- Example workflows for common integrations

### OpenAPI Specification

Download our OpenAPI (Swagger) specification:

- **OpenAPI 3.0**: [bigledger-api-v1.yaml](https://api.bigledger.com/v1/openapi.yaml)
- **Swagger UI**: [Interactive Swagger Documentation](https://developers.bigledger.com/swagger-ui)
- **JSON Format**: [bigledger-api-v1.json](https://api.bigledger.com/v1/openapi.json)

## API Modules

{{< cards >}}
{{< card link="../authentication" title="Authentication" icon="key" subtitle="OAuth 2.0 flows, API key management, and security best practices." >}}
{{< card link="./accounting" title="Accounting APIs" icon="chart-bar" subtitle="Chart of accounts, journal entries, and financial reporting endpoints." >}}
{{< card link="./einvoice" title="E-Invoice APIs" icon="document-text" subtitle="PEPPOL and MyInvois compliance with automated validation." >}}
{{< card link="./inventory" title="Inventory APIs" icon="cube" subtitle="Stock management, transfers, adjustments, and real-time tracking." >}}

{{< card link="./sales" title="Sales & CRM APIs" icon="user-group" subtitle="Customers, sales orders, quotes, invoices, and CRM operations." >}}

{{< card link="./purchasing" title="Purchasing APIs" icon="shopping-bag" subtitle="Purchase orders, suppliers, bills, and procurement workflows." >}}

{{< card link="./pos" title="POS APIs" icon="shopping-cart" subtitle="Point-of-sale transactions, sessions, and retail operations." >}}

{{< card link="./reports" title="Reporting APIs" icon="chart-pie" subtitle="Financial reports, analytics, and business intelligence data." >}}

{{< card link="../webhooks" title="Webhooks API" icon="bell" subtitle="Real-time event notifications and webhook management." >}}

{{< card link="./batch" title="Batch Operations" icon="archive" subtitle="Bulk operations for high-volume data processing." >}}

{{< card link="./integrations" title="Integration APIs" icon="link" subtitle="Third-party integrations and data synchronization." >}}

{{< card link="./errors" title="Error Handling" icon="warning" subtitle="Comprehensive error codes and troubleshooting guide." >}}
{{< /cards >}}

## Quick Reference

### Common Endpoints

```http
# Authentication & Company Info
GET    /v1/auth/verify
GET    /v1/company

# Core Business Entities
GET    /v1/customers              # List customers
POST   /v1/customers              # Create customer
GET    /v1/customers/{id}         # Get customer
PUT    /v1/customers/{id}         # Update customer
DELETE /v1/customers/{id}         # Delete customer

# Invoicing
GET    /v1/invoices               # List invoices
POST   /v1/invoices               # Create invoice
GET    /v1/invoices/{id}          # Get invoice
PUT    /v1/invoices/{id}          # Update invoice
POST   /v1/invoices/{id}/send     # Send invoice
POST   /v1/invoices/{id}/payment  # Record payment

# Inventory
GET    /v1/items                  # List inventory items
GET    /v1/stock                  # Current stock levels
POST   /v1/stock-adjustments      # Adjust stock
POST   /v1/stock-transfers        # Transfer stock

# Accounting
GET    /v1/accounts               # Chart of accounts
POST   /v1/journal-entries        # Create journal entry
GET    /v1/reports/balance-sheet  # Balance sheet
GET    /v1/reports/profit-loss    # P&L statement
```

### Response Time SLA

| Operation Type | Target Response Time | SLA |
|---|---|---|
| Read operations (GET) | < 200ms | 99.9% |
| Write operations (POST/PUT) | < 500ms | 99.5% |
| Bulk operations | < 5 seconds | 99.0% |
| Report generation | < 10 seconds | 95.0% |
| File uploads | < 30 seconds | 95.0% |

### Global Request/Response Headers

**Request Headers**:
```http
Authorization: Bearer {api_key}     # Required
Content-Type: application/json      # Required for POST/PUT
X-Company-Id: {company_id}          # Required
X-Request-ID: {unique_id}           # Optional, for tracking
X-API-Version: 2024-01-15           # Optional, date-based versioning
Accept-Encoding: gzip, deflate      # Optional, for compression
User-Agent: YourApp/1.0.0           # Recommended
```

**Response Headers**:
```http
Content-Type: application/json
X-Request-ID: req_123456789
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1642248000
X-Response-Time: 150ms
Cache-Control: no-cache
```
