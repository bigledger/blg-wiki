---
title: "HR & Payroll Module"
description: "Employee records, attendance tracking, payroll processing, and leave management."
weight: 70
---

## 1. Module Overview

The **HR & Payroll Module** centralizes all human resource operations — from employee onboarding and department assignments to attendance tracking, leave management, and payroll processing. It integrates with Financial Accounting for salary postings and with Claims for reimbursement workflows.

**Business Value:**
- Single source of truth for all employee data across the organization
- Automated payroll calculations reduce manual errors and ensure timely payments
- Leave and attendance tracking provides accurate workforce availability data
- Integrates with Claims module for seamless expense reimbursement

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Employee Record** | The master data profile for each staff member including personal details, department, position, and compensation. |
| **Payroll Run** | The periodic process of calculating gross pay, deductions, statutory contributions, and net pay. |
| **Statutory Deduction** | Mandatory contributions (EPF, SOCSO, EIS, PCB in Malaysia) automatically calculated during payroll. |
| **Leave Entitlement** | The allocated number of leave days per leave type (annual, medical, etc.) assigned to employees. |

---

## 3. Included Applets

| Applet | Purpose |
|--------|---------|
| [Employee Maintenance Applet](/applets/master-data/employee-maintenance-applet/) | Manage employee master records — personal details, department, position, and contact information. |
| [Employee Applet](/applets/master-data/employee-applet/) | Employee self-service portal for viewing payslips, leave balances, and personal information. |
| [Claim Applet](/applets/claims/claim-applet/) | *(Shared from Claims Module)* Employee expense submission and tracking. |

---

## 4. Standard Business Workflows

### Workflow 1: Employee Onboarding

```
Offer Accepted ──▶ Employee Record Created ──▶ Department Assigned ──▶ System Access Granted ──▶ Payroll Enrolled
```

### Workflow 2: Monthly Payroll

```
Attendance Collected ──▶ Leave Deductions Applied ──▶ Payroll Calculated ──▶ Payslips Generated ──▶ Bank Transfer ──▶ GL Posted
```

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **HR Administrator** | Employee Maintenance | Create/update employee records, manage departments |
| **Payroll Officer** | Employee Maintenance, Financial Accounting | Run payroll, generate payslips, process bank transfers |
| **Employee** | Employee Applet | View payslips, leave balance, personal details |
| **Department Manager** | Employee Maintenance (read) | View team members, approve leave requests |

---

## 6. Prerequisites / Initial Setup

- [x] **Core Module** — Organisation with departments and positions defined
- [ ] Employee records imported or created
- [ ] Salary structures and deduction rules configured
- [ ] Statutory contribution rates (EPF, SOCSO, EIS, PCB) entered
- [ ] Leave types and entitlements defined
- [ ] Payroll bank account registered in **Cashbook**

---

## 7. FAQs & Troubleshooting

**Q: An employee's EPF contribution seems incorrect. Where do I check?**
A: Review the employee's salary structure and EPF category in their **Employee Maintenance** record. Ensure the statutory rate table is current.

**Q: Can employees view their own payslips?**
A: Yes, through the **Employee Applet** self-service portal.

**Q: How does payroll connect to the General Ledger?**
A: Payroll postings are generated as journal entries in the **Ledger & Journal Applet**, debiting salary expense accounts and crediting liability/bank accounts.
