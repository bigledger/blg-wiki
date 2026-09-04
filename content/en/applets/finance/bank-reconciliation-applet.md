---
title: "Bank Reconciliation"
description: "Match a cashbook's FINAL transaction lines against imported bank statement lines for a period — by hand or with the weighted auto-matcher — and produce Report 1, 2 and 3 as the close evidence."
applet_code: "bankReconApplet"
applet_repo: "blg-applet-wavelet-bank-recon-applet"
modules: [financial-accounting]
related_applets:
  - cashbook-applet
  - internal-receipt-voucher-applet
  - internal-payment-voucher-applet
  - pos-general-applet
  - ledger-and-journal-applet
  - organisation-applet
guides:
  - /guides/accounting-guides/bank-reconciliation-guide/
sources:
  configuration:
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/app.routing.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-listing/bank-recon-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-create/bank-recon-create.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/bank-recon-edit.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/bank-recon-edit.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/cashbook-txn-lines/cashbook-txn-lines.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/manual-matching-listing/manual-matching-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/report-version-3/report-version-3.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/resolver/permission.resolver.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/edit-weightage-config/edit-weightage-config.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/edit-weightage-config/edit-weightage-config.component.html
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/bankRecon/BankReconciliationController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/financialConfig/CashbookReconConfigController.java
  fields:
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-create/bank-recon-create.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-create/bank-recon-create.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-create/cashbook-listing/cashbook-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/bank-recon-edit.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/bank-recon-edit.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/upload-statement-edit/upload-statement-edit.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/upload-statement-edit/upload-statement-edit.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/upload-statement-listing/upload-statement-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/upload-default-statement/upload-default-statement-edit/upload-default-statement-edit.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/upload-default-statement/upload-default-statement-edit/helper-checking-listing/helper-checking-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/bank-statement-edit/bank-statement-edit.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/bank-statement-edit/bank-statement-edit.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/cash-statment-lines/cash-statment-lines.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/glt-payment-matching-listing/glt-payment-matching-listing.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/bt-payment-matching-listing/bt-payment-matching-listing.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/auto-matching-listing/auto-matching-listing.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/report/report.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/external-gl-container/external-gl-create/external-gl-create.component.html
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/external-gl-container/external-gl-edit/external-gl-edit.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/models/bank-recon-constants.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/bank-statement-services/bank-statement-upload.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/bankRecon/BankStatementController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/bankRecon/DefaultBankStatementController.java
    - blg-akaun-platform-java/javasdk/src/main/resources/masterDataTemplates/MasterData_Upload_DefaultBankStatement.csv
  lifecycle:
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/auto-matching-listing/auto-matching-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/auto-glt-payment-matching-listing/auto-glt-bank-transaction-listing/auto-glt-bank-transaction-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/manual-matching-listing/manual-matching-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/glt-payment-matching-listing/bank-transaction-adj-edit/bank-transaction-adj-edit.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/new-report-version-one/new-report-version-one.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/report-version-2/report-version-2.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/report-version-3/report-version-3.component.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/bankrecon-services/cashbook-txn-stmt-recon-possible-links.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/BankReconAutoMatchingProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/bankRecon/CashbookTxnLineController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/BankReconciliationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnStmtReconPossibleLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnBankStmtLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/bankRecon/CashbookTxnBankStmtLinkUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/CashbookTxnBankStmtLinkDataConsistencyObjects/CashbookTxnBankStmtLinkDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnLinePostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnLineBankReconGuard.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/CashDocumentErrorCodesConstants.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnBankStmtLinkUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/CashDocumentErrorCodesConstants.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/bankRecon/BankStatementController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnStmtReconPossibleLinkService.java
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-create/bank-recon-create.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/bank-statement-container/bank-recon-edit/auto-matching-listing/auto-matching-listing.component.ts
    - blg-applet-wavelet-bank-recon-applet/micro-fe/projects/wavelet-erp/applets/bank-recon-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - gh:bigledger/blg-applet-wavelet-bank-recon-applet#6
    - gh:bigledger/blg-applet-wavelet-bank-recon-applet#9
    - gh:bigledger/blg-applet-wavelet-bank-recon-applet#14
    - gh:bigledger/blg-applet-wavelet-bank-recon-applet#36
    - gh:bigledger/blg-applet-wavelet-bank-recon-applet#44
    - gh:bigledger/blg-applet-wavelet-bank-recon-applet#53
    - gh:bigledger/blg-applet-wavelet-bank-recon-applet#55
    - gh:bigledger/blg-applet-wavelet-bank-recon-applet#57
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

## Overview

The **Bank Reconciliation** applet proves that a cashbook in BigLedger agrees with the bank. You open one *reconciliation session* per cashbook and period, import the bank's statement for that period, and link each bank statement line to the cashbook transaction line (or lines) it settles — either by hand on the Manual Matching tab or by running the weighted auto-matcher. Three reports then show the closing positions, the matched and unmatched balances on each side, and the variance.

The applet does not post to the General Ledger. It reads cashbook transaction lines that were created when Receipt Vouchers, Payment Vouchers, POS settlements and cash transfers reached FINAL, and it writes *reconciliation links* that reduce the open amount on both the cashbook line and the bank statement line.

