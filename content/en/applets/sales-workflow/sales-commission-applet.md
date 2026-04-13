---
title: "Internal Sales Commission Applet"
description: "Comprehensive reporting and payout processing engine for calculating, analyzing, and disbursing sales commissions."
tags:
- sales
- commission
- hr
- payout
- reporting
weight: 160
---

{{< callout type="warning" >}}
**Work in Progress:** This document is actively being updated. Sections may be incomplete or subject to change as new versions of the applet are documented.
{{< /callout >}}

## Purpose and Overview

The **Internal Sales Commission Applet** provides a specialized workflow bridging the gap between Sales performance and Payroll/HR disbursement. It automates the generation of commission reports based on predefined performance logic, manages cycle periods, and converts approved commission reports into actionable payout documents (Internal Payment Vouchers).

{{< callout type="info" >}}
**Core Concept:** The applet strictly separates "Calculation" (Reports) from "Disbursement" (Payouts). A commission report calculates what is owed based on sales figures, but no money moves until a Payout Processing document is finalized.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales Managers:**
- Transparent reporting on team performance and commission yields.
- Granular breakdown of commission by specific item or invoice.

**HR & Payroll Teams:**
- Automated calculation eliminates manual spreadsheet math.
- Streamlined **Payout Processing** natively integrated directly into the ERP accounting ledger.

**Finance Controllers:**
- Audit trails ensure no commission is paid out twice for the same invoice.
- Strict period closing via **Sales Commission Cycles**.

### What Problems Does This Solve?

**The "Shadow Payroll" Problem:**
Many companies calculate commissions in isolated Excel spreadsheets. These calculations are prone to human error, often lack auditability, and create massive administrative overhead when HR has to double-enter the data into payroll software.

**The Sales Commission Solution:**
- **In-ERP Calculation**: Pulls data directly from finalized Sales Invoices and receipts.
- **Cycle Management**: Locks periods so historical commissions cannot be recalculated after payout.
- **Automated Payouts**: The Payout Processing tab generates real accounting entries.

## Key Features Overview

{{< cards >}}
  {{< card title="Commission Reporting" subtitle="Summary and detailed yields" link="#sales-commission-report" >}}
  {{< card title="Cycle Management" subtitle="Lock reporting periods" link="#sales-commission-cycle" >}}
  {{< card title="Payout Processing" subtitle="Disburse funds securely" link="#payout-processing" >}}
  {{< card title="Details Report" subtitle="Line-by-line invoice breakdown" link="#sales-commission-details-report" >}}
{{< /cards >}}

## Key Concepts

### The Commission Lifecycle

The standard operational flow within this applet occurs in three phases:

1. **Cycle Definition:** Finance creates a "Sales Commission Cycle" (e.g., Q3 2024). This tells the system which dates to bind.
2. **Report Generation:** A "Sales Commission Report" is run for that cycle. The system analyzes all sales personnel, rules, and invoices, calculating what each salesperson earned. The manager reviews and approves this report.
3. **Payout Execution:** Once the report is finalized, Payroll uses the "Payout Processing" module to create Internal Payment Vouchers. This is the act of actually transferring cash to the employee's bank account.

---

## Quick Start Guide

### Processing a Monthly Sales Commission

1. Navigate to **Sales Commission Cycle** and click **"+" (Create)**.
2. Define the start and end dates of the period (e.g., Oct 1 - Oct 31). Save and Finalize the cycle.
3. Navigate to **Sales Commission Report** and click **Create**.
4. Select the Cycle you just created. The system will auto-populate the salespeople and their yields.
5. Click on the **Line Items** tab to review the exact breakdown if an employee queries their total.
6. **Save** and **Finalize** the Report.
7. Navigate to **Payout Processing**. Create a new payout, link it to the finalized Report, specify the bank accounting details in the **Payment** tab, and execute the payout.

---

## Feature Sections & Tabs

### Sidebar Routes

- **Sales Commission Report:** The master summary calculation document.
- **Payout Processing:** The financial module used to generate Payment Vouchers against reports.
- **Sales Commission Cycle:** The mechanism to define and lock date ranges.
- **Sales Commission Details Report:** A purely analytical view offering granular search filters to query historical commissions.

### Payout Processing Tabs (The 6-Tab View)

The Payout Processing module acts as a specialized Internal Payment Voucher with 6 specific tabs:

1. **Details**: Document numbering, dates, and branch routing.
2. **Account**: The target employee or vendor receiving the funds.
3. **Payment**: The operational cash outflow (e.g., selecting the outbound bank account and tracing the Cheque/EFT number).
4. **Expenses**: Any deductions or internal expenses applied against the payout.
5. **Payout For**: The linkage tab that connects this physical payment back to the originating Sales Commission Report.
6. **Contra**: Offsetting entries if the salesperson owes the company money (e.g., drawing against a future commission).

---

## Configuration & Settings

Use the **Settings** menu to control security and default behaviors.

### 1. Default Selection
Configure default branches for commission liability.

### 2. Field Settings
Highly customize the visibility of fields. As Payout Processing handles real financial data and HR figures, use field settings to hide tabs from unauthorized viewers.

### 3. Printable Format Settings
Customize the layout of the "Commission Statement" that is handed to the sales employee at the end of the month.

### 4. Permissions (Client-Side)
- `SHOW_GENDOC_FINAL_BUTTON`: Extremely critical. Only authorized payroll/finance controllers should be allowed to finalize a Payout Processing document.
