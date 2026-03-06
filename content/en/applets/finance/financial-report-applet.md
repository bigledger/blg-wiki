---
title: "Financial Report Applet"
description: "Comprehensive financial reporting system for balance sheets, profit & loss, cash flow, and custom financial analytics"
tags:
- financial-reporting
- business-intelligence
- accounting
- consolidation
- analytics
weight: 70
---

## Purpose and Overview

The **Financial Report Applet** is a powerful tool designed to transform raw accounting data into actionable financial insights. It moves beyond simple ledger listings by integrating real-time data processing, multi-entity consolidation, and dynamic report customization.

{{< callout type="info" >}}
**Core Concept**: The system bridges **Transactional Data** (Journals) with **Strategic Information** (Financial Statements) through flexible **Reporting Dimensions**.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance Teams:**
- Automated generation of month-end reports
- Real-time reconciliation capabilities
- Reduced manual spreadsheet errors
- Faster closing of financial periods

**Executives & Management:**
- Real-time visibility into financial health
- Interactive dashboards for KPI tracking
- Drill-down capabilities to investigate variances
- Data-driven decision making

**Auditors & Compliance Officers:**
- Full traceability from report to source transaction
- Standardized reporting formats
- Complete audit trails
- Compliance with regulatory standards

---

### What Problems Does This Solve?

**The Manual Reporting Problem:**

Traditional financial reporting often relies on exporting data to spreadsheets and manual manipulation. Common issues include:
-High risk of formula errors
- Time-consuming data consolidation
- Delay in information availability
- Version control nightmares with multiple spreadsheet iterations

**The Financial Report Applet Solution:**

- **Automated Compilation** - Generate standard reports with a single click
- **Source-to-Report Integrity** - Direct link between reports and live data
- **Multi-Entity Handling** - Seamless consolidation across subsidiaries
- **Dynamic Filtering** - Analyze data by department, project, or cost center instanty
- **Secure Distribution** - Controlled access to sensitive financial data

## Key Features Overview


{{< cards >}}
  {{< card title="Standard Reports" subtitle="Instant Balance Sheet, P&L, Cash Flow" link="#standard-reports" >}}

  {{< card title="Custom Report Builder" subtitle="Drag-and-drop report design" link="#custom-report-builder" >}}

  {{< card title="Export & Share" subtitle="PDF, Excel, and Email distribution" link="#export--share" >}}
{{< /cards >}}

## Key Concepts

### Understanding Financial Dimensions

Effective financial reporting relies on structuring data correctly. The Financial Report Applet uses dimensions to slice and dice your data:

| Dimension | Definition | Example |
|-----------|------------|---------|
| **Entity** | The legal company or subsidiary | US HQ, Singapore Branch |
| **Account** | The specific general ledger code | 4000-Sales, 6000-Rent Expense |
| **Cost Center** | The department or function | Marketing, IT, HR |
| **Project** | Specific initiative or job | Project Alpha, Website Redesign |
| **Period** | The time frame for the report | Jan 2024, Q1 2024, YTD 2024 |

{{< callout type="tip" >}}
**Real-World Example**: A CFO wants to see "Travel Expenses" (Account) for the "Sales Team" (Cost Center) in "Q1 2024" (Period) across "All Regions" (Entity). The applet filters data instantly to provide this view.
{{< /callout >}}

### Report Structure Hierarchy

Think of a financial report as a built structure:

```
Report Definition (e.g., P&L)
│
├── Row Definitions ──→ WHAT accounts to show? (Revenue, COGS, Expenses)
│   │
│   └── Account Mappings ──→ Link GL codes to Rows
│
└── Column Definitions ──→ HOW to show data? (Current Month, YTD, Variance)
    │
    └── Formulas ──→ Calculations (Gross Margin %, Net Profit)
```

## Quick Start Guide