{{< figure src="/screenshots/bank-recon/infograhic.png" alt="Master Your Month-End: The BigLedger Bank Reconciliation Applet - infographic showing challenges of manual reconciliation, key features, and who benefits" caption="Master Your Month-End: The BigLedger Bank Reconciliation Applet — Infographic overview of manual reconciliation challenges, solution features, and key beneficiaries." >}}

## Where it fits

| Direction | Applet / document | Why it matters here |
|---|---|---|
| Upstream | [Cashbook](/applets/master-data/cashbook-applet/) | Defines the cashbook being reconciled, its bank account number, its members, and the **Weightage Configuration** the auto-matcher uses |
| Upstream | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | Their FINAL settlement lines (`STL_MTHD`) become cashbook transaction lines on the cashbook their settlement method points to |
| Upstream | [POS General](/applets/sales-workflow/pos-general-applet/) | Cash, card and e-wallet settlements post the same way, through the settlement method's cashbook |
| Upstream | Cash Transfer (cash document, FINAL) | FINAL cash transfers also post cashbook transaction lines |
| Alongside | [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) | Manual journals against the bank GL code do **not** create cashbook transaction lines; bank charges and interest must be entered as vouchers or cash transfers to become reconcilable |
| Downstream | Report 1 / 2 / 3 (inside this applet) | The audit pack for the period |

{{< callout type="info" >}}
**Core concept.** A transaction reaches this applet only if its settlement method (or cash transfer) points at a cashbook, and only once the document is FINAL. If a line is missing on the Reconcile tab, check the settlement method mapping and the document's posting status before you look anywhere else.
{{< /callout >}}

## Screens and menus

| Menu item | What it holds |
|---|---|
| **Bank Reconciliation** | Listing of reconciliation sessions; create and edit. The edit screen has five tabs: **Details**, **Upload Statement**, **Manual Matching**, **Auto Matching**, **Report** (tab order is configurable — see Default Selection) |
| **Imported External Cashbook** | Upload a CSV of external cashbook movements and generate cashbook transaction lines from it — for cashbooks whose transactions are not produced by BigLedger documents |
| **Settings** → **Application Settings** | The applet's own hide/show switches (a local form, not the shared field-configuration screen) |
| **Settings** → **Default Selection** | Default branch and location; drag-and-drop ordering of the five edit tabs |
| **Personalization** → **Default Selection** | Per-user default branch and location |

The Settings menu also carries the standard permission screens (Client Side Permission, Permission Wizard, Permission Set, User Permission, Role Permission), Webhook and Release Notes.

### Listing

Columns: Company, Branch, Cashbook, Name, Opening Date, Closing Date, Cash Book Txn Open Bal., Cash Book Txn Close Bal., Cash Statement Opening Bal., Cash Statement Closing Bal., **Processing Auto Matching**, Status, Created/Updated Date and By. The listing can be grouped by cashbook.

{{< figure src="/screenshots/bank-recon/bank_recon_listing.png" alt="Bank Reconciliation listing screen showing reconciliation sessions and status summary" caption="Bank Reconciliation listing: one row per cashbook and period." >}}
{{< figure src="/screenshots/bank-recon/bank_recon_listing_with_cashbook_group_by.png" alt="Bank reconciliation listing grouped by cashbook for easier period review" caption="Listing grouped by cashbook." >}}

### Details tab

Company, Branch, Cashbook, Name, Opening Date, Closing Date, the two cashbook balances (read-only, calculated) and the two bank statement balances (entered). Status is **ACTIVE** or **CLOSE**. A **Refresh calculated balance** button recomputes the cashbook side.

{{< figure src="/screenshots/bank-recon/details_tab.png" alt="Bank reconciliation details tab with required fields and balances" caption="Details tab: cashbook, period and the four balances." >}}

### Upload Statement tab

Two sub-tabs. **Upload Statement** lists the files already imported for this session (File Name, Import Format, Upload Date/By, Modified Date/By) and opens the upload form (Bank, Bank Statement Name, file). Each imported file becomes a *Cash Statement* record with its own **Details** (Company, Branch, Cashbook, Name, Opening/Closing Date and Balance, Status ACTIVE/CLOSE) and **View Statement** tab listing the parsed lines. **Default Statement Helper** lists files imported with the *Default Format* and shows, per file, a **Checking** tab with each row's validation result.

{{< figure src="/screenshots/bank-recon/bank_statement_upload.png" alt="Upload statement screen in bank reconciliation applet" caption="Upload Statement: choose the bank format, name the statement, attach the file." >}}
{{< figure src="/screenshots/bank-recon/upload_statement_cash_statement_tab.png" alt="Cash statement tab under upload statement with imported file listing" caption="Cash Statement: the parsed lines of one imported file." >}}

### Manual Matching tab

Three sub-tabs, all filtered to the session's cashbook and to dates on or before the session's Closing Date:

