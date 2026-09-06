---
description: Comprehensive webhooks documentation for real-time event notifications, secure delivery, and integration automation.
tags:
- webhooks
- real-time
- events
- notifications
title: Webhooks
weight: 30
draft: true  # unpublished 2026-09-06: mechanism is real, every documented detail is wrong; rewrite from source (F-0285/F-0286)
---

Comprehensive webhook system for real-time event notifications in BigLedger. Get instant notifications when business events occur, enabling seamless integration and automation.

{{< callout type="info" >}}
**Event-Driven Architecture**: BigLedger's webhooks follow industry best practices with HMAC-SHA256 signature verification, automatic retries, and comprehensive event filtering.
{{< /callout >}}

## Overview

BigLedger webhooks provide real-time notifications for important business events. Instead of polling our APIs, you can receive instant notifications when:

- **Invoices** are created, sent, or paid
- **Payments** are received or recorded
- **Customers** are created or updated
- **Inventory** levels change or reach thresholds
- **E-invoices** are submitted or accepted
- **Sales orders** are placed or fulfilled

## Webhook Events

### Invoice Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `invoice.created` | New invoice created | Invoice is saved in BigLedger |
| `invoice.updated` | Invoice modified | Invoice data is changed |
| `invoice.sent` | Invoice sent to customer | Email sent or status manually updated |
| `invoice.viewed` | Customer viewed invoice | Customer opens invoice link |
| `invoice.paid` | Invoice fully paid | Payment recorded that covers full amount |
| `invoice.partially_paid` | Partial payment received | Payment recorded for partial amount |
| `invoice.overdue` | Invoice becomes overdue | Due date passes without full payment |
| `invoice.cancelled` | Invoice cancelled | Invoice status changed to cancelled |

### Payment Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `payment.received` | Payment recorded | Any payment is recorded in system |
| `payment.matched` | Payment matched to invoice | Automatic or manual payment matching |
| `payment.unmatched` | Payment couldn't be matched | Payment received but no matching invoice |
| `payment.refunded` | Payment refunded | Refund processed for a payment |

### Customer Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `customer.created` | New customer added | Customer record created |
| `customer.updated` | Customer information changed | Customer data modified |
| `customer.credit_limit_exceeded` | Credit limit exceeded | Customer balance exceeds credit limit |
| `customer.status_changed` | Customer status changed | Active/inactive status change |

### Inventory Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `inventory.low_stock` | Stock below minimum level | Item quantity falls below threshold |
| `inventory.out_of_stock` | Item out of stock | Item quantity reaches zero |
| `inventory.adjustment` | Stock adjustment made | Manual stock level adjustment |
| `inventory.transfer` | Stock transferred | Items moved between locations |

### E-Invoice Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `einvoice.created` | E-invoice generated | E-invoice document created |
| `einvoice.validated` | E-invoice validation passed | Document passes validation checks |
| `einvoice.submitted` | E-invoice submitted to portal | Submitted to government portal |
| `einvoice.accepted` | E-invoice accepted | Government portal accepts e-invoice |
| `einvoice.rejected` | E-invoice rejected | Government portal rejects e-invoice |
| `einvoice.cancelled` | E-invoice cancelled | E-invoice cancellation processed |

### Sales Order Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `sales_order.created` | New sales order | Sales order created |
| `sales_order.confirmed` | Order confirmed | Order status changed to confirmed |
| `sales_order.shipped` | Order shipped | Shipping information added |
| `sales_order.delivered` | Order delivered | Delivery confirmed |
| `sales_order.cancelled` | Order cancelled | Order status changed to cancelled |

### Purchase Order Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `purchase_order.created` | New purchase order | Purchase order created |
| `purchase_order.sent` | PO sent to supplier | Purchase order emailed or transmitted |
| `purchase_order.confirmed` | Supplier confirmed PO | Supplier acceptance received |
| `purchase_order.received` | Goods received | Stock received against PO |
| `purchase_order.invoiced` | Supplier bill received | Bill created from PO |

