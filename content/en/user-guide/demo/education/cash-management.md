---
title: "Cash Management & Banking"
description: "Evaluate cashbook management, bank reconciliation, and internet banking integration"
weight: 6
---

This section covers the Cash Management and Internet Banking functionality as specified in UTM Tender Requirement 9.56. Our system provides comprehensive cash and bank account management with modern banking integration capabilities.

## Overview

The Cash Management module provides:
- **Cashbook Management** - Multiple bank and cash accounts
- **Settlement Methods** - Various payment types configuration
- **Inter-Account Transfers** - Cash and bank transfers
- **Bank Reconciliation** - Automated statement matching
- **Internet Banking Integration** - Payment gateway connectivity
- **Cash Flow Reporting** - Real-time cash position

## Test Scenario 1: Cashbook Setup and Viewing

### Objective
Verify the system's bank account and cashbook management (Requirement 9.56a).

### Steps to Follow

1. **Login** to the demo system
2. **Navigate** to: `Finance` → `Cashbook` → `Cashbook List`
3. **View** the list of configured bank accounts
4. **Select** a cashbook to view details

### What to Verify

**Cashbook Information:**
| Field | Description |
|-------|-------------|
| Account Name | Bank/Cash account name |
| Account Number | Bank account number |
| Bank Name | Financial institution |
| Currency | Account currency |
| GL Code | Linked General Ledger account |
| Current Balance | Real-time balance |

### Expected Results
- All bank accounts listed
- Balance information current
- GL linkage visible
- Transaction history accessible

---

## Test Scenario 2: Payment Gateway Integration

### Objective
Verify integration with UTM's main payment gateway (Requirement 9.56b).

### Steps to Follow

1. **Navigate** to: `Finance` → `Cashbook` → `Settings` → `Payment Gateway`
2. **View** the configured payment gateways
3. **Observe** the integration capabilities

### What to Verify

**Payment Gateway Features:**
| Gateway Type | Capabilities |
|--------------|-------------|
| FPX (Online Banking) | Real-time bank transfers |
| Credit/Debit Cards | Visa, Mastercard processing |
| E-Wallets | Touch n Go, Boost, GrabPay |
| Direct Debit | Recurring payments |

### Expected Results
- Multiple payment gateways configurable
- Transaction status tracking
- Automatic reconciliation
- Fee management

---

## Test Scenario 3: Bank File Generation for IBG/GIRO

### Objective
Test bank file generation for batch payments (Requirement 9.56c).

### Steps to Follow

1. **Navigate** to: `Finance` → `Accounts Payable` → `Payment Processing`
2. **Select** approved invoices for payment
3. **Choose** Bank Transfer method
4. **Generate** bank file

### What to Verify

**Bank File Features:**
| Feature | Capability |
|---------|------------|
| File Format | Bank-specific formats (CIMB, Maybank, etc.) |
| Batch Processing | Multiple payments in one file |
| Validation | Account number verification |
| Audit Trail | Complete payment tracking |

### Expected Results
- Bank file generated in correct format
- Download available for bank upload
- Payment status tracked
- Reconciliation support

---

## Test Scenario 4: Settlement Method Configuration

### Objective
Test the payment method setup capabilities.

### Steps to Follow

1. **Navigate** to: `Finance` → `Cashbook` → `Settlement Method`
2. **View** configured settlement methods
3. **Create** or edit a settlement method

### What to Verify

**Settlement Method Types:**
| Type | Description |
|------|-------------|
| Bank Transfer | IBG, GIRO, RENTAS |
| Cash | Physical cash handling |
| Cheque | Cheque payments |
| Credit Card | Card payments |
| Debit Card | Card payments |
| E-Wallet | Digital wallet payments |

### Expected Results
- Multiple payment types configurable
- Branch-level restrictions
- GL account mapping
- Bank charge configuration

---

## Test Scenario 5: Inter-Account Cash Transfer

### Objective
Test fund transfer between bank accounts.

### Steps to Follow

1. **Navigate** to: `Finance` → `Cashbook` → `Cash Transfer`
2. **Create** a new transfer:
   - **From Cashbook:** Main Operating Account
   - **To Cashbook:** Petty Cash Fund
   - **Amount:** RM 5,000
   - **Reference:** Transfer for petty cash replenishment
3. **Submit** and finalize

### What to Verify

**Transfer Features:**
- Real-time balance validation
- Both accounts updated simultaneously
- GL journal automatically created
- Audit trail recorded

### Expected Results
- Transfer completed successfully
- Both cashbook balances updated
- Journal entry posted
- Transfer history accessible

---

## Test Scenario 6: Bank Reconciliation

