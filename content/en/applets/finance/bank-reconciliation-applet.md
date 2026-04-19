---
title: "Bank Reconciliation Applet"
description: "Reconcile cashbook transactions with bank statements using structured periods, matching tools, and audit-ready reports."
tags:
- bank-reconciliation
- cashbook
- bank-statement
- matching
- automation
- reporting
- finance-controls
weight: 80
---

## Purpose and Overview


The **Bank Reconciliation Applet** is the month-end and period-end control center that validates whether your **cashbook-ledger transactions** match your **actual bank statement movements**.

{{< figure src="/screenshots/bank-recon/bank-recon-infographic.png" alt="Master Your Month-End: The BigLedger Bank Reconciliation Applet - infographic showing challenges of manual reconciliation, key features, and who benefits" caption="Master Your Month-End: The BigLedger Bank Reconciliation Applet — Infographic overview of manual reconciliation challenges, solution features, and key beneficiaries." >}}

It is not a standalone process. Reconciliation quality depends on how well upstream applets are configured:

- **[Cashbook Applet](/applets/master-data/cashbook-applet/)** creates the cashbook accounts used by finance operations.
- **Settlement methods** are linked to specific cashbooks.
- **[Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/)** and **[Payment Voucher (Internal) Applet](/applets/finance/internal-payment-voucher-applet/)** post settlements through those methods.
- **[POS General Applet](/applets/sales-workflow/pos-general-applet/)** cash and card settlements also flow into linked cashbooks.
- **Bank Reconciliation** then compares all those ledger movements against imported bank statement lines.

{{< callout type="info" >}}
**Core Concept**: If a settlement method points to a cashbook, that transaction eventually shows up in Bank Reconciliation for that cashbook and period.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance Executives and Accountants:**
- Run period-by-period reconciliation with clear status and matching controls
- Investigate variances quickly using manual and auto matching tools
- Maintain traceable records for every reconcile and unreconcile decision

**Finance Managers and Controllers:**
- Verify cashbook integrity before close
- Monitor unresolved items across matched and unmatched sets
- Strengthen close governance with standardized process steps

**Auditors and Compliance Teams:**
- Review evidence-backed reconciliations with clear period boundaries
- Inspect adjustment logic and report outputs for financial assurance
- Confirm completeness of bank-to-ledger alignment

### What Problems Does This Solve?

**The Manual Reconciliation Problem:**

Traditional bank reconciliation often relies on spreadsheets and ad hoc checks. Common issues include:

- Cashbook balances that do not match bank balances at period close
- Missing links between settlements and bank entries
- Slow, error-prone manual matching with weak audit trails
- Corrections that are hard to explain or reproduce

**The Bank Reconciliation Applet Solution:**

- **Structured recon session** by cashbook and date range
- **Statement import workflow** with bank format or default helper support
- **Manual matching controls** (reconcile and unreconcile)
- **Auto matching** for high-volume acceleration
- **Report suite** (Report 1, Report 2, Report 3) for variance explanation and audit evidence

## Key Features Overview

{{< cards >}}
  {{< card title="Recon Session Setup" subtitle="Cashbook, period, and opening balances with guided hints" link="#quick-start-guide" >}}
  {{< card title="Statement Import" subtitle="Upload bank statements and review cash statement lines" link="#sidebar-menu-reference" >}}
  {{< card title="Manual Matching" subtitle="Reconcile, unreconcile, and inspect statement lines" link="#manual-matching" >}}
  {{< card title="Auto Matching" subtitle="Run automation and monitor processing status" link="#auto-matching" >}}
  {{< card title="Reporting and Audit" subtitle="Report 1, 2, and 3 for close evidence" link="#reporting--audit" >}}
  {{< card title="Cross-Applet Flow" subtitle="Cashbook, vouchers, and POS into recon" link="#how-bank-recon-connects-to-cashbook-vouchers-and-pos" >}}
{{< /cards >}}

{{< figure src="/screenshots/bank-recon/bank_recon_listing.png" alt="Bank Reconciliation listing screen showing reconciliation sessions and status summary" caption="Bank Reconciliation Overview: Central listing to manage recon sessions by cashbook and period." >}}

## Key Concepts

### Understanding the Bank Reconciliation Framework {#understanding-the-bank-reconciliation-framework}

Every reconciliation process must align three perspectives. This applet keeps them explicit:

| Aspect | Component | Practical Example |
|--------|-----------|-------------------|
| **What** are you reconciling? | Cashbook (ledger) | Operating account at Bank ABC |
| **Against what**? | Bank statement lines | CSV import for the same month |
| **How** do you close the gap? | Manual match, auto match, adjustments, reports | Match RCT lines to statement rows, then run Report 3 |