**Access the Applet:** [Launchpad Panel](https://akaun.cloud/#/bigledger/akaun-platform/container/launchpad-panel)

Get up and running quickly with these essential workflows.

### For Finance Teams: Generate a Month-End Processing

**Goal:** 
1. Create a Month End Processing for the newly closed month. 
2. Ensure all sales, purchases, and expenses are recorded for the period.

{{< figure src="/images/financial-report-applet/create-form.png" alt="Report Generation Form showing entity and period selection" caption="Generate Report: Select your entity, period, and comparison parameters to run a report." >}}

**Steps:**

1. **Navigate**: Go to **Month End Processing**
2. **Select Parameters**:
   - **Set of Book**: Select your company Set Of Book based on Chart Of Account Applet
   - **Year**: Select the financial year  (e.g., “2024”)
   - **Month**: Select the month
3. **Generate**: Click **Create**
4. **Select Record**: Click back the Month End under the Listing
5. **Process**: Navigate to "Processor" tab and click **PROCESS**

**Notes:**
Admin need to re-run the "Processor" to reconcile the back dated transactions created by any users


{{< figure src="/images/financial-report-applet/report-view.png" alt="Processing Report View with drill-down capabilities" caption="Interactive Processing: Click on any line item to drill down to the transaction level." >}}

### For Admins: Configure a New Financial Report Line

**Goal:** Add new yearly financial period or monthly for checking purposes

1. **Navigate**: Navigate to **Financial Report** > Click **+**
2. **Select Parameters**:
   - **Set of Book**: Select your company Set Of Book based on Chart Of Account Applet
   - **Start Year**: Select the beginning of financial year (e.g., “2024”)
   - **Start Month**: Select the first month of the financial year (e.g., “January”)
   - **End Year**: Select the end of financial year (e.g., “2024”)
   - **End Month**: Select the month end of the financial year (e.g., “December")
3. **Generate**: Click **Create**
4. **View Results**: Navigate to the financial report in the listing to view the Trial Balance, P&L and Balance Sheet data

{{< figure src="/images/financial-report-applet/edit-form.png" alt="Report Template Editor showing row configuration" caption="Report Editor: Easily customize report structures by adding new rows and mapping GL accounts." >}}

### For Admins: Generate P&L Report by Branch

**Goal:** Profit and Loss Statement by Period enables user to extract the statement based on selected period and filter by branch

1. **Navigate**: Navigate to **Profit Loss Report** >
2. **Select Parameters**:
   - **Group By**: Branch
   - **Branch**: Select the specific branch or all
   - **Date Range**: Select report date range
3. **View Results**: Click **Search**

### For Admins: Generate Financial Report By Period

**Goal:** Generate financial report by Period for comparison

1. **Navigate**: Navigate to **Financial Report**
2. **Steps**:
   - Tick which Financial Report to compare
   - Click **Reports**
3. **View Results**: Results will shown under Trial Balance, P&L and Balance Sheet

---

## Detailed Features

### Standard Reports

The applet comes pre-loaded with industry-standard financial templates compliant with GAAP and IFRS.

- **Balance Sheet**: Snapshot of assets, liabilities, and equity at a specific date.
- **Profit & Loss (Income Statement)**: Performance over a period, detailing revenue, costs, and expenses.
- **Cash Flow Statement**: Inflows and outflows from operating, investing, and financing activities.
- **Trial Balance**: Listing of all account balances to ensure debits equal credits.

### Custom Report Builder

Create bespoke reports tailored to specific business needs without IT support.

- **Drag-and-Drop Interface**: Easily arrange rows and columns.
- **Custom Formulas**: Create KPIs like EBITDA, Gross Margin %, or Quick Ratio.
- **Styling Control**: Bold totals, indent sub-accounts, and highlight variances.



---

## Configuration & Settings


### Account Mapping (Chart Of Account Applet)

Ensure every GL code is correctly categorized in your reports.

- **Map to Report Lines**: Link GL Account 4001 (Product Sales) to the "Revenue" line in the P&L.
- **Unmapped Account Code** will now be shown under the financial statement

### Access Rights (`Settings > Access Rights`)

Control who sees what data. Financial data is sensitive, so granular permissions are key.

- **Entity Access**: Restrict users to specific subsidiaries (e.g., US Manager sees only US data).
- **Report Access**: Control which reports users can run (e.g., Junior Accountants see Trial Balance, CFO sees Consolidated P&L).
- **Field Level Security**: Hide sensitive payroll GL codes from general ledger viewers.


## FAQ

**Q: Can I export reports to Excel with formulas intact?**
A: Yes, the "Excel (Analysis)" export option preserves the structure and values, allowing for further modeling, though underlying report logic formulas remain in the system.

**Q: How often is the data updated?**
A: Data is real-time. As soon as a journal is posted in the General Ledger, it is reflected in the financial reports.


**Q: Is it possible to drill down to the scanned invoice image?**
A: Yes, if the source transaction in the accounts payable ledger has an attachment, you can drill down from the financial report line item all the way to the source document.
