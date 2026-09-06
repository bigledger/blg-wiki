---
topic: rma-and-service-notes
aliases: [RMA, return merchandise authorisation, service note, supplier RTV, return to vendor, RMA request]
applets: [InternalRmaApplet]
modules: [sales-crm, inventory, financial-accounting]
related: [workflow-design, document-approval, customer-maintenance, supplier-applet, warranty-admin, stock-balance]
wiki:
  - content/en/applets/rma/internal-rma-applet.md
status: growing
updated: 2026-09-06
---

# RMA and service notes

BigLedger's returns handling is three unrelated record types living behind one applet. A **service
note** (`bl_svc_issue_hdr`) is the repair or return job and has its own tables and endpoints under
`core2/tnt/dm/svc/`. A **Customer RMA** is a generic document of type `INTERNAL_SALES_RMA` that
authorises a return and moves nothing. A **Supplier RTV** is a generic document of type
`INTERNAL_SUPPLIER_RTV` that does move stock and does post. A fourth screen, **RMA Requests**
(`bl_svc_issue_request_hdr`), is an inbox of requests that a logged-in customer or supplier entity
can raise for themselves; approving one creates a service note.

## Facts

- 2026-09-06 — Registry row `InternalRmaApplet`, name "Rma Applet (Internal)", TNT-USER, ACTIVE, `documentation_url` already pointing at the wiki page. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-06 — `INTERNAL_SALES_RMA` has amount signum **0** and quantity signum **0**: it moves no stock and produces no journal. `GenericDocumentService` lists it among the five signum-zero sales types alongside Quotation, Sales Order, Outbound Delivery Order and Jobsheet. Short code `SLSRMA`, print code `IRMA`. [src:git:blg-akaun-platform-java@1ff620ef0e javasdk/.../validator/FinancialDocDataConsistencyObject/InternalSalesRMADataConsistencyObject.java] [src:git:blg-akaun-platform-java@1ff620ef0e javasdk/.../domain/tenant/GenericDocumentService.java]
- 2026-09-06 — `INTERNAL_SUPPLIER_RTV` has amount signum **+1** and quantity signum **+1**: it moves stock and posts through the standard generic-document path. [src:git:blg-akaun-platform-java@1ff620ef0e javasdk/.../validator/FinancialDocDataConsistencyObject/InternalSupplierRtvDataConsistencyObject.java]
- 2026-09-06 — **A fourth approval engine.** `bl_svc_issue_request_hdr.approval_status` is an `SVCApprovalStatus` enum with exactly `PENDING_APPROVAL`, `APPROVED`, `REJECTED`. It is not `bl_fi_generic_doc_approval_*`, not the Workflow Design engine, and not `bl_fi_budget_register_approval_*`. It has no settings screen anywhere and nothing configures who may approve beyond `TNT_API_DM_SVC_ISSUE_REQUEST_HDR_UPDATE`. [src:git:blg-akaun-platform-java@1ff620ef0e javasdk/.../dal/table/SVCApprovalStatus.java] [src:git:blg-akaun-platform-java@1ff620ef0e akaun-api/.../controller/tenant/dm/svc/SvcIssueRequestHdrController.java]
- 2026-09-06 — Approving enqueues `SVC_ISSUE_REQUEST_HDR_PROCESSOR` ("Move Approved row to svc issue hdr"), which runs `SELECT * FROM bl_svc_issue_request_hdr WHERE guid = :guid AND svc_issue_hdr_guid IS NULL AND approval_status = 'APPROVED'`, maps the row directly onto a `bl_svc_issue_hdr` object by column-name overlap, creates the service note, and writes its GUID back onto the request. `svc_issue_hdr_guid IS NULL` is the only idempotency guard. [src:git:blg-akaun-platform-java@1ff620ef0e akaun-api/.../jobProcessor/SvcIssueRequestHdrProcessor.java] [src:git:blg-akaun-platform-java@1ff620ef0e javasdk/.../dal/uow/svc/SvcIssueRequestHdrUow.java]
- 2026-09-06 — Requests can be created through `login-entity-ep`, which checks `UserPermissionService.isUserLoginEntity` rather than a permission — so a logged-in customer or supplier entity can raise its own RMA request, landing as `PENDING_APPROVAL`. [src:git:blg-akaun-platform-java@1ff620ef0e akaun-api/.../controller/tenant/dm/svc/SvcIssueRequestHdrController.java]
- 2026-09-06 — The approve/reject drop-down disables itself once the value is `APPROVED` or `REJECTED`; the backend endpoint does not enforce that and will accept any enum value. Every change is written to the applet audit trail with old and new containers. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce components/rma-submissions-container/rma-submissions-edit/rma-submissions-edit.component.ts]
- 2026-09-06 — **This applet is the only consumer of the Workflow Design engine.** A service note carries three independent workflow status fields — internal, customer-facing, supplier-facing — bound by `WORKFLOW_PROCESS_GUID`, `CUSTOMER_WORKFLOW_PROCESS_GUID` and `SUPPLIER_WORKFLOW_PROCESS_GUID`, plus a per-company `bl_fi_comp_workflow_gendoc_process_template_hdr` row written by the applet's Workflow Settings screen with `server_doc_type` hard-coded to `INTERNAL_SALES_RMA`. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce components/settings-container/workflow-settings-container/company-workflow-create/company-workflow-create.component.ts]
- 2026-09-06 — Application Settings is the counter-example to the unbound eight-toggle stub: **82 keys declared in the form group, all 82 rendered as controls, all 82 persisted by one `saveMasterSettingsInit` of `this.form.value`, 68 consumed.** The dead 14 are `HIDE_CUSTRMA_DOC_NO`, `HIDE_SUPRTV_DOC_NO`, `HIDE_WORKFLOW_STATUS`, `HIDE_WORKFLOW_RESOLUTION` and `ITEM_CATEGORY_GROUP_1`…`_10`. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce components/settings-container/field-configuration/]
- 2026-09-06 — `SHOW_CUSTOMER_WORKFLOW_STATUS` and `SHOW_SUPPLIER_WORKFLOW_STATUS` are opt-in, not hide toggles; the internal workflow status has no working hide key because `HIDE_WORKFLOW_STATUS` is dead. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce components/settings-container/field-configuration/field-configuration.component.html]
- 2026-09-06 — Return reasons (`svc/return-reasons`) and request actions (`svc/request-actions`) have their own `TNT_API_DM_SVC_RETURN_REASON_*` / `_REQUEST_ACTION_*` families for write, but **their listings — and the RMA Report (`svc/rma-reports`) — are gated by `TNT_API_DM_SVC_ISSUE_HDR_ADMIN/OWNER/READ`**. A user with the reason family and not the issue-header family can create codes and cannot see them. [src:git:blg-akaun-platform-java@1ff620ef0e akaun-api/.../controller/tenant/dm/svc/SvcReturnReasonController.java] [src:git:blg-akaun-platform-java@1ff620ef0e akaun-api/.../controller/tenant/dm/svc/RMAReportExportController.java]
- 2026-09-06 — Only four (or six) service-note controls carry `Validators.required`: Branch, Location, Status, and — when `ENABLE_PIC_SELECTION` is on — Assignee and Reporter. `HIDE_BRANCH` and `HIDE_LOCATION` remove the controls without removing the validators, which silently disables SAVE. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce components/service-note-container/service-note-create/main-details/main-details.component.ts]
- 2026-09-06 — The service note's own `status` field is `ACTIVE` / `INACTIVE` and is not the workflow status. A separate nine-value progress list (Ready to send out from Branch … close) is hard-coded in the applet and is not configurable. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce models/customer-constants.ts] [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce models/constants/sales-invoice-details.constants.ts]
- 2026-09-06 — `SERVICE_NOTE_DETAILS_TAB_ORDER` (Default Selection) orders the seven service-note tabs and appends any tab missing from the saved list at the end, so a tab added in a later release still shows. Six of the seven have `HIDE_*` keys; Main Details cannot be hidden. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce components/service-note-container/service-note-edit/service-note-edit.component.ts]
- 2026-09-06 — Unusually for this codebase, **every entry the shared settings shell renders here has a matching route** (Permission Wizard, Permission Set, User Permission, Role Permission, Release Notes, Applet Log). Two routes have no menu link (`webhook`, `feature-visibility`) and `client-side-permission-listing` is the default redirect for `settings`. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce app.routing.ts] [src:git:blg-shared-utilities@04bb553 modules/settings/settings.component.html]
- 2026-09-06 — Personalization → Default Selection is broken exactly as in the Fixed Asset applet: the component never assigns `appletContainer` (the subscription is commented out), so the branch and location change handlers dereference `undefined` and SAVE emits nothing. The Personalization menu's Field Settings entry is commented out here, so it does not 404 as it does in Fixed Asset. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce components/personalization-container/personal-default-settings/personal-default-settings.component.ts]
- 2026-09-06 — The Supplier RTV Line listing renders under the heading "Customer RMA Line Items Listing"; the supplier component re-uses the customer component's title. [observed in a product capture, staging tenant]
- 2026-09-06 — The repo contains a parallel `internal-rma-applet (obsolete)` project directory with its own `app.routing.ts` — a trap for anyone grepping the repo for routes. [src:git:blg-applet-wavelet-internal-rma-applet@bb89fce]

## How it connects

- **workflow-design** — the only place the Workflow Design engine is actually used. A service note's
  three status fields are positions in three workflow processes; the available-status endpoint's
  transition → role → user join is why a user with no Role row sees an empty drop-down. Workflow
  Settings here writes the per-company binding.
- **document-approval** — the optional generic-document approval on `bl_fi_generic_doc_approval_*`
  can apply to the Customer RMA and Supplier RTV *documents*, but the **RMA Request** approval is a
  different engine entirely, on a different table, with a different enum and no settings screen. Do
  not transfer facts between them.
- **stock-balance** — Supplier RTV is a stock-moving document (quantity signum +1); Customer RMA is
  not. Any page listing which documents move stock must include the former and exclude the latter.
- **customer-maintenance / supplier-applet** — the entity on each record; the `login-entity-ep`
  request path depends on the entity having a login.
- **warranty-admin** — purchase date, warranty expiry and extended expiry live on the service note
  and are the same dates that applet manages.

## Open questions

- Is the RMA Request approval ever bypassed in practice — that is, do tenants create service notes
  directly and leave the request inbox unused? The two paths write the same table from different
  ends.
- Does any tenant have all three workflow process settings populated, or is the customer/supplier
  status pair effectively unused? Both are opt-in behind `SHOW_*` keys.
- `ITEM_CATEGORY_GROUP_1..10` are ten multi-select label-list controls that persist and are never
  read. Were they intended to filter which item categories a service note can accept?
- The service note carries a full charge breakdown (parts, labour, disposal, tax, total, paid) and
  posts no journal from it. Where is service revenue recognised — a separate Sales Invoice, or not
  at all?

## Wiki impact

- `content/en/applets/rma/internal-rma-applet.md` — rewritten from a guide-voice page on 2026-09-06;
  carries all of the above.
- `content/en/applets/master-data/workflow-design-applet.md` — should name this applet as the
  engine's only consumer, and mention the three-process pattern and the per-company
  `bl_fi_comp_workflow_gendoc_process_template_hdr` binding written from RMA's Workflow Settings.
- Any page or guide claiming that a Customer RMA restocks the item or raises a credit is wrong.
  Both signums are zero.
