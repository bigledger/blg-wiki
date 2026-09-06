---
description: Bulk operations API for high-volume data processing, batch imports, and mass updates across BigLedger modules.
tags:
- api-reference
- batch-operations
- bulk-processing
- data-import
title: Batch Operations API
weight: 90
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Process large volumes of data efficiently with BigLedger's batch operation APIs. Perfect for data migrations, bulk imports, mass updates, and high-volume integrations.

{{< callout type="info" >}}
**Performance Optimized**: Batch operations are designed for high-volume processing with built-in error handling, progress tracking, and rollback capabilities.
{{< /callout >}}

## Overview

Batch operations allow you to:
- **Process multiple records** in a single API call
- **Import large datasets** from external systems
- **Perform bulk updates** across multiple entities
- **Handle errors gracefully** with partial success support
- **Track progress** with real-time status updates

## Base Endpoints

All batch endpoints are available under:
```
https://api.bigledger.com/v1/batch
```

## Supported Operations

### Batch Entities

| Entity | Max Records | Endpoint | Operations |
|--------|-------------|----------|------------|
| Customers | 500 | `/v1/batch/customers` | Create, Update, Delete |
| Suppliers | 500 | `/v1/batch/suppliers` | Create, Update, Delete |
| Invoices | 100 | `/v1/batch/invoices` | Create, Update |
| Bills | 100 | `/v1/batch/bills` | Create, Update |
| Items | 1000 | `/v1/batch/items` | Create, Update, Delete |
| Journal Entries | 100 | `/v1/batch/journal-entries` | Create |
| Stock Adjustments | 500 | `/v1/batch/stock-adjustments` | Create |
| Payments | 200 | `/v1/batch/payments` | Create |
| Chart of Accounts | 200 | `/v1/batch/accounts` | Create, Update |

## Batch Request Format

All batch operations follow a consistent request structure:

```json
{
  "operations": [
    {
      "operation": "create|update|delete",
      "referenceId": "optional_unique_reference",
      "data": {
        // Entity-specific data
      }
    }
  ],
  "options": {
    "continueOnError": true,
    "validateOnly": false,
    "async": false,
    "rollbackOnError": false
  }
}
```

### Operation Options

- **`continueOnError`** (boolean): Continue processing even if some records fail
- **`validateOnly`** (boolean): Validate data without persisting changes  
- **`async`** (boolean): Process batch asynchronously for large datasets
- **`rollbackOnError`** (boolean): Rollback all changes if any record fails

## Batch Response Format

```json
{
  "success": true,
  "data": {
    "batchId": "batch_123abc456",
    "status": "completed",
    "totalRecords": 100,
    "processedRecords": 98,
    "successfulRecords": 95,
    "failedRecords": 3,
    "skippedRecords": 2,
    "results": [
      {
        "referenceId": "ref_001",
        "operation": "create",
        "success": true,
        "data": {
          "id": "cust_789xyz123",
          "customerNumber": "CUST-0001"
        }
      },
      {
        "referenceId": "ref_002", 
        "operation": "create",
        "success": false,
        "error": {
          "code": "VALIDATION_ERROR",
          "message": "Email already exists",
          "field": "email"
        }
      }
    ],
    "summary": {
      "created": 45,
      "updated": 50,
      "deleted": 0,
      "errors": 3,
      "warnings": 2
    },
    "executionTime": 2.5,
    "startedAt": "2024-01-15T10:30:00Z",
    "completedAt": "2024-01-15T10:30:02.5Z"
  }
}
```

## Customer Batch Operations

### Bulk Create/Update Customers

```http
POST /v1/batch/customers
```

**Request Body:**
```json
{
  "operations": [
    {
      "operation": "create",
      "referenceId": "new_customer_1",
      "data": {
        "name": "Acme Corporation",
        "email": "billing@acme.com",
        "phone": "+60123456789",
        "address": {
          "street": "123 Main Street",
          "city": "Kuala Lumpur",
          "state": "Selangor",
          "postalCode": "50000",
          "country": "MY"
        },
        "creditLimit": 10000.00,
        "paymentTerms": 30,
        "taxNumber": "123456789012"
      }
    },
    {
      "operation": "update",
      "referenceId": "update_customer_1",
      "data": {
        "id": "cust_existing123",
        "creditLimit": 15000.00,
        "status": "active"
      }
    },
    {
      "operation": "create",
      "referenceId": "new_customer_2",
      "data": {
        "name": "Tech Solutions Sdn Bhd",
        "email": "accounts@techsolutions.my",
        "phone": "+60387654321",
        "creditLimit": 25000.00,
        "paymentTerms": 45
      }
    }
  ],
  "options": {
    "continueOnError": true,
    "validateOnly": false
  }
}
```

### CSV Import for Customers

```http
POST /v1/batch/customers/import-csv
Content-Type: multipart/form-data
```

**Form Data:**
- `file`: CSV file
- `mapping`: Column mapping JSON
- `options`: Import options JSON

**CSV Format:**
```csv
name,email,phone,credit_limit,payment_terms,tax_number
"Acme Corp","billing@acme.com","+60123456789",10000,30,"123456789012"
"Tech Solutions","accounts@tech.my","+60387654321",25000,45,"987654321012"
```

**Mapping:**
```json
{
  "name": "name",
  "email": "email", 
  "phone": "phone",
  "creditLimit": "credit_limit",
  "paymentTerms": "payment_terms",
  "taxNumber": "tax_number"
}
```

## Invoice Batch Operations

### Bulk Create Invoices

```http
POST /v1/batch/invoices
```

**Request Body:**
```json
{
  "operations": [
    {
      "operation": "create",
      "referenceId": "inv_batch_001",
      "data": {
        "customerId": "cust_123abc456",
        "invoiceDate": "2024-01-15",
        "dueDate": "2024-02-14",
        "reference": "SO-2024-001",
        "items": [
          {
            "itemId": "item_123",
            "description": "Professional Services",
            "quantity": 10,
            "unitPrice": 100.00,
            "taxCode": "SST"
          }
        ],
        "notes": "Bulk generated invoice"
      }
    },
    {
      "operation": "create",
      "referenceId": "inv_batch_002", 
      "data": {
        "customerId": "cust_456def789",
        "invoiceDate": "2024-01-15",
        "dueDate": "2024-02-14",
        "items": [
          {
            "description": "Consulting Services",
            "quantity": 5,
            "unitPrice": 200.00,
            "taxCode": "SST"
          }
        ]
      }
    }
  ],
  "options": {
    "continueOnError": true,
    "async": false
  }
}
```

## Inventory Batch Operations

### Bulk Stock Adjustments

```http
POST /v1/batch/stock-adjustments
```

**Request Body:**
```json
{
  "operations": [
    {
      "operation": "create",
      "referenceId": "adj_001",
      "data": {
        "itemId": "item_123abc456",
        "locationId": "loc_warehouse1",
        "adjustmentType": "increase",
        "quantity": 100,
        "unitCost": 25.00,
        "reason": "Stock count correction",
        "reference": "SC-2024-001"
      }
    },
    {
      "operation": "create",
      "referenceId": "adj_002",
      "data": {
        "itemId": "item_456def789",
        "locationId": "loc_warehouse1",
        "adjustmentType": "decrease",
        "quantity": 50,
        "reason": "Damaged goods write-off",
        "reference": "WO-2024-001"
      }
    }
  ]
}
```

### Bulk Item Creation

```http
POST /v1/batch/items
```

**Request Body:**
```json
{
  "operations": [
    {
      "operation": "create",
      "referenceId": "item_001",
      "data": {
        "itemCode": "WIDGET-001",
        "name": "Premium Widget",
        "description": "High-quality widget for industrial use",
        "category": "Widgets",
        "type": "inventory",
        "unitOfMeasure": "pieces",
        "costPrice": 25.00,
        "sellingPrice": 50.00,
        "taxCode": "SST",
        "reorderLevel": 100,
        "reorderQuantity": 500,
        "trackSerial": false,
        "trackBatch": false
      }
    },
    {
      "operation": "create", 
      "referenceId": "item_002",
      "data": {
        "itemCode": "SERVICE-001",
        "name": "Consulting Hour",
        "description": "Professional consulting services",
        "type": "service",
        "sellingPrice": 150.00,
        "taxCode": "SST"
      }
    }
  ]
}
```

## Journal Entry Batch Operations

### Bulk Journal Entries

```http
POST /v1/batch/journal-entries
```

**Request Body:**
```json
{
  "operations": [
    {
      "operation": "create",
      "referenceId": "je_001",
      "data": {
        "date": "2024-01-15",
        "reference": "JE-2024-001",
        "description": "Monthly depreciation",
        "lines": [
          {
            "accountId": "acc_depreciation",
            "debit": 5000.00,
            "credit": 0.00,
            "description": "Equipment depreciation"
          },
          {
            "accountId": "acc_accumulated_dep",
            "debit": 0.00,
            "credit": 5000.00,
            "description": "Accumulated depreciation"
          }
        ]
      }
    },
    {
      "operation": "create",
      "referenceId": "je_002",
      "data": {
        "date": "2024-01-15",
        "reference": "JE-2024-002", 
        "description": "Prepaid insurance adjustment",
        "lines": [
          {
            "accountId": "acc_insurance_exp",
            "debit": 2000.00,
            "credit": 0.00,
            "description": "Monthly insurance expense"
          },
          {
            "accountId": "acc_prepaid_ins",
            "debit": 0.00,
            "credit": 2000.00,
            "description": "Prepaid insurance reduction"
          }
        ]
      }
    }
  ]
}
```

## Asynchronous Batch Processing

For large datasets, use asynchronous processing:

```http
POST /v1/batch/customers
```

**Request Body:**
```json
{
  "operations": [
    // ... many operations
  ],
  "options": {
    "async": true,
    "continueOnError": true
  }
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "jobId": "job_123abc456",
    "status": "queued",
    "totalRecords": 1000,
    "estimatedCompletion": "2024-01-15T10:45:00Z",
    "progressUrl": "/v1/batch/jobs/job_123abc456",
    "downloadUrl": null
  }
}
```

### Check Batch Job Status

```http
GET /v1/batch/jobs/{jobId}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "jobId": "job_123abc456",
    "status": "processing",
    "progress": {
      "totalRecords": 1000,
      "processedRecords": 450,
      "successfulRecords": 440,
      "failedRecords": 10,
      "percentComplete": 45.0
    },
    "startedAt": "2024-01-15T10:30:00Z",
    "estimatedCompletion": "2024-01-15T10:42:00Z",
    "results": {
      "available": false,
      "downloadUrl": null
    }
  }
}
```

### Download Batch Results

```http
GET /v1/batch/jobs/{jobId}/results
```

Returns detailed results in JSON format or download link for large result sets.

## Data Validation

### Validation Rules

Each entity has specific validation rules applied during batch processing:

#### Customer Validation
- **Name**: Required, max 100 characters
- **Email**: Valid email format, unique per company
- **Phone**: Valid phone format
- **Tax Number**: Valid format for country
- **Credit Limit**: Non-negative number

#### Invoice Validation  
- **Customer**: Must exist and be active
- **Date**: Valid date, not in future (configurable)
- **Items**: At least one item required
- **Amounts**: Must balance and be positive

#### Item Validation
- **Item Code**: Required, unique per company
- **Name**: Required, max 200 characters
- **Prices**: Non-negative numbers
- **UOM**: Valid unit of measure

### Validation-Only Mode

Test your data before processing:

```json
{
  "operations": [...],
  "options": {
    "validateOnly": true
  }
}
```

Returns validation results without creating/updating records.

## Error Handling

### Error Categories

1. **Validation Errors**: Data format or business rule violations
2. **Duplicate Errors**: Attempting to create existing records
3. **Reference Errors**: Invalid foreign key references  
4. **Permission Errors**: Insufficient access rights
5. **System Errors**: Database or system-level issues

### Error Response Format

```json
{
  "referenceId": "ref_001",
  "operation": "create",
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Multiple validation errors",
    "details": [
      {
        "field": "email",
        "message": "Email format is invalid",
        "code": "INVALID_EMAIL"
      },
      {
        "field": "creditLimit",
        "message": "Credit limit must be non-negative",
        "code": "INVALID_AMOUNT"
      }
    ],
    "context": {
      "rowNumber": 15,
      "originalData": {...}
    }
  }
}
```

### Rollback Support

Enable rollback to undo all changes if any record fails:

```json
{
  "operations": [...],
  "options": {
    "rollbackOnError": true
  }
}
```

{{< callout type="warning" >}}
**Rollback Limitations**: Rollback is not available for all operations. Check the specific endpoint documentation for rollback support.
{{< /callout >}}

## Performance Optimization

### Best Practices

1. **Batch Size**: Use optimal batch sizes per entity type
2. **Async Processing**: Use async for > 100 records
3. **Validation**: Pre-validate data when possible
4. **Error Handling**: Use `continueOnError` for better performance
5. **Chunking**: Split large datasets into smaller batches

### Rate Limits

Batch operations have separate rate limits:

- **Standard Batch**: 10 batches per minute
- **Large Batch (>100 records)**: 5 batches per minute  
- **Async Batch**: 3 concurrent jobs per company

### Monitoring

Track batch performance:

```http
GET /v1/batch/metrics
```

**Response:**
```json
{
  "success": true,
  "data": {
    "currentMonth": {
      "totalBatches": 156,
      "totalRecords": 45280,
      "averageProcessingTime": 3.2,
      "successRate": 96.5
    },
    "activeBatches": 2,
    "queuedBatches": 0,
    "rateLimits": {
      "remaining": 8,
      "resetTime": "2024-01-15T11:00:00Z"
    }
  }
}
```

## Data Import Templates

### CSV Templates

Download standardized CSV templates:

- **Customers**: `/v1/batch/customers/template.csv`
- **Items**: `/v1/batch/items/template.csv` 
- **Suppliers**: `/v1/batch/suppliers/template.csv`
- **Chart of Accounts**: `/v1/batch/accounts/template.csv`

### Excel Templates

Advanced Excel templates with:
- Data validation rules
- Dropdown lists for valid values
- Formula-based calculations
- Multiple sheets for related data

```http
GET /v1/batch/templates/excel/{entity}
```

## Integration Examples

### Complete Data Migration

```javascript
// Migrate customer data from external system
async function migrateCustomers(externalCustomers) {
  const batchSize = 100;
  const batches = [];
  
  // Split into batches
  for (let i = 0; i < externalCustomers.length; i += batchSize) {
    const batch = externalCustomers.slice(i, i + batchSize);
    batches.push(batch);
  }
  
  const results = [];
  
  // Process batches sequentially
  for (const [index, batch] of batches.entries()) {
    console.log(`Processing batch ${index + 1} of ${batches.length}`);
    
    const operations = batch.map((customer, idx) => ({
      operation: 'create',
      referenceId: `batch_${index}_customer_${idx}`,
      data: {
        name: customer.name,
        email: customer.email,
        phone: customer.phone,
        address: {
          street: customer.address?.street,
          city: customer.address?.city,
          state: customer.address?.state,
          postalCode: customer.address?.postalCode,
          country: customer.address?.country || 'MY'
        },
        creditLimit: customer.credit_limit || 0,
        paymentTerms: customer.payment_terms || 30,
        taxNumber: customer.tax_number
      }
    }));
    
    const batchResult = await client.batch.customers.process({
      operations,
      options: {
        continueOnError: true,
        validateOnly: false
      }
    });
    
    results.push(batchResult);
    
    // Log progress
    console.log(`Batch ${index + 1} completed: ${batchResult.data.successfulRecords}/${batchResult.data.totalRecords} successful`);
    
    // Rate limiting: wait 6 seconds between batches
    if (index < batches.length - 1) {
      await new Promise(resolve => setTimeout(resolve, 6000));
    }
  }
  
  // Aggregate results
  const summary = results.reduce((acc, result) => ({
    totalRecords: acc.totalRecords + result.data.totalRecords,
    successfulRecords: acc.successfulRecords + result.data.successfulRecords,
    failedRecords: acc.failedRecords + result.data.failedRecords
  }), { totalRecords: 0, successfulRecords: 0, failedRecords: 0 });
  
  console.log('Migration completed:', summary);
  return { batches: results, summary };
}
```

### Daily Data Sync

```javascript
// Daily synchronization with external system
async function dailyDataSync() {
  // Get changes since last sync
  const lastSync = await getLastSyncTimestamp();
  const changes = await externalSystem.getChanges(lastSync);
  
  // Process different entity types
  const syncTasks = [
    syncCustomers(changes.customers),
    syncItems(changes.items),
    syncInvoices(changes.invoices)
  ];
  
  const results = await Promise.all(syncTasks);
  
  // Update sync timestamp
  await setLastSyncTimestamp(new Date());
  
  return results;
}

async function syncCustomers(customerChanges) {
  if (!customerChanges.length) return null;
  
  const operations = customerChanges.map(change => ({
    operation: change.operation, // 'create', 'update', or 'delete'
    referenceId: change.external_id,
    data: transformCustomerData(change.data)
  }));
  
  return await client.batch.customers.process({
    operations,
    options: { continueOnError: true }
  });
}
```

<!-- TODO: Add webhook integration for batch completion notifications -->
<!-- TODO: Add batch operation retry mechanisms -->  
<!-- TODO: Add data transformation utilities -->
<!-- TODO: Add comprehensive error recovery strategies -->