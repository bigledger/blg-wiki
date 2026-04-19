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

It is not a standalone process. Reconciliation quality depends on how well upstream applets are configured:

- **Cashbook Applet** creates the cashbook accounts used by finance operations.
- **Settlement Methods** are linked to specific cashbooks.
- **Receipt Voucher (Internal)** and **Payment Voucher (Internal)** post settlements through these methods.
- **POS General** cash and payment settlements also flow into linked cashbooks.
- **Bank Reconciliation** then compares all those ledger movements against imported bank statement lines.

{{< callout type="info" >}}
**Core Concept**: If a settlement method points to a cashbook, that transaction eventually shows up in Bank Reconciliation for that cashbook and period.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance Executives and Accountants:**
- Run period-by-period reconciliation with clear status and matching controls
- Investigate variances quickly using manual and auto matching tools
- Maintain traceable records for every reconcile/unreconcile decision

**Finance Managers and Controllers:**
- Verify cashbook integrity before close
- Monitor unresolved items across matched and unmatched sets
- Strengthen close governance with standardized process steps

**Auditors and Compliance Teams:**
- Review evidence-backed reconciliations with clear period boundaries
- Inspect adjustment logic and report outputs for financial assurance
- Confirm completeness of bank-to-ledger alignment

### What Problems Does This Solve?

**The common reconciliation problem:**

- Cashbook balances do not match bank balances at period close
- Missing links between settlements and bank entries
- Manual spreadsheet reconciliation is slow and difficult to audit
- Corrections are unclear and not consistently documented

**The applet solution:**

- **Structured recon session** by cashbook and date range
- **Statement import workflow** with bank/default format support
- **Manual matching controls** (reconcile and unreconcile)
- **Auto matching run** for high-volume acceleration
- **Report suite** to explain variances and unresolved items

## Key Features Overview

{{< cards >}}
  {{< card title="Recon Session Setup" subtitle="Cashbook + period + opening balances with guided hints" link="#quick-start-guide" >}}
  {{< card title="Statement Import" subtitle="Upload bank statements using bank or default formats" link="#key-menu-functions" >}}
  {{< card title="Manual Matching" subtitle="Reconcile and unreconcile with full line visibility" link="#matching-methods" >}}
  {{< card title="Auto Matching" subtitle="Run automation and review matched/unmatched results" link="#matching-methods" >}}
  {{< card title="Report Suite" subtitle="Report 1, Report 2, and Report 3 for reconciliation evidence" link="#reporting--audit" >}}
  {{< card title="Cross-Applet Integration" subtitle="Cashbook, vouchers, and POS settlement flow into recon" link="#how-bank-recon-connects-to-cashbook-vouchers-and-pos" >}}
{{< /cards >}}

{{< figure src="/screenshots/bank-recon/bank_recon_listing.png" alt="Bank Reconciliation listing screen showing reconciliation sessions and status summary" caption="Bank Reconciliation Overview: Central listing to manage recon sessions by cashbook and period." >}}

## Key Concepts

### How Bank Recon Connects to Cashbook, Vouchers, and POS

Bank reconciliation works best when upstream configuration is done in the right order:

1. **Cashbook is created** in the Cashbook applet.
2. **Settlement Methods are linked to that cashbook**.
3. Transactions are created in:
   - `internal-receipt-voucher-applet.md`
   - `internal-payment-voucher-applet.md`
   - `pos-general-applet.md`
4. Those settled transactions hit the linked cashbook.
5. Bank Reconciliation compares cashbook transactions against bank statement lines for the same period.

{{< callout type="tip" >}}
If settlement methods are mapped to the wrong cashbook, reconciliation variances will appear in the wrong account and period.
{{< /callout >}}

### Reconciliation Lifecycle

| Stage | What You Do | Why It Matters |
|---|---|---|
| **Setup** | Create recon session with cashbook, dates, opening balances | Defines reconciliation scope and controls |
| **Ingest** | Upload statement files (bank format/default helper) | Brings external bank data into the session |
| **Match** | Use manual reconcile/unreconcile and auto matching | Connects ledger lines to statement lines |
| **Review** | Analyze unmatched lines and adjustments | Explains variances before close |
| **Report** | Generate Report 1 / 2 / 3 | Provides audit-ready documentation |

{{< figure src="/screenshots/bank-recon/bank_recon_listing_with_cashbook_group_by.png" alt="Bank reconciliation listing grouped by cashbook for easier period review" caption="Cashbook Grouping: Analyze reconciliation sessions grouped by cashbook for operational clarity." >}}

### Core Data You Reconcile

| Source | Typical Content |
|---|---|
| **Cashbook Transactions** | Voucher settlements, POS settlements, cashbook transfers, adjustments |
| **Bank Statement Lines** | Imported bank debits/credits and descriptions |
| **Recon Header** | Cashbook, period, opening/closing balances, status |
| **Match Links** | Manual or auto links between internal and external lines |

