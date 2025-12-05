---
title: "Financial Reporting"
description: "Evaluate full set of accounts generation, SAGA compliance reports, and dashboards"
weight: 8
---

This section covers the Financial Reporting functionality as specified in UTM Tender Requirement 9.20. Our system generates comprehensive financial statements compliant with SAGA, MPSAS, and government reporting requirements.

## Overview

The Financial Reporting module provides:
- **Full Set of Accounts** - Balance Sheet, Income Statement, Cash Flow, Changes in Equity
- **Periodic Reporting** - Daily, Monthly, Quarterly, Annual
- **SAGA Compliance** - Government agency reporting formats
- **Customizable Reports** - Ad-hoc reporting capabilities
- **Dashboard Analytics** - Real-time KPIs and metrics
- **Export Flexibility** - Excel, PDF, and print options

## Test Scenario 1: Full Set of Financial Statements

### Objective
Verify the system generates complete financial statements periodically (Requirement 9.20a).

### Steps to Follow

1. **Login** to the demo system
2. **Navigate** to: `Finance` → `Financial Reports` → `Financial Statements`
3. **Select** report type: Balance Sheet
4. **Configure** parameters:
   - **Period:** Select fiscal period
   - **Company:** UTM
   - **Currency:** MYR
5. **Generate** report

### What to Verify

**Full Set of Accounts:**
| Statement | Description |
|-----------|-------------|
| Balance Sheet | Penyata Kedudukan Kewangan |
| Income Statement | Penyata Pendapatan Komprehensif |
| Cash Flow Statement | Penyata Aliran Tunai |
| Changes in Equity | Penyata Perubahan Ekuiti |
| Notes to Accounts | Supporting schedules |

### Expected Results
- Complete financial statements generated
- Proper format per MPSAS/SAGA
- Balancing verification
- Export options available

---

## Test Scenario 2: SAGA Compliance Reports

### Objective
Test generation of government-required reports (Requirement 9.20b).

### Steps to Follow

1. **Navigate** to: `Finance` → `Financial Reports` → `Statutory Reports`
2. **Select** SAGA compliance report
3. **Generate** report

### What to Verify

**SAGA Report Elements:**
| Element | Requirement |
|---------|-------------|
| Account Structure | JANM-compliant format |
| Classification | Government account categories |
| Period Format | Fiscal year alignment |
| Disclosure | Required notes and schedules |

### Expected Results
- SAGA-formatted output
- Complete disclosure requirements
- Ready for submission
- Audit trail maintained

---

## Test Scenario 3: Penyata Pendapatan Komprehensif (Income Statement)

### Objective
Test Income Statement generation.

### Steps to Follow

1. **Navigate** to: `Finance` → `Financial Reports` → `Financial Statements`
2. **Select:** Penyata Pendapatan Komprehensif
3. **Parameters:**
   - **Period:** Year to Date
   - **Comparison:** Previous Year
4. **Generate** report

### What to Verify

**Income Statement Components:**
| Section | Content |
|---------|---------|
| Revenue | All income sources |
| Direct Costs | Cost of services/goods |
| Gross Surplus | Revenue minus direct costs |
| Operating Expenses | Administrative, operating costs |
| Net Surplus/Deficit | Bottom line result |

### Expected Results
- Comprehensive income display
- Comparative columns
- Variance calculation
- Drill-down to details

---

## Test Scenario 4: Penyata Kedudukan Kewangan (Balance Sheet)

### Objective
Test Balance Sheet generation.

### Steps to Follow

1. **Navigate** to: `Finance` → `Financial Reports` → `Financial Statements`
2. **Select:** Penyata Kedudukan Kewangan
3. **Parameters:**
   - **As of Date:** Period end
   - **Comparison:** Prior period
4. **Generate** report

### What to Verify

**Balance Sheet Components:**
| Section | Content |
|---------|---------|
| Aset Semasa | Current Assets |
| Aset Bukan Semasa | Non-Current Assets |
| Liabiliti Semasa | Current Liabilities |
| Liabiliti Bukan Semasa | Long-term Liabilities |
| Ekuiti | Equity |

### Expected Results
- Assets = Liabilities + Equity
- Proper classification
- Comparative display
- Supporting schedules linked

---

## Test Scenario 5: Penyata Aliran Tunai (Cash Flow Statement)

### Objective
Test Cash Flow Statement generation.

### Steps to Follow

1. **Navigate** to: `Finance` → `Financial Reports` → `Financial Statements`
2. **Select:** Penyata Aliran Tunai
3. **Generate** report

### What to Verify

**Cash Flow Sections (Requirement 9.20b-iv):**
| Activity | Description |
|----------|-------------|
| Operating | Day-to-day operations cash |
| Investing | Asset purchases/sales |
| Financing | Loans, grants, equity |
| Net Change | Total cash movement |

### Expected Results
- Three-activity format
- Reconciliation to cash balance
- Direct or indirect method
- Period comparisons

---

