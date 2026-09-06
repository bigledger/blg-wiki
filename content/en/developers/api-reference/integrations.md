---
description: Third-party integration APIs for connecting BigLedger with external systems, marketplaces, and business applications.
tags:
- api-reference
- integrations
- third-party
- connectors
title: Integration APIs
weight: 100
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Connect BigLedger with external systems, marketplaces, and business applications through our comprehensive integration APIs. Built for seamless data synchronization and workflow automation.

{{< callout type="info" >}}
**Pre-built Connectors**: BigLedger offers pre-built connectors for popular platforms like Shopify, WooCommerce, Amazon, and more. Use these APIs to build custom integrations or extend existing connectors.
{{< /callout >}}

## Base Endpoints

All integration endpoints are available under:
```
https://api.bigledger.com/v1/integrations
```

## Integration Management

### List Available Integrations

```http
GET /v1/integrations/available
```

**Response:**
```json
{
  "success": true,
  "data": {
    "ecommerce": [
      {
        "id": "shopify",
        "name": "Shopify",
        "description": "Connect your Shopify store for automated order sync",
        "category": "ecommerce",
        "status": "active",
        "features": ["order_sync", "product_sync", "customer_sync", "inventory_sync"],
        "setupRequired": true,
        "webhookSupport": true,
        "realTimeSync": true
      },
      {
        "id": "woocommerce",
        "name": "WooCommerce",
        "description": "Sync orders and products from WooCommerce",
        "category": "ecommerce",
        "status": "active",
        "features": ["order_sync", "product_sync", "customer_sync"],
        "setupRequired": true,
        "webhookSupport": true,
        "realTimeSync": false
      }
    ],
    "marketplaces": [
      {
        "id": "amazon",
        "name": "Amazon Seller Central",
        "description": "Manage Amazon orders and inventory",
        "category": "marketplace",
        "status": "active",
        "features": ["order_sync", "inventory_sync", "fee_tracking"],
        "setupRequired": true,
        "webhookSupport": false,
        "realTimeSync": false
      }
    ],
    "payment_gateways": [
      {
        "id": "stripe",
        "name": "Stripe",
        "description": "Automatically record Stripe payments",
        "category": "payment",
        "status": "active",
        "features": ["payment_sync", "fee_tracking", "chargeback_handling"],
        "setupRequired": true,
        "webhookSupport": true,
        "realTimeSync": true
      }
    ],
    "accounting": [
      {
        "id": "quickbooks",
        "name": "QuickBooks Online",
        "description": "Migrate data from QuickBooks Online",
        "category": "accounting",
        "status": "active",
        "features": ["data_migration", "chart_of_accounts_sync"],
        "setupRequired": true,
        "webhookSupport": false,
        "realTimeSync": false
      }
    ]
  }
}
```

### Setup Integration

```http
POST /v1/integrations/{integrationId}/setup
```

**Request Body:**
```json
{
  "name": "My Shopify Store",
  "credentials": {
    "shopDomain": "mystore.myshopify.com",
    "accessToken": "shpat_1234567890abcdef",
    "webhookSecret": "webhook_secret_key"
  },
  "settings": {
    "syncOrders": true,
    "syncProducts": true,
    "syncCustomers": true,
    "syncInventory": true,
    "orderStatus": "all",
    "fulfillmentStatus": "all"
  },
  "mapping": {
    "defaultTaxCode": "SST",
    "defaultPaymentAccount": "acc_stripe",
    "shippingAccount": "acc_shipping",
    "discountAccount": "acc_discounts"
  }
}
```

## E-commerce Integrations

### Shopify Integration

#### Sync Shopify Orders

```http
POST /v1/integrations/shopify/sync-orders
```

**Request Body:**
```json
{
  "integrationId": "int_shopify_123",
  "dateRange": {
    "from": "2024-01-01T00:00:00Z",
    "to": "2024-01-31T23:59:59Z"
  },
  "orderStatus": ["paid", "partially_paid"],
  "fulfillmentStatus": ["fulfilled", "partial"],
  "batchSize": 50
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "syncId": "sync_abc123456",
    "status": "processing",
    "ordersToProcess": 156,
    "ordersProcessed": 0,
    "ordersCreated": 0,
    "ordersUpdated": 0,
    "ordersFailed": 0,
    "startedAt": "2024-01-15T10:30:00Z",
    "estimatedCompletion": "2024-01-15T10:35:00Z"
  }
}
```

#### Shopify Product Sync

```http
POST /v1/integrations/shopify/sync-products
```

**Request Body:**
```json
{
  "integrationId": "int_shopify_123",
  "syncType": "incremental",
  "includeVariants": true,
  "includeInventory": true,
  "publishedStatus": "published"
}
```

#### Shopify Inventory Update

```http
POST /v1/integrations/shopify/update-inventory
```

**Request Body:**
```json
{
  "integrationId": "int_shopify_123",
  "items": [
    {
      "sku": "WIDGET-001",
      "locationId": "shopify_location_123",
      "quantity": 150,
      "updateType": "set"
    },
    {
      "sku": "GADGET-002", 
      "locationId": "shopify_location_123",
      "quantity": -5,
      "updateType": "adjust"
    }
  ]
}
```

### WooCommerce Integration

#### WooCommerce Order Sync

```http
POST /v1/integrations/woocommerce/sync-orders
```

**Request Body:**
```json
{
  "integrationId": "int_woo_456",
  "credentials": {
    "siteUrl": "https://mystore.com",
    "consumerKey": "ck_1234567890abcdef",
    "consumerSecret": "cs_abcdef1234567890"
  },
  "dateRange": {
    "from": "2024-01-01",
    "to": "2024-01-31"
  },
  "orderStatus": ["processing", "completed"]
}
```

## Marketplace Integrations

### Amazon Seller Central

#### Amazon Order Sync

```http
POST /v1/integrations/amazon/sync-orders
```

**Request Body:**
```json
{
  "integrationId": "int_amazon_789",
  "credentials": {
    "sellerId": "A1234567890123",
    "mwsAccessKey": "AKIAI1234567890ABCDEF",
    "mwsSecretKey": "secret_key_1234567890abcdef",
    "marketplaceId": "ATVPDKIKX0DER"
  },
  "dateRange": {
    "from": "2024-01-01T00:00:00Z",
    "to": "2024-01-31T23:59:59Z"
  },
  "orderStatus": ["Shipped", "Delivered"]
}
```

#### Amazon Fee Reconciliation

```http
POST /v1/integrations/amazon/sync-fees
```

**Request Body:**
```json
{
  "integrationId": "int_amazon_789",
  "reportType": "settlement",
  "dateRange": {
    "from": "2024-01-01",
    "to": "2024-01-31"
  }
}
```

## Payment Gateway Integrations

### Stripe Integration

#### Stripe Payment Sync

```http
POST /v1/integrations/stripe/sync-payments
```

**Request Body:**
```json
{
  "integrationId": "int_stripe_321",
  "credentials": {
    "secretKey": "sk_live_1234567890abcdef",
    "webhookEndpointSecret": "whsec_1234567890abcdef"
  },
  "dateRange": {
    "from": "2024-01-01T00:00:00Z", 
    "to": "2024-01-31T23:59:59Z"
  },
  "includeRefunds": true,
  "includeChargebacks": true,
  "includeFees": true
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "syncId": "sync_stripe_123",
    "paymentsProcessed": 245,
    "paymentsCreated": 203,
    "paymentsUpdated": 42,
    "refundsProcessed": 15,
    "chargebacksProcessed": 2,
    "feesRecorded": 247,
    "totalAmount": 125000.50,
    "totalFees": 3750.15
  }
}
```

### PayPal Integration

```http
POST /v1/integrations/paypal/sync-transactions
```

<!-- TODO: Add PayPal integration documentation -->

## Data Migration APIs

### QuickBooks Online Migration

#### Export Chart of Accounts

```http
POST /v1/integrations/quickbooks/export-coa
```

**Request Body:**
```json
{
  "credentials": {
    "clientId": "qb_client_id",
    "clientSecret": "qb_client_secret",
    "accessToken": "qb_access_token",
    "refreshToken": "qb_refresh_token",
    "companyId": "123145677890"
  },
  "options": {
    "includeInactive": false,
    "mapToStandard": true
  }
}
```

#### Migrate Customer Data

```http
POST /v1/integrations/quickbooks/migrate-customers
```

#### Migrate Historical Transactions

```http
POST /v1/integrations/quickbooks/migrate-transactions
```

**Request Body:**
```json
{
  "credentials": {...},
  "dateRange": {
    "from": "2023-01-01",
    "to": "2023-12-31"
  },
  "transactionTypes": [
    "invoice",
    "bill",
    "payment",
    "journal_entry"
  ],
  "batchSize": 100
}
```

### Xero Migration

```http
POST /v1/integrations/xero/full-migration
```

<!-- TODO: Add Xero migration documentation -->

## Real-time Data Sync

### Webhook Management

#### Register Webhook Endpoints

```http
POST /v1/integrations/{integrationId}/webhooks
```

**Request Body:**
```json
{
  "events": [
    "order.created",
    "order.updated", 
    "product.updated",
    "inventory.updated"
  ],
  "endpoint": "https://mystore.com/bigledger-webhook",
  "secret": "webhook_verification_secret",
  "active": true
}
```

#### Webhook Event Processing

**Shopify Order Created Webhook:**
```json
{
  "event": "order.created",
  "source": "shopify",
  "integrationId": "int_shopify_123",
  "timestamp": "2024-01-15T10:30:00Z",
  "data": {
    "orderId": "shopify_order_12345",
    "orderNumber": "#1001",
    "customer": {
      "id": "shopify_customer_789",
      "email": "customer@example.com",
      "firstName": "John",
      "lastName": "Doe"
    },
    "items": [
      {
        "productId": "shopify_product_456",
        "variantId": "shopify_variant_789",
        "sku": "WIDGET-001",
        "name": "Premium Widget",
        "quantity": 2,
        "price": 49.99
      }
    ],
    "total": 105.98,
    "currency": "MYR",
    "status": "paid"
  }
}
```

### Real-time Inventory Sync

```http
POST /v1/integrations/{integrationId}/inventory-sync
```

**Request Body:**
```json
{
  "items": [
    {
      "sku": "WIDGET-001",
      "quantity": 150,
      "locations": [
        {
          "externalId": "shopify_location_123",
          "quantity": 100
        },
        {
          "externalId": "amazon_warehouse_456", 
          "quantity": 50
        }
      ]
    }
  ]
}
```

## Custom Integration Framework

### Generic Connector

For systems not covered by pre-built integrations:

```http
POST /v1/integrations/custom/create-connector
```

**Request Body:**
```json
{
  "name": "My Custom System",
  "description": "Integration with our legacy ERP system",
  "type": "custom",
  "authentication": {
    "type": "api_key",
    "fields": [
      {
        "name": "apiKey",
        "label": "API Key",
        "type": "string",
        "required": true,
        "encrypted": true
      },
      {
        "name": "baseUrl",
        "label": "Base URL",
        "type": "url",
        "required": true
      }
    ]
  },
  "endpoints": [
    {
      "name": "getOrders",
      "method": "GET",
      "path": "/api/orders",
      "parameters": ["from_date", "to_date"],
      "mapping": {
        "orderId": "$.id",
        "customerName": "$.customer.name",
        "items": "$.line_items[*]",
        "total": "$.total_amount"
      }
    }
  ],
  "webhookSupport": false,
  "scheduleSync": true
}
```

### Data Transformation

```http
POST /v1/integrations/transform-data
```

**Request Body:**
```json
{
  "sourceFormat": "csv",
  "targetFormat": "bigledger_customer",
  "mapping": {
    "name": "company_name",
    "email": "contact_email", 
    "phone": "phone_number",
    "address.street": "street_address",
    "address.city": "city",
    "creditLimit": {
      "field": "credit_limit",
      "transform": "parseFloat",
      "default": 0
    }
  },
  "data": "company_name,contact_email,phone_number,street_address,city,credit_limit\n..."
}
```

## Integration Monitoring

### Sync Status Monitoring

```http
GET /v1/integrations/{integrationId}/status
```

**Response:**
```json
{
  "success": true,
  "data": {
    "integrationId": "int_shopify_123",
    "status": "healthy",
    "lastSync": "2024-01-15T09:30:00Z",
    "nextSync": "2024-01-15T10:30:00Z",
    "syncFrequency": "hourly",
    "statistics": {
      "last24Hours": {
        "ordersProcessed": 45,
        "ordersCreated": 42,
        "ordersFailed": 3,
        "productsUpdated": 15,
        "inventoryUpdated": 25
      },
      "lastWeek": {
        "ordersProcessed": 287,
        "ordersCreated": 278,
        "ordersFailed": 9,
        "successRate": 96.9
      }
    },
    "recentErrors": [
      {
        "timestamp": "2024-01-15T08:45:00Z",
        "type": "validation_error",
        "message": "Customer email already exists",
        "orderId": "shopify_order_789"
      }
    ]
  }
}
```

### Integration Health Check

```http
GET /v1/integrations/{integrationId}/health
```

**Response:**
```json
{
  "success": true,
  "data": {
    "status": "healthy",
    "checks": [
      {
        "name": "connection",
        "status": "healthy",
        "responseTime": 145,
        "lastChecked": "2024-01-15T10:29:00Z"
      },
      {
        "name": "webhook_endpoint",
        "status": "healthy", 
        "lastReceived": "2024-01-15T10:25:00Z"
      },
      {
        "name": "rate_limits",
        "status": "healthy",
        "remaining": 8500,
        "resetTime": "2024-01-15T11:00:00Z"
      }
    ]
  }
}
```

## Integration Analytics

### Performance Metrics

```http
GET /v1/integrations/analytics
```

**Response:**
```json
{
  "success": true,
  "data": {
    "summary": {
      "activeIntegrations": 5,
      "totalSyncs": 1248,
      "successRate": 97.2,
      "averageProcessingTime": 2.3
    },
    "byIntegration": [
      {
        "integrationId": "int_shopify_123",
        "name": "Shopify Store",
        "type": "shopify",
        "status": "healthy",
        "syncs": 456,
        "successRate": 98.5,
        "lastSync": "2024-01-15T10:00:00Z",
        "dataVolume": {
          "ordersProcessed": 2150,
          "productsUpdated": 850,
          "customersCreated": 450
        }
      }
    ]
  }
}
```

## Error Handling & Troubleshooting

### Common Integration Errors

| Error Code | Description | Resolution |
|------------|-------------|------------|
| `AUTH_FAILED` | Authentication failed | Check credentials and refresh tokens |
| `RATE_LIMIT_EXCEEDED` | API rate limit exceeded | Reduce sync frequency or upgrade plan |
| `WEBHOOK_VERIFICATION_FAILED` | Webhook signature invalid | Check webhook secret configuration |
| `DATA_MAPPING_ERROR` | Field mapping configuration error | Review and update field mappings |
| `DUPLICATE_RECORD` | Record already exists | Enable duplicate handling or update existing |
| `INVALID_CREDENTIALS` | Integration credentials invalid | Re-authenticate the integration |

### Error Recovery

```http
POST /v1/integrations/{integrationId}/retry-failed
```

**Request Body:**
```json
{
  "syncId": "sync_abc123456",
  "retryType": "failed_only",
  "maxRetries": 3
}
```

## Integration Examples

### Complete E-commerce Setup

```javascript
// Set up Shopify integration with full sync
async function setupShopifyIntegration() {
  // 1. Create integration
  const integration = await client.integrations.setup('shopify', {
    name: 'Main Store',
    credentials: {
      shopDomain: 'mystore.myshopify.com',
      accessToken: process.env.SHOPIFY_ACCESS_TOKEN
    },
    settings: {
      syncOrders: true,
      syncProducts: true,
      syncCustomers: true,
      autoCreateCustomers: true,
      defaultTaxCode: 'SST'
    }
  });
  
  // 2. Initial data sync
  const historicalSync = await client.integrations.shopify.syncOrders(integration.id, {
    dateRange: {
      from: '2024-01-01T00:00:00Z',
      to: new Date().toISOString()
    },
    orderStatus: ['paid', 'partially_paid']
  });
  
  // 3. Set up real-time webhooks
  const webhook = await client.integrations.webhooks.create(integration.id, {
    events: ['order.created', 'order.updated', 'product.updated'],
    endpoint: 'https://myapp.com/webhooks/shopify'
  });
  
  // 4. Schedule regular syncs
  const schedule = await client.integrations.schedules.create(integration.id, {
    frequency: 'hourly',
    operations: ['sync_orders', 'sync_inventory']
  });
  
  return { integration, historicalSync, webhook, schedule };
}
```

### Multi-Channel Inventory Management

```javascript
// Sync inventory across multiple channels
async function syncInventoryMultiChannel(inventoryUpdates) {
  const channels = ['shopify', 'amazon', 'woocommerce'];
  
  const syncTasks = channels.map(async (channel) => {
    const integration = await client.integrations.get(channel);
    
    return await client.integrations[channel].updateInventory(integration.id, {
      items: inventoryUpdates.map(update => ({
        sku: update.sku,
        quantity: update.availableQuantity,
        updateType: 'set'
      }))
    });
  });
  
  const results = await Promise.all(syncTasks);
  return results;
}
```

<!-- TODO: Add integration testing framework -->
<!-- TODO: Add rate limiting strategies per platform -->
<!-- TODO: Add webhook security best practices -->
<!-- TODO: Add integration backup and recovery procedures -->