### Objective
Test the bank statement reconciliation process.

### Steps to Follow

1. **Navigate** to: `Finance` → `Bank Reconciliation` → `New Session`
2. **Create** reconciliation session:
   - **Cashbook:** Select bank account
   - **Opening Date:** Start of period
   - **Closing Date:** End of period
   - **Opening Balance:** Bank statement opening
3. **Upload** bank statement (CSV format)
4. **Run** auto-matching

### What to Verify

**Reconciliation Features:**
| Feature | Capability |
|---------|------------|
| Statement Upload | CSV, Excel, MT940 formats |
| Auto-Matching | Rule-based transaction matching |
| Manual Matching | For exceptions |
| Unmatched Items | Clear identification |
| Reports | Reconciliation summary |

### Expected Results
- Statement uploaded and parsed
- Transactions automatically matched
- Unmatched items highlighted
- Reconciliation report available

---

## Test Scenario 7: Auto-Matching Rules

### Objective
Test the automated matching configuration.

### Steps to Follow

1. **Navigate** to: `Finance` → `Bank Reconciliation` → `Settings` → `Matching Rules`
2. **View** configured rules
3. **Observe** the matching criteria

### What to Verify

**Matching Criteria:**
| Criteria | Description |
|----------|-------------|
| Amount | Exact or tolerance-based |
| Date | Transaction date range |
| Reference | Reference number matching |
| Description | Description keyword matching |
| Check Number | Cheque number matching |

### Expected Results
- Configurable matching rules
- Priority-based application
- Confidence level scoring
- Override capability

---

## Test Scenario 8: Cash Position Report

### Objective
Test real-time cash position reporting.

### Steps to Follow

1. **Navigate** to: `Finance` → `Cashbook` → `Reports` → `Cash Position`
2. **Generate** the report
3. **View** cash levels across all accounts

### What to Verify

**Report Features:**
| Element | Information |
|---------|-------------|
| Opening Balance | Start of period balance |
| Receipts | Total inflows |
| Payments | Total outflows |
| Closing Balance | Current balance |
| Projected | Forecasted cash position |

### Expected Results
- All bank accounts summarized
- Real-time balance reflection
- Currency-wise breakdown
- Export capability (Excel, PDF)

---

## Test Scenario 9: Cashbook Transaction Query

### Objective
Test detailed transaction querying.

### Steps to Follow

1. **Navigate** to: `Finance` → `Cashbook` → `Query Cashbook Transaction`
2. **Select** a cashbook
3. **Set** date range
4. **Generate** report

### What to Verify

**Transaction Details:**
- Transaction date
- Document reference
- Description
- Debit/Credit amounts
- Running balance
- Source document link

### Expected Results
- Complete transaction listing
- Drill-down to source documents
- Export functionality
- Print capability

---

## Key Features Demonstrated

### Cashbook Management
- Multiple bank accounts
- Multi-currency support
- Real-time balance updates
- GL integration

### Payment Processing
- Multiple payment methods
- Bank file generation
- Payment gateway integration
- Batch processing

### Reconciliation
- Automated matching
- Exception handling
- Comprehensive reporting
- Audit trail

### Internet Banking
- Payment gateway connectivity
- Real-time transaction processing
- Security features
- Transaction tracking

---

## Advanced Features

### Cash Flow Forecasting
- Projected receipts and payments
- Historical trend analysis
- Working capital planning
- Alert configuration

### Bank Integration
- Direct bank feeds (where available)
- Real-time balance checking
- Automated reconciliation
- Payment status updates

### Security Features
- Dual authorization for transfers
- Amount limits per user
- Audit logging
- Segregation of duties

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| View Cashbooks | Finance → Cashbook → Cashbook List |
| Settlement Methods | Finance → Cashbook → Settlement Method |
| Cash Transfer | Finance → Cashbook → Cash Transfer |
| Bank Reconciliation | Finance → Bank Reconciliation |
| Cash Position | Finance → Cashbook → Reports → Cash Position |
| Transaction Query | Finance → Cashbook → Query Cashbook Transaction |

---

## Related Documentation

For detailed technical documentation:
- [Cashbook Applet](/applets/cashbook-applet/)
- [Bank Reconciliation Applet](/applets/bank-reconciliation-applet/)
- [Bank Reconciliation Guide](/guides/accounting-guides/bank-reconciliation-guide/)

---

## Next Steps

After evaluating Cash Management, proceed to:

{{< cards >}}
  {{< card link="../asset-management" title="Asset Management" subtitle="Test asset tracking and depreciation" >}}
  {{< card link="../financial-reporting" title="Financial Reporting" subtitle="Test financial statement generation" >}}
{{< /cards >}}
