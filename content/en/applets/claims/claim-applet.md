---
title: "Claim Applet"
description: "Employee expense-claim submission, entitlement tracking and supervisor approval — the claimant and supervisor side of the claims process, feeding the Claim Cycle Applet for finance review and payment."
applet_code: "claimApplet"
applet_repo: "blg-applet-wavelet-claim-applet"
modules: [claims, hr-payroll]
related_applets: [claim-cycle-applet, employee-applet, organisation-applet, chart-of-account-applet, forex-applet, ocr-cash-bill-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/app.routing.ts
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/app.component.ts
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/settings-container/claim-item-container/claim-item-create/claim-item-create.component.html
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/settings-container/claim-approval-setting-container/claim-approval-setting-create/claim-approval-setting-create.component.html
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/settings-container/claim-cut-off-container/claim-cut-off-create/claim-cut-off-create.component.html
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/bl_aat_claim_item_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/approval/bl_aat_claim_approval_setting.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/cycle/bl_aat_claim_cycle_cutoff_date.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntHrPermissions.java
  fields:
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/my-claim-container/my-claim-create/my-claim-create.component.html
    - blg-applet-wavelet-claim-applet/micro-fe/projects/wavelet-erp/applets/claim-applet/src/app/components/my-claim-container/my-claim-edit/claim-line/claim-line-create/claim-line-create.component.html
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/bl_aat_claim_document_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/bl_aat_claim_document_line.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/account/bl_aat_claim_account_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/bl_aat_claim_account_entitlement_hdr.java
  lifecycle:
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/document/ClaimLineStatus.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/ClaimSharedPostingStatus.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/account/ClaimAccountTxnType.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/ClaimDocLineProcessorRelatedService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/document/ClaimDocumentLineImmediateIngestService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/document/ClaimDocumentLineClaimCycleLogicService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/aat/claim/approval/ClaimDocApprovedApprovalRequestProcessorHelper.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/aat/claim/approval/ClaimDocApprovedApprovalRequestProcessorTxnLineUpdateCtrlAccAndBalanceProcessorHelper.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/aat/claim/approval/ClaimApprovalDelegationPeriodHelper.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/aat/claim/ClaimCycleProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/aat/claim/ClaimDocLineRiskScoreCalculationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/aat/claim/ClaimSchedulerToAutoPurgeTempsProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/hr/claim/ocr/HROcrTextractAnalysisService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/claim/ClaimDocumentLineController.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/claim/ClaimDocumentLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/auditAssuranceTax/claim/claimDocumentLineDCO/ClaimDocumentLineSubmissionGeneralCheckingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/auditAssuranceTax/claim/claimDocumentLineDCO/ClaimDocumentSubmissionCheckingBalanceService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/auditAssuranceTax/claim/claimDocumentLineDCO/ClaimDocumentLineEngagementPICDCO.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/auditAssuranceTax/claim/claimDocumentLineDCO/ClaimDocumentLineEmployeeAdHocDCO.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/auditAssuranceTax/claim/claimDocumentLineDCO/ClaimDocumentLineClaimAccountDCO.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/TntErpErrorCodesConstantsV2.java
    - gh:bigledger/blg-applet-wavelet-claim-applet#1
    - gh:bigledger/blg-wiki#44
tags:
- claim-management
- expense-reimbursement
- approval-workflow
- entitlement-tracking
- financial-control
weight: 160
aliases:
- /applets/claim-applet/
---

## Overview

The Claim Applet is where employees submit out-of-pocket expense claims and where their supervisors approve or reject them. A claim is a header (title, claimant, cost-centre branch) with one or more **claim lines**; each line names a **claim item** (the expense type), an amount, dates, receipts and — depending on the item — an engagement, an event, a travel destination or a professional body. The applet also owns all the master data that drives the process: claim items and categories, **claim accounts** and **entitlements** (annual or monthly allowances per employee), approval settings, cut-off logic, travel-allowance rates and notification e-mail templates.

The applet stops at *supervisor approval*. Finance review, sampling, on-hold handling and the bank / payment-voucher reports happen in the [Claim Cycle Applet](/applets/claims/claim-cycle-applet/), which picks up approved lines month by month. The backend tables all live in the `bl_aat_claim_*` namespace (AAT = audit, assurance and tax, the practice area the module was built for).

## Where it fits

| Direction | Applet / data | Why it matters |
|---|---|---|
| Upstream | [Employee Applet](/applets/master-data/employee-applet/) | A claimant is resolved from the login e-mail to an employee record. Without the link the applet refuses to load claims (`Cannot find your email … from Employee Applet`). Job titles, designations and branch links drive approver lookup. |
| Upstream | [Organisation Applet](/applets/master-data/organisation-applet/) | Companies and branches. The *Branches* settings screen in this applet is a view of those branches with claim-specific tabs (employee ranking, approval designation). |
| Upstream | [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) | Expense and billing GL codes selected on each claim item (`expense_txn_glcode`, `billing_txn_glcode`). They are carried on the line for reporting; this applet posts no journal. |
| Upstream | [Forex Applet](/applets/master-data/forex-applet/) | Foreign-currency claim lines reference a forex data source (`forex_source_hdr_guid`) when *Show Forex Data source* is on. |
| Upstream | Calendar (company holiday events) | Cut-off dates are computed in working days, skipping company holiday events (`ClaimCycleCutoffDateProcessorService`). |
| Downstream | [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) | Approved lines (`PENDING_DOC_REVIEW`) are swept into the month's claim cycle for finance review, on-hold, sampling and the Bank / PV Details / Cross-Billing reports. |
| Side | AWS Textract (OCR) | Claim items flagged *Required Supporting Document Using OCR Attachment* send the receipt to Textract's expense analysis; the extracted fields feed the risk-score processor. Unrelated to the [OCR Cash Bill Applet](/applets/membership/ocr-cash-bill-applet/), which is a membership feature. |

Module: [Claims Management](/modules-v2/claims/).

## Screens and menus

Route root: `applet/tnt/wavelet/erp/aat-claim`. Sidebar (`models/menu-items.ts`):

| Group | Menu item | Route | What it shows |
|---|---|---|---|
| Claimant | My Claim | `my-claims` | The signed-in employee's claims (login-entity endpoints). Grid/list toggle, status summary cards, dashboard window from personal settings. |
| Claimant | Line Reports | `line-reports` | Every claim line of the claimant, one row per expense, with approval-sequence and history sub-views. |
| Claimant | Engagement Report | `engagement-report` | Chargeable lines grouped by engagement (client job). |
| Supervisor | Pending Approvals | `pending-approvals` | Lines waiting for the signed-in approver, with *Approve* / *Reject* (remarks dialog), duplicate-receipt view and related-line listings. |
| Supervisor | Staff Reports | `staff-reports` | Claims of the approver's staff (login-entity primary endpoints). |
| Supervisor | Non-Reimbursable Report | `non-reimbursable-reports` | Lines ticked *Non-Reimbursable* (company already paid; auto-approved, never routed for approval). |
| Supervisor | Professional Study Scheme Report | `professional_study_scheme_report` | Professional-study claims with validity dates and forfeiture. |

{{< figure src="/images/claim-applet/pending-approvals.png" alt="Pending Approvals listing with Expand All and Approve actions" caption="Pending Approvals — the supervisor's queue (empty here)." >}}

**My Claim → create / edit.** Main Details (Claim ID, Claim Title, Claim Status, Employee Name / Code, Branch (Cost Center)) and Claim Lines. A line opens with tabs *Main*, *Approval Sequence* and *History*; the *Main* tab changes shape with the claim item (engagement fields, event picker, professional-body fields, travel location / mileage / meal deductions, receipt date and number, attachments, OCR-scanned values). Buttons: *Save*, *Submit*, *Resubmit* (after finance on-hold), *Export*. Split actions divide a line across branches (chargeable and non-chargeable split components).

**Settings → System Configuration** (`settings/…`): Application Settings (`field-settings`), Claim Accounts, Claim Entitlements, Claim Entitlement Auto Top-up Template / Events / Run, Claim Item Category, Claim Items, Professional Body, Subscriptions and Memberships, Travel Allowance, Claim Cut-Off Logic, Claim Approval Settings, Claim Approval Delegation Period Settings, Branches (shown as *Job Groups* when relabelled), Email Template, Upload Employee Entitlement, Printable Format Settings. Shared screens: Webhook, Feature Visibility, Permission Wizard / Set / User / Team / Role, Applet Log (audit trail). A `default-selection` route exists but its menu entry is commented out.

**Personalization**: Default Selection (personal), Favourite Claims, Sidebar.

{{< figure src="/images/claim-applet/claim-accounts-settings.png" alt="Claim Account listing" caption="Settings → Claim Accounts: the funding pools that entitlements draw from." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Every claimant and approver is an employee whose primary login e-mail matches the employee record | [Employee Applet](/applets/master-data/employee-applet/) | `ClaimDocumentLineService` L175/L192 throws `Cannot find your email: … from Employee Applet` otherwise. Designations (`bl_fi_mst_employee_branch_designation_link`) are how ad-hoc approvers are found. |
| Companies and branches exist; each branch that raises claims has an approval setting | [Organisation Applet](/applets/master-data/organisation-applet/), then *Settings → Branches* | The approval-sequence builder looks up approvers by branch and designation; a missing designation stops submission (`Your designation: %s is yet to be configured for branch: %s`). |
| Expense GL codes and PNS/SERVICE financial items for expense and billing | [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) | Selected on each claim item; `expense_fi_item_hdr_guid` is meant for the purchase side and `billing_fi_item_hdr_guid` for chargeable re-billing. |
| At least one Claim Approval Setting per workflow type you use, complete with level, quorum and default approver | *Settings → Claim Approval Settings* | Submission is rejected with `Approval level & quorum are yet to be configured …` / `Default approver is yet to be configured …`. |
| For HR-benefit items: a Claim Account, an Entitlement, employee links (or an entitlement upload) and the HR approval levels on the account | *Settings → Claim Accounts / Claim Entitlements / Upload Employee Entitlement* | `Claimant is not entitled to claim %s` and `HR/TIM are not fully configured for ClaimAccount …` are submission errors. |
| A Claim Cut-Off Logic row per company | *Settings → Claim Cut-Off Logic* | Without it no claim cycle is ever created, so approved lines never reach finance review. |
| Company holiday events (optional) | Calendar events of the company | Working-day arithmetic for approval / extension cut-offs excludes them. |

### Applet settings

Settings live in **four places**, none of them the shared `FieldConfigurationComponent`:

1. **Application Settings** (`settings/field-settings`) — the applet's *own* 64-line `FieldConfigurationComponent` (`components/settings-container/field-configuration/`), saved tenant-wide through `SessionActions.saveMasterSettingsInit`. Anyone with access to the applet's Settings menu can change them.
2. **Default Selection** (`settings/default-selection`) — master defaults `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`; reachable only by URL because the menu entry is commented out.
3. **Personalization → Default Selection** — per-user settings (`savePersonalSettingsInit`), merged over the master settings at runtime (`app.component.ts`: `{...master, ...personal}`).
4. **Master-data screens** (Claim Items, Accounts, Entitlements, Approval Settings, Cut-Off Logic, …) — this is where almost all real behaviour is configured; see the next sub-section.

{{< figure src="/images/claim-applet/application-settings.png" alt="Application Settings screen with hidden-field and relabel toggles" caption="Settings → Application Settings: eleven slide toggles, saved as master settings." >}}

**Application Settings** (each key: declared in `applet-settings.model.ts` or the form, rendered in `field-configuration.component.html`, persisted by `onSave()`, and read where stated):

| Setting | What it controls | Default (UI patch) | Effect when changed |
|---|---|---|---|
| `HIDE_CLAIM_CATEGORY` | Hides the *Claim Category* picker on claim-line create and edit. | unset (off) | Claimants choose the claim item directly; category filtering disappears. |
| `HIDE_TOGGLE_BUTTON` | Hides the grid / list view toggle on *My Claim* and *Line Reports*. | unset (off) | Listing stays in whatever view the code defaults to. |
| `HIDE_EMPLOYEE_RANKING` | Hides the *Employee Ranking* tab in *Settings → Branches → view*. | unset (off) | Ranking (used for approval ordering by rank) cannot be edited from the branch screen. |
| `HIDE_CLAIM_ITEM_BILLING_FIELDS` | Hides the billing company / financial item / GL / markup fields and the expense financial item on Claim Item create and edit. | unset (off) | Use for tenants that do not re-bill clients; items are saved without billing data. |
| `HIDE_CLAIM_APPROVAL_DELEGATION_PERIOD` | Removes *Claim Approval Delegation Period Settings* from the Settings menu (`app.component.removeChild`). | unset (off) | Delegations already recorded still apply in the approval processor; only the screen is hidden. |
| `SHOW_FOREX_DATA_SOURCE` | Shows the forex data-source selector on claim-line edit (single and multiple access) and on line-report edit. | **true** (`?? true`) | Off: foreign-currency lines cannot pick a rate source. |
| `MANUAL_ENTITLEMENT_ADJUSTMENT` | Enables *Adjust Amount* / *End Date* on the employee links and entitlements under Claim Accounts and Claim Entitlements. | false | On: HR can hand-adjust an employee's balance and validity (posted as an account transaction line). |
| `ADD_EMPLOYEE` | Shows the add-employee action on the *Employees* tab of Claim Accounts and Claim Entitlements. | false | Off: employees are linked only via Auto Top-up runs or the entitlement upload. |
| `RELABEL_COMPANY_TO_ENTITY` | Replaces the word *Company* with *Entity* in listings and forms (26 components). | false | Cosmetic. |
| `RELABEL_BRANCH_TO_JOB_GROUP` | Replaces *Branch* with *Job Group* and renames the *Branches* menu to *Job Groups*. | false | Cosmetic, but see the quirk below. |

Rendered and persisted but **not read** by any component in this applet or in `blg-shared-utilities`: `ENABLE_AUDIT_TRAIL`. The *Applet Log* screen (`settings/applet-log`) works regardless of the toggle.

Quirk (`app.component.ts` L49–L53): the menu logic is `if (HIDE_CLAIM_APPROVAL_DELEGATION_PERIOD) … else if (RELABEL_BRANCH_TO_JOB_GROUP) …`, so when both are on the *Branches* menu entry is **not** renamed although every other label is.

**Default Selection (master)** — `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`; choosing a branch fills company and the branch's `MAIN_LOCATION`. Read as the initial cost-centre branch on new claims.

**Personalization → Default Selection (per user)**

| Setting | What it controls | Default | Read by |
|---|---|---|---|
| `DEFAULT_BRANCH` / `DEFAULT_LOCATION` / `DEFAULT_COMPANY` | Personal override of the master defaults. | null | Claim create |
| `DASHBOARD_DURATION_TYPE` | Window of the *My Claim* and *Line Reports* dashboards (`WITHIN_THE_PAST_NUMBER_OF_MONTHS` or `NO_DATE_RANGE`). | `WITHIN_THE_PAST_NUMBER_OF_MONTHS` | `my-claim-listing`, `line-reports-listing` |
| `DASHBOARD_DURATION` | Number of months for the window; required unless the type is `NO_DATE_RANGE`. | 3 | same |
| `DEFAULT_ORIENTATION` | Tab orientation `HORIZONTAL` / `VERTICAL` on report and settings containers. | null | 92 reads across containers |
| `DEFAULT_TOGGLE_COLUMN` | `SINGLE` / `DOUBLE` column layout of the edit panels. | null | 51 reads |

Keys read at runtime **without a control** in this applet: `VERTICAL_ORIENTATION` (five containers test it alongside `DEFAULT_ORIENTATION`) and `PRINTABLE` (several settings listings read it as the pre-selected printable format; the *Printable Format Settings* screen defines formats but nothing in this applet writes the `PRINTABLE` key). The remaining keys in `applet-settings.model.ts` (`ENABLE_SST`, `ENABLE_WHT`, `HIDE_UNIT_PRICE_*`, custom-status keys, `DISABLE_GEN_DOC_LISTING`, …) are copied from the document-applet template and are neither rendered nor read.

### Master-data settings that drive behaviour

**Claim Items** (`bl_aat_claim_item_hdr`). Unique on *code + expense company*.

| Field | Meaning |
|---|---|
| Approval Workflow | `ENGAGEMENT_PIC` (chargeable — approvers come from the engagement's roles), `EMPLOYEE_AD_HOC` (non-chargeable — approvers found by designation in the claimant's branch; shown as *Adhoc*), `CLAIM_ACCOUNT` (HR benefits — approvers from the claim account's HR approval setting), `EVENT`, `PROJECT_PIC`. `EMPLOYEE_ORG_CHART` is retired. |
| Approval Setting | The `bl_aat_claim_approval_setting` row used for this item. |
| Payment Processing Option | `FINANCE_PAYMENT` (line goes to finance review in a claim cycle) or `SALARY_PAYMENT` (line is `APPROVED` at final supervisor approval and paid through payroll). |
| Required Supporting Document Using Normal Attachment / Using OCR Attachment | `require_supporting_document` / `require_ocr`; OCR disables the manual vendor-receipt fields and sends the file to Textract. |
| Required Vendor, receipt date and receipt number | `require_vendor_receipt_date_and_receipt_number`. |
| Required follow up programme, guest / attendees | `require_following_up` — entertainment details JSON. |
| Required Subscription and Membership Type / Required Professional Body | Professional subscription and study-scheme claims (membership no., type, validity dates). |
| Required Travel Allowance / Mileage Claim / Required Location Tracking | Per-diem lookup by destination, mileage × threshold, and the location picker. |
| Required Internal Employees Only | The line must list attending internal employees. |
| Custom Validity Date By HR | HR enters validity dates on the entitlement employee link (`required_custom_validity_date_hr`). |
| Claimable Period (Days), Threshold, UOM (`KM` / `DAYS`) | `max_txn_period_in_days`; cap per unit (for example RM 0.80 per km). |
| Claim Account | Mandatory when the workflow is `CLAIM_ACCOUNT`. |
| Expense company / financial item / GL code; Billing company / financial item / GL code / markup ratio | Cost-centre and re-billing references copied onto every line. |

**Claim Accounts / Entitlements / Auto Top-up.** A claim account (`code`, `name`, `ccy_code`, *Display Entitlement Balance* = `show_account_balance_in_ui`) is a pool. Entitlements (`bl_aat_claim_account_entitlement_hdr`) define the top-up (`topup_amount`, `is_recurring`, `rrule`, `calculation_logic` `BY_AMOUNT` / `BY_QUANTITY`, validity periods, `no_limit`, *Prorate for new joiners*). Employees are linked per entitlement (with balance); *Account Conversion* lets a main account draw on a convertible account when short. *HR Claim Approval* on the account lists the HR approvers per level. Auto top-up is a three-step chain: **Template** (entitlement + company / job-role filters) → **Event** (code, recurring, start / end) → **Run** (start / end; *Employee Top-up* tab with *Draft* and *Top-up* sub-tabs) which posts `TOPUP` transaction lines.

**Claim Approval Settings** (`bl_aat_claim_approval_setting`): Name, Code, Approval Workflow, Default Approver (employee), Branch, Engagement Role, and per level: Approval Level, Approval Type (`ANY_TO_APPROVE` / `ALL_TO_APPROVE`), No of Approvers (quorum), Engagement Role to Approve. `total_required_approval_level` is validated against what is actually configured. Overriding rule available: `USE_CLAIMANT_DEFAULT_BRANCH`.

**Claim Cut-Off Logic** (`bl_aat_claim_cycle_cutoff_date`, one per company): finance cut-off (`LAST_DAY_OF_THE_MONTH` or `SPECIFIC_DAY_OF_THE_MONTH` + day), supervisor approval cut-off (`HOW_MANY_DAYS_BEFORE_FINANCE_CUTOFF_DATE` + count, or a specific day), extension window (`HOW_MANY_DAYS_AFTER_FINANCE_CUTOFF_DATE` + count, or a specific day), finance last-review date. The backend column `auto_add_approved_claim_to_cycle` (read by `ClaimDocumentLineImmediateIngestService`) has **no control** on the create / edit form at commit `560488f2`.

**Claim Approval Delegation Period**: Main Employee, Delegated Employee, start / end dates. Applied by the approval processor: the sequence is marked `is_delegated_approval` with the delegating approver's name (`ClaimApprovalDelegationPeriodHelper`).

**Branches**: Main Details (Name, Code, Approval Setting, Description) plus *Employees*, *Employee Ranking* and *Approval Designation* tabs (designation → employees with approval level). This is where `EMPLOYEE_AD_HOC` approvers are resolved.

{{< figure src="/images/claim-applet/branches-settings.png" alt="Branch listing in claim settings" caption="Settings → Branches: branches synced from the organisation, with claim-specific tabs." >}}

**Travel Allowance**: Destination, Claim Item, Breakfast / Lunch / Dinner / Inconvenience, Total Amount. A travel line stores which meals were included (`does_include_*`) and deducts them from the per diem.

**Email Template**: Name, Type, start / expiry, *Line* tab (template code, message type / status, body) and *Placeholders*. The backend schedulers use template codes `CLAIM_PENDING_APPROVAL_NOTIFICATION`, `CLAIM_PENDING_APPROVAL_DAILY_REMINDER_TO_APPROVER_NOTIFICATION` and `CLAIM_REVIEW_NOTIFICATION`. The crontab `CLAIM_EMAIL_NOTIFICATION_FOR_APPROVAL_PROCESSOR` is created automatically the first time the cut-off processor runs.

{{< figure src="/images/claim-applet/email-template-settings.png" alt="Email Template listing" caption="Settings → Email Template: notification templates keyed by template code." >}}

**Claim Item Category**, **Professional Body** (name, code, country), **Subscriptions and Memberships** (name, code, type), **Upload Employee Entitlement** (file import with *Checking* tab and delimiter), **Printable Format Settings** (format code / name).

{{< figure src="/images/claim-applet/claim-item-category.png" alt="Claim Item Category listing" caption="Settings → Claim Item Category." >}}

### Document behaviour settings

No status-flow, posting or e-Invoice toggles exist: the claim is not a generic financial document. Behaviour is fixed by the claim item (payment processing option, required fields), the approval setting and the cut-off logic described above. Printables are limited to the *Printable Format Settings* list and the *Export* action.

### Feature visibility / permissions

- **Client-side permissions**: `bl_applet_client_side_perm_dfn` holds **0** definitions for `claimApplet`, and the code reads none; the route for the client-side permission screen is commented out.
- **Server-side (API) permissions** are what the Permission Wizard assigns. Constants in `TntErpPermissions`: `API_TNT_DM_ERP_AAT_CLAIM_ITEM_HDR_{OWNER,ADMIN,MEMBER,CREATE,UPDATE,DELETE,READ}`, `API_TNT_DM_ERP_AAT_CLAIM_ITEM_TRAVEL_ALLOWANCE_*`, `API_TNT_DM_ERP_AAT_CLAIM_PERSONAL_FILTER_SUBSCRIPTION_EVENT_*`; in `TntHrPermissions`: `HR_CLAIM_ACCOUNT_ENTITLEMENT_APPROVAL_SETTING_*`.
- **Role separation is by endpoint, not by toggle**: claimant screens call `…/login-entity-ep` routes (own claims only), supervisor and settings screens call `…/backoffice-ep` routes (`ClaimDocumentLineController`). Whether a user sees the *Supervisor* group is a matter of the shared *Feature Visibility* screen and the permission sets granted.

## Fields

### Claim (header) — Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Claim ID | `running_no_1`, assigned on Submit | auto | Tenant-level running number (`ClaimDocumentRunningNumberService`). |
| Claim Title | `title` | yes | Free text. |
| Claim Status | `claim_status` | auto | `TEMP` → `DRAFT` → `SUBMITTED` → `APPROVED` / `CLOSED`. |
| Employee Name / Code | Claimant entity | auto | Resolved from the login e-mail. |
| Branch (Cost Center) | `expense_cost_center_branch_guid` | yes | Defaults from Default Selection; drives approver lookup for ad-hoc items. |

### Claim line — Main

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Non-Reimbursable | `is_non_reimbursable` | no | Company already paid; line is auto-approved on Submit and never routed. |
| Cost Incurred Start / End Date | `date_claim_txn_start` / `_end` | yes | Span checked against the item's *Claimable Period (Days)*. |
| Claim Category, Claim Item | category filter + `claim_item_hdr_guid` | item yes | Category hidden by `HIDE_CLAIM_CATEGORY`. |
| Approval Workflow | copied from the item | auto | Determines which fields appear. |
| Event / Select Event | `calendar_event_hdr_guid` | for `EVENT` items | |
| Engagement, Engagement FYE, Billing Branch | `engagement_hdr_guid`, `engagement_fye_guid`, billing branch | for chargeable items | Approvers come from `bl_aat_engagement_employee_link` roles. |
| Professional Body, Professional Subscription, Membership No / Type, Validity Start / End | professional claims | per item flags | Receipt date must fall inside the validity range. |
| Follow-up Programme, Nature of Guest, external party, internal employees | entertainment details | per item flags | `attended_internal_employee_json`, `entertainment_details_json`. |
| Location, Distance (Mileage), Rate (Threshold) | travel / mileage | per item flags | Amount = mileage × threshold. |
| Breakfast / Lunch / Dinner / Inconvenience | `does_include_*` | travel allowance | Included meals are deducted. |
| Receipt Date, Receipt No, vendor | receipt details | per item flag | Pre-filled from OCR when `require_ocr`. |
| Amount (incl. / excl. tax, GST, WHT), currency, forex source | `claim_amount_*`, `foreign_ccy_*`, `forex_source_hdr_guid` | amount yes | Foreign-currency lines keep both currencies. |
| Attachments | `line_attachment_guid`, `claim_ocr_doc_hdr_guid` | per item flag | Reused attachments are flagged by the risk-score job. |

### Claim line — Approval Sequence / History

Read-only: one row per approval level (`bl_aat_claim_document_approval_sequence`) with approver, delegated-approver flag, action (`MASS_APPROVE`, `INDIVIDUAL_APPROVE`, `MASS_REJECT`, `INDIVIDUAL_REJECT`) and remarks; history from `bl_aat_claim_doc_approval_history`.

## Lifecycle and effects

**Statuses.** Header (`bl_aat_claim_document_hdr.ClaimStatus`): `TEMP`, `DRAFT`, `SUBMITTED`, `APPROVED` (all lines approved), `CLOSED` (all lines rejected or withdrawn). Line (`ClaimLineStatus`): `TEMP`, `DRAFT`, `PENDING_APPROVAL`, `APPROVED`, `REJECTED`, `WITHDREW`, `RESUBMITTED`, `PENDING_DOC_REVIEW`, `REVIEWED`, `ON_HOLD`, plus failure states `FAIL_TO_SUBMIT`, `FAIL_TO_WITHDRAW`, `FAIL_TO_RESUBMIT`, `FAIL_TO_PUT_ON_HOLD`. Queue posting states (`ClaimSharedPostingStatus`): `INSERTED_TO_QUEUE`, `PROCESSOR_SUCCEED`, `PROCESSOR_FAIL`, `PROCESSOR_FAIL_CLAIM_APPROVAL_SETTING_NOT_FOUND`, `PROCESSOR_FAIL_CANNOT_CREATE_APPROVAL_SEQUENCE`, `PROCESSOR_FAIL_APPROVAL_SEQUENCE_IS_EMPTY`, `POSTED`, `FAILED_TO_POST`.

**Submit** (`ClaimDocLineProcessorRelatedService` L150–L195): header → `SUBMITTED` and a running number is issued; every line → `PENDING_APPROVAL`, except *Non-Reimbursable* lines → `APPROVED` with `date_final_approval = now`, and one hard-coded job-title exception that sends the claimant's lines straight to `PENDING_DOC_REVIEW` (L165–L169). The document DCO then runs the balance check (`ClaimDocumentSubmissionCheckingBalanceService`) and the general checks (claimable period, receipt validity, internal employees, approval-setting completeness — see Troubleshooting); any failure throws `Core2BadRequestException("ERROR_TO_SHOW_IN_UI", …)` and nothing is queued. On success each line is queued for `ClaimDocLinePrimaryProcessor`, which builds the approval sequence with the workflow-specific logic service (`ClaimDocumentLineClaimAccountApprovalLogicService`, `…EmployeeAdHoc…`, `…EngagementPIC…`, `…ProcjectPIC…`) and e-mails the first approvers. Failed queue posts can be re-queued through `PUT …/processors/retry/backoffice-ep` (`ClaimDocumentApprovalSequenceProcessorRelatedService.findAndProcessAllFailed`).

**Approve / reject** (`ClaimDocApprovedApprovalRequestProcessor`): each approval advances the level; delegation periods substitute the approver and record `is_delegated_approval`. When the last level approves (`…ProcessorHelper` L118–L126): `SALARY_PAYMENT` items → `APPROVED`; everything else → `PENDING_DOC_REVIEW`. At the same moment a `UTILIZE` transaction line (negative amount) is posted to the claimant's claim account, with a `CONVERSION` line on the convertible account if the main account is short (`…TxnLineUpdateCtrlAccAndBalanceProcessorHelper` L37–L110); the balance and control-account rows are updated by `ClaimAccountProcessTxnLineUpdateCtrlAccAndBalanceProcessor`. If the company's cut-off row has `auto_add_approved_claim_to_cycle = true`, the line is attached to the current `OPEN` cycle immediately (`ClaimDocumentLineImmediateIngestService`); otherwise `ClaimCycleProcessor` sweeps `PENDING_DOC_REVIEW` lines whose `date_final_approval` ≤ the cycle's `approval_cutoff_end_date` (and that were not withdrawn) into the month's cycle. Reject → `REJECTED` with `rejection_remarks`; the claimant can clone it (`duplicate_from_rejected`).

**Withdraw / resubmit / on-hold**: `PUT …/processors/withdrawals` → `WITHDREW`; finance on-hold in the cycle → `ON_HOLD` (`ClaimDocumentLineClaimCycleLogicService.putOnHoldClaimDocLines`); `PUT …/processors/resubmission` → `RESUBMITTED`, counted in `total_resubmission_count`. Finance acceptance → `REVIEWED`, then `APPROVED` with `final_approval_ready_to_pay = true` at the final review level (`financeAcceptClaimDocLines` L88–L97). The header is recomputed after every line change (`updateClaimDocumentHdrClaimStatus`).

**Posting proof block.** Not a generic financial document: no `*DataConsistencyObject` signums, no `JournalPostingTypeHandler` entry, no stock processor. The header carries `posting_status_to_sales_order / sales_invoice / purchase_invoice / payment_voucher` and matching `fk_*` columns, but **no code in the claim domain or its job processors sets them** (checked at commit `871dbf5c96`). Money leaves through the Claim Cycle Applet's Bank Report, PV Details Report and salary-payment CSV export (`GET …/cycle-reports/salary-payment/export/csv/backoffice-ep`), not through an automatic payment voucher. *What VOID reverses*: there is no VOID; withdrawal and rejection leave the `UTILIZE` line untouched only if approval never completed — an approved-then-on-hold line has already reduced the balance.

**Background jobs**: `ClaimDocLineRiskScoreCalculationProcessor` sets `is_flag` / `flag_json` (`attachment_reuploaded` with the other claim IDs, `receipt_date_amended`, `claim_amount_amended`, `receipt_number_amended` versus the OCR values); `ClaimSchedulerToAutoPurgeTempsProcessor` deletes `TEMP` headers and lines older than 30 days; `ClaimAccountCtrlAccExpiryProcessorService` posts `EXPIRY` lines when an entitlement's validity lapses; `ClaimEmailNotificationForApprovalProcessorService` sends the daily reminder to approvers.

## Related applets

- [Claim Cycle Applet](/applets/claims/claim-cycle-applet/) — consumes `PENDING_DOC_REVIEW` lines; finance review, on-hold, sampling, reports. Its *Reviewer Setting* decides who may accept lines and close a cycle.
- [Employee Applet](/applets/master-data/employee-applet/) — claimants, approvers, designations, job titles and the e-mail link that the applet keys on.
- [Organisation Applet](/applets/master-data/organisation-applet/) — companies and branches; the *Branches* settings screen here adds ranking and designation tabs to them.
- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) — expense / billing GL codes on claim items (carried for reporting only).
- [Forex Applet](/applets/master-data/forex-applet/) — rate source for foreign-currency lines.
- [OCR Cash Bill Applet](/applets/membership/ocr-cash-bill-applet/) — a different OCR (membership cash bills); listed to avoid confusion with the claim-receipt OCR, which is Textract-based inside this applet.

## Troubleshooting

| Symptom (message shown in the UI) | Cause | Fix |
|---|---|---|
| `Cannot find your email: … from Employee Applet. Please contact respective Managers …` when opening My Claim | The login's primary e-mail has no employee record (`ClaimDocumentLineService` L175/L192). | Add or correct the employee's e-mail in the Employee Applet. |
| `Approval Setting is yet to be configured for Engagement Role: …, Branch: …` / `Approval level & quorum are yet to be configured …` on Submit | The claim item's approval setting has no level / quorum rows for that role or branch. | *Settings → Claim Approval Settings*: add the level, type and quorum. |
| `Approver for designation: … under branch: … is yet to be configured` / `Total N approver required … Currently M approver` | Ad-hoc workflow cannot find enough employees with that designation in the branch. | *Settings → Branches → Approval Designation*: link the approvers. |
| `Default approver is yet to be configured for Approval Setting: …` | Top-level claimant with no one above; the setting has no default approver. | Set *Default Approver* on the approval setting. |
| `HR/TIM are not fully configured for ClaimAccount … Total required approval levels is N, but only M …` | Claim-account workflow; HR approvers missing on the account. | *Settings → Claim Accounts → HR Claim Approval*. |
| `Claimant is not entitled to claim …` | No entitlement employee link, or balance (and convertible balance) insufficient. | Link the employee to the entitlement (Employees tab, Auto Top-up run or *Upload Employee Entitlement*); with `MANUAL_ENTITLEMENT_ADJUSTMENT` on, adjust the balance. |
| `Maximum claimable period of claim item: … is N days. But total claim period days is M` | Cost-incurred dates span more than the item's *Claimable Period (Days)*. | Split the line or raise the item's period. |
| `Receipt date: … is not within validity date range (…)` | Professional-subscription claim outside the membership validity. | Correct the validity dates on the line. |
| `Internal Employees information are not provided for Claim Lines: …` | Item requires internal employees; none listed. | Add attendees on the line. |
| `Your Professional Study Scheme claim was forfeited on: …` | HR set a validity end (custom validity by HR) that has passed. | Review the entitlement employee link. |
| Line shows `approval_sequence_posting_status = PROCESSOR_FAIL_*` and never reaches an approver | The queue processor could not build the sequence (setting deleted after submit, empty role list). | Fix the setting, then retry (`…/processors/retry`). |
| Approved lines never appear in a claim cycle | No *Claim Cut-Off Logic* row for the company, so no cycle exists; or `date_final_approval` is after the approval cut-off end date. | Create the cut-off row; the line is picked up by the next month's cycle or on cycle close (`ClaimCycleHdrCLOSEDCycleHelper`). |
| *Claim Approval Delegation Period Settings* missing from the menu | `HIDE_CLAIM_APPROVAL_DELEGATION_PERIOD` is on. | Application Settings. |
| Menu says *Job Groups* but forms still say *Branch* (or the reverse) | `RELABEL_BRANCH_TO_JOB_GROUP` combined with `HIDE_CLAIM_APPROVAL_DELEGATION_PERIOD` — the else-if in `app.component.ts` skips the rename. | Turn off the hide toggle, or accept the mixed label. |
| *Enable Audit Trail* toggle changes nothing | The key is saved but never read. | Use *Settings → Applet Log* directly. |
| Foreign-currency line has no rate source picker | `SHOW_FOREX_DATA_SOURCE` saved as false. | Application Settings. |

## Related documentation

- [Claims Management module](/modules-v2/claims/)
- [Claim Cycle Applet](/applets/claims/claim-cycle-applet/)
- [HR & Payroll module](/modules-v2/hr-payroll/)
