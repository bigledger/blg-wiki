---
title: "General Ledger & Chart of Accounts"
description: "Evaluate the core accounting structure, GL hierarchy, account types, and financial statement mapping"
weight: 1
---

This section covers the General Ledger and Chart of Accounts functionality, which forms the foundation of UTM's Integrated Financial System. Our system fully supports SAGA-compliant account structures with the flexibility to accommodate UTM's existing Chart of Accounts codes.

## Overview

The General Ledger module provides:
- **Hierarchical Account Structure** - Up to 10 levels deep
- **Flexible Account Coding** - Supporting UTM's existing code structure (Hasil, Belanja, Aset, Liabiliti, Ekuiti)
- **Chargeable Combination Codes** - Support for Tajuk, Pusat Kos, Aktiviti, Akaun, and SODOG
- **Real-Time Balance Updates** - Instant posting and balance calculations
- **Multi-Currency Support** - 150+ currencies with automatic exchange rate handling

## Test Scenario 1: Viewing Chart of Accounts Structure

### Objective
Verify that the system supports UTM's Chart of Accounts structure including all five account types.

### Steps to Follow

1. **Login** to the demo system using your credentials
2. **Navigate** to: `Finance` → `Chart of Accounts`
3. **Observe** the hierarchical structure displayed

### What to Verify

The Chart of Accounts should display:

| Account Type | Code Range | Description |
|--------------|------------|-------------|
| **Hasil (Revenue)** | 4000-4999 | Income accounts |
| **Belanja (Expenses)** | 5000-9999 | Expense accounts |
| **Aset (Assets)** | 1000-1999 | Current and non-current assets |
| **Liabiliti (Liabilities)** | 2000-2999 | Current and long-term liabilities |
| **Ekuiti (Equity)** | 3000-3999 | Capital and retained earnings |

### Expected Results
- Hierarchical tree view with expandable/collapsible sections
- GL Section → GL Category → GL Code hierarchy
- Account status (Active/Inactive) clearly displayed
- Quick search and filter capabilities

---

## Test Scenario 2: Creating a New GL Account

### Objective
Demonstrate the system's capability to add new accounts while maintaining structure integrity.

### Steps to Follow

1. **Navigate** to: `Finance` → `Chart of Accounts` → `New Account`
2. **Enter** account details:
   - **GL Code:** 5099
   - **Account Name:** Perbelanjaan Latihan (Training Expenses)
   - **Account Type:** Expense
   - **GL Category:** Operating Expenses
   - **Currency:** MYR
   - **Status:** Active
3. **Click** `Save`

### Expected Results
- System validates the GL code is unique
- Account appears in the correct hierarchy
- Audit trail records the creation with timestamp and user

---

## Test Scenario 3: GL Hierarchy and Financial Statement Mapping

### Objective
Verify that accounts are properly mapped to financial statements for SAGA compliance.

### Steps to Follow

1. **Navigate** to: `Finance` → `Chart of Accounts`
2. **Select** any account (e.g., GL Code 1001 - Cash at Bank)
3. **View** the account details
4. **Check** the Financial Statement Mapping section

### What to Verify

| Field | Description |
|-------|-------------|
| **Balance Sheet Mapping** | Shows where account appears on Balance Sheet |
| **P&L Mapping** | Shows income statement classification (if applicable) |
| **Cash Flow Mapping** | Operating, Investing, or Financing activity |
| **Ledger Type** | Primary (PRM) or Secondary (SEC) |

### Expected Results
- Each account has clear financial statement mapping
- Mappings align with MPSAS and SAGA requirements
- System prevents invalid mapping combinations

---

## Test Scenario 4: Period Management (Opening/Closing)

### Objective
Test the system's ability to handle accounting period opening and closing as per Requirement 9.19.

### Steps to Follow

1. **Navigate** to: `Finance` → `Period Management`
2. **View** the list of accounting periods
3. **Observe** the status of each period (Open/Closed/Future)

### What to Verify

