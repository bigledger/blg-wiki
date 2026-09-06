---
topic: workflow-design
aliases: [workflow process, process status, approval workflow, workflow-process, bl_wf_md]
applets: [workflow_design_applet]
modules: [core, financial-accounting, sales-crm, purchasing, inventory]
related: [document-approval, internal-purchase-order-applet, internal-purchase-requisition-applet, internal-sales-invoice-applet, internal-purchase-order-supplier-access-applet, stock-take, car-workshop-applet, client-side-permissions, printable-format, applet-settings-storage]
wiki:
  - content/en/applets/master-data/workflow-design-applet.md
status: growing
updated: 2026-09-06
---

# Workflow design (bl_wf_md_*)

The tenant-wide catalogue of workflow *processes*: a process is a set of statuses joined by transitions, each transition gated by roles. Document applets attach one process per company and then show the document's current status plus the statuses the signed-in user's roles allow. It is a status track with a role filter — not an approval engine. The separate `bl_fi_generic_doc_approval_*` family is the approval engine.

## Facts

- 2026-09-06 — Statuses are a **global** catalogue (`bl_wf_md_process_status`), not per-process. A process borrows them through `bl_wf_md_process_status_link`, which carries `sequence_no` and `process_resolution_guid`. The link **copies** name/code/description at link time, so renaming the catalogue status does not update the link. [src:pcimage/tables/bl_wf/bl_wf_md_process_status_link.sql] [src:blg-applet-wavelet-workflow-design-applet/…/process-edit-status/status-listing/status-listing.component.ts]
- 2026-09-06 — The "which status can I move to" endpoint (`wf/md/process-status/available-process-statuses/backoffice-ep`) inner-joins transition → next status → `bl_wf_md_transition_role_link` → `app_mst_role` → `app_mst_link_subject_to_role` on the caller's subject GUID. **A transition with no Role row returns nothing for anybody**; that is the #1 cause of an empty status drop-down. [src:blg-akaun-platform-java/javasdk/…/dal/uow/wf/md/ProcessStatusUow.java:163] [src:blg-akaun-platform-java/akaun-api/…/wf/md/ProcessStatusController.java:156]
- 2026-09-06 — The ordered variant sorts on `bl_wf_md_process_status_link.sequence_no`, which the link screen does not populate at link time. [src:…/ProcessStatusUow.java:194]
- 2026-09-06 — For generic documents the workflow status is a **label**: `GenericDocumentHdrDataConsistencyObject` validates only FK existence of `wf_process_hdr_guid` / `wf_process_status_guid` (`GENERIC_DOC_HDR_WF_PROCESS_STATUS_GUID_DOES_NOT_EXIST`); no validator checks that the status belongs to the process or that a transition exists. [src:blg-akaun-platform-java/javasdk/…/FinancialDocDataConsistencyObject/GenericDocumentHdrDataConsistencyObject.java:215-232]
- 2026-09-06 — The one real gate is `FINAL_STATUS_GUID`: the FINAL button is shown only when the document's current workflow status equals it (combined with `HIDE_GENDOC_FINAL_BUTTON` / `SHOW_FINAL_BUTTON`, ACTIVE, DRAFT). Unset = gate off. This is **client-side button visibility**, not a backend rejection. [src:blg-applet-wavelet-internal-sales-order-applet-v2/…/internal-sales-order-view.component.ts:334,428,669-675]
- 2026-09-06 — Attachment path: `bl_fi_comp_workflow_gendoc_process_template_hdr` (company + process + `server_doc_type` + `applet_guid`) written by each document applet's Settings → Workflow Settings; the shared `company-workflow-dropdown` filters it on `applet_guid === sessionStorage.appletGuid`, so a link made from another applet never appears. [src:blg-shared-utilities/utilities/company-workflow-dropdown/company-workflow-dropdown.component.ts] [src:blg-applet-wavelet-internal-purchase-order-applet/…/company-workflow-create.component.ts]
- 2026-09-06 — A new document is stamped with `wf_process_status_guid` = the process's `default_process_status_guid` ("Starting Status"). If Starting Status was never set, new documents carry a null status. [src:blg-shared-utilities/modules/gen-doc-simplified-ui/gen-doc-simplified-ui.component.ts:2075-2085]
- 2026-09-06 — **Transition Actions, Action Types and Notification Subscribers are never executed.** `ActionService`, `ActionTypeService`, `TransitionActionService` and `ProcessTransitionNotificationSubscriberService` are CRUD only; no job processor, notification service or posting path reads `bl_wf_md_action*` or `bl_wf_md_process_transition_notification_subscriber`. No workflow e-mail, SMS or webhook exists. [src:blg-akaun-platform-java/javasdk/…/domain/wf/md/*.java] [src:javasdk/…/domain/jobProcessor/ (no wf/md processor)]
- 2026-09-06 — **Transition triggers** (`bl_wf_md_process_transition_to_transition_trigger`, type `TRANSITIONS` | `TARGET_STATUS`) are executed only by the Service Note / RMA processor, which cascades a status change onto the issue's internal/customer/supplier process. No generic-document equivalent. [src:blg-akaun-platform-java/javasdk/…/jobProcessor/svc/SvcIssueProcessStatusProcessorHelperMethods.java] [src:…/SvcIssueProcessStatusProcessorService.java:53-60]
- 2026-09-06 — `wf_type` (SEQUENTIAL / PARALLEL / CYCLIC / CONDITIONAL) is a label; no backend code branches on it. [src:blg-applet-wavelet-workflow-design-applet/…/models/constants/options.ts] [src:pcimage/tables/bl_wf/bl_wf_md_process_hdr.sql]
- 2026-09-06 — No uniqueness validators anywhere in `bl_wf_md_*`, and `ProcessStatusService.delete` performs no in-use check: a status referenced by live documents can be deleted. [src:blg-akaun-platform-java/javasdk/…/validator/wf/md/ProcessStatusLinkDataConsistencyObject.java] [src:…/domain/wf/md/ProcessStatusService.java:33]
- 2026-09-06 — Applet configuration: `app.routing.ts` routes `settings/field-settings` to the **shared** `FieldConfigurationComponent`; the applet's own local field-configuration is declared in `AppletSettingsModule` but routed nowhere and its 8 toggles are unbound (the same dead stub as Supplier / Merchant Admin / Shipping Pricebook / Tax Configuration). `workflow_design_applet` has no `tabMappings` entry, so 235 controls render (pinned shared-utilities f1ded040; 237 at HEAD a8c38a2) plus 60 runtime-gated — and the applet consumes exactly one key, `PRINTABLE`. [src:blg-applet-wavelet-workflow-design-applet/…/app.routing.ts] [src:kb/tools/gates.py workflow_design_applet]
- 2026-09-06 — `bl_applet_client_side_perm_dfn` has **no rows** for `workflow_design_applet`; access is entirely server-side via the `TNT_API_DM_WF_MD_*` permission family. [src:akaun_master query 2026-09-06] [src:blg-akaun-platform-java/javasdk/…/permissions/TntWFPermissions.java:308-380]
- 2026-09-06 — Two dead screens in this applet: Printable Format Settings queries `txn_type = INTERNAL_BLANKET_PURCHASE_ORDER` (fork leftover in `applet-constants.ts`), and the shared settings shell renders a **Release Notes** link for which the applet has no route (falls to the 404 page). `settings/webhook` and `settings/feature-visibility` are routed but unlinked; `settings` redirects to `feature-visibility`. [src:…/printable-format-listing.component.ts:112] [src:blg-shared-utilities/modules/settings/settings.component.html] [src:…/app.routing.ts]
- 2026-09-06 — The Create Process wizard's Status and Transition tabs are grids bound to `[rowData]="[]"` with no Add control; statuses and transitions can only be added after the process is saved. [src:…/process-status-create.component.html:14] [src:…/process-transition-create.component.html:14]

## How it connects

- **document-approval** — the *real* approval engine (`bl_fi_generic_doc_approval_hdr/_setting/_sequence/_request`, `GenericDocApprovalPrimaryProcessor`, `GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION` e-mail). Configured from Purchase Order / Purchase Requisition / Stock Requisition **Approval Settings**, never from here. Verified 2026-09-06 that the two never read each other: `grep -in "workflow|wf_process|bl_wf"` over the four generic-document approval packages returns nothing, and `grep -in approval` over `domain/wf/` and the `wf` controllers returns nothing. Readers confuse them constantly. It is also **optional** — the generic-document lifecycle contains no approval check, so a document finalises with or without one.
- **internal-purchase-order-applet, internal-purchase-requisition-applet** — carry both Workflow Settings (this topic) and Approval Settings (the other).
- **stock-take** — stamps the process's Starting Status onto a session and offers the transition list, enforcing nothing (open: gh:bigledger/blg-intranet#4420, #4421 want a single configurable status and a freeze).
- **car-workshop-applet / RMA** — the only consumers whose transition *triggers* execute, through the service-issue processor.
- **client-side-permissions** — none seeded here; the applet is governed by server-side permission sets only.
- **applet-settings-storage** — a textbook case of the shared Application Settings screen rendering a full document settings set for an applet that consumes one key.

## Open questions

- Was the transition Action / Action Type / Subscriber model ever executed by an older backend, or has it always been inert? Nothing in the current tree runs it.
- Does any applet outside the service-issue family intend to use transition triggers? The UI offers them on every process.

## Wiki impact

- `content/en/applets/master-data/workflow-design-applet.md` — rewritten 2026-09-06 from this topic.
- Every document-applet page whose Configuration section mentions `WORKFLOW_PROCESS_GUID` or Workflow Settings should say plainly that the status is a label and that `FINAL_STATUS_GUID` is the only gate, and that it is client-side.
- Any page or guide claiming that a workflow status change sends an e-mail or fires a webhook is wrong.
