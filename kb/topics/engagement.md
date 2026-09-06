---
topic: engagement
aliases: [client engagement, engagement file, AAT engagement, bl_aat_engagement_hdr, fiscal year end, engagement roles]
applets: [engagementApplet]
modules: [sales-crm]
related: [customer-maintenance, employee, organisation, claims, applet-settings]
wiki:
  - content/en/applets/crm/engagement-applet.md
status: seed
updated: 2026-09-06
---

# Engagement

An engagement is one client file in the audit / assurance / tax module: the customer entity, the
billing company and branch, the staff holding the engagement roles, and — for clients tracked by
financial year — one fiscal-year-end record per year with its own staffing. It is master data:
`bl_aat_engagement_hdr` plus employee and fiscal-year-end links. No journal, no stock, no FINAL.

## Facts

- 2026-09-06 — Registry `engagementApplet` "Engagement Applet", TNT-ADMIN, ACTIVE, no
  `documentation_url`. One sidebar menu (Engagement Listing) at
  `applet/tnt/wavelet/erp/aat-engagement`; a commented-out "Claimant" group (My Claim, Line Reports)
  is not routed.
  [src:git:blg-applet-wavelet-engagement-applet@a6c58d6 .../engagement-applet/src/app/app.routing.ts]
- 2026-09-06 — Edit Engagement has three live tabs: Main, Fiscal Year End (only when
  `fiscal_year_logic = 'YEARLY'`) and Gen Doc. **Employees** (the perpetual counterpart of Fiscal
  Year End), **Memorandum of Fees**, **Claims**, **Issue Link** and the DELETE button are all present
  in the template and commented out.
  [src:git:blg-applet-wavelet-engagement-applet@a6c58d6 .../engagement-edit/engagement-edit.component.html]
- 2026-09-06 — Pressing **+** POSTs an empty `EngagementHdrContainer` immediately; the row is created
  with `status = ACTIVE` (not TEMP) and there is no sweeper, so abandoned blank engagements
  accumulate. The toast is "The engagement has been created".
  [src:git:blg-applet-wavelet-engagement-applet@a6c58d6 .../state-controllers/engagement-controller/store/effects/engagement.effects.ts]
- 2026-09-06 — Engagement **Code** and **Engagement Name** are both `readonly` in the template and
  carry `Validators.required`, and no code path in the applet writes either. The helper that composes
  the name as `customer – code – company – branch` (`updateName`) is defined and every call site is
  commented out. The backend's `fillMissingDataForCreation` sets guid, dates, status, revision and the
  created/updated-by names — not code, not name, not running_no.
  [src:git:blg-applet-wavelet-engagement-applet@a6c58d6 .../engagement-edit/main-details/main-details.component.{ts,html}]
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../auditAssuranceTax/engagement/EngagementHdrDataConsistencyObject.java]
- 2026-09-06 — Engagements are therefore loaded in bulk in practice: `EngagementHdrController` exposes
  `/etl-ep` create, update, delete and read alongside `/backoffice-ep`, gated by the **same**
  `TNT_AAT_ENGAGEMENT_HDR_CREATE/UPDATE/DELETE/READ` permissions.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../auditAssuranceTax/engagement/EngagementHdrController.java]
- 2026-09-06 — The DCO validates much more on **update** than on create. Create: guid, approval-setting
  FK if set, code not already taken, dates, subject guids, status, revision. Update adds: `comp_guid`
  → `bl_fi_mst_comp`, `branch_guid` → `bl_fi_mst_branch`, `customer_entity_hdr_guid` and
  `billing_entity_hdr_guid` → `bl_fi_mst_entity_hdr`, `running_no` not blank, `code` not blank **and**
  unique, `engagement_status` not blank. A row imported with stale GUIDs passes creation and fails the
  first edit.
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../auditAssuranceTax/engagement/EngagementHdrDataConsistencyObject.java]
- 2026-09-06 — `fillMissingDataForUpdate` auto-assigns `running_no` from `app_sequence_counter` under
  module name `ENGAGEMENT_NO` keyed by tenant code, and refreshes the denormalised `created_by_name` /
  `updated_by_name` from `app_login_subject` on every update.
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../auditAssuranceTax/engagement/EngagementHdrDataConsistencyObject.java]
- 2026-09-06 — The applet-local `FieldConfigurationComponent` is a **real** settings screen, unlike the
  unbound eight-toggle stub found in Tax Configuration, Merchant Admin, Shipping Pricebook, Supplier
  and Deposit: 21 reactive controls, patched from the session master settings, saved through
  `SessionActions.saveMasterSettingsInit`. `app.routing.ts` routes the local one even though the
  shared-utilities submodule is present (METHOD §29).
  [src:git:blg-applet-wavelet-engagement-applet@a6c58d6 .../settings-container/field-configuration/field-configuration.component.{ts,html}]
- 2026-09-06 — Of the 21 keys, 19 are consumed. `HIDE_MANAGING_PARTNER` appears only in
  `applet-settings.model.ts` and gates nothing; `ENABLE_AUDIT_TRAIL` appears nowhere else in the applet
  at all, not even in the model, and the `settings/applet-log` route is not gated on it.
  [src:git:blg-applet-wavelet-engagement-applet@a6c58d6 .../models/applet-settings.model.ts]
- 2026-09-06 — Hiding a required field does not relax its validator: `HIDE_CUSTOMER_NAME`,
  `HIDE_ENGAGEMENT_CODE`, `HIDE_ENGAGEMENT_NAME` and `HIDE_JOB_GROUP` remove the control from the
  template while `Validators.required` stays, so SAVE is disabled with no visible cause. This is the
  general shape of every `HIDE_*` setting that hides a required control.
- 2026-09-06 — `RELABEL_COMPANY_TO_ENTITY` and `RELABEL_BRANCH_TO_JOB_GROUP` change labels only
  (`companyLabel`, `branchLabel`); the fields still write `comp_guid` and `branch_guid`.
- 2026-09-06 — The Main form declares no `category` control, yet the code mirroring the form onto the
  draft assigns `engagement_category = form.category`, which is always `undefined`. There is no
  category picker on Main, which is why the listing's Engagement Category column is empty.
  [src:git:blg-applet-wavelet-engagement-applet@a6c58d6 .../engagement-edit/main-details/main-details.component.ts]
- 2026-09-06 — Status on the Main tab is a free-text input; the fixed-list `mat-select` is commented
  out. The backend only checks it is not blank.
- 2026-09-06 — Engagement roles are Engagement Manager, Engagement Director, Engagement Partner,
  Managing Partner, EQCR (Engagement Quality Control Reviewer) and Key Audit Partner, each with a
  Non-Applicable tick stored in the header's `non_applicable_setting_json`. A fiscal-year-end record
  carries its own role block and its own employee list (Employee Code, Employee Name, Role, Approval
  Level), so staffing can change year to year.
- 2026-09-06 — The settings menu offers only Application Settings and Engagement Category. Default
  Selection is commented out of `settingItems`, `personalizationItems` is an empty array, and
  `settings/applet-log` (an audit-trail listing and viewer) is routed with no menu entry — all four
  are reachable by URL only.
  [src:git:blg-applet-wavelet-engagement-applet@a6c58d6 .../models/menu-items.ts]

## How it connects

- **customer-maintenance** — the client is an entity; the Customer Name field is a picker over the
  entity listing and stores `customer_entity_hdr_guid`. Both it and `billing_entity_hdr_guid` are
  FK-checked on update.
- **organisation** — the branch drop-down sets `branch_guid`, and selecting a branch fills `comp_guid`
  from that branch's company. Both are FK-checked on update.
- **employee** — engagement roles and per-year staffing point at employee records; the Approval Level
  lives on the fiscal-year-end link, not on the employee.
- **claims** — `approval_setting_guid` on the engagement is FK-checked against
  `bl_aat_claim_approval_setting`, and the backend carries live `bl_aat_claim_*` and `mof` families
  that reference the engagement. The applet's own Claims and Memorandum of Fees tabs are commented out,
  so the engagement applet is not the entry point to that flow today.
- **applet-settings** — this is the cleanest example in the estate of an applet-local field
  configuration that actually works; use it as the counter-example when explaining why most others
  do not.

## Open questions

- Which component or job is expected to assign Engagement Code and compose Engagement Name? The
  helper exists and its call sites were commented out; live records carry names in exactly the shape
  it produces.
- Are the commented-out Employees, Claims, Memorandum of Fees and Issue Link tabs waiting on the
  claims module, or abandoned?
- `ENABLE_AUDIT_TRAIL` is saved but read by nothing. Was `settings/applet-log` meant to be gated on
  it, and is that why the route has no menu entry?