{{< callout type="tip" >}}
**Real-World Example**: Your settlement method for card sales points to **Cashbook A**. POS settlements for the month post to **Cashbook A**. You import the bank CSV for **Cashbook A**, match lines, then use **Report 1** to show journal and statement alignment before sign-off.
{{< /callout >}}

### How Bank Recon Connects to Cashbook, Vouchers, and POS {#how-bank-recon-connects-to-cashbook-vouchers-and-pos}

Bank reconciliation works best when upstream configuration is done in the right order:

1. **Create the cashbook** in the [Cashbook Applet](/applets/master-data/cashbook-applet/).
2. **Link settlement methods** to that cashbook (and branch where required).
3. Process transactions that use those methods in:
   - [Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/)
   - [Payment Voucher (Internal) Applet](/applets/finance/internal-payment-voucher-applet/)
   - [POS General Applet](/applets/sales-workflow/pos-general-applet/)
4. Confirmed movements appear on the **cashbook transaction** side for the period.
5. **Bank Reconciliation** compares those lines to **imported bank statement** lines.

{{< callout type="tip" >}}
If settlement methods are mapped to the wrong cashbook, variances appear in the wrong account and period. Fix master data before spending time on matching.
{{< /callout >}}

### Reconciliation Lifecycle

| Stage | What You Do | Why It Matters |
|-------|---------------|----------------|
| **Setup** | Create recon session with cashbook, dates, opening balances | Defines reconciliation scope and controls |
| **Ingest** | Upload statement files (bank format or default helper) | Brings external bank data into the session |
| **Match** | Manual reconcile or unreconcile; run auto matching | Links ledger activity to bank lines |
| **Review** | Inspect unmatched lines and adjustments | Explains variances before close |
| **Report** | Generate Report 1, Report 2, or Report 3 | Produces audit-ready documentation |

{{< figure src="/screenshots/bank-recon/bank_recon_listing_with_cashbook_group_by.png" alt="Bank reconciliation listing grouped by cashbook for easier period review" caption="Cashbook Grouping: Review recon sessions grouped by cashbook for operational clarity." >}}

### Core Data You Reconcile

| Source | Typical Content |
|--------|-----------------|
| **Cashbook transactions** | Voucher settlements, POS settlements, cash transfers, adjustments |
| **Bank statement lines** | Imported debits, credits, descriptions, references |
| **Recon header** | Cashbook, period, opening and closing balances, status |
| **Match links** | Manual or automatic links between internal and bank-side lines |

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

{{< figure src="/screenshots/bank-recon/report3_overview_of_bank_recon.png" alt="Report 3 overview of bank reconciliation outcomes and balances" caption="At-a-Glance: Use reports together with matching to close the period with clear evidence." >}}

### For Admins: Prerequisite Setup

**Goal:** Ensure cashbooks and settlement paths are correct before users create recon sessions.

1. Complete **cashbook** setup in the [Cashbook Applet](/applets/master-data/cashbook-applet/) (including GL link where required).
2. Define **settlement methods** and map them to the correct **cashbook** and **branches** (see [POS General Applet](/applets/sales-workflow/pos-general-applet/) for retail settlement linking).
3. Confirm [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) and [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) settlement lines use those methods.
4. Optionally configure **automatching weightage** in Cashbook to improve auto-match quality.

{{< figure src="/screenshots/bank-recon/weightage_setup_in_cashbook.png" alt="Cashbook setup page showing weightage and reconciliation related settings" caption="Cashbook Prerequisite: Configure cashbook and weightage-related settings used by reconciliation." >}}
{{< figure src="/screenshots/bank-recon/automatching_weightage_configuration_in_cashbook_applet.png" alt="Cashbook applet automatching weightage configuration screen" caption="Automatching Weightage: Tune matching behavior from Cashbook configuration." >}}
{{< figure src="/screenshots/bank-recon/application-settings.png" alt="Bank Reconciliation Applet Application Settings screen" caption="Application Settings: Control field visibility (e.g., branch, delete button, cashbook balances) for the Bank Reconciliation applet. These settings help tailor the reconciliation interface to your internal control policies and user needs." >}}

---

### For Accountants: Run Your First Reconciliation

**Goal:** Complete one full reconciliation cycle for a cashbook period.

1. Open **Bank Reconciliation** from the sidebar and create a new session.
2. On **Details**, set **Cashbook**, **Opening Date**, **Closing Date**, **Cash Book Transaction Opening Balance**, and **Cash Statement Opening Balance** (use suggested hints where shown).
3. Save the session.
4. Open **Upload Statement** and import your bank file; review the **Cash Statement** tab listing.
5. Open **Manual Matching**:
   - **Reconcile** tab to link cashbook and statement lines
   - **Unreconcile** tab to reverse incorrect matches
   - **Bank Statement Lines** tab to investigate outliers
