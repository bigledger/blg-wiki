---
description: Comprehensive reporting API documentation for financial reports, analytics, and business intelligence data.
tags:
- api-reference
- reporting
- analytics
- financial-reports
title: Reporting APIs
weight: 70
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Generate financial reports, analytics dashboards, and business intelligence data programmatically. Access the same reporting capabilities available in BigLedger's Angular interface through REST APIs.

{{< callout type="info" >}}
**Real-time Data**: All reports reflect real-time data from your accounting system. Reports can be generated in multiple formats and scheduled for automated delivery.
{{< /callout >}}

## Base Endpoints

All reporting endpoints are available under:
```
https://api.bigledger.com/v1/reports
```

## Financial Reports

### Balance Sheet

Generate balance sheet reports with comparative periods and drill-down capabilities.

```http
GET /v1/reports/balance-sheet
```

**Query Parameters:**
- `asOfDate` (string, required): Report date (YYYY-MM-DD)
- `comparativePeriod` (string): Comparative period (`previous-month`, `previous-year`, `custom`)
- `compareToDate` (string): Custom comparison date if comparativePeriod is `custom`
- `format` (string): Output format (`json`, `pdf`, `excel`, `csv`)
- `includeDrillDown` (boolean): Include transaction-level details
- `departmentId` (string): Filter by department
- `locationId` (string): Filter by location

**Example Response:**
```json
{
  "success": true,
  "data": {
    "reportType": "balance-sheet",
    "asOfDate": "2024-01-31",
    "currency": "MYR",
    "comparative": {
      "enabled": true,
      "asOfDate": "2024-01-31",
      "compareToDate": "2023-01-31"
    },
    "sections": {
      "assets": {
        "currentAssets": {
          "total": 150000.00,
          "comparativeTotal": 120000.00,
          "variance": 30000.00,
          "variancePercent": 25.0,
          "accounts": [
            {
              "accountId": "acc_123cash",
              "accountCode": "1000",
              "accountName": "Cash and Bank",
              "balance": 45000.00,
              "comparativeBalance": 35000.00,
              "variance": 10000.00,
              "variancePercent": 28.57
            },
            {
              "accountId": "acc_456recv",
              "accountCode": "1200",
              "accountName": "Accounts Receivable",
              "balance": 75000.00,
              "comparativeBalance": 60000.00,
              "variance": 15000.00,
              "variancePercent": 25.0
            },
            {
              "accountId": "acc_789inv",
              "accountCode": "1300",
              "accountName": "Inventory",
              "balance": 30000.00,
              "comparativeBalance": 25000.00,
              "variance": 5000.00,
              "variancePercent": 20.0
            }
          ]
        },
        "nonCurrentAssets": {
          "total": 200000.00,
          "comparativeTotal": 180000.00,
          "variance": 20000.00,
          "variancePercent": 11.11,
          "accounts": [
            {
              "accountId": "acc_ppequip",
              "accountCode": "1500",
              "accountName": "Property, Plant & Equipment",
              "balance": 200000.00,
              "comparativeBalance": 180000.00,
              "variance": 20000.00,
              "variancePercent": 11.11
            }
          ]
        },
        "totalAssets": 350000.00,
        "comparativeTotalAssets": 300000.00
      },
      "liabilities": {
        "currentLiabilities": {
          "total": 80000.00,
          "comparativeTotal": 70000.00,
          "variance": 10000.00,
          "variancePercent": 14.29,
          "accounts": [
            {
              "accountId": "acc_payable",
              "accountCode": "2000",
              "accountName": "Accounts Payable",
              "balance": 50000.00,
              "comparativeBalance": 45000.00,
              "variance": 5000.00,
              "variancePercent": 11.11
            },
            {
              "accountId": "acc_accrued",
              "accountCode": "2100",
              "accountName": "Accrued Expenses",
              "balance": 30000.00,
              "comparativeBalance": 25000.00,
              "variance": 5000.00,
              "variancePercent": 20.0
            }
          ]
        },
        "nonCurrentLiabilities": {
          "total": 120000.00,
          "comparativeTotal": 100000.00,
          "variance": 20000.00,
          "variancePercent": 20.0,
          "accounts": [
            {
              "accountId": "acc_loan",
              "accountCode": "2500",
              "accountName": "Long-term Loan",
              "balance": 120000.00,
              "comparativeBalance": 100000.00,
              "variance": 20000.00,
              "variancePercent": 20.0
            }
          ]
        },
        "totalLiabilities": 200000.00,
        "comparativeTotalLiabilities": 170000.00
      },
      "equity": {
        "total": 150000.00,
        "comparativeTotal": 130000.00,
        "variance": 20000.00,
        "variancePercent": 15.38,
        "accounts": [
          {
            "accountId": "acc_capital",
            "accountCode": "3000",
            "accountName": "Share Capital",
            "balance": 100000.00,
            "comparativeBalance": 100000.00,
            "variance": 0.00,
            "variancePercent": 0.0
          },
          {
            "accountId": "acc_retained",
            "accountCode": "3500",
            "accountName": "Retained Earnings",
            "balance": 50000.00,
            "comparativeBalance": 30000.00,
            "variance": 20000.00,
            "variancePercent": 66.67
          }
        ]
      }
    },
    "balanceCheck": {
      "balanced": true,
      "totalAssets": 350000.00,
      "totalLiabilitiesAndEquity": 350000.00,
      "difference": 0.00
    },
    "generatedAt": "2024-02-01T10:30:00Z",
    "generatedBy": "user_123abc456"
  }
}
```

