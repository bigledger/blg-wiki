---
title: "Daily Cashier Report Applet"
description: "Streamline end-of-day reconciliation and monitor specific payment collections for retail and frontline operations."
weight: 60
tags:
- sales
- cashier
- collection
- z-report
- reconciliation
---

> [!WARNING]
> **Work in Progress:** This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.

## Purpose and Overview

The **Daily Cashier Report Applet** is a specialized financial control tracking workspace designed for retail environments or any operation with a high volume of over-the-counter transactions. 

It provides real-time visibility into the funds collected by individual cashiers, categorizes those collections by payment method (cash, credit card, e-wallet), and serves as the definitive tool for generating end-of-day closure ("Z Report") summaries.

### Who Benefits from This Applet?

| Role | How they use it |
|------|-----------------|
| **Cashiers** | Verify their daily collected totals against physical cash drawer contents before confirming their shift closure. |
| **Store Managers** | Review the Z Reports to authorize shift closures, identify discrepancies, and monitor daily revenue performance. |
| **Finance/Accountants** | Audit cash flow, reconcile bank deposits with system-recorded collections, and analyze incoming funds by settlement type. |
| **System Administrators** | Define which fields are mandatory for collection reporting and set default branch operations. |

---

## What Problems Does This Solve?

**Without This Applet:**
- Reconciling physical cash and card machine receipts at the end of a shift is a manual, paper-based process.
- Store managers struggle to identify which payment methods (e.g., Cash vs. Visa vs. GrabPay) account for daily totals.
- Financial discrepancies (shortages or overages in the till) are discovered days later by standard accounting, rather than immediately at shift close.
- Head office lacks real-time visibility into individual location/cashier performance.

**With Daily Cashier Report Applet:**
- You get an automated, **centralized reconciliation** view combining all point-of-sale transactions.
- You can generate a definitive **Z Report**, providing a locked-in daily summary.
- You can instantly pivot data to view **Cashier Collections By Settlement Type**, ensuring accurate bank reconciliation.
- Shortages or overages are spotted immediately during the shift hand-over workflow.

---

## Role-Based Quick Start Guides

### For Cashiers: Reviewing Daily Collections
Your goal is to verify that the system's expected collection matches what you have physically received before logging off.

1. Open **Cashier Collection** from the sidebar.
2. Filter the date range to your current shift if it isn't automatically selected.
3. Review the grid to see every single collection record processed under your user ID.
4. If you need to see exactly how much cash versus how much credit card payment you took, switch to the **Cashier Collections By Settlement Type** workspace.

### For Store Managers: Generating End-of-Day Z Reports
Your goal is to close out the daily register, locking the day's financials to prevent retroactive alterations.

1. Open **Z Report** from the sidebar at the end of the trading day.
2. Verify the total expected collections across all active cashiers for your branch.
3. Compare the system totals with the physical cash drawer counts reported by the cashiers.
4. Execute the Z Report generation (action available based on workflow configuration), establishing the official End-of-Day record.
5. Export the resulting Z Report grid to PDF or Excel for your daily management file.

### For Accountants: Reconciling Bank Deposits
Your goal is to match bank statements against the system's recorded payment types.

1. Navigate to **Cashier Collections By Settlement Type**.
2. Filter the listing by specific payment gateways (e.g., mastercard, e-wallets) and date range.
3. Sum the system totals and compare them against the batch settlement amounts shown on your bank portal.

---

## Deep-Dive: The Report Workspaces

### 1. Cashier Collection Workspace
This is the transactional ledger view. It lists every individual collection event recorded by the system.
- **Use Case**: Investigating a specific customer dispute regarding a payment made earlier in the day. The grid provides exact timestamps and cashier IDs.

### 2. Z Report Workspace
This is the consolidated closure view. A "Z-Reading" or Z Report is a standard retail term for the final register summary that resets the daily totals to zero for the next shift.
- **Use Case**: This report is used fundamentally for loss prevention and official daily revenue declaration.

### 3. Cashier Collections By Settlement Type
This is the analytical pivot view. Instead of listing by transaction chronologically, it groups incoming funds by the method of payment.
- **Use Case**: Crucial for operational finance to determine cash-handling needs versus electronic deposit clearances and to calculate gateway merchant fees accurately.

---

## Applet Configuration (For Admins)

Navigate to **Settings** in the sidebar to configure the applet's behavior.

### Application Settings (Field Settings)
Control the visibility and mandatory status of fields across the reporting grids. You can configure which columns detail level is strictly necessary for your back-office team, removing visual noise from the cashier's view.

### Default Selection
Set applet-wide defaults, ensuring that users in specific retail branches automatically see data filtered for their location, minimizing the risk of managers accidentally reviewing another branch's collections.

---

## Common Real-World Scenarios

### Scenario 1: Handling a Shift Handover Discrepancy
**The Situation:** A cashier's physical drawer has $50 less than what the point-of-sale terminal reported.
**The Workflow:** The Store Manager opens the **Cashier Collection** report, filtering specifically by that cashier's ID and the "Cash" settlement type. They review the timeline of transactions side-by-side with physical receipts to pinpoint instances where incorrect change might have been given or a transaction was voided improperly.

### Scenario 2: Transitioning to Heavy E-Wallet Usage
**The Situation:** Finance notices a surge in different e-wallet payment types and needs to reconcile them daily due to varying settlement timelines from the merchant gateway.
**The Workflow:** The Accountant relies on the **Cashier Collections By Settlement Type** report, filtering specifically for "GrabPay", "TouchNGo", etc., allowing them to match the exact daily expected deposit to the bank statement effectively bypassing the noise of standard cash transactions.

---

## FAQs

**Q: Can a cashier see the collections of another cashier?**  
A: By default, visibility depends on permissions. However, the applet includes personalized default selections to ensure cashiers generally see their own data, while Managers use the same screens (with broader permissions) to see aggregate branch data.

**Q: Is the Z Report automatically generated at midnight?**  
A: The Z Report in this applet acts as a summary view and generation workspace. While data aggregates in real-time, forming the "official" daily closure usually requires a managerial action to confirm the physical verification.

**Q: Can I export the day's collections to send to my external accountant?**  
A: Yes, all main workspaces (**Cashier Collection**, **Z Report**, and **Settlement Type**) feature bulk export tools allowing you to download the current grid as `.xls` or `.pdf`.
