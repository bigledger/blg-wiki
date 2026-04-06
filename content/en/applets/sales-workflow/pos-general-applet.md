---
title: "POS General Applet"
description: "System Configuration & Administration Guide for Point-of-Sale terminal management and retail operations"
tags:
- pos-module
- point-of-sale
- retail
- terminal-management
- cashier-operations
- system-configuration
weight: 200
---

## Purpose and Overview

The **BigLedger POS General Applet** is engineered with a modular architecture that prioritizes front-end operational velocity without compromising back-end data integrity. From a systems perspective, this modularity allows the platform to maintain a consistent state across distributed multi-branch environments. For the Enterprise Architect, centralized administrative oversight is the primary mechanism for ensuring that every transaction aligns with corporate governance and fiscal standards.

{{< callout type="info" >}}
**Core Concept:** The POS General Applet functions as the front-end capture point for retail operations, while the Cashbook Applet serves as the authoritative financial ledger. Successful integration requires seamless linking between these two systems.
{{< /callout >}}

## Key Features Overview

{{< cards >}}
  {{< card title="Access Control" subtitle="Rigorous Permission Level hierarchy" link="#for-supervisors-managers" >}}
  {{< card title="Environmental Defaults" subtitle="Global settings vs. Personalization" link="#for-admins-financeit" >}}
  {{< card title="Financial Integration" subtitle="Cashbook linking and settlement methods" link="#financial-integration-cashbook-linking-and-settlement-methods" >}}
  {{< card title="Operational Controls" subtitle="Sessions, Drawers, and Serial Management" link="#for-cashiers-front-line" >}}
  {{< card title="Reporting & Audit" subtitle="Management intelligence and audit tools" link="#reporting-framework-and-audit-intelligence" >}}
{{< /cards >}}

{{< figure src="/images/pos-general-applet/pos-overview-infographic.png" alt="From Scattered Sales to Centralized Control: Your Guide to the POS General Applet" caption="From Scattered Sales to Centralized Control: The Old Way (isolated terminals, manual cashbook entries, back-dating risks) vs The New Way (strict permission hierarchies, automated ledger synchronization, immutable audit trails)." >}}

## Key Concepts

### Understanding the POS Framework

Every POS system must address fundamental operational aspects. The POS General Applet provides structured handling:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Where** is the sale? | Branch / Terminal | Retail Storefront HQ, Terminal 1 |
| **Who** is processing? | Sales Agent (Cashier) | John Doe (Agent ID 101) |
| **How** is it paid? | Settlement Method | Credit Card, Cash, E-Wallet |

{{< callout type="tip" >}}
**Real-World Example**: A customer buys a shirt. The Cashier (WHO) rings it up at Terminal 1 (WHERE). The customer pays with a Credit Card (HOW). The system logs this exactly to ensure accurate Z-reports at the end of the shift.
{{< /callout >}}

### POS Hierarchy Structure

Think of the retail settlement process as a structured flow:

```
Organization
│
├── Branch / Terminal ──→ WHERE does the sale happen?
│   │
│   └── Sales Agent (Cashier) ──→ WHO is processing the sale?
│       │
│       └── POS Session ──→ WHEN is the shift open?
│           │
│           └── Retail Transactions ──→ WHAT is being sold?
│
└── Cashbook / Ledger ──→ WHERE is the money deposited?
    │
    └── Settlement Methods ──→ HOW is the customer paying?
```

**Flow Through the Hierarchy:**
1. **Organization**: Company-wide governance
2. **Branch**: The physical store default settings
3. **Sales Agent**: Individual accountability via Personalization
4. **Session**: The temporal shift container 
5. **Transaction**: The actual sales data
6. **Cashbook**: The final verified financial repository

### The "Golden Triangle" of POS

To effectively manage the retail system, it is crucial to understand how the core components work together.

| Component | Analogy | Definition | Example |
|-----------|---------|------------|---------|
| **Cashbook** | The "Vault" | The final authoritative financial ledger. | **UOB Bank Account** |
| **Settlement Method** | The "Bridge" | The specific payment type mapped to the Cashbook. | **GrabPay Integration** |
| **POS Terminal** | The "Register" | The physical/digital active branch where sales happen. | **Store Terminal 1** |