### Bill & Expense Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `bill.created` | New supplier bill | Bill record created |
| `bill.paid` | Bill payment made | Payment applied to bill |
| `expense.created` | New expense recorded | Expense entry created |
| `expense.approved` | Expense approved | Expense approval completed |

### User & Access Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `user.login` | User logged in | Successful authentication |
| `user.logout` | User logged out | Session terminated |
| `user.password_changed` | Password updated | User changed password |
| `user.created` | New user added | User account created |
| `user.deactivated` | User deactivated | User access revoked |

### System Events

| Event | Description | When Triggered |
|-------|-------------|----------------|
| `backup.completed` | Data backup finished | Automated backup completed |
| `report.generated` | Report processing done | Scheduled report ready |
| `integration.sync_completed` | Integration sync finished | Third-party sync completed |
| `integration.sync_failed` | Integration sync failed | Third-party sync error |

## Setting Up Webhooks

### Create Webhook Subscription

```http
POST /api/v1/webhooks/subscribe
```

**Request Body:**

```json
{
  "url": "https://your-app.com/webhooks/bigledger",
  "events": [
    "invoice.created",
    "invoice.paid",
    "payment.received"
  ],
  "secret": "your-webhook-secret-key",
  "description": "Main webhook for invoice and payment events",
  "active": true,
  "retryPolicy": {
    "maxRetries": 3,
    "retryDelay": 5,
    "backoffMultiplier": 2
  }
}
```

**Required Fields:**
- `url`: HTTPS endpoint to receive webhook notifications
- `events`: Array of event types to subscribe to

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/webhooks/subscribe" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://your-app.com/webhooks/bigledger",
    "events": ["invoice.created", "invoice.paid"],
    "secret": "your-secret-key"
  }'