## Test Scenario 6: Penyata Perubahan Ekuiti

### Objective
Test Statement of Changes in Equity generation.

### Steps to Follow

1. **Navigate** to: `Finance` → `Financial Reports` → `Financial Statements`
2. **Select:** Penyata Perubahan Ekuiti
3. **Generate** report

### What to Verify

**Equity Components:**
| Element | Tracking |
|---------|----------|
| Opening Balance | Start of period |
| Surplus/Deficit | Period result |
| Other Comprehensive Income | Non-operating items |
| Transactions with Owners | Capital changes |
| Closing Balance | End of period |

### Expected Results
- Movement analysis display
- Reconciliation to Balance Sheet
- Component breakdown
- Multi-year comparison

---

## Test Scenario 7: Campus and Budget-Specific Reports

### Objective
Test reporting by campus and budget classification.

### Steps to Follow

1. **Navigate** to: `Finance` → `Financial Reports` → `Segment Reports`
2. **Select** dimension:
   - By Campus (JB, KL)
   - By Budget Type (Operating, Capital, Grant)
   - By PTJ (Department/Faculty)
3. **Generate** report

### What to Verify

**Segmented Reporting:**
| Dimension | Capability |
|-----------|------------|
| Campus | Separate financial position per campus |
| Budget | Revenue/Expense by budget category |
| PTJ | Departmental performance |
| Project | Project-based financials |

### Expected Results
- Segment-wise statements
- Consolidation capability
- Inter-segment elimination
- Comparative analysis

---

## Test Scenario 8: Drill-Down and Audit Trail

### Objective
Test the drill-down capability for detailed analysis.

### Steps to Follow

1. **Generate** any financial report
2. **Click** on a line item amount
3. **Drill down** to transaction details
4. **Continue** to source document

### What to Verify

**Drill-Down Path:**
Report Total → Account Summary → Transaction List → Source Document

### Expected Results
- Seamless navigation
- Complete audit trail
- Document links preserved
- Back navigation available

---

## Test Scenario 9: Real-Time Dashboard

### Objective
Test the financial dashboard capabilities.

### Steps to Follow

1. **Navigate** to: `Finance` → `Dashboard`
2. **View** key financial metrics
3. **Interact** with visualizations

### What to Verify

**Dashboard Elements:**
| Widget | Information |
|--------|-------------|
| Cash Position | Current cash balances |
| Budget Utilization | Spending vs allocation |
| Receivables | Outstanding amounts |
| Payables | Due payments |
| Key Ratios | Financial metrics |

### Expected Results
- Real-time data display
- Interactive charts
- Configurable widgets
- Alert indicators

---

## Test Scenario 10: Report Export and Distribution

### Objective
Test report export and sharing capabilities.

### Steps to Follow

1. **Generate** any financial report
2. **Click** Export options
3. **Select** format (Excel, PDF)
4. **Download** or email

### What to Verify

**Export Options:**
| Format | Use Case |
|--------|----------|
| Excel | Data analysis, manipulation |
| PDF | Distribution, archival |
| Print | Physical copies |
| Schedule | Automated distribution |

### Expected Results
- Clean export formatting
- All data preserved
- Charts included (PDF)
- Pivot-ready (Excel)

---

## Key Features Demonstrated

### Financial Statement Generation
- Full set of accounts
- SAGA/MPSAS compliant
- Multi-period comparison
- Consolidated and standalone

### Reporting Frequency
- Daily cash position
- Weekly management reports
- Monthly financial close
- Quarterly reviews
- Annual statements

### Compliance Features
- Government format compliance
- Audit trail requirements
- Disclosure completeness
- Signature/approval tracking

### Analysis Tools
- Drill-down capability
- Variance analysis
- Trend analysis
- Ratio calculations

---

## Advanced Features

### Custom Report Builder
- Design custom layouts
- Add calculations
- Save templates
- Schedule generation

### Budget vs Actual
- Variance highlighting
- Percentage analysis
- Forecast updates
- Management commentary

### KPI Dashboard
- Configurable metrics
- Real-time updates
- Alert thresholds
- Trend indicators

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| Financial Statements | Finance → Financial Reports → Financial Statements |
| Trial Balance | Finance → Financial Reports → Trial Balance |
| General Ledger | Finance → Financial Reports → General Ledger |
| Budget Reports | Finance → Budget → Reports |
| Dashboard | Finance → Dashboard |
| Segment Reports | Finance → Financial Reports → Segment Reports |

---

## Related Documentation

For detailed technical documentation:
- [Financial Reporting Guide](/guides/accounting-guides/financial-reporting/)
- [Financial Reporting Excellence](/guides/advanced/financial-reporting-excellence/)

---

## Next Steps

After evaluating Financial Reporting, proceed to:

{{< cards >}}
  {{< card link="../user-access-control" title="User Access Control" subtitle="Test security and permissions" >}}
  {{< card link="../tax-management" title="Tax Management" subtitle="Test tax configuration" >}}
{{< /cards >}}
