---
title: "Tax Rate Management"
description: "Evaluate tax configuration and government directive compliance (Requirement 9.17)"
weight: 10
---

This section covers the Tax Rate Management functionality as specified in UTM Tender Requirement 9.17. Our system provides flexible tax configuration capabilities to support government directives and various tax scenarios.

## Overview

The Tax Rate Management module provides:
- **Tax Rate Configuration** - Set up various tax rates per government directives
- **Authorized User Configuration** - Finance staff can manage tax settings
- **Effective Date Management** - Tax rates with validity periods
- **Multiple Tax Types** - SST, Service Tax, Sales Tax, Withholding Tax
- **Integration** - Automatic tax calculation in transactions

## Test Scenario 1: Tax Rate Configuration

### Objective
Verify the system provides tax rate configuration based on government directives (Requirement 9.17a).

### Steps to Follow

1. **Login** to the demo system
2. **Navigate** to: `Settings` → `Tax Configuration` → `Tax Rates`
3. **View** existing tax rates
4. **Add** a new tax rate:
   - **Tax Code:** SST-6
   - **Description:** Service Tax 6%
   - **Rate:** 6%
   - **Effective Date:** 01/03/2024
   - **Tax Type:** Service Tax
5. **Save** the configuration

### What to Verify

**Tax Rate Elements:**
| Field | Description |
|-------|-------------|
| Tax Code | Unique identifier |
| Tax Name | Descriptive name |
| Rate | Percentage or fixed amount |
| Effective From | Start date |
| Effective To | End date (optional) |
| Tax Account | GL account for posting |

### Expected Results
- Tax rate saved successfully
- Effective date recorded
- Available in transactions from effective date
- Audit trail of change

---

## Test Scenario 2: Authorized Staff Configuration

### Objective
Verify that authorized financial staff can configure tax rates (Requirement 9.17b).

### Steps to Follow

1. **Login** as `demo+utm.finance@bigledger.com`
2. **Navigate** to: `Settings` → `Tax Configuration`
3. **Verify** access to tax settings
4. **Modify** a tax rate
5. **Confirm** changes saved

### What to Verify

**Access Control:**
| Role | Permission |
|------|------------|
| Finance Officer | View, Create, Edit |
| Finance Manager | View, Create, Edit, Approve |
| General User | View only |
| Administrator | Full access |

### Expected Results
- Finance staff has configuration access
- No technical support required
- Changes effective immediately
- Approval workflow (if configured)

---

## Test Scenario 3: Tax Effective Date Management

### Objective
Test tax rate validity period management.

### Steps to Follow

1. **Navigate** to: `Settings` → `Tax Configuration` → `Tax Rates`
2. **View** a tax rate with historical changes
3. **Add** a future rate change:
   - **Current Rate:** 6% (effective today)
   - **New Rate:** 8% (effective future date)
4. **Save** both rates

### What to Verify

**Effective Date Features:**
| Scenario | Behavior |
|----------|----------|
| Current Rate | Applied to today's transactions |
| Future Rate | Applied from effective date |
| Past Rate | Applied to backdated transactions |
| Multiple Rates | System uses correct rate per date |

### Expected Results
- Multiple rates co-exist with different dates
- System auto-selects based on transaction date
- Historical transactions unaffected
- Reports show rate at time of transaction

---

## Test Scenario 4: Tax Types Configuration

### Objective
Test various tax type configurations.

### Steps to Follow

1. **Navigate** to: `Settings` → `Tax Configuration` → `Tax Types`
2. **View** available tax types:
   - Service Tax (SST)
   - Sales Tax
   - Withholding Tax
   - Import Duty
3. **Configure** tax type properties

### What to Verify

**Tax Type Properties:**
| Property | Description |
|----------|-------------|
| Tax Type | Category of tax |
| Calculation Method | Percentage, Fixed, Compound |
| GL Accounts | Payable, Receivable, Expense |
| Reporting Code | Government reporting category |

### Expected Results
- All required tax types available
- Proper calculation methods
- Correct GL account mapping
- Reporting alignment

---

## Test Scenario 5: Tax in Sales Invoice

### Objective
Test automatic tax calculation in sales transactions.

### Steps to Follow

1. **Navigate** to: `Sales` → `Sales Invoice` → `New`
2. **Create** invoice with taxable items:
   - **Item:** Service Fee
   - **Amount:** RM 1,000
   - **Tax Code:** SST-6
3. **Observe** tax calculation
4. **Save** invoice

### What to Verify

**Tax Calculation:**
| Element | Amount |
|---------|--------|
| Net Amount | RM 1,000.00 |
| Tax (6%) | RM 60.00 |
| Total | RM 1,060.00 |

### Expected Results
- Tax auto-calculated from tax code
- Correct rate applied based on date
- Tax amount posted to correct GL
- E-invoice shows proper tax breakdown

---

## Test Scenario 6: Tax in Purchase Invoice

### Objective
Test tax handling in purchase transactions.

### Steps to Follow

1. **Navigate** to: `Purchasing` → `Purchase Invoice` → `New`
2. **Create** invoice:
   - **Supplier:** Registered supplier
   - **Item:** Equipment purchase
   - **Amount:** RM 5,000
   - **Tax Code:** Input Tax
3. **Observe** tax treatment
4. **Save** invoice

