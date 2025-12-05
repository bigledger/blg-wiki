---
title: "Budget & Vote Book Management"
description: "Evaluate budget allocation, monitoring, virement, and real-time utilization tracking (Buku Vot)"
weight: 2
---

This section covers the comprehensive Budget and Vote Book (Buku Vot) management functionality. Our system provides real-time budget monitoring with controls that prevent over-spending, supporting UTM's requirement for robust financial governance.

## Overview

The Budget Management module addresses UTM Tender Requirements 9.23-9.55, providing:
- **Vote Book (Buku Vot) Management** - Central budget document per fiscal year
- **Real-Time Budget Validation** - Prevent over-budget transactions
- **Budget Virement** - Transfer funds between budget items
- **Budget Adjustment** - Increase or decrease total allocations
- **Multi-Dimensional Budgeting** - By PTJ, cost center, project, and activity
- **Comprehensive Reporting** - Summary and detailed budget analysis

## Test Scenario 1: Viewing Vote Book Display (Paparan Buku Vot)

### Objective
Verify the system displays a user-friendly Vote Book interface as per Requirement 9.23.

### Steps to Follow

1. **Login** to the demo system
2. **Navigate** to: `Finance` → `Budget` → `Vote Book Exposure`
3. **Select** a Profit Center (PTJ) to view its vote book
4. **Observe** the display layout

### What to Verify

**Interface Requirements (9.23a):**
- User-friendly interface with clear layout
- Easy to understand transaction descriptions and amounts
- Systematic and organized presentation

| Column | Description |
|--------|-------------|
| Budget Item | Category of spending |
| Allocation | Total approved budget |
| Commitment | Reserved amounts (POs) |
| Expenditure | Actual spending |
| Available Balance | Remaining budget |

### Expected Results
- Clean, intuitive display of budget status
- Color-coded indicators for budget health (green/yellow/red)
- Real-time balance updates
- Easy navigation between periods

---

## Test Scenario 2: Vote Book Maintenance by Authorized Staff

### Objective
Demonstrate that authorized financial staff can maintain the Vote Book without technical assistance (Requirement 9.24).

### Steps to Follow

1. **Login** as `demo+utm.finance@bigledger.com`
2. **Navigate** to: `Finance` → `Budget` → `Vote Book Organizer`
3. **Select** a Vote Book to maintain
4. **Try** modifying budget allocations for a period

### What to Verify

**Self-Service Capabilities:**
- Financial staff can create new vote books
- Add/modify budget items without IT support
- Configure fiscal periods and allocations
- No coding or technical skills required

### Expected Results
- Intuitive forms for budget entry
- Validation messages in plain language
- Help text and tooltips available
- Changes saved with audit trail

---

## Test Scenario 3: Vote Book Logic Configuration

### Objective
Verify authorized staff can configure vote book logic without technical support (Requirement 9.25).

### Steps to Follow

1. **Navigate** to: `Finance` → `Budget` → `Settings` → `Vote Book Logic`
2. **View** the configuration options
3. **Observe** the available rules and settings

### What to Verify

**Configurable Rules:**
- Budget validation thresholds (warning vs. blocking)
- Approval workflow settings
- Period allocation rules (even, seasonal, custom)
- Transfer/virement limits

### Expected Results
- Dropdown menus and checkboxes for configuration
- No programming required
- Preview of rule effects before saving
- Immediate application of changes

---

## Test Scenario 4: Budget Application Processing

### Objective
Test the budget application workflow covering various budget types (Requirement 9.26).

### Steps to Follow

1. **Navigate** to: `Finance` → `Budget` → `Budget Application`
2. **Create** a new budget application:
   - **Budget Type:** Operating Budget
   - **PTJ:** Faculty of Engineering
   - **Period:** 2025
   - **Items:** List of budget items with requested amounts
3. **Submit** for approval

### What to Verify

**System Capabilities (9.26a-d):**
| Requirement | Feature |
|-------------|---------|
| Distinguish budget types | Operating, Capital, Grant, Special Project |
| Receive and display estimates | Year-over-year comparison |
| Integrate historical data | Previous year actuals auto-populated |
| Approval workflow | Multi-level approval routing |

### Expected Results
- Different forms for different budget types
- Historical data automatically populated
- Integration with estimates from departments
- Clear approval status and routing

---

## Test Scenario 5: Budget Virement (Transfer)

### Objective
Test the budget transfer functionality between objects within the same General Object (Requirement 9.29).

### Steps to Follow

1. **Navigate** to: `Finance` → `Budget` → `Budget Virement`
2. **Create** a new virement request:
   - **From:** Budget Item A (e.g., Travel Expenses)
   - **To:** Budget Item B (e.g., Training Expenses)
   - **Amount:** RM 5,000
   - **Justification:** Training needs increased
3. **Submit** for approval

### What to Verify

