---
title: "Asset Module Applet"
description: "A comprehensive system for managing the full lifecycle of all university assets, from purchase to disposal."
tags:
- asset-management
- fixed-asset-register
- asset-tracking
- depreciation
- maintenance
weight: 160
---

## Purpose and Overview

Effective asset management is the cornerstone of financial accountability and operational efficiency. The Asset Module Applet provides a robust, centralized platform to manage the entire lifecycle of every university asset, from acquisition to disposal. By leveraging a "single-point data entry" approach, it ensures data integrity, eliminates redundancies, and provides a real-time, accurate view of the university's asset landscape.

{{< callout type="info" >}}
**From Enhancement to Excellence**: This module enhances the existing Fixed Asset Register, transforming it into a dynamic, full-featured lifecycle management tool.
{{< /callout >}}

### Who Benefits from This Applet?

**Asset Managers & Finance Officers:**
- Maintain a complete and accurate Fixed Asset Register.
- Automate depreciation calculations and financial reporting.
- Ensure compliance with audit and regulatory requirements.
- Gain full visibility into asset value, location, and status.

**Department Heads & Custodians:**
- Easily track assets assigned to their department or person.
- Manage asset transfers and loans efficiently.
- Access maintenance history to inform replacement decisions.
- Fulfill their stewardship responsibilities with clarity.

**IT & Maintenance Teams:**
- Schedule and log all maintenance activities.
- Use QR codes to quickly identify assets and access their records.
- Track asset loan and availability to manage resources effectively.

**Inspection & Audit Officers:**
- Generate precise asset lists by location for physical verification.
- Record inspection results directly in the system.
- Easily identify and report discrepancies or lost assets.

### What Problems Does This Solve?

**The "Ghost Asset" Problem:**
Assets are purchased but never properly registered, leading to inaccurate financial statements and an inability to track valuable equipment.
- **Solution:** The applet enforces registration right from the point of **Asset Receipt**, ensuring nothing gets missed.

**The Manual Tracking Nightmare:**
Tracking assets with spreadsheets is time-consuming, error-prone, and provides no real-time visibility. Transfers, loans, and disposals become a paperwork bottleneck.
- **Solution:** The applet provides a **single source of truth** with automated workflows for transfers, loans, and disposals, complete with email notifications.

**The Compliance & Audit Scramble:**
Preparing for an audit is a frantic exercise of hunting down records, verifying locations, and manually calculating depreciation.
- **Solution:** The system provides an **instant audit trail** for every asset, with automated depreciation and easy-to-generate reports for inspection and verification.

**The Black Hole of Maintenance:**
Maintenance records are scattered, making it impossible to know an asset's true cost of ownership or to make data-driven decisions about repair versus replacement.
- **Solution:** The **Asset Maintenance** feature centralizes all service history, providing a complete picture of an asset's health and costs over its lifetime.

## Key Features Overview

{{< cards >}}
  {{< card title="Asset Receipt & Registration" subtitle="Capture new assets at the point of entry" >}}
  {{< card title="QR Code Generation & Tracking" subtitle="Tag and identify assets with unique QR codes" >}}
  {{< card title="Asset Lifecycle Management" subtitle="Manage transfers, loans, and disposals" >}}
  {{< card title="Maintenance & Service History" subtitle="Log all repairs, upgrades, and inspections" >}}
  {{< card title="Automated Depreciation" subtitle="Calculate and post monthly/annual depreciation" >}}
  {{< card title="Asset Inspection & Verification" subtitle="Conduct physical audits with location-based lists" >}}
  {{< card title="Loss Reporting & Tracking" subtitle="Manage cases of lost or stolen assets" >}}
  {{< card title="Responsibility Center Store (PTJ)" subtitle="Mini-stock control for departmental inventory" >}}
{{< /cards >}}

## Key Concepts

### The Asset Lifecycle: From Cradle to Grave

The Asset Module is built around managing every stage of an asset's life within the university. Understanding this lifecycle is key to using the applet effectively.

```
[Acquisition] -> [Registration] -> [Deployment & Use] -> [Maintenance] -> [Revaluation] -> [Disposal]
     |                |                  |                   |                |              |
Asset Receipt     QR Code Gen.      Transfers & Loans     Service Logs     Depreciation     Write-off
```

**Lifecycle Stages & Corresponding Features:**

1.  **Acquisition (Asset Receipt):** The lifecycle begins when a new asset is received. This is the first and most critical data entry point.
2.  **Registration (Asset Registration):** The asset is formally entered into the register, assigned a unique identity (including a QR code), and its core details are recorded.
3.  **Deployment & Use (Update, Transfer, Loan):** The asset is put into service. Its location, custodian, and temporary usage are tracked.
4.  **Maintenance (Asset Maintenance):** All activities related to the upkeep and repair of the asset are logged, preserving its value and history.
5.  **Revaluation (Depreciation):** The asset's value is systematically reduced over its useful life according to configured rates.
6.  **Disposal (Disposal of Assets):** The asset is formally removed from the books due to sale, loss, or end-of-life.