- **Reconcile** — cashbook transaction lines with an open (unmatched) amount, FINAL documents only. Clicking a line opens its matching screen (Detail, **Matched Bank Statement Lines**, **Unmatched Adjustment**), from which **Reconcile** picks one or more bank statement lines, **Undo Reconcile** removes a link, and the adjustment screen books an unmatched residue against the line.
- **Unreconcile** — cashbook lines whose open amount is already zero, so a wrong match can be undone from the same screen.
- **Bank Statement Lines** — every imported statement line (Date, Payor, Reference 1–3, Acc. Num., Description, Dr(-)/Cr, Balance, Txn Type, Remarks). Clicking a line opens the mirror screen (Bank Transactions, **Matched GL Transactions**, Unmatched Adjustment) so you can match from the bank side.

Columns on the Reconcile and Unreconcile grids: Date, Document (with a pop-up of the source document), Payee, Balance, Debit, Credit, Forex Amount, Forex Balance, Forex Exchange Rate, Ref No, Ref 1–6, Doc Reference, Doc Remarks.

{{< figure src="/screenshots/bank-recon/manual_matching_reconcile_tab.png" alt="Manual matching reconcile tab with transaction matching options" caption="Manual Matching — Reconcile: open cashbook lines for the period." >}}
{{< figure src="/screenshots/bank-recon/unreconcile_tab.png" alt="Unreconcile tab for reversing previous match links" caption="Manual Matching — Unreconcile: fully matched lines, ready to be undone if wrong." >}}
{{< figure src="/screenshots/bank-recon/manual_match_bank_stmt_lines.png" alt="Bank statement lines tab used in manual matching" caption="Manual Matching — Bank Statement Lines." >}}
{{< figure src="/screenshots/bank-recon/reconcile_clicking_detail.png" alt="Detail view after selecting reconcile action" caption="Cashbook line detail with its matched statement lines." >}}
{{< figure src="/screenshots/bank-recon/pop_up_page_of_document.png" alt="Document pop-up page showing linked transaction context" caption="Document pop-up from the Document column." >}}
{{< figure src="/screenshots/bank-recon/matching_reconcile_with_bank_stmt_lines_manually.png" alt="Manual reconciliation with selected bank statement lines and journal lines" caption="Selecting bank statement lines to reconcile against a cashbook line." >}}
{{< figure src="/screenshots/bank-recon/umatch_adjustment_to_reocncile_transactiosn.png" alt="Unmatched adjustment screen for reconciling residual differences" caption="Unmatched Adjustment: book the residue that no statement line explains." >}}
{{< figure src="/screenshots/bank-recon/bank_stmt_line_detail_on_clicking.png" alt="Detailed statement line view opened from bank statement lines listing" caption="Bank statement line detail." >}}
{{< figure src="/screenshots/bank-recon/bank_stmt_line_matching_with_jrn_line.png" alt="Bank statement line matched to journal line detail" caption="Matching from the bank side: statement line to cashbook line." >}}
{{< figure src="/screenshots/bank-recon/bank_stmT_line_with_adjistment.png" alt="Bank statement line with adjustment applied in matching workflow" caption="Statement line with an adjustment link." >}}

### Auto Matching tab

**Run Automatching** queues the background job. The buttons **Matched Cash Stmt Lines**, **Matched Txn Lines**, **Unmatched Cash Stmt Lines** and **Unmatched Txn Lines** open the four result listings; all five buttons are disabled while `Processing Auto Matching` is true. Possible matches that the job did not auto-link appear as candidate rows with a **Reconcile** (bank side) or **Add** (cashbook side) button that confirms the pair. A Summary / Matched / Open panel with a **Refresh** button shows the counts.

{{< figure src="/screenshots/bank-recon/auto_matching_processor_page.png" alt="Auto matching processor page with run action and processing status" caption="Auto Matching: run the job, then review matched and unmatched sets." >}}

### Report tab

**Report 1**, **Report 2** and **Report 3**, each with a **Generate Report** button and an export-capable grid. Their content is described under *Lifecycle and effects*.

{{< figure src="/screenshots/bank-recon/report1_which_is_jrnl_with_bank_stmt_line.png" alt="Report 1 output showing journal lines matched with bank statement lines" caption="Report 1: expected cashbook closing vs bank statement closing, with the matched-outside-period sections." >}}
{{< figure src="/screenshots/bank-recon/report2_with_bank_stmt_lines_with_journal.png" alt="Report 2 output with statement lines and journal mapping details" caption="Report 2: balance as per cash book, balance as per bank statement, discrepancy." >}}
{{< figure src="/screenshots/bank-recon/report3_overview_of_bank_recon.png" alt="Report 3 overview of bank reconciliation outcomes and balances" caption="Report 3: the sectioned overview whose sections can be hidden from Application Settings." >}}

### Imported External Cashbook