**Virement Rules (9.29a-e):**
| Requirement | Verification |
|-------------|--------------|
| Distinguish budget types | System recognizes budget categories |
| Transfer between objects in same General Object | Allowed transfers highlighted |
| Multi-level approval | Routes to appropriate approvers |
| Lock until resolved | Affected budgets show pending status |
| Approval hierarchy based on limits | Different approvers based on amount |

### Expected Results
- System validates transfer is permitted
- Shows impact on both source and destination budgets
- Approval workflow activates based on amount
- Audit trail records all virement actions

---

## Test Scenario 6: Real-Time Budget Validation

### Objective
Demonstrate the system prevents over-budget transactions.

### Steps to Follow

1. **Navigate** to: `Purchasing` → `Purchase Order`
2. **Create** a new PO with amount exceeding available budget
3. **Observe** the system response

### What to Verify

**Validation Behavior:**
- Warning message when approaching budget limit
- Blocking message when exceeding budget
- Option to request budget exception (with approval)
- Clear display of available balance

### Expected Results
- Transaction blocked with informative message
- Shows current allocation, committed, spent, and available
- Suggests actions (virement, adjustment, approval request)
- Audit trail records the validation event

---

## Test Scenario 7: Budget Utilization Reporting

### Objective
Test the budget reporting and monitoring capabilities.

### Steps to Follow

1. **Navigate** to: `Finance` → `Budget` → `Reports`
2. **Select** "Budget Summary Report"
3. **Configure** parameters:
   - **Period:** Current fiscal year
   - **PTJ:** All or specific
   - **Format:** Summary or Detailed

### What to Verify

**Report Types Available:**
| Report | Purpose |
|--------|---------|
| Budget Summary | Executive overview of all budgets |
| Budget Register Transaction | Detailed line-by-line transactions |
| Variance Analysis | Budget vs. Actual comparison |
| Commitment Report | Outstanding commitments |
| Utilization Rate | Burn rate analysis |

### Expected Results
- Fast report generation (< 5 seconds)
- Export to Excel, PDF available
- Drill-down from summary to detail
- Real-time data reflection

---

## Test Scenario 8: Budget Period Operations

### Objective
Verify budget operations across different periods (monthly, quarterly, annual).

### Steps to Follow

1. **Navigate** to: `Finance` → `Budget` → `Vote Book Organizer`
2. **Select** a Vote Book
3. **View** the period allocation structure

### What to Verify

**Period Management:**
- Monthly period breakdowns
- Quarterly roll-up views
- Annual summary totals
- Carry-forward of unused budgets (if configured)

### Expected Results
- Flexible period views
- Automatic aggregation at higher levels
- Period-specific budget controls
- Year-end closing procedures

---

## Key Features Demonstrated

### Budget Control Mechanisms
- Real-time validation at point of transaction
- Configurable tolerance levels (soft warning vs. hard block)
- Exception request workflow
- Multi-level approval based on amount thresholds

### Profit Center (PTJ) Management
- Hierarchical PTJ structure
- Budget accountability by organizational unit
- Consolidated reporting across PTJs
- Transfer capabilities between PTJs (with approval)

### Budget Categories (up to 10 dimensions)
- Organizational Unit
- Expense Type
- Funding Source
- Project Code
- Strategic Initiative
- Geographic Location
- And more...

---

## Advanced Features

### Budget Forecasting
- Trend analysis based on historical data
- Projected year-end balance calculations
- Seasonal adjustment factors
- Cash flow forecasting

### Integration Points
- Purchasing module (PO budget validation)
- Accounts Payable (invoice posting validation)
- General Ledger (actual expense posting)
- Project Management (project budget tracking)

### Audit & Compliance
- Complete audit trail for all budget changes
- Approval history with timestamps
- Virement/adjustment documentation
- Period-end reports for audit

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| View Vote Book | Finance → Budget → Vote Book Exposure |
| Maintain Vote Book | Finance → Budget → Vote Book Organizer |
| Create Budget Application | Finance → Budget → Budget Application |
| Request Virement | Finance → Budget → Budget Virement |
| Budget Adjustment | Finance → Budget → Budget Adjustment |
| Budget Reports | Finance → Budget → Reports |
| Configure Logic | Finance → Budget → Settings → Vote Book Logic |

---

## Related Documentation

For detailed technical documentation:
- [Budget Applet](/applets/budget-applet/)
- [Vote Book Applet](/applets/vote-book-applet/)
- [Budgetary Management Module](/modules/budgetary/)

---

## Next Steps

After evaluating the Budget Management module, proceed to:

{{< cards >}}
  {{< card link="../accounts-payable" title="Accounts Payable" subtitle="Test payment and vendor management" >}}
  {{< card link="../accounts-receivable" title="Accounts Receivable" subtitle="Test receipt and debtor management" >}}
{{< /cards >}}