**Period Configuration:**
- Monthly periods (Period 1-12)
- Period 13 for year-end adjustments (Jernal Bulan 13)
- Year-end closing process available
- New fiscal year automatic creation after closing

**System Capabilities:**
- Restrict posting to closed periods
- Allow authorized users to post to specific closed periods (adjustments)
- Automatic carry-forward of opening balances
- Multi-campus/multi-budget period handling

### Expected Results
- Clear visual indication of period status
- Period opening/closing with proper authorization
- Audit trail for all period changes

---

## Test Scenario 5: Sub-Ledger Management

### Objective
Demonstrate the sub-ledger functionality for detailed transaction tracking.

### Steps to Follow

1. **Navigate** to: `Finance` → `Ledger and Journal` → `Sub-Ledger`
2. **Select** a control account (e.g., Accounts Receivable - 1100)
3. **View** the subsidiary ledger entries

### What to Verify

**Sub-Ledger Features:**
- Individual customer/supplier account tracking
- Link to parent GL control account
- Transaction history with complete details
- Running balance for each sub-ledger

### Expected Results
- Subsidiary ledger balances reconcile to control account
- Drill-down capability from GL to sub-ledger details
- Complete audit trail for all entries

---

## Test Scenario 6: Multi-Dimensional Tracking

### Objective
Verify support for UTM's chargeable combination structure (Tajuk, Pusat Kos, Aktiviti, Akaun, SODOG).

### Steps to Follow

1. **Navigate** to: `Finance` → `Ledger and Journal` → `Journal Transaction`
2. **Create** a new journal entry
3. **On the Lines tab**, observe the available dimension fields

### What to Verify

**Dimension Fields Available:**
- **Segment** - Organizational segment/division
- **Dimension** - Additional classification
- **Project** - Project code tracking
- **Profit Center** - Cost center/PTJ tracking
- **Category** - Budget category assignment

### Expected Results
- Flexible dimension assignment per line item
- Reporting by any dimension combination
- Integration with budget module for validation

---

## Key Features Demonstrated

### Account Structure Flexibility
- Support for 4-20 character account codes
- Hierarchical structure up to 10 levels
- Account groups and categories for organization
- Custom fields for additional classifications

### Financial Statement Generation
- Balance Sheet (Penyata Kedudukan Kewangan)
- Profit & Loss / Income Statement (Penyata Pendapatan Komprehensif)
- Cash Flow Statement (Penyata Aliran Tunai)
- Statement of Changes in Equity (Penyata Perubahan Ekuiti)

### SAGA Compliance
- Accrual-based accounting
- Complete audit trail
- Government account code compatibility
- Period management including Month 13

---

## Advanced Features

### Real-Time Reporting
- Instant balance updates upon posting
- Dashboard showing key financial metrics
- Drill-down from summary to detail

### Integration Points
- Automatic posting from AR/AP modules
- Budget validation during posting
- Bank reconciliation integration
- Asset module depreciation posting

### Data Security
- Role-based access to accounts
- Audit log for all changes
- Period-based posting controls

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| View Chart of Accounts | Finance → Chart of Accounts |
| Create New Account | Finance → Chart of Accounts → New |
| View Ledger Balances | Finance → Ledger and Journal → Ledger |
| View Sub-Ledger | Finance → Ledger and Journal → Sub-Ledger |
| Period Management | Finance → Period Management |
| GL Reports | Finance → Financial Reports → General Ledger |

---

## Related Documentation

For detailed technical documentation on these features:
- [Chart of Accounts Applet](/applets/chart-of-account-applet/)
- [Ledger and Journal Applet](/applets/ledger-and-journal-applet/)
- [Chart of Accounts Setup Guide](/guides/accounting-guides/chart-of-accounts-setup/)

---

## Next Steps

After evaluating the General Ledger module, proceed to:

{{< cards >}}
  {{< card link="../budget-management" title="Budget & Vote Book Management" subtitle="Test budget allocation and monitoring capabilities" >}}
  {{< card link="../journal-module" title="Journal Module" subtitle="Explore auto and manual journal processing" >}}
{{< /cards >}}
