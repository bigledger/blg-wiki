---
title: "Sales Commission Applet"
description: "Track, calculate, monitor, and process system-driven payouts for sales commissions across your organization."
weight: 70
tags:
- sales
- commission
- hr
- payout
---

> [!WARNING]
> **Work in Progress:** This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.

## Purpose and Overview

The **Sales Commission Applet** is an automated financial tracking and workflow workspace designed to handle the complex lifecycle of sales incentive payouts. 

It connects directly to finalized sales transactions (like paid invoices) and evaluates them against defined commission rules. It provides a transparent view for sales teams to monitor their earnings, managers to approve cycles, and finance teams to execute final payouts.

### Who Benefits from This Applet?

| Role | How they use it |
|------|-----------------|
| **Sales Representatives** | Track their earned commissions in real-time and review the specific line-item sales that generated their incentives. |
| **Sales Managers** | Define and close "Commission Cycles", grouping a time period's earnings for calculation. |
| **Finance / Payroll Teams** | Use the Payout Processing workflow to formally issue payments and reconcile commission liabilities. |
| **System Administrators** | Configure necessary payout print layouts and application default field settings. |

---

## What Problems Does This Solve?

**Without This Applet:**
- Commissions are calculated manually in spreadsheets at the end of the month, prone to human error and data entry mistakes.
- Sales reps have no visibility into their expected earnings until payday, leading to "shadow accounting" and disputes.
- Tying a specific commission payout back to the exact customer invoice that generated it requires digging through multiple disconnected systems.
- Executing the actual payment requires a messy handoff between sales management and the finance team.

**With Sales Commission Applet:**
- You get a **transparent, system-calculated ledger** of all earned commissions tied directly to ERP sales data.
- You can establish structured **Sales Commission Cycles** to calculate and lock earnings for a specific period securely.
- You can drill down into the **Sales Commission Details Report** to prove exactly which items or invoices generated an incentive.
- Finance teams get a dedicated **Payout Processing** workspace to mark commissions as paid efficiently.

---

## Role-Based Quick Start Guides

### For Sales Representatives: Tracking Your Earnings
Your goal is to monitor your commission performance for the current period.

1. Open the **Sales Commission Report** from the sidebar.
2. Filter the view by your User ID or Employee Code (if not already defaulted) and the current date range.
3. Review the summary of your earned commissions.
4. To see exactly which deals generated these amounts, switch to the **Sales Commission Details Report** for a granular, line-by-line breakdown.

### For Sales Managers: Managing the Commission Cycle
Your goal is to lock in a period's earnings so finance can process them.

1. Open the **Sales Commission Cycle** workspace.
2. Review the active cycle (e.g., "October 2026 Commissions"). Verify that all relevant sales calculations have been aggregated correctly.
3. Once the period is finalized and reviewed, use the workflow actions to close or approve the cycle, locking the figures.
4. Export the cycle summary to share with your team or upper management.

### For Finance Teams: Processing Payouts
Your goal is to issue the actual payments for approved commissions and update the system ledger.

1. Navigate to **Payout Processing** in the sidebar.
2. Filter the grid to find approved, unpaid commissions from the latest closed Sales Commission Cycle.
3. Select the relevant commission records and execute the payout action to mark them as paid in the system, generating the necessary Internal Payment Voucher reference.
4. If a statement or voucher document is required, click the Print action (configured via Printable Format Settings).

---

## Deep-Dive: The Report Workspaces

### 1. Sales Commission Report
This is the high-level summary view. It shows aggregated commission amounts earned by entities (employees or partner agencies) over a specific time frame.
- **Use Case**: Used by management to quickly gauge the total commission liability the company owes for the month.

### 2. Payout Processing
This is the financial execution workspace. Only authenticated finance or payroll users typically access this to transition a commission from "Earned/Approved" to "Paid."
- **Use Case**: Generating internal payment vouchers to settle agent commissions accurately.

### 3. Sales Commission Cycle
This workspace groups commissions into manageable time buckets (e.g., Monthly, Quarterly). A cycle must typically be generated, reviewed, and closed before payouts occur.
- **Use Case**: Preventing late-entered retroactive sales documents from altering a commission payout that has already been approved for finance processing.

### 4. Sales Commission Details Report
This is the granular audit view. It breaks down the high-level summary into individual transaction lines, showing the source invoice, the item sold, the commission rate applied, and the final cut.
- **Use Case**: Crucial for resolving disputes when a sales representative questions why their commission total differs from their personal calculations.

---

## Applet Configuration (For Admins)

Navigate to **Settings** in the sidebar to configure the applet's behavior.

### Application Settings (Field Settings)
Control the visibility and mandatory status of fields across the commission reporting and payout screens, ensuring users only see data relevant to their security level.

### Default Selection
Set applet-wide defaults so users automatically see data filtered for their default branch or operating location, preventing unauthorized viewing of other branches' commission data.

### Printable Format Settings
Upload the **`.jrxml`** template used for generating Payout Vouchers or Commission Statements. Once set as the default, this template is used whenever finance clicks "Print" during payout processing.

---

## Common Real-World Scenarios

### Scenario 1: Resolving a Commission Dispute
**The Situation:** A sales rep believes their monthly commission is lower than it should be because a major deal isn't reflecting.
**The Workflow:** The manager opens the **Sales Commission Details Report**, filters by the rep's ID, and exports the list of credited invoices. They quickly identify that the major deal in question was invoiced on the 1st of the *following* month, meaning it will appear in the next Sales Commission Cycle.

### Scenario 2: Executing Batch Payments to Partners
**The Situation:** The company uses external distributors who earn commissions, requiring formal payment vouchers every quarter.
**The Workflow:** At the end of the quarter, the manager closes the **Sales Commission Cycle**. Finance opens the **Payout Processing** workspace, selects all the distributor records for that cycle, and executes the payout generation. They then print the payment vouchers using the configured printable format and send them to the distributors alongside the bank transfers.

---

## FAQs

**Q: Does this applet define the commission percentages?**  
A: Typically, the mathematical *rules* (e.g., "10% on Product A") are defined in the master data or a dedicated Commission Scheme Applet. *This* applet is the engine that calculates, reports, and pays out those rules.

**Q: Can I manually alter a commission amount here?**  
A: Generally, no. This applet is designed as a secure, system-calculated ledger based on source transactions. To alter a commission, the underlying transaction or the commission scheme rule must typically be corrected.

**Q: How do I print a commission payout slip?**  
A: Finance users must process the payout in the **Payout Processing** workspace. Ensure a system administrator has uploaded a valid format in **Printable Format Settings**, then use the Print action on the payout record.
