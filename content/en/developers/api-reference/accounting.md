---
description: Complete accounting operations including chart of accounts, journal entries,
  and financial reporting.
tags:
- user-guide
title: Accounting APIs
weight: 10
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Complete accounting operations including chart of accounts, journal entries, and financial reporting. All accounting operations follow double-entry bookkeeping principles.

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

## Chart of Accounts API

Manage your chart of accounts structure with accounts, sub-accounts, and account classifications.

### Account Object

```json
{
  "id": "acc_123456789",
  "accountNumber": "1000",
  "name": "Cash at Bank",
  "type": "asset",
  "category": "current_asset",
  "parentId": null,
  "level": 1,
  "currency": "MYR",
  "description": "Main operating bank account",
  "isActive": true,
  "isSystemAccount": false,
  "balance": {
    "debit": 50000.00,
    "credit": 0.00,
    "net": 50000.00
  },
  "createdAt": "2024-01-01T00:00:00Z",
  "updatedAt": "2024-01-15T10:30:00Z"
}
```

### List Accounts

Retrieve the chart of accounts.

```http
GET /api/v1/accounts
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `type` | string | Filter by account type (`asset`, `liability`, `equity`, `revenue`, `expense`) |
| `category` | string | Filter by account category |
| `active` | boolean | Filter by active status (default: `true`) |
| `level` | integer | Filter by account level (1 = parent accounts) |
| `limit` | integer | Number of records per page (default: 50, max: 100) |
| `cursor` | string | Pagination cursor |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/accounts?type=asset&limit=20" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

**Response:**

```json
{
  "success": true,
  "data": [
    {
      "id": "acc_123456789",
      "accountNumber": "1000",
      "name": "Cash at Bank",
      "type": "asset",
      "category": "current_asset",
      "balance": {
        "debit": 50000.00,
        "credit": 0.00,
        "net": 50000.00
      },
      "isActive": true
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

### Get Account

Retrieve a specific account by ID.

```http
GET /api/v1/accounts/{accountId}
```

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/accounts/acc_123456789" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Create Account

Create a new account in the chart of accounts.

```http
POST /api/v1/accounts
```

**Request Body:**

```json
{
  "accountNumber": "1200",
  "name": "Accounts Receivable",
  "type": "asset",
  "category": "current_asset",
  "parentId": "acc_parent123",
  "currency": "MYR",
  "description": "Customer receivables",
  "isActive": true
}
```

**Required Fields:**
- `accountNumber`: Unique account number
- `name`: Account name
- `type`: Account type (asset, liability, equity, revenue, expense)
- `category`: Account category within the type

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/accounts" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "accountNumber": "1200",
    "name": "Accounts Receivable",
    "type": "asset",
    "category": "current_asset",
    "description": "Customer receivables"
  }'
```

### Update Account

Update an existing account.

```http
PUT /api/v1/accounts/{accountId}
```

**Request Body:**

```json
{
  "name": "Updated Account Name",
  "description": "Updated description",
  "isActive": false
}
```

**Note:** You cannot change `accountNumber`, `type`, or `category` after creation.

### Delete Account

Delete an account (only if it has no transactions).

```http
DELETE /api/v1/accounts/{accountId}
```

## Journal Entries API

Create and manage journal entries for double-entry bookkeeping.

### Journal Entry Object

```json
{
  "id": "je_987654321",
  "journalNumber": "JE-2024-0001",
  "date": "2024-01-15",
  "reference": "Bank Transfer",
  "description": "Transfer from savings to checking",
  "status": "posted",
  "totalDebit": 5000.00,
  "totalCredit": 5000.00,
  "lines": [
    {
      "id": "jel_111",
      "accountId": "acc_checking",
      "accountNumber": "1000",
      "accountName": "Checking Account",
      "description": "Transfer in",
      "debit": 5000.00,
      "credit": 0.00
    },
    {
      "id": "jel_222",
      "accountId": "acc_savings",
      "accountNumber": "1001", 
      "accountName": "Savings Account",
      "description": "Transfer out",
      "debit": 0.00,
      "credit": 5000.00
    }
  ],
  "attachments": [],
  "createdBy": "user_123",
  "createdAt": "2024-01-15T10:30:00Z",
  "postedAt": "2024-01-15T10:35:00Z"
}
```

### List Journal Entries

Retrieve journal entries.

```http
GET /api/v1/journal-entries
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `dateFrom` | string | Start date (YYYY-MM-DD) |
| `dateTo` | string | End date (YYYY-MM-DD) |
| `status` | string | Filter by status (`draft`, `posted`, `void`) |
| `accountId` | string | Filter by account |
| `reference` | string | Search by reference |
| `limit` | integer | Number of records per page |
| `cursor` | string | Pagination cursor |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/journal-entries?dateFrom=2024-01-01&dateTo=2024-01-31" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Create Journal Entry

Create a new journal entry.

```http
POST /api/v1/journal-entries
```

**Request Body:**

```json
{
  "date": "2024-01-15",
  "reference": "INV-2024-001 Payment",
  "description": "Customer payment received",
  "lines": [
    {
      "accountId": "acc_cash",
      "description": "Cash received",
      "debit": 1000.00,
      "credit": 0.00
    },
    {
      "accountId": "acc_receivable",
      "description": "Customer payment",
      "debit": 0.00,
      "credit": 1000.00
    }
  ]
}
```

**Required Fields:**
- `date`: Transaction date
- `lines`: Array of journal entry lines (minimum 2 lines)
- Each line must have `accountId` and either `debit` or `credit` amount
- Total debits must equal total credits

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/journal-entries" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "date": "2024-01-15",
    "reference": "Payment Receipt",
    "description": "Customer payment",
    "lines": [
      {
        "accountId": "acc_cash",
        "description": "Cash received",
        "debit": 1000.00,
        "credit": 0.00
      },
      {
        "accountId": "acc_receivable", 
        "description": "Customer payment",
        "debit": 0.00,
        "credit": 1000.00
      }
    ]
  }'
```

### Post Journal Entry

Post a draft journal entry to make it final.

```http
POST /api/v1/journal-entries/{journalEntryId}/post
```

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/journal-entries/je_987654321/post" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Void Journal Entry

Void a posted journal entry (creates reversing entry).

```http
POST /api/v1/journal-entries/{journalEntryId}/void
```

**Request Body:**

```json
{
  "reason": "Duplicate entry",
  "voidDate": "2024-01-16"
}
```

## Financial Reports API

Generate standard financial reports with real-time data.

### Balance Sheet

Generate a balance sheet report.

```http
GET /api/v1/reports/balance-sheet
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `asOfDate` | string | Report date (YYYY-MM-DD, default: today) |
| `currency` | string | Report currency (default: company currency) |
| `format` | string | Response format (`json`, `pdf`, `excel`) |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/reports/balance-sheet?asOfDate=2024-01-31" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

**Response:**

```json
{
  "success": true,
  "data": {
    "reportName": "Balance Sheet",
    "companyName": "Acme Corporation",
    "asOfDate": "2024-01-31",
    "currency": "MYR",
    "assets": {
      "currentAssets": {
        "total": 150000.00,
        "accounts": [
          {
            "accountId": "acc_cash",
            "accountNumber": "1000",
            "accountName": "Cash at Bank",
            "balance": 50000.00
          },
          {
            "accountId": "acc_receivable",
            "accountNumber": "1200", 
            "accountName": "Accounts Receivable",
            "balance": 75000.00
          },
          {
            "accountId": "acc_inventory",
            "accountNumber": "1300",
            "accountName": "Inventory",
            "balance": 25000.00
          }
        ]
      },
      "fixedAssets": {
        "total": 200000.00,
        "accounts": [
          {
            "accountId": "acc_equipment",
            "accountNumber": "1500",
            "accountName": "Equipment",
            "balance": 200000.00
          }
        ]
      },
      "totalAssets": 350000.00
    },
    "liabilities": {
      "currentLiabilities": {
        "total": 50000.00,
        "accounts": [
          {
            "accountId": "acc_payable",
            "accountNumber": "2000",
            "accountName": "Accounts Payable",
            "balance": 30000.00
          },
          {
            "accountId": "acc_accrued",
            "accountNumber": "2100",
            "accountName": "Accrued Expenses",
            "balance": 20000.00
          }
        ]
      },
      "longTermLiabilities": {
        "total": 100000.00,
        "accounts": [
          {
            "accountId": "acc_loan",
            "accountNumber": "2500",
            "accountName": "Long-term Loan",
            "balance": 100000.00
          }
        ]
      },
      "totalLiabilities": 150000.00
    },
    "equity": {
      "total": 200000.00,
      "accounts": [
        {
          "accountId": "acc_capital",
          "accountNumber": "3000",
          "accountName": "Share Capital",
          "balance": 100000.00
        },
        {
          "accountId": "acc_retained",
          "accountNumber": "3200",
          "accountName": "Retained Earnings",
          "balance": 100000.00
        }
      ]
    },
    "totalLiabilitiesAndEquity": 350000.00,
    "balanced": true
  }
}
```

### Profit & Loss Statement

Generate a profit and loss statement.

```http
GET /api/v1/reports/profit-loss
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `periodFrom` | string | Start date (YYYY-MM-DD) |
| `periodTo` | string | End date (YYYY-MM-DD) |
| `currency` | string | Report currency |
| `format` | string | Response format |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/reports/profit-loss?periodFrom=2024-01-01&periodTo=2024-01-31" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Trial Balance

Generate a trial balance report.

```http
GET /api/v1/reports/trial-balance
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `asOfDate` | string | Report date (YYYY-MM-DD) |
| `includeZeroBalances` | boolean | Include accounts with zero balance |
| `currency` | string | Report currency |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/reports/trial-balance?asOfDate=2024-01-31" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Cash Flow Statement

Generate a cash flow statement.

```http
GET /api/v1/reports/cash-flow
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `periodFrom` | string | Start date (YYYY-MM-DD) |
| `periodTo` | string | End date (YYYY-MM-DD) |
| `method` | string | Cash flow method (`direct`, `indirect`) |

### Account Ledger

Get detailed transactions for a specific account.

```http
GET /api/v1/accounts/{accountId}/ledger
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `dateFrom` | string | Start date |
| `dateTo` | string | End date |
| `limit` | integer | Number of transactions |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/accounts/acc_123456789/ledger?dateFrom=2024-01-01&dateTo=2024-01-31" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

## Account Types and Categories

BigLedger supports standard accounting classification:

### Asset Accounts

| Category | Description | Examples |
|----------|-------------|----------|
| `current_asset` | Assets that can be converted to cash within a year | Cash, Accounts Receivable, Inventory |
| `fixed_asset` | Long-term assets | Equipment, Buildings, Vehicles |
| `other_asset` | Other asset types | Prepaid Expenses, Deposits |

### Liability Accounts

| Category | Description | Examples |
|----------|-------------|----------|
| `current_liability` | Debts due within a year | Accounts Payable, Accrued Expenses |
| `long_term_liability` | Long-term debts | Loans, Mortgages |
| `other_liability` | Other liability types | Deferred Revenue |

### Equity Accounts

| Category | Description | Examples |
|----------|-------------|----------|
| `equity` | Owner's equity | Share Capital, Retained Earnings |

### Revenue Accounts

| Category | Description | Examples |
|----------|-------------|----------|
| `operating_revenue` | Primary business income | Sales Revenue, Service Revenue |
| `other_revenue` | Non-operating income | Interest Income, Investment Gains |

### Expense Accounts

| Category | Description | Examples |
|----------|-------------|----------|
| `cost_of_goods_sold` | Direct costs | Raw Materials, Direct Labor |
| `operating_expense` | Business operating costs | Rent, Utilities, Salaries |
| `other_expense` | Non-operating costs | Interest Expense, Bank Fees |

## Error Handling

Common error responses:

### 400 Bad Request - Invalid Journal Entry

```json
{
  "success": false,
  "error": {
    "code": "INVALID_JOURNAL_ENTRY",
    "message": "Journal entry is not balanced",
    "details": [
      {
        "field": "lines",
        "message": "Total debits (1000.00) do not equal total credits (800.00)"
      }
    ]
  }
}
```

### 404 Not Found - Account Not Found

```json
{
  "success": false,
  "error": {
    "code": "ACCOUNT_NOT_FOUND",
    "message": "Account with ID 'acc_invalid' not found"
  }
}
```

### 422 Unprocessable Entity - Account in Use

```json
{
  "success": false,
  "error": {
    "code": "ACCOUNT_IN_USE",
    "message": "Cannot delete account with existing transactions",
    "details": [
      {
        "transactionCount": 15,
        "lastTransactionDate": "2024-01-15"
      }
    ]
  }
}
```

## Best Practices

### Journal Entry Creation

1. **Always Balance Entries**: Ensure total debits equal total credits
2. **Use Descriptive References**: Include invoice numbers, payment references
3. **Consistent Dating**: Use business dates, not system timestamps
4. **Proper Account Selection**: Use appropriate account types and categories

### Account Management

1. **Standardized Numbering**: Use consistent account numbering schemes
2. **Hierarchical Structure**: Organize accounts in logical parent-child relationships
3. **Currency Consistency**: Match account currency with transaction currency
4. **Active Status**: Deactivate instead of deleting accounts with history

### Reporting

1. **Date Ranges**: Use appropriate periods for P&L reports
2. **Currency Conversion**: Specify currency for multi-currency reporting
3. **Zero Balances**: Consider excluding zero-balance accounts for cleaner reports
4. **Caching**: Reports are cached for 15 minutes for performance

## Code Examples

### Creating a Complete Sales Transaction

```javascript
// Create a complete sales transaction with customer payment
async function recordSale() {
  const client = new BigLedgerClient({ /* config */ });
  
  // Step 1: Create the sale journal entry
  const saleEntry = await client.journalEntries.create({
    date: '2024-01-15',
    reference: 'INV-2024-001',
    description: 'Product sales',
    lines: [
      {
        accountId: 'acc_receivable',
        description: 'Sales to customer',
        debit: 1060.00,
        credit: 0.00
      },
      {
        accountId: 'acc_sales_revenue',
        description: 'Product sales',
        debit: 0.00,
        credit: 1000.00
      },
      {
        accountId: 'acc_sales_tax',
        description: 'SST collected',
        debit: 0.00,
        credit: 60.00
      }
    ]
  });
  
  // Step 2: Record customer payment
  const paymentEntry = await client.journalEntries.create({
    date: '2024-01-16',
    reference: 'PAY-2024-001',
    description: 'Customer payment for INV-2024-001',
    lines: [
      {
        accountId: 'acc_cash',
        description: 'Payment received',
        debit: 1060.00,
        credit: 0.00
      },
      {
        accountId: 'acc_receivable',
        description: 'Customer payment',
        debit: 0.00,
        credit: 1060.00
      }
    ]
  });
  
  return { saleEntry, paymentEntry };
}
```

### Generating Monthly Financial Reports

```python
# Generate complete monthly financial reports
async def generate_monthly_reports(year, month):
    client = BigLedgerClient(api_key="...", company_id="...")
    
    # Calculate date range
    period_start = f"{year}-{month:02d}-01"
    last_day = calendar.monthrange(year, month)[1]
    period_end = f"{year}-{month:02d}-{last_day:02d}"
    
    # Generate reports
    reports = {
        'balance_sheet': await client.get(f"/reports/balance-sheet?asOfDate={period_end}"),
        'profit_loss': await client.get(f"/reports/profit-loss?periodFrom={period_start}&periodTo={period_end}"),
        'trial_balance': await client.get(f"/reports/trial-balance?asOfDate={period_end}"),
        'cash_flow': await client.get(f"/reports/cash-flow?periodFrom={period_start}&periodTo={period_end}")
    }
    
    return reports
```

The Accounting APIs provide complete double-entry bookkeeping functionality with real-time financial reporting. All operations maintain data integrity and follow standard accounting principles.