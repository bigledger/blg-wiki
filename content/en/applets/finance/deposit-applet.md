---
title: "Deposit Applet"
description: "Integrated lifecycle management for Money Market (MM) deposit requisitions, registers, and strategic investment workflows"
tags:
- treasury-operations
- deposit-management
- interest-tracking
- financial-controls
- money-market
weight: 210
---

{{< callout type="warning" >}}
**Daily cashier report applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Deposit Applet** centralizes and automates the company's short-term cash placement activities. It streamlines the entire process from raising Money Market (MM) deposit requisitions and comparing counterparty offers to managing live placements in the register and maintaining category metadata. It enforces strict form validation, complex interest rate logic, and permissioned state changes to ensure financial integrity.

{{< callout type="info" >}}
**Core Concept**: The system manages the transition from a **Requisition** (the request for placement) to the **Register** (the active financial asset), ensuring consistent interest calculation and auditability at every step.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Treasury Managers:**
- Efficiently prepare and approve placements
- Compare fixed vs. floating interest offers from multiple counterparties
- Manage renewal and rollover strategies with automated assistance
- Maintain a balanced investment ladder

**Finance Controllers:**
- Ensure GL and currency integrity across all transactions
- Standardize rounding and formatting for financial reports
- Maintain a complete, immutable audit trail of all modifications
- Enforce strict SAVE and FINAL governance rules

**Financial Analysts:**
- Review interest rate effectiveness over time
- Export consistent, formatted listings for stakeholders
- Analyze deposit categories to optimize cash placement strategies
- Monitor transaction histories including inflation and compound adjustments

### What Problems Does This Solve?

**The Manual Spreadsheet Risk:**

Managing deposits across multiple banks using ad-hoc spreadsheets leads to significant operational risks:
- Fragmented records of counterparty offers and email-based quotes
- Manual calculation errors in interest rates and maturity amounts
- Inconsistent GL mapping leading to month-end reconciliation headaches
- Lack of visibility into maturity dates, resulting in stagnant cash
- Difficulties in maintaining a reliable audit trail for compliance

**The Deposit Applet Solution:**

- **Centralized Requisition Workflow** - Consolidate all investment requests and invitee quotes in one place
- **Mutually Exclusive Interest Logic** - Support for both FIXED and FLOATING rates with automated computation
- **Automated Transaction Generation** - System-generated placements, interest, and inflation entries upon finalization
- **Strict Data Parity** - Ensures invitee details match requisition constraints, preventing data drift
- **Strategic Auto-Rollover** - Configurable logic to keep funds invested according to schedule until stopped

## Key Features Overview

{{< cards >}}
  {{< card title="MM Requisition" subtitle="Create and validate new deposit placements" link="#mm-deposit-requisition" >}}

  {{< card title="Interest Engine" subtitle="Fixed and floating rate logic with precision" link="#interest-rate-logic" >}}

  {{< card title="Invitee Management" subtitle="Manage counterparty quotes and secure offers" link="#invitee-flow" >}}

  {{< card title="Deposit Register" subtitle="Monitor live placements and transactions" link="#mm-deposit-register" >}}

  {{< card title="Auto-Rollover" subtitle="Configure renewal and renewal strategies" link="#rollover-management" >}}

  {{< card title="GL Consistency" subtitle="Automatic mapping to company cost centers" link="#gl-code-consistency" >}}
{{< /cards >}}

## Key Concepts

### Understanding Interest Logic

The applet supports two distinct interest types, each with its own validation and behavior:

| Interest Type | Behavior | Key Fields |
|---------------|----------|------------|
| **Fixed** | User defines a static percentage rate. | Interest Rate (%) |
| **Floating** | Rate is derived from a reference source plus a margin. | Ref Value + Ref Delta |

{{< callout type="tip" >}}
**Precision Rule**: The system enforces programmatic rounding to two decimals for all interest rates and effective values to prevent floating-point artifacts and ensure audit consistency.
{{< /callout >}}

### The Requisition-to-Register Flow

The lifecycle of a deposit moves through clear stages:

```
Strategy & Category
│
├── Requisition (DRAFT) ──→ Define terms and invite counterparties
│   │
│   └── Requisition (FINAL) ──→ Lock details and collect final quotes
│       │
│       └── Register (APPROVED) ──→ Live placement and transaction generation
│           │
│           └── Maturity/Rollover ──→ Settlement or scheduled renewal
```

---

## Quick Start Guide

### For Treasury: Creating a Placement Request

**Goal:** Set up a new deposit requisition and collect offers.

1. **Navigate**: Go to **MM Deposit Requisition** and click **"+"**.
2. **Setup Details**: Fill in the Deposit Name, Code, Company, and Currency.
3. **Configure Interest**: 
   - Select **FIXED** and enter the rate, OR 
   - Select **FLOATING** and enter the Ref Value and Delta.
4. **Collect Quotes**: Go to the **Invitee** tab and add potential counterparties (Name and Email).
5. **Finalize**: Once valid, click **FINAL** to lock the record and automatically email invitees for their secure quotes.

---

### For Finance: Managing the Register

**Goal:** Activate a placement and monitor its growth.

1. **Import Requisition**: Open the **MM Deposit Register** and use the **Select Requisition** tool to bring in an approved request.
2. **Verify Details**: Ensure all interest logic and GL codes have persisted correctly through the navigation.
3. **Activate**: Click **FINAL** on the register entry to auto-generate the **Placement**, **Interest**, and **Compound** transactions.
4. **Monitor Transactions**: Use the **Transactions** tab to view every system-generated entry tied to the deposit.

---

## Configuration & Settings

Tailor the treasury environment through the following:

- **MM Deposit Category**: Maintain the grouping metadata (Code, Name, Description) used for reporting.
- **GL Code Mapping**: Ensure companies are correctly linked to their respective investment accounts.
- **Auto-Rollover Defaults**: Configure the default logic (Principal vs. Principal + Interest) used during maturity events.
- **Permission Guards**: Control who can move a record from **SAVE** to **FINAL** states.

---

## FAQ

**Q: Why is the FINAL button disabled when I click it?**
A: The FINAL button is hard-linked to the SAVE button's validation logic. If the form is invalid or required fields are missing, both buttons will be disabled to prevent incomplete records.

**Q: Can I change a deposit from Fixed to Floating after finalization?**
A: No. Once a record reaches the FINAL state, the interest type is locked to preserve the audit trail and counterparty agreement terms.

**Q: How does the system handle interest conversion to principal?**
A: You can enable "Interest Convert to Principal" in the settings. This triggers the auto-generation of Compound transactions during the deposit lifecycle.

**Q: What happens when an invitee receives the invitation email?**
A: They are provided with a secure, expiring link that allows them to submit their quotation details directly into a landing page, which then synchronizes back to your requisition.

---