## Key Menu Functions

The applet source defines these main menus:

- **Bank Reconciliation**
  - Create and run reconciliation sessions.
  - Access Details, Upload Statement, Manual Matching, Auto Matching, and Report.
- **Imported External Cashbook**
  - Manage imported external cashbook/GL lines that support reconciliation.
- **Settings**
  - Application Settings
  - Default Selection
- **Personalization**
  - Personal Default Selection

## Quick Start Guide

### Prerequisites (Do This First)

Before starting Bank Reconciliation:

1. Ensure your **cashbook exists** in `cashbook-applet.md`.
2. Ensure **settlement methods are linked to the correct cashbook**.
3. Verify receipt/payment voucher settlements and POS settlement flows use those methods.
4. Prepare your bank statement file for the same period.

{{< figure src="/screenshots/bank-recon/weightage_setup_in_cashbook.png" alt="Cashbook setup page showing weightage and reconciliation related settings" caption="Cashbook Prerequisite: Ensure the relevant cashbook and recon-related setup are correctly configured before recon starts." >}}

{{< figure src="/screenshots/bank-recon/automatching_weightage_configuration_in_cashbook_applet.png" alt="Cashbook applet automatching weightage configuration screen" caption="Automatching Weightage Setup: Configure weightage logic in Cashbook to improve auto-matching quality." >}}

### For Accountants: Run Your First Reconciliation

**Goal:** Complete one full reconciliation cycle for a cashbook period.

1. Open **Bank Reconciliation** and click create.
2. Fill required fields:
   - Cashbook
   - Opening Date
   - Closing Date
   - Cash Book Transaction Opening Balance
   - Cash Statement Opening Balance
3. Use suggested balance hints when available (previous/calculated closing values).
4. Save the session.
5. Go to **Upload Statement** and import bank statement lines.
6. Use **Manual Matching**:
   - Reconcile tab for linking lines
   - Unreconcile tab for corrections
   - Bank Statement Lines tab for investigation
7. Run **Auto Matching** for high-volume items and review results.
8. Open **Report** tab and generate Report 1 / 2 / 3.
9. Resolve unmatched items until acceptable variance is reached.

{{< figure src="/screenshots/bank-recon/details_tab.png" alt="Bank reconciliation details tab with required fields and balances" caption="Details Tab: Define cashbook, period, and opening balances before processing statements." >}}

{{< figure src="/screenshots/bank-recon/bank_statement_upload.png" alt="Upload statement screen in bank reconciliation applet" caption="Statement Upload: Import bank statement files for the selected reconciliation session." >}}

{{< figure src="/screenshots/bank-recon/upload_statement_cash_statement_tab.png" alt="Cash statement tab under upload statement with imported file listing" caption="Cash Statement Tab: Review uploaded statement records and source details." >}}

### For Controllers: Validate Before Close

1. Confirm period dates and opening balances are correct.
2. Review unmatched transaction lines after manual/auto matching.
3. Confirm major settlements from Receipt Voucher, Payment Voucher, and POS are represented.
4. Validate final reports and keep them for audit evidence.

## Matching Methods

### Manual Matching

Manual matching gives exact control:

- **Reconcile**: Match selected cashbook and statement lines.
- **Unreconcile**: Reverse an incorrect match safely.
- **Bank Statement Lines**: Inspect imported statement rows in detail.

Use manual matching for unusual references, partial matches, or exception handling.

{{< figure src="/screenshots/bank-recon/manual_matching_reconcile_tab.png" alt="Manual matching reconcile tab with transaction matching options" caption="Manual Matching - Reconcile: Match internal cashbook transactions with statement lines." >}}

{{< figure src="/screenshots/bank-recon/unreconcile_tab.png" alt="Unreconcile tab for reversing previous match links" caption="Manual Matching - Unreconcile: Undo incorrect matches while preserving auditability." >}}

{{< figure src="/screenshots/bank-recon/manual_match_bank_stmt_lines.png" alt="Bank statement lines tab used in manual matching" caption="Bank Statement Lines: Investigate imported rows and references during matching." >}}

{{< figure src="/screenshots/bank-recon/reconcile_clicking_detail.png" alt="Detail pop-up after selecting reconcile action" caption="Reconcile Detail: Drill into matching detail before confirming reconciliation." >}}

{{< figure src="/screenshots/bank-recon/pop_up_page_of_document.png" alt="Document pop-up page showing linked transaction context" caption="Document Pop-up: Inspect linked document context and references during review." >}}

{{< figure src="/screenshots/bank-recon/matching_reconcile_with_bank_stmt_lines_manually.png" alt="Manual reconciliation with selected bank statement lines and journal lines" caption="Manual Line Matching: Confirm selected journal and bank statement lines before reconciling." >}}

