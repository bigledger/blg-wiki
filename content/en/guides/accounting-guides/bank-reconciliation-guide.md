---
description: Task-oriented walkthrough of a complete bank reconciliation period in BigLedger — create a session, upload the statement, auto-match, clean up, and produce the audit reports.
tags:
- user-guide
- accounting
- bank-reconciliation
title: Bank Reconciliation Guide
weight: 30
---

This guide walks a finance operator through one complete period of bank reconciliation in BigLedger. You will create a reconciliation session for a cashbook, upload the bank statement, run auto-matching, clean up the unmatched lines, and produce Reports 1, 2 and 3 as the audit pack. For field-by-field reference, see the [Bank Reconciliation Applet](/applets/finance/bank-reconciliation-applet/) documentation.

{{< callout type="info" >}}
**The two sides of a reconciliation**
The **cashbook side** is what BigLedger thinks happened (Receipt Vouchers, Payment Vouchers, POS settlements, manual journals). The **bank statement side** is what the bank says happened. A reconciliation session matches one to the other for a single cashbook over a single date range.
{{< /callout >}}

## Key concepts

| Term | Meaning |
| :--- | :--- |
| **Reconciliation session** | One row scoped to a cashbook, company, branch and date range. Holds the four balance fields and drives the auto-matcher. |
| **Cashbook line** | Posted ledger-side movement (Receipt/Payment Voucher Internal, POS settlement, manual journal). Each line has an `open_amount` that tracks how much is still unreconciled. VOID source documents are excluded. |
| **Cash statement line** | Imported bank-side movement, created from an uploaded bank file. |
| **Confirmed (reconcile) link** | A saved pairing of a cashbook line to a statement line. Drives the contra amount. |
| **Possible link** | An auto-matcher candidate. Created when the score lands between 0.55 and the auto-link threshold (default 0.85). Users confirm or reject it manually. |
| **Cashbook Recon Config** | Optional per-cashbook weightage settings (`matching_by_amount`, `matching_by_date`, `matching_by_reference`, `matching_by_payee`, `match_one_to_one`, `auto_link_threshold`). Maintained in the Cashbook Applet. |

## Prerequisites

Before you start a reconciliation:

- The Chart of Accounts is set up and posting works (see the [Chart of Accounts Setup Guide](/guides/accounting-guides/chart-of-accounts-setup/)).
- At least one cashbook exists in the [Cashbook Applet](/applets/master-data/cashbook-applet/), linked to the correct company and branch.
- Settlement methods used by [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), and POS General point to that cashbook.
- The company record in the [Organisation Applet](/applets/master-data/organisation-applet/) has a sensible `default_timezone`. The recon period uses this timezone to filter cashbook lines; it falls back to `Asia/Kuala_Lumpur` if unset.
- Strongly recommended: an ACTIVE Cashbook Recon Config row for the cashbook (Cashbook Applet → automatching weightage). Without it, auto-matching uses 25/25/25/25 weights and a strict 0.85 amount+payee gate, and most candidates end up as "possible links".
- The user has the `API_TNT_DM_ERP_BANK_RECONCILIATION_CREATE` permission (or `OWNER`/`ADMIN`). Manual reconcile/unreconcile actions also need `API_TNT_DM_ERP_CASHBOOK_TXN_BANK_STMT_LINK_CREATE/UPDATE/DELETE`.
- The prior period for the same cashbook is reconciled and closed — the new Opening Date must be later than the prior session's Closing Date.
- A bank statement file is ready, either in a supported bank-specific format (Maybank, CIMB-01/02, Public Bank-01/02, RHB, Hong Leong-01/02/03, AMBANK-01/02, Standard Chartered, HSBC, Citi, Bank Islam) or in the generic "Default Format" CSV.

The applet is at **Sidebar → Bank Reconciliation**.

## Step 1: Confirm the cashbook is wired correctly

*Master Data → Cashbook Applet*

Before opening Bank Reconciliation, verify:

- The cashbook exists with the right company, branch and currency.
- Every settlement method that posts to it (Receipt Voucher Internal, Payment Voucher Internal, POS General) is linked.
- An ACTIVE Cashbook Recon Config row exists under **automatching weightage** if you want auto-matching to use your house style.

