---
title: "Sales Commission Applet"
applet_code: "salesCommissionApplet"
applet_repo: "blg-applet-wavelet-internal-sales-commission-applet"
description: "Comprehensive reporting and payout processing engine for calculating, analyzing, and disbursing sales performance commissions."
weight: 160
tags:
- sales
- commission
- hr
- payout
- reporting
---

## Purpose and Overview

The **Sales Commission (Internal) Applet** is an enterprise performance management module within the BigLedger platform. It bridges the gap between commercial sales achievements and HR/Payroll financial disbursement by automating commission computations directly from real-time sales transactions.

Rather than relying on offline spreadsheets, manual data entry, or unverified calculations, this applet enforces strict period governance, transparent line-by-line yield auditing, dual layout visualization, and direct integration into General Ledger payment workflows.

{{< callout type="info" >}}
**Core Architectural Principle**: The applet strictly separates **Calculation (Reports)** from **Disbursement (Payouts)**. A *Commission Report* computes performance earnings based on closed sales invoices, but no money moves until a *Payout Processing* document (Internal Payment Voucher) is approved and posted to the financial ledger.
{{< /callout >}}

![BigLedger Sales Commission Applet Operational Overview](/images/sales-commission-applet/sales-commission-overview-infographic.png)

---

### Who Benefits from This Applet?

**Sales Managers & Commercial Directors:**
- **Transparent Performance Analytics:** Real-time visibility into team sales yields, target achievements, and commission accruals.
- **Granular Line Auditing:** Drill down into individual sales invoices and product lines to verify commission percentage calculations.

**HR & Payroll Administration:**
- **Automated Calculations:** Eliminates manual spreadsheet math, formula errors, and multi-day payroll reconciliation cycles.
- **Streamlined Disbursements:** Seamlessly converts approved commission calculations into official payout vouchers ready for bank execution.

**Finance Controllers & Auditors:**
- **Zero Double-Payout Guarantee:** System safeguards track invoiced items to guarantee that commissions are never disbursed twice for the same sale.
- **Strict Period Governance:** Lock historical financial periods via **Sales Commission Cycles** to prevent retroactive recalculations.

---

### What Problems Does This Solve?

| The "Shadow Payroll" Excel Problem | The Sales Commission Applet Solution |
| :--- | :--- |
| **Spreadsheet Errors & Disputes**: Isolated Excel files lead to formula errors, lost records, and frequent commission disputes with sales reps. | **In-ERP Calculation Engine**: Automatically pulls verified data directly from finalized Sales Invoices and official cash receipts. |
| **Double-Entry Administrative Overhead**: HR teams spend hours manually re-keying spreadsheet figures into payroll software every month. | **Seamless Payout Conversion**: Converts approved commission reports directly into actionable Internal Payment Vouchers with 1-click. |
| **Lack of Audit Governance**: Historical commission sheets can be edited post-payout, making financial audits difficult. | **Cycle Period Locking**: Binds date ranges into strict cycles; once a cycle is closed, historical figures are permanently locked. |

---

## Key Features Overview

{{< cards >}}
  {{< card title="Sales Commission Report" subtitle="Summary and detailed yield calculations" link="#1-sales-commission-report-module" >}}

  {{< card title="Payout Processing" subtitle="Generate payment vouchers and execute disbursements" link="#2-payout-processing-module" >}}

  {{< card title="Sales Commission Cycle" subtitle="Define and lock strict reporting date ranges" link="#3-sales-commission-cycle-module" >}}

  {{< card title="Details Reporting" subtitle="Granular line-by-line invoice search and analysis" link="#4-sales-commission-details-report-module" >}}

  {{< card title="Applet Settings" subtitle="Configure default branches, field security, and formats" link="#configuration--settings" >}}
{{< /cards >}}

---

## Core Concepts

### The 3-Phase Commission Lifecycle

To ensure complete operational compliance and financial control, commission processing follows a structured three-phase lifecycle:

![Sales Commission 3-Phase Operational Lifecycle](/images/sales-commission-applet/commission-lifecycle-infographic.png)

1. **Phase 1: Cycle Definition (Sales Commission Cycle):** Finance or Payroll administrators create a formal period bucket (e.g., *October 2024 Sales Cycle*). Defining start and end cut-off dates binds the financial window.
2. **Phase 2: Report Generation (Sales Commission Report):** The system executes background rules against closed sales invoices within the active cycle. It computes exact salesperson yields, allows line-by-line item verification, and routes the report for managerial approval.
3. **Phase 3: Payout Execution (Payout Processing):** Once the commission report is approved (`FINAL`), Payroll generates a Payout Processing document. This acts as an Internal Payment Voucher to execute outbound bank transfers and post GL expense entries.

---

## Quick Start Guide

Follow this standardized 4-step workflow to process and disburse monthly sales commissions.

### Processing Monthly Sales Commissions

