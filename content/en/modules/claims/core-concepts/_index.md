---
aliases:
- /modules-v2/claims/core-concepts/
title: "Core Concepts"
description: "Fundamental architectural concepts of BigLedger's Claims Management Module — entitlement caps, approval routing, and tax deductibility."
weight: 20
bookCollapseSection: false
---

Understanding core claims concepts is essential before establishing expense policies or configuring approval matrices. These concepts explain **how employee expenses are validated against corporate policies** and how approved reimbursements post to financial ledgers.

## The Employee Claim Processing Lifecycle

Expense reimbursements follow a structured 5-step lifecycle. Each step represents a policy verification milestone and financial authorization.

| Step | Milestone | Business Purpose | Applet Used |
|------|-----------|------------------|-------------|
| **1** | **Expense Incurred** | Employee incurs out-of-pocket business expense and scans paper receipt | [Claim Applet](/applets/claims/claim-applet/) |
| **2** | **Policy & Entitlement Check** | System checks claim against employee grade limits and annual balance caps | [Claim Applet](/applets/claims/claim-applet/) |
| **3** | **Managerial Approval** | Department manager reviews receipt and business justification | [Claim Applet](/applets/claims/claim-applet/) |
| **4** | **Finance Audit & Processing** | Finance verifies tax deductibility, checks GL coding, and approves payout | [Claim Applet](/applets/claims/claim-applet/) / [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) |
| **5** | **Reimbursement Disbursement** | Funds transferred to employee bank account or included in monthly payroll | Accounts Payable / Payroll Integration |

---

## Tax Deductibility & Entertainment Claim Rules

Tax authorities enforce strict rules regarding business entertainment expenses. BigLedger automatically segregates entertainment claims into tax-deductible vs. non-deductible GL accounts:
- **100% Tax Deductible:** Employee welfare meals, annual staff dinners, client meals directly tied to contract negotiations.
- **50% Tax Deductible:** General client entertainment and promotional corporate hospitality.

---

## What to Read Next

- **[Configuration](/modules/claims/configuration/)** — Set up expense categories, employee grade entitlement caps, and approval matrices.
- **[Use Cases](/modules/claims/use-cases/)** — Review reference architectures for corporate travel, medical benefits, and sales mileage.
