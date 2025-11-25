---
title: "Cashbook Applet"
description: "Cash and bank account management for BigLedger financial operations and cash flow tracking"
tags: core-module, cash-management, bank-accounts, financial-accounting, cash-flow
weight: 9
---

## Overview

The Cashbook Applet is a fundamental Core Module component that manages all cash and bank account operations in BigLedger. This applet provides comprehensive cash management, bank account configuration, payment method setup, and cash flow tracking that supports all financial transactions across every BigLedger module.

Note: Core Module Applet — One of the 13 essential Core Module applets, critical for businesses handling cash transactions, bank payments, or financial operations.

## Primary Functions
- **Cash Account Management** - Physical cash handling and control
- **Bank Account Configuration** - Multiple bank account setup and management
- **Payment Method Setup** - Various payment method configurations
- **Cash Flow Tracking** - Real-time cash position monitoring
- **Bank Reconciliation** - Automated bank statement reconciliation

## Purposes

This SOP aims to:

- **Ensure Procedural Consistency
Standardize all steps involved in BigLedger cashbook and bank account management.

- **Maintain Financial Accuracy
Ensure all bank accounts and cash movements are correctly linked to their respective General Ledger (GL) codes for accurate financial reporting.

- **Streamline Cash Management
Provide clear, auditable guidelines for managing accounts, settlement configurations, and inter-account transfers.

## Key Features and Steps
- **There are few steps that need to be done
{{< tabs items="1. Create New Cashbook,2. Create Settlement Method,3. Choose the Payment Type,4. Link the Payment Method with Branch" >}}
{{< tab >}}
### Creating a New Bank Account (Cashbook)
Proper setup of a new bank account ensures that all financial activity is traceable, accurate, and reflected in the general ledger.

Before a bank account can be used in BigLedger, it must be created as a Cashbook and linked to a valid GL (General Ledger) Code.
**Documentation**: [TODO: POS Terminal Applet](/applets/chart-of-account-applet/) - *Documentation pending*

After the GL code is prepared:

Open the Cashbook menu in the Cashbook applet.

Click Create.

Enter key details:

Name (e.g., “RHB Account”)

Account Number

Select the Company that owns the account.

Assign the Currency (e.g., USD, SGD, MYR).

Link the GL Code created in Section 2.1.

Once saved, proceed to the mandatory configuration of the settlement method.
{{< /tab >}}
{{< /tabs >}}
### Payment Method Setup (Settlement Method)
A Settlement Method defines how a bank account is used in payment or receipt transactions.
This setup is required to use the Cashbook in modules such as:

Receipt Voucher

Payment Voucher

Cash Transfer

POS payments (where applicable)

### Steps

Navigate to Settlement Method.

Click Create.

Fill in:

Code

Name

Description
(You may use the same text for all three fields for consistency.)

Select the corresponding Cashbook.

### Payment Type
The settlement type determines how the method is used in transactions.
Failure to assign a type will prevent it from appearing as a selectable option.

Valid settlement types:

Bank Transfer

Cash

Check

Credit Card

Debit Card

E-wallet

**Configure Automatic Bank Charges (Optional)**
This feature automates the posting of bank or transaction fees (e.g., credit card charges).

Go to the Charges section.

Select the Ratio option.

Enter the fee percentage (e.g., 5%).

When used in a transaction, the system automatically:

Calculates the fee

Posts it to the Bank Charges GL account

### Branch Linking 
To restrict unauthorized access:

Assign the settlement method only to specific branches.

Example:

Enable for HQ

Disable for KB Branch

#### **Inter-Account Transfers**

After ALL Setup Done, sse Cash Transfer to move funds between bank accounts or from cash-on-hand to a bank account.
**1. Create a Cash Transfer**

Go to Cash Transfer.

Click Create.

Select a Transfer Type (Bank In, TT, Cash, etc.).

Choose the Company and Branch.

**2. Enter Transfer Details**

In the Transfer Line section:

Transfer From Cashbook: Source account (Debited)

Transfer To Cashbook: Destination account (Credited)

Amount: Enter the transfer value

Date: Posting date

Remarks: Add a clear description (e.g., “Monthly transfer to salary account”)

Click Add.

**3. Finalize the Transfer**

After reviewing: Click Finalize

Once finalized:

- The transaction is permanently posted
- It cannot be edited or reversed
- It will appear immediately in GL and Cashbook reports
- 
#### **Reports**

**1. Query Cashbook Transaction (Detailed View)**

Use this for detailed reconciliation of one bank account.

Displays:

- Opening Balance
- Transaction Lines
- Amount In (Debit)
- Amount Out (Credit)
- Closing Balance
- Drill-Down Links to source documents

This tool is ideal for month-end or audit reviews.
**2. Cash Level (Summary View)**
Use this for a high-level overview of all balances across multiple cashbooks.

Features:

Shows final balances for each cashbook

Supports grouping (e.g., by company or currency)

Allows drill-down into transaction details

Example of a transfer of 10,000 from CIMB to Hong Leong:

