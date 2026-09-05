---
topic: tenant-admin-applet
aliases: [Tenant Admin, tenant administration, roles and permission sets, TenantAdminApplet]
applets: [TenantAdminApplet]
modules: [core]
related: [developer-sysadmin-applet, permission-sets, client-side-permissions, employee-applet, merchant-admin, organisation-applet]
wiki:
  - content/en/applets/external-tenant-admin/tenant-admin-applet.md
status: growing
updated: 2026-09-05
---

# Tenant Admin Applet

The tenant-level console where a user with rank OWNER or ADMIN on the tenant manages catalogues, subscriptions, tenant and platform users, tenant admins, roles, permission sets, role CSV import, custom fields and the applet audit trail. It writes master-data and permission rows only; it has no document type, journal or stock effect.

## Facts

- 2026-09-05 — Repo is a split monorepo: the applet lives at `micro-fe/projects/akaun-platform/applets/tenant-admin-applet/` with its own `projects/shared-utilities`; the blg-shared-utilities `FieldConfigurationComponent` / gear are not used, so `applet-scan.sh` and `gates.py` do not apply. [src:refs/blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/angular.json]
- 2026-09-05 — Sidebar: Catalogue, Subscription, Tenant Users, Platform Users, Applets, Tenant Admins, Tenant Roles, Role File Import, Permission Sets, Data Sync, Audit Trail; landing route `catalogue`. [src:refs/blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/models/menu-items.ts] [src:…/app.routing.ts]
- 2026-09-05 — 12 four-proof settings: 11 `HIDE_*_MENU` and `SHOW_SYNC_BUTTON` (declared in `applet-setting.model.ts`, rendered in `field-configuration.component.html`, persisted via `SessionActions.saveMasterSettingsInit`, consumed in `app.component.ts` / `cf-listing.component.ts`). Menu hides are absolute — `updateMenuItem(state, HIDE_X)` has no `SHOW_X` permission pairing. [src:…/app.component.ts] [src:…/field-configuration.component.ts]
- 2026-09-05 — Settings › Default Selection is dead: `DefaultSettingsComponent` is routed without inputs, `appletContainer` is never set, and `save` emits to nobody. Personalization › Default Selection persists `DEFAULT_BRANCH/LOCATION/COMPANY/ROW_COUNT` that nothing reads. `HIDE_EMPLOYEE_CODE` is read by the Employee Link grid without a model key or control. [src:…/default-settings.component.ts] [src:…/personal-default-settings.component.ts] [src:…/employee-listing.component.ts]
- 2026-09-05 — Shared settings shell links to Outlet Type, Outlet Size, Release Notes, Developer Tools › Audit Trail and Personalization › Field Settings, none of which are routed in this applet (404). [src:…/projects/shared-utilities/modules/settings/settings.component.html] [src:…/app.routing.ts]
- 2026-09-05 — Data Sync's two buttons are stubs (`onSyncUsers` body commented "TO DO", `onSyncClientSide` builds a DTO only). [src:…/data-sync-listing.component.ts] [src:gh:bigledger/blg-intranet#528]
- 2026-09-05 — 0 client-side permission definitions seeded for `TenantAdminApplet`; the code checks none. [src:planning/lanes/lane-3/findings.md]
- 2026-09-05 — Authorisation model: the applet's `login-tenant-ep` / `tenant-admin-ep` endpoints check rank OWNER/ADMIN on `app_mst_link_login_subject_to_tenant` in the master DB (`UserPermissionService.hasOwnerAdminRankPermissionInTenant`); platform sysadmin also passes on install/uninstall/admin-link. Role assignment (`iam/team-role-links/user-to-role`) and role CRUD on the root `iam/roles` endpoint require tenant-DB permissions (`TNT_TENANT_OWNER/ADMIN` or `TNT_LOG_TEAM_ROLE_ASSIGNMENT_*` / `TNT_API_TEAM_ROLE_ASSIGNMENT_CREATE`, `TNT_LOG_ROLE_*` / `TNT_API_ROLE_*`). Permission Wizard requires rank ADMIN/OWNER on the applet's `bl_applet_login_subject_link`. [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/user/UserPermissionService.java] [src:…/TenantRoleController.java] [src:…/TenantUserTeamRoleAssignmentController.java] [src:…/PermissionWizardController.java]
- 2026-09-05 — Role › Applet › Permission Sets (Branch/Company/Location tabs) posts template×target selections to `app-permission-sets/modify/tenant-admin-ep`; `AppPermissionSetService.checkedAndCreatePermSet` creates a permission set per (template, target) if missing and reconciles the role's `app_perm_assignee_target_link` rows. Client-Side Permissions tab posts to `client-side-permission-role-links/custom-modify/tenant-admin-ep` (delete unticked, create ticked). [src:…/branch-target-selection.component.ts] [src:…/AppPermissionSetService.java] [src:…/ClientSidePermissionRoleLinkService.java]
- 2026-09-05 — Permission set targets are limited to `bl_fi_mst_comp`, `bl_fi_mst_branch`, `bl_inv_mst_location`; the wizard generates one set per location×company×branch named `<prefix>_<LOC>_<COMP>_<BRANCH>`, plus roles when auto-create is on. [src:…/models/tenant-perm-set-model.ts] [src:…/PermissionWizardService.java]
- 2026-09-05 — Role File Import CSV = `ROLE_NAME, ROLE_CODE` (template `MasterData_Upload_app_mst_role.csv`), comma-delimited upload to `erp/app-mst-role-import-file-hdrs/backoffice-ep`; blank cells → "Role Code is Invalid" / "Role Name is Invalid"; existing code updates, new code creates; process status PROCESSING → FAILED on error. [src:…/AppMstRoleImportFileService.java] [src:…/AppMstRoleImportFileHelperUow.java]
- 2026-09-05 — Custom-field Sync (gated by `SHOW_SYNC_BUTTON`) runs `CREATE TABLE IF NOT EXISTS bl_cus_field_<target>` / `ALTER TABLE … ADD COLUMN IF NOT EXISTS` on the tenant DB. [src:…/CustomFieldCreateService.java] [src:gh:bigledger/blg-applet-core-akaun-platform-tenant-admin-applet#6]
- 2026-09-05 — `bl_applet_audit_trail` is written by `AppletAuditTrailService` from generic documents, applet install/uninstall and PDG controllers — not from role/permission/user-link changes. The old page's claim that it logs `bl_aas_subject_to_role_link` was unfounded. [src:…/AppletAuditTrailService.java] [src:…/AppletLoginSubjectService.java]
- 2026-09-05 — `PermissionMigrationUow.getAllUserPermissionAsDTO` (backend 1ff620ef0e ~L383) has an unparenthesised trailing `OR (… perm_code IN ('TNT_TENANT_ADMIN','TNT_TENANT_OWNER'))`, so a soft-deleted admin grant on a role still resolves true; cache re-sync re-runs the same query. Functional applets short-circuit to all branch/location targets on those codes. [src:…/PermissionMigrationUow.java] [src:gh:bigledger/blg-int-general-task#9759]
- 2026-09-05 — Tenant Admins › Add checks `users/tenant-admin-ep/{tenantGuid}?email=` (`OK_RESPONSE` / `THIS_USER_ALREADY_ADDED_IN_THIS_TENANT` / `THE_USER_NOT_FOUND`); ranks OWNER/ADMIN; rank change via platform `login-tenant-links/admin/tenant-admin-ep` (rank or platform sysadmin). Catalogue › User › Send Invite posts `postRegistrationRequest.add_user_to_tenant: true` to `users/login-tenant-ep/{catalogGuid}`. [src:…/admins-create.component.ts] [src:…/user-add.component.ts] [src:…/PlatformTenantUserController.java]
- 2026-09-05 — Rank comparisons are exact strings; historical misspelled rank values on login links silently fail `MEMBER` checks (anonymised). [src:gh:bigledger/blg-intranet#5611]

## How it connects

- **developer-sysadmin-applet** — creates the tenant, first OWNER, registry rows and permission templates that this applet consumes; passes the same `tenant-admin-ep` checks as a platform sysadmin.
- **permission-sets / client-side-permissions** — every document applet's `SHOW_*` re-enable and branch/location scoping is configured here; unseeded definitions (F-0044) cannot be attached here because the Applets menu is read-only.
- **organisation-applet** — companies, branches, locations are the only target tables.
- **employee-applet / merchant-admin** — Login tabs there create tenant users and invitations that appear under Tenant Users here.

## Open questions

- Should Data Sync (stub buttons) and Settings › Default Selection (dead) be removed or finished?
- Who owns fixing the `OR`-precedence bug in `getAllUserPermissionAsDTO`? Still present at 1ff620ef0e.
- Should rank-ADMIN tenant admins automatically receive `TNT_TENANT_ADMIN` in the tenant DB so role assignment does not 403?

## Wiki impact

- Purchase Return page (lane 3): add the "role scoped to one branch sees all branches" troubleshooting row (gt#9759).
- Developer Sysadmin Applet page: cross-link; document that platform sysadmin passes `tenant-admin-ep` checks and the 08001 install failure.
- Team user guide: say who can assign roles (permission, not rank).
