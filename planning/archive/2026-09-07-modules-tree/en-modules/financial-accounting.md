---
title: "Financial Accounting Module"
description: "Complete financial management and accounting system with multi-currency, multi-entity support"
weight: 20
tags:
- user-guide
---

## Overview

The Financial Accounting Module provides comprehensive, standards-compliant accounting through specialized applets working together. Designed for businesses of all sizes, it delivers real-time financial insights while maintaining audit compliance.

## Module Composition

### Core Applets (Primary Functions)
- **General Ledger Applet** - Main accounting engine
- **Journal Entry Applet** - Manual journal entries
- **Financial Reports Applet** - Balance sheet, P&L, cash flow
- **Bank Reconciliation Applet** - Bank statement matching
- **Period End Closing Applet** - Month/year-end processes

### Shared Applets (From Core Module)
- **[Chart of Accounts Applet](/applets/chart-of-account-applet/)** - Account structure
- **[Tax Configuration Applet](/applets/tax-configuration-applet/)** - Standard tax setup
- **[Tax Config Applet](/applets/tax-config-applet/)** - Advanced tax configuration
- **[SST Applet](/applets/sst-applet/)** - Malaysian SST reporting
- **[Cashbook Applet](/applets/cashbook-applet/)** - Cash management
- **[Organization Applet](/applets/organization-applet/)** - Multi-entity
- **[Customer Maintenance](/applets/master-data/customer-maintenance-applet/)** - AR master data
- **[Supplier Maintenance](/applets/supplier-maintenance-applet/)** - AP master data

### Optional Enhancement Applets
- **Budget Management Applet** - Budget vs actual
- **Fixed Assets Applet** - Asset depreciation
- **Cost Center Applet** - Department accounting
- **Inter-Company Applet** - Multi-entity transactions

The BigLedger Financial Accounting module provides a comprehensive, standards-compliant accounting system designed for businesses of all sizes. Built with GAAP, IFRS, and local accounting standards in mind, it offers real-time financial insights while maintaining the rigor required for audit compliance.

## Core Concepts

### Double-Entry Accounting

BigLedger implements true double-entry bookkeeping where every transaction affects at least two accounts:

```
Debit Account A = Credit Account B

Example: Sale of $1,000
Debit: Accounts Receivable $1,000
Credit: Sales Revenue $1,000
```

### Chart of Accounts Structure

```
1000-1999: Assets
  1000-1099: Current Assets
    1000: Cash and Cash Equivalents
    1010: Petty Cash
    1020: Bank Accounts
    1100: Accounts Receivable
    1200: Inventory
  1500-1599: Fixed Assets
    1500: Property, Plant & Equipment
    1550: Accumulated Depreciation

2000-2999: Liabilities  
  2000-2099: Current Liabilities
    2000: Accounts Payable
    2100: Accrued Expenses
    2200: Taxes Payable
  2500-2599: Long-term Liabilities
    2500: Long-term Debt
    2600: Deferred Tax Liabilities

3000-3999: Equity
  3000: Common Stock
  3100: Retained Earnings
  3200: Additional Paid-in Capital

4000-4999: Revenue
  4000: Product Sales
  4100: Service Revenue
  4200: Other Income

5000-5999: Cost of Goods Sold
  5000: Direct Materials
  5100: Direct Labor
  5200: Manufacturing Overhead

6000-6999: Operating Expenses
  6000: Salaries and Wages
  6100: Rent Expense
  6200: Utilities
  6300: Marketing
  6400: Professional Fees
```

## Key Features

### 📊 General Ledger

#### Transaction Management
- **Journal Entries**: Manual and automated entries
- **Recurring Entries**: Scheduled recurring transactions
- **Reversing Entries**: Automatic reversal capabilities
- **Batch Processing**: Bulk transaction imports
- **Multi-currency**: Automatic exchange rate calculations
- **Audit Trail**: Complete transaction history

#### Account Management
- **Flexible COA**: Customizable chart of accounts
- **Account Groups**: Hierarchical account structure
- **Sub-accounts**: Unlimited sub-account levels
- **Cost Centers**: Department/project tracking
- **Account Reconciliation**: Bank and inter-company reconciliation
- **Opening Balances**: Historical data import

### 💰 Accounts Payable (AP)

#### Vendor Management
- **Vendor Database**: Comprehensive vendor profiles
- **Payment Terms**: Flexible payment term configuration
- **Credit Limits**: Vendor credit management
- **1099 Tracking**: US tax reporting
- **Vendor Portal**: Self-service vendor access

#### Purchase Processing

The complete purchase-to-pay workflow:

1. **Purchase Requisition**
   - Department request
   - Budget validation
   - Approval routing

2. **Purchase Order**
   - Vendor selection
   - Price negotiation
   - Terms agreement

3. **Goods Receipt**
   - Quantity verification
   - Quality check
   - Three-way matching

4. **Invoice Processing**
   - OCR invoice capture
   - Automatic matching
   - Review before posting (purchase invoices have no approval workflow)

5. **Payment**
   - Payment scheduling
   - Batch payments
   - Electronic payments

