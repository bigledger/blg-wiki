---
description: Complete customer relationship management and sales operations including
  customers, contacts, sales orders, quotes, and invoicing.
tags:
- user-guide
title: Sales & CRM APIs
weight: 30
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Complete customer relationship management and sales operations including customers, contacts, sales orders, quotes, and invoicing.

## Base URL

```
https://api.bigledger.com/v1
```

## Authentication

All requests require authentication:

```http
Authorization: Bearer YOUR_API_KEY
X-Company-Id: YOUR_COMPANY_ID
```

## Customers API

Manage customer records, contact information, and billing details.

### Customer Object

```json
{
  "id": "cust_123456789",
  "customerNumber": "CUST-0001",
  "name": "Acme Corporation",
  "type": "business",
  "email": "billing@acme.com",
  "phone": "+60123456789",
  "website": "https://acme.com",
  "taxNumber": "123456789012",
  "address": {
    "street": "123 Main Street",
    "street2": "Suite 100",
    "city": "Kuala Lumpur",
    "state": "Selangor",
    "postalCode": "50000",
    "country": "MY"
  },
  "billingAddress": {
    "street": "123 Main Street",
    "city": "Kuala Lumpur",
    "state": "Selangor",
    "postalCode": "50000",
    "country": "MY"
  },
  "shippingAddress": {
    "street": "456 Warehouse Road",
    "city": "Shah Alam",
    "state": "Selangor",
    "postalCode": "40000",
    "country": "MY"
  },
  "currency": "MYR",
  "paymentTerms": 30,
  "creditLimit": 50000.00,
  "currentBalance": 12500.00,
  "totalSales": 125000.00,
  "lastSaleDate": "2024-01-10",
  "status": "active",
  "tags": ["enterprise", "retail"],
  "customFields": {
    "industry": "Technology",
    "accountManager": "John Smith"
  },
  "contacts": [
    {
      "id": "contact_456",
      "name": "Jane Doe",
      "email": "jane@acme.com",
      "phone": "+60123456788",
      "title": "Accounts Manager",
      "isPrimary": true
    }
  ],
  "createdAt": "2024-01-01T00:00:00Z",
  "updatedAt": "2024-01-15T10:30:00Z"
}
```

### List Customers

Retrieve all customers with filtering and pagination.

```http
GET /api/v1/customers
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `search` | string | Search by name, email, or customer number |
| `status` | string | Filter by status (`active`, `inactive`, `blocked`) |
| `type` | string | Filter by type (`individual`, `business`) |
| `tags` | string | Filter by tags (comma-separated) |
| `currency` | string | Filter by currency |
| `creditLimitMin` | number | Minimum credit limit |
| `creditLimitMax` | number | Maximum credit limit |
| `balanceMin` | number | Minimum current balance |
| `balanceMax` | number | Maximum current balance |
| `createdAfter` | string | Created after date (ISO 8601) |
| `createdBefore` | string | Created before date (ISO 8601) |
| `sort` | string | Sort by field (`name`, `createdAt`, `totalSales`, `currentBalance`) |
| `order` | string | Sort order (`asc`, `desc`) |
| `limit` | integer | Number of records per page (default: 50, max: 100) |
| `cursor` | string | Pagination cursor |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/customers?status=active&sort=totalSales&order=desc&limit=20" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

**Response:**

```json
{
  "success": true,
  "data": [
    {
      "id": "cust_123456789",
      "customerNumber": "CUST-0001",
      "name": "Acme Corporation",
      "email": "billing@acme.com",
      "phone": "+60123456789",
      "currentBalance": 12500.00,
      "totalSales": 125000.00,
      "status": "active",
      "createdAt": "2024-01-01T00:00:00Z"
    }
  ],
  "pagination": {
    "hasMore": true,
    "nextCursor": "eyJpZCI6MTIzfQ",
    "limit": 20,
    "total": 156
  }
}
```

### Get Customer

Retrieve a specific customer by ID.

```http
GET /api/v1/customers/{customerId}
```

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/customers/cust_123456789" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Create Customer

Create a new customer record.

```http
POST /api/v1/customers
```

**Request Body:**

```json
{
  "name": "New Customer Ltd",
  "type": "business",
  "email": "contact@newcustomer.com",
  "phone": "+60123456789",
  "website": "https://newcustomer.com",
  "taxNumber": "987654321098",
  "address": {
    "street": "789 Business Ave",
    "city": "Petaling Jaya",
    "state": "Selangor",
    "postalCode": "46000",
    "country": "MY"
  },
  "currency": "MYR",
  "paymentTerms": 30,
  "creditLimit": 25000.00,
  "tags": ["new", "small-business"],
  "customFields": {
    "industry": "Manufacturing",
    "referralSource": "Website"
  }
}
```

**Required Fields:**
- `name`: Customer name
- `email` or `phone`: At least one contact method

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/customers" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "New Customer Ltd",
    "email": "contact@newcustomer.com",
    "phone": "+60123456789",
    "type": "business",
    "paymentTerms": 30
  }'
```