{{< figure src="/screenshots/bank-recon/umatch_adjustment_to_reocncile_transactiosn.png" alt="Unmatched adjustment screen for reconciling residual differences" caption="Unmatched Adjustment: Apply adjustments to resolve residual differences in reconciliation." >}}

{{< figure src="/screenshots/bank-recon/bank_stmt_line_detail_on_clicking.png" alt="Detailed statement line view opened from bank statement lines listing" caption="Statement Line Detail: Validate payor, references, and amounts for each line." >}}

{{< figure src="/screenshots/bank-recon/bank_stmt_line_matching_with_jrn_line.png" alt="Bank statement line matched to journal line detail" caption="Line-Level Match View: Confirm mapping between statement line and journal entry." >}}

{{< figure src="/screenshots/bank-recon/bank_stmT_line_with_adjistment.png" alt="Bank statement line with adjustment applied in matching workflow" caption="Statement Adjustment View: Review adjustment effects on matched statement lines." >}}

### Auto Matching

Auto matching accelerates high-volume reconciliation:

- Trigger **Run Auto Matching** from the Auto Matching page.
- System processes possible links and updates matched/unmatched sets.
- Processing status is tracked and refreshed in the app.
- Always review unmatched items afterward.

{{< figure src="/screenshots/bank-recon/auto_matching_processor_page.png" alt="Auto matching processor page with run action and processing status" caption="Auto Matching Processor: Run automatic matching and monitor processing status." >}}

## Reporting and Audit

The app provides three report views from the Report tab:

- **Report 1**: Core reconciliation summary and variance context.
- **Report 2**: Detailed schedule-style output for follow-up and evidence.
- **Report 3**: Additional reporting view for deeper analysis.

Use reports as your month-end reconciliation package for reviewers and auditors.

{{< figure src="/screenshots/bank-recon/report1_which_is_jrnl_with_bank_stmt_line.png" alt="Report 1 output showing journal lines matched with bank statement lines" caption="Report 1: Matched and reconciliation-linked journal and bank statement view." >}}

{{< figure src="/screenshots/bank-recon/report2_with_bank_stmt_lines_with_journal.png" alt="Report 2 output with statement lines and journal mapping details" caption="Report 2: Detailed schedule for reconciliation evidence and follow-up actions." >}}

{{< figure src="/screenshots/bank-recon/report3_overview_of_bank_recon.png" alt="Report 3 overview page for bank reconciliation summary" caption="Report 3: High-level overview of reconciliation outcomes and balances." >}}

## Settings and Personalization

### Application Settings

Application Settings control field visibility and behavior in recon pages (for example, branch visibility and delete controls). Configure based on your control policy.

{{< figure src="/screenshots/bank-recon/automatching_weightage_configuration_in_cashbook_applet.png" alt="Automatching configuration settings in cashbook applet related to reconciliation behavior" caption="Application Configuration: Adjust automatching behavior and weightage to align with your reconciliation policy." >}}

### Default Selection

Set defaults to reduce repeated data entry for frequent reconciliation users.

### Personal Default Selection

Personalization lets each user keep their preferred defaults without changing global behavior.

## Troubleshooting

**Cannot create a recon session**
- Check required fields and date logic.
- Ensure opening balances are filled.

**Transactions missing from recon**
- Confirm settlement methods are linked to the expected cashbook.
- Confirm upstream vouchers/POS were posted into the same period.

**No statement lines after upload**
- Check bank format selection or default statement helper usage.
- Validate source file structure.

**Variance remains after matching**
- Review unmatched lines in manual/auto matching.
- Recheck cross-applet settlement mapping and cashbook transfer/adjustment postings.

## Related Applets

- **[Cashbook Applet](/applets/master-data/cashbook-applet/)**: Cashbook account creation and setup
- **[Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/)**: Receipt settlement flows into cashbook
- **[Payment Voucher (Internal) Applet](/applets/finance/internal-payment-voucher-applet/)**: Payment settlement flows into cashbook
- **[POS General Applet](/applets/sales-workflow/pos-general-applet/)**: POS settlements mapped to cashbooks

## Summary

The Bank Reconciliation Applet is the financial control layer that verifies whether settlement-driven cashbook movements match external bank reality. When Cashbook and settlement mappings are configured correctly, reconciliation becomes faster, cleaner, and audit-ready across vouchers, POS, transfers, and adjustments.

## Video Walkthrough

Watch this walkthrough to see the Bank Reconciliation flow in action:

{{< youtube D0Pw7ytJ_JA >}}

{{< callout type="tip" >}}
If the embedded video is blocked by browser or network policy, open it directly on YouTube: [Bank Reconciliation Walkthrough](https://www.youtube.com/watch?v=D0Pw7ytJ_JA).
{{< /callout >}}

