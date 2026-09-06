---
aliases:
- /modules-v2/claims/use-cases/
title: "Use Cases"
description: "Real-world business reference architectures for corporate travel expenses, medical benefits management, and sales mileage reimbursements."
weight: 40
bookCollapseSection: false
---

The Claims Management Module flexibly supports diverse employee reimbursement workflows across corporate sales teams, executive travel, and wellness benefits.

## 1. Corporate Sales Travel & Entertainment (Field Expense Tracking)

**Business Scenario:** A sales team frequently travels to visit commercial clients, incurring flight, lodging, and client entertainment expenses requiring digital receipt capture and manager sign-off.

- **Primary Applets:** [Claim Applet](/applets/claims/claim-applet/), [Claim Cycle Applet](/applets/claims/claim-cycle-applet/)
- **Operational Flow:** Sales executive scans hotel receipt via mobile app → attaches client business justification → department manager reviews and approves → finance audits tax deductibility and issues bank reimbursement.

---

## 2. Annual Employee Medical & Dental Benefits Management

**Business Scenario:** An enterprise provides employees with an annual medical entitlement balance ($1,500/year) for outpatient clinic visits and dental care.

- **Primary Applets:** [Claim Applet](/applets/claims/claim-applet/), [Claim Cycle Applet](/applets/claims/claim-cycle-applet/)
- **Operational Flow:** Employee submits clinic invoice → system checks remaining annual entitlement balance → claim deducted from balance → approved claim batched for monthly payroll reimbursement.

---

## 3. Automated Sales Force Mileage & Logistics Reimbursement

**Business Scenario:** Technical service engineers and sales reps claim vehicle mileage reimbursement based on client site visit distances.

- **Primary Applets:** [Claim Applet](/applets/claims/claim-applet/)
- **Operational Flow:** Employee inputs travel origin, destination, and total kilometers → system applies pre-configured distance rate ($0.60/KM) → supervisor approves → finance posts reimbursement.