### Update Customer

Update an existing customer.

```http
PUT /api/v1/customers/{customerId}
```

**Request Body:**

```json
{
  "email": "newemail@acme.com",
  "phone": "+60987654321",
  "creditLimit": 75000.00,
  "status": "active",
  "tags": ["enterprise", "priority"]
}
```

### Delete Customer

Delete a customer (only if no transactions exist).

```http
DELETE /api/v1/customers/{customerId}
```

## Contacts API

Manage individual contacts within customer accounts.

### Contact Object

```json
{
  "id": "contact_789",
  "customerId": "cust_123456789",
  "name": "John Smith",
  "email": "john@acme.com",
  "phone": "+60123456787",
  "mobile": "+60198765432",
  "title": "Purchasing Manager",
  "department": "Procurement",
  "isPrimary": false,
  "isActive": true,
  "notes": "Prefers email communication",
  "createdAt": "2024-01-05T00:00:00Z",
  "updatedAt": "2024-01-15T10:30:00Z"
}
```

### List Contacts

```http
GET /api/v1/customers/{customerId}/contacts
```

### Create Contact

```http
POST /api/v1/customers/{customerId}/contacts
```

**Request Body:**

```json
{
  "name": "Sarah Johnson",
  "email": "sarah@acme.com",
  "phone": "+60123456786",
  "title": "Finance Director",
  "isPrimary": false
}
```

## Sales Orders API

Manage sales orders from quote to delivery.

### Sales Order Object

```json
{
  "id": "so_987654321",
  "orderNumber": "SO-2024-0001",
  "customerId": "cust_123456789",
  "customer": {
    "id": "cust_123456789",
    "name": "Acme Corporation",
    "email": "billing@acme.com"
  },
  "orderDate": "2024-01-15",
  "requiredDate": "2024-02-15",
  "promisedDate": "2024-02-10",
  "status": "confirmed",
  "priority": "normal",
  "currency": "MYR",
  "exchangeRate": 1.0,
  "reference": "PO-ABC-123",
  "notes": "Rush order for new product launch",
  "terms": "Payment due 30 days from delivery",
  "billingAddress": {
    "street": "123 Main Street",
    "city": "Kuala Lumpur",
    "state": "Selangor",
    "postalCode": "50000",
    "country": "MY"
  },
  "shippingAddress": {
    "street": "456 Warehouse Road",
    "city": "Shah Alam",
    "state": "Selangor",
    "postalCode": "40000",
    "country": "MY"
  },
  "items": [
    {
      "id": "soi_111",
      "itemId": "item_widget001",
      "itemCode": "WDG-001",
      "description": "Premium Widget",
      "quantity": 100,
      "unitPrice": 25.00,
      "discountPercent": 5.0,
      "discountAmount": 125.00,
      "lineTotal": 2375.00,
      "taxCode": "SST",
      "taxRate": 6.0,
      "taxAmount": 142.50,
      "notes": "Customer specific packaging required"
    }
  ],
  "subtotal": 2375.00,
  "totalDiscount": 125.00,
  "totalTax": 142.50,
  "shippingCost": 50.00,
  "total": 2567.50,
  "fulfillment": {
    "status": "pending",
    "shippedQuantity": 0,
    "remainingQuantity": 100,
    "shippingMethod": "standard",
    "trackingNumber": null,
    "estimatedDelivery": "2024-02-12"
  },
  "attachments": [
    {
      "id": "att_123",
      "filename": "customer_po.pdf",
      "url": "https://files.bigledger.com/att_123"
    }
  ],
  "createdBy": "user_456",
  "createdAt": "2024-01-15T10:30:00Z",
  "updatedAt": "2024-01-15T15:45:00Z"
}
```