| Step | Module / Route | Key Operational Tasks |
| :-: | :--- | :--- |
| **1** | **Sales Commission Cycle** | Click **Create ("+")**. Enter the formal Cycle Name (e.g., *2024-M10 Commission*), set the Start and End dates, then click **FINAL** to lock the period window. |
| **2** | **Sales Commission Report** | Click **Create**. Select the active Cycle. The system automatically fetches qualified sales transactions and computes individual rep earnings. |
| **3** | **Line Items Verification** | Open the **Line Items** tab within the report to review specific invoice line items, commission percentages, and adjustments. Click **FINAL** to approve the report. |
| **4** | **Payout Processing** | Open Payout Processing, create a new payout, and link it to the finalized Report via the **Payout For** tab. Specify bank credentials in the **Payment** tab and click **FINAL** to disburse. |

---

## Detailed Module & Workspace Architecture

Based on the left sidebar navigation hierarchy, the applet architecture is organized into four primary operational modules.

### 1. Sales Commission Report Module

The central analytical engine where commission yields are compiled, audited, and verified before any funds are disbursed.

{{< figure src="/images/sales-commission-applet/sales-commission-report-ui.png" alt="Sales Commission Report Workspace - showing the Sales Commission Report listing grid on the left and the Details editing panel on the right" caption="Sales Commission Report Workspace. The primary calculation and auditing interface featuring the report listing grid on the left and the Details editing panel on the right." >}}

#### Core Workspace Parameters & Data Fields
- **Company & Billing Cycle**: Identifies the corporate operating branch and the bound accounting cycle (`Cycle ID`).
- **Date Range**: Displays exact `Start Date` and `End Date` parameters controlling the calculation window.
- **Dual Yield Metrics**:
  - **Money Yields**: Displays the exact monetary commission calculated (**Money Amount**) along with operational status tracking (**Money Status: ACTIVE**).
  - **Point Yields**: Tracks non-monetary incentive metrics (**Point Amount & Status**) for gamified sales tiers, reward points, or multi-level marketing (MLM) incentive structures.
- **Entity & Agent Mapping**: Maps calculated yields directly to designated `Sales Agent`, `Member`, or `MLM Member` master profiles.

#### Operational Capabilities & UI Features
- **Real-Time Re-Calculation (`REGENERATE`)**: Located on the top-right toolbar. If sales invoices, credit notes, or target schemes are modified after initial report creation, clicking **`REGENERATE`** forces an instant re-query against the central ledger, refreshing all monetary and point yields in real-time.
- **Granular Line-Item Auditing**: Opening the **Line Item** tab provides a complete breakdown of every individual sales invoice contributing to the agent's total earnings, enabling rapid dispute resolution.
- **Dual Visualization Modes**: Supports both standard **Tab View** (`mat-tab-group`) and collapsible **Expansion Panel Accordion View** (`mat-accordion`) based on user preferences and screen real estate settings.

---

### 2. Payout Processing Module

Acts as a specialized **Internal Payment Voucher** engine that transforms approved commission reports into actionable bank disbursements and accounting ledger entries.

{{< figure src="/images/sales-commission-applet/payout-processing-ui.png" alt="Payout Processing Workspace - showing the Payout Listing grid on the left and the View Internal Payment Voucher panel on the right" caption="Payout Processing Workspace. The financial disbursement interface featuring the payout listing grid on the left and the Internal Payment Voucher editing panel on the right." >}}

#### The 6-Tab / 6-Panel Workspace Architecture

| # | Tab / Panel Name | Operational Purpose & Data Captured |
| :-: | :--- | :--- |
| **1** | **Details** | Captures document header metadata, transaction dates, voucher numbers, operating branch routing, and execution mode controls. |
| **2** | **Account** | Maps the target recipient master profile (Salesperson Entity, Vendor, Customer, or Employee profile) along with verified billing address data. |
| **3** | **Payment** | Outbound cash/bank transfer controls. Manages settlement rows, paying corporate bank accounts, payment methods (EFT/Cheque), and transaction reference numbers. |
| **4** | **Expenses** | Logs any internal administrative deductions, tax withholdings, or operational expense offsets applied against the net payout. |
| **5** | **Payout For** | Critical linkage panel connecting the payment voucher directly to the originating finalized Sales Commission Report. |
| **6** | **Contra** | General Ledger Doc Contra and Non-GL Doc Contra tools to offset advance draws, uncollected debts, or previous overpayments against current commission earnings. |

#### Action Controls & State Protection
- **Dual Confirmation Delete State**: Includes protective deletion logic (`CONFIRM DELETE`) preventing accidental destruction of draft payout vouchers.
- **GL Ledger Postings**: Finalizing (`FINAL`) a payout voucher generates real General Ledger credit/debit entries and updates outbound bank file queues.

---

### 3. Sales Commission Cycle Module

The administrative gateway for period governance and background calculation processing.

{{< figure src="/images/sales-commission-applet/sales-commission-cycle-ui.png" alt="Sales Commission Cycle Workspace - showing the Sales Commission Cycle listing grid on the left and the View Sales Commission Cycle panel with Processor controls on the right" caption="Sales Commission Cycle Workspace. The administrative period governance interface featuring the cycle listing grid on the left and the Processor execution panel on the right." >}}