This structured approach ensures that every financial and physical event related to an asset is captured, creating a complete and auditable history.

## Core Features in Detail

![Asset Dashboard](/placeholders/asset-dashboard.png)


### 1. Asset Receipt

The foundation of the asset lifecycle. This is where new assets are first recorded in the system, ensuring that no purchase goes untracked.

- **Full or Staged Receipt:** Record the arrival of assets, whether they come in a single delivery or in multiple parts over time.
- **Link to Procurement:** Integrates with purchasing modules to pull in details like PO number, supplier, and cost, minimizing data entry.
- **Initiates Registration Workflow:** Upon receipt, the system flags the item as "Pending Registration," ensuring the next step is not missed.

### 2. Asset Registration

This is the formal process of commissioning an asset into the university's official register.

- **Unique QR Code Generation:** The system automatically generates a unique QR code for each registered asset. When scanned with a mobile device, it displays key information like Asset ID, description, and current custodian.
- **New and Old Asset Registration:** Designed to register newly received assets as well as to bring old, previously untracked assets into the system for a complete inventory.
- **Data Capture:** Comprehensive data fields for asset description, category, cost, purchase date, warranty information, and more.

### 3. Update Asset Records

Assets are not static. This feature allows for the ongoing management of asset information.

- **Change of Location/Custodian:** Easily update records when an asset is moved to a new room or assigned to a different person.
- **Reprint QR Code:** If an asset's QR code label is damaged or lost, a new one can be reprinted directly from this screen.
- **Audit Trail:** Every change is logged, showing who made the change, what was changed, and when.

### 4. Asset Transfer

Manages the formal handover of asset responsibility from one department or custodian to another.

- **Automated Notifications:** When a transfer is initiated, the system automatically sends email notifications to the sending party, the receiving party, and any other relevant stakeholders.
- **Approval Workflow:** Can be configured to require approval from department heads before a transfer is finalized.
- **Prevents Unauthorized Moves:** Ensures that all asset movements are documented and authorized.

### 5. Asset Loan

Tracks the temporary lending of assets to staff or students.

- **Availability Check:** The system verifies if an asset is available for loan, preventing conflicts.
- **Mobile Integration:** Users can apply for loans through a mobile app, and custodians can approve them on the go.
- **Due Date Tracking:** Automatically tracks the expected return date and can send reminders for overdue items.

### 6. Asset Maintenance

A complete service history for every asset.

- **Log Maintenance & Upgrades:** Record all maintenance events, from simple repairs to major upgrades.
- **View Past History:** Before authorizing a new repair, view the asset's complete maintenance history to make informed decisions.
- **Track Costs:** Associate costs with each maintenance event to understand the total cost of ownership.

### 7. Disposal of Assets

The final stage of the asset lifecycle.

- **Full or Partial Disposal:** Process the disposal of an entire asset or just a single component of a larger asset.
- **Built-in Controls:** The system prevents the disposal of an asset that is currently on loan, reported as lost, or has other outstanding issues.
- **Compliance:** Ensures that all disposals are properly documented and authorized according to university policy.

### 8. Asset Inspection

Facilitates physical verification and audits.

- **Generate Inspection Lists:** Create a list of assets based on their registered location (e.g., "all assets in Room 101").
- **Record Verification Status:** Inspection officers can mark each asset as "Verified," "Not Found," or "Requires Attention."
- **Mobile-Friendly:** Designed to be used on a tablet or mobile device, allowing officers to perform inspections in the field.

### 9. Loss of Assets

A dedicated function for managing lost or stolen assets.

- **Report a Loss:** Immediately flag an asset as lost, which removes it from available lists for loan or transfer.
- **Track Case Status:** Document all actions taken, such as filing a police report, internal investigations, and the final outcome (e.g., write-off or surcharge).

### 10. Depreciation

Automates the complex process of asset depreciation.

- **Automatic Calculations:** The system automatically calculates and posts monthly and annual depreciation based on the configured rates.
- **Manual Override:** Authorized financial staff can make manual depreciation adjustments if necessary.
- **Reporting:** Generate depreciation schedules and reports for financial statements.

### 11. Configuration of Depreciation Rate

Gives financial staff control over depreciation policies.

- **Admin-Only Screen:** A secure screen where authorized users can set up and manage the depreciation rates and methods used by the university.
- **Flexible Methods:** Supports various depreciation methods (e.g., straight-line, declining balance).

### 12. Responsibility Center Store (PTJ)

A decentralized inventory management system for departments.

- **Mini-Stock Control:** Allows individual departments or faculties (PTJs) to manage their own local stores of consumables or minor equipment.
- **Track Receipt, Usage, and Balance:** The PTJ can record the receipt of items into their store, track usage by staff, and always have a real-time stock balance.
- **Reduces Central Burden:** Empowers departments to manage their own low-value, high-volume inventory, freeing up the central asset team to focus on major assets.