Variance investigation is wasted effort if settlements are flowing into the wrong cashbook.

## Step 2: Create a new reconciliation session

*Sidebar → Bank Reconciliation → New*

The create flow is two steps.

1. **Cashbook Listing** — pick the cashbook to reconcile. The Company and Branch columns are derived from the cashbook and are read-only.
2. Click **Next** to open the **Details Listing** form.

{{< callout type="warning" >}}
You cannot change the cashbook after save. To switch cashbooks you must delete the recon session (which cascades — see [Step 9](#step-9-undo-or-delete-a-session)) and start over.
{{< /callout >}}

## Step 3: Enter the period and the four balances

On the Details form, set the period and balances. The **Name** field auto-fills to `MMMM YYYY` (e.g. `March 2026`) from the Opening Date — override it if your tenant uses a different naming style.

| Field | Notes |
| :--- | :--- |
| **Opening Date** | Required. Must be **later** than the prior period's Closing Date for this cashbook. If you violate this, the inline hint reads `Opening date should be later than YYYY-MM-DD based on the cashbook selected`. |
| **Closing Date** | Required. Must be **greater** than Opening Date. The form sets `closingDateError=true` only when both dates are present, so verify before saving. |
| **Name** | Required. Defaults to `MMMM YYYY` from the Opening Date. |
| **Cash Book Transaction Opening Balance** | Accepts a manual value but is **overwritten on save** by the backend recalculation. For the first recon on a cashbook, leave the suggested value and ensure the migration opening journal sits before the Opening Date. |
| **Cash Book Transaction Closing Balance** | Read-only on create. Populated by the recalc job after save. |
| **Cash Statement Opening Balance** | Required. Taken from your bank statement opening balance. **Not** recalculated. |
| **Cash Statement Closing Balance** | Required. Taken from your bank statement closing balance. **Not** recalculated. |
| **Status** | Defaults to `Processing`. Stored in `bl_fi_bank_recon_ext` as `BANK_RECON_STATUS`, not in the header `status` column. |

Two clickable hint chips appear beneath Cash Book Opening and Cash Statement Opening, populated from the prior session's closing values. Click to copy.

## Step 4: Save and confirm the balance recalculation

Click **Save**. Behind the scenes the backend:

1. Creates the `bl_fi_bank_recon_hdr` row.
2. Recomputes **Cash Book Opening Balance** as the sum of active, non-VOID cashbook lines for this cashbook dated **before** the Opening Date (timezone-aware, using the company's `default_timezone`).
3. Recomputes **Cash Book Closing Balance** as Opening + the period total over the same timezone-converted dates.
4. Leaves Cash Statement Opening and Closing untouched.

Re-open Details to see the refreshed Cash Book values. The **Calculated Cash Book Closing** hint reflects the live recalculation.

{{< callout type="tip" >}}
If Cash Book Opening looks wrong, the most common causes are (a) the company `default_timezone` is unset or recently changed, (b) prior-period vouchers are still in draft or have been voided, or (c) the migration opening journal is dated on or after the Opening Date. Fix the source data, then re-save (or use the admin **Fix Opening and Closing Balances** endpoint) to refresh.
{{< /callout >}}

## Step 5: Upload the bank statement

*Open the session → Upload Statement*

Two sub-tabs are available:

- **Cash Statement** — bank-specific parsers for Maybank, CIMB-01/02, Public Bank-01/02, RHB, Hong Leong-01/02/03, AMBANK-01/02, Standard Chartered, HSBC, Citi, and Bank Islam.
- **Default Statement Helper** — generic CSV/Excel importer for unsupported banks.

| Field | Notes |
| :--- | :--- |
| **Import Format** | Required. Must match the bank that produced the file. A mismatch sets `process_status=ERROR` and leaves the file unparsed. |
| **Bank Statement Name** | Defaults from the file name; editable. |
| **File attachment** | Stored in `app_file_item` and referenced by `file_guid`. |

### Using the Default Statement Helper

1. Pick **Default Format** and upload your CSV.
2. The rows land in `bl_fi_default_bank_stmt_import_file_helper` as staging.
3. Open the file from **Upload Default Statement Listing** and switch to the **Checking** sub-tab.
4. Fix any row that has `txn_date_error`, `amount_error`, or `payee_or_payor_name_error` set. Rows with `short_error_message` populated will not be promoted.
5. Once `validated=true` and `processed=true`, the rows appear in the Cash Statement listing as real `bl_fi_cash_stmt_line` entries.

## Step 6: Run Auto Matching

*Open the session → Auto Matching → Run*

Pressing **Run** flips `bl_fi_bank_recon_hdr.processing_auto_matching` to `TRUE`, enqueues a `BankReconAutoMatchingProcessor` job in the tenant queue, and returns immediately. The matcher scores every `(cashbook line, statement line)` pair using the configured weights.

| Score range | Outcome |
| :--- | :--- |
| `>= auto_link_threshold` (default `0.85`) | Direct confirmed link written to `bl_fi_cashbook_txn_stmt_recon_link`. |
| `0.55` to `< auto_link_threshold` | Possible link written to `bl_fi_cashbook_txn_stmt_recon_possible_link` for manual review. |
| `< 0.55` | Ignored. |

Default weights are `amount=0.25`, `date=0.25`, `reference=0.25`, `payee=0.25`. Per-cashbook overrides come from the Cashbook Recon Config (`config_json`). `auto_link_threshold` must be an integer between `70` and `100`; anything outside that range is logged as a warning and falls back to `0.85`.

{{< callout type="warning" >}}
**Auto Matching is asynchronous.** Wait for `processing_auto_matching` to flip back to `FALSE` before running Reports 1/2/3 or signing off. If the flag stays `TRUE` for more than 5–10 minutes, check tenant queue health.
{{< /callout >}}

Group matching (many cashbook lines aggregated into one bank deposit) only auto-links when **score ≥ 0.98 AND |sum(cashbook) − bank| ≤ 0.01**. Otherwise the candidate lands in possible links. Set `match_one_to_one=true` in the Cashbook Recon Config to skip group matching entirely.

## Step 7: Review possible links

*Open the session → Manual Matching → Reconcile*

In **RECONCILE** mode, the **Cashbook Transaction Lines** tab shows each cashbook line with its candidate matches from `bl_fi_cashbook_txn_stmt_recon_possible_link`.

1. Tick a candidate statement line.
2. Open the Reconcile detail popup to inspect the underlying source voucher.
3. Confirm to promote the candidate to a confirmed link. The possible link row is deleted automatically and the cashbook line's `open_amount` is reduced.

For lines the auto-matcher missed entirely, switch to the **Bank Statement Lines** tab, locate the orphan, and pair it with a cashbook line manually. Use the `gl-transaction-adj` sub-screens from the row detail to handle bank charges, rounding, or FX cents that need a corresponding journal adjustment.

## Step 8: Undo bad matches via Unreconcile

*Open the session → Manual Matching → Unreconcile*

In **UNRECONCILE** mode, the Cashbook Transaction Lines tab lists currently-reconciled pairs. Selecting one and confirming deletes the `bl_fi_cashbook_txn_stmt_recon_link` row and restores the cashbook line's `open_amount`.

{{< callout type="warning" >}}
Always unreconcile a line **before** voiding its source document (Receipt Voucher Internal, Payment Voucher Internal, POS settlement). Voiding the source after reconciling leaves the link row dangling: the closing-balance recalc excludes the void, but the link is still on the books, so the two sides disagree.
{{< /callout >}}

Unreconcile is permission-gated — `API_TNT_DM_ERP_CASHBOOK_TXN_BANK_STMT_LINK_DELETE` or `OWNER`/`ADMIN`.

## Step 9: Undo or delete a session

*Open the session → Details → Delete*

Deleting a recon session is **cascading**:

1. For every cash statement line linked to the recon, the cashbook line's `open_amount` is restored and both the confirmed link row and any possible-link row are deleted.
2. The `bl_fi_cash_stmt_hdr` records (with their lines and ext rows) are deleted.
3. The `bl_fi_bank_recon_hdr`, its ext rows, and its event rows are deleted.

The cashbook-side ledger movements themselves (vouchers, POS settlements, manual journals) are **not** touched.

{{< callout type="warning" >}}
The Delete button is destructive. In production tenants, turn on **Settings → Application Settings → `HIDE_DELETE_BUTTON`** and reserve clearing it for `OWNER`/`ADMIN` roles.
{{< /callout >}}

## Step 10: Generate Reports 1, 2 and 3

*Open the session → Report*

| Report | Endpoint | Purpose |
| :--- | :--- | :--- |
| **Report 1** | `POST /report-one` | Journal lines aligned to bank statement lines. Lists matched and unmatched cashbook lines with their statement counterparts and the period variance. |
| **Report 2** | `POST /report-v2/backoffice-ep` | Detailed reconciliation schedule. |
| **Report 3** | `POST /report-three/backoffice-ep` | High-level outcome summary with the four balance positions. |

All three require both `API_TNT_DM_ERP_BANK_RECONCILIATION_READ` and `API_TNT_DM_ERP_CASHBOOK_HDRS_READ`. The numbers are recomputed at runtime from the cashbook and statement lines, so they always reflect the latest link state.

Save the three outputs alongside the original bank file — together they are the audit pack for the period.

## Step 11: Mark the session Reconciled

On Details, change **Status** from `Processing` to `Reconciled` (or your tenant's final status) and save. This updates the `BANK_RECON_STATUS` row in `bl_fi_bank_recon_ext`; the header lifecycle column `status` stays `ACTIVE`.

For real lockdown, restrict `BANK_RECONCILIATION_UPDATE/DELETE` and `CASHBOOK_TXN_BANK_STMT_LINK_CREATE/DELETE` permissions to a controller role at the start of the next period.

## What the system enforces

| Rule | Where |
| :--- | :--- |
| Cash Book Opening and Closing are recomputed on **create**, never overwritten by the user value | `BankReconciliationService.recalcBalancesForNewBankRecon` |
| Voided source documents (`posting_status='VOID'`) are excluded from cashbook-side totals and from Report 1 | `OPENING_BAL_SQL`, `PERIOD_TOTAL_SQL`, Report 1 `unmatched_cashbook` CTE |
| All date filters use `(date_txn_doc AT TIME ZONE company.default_timezone)::date`; falls back to `Asia/Kuala_Lumpur` | `RECON_INFO_SQL` and every CTE in Report 1/3 |
| Auto-link threshold = `0.85`, possible-link threshold = `0.55`, below that nothing is created | `THRESHOLD_AUTO_LINK`, `THRESHOLD_POSSIBLE_LINK` |
| `auto_link_threshold` from config must be `70`–`100`. Out-of-range values fall back to `0.85` | `loadReconMatchingWeights` |
| Group auto-links require `score >= 0.98` AND `|sum(cashbook) − bank| <= 0.01` | `getPossibleAutoMatchingBankRecon` Phase 4 |
| When `match_one_to_one=true`, Phase 4 group matching is skipped | `getPossibleAutoMatchingBankRecon` |
| Match link `txn_type` must be `DBLSIDED`, `BANK-STMT`, or `CASH-BOOK` | `check_txn_type` constraints |
| Bank Recon Status is stored in `bl_fi_bank_recon_ext.param_code='BANK_RECON_STATUS'`, not in `hdr.status` | `bank-recon-create.component.ts` onSubmit |
| Delete cascades through cash statements, links, possible links, ext rows and events | `BankReconciliationService.deleteBankReconciliation` |

## Maintenance and common adjustments

### Adjust an in-period bank charge

If the bank netted off a charge against a receipt, post a journal in the [Ledger and Journal Applet](/applets/finance/ledger-and-journal-applet/) crediting the cashbook GL Code and debiting the bank charges expense, dated within the period. The new cashbook line will appear in the next auto-match run.

### Re-run auto-matching after changing weightage

Re-running **Run** only scores previously unmatched lines (`getOutstandingCashbookTxnLineWithNoPossibleLinksList`). To re-evaluate pairs that already have a possible link, delete the existing possible links first (or run the new weights on a fresh recon session).

### Update the period dates after save

Editing **Opening Date** on an existing session does **not** automatically re-run the balance recalculation — the recalc fires only on Create. To refresh the balances after a date change, run the admin **Fix Opening and Closing Balances** endpoint.

### Carry the closing balance into the next period

When creating the next session, the **Cash Book Transaction Opening Balance** hint chip auto-populates from the prior session's closing value (looked up on `bank_recon_hdr` where `date_end = date_start − 1 day`). Click the chip to copy it.

## Gotchas and troubleshooting

| Symptom | Cause | Fix |
| :--- | :--- | :--- |
| Cash Book Opening Balance defaults to 0 on the first recon | No prior session exists; the hint is empty | Leave the user-entered value blank or `0` and ensure the migration opening journal sits before the Opening Date. The post-save recalc will populate the correct value. |
| Voided settlement after reconcile leaves a dangling link | The recalc excludes the void but the `recon_link` row stays | Unreconcile the line first (Manual Matching → Unreconcile), then void the source. If the void already happened, clear the link manually. |
| Auto Matching looks stuck | Tenant queue backlog; `processing_auto_matching` stays `TRUE` | Wait for the flag to flip to `FALSE` before running reports. If it stays `TRUE` for more than 5–10 minutes, check tenant queue health. |
| Auto-match accuracy is poor — everything becomes a possible link | No Cashbook Recon Config, so the matcher uses 25/25/25/25 with a strict amount+payee gate at `0.85` | Create an ACTIVE row in the Cashbook Applet → automatching weightage. With a config in place the gate becomes `score >= auto_link_threshold`, raising the auto-link rate. |
| Setting `auto_link_threshold` to `50` has no effect | Values below `70` are rejected as unsafe | Use an integer between `70` and `100`. |
| Group matches never auto-link | Phase 4 requires `score >= 0.98` and amount tolerance `<= 0.01` | Reconcile the group manually, or set `match_one_to_one=true` to skip Phase 4 entirely. |
| Period balances shift after changing company timezone | All date filters convert through `default_timezone` | Set the timezone correctly in the [Organisation Applet](/applets/master-data/organisation-applet/) before reconciling. After a change, run the admin **Fix Opening and Closing Balances** endpoint. |
| Default Statement Helper upload "completes" but no lines appear | Rows have `txn_date_error`, `amount_error`, or `payee_or_payor_name_error` set | Open the Checking tab, fix flagged rows. Once `short_error_message` clears and `validated=true`/`processed=true`, the lines appear in the Cash Statement listing. |
| Re-running Auto Matching ignores already-scored pairs | The outstanding-lines filter skips lines that already have a possible link | Delete the existing possible links for the recon before re-running, or use a fresh session. |
| Closing Date <= Opening Date got saved | The form only sets `closingDateError=true` when both dates are present and re-validated | Always confirm Closing > Opening before clicking Save. Do not bypass the inline `closingDateError` warning. |
| "Opening date should be later than YYYY-MM-DD" but the date looks right | The wrong cashbook is selected | Confirm the Cashbook in the picker — the hint always reflects the last closing date for the selected cashbook. |

## Related documentation

- [Bank Reconciliation Applet](/applets/finance/bank-reconciliation-applet/) — full field reference and screenshots
- [Cashbook Applet](/applets/master-data/cashbook-applet/) — cashbook master data and automatching weightage
- [Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/) — cashbook-side receipts
- [Payment Voucher (Internal) Applet](/applets/finance/internal-payment-voucher-applet/) — cashbook-side payments
- [Ledger and Journal Applet](/applets/finance/ledger-and-journal-applet/) — manual journals for bank charges and FX adjustments
- [Organisation Applet](/applets/master-data/organisation-applet/) — company timezone setup
- [Chart of Accounts Setup Guide](/guides/accounting-guides/chart-of-accounts-setup/) — prerequisite GL structure
- [Journal Entries](/guides/accounting-guides/journal-entries/) — manual journal workflow
- [Financial Reporting](/guides/accounting-guides/financial-reporting/) — Trial Balance, P&L, Balance Sheet