#### Operational Architecture & Processor Execution Tabs
- **Main Tab**: Configures core period parameters including Cycle Number, Operating Company, Start Date, End Date, and Creation Timestamp.
- **Processor Tab**: Provides dedicated background execution tools to trigger calculation sequences manually via **`PROCESS`** action buttons:
  1. **Txn Lines Commission (`PROCESS`)**: Triggers line-by-line background computation matching item sales codes against configured commission rules.
  2. **Aggregate Commission (`PROCESS`)**: Compiles and aggregates raw line yields across sales agents, tiers, and business units.
  3. **Commission Report (`PROCESS`)**: Compiles final report entries and publishes them directly to the Sales Commission Report listing module.

#### Period Lockdown Security
- **Operational Effect**: When a cycle is marked `FINAL`, all bound sales transactions within the start and end date window are permanently locked against retroactive recalculation or double-assignment to future cycles.

---

### 4. Sales Commission Details Report Module

An enterprise-wide analytical reporting grid built on Ag-Grid for deep historical auditability.

{{< figure src="/images/sales-commission-applet/sales-commission-details-report-ui.png" alt="Sales Commission Details Report Workspace - showing mandatory top filter dropdowns for Sales Agent and Commission Cycle above an Ag-Grid cross-document reporting table" caption="Sales Commission Details Report Workspace. Enterprise-wide reporting grid allowing finance controllers to filter and analyze historical invoice commission lines." >}}

#### Mandatory Parameters & Search Controls
- **Sales Agent\***: Mandatory dropdown selection to isolate calculations for a specific commercial representative.
- **Commission Cycle\***: Mandatory dropdown selection binding the search query to an active or historical accounting cycle (e.g., *B Company SDN BHD (2026-05-01 - 2026-05-31)*).
- **SEARCH Action**: Queries the central repository and populates the itemized reporting grid.

#### Ag-Grid Analytical Capabilities & Column Matrix

| Column Category | Specific Ledger Fields Captured | Operational Purpose |
| :--- | :--- | :--- |
| **Salesperson & Entity Data** | Sales Agent Name, Entity Name | Tracks the responsible commercial representative and target customer master profile. |
| **Sales Invoice Metrics** | Invoice No, EMP Inv, Inv Date, Inv Amount | Details the underlying sales invoice reference number, employee invoice code, transaction logging date, and total invoice monetary value. |
| **Receipt & Settlement Metrics** | Receipt No, EMP Rct, Rct Date, Settlement Amount | Traces linked customer payment receipts, payment collection dates, and exact settlement amounts collected. |

#### Advanced Grid Operations
- **Dynamic Row Grouping**: Drag and drop any column header into the grouping panel above the grid to instantly aggregate line items (e.g., group transactions by Sales Agent or Invoice Date).
- **One-Click Export & Summary Tools**: Use the bottom toolbar controls to toggle summary calculation totals, generate CSV raw data exports, render printable PDF reports, or execute direct printing.

---

## Configuration & Settings

System administrators can customize applet behavior by clicking **Settings** at the bottom of the left navigation menu:

| Setting Area | Config Key / Menu | Purpose & Description |
| :--- | :--- | :--- |
| **Branch Defaults** | `Default Selection` | Configures default operating branches and corporate ledger accounts for commission liabilities. |
| **Security Controls** | `Field Settings` | Controls field and panel visibility (`showPanels()`). Allows admins to switch between Tab view and Accordion expansion view, or hide sensitive financial panels from unauthorized users. |
| **Statement Formats** | `Printable Format Settings` | Customizes the visual layout, column structures, and company branding of the *Commission Statement* PDF issued to sales personnel. |
| **Permissions** | `SHOW_GENDOC_FINAL_BUTTON` | Restricts document finalization and GL posting authority strictly to authorized HR and Finance controllers. |

---

## FAQ & Troubleshooting

**Q: What does the REGENERATE button do in the Sales Commission Report workspace?**  
A: The **REGENERATE** button forces the system to re-query the ledger and re-calculate all money and point commission yields. Use this if sales invoices or target schemes were modified after the report was created.

**Q: How do I switch between Tab View and Accordion Expansion Panel View?**  
A: View layouts are governed by the `showPanels()` configuration setting under **Settings > Field Settings**. Toggling this parameter switches the workspace between horizontal tabs and vertical collapsible accordion panels.

**Q: Why can't I recalculate or edit a historical commission report?**  
A: Once a **Sales Commission Cycle** or Report is marked as `FINAL`, the system locks all bound sales transactions. This prevents historical figures from changing after payouts have been disbursed.

**Q: Why doesn't a specific Sales Invoice appear in the Commission Report?**  
A: Ensure that:
1. The Sales Invoice transaction date falls strictly within the Cycle's Start and End date window.
2. The Sales Invoice is fully posted (`FINAL`) and not in `DRAFT` status.
3. The salesperson is correctly assigned in the invoice header metadata.

**Q: Can a salesperson be paid commissions across multiple bank accounts?**  
A: Yes. In the **Payout Processing** module, multiple settlement rows can be added under the **Payment** tab to split payouts across different payment methods or bank accounts.
