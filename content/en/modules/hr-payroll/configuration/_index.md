---
aliases:
- /modules-v2/hr-payroll/configuration/
title: "Configuration"
description: "Step-by-step implementation workflow for configuring the HR & Payroll Module."
weight: 30
bookCollapseSection: false
---

Configuring the HR & Payroll Module follows a strict 5-phase dependency chain. Employee master profiles and statutory tax parameters must be established before shift rosters or monthly payroll calculations are run.

## Implementation Pipeline & Workflow

---

## Phase 1: Master Foundations

**What you are doing:** Setting up company entity structures, statutory employer registration numbers, and public holiday calendars.

| Setup Task | Required Applet |
|------------|-----------------|
| Branch & Entity HR Profiles | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Employee Master Records & Bank Profiles | [Entity Maintenance Applet](/applets/master-data/entity-applet/) |
| Biometric & Mobile Attendance Configuration | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) |

---

## Phase 2: Shift Rosters & Work Schedules

**What you are doing:** Defining work schedules, shift rosters, overtime multipliers, and leave entitlement rules.

| Setup Task | Required Applet |
|------------|-----------------|
| Shift Schedules & Overtime Rules | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) |
| Annual & Medical Leave Entitlements | [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/) |

---

## Phase 3: Salary Schemes & Allowances

**What you are doing:** Setting basic salary structures, recurring allowances, fixed deductions, and claims integration.

| Setup Task | Required Applet |
|------------|-----------------|
| Employee Salary Components | Payroll Setup / HR Configuration |
| Claims Reimbursement Integration | [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) |

---

## Phase 4: Statutory & GL Mapping

**What you are doing:** Mapping EPF/SOCSO/PCB statutory deduction tables and General Ledger salary expense accounts.

| Setup Task | Required Applet |
|------------|-----------------|
| Statutory Deduction Tables & Rates | Payroll Setup |
| Salary Expense & Payable GL Mapping | Financial Accounting Configuration |

---

## Phase 5: Test & Validate (Smoke Test)

Before going live, complete these mandatory verification tests:

- [ ] **Clock-In Sync Test:** Clock in via biometric terminal and confirm real-time attendance logging in [Admin Time Attendance Applet](/applets/human-resources/admin-time-attendance-applet/).
- [ ] **Gross-to-Net Trial Run:** Execute a trial payroll run for 3 test employees and verify EPF, SOCSO, and PCB tax calculations.
- [ ] **Bank File Verification:** Generate a test bank direct-debit GIRO file and validate formatting with corporate banking portals.