### List Sales Orders

```http
GET /api/v1/sales-orders
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `customerId` | string | Filter by customer |
| `status` | string | Filter by status (`draft`, `confirmed`, `shipped`, `delivered`, `cancelled`) |
| `priority` | string | Filter by priority (`low`, `normal`, `high`, `urgent`) |
| `orderDateFrom` | string | Orders from date (YYYY-MM-DD) |
| `orderDateTo` | string | Orders to date (YYYY-MM-DD) |
| `requiredDateFrom` | string | Required from date |
| `requiredDateTo` | string | Required to date |
| `search` | string | Search order number, reference, or customer name |
| `sort` | string | Sort field |
| `order` | string | Sort order |
| `limit` | integer | Page size |
| `cursor` | string | Pagination cursor |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/sales-orders?status=confirmed&orderDateFrom=2024-01-01" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Create Sales Order

```http
POST /api/v1/sales-orders
```

**Request Body:**

```json
{
  "customerId": "cust_123456789",
  "orderDate": "2024-01-15",
  "requiredDate": "2024-02-15",
  "reference": "PO-XYZ-456",
  "notes": "Standard delivery",
  "items": [
    {
      "itemId": "item_widget001",
      "quantity": 50,
      "unitPrice": 25.00,
      "discountPercent": 0,
      "taxCode": "SST"
    },
    {
      "itemId": "item_service001",
      "description": "Installation Service",
      "quantity": 1,
      "unitPrice": 500.00,
      "taxCode": "SST"
    }
  ],
  "shippingCost": 75.00
}
```

### Update Sales Order Status

```http
PATCH /api/v1/sales-orders/{salesOrderId}/status
```

**Request Body:**

```json
{
  "status": "confirmed",
  "notes": "Order confirmed by customer"
}
```

### Convert Sales Order to Invoice

```http
POST /api/v1/sales-orders/{salesOrderId}/convert-to-invoice
```

**Request Body:**

```json
{
  "invoiceDate": "2024-01-16",
  "dueDate": "2024-02-15",
  "partialItems": [
    {
      "itemId": "soi_111",
      "quantity": 25
    }
  ]
}
```

## Quotes API

Create and manage sales quotes and proposals.

### Quote Object

```json
{
  "id": "quote_555666777",
  "quoteNumber": "QT-2024-0001",
  "customerId": "cust_123456789",
  "customer": {
    "id": "cust_123456789",
    "name": "Acme Corporation",
    "email": "billing@acme.com"
  },
  "quoteDate": "2024-01-10",
  "validUntil": "2024-02-10",
  "status": "sent",
  "currency": "MYR",
  "reference": "RFQ-2024-001",
  "title": "Q1 2024 Widget Supply",
  "description": "Quarterly widget supply quote as requested",
  "terms": "Prices valid for 30 days. Payment terms: Net 30.",
  "items": [
    {
      "id": "qi_111",
      "itemId": "item_widget001",
      "description": "Premium Widget - Bulk Order",
      "quantity": 1000,
      "unitPrice": 22.50,
      "discountPercent": 10.0,
      "discountAmount": 2250.00,
      "lineTotal": 20250.00,
      "taxCode": "SST",
      "taxRate": 6.0,
      "taxAmount": 1215.00
    }
  ],
  "subtotal": 20250.00,
  "totalDiscount": 2250.00,
  "totalTax": 1215.00,
  "total": 21465.00,
  "acceptedAt": null,
  "acceptedBy": null,
  "convertedToOrderAt": null,
  "salesOrderId": null,
  "attachments": [],
  "createdAt": "2024-01-10T09:00:00Z",
  "updatedAt": "2024-01-10T14:30:00Z"
}
```

### List Quotes

```http
GET /api/v1/quotes
```

### Create Quote

```http
POST /api/v1/quotes
```

**Request Body:**

```json
{
  "customerId": "cust_123456789",
  "quoteDate": "2024-01-10",
  "validUntil": "2024-02-10",
  "title": "Q1 2024 Widget Supply",
  "reference": "RFQ-2024-001",
  "items": [
    {
      "itemId": "item_widget001",
      "quantity": 1000,
      "unitPrice": 22.50,
      "discountPercent": 10.0,
      "taxCode": "SST"
    }
  ]
}
```

### Send Quote

```http
POST /api/v1/quotes/{quoteId}/send
```

**Request Body:**

```json
{
  "to": ["billing@acme.com"],
  "cc": ["manager@acme.com"],
  "subject": "Quote QT-2024-0001 - Q1 2024 Widget Supply",
  "message": "Please find attached our quote for your widget requirements.",
  "attachPDF": true
}
```

### Accept Quote

```http
POST /api/v1/quotes/{quoteId}/accept
```

### Convert Quote to Sales Order

```http
POST /api/v1/quotes/{quoteId}/convert-to-order
```

## Invoices API

Create and manage sales invoices.

### Invoice Object

```json
{
  "id": "inv_888999000",
  "invoiceNumber": "INV-2024-0001",
  "customerId": "cust_123456789",
  "customer": {
    "id": "cust_123456789",
    "name": "Acme Corporation",
    "email": "billing@acme.com"
  },
  "invoiceDate": "2024-01-15",
  "dueDate": "2024-02-14",
  "status": "sent",
  "currency": "MYR",
  "exchangeRate": 1.0,
  "reference": "SO-2024-0001",
  "purchaseOrder": "PO-ABC-123",
  "notes": "Thank you for your business!",
  "terms": "Payment due within 30 days",
  "items": [
    {
      "id": "invli_111",
      "itemId": "item_widget001",
      "itemCode": "WDG-001",
      "description": "Premium Widget",
      "quantity": 100,
      "unitPrice": 25.00,
      "discountPercent": 5.0,
      "discountAmount": 125.00,
      "lineTotal": 2375.00,
      "taxCode": "SST",
      "taxRate": 6.0,
      "taxAmount": 142.50
    }
  ],
  "subtotal": 2375.00,
  "totalDiscount": 125.00,
  "totalTax": 142.50,
  "shippingCost": 50.00,
  "total": 2567.50,
  "amountPaid": 0.00,
  "amountDue": 2567.50,
  "paymentStatus": "unpaid",
  "lastPaymentDate": null,
  "overdueBy": 0,
  "billingAddress": {
    "street": "123 Main Street",
    "city": "Kuala Lumpur",
    "state": "Selangor",
    "postalCode": "50000",
    "country": "MY"
  },
  "attachments": [],
  "einvoice": {
    "status": "pending",
    "submittedAt": null,
    "acceptedAt": null,
    "uuid": null,
    "validationHash": null
  },
  "createdAt": "2024-01-15T10:30:00Z",
  "updatedAt": "2024-01-15T15:45:00Z"
}
```

### List Invoices

```http
GET /api/v1/invoices
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `customerId` | string | Filter by customer |
| `status` | string | Filter by status (`draft`, `sent`, `paid`, `overdue`, `cancelled`) |
| `paymentStatus` | string | Filter by payment status (`unpaid`, `partial`, `paid`) |
| `invoiceDateFrom` | string | Invoice date from (YYYY-MM-DD) |
| `invoiceDateTo` | string | Invoice date to (YYYY-MM-DD) |
| `dueDateFrom` | string | Due date from |
| `dueDateTo` | string | Due date to |
| `overdue` | boolean | Filter overdue invoices |
| `search` | string | Search by invoice number or reference |
| `totalMin` | number | Minimum total amount |
| `totalMax` | number | Maximum total amount |

