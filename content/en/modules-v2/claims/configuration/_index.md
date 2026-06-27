---
title: "Configuration"
description: "Step-by-step implementation workflow for configuring the Claims Management Module."
weight: 30
bookCollapseSection: false
---

Configuring the Claims Management Module follows a strict 5-phase dependency chain. Expense categories and employee grade structures must be established before entitlement caps or approval routing rules are enabled.

## Configuration Dependency Chain

![5-Phase ERP Claims Setup Pipeline](/images/claims/claims_configuration_workflow.png)

> [!WARNING]
> Employee profiles and job grades must exist in Core / HR **before** setting up claim entitlement caps or approval hierarchies. Always complete setup phases in order.

---

## Phase 1: Expense Categories

**What you are doing:** Defining claim categories (Medical, Travel, Entertainment, Mileage) and mapping GL expense accounts.

| Setup Task | Required Applet |
|------------|-----------------|
| Expense Category & GL Account Mapping | [Claim Applet](/applets/claims/claim-applet/) / Finance Setup |
| Mileage Distance Rates & Fuel Rules | [Claim Applet](/applets/claims/claim-applet/) |

---

## Phase 2: Employee Entitlements

**What you are doing:** Configuring annual claim balance caps and per-claim limits based on employee job grades.

| Setup Task | Required Applet |
|------------|-----------------|
| Job Grade Entitlement Caps Setup | [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) |
| Employee Benefit Balances & Allocations | [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) |

---

## Phase 3: Approval Matrices

**What you are doing:** Mapping department manager sign-offs, multi-tier threshold approvals, and delegation rules.

| Setup Task | Required Applet |
|------------|-----------------|
| Department Manager Approval Routing | [Claim Applet](/applets/claims/claim-applet/) |
| Multi-Tier Finance Threshold Sign-offs | [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) |

---

## Phase 4: Finance & GL Mapping

**What you are doing:** Mapping Accounts Payable clearing ledgers, bank disbursement rules, and tax deductibility splits.

| Setup Task | Required Applet |
|------------|-----------------|
| Employee Accounts Payable (AP) Ledgers | Financial Accounting Configuration |
| Tax Deductibility Split Configuration | Financial Accounting Configuration |

---

## Phase 5: Test & Validate (Smoke Test)

Before going live, complete these mandatory verification tests:

- [ ] **Receipt Scan Test:** Upload a sample paper receipt and verify OCR automatically populates date, vendor, and amount.
- [ ] **Entitlement Limit Test:** Submit a claim exceeding employee grade caps and verify the system blocks or flags the violation.
- [ ] **Approval & Payout Test:** Approve a test claim through managerial and finance steps and confirm GL expense posting.