---

## Quick Start Guide

### For Cashiers: Start Your Shift

**Goal:** Open a secure session to begin ringing up customers.

1. **Log In:** Access the POS interface.
2. **Personalization:** Ensure your Default Selection is set (Agent, Branch).
3. **New Session:** Click to open a new operational session. This isolates all your shift data for the day.
4. **Process Sales:** Ring up items and select the appropriate Settlement Method (Cash, Card).

### For Managers: Adjusting Terminals

**Goal:** Provide oversight and perform necessary overrides.

1. **Review Bills:** Use the Cash Bill Listing to find transactions.
2. **Reprint Receipts:** Authorized managers can reprint receipts for disputes.
3. **Serial Number Swaps:** Correct scanned inventory serials post-finalization without deleting the whole transaction.

### For Admins: Initial System Setup

**Goal:** Connect the physical storefront to the central accounting ledger.

1. **Create Cashbooks:** Define the financial vaults.
2. **Define Settlement Methods:** Add Cash, Card, and E-Wallets.
3. **Map to Branches:** Link the settlement methods to specific physical terminals.
4. **Configure Permissions:** Restrict roles so standard users cannot "Change Date" or view "GP Visibility".

---

## For Cashiers (Front-Line)

### Advanced Operational Controls: Sessions, Drawers, and Serial Management

To maintain shift-based accountability and control over high-value inventory, leverage the system's temporal and serialized tracking tools.

**Session and Drawer Control:**
* **Temporal Containers:** Once enabled, the standard sales UI is replaced by a "New Session" prompt. For example, a session opened on August 5th acts as a temporal container, isolating all transactional data and float movements for that specific shift.
* **Hold and Recall:** During active sessions, the system allows for "Hold and Recall" functionality, permitting cashiers to suspend a transaction state and resume it later without losing data or blocking the terminal.

**Serialized Inventory:**
BigLedger POS is an "Auto-Final" system, meaning transactions are persisted and finalized immediately upon settlement.
* **Serial Management:** Serialized items trigger a "Serial Number" tab. Input is facilitated via Manual Search (`+` button) or E-code scanning. The system validates the status as "Valid" or "Invalid" in real-time.

{{< figure src="/images/pos-general-applet/pos-new-session.png" alt="New Session Prompt & Serial Number Management" caption="New Session Prompt & Serial Number Management" >}}

---

## For Supervisors (Managers)

### Administrative Foundation and Access Control

Visibility and functional access within the applet are governed by a rigorous **Permission Level hierarchy**. While the "Admin" role possesses unfettered visibility into modules such as Cash Bill Listing, Settlement Adjustments, and Gross Profit (GP) data, standard user roles are restricted to a subset of tools. This reduction of "operational noise" is a deliberate design choice to minimize input errors and cognitive load for front-end staff.

**Role Permissions Overview:**
```
[Administrator]
  ├── Change Branch
  ├── Change Date
  ├── GP Visibility
  └── Settlement Adjustment

[Manager]
  ├── Reprint Receipt
  └── Swap Serial Number

[Standard User / Cashier]
  ├── Basic Sales UI
  └── Open/Close Session
```

| Function | UI Location / Context | Permission Requirement |
|----------|-----------------------|------------------------|
| **Reprint Receipt** | Cash Bill Listing Module | Manager / Administrator |
| **Change Branch** | Main POS UI | Administrator / Multi-branch User |
| **Change Date** | POS Header / Settings | Administrator Only |
| **Swap Serial Number** | Cash Bill Listing | Manager / Administrator |
| **GP Visibility** | Item Detail / Discount Tab | Administrator / Auditor |
| **Settlement Adjustment** | Dedicated Admin Module | Administrator Only |

{{< callout type="warning" >}}
**Architectural Mandate: Audit Integrity**
Restricting functions like "Change Date" and "GP Visibility" is fundamental to preventing back-dating fraud and protecting sensitive margin data. By locking the transactional timestamp to the server's system time for standard users, the system ensures an immutable audit trail.
{{< /callout >}}

