---
topic: claim-applet
aliases: [employee expense claims, e-claim, claim submission, claim entitlement, claim approval]
applets: [claimApplet]
modules: [claims, hr-payroll]
related: [claim-cycle-applet, employee-applet, organisation-applet, chart-of-account-applet, forex-applet, ocr-cash-bill-applet]
wiki:
  - content/en/applets/claims/claim-applet.md
status: growing
updated: 2026-09-05
---

# Claim Applet

Employees submit expense claims (header + claim lines) and supervisors approve them; the applet also owns the master data — claim items, claim accounts and entitlements, approval settings, cut-off logic, travel-allowance rates, e-mail templates. Approved lines hand over to the Claim Cycle Applet for finance review and payment. Backend namespace `bl_aat_claim_*`.

## Facts

- 2026-09-05 — Registry: code `claimApplet`, name "Claim Applet", TNT-USER, ACTIVE; doc URL is the alias `/applets/claim-applet/`. Zero rows in `bl_applet_client_side_perm_dfn`. [src:planning/private/registry-applets-2026-09-05.tsv] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Settings → Application Settings is the applet's own 64-line `FieldConfigurationComponent` (not the shared one): 11 toggles, saved as master settings. Defaults: `SHOW_FOREX_DATA_SOURCE ?? true`; `MANUAL_ENTITLEMENT_ADJUSTMENT`, `ADD_EMPLOYEE`, `RELABEL_*` `?? false`; the five `HIDE_*` keys unset. [src:blg-applet-wavelet-claim-applet/…/settings-container/field-configuration/field-configuration.component.ts]
- 2026-09-05 — `ENABLE_AUDIT_TRAIL` is rendered and persisted but read by nothing in the applet or shared-utilities. [src:grep over blg-applet-wavelet-claim-applet + blg-shared-utilities]
- 2026-09-05 — `app.component.ts` L49–L53 uses `if (HIDE_CLAIM_APPROVAL_DELEGATION_PERIOD) … else if (RELABEL_BRANCH_TO_JOB_GROUP)`: with both on, the Branches menu is not renamed. [src:blg-applet-wavelet-claim-applet/…/app.component.ts]
- 2026-09-05 — Master Default Selection route exists (`settings/default-selection`) but its menu entry is commented out; personal Default Selection carries `DASHBOARD_DURATION_TYPE` (default `WITHIN_THE_PAST_NUMBER_OF_MONTHS`), `DASHBOARD_DURATION` (3), `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN`. [src:…/models/menu-items.ts] [src:…/personal-default-settings.component.ts]
- 2026-09-05 — Claim item approval workflow types: `ENGAGEMENT_PIC` (chargeable), `EMPLOYEE_AD_HOC` (designation in claimant branch), `CLAIM_ACCOUNT` (HR benefits), `EVENT`, `PROJECT_PIC`; `EMPLOYEE_ORG_CHART` retired. Payment option `SALARY_PAYMENT` vs `FINANCE_PAYMENT`. Unique on code + expense company. [src:blg-akaun-platform-java/client-sdk/…/bl_aat_claim_item_hdr.java] [src:…/TntErpErrorCodesConstantsV2.java]
- 2026-09-05 — Submit: header `SUBMITTED` + running number; lines `PENDING_APPROVAL`; non-reimbursable lines `APPROVED` immediately; a hard-coded job title (L165) goes straight to `PENDING_DOC_REVIEW`. Then DCO checks (balance, claimable period, receipt validity, approval-setting completeness) throw `ERROR_TO_SHOW_IN_UI` before queueing. [src:blg-akaun-platform-java/javasdk/…/ClaimDocLineProcessorRelatedService.java] [src:…/claimDocumentLineDCO/*.java]
- 2026-09-05 — Final supervisor approval: `SALARY_PAYMENT` → `APPROVED`, else → `PENDING_DOC_REVIEW` (Helper L118–L126); posts `UTILIZE` (and `CONVERSION`) claim-account txn lines; with cut-off `auto_add_approved_claim_to_cycle` the line joins the current OPEN cycle immediately, else `ClaimCycleProcessor` sweeps lines with `date_final_approval ≤ approval_cutoff_end_date`. [src:…/jobProcessor/aat/claim/approval/ClaimDocApprovedApprovalRequestProcessorHelper.java] [src:…/ClaimDocApprovedApprovalRequestProcessorTxnLineUpdateCtrlAccAndBalanceProcessorHelper.java] [src:…/ClaimDocumentLineImmediateIngestService.java] [src:…/ClaimCycleProcessor.java]
- 2026-09-05 — `auto_add_approved_claim_to_cycle` has no control on the Cut-Off Logic form (commit 560488f2). [src:…/claim-cut-off-container/claim-cut-off-create/claim-cut-off-create.component.html]
- 2026-09-05 — No journal, no payment voucher: header `posting_status_to_*` / `fk_*` columns exist but no code sets them (commit 871dbf5c96). [src:grep setPosting_status_to_payment_voucher over javasdk+akaun-api]
- 2026-09-05 — Receipt OCR is AWS Textract `AnalyzeExpense` (`HROcrTextractAnalysisService`); risk-score job flags `attachment_reuploaded`, `receipt_date_amended`, `claim_amount_amended`, `receipt_number_amended`. TEMP claims purged after 30 days. [src:…/HROcrTextractAnalysisService.java] [src:…/ClaimDocLineRiskScoreCalculationProcessor.java] [src:…/ClaimSchedulerToAutoPurgeTempsProcessor.java]
- 2026-09-05 — E-mail template codes: `CLAIM_PENDING_APPROVAL_NOTIFICATION`, `CLAIM_PENDING_APPROVAL_DAILY_REMINDER_TO_APPROVER_NOTIFICATION`, `CLAIM_REVIEW_NOTIFICATION`; crontab created by the cut-off processor. [src:…/ClaimEmailNotificationForApprovalProcessorService.java] [src:…/ClaimCycleCutoffDateProcessor.java]
- 2026-09-05 — Applet UI has tenant-code branches (welcome toast, close-cycle reference dialog) for one customer; documented generically. [src:…/app.component.ts]

## How it connects

- **claim-cycle-applet** — receives every `PENDING_DOC_REVIEW` line; the cut-off logic configured here creates its cycles.
- **employee-applet** — claimant resolved from login e-mail (`Cannot find your email … from Employee Applet`); designations and job titles drive approver lookup; bank details for the cycle's Bank Report.
- **organisation-applet** — companies and branches; the Branches settings screen here adds ranking / designation tabs.
- **chart-of-account-applet** — expense / billing GL codes on claim items, carried for the PV Details report only.
- **forex-applet** — rate source for foreign-currency lines (`SHOW_FOREX_DATA_SOURCE`).
- **ocr-cash-bill-applet** — unrelated OCR (membership); listed to avoid confusion.

## Open questions

- Should the "Group Managing Partner" auto-approval and the tenant-code branches be made configurable? (Product.)
- Is `auto_add_approved_claim_to_cycle` meant to get a UI control?

## Wiki impact

- Claims module page says "Claim Cycle Applet defines approval routing matrices" — approval settings live in the Claim Applet; cycle only reviews. Suggest correcting `content/en/modules/claims/_index.md`.