### Profit & Loss Statement

```http
GET /v1/reports/profit-loss
```

**Query Parameters:**
- `fromDate` (string, required): Start date (YYYY-MM-DD)
- `toDate` (string, required): End date (YYYY-MM-DD)
- `comparativePeriod` (string): Comparative period options
- `compareFromDate` (string): Custom comparison start date
- `compareToDate` (string): Custom comparison end date
- `groupBy` (string): Grouping (`month`, `quarter`, `year`)
- `departmentId` (string): Filter by department
- `format` (string): Output format

<!-- TODO: Add complete P&L API response structure -->

### Trial Balance

```http
GET /v1/reports/trial-balance
```

<!-- TODO: Add trial balance API documentation -->

### Cash Flow Statement

```http
GET /v1/reports/cash-flow
```

<!-- TODO: Add cash flow statement API documentation -->

## Management Reports

### Sales Reports

#### Sales Summary
```http
GET /v1/reports/sales-summary
```

**Query Parameters:**
- `fromDate` (string, required): Start date
- `toDate` (string, required): End date
- `groupBy` (string): `day`, `week`, `month`, `quarter`
- `salesPersonId` (string): Filter by salesperson
- `customerId` (string): Filter by customer
- `productId` (string): Filter by product
- `regionId` (string): Filter by region

<!-- TODO: Add sales summary response structure -->

#### Top Customers Report
```http
GET /v1/reports/top-customers
```

#### Sales by Product Report
```http
GET /v1/reports/sales-by-product
```

#### Sales Performance Dashboard
```http
GET /v1/reports/sales-performance-dashboard
```

### Inventory Reports

#### Stock Valuation
```http
GET /v1/reports/stock-valuation
```

#### Inventory Movement
```http
GET /v1/reports/inventory-movement
```

#### Stock Aging Analysis
```http
GET /v1/reports/stock-aging
```

#### Low Stock Alert
```http
GET /v1/reports/low-stock-alert
```

### Purchasing Reports

#### Purchase Analysis
```http
GET /v1/reports/purchase-analysis
```

#### Supplier Performance
```http
GET /v1/reports/supplier-performance
```

#### Outstanding Purchase Orders
```http
GET /v1/reports/outstanding-purchase-orders
```

### Financial Analysis Reports

#### Aged Receivables
```http
GET /v1/reports/aged-receivables
```

**Example Response:**
```json
{
  "success": true,
  "data": {
    "reportType": "aged-receivables",
    "asOfDate": "2024-01-31",
    "currency": "MYR",
    "agingPeriods": [
      {
        "periodName": "Current",
        "fromDays": 0,
        "toDays": 30,
        "amount": 75000.00,
        "percentage": 50.0
      },
      {
        "periodName": "31-60 Days",
        "fromDays": 31,
        "toDays": 60,
        "amount": 45000.00,
        "percentage": 30.0
      },
      {
        "periodName": "61-90 Days",
        "fromDays": 61,
        "toDays": 90,
        "amount": 22500.00,
        "percentage": 15.0
      },
      {
        "periodName": "Over 90 Days",
        "fromDays": 91,
        "toDays": null,
        "amount": 7500.00,
        "percentage": 5.0
      }
    ],
    "customers": [
      {
        "customerId": "cust_123abc456",
        "customerName": "Acme Corporation",
        "totalOwing": 50000.00,
        "current": 30000.00,
        "days31to60": 15000.00,
        "days61to90": 5000.00,
        "over90days": 0.00,
        "creditLimit": 75000.00,
        "creditUtilization": 66.67,
        "lastPaymentDate": "2024-01-15",
        "lastPaymentAmount": 25000.00
      }
    ],
    "summary": {
      "totalOutstanding": 150000.00,
      "totalCustomers": 45,
      "averageDaysToCollect": 42.5,
      "collectionEfficiency": 85.5
    }
  }
}
```