{{< figure src="/images/pos-general-applet/pos-permission-settings.png" alt="Permission Settings UI: Configuring access control for different roles" caption="Permission Settings UI: Configuring access control for different roles" >}}

---

## For Admins (Finance/IT)

### Configuring Environmental Defaults: Global Settings vs. Personalization

System efficiency in BigLedger relies on a hierarchy of configuration inheritance. 

**Global vs Personalization Setup Flow:**
```
1. Global Settings (Set by Admin) -> Defines baseline for all users
2. Personalization Menu (Set by User) -> Navigates to Default Selection
3. Agent/Customer/Branch config -> Auto-populates data upon login
```

{{< callout type="tip" >}}
**Analytical Perspective: Configuration Inheritance**
This hierarchy utilizes a "User Override" logic. While the system maintains a "Static Default" for the branch, personalization allows roaming agents to maintain individual accountability. In shared-terminal retail environments, this ensures that the system accurately attributes performance and inventory movements to the specific authenticated agent rather than a generic terminal ID.
{{< /callout >}}

{{< figure src="/images/pos-general-applet/pos-personalization-menu.png" alt="User Personalization: Default Selection Menu" caption="User Personalization: Default Selection Menu" >}}

### Financial Integration: Cashbook Linking and Settlement Methods

The POS General Applet functions as the front-end capture point for the Cashbook Applet, which serves as the authoritative financial ledger. Successful integration requires a multi-step linking process:

**Configuration Protocol:**
1. **Cashbook Creation:** Before defining a payment method, a Cashbook (e.g., "UOB Bank Account") must be created.
2. **Settlement Method Definition:** Define specific methods (e.g., UOB Credit Card, GrabPay, Cash) and link them to their respective Cashbook source.
3. **Branch Linking:** Navigate to the "Settlement Method Setting" to map these methods to specific Branches.

{{< callout type="important" >}}
**The "Red Color" Fail-Safe:**
The UI utilizes red color coding to indicate unlinked settlement methods. If a method is not explicitly mapped to the active branch, it will not appear in the POS interface. This prevents cross-branch accounting errors!
{{< /callout >}}

{{< figure src="/images/pos-general-applet/pos-settlement-method-linking.png" alt="Settlement Method Setting: Linking payment methods to specific branches" caption="Settlement Method Setting: Linking payment methods to specific branches" >}}

---

## Reporting Framework and Audit Intelligence

The BigLedger POS reporting suite transforms raw transactional data into actionable management intelligence, providing the final link in the administrative loop.

* **Cash Bill Listing:** This provides document-level detail. It is the primary interface for locating specific transactions via advanced filtering (Date, Branch, Status). 
* **Cashier Collection:** This module functions as a line-item method analysis. It displays every discrete payment received during a period. Users can utilize the "Drag and Group" UI feature to organize collections by Settlement Method.
* **Z Report:** The summary-level end-of-day instrument. It aggregates all session data, including Net Sales, rounding adjustments, void counts, and the User ID of the responsible agent.

{{< callout type="info" >}}
**Audit Intelligence: The Finance Cross-Check**
The "So What?" of the reporting framework lies in its utility for the Finance Department. By exporting the Z Report to PDF, administrators provide Finance with a static record to cross-check physical credit card slips and bank statements against the digital system of record.
{{< /callout >}}

{{< figure src="/images/pos-general-applet/pos-z-report-export.png" alt="Z Report PDF Export: The definitive audit document for finance reconciliation" caption="Z Report PDF Export: The definitive audit document for finance reconciliation" >}}

---

## Integration Points

### Core Module Dependencies
- **[Inventory Item Maintenance Applet](/applets/inv-item-maintenance-applet/)** - Product information
- **[Customer Maintenance Applet](/applets/customer-maintenance-applet/)** - Customer data
- **[Cashbook Applet](/applets/cashbook-applet/)** - Payment processing
- **[Tax Configuration Applet](/applets/tax-configuration-applet/)** - Sales tax calculations

---

## Related Applets

- **Cashier Operations Applet**
- **POS Inventory Applet**
- **Receipt Management Applet**
- **POS Reporting Applet**
