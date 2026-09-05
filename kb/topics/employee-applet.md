---
topic: employee-applet
aliases: [employee maintenance, employee master, staff master]
applets: [employeeApplet]
modules: [hr-payroll, core]
related: [org-chart, employee-login-invite, claims, payroll, entity-master, e-invoice]
wiki:
  - content/en/applets/master-data/employee-applet.md
status: seed
updated: 2026-09-05
---

# Employee applet (reconnaissance seed — page not yet rewritten)

Employee master data: one entity record per employee (`bl_fi_mst_entity_hdr`, employee type) with tabs for login, branches, companies, categories, contacts, addresses, payment config, tax, spending limits, report-to, approved leave, claims, engagement-company access, Peppol / e-Invoice details; plus Employee Category, Org Chart and File Import menus. Facts below were verified in run 5 of lane 4 before stopping; the page rewrite is still queued.

## Facts

- 2026-09-05 — Registry: `employeeApplet` "Employee Maintenance", TNT-USER, ACTIVE, documentation_url → /applets/employee-maintenance-applet/ (the page already has this alias; page title must become "Employee Maintenance"). Repo blg-applet-akaun-platform-employee-applet, last commit 220a282a 2026-08-21. [src:planning/private/registry-applets-2026-09-05.tsv] [src:git log]
- 2026-09-05 — Route path `applets/wavelet/erp/entity/employee-applet`; menus Employee (`employee-listing`), Employee Category (`category-listing`), Org Chart (`org-chart-listing`), File Import (`file-import`); settings routes default-selection, field-settings (applet-local FieldConfigurationComponent), webhook, feature-visibility, permission-wizard/set/user/team/role listings, applet-log (EmployeeAuditTrailContainerComponent); personalization personal-default-selection, sidebar. [src:.../employee-applet/src/app/app.routing.ts] [src:.../models/menu-items.ts]
- 2026-09-05 — Menu gating in app.component.ts: `HIDE_CATEGORY` hides the Employee Category menu, `HIDE_CLAIMS` hides the **Org Chart** menu (mislabelled key), `HIDE_FILE_IMPORT` hides File Import. [src:.../app.component.ts L56-66]
- 2026-09-05 — Application Settings is an applet-local screen with sections: Employee Listing (HIDE_EMPLOYEE_CREATE_BUTTON + 6 column hides), Main Details Hidden (~43 HIDE_* field toggles incl. HIDE_EMPLOYEE_CODE, HIDE_E_TYPE, HIDE_IDENTITY_TYPE, HIDE_ID_NUMBER, HIDE_REF1/2, HIDE_BRANCH_DETAIL, HIDE_DEFAULT_COMPANY, HIDE_TEAM/DIVISION/DEPARTMENT, HIDE_DEFAULT_RANK), login Hidden (HIDE_USER_EMAIL, HIDE_RANK, HIDE_STATUS, HIDE_MODIFIED_DATE, INSTALL_ALL_APPLETS_ON_INVITE), Payment Config Hidden (7), Edit Tabs Hidden (HIDE_ACC_MANAGER, HIDE_ADDRESS, HIDE_BRANCH, HIDE_CATEGORY, HIDE_CLAIMS, HIDE_COMP_LINKING, HIDE_CONTACT, HIDE_LOGIN, HIDE_PAY_CONFIG, HIDE_REMARK, HIDE_SPEND_LIMIT, HIDE_TAX, REPORT_TO, APPROVED_LEAVE), Menu Items Hidden (HIDE_FILE_IMPORT), Report To Hidden (LEVEL_1..3 NAME/EMAIL/EMP_CODE). Patch is `resolve?.KEY` (no default) except INSTALL_ALL_APPLETS_ON_INVITE `?? false`. Several toggles are bound twice (HIDE_STATUS, HIDE_MODIFIED_DATE, HIDE_COUNTRY, HIDE_EMPLOYEE_NAME/TYPE, HIDE_CURRENCY, HIDE_CREATION_DATE appear in two sections with one key). [src:.../settings-container/field-configuration/field-configuration.component.html] [src:.../field-configuration.component.ts L117-208]
- 2026-09-05 — Default Selection screen holds only DEFAULT_CURRENCY (branch picker commented out). Settings model also declares document-style keys (HIDE_UNIT_PRICE_*, custom status, HIDE_*_TAB) that are model-only here; `EMPLOYEE_CONTAINER_DETAILS_TAB_ORDER` (title/content list) drives the order of edit tabs (`orderedTab` loop in employee-edit.component.html). [src:.../settings-container/default-settings/default-settings.component.html] [src:.../models/applet-settings.model.ts] [src:.../employee-edit/employee-edit.component.html L18, L511]
- 2026-09-05 — Consumed keys (grep of accessor patterns): all Main Details / listing / login / payment HIDE_* keys above, LEVEL_*, HIDE_CLAIMS/CATEGORY/FILE_IMPORT, INSTALL_ALL_APPLETS_ON_INVITE (login-create L422, L488 — invite flow installs all applets), DEFAULT_CURRENCY, DEFAULT_COUNTRY, DEFAULT_CUST_TYPE, EMPLOYEE_CONTAINER_DETAILS_TAB_ORDER. Consumption of the Edit Tabs Hidden keys (HIDE_ACC_MANAGER … HIDE_TAX) still to be verified in employee-edit.component.html. [src:grep over .../employee-applet/src/app]
- 2026-09-05 — Required validators: create Main — name, type; e-Invoice details — addressLine1, addressName, business_activity_desc, city, contactNo, country, einvoiceIdType, einvoiceTaxIdentificationNumber, email, employeesName, idNumber, postcode, sic_code, state; address — addressType, city, country, postal_code, state; branch edit — branch_code, branch_name; contact — contact_id, contact_name, mobile_no, position; login create — user_input; payment config — residentialStatus; spending limit — comp_guid; tax — country, tax_code, tax_option, tax_rate, tax_type. [src:grep Validators.required over .../employee-container]
- 2026-09-05 — Edit tabs (component tree): Main, Account Management (employee-customer link), Address, Branch, Category, Claims (Report / Entitlement / Claim Accounts — the Claims tab block is commented out in the template L458-466), Company (employee-company link), Contact, Login (create/edit), Payment Config, Spending Limit, Tax, Engagement Company Access, Org Chart, Peppol Config (Peppol Ids, Notification Config), e-Invoice Details, Report To, Approved Leave. [src:find .../employee-container -name '*.html']
- 2026-09-05 — Backend services used (from effects): EmployeeService, EntityLoginSubjectLinkService, EmployeeBranchLinkingService, CompanyEmployeeLinkService, EntityLabelHdr/LinkService (categories), EntityAccountManagerLinkService, EntityPaymentMethodService, EntitySpendingLimitService, EntityPeppolIdService, EmployeeToEngagementCompanyAccessLinkService, OrgChartHdrService, OrgChartHierarchyNodeHdrService, EmployeeFileUpload/DownloadService, CompBranchLocationEntityLinkService, TenantUserProfileService. [src:grep Service over .../state-controllers]
- 2026-09-05 — Backend validators: EntityDataConsistencyObject — ENTITY_HDR_OBJECT_EMPLOYEE_ID_ALREADY_EXISTS (L106, L660), API_TNT_DM_BL_FI_MST_ENTITY_HDR_OBJECT_EMPLOYEE_CODE_SHOULD_NOT_BE_SET (L163, L707), API_TNT_DM_BL_FI_MST_ENTITY_HDR_OBJECT_EMPLOYEE_CODE_ALREADY_EXISTS (L189, L733); LoginSubjectToEmployeeLinkDataConsistencyObject (bl_login_subject_to_employee_link); BranchEmployeeLinkDataConsistencyObject (bl_fi_mst_branch_employee_link); EmployeeBankLinkDataConsistencyObject (bl_pyrll_employee_bank_link); EmployeeStatutoryMyDataConsistencyObject (bl_pyrll_employee_statutory_my); EmployeeFileImportHelperDataConsistencyObject + akaun-api jobProcessor/employee/EmployeeImportFileProcessor for File Import. [src:blg-akaun-platform-java/javasdk/.../validator/...] [src:blg-akaun-platform-java/akaun-api/.../jobProcessor/employee/]
- 2026-09-05 — Permissions: zero rows in bl_applet_client_side_perm_dfn for employeeApplet (guid 4a3b2d02-…); no `TNT_…` permDfn strings in the applet code (PermissionResolver targets still to be read). [src:akaun_master.bl_applet_client_side_perm_dfn] [src:grep]
- 2026-09-05 — Issues: auto-detect existing user emails on login create (gt#2275, 2025-12); Sub Query Remove FE/BE/deploy (gt#6637, gt#9367, gt#9443, 2026-08); user-guide tracking (wiki#165). [src:gh:bigledger/blg-int-general-task#2275] [src:gh:bigledger/blg-int-general-task#9367] [src:gh:bigledger/blg-wiki#165]

## How it connects

- **employee-login-invite** — Login tab creates a login subject link and (with INSTALL_ALL_APPLETS_ON_INVITE) installs every applet for the invitee.
- **org-chart** — Org Chart menu is hidden by the mis-named `HIDE_CLAIMS` key.
- **payroll** — Payment Config and Tax tabs write bl_pyrll_employee_bank_link / bl_pyrll_employee_statutory_my.

## Open questions

- Which Edit Tabs Hidden keys are actually consumed by employee-edit.component.html (verify each `*ngIf`).
- What the File Import template columns really are (read EmployeeImportFileHelperProcessor / the sample template) — the current page's column table looks invented.
- Whether the "DRAFT" employee status on the current page exists (entity status values are ACTIVE/INACTIVE in the model).

## Wiki impact

- master-data/employee-applet.md (lane 4, queued): rewrite to standard with the facts above; title → "Employee Maintenance"; replace the invented File Import column table; correct the HIDE_CLAIMS → Org Chart menu behaviour.
