---
topic: claim-cycle-applet
aliases: [claim cycle, finance claim review, claim sampling, claim bank report, claim PV details]
applets: [ClaimCycleApplet]
modules: [claims, hr-payroll, financial-accounting]
related: [claim-applet, employee-applet, organisation-applet, internal-payment-voucher-applet, cashbook-applet]
wiki:
  - content/en/applets/claims/claim-cycle-applet.md
status: growing
updated: 2026-09-05
---

# Claim Cycle Applet

Finance side of employee claims: one cycle per company per month collects supervisor-approved lines (`PENDING_DOC_REVIEW`), reviewers accept or hold them level by level, auditors sample them, and the Bank / PV Details / Cross-Billing / Pivot reports are generated for payment. Closing a cycle rolls unreviewed lines into next month's cycle.

## Facts

- 2026-09-05 — Registry: code `ClaimCycleApplet`, "Claim Cycle Applet", TNT-ADMIN, ACTIVE; doc URL matches the page. Zero client-side permission definitions. [src:planning/private/registry-applets-2026-09-05.tsv] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Application Settings = applet-local component with 5 toggles; only `HIDE_TOGGLE_BUTTON`, `HIDE_CLAIM_CYCLE_CREATION_BUTTON`, `RELABEL_COMPANY_TO_ENTITY`, `RELABEL_BRANCH_TO_JOB_GROUP` are consumed; `ENABLE_AUDIT_TRAIL` is not read. `settings/field-settings` routes to the shared FieldConfigurationComponent but is not in the menu and no shared key is read. [src:blg-applet-wavelet-claim-cycle-applet/…/application-settings.component.{html,ts}] [src:…/app.routing.ts]
- 2026-09-05 — `DEFAULT_PAYMENT_PROCESSING_OPTION` (multi-select) and `HIDE_PAYMENT_SALARY_TAB` are **personal** settings; empty/unset option is treated as `["FINANCE_PAYMENT"]` in 27 components, so two users can see different totals. [src:…/personal-default-settings.component.ts] [src:…/claim-cycle-listing.component.ts L119–L125]
- 2026-09-05 — Cycle statuses are only `OPEN` / `CLOSED`; the old page's Draft / In Review statuses and "auto-close settings" do not exist. [src:blg-akaun-platform-java/client-sdk/…/cycle/CycleProcessStatus.java]
- 2026-09-05 — Cycles are created by `ClaimCycleCutoffDateProcessor` from the company's cut-off row (working days, company holidays, fiscal period auto-created); manual Create posts the same header. [src:…/ClaimCycleCutoffDateProcessorService.java L47–L98]
- 2026-09-05 — Reviewer Setting (employee, level, is_final_approval_level) gates accept / on-hold (`User is yet to be configured to review …`, level must exceed the line's `latest_reviewed_level`) and close (`You are not final review level …`). Accept at the top level → line `APPROVED` + `final_approval_ready_to_pay`. [src:…/ClaimDocumentLineClaimCycleLogicService.java] [src:…/ClaimCycleHdrService.java L43, L58]
- 2026-09-05 — Close: DCO sets `xtn_syncing_status = READY_TO_SYNC`, recomputes `total_amount`; helper moves the company's `PENDING_DOC_REVIEW` lines not ready-to-pay into next month's cycle (created if missing). No reopen in the UI. A tenant-specific controller guard requires `xtn_payment_voucher_reference_no` for one tenant. [src:…/ClaimCycleHdrDataConsistencyObject.java L296] [src:…/ClaimCycleHdrCLOSEDCycleHelper.java] [src:…/ClaimCycleHdrController.java L104–L116]
- 2026-09-05 — Bank Report joins `bl_fi_mst_entity_payment_method` for bank code / account number; throws `There is no claim data.` when empty; writes `bank_report_total_amount`. Salary-payment CSV: `GET …/cycle-reports/salary-payment/export/csv/backoffice-ep`. [src:…/ClaimCycleBankReportLineUow.java L54–L142] [src:…/ClaimCycleBankReportLineService.java L30] [src:…/ClaimDocumentLineController.java L982]
- 2026-09-05 — No payment voucher or journal is created by the claim domain; `bl_aat_claim_cycle_payment_line.payment_voucher_hdr_guid` is a link column only. ETL endpoint `PUT …/custom-integration/update-xtn-syncing-status/etl-ep`. [src:grep PaymentVoucher over domain/erp/auditAssuranceTax/claim] [src:…/ClaimCycleHdrController.java L259]
- 2026-09-05 — Sampling: type `RANDOM_EMPLOYEES` or `AMOUNT_RANGE`, source cycle lines or `PREVIOUS_SAMPLES`, `sample_size = 0` = all; links carry `check_results PASS/FAIL`. [src:…/samples-create.component.{html,ts}] [src:…/GenerateClaimSamplesService.java L138] [src:…/bl_aat_claim_cycle_checking_sample_link.java]
- 2026-09-05 — Review notification cron `0 1 * * *` (9 am MYT) e-mails claimants of on-hold lines via template `CLAIM_REVIEW_NOTIFICATION` (AWS SES). [src:…/ClaimEmailNotificationForReviewProcessorService.java L41–L129]

## How it connects

- **claim-applet** — source of lines and of the cut-off logic; resubmission after on-hold happens there.
- **employee-applet** — reviewers; bank details for the Bank Report.
- **organisation-applet** — one cycle per company; holidays and fiscal periods.
- **internal-payment-voucher-applet** — the PV Details Report is the working paper; the voucher is manual.
- **cashbook-applet** — bank the reimbursement leaves from.

## Open questions

- Should `payment_voucher_hdr_guid` on the payment line be populated by an integration, or is a PV auto-creation planned? (Product.)

## Wiki impact

- `finance/internal-payment-voucher-applet`: mention that claim reimbursement PVs are keyed manually from the Claim Cycle PV Details Report (cross-lane request filed).