### Create Invoice

```http
POST /api/v1/invoices
```

**Request Body:**

```json
{
  "customerId": "cust_123456789",
  "invoiceDate": "2024-01-15",
  "dueDate": "2024-02-14",
  "reference": "SO-2024-0001",
  "purchaseOrder": "PO-ABC-123",
  "items": [
    {
      "itemId": "item_widget001",
      "quantity": 100,
      "unitPrice": 25.00,
      "discountPercent": 5.0,
      "taxCode": "SST"
    }
  ],
  "notes": "Thank you for your business!",
  "terms": "Payment due within 30 days"
}
```

### Send Invoice

```http
POST /api/v1/invoices/{invoiceId}/send
```

**Request Body:**

```json
{
  "to": ["billing@acme.com"],
  "cc": ["accounts@acme.com"],
  "subject": "Invoice INV-2024-0001",
  "message": "Please find attached your invoice.",
  "attachPDF": true,
  "sendReminders": true
}
```

### Record Payment

```http
POST /api/v1/invoices/{invoiceId}/payments
```

**Request Body:**

```json
{
  "amount": 2567.50,
  "paymentDate": "2024-01-20",
  "paymentMethod": "bank_transfer",
  "reference": "TXN-20240120-001",
  "notes": "Online banking transfer",
  "accountId": "acc_bank_main"
}
```

