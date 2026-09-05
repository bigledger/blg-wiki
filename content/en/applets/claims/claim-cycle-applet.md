---
title: "Claim Cycle Applet"
description: "Finance-side processing of approved employee claims: monthly claim cycles, finance review and on-hold, audit sampling, and the Bank, PV Details, Cross-Billing and Pivot reports that drive payment."
applet_code: "ClaimCycleApplet"
applet_repo: "blg-applet-wavelet-claim-cycle-applet"
modules: [claims, hr-payroll, financial-accounting]
related_applets: [claim-applet, employee-applet, organisation-applet, internal-payment-voucher-applet, cashbook-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/app.routing.ts
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/settings-container/application-settings/application-settings.component.html
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/settings-container/application-settings/application-settings.component.ts
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/settings-container/reviewer-setting-container/reviewer-setting-create/reviewer-setting-create.component.html
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/claim-cycle-container/claim-cycle-listing/claim-cycle-listing.component.ts
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/claim-cycle-container/claim-cycle-edit/claim-cycle-edit.component.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/review/bl_aat_claim_cycle_review_setting.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/bl_aat_claim_cycle_cutoff_date.java
  fields:
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/claim-cycle-container/claim-cycle-create/claim-cycle-create.component.html
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/claim-cycle-container/claim-cycle-edit/claim-cycle-edit.component.html
    - blg-applet-wavelet-claim-cycle-applet/micro-fe/projects/wavelet-erp/applets/claim-cycle-applet/src/app/components/claim-cycle-container/claim-cycle-edit/samples-tab/samples-create/samples-create.component.html
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/bl_aat_claim_cycle_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/bl_aat_claim_cycle_checking_sample_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/bl_aat_claim_cycle_checking_sample_link.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/report/bl_aat_claim_cycle_bank_report_line.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/report/bl_aat_claim_cycle_pv_details_report_line.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/report/bl_aat_claim_cycle_cross_billing_report_line.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/report/bl_aat_claim_cycle_pivot_report_line.java
  lifecycle:
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/CycleProcessStatus.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/DateSetupLogic.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/report/XtnSyncingStatus.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/ClaimCycleHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/ClaimCycleHdrCLOSEDCycleHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/ClaimCycleCutoffDateProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/auditAssuranceTax/claim/cycle/ClaimCycleHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/document/ClaimDocumentLineClaimCycleLogicService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/report/ClaimCycleBankReportLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/report/ClaimCyclePVDetailsReportLineCustomIntegrationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/sample/GenerateClaimSamplesService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/review/ClaimEmailNotificationForReviewProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/auditAssuranceTax/claim/cycle/report/ClaimCycleBankReportLineUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/aat/claim/ClaimCycleCutoffDateProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/aat/claim/ClaimCycleProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/claim/cycle/ClaimCycleHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/claim/ClaimDocumentLineController.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/ClaimCycleHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/document/ClaimDocumentLineClaimCycleLogicService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/cycle/report/ClaimCycleBankReportLineService.java
    - gh:bigledger/blg-applet-wavelet-claim-cycle-applet#1
    - gh:bigledger/blg-wiki#45
tags:
- claim-management
- approval-workflow
- financial-processing
- sampling-analysis
- reporting-tools
weight: 160
---

## Overview

The Claim Cycle Applet is the finance side of employee claims. Once supervisors have approved a claim line in the [Claim Applet](/applets/claims/claim-applet/), the line waits in status `PENDING_DOC_REVIEW` until a **claim cycle** — one company, one month — collects it. In the cycle, finance reviewers accept lines level by level or put them on hold, auditors draw samples and record check results, and the applet produces the reports payment is made from: the Bank Report (one payment per employee, with bank code and account number), the PV Details Report (per claim line with GL code and tax), the Cross-Billing Report (claims charged to another company or branch), the Pivot Report and the Professional Subscription Report. Closing the cycle moves whatever is still unreviewed into next month's cycle.

Cycles are normally created by a scheduled job from the company's *Claim Cut-Off Logic* (configured in the Claim Applet); the *Create* button exists for manual cycles and can be hidden. The applet posts no journal and creates no payment voucher: the Bank Report and the salary-payment CSV are the hand-off to the bank portal, payroll or the [Payment Voucher](/applets/finance/internal-payment-voucher-applet/), and an external integration can poll closed cycles (`xtn_syncing_status`).

## Where it fits

| Direction | Applet / data | Why it matters |
|---|---|---|
| Upstream | [Claim Applet](/applets/claims/claim-applet/) | Supplies the lines (`bl_aat_claim_document_line` with `claim_status = PENDING_DOC_REVIEW`), the *Claim Cut-Off Logic* that creates cycles, and the claim items' *Payment Processing Option* (`FINANCE_PAYMENT` lines come here; `SALARY_PAYMENT` lines are approved for payroll). |
| Upstream | [Employee Applet](/applets/master-data/employee-applet/) | Reviewers are employees; the Bank Report reads each employee's bank code and account number from `bl_fi_mst_entity_payment_method`. |
| Upstream | [Organisation Applet](/applets/master-data/organisation-applet/) | One cycle per company; company holidays shape the cut-off dates; fiscal year / period rows are created on demand for the cycle month. |
| Downstream | Bank portal / payroll | Bank Report lines (`bl_aat_claim_cycle_bank_report_line`) and the salary-payment CSV export. |
| Downstream | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), [Cashbook Applet](/applets/master-data/cashbook-applet/) | The PV Details Report is the working paper for the manual payment voucher; `bl_aat_claim_cycle_payment_line` carries a `payment_voucher_hdr_guid` for the link, but nothing in the claim domain creates the voucher. |
| Downstream | External ETL | `PUT …/custom-integration/update-xtn-syncing-status/etl-ep` lets an integration mark a closed cycle `SYNCING` / `FINISHED_SYNC` / `FAILED_SYNC` after reading its PV details. |

Module: [Claims Management](/modules-v2/claims/).

## Screens and menus

Route root: `applet/tnt/wavelet/erp/aat-claim-cycle`.

| Menu item | Route | What it shows |
|---|---|---|
| Claim Cycle | `claim-cycles-listing` | `OPEN` cycles. *Create* opens the manual-cycle form; grid / list toggle. |
| Pivot Report | `pivot-report` | Pivot lines across cycles (company, branch, employee, claim item, amount). |
| Pv Details Report | `pv-details-report` | PV detail lines across cycles (multi-company history report). |
| Sampling Analysis Report | `sampling-analysis-report` | Sampling results across cycles with search criteria and summary tiles. |
| Payroll Payment Report | `payroll-payment-report` | `SALARY_PAYMENT` lines to hand to payroll. |
| Claim Cycle History | `claim-cycles-history-listing` | `CLOSED` cycles, read-only, with the same tabs. |

**Cycle edit** (`claim-cycle-edit`) tabs: *Main Details* · *Claim Lines* (every line in the cycle, duplicate-receipt view, approval and reviewer history, receipt images) · *Checking Reports* with sub-tabs *Inbox*, *Approved*, *On Hold* (the reviewer's work queue; *Approve* and *On Hold* buttons, single or mass) · *Payroll Payment* (hidden by a personal setting) · *Sampling* (*Create a sample*, sample listings, link view) · *Sampling Analysis Report* · *Bank Report* · *PV Details Report* · *Cross-Billing Report* · *Pivot Report* · *Prof Subscription Report*. Bank and PV Details tabs have a *Reviewed By Level* filter.

**Settings → System Configuration**: Application Settings (`application-settings`), Reviewer Setting (`reviewer-setting`, per company). Also routed: `default-selection`, `field-settings` (the *shared* `FieldConfigurationComponent`, not in the menu), Webhook, Feature Visibility, Permission Wizard / Set / User / Team / Role, Applet Log.

**Personalization**: Default Selection (`personal-default-selection`), Sidebar.

No screenshots are embedded: every capture under `static/images/claim-cycle-applet/` shows a real tenant's cycle listing in the side panel.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| A *Claim Cut-Off Logic* row for each company | Claim Applet → *Settings → Claim Cut-Off Logic* | `ClaimCycleCutoffDateProcessor` creates the month's cycle from it (`getOrCreateClaimCycleHdrUsingCycleCutoffDate`); with no row, nothing arrives unless you create cycles by hand and lines are still only swept in by the processor. |
| At least one reviewer per company, and exactly one level flagged *Is Final Approval Level* | *Settings → Reviewer Setting* | Accept / On Hold throws `User is yet to be configured to review claim lines under company: …`; closing throws `You are not a finance reviewer in Reviewer Setting` or `You are not final review level in Reviewer Setting`. |
| Employees have a payment method with bank and account number | [Employee Applet](/applets/master-data/employee-applet/) | The Bank Report SQL joins `bl_fi_mst_entity_payment_method` on the employee; lines without it have no bank code / account number. |
| Claim items carry the expense GL code | Claim Applet → *Settings → Claim Items* | PV Details and Cross-Billing report `gl_code` / `gl_name` from the line. |
| Company holiday events (optional) | Calendar events of the company | Working-day arithmetic for approval and extension cut-offs. |

### Applet settings

Settings live in three places. The `settings/field-settings` route points at the **shared** `FieldConfigurationComponent`, but the menu does not link it and the applet reads none of the document-template keys in `applet-settings.model.ts` (`HIDE_UNIT_PRICE_*`, custom statuses, `ENABLE_SST`, …) — they are model-only.

1. **Application Settings** (`settings/application-settings`, applet-local `ApplicationSettingsComponent`, saved tenant-wide via `saveMasterSettingsInit`; anyone with the Settings menu can change them):

| Setting | What it controls | Default (UI patch) | Effect when changed |
|---|---|---|---|
| `HIDE_TOGGLE_BUTTON` | Hides the grid / list toggle on the Claim Cycle listing. | unset (off) | Listing stays in the default view. |
| `HIDE_CLAIM_CYCLE_CREATION_BUTTON` | Hides the *Create* button on the Claim Cycle listing. | unset (off) | Cycles come only from the cut-off processor; no manual cycles. |
| `RELABEL_COMPANY_TO_ENTITY` | Replaces *Company* with *Entity* in 26 listing / report components. | unset (off) | Cosmetic. |
| `RELABEL_BRANCH_TO_JOB_GROUP` | Replaces *Branch* with *Job Group* in 27 components. | unset (off) | Cosmetic. |

Rendered and persisted but **not read** anywhere in this applet or `blg-shared-utilities`: `ENABLE_AUDIT_TRAIL` (the *Applet Log* screen works regardless).

2. **Default Selection** (`settings/default-selection`, master): `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`. Read only as the pre-selected company on the cycle create form; the route is not in the menu.

3. **Personalization → Default Selection** (per user, `savePersonalSettingsInit`):

| Setting | What it controls | Default | Read by |
|---|---|---|---|
| `DEFAULT_PAYMENT_PROCESSING_OPTION` | Multi-select of `FINANCE_PAYMENT` / `SALARY_PAYMENT`; filters every listing and report in the applet to lines with those options. | `[]` — treated as `["FINANCE_PAYMENT"]` when empty or unset (`claim-cycle-listing.component.ts` L119–L125, `inbox-listing.component.ts` L217–L224) | 27 components (listings, inbox / approved / on-hold, all report tabs, history) |
| `HIDE_PAYMENT_SALARY_TAB` | Hides the *Payroll Payment* tab on cycle edit and history view. | unset (off) | `claim-cycle-edit.component.ts` L124–L128 |
| `DEFAULT_BRANCH` / `DEFAULT_LOCATION` / `DEFAULT_COMPANY` | Personal overrides of the master defaults. | null | cycle create |

Because `DEFAULT_PAYMENT_PROCESSING_OPTION` is **personal**, two finance users can see different totals for the same cycle.

**Reviewer Setting** (`bl_aat_claim_cycle_review_setting`, one row per employee per company): Employee Name, Email, Approval Level, *Is Final Approval Level*. Rules enforced by `ClaimDocumentLineClaimCycleLogicService`: a reviewer can act only on lines whose `latest_reviewed_level` is below their level; a line becomes `APPROVED` when the highest configured level accepts it; only a final-level reviewer can close the cycle.

### Document behaviour settings

The cycle has no status-flow, posting or printable toggles. Its dates are set by the company's *Claim Cut-Off Logic* (`DateSetupLogic`: `LAST_DAY_OF_THE_MONTH`, `SPECIFIC_DAY_OF_THE_MONTH`, `HOW_MANY_DAYS_BEFORE_FINANCE_CUTOFF_DATE`, `HOW_MANY_DAYS_AFTER_FINANCE_CUTOFF_DATE`) when the processor creates it, and can be edited on *Main Details* afterwards. `auto_add_approved_claim_to_cycle` on the cut-off row switches between immediate ingestion at final approval and the periodic sweep (no UI control for it — see the Claim Applet page).

### Feature visibility / permissions

- `bl_applet_client_side_perm_dfn` holds **0** definitions for `ClaimCycleApplet`; the client-side permission route is commented out; the code reads no `SHOW_*` codes.
- All screens use `…/backoffice-ep` endpoints (`ClaimCycleHdrController`, `ClaimCycleCheckingSampleHdrController`, `ClaimCycleCheckingSampleLinkController`, `ClaimCyclePaymentLineController`, review and report controllers). Access is by API permission sets through the shared Permission Wizard; who may *act* on a line is decided by *Reviewer Setting*, not by permissions.

## Fields

### Cycle — create

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company | `comp_guid` | yes | One cycle per company per month (`cycle_month`, `cycle_year`). |
| Code, Name | `code`, `name` | yes | Processor-created cycles are named from the cut-off row. |
| Opening Date, Closing Date | `start_date`, `end_date` | yes | The claim period. |
| Planned Crediting Date, Actual Crediting Date | `planned_credit_date`, `actual_credit_date` | no | Used as `credit_date` on Bank Report lines. |
| Cycle Opening Balance, Grand Total | display | auto | `total_amount` is recomputed from the lines on close. |

### Cycle — Main Details (edit)

Adds: Status (`process_status` `OPEN` / `CLOSED`), Supervisor Approval Start / End Date (`approval_cutoff_start_date` / `_end_date` — lines whose final approval falls after the end date wait for the next cycle), Finance Cut-off Date (`finance_review_start_date`), Extension End Date (`extension_cutoff_end_date`), audit fields. Backend-only: `finance_review_end_date`, `fiscal_year` / `fiscal_period` (created if missing), report totals (`bank_report_total_amount`, `cross_billing_report_total_amount`, `pv_details_report_total_amount`, `pivot_report_total_amount`), `total_claim_document_line_on_loading`, `xtn_payment_voucher_reference_no`, `xtn_syncing_status`.

### Sample — create (Sampling tab)

| Field | Meaning | Notes |
|---|---|---|
| Name | `bl_aat_claim_cycle_checking_sample_hdr.name` | |
| Source | this cycle's lines, or `PREVIOUS_SAMPLES` (pick a previous sample header) | `prev_sample_hdr_guid` |
| Exclude Previous Samples | `exclude_previous_samples` | Skip lines already sampled. |
| Size | `sample_size` | `0` selects all matching lines. |
| Type | `RANDOM_EMPLOYEES` (with *Number of Employees*) or `AMOUNT_RANGE` (with *Min / Max Amount*) | `GenerateClaimSamplesService` L138. |
| Claim Type, Claim Status, Claim Categories, Claim Items, Finance Checking Date From / To, Flagged Claims Only | filters (`claim_types`, `claim_statuses`, `claim_item_categories`, `claim_item_guids`, `finance_checking_date_*`, `is_flag`) | Flags come from the Claim Applet's risk-score job. |

Each sampled line is a `bl_aat_claim_cycle_checking_sample_link` with `sampling_level`, `check_results` (`PASS` / `FAIL`), remarks and checker; accepting or holding a sampled line also updates the link (`checkSampleLinkFinanceAccept`, `checkSampleLinkPutOnHold`).

## Lifecycle and effects

**Cycle statuses** (`CycleProcessStatus`): `OPEN` → `CLOSED`. There is no draft or in-review status on the header; "in review" is a property of the lines.

**Creation**: `ClaimCycleCutoffDateProcessor` (queue event, scheduled per tenant) reads every cut-off row, computes the finance cut-off, finance last-review, approval cut-off and extension dates in company time zone skipping company holiday events, creates missing fiscal year / period rows, and creates the month's cycle with `process_status = OPEN` if none exists (`ClaimCycleCutoffDateProcessorService` L47–L98, L234–L275). It also installs the daily approval-reminder crontab. Manual creation posts the same header.

**Lines entering the cycle**: `ClaimCycleProcessor` selects the company's `PENDING_DOC_REVIEW` lines with no cycle whose `date_final_approval` ≤ `approval_cutoff_end_date` and no withdrawal date, and stamps `claim_cycle_guid` and `date_added_to_claim_cycle` (L82–L114). With `auto_add_approved_claim_to_cycle` on, the Claim Applet's approval processor attaches the line to the current `OPEN` cycle immediately instead. A line moved from an earlier cycle keeps `previous_claim_cycle_guid`.

**Finance review** (`ClaimDocumentLineClaimCycleLogicService.financeAcceptClaimDocLines`): the reviewer's setting for the line's company is loaded; lines already reviewed by someone else fail with `Claim Document Line is reviewed by another reviewer …`; acceptance sets `finance_checking_status = REVIEWED`, `latest_reviewed_level`, reviewer name and a `bl_aat_claim_cycle_review_history` row; when the reviewer's level equals the highest configured level the line becomes `claim_status = APPROVED` with `final_approval_ready_to_pay`. A reviewer whose level is not above the line's `latest_reviewed_level` gets an `ERROR_TO_SHOW_IN_UI` rejection (L117). **On Hold** (`putOnHoldClaimDocLines`): same level rule; sets `claim_status = ON_HOLD`, `is_on_hold`, `date_on_hold`, remarks, history and an audit-trail row (`ON_HOLD_CLAIM_LINE` / `MASS_ON_HOLD_CLAIM_LINE`); the daily review-notification job (`0 1 * * *` UTC, i.e. 9 am Malaysia) e-mails the claimant using template `CLAIM_REVIEW_NOTIFICATION`. The claimant resubmits from the Claim Applet (`RESUBMITTED`), which returns the line to the Inbox. Every line change recomputes the claim header status.

**Reports**: each *Generate* runs a UOW query over the cycle's lines and stores the result: Bank Report aggregates approved `FINANCE_PAYMENT` lines per employee, joins bank code / name / account number from the employee's payment method (`ClaimCycleBankReportLineUow` L54–L142), throws `There is no claim data.` when empty and writes `bank_report_total_amount` on the header; PV Details writes one row per line with company, branch, claim item, `gl_code`, tax and amount (`bl_aat_claim_cycle_pv_details_report_line`); Cross-Billing lists lines whose billing branch differs (`bl_aat_claim_cycle_cross_billing_report_line`); Pivot and Professional Subscription similarly. *Reviewed By Level* filters Bank and PV reports to lines reviewed at that level (`getBankReportWithLatestReviewLevel`). The salary-payment CSV is `GET …/cycle-reports/salary-payment/export/csv/backoffice-ep` on the claim-line controller.

**Close** (`ClaimCycleHdrController.update` → `ClaimCycleHdrService.updateAndCloseClaimCycle` when the saved status is `CLOSED`): the caller must hold a final-level *Reviewer Setting* for the company (two `ERROR_TO_SHOW_IN_UI` throws at L43 and L58); the DCO sets `xtn_syncing_status = READY_TO_SYNC`, `date_txn` and recomputes `total_amount` (`ClaimCycleHdrDataConsistencyObject` L296–L300); then `ClaimCycleHdrCLOSEDCycleHelper` gets or creates next month's cycle and moves every `PENDING_DOC_REVIEW` line of the company that is not `final_approval_ready_to_pay` into it, recording `previous_claim_cycle_guid`. The UI asks for confirmation (`Are you sure you want to Update/Close the claim cycle?`); a tenant-specific variant instead demands a payment-voucher reference number (`xtn_payment_voucher_reference_no`) and the controller rejects the close without it for that tenant only (`ClaimCycleHdrController` L104–L110). A closed cycle appears under *Claim Cycle History*; there is no reopen action in the UI.

**Posting proof block**: not a generic financial document — no `*DataConsistencyObject` signums, no `JournalPostingTypeHandler` entry, no stock processor, no VOID. Nothing in the claim domain writes a payment voucher or journal (checked at commit `871dbf5c96`); `bl_aat_claim_cycle_payment_line.payment_voucher_hdr_guid` is a link column populated only if an integration or manual process sets it.

## Related applets

- [Claim Applet](/applets/claims/claim-applet/) — the source of every line, and home of the Cut-Off Logic that creates cycles.
- [Employee Applet](/applets/master-data/employee-applet/) — reviewers, and the bank details the Bank Report needs.
- [Organisation Applet](/applets/master-data/organisation-applet/) — one cycle per company; holidays and fiscal periods.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — where the payment is actually recorded, from the PV Details Report.
- [Cashbook Applet](/applets/master-data/cashbook-applet/) — the bank the reimbursement leaves from.

## Troubleshooting

| Symptom (message shown in the UI) | Cause | Fix |
|---|---|---|
| `User is yet to be configured to review claim lines under company: …` on Approve / On Hold | No *Reviewer Setting* row for you in that company. | *Settings → Reviewer Setting* → company → add reviewer with a level. |
| `You are not a finance reviewer in Reviewer Setting` / `You are not final review level … not allowed to close claim cycle` on Save with status `CLOSED` | Closing needs a final-level reviewer. | Tick *Is Final Approval Level* on the right reviewer. |
| `Claim Document Line is reviewed by another reviewer. Kindly refresh your browser …` | Two reviewers acted on the same line. | Refresh; the line is already handled. |
| Approve does nothing for some lines, error names an approval level | Your level is not above the line's `latest_reviewed_level`. | A higher-level reviewer must act. |
| `There is no claim data.` on Bank Report | No `APPROVED` lines match the payment-processing filter and review level. | Check `DEFAULT_PAYMENT_PROCESSING_OPTION` in your personal settings and the *Reviewed By Level* filter. |
| Bank Report line has empty bank code / account number | Employee has no payment method with bank details. | Employee Applet → payment method. |
| Cycle totals differ between two users | `DEFAULT_PAYMENT_PROCESSING_OPTION` is personal. | Align personal settings. |
| Approved lines never appear in the Inbox | No cut-off row for the company (no cycle), or `date_final_approval` after the approval cut-off end date, or the line is `SALARY_PAYMENT` (goes to Payroll Payment instead). | Create the cut-off row; wait for the next cycle; check the item's payment option. |
| *Create* button missing on the cycle listing | `HIDE_CLAIM_CYCLE_CREATION_BUTTON`. | Application Settings. |
| *Payroll Payment* tab missing | `HIDE_PAYMENT_SALARY_TAB` in your personal Default Selection. | Personalization. |
| *Enable Audit Trail* has no effect | Key saved but never read. | Use *Settings → Applet Log*. |
| Closed cycle stays `READY_TO_SYNC` | No external integration has called the ETL endpoint. | Expected unless an integration is configured. |

## Related documentation

- [Claims Management module](/modules-v2/claims/)
- [Claim Applet](/applets/claims/claim-applet/)
- [Financial Accounting module](/modules-v2/financial-accounting/)
