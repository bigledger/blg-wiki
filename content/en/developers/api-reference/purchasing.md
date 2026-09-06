---
description: Comprehensive purchasing API documentation for suppliers, purchase orders, bills, and procurement workflows.
tags:
- api-reference
- purchasing
- procurement
- suppliers
title: Purchasing APIs
weight: 60
---

Complete API reference for BigLedger's purchasing and procurement module. Manage suppliers, purchase orders, bills, and streamline your procurement workflows.

{{< callout type="info" >}}
**Module Integration**: The Purchasing APIs integrate with Inventory and Accounting. Approvals are an optional feature of the Purchase Requisition and Purchase Order applets, configured in their own Settings — see [Document Approvals](/guides/document-approvals/).
{{< /callout >}}

## Base Endpoints

All purchasing endpoints are available under:
```
https://api.bigledger.com/v1/purchasing
```

## Suppliers API

Manage your supplier database and vendor relationships.

### List Suppliers

```http
GET /v1/suppliers
```

**Query Parameters:**
- `limit` (integer): Number of records to return (max 100, default 20)
- `offset` (integer): Number of records to skip
- `search` (string): Search by supplier name, email, or tax number
- `status` (string): Filter by status (`active`, `inactive`, `suspended`)
- `country` (string): Filter by country code
- `sort` (string): Sort by field (`name:asc`, `createdAt:desc`)

**Example Request:**
```bash
curl -X GET "https://api.bigledger.com/v1/suppliers?limit=20&status=active&sort=name:asc" \
  -H "Authorization: Bearer blg_live_sk_..." \
  -H "X-Company-Id: company_abc123"
```

**Example Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": "supp_123abc456",
      "supplierNumber": "SUPP-0001",
      "name": "Acme Supplies Ltd",
      "displayName": "Acme Supplies",
      "email": "billing@acmesupplies.com",
      "phone": "+60123456789",
      "website": "https://acmesupplies.com",
      "taxNumber": "123456789012",
      "registrationNumber": "201901234567",
      "address": {
        "street": "123 Industrial Park",
        "city": "Kuala Lumpur",
        "state": "Selangor",
        "postalCode": "50000",
        "country": "MY"
      },
      "paymentTerms": {
        "termsDays": 30,
        "discountDays": 10,
        "discountPercent": 2.0
      },
      "creditLimit": 50000.00,
      "currentBalance": 12500.00,
      "currency": "MYR",
      "status": "active",
      "tags": ["office-supplies", "preferred"],
      "createdAt": "2024-01-01T00:00:00Z",
      "updatedAt": "2024-01-15T10:30:00Z"
    }
  ],
  "pagination": {
    "hasMore": true,
    "nextOffset": 20,
    "total": 156,
    "limit": 20
  }
}
```

### Create Supplier

```http
POST /v1/suppliers
```

**Request Body:**
```json
{
  "name": "New Supplier Ltd",
  "displayName": "New Supplier",
  "email": "contact@newsupplier.com",
  "phone": "+60123456789",
  "website": "https://newsupplier.com",
  "taxNumber": "987654321012",
  "registrationNumber": "201987654321",
  "address": {
    "street": "456 Business Avenue",
    "city": "Petaling Jaya",
    "state": "Selangor",
    "postalCode": "47301",
    "country": "MY"
  },
  "paymentTerms": {
    "termsDays": 45,
    "discountDays": 14,
    "discountPercent": 1.5
  },
  "creditLimit": 25000.00,
  "currency": "MYR",
  "status": "active",
  "tags": ["electronics", "wholesale"],
  "contactPerson": {
    "name": "John Doe",
    "email": "john@newsupplier.com",
    "phone": "+60123456790",
    "position": "Sales Manager"
  },
  "bankDetails": {
    "accountName": "New Supplier Ltd",
    "accountNumber": "1234567890",
    "bankName": "Maybank",
    "bankCode": "MBBEMYKL",
    "swiftCode": "MBBEMYKL"
  }
}
```

<!-- TODO: Add complete supplier management endpoints -->
<!-- TODO: Add supplier performance tracking -->
<!-- TODO: Add supplier approval workflows -->

## Purchase Orders API

Create and manage purchase orders throughout the procurement lifecycle.

### List Purchase Orders

```http
GET /v1/purchase-orders
```

**Query Parameters:**
- `status` (string): Filter by status (`draft`, `sent`, `confirmed`, `partially_received`, `received`, `cancelled`)
- `supplierId` (string): Filter by supplier ID
- `fromDate` (string): Filter orders from date (YYYY-MM-DD)
- `toDate` (string): Filter orders to date (YYYY-MM-DD)
- `totalMin` (number): Minimum order total
- `totalMax` (number): Maximum order total

**Example Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": "po_789xyz123",
      "poNumber": "PO-2024-0001",
      "supplierId": "supp_123abc456",
      "supplier": {
        "id": "supp_123abc456",
        "name": "Acme Supplies Ltd",
        "email": "billing@acmesupplies.com"
      },
      "orderDate": "2024-01-15",
      "requiredDate": "2024-01-30",
      "status": "sent",
      "currency": "MYR",
      "exchangeRate": 1.0,
      "subtotal": 5000.00,
      "taxTotal": 300.00,
      "discountTotal": 0.00,
      "total": 5300.00,
      "items": [
        {
          "id": "poli_456def789",
          "itemId": "item_123abc456",
          "itemCode": "OFF-001",
          "description": "Office Chair - Executive",
          "quantity": 10,
          "unitPrice": 500.00,
          "lineTotal": 5000.00,
          "taxCode": "SST",
          "taxRate": 6.0,
          "taxAmount": 300.00,
          "receivedQuantity": 0,
          "expectedDate": "2024-01-25"
        }
      ],
      "deliveryAddress": {
        "contactName": "Warehouse Manager",
        "phone": "+60123456789",
        "street": "789 Warehouse District",
        "city": "Shah Alam",
        "state": "Selangor",
        "postalCode": "40000",
        "country": "MY"
      },
      "terms": "NET 30 days",
      "notes": "Please deliver during business hours",
      "createdBy": "user_123abc456",
      "approvedBy": "user_789xyz123",
      "approvedAt": "2024-01-15T14:30:00Z",
      "sentAt": "2024-01-15T15:00:00Z",
      "createdAt": "2024-01-15T10:00:00Z",
      "updatedAt": "2024-01-15T15:00:00Z"
    }
  ]
}
```

### Create Purchase Order

```http
POST /v1/purchase-orders
```

**Request Body:**
```json
{
  "supplierId": "supp_123abc456",
  "orderDate": "2024-01-15",
  "requiredDate": "2024-01-30",
  "reference": "REQ-2024-001",
  "items": [
    {
      "itemId": "item_123abc456",
      "description": "Office Chair - Executive",
      "quantity": 10,
      "unitPrice": 500.00,
      "taxCode": "SST",
      "expectedDate": "2024-01-25",
      "notes": "Blue color preferred"
    }
  ],
  "deliveryAddress": {
    "contactName": "Warehouse Manager",
    "phone": "+60123456789",
    "street": "789 Warehouse District",
    "city": "Shah Alam",
    "state": "Selangor",
    "postalCode": "40000",
    "country": "MY"
  },
  "terms": "NET 30 days",
  "notes": "Please deliver during business hours",
  "requiresApproval": true
}
```

<!-- TODO: Add PO approval workflow endpoints -->
<!-- TODO: Add PO receiving/goods receipt endpoints -->
<!-- TODO: Add PO amendment and cancellation -->

## Bills API

Manage supplier bills and accounts payable.

### List Bills

```http
GET /v1/bills
```

**Query Parameters:**
- `status` (string): Filter by status (`draft`, `open`, `paid`, `overdue`, `partially_paid`)
- `supplierId` (string): Filter by supplier ID
- `fromDate` (string): Filter bills from date (YYYY-MM-DD)
- `toDate` (string): Filter bills to date (YYYY-MM-DD)
- `dueFromDate` (string): Filter by due date from
- `dueToDate` (string): Filter by due date to

**Example Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": "bill_456def789",
      "billNumber": "BILL-2024-0001",
      "supplierInvoiceNumber": "SI-2024-001",
      "supplierId": "supp_123abc456",
      "supplier": {
        "id": "supp_123abc456",
        "name": "Acme Supplies Ltd",
        "email": "billing@acmesupplies.com"
      },
      "purchaseOrderId": "po_789xyz123",
      "billDate": "2024-01-20",
      "dueDate": "2024-02-19",
      "status": "open",
      "currency": "MYR",
      "subtotal": 5000.00,
      "taxTotal": 300.00,
      "total": 5300.00,
      "paidAmount": 0.00,
      "balanceDue": 5300.00,
      "items": [
        {
          "id": "bili_123abc456",
          "itemId": "item_123abc456",
          "description": "Office Chair - Executive",
          "quantity": 10,
          "unitPrice": 500.00,
          "lineTotal": 5000.00,
          "taxCode": "SST",
          "taxRate": 6.0,
          "taxAmount": 300.00,
          "accountCode": "5000"
        }
      ],
      "attachments": [
        {
          "id": "att_789xyz123",
          "filename": "supplier-invoice.pdf",
          "url": "https://files.bigledger.com/bills/bill_456def789/supplier-invoice.pdf",
          "uploadedAt": "2024-01-20T09:00:00Z"
        }
      ],
      "paymentTerms": "NET 30",
      "notes": "Office furniture delivery",
      "createdAt": "2024-01-20T09:00:00Z",
      "updatedAt": "2024-01-20T09:00:00Z"
    }
  ]
}
```

### Create Bill

```http
POST /v1/bills
```

**Request Body:**
```json
{
  "supplierId": "supp_123abc456",
  "supplierInvoiceNumber": "SI-2024-001",
  "purchaseOrderId": "po_789xyz123",
  "billDate": "2024-01-20",
  "dueDate": "2024-02-19",
  "reference": "Delivery Note DN-001",
  "items": [
    {
      "itemId": "item_123abc456",
      "description": "Office Chair - Executive",
      "quantity": 10,
      "unitPrice": 500.00,
      "taxCode": "SST",
      "accountCode": "5000"
    }
  ],
  "attachments": [
    {
      "filename": "supplier-invoice.pdf",
      "content": "base64_encoded_file_content",
      "mimeType": "application/pdf"
    }
  ],
  "notes": "Office furniture delivery"
}
```

<!-- TODO: Add bill payment endpoints -->
<!-- TODO: Add bill approval workflows -->
<!-- TODO: Add recurring bills -->

## Procurement Workflows

### Purchase Requisitions

```http
GET /v1/purchase-requisitions
POST /v1/purchase-requisitions
GET /v1/purchase-requisitions/{id}
PUT /v1/purchase-requisitions/{id}
POST /v1/purchase-requisitions/{id}/approve
POST /v1/purchase-requisitions/{id}/reject
POST /v1/purchase-requisitions/{id}/convert-to-po
```

<!-- TODO: Add complete purchase requisition API -->

### Request for Quotes (RFQ)

```http
GET /v1/rfqs
POST /v1/rfqs
GET /v1/rfqs/{id}
PUT /v1/rfqs/{id}
POST /v1/rfqs/{id}/send
POST /v1/rfqs/{id}/responses
```

<!-- TODO: Add complete RFQ API -->

### Supplier Performance

```http
GET /v1/suppliers/{id}/performance
GET /v1/suppliers/{id}/delivery-performance
GET /v1/suppliers/{id}/quality-ratings
POST /v1/suppliers/{id}/rate-performance
```

<!-- TODO: Add supplier performance tracking API -->

## Approvals & Workflows

{{< callout type="warning" >}}
Approvals are **optional** and apply only to Purchase Requisitions, Purchase Orders and Stock
Requisitions. There is no approval-rules resource and no per-user approval limit — the rule is an
*Approval Setting* holding a list of levels, created from the applet's own Settings screen. Read
[Document Approvals](/guides/document-approvals/) before using these endpoints.
{{< /callout >}}

### Approval Settings

```http
GET    /core2/tnt/dm/erp/generic-doc/approvals/approval-settings/backoffice-ep/query
POST   /core2/tnt/dm/erp/generic-doc/approvals/approval-settings/backoffice-ep
PUT    /core2/tnt/dm/erp/generic-doc/approvals/approval-settings/backoffice-ep
DELETE /core2/tnt/dm/erp/generic-doc/approvals/approval-settings/backoffice-ep/{guid}
```

### Submitting, Withdrawing and Deciding

```http
POST /core2/tnt/dm/erp/generic-doc/approvals/processors/submission/backoffice-ep
PUT  /core2/tnt/dm/erp/generic-doc/approvals/processors/submission/backoffice-ep
PUT  /core2/tnt/dm/erp/generic-doc/approvals/processors/withdrawals/backoffice-ep
GET  /core2/tnt/dm/erp/generic-doc/approvals/approval-requests/login-entity-ep
PUT  /core2/tnt/dm/erp/generic-doc/approvals/approval-requests/processors/login-entity-primary-ep
GET  /core2/tnt/dm/erp/generic-doc/approvals/approval-histories/backoffice-ep/query
```

## Reports & Analytics

### Purchasing Reports

```http
GET /v1/reports/purchasing/spend-analysis
GET /v1/reports/purchasing/supplier-performance
GET /v1/reports/purchasing/outstanding-pos
GET /v1/reports/purchasing/aged-payables
GET /v1/reports/purchasing/procurement-analytics
```

<!-- TODO: Add comprehensive procurement reporting API -->

## Integration Examples

### Complete Purchase-to-Pay Flow

```javascript
// 1. Create Purchase Requisition
const requisition = await client.purchaseRequisitions.create({
  requestedBy: 'user_123',
  department: 'IT',
  items: [
    {
      description: 'Laptop - Dell XPS 13',
      quantity: 5,
      estimatedPrice: 6000.00,
      justification: 'New employee laptops'
    }
  ],
  requiredDate: '2024-02-15'
});

// 2. Approve Requisition
await client.purchaseRequisitions.approve(requisition.id);

// 3. Convert to Purchase Order
const po = await client.purchaseRequisitions.convertToPO(requisition.id, {
  supplierId: 'supp_123abc456'
});

// 4. Send PO to Supplier
await client.purchaseOrders.send(po.id);

// 5. Receive Goods
await client.purchaseOrders.receiveGoods(po.id, {
  items: [
    {
      itemId: 'item_123',
      receivedQuantity: 5,
      receivedDate: '2024-02-10'
    }
  ]
});

// 6. Process Supplier Bill
const bill = await client.bills.create({
  supplierId: 'supp_123abc456',
  purchaseOrderId: po.id,
  supplierInvoiceNumber: 'SI-2024-001',
  billDate: '2024-02-10',
  items: [{
    itemId: 'item_123',
    quantity: 5,
    unitPrice: 6000.00
  }]
});

// 7. Schedule Payment
await client.bills.schedulePayment(bill.id, {
  paymentDate: '2024-03-10',
  bankAccountId: 'bank_456',
  reference: 'Payment for laptops'
});
```

## Error Codes

| Code | Description |
|------|-------------|
| `SUPPLIER_NOT_FOUND` | Supplier ID does not exist |
| `PO_ALREADY_SENT` | Purchase order has already been sent |
| `EmployeeBranchDesignationLink_IS_NOT_FULLY_CONFIGURED` | Fewer approver levels are assigned than the approval setting requires |
| `BILL_ALREADY_PAID` | Bill has already been fully paid |
| `INVALID_SUPPLIER_INVOICE` | Supplier invoice number already exists |
| `PO_ITEMS_FULLY_RECEIVED` | All items already received |
| `REQUISITION_ALREADY_APPROVED` | Purchase requisition already approved |

<!-- TODO: Add comprehensive error handling guide -->
<!-- TODO: Add webhook events for purchasing module -->
<!-- TODO: Add batch operations for purchasing -->

## Webhooks

Subscribe to purchasing events:

```javascript
// Available purchasing webhook events
const events = [
  'purchase_order.created',
  'purchase_order.sent',
  'purchase_order.approved',
  'purchase_order.received',
  'purchase_order.cancelled',
  'bill.created',
  'bill.paid',
  'supplier.created',
  'supplier.updated',
  'requisition.created',
  'requisition.approved'
];
```

<!-- TODO: Add detailed webhook payloads for each event -->