Create: choose a Cashbook, set the Delimiter and Text Qualifier, attach the CSV (a sample block explains that the header row is required and column headers are customisable). Edit: Details (Cashbook, File Name, created/modified) and a **Cashbook Txn Lines** tab (Document, Payee, Reference, Description, Dt/Ct(-), Date Txn, Entry Date) with a **Generate transaction lines** action and DELETE.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| A cashbook for the bank account, with the user as a **member** | [Cashbook](/applets/master-data/cashbook-applet/) → Details, Members | The create screen only lists cashbooks the user can access (`cashbook-get-by-user`) |
| Settlement methods mapped to that cashbook (and branch where required) | [Cashbook](/applets/master-data/cashbook-applet/) / [POS General](/applets/sales-workflow/pos-general-applet/) | This is what routes voucher and POS settlements into the cashbook's transaction lines |
| Company timezone | [Organisation](/applets/master-data/organisation-applet/) → Company | Every date filter, balance calculation and report uses the company's `default_timezone` (fallback `Asia/Kuala_Lumpur`) |
| An ACTIVE **Weightage Configuration** on the cashbook (optional) | [Cashbook](/applets/master-data/cashbook-applet/) → Weightage Configuration | Without it the auto-matcher uses the built-in defaults described below |
| Source documents at FINAL | Receipt / Payment Voucher, POS, Cash Transfer | Only FINAL documents create cashbook transaction lines; DRAFT lines never appear here |

{{< figure src="/screenshots/bank-recon/weightage_setup_in_cashbook.png" alt="Cashbook setup page showing weightage and reconciliation related settings" caption="Cashbook applet: the Weightage Configuration tab on a cashbook." >}}
{{< figure src="/screenshots/bank-recon/automatching_weightage_configuration_in_cashbook_applet.png" alt="Cashbook applet automatching weightage configuration screen" caption="Weightage Configuration: tick the dimensions to score, give each a weightage (total ≤ 100), set the auto-link threshold (70–100) and, optionally, restrict to one-to-one matching." >}}

The weightage configuration is stored on the cashbook (`bl_fi_mst_cashbook_recon_config.config_json`) and read by the auto-matcher at run time:

| Config key | Screen label | Effect |
|---|---|---|
| `matching_by_amount` `{is_checked, weightage}` | Amount | Weight of the amount score (0–100). Unticked dimensions carry weight 0 |
| `matching_by_date` | Date | Weight of the date-proximity score |
| `matching_by_reference` | Reference | Weight of the best reference-field similarity (Levenshtein) |
| `matching_by_payee` | Payee | Weight of the payee / payor name similarity (Levenshtein) |
| `auto_link_threshold` | Threshold (70 - 100) | Net score (÷100) at or above which a pair is linked automatically; values outside 70–100 fall back to 0.85 |
| `match_one_to_one` | one-to-one checkbox | When true the one-to-many pass (several cashbook lines summing to one bank line) is skipped |

The Cashbook applet's form disables Save when the ticked weightages total more than 100 or the threshold is outside 70–100 (a client-side check); the auto-matcher only reads a configuration whose status is ACTIVE.

### Applet settings

Where the settings live (from `app.routing.ts` and the settings container): the applet routes **Settings → Application Settings** (`field-settings`) to its **own** `FieldConfigurationComponent` — a local form of slide toggles, not the shared field-configuration screen in blg-shared-utilities. **Settings → Default Selection** and **Personalization → Default Selection** are the applet's default-settings and personal-default-settings components. There are no branch-level settings.

Any user who can open the Settings menu can change these; there is no separate permission on the form. Every toggle is created as an empty form control and patched from the saved master settings, so the default for all of them is *not set* (off — nothing hidden). Saving dispatches the applet master settings, and every component below reads them from the session store; a change applies to all users of the tenant the next time the screen loads.

{{< figure src="/screenshots/bank-recon/application-settings.png" alt="Bank Reconciliation Applet Application Settings screen" caption="Application Settings: the hide switches for the listing, the edit tabs, the reference columns and Report 3." >}}

Settings that are declared in the applet's settings model, rendered on the form, saved and read by the code:

| Section | Setting | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Bank Recon Details | `HIDE_BRANCH` | Branch field on the create and edit Details forms | off | Field disappears; the session is saved without a branch |
| Bank Recon Edit | `HIDE_UPLOAD_STATEMENT` | The Upload Statement tab of the edit screen | off | Tab is removed from the tab strip (statements must then be imported some other way) |
| Bank Recon Edit | `HIDE_AUTO_MATCHING` | The Auto Matching tab | off | Tab is removed; matching is manual only |

Settings that are rendered on the form, saved and read by the code, but **not declared** in `applet-settings.model.ts`:

| Section | Setting | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Bank Recon Details | `HIDE_CASH_BOOK_TXN_OPEN_BAL_COLUMN`, `HIDE_CASH_BOOK_TXN_CLOSE_BAL_COLUMN` | The two *Cash Book Txn* balance columns on the listing | off | Column hidden and removed from the column chooser |
| Bank Recon Details | `HIDE_CASH_BOOK_OPEN_BAL_COLUMN`, `HIDE_CASH_BOOK_CLOSE_BAL_COLUMN` | The two *Cash Statement* balance columns on the listing (the labels say "Cash Book") | off | As above |
| Cashbook Transaction Lines | `HIDE_REFERENCE1_COLUMN` … `HIDE_REFERENCE6_COLUMN` | Ref 1–6 on the Reconcile, Unreconcile and matching grids | off | Column hidden unless the user holds the matching `SHOW_REFERENCEn_COLUMN` permission |
| Report → Report 3 | `REPORT3_HIDE_CASHBOOK_OPENING_BALANCE`, `REPORT3_HIDE_CASHBOOK_CLOSING_BALANCE`, `REPORT3_HIDE_BANK_OPENING_BALANCE`, `REPORT3_HIDE_BANK_CLOSING_BALANCE` | The four balance rows of Report 3 | off | Row omitted from the generated report |
| Report → Report 3 | `REPORT3_HIDE_CURRENT_UNMATCHED_CASHBOOK`, `REPORT3_HIDE_MATCHED_CASHBOOK` | The two cashbook sections of Report 3 | off | Section omitted |
| Report → Report 3 | `REPORT3_HIDE_BANK_UNMATCHED`, `REPORT3_HIDE_BANK_MATCHED` | The two bank sections of Report 3 | off | Section omitted |
| Report → Report 3 | `REPORT3_HIDE_CB_MATCHED_PREV_BANK`, `REPORT3_HIDE_BANK_MATCHED_PREV_CB`, `REPORT3_HIDE_CB_MATCHED_FUTURE_BANK`, `REPORT3_HIDE_BANK_MATCHED_FUTURE_CB` | The four cross-period sections of Report 3 | off | Section omitted |
| Report → Report 3 | `REPORT3_HIDE_VARIANCE_OPENING_DIFF` | The *difference in opening balance* row of Report 3 | off | Row omitted |

Rendered on the form but **read by nothing** (switching them has no effect): `HIDE_DELETE_BUTTON` under Bank Recon Details, and the four *Department Settings* toggles labelled Segment, G/L Dimension, Profit Center and Project (`HIDE_SEGMENT`, `HIDE_GL_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`) — the applet has no dimension fields. The settings model also declares dimension, tax, custom-status and `PRINTABLE` keys that have no control and no reader; they are not documented here.

**Settings → Default Selection** holds `DEFAULT_BRANCH` and `DEFAULT_LOCATION` (branch and location drop-downs; read by the create form as the initial branch) and **Details Tab Ordering** (`BANK_RECON_DETAILS_TAB_ORDER`): drag the five tabs — Details, Upload Statement, Manual Matching, Auto Matching, Report — into the order your team prefers; the edit screen rebuilds its tab strip from the saved order. **Personalization → Default Selection** lets each user override the default branch and location for themselves.

### Document behaviour settings

A reconciliation session is not a posted document: no numbering set, no printable, no approval workflow, no e-Invoice flag. No exposed control found beyond the tab switches and tab order above (routes and settings components checked at commit 4f1bb1fb).

### Feature visibility / permissions

Three client-side permission codes are seeded for this applet in the registry: `DELETE_BUTTON_FOR_BANK_RECON`, `DELETE_BUTTON_FOR_BANK_STATEMENT_TXN`, `DELETE_BUTTON_FOR_MATCHING`. **The applet's code does not read any of them** — the Delete buttons are always shown to anyone who can open the screen.

The code does check `SHOW_REFERENCE1_COLUMN` … `SHOW_REFERENCE6_COLUMN`: a role holding one of these sees the corresponding Ref column even when the tenant-wide `HIDE_REFERENCEn_COLUMN` switch is on. These `SHOW_*` codes are checked in code but **not seeded in the registry**, so they must be created on the Client Side Permission screen before they can be granted.

Server-side, every call is gated by the tenant permissions on the *Bank Reconciliation*, *Cash Statement*, *Bank Statement Line*, *Cashbook Transaction Line*, *Cashbook Txn Bank Statement Link* and *Cashbook Txn Statement Recon Possible Link* targets (OWNER / ADMIN / READ / WRITE), assigned through the Permission Wizard.

## Fields

### Details (create and edit)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Company | Legal entity that owns the cashbook | Yes | Max 255 |
| Branch | Branch for the session | No | Hidden by `HIDE_BRANCH`; defaults from Default Selection |
| Cashbook | The cashbook being reconciled | Yes | Chosen from the cashbooks the user is a member of. Immutable after create |
| Name | Session name | Yes | Auto-filled with the month of the Opening Date (e.g. *March 2026*); editable. Max 255 |
| Opening Date | First day of the period | Yes | Client-side check on the create form: must be later than the Closing Date of the cashbook's most recent ACTIVE session, otherwise *Opening date should be later than … based on the cashbook selected* and Create stays disabled. The backend does not re-check overlap |
| Closing Date | Last day of the period | Yes | Client-side check: later than Opening Date (*Closing date should be later than opening date*). Matching grids and the auto-matcher only consider lines dated on or before it |
| Cash Book Transaction Opening Balance | Cashbook balance brought forward | — | Read-only. Pre-filled with the previous session's cashbook closing balance |
| Cash Book Transaction Closing Balance | Cashbook balance at Closing Date | — | Read-only. Calculated: opening + sum of ACTIVE, non-VOID cashbook lines dated within the period (company timezone). **Refresh calculated balance** recomputes it |
| Cash Statement Opening Balance | Bank's opening balance | Yes | A **Prev Cash Stmt Closing Bal** hint button copies the previous session's bank closing balance |
| Cash Statement Closing Balance | Bank's closing balance | Yes | Entered from the statement |
| Status | ACTIVE or CLOSE | Yes | Stored as the session's `BANK_RECON_STATUS` extension value; a new session is created with the value *Processing* |