6. Open **Auto Matching**, run the processor, and wait for status to refresh; review unmatched sets.
7. Open **Report**, generate **Report 1**, **Report 2**, and **Report 3** as needed for sign-off.

{{< figure src="/screenshots/bank-recon/details_tab.png" alt="Bank reconciliation details tab with required fields and balances" caption="Details Tab: Define cashbook, period, and balances before statement work." >}}
{{< figure src="/screenshots/bank-recon/bank_statement_upload.png" alt="Upload statement screen in bank reconciliation applet" caption="Statement Upload: Import bank statement files for the active session." >}}
{{< figure src="/screenshots/bank-recon/upload_statement_cash_statement_tab.png" alt="Cash statement tab under upload statement with imported file listing" caption="Cash Statement Tab: Review uploaded files and parsed statement context." >}}

---

### For Controllers: Validate Before Close

**Goal:** Confirm the recon is defensible for period close.

1. Verify **dates** and **opening balances** match the prior period close and bank records.
2. After matching, review **unmatched** cashbook and statement lines.
3. Confirm material **Receipt Voucher**, **Payment Voucher**, and **POS** settlements appear on the expected cashbook for the period.
4. Retain **Report 1 / 2 / 3** outputs with the recon session for audit file.

{{< figure src="/screenshots/bank-recon/report1_which_is_jrnl_with_bank_stmt_line.png" alt="Report 1 output showing journal lines matched with bank statement lines" caption="Report 1: Evidence of journal and bank statement alignment." >}}

---

{{< callout type="tip" >}}
**New to bank recon?** Start in this order: **Prerequisite Setup** (cashbook and settlements) → **Details** session → **Upload Statement** → **Manual Matching** → **Auto Matching** → **Report**.
{{< /callout >}}

---

## Sidebar Menu Reference

| Menu Item | Description |
| :--- | :--- |
| **Bank Reconciliation** | Listing, create, and edit recon sessions. Tabs include **Details**, **Upload Statement**, **Manual Matching**, **Auto Matching**, and **Report**. |
| **Imported External Cashbook** | Manage imported external cashbook or GL movements that support reconciliation. |
| **Settings** | **Application Settings** and **Default Selection** for applet behavior and field visibility. |
| **Personalization** | **Personal Default Selection** for user-specific defaults. |

---

## Manual Matching {#manual-matching}

Manual matching gives exact control when references are non-standard or amounts need judgment.

- **Reconcile**: Link selected cashbook transactions to bank statement lines.
- **Unreconcile**: Reverse a prior match safely when you identify an error.
- **Bank Statement Lines**: Inspect every imported line (date, description, references, amounts).

Use manual matching for partial matches, one-to-many relationships, and investigation before you rely on automation.

{{< figure src="/screenshots/bank-recon/manual_matching_reconcile_tab.png" alt="Manual matching reconcile tab with transaction matching options" caption="Manual Matching - Reconcile: Select internal and bank lines to match." >}}
{{< figure src="/screenshots/bank-recon/unreconcile_tab.png" alt="Unreconcile tab for reversing previous match links" caption="Manual Matching - Unreconcile: Undo incorrect matches while preserving history." >}}
{{< figure src="/screenshots/bank-recon/manual_match_bank_stmt_lines.png" alt="Bank statement lines tab used in manual matching" caption="Bank Statement Lines: Browse and filter imported statement rows." >}}
{{< figure src="/screenshots/bank-recon/reconcile_clicking_detail.png" alt="Detail view after selecting reconcile action" caption="Reconcile Detail: Review match context before confirming." >}}
{{< figure src="/screenshots/bank-recon/pop_up_page_of_document.png" alt="Document pop-up page showing linked transaction context" caption="Document Pop-up: Open linked document context from a line." >}}
{{< figure src="/screenshots/bank-recon/matching_reconcile_with_bank_stmt_lines_manually.png" alt="Manual reconciliation with selected bank statement lines and journal lines" caption="Manual Line Selection: Align journal and bank statement lines explicitly." >}}
{{< figure src="/screenshots/bank-recon/umatch_adjustment_to_reocncile_transactiosn.png" alt="Unmatched adjustment screen for reconciling residual differences" caption="Unmatched Adjustment: Handle residual differences with controlled adjustments." >}}
{{< figure src="/screenshots/bank-recon/bank_stmt_line_detail_on_clicking.png" alt="Detailed statement line view opened from bank statement lines listing" caption="Statement Line Detail: Validate payor, references, and amounts." >}}
{{< figure src="/screenshots/bank-recon/bank_stmt_line_matching_with_jrn_line.png" alt="Bank statement line matched to journal line detail" caption="Line-Level Match: Confirm statement line to journal mapping." >}}
{{< figure src="/screenshots/bank-recon/bank_stmT_line_with_adjistment.png" alt="Bank statement line with adjustment applied in matching workflow" caption="Statement Line with Adjustment: Review adjustment impact on the line." >}}