| Cashbook        | Balance Change |
| --------------- | -------------- |
| Hong Leong Bank | +10,000        |
| CIMB Bank       | –10,000        |


6. Summary

This User Guide provides all steps needed to:

Create bank accounts

Configure settlement methods

Execute fund transfers

Review and reconcile bank activity

Following these procedures ensures financial accuracy, compliance, and efficient cash management within BigLedger.


This ensures branch-level segregation of duties and prevents misuse of corporate bank accounts.


POS payments (where applicable)
- Multiple cash accounts (registers, petty cash, etc.)
- Cash denomination tracking and counting
- Daily cash opening and closing procedures
- Cash variance reporting and investigation
- Multi-currency cash handling
- Cash security and control measures

- Proper setup of a new bank account ensures that all financial activity is traceable, accurate, and reflected in the general ledger.

Payment Method Setup 
### Bank Account Configuration
- Multiple bank account setup and management
- Bank account details and connectivity
- Online banking integration
- Bank statement import and processing
- Multi-currency bank account support
- Bank fee and charge management

### Payment Method Setup
- Comprehensive payment method configuration
- Credit card processing integration
- Digital payment method support (e-wallets, etc.)
- Check processing and clearing
- Wire transfer and bank draft handling
- Payment gateway integrations

### Transaction Processing
- Real-time cash and bank transaction recording
- Automated posting to general ledger
- Multi-approval workflows for large transactions
- Transaction categorization and coding
- Reversal and adjustment capabilities
- Batch processing for high-volume transactions

### Reporting and Analysis
- Daily cash position reports
- Bank account balance monitoring
- Cash flow forecasting and analysis
- Payment method performance analysis
- Bank reconciliation reports
- Cash variance and exception reports

## Technical Specifications

### System Requirements
- **Minimum Access Level**: Cash Management Administrator
- **Database Dependencies**: Financial and cash management tables
- **Integration Points**: All financial and transaction modules
- **API Availability**: Real-time transaction processing APIs
- **Security Features**: Multi-level approval and audit trails

### Cash and Bank Configuration Options
- **Account Types**: Cash, Current Account, Savings, Time Deposits
- **Currency Support**: 150+ global currencies
- **Transaction Limits**: Configurable per account and user
- **Approval Workflows**: Multi-level approval processes
- **Integration APIs**: Banking and payment gateway connections

### Performance Parameters
- **Transaction Volume**: Process thousands of transactions per hour
- **Real-time Updates**: Instant balance updates across modules
- **Concurrent Users**: 200+ simultaneous cash operations
- **Report Generation**: Real-time cash position reports
- **Bank Integration**: Real-time bank balance synchronization

## Integration Points

### Core Module Dependencies
- **Chart of Account Applet** - Cash and bank account mapping
- **Tax Configuration Applet** - Payment-related tax handling
- **Organization Applet** - Multi-location cash management
- **Employee Maintenance Applet** - Cash handler authorization

### Module Integration
| Module | Integration Purpose |
|--------|-------------------|
| **Sales & CRM** | Customer payment processing |
| **Purchasing** | Supplier payment processing |
| **Financial Accounting** | General ledger integration |
| **POS** | Point-of-sale cash handling |
| **E-Commerce** | Online payment processing |
| **Payroll** | Employee payment processing |
| **Expense Management** | Expense reimbursements |

### External Integrations
- **Banking Systems** - Online banking and account connectivity
- **Payment Gateways** - Credit card and digital payment processing
- **Cash Management Services** - Armored car and cash services
- **Accounting Software** - Financial data synchronization
- **Treasury Systems** - Corporate treasury management
- **Mobile Banking** - Mobile payment and banking apps

## Configuration Requirements

### Initial Setup Requirements
1. **Company Banking Details** - Business bank account information
2. **Cash Account Setup** - Physical cash locations and registers
3. **Payment Methods** - Configure accepted payment methods
4. **Chart of Accounts Integration** - Map to appropriate GL accounts
5. **Security Settings** - Cash handling authorization levels

### Essential Configurations
- **Bank Accounts**: Primary operating accounts, savings, loan accounts
- **Cash Registers**: Point-of-sale cash handling locations
- **Payment Methods**: Cash, Credit Card, Bank Transfer, Check
- **Currency Settings**: Base currency and foreign exchange handling
- **Approval Limits**: Transaction approval thresholds

### Advanced Configurations
- **Multi-Bank Management** - Multiple banking relationships
- **Treasury Operations** - Investment and funding management
- **International Payments** - Cross-border payment handling
- **Automated Clearing** - Electronic payment processing
- **Risk Management** - Cash security and fraud prevention

## Use Cases

### Retail Store Operations
**Scenario**: Multi-location retail chain
- Point-of-sale cash register management
- Daily cash balancing and deposits
- Credit card transaction processing
- Store-to-bank cash transfer tracking
- Multi-location cash consolidation

**Benefits**: Comprehensive retail cash management

### Service Business
**Scenario**: Professional services firm
- Client payment processing
- Expense reimbursement handling
- Operating expense payments
- Bank reconciliation automation
- Cash flow forecasting

**Benefits**: Streamlined service business cash operations

### Manufacturing Company
**Scenario**: Production facility with suppliers
- Supplier payment processing
- Employee advance management
- Petty cash for operational expenses
- Large capital expenditure approvals
- Multi-currency supplier payments

**Benefits**: Efficient manufacturing cash management

### E-Commerce Business
**Scenario**: Online retailer with multiple payment methods
- Online payment gateway integration
- Refund and return processing
- Multi-currency customer payments
- Automated bank reconciliation
- Real-time payment confirmation

**Benefits**: Seamless e-commerce payment processing

## Related Applets

### Core Module Applets
- **[Chart of Account Applet](/applets/chart-of-account-applet/)** - Account structure integration
- **[Tax Configuration Applet](/applets/tax-configuration-applet/)** - Payment tax handling
- **[Organization Applet](/applets/organization-applet/)** - Multi-location cash management

### Financial Applets
- **[Accounts Receivable Applet](/applets/accounts-receivable-applet/)** - Customer payment processing
- **[Accounts Payable Applet](/applets/accounts-payable-applet/)** - Supplier payment processing
- **[Bank Reconciliation Applet](/applets/bank-reconciliation-applet/)** - Automated reconciliation

### Transaction Processing Applets
- **[Payment Processing Applet](/applets/payment-processing-applet/)** - Advanced payment handling
- **[Cash Flow Management Applet](/applets/cash-flow-management-applet/)** - Cash flow analysis
- **[Treasury Management Applet](/applets/treasury-management-applet/)** - Corporate treasury

## Setup Guide

### Quick Start
1. **Access Cashbook Configuration** - Navigate to the applet
2. **Bank Account Setup** - Configure primary bank accounts
3. **Cash Register Setup** - Set up physical cash locations
4. **Payment Method Configuration** - Configure accepted payment types
5. **Test Transaction Processing** - Process sample transactions

### Advanced Setup
1. **Multi-Bank Integration** - Connect multiple banking relationships
2. **Payment Gateway Integration** - Set up credit card processing
3. **Automated Reconciliation** - Configure bank statement import
4. **Approval Workflow Setup** - Configure transaction approvals
5. **Reporting Configuration** - Set up cash management reports

## Cash and Bank Account Structure

### Bank Account Configuration
```yaml
Account Name: Primary Operating Account
Bank: Maybank Berhad
Account Number: 514234567890
Account Type: Current Account
Currency: MYR
Online Banking: Enabled
Statement Import: Automated Daily
GL Account: 1001 - Cash at Bank
Authorization Required: >RM 10,000
```

### Cash Register Setup
```yaml
Register Name: Main Counter Register
Location: Store Front - Counter 1
Currency: MYR
Opening Float: RM 500.00
Maximum Amount: RM 5,000.00
GL Account: 1000 - Cash on Hand
Responsible Person: Cashier-001
Counting Required: Daily Close
```

### Payment Method Configuration
```yaml
Payment Method: Credit Card
Type: Electronic Payment
Processor: iPay88
Processing Fee: 2.5%
Settlement Period: T+2 days
GL Account: 1002 - Credit Card Receivable
Refund Policy: Same Method
Daily Limit: RM 50,000
```

## Best Practices

### Cash Management Best Practices
- **Segregation of Duties** - Separate cash handling and recording
- **Regular Reconciliation** - Daily cash and bank reconciliations
- **Approval Controls** - Multi-level approval for large transactions
- **Audit Trails** - Complete transaction documentation
- **Security Measures** - Physical and system security controls

### Bank Account Management Best Practices
- **Account Monitoring** - Regular bank account balance monitoring
- **Statement Review** - Daily bank statement review and import
- **Relationship Management** - Maintain good banking relationships
- **Backup Banking** - Multiple banking relationships for redundancy
- **Cost Management** - Monitor and minimize banking fees

### Payment Processing Best Practices
- **Method Optimization** - Optimize payment method mix for cost
- **Risk Management** - Monitor and control payment risks
- **Customer Convenience** - Offer multiple payment options
- **Processing Efficiency** - Automate payment processing where possible
- **Compliance Adherence** - Follow payment industry regulations

## Troubleshooting

### Common Issues
**Bank reconciliation discrepancies**
- Check bank statement import accuracy
- Verify transaction posting completeness
- Review timing differences and cutoffs
- Confirm bank fee and charge recording

**Cash register variances**
- Verify cash counting procedures
- Check transaction recording accuracy
- Review cash handling processes
- Investigate unusual cash movements

**Payment processing errors**
- Check payment gateway connectivity
- Verify merchant account configurations
- Review payment method settings
- Confirm network and system connectivity

### Support Resources
- Cash management setup and procedures guide
- Bank integration configuration documentation
- Payment gateway troubleshooting guide
- Cash reconciliation best practices guide

{{< callout type="warning" >}}
**Security Critical**: Cash and bank operations require strict security controls. Implement proper segregation of duties, approval workflows, and audit trails to prevent fraud and ensure accuracy.
{{< /callout >}}
