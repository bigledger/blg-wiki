---
title: "Engagement Applet"
description: "Reference for the audit/assurance/tax engagement register: the engagement record, fiscal year ends, engagement roles, categories and the settings that hide each field"
applet_code: "engagementApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-engagement-applet"
modules: [sales-crm]
related_applets:
  - customer-maintenance-applet
  - employee-applet
  - organisation-applet
  - entity-applet
guides: []
sources:
  screens_and_menus:
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/app.routing.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/services/engagement-pages.service.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/services/engagement-category-pages.service.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/services/audit-trail-pages.service.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-edit/engagement-edit.component.html
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-listing/engagement-listing.component.ts
  configuration:
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-edit/main-details/main-details.component.html
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-edit/engagement-role/engagement-role-main.component.html
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/engagement/EngagementHdrController.java
  fields:
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-edit/main-details/main-details.component.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-edit/fiscal-year-end/fiscal-year-end-create/fiscal-year-end-create.component.html
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-edit/fiscal-year-end/fiscal-year-end-edit/fiscal-year-end-edit.component.html
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/settings-container/engagement-category-container/engagement-category-listing/engagement-category-listing.component.ts
  lifecycle:
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/state-controllers/engagement-controller/store/effects/engagement.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/auditAssuranceTax/engagement/EngagementHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/auditAssuranceTax/engagement/EngagementHdrService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/engagement/EngagementHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/engagement/EngagementFyeHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/engagement/EngagementCategoryController.java
  troubleshooting:
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-edit/main-details/main-details.component.ts
    - blg-applet-wavelet-engagement-applet/micro-fe/projects/wavelet-erp/applets/engagement-applet/src/app/components/engagement-container/engagement-edit/main-details/select-customer/select-customer-listing.component.ts
tags:
- engagement-management
- client-projects
- fiscal-year-tracking
- employee-assignment
- professional-services
weight: 110
---

## Overview

The Engagement Applet is the client-file register for the **audit, assurance and tax** module. One
engagement is one client file: which customer entity it is for, which company and branch (job group)
bill it, which staff hold the engagement roles, and — for clients tracked by financial year — one
fiscal-year-end record per year with its own staff assignments.

It writes `bl_aat_engagement_hdr` and its links. It is a master-data applet: it posts no journal,
moves no stock and has no FINAL. The documents it shows on the **Gen Doc** tab are generic documents
raised elsewhere and linked to the engagement.

{{< callout type="info" >}}
Engagement records are normally loaded in bulk rather than typed. Engagement **Code** and
**Engagement Name** are both `readonly` in the form, and no code path in the applet at commit
`a6c58d6` sets either — the helper that composes the name from
*customer – code – company – branch* (`updateName`) exists but every call site is commented out. The
backend exposes `/etl-ep` create, update and delete endpoints alongside the back-office ones, which
is the route bulk loads take. See [Troubleshooting](#troubleshooting).
{{< /callout >}}

## Where it fits

| Direction | What | Why |
| :--- | :--- | :--- |
| Before | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) / [Entity](/applets/master-data/entity-applet/) | Customer Name is chosen from the entity list; the engagement stores `customer_entity_hdr_guid`, and the backend rejects an update whose customer or billing entity GUID does not exist. |
| Before | [Organization](/applets/master-data/organisation-applet/) | The branch drop-down supplies `branch_guid`; selecting a branch also fills `comp_guid` from that branch's company. Both are FK-checked on update. |
| Before | [Employee](/applets/master-data/employee-applet/) | Engagement roles and fiscal-year-end staff assignments are employee records. |
| Inside | Engagement Category (Settings) | A code/name/description list; the engagement listing has an Engagement Category column. |
| After | Generic documents | The Gen Doc tab lists documents (Doc type, Doc No, Status, Txn date, Amount) raised against the engagement. |
| After | Claims and Memorandum of Fees | Tabs exist in the template and are commented out; the backend has `bl_aat_claim_*` and `mof` families that reference the engagement. |

## Screens and menus

`app.routing.ts` mounts everything under `applet/tnt/wavelet/erp/aat-engagement`. The sidebar has a
**single** entry — **Engagement Listing**; a commented-out "Claimant" group with *My Claim* and
*Line Reports* is not routed.

### Engagement Listing

A server-side ag-grid over `bl_aat_engagement_hdr`. Columns: Engagement Code, Engagement Name,
Engagement Category, Entity Name, Created Date, Created By, Modified Date, Modified by, Status.
A grid/list view toggle sits next to the search box.

Pressing **+** POSTs an **empty engagement header** to the server straight away and opens Edit
Engagement on it — there is no draft. Abandoning the screen leaves a blank engagement in the list,
and unlike the applets that use a `TEMP` status there is no sweeper: the row is created `ACTIVE`.

### Edit Engagement

| Tab | Shown when | Contents |
| :--- | :--- | :--- |
| Main | always | The engagement record and the Engagement Roles block — see [Fields](#fields). |
| Fiscal Year End | FYE Type is `Yearly` | A grid of fiscal-year-end records (Date Start, Date End, Created Date, Modified Date, Status), each with its own employee assignment list (Employee Code, Employee Name, Role, Approval Level) and its own engagement-role block. |
| Gen Doc | always | Documents linked to this engagement: Doc type, Doc No, Status, Txn date, Amount. Read-only. |

Four further tabs are present in the template and commented out: **Employees** (the perpetual-tracking
counterpart of Fiscal Year End), **Memorandum of Fees**, **Claims** and **Issue Link**. The DELETE
button block at the bottom of the screen is also commented out, so **an engagement cannot be deleted
from the UI**; the backend's `TNT_AAT_ENGAGEMENT_HDR_DELETE` endpoint is the only route.

**SAVE** is disabled whenever the Main form is invalid — that is, whenever Customer Name, Engagement
Code, Engagement Name or the branch is empty. It saves the engagement and the engagement-role
assignments together.

### Settings → Engagement Category

The settings gear opens on **Engagement Category** (it is the `settings` redirect target). A listing
of Code, Name, Description, Created Date, Modified Date with create and edit screens; the edit screen
has a **Main** tab and an **Engagements** tab listing the engagements in that category.

### Settings → Applet Log

`settings/applet-log` routes an audit-trail listing and a read-only view screen. It is routed but has
**no entry in the settings menu**, so it can only be reached by URL.

{{< callout type="warning" >}}
No screenshots are published on this page. The captures that existed showed a live tenant's real
client company names in the Engagement Code, Engagement Name and Entity Name columns and were
removed. Replacements have to come from a demo tenant with synthetic client names.
{{< /callout >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
| :--- | :--- | :--- |
| Customer entities | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | Customer Name is required and is picked from the entity listing. The backend rejects an update whose `customer_entity_hdr_guid` or `billing_entity_hdr_guid` does not resolve. |
| A branch, and a company behind it | [Organization](/applets/master-data/organisation-applet/) | The branch (labelled *Job Group* when the relabel setting is on) is required on the form; picking it sets the company. Both are FK-checked on update. |
| Employees | [Employee](/applets/master-data/employee-applet/) | Every engagement role and every fiscal-year-end assignment points at an employee. |
| Engagement categories | Settings → Engagement Category, in this applet | Only if you want the listing's Engagement Category column populated. |
| A claim approval setting, if used | The claims side of the audit/assurance/tax module | `approval_setting_guid` is FK-checked against `bl_aat_claim_approval_setting` on both create and update when it is set. |

### Applet settings

Settings live in an **applet-local** `FieldConfigurationComponent`
(`./components/settings-container/field-configuration/`) — `app.routing.ts` routes that one, not the
shared screen from blg-shared-utilities, even though the repository does carry the shared-utilities
submodule (METHOD §29). Unlike the unbound eight-toggle stub found in several other applets, this one
is real: 21 reactive form controls, patched from the session's master settings on load, and saved
through `SessionActions.saveMasterSettingsInit` — one `APPLET_SETTINGS` row in `bl_applet_ext`.

The screen is called **Application Settings** in the settings menu and has two tabs.

Anyone who can open Applet Settings can change these; they are tenant-wide for this applet.

**Tab: Engagement Listing**

| Setting | What it controls | Default | Effect when on |
| :--- | :--- | :--- | :--- |
| `HIDE_ENGAGEMENT_CREATE_BUTTON` | The **+** button on the listing | `false` | The create button disappears. Existing engagements can still be opened and edited. |
| `DISABLE_EDITING_ENGAGEMENTS` | The whole Main form and the engagement-role block | `false` | Both forms are `disable()`d on load — the engagement becomes read-only for everyone. |
| `HIDE_TOGGLE_BUTTON` | The grid-view / list-view toggle on the listing | `false` | The toggle disappears. |
| `RELABEL_COMPANY_TO_ENTITY` | The word used for the company | `false` | The label reads *Entity* instead of *Company*. Label only — the field still writes `comp_guid`. |
| `RELABEL_BRANCH_TO_JOB_GROUP` | The word used for the branch | `false` | The branch drop-down's label reads *Job Group* instead of *Branch*, including in the Engagement Name hint. |

**Tab: Main** — each of these hides one control on the Edit Engagement Main tab.

| Setting | Hides |
| :--- | :--- |
| `HIDE_CUSTOMER_NAME` | Customer Name |
| `HIDE_ENGAGEMENT_CODE` | Engagement Code |
| `HIDE_JOB_GROUP` | The branch / job-group drop-down |
| `HIDE_ENGAGEMENT_NAME` | Engagement Name |
| `HIDE_ALTERNATE_CODE` | Alternate Code |
| `HIDE_ENGAGEMENT_FYE_TYPE` | The Perpetual / Yearly radio group |
| `HIDE_STATUS` | Status |
| `HIDE_DESCRIPTION` | Description |
| `HIDE_ENGAGEMENT_MANAGER` | Engagement Manager (roles block) |
| `HIDE_ENGAGEMENT_DIRECTOR` | Engagement Director (roles block) |
| `HIDE_ENGAGEMENT_PARTNER` | Engagement Partner (roles block) |
| `HIDE_EQCR` | EQCR — Engagement Quality Control Reviewer (roles block) |
| `HIDE_KEY_AUDIT_PARTNER` | Key Audit Partner (roles block) |
| `HIDE_ENTITY_DETAILS_BUTTON` | The entity-details button |

{{< callout type="warning" >}}
Hiding a required field does not make it optional. Customer Name, Engagement Code, Engagement Name
and the branch all carry `Validators.required`; hiding one with `HIDE_CUSTOMER_NAME`,
`HIDE_ENGAGEMENT_CODE`, `HIDE_ENGAGEMENT_NAME` or `HIDE_JOB_GROUP` removes the control from the
template but not the validator, so SAVE stays disabled with no visible reason. Use these to hide
fields that are already populated, not to shorten the form.
{{< /callout >}}

**Two toggles on this screen do nothing:**

- `HIDE_MANAGING_PARTNER` renders as *Hide Managing Partner* and is saved, but the Managing Partner
  control in the roles block is not gated on it — the key appears only in
  `models/applet-settings.model.ts`.
- `ENABLE_AUDIT_TRAIL` renders as *Enable Audit Trail* and is saved, but the key appears nowhere else
  in the applet — not even in the settings model. The `settings/applet-log` route is not gated on it.

### Settings screens that are routed but not linked

`settings/default-selection` (Default Branch / Default Location) is routed, and its entry is
commented out of `settingItems`, so it has no menu link. `personalizationItems` is an empty array, so
the whole `personalization` sub-tree — personal default selection and the sidebar editor — is routed
with no way in. `settings/webhook`, `settings/feature-visibility`, the permission wizard, permission
set, user, team and role permission listings, and `settings/applet-log` are likewise routed without
menu entries.

### Feature visibility and permissions

The applet contains no `HIDE_*`/`SHOW_*` client-side permission pairing; visibility is decided by
the settings above. Server-side, every endpoint is gated:

| Action | Permission |
| :--- | :--- |
| Create an engagement | `TNT_AAT_ENGAGEMENT_HDR_CREATE` |
| Update an engagement | `TNT_AAT_ENGAGEMENT_HDR_UPDATE` |
| Delete an engagement | `TNT_AAT_ENGAGEMENT_HDR_DELETE` |
| Read engagements (listing, by GUID, query, custom containers) | `TNT_AAT_ENGAGEMENT_HDR_READ` |

The same permission set gates the `/etl-ep` variants of create, update, delete and read, so a bulk
loader needs exactly the same grants as a user.

## Fields

### Edit Engagement — Main

| Field | Meaning | Required | Notes |
| :--- | :--- | :--- | :--- |
| Customer Name | The client entity | Yes | Read-only; clicking it opens the entity selector. Stores `customer_entity_hdr_guid`. |
| Engagement Code | The client-file reference | Yes | **Read-only, and nothing in the applet writes it.** Unique across engagements — the backend rejects a duplicate with `AAT_ENGAGEMENT_HDR_OBJECT_CODE_ALREADY_EXISTS` and a blank one on update with `..._CODE_IS_NULL_OR_EMPTY`. |
| Branch *(label: Job Group when relabelled)* | The billing branch | Yes | Selecting it also sets the company (`comp_guid`) from that branch. |
| Engagement Name | The display name | Yes | Read-only. The composing helper joins *customer – code – company – branch* with " - " but is not called at this commit; existing records carry names in that shape. |
| Alternate Code | The customer's own code | No | Patched from the selected entity's `customer_code`. |
| FYE Type | `Perpetual` or `Yearly` | — | A radio group. `Yearly` is what makes the Fiscal Year End tab appear; a record with no value is treated as `Perpetual`. |
| Status | Engagement status | Effectively yes | A free-text input. The `mat-select` that offered a fixed list is commented out, so any string is accepted here — but the backend rejects a blank `engagement_status` on update with `..._ENGAGEMENT_STATUS_IS_NULL_OR_EMPTY`. |
| Description | Free text | No | |
| Engagement Roles | Engagement Manager, Engagement Director, Engagement Partner, Managing Partner, EQCR, Key Audit Partner | No | Each row has a **Non-Applicable** tick box; the ticks are stored in the header's `non_applicable_setting_json`. Saved together with the engagement. |
| Created By / Created Date / Modified By / Modified Date | Audit | — | Disabled controls; the display fields are commented out of the template, so they are not visible. |

### Fiscal Year End — create and edit

| Field | Required | Notes |
| :--- | :--- | :--- |
| Date Start | Yes | |
| Date End | Yes | |
| Status | Yes | |
| Created By / Modified By / Created Date / Modified Date | — | Read-only, edit screen only. |

Each fiscal-year-end record carries its own employee list (Employee Code, Employee Name, Role,
Approval Level) and its own engagement-role block, so staffing can change year to year.

### Engagement Category

Code, Name, Description, plus read-only audit fields. The edit screen's **Engagements** tab lists the
engagements in the category, ordered by code.

## Lifecycle and effects

### Posting proof

| Aspect | Value |
| :--- | :--- |
| Server document type | None. `bl_aat_engagement_hdr` is master data, not a generic document. |
| Amount signum / quantity signum | Not applicable — no `FinancialDocDataConsistencyObject`. |
| Dr/Cr equation | None. The applet posts no journal. |
| GL precedence | Not applicable. |
| Stock processor | None. |
| What VOID reverses | There is no VOID and no posting status. Records carry `status` (ACTIVE / INACTIVE) and a free-text `engagement_status`. |

### Statuses and the save path

There is no draft. **+** POSTs an empty `EngagementHdrContainer`; the backend fills GUID, created and
updated dates, `status = ACTIVE` and a revision, resolves the created-by and updated-by subject names,
and returns the row. The toast reads *"The engagement has been created"*. From then on every SAVE is
an update.

`EngagementHdrDataConsistencyObject` validates far more on **update** than on create:

| Checked on create | Checked on update |
| :--- | :--- |
| GUID present and new; `approval_setting_guid` resolves to a `bl_aat_claim_approval_setting` row if set; the code is not already taken; created/updated dates and subject GUIDs present; status; revision | all of the above, plus: `comp_guid` resolves to `bl_fi_mst_comp`; `branch_guid` resolves to `bl_fi_mst_branch`; `customer_entity_hdr_guid` and `billing_entity_hdr_guid` resolve to `bl_fi_mst_entity_hdr`; `running_no` is not blank; `code` is not blank **and** is unique; `engagement_status` is not blank |

So an engagement created by the empty-container path is invalid the moment you try to save it until
code, status, branch and customer are all set — which is why the Main form's required fields matter
more than they look.

`fillMissingDataForUpdate` auto-assigns `running_no` when it is blank, from
`app_sequence_counter` under module name `ENGAGEMENT_NO`, keyed by tenant code. It also refreshes
`created_by_name` and `updated_by_name` from `app_login_subject` on every update, so those denormalised
name columns track renames.

`fillMissingDataForCreation` does **not** assign `code`, `running_no` or `name`.

## Related applets

- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) and
  [Entity](/applets/master-data/entity-applet/) — the client behind every engagement; the Customer
  Name field is a picker over the entity listing.
- [Organization](/applets/master-data/organisation-applet/) — companies and branches; the branch
  choice determines the company on the engagement.
- [Employee](/applets/master-data/employee-applet/) — the people assigned to engagement roles and to
  each fiscal year end.

## Troubleshooting

| Symptom | Cause | Fix |
| :--- | :--- | :--- |
| SAVE stays greyed out with every visible field filled | Customer Name, Engagement Code, Engagement Name and the branch all carry `Validators.required`. Hiding one of them with the matching `HIDE_*` setting removes the control but not the validator, so an invisible empty field keeps the form invalid. | Turn the relevant `HIDE_*` setting off, fill the field, turn it back on. |
| Engagement Code and Engagement Name are read-only and there is no way to type them | Both are `readonly` in the template, and no code path in the applet writes them at commit `a6c58d6`. The name-composing helper (`updateName`, joining customer – code – company – branch) is defined but every call site is commented out. | Load engagements through the `/etl-ep` create endpoint with the code and name set, or set them through the back-office API. A code typed into the database must be unique. |
| Pressing **+** leaves blank engagements in the listing | The create button POSTs an empty header immediately; the row is created `ACTIVE`, not `TEMP`, and no sweeper removes it. | Delete the stray rows through the API (`TNT_AAT_ENGAGEMENT_HDR_DELETE`) — the UI's delete button is commented out. Consider turning `HIDE_ENGAGEMENT_CREATE_BUTTON` on if engagements are loaded in bulk. |
| The Engagement Category column is always empty | The Main form has no `category` form control, but the code that mirrors the form onto the draft still assigns `engagement_category = form.category`, which is always `undefined`. There is no category picker on the Main tab. | Set the category through the API, or from the category side (Settings → Engagement Category → Engagements). Do not expect the Main tab to hold a value. |
| The Fiscal Year End tab is missing | It renders only while FYE Type is `Yearly`. | Switch FYE Type to Yearly. The Perpetual counterpart (an Employees tab) is commented out of the template, so a perpetual engagement has no staffing tab at all. |
| An update fails with `..._COMP_GUID_DOES_NOT_EXIST` / `..._BRANCH_GUID_DOES_NOT_EXIST` / `..._CUSTOMER_ENTITY_HDR_GUID_DOES_NOT_EXIST` | The update validators FK-check the company, branch, customer entity and billing entity — the create validators do not. A row loaded by ETL with a stale GUID passes creation and fails the first edit. | Re-point the engagement at a live company, branch and entity. |
| An update fails with `..._RUNNING_NO_IS_NULL_OR_EMPTY` | `running_no` is required on update. It is auto-filled from `app_sequence_counter` (`ENGAGEMENT_NO`, keyed by tenant) only inside `fillMissingDataForUpdate`. | Retry the save; if it persists, the sequence counter for this tenant has not been initialised. |
| The Status field accepts anything | The fixed-list `mat-select` is commented out and the live control is a free-text input. The backend only checks that it is not blank. | Agree the vocabulary out of band, or restore the select. |
| The Enable Audit Trail / Hide Managing Partner toggles do nothing | `ENABLE_AUDIT_TRAIL` appears nowhere else in the applet — not even in the settings model — and `HIDE_MANAGING_PARTNER` appears only in the model, never in a template gate. | The audit-trail screen is reachable at `settings/applet-log` regardless, though it has no menu entry. |
| The settings gear has only two entries | `settingItems` lists Application Settings and Engagement Category and nothing else; Default Selection is commented out and `personalizationItems` is empty. | The other screens (webhook, feature visibility, permission listings, applet log) are routed and can be reached by URL only. |

## Related documentation

- [Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/)
- [Employee Applet](/applets/master-data/employee-applet/)
- [Organization Applet](/applets/master-data/organisation-applet/)
