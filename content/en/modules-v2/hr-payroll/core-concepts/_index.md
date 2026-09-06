---
title: "Core Concepts"
description: "Fundamental architectural concepts of BigLedger's HR & Payroll Module — time attendance, gross-to-net calculation, and statutory compliance."
weight: 20
bookCollapseSection: false
---

Understanding core HR concepts is essential before establishing salary schemes or running monthly payroll. These concepts explain **how employee time attendance converts into verified payroll calculations** and how statutory deductions comply with government labor regulations.

## Gross-to-Net Payroll Calculation Flow

Monthly payroll computation follows a structured 5-step processing pipeline:

| Step | Milestone | Business Purpose | Applet Used |
|------|-----------|------------------|-------------|
| **1** | **Clock-In Log** | Biometric terminal and mobile GPS attendance data collection | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) |
| **2** | **Overtime Audit** | Supervisor verifies hours and approves overtime pay multipliers | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) |
| **3** | **Claims Sync** | Approved employee expense reimbursements merged into payroll run | [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) |
| **4** | **Statutory Calc** | Gross salary computed with statutory EPF, SOCSO, EIS & PCB tax withholdings | Payroll Engine |
| **5** | **Disbursement** | Electronic bank GIRO payout and General Ledger expense journal posting | Accounts Payable Integration |

---

## What to Read Next

- **[Configuration](/modules-v2/hr-payroll/configuration/)** — Set up employee profiles, shift rosters, and salary schemes.
- **[Use Cases](/modules-v2/hr-payroll/use-cases/)** — Review reference architectures for manufacturing shift rosters, retail hourly staff, and executive payroll.