#### Aged Payables
```http
GET /v1/reports/aged-payables
```

#### Budget vs Actual
```http
GET /v1/reports/budget-vs-actual
```

## Custom Reports

### Report Builder
```http
POST /v1/reports/custom
```

**Request Body:**
```json
{
  "name": "Monthly Sales by Region",
  "description": "Custom report showing monthly sales broken down by region",
  "dataSource": "sales",
  "dateRange": {
    "type": "relative",
    "period": "last_12_months"
  },
  "dimensions": [
    {
      "field": "region",
      "label": "Region",
      "groupBy": true
    },
    {
      "field": "salesMonth",
      "label": "Month",
      "groupBy": true
    }
  ],
  "measures": [
    {
      "field": "totalSales",
      "label": "Total Sales",
      "aggregation": "sum",
      "format": "currency"
    },
    {
      "field": "invoiceCount",
      "label": "Number of Invoices",
      "aggregation": "count"
    }
  ],
  "filters": [
    {
      "field": "customerType",
      "operator": "in",
      "values": ["retail", "wholesale"]
    }
  ],
  "sorting": [
    {
      "field": "salesMonth",
      "direction": "asc"
    },
    {
      "field": "totalSales",
      "direction": "desc"
    }
  ]
}
```

### Saved Reports

#### List Saved Reports
```http
GET /v1/reports/saved
```

#### Get Saved Report
```http
GET /v1/reports/saved/{id}
```

#### Execute Saved Report
```http
POST /v1/reports/saved/{id}/execute
```

## Report Scheduling

### Schedule Reports

```http
POST /v1/reports/schedules
```

**Request Body:**
```json
{
  "reportId": "report_123abc456",
  "name": "Monthly Financial Pack",
  "schedule": {
    "frequency": "monthly",
    "dayOfMonth": 1,
    "time": "09:00",
    "timezone": "Asia/Kuala_Lumpur"
  },
  "parameters": {
    "format": "pdf",
    "includeDrillDown": false
  },
  "recipients": [
    {
      "email": "cfo@company.com",
      "name": "Chief Financial Officer"
    },
    {
      "email": "accounting@company.com",
      "name": "Accounting Team"
    }
  ],
  "emailSubject": "Monthly Financial Reports - {{month}} {{year}}",
  "emailBody": "Please find attached the monthly financial reports for your review.",
  "active": true
}
```

#### List Report Schedules
```http
GET /v1/reports/schedules
```

#### Update Report Schedule
```http
PUT /v1/reports/schedules/{id}
```

#### Delete Report Schedule
```http
DELETE /v1/reports/schedules/{id}
```

## Report Export & Delivery

### Export Formats

#### PDF Export
```http
GET /v1/reports/balance-sheet?format=pdf
```

#### Excel Export
```http
GET /v1/reports/balance-sheet?format=excel
```

#### CSV Export
```http
GET /v1/reports/balance-sheet?format=csv
```

### Email Delivery

```http
POST /v1/reports/{reportType}/email
```

**Request Body:**
```json
{
  "parameters": {
    "asOfDate": "2024-01-31",
    "format": "pdf"
  },
  "recipients": [
    "cfo@company.com",
    "accounting@company.com"
  ],
  "subject": "Balance Sheet as of January 31, 2024",
  "message": "Please find attached the requested balance sheet.",
  "includeAttachment": true,
  "includeLink": true,
  "linkExpiryDays": 7
}
```

## Analytics & KPIs

### Key Performance Indicators

```http
GET /v1/analytics/kpis
```