#### Payment Features
- **Payment Runs**: Automated payment processing
- **Check Printing**: MICR check printing
- **ACH/Wire**: Electronic payment support
- **Foreign Payments**: International wire transfers
- **Payment Matching**: Automatic reconciliation
- **Early Payment Discounts**: Discount optimization

### 💳 Accounts Receivable (AR)

#### Customer Management
- **Customer Database**: 360-degree customer view
- **Credit Management**: Credit limits and terms
- **Aging Analysis**: Detailed aging reports
- **Collection Management**: Automated reminders
- **Customer Portal**: Self-service portal
- **Statement Generation**: Automatic statements

#### Billing & Invoicing
- **Invoice Templates**: Customizable invoice designs
- **Recurring Invoices**: Subscription billing
- **Pro-forma Invoices**: Quote to invoice conversion
- **Credit Notes**: Returns and adjustments
- **Multi-currency Billing**: Foreign currency invoices
- **Tax Calculation**: Automatic tax computation

#### Collections Workflow

Automated collection rules based on aging:

| Days Overdue | Action | Template |
|-------------|--------|----------|
| 0 | Send invoice | Standard invoice |
| 15 | Send reminder | Friendly reminder |
| 30 | Send notice | Payment notice |
| 60 | Escalate | Collections team |
| 90 | Legal action | Legal department |

### 🏦 Cash Management

#### Bank Integration
- **Bank Feeds**: Automatic transaction import
- **Bank Reconciliation**: Smart matching algorithms
- **Multi-bank Support**: Manage multiple accounts
- **Cash Forecasting**: Predictive cash flow
- **Sweep Accounts**: Automatic fund transfers

#### Cash Operations
- **Cash Position**: Real-time cash visibility
- **Payment Gateway**: Integrated payment processing
- **Petty Cash**: Petty cash management
- **Cash Journals**: Manual cash entries
- **Float Management**: Check float tracking

### 📈 Financial Reporting

#### Standard Reports

##### Income Statement (P&L)
- Revenue breakdown by category
- Cost of goods sold analysis
- Operating expense details
- EBITDA calculations
- Net profit margins
- Period comparisons

##### Balance Sheet
- Asset categorization
- Liability tracking
- Equity movements
- Working capital analysis
- Financial ratios
- Trend analysis

##### Cash Flow Statement
- Operating activities
- Investing activities
- Financing activities
- Free cash flow analysis
- Cash conversion cycle
- Liquidity metrics

#### Custom Reports
- **Report Builder**: Drag-and-drop report designer
- **Financial Ratios**: Automated ratio calculations
- **Variance Analysis**: Budget vs actual comparisons
- **Trend Analysis**: Period-over-period comparisons
- **Consolidated Reports**: Multi-entity consolidation
- **Segment Reporting**: Business unit analysis

### 🌍 Multi-Entity Management

#### Entity Structure

Support for complex organizational structures:

```
Parent Company
├── Subsidiary A (USA)
│   ├── Division 1
│   └── Division 2
├── Subsidiary B (Europe)
│   ├── Germany Branch
│   └── France Branch
└── Subsidiary C (Asia)
    ├── Singapore Office
    └── Hong Kong Office
```

#### Consolidation Features
- **Automated Elimination**: Inter-company transactions
- **Currency Translation**: Foreign subsidiary consolidation
- **Minority Interest**: Non-controlling interest calculations
- **Transfer Pricing**: Inter-company pricing rules
- **Consolidated Reporting**: Group financial statements

### 📋 Compliance & Audit

#### Tax Compliance
- **Sales Tax**: Multi-jurisdiction tax support
- **VAT/GST**: Value-added tax management
- **Income Tax**: Tax provision calculations
- **Tax Returns**: Automated tax return preparation
- **E-invoicing**: Government e-invoice compliance
- **BEPS Reporting**: International tax reporting

#### Audit Features
- **Audit Trail**: Complete transaction history
- **Document Management**: Supporting document storage
- **User Activity Logs**: Detailed access logs
- **Approval Workflows**: Optional multi-level approvals on purchase requisitions, purchase orders and stock requisitions
- **Segregation of Duties**: Role-based permissions
- **Period Locking**: Prevent unauthorized changes

### 🔄 Period-End Processing

#### Month-End Checklist
- Complete all transactions for the period
- Run bank reconciliations
- Post depreciation entries
- Accrue expenses
- Defer revenues
- Run allocation rules
- Reconcile inter-company accounts
- Review and post adjusting entries
- Generate preliminary reports
- Management review and approval
- Lock the period
- Generate final reports
- Backup data

#### Year-End Processing
- **Closing Entries**: Automated closing process
- **Retained Earnings**: Automatic rollover
- **1099 Generation**: Vendor tax forms
- **Financial Statements**: Annual report generation
- **Audit Preparation**: Audit schedule preparation
- **Tax Package**: Tax return support documents

## Configuration

### Initial Setup

#### Step 1: Company Configuration

Define your company structure and accounting preferences:

```yaml
Company:
  Name: Your Company Name
  Tax ID: XX-XXXXXXX
  Fiscal Year: January - December
  Functional Currency: USD
  Reporting Currency: USD
  Accounting Standards: GAAP
  Industry: Your Industry
```

#### Step 2: Chart of Accounts Setup

1. **Import Standard COA**
   - Select industry template
   - Review account structure
   - Customize as needed

2. **Configure Account Properties**
   - Set account types
   - Define normal balances
   - Configure reconciliation settings
   - Set up cost centers

#### Step 3: Opening Balances

Import your existing trial balance to get started quickly:

1. Prepare trial balance in CSV format
2. Map accounts to BigLedger COA
3. Import and verify balances
4. Ensure debits equal credits

### Tax Configuration

#### Sales Tax Setup

Configure multi-jurisdiction tax rules:

```javascript
{
  "tax_rules": [
    {
      "jurisdiction": "CA",
      "rate": 0.0725,
      "components": [
        {"name": "State Tax", "rate": 0.06},
        {"name": "County Tax", "rate": 0.0125}
      ]
    },
    {
      "jurisdiction": "NY",
      "rate": 0.08,
      "exemptions": ["food", "medicine"]
    }
  ]
}
```

#### VAT Configuration

For international operations:

- Standard Rate: 20%
- Reduced Rate: 5%
- Zero Rate: 0%
- Exempt: No VAT
- Reverse Charge support

## Integration

### ERP Module Integration

The Financial Accounting module seamlessly integrates with all other BigLedger modules:

- **Point of Sale**: Automatic sales recording
- **Inventory**: COGS calculations and valuation
- **Procurement**: Purchase order and invoice processing
- **HR/Payroll**: Salary and expense postings
- **Manufacturing**: Production cost accounting
- **CRM**: Customer credit management

### Banking Integration

#### Supported Banks
- Major US banks (Bank of America, Chase, Wells Fargo, etc.)
- International banks via Open Banking
- Regional and local banks
- Credit unions

#### Integration Methods
1. **Direct API**: Real-time connection
2. **File Import**: OFX, QFX, CSV
3. **Manual Entry**: For unsupported banks

### External Systems

Easy migration from popular accounting systems:

- QuickBooks
- Sage
- Xero
- NetSuite
- SAP
- Oracle Financials

## Best Practices

### Internal Controls

1. **Segregation of Duties**
   - Separate authorization, recording, custody
   - Maker-checker for critical transactions
   - Regular rotation of duties

2. **Approval levels (purchase documents only)**

   BigLedger's approval engine covers Purchase Requisitions, Purchase Orders and Stock
   Requisitions, and only once you configure it. Journals and payment vouchers have no approval
   step at all — for those, segregation of duties is enforced by giving the create right and the
   finalise right to different roles.

   Where approvals do apply, a money figure does not send the document to a *different* approver.
   Each level carries a **Min Approval Amount**, and the number of levels a document must clear is
   the count of levels whose Min Approval Amount is at or below the document total:

   | Level | Approver designation | Min Approval Amount | Applies to |
   |---|---|---|---|
   | 1 | Branch manager | RM 0 | Every purchase order |
   | 2 | Finance director | RM 10,000 | Orders of RM 10,000 and above |

   See [Document Approvals](/guides/document-approvals/) for the full setup.

3. **Reconciliation Schedule**
   - Daily: Cash reconciliation
   - Weekly: Credit card reconciliation
   - Monthly: Bank reconciliation, AR/AP aging
   - Quarterly: Inter-company reconciliation
   - Annually: Full account reconciliation

### Performance Optimization

1. **Database Optimization**
   - Regular index maintenance
   - Partition large tables
   - Archive historical data

2. **Archiving Strategy**
   - Archive transactions older than 7 years
   - Maintain summary data for reporting
   - Compress archived data

### Security Measures

1. **Access Control**
   - Role-based permissions
   - IP restrictions
   - Two-factor authentication
   - Session management

2. **Data Protection**
   - Encryption at rest and in transit
   - Regular backups
   - Disaster recovery plan

## Troubleshooting

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| Out of balance | Missing journal entry leg | Review journal entries, ensure debits = credits |
| Reconciliation mismatch | Timing differences | Check outstanding items, adjust for timing |
| Report discrepancies | Incorrect mapping | Verify account mappings in report configuration |
| Performance issues | Large data volume | Implement archiving, optimize queries |
| Tax calculation errors | Outdated tax tables | Update tax configuration, verify rates |

## Accounting Standards

### Supported Standards
- **US GAAP**: Generally Accepted Accounting Principles
- **IFRS**: International Financial Reporting Standards
- **UK GAAP**: UK accounting standards
- **IND AS**: Indian Accounting Standards
- **PRC GAAP**: Chinese accounting standards

## Support & Resources

- 📚 [Accounting Best Practices Guide](/modules/financial-accounting/)
- 🎥 [Video Tutorials](/modules/financial-accounting/)
- 📊 [Report Templates Library](/modules/financial-accounting/)
- 🤝 [Community Forum](https://forum.bigledger.com/finance)
- 📧 [Expert Support](mailto:finance@bigledger.com)