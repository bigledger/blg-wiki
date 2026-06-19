---
title: "Claims Management Module"
description: "Employee expense claims submission, approval workflows, and reimbursement cycle processing."
weight: 65
---

## 1. Module Overview

The **Claims Management Module** handles the entire employee expense reimbursement lifecycle — from claim submission through multi-level approval to batch payment processing. It eliminates paper-based claims with structured digital workflows.

**Business Value:**
- Paperless claim submission with receipt attachments
- Configurable multi-level approval workflows enforce policy compliance
- Claim Cycles enable batch processing of approved claims for efficient payroll integration
- Complete audit trail from submission to reimbursement

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Claim** | An expense reimbursement request submitted by an employee with supporting documents. |
| **Claim Type** | A category of expense (e.g., Travel, Meals, Entertainment, Training). |
| **Claim Cycle** | A defined period (e.g., monthly) during which approved claims are batched for payment processing. |
| **Approver** | A manager or department head authorized to approve or reject claims based on configured rules. |

---

## 3. Included Applets

| Applet | Purpose |
|--------|---------|
| [Claim Applet](/applets/claims/claim-applet/) | Submit, manage, and track expense claims with receipt attachments and category tagging. |
| [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) | Group approved claims into payment batches for efficient reimbursement processing. |

---

## 4. Standard Business Workflows

### Workflow 1: Claim Submission to Reimbursement

```
Employee Submits Claim ──▶ Manager Approves ──▶ Finance Reviews ──▶ Claim Cycle Created ──▶ Payment Processed
```

**Steps:**
1. **Employee** creates a claim in the **Claim Applet**, selects the claim type, enters amounts, and uploads receipts.
2. The claim routes to the **Manager** for approval based on the configured workflow.
3. **Finance** reviews approved claims for policy compliance.
4. At period end, Finance creates a **Claim Cycle** in the **Claim Cycle Applet** to batch all approved claims.
5. Payment is processed — either via payroll integration or a dedicated Payment Voucher.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **Employee** | Claim Applet | Submit claims, upload receipts, track status |
| **Department Manager** | Claim Applet | Approve or reject team claims |
| **Finance Officer** | Claim Applet, Claim Cycle | Review claims, create cycles, process payments |

---

## 6. Prerequisites / Initial Setup

- [x] **Core Module** — Employee records configured
- [ ] Claim types and categories defined in the **Claim Applet** settings
- [ ] Approval workflows configured via **Workflow Design Applet**
- [ ] Budget limits per claim type configured (if applicable)
- [ ] Payment method for reimbursements set up in **Cashbook**

---

## 7. FAQs & Troubleshooting

**Q: My claim has been "Pending Approval" for days. Who should I contact?**
A: Check the approval chain in the Claim Applet to see which approver is next. Contact them directly or escalate to your HR department.

**Q: Can I edit a claim after submitting it?**
A: Only if it hasn't been approved yet. Once approved, the claim is locked. You would need to create a new claim for corrections.

**Q: How are claim cycles connected to payroll?**
A: The Claim Cycle generates a batch of approved amounts that can be exported or linked to the Payment Voucher process in Financial Accounting for reimbursement.