**Response:**
```json
{
  "success": true,
  "data": {
    "financial": {
      "grossProfitMargin": {
        "current": 35.5,
        "previous": 33.2,
        "change": 2.3,
        "trend": "up"
      },
      "netProfitMargin": {
        "current": 12.8,
        "previous": 14.1,
        "change": -1.3,
        "trend": "down"
      },
      "currentRatio": {
        "current": 1.875,
        "previous": 1.714,
        "change": 0.161,
        "trend": "up"
      },
      "daysOutstanding": {
        "current": 42.5,
        "previous": 38.2,
        "change": 4.3,
        "trend": "down"
      }
    },
    "operational": {
      "inventoryTurnover": {
        "current": 8.5,
        "previous": 7.2,
        "change": 1.3,
        "trend": "up"
      },
      "accountsPayableTurnover": {
        "current": 12.3,
        "previous": 11.8,
        "change": 0.5,
        "trend": "up"
      }
    }
  }
}
```

### Dashboard Data

```http
GET /v1/analytics/dashboard
```

<!-- TODO: Add comprehensive dashboard API -->

## Real-time Reporting

### WebSocket Report Updates

```javascript
// Connect to real-time report updates
const ws = new WebSocket('wss://api.bigledger.com/v1/reports/stream');

ws.send(JSON.stringify({
  "type": "subscribe",
  "channels": ["kpi.updates", "report.completed"],
  "filters": {
    "reportTypes": ["balance-sheet", "profit-loss"]
  }
}));

// Receive real-time updates
ws.onmessage = function(event) {
  const data = JSON.parse(event.data);
  
  if (data.channel === 'kpi.updates') {
    // KPI values updated
    console.log('KPI Updated:', data.data);
  } else if (data.channel === 'report.completed') {
    // Scheduled report completed
    console.log('Report Ready:', data.data);
  }
};
```

## Error Handling

### Common Report Errors

| Error Code | Description | Resolution |
|------------|-------------|------------|
| `INVALID_DATE_RANGE` | Date range is invalid or too large | Check date parameters |
| `REPORT_GENERATION_TIMEOUT` | Report took too long to generate | Try smaller date range or use async generation |
| `INSUFFICIENT_DATA` | Not enough data for meaningful report | Verify transactions exist in date range |
| `INVALID_PARAMETERS` | Report parameters are invalid | Check required parameters |
| `REPORT_NOT_FOUND` | Saved report ID not found | Verify report exists |
| `FORMAT_NOT_SUPPORTED` | Requested format not available | Use supported formats (json, pdf, excel, csv) |

## Report Performance

### Optimization Tips

1. **Use appropriate date ranges**: Smaller ranges generate faster
2. **Limit drill-down data**: Set `includeDrillDown=false` for summary reports
3. **Use async generation**: For large reports, use async endpoints
4. **Cache results**: Implement client-side caching for frequently accessed reports
5. **Filter data**: Use department/location filters to reduce dataset size

### Async Report Generation

For large reports, use async endpoints:

```http
POST /v1/reports/balance-sheet/async
```

**Response:**
```json
{
  "success": true,
  "data": {
    "jobId": "job_123abc456",
    "status": "processing",
    "estimatedCompletion": "2024-01-15T10:35:00Z",
    "downloadUrl": null
  }
}
```

Check job status:
```http
GET /v1/reports/jobs/{jobId}
```

<!-- TODO: Add comprehensive async report processing -->
<!-- TODO: Add report caching strategies -->
<!-- TODO: Add report API rate limiting details -->
<!-- TODO: Add webhook events for report completion -->

## Integration Examples

### Financial Dashboard Integration

```javascript
// Build a comprehensive financial dashboard
async function buildFinancialDashboard() {
  const [balanceSheet, profitLoss, kpis, agedReceivables] = await Promise.all([
    client.reports.balanceSheet({ asOfDate: '2024-01-31' }),
    client.reports.profitLoss({ fromDate: '2024-01-01', toDate: '2024-01-31' }),
    client.analytics.kpis(),
    client.reports.agedReceivables({ asOfDate: '2024-01-31' })
  ]);
  
  return {
    balanceSheet: balanceSheet.data,
    profitLoss: profitLoss.data,
    kpis: kpis.data,
    agedReceivables: agedReceivables.data,
    generatedAt: new Date().toISOString()
  };
}
```

### Automated Report Distribution

```javascript
// Schedule monthly financial package
const schedule = await client.reports.schedules.create({
  reportId: 'financial_package',
  name: 'Monthly Financial Package',
  schedule: {
    frequency: 'monthly',
    dayOfMonth: 1,
    time: '09:00'
  },
  recipients: [
    'cfo@company.com',
    'board@company.com'
  ],
  parameters: {
    format: 'pdf',
    includeComparative: true
  }
});
```