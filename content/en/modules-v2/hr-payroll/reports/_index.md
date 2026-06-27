---
title: "Reports & Analytics"
description: "Practical scenario guide and reporting matrix for payroll summaries, statutory compliance filings, and employee attendance tracking."
weight: 45
bookCollapseSection: false
---

The HR & Payroll Module provides comprehensive workforce analytics for HR directors, payroll officers, and finance managers to audit monthly salary commitments, generate statutory tax filings (EPF/SOCSO/PCB), and monitor staff absenteeism.

## Reporting Scenario Decision Matrix ("Which Report to Use When")

Select the appropriate report based on your specific operational or business decision scenario:

| Business Scenario / Question | Recommended Report | Primary Applet | Key Metrics & Decision Value | Actionable Business Outcome |
|------------------------------|--------------------|----------------|------------------------------|-----------------------------|
| **"What is our total monthly payroll cost breakdown across basic salary, overtime, and employer statutory contributions?"** | Monthly Payroll Summary & Cost Breakdown | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) / Payroll Engine | Gross salary total, net salary payout, total employer EPF/SOCSO liability, department cost allocation. | Reconciles payroll bank disbursements and posts monthly salary expense GL journals. |
| **"What statutory tax deduction reports (EPF Borang A, SOCSO Borang 8A, PCB CP39) are needed for monthly government filing?"** | Monthly Statutory Compliance Filings | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) / Payroll Engine | Employee TIN/IC numbers, wages subject to EPF/SOCSO, statutory deduction amounts per employee. | Generates official electronic submission files for government portals prior to monthly deadlines. |
| **"Which factory workers accumulated excessive overtime hours during the current shift cycle?"** | Overtime Audit & Hours Summary | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) | Clock-in/out logs, approved OT hours, overtime pay multiplier total by worker. | Identifies fatigue risks, controls labor cost overruns, and audits supervisor OT approvals. |
| **"What employees were frequently tardy or absent without approved leave during the month?"** | Absenteeism & Late Clock-In Log | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) | Late arrival timestamps, unexcused absence count, missing clock-out alerts by branch. | Triggers HR disciplinary reviews and calculates unexcused absence unpaid leave deductions. |

---

## Detailed Operational Reporting Guides

### 1. Gross-to-Net Payroll Reconciliation
- **Purpose:** Audits individual employee salary components, statutory withholdings, and net bank payouts prior to final disbursement.
- **Key Parameters:** Filter by Payroll Month, Department ID, and Employment Type (Full-time vs Part-time).
- **Operational Utility:** Prevents salary overpayment errors and verifies bank GIRO payout totals.

### 2. Annual EA Form Tax Reporting
- **Purpose:** Compiles annual remuneration summaries for employees for annual income tax filing.
- **Key Parameters:** Filter by Calendar Year and Employee ID.
- **Operational Utility:** Automates annual EA Form generation for staff prior to statutory deadlines.
