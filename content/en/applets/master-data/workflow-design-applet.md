---
title: "Workflow Design Applet"
description: "Reference for the Workflow Design applet — the tenant-wide catalogue of workflow processes, statuses, resolutions and transitions that document applets attach to their documents as an approval-style status track."
applet_code: "workflow_design_applet"
page_type: applet
applet_repo: "blg-applet-wavelet-workflow-design-applet"
modules: [core, financial-accounting, sales-crm, purchasing, inventory]
related_applets: [organisation-applet, employee-applet, tenant-admin-applet, internal-sales-order-applet, internal-sales-invoice-applet, internal-sales-quotation-applet, internal-sales-credit-note-applet, internal-sales-debit-note-applet, internal-sales-return-applet, internal-purchase-order-applet, internal-purchase-requisition-applet, internal-purchase-return-applet, internal-packing-order-applet, internal-outbound-delivery-order-applet, internal-rma-applet, car-workshop-applet, stock-take-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/app.routing.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/app.module.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/settings-container/applet-settings.module.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-shared-utilities/modules/settings/settings.component.html
    - blg-shared-utilities/modules/settings/settings.module.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/utilities/company-workflow-dropdown/company-workflow-dropdown.component.ts
    - blg-applet-wavelet-internal-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-applet/src/app/components/settings-container/workflow-settings-container/company-workflow-create/company-workflow-create.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntWFPermissions.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet workflow_design_applet — no rows)
  fields:
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-create/process-details-create/process-details-create.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-create/process-details-create/process-details-create.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-create/workflow-design-process-create.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-create/process-status-create/process-status-create.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-create/process-transition-create/process-transition-create.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/workflow-design-process-edit-main/design-workflow-process-edit-main.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/process-edit-status/status-listing/status-listing.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/process-edit-status/status-edit/status-edit.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-status-container/process-status-create/process-status-create.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-resolution-container/workflow-design-process-resolution-create/workflow-design-resolution-create.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/workflow-design-process-edit-transition/transition-details-add/transition-details-add.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/workflow-design-process-edit-transition/transition-details-edit/transition-details-edit.component.html
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/workflow-design-process-edit-transition/transition-role/add-role/transition-role-add.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/workflow-design-process-edit-transition/transition-subscriber/add-subscriber/transition-subscriber-add.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/workflow-design-process-edit-transition/transition-triggers/transition-trigger-create/transition-trigger-create.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/transition-action-container/transition-action-create/transition-action-create.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/transition-action-type-container/transition-action-type-create/transition-action-type-create.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/models/constants/options.ts
    - pcimage/tables/bl_wf/bl_wf_md_process_hdr.sql
    - pcimage/tables/bl_wf/bl_wf_md_process_status.sql
    - pcimage/tables/bl_wf/bl_wf_md_process_status_link.sql
    - pcimage/tables/bl_wf/bl_wf_md_transition.sql
    - pcimage/tables/bl_wf/bl_wf_md_resolution.sql
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/wf/md/ProcessStatusUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/wf/md/ProcessStatusController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/wf/md/ProcessDataConsistencyObjects/ProcessHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/wf/md/ProcessStatusDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/wf/md/ProcessStatusLinkDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/wf/md/TransitionDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/wf/md/ProcessStatusService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/wf/md/TransitionActionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/wf/md/ProcessTransitionNotificationSubscriberService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/svc/SvcIssueProcessStatusProcessorHelperMethods.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/svc/SvcIssueProcessStatusProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentHdrDataConsistencyObject.java
    - blg-shared-utilities/modules/gen-doc-simplified-ui/gen-doc-simplified-ui.component.ts
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/internal-sales-order-container/internal-sales-order-view/internal-sales-order-view.component.ts
    - pcimage/tables/bl_fi/bl_fi_comp_workflow_gendoc_process_template_hdr.sql
    - pcimage/tables/bl_fi/bl_fi_generic_doc_hdr.sql
    - pcimage/tables/bl_wf/bl_wf_md_process_transition_to_transition_trigger.sql
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/wf/md/ProcessStatusUow.java
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/process-edit-status/status-listing/status-listing.component.ts
    - blg-applet-wavelet-workflow-design-applet/micro-fe/projects/wavelet-erp/applets/workflow-design-applet/src/app/components/workflow-design-process-container/workflow-design-process-edit/workflow-design-process-edit-transition/transition-triggers/transition-trigger-create/transition-trigger-create.component.ts
    - blg-shared-utilities/utilities/company-workflow-dropdown/company-workflow-dropdown.component.ts
    - gh:bigledger/blg-intranet#3251
    - gh:bigledger/blg-intranet#4404
    - gh:bigledger/blg-intranet#4420
    - gh:bigledger/blg-intranet#4421
    - gh:bigledger/blg-applet-wavelet-workflow-design-applet#5
tags:
- workflow-automation
- business-process
- approval-workflow
- process-design
- core-module
weight: 90
---

## Overview

Workflow Design is the tenant-wide catalogue of **workflow processes**. A process is a named set of statuses joined by transitions; document applets attach one process per company and then show the document's current status and the statuses the signed-in user is allowed to move it to. The applet itself creates no documents, moves no stock and posts no journal — it only writes the `bl_wf_md_*` master-data tables.

It is a tenant-administrator screen (`applet_type` TNT-ADMIN in the registry). You open it once when configuring a company's approval track, then rarely again.

{{< callout type="warning" >}}
**Workflow Design is not the Document Approval engine.** BigLedger has a second, unrelated mechanism — `bl_fi_generic_doc_approval_hdr` / `_setting` / `_sequence` / `_request`, driven by a backend processor with pending-approval and rejection e-mails — configured from the **Approval Settings** screens of [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Requisition](/applets/purchase-workflow/internal-purchase-requisition-applet/) and Stock Requisition. Workflow Design's processes and that approval engine do not read each other. If you need a multi-approver sequence with notifications, that is the other feature — and it is **optional**: it is off until someone creates an Approval Setting, and even then it never blocks FINAL. See [Document Approvals](/guides/document-approvals/).
{{< /callout >}}

## Where it fits

| Direction | What | Why |
|---|---|---|
| Before | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Transitions are gated by **roles** (`app_mst_role`) and by role-to-user assignment (`app_mst_link_subject_to_role`). Both are maintained there. Without them a transition offers nobody anything. |
| Before | [Organization](/applets/master-data/organisation-applet/) | A process is attached to a **company**, so the companies must exist first. |
| Here | Workflow Design | Defines processes, the global status catalogue, resolutions, transitions, transition roles, subscribers, actions and cross-process triggers. |
| After | Document applets' **Settings → Workflow Settings** | Links a process to a company + this applet's document type, writing `bl_fi_comp_workflow_gendoc_process_template_hdr`. Only linked processes appear in the applet's Application Settings. |
| After | Document applets' **Settings → Application Settings → Workflow** | `WORKFLOW_PROCESS_GUID` picks the process for new documents; `FINAL_STATUS_GUID` picks the status at which the FINAL button becomes available. |
| At runtime | Any document with `wf_process_hdr_guid` | The status drop-down on the document is filled by the backend's *available process statuses* endpoint, filtered by the signed-in user's roles. |

Thirty-one organisation applet repositories reference the available-status service, including [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Quotation](/applets/sales-workflow/internal-sales-quotation-applet/), [Sales Credit Note](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Return](/applets/sales-workflow/internal-sales-return-applet/), [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Requisition](/applets/purchase-workflow/internal-purchase-requisition-applet/), [Purchase Return](/applets/purchase-workflow/internal-purchase-return-applet/), [Packing Order](/applets/manufacturing/internal-packing-order-applet/), [Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/), [RMA](/applets/rma/internal-rma-applet/), [Car Workshop](/applets/sales-workflow/car-workshop-applet/) and [Stock Take](/applets/inventory-workflow/stock-take-applet/).

## Screens and menus

The applet mounts at `applets/akaun/workflow-design-applet` and opens on **Process**.

| Sidebar item | Route | What it lists |
|---|---|---|
| Process | `process` | Every workflow process. Columns: Name, Description, Type, Created By, Date Created, Updated By, Date Updated. Only a **Create** button — no export, no print. |
| Process Status | `process-status` | The **global** status catalogue (Code, Name, Description). Statuses are not owned by a process; a process borrows them. |
| Process Resolution | `process-resolution` | The global resolution catalogue (Code, Name, Description). |
| Action | `transition-action` | `bl_wf_md_action` rows — an action belongs to a process and an action type. |
| Action Type | `transition-action-type` | `bl_wf_md_action_type` rows — free-text categories for actions. |

### Process create versus process edit

**Create Process** has three tabs — Details, Status, Transition — but only *Details* works: the Status and Transition tabs are grids bound to a hard-coded empty array (`[rowData]="[]"`), with no Add control. Statuses and transitions can only be added after the process is saved.

**Edit Process** has three working tabs:

- **Main** — Name, Description, Type, Starting Status.
- **Status** — the statuses linked to this process, with Sequence no. The **+** button opens the global Process Status catalogue as a multi-select list; ticking rows and saving creates one `bl_wf_md_process_status_link` per tick.
- **Transition** — the transitions of this process. Opening one gives five sub-tabs: **Details**, **Transition Triggers**, **Role**, **Subscriber**, **Action**.

### Settings and personalization

Settings is reached from the sidebar gear. The navigation is drawn by the shared settings shell, so it shows three groups.

{{< figure src="/images/workflow-design-applet/settings-feature-visibility.png" title="Applet Settings" caption="The settings navigation: System Configuration (Application Settings, Default Selection, Printable Format Settings), Server Side Permissions, Developer Tools. The tab strip belongs to the shared Application Settings screen." >}}

Personalization offers one screen, **Default Selection** (personal Default Branch / Default Location).

## Configuration

### Before you can use it

| Prerequisite | Where | Why it matters |
|---|---|---|
| Roles, and users assigned to them | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | A transition with no **Role** row is invisible to everyone — see [Lifecycle and effects](#lifecycle-and-effects). |
| At least one company | [Organization](/applets/master-data/organisation-applet/) | The company-to-process link is per company. |
| Server-side permissions on the workflow endpoints | Settings → Permission Wizard / Permission Set / User Permission / Role Permission | Every screen here is gated by the `TNT_API_DM_WF_MD_*` permission family. |
| A document applet whose Workflow Settings you can reach | e.g. [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/) | A process that is never linked to a company + applet is inert. |

### Applet settings

`app.routing.ts` maps `settings/field-settings` to the **shared** `FieldConfigurationComponent` from `blg-shared-utilities`, not to a local one. The applet also declares a local `field-configuration.component` in `AppletSettingsModule`, but it is routed nowhere and its eight slide toggles have no `formControl` binding and no SAVE handler — the same dead stub found in several other master-data applets. Ignore it; it is not what you see in the browser.

Because the shared screen is keyed by `sessionStorage.appletCode` and `workflow_design_applet` has **no entry** in its `tabMappings`, the applet-specific tabs stay hidden while every ungated control still renders. A gate walk of the shared template gives **235 rendered controls** at the commit this applet pins for `blg-shared-utilities` (237 at shared-utilities HEAD), plus 60 more whose gates are only decided at runtime. None of them is read by this applet: the only key it consumes from `APPLET_SETTINGS` is `PRINTABLE`.

{{< callout type="warning" >}}
**Application Settings here is a decoy.** The screen shows the full generic-document settings set — line-item columns, tax toggles, e-Invoice fields, even its own *Workflow Selection* panel with `WORKFLOW_PROCESS_GUID` and `FINAL_STATUS_GUID`. Saving them writes an `APPLET_SETTINGS` extension row against this applet, and nothing in Workflow Design ever reads it. Configure documents from the document applet's own settings screen.
{{< /callout >}}

The settings that do exist:

Only a tenant administrator reaches these screens; both write to the applet's `APPLET_SETTINGS` extension row (Personalization writes the per-user equivalent).

| Setting | Screen | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| `PRINTABLE` | Printable Format Settings → *set as default* | The printable format marked default in this applet's printable list. | Unset (no default row) | Changes which row the listing flags as default. The applet has no print button, so nothing else changes. |
| `DEFAULT_BRANCH` | Settings → Default Selection | Written and read back by this screen only. | Null (empty drop-down) | None elsewhere — no screen in Workflow Design is branch-scoped. |
| `DEFAULT_LOCATION` | Settings → Default Selection | As above. Auto-filled from the chosen branch's `MAIN_LOCATION` extension. | Null | None elsewhere. |
| `DEFAULT_COMPANY` | Settings → Default Selection | Not a control; set silently from the chosen branch's company. | Null | None elsewhere. |

{{< figure src="/images/workflow-design-applet/settings-default-selection.png" title="Default Selection" caption="Applet Default Settings — Default Branch and Default Location. Both are stored, read back by this screen, and used nowhere else in the applet." >}}

Personalization → Default Selection renders the same two controls and saves them as personal settings; they are equally unused.

**Printable Format Settings** lists and uploads printable formats, but its query is hard-coded to `txn_type = INTERNAL_BLANKET_PURCHASE_ORDER` (a copy-paste constant left in `applet-constants.ts`). It therefore shows blanket-purchase-order printables, and any format added here is tagged as one.

**Two routes exist with no navigation link.** `settings/webhook` and `settings/feature-visibility` are routed, but the shared settings shell has their menu group commented out. `settings` with no child redirects to `feature-visibility`, so that is the screen you land on when you click the gear. The Webhook screen is reachable only by typing the URL.

{{< figure src="/images/workflow-design-applet/settings-webhook.png" title="Applet Triggers (webhook)" caption="The shared webhook screen at settings/webhook. It is routed but has no link in the settings navigation." >}}

Conversely, the shared shell renders a **Release Notes** link under Developer Tools for which this applet has no route; following it falls through to the 404 page.

### Settings in other applets that control this applet

Nothing in another applet changes how Workflow Design behaves. These are the settings that decide where a process you design here is actually *used*:

| Setting | Where it is set | Effect |
|---|---|---|
| Company ↔ process link | Document applet → Settings → **Workflow Settings** → Company Listing → Create | Writes `bl_fi_comp_workflow_gendoc_process_template_hdr` with `company_guid`, `process_hdr_guid`, `process_hdr_code` (copied from the process name), `server_doc_type` and `applet_guid`. Until this row exists the process is invisible to that applet. |
| `WORKFLOW_PROCESS_GUID` | Document applet → Settings → Application Settings → *Workflow Selection* | The drop-down lists only company-process links whose `applet_guid` equals the current applet. Choosing one makes new documents start on that process. |
| `FINAL_STATUS_GUID` | Same panel, appears once a process is chosen | The status at which the document's **FINAL** button is offered. Options come from the process's status links. |

The Workflow Settings screen exists in twenty-four organisation applet repositories, among them Purchase Order, Purchase Requisition, Purchase Return, Consignment Purchase Order, Purchase Order Supplier Access, Packing Order, Outbound Delivery Order, Job Sheet, RMA, Cashflow Projection and the sales quotation / order / invoice / proforma / credit note / debit note / return / refund note family.

### Feature visibility / permissions

**No client-side permission definitions are seeded for this applet.** A query of `bl_applet_client_side_perm_dfn` joined to `bl_applet_hdr` on code `workflow_design_applet` returns no rows, so the Client Side Permission screen has nothing to grant and no `SHOW_*` / `HIDE_*` code applies here.

Access is therefore entirely server-side. Each screen calls endpoints guarded by one of the `TNT_API_DM_WF_MD_*` permission groups, each with OWNER / ADMIN / MEMBER / CREATE / UPDATE / DELETE / READ members:

| Screen | Permission group |
|---|---|
| Process listing, create, edit | `TNT_API_DM_WF_MD_PROCESS_*` |
| Process Status catalogue | `TNT_API_DM_WF_MD_PROCESS_STATUS_*` |
| Statuses linked to a process | `TNT_API_DM_WF_MD_PROCESS_STATUS_LINK_*` |
| Transitions | `TNT_API_DM_WF_MD_TRANSITION_*` |
| Transition → Role | `TNT_API_DM_WF_MD_TRANSITION_ROLE_LINK_*` |
| Transition → Action | `TNT_API_DM_WF_MD_TRANSITION_ACTION_*` |
| Action / Action Type | `TNT_API_DM_WF_MD_ACTION_*`, `TNT_API_DM_WF_MD_ACTION_TYPE_*` |
| Resolutions | `TNT_API_DM_WF_MD_RESOLUTION_*`, `..._RESOLUTION_LINK_*` |

The available-status endpoint that documents call at runtime checks `TNT_API_DM_WF_MD_PROCESS_STATUS_READ`. A user without it gets a not-authorised response rather than an empty list.

## Fields

### Process (Details tab)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Name | Process name. Also copied into `process_hdr_code` when a company link is created. | Yes (`Validators.required`) | Stored in `bl_wf_md_process_hdr.name`. No uniqueness check anywhere — two processes may share a name. |
| Description | Free text. | Marked `required` in the template but the control carries **no validator** — the asterisk shows and the form still saves empty. | `bl_wf_md_process_hdr.description`. |
| Type | SEQUENTIAL, PARALLEL, CYCLIC or CONDITIONAL. | Yes | Stored in `wf_type`. **Label only** — no backend code branches on it. |
| Starting Status | Edit tab only. The status a new document starts on. | No | Stored in `default_process_status_guid`. Options come from the process's own status links, so it can only be set after statuses are linked. |

Module, Applet, Company, Branch and Location controls are commented out in both the create and the edit template. The columns exist on `bl_wf_md_process_hdr` but the applet never populates them; company scoping happens in the document applet's Workflow Settings instead.

### Process Status (global catalogue)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Code | Short code. | Yes | Written to `bl_wf_md_process_status.code`. This is the value the backend stamps onto a document as `wf_process_status_code`. No uniqueness validator. |
| Name | Display name. | Yes | Shown in listings. |
| Description | Free text. | No | |

### Status linked to a process (Edit → Status → open a row)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Code | Read-only. Copied from the catalogue status at link time. | — | |
| Name | The label shown in the document's status drop-down. | Yes | Copied at link time; editing it here does **not** change the catalogue, and renaming the catalogue status does not change this copy. |
| Sequence number | Ordering used by the *ordered by sequence* variant of the available-status endpoint. | No | Integer, `min="0"`. Left null when a status is first linked. |
| Resolution | One of the global resolutions. | No | Stored as `process_resolution_guid` / `process_resolution_code` on the link row. |
| Description | Free text. | No | |

A **DELETE** button (two-click confirm) removes the link.

### Process Resolution

Code (required), Name (required), Description. Written to `bl_wf_md_resolution`.

### Transition (Edit → Transition → +)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| From Status | `current_process_status_guid`. | Yes | Options are the process's status links. |
| To Status | `next_process_status_guid`. | Yes | Choosing the same value as From Status clears the other drop-down (client-side only). |

The transition **Name** is generated, not typed: `"<From name> --> <To name>"`.

### Transition sub-tabs

| Sub-tab | Fields | Written to |
|---|---|---|
| Role | Role Code and Role Name, both drop-downs over `app_mst_role`. | `bl_wf_md_transition_role_link.transition_guid`, `role_guid`. Nothing else on the row is populated. |
| Subscriber | Role Code / Role Name, same drop-downs. | `bl_wf_md_process_transition_notification_subscriber.process_transition_guid`, `role_guid`. `login_subject_guid` is never set from this screen. |
| Action | Action (drop-down over the process's actions), Description. | `bl_wf_md_transition_action.transition_guid`, `action_guid`, `description`. |
| Transition Triggers | Trigger type (Transition to Transition / Target Status), Process, then either Transition or Target Status. | `bl_wf_md_process_transition_to_transition_trigger`, with `type` = `TRANSITIONS` or `TARGET_STATUS`. |

### Action and Action Type

**Action Type**: Name, Description. **Action**: Name (required), Process (required), Action Type (required), Status ACTIVE/INACTIVE (required), Description.

Note that the Action's *Name* is saved to `bl_wf_md_action.namespace` — the table has no name column — while the listing's Name column reads that same field.

## Lifecycle and effects

Workflow Design is master data. It **writes no `bl_fi_generic_doc_*` row, no `bl_inv_txn_line` and no journal**; it has no server document type, no amount or quantity signum and no posting. `applet-constants.ts` still carries `docType = "INTERNAL_BLANKET_PURCHASE_ORDER"` with both signums 0, left over from the applet this one was forked from; it is used only by the Printable Format Settings query.

### What it writes

| Table | Written by |
|---|---|
| `bl_wf_md_process_hdr` | Process create / edit |
| `bl_wf_md_process_status` | Process Status catalogue |
| `bl_wf_md_process_status_link` | Edit → Status (one row per ticked catalogue status) |
| `bl_wf_md_resolution` | Process Resolution |
| `bl_wf_md_transition` | Edit → Transition |
| `bl_wf_md_transition_role_link` | Transition → Role |
| `bl_wf_md_process_transition_notification_subscriber` | Transition → Subscriber |
| `bl_wf_md_action`, `bl_wf_md_action_type`, `bl_wf_md_transition_action` | Action, Action Type, Transition → Action |
| `bl_wf_md_process_transition_to_transition_trigger` | Transition → Transition Triggers |

Row status is a plain `ACTIVE` / `DELETED` string on every table. Create and update run a data-consistency object that checks GUID presence, foreign-key existence, audit columns, status and revision — nothing more. There is **no uniqueness validator, no "status belongs to this process" validator and no in-use check on delete**: `ProcessStatusService.delete` removes the row without asking whether any process or document references it.

### How a document consumes a process

1. **Design.** Create the process, link statuses, set the Starting Status, add transitions, and give each transition at least one **Role**.
2. **Link.** In the document applet: Settings → Workflow Settings → pick a company → pick the process. This writes `bl_fi_comp_workflow_gendoc_process_template_hdr` with that applet's GUID and document type.
3. **Select.** In the same applet: Settings → Application Settings → Workflow Selection → choose the process (`WORKFLOW_PROCESS_GUID`) and, optionally, the final status (`FINAL_STATUS_GUID`).
4. **New document.** The shared document form reads `WORKFLOW_PROCESS_GUID`, fetches the process, and stamps `wf_process_hdr_guid` plus `wf_process_status_guid` = the process's `default_process_status_guid` onto the header.
5. **Editing.** The form calls `GET .../wf/md/process-status/available-process-statuses/backoffice-ep?processHdrGuid=…&currentStatusGuid=…`. The SQL behind it joins transition → next status → **transition role link → role → role-to-user link**, restricted to the signed-in user's subject GUID. The current status is prepended to the result, so the drop-down always offers "stay where you are" plus whatever the user's roles permit.
6. **Saving.** The chosen status GUID is written to `wf_process_status_guid`, and the backend fills `wf_process_status_code` from the status catalogue.

{{< callout type="warning" >}}
**The status track is enforced in the browser, not by the backend.** `GenericDocumentHdrDataConsistencyObject` validates only that `wf_process_hdr_guid` and `wf_process_status_guid` *exist* (`GENERIC_DOC_HDR_WF_PROCESS_HDR_GUID_GUID_DOES_NOT_EXIST`, `GENERIC_DOC_HDR_WF_PROCESS_STATUS_GUID_DOES_NOT_EXIST`). It does not check that the status belongs to the process, nor that a transition exists from the previous status. An API client may set any existing status on any document.
{{< /callout >}}

### The one real gate: FINAL_STATUS_GUID

Where a document applet implements it, the FINAL button is hidden until the document's current workflow status equals `FINAL_STATUS_GUID` (the Sales Order V2 view combines it with `HIDE_GENDOC_FINAL_BUTTON`, `SHOW_FINAL_BUTTON`, row status ACTIVE and posting status DRAFT). Leaving `FINAL_STATUS_GUID` unset disables the gate — the button shows at any status.

This is **button visibility**, not a backend rejection: a FINAL posted through the API is not checked against the workflow status.

### What transition actions, subscribers and triggers actually do

| Object | Executed by |
|---|---|
| Transition **Action** / Action Type | Nothing. `ActionService`, `ActionTypeService` and `TransitionActionService` are create/update/delete only; no job processor, notification service or posting path reads these tables. |
| Transition **Subscriber** | Nothing. `ProcessTransitionNotificationSubscriberService` is CRUD only; there is no workflow notification processor. (`IssueEmailNotificationProcessor` belongs to the `bl_wf_issue` tracker, not to `bl_wf_md_*`.) |
| Transition **Trigger** | Only Service Note / RMA. `SvcIssueProcessStatusProcessorService` looks up the transition that matches the old→new status change, finds triggers whose `from_process_transition_guid` matches, and updates the service issue's internal / customer / supplier status. For `TRANSITIONS` triggers it first checks that the target's current status equals the target transition's `current_process_status_guid`; for `TARGET_STATUS` it sets the status directly. No equivalent processor exists for generic documents. |

So: e-mails, SMS, webhooks and "database updates on status change" are **not** implemented for `bl_wf_md_*`. Anything a status change should trigger elsewhere has to come from the Document Approval engine, or from the platform's webhook subscriptions (`bl_webhook_topic_hdr` / `bl_webhook_subscription_hdr`) — and those fire on the 53 seeded data events in `WebhookTopics`, none of which is a workflow status change.

## Related applets

- [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) — supplies the roles and the role-to-user assignments that decide who may take a transition.
- [Organization](/applets/master-data/organisation-applet/) — the companies a process is linked to.
- [Employee](/applets/master-data/employee-applet/) — designations and staff records behind the people who approve.
- [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/) and [Purchase Requisition](/applets/purchase-workflow/internal-purchase-requisition-applet/) — carry both a Workflow Settings screen (this applet's processes) and the separate Approval Settings screens of the Document Approval engine.
- [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Quotation](/applets/sales-workflow/internal-sales-quotation-applet/), [Sales Credit Note](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Return](/applets/sales-workflow/internal-sales-return-applet/) — attach a process per company and show the status drop-down.
- [Packing Order](/applets/manufacturing/internal-packing-order-applet/) and [Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/) — warehouse-side consumers.
- [RMA](/applets/rma/internal-rma-applet/) and [Car Workshop](/applets/sales-workflow/car-workshop-applet/) — service-note documents; the only consumers whose transition **triggers** are executed.
- [Stock Take](/applets/inventory-workflow/stock-take-applet/) — stamps the process's Starting Status onto a session and offers the same transition list, but enforces nothing.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The status drop-down on a document is empty except the current status. | The available-status query inner-joins transition → role link → role → role-to-user link. A transition with **no Role** row, or a user in none of the linked roles, yields nothing. | Open Edit Process → Transition → the transition → **Role** and add at least one role; check in Tenant Admin that the user is assigned to it. |
| A process does not appear in a document applet's Workflow Selection drop-down. | The drop-down filters `bl_fi_comp_workflow_gendoc_process_template_hdr` on `applet_guid` = the current applet. No company link, or a link created from a different applet, means no option. | Create the link from **that** applet's Settings → Workflow Settings, not from another one. |
| New documents have no workflow status at all. | `WORKFLOW_PROCESS_GUID` is unset in the applet's Application Settings, or the process has no **Starting Status** — the form stamps `default_process_status_guid`, which is null until you set it in Edit Process → Main. | Set both. Starting Status can only be chosen after statuses are linked to the process. |
| The FINAL button never appears. | `FINAL_STATUS_GUID` is set to a status the document has not reached, and the user's roles offer no transition to it. | Either clear `FINAL_STATUS_GUID` or give the approving role a transition into that status. |
| The FINAL button appears too early. | `FINAL_STATUS_GUID` is unset, so the gate is off. | Set it to the approved status. |
| A status was renamed in the Process Status catalogue but documents and drop-downs still show the old label. | The status link copies `name`, `code` and `description` at link time; the catalogue and the link then drift. | Edit the label on the link row (Edit Process → Status → open the row), or unlink and relink the status. |
| Statuses come back in a strange order. | `sequence_no` is not populated when a status is linked; the ordered endpoint sorts on it. | Set Sequence number on each status link. |
| The same status appears twice in a process. | Nothing prevents linking the same catalogue status twice — no uniqueness validator on `bl_wf_md_process_status_link`. | Delete the duplicate link. |
| A deleted status leaves documents showing a status that no longer exists. | `ProcessStatusService.delete` performs no in-use check. | Re-create the status, or move the affected documents before deleting. |
| Transition Actions and Subscribers are configured but no notification is ever sent. | Working as built — nothing executes them (see [Lifecycle and effects](#lifecycle-and-effects)). | Use the Document Approval engine's notifications, or an applet trigger. |
| A trigger saves with an empty target. | The trigger form's SAVE button is never disabled; the guard only rejects a literal `404` sentinel, and the Transition control stays `required` even in Target Status mode. | Re-open the trigger and confirm the target process and transition/status are set. |
| Printable Format Settings lists formats that belong to purchase documents. | The listing filter is hard-coded to `txn_type = INTERNAL_BLANKET_PURCHASE_ORDER`. | Known defect; do not manage printables from this applet. |
| Clicking **Release Notes** in the settings navigation lands on a 404. | The shared settings shell renders the link; this applet has no `release-notes` route. | Known defect. |
| A saved Application Settings toggle here changes nothing on any document. | Application Settings on this applet renders the shared generic-document set, and Workflow Design consumes only `PRINTABLE`. | Configure documents from the document applet's own Application Settings. |

Related open work: making a stock-take session expose a single configurable workflow status and freeze the session at certain statuses (intranet #4420, #4421); the purchase-requisition Pending → Approve / Cancel workflow (intranet #3251); the applet's Angular 14 migration (repo issue #5).

## Related documentation

- [Core module](/modules-v2/core/) — where this applet sits.
- [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/) — the reference example of Workflow Settings plus the separate Approval Settings.
- [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) — roles, teams and permission sets.
