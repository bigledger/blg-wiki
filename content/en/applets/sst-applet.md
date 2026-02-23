---
title: "SST (Service / Sales Tax) Applet"
description: "Comprehensive tax management system for Malaysian SST compliance, covering tax year setup, tariff codes, filing workflows, and SST-02 generation"
tags:
- sst-compliance
- tax-management
- malaysia-tax
- sst-02-report
- financial-compliance
weight: 70
---

## Purpose and Overview

The **SST (Service / Sales Tax) Applet** is a specialized tool designed to streamline Malaysian tax compliance. It provides a structured environment for managing the entire tax lifecycle—from initial configuration of tax years and tariff codes to the final generation of official SST-02 reports.

{{< callout type="info" >}}
**Core Concept**: The system automates tax categorization by linking **Tariff Codes** to **Tax Codes**, ensuring that every transaction is recorded accurately for official filing.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance Team & Tax Accountants:**
- Automated calculation of Input (Purchase) and Output (Sales) tax.
- Simplified filing cycle management (Monthly, Quarterly, or Custom).
- One-click SST-02 report generation for customs submission.

**Compliance Officers & Auditors:**
- Accurate mapping via Malaysian Customs Tariff Codes.
- Complete audit trail of filed and unfiled transactions.
- Standardized tax reporting formats for internal and external audits.

**Business Owners & Executives:**
- Real-time visibility into net tax positions and liabilities.
- Reduced risk of penalties through automated filing workflows.
- Data-driven analysis of tax obligations across different business branches.

### What Problems Does This Solve?

**The Manual Tax Filing Problem:**

Traditional tax management often involves manual spreadsheets and complex tariff code lookups. Common issues include:
- **Incorrect Tax Application**: Applying the wrong rate (e.g., 6% instead of 8%) to service items.
- **Lost Transactions**: Missing taxable invoices during the filing period.
- **Reporting Hassles**: Manually filling SST-02 forms is time-consuming and error-prone.
- **Audit Risks**: Lack of a clear link between a filed transaction and the original sales/purchase document.

**The SST Applet Solution:**

- **Digital Filing Workflow** - Process thousands of transactions in seconds with automated validation.
- **Tariff Code Integration** - Link items directly to official tariff classifications to ensure regulatory compliance.
- **Flexible Reporting Cycles** - Handle standard or custom duration filings (e.g., every 2 months) with ease.
- **"Unfile" Functionality** - Correction workflow to fix errors before final submission without breaking system integrity.
- **Integrated Penalty Management** - Built-in fields for late filing adjustments and penalty calculations.

## Key Features Roadmap

{{< cards >}}
  {{< card title="Tax Year Setup" subtitle="Configure fiscal periods and filing cycles" link="#tax-year-configuration" >}}

  {{< card title="Tariff Management" subtitle="Define and map Malaysian tariff codes" link="#tariff-code-management" >}}

  {{< card title="Tax Code Config" subtitle="Set rates and link to sales/purchase types" link="#tax-code-configuration" >}}

  {{< card title="Tax Filing" subtitle="Execute end-to-end filing workflows" link="#executing-the-filing" >}}

  {{< card title="SST-02 Generation" subtitle="Export official tax forms and handle penalties" link="#generating-reports" >}}

  {{< card title="Reporting & Analytics" subtitle="Consolidated tax summaries and audit reports" link="#reporting--summaries" >}}
{{< /cards >}}

{{< figure src="/images/sst-applet/sst-applet-overview-infographic.png" alt="SST Applet Overview Infographic: From Manual Tax Headaches to 1-Click Compliance" caption="SST Applet Overview: The Old Way (manual spreadsheets, filing errors, penalty risks) vs The New Way (automated filing, Tariff Code integration, 1-click SST-02 generation)." >}}

---

## Key Concepts

### The "Golden Triangle" of SST

To effectively manage SST, you must understand how **Tax Years**, **Tariff Codes**, and **Tax Codes** work together.

| Component | Analogy | Definition | Example |
|-----------|---------|------------|---------|
| **Tax Year** | The "Bucket" | The container for a specific fiscal period. | **2025 Fiscal Year** |
| **Tariff Code** | The "Label" | The official customs classification for an item. | **Service Tariff 001.23** |
| **Tax Code** | The "Calculation" | The specific rule and rate applied to transactions. | **SST-S8 (8% Service Tax)** |

**How they link:**
1. You create a **Tax Year** to define *when* you are filing.
2. You define **Tariff Codes** to classify *what* you are selling/buying.
3. You create **Tax Codes** linked to those Tariffs to define *how much* to tax.
4. Transactions tagged with these codes are automatically pooled into the correct **Tax Year** for filing.

### SST Filing Hierarchy

Think of the tax process as a structured flow:

```
Company Organization
│
├── Tax Year ──→ DEFINES filing frequency (Monthly/Quarterly)
│   │
│   └── Filing Periods ──→ SPECIFIC months (e.g., Jan-Feb 2025)
│
├── Tariff Codes ──→ CLASSIFICATION master list
│   │
│   └── Tax Codes ──→ RATE mapping (6%, 8%, 10%)
│
└── Execution ──→ FILING of transactions
    │
    └── SST-02 ──→ OFFICIAL submission output
```

---

## Quick Start Guide

Get your tax compliance engine running with these essential workflows.

### For Admins: Initial System Setup

**Goal:** Configure the foundation for tax processing in 5 steps.

1. **Step 1: Setup Tax Year** (`Tax Year` menu)
   - Define the fiscal year and filing cycle (e.g., Every 2 Months).
   - Use naming conventions like "2025 - [Company Name]".
2. **Step 2: Create Tariff Codes** (`Tariff Code` menu)
   - Input official Malaysian Tariff Codes and descriptions for automatic item tagging.
3. **Step 3: Define Tax Codes** (`Tax Code` menu)
   - Create Output Tax (Sales) and Input Tax (Purchases) codes.
   - Link these to the appropriate Tariff Codes created in Step 2.
4. **Step 4: Map Accounts**
   - link your tax codes to the correct accounts in the `Chart of Account Applet`.
5. **Step 5: Test Transaction**
   - Create a draft Sales Invoice, apply the tax code, and verify it appears in "Unfiled Transactions".

---

### For Accountants: Managing Filing & Reports

**Goal:** Execute the filing process and generate reports.

1. **Initiate Filing**: Go to **Tax Filing** → Select Company, Year, and Period.
2. **Review Data**: Check **Unfiled Transactions** to verify base amounts and tax calculations match your invoices.
3. **Execute Filing**: Select accurate transactions and click **File**.
4. **Handle Corrections**: Use **Unfile** if a transaction was filed in error before final report generation.
5. **Adjust Penalties**: Input any late payment penalties or adjustments in the SST-02 section.
6. **Export SST-02**: Ensure data is refreshed via **Search**, then click **Export PDF**.

---

## Common Scenarios

**Scenario 1: Updating Tax Rate Mid-Year**
```
Policy Update: Service Tax increases from 6% to 8%
Action: 
1. Open existing Tax Code
2. Update "Rate" field to 8%
3. Save
Result: Future transactions use 8% while historical data remains intact.
```

**Scenario 2: Handling a Misclassified Item**
```
Problem: Item "X" was filed with wrong Tariff Code
Action:
1. Find transaction in "Filed Transactions"
2. Click "Unfile"
3. Correct Tariff/Tax Code on original document
4. Refresh SST Applet and Re-file
Result: Corrected SST-02 report.
```

**Scenario 3: Late Filing Penalties**
```
Problem: Filing is 2 weeks late
Action: 
1. Open SST-02 Report section
2. Enter Penalty Percentage (e.g., 10%)
3. System auto-calculates "Penalty Amount"
Result: SST-02 PDF reflects the legal penalty for submission.
```

---

## Configuration & Settings

#### Tax Year Setup (`Settings > Tax Year`)
Establish the filing cycle for your organization.
- **Filing Cycle**: Choose Monthly, Quarterly, or Custom.
- **Tip**: Ensure the "Tax Year" name matches your actual fiscal year for easier auditing.

#### Tariff Code Management (`Settings > Tariff Code`)
Define the library of Malaysian Tariff Codes.
- **Classification**: Essential for mapping items to tax rates.
- **Automation**: Once defined, these codes become available in Item Maintenance.

#### Tax Code Configuration (`Settings > Tax Code`)
The engine behind tax calculations.
- **Tax Type**: Identify as Input Tax (Purchase) or Output Tax (Sales).
- **Linking**: Always link to a Tariff Code for structured reporting.

---

## FAQ

**Q: Why can't I find my Sales Invoice in the Unfiled Transactions list?**
A: Ensure the Sales Invoice is **Finalized** and has a valid **Tax Code** applied. Also check that the transaction date falls within the selected Filing Period.

**Q: How do I handle Credit Notes in SST filing?**
A: Credit Notes appear in the transaction pool with negative base amounts. Selecting them during filing will correctly reduce your Net Tax liability.

**Q: Can I change my filing cycle from Quarterly to Monthly?**
A: Yes, but it is recommended to do this only at the start of a new Tax Year to avoid logic conflicts in the middle of a reporting period.

**Q: What is the difference between "Unfile" and "Delete"?**
A: "Unfile" simply moves a transaction from the "Filed" pool back to "Unfiled" for correction. You should never delete historical tax records to maintain audit integrity.

**Q: How does the system handle "Custom Months" filing?**
A: You can specify the exact number of months (e.g., 2) or choose specific start/end dates for companies with non-standard reporting requirements.
