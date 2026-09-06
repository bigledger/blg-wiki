---
topic: document-approval
aliases: [generic-document-approval, generic doc approval, approval settings, approval request, approval sequence, multi-level approval, bl_fi_generic_doc_approval]
applets: [internal_purchase_order_applet, internal_purchase_requisition_applet, internal_stock_requisition_applet]
modules: [purchasing, inventory, core]
related: [workflow-design, internal-purchase-order-applet, internal-purchase-requisition-applet, employee-applet, entity-applet, claim-applet, budgetary-applet, client-side-permissions, applet-settings-storage, external-generic-documents]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-order-applet.md
  - content/en/applets/purchase-workflow/internal-purchase-requisition-applet.md
  - content/en/applets/inventory-workflow/internal-stock-requisition-applet.md
  - content/en/applets/master-data/workflow-design-applet.md
status: growing
updated: 2026-09-06
---

# Document approval (bl_fi_generic_doc_approval_*)

The real approval engine for business documents. A tenant that wants a purchase order signed off
creates an **Approval Setting** inside the Purchase Order applet's own Settings, lists the approval
levels, and assigns approvers to designations. Someone then opens a saved document, adds an approval
record on its **Generic Doc Approval** tab and clicks *Submit For Approval*; BigLedger e-mails each
approver a link to a web page where they Approve or Reject with remarks, and when the last required
level approves it sets the document's posting status to FINAL. **None of this is on by default and
none of it is compulsory** — the document lifecycle contains no approval check at all, so a document
saves and finalises exactly the same whether an approval setting exists, does not exist, or exists
with a request still pending. It is a bolt-on sign-off trail, not a gate.

This is a different subsystem from **workflow-design** (`bl_wf_md_*`), which is a status label with a
role filter. The two never read each other.

## Facts

Citations are to `/home/marketing/repos/refs/blg-akaun-platform-java` at `1ff620ef` (2026-09-05)
unless stated otherwise.

### It is optional — the document lifecycle never checks it

- 2026-09-06 — **No generic-document validator references approval.** `grep -rli approval` over
  `javasdk/.../validator/erp/genDoc/` excluding its own `approval/` subpackage returns **zero
  files**. [src:blg-akaun-platform-java@1ff620ef javasdk/src/main/java/com/bigledger/core2/validator/erp/genDoc/]
- 2026-09-06 — **`GenericDocumentService` contains the string "approval" zero times**, including
  `updatePostingStatusWithChecks` (L345), the method that moves a document to FINAL. There is no
  "is this approved?" check in the posting path.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../domain/tenant/GenericDocumentService.java]
- 2026-09-06 — Consequence, stated plainly: while an approval request is PENDING_APPROVAL the
  document remains editable and can still be finalised by hand. Nothing in the Purchase Order edit
  component gates Save or Final on `approval_status`; the applet's only approval-related UI hook is
  a tab entry `{ title: 'Generic Doc Approval', content: 'generic-doc-approval', hide:
  'HIDE_GENERIC_DOC_APPROVAL_TAB', expandSetting: 'EXPAND_GENERIC_DOC_APPROVAL' }`.
  [src:blg-applet-wavelet-internal-purchase-order-applet .../purchase-order-edit/purchase-order-edit.component.ts:187]
- 2026-09-06 — The dependency runs the other way: when the last required level approves, the request
  processor calls `new GenericDocumentService().updatePostingStatusWithChecks(ImmutableMap.of(
  "posting_status", "FINAL"), …)` on the document. Approval **causes** FINAL; FINAL does not require
  approval. [src:blg-akaun-platform-java@1ff620ef akaun-api/.../jobProcessor/erp/genericDocument/approval/GenericDocApprovalRequestProcessor.java:208-209]

### Which applets expose it