### Upload Statement

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Bank (Import Format) | Parser to use | Yes | See the format list below. Form hint *Please choose type of bank import format* |
| Bank Statement Name | Name of the Cash Statement record | No | Defaults from the file name |
| File | The statement file | Yes | CSV for the CSV formats, PDF for the *Pdf* formats |
| Start Date / End Date | Period covered | Only for **Default Format** | End Date defaults to today |

Import formats offered on the screen: Standard Chartered Bank, HSBC Bank, AMBANK-01, AMBANK-02, ABMB-Pdf, Hong Leong Bank-01, -02, -03, Hong Leong Bank Pdf, Maybank, Maybank Pdf, Public Bank-01, -02, Public Bank Pdf, RHB Bank, Citi Bank, CIMB-01, CIMB-02, CIMB Pdf, OCBC Pdf, Bank Islam, **Default Format**. The numbered variants are different export layouts of the same bank's internet banking; each maps to its own backend parser that checks the column headers and rejects the file if they differ (*The Headers Order Does Not Match The Expected Order*, *… Headers Are Not As Excepted*). PDF formats are parsed by text extraction and fail with *No transactions found in … PDF* when the layout is not recognised.

**Default Format** is a generic CSV. Download the template (*MasterData_Default_Bank_Statement_Template.csv*) from the upload form; its columns are `PAYEE_OR_PAYOR_NAME, RECIPIENT_REFERENCE, TRANSACTION_DATE, AMOUNT, DESCRIPTION, REMARKS, BIC_OR_SWIFT_CODE, IBAN, BANK_ACCOUNT_NUMBER, BANK_REFERENCE_NUMBER, REFERENCE_NUMBER, REFERENCE_NUMBER2, REFERENCE_NUMBER3, REFERENCE_NUMBER4`. Rows are loaded into a helper table and validated row by row; the **Checking** tab shows Transaction Date / Amount / Payee-Payor Name validation errors, a short error message, and whether each row was *Validated* and *Processed*. Rows with errors are not promoted into the Cash Statement.

### Cash Statement (one per imported file)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Cashbook | Inherited from the session | Cashbook yes | |
| Name | Statement name | Yes | |
| Opening Date, Closing Date, Opening Balance, Closing Balance | Header values of the statement | No | Set by the parser where the format carries them |
| Status | ACTIVE / CLOSE | — | `BANK_STMT_STATUS` extension value |

### Imported External Cashbook

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Cashbook | Target cashbook | Yes | |
| Delimiter, Text Qualifier | CSV dialect | No | |
| File | CSV with a header row | Yes | Generated lines carry Document, Payee, Reference, Description, amount (Dt/Ct(-)), Date Txn and Entry Date |

## Lifecycle and effects

### The session

1. **Create** — the header is written with status ACTIVE and the `BANK_RECON_STATUS` value *Processing*. Opening balances are suggested from the cashbook's most recent ACTIVE session (its cashbook closing balance and bank closing balance).
2. **Work** — statements are imported, links are made. The header's `processing_auto_matching` flag is set to true when the auto-matcher is queued and cleared by the job when it finishes.
3. **Close** — set Status to CLOSE on the Details tab. Nothing is locked by this: links can still be undone, and the next session's Opening Date is validated against this session's Closing Date whichever status it has.
4. **Delete** — deleting a session is a cascade, not a soft delete: every reconciliation link and possible link of the session is removed and the open amount of each affected cashbook line and statement line is **restored**; every Cash Statement (header, lines, attachment record) imported into the session is deleted; then the session header, its extensions and its events are deleted.

### What a reconciliation link does

A link (`bl_fi_cashbook_txn_stmt_recon_link`) joins one cashbook transaction line to one bank statement line for an `amount_contra`, and is tagged `DBLSIDED` (matched on both sides), `BANK-STMT` (an adjustment booked against a bank line) or `CASH-BOOK` (an adjustment against a cashbook line). On create the backend (`CashbookTxnBankStmtLinkService.createCashbookTxnBankStmtLink` → `CashbookTxnBankStmtLinkUow`):

- aligns the sign of `amount_contra` with the line's open amount and snaps float noise so a full match leaves exactly 0;
- throws — the link is not written — if the open amount is already 0 (`…_OPEN_AMOUNT_ALREADY_ZERO_CANNOT_OVERFILL`), if the contra exceeds the remaining open amount (`…_AMOUNT_CONTRA_EXCEEDS_REMAINING_OPEN_AMOUNT`), if the signs differ (`…_OPEN_AMOUNT_AND_AMOUNT_CONTRA_SIGN_MISMATCH`) or if the contra is zero (`AMOUNT_CONTRA_MUST_BE_NON_ZERO`), the prefix being `CASHBOOK_TXN_LINE` or `CASH_STMT_LINE`;
- applies `open_amount = open_amount − amount_contra` on **both** the cashbook line and the statement line.

Undo Reconcile deletes the link and adds the contra back to both open amounts. Partial matches are allowed: a RM 1,000 statement line can be linked to three cashbook lines, and a cashbook line can stay partly open across sessions.

**Unmatched Adjustment** creates a one-sided link (txn type `BANK-STMT`, description *Adjustment*) that sets the cashbook line's open amount to zero and flags it `manual_adjustment_action = YES`, so an item the bank will never show (a write-off, a rounding residue) leaves the unmatched list; **Undo** removes the link and clears the flag. It does not post a journal — the accounting correction still has to be made with a voucher.

### Effect on other documents

While a cashbook line is linked to a session, the source document is protected on the server (`CashbookTxnLineBankReconGuard`, raised from `GenericDocumentService` and `CashbookTxnLinePostingService` as `CASH_DOCUMENT_RECONCILED_TXN_LINES_BLOCK_EDIT`): changing the settlement amount or transfer details of a FINAL Receipt Voucher, Payment Voucher or Cash Transfer whose lines are still reconciled is rejected with *Cashbook txn lines are bank-reconciled. Unreconcile them from the bank recon (name and month) before changing amounts or transfer details.* Voiding the document, however, voids its cashbook lines; the balance calculation excludes VOID lines, so a voided receipt disappears from the cashbook side after the fact.

**What this applet writes and reads.** It writes `bl_fi_bank_recon_hdr` (+ ext, event), `bl_fi_cash_stmt_hdr` / `_line` (imported statements), `bl_fi_cashbook_txn_stmt_recon_link` and `_possible_link`, and it updates `open_amount` and `manual_adjustment_action` on `bl_fi_cashbook_txn_line` and `open_amount` on `bl_fi_cash_stmt_line`. It only reads the cashbook, company and generic / cash document headers. There is no server document type, no amount or quantity signum, no journal and no stock processor: nothing here reaches the General Ledger, and nothing here is reversed by a VOID — voiding a source document voids its cashbook lines through the document's own posting service.

### Auto matching

**Run Automatching** posts the session to the `BANK_RECON_AUTO_MATCHING_PROCESSOR` queue. The job:

1. Deletes all *possible links* of the session (a rerun starts from scratch; confirmed links are kept).
2. Loads the outstanding lines: statement lines of the cashbook with `open_amount ≠ 0` and txn type `TXN`; cashbook lines with `open_amount ≠ 0`, txn type `TXN`, not DELETED, dated from 90 days before the Opening Date to 90 days after the Closing Date (company timezone).
3. Loads the cashbook's ACTIVE Weightage Configuration, or the defaults (amount 0.25, date 0.25, reference 0.25, payee 0.25).
4. Scores every cashbook × statement pair: amount (1.0 when equal to the cent, linear decay, 0 when signs differ), date (1 − days apart ÷ 90, 0 beyond 90 days), reference (best Levenshtein similarity across the reference fields) and payee (Levenshtein). Pairs whose amount score is below 0.1 or whose weighted net score is below 0.40 are dropped. Weights of dimensions with no data on either side are redistributed.
5. Picks the best one-to-one pairs greedily. Net score ≥ the threshold creates a **confirmed link** immediately; with no configuration the rule is stricter — amount must be exact and payee similarity ≥ 0.85. Net score ≥ 0.55 but below the threshold creates a **possible link** for review.
6. Unless `match_one_to_one` is set, looks for up to five still-open cashbook lines that sum to one open statement line (±0.01). Groups scoring ≥ 0.98 are auto-linked with the bank amount split equally; groups above the threshold become possible links.
7. Clears `processing_auto_matching`.

The screen disables its buttons the moment you click Run, re-checks the flag after one minute and every 30 seconds while the tab is open. Confirming a possible link (Reconcile / Add on the Auto Matching result screens) creates the real link and deletes the possible one.

### The reports

| Report | What it shows |
|---|---|
| **Report 1** | Bank statement closing balance → adds/removes the cashbook lines unmatched this period, the cashbook lines matched with a previous or future period's statement, and the bank lines unmatched or matched with previous/future cashbook lines → **Expected closing balance of the cashbook** → **Variance / discrepancy** against the calculated cashbook closing. Lines carry Document Type, Document No, Ref No, Ref 1–6, Doc Remarks, Forex Amount / Balance / Rate |
| **Report 2** | *Balance as per Cash Book* and *Balance as per Bank Statement*, the reconciling items between them, *Expected Closing Bank Statement* and *Discrepancy*, with Date, Payee, Cheque No and the same reference columns |
| **Report 3** | Sectioned overview: cashbook opening/closing and bank opening/closing balances; *Cashbook transactions unmatched balance*, *matched balance*, *matched with previous / future period of bank statement*; *Bank transactions unmatched / matched balance*, *matched with previous / future cashbook transactions*; *Difference in opening of cashbook opening balance vs bank statement opening balance*. Each section can be hidden from Application Settings |

All three read the links as they stand when you click Generate Report. Report 3 is the one to keep as the period's evidence; Report 1 is the one that tells you which side the variance sits on.

## Related applets

- **[Cashbook](/applets/master-data/cashbook-applet/)** — defines the cashbook, its members and the Weightage Configuration the auto-matcher reads.
- **[Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/)** and **[Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/)** — the FINAL settlement lines that become the cashbook side of the reconciliation; both are locked against amount changes while reconciled.
- **[POS General](/applets/sales-workflow/pos-general-applet/)** — POS settlements reach the same cashbooks through their settlement methods.
- **[Ledger and Journal](/applets/finance/ledger-and-journal-applet/)** — for the GL side of a bank charge or interest entry; the cashbook line itself must come from a voucher or cash transfer.
- **[Organisation](/applets/master-data/organisation-applet/)** — the company timezone that every date window in this applet uses.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| *Opening date should be later than YYYY-MM-DD based on the cashbook selected* when creating a session | The cashbook already has an ACTIVE session ending on or after that date | Start the new period the day after the last session's Closing Date, or delete the overlapping session |
| A voucher is missing from the Reconcile tab | The document is not FINAL, its settlement method points to another cashbook, or its date is after the session's Closing Date | Check posting status and the settlement method's cashbook; the Reconcile grid is capped at the Closing Date |
| Cannot change the amount on a Receipt / Payment Voucher: *Cashbook txn lines are bank-reconciled…* | The line is linked in a session | Undo the link on the Unreconcile tab (or the matching screen) of the session named in the message, then edit |
| Upload fails with *The Headers Order Does Not Match The Expected Order* or *… Headers Are Not As Excepted* | The file was exported in a different layout from the format chosen | Try the other numbered variant of the same bank (e.g. -01 / -02), or convert the file to the Default Format template |
| *No transactions found in … PDF* | The PDF layout differs from the one the parser expects (scanned image, different statement type) | Export a CSV from internet banking instead, or use Default Format |
| Default Format rows stay unprocessed | Validation errors on Transaction Date, Amount or Payee/Payor Name | Open Default Statement Helper → the file → Checking; fix the rows in the CSV and upload again |
| Auto Matching buttons stay greyed out | `processing_auto_matching` is still true — the job is queued, still running, or failed before clearing the flag | Wait; the screen re-checks every 30 seconds. If it never clears, the job failed — check the job queue log with the administrator |
| Auto Matching creates almost only possible links | No ACTIVE Weightage Configuration on the cashbook, so the strict default (exact amount + payee ≥ 0.85) applies; or the threshold is set to 100 | Create a configuration with the dimensions that your bank statement actually carries (reference and payee are often blank on card-acquirer statements) and a threshold around 85 |
| Auto Matching pairs the wrong lines with identical amounts | Amount is the only dimension with data (no reference / payee on the statement) | Lower the amount weightage and raise date; review the possible links instead of relying on auto-links |
| Reconcile fails with *…_AMOUNT_CONTRA_EXCEEDS_REMAINING_OPEN_AMOUNT* or *…_OPEN_AMOUNT_ALREADY_ZERO_CANNOT_OVERFILL* | The line was matched in another session, or partly matched already | Look at Matched Bank Statement Lines / Matched GL Transactions for the line — the **Matched Recon** column names the session |
| Duplicate rows on Matched Bank Statement Lines | A line linked from more than one session (older data) | Undo the links in the wrong session; the listing now groups by link |
| A matched line vanished and the cashbook closing balance moved | The source voucher was voided after matching | Void lines are excluded from the balance; undo or re-enter the transaction and re-run the reports |
| Report figures differ from the screen | Reports were generated while Auto Matching was still running, or after links changed | Regenerate the report once `Processing Auto Matching` is false |
| Bank charges / interest you journalled do not appear as cashbook lines | Manual journals do not create cashbook transaction lines | Enter them as a Payment Voucher / Receipt Voucher or a Cash Transfer on the cashbook |
| Deleting a session removed the uploaded statements | Delete cascades to every statement imported into the session and restores all open amounts | Expected; re-upload into the new session |
| Application Settings hide/show switches "do not work" | `HIDE_DELETE_BUTTON` and the four Department Settings switches are rendered but read by nothing | Nothing to configure — they are inert (see Applet settings); the Delete button cannot be hidden |

## Related documentation

- [Bank reconciliation guide](/guides/accounting-guides/bank-reconciliation-guide/) — the month-end procedure, step by step.
- [Financial Accounting module](/modules-v2/financial-accounting/) — where reconciliation sits in the close.
- [Cashbook applet](/applets/master-data/cashbook-applet/) — reference for the cashbook and its Weightage Configuration.

### Video walkthrough

{{< youtube D0Pw7ytJ_JA >}}

{{< callout type="tip" >}}
If video playback is blocked by browser or network policy, open directly: [Bank Reconciliation Walkthrough](https://www.youtube.com/watch?v=D0Pw7ytJ_JA).
{{< /callout >}}

The video covers creating a session and entering opening balances, uploading a statement, manual matching (Reconcile, Unreconcile, Bank Statement Lines), running Auto Matching and reading its status, and generating Report 1, 2 and 3.