---

## Auto Matching {#auto-matching}

Auto matching accelerates high-volume periods:

- Run the **Auto Matching** processor from the **Auto Matching** tab.
- The system updates **matched** and **unmatched** sets based on rules and configured weightage.
- **Processing** status is polled; wait for completion before you sign off.
- Always perform a **manual review** of unmatched lines after a run.

{{< figure src="/screenshots/bank-recon/auto_matching_processor_page.png" alt="Auto matching processor page with run action and processing status" caption="Auto Matching Processor: Execute automation and monitor processing status." >}}

---

## Reporting & Audit {#reporting--audit}

The **Report** tab hosts three report views:

- **Report 1**: Journal-oriented view with bank statement line alignment.
- **Report 2**: Detailed schedule-style output for follow-up and evidence.
- **Report 3**: High-level overview of reconciliation outcomes and balances.

Use these together as your **month-end reconciliation pack** for reviewers and auditors.

{{< figure src="/screenshots/bank-recon/report2_with_bank_stmt_lines_with_journal.png" alt="Report 2 output with statement lines and journal mapping details" caption="Report 2: Detailed schedule for reconciliation evidence and follow-up." >}}

---

## Configuration & Settings

**Application Settings** control field visibility and behavior on recon screens (for example branch visibility and delete controls). Align these with your internal control policy.

**Default Selection** reduces repeated entry for users who perform reconciliation frequently.

For automatching weightage, configure the related options in the **Cashbook** applet (see **Prerequisite Setup** screenshots above).

---

## Personalization

Use **Personalization → Default Selection** so each user can keep preferred defaults without changing tenant-wide configuration.

---

## Audit

Bank reconciliation is audit-sensitive:

- **Reconcile** and **Unreconcile** actions should be restricted by role.
- Keep the final **Report 1**, **Report 2**, and **Report 3** outputs with the recon session and bank file archive.
- Document **adjustment** reasons when you use unmatched adjustment workflows.

---

## FAQ

**Q: Why do my cashbook lines not match the bank file?**

A: Check that **settlement methods** point to the correct **cashbook**, that **dates** fall inside the recon period, and that upstream **Receipt Voucher**, **Payment Voucher**, and **POS** documents are posted.

**Q: Auto matching ran but many lines remain unmatched.**

A: Review **weightage** configuration in Cashbook, verify **bank import format**, then use **Manual Matching** for exceptions.

**Q: Where do I start if I am new to the applet?**

A: Follow **Quick Start Guide** in order: prerequisites, session **Details**, **Upload Statement**, matching, then **Report**.

---

## Related Applets

- **[Cashbook Applet](/applets/master-data/cashbook-applet/)**: Cashbook accounts and automatching weightage
- **[Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/)**: Receipt settlement into cashbook
- **[Payment Voucher (Internal) Applet](/applets/finance/internal-payment-voucher-applet/)**: Payment settlement into cashbook
- **[POS General Applet](/applets/sales-workflow/pos-general-applet/)**: POS settlement methods and branch mapping

---

## Summary

The Bank Reconciliation Applet is the control layer that proves **settlement-driven cashbook activity** matches **bank reality** for a defined period. When cashbooks and settlement mappings are correct, reconciliation is faster, clearer, and easier to defend in audit.

## Video Walkthrough

Watch this video to see the Bank Reconciliation flow in action:

{{< youtube D0Pw7ytJ_JA >}}

{{< callout type="tip" >}}
If video playback is blocked by browser or network policy, open directly: [Bank Reconciliation Walkthrough](https://www.youtube.com/watch?v=D0Pw7ytJ_JA).
{{< /callout >}}

### What the Video Demonstrates

Based on the walkthrough, the video typically covers:

- **Creating a recon session** and entering opening balances on **Details**
- **Uploading a bank statement** and reviewing the **Cash Statement** tab
- **Manual matching** using Reconcile, Unreconcile, and Bank Statement Lines
- **Running auto matching** and interpreting processing status
- **Generating reports** (Report 1, Report 2, Report 3) for close evidence

{{< callout type="warning" >}}
Always reconcile **unmatched** and **adjustment** items to a clear resolution before you treat the period as closed. Unexplained variance should not roll forward silently.
{{< /callout >}}