- 2026-09-06 — Only **three** applet repos carry Approval Settings screens: the Purchase Order,
  Purchase Requisition and Stock Requisition applets. A repo-wide grep for
  `generic-doc-approval|genericDocApproval|generic_doc_approval|approval-setting` across all 211
  applet clones in `/home/marketing/repos/refs/` hits only those three plus the Claim applet (a
  separate engine), plus incidental matches: the Customer and Supplier applets reference
  `bl_fi_generic_doc_approval_history` for entity-merge processing, and every applet's vendored copy
  of shared-utilities carries the `HIDE_GENERIC_DOC_APPROVAL_TAB` toggle.
  [src:/home/marketing/repos/refs/ grep 2026-09-06]
- 2026-09-06 — The **document types** that can be configured are exactly `INTERNAL_PURCHASE_ORDER`
  and `INTERNAL_PURCHASE_REQUISITION` (offered by both the PO and PR applets) and
  `INTERNAL_STOCK_REQUISITION` (offered by the Stock Requisition applet;
  `INTERNAL_OUTBOUND_STOCK_TRANSFER` sits commented out beside it). There is no approval engine for
  sales documents, delivery orders, GRNs, purchase invoices, payment vouchers, journals, stock
  adjustments or stock transfers.
  [src:blg-applet-wavelet-internal-purchase-order-applet .../settings-container/approval-setting/approval-setting-create/approval-setting-create.component.ts:41-51]
  [src:blg-applet-wavelet-internal-stock-requisition-applet .../approval-setting-create.component.ts:41-51]
- 2026-09-06 — **Stock Requisition is a dead end today.** It routes `settings/approval-setting` and
  shows an "Approval Settings" menu item, but the applet has no `generic-doc-approval` tab on the
  document, no Approval Request screen and no Approval History screen. A setting created there
  cannot be used from that applet.
  [src:blg-applet-wavelet-internal-stock-requisition-applet .../app.routing.ts:83-84, .../models/menu-items.ts:49-50; no generic-doc-approval component in the repo]
- 2026-09-06 — Only the Purchase Order applet carries the **Approval Monitor** screens (create /
  edit / listing) that maintain `bl_fi_generic_doc_approval_conversion_monitor`.
  [src:blg-applet-wavelet-internal-purchase-order-applet .../settings-container/approval-monitor/]
- 2026-09-06 — The document tab is shown by default and hidden by the applet setting
  `HIDE_GENERIC_DOC_APPROVAL_TAB`; the shared field-configuration screen offers the toggle only for
  `internalPurchaseOrderApplet`, `internal-purchase-requisition-applet` and
  `internal_purchase_requisition`.
  [src:blg-shared-utilities modules/permission/field-configuration/field-configuration/field-configuration.component.ts:3610,3630,3640]

### What a level contains

- 2026-09-06 — `bl_fi_generic_doc_approval_setting` holds `code`, `name`, `branch_guid`,
  `company_guid`, `doc_hdr_server_doc_type`, `submitter_designation_code`,
  `total_required_approval_level`, `is_approver_designation_staff` and the
  `approval_setting_json` array. [src:pcimage/tables/bl_fi/bl_fi_generic_doc_approval_setting.sql]
- 2026-09-06 — One element of `approval_setting_json` (`gen_doc_approval_setting_json`) is:
  `approval_level` (default 1), `approval_quorum` (default 1), `approval_logic`
  (`ANY_TO_APPROVE` | `ALL_TO_APPROVE`), `min_approval_amount` (default 0), `max_approval_amount`,
  `approver_designation`. The applet screen labels these Approval Level, Approval Quorum, Approval
  Logic, Min Approval Amount, Max Approval Amount, Approver Designation.
  [src:blg-akaun-platform-java@1ff620ef client-sdk/.../approval/gen_doc_approval_setting_json.java:9-15]
  [src:blg-applet-wavelet-internal-purchase-order-applet .../approval-setting-create.component.html:102-159]
- 2026-09-06 — **`approval_logic` is dead.** Outside setters, test fixtures and `PrepareDbs`, the
  only production reference is `sequence.setApproval_logic(...)` copying it onto the sequence row.
  Nothing ever reads it. ANY vs ALL is decided entirely by `approval_quorum`.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalPrimaryProcessorServiceForSubmissionLogic.java:105; repo-wide grep for `getApproval_logic()`]
- 2026-09-06 — **`max_approval_amount` is dead** for the same reason: copied onto the sequence at
  L108 and never compared with anything.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalPrimaryProcessorServiceForSubmissionLogic.java:108; repo-wide grep]
- 2026-09-06 — **`min_approval_amount` is the one live amount rule, and it does not do what people
  assume.** It does not route to a different approver. It sets *how many levels* are required:
  `calculateDynamicTotal_required_approval_level` walks the levels in order and increments
  `total_required_approval_level` once for every level whose `min_approval_amount` is `<=` the
  document's `amount_txn`. A RM 500 document with levels at min 0 / min 1,000 / min 10,000 needs one
  level; a RM 50,000 document needs three.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../validator/erp/genDoc/approval/GenericDocApprovalSubmissionDCOHelper.java:88-106]
- 2026-09-06 — `approval_setting_json.size()` must equal `total_required_approval_level`, enforced
  by `GENERIC_DOC_APPROVAL_SETTING_OBJECT_APPROVAL_SETTING_JSON_DOES_NOT_MATCH_TOTAL_REQUIRED_APPROVAL_LEVEL`
  — **on creation only**. The update validator set omits the `approval_setting_json` validation
  entirely, so an edit can leave the two out of step.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../GenericDocApprovalSettingDataConsistencyObject.java:48-61 (creation) vs :92-146 (update)]

### Who approves

- 2026-09-06 — Approvers are **not** named on the approval setting. They come from
  `bl_fi_mst_employee_branch_designation_link`: Settings → Branch → Designation → Designation
  Employee, where each employee row carries an **Approval Level**. The approver list for a
  submission is every employee linked to the branch designation whose `code` equals the approval's
  `submitter_designation_code` and whose designation is linked to that approval setting.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalPrimaryProcessorServiceForSubmissionLogic.java:36-42]
  [src:blg-applet-wavelet-internal-purchase-order-applet .../branch-designation-employee-create/branch-designation-employee-create.component.html:41-42]
- 2026-09-06 — The submitter's designation is resolved from the submitter employee's `job_title`
  against `bl_fi_generic_doc_approval_setting.submitter_designation_code` for that document type. If
  no setting matches the job title — or if the matching setting has
  `is_approver_designation_staff = true` — the submitter is treated as designation `"Staff"` and the
  `"Staff"` setting is used instead.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../GenericDocApprovalSubmissionDCOHelper.java:35-86]
- 2026-09-06 — Three submit-time errors that stop a submission, all surfaced to the UI as
  `ERROR_TO_SHOW_IN_UI`: the submitter designation code has no row in
  `bl_fi_mst_branch_designation`; no approver is linked to it
  (`There is no approver assigned in bl_fi_mst_employee_branch_designation_link`); or the number of
  distinct approver levels is fewer than `total_required_approval_level`
  (`EmployeeBranchDesignationLink_IS_NOT_FULLY_CONFIGURED`). A fourth, `SUBMITTER_IS_RESIGNED`,
  blocks a submitter whose entity has a past `resign_date`.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../GenericDocApprovalSubmissionService.java:96-196]
- 2026-09-06 — The applet's Approval Request list is filtered to the signed-in user's **primary
  login subject's** employee entity guid, and throws
  `Cannot find your email: … from Employee Applet` when the login has no employee record. An
  approver who is not in the Employee applet under the same e-mail cannot see their queue.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../GenericDocApprovalRequestService.java:60-104]
- 2026-09-06 — **No delegation.** `bl_fi_generic_doc_approval_sequence` has
  `is_delegated_approval`, `delegating_entity_hdr_guid` and `delegating_approver_name` columns, but
  the only code that sets them is `ClaimApprovalDelegationPeriodHelper`, which writes the *claim*
  tables. Nothing in the generic-document path ever populates them.
  [src:pcimage/tables/bl_fi/bl_fi_generic_doc_approval_sequence.sql]
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../jobProcessor/aat/claim/approval/ClaimApprovalDelegationPeriodHelper.java:23-44]
- 2026-09-06 — **No escalation, reminders or SLA.** `approval_due_date` is passed to the e-mail
  decision page as a display attribute and is set by nothing and acted on by nothing; there is no
  reminder or escalation job anywhere under `jobProcessor/erp/genericDocument/`.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../GenericDocApprovalRequestService.java:129; grep for `reminder|escalat` returns nothing in that tree]

### The submit → approve → FINAL path

- 2026-09-06 — Submit and resubmit both set `approval_status = PENDING_APPROVAL` and push an event
  onto `GENERIC_DOC_APPROVAL_PRIMARY_PROCESSOR` with `RUN_NOW`. Withdraw sets `WITHDREW` plus
  `date_withdrawal` and pushes onto the same queue.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../GenericDocApprovalSubmissionService.java:37-93]
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../GenericDocApprovalWithdrawalService.java:18-35]
- 2026-09-06 — `GenericDocApprovalPrimaryProcessor` fans the approval out into
  `bl_fi_generic_doc_approval_sequence` rows — one per (level, approver) — then queues
  `GENERIC_DOC_APPROVAL_SEQUENCE_PROCESSOR`. Each sequence row records
  `approval_quorum = min(number of approvers at that level, the level's configured quorum)`.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalPrimaryProcessor.java:96-140]
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalPrimaryProcessorServiceForSubmissionLogic.java:88-118]
- 2026-09-06 — `GenericDocApprovalSequenceProcessor` creates a
  `bl_fi_generic_doc_approval_request` per approver of the lowest unprocessed level and e-mails each
  one. When a level's quorum is met it deletes that level's outstanding requests and opens the next
  level. [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalSequenceProcessor.java:74-175]
- 2026-09-06 — On **approve**, `GenericDocApprovalRequestProcessor` writes an approval history row,
  marks every sequence row at that level APPROVED and increments the quorum count, deletes the
  approver's request, and — when all sequence rows are APPROVED *and* some row's
  `approval_level_count` equals `total_required_approval_level` — stamps `date_final_approval`,
  sets the header to APPROVED, permanently deletes the remaining requests and pushes the document
  to FINAL. Approver remarks are appended to `approval_remarks` on the header.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalRequestProcessor.java:156-224]
- 2026-09-06 — On **reject**, the header goes to REJECTED with `is_rejected = true`,
  `date_rejection`, `rejection_remarks`; `date_final_approval` is cleared; a rejection e-mail goes
  to the submitter; every sequence row is marked REJECTED and soft-deleted; the outstanding requests
  are hard-deleted. The document itself is untouched — it stays in whatever posting status it was
  in. A rejected submission is recovered by *Resubmit*, which starts a fresh
  PENDING_APPROVAL cycle and stamps `date_resubmission`.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalRequestProcessor.java:226-274]
- 2026-09-06 — **Withdraw** sets the header to WITHDREW, marks every sequence row WITHDREW and
  DELETED, hard-deletes the outstanding requests, and writes a history row. There is no e-mail to
  the approvers telling them the request is gone. Note that the applet's Withdraw button exists in
  the component but is **commented out** in the Purchase Order Submit Approval template — today
  withdrawal is reachable only via the API.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalPrimaryProcessor.java:142-176]
  [src:blg-applet-wavelet-internal-purchase-order-applet .../submit-approval/submit-approval.component.html:40-46]
- 2026-09-06 — Statuses in `GenericDocApprovalStatus`: SUBMITTED, PENDING_APPROVAL, APPROVED,
  REJECTED, RESUBMITTED, WITHDREW. SUBMITTED / RESUBMITTED appear only in history rows; the header
  carries PENDING_APPROVAL while it waits.
  [src:blg-akaun-platform-java@1ff620ef client-sdk/.../approval/GenericDocApprovalStatus.java]

### The e-mails

- 2026-09-06 — Two e-mails exist, both AWS SES, both driven by rows in
  `bl_applet_template_message_hdr`: `GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION` to each
  approver and `GENERIC_DOC_APPROVAL_REJECTION_NOTIFICATION` to the submitter. The From address
  comes from the `NO_REPLY_EMAIL_ADDRESS` template, defaulting to `no_reply@akaun.com`.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalEmailNotificationForPendingApprovalService.java:28-50]
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalEmailNotificationForRejectionService.java:27]
- 2026-09-06 — If the tenant has no `GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION` template
  row, **no e-mail is sent** and the header records
  `email_notification_posting_status = FAILED_GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION`.
  If the approver's entity has no e-mail address the status is `APPROVER_EMAIL_IS_EMPTY`. Both are
  visible in the Email Notification Status column on the applet's approval grid.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalEmailNotificationForPendingApprovalService.java:44-91]
  [src:blg-applet-wavelet-internal-purchase-order-applet .../submit-approval/submit-approval.component.ts:126-131]
- 2026-09-06 — The approver's link goes to a **server-rendered Thymeleaf page**, not into the
  applet: `…/core2/tnt/dm/erp/generic-doc/approvals/approval-requests/thymeleaf-forms/{tenantCode}/{approvalRequestGuid}`.
  It shows the document number, date, amount, currency and lines, and offers Approve / Reject with
  a mandatory remarks box, posting to `…/approval-requests/processors/public-ep`, an
  **anonymous** endpoint. Anyone holding the link can decide the approval.
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalRequestThymeleafFormController.java:25-56]
  [src:blg-akaun-platform-java@1ff620ef akaun-api/src/main/resources/templates/approver-decision-ui.html:568-670]
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalRequestController.java:124-140]
- 2026-09-06 — Inside the applet the same decision goes through
  `PUT …/approval-requests/processors/login-entity-primary-ep`, which is authenticated and rejects a
  REJECTED decision with blank remarks (`REJECT_REMARKS_IS_EMPTY`).
  [src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalRequestController.java:250-282]

### The conversion monitor

- 2026-09-06 — `GenericDocApprovalConversionMonitor*` answers "may this document be submitted for
  approval at all?" for a document that is supposed to originate as a conversion from another
  document. `bl_fi_generic_doc_approval_conversion_monitor` is a tiny table keyed on
  (`from_server_doc_type`, `to_server_doc_type`) with one meaningful flag,
  `is_document_conversion_required`.
  [src:pcimage/tables/bl_fi/bl_fi_generic_doc_approval_conversion_monitor.sql]
- 2026-09-06 — `checkConversionDataAndReturnApprovalHdrData`: if no monitor row exists for the pair
  it throws `CANNOT_GET_approval_conversion_monitor`; if the row says conversion is not required it
  returns an empty response; if it is required it looks for a `bl_fi_generic_doc_link` joining the
  two documents (else `GENERIC_DOC_APPROVAL_CREATION_FAIL: <to> is not contra to an existing
  <from>`) and then for an APPROVED approval header on the source document (else
  `CANNOT_GET_APPROVED_GENERIC_DOC_APPROVAL`). On success it hands back the *source* document's
  submitter, so the new approval inherits it.
  [src:blg-akaun-platform-java@1ff620ef javasdk/.../GenericDocApprovalConversionMonitorCheckingService.java:22-92]
- 2026-09-06 — In the Purchase Order applet this is hard-coded to the pair
  (`INTERNAL_PURCHASE_REQUISITION` → `INTERNAL_PURCHASE_ORDER`). When the check fails the Add button
  on the Approval tab is disabled with the tooltip *"Purchase Order needs to be converted from
  Purchase Requisition"*. Because a missing monitor row throws, **a tenant with no monitor row sees
  that message and cannot create a PO approval at all** — the Approval Monitor screen has to be
  populated first.
  [src:blg-applet-wavelet-internal-purchase-order-applet .../submit-approval/submit-approval.component.ts:176-200, .../submit-approval.component.html:8-14]

### No interaction with Workflow Design

- 2026-09-06 — Zero cross-references in either direction. `grep -in "workflow|wf_process|bl_wf"`
  over the four generic-document approval packages (domain, validator, jobProcessor, controller)
  returns nothing, and `grep -in approval` over `domain/wf/` and the `wf` controllers returns
  nothing. A document's workflow status is never read when deciding an approval, and an approval
  never moves a workflow status. The FINAL that an approval triggers goes through
  `updatePostingStatusWithChecks`, which is the posting status (`DRAFT`/`FINAL`), a different field
  from `wf_process_status_guid`.
  [src:blg-akaun-platform-java@1ff620ef grep 2026-09-06]

## How it connects

- **workflow-design** — the *other* thing that looks like approvals. A status track with a role
  filter, whose Transition Actions / Action Types / Notification Subscribers are never executed.
  Readers and older wiki pages conflate the two constantly; the wiki's job is to keep them apart.
  Both appear in the same applets' Settings menus (Workflow Settings vs Approval Settings), which is
  where the confusion starts.
- **internal-purchase-order-applet / internal-purchase-requisition-applet** — the only two applets
  where the whole loop (setting → submit → approve → FINAL) is reachable from the UI.
- **employee-applet / entity-applet** — approvers and submitters are employee entities. An approver
  with no e-mail gets no notification; a login with no employee record cannot see its approval
  queue; a submitter past their `resign_date` is blocked.
- **claim-applet** — a separate, older and richer approval engine (`bl_aat_claim_doc_approval_*`)
  that *does* have delegation periods. Do not carry claim behaviour across to document approval.
- **budgetary-applet** — `bl_fi_budget_register_approval_*` is a third, parallel copy of the same
  design (setting, sequence, request, history, the same `is_approver_designation_staff` helper).
  Facts about one do not automatically hold for the others; check before reusing.
- **applet-settings-storage** — `HIDE_GENERIC_DOC_APPROVAL_TAB` / `EXPAND_GENERIC_DOC_APPROVAL` are
  ordinary applet-settings keys; the tab is visible until someone hides it.

## Open questions

- Is Stock Requisition's Approval Settings screen intended to become usable, or is it a fork
  leftover? Filed as `kb/questions/2026-09-06-stock-requisition-approval-dead-end.md`.
- Is the anonymous `processors/public-ep` decision endpoint intended (convenience for approvers who
  do not log in) or an oversight? Filed as
  `kb/questions/2026-09-06-approval-public-decision-endpoint.md`.
- Why is the Withdraw button commented out in the Purchase Order approval template when the
  backend withdrawal path is complete?
- Were `approval_logic` and `max_approval_amount` ever executed, or have they always been inert?
  Both are collected by the UI and stored, which is a trap for anyone configuring a setting.

## Wiki impact

- One page should own this topic end to end and the rest should link to it. Today the closest thing
  is the Purchase Order applet page's Approval Settings section; a dedicated guide is warranted.
- Every page that tells a reader to set approvals up in **Workflow Design** is wrong.
- Every page that presents approval as a step in a workflow every reader performs is wrong — it is
  off until configured.
- Every page that promises delegation, escalation timers, reminders, SLAs, an approval matrix,
  auto-approval, amount-based routing to different approvers, or an approval audit trail of
  configuration changes is describing something that does not exist.
- Sales, delivery, GRN, purchase invoice, payment voucher, journal and stock movement pages must not
  claim a built-in approval workflow.