### What to Verify

**Input Tax Handling:**
| Element | Treatment |
|---------|-----------|
| Net Amount | RM 5,000.00 |
| Input Tax | RM 300.00 (claimable) |
| Total | RM 5,300.00 |

### Expected Results
- Input tax recognized
- Posted to correct GL account
- Available for tax reporting
- Tracked for claims

---

## Test Scenario 7: Tax Exempt Configuration

### Objective
Test tax exemption scenarios.

### Steps to Follow

1. **Navigate** to: `Settings` → `Tax Configuration` → `Tax Exemptions`
2. **View** exempt categories:
   - Education services
   - Government supplies
   - Zero-rated items
3. **Apply** exemption to a customer/item

### What to Verify

**Exemption Types:**
| Type | Application |
|------|-------------|
| Zero-Rated | 0% tax, still reported |
| Exempt | No tax, excluded from returns |
| Out of Scope | Not subject to tax law |

### Expected Results
- Correct exemption applied
- Proper coding in e-invoice
- Tax return accuracy
- Audit trail of exemption

---

## Test Scenario 8: Tax Reporting

### Objective
Test tax-related reporting capabilities.

### Steps to Follow

1. **Navigate** to: `Finance` → `Tax Reports`
2. **Generate** reports:
   - SST Summary Report
   - Tax Ledger Report
   - Tax Reconciliation
   - E-Invoice Tax Summary
3. **Review** report outputs

### What to Verify

**Tax Reports Available:**
| Report | Purpose |
|--------|---------|
| SST Summary | Total output/input tax |
| Tax by Code | Breakdown by tax code |
| Tax Ledger | Transaction details |
| Reconciliation | GL to tax return |

### Expected Results
- Comprehensive tax reporting
- E-filing support data
- Reconciliation capability
- Export to government format

---

## Test Scenario 9: Withholding Tax Configuration

### Objective
Test withholding tax setup and application.

### Steps to Follow

1. **Navigate** to: `Settings` → `Tax Configuration` → `Withholding Tax`
2. **View** withholding tax rules
3. **Configure** for specific payment types:
   - Professional fees
   - Contract payments
   - Interest payments

### What to Verify

**Withholding Tax Elements:**
| Element | Configuration |
|---------|---------------|
| Payment Type | Category of payment |
| Rate | Withholding percentage |
| Threshold | Minimum amount threshold |
| Reporting | CP22 reporting integration |

### Expected Results
- Automatic WHT calculation
- Deduction at payment
- Certificate generation
- LHDN reporting support

---

## Test Scenario 10: Tax Audit Trail

### Objective
Verify complete audit trail for tax configurations.

### Steps to Follow

1. **Navigate** to: `Settings` → `Tax Configuration` → `Tax Rates`
2. **Select** any tax rate
3. **View** change history
4. **Review** audit details

### What to Verify

**Audit Information:**
| Field | Content |
|-------|---------|
| Changed By | User who made change |
| Changed Date | When change occurred |
| Previous Value | Old rate/setting |
| New Value | New rate/setting |
| Reason | Change justification |

### Expected Results
- Complete change history
- Before/after values
- User identification
- Timestamp accuracy

---

## Key Features Demonstrated

### Tax Configuration
- Multiple tax types
- Flexible rate settings
- Effective date management
- GL account mapping

### Compliance Support
- Government directive alignment
- E-invoice tax requirements
- Reporting format compliance
- Audit trail maintenance

### Automation
- Auto-calculation in transactions
- Correct rate selection by date
- Exemption handling
- Report generation

---

## Advanced Features

### Multi-Rate Support
- Different rates by item category
- Location-based variations
- Customer-specific rates
- Time-based rate changes

### Integration
- E-invoice tax codes
- LHDN reporting formats
- Bank payment integration
- Customs duty handling

### Reporting
- Real-time tax position
- Compliance dashboards
- Variance analysis
- Filing preparation

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| Tax Rates | Settings → Tax Configuration → Tax Rates |
| Tax Types | Settings → Tax Configuration → Tax Types |
| Exemptions | Settings → Tax Configuration → Exemptions |
| Withholding Tax | Settings → Tax Configuration → Withholding Tax |
| Tax Reports | Finance → Tax Reports |
| Tax Ledger | Finance → Reports → Tax Ledger |

---

## Related Documentation

For detailed technical documentation:
- [Tax Configuration Applet](/applets/tax-configuration-applet/)

---

## Complete Your Evaluation

You have now completed the test script for all major modules. Return to the overview to access any module for further testing:

{{< cards >}}
  {{< card link="../" title="Back to Overview" subtitle="Return to main evaluation guide" >}}
{{< /cards >}}

---

## Summary of Evaluated Modules

| Module | Requirements Covered |
|--------|---------------------|
| General Ledger & COA | 9.18, 9.19 |
| Budget & Vote Book | 9.23-9.55 |
| Accounts Payable | 9.16b |
| Accounts Receivable | 9.16a |
| Journal Module | 9.21, 9.22 |
| Cash Management | 9.56 |
| Asset Management | 9.57-9.65 |
| Financial Reporting | 9.20 |
| User Access Control | 9.15 |
| Tax Management | 9.17 |

For questions or additional demonstrations, please contact:
- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com