```

**Response:**

```json
{
  "success": true,
  "data": {
    "id": "webhook_123456789",
    "url": "https://your-app.com/webhooks/bigledger",
    "events": ["invoice.created", "invoice.paid"],
    "secret": "your-secret-key",
    "description": "Main webhook for invoice and payment events",
    "active": true,
    "createdAt": "2024-01-15T10:30:00Z",
    "statistics": {
      "totalDelivered": 0,
      "totalFailed": 0,
      "lastDelivery": null
    }
  }
}
```

### List Webhook Subscriptions

```http
GET /api/v1/webhooks
```

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/webhooks" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Update Webhook Subscription

```http
PUT /api/v1/webhooks/{webhookId}
```

**Request Body:**

```json
{
  "events": [
    "invoice.created",
    "invoice.paid",
    "customer.created"
  ],
  "active": true
}
```

### Delete Webhook Subscription

```http
DELETE /api/v1/webhooks/{webhookId}
```

## Webhook Payload Format

All webhook events follow a consistent payload structure:

```json
{
  "id": "evt_987654321",
  "event": "invoice.paid",
  "timestamp": "2024-01-15T10:30:00Z",
  "livemode": true,
  "api_version": "v1",
  "data": {
    "object": {
      "id": "inv_123456789",
      "invoiceNumber": "INV-2024-0001",
      "customerId": "cust_456789012",
      "total": 2567.50,
      "amountPaid": 2567.50,
      "status": "paid",
      "paidAt": "2024-01-15T10:30:00Z"
    },
    "previous_attributes": {
      "amountPaid": 0.00,
      "status": "sent"
    }
  },
  "context": {
    "companyId": "company_abc123",
    "userId": "user_789",
    "source": "api",
    "ip": "203.0.113.1"
  }
}
```

### Payload Fields

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique event identifier |
| `event` | string | Event type (e.g., "invoice.paid") |
| `timestamp` | string | ISO 8601 timestamp when event occurred |
| `livemode` | boolean | True for production, false for sandbox |
| `api_version` | string | API version used |
| `data.object` | object | Current state of the affected object |
| `data.previous_attributes` | object | Previous values of changed fields |
| `context` | object | Additional context about the event |

## Event Examples

### Invoice Created

```json
{
  "id": "evt_001",
  "event": "invoice.created",
  "timestamp": "2024-01-15T10:30:00Z",
  "data": {
    "object": {
      "id": "inv_123456789",
      "invoiceNumber": "INV-2024-0001",
      "customerId": "cust_456789012",
      "customer": {
        "id": "cust_456789012",
        "name": "Acme Corporation",
        "email": "billing@acme.com"
      },
      "invoiceDate": "2024-01-15",
      "dueDate": "2024-02-14",
      "status": "draft",
      "currency": "MYR",
      "total": 2567.50,
      "amountDue": 2567.50,
      "items": [
        {
          "description": "Professional Services",
          "quantity": 10,
          "unitPrice": 230.00,
          "total": 2300.00
        }
      ],
      "createdAt": "2024-01-15T10:30:00Z"
    }
  }
}
```

### Payment Received

```json
{
  "id": "evt_002",
  "event": "payment.received",
  "timestamp": "2024-01-20T14:45:00Z",
  "data": {
    "object": {
      "id": "pay_789012345",
      "amount": 2567.50,
      "currency": "MYR",
      "paymentDate": "2024-01-20",
      "paymentMethod": "bank_transfer",
      "reference": "TXN-20240120-001",
      "customerId": "cust_456789012",
      "invoiceId": "inv_123456789",
      "status": "completed",
      "bankAccount": {
        "name": "Main Business Account",
        "accountNumber": "***7890"
      },
      "createdAt": "2024-01-20T14:45:00Z"
    }
  }
}
```

### Inventory Low Stock

```json
{
  "id": "evt_003",
  "event": "inventory.low_stock",
  "timestamp": "2024-01-15T16:20:00Z",
  "data": {
    "object": {
      "id": "item_widget001",
      "itemCode": "WDG-001",
      "description": "Premium Widget",
      "currentStock": 15,
      "minimumStock": 20,
      "location": {
        "id": "loc_warehouse1",
        "name": "Main Warehouse"
      },
      "unitCost": 18.50,
      "stockValue": 277.50,
      "lastRestocked": "2024-01-10T09:00:00Z"
    }
  }
}
```

### E-Invoice Accepted

```json
{
  "id": "evt_004",
  "event": "einvoice.accepted",
  "timestamp": "2024-01-15T10:33:00Z",
  "data": {
    "object": {
      "id": "einv_123456789",
      "invoiceId": "inv_123456789",
      "format": "PEPPOL_UBL",
      "status": "accepted",
      "uuid": "01234567-89ab-cdef-0123-456789abcdef",
      "government": {
        "portal": "myinvois",
        "submissionId": "MY-INV-2024-000001",
        "longId": "EI20240115103000001234567890",
        "acceptedAt": "2024-01-15T10:33:00Z"
      },
      "qrCode": "data:image/png;base64,iVBOR...",
      "pdfUrl": "https://files.bigledger.com/einvoice/einv_123456789.pdf"
    }
  }
}
```

## Security

### Signature Verification

All webhook requests include a signature in the `X-Signature` header. Verify the signature to ensure the request is from BigLedger:

```javascript
// Node.js example
const crypto = require('crypto');

function verifyWebhookSignature(payload, signature, secret) {
  const expectedSignature = crypto
    .createHmac('sha256', secret)
    .update(payload, 'utf8')
    .digest('hex');
  
  const receivedSignature = signature.replace('sha256=', '');
  
  return crypto.timingSafeEqual(
    Buffer.from(expectedSignature, 'hex'),
    Buffer.from(receivedSignature, 'hex')
  );
}

// Express middleware example
app.use('/webhooks/bigledger', express.raw({type: 'application/json'}));

app.post('/webhooks/bigledger', (req, res) => {
  const signature = req.headers['x-signature'];
  const payload = req.body;
  
  if (!verifyWebhookSignature(payload, signature, WEBHOOK_SECRET)) {
    return res.status(401).send('Invalid signature');
  }
  
  // Process webhook...
  const event = JSON.parse(payload);
  console.log('Received event:', event.event);
  
  res.status(200).send('OK');
});
```

### Python Example

```python
import hmac
import hashlib
from flask import Flask, request, abort

app = Flask(__name__)

def verify_signature(payload, signature, secret):
    expected_signature = hmac.new(
        secret.encode('utf-8'),
        payload,
        hashlib.sha256
    ).hexdigest()
    
    received_signature = signature.replace('sha256=', '')
    
    return hmac.compare_digest(expected_signature, received_signature)

@app.route('/webhooks/bigledger', methods=['POST'])
def handle_webhook():
    signature = request.headers.get('X-Signature')
    payload = request.get_data()
    
    if not verify_signature(payload, signature, WEBHOOK_SECRET):
        abort(401)
    
    event = request.get_json()
    
    # Process webhook event
    if event['event'] == 'invoice.paid':
        handle_invoice_paid(event['data']['object'])
    elif event['event'] == 'payment.received':
        handle_payment_received(event['data']['object'])
    
    return 'OK', 200
```

### PHP Example

```php
<?php
function verifySignature($payload, $signature, $secret) {
    $expectedSignature = hash_hmac('sha256', $payload, $secret);
    $receivedSignature = str_replace('sha256=', '', $signature);
    
    return hash_equals($expectedSignature, $receivedSignature);
}

$payload = file_get_contents('php://input');
$signature = $_SERVER['HTTP_X_SIGNATURE'] ?? '';

if (!verifySignature($payload, $signature, $webhookSecret)) {
    http_response_code(401);
    exit('Invalid signature');
}

$event = json_decode($payload, true);

switch ($event['event']) {
    case 'invoice.paid':
        handleInvoicePaid($event['data']['object']);
        break;
    case 'payment.received':
        handlePaymentReceived($event['data']['object']);
        break;
}

http_response_code(200);
echo 'OK';
?>
```

## Handling Webhook Events

### Best Practices

1. **Respond Quickly**: Return a 200 status code within 10 seconds
2. **Verify Signatures**: Always verify the webhook signature
3. **Handle Duplicates**: Use the event ID to detect and handle duplicate events
4. **Use HTTPS**: Webhook URLs must use HTTPS
5. **Implement Idempotency**: Handle the same event multiple times safely

### Error Handling

```javascript
// Robust webhook handler with error handling
app.post('/webhooks/bigledger', async (req, res) => {
  try {
    const signature = req.headers['x-signature'];
    const payload = req.body;
    
    // Verify signature
    if (!verifyWebhookSignature(payload, signature, WEBHOOK_SECRET)) {
      return res.status(401).send('Invalid signature');
    }
    
    const event = JSON.parse(payload);
    
    // Check for duplicate events
    const existingEvent = await getEventFromDatabase(event.id);
    if (existingEvent) {
      console.log('Duplicate event received:', event.id);
      return res.status(200).send('Duplicate event processed');
    }
    
    // Store event for duplicate detection
    await storeEventInDatabase(event);
    
    // Process event
    await processWebhookEvent(event);
    
    res.status(200).send('Event processed successfully');
    
  } catch (error) {
    console.error('Webhook processing error:', error);
    
    // Return 200 to prevent retries for application errors
    // Return 500+ for temporary issues that should be retried
    if (error.type === 'temporary') {
      res.status(503).send('Temporary error, please retry');
    } else {
      res.status(200).send('Event processing failed');
    }
  }
});

async function processWebhookEvent(event) {
  switch (event.event) {
    case 'invoice.created':
      await handleInvoiceCreated(event.data.object);
      break;
    case 'invoice.paid':
      await handleInvoicePaid(event.data.object);
      break;
    case 'payment.received':
      await handlePaymentReceived(event.data.object);
      break;
    case 'inventory.low_stock':
      await handleLowStock(event.data.object);
      break;
    default:
      console.log('Unhandled event type:', event.event);
  }
}
```

## Retry Policy

BigLedger automatically retries failed webhook deliveries:

- **Initial Retry**: 5 seconds after failure
- **Subsequent Retries**: Exponential backoff (10s, 20s, 40s)
- **Maximum Retries**: 5 attempts over 24 hours
- **Failure Conditions**: HTTP status codes 4xx or 5xx
- **Success Condition**: HTTP status code 200-299

### Webhook Statistics

Monitor webhook delivery statistics:

```http
GET /api/v1/webhooks/{webhookId}/statistics
```

**Response:**

```json
{
  "success": true,
  "data": {
    "totalDelivered": 1234,
    "totalFailed": 12,
    "successRate": 99.03,
    "lastDelivery": "2024-01-15T10:30:00Z",
    "averageResponseTime": 245,
    "recentDeliveries": [
      {
        "eventId": "evt_123",
        "event": "invoice.paid",
        "deliveredAt": "2024-01-15T10:30:00Z",
        "responseCode": 200,
        "responseTime": 156
      }
    ]
  }
}
```

## Testing Webhooks

### Using ngrok for Local Development

```bash
# Install ngrok
npm install -g ngrok

# Start your local server
node server.js

# In another terminal, create tunnel
ngrok http 3000

# Use the HTTPS URL for webhook subscription
curl -X POST "https://api.bigledger.com/v1/webhooks/subscribe" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://abc123.ngrok.io/webhooks/bigledger",
    "events": ["invoice.created"]
  }'
```

### Webhook Testing Endpoint

Use our webhook testing endpoint to send test events:

```http
POST /api/v1/webhooks/{webhookId}/test
```

**Request Body:**

```json
{
  "event": "invoice.created",
  "testData": {
    "invoiceId": "inv_test_123",
    "customerId": "cust_test_456"
  }
}
```

## Event Filtering

Create targeted webhook subscriptions for specific conditions:

### Filter by Customer

```json
{
  "url": "https://your-app.com/webhooks/vip-customers",
  "events": ["invoice.created", "payment.received"],
  "filters": {
    "customer.tags": ["vip", "enterprise"],
    "invoice.total": {"min": 1000.00}
  }
}
```

### Filter by Amount

```json
{
  "url": "https://your-app.com/webhooks/large-payments",
  "events": ["payment.received"],
  "filters": {
    "payment.amount": {"min": 5000.00}
  }
}
```

### Filter by Product

```json
{
  "url": "https://your-app.com/webhooks/software-sales",
  "events": ["invoice.created"],
  "filters": {
    "invoice.items.category": ["software", "licenses"]
  }
}
```

## Webhook Logs

View detailed logs of webhook deliveries:

```http
GET /api/v1/webhooks/{webhookId}/logs
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `event` | string | Filter by event type |
| `status` | string | Filter by delivery status (success, failed, pending) |
| `dateFrom` | string | Start date for logs |
| `dateTo` | string | End date for logs |
| `limit` | integer | Number of log entries |

**Response:**

```json
{
  "success": true,
  "data": [
    {
      "id": "log_123456789",
      "eventId": "evt_987654321",
      "event": "invoice.paid",
      "deliveredAt": "2024-01-15T10:30:00Z",
      "responseCode": 200,
      "responseTime": 234,
      "responseBody": "Event processed successfully",
      "retryCount": 0,
      "status": "success"
    },
    {
      "id": "log_123456790",
      "eventId": "evt_987654322",
      "event": "payment.received",
      "deliveredAt": "2024-01-15T10:32:00Z",
      "responseCode": 500,
      "responseTime": 5000,
      "responseBody": "Internal server error",
      "retryCount": 2,
      "status": "failed",
      "nextRetryAt": "2024-01-15T10:42:00Z"
    }
  ]
}
```

## Advanced Webhook Features

### Webhook Event Batching

For high-volume environments, enable event batching to receive multiple events in a single request:

```json
{
  "url": "https://your-app.com/webhooks/batch",
  "events": ["invoice.created", "payment.received"],
  "batchSettings": {
    "enabled": true,
    "maxEvents": 100,
    "maxWaitTime": 30,
    "flushOnEvent": ["invoice.paid"]
  }
}
```

**Batch Payload:**
```json
{
  "batch": true,
  "events": [
    {
      "id": "evt_001",
      "event": "invoice.created",
      "timestamp": "2024-01-15T10:30:00Z",
      "data": {...}
    },
    {
      "id": "evt_002", 
      "event": "payment.received",
      "timestamp": "2024-01-15T10:31:00Z",
      "data": {...}
    }
  ],
  "batchId": "batch_123456789",
  "batchTimestamp": "2024-01-15T10:31:30Z"
}
```

### Webhook Transformations

Customize webhook payloads to match your application's data format:

```json
{
  "url": "https://your-app.com/webhooks/custom",
  "events": ["invoice.created"],
  "transform": {
    "template": {
      "id": "{{data.object.id}}",
      "invoice_number": "{{data.object.invoiceNumber}}",
      "customer_name": "{{data.object.customer.name}}",
      "amount": "{{data.object.total}}",
      "currency": "{{data.object.currency}}",
      "custom_field": "Invoice Created"
    },
    "contentType": "application/json"
  }
}
```

### Conditional Webhooks

Create webhooks that only fire when specific conditions are met:

```json
{
  "url": "https://your-app.com/webhooks/conditional",
  "events": ["invoice.created"],
  "conditions": [
    {
      "field": "data.object.total",
      "operator": "gt",
      "value": 1000.00
    },
    {
      "field": "data.object.customer.tags",
      "operator": "contains",
      "value": "vip"
    }
  ],
  "conditionLogic": "AND"
}
```

## Integration Examples

### Complete E-commerce Integration

```javascript
// Handle order fulfillment workflow
async function handleOrderWebhooks(event) {
  switch (event.event) {
    case 'sales_order.created':
      await notifyWarehouse(event.data.object);
      await updateInventorySystem(event.data.object.items);
      break;
      
    case 'sales_order.shipped':
      await sendShippingNotification(event.data.object);
      await updateTrackingInfo(event.data.object);
      break;
      
    case 'invoice.paid':
      await releaseShipment(event.data.object.salesOrderId);
      await updateCRMStatus(event.data.object.customerId, 'paid');
      break;
      
    case 'inventory.low_stock':
      await createPurchaseOrder(event.data.object);
      await notifyBuyer(event.data.object);
      break;
  }
}
```

### Financial Reporting Automation

```javascript
// Automate financial reporting
async function handleFinancialWebhooks(event) {
  const { event: eventType, data } = event;
  
  if (eventType === 'invoice.paid') {
    // Update cash flow forecasting
    await updateCashFlowForecast(data.object);
    
    // Check for milestone achievements
    await checkRevenueTargets(data.object);
  }
  
  if (eventType === 'bill.paid') {
    // Update expense tracking
    await updateExpenseAnalysis(data.object);
    
    // Check budget compliance
    await validateBudgetCompliance(data.object);
  }
  
  if (eventType === 'report.generated') {
    // Automatically distribute reports
    await distributeFinancialReports(data.object);
  }
}
```

Webhooks provide the foundation for building real-time, event-driven integrations with BigLedger, enabling sophisticated automation and seamless data synchronization across your entire business ecosystem.