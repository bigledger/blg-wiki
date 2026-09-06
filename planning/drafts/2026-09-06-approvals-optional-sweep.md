---
title: "Approvals are optional — correction sweep"
date: 2026-09-06
status: done (not committed)
topic: kb/topics/document-approval.md
---

# Approvals are optional — correction sweep, 2026-09-06

Vincent confirmed: *"the workflow approval for purchase order, sales invoice, sales order and other
applets are actually optional."* This is the working file for the sweep that followed. Every claim
below was re-verified from source before it was published; citations are to
`/home/marketing/repos/refs/blg-akaun-platform-java` at `1ff620ef` (2026-09-05) and to the applet
clones under `/home/marketing/repos/refs/` unless stated. Full fact set with line numbers:
`kb/topics/document-approval.md`.

## 1. What is true

### Optional — the proof

- `grep -rli approval` over `javasdk/.../validator/erp/genDoc/`, excluding its own `approval/`
  subpackage: **zero files**.
- `javasdk/.../domain/tenant/GenericDocumentService.java` contains the string "approval"
  **zero times**, including `updatePostingStatusWithChecks` (L345), the method that sets FINAL.
- So the DRAFT → FINAL path has no approval check. A document saves and finalises whether an
  approval setting exists, does not exist, or exists with a request pending.
- The dependency runs the other way: `GenericDocApprovalRequestProcessor.java:208-209` calls
  `updatePostingStatusWithChecks(ImmutableMap.of("posting_status","FINAL"), …)` on the last
  approval. **Approval causes FINAL; FINAL never requires approval.**
- The applet confirms it: `purchase-order-edit.component.ts:187` registers the approval tab
  (`HIDE_GENERIC_DOC_APPROVAL_TAB`) and nothing in the edit component gates Save or Final on
  `approval_status`.

### Scope — three document types, three applets

Repo-wide grep for `generic-doc-approval|genericDocApproval|generic_doc_approval|approval-setting`
over all 211 applet clones hits only:

| Applet | Approval Settings | Approval Monitor | Document approval tab | Approval Request / History |
|---|---|---|---|---|
| Purchase Order | yes | yes | yes | yes |
| Purchase Requisition | yes | no | yes | yes |
| Stock Requisition | yes | no | **no** | **no** |

Configurable `doc_hdr_server_doc_type` values, from the applets' own `serverDocTypes` arrays:
`INTERNAL_PURCHASE_ORDER`, `INTERNAL_PURCHASE_REQUISITION` (PO and PR applets),
`INTERNAL_STOCK_REQUISITION` (SR applet; `INTERNAL_OUTBOUND_STOCK_TRANSFER` commented out).

Incidental hits, not the engine: Customer and Supplier applets read
`bl_fi_generic_doc_approval_history` for entity-merge processing; every applet's vendored
shared-utilities carries the `HIDE_GENERIC_DOC_APPROVAL_TAB` toggle; the Claim applet is a separate
engine (`bl_aat_claim_doc_approval_*`).

**Stock Requisition is a dead end today** — settings screen, no submit path. Question filed.

### Dead fields in the level JSON

`gen_doc_approval_setting_json`: `approval_level`, `approval_quorum`, `approval_logic`,
`min_approval_amount`, `max_approval_amount`, `approver_designation`.

- `approval_logic` (ANY / ALL) — copied onto the sequence at
  `GenericDocApprovalPrimaryProcessorServiceForSubmissionLogic.java:105` and **never read**. ANY vs
  ALL is decided entirely by `approval_quorum`.
- `max_approval_amount` — copied at L108 and **never compared with anything**.
- `min_approval_amount` — the one live amount rule, and not what people assume. It does not route
  to a different approver; `GenericDocApprovalSubmissionDCOHelper.java:88-106` counts the levels
  whose `min_approval_amount <= amount_txn` and sets `total_required_approval_level` to that count.
  The amount changes **how many levels**, not **who**.

### Features that do not exist

- **Delegation** — `is_delegated_approval` / `delegating_entity_hdr_guid` exist as columns on
  `bl_fi_generic_doc_approval_sequence`; the only writer is
  `ClaimApprovalDelegationPeriodHelper.java:23-44`, which writes the *claim* tables.
- **Escalation / reminders / SLA** — `approval_due_date` is a display attribute on the e-mail
  decision page (`GenericDocApprovalRequestService.java:129`), set by nothing; `grep -in
  "reminder|escalat"` over `jobProcessor/erp/genericDocument/` returns nothing.
- **Approval matrix, amount-band routing to different approvers, auto-approval, mobile approval
  app, approval-configuration audit trail** — none present.

### No interaction with Workflow Design

`grep -in "workflow|wf_process|bl_wf"` over the four generic-document approval packages (domain,
validator, jobProcessor, controller): nothing. `grep -in approval` over `domain/wf/` and the `wf`
controllers: nothing. The FINAL an approval triggers is `posting_status`, a different field from
`wf_process_status_guid`.

### Other findings worth keeping

- `approval_setting_json.size() == total_required_approval_level` is validated **on creation only**
  (`GenericDocApprovalSettingDataConsistencyObject.java:48-61`); the update validator set omits it,
  so an edit can leave the two out of step.
- The approver's e-mail link goes to a Thymeleaf page that posts to
  `PUT …/approval-requests/processors/public-ep`, declared `AnonymousTenantEndpoint` — **no
  authentication**. Question filed rather than documented.
- The Purchase Order **Withdraw** button is commented out in
  `submit-approval.component.html:40-46`; the backend withdrawal path is complete, so withdrawal is
  API-only today.
- The PO approval tab hard-codes a conversion check for
  `INTERNAL_PURCHASE_REQUISITION → INTERNAL_PURCHASE_ORDER`. A **missing** Approval Monitor row
  throws, so the Add button is disabled with *"Purchase Order needs to be converted from Purchase
  Requisition"* even for a standalone PO. This is the single most confusing failure in the feature.

## 2. Triage of the wiki

227 English pages contain the word "approval" (`grep -rln -i approval content/en/`). All were read
across four parallel read-only passes, partitioned by directory.

| Scope | Read | Wrong | Fixed |
|---|---|---|---|
| `applets/` (less the 5 reserved dirs) | 66 | 8 + 2 marginal | 10 |
| `guides/`, `tutorials/`, `business-operations/`, `developers/`, 2 top-level | 40 | 14 + 4 marginal | 17 |
| `modules/`, `modules-v2/` | 60 | 22 | 21 (1 in a reserved dir) |
| `user-guide/`, `support/` | 43 | 27 | 27 |
| **Total** | **209** | **77** | **75** |

By failure mode (a page can be in more than one):

- **Mode A — points at Workflow Design, the inert engine:** 13 pages.
- **Mode B — approval presented as mandatory, or attached to a document type with no engine:**
  48 pages.
- **Mode C — invented features:** 30 pages.

Not touched, deliberately: ~130 pages where "approval" is incidental (LHDN e-invoice validation,
membership approvals, the Claims engine, the POS sell-below-price permission, plain business
English).

## 3. The home for the topic

Created `content/en/guides/document-approvals.md` (weight 45) and linked it from
`content/en/guides/_index.md`, from the Workflow Design applet page, and from 33 other pages. It is
a user guide in the house style: GadgetSphere running example, outcome-first, the four setup steps,
a "What success looks like" 30-second check, and a Common Mistakes section keyed to the real error
strings (`SUBMITTER_IS_RESIGNED`, `EmployeeBranchDesignationLink_IS_NOT_FULLY_CONFIGURED`,
`APPROVER_EMAIL_IS_EMPTY`, the Approval Monitor tooltip).

## 4. Left for someone else

Reserved paths (another agent is working there) — listed in the final report, not edited:

- `content/en/applets/finance/internal-purchase-invoice-applet.md:386` — Mode A, tells the reader to
  use the Workflow Design Applet "for approval steps before FINAL".
- `content/en/applets/rma/internal-rma-applet.md:252` — figure caption calls Workflow Settings
  "approval workflows and routing rules".
- `content/en/applets/finance/budget-applet.md:1137,1307,1327` — "approval matrices"; the Budget
  Register has its own parallel engine (`bl_fi_budget_register_approval_*`) that was not audited.

Unverified, left alone: timesheet approval (`user-guide/demo/services/`), BOM approval
(`user-guide/demo/manufacturing/`), manufacturing work-log "Pending Approval"
(`modules/manufacturing.md`), and whether the Claims engine literally exposes an "approval matrix".

## 5. Questions filed

- `kb/questions/2026-09-06-stock-requisition-approval-dead-end.md`
- `kb/questions/2026-09-06-approval-public-decision-endpoint.md`