## Customer Analytics API

Get customer insights and analytics.

### Customer Summary

```http
GET /api/v1/customers/{customerId}/summary
```

**Response:**

```json
{
  "success": true,
  "data": {
    "customerId": "cust_123456789",
    "summary": {
      "totalSales": 125000.00,
      "totalInvoices": 45,
      "averageOrderValue": 2777.78,
      "currentBalance": 12500.00,
      "creditUtilization": 25.0,
      "paymentHistory": {
        "onTimePayments": 40,
        "latePayments": 3,
        "averagePaymentDays": 28
      },
      "lastOrderDate": "2024-01-10",
      "daysSinceLastOrder": 5,
      "orderFrequency": "monthly"
    },
    "trends": {
      "salesGrowth": 15.5,
      "orderVolumeGrowth": 8.2,
      "paymentDaysImprovement": -2.1
    },
    "topProducts": [
      {
        "itemId": "item_widget001",
        "itemCode": "WDG-001",
        "description": "Premium Widget",
        "quantityOrdered": 2500,
        "totalValue": 62500.00
      }
    ]
  }
}
```

### Sales Funnel Analytics

```http
GET /api/v1/analytics/sales-funnel
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `dateFrom` | string | Start date for analysis |
| `dateTo` | string | End date for analysis |
| `customerId` | string | Filter by specific customer |

## Error Handling

### 400 Bad Request - Invalid Customer Data

```json
{
  "success": false,
  "error": {
    "code": "INVALID_CUSTOMER_DATA",
    "message": "Customer validation failed",
    "details": [
      {
        "field": "email",
        "message": "Email format is invalid"
      },
      {
        "field": "paymentTerms",
        "message": "Payment terms must be between 0 and 365 days"
      }
    ]
  }
}
```

### 404 Not Found - Customer Not Found

```json
{
  "success": false,
  "error": {
    "code": "CUSTOMER_NOT_FOUND",
    "message": "Customer with ID 'cust_invalid' not found"
  }
}
```

### 422 Unprocessable Entity - Cannot Convert Quote

```json
{
  "success": false,
  "error": {
    "code": "QUOTE_CONVERSION_FAILED",
    "message": "Cannot convert expired quote to sales order",
    "details": [
      {
        "quoteId": "quote_555666777",
        "validUntil": "2024-01-05",
        "currentDate": "2024-01-15"
      }
    ]
  }
}
```

## Code Examples

### Complete Sales Process

```javascript
// Complete sales process from quote to payment
async function completeSalesProcess() {
  const client = new BigLedgerClient({ /* config */ });
  
  // 1. Create customer
  const customer = await client.customers.create({
    name: "Tech Solutions Ltd",
    email: "billing@techsolutions.com",
    phone: "+60123456789",
    paymentTerms: 30,
    creditLimit: 50000.00
  });
  
  // 2. Create quote
  const quote = await client.quotes.create({
    customerId: customer.id,
    quoteDate: "2024-01-10",
    validUntil: "2024-02-10",
    title: "Q1 Software Licenses",
    items: [
      {
        description: "Enterprise Software License",
        quantity: 10,
        unitPrice: 1000.00,
        discountPercent: 15.0,
        taxCode: "SST"
      }
    ]
  });
  
  // 3. Send quote to customer
  await client.quotes.send(quote.id, {
    to: [customer.email],
    subject: `Quote ${quote.quoteNumber} - Q1 Software Licenses`,
    message: "Please review the attached quote for your software requirements."
  });
  
  // 4. Accept quote (simulate customer acceptance)
  await client.quotes.accept(quote.id);
  
  // 5. Convert to sales order
  const salesOrder = await client.quotes.convertToOrder(quote.id);
  
  // 6. Convert to invoice
  const invoice = await client.salesOrders.convertToInvoice(salesOrder.id, {
    invoiceDate: "2024-01-15",
    dueDate: "2024-02-14"
  });
  
  // 7. Send invoice
  await client.invoices.send(invoice.id, {
    to: [customer.email],
    subject: `Invoice ${invoice.invoiceNumber}`,
    message: "Thank you for your order. Please find your invoice attached."
  });
  
  // 8. Record payment (when received)
  const payment = await client.invoices.recordPayment(invoice.id, {
    amount: invoice.total,
    paymentDate: "2024-01-20",
    paymentMethod: "bank_transfer",
    reference: "TXN-20240120-001"
  });
  
  return {
    customer,
    quote,
    salesOrder,
    invoice,
    payment
  };
}
```

### Customer Analysis Dashboard

```python
# Generate customer analysis for dashboard
async def generate_customer_dashboard(customer_id, year=2024):
    client = BigLedgerClient(api_key="...", company_id="...")
    
    # Get customer summary
    summary = await client.get(f"/customers/{customer_id}/summary")
    
    # Get monthly sales trend
    monthly_sales = []
    for month in range(1, 13):
        start_date = f"{year}-{month:02d}-01"
        end_date = f"{year}-{month:02d}-31"
        
        invoices = await client.get(f"/invoices", params={
            'customerId': customer_id,
            'invoiceDateFrom': start_date,
            'invoiceDateTo': end_date,
            'status': 'paid'
        })
        
        monthly_total = sum(inv['total'] for inv in invoices['data'])
        monthly_sales.append({
            'month': month,
            'total': monthly_total,
            'count': len(invoices['data'])
        })
    
    # Get payment behavior analysis
    payment_analysis = await analyze_payment_behavior(client, customer_id, year)
    
    # Get product preferences
    product_analysis = await analyze_product_preferences(client, customer_id, year)
    
    return {
        'summary': summary['data'],
        'monthly_sales': monthly_sales,
        'payment_analysis': payment_analysis,
        'product_analysis': product_analysis
    }
```

The Sales & CRM APIs provide comprehensive customer relationship management and sales process automation, from initial quotes through to final payment collection.