---
description: Complete inventory management including items, stock levels, transfers,
  adjustments, and real-time tracking across multiple locations.
tags:
- user-guide
title: Inventory APIs
weight: 40
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Complete inventory management including items, stock levels, transfers, adjustments, and real-time tracking across multiple locations.

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

## Items API

Manage your product catalog with comprehensive item information including pricing, costs, and inventory tracking.

### Item Object

```json
{
  "id": "item_123456789",
  "itemCode": "WDG-001",
  "barcode": "1234567890123",
  "name": "Premium Widget",
  "description": "High-quality widget for industrial applications",
  "category": {
    "id": "cat_electronics",
    "name": "Electronics",
    "path": "Electronics > Components"
  },
  "type": "inventory",
  "unit": "pcs",
  "weight": 1.5,
  "dimensions": {
    "length": 10.0,
    "width": 5.0,
    "height": 3.0,
    "unit": "cm"
  },
  "pricing": {
    "costPrice": 18.50,
    "sellingPrice": 25.00,
    "currency": "MYR",
    "priceGroups": [
      {
        "groupId": "wholesale",
        "price": 22.00
      },
      {
        "groupId": "retail",
        "price": 25.00
      }
    ]
  },
  "inventory": {
    "tracked": true,
    "currentStock": 150,
    "availableStock": 125,
    "reservedStock": 25,
    "minimumStock": 20,
    "maximumStock": 500,
    "reorderPoint": 30,
    "reorderQuantity": 100
  },
  "supplier": {
    "id": "supp_456789",
    "name": "Widget Supplier Ltd",
    "supplierItemCode": "WS-WDG-001",
    "leadTimeDays": 7
  },
  "accounting": {
    "incomeAccountId": "acc_sales_revenue",
    "expenseAccountId": "acc_cogs",
    "assetAccountId": "acc_inventory"
  },
  "tax": {
    "salesTaxCode": "SST",
    "purchaseTaxCode": "SST",
    "taxable": true
  },
  "locations": [
    {
      "locationId": "loc_warehouse1",
      "stock": 100,
      "available": 85,
      "reserved": 15,
      "binLocation": "A1-B2-C3"
    },
    {
      "locationId": "loc_store1",
      "stock": 50,
      "available": 40,
      "reserved": 10,
      "binLocation": "FLOOR-DISPLAY"
    }
  ],
  "variants": [
    {
      "id": "var_123",
      "name": "Red Widget",
      "attributes": {
        "color": "Red",
        "size": "Medium"
      },
      "itemCode": "WDG-001-RED-M",
      "barcode": "1234567890124",
      "stock": 25
    }
  ],
  "customFields": {
    "warranty": "1 year",
    "origin": "Malaysia"
  },
  "images": [
    {
      "id": "img_123",
      "url": "https://files.bigledger.com/items/wdg-001-main.jpg",
      "isPrimary": true
    }
  ],
  "isActive": true,
  "createdAt": "2024-01-01T00:00:00Z",
  "updatedAt": "2024-01-15T10:30:00Z"
}
```

### List Items

Retrieve items with comprehensive filtering and search capabilities.

```http
GET /api/v1/items
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `search` | string | Search by name, code, barcode, or description |
| `category` | string | Filter by category ID |
| `type` | string | Filter by type (`inventory`, `service`, `non_inventory`) |
| `tracked` | boolean | Filter by inventory tracking status |
| `active` | boolean | Filter by active status |
| `lowStock` | boolean | Filter items below minimum stock |
| `outOfStock` | boolean | Filter items with zero stock |
| `supplier` | string | Filter by supplier ID |
| `location` | string | Filter by location ID |
| `costPriceMin` | number | Minimum cost price |
| `costPriceMax` | number | Maximum cost price |
| `sellingPriceMin` | number | Minimum selling price |
| `sellingPriceMax` | number | Maximum selling price |
| `sort` | string | Sort by field (`name`, `itemCode`, `stock`, `costPrice`, `sellingPrice`) |
| `order` | string | Sort order (`asc`, `desc`) |
| `includeVariants` | boolean | Include item variants in response |
| `includeImages` | boolean | Include item images in response |
| `limit` | integer | Number of records per page (default: 50, max: 200) |
| `cursor` | string | Pagination cursor |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/items?lowStock=true&sort=stock&order=asc&limit=20" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

**Response:**

```json
{
  "success": true,
  "data": [
    {
      "id": "item_123456789",
      "itemCode": "WDG-001",
      "name": "Premium Widget",
      "type": "inventory",
      "inventory": {
        "currentStock": 15,
        "minimumStock": 20,
        "availableStock": 10
      },
      "pricing": {
        "costPrice": 18.50,
        "sellingPrice": 25.00
      },
      "isActive": true
    }
  ],
  "pagination": {
    "hasMore": true,
    "nextCursor": "eyJpZCI6MTIzfQ",
    "limit": 20,
    "total": 45
  }
}
```

### Get Item

Retrieve a specific item with complete details.

```http
GET /api/v1/items/{itemId}
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `includeStockHistory` | boolean | Include recent stock movement history |
| `includeTransactions` | boolean | Include recent transaction history |

### Create Item

Create a new item in the inventory.

```http
POST /api/v1/items
```

**Request Body:**

```json
{
  "itemCode": "WDG-002",
  "barcode": "1234567890124",
  "name": "Advanced Widget",
  "description": "Next-generation widget with enhanced features",
  "categoryId": "cat_electronics",
  "type": "inventory",
  "unit": "pcs",
  "weight": 2.0,
  "dimensions": {
    "length": 12.0,
    "width": 6.0,
    "height": 4.0,
    "unit": "cm"
  },
  "pricing": {
    "costPrice": 25.00,
    "sellingPrice": 35.00,
    "currency": "MYR"
  },
  "inventory": {
    "tracked": true,
    "minimumStock": 30,
    "maximumStock": 300,
    "reorderPoint": 40,
    "reorderQuantity": 100
  },
  "supplierId": "supp_456789",
  "supplierItemCode": "WS-WDG-002",
  "accounting": {
    "incomeAccountId": "acc_sales_revenue",
    "expenseAccountId": "acc_cogs",
    "assetAccountId": "acc_inventory"
  },
  "tax": {
    "salesTaxCode": "SST",
    "purchaseTaxCode": "SST"
  },
  "customFields": {
    "warranty": "2 years",
    "origin": "Germany"
  }
}
```

**Required Fields:**
- `itemCode`: Unique item code
- `name`: Item name
- `type`: Item type

### Update Item

Update an existing item.

```http
PUT /api/v1/items/{itemId}
```

**Request Body:**

```json
{
  "name": "Updated Widget Name",
  "description": "Updated description",
  "pricing": {
    "costPrice": 20.00,
    "sellingPrice": 30.00
  },
  "inventory": {
    "minimumStock": 25,
    "reorderPoint": 35
  }
}
```

## Stock Management API

Real-time stock level management and tracking across multiple locations.

### Stock Object

```json
{
  "itemId": "item_123456789",
  "locationId": "loc_warehouse1",
  "currentStock": 150,
  "availableStock": 125,
  "reservedStock": 25,
  "onOrderStock": 100,
  "averageCost": 18.75,
  "stockValue": 2812.50,
  "lastMovement": {
    "date": "2024-01-15T14:30:00Z",
    "type": "sale",
    "quantity": -10,
    "reference": "INV-2024-0001"
  },
  "binLocation": "A1-B2-C3",
  "updatedAt": "2024-01-15T14:30:00Z"
}
```

### Get Stock Levels

Retrieve current stock levels across all or specific locations.

```http
GET /api/v1/inventory/stock
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `itemId` | string | Filter by specific item |
| `locationId` | string | Filter by specific location |
| `categoryId` | string | Filter by item category |
| `lowStock` | boolean | Only items below minimum stock |
| `outOfStock` | boolean | Only items with zero stock |
| `negative` | boolean | Only items with negative stock |
| `includeReserved` | boolean | Include reserved stock information |
| `valueMin` | number | Minimum stock value |
| `valueMax` | number | Maximum stock value |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/inventory/stock?lowStock=true&locationId=loc_warehouse1" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Update Stock Level

Directly update stock level for an item at a location.

```http
PUT /api/v1/inventory/stock
```

**Request Body:**

```json
{
  "itemId": "item_123456789",
  "locationId": "loc_warehouse1",
  "newQuantity": 200,
  "reason": "stock_count",
  "notes": "Physical count adjustment",
  "costPrice": 18.50,
  "reference": "SC-2024-001"
}
```

## Stock Adjustments API

Record stock adjustments for corrections, damages, and other inventory changes.

### Stock Adjustment Object

```json
{
  "id": "adj_789012345",
  "adjustmentNumber": "ADJ-2024-0001",
  "date": "2024-01-15",
  "type": "positive",
  "reason": "stock_count",
  "status": "posted",
  "locationId": "loc_warehouse1",
  "location": {
    "id": "loc_warehouse1",
    "name": "Main Warehouse"
  },
  "reference": "SC-2024-001",
  "notes": "Monthly stock count adjustments",
  "items": [
    {
      "id": "adjitem_111",
      "itemId": "item_123456789",
      "itemCode": "WDG-001",
      "itemName": "Premium Widget",
      "currentStock": 150,
      "adjustedStock": 148,
      "adjustmentQuantity": -2,
      "unitCost": 18.50,
      "totalCost": -37.00,
      "reason": "damaged",
      "notes": "Found 2 damaged units during inspection"
    },
    {
      "id": "adjitem_222",
      "itemId": "item_987654321",
      "itemCode": "WDG-002",
      "itemName": "Advanced Widget",
      "currentStock": 75,
      "adjustedStock": 80,
      "adjustmentQuantity": 5,
      "unitCost": 25.00,
      "totalCost": 125.00,
      "reason": "found",
      "notes": "Found additional stock in storage area"
    }
  ],
  "totalValue": 88.00,
  "createdBy": "user_456",
  "createdAt": "2024-01-15T10:30:00Z",
  "postedAt": "2024-01-15T10:35:00Z"
}
```

### List Stock Adjustments

```http
GET /api/v1/inventory/adjustments
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `dateFrom` | string | Adjustments from date (YYYY-MM-DD) |
| `dateTo` | string | Adjustments to date (YYYY-MM-DD) |
| `type` | string | Filter by type (`positive`, `negative`, `mixed`) |
| `reason` | string | Filter by reason (`stock_count`, `damaged`, `found`, `lost`, `expired`) |
| `status` | string | Filter by status (`draft`, `posted`) |
| `locationId` | string | Filter by location |
| `itemId` | string | Filter by item |

### Create Stock Adjustment

```http
POST /api/v1/inventory/adjustments
```

**Request Body:**

```json
{
  "date": "2024-01-15",
  "type": "mixed",
  "reason": "stock_count",
  "locationId": "loc_warehouse1",
  "reference": "SC-2024-001",
  "notes": "Monthly stock count",
  "items": [
    {
      "itemId": "item_123456789",
      "adjustmentQuantity": -2,
      "unitCost": 18.50,
      "reason": "damaged",
      "notes": "Damaged during handling"
    },
    {
      "itemId": "item_987654321",
      "adjustmentQuantity": 5,
      "unitCost": 25.00,
      "reason": "found",
      "notes": "Found in back storage"
    }
  ]
}
```

## Stock Transfers API

Transfer inventory between locations with full tracking. Stock transfers have no approval workflow — if you need a request signed off first, raise a Stock Requisition instead ([Document Approvals](/guides/document-approvals/)).

### Stock Transfer Object

```json
{
  "id": "xfer_345678901",
  "transferNumber": "XFR-2024-0001",
  "date": "2024-01-15",
  "status": "completed",
  "fromLocationId": "loc_warehouse1",
  "fromLocation": {
    "id": "loc_warehouse1",
    "name": "Main Warehouse"
  },
  "toLocationId": "loc_store1",
  "toLocation": {
    "id": "loc_store1",
    "name": "Retail Store 1"
  },
  "reference": "RESTOCK-001",
  "notes": "Weekly restock for retail store",
  "items": [
    {
      "id": "xferitem_111",
      "itemId": "item_123456789",
      "itemCode": "WDG-001",
      "itemName": "Premium Widget",
      "quantityRequested": 50,
      "quantityShipped": 50,
      "quantityReceived": 48,
      "unitCost": 18.50,
      "totalCost": 925.00,
      "notes": "2 units damaged in transit"
    }
  ],
  "shipping": {
    "method": "internal_delivery",
    "trackingNumber": "INT-001-2024",
    "shippedAt": "2024-01-15T09:00:00Z",
    "estimatedDelivery": "2024-01-15T14:00:00Z",
    "actualDelivery": "2024-01-15T13:45:00Z"
  },
  "totalValue": 925.00,
  "releasedBy": "user_789",
  "releasedAt": "2024-01-15T08:30:00Z",
  "receivedBy": "user_012",
  "receivedAt": "2024-01-15T14:00:00Z",
  "receivingNotes": "Received with 2 damaged units",
  "createdBy": "user_456",
  "createdAt": "2024-01-15T08:00:00Z",
  "updatedAt": "2024-01-15T14:00:00Z"
}
```

### List Stock Transfers

```http
GET /api/v1/inventory/transfers
```

### Create Stock Transfer

```http
POST /api/v1/inventory/transfers
```

**Request Body:**

```json
{
  "date": "2024-01-15",
  "fromLocationId": "loc_warehouse1",
  "toLocationId": "loc_store1",
  "reference": "RESTOCK-002",
  "notes": "Emergency restock",
  "items": [
    {
      "itemId": "item_123456789",
      "quantity": 25,
      "notes": "High priority item"
    },
    {
      "itemId": "item_987654321",
      "quantity": 10
    }
  ],
  "remarks": "Replenishment for the weekend promotion"
}
```

### Update Transfer Status

```http
PATCH /api/v1/inventory/transfers/{transferId}/status
```

**Request Body:**

```json
{
  "status": "shipped",
  "notes": "Items shipped via internal delivery",
  "shipping": {
    "method": "internal_delivery",
    "trackingNumber": "INT-002-2024",
    "estimatedDelivery": "2024-01-16T14:00:00Z"
  }
}
```

## Inventory Reports API

Generate comprehensive inventory reports for analysis and compliance.

### Stock Valuation Report

```http
GET /api/v1/inventory/reports/valuation
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `asOfDate` | string | Valuation date (YYYY-MM-DD) |
| `locationId` | string | Specific location |
| `categoryId` | string | Specific category |
| `valuationMethod` | string | Valuation method (`fifo`, `lifo`, `average`, `standard`) |
| `includeZeroStock` | boolean | Include items with zero stock |

**Response:**

```json
{
  "success": true,
  "data": {
    "reportName": "Stock Valuation Report",
    "asOfDate": "2024-01-31",
    "valuationMethod": "average",
    "currency": "MYR",
    "summary": {
      "totalItems": 156,
      "totalQuantity": 12450,
      "totalValue": 186750.00,
      "averageValue": 1199.04
    },
    "byCategory": [
      {
        "categoryId": "cat_electronics",
        "categoryName": "Electronics",
        "totalItems": 45,
        "totalQuantity": 3250,
        "totalValue": 98500.00
      }
    ],
    "byLocation": [
      {
        "locationId": "loc_warehouse1",
        "locationName": "Main Warehouse",
        "totalItems": 120,
        "totalQuantity": 8900,
        "totalValue": 134250.00
      }
    ],
    "items": [
      {
        "itemId": "item_123456789",
        "itemCode": "WDG-001",
        "itemName": "Premium Widget",
        "quantity": 150,
        "averageCost": 18.75,
        "totalValue": 2812.50
      }
    ]
  }
}
```

### Stock Movement Report

```http
GET /api/v1/inventory/reports/movements
```

### Low Stock Report

```http
GET /api/v1/inventory/reports/low-stock
```

### ABC Analysis Report

```http
GET /api/v1/inventory/reports/abc-analysis
```

**Response:**

```json
{
  "success": true,
  "data": {
    "reportName": "ABC Analysis Report",
    "periodFrom": "2024-01-01",
    "periodTo": "2024-01-31",
    "classification": {
      "A": {
        "itemCount": 23,
        "percentage": 15,
        "valuePercentage": 70,
        "totalValue": 130725.00
      },
      "B": {
        "itemCount": 47,
        "percentage": 30,
        "valuePercentage": 20,
        "totalValue": 37350.00
      },
      "C": {
        "itemCount": 86,
        "percentage": 55,
        "valuePercentage": 10,
        "totalValue": 18675.00
      }
    },
    "items": [
      {
        "itemId": "item_123456789",
        "itemCode": "WDG-001",
        "itemName": "Premium Widget",
        "classification": "A",
        "annualUsage": 1200,
        "unitCost": 18.50,
        "annualValue": 22200.00,
        "cumulativePercentage": 12.5
      }
    ]
  }
}
```

## Inventory Alerts API

Manage automated alerts for inventory events.

### Alert Types

| Alert Type | Description | Trigger Condition |
|------------|-------------|-------------------|
| `low_stock` | Stock below minimum level | `currentStock <= minimumStock` |
| `out_of_stock` | Item out of stock | `currentStock = 0` |
| `overstock` | Stock above maximum level | `currentStock >= maximumStock` |
| `negative_stock` | Negative stock level | `currentStock < 0` |
| `expiry_warning` | Items nearing expiry | Based on expiry date tracking |
| `reorder_point` | Reorder point reached | `currentStock <= reorderPoint` |

### List Alerts

```http
GET /api/v1/inventory/alerts
```

### Create Alert Rule

```http
POST /api/v1/inventory/alerts/rules
```

**Request Body:**

```json
{
  "name": "Critical Low Stock Alert",
  "type": "low_stock",
  "conditions": {
    "categories": ["cat_electronics"],
    "locations": ["loc_warehouse1", "loc_store1"],
    "threshold": "minimum_stock"
  },
  "notifications": {
    "email": ["inventory@company.com"],
    "webhook": "https://your-app.com/webhooks/inventory",
    "frequency": "immediate"
  },
  "active": true
}
```

## Code Examples

### Complete Inventory Management

```javascript
// Complete inventory management workflow
async function manageInventory() {
  const client = new BigLedgerClient({ /* config */ });
  
  // 1. Create a new item
  const item = await client.items.create({
    itemCode: 'LAPTOP-001',
    name: 'Business Laptop',
    description: 'Professional laptop for business use',
    type: 'inventory',
    pricing: {
      costPrice: 800.00,
      sellingPrice: 1200.00
    },
    inventory: {
      tracked: true,
      minimumStock: 5,
      reorderPoint: 10,
      reorderQuantity: 20
    }
  });
  
  // 2. Add initial stock
  const stockAdjustment = await client.inventory.adjustments.create({
    date: new Date().toISOString().split('T')[0],
    type: 'positive',
    reason: 'initial_stock',
    locationId: 'loc_warehouse1',
    items: [
      {
        itemId: item.id,
        adjustmentQuantity: 50,
        unitCost: 800.00,
        notes: 'Initial stock purchase'
      }
    ]
  });
  
  // 3. Transfer stock to retail location
  const transfer = await client.inventory.transfers.create({
    date: new Date().toISOString().split('T')[0],
    fromLocationId: 'loc_warehouse1',
    toLocationId: 'loc_store1',
    items: [
      {
        itemId: item.id,
        quantity: 15,
        notes: 'Restock for retail store'
      }
    ]
  });
  
  // 4. Check current stock levels
  const stockLevels = await client.inventory.stock.list({
    itemId: item.id
  });
  
  console.log('Stock levels across locations:', stockLevels.data);
  
  // 5. Generate inventory valuation report
  const valuation = await client.inventory.reports.valuation({
    asOfDate: new Date().toISOString().split('T')[0],
    valuationMethod: 'average'
  });
  
  console.log('Total inventory value:', valuation.summary.totalValue);
  
  return {
    item,
    stockAdjustment,
    transfer,
    stockLevels,
    valuation
  };
}
```

### Automated Reorder Management

```python
# Automated reorder management system
async def check_and_reorder():
    client = BigLedgerClient(api_key="...", company_id="...")
    
    # Get items below reorder point
    low_stock_items = await client.get('/inventory/stock', params={
        'lowStock': True,
        'includeReorderInfo': True
    })
    
    reorder_requests = []
    
    for stock in low_stock_items['data']:
        item = stock['item']
        
        # Skip if already on order
        if stock['onOrderStock'] >= item['inventory']['reorderQuantity']:
            continue
        
        # Calculate reorder quantity
        current_stock = stock['currentStock']
        reorder_point = item['inventory']['reorderPoint']
        reorder_qty = item['inventory']['reorderQuantity']
        
        # Create purchase request
        reorder_request = {
            'itemId': item['id'],
            'itemCode': item['itemCode'],
            'itemName': item['name'],
            'currentStock': current_stock,
            'reorderPoint': reorder_point,
            'suggestedQuantity': reorder_qty,
            'supplierId': item.get('supplier', {}).get('id'),
            'estimatedCost': reorder_qty * item['pricing']['costPrice']
        }
        
        reorder_requests.append(reorder_request)
    
    # Generate reorder report
    if reorder_requests:
        report = {
            'date': datetime.now().isoformat(),
            'totalItems': len(reorder_requests),
            'estimatedCost': sum(req['estimatedCost'] for req in reorder_requests),
            'items': reorder_requests
        }
        
        # Send to procurement team
        await send_reorder_notification(report)
    
    return reorder_requests
```

### Real-time Stock Monitoring

```javascript
// Real-time stock monitoring with webhooks
class InventoryMonitor {
  constructor(client) {
    this.client = client;
    this.alerts = new Map();
  }
  
  async setupMonitoring() {
    // Subscribe to inventory webhooks
    const webhook = await this.client.webhooks.create({
      url: 'https://your-app.com/webhooks/inventory',
      events: [
        'inventory.low_stock',
        'inventory.out_of_stock',
        'inventory.adjustment',
        'inventory.transfer'
      ]
    });
    
    console.log('Inventory monitoring webhook created:', webhook.id);
    return webhook;
  }
  
  async handleWebhookEvent(event) {
    switch (event.event) {
      case 'inventory.low_stock':
        await this.handleLowStock(event.data.object);
        break;
      case 'inventory.out_of_stock':
        await this.handleOutOfStock(event.data.object);
        break;
      case 'inventory.adjustment':
        await this.handleAdjustment(event.data.object);
        break;
      case 'inventory.transfer':
        await this.handleTransfer(event.data.object);
        break;
    }
  }
  
  async handleLowStock(stockData) {
    const alertKey = `${stockData.itemId}-${stockData.locationId}`;
    
    // Avoid duplicate alerts
    if (this.alerts.has(alertKey)) {
      return;
    }
    
    this.alerts.set(alertKey, Date.now());
    
    // Send alert notification
    await this.sendAlert({
      type: 'low_stock',
      item: stockData,
      message: `Low stock alert: ${stockData.itemCode} at ${stockData.location.name}`,
      urgency: stockData.currentStock <= 0 ? 'critical' : 'warning'
    });
    
    // Auto-reorder if enabled
    if (stockData.autoReorder) {
      await this.createReorderRequest(stockData);
    }
    
    // Clear alert after 1 hour
    setTimeout(() => {
      this.alerts.delete(alertKey);
    }, 3600000);
  }
  
  async sendAlert(alert) {
    // Implementation depends on your notification system
    console.log('Inventory Alert:', alert);
    
    // Could send email, Slack message, push notification, etc.
    await this.notificationService.send({
      channel: alert.urgency === 'critical' ? '#alerts' : '#inventory',
      message: alert.message,
      data: alert.item
    });
  }
}
```

The Inventory APIs provide comprehensive stock management capabilities with real-time tracking, automated alerts, and detailed reporting for optimal inventory control.