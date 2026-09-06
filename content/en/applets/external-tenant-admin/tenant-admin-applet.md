---
title: "Tenant Admin Applet"
description: "Reference for the Tenant Admin Applet: the tenant-level console where an OWNER/ADMIN-ranked user manages catalogues, subscriptions, tenant and platform users, tenant admins, roles, permission sets, role file import, custom fields and the applet audit trail."
applet_code: "TenantAdminApplet"
page_type: applet
applet_repo: "blg-applet-core-akaun-platform-tenant-admin-applet"
modules: [core]
related_applets: [developer-sysadmin-applet, employee-applet, merchant-applet, organisation-applet]
guides: [/user-guide/administration/team/]
sources:
  configuration:
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/app.routing.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/app.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/models/applet-setting.model.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/models/menu-items.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/settings-container/custom-field-management/cf-listing/cf-listing.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/tenant-users-container/employee-link/employee-listing/employee-listing.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/shared-utilities/modules/settings/settings.component.html
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/user/UserPermissionService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/role/TenantRoleController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/user/TenantUserTeamRoleAssignmentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/permission/permissionWizard/PermissionWizardController.java
  fields:
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/catalogue-container/main-details/main-details.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/catalogue-container/user/user-add/user-add.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/catalogue-container/applet/applet-add-to-catalogue/applet-add-to-catalogue.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/subscription-container/main-details/main-details.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/tenant-users-container/main-details/main-details.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/admins-container/admins-create/admins-create.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/admins-container/admins-create/admins-details/admins-details.component.html
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/role-container/role-permission-add/role-permission-add.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/permission-set/perm-set-add/perm-set-add.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/permission-set/perm-set-add/select-targets/select-targets.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/models/tenant-perm-set-model.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/role-file-import-container/role-file-import-listing/role-file-import-listing.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/config/audit-trail-search.config.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/audit-trail-container/audit-trail-listing/audit-trail-listing.component.ts
  lifecycle:
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/state-controllers/role-permissions-controller/effects/role-permissions.effects.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/state-controllers/tenant-perm-set-controller/effects/tenant-perm-set.effects.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/role-container/role-permission-edit/applet-listing/applet-view/permission-sets/branch-target-selection/branch-target-selection.component.ts
    - blg-applet-core-akaun-platform-tenant-admin-applet/micro-fe/projects/akaun-platform/applets/tenant-admin-applet/src/app/components/data-sync/data-sync-listing/data-sync-listing.component.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/permissions-services/permission-set.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/csv-file-services/role-create-file-upload.service.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/AppPermissionSetService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/permission/clientSidePermission/ClientSidePermissionRoleLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/permission/permissionWizard/PermissionWizardService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/roleFileImport/AppMstRoleImportFileService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/role/AppMstRoleImportFileHelperUow.java
    - blg-akaun-platform-java/javasdk/src/main/resources/masterDataTemplates/MasterData_Upload_app_mst_role.csv
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/customField/CustomFieldCreateService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/audit/AppletAuditTrailService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/permission/PermissionMigrationUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/user/PlatformTenantUserController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/tenant/PlatformLoginSubjectTenantLinkController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/applet/UserAppletLinkController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/applet/AppletLoginSubjectController.java
  troubleshooting:
    - gh:bigledger/blg-applet-core-akaun-platform-tenant-admin-applet#3
    - gh:bigledger/blg-applet-core-akaun-platform-tenant-admin-applet#6
    - gh:bigledger/blg-intranet#1927
    - gh:bigledger/blg-intranet#4312
    - gh:bigledger/blg-intranet#5611
    - gh:bigledger/blg-intranet#528
    - gh:bigledger/blg-int-general-task#9759
    - gh:bigledger/blg-int-general-task#8976
tags:
- administration
- platform-management
- access-control
- security
- system-configuration
weight: 10
aliases:
- /applets/tenant-admin-applet/
---

## Overview

The Tenant Admin Applet is the console a tenant's own OWNER- or ADMIN-ranked users open to run their tenant: which catalogues and applets exist, who is a user, who is an admin, which roles and permission sets exist, and which roles hold which server-side and client-side permissions. It sits between the platform-level [Developer Sysadmin Applet](/applets/integrations/developer-sysadmin-applet/) (which manages *all* tenants) and the functional applets, whose menus, buttons and data scope are decided by what is configured here. It is a master-data applet: it writes users, links, roles and permission records, and it never posts a document or a journal.

## Where it fits

| Direction | What | Why |
|---|---|---|
| Upstream | [Developer Sysadmin Applet](/applets/integrations/developer-sysadmin-applet/) | Creates the tenant, its first OWNER, the applet store and the applet registry (`bl_applet_hdr`) that the Catalogue and Applets menus read. |
| Upstream | [Organisation Applet](/applets/master-data/organisation-applet/) | Companies, branches and locations are the *targets* a permission set or the Permission Wizard scopes a role to. |
| Downstream | Every functional applet | A user sees an applet only after it is installed for them (Catalogue / Tenant Users / Platform Users); the applet's server-side calls are authorised from the roles, permission sets and targets maintained here; its `SHOW_*` client-side permissions are attached to roles here. |
| Sideways | [Employee Maintenance](/applets/master-data/employee-applet/), [Merchant Admin](/applets/master-data/merchant-applet/) | The Tenant Users › Employee Link tab links a login to an employee record; the entity applets' Login tabs create tenant users and send invitations from their side. |

## Screens and menus

The sidebar (in this order; each item can be hidden tenant-wide, see Configuration): **Catalogue**, **Subscription**, **Tenant Users**, **Platform Users**, **Applets**, **Tenant Admins**, **Tenant Roles**, **Role File Import**, **Permission Sets**, **Data Sync**, **Audit Trail**, then **Settings** and **Personalization**. The applet opens on Catalogue.

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Tenant Admin sidebar and Catalogue listing" caption="Catalogue listing: the applet's landing screen, with the full sidebar." >}}

### Catalogue

Listing columns: Catalogue Code, Catalogue Name, Catalogue Type, Applet Store, No. of Applet, Last Update, Status. Create and Edit share the Details form; Edit adds an **Applet** tab and a **User** tab.

- **Applet tab** — lists the applets in the catalogue; *Add* picks an ACTIVE applet from the registry and stores the link with a rank (OWNER / ADMIN / MEMBER, default MEMBER) and an edition/pricing choice. Opening an applet shows **Details**, **Permissions Template** (sub-tabs *Approved* and *Requests* — the applet's permission templates and pending template requests, with request lines editable through the sysadmin endpoints) and **Installed By User** (install the applet for selected catalogue users).
- **User tab** — lists the catalogue's users; *Add* verifies an e-mail or mobile number, then either links the existing login (rank OWNER / ADMIN / MEMBER / GUEST) or sends an invitation.

{{< figure src="/images/tenant-admin-applet/catalogue-management.png" alt="Edit Catalogue with Details, Applet and User tabs" caption="Edit Catalogue: Details, Applet and User tabs." >}}

### Subscription

Listing: Subscription Code, Name, Type, Credit Limit, Country, Created Date. Edit tabs: **Details**, **Akaun HQ Entity** (a customer-entity form: code, name, type, ID, tax registration number, GL code, e-mail, phone), **Hostname** (grid with Hostname, Description, Created By, Status, Alias Type — the grid's loader is commented out in the component, so it renders empty at commit a5973ab).

### Tenant Users

Listing: User Name, No. of Catalogue, No. of Applets, Email Address, Last Update, Status. Edit tabs: **Details**, **Roles** (add / remove role links), **Employee Link** (link or unlink an employee record), **Installed Applet** (multi-select uninstall), **Catalogue** (add the user to catalogues; the link is written with rank MEMBER).

### Platform Users

Same listing as Tenant Users but read from the platform user directory. Edit tabs: **Details** (read-only), **Installed Applet** (uninstall), **Available Applet** (install; the rank written on the user-applet link is copied from the applet-to-catalogue link), **Catalogue**.

### Applets

Listing of the applets available to this tenant (Code, Name, Created Date, Modified Date). View tabs: **Details** (read-only: name, code, vendor, store, audit fields), **Permission Sets** (each set opens with *Details* and a *Roles* tab showing which tenant roles hold it), **Clientside Permissions** (each `bl_applet_client_side_perm_dfn` row opens with *Details* and a *Roles* tab). Nothing is editable from this menu — the applet's create/update/delete effects are all commented out.

{{< figure src="/images/tenant-admin-applet/tenant-applets.png" alt="Applets listing" caption="Applets: the registry applets visible to the tenant." >}}

### Tenant Admins

Listing: Email, Full Name, Phone Number, Rank, Created Date, Updated Date. *Add* selects an existing login by e-mail (the form's e-mail control is a searchable drop-down of tenant logins), checks it against the platform, and writes a tenant link with rank OWNER or ADMIN. Edit changes the rank.

### Tenant Roles

Listing: Role Code, Role Name, No. of Users, No. of Teams. Edit tabs: **Details**, **User** (assign users), **Applet** (pick an applet, then **Details** / **Permission Sets** / **Client-Side Permissions** for that applet and role), **Permission Set** (attach existing permission sets), **Copy Permission Set** (copy another role's sets, optionally regenerating them through the Permission Wizard).

The **Applet › Permission Sets** tab has three sub-tabs — **Branch**, **Company**, **Location** — one grid per permission template of the applet, with the targets of that table as rows and a checkbox per row. Saving posts the template-to-target selection for the role (see Lifecycle).

### Role File Import

Listing: File Name, File Size, Format, Status, Process Status, User Error Message, Created / Updated Date, Created by. *Create* accepts one `.csv` file and offers the template download (`MasterData_Upload_app_mst_role.csv`). Edit tabs: **Main** (file type, name, size, import format, process status, status, error message) and **Checking** (one row per CSV line: No., Role Name, Role Code, Short Error Message).

{{< figure src="/images/tenant-admin-applet/role-file-import-page.png" alt="Role Import Listing" caption="Role File Import listing." >}}

### Permission Sets

Listing: Code, Name, Applet, Created Date, Modified Date. *Add*: Perm Set Name, Perm Set Code (must be unique), Applet, Permission Template, *See Permission Definition* (read-only grid of the template's lines: Code, Name, Type, Target Type, Default Target Table), Target Type, Target Table, *Select Target*, Description, Status. Edit tabs: **Main** and **Lines**.

{{< figure src="/images/tenant-admin-applet/permission-set-listing.png" alt="Permission Set listing and Add form" caption="Permission Sets: listing and the Add form." >}}
{{< figure src="/images/tenant-admin-applet/permission-set-lines.png" alt="Permission Set Lines tab" caption="Edit Permission Set › Lines: the server-side permission codes in the set." >}}

### Data Sync

A page with two buttons, **Platform Users** and **Client Side Permissions**. Both are no-ops at commit a5973ab: `onSyncUsers()` has its service call commented out ("TO DO: need to call tenant admin ep after development complete") and `onSyncClientSide()` only builds a request object.

{{< figure src="/images/tenant-admin-applet/tenant-data-sync.png" alt="Data Synchronization page" caption="Data Sync: two buttons, neither wired to an endpoint yet." >}}

### Audit Trail

Listing of `bl_applet_audit_trail` rows for the tenant: Applet Code, Table Name, Status, Action Name, Action By, Date Created, Date Updated (hidden by default: Event Code, Object Type, Transaction Type, User ID, Device ID, User Agent, Transaction Date). Advanced search: Applet Code, Table Name, Action By (matched server-side on the actor's profile name), Date Created, Date Updated. The detail view shows the row's header fields and the old / new JSON blocks.

### Settings and Personalization

Settings groups: **System Configuration** (Field Settings, Default Selection, Custom Field Management), **Outlet Settings** (Outlet Type, Outlet Size), **Server Side Permissions** (Permission Wizard, Permission Set, User Permission, Role Permission), **Integration** (Triggers), **Developer Tools** (Release Notes, Audit Trail). Personalization: Field Settings, Default Selection. See Configuration for which of these are live.

{{< figure src="/images/tenant-admin-applet/tenant-setting-page.png" alt="Applet Settings menu" caption="Settings: the groups rendered by the shared settings shell." >}}

## Configuration

### Before you can use it

- **You must hold rank OWNER or ADMIN on the tenant** (`app_mst_link_login_subject_to_tenant.rank`, master database). Every `login-tenant-ep` / `tenant-admin-ep` endpoint this applet calls checks that rank (`UserPermissionService.hasOwnerAdminRankPermissionInTenant`) and returns *not authorised* otherwise; a platform system administrator also passes on the install / uninstall / admin-link endpoints. This rank is granted by the [Developer Sysadmin Applet](/applets/integrations/developer-sysadmin-applet/) or by an existing tenant admin under **Tenant Admins**.
- **Role assignment additionally needs a tenant-database permission.** Adding a user to a role (Tenant Users › Roles, Tenant Roles › User, and Settings › Role Permission) posts to `iam/team-role-links/user-to-role`, and creating / editing / deleting a role from Settings › Role Permission posts to `iam/roles`. Those controllers check `TNT_TENANT_OWNER` / `TNT_TENANT_ADMIN` **or** `TNT_LOG_TEAM_ROLE_ASSIGNMENT_OWNER/ADMIN` / `TNT_API_TEAM_ROLE_ASSIGNMENT_CREATE` (roles: `TNT_LOG_ROLE_*` / `TNT_API_ROLE_*`) as *permissions in the tenant database*, not the master-database rank (`TenantUserTeamRoleAssignmentController`, `TenantRoleController`). An admin who only has the rank gets HTTP 403 there.
- **Companies, branches and locations** must exist in the [Organisation Applet](/applets/master-data/organisation-applet/) before a permission set can be targeted or the Permission Wizard can generate anything.
- **Applets and their permission templates** come from the registry (`bl_applet_hdr`, `app_perm_template_hdr/line`); a tenant admin can only *use* templates, not create them.
- **Employee records** for the Employee Link tab come from [Employee Maintenance](/applets/master-data/employee-applet/).

### Applet settings

Settings live in an **applet-local** field-configuration component (this repo has its own `projects/shared-utilities`; the blg-shared-utilities `FieldConfigurationComponent` and its gear are not used). Settings › Field Settings is the only screen that both saves and is read. Any OWNER/ADMIN of the tenant can change them; a fresh tenant has nothing stored, so every menu shows and the Sync button is hidden until the first Save.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_CATALOGUE_MENU` | Sidebar item *Catalogue* | off (control initialised null) | Item removed from the sidebar for every user of the tenant. |
| `HIDE_SUBSCRIPTION_MENU` | *Subscription* | off | Same. |
| `HIDE_TENANT_USERS_MENU` | *Tenant Users* | off | Same. |
| `HIDE_PLATFORM_USERS_MENU` | *Platform Users* | off | Same. |
| `HIDE_APPLET_MENU` | *Applets* | off | Same. |
| `HIDE_ADMINS_MENU` | *Tenant Admins* | off | Same. |
| `HIDE_ROLE_MENU` | *Tenant Roles* | off | Same. |
| `HIDE_ROLE_FILE_IMPORT_MENU` | *Role File Import* | off | Same. |
| `HIDE_PERMISSION_SET_MENU` | *Permission Sets* | off | Same. |
| `HIDE_DATA_SYNC_MENU` | *Data Sync* | off | Same. |
| `HIDE_AUDIT_TRAIL_MENU` | *Audit Trail* | off | Same. |
| `SHOW_SYNC_BUTTON` | The *Sync* button and the selection checkbox column in Settings › Custom Field Management | off (`showSyncButton = settings?.SHOW_SYNC_BUTTON === true`) | On: selected custom-field definitions can be synced to their target tables (see Lifecycle). |

Unlike the document applets, the menu hides here are **absolute**: `app.component.ts` calls `updateMenuItem(state, HIDE_X)` with no `SHOW_X` client-side permission to reopen an item per role, and the registry seeds no client-side permission definitions for `TenantAdminApplet`.

**Rendered but not working (Settings › Default Selection).** *Default Branch* and *Default Location* are shown with a SAVE button, but the component is routed with no parent binding: its `appletContainer` is never set, so choosing a branch throws in the value-change handler, and SAVE emits an output nothing listens to. Nothing is persisted or read.

**Personalization › Default Selection** saves `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` and `DEFAULT_ROW_COUNT` (5–100) to the user's personal settings (`savePersonalSettingsInit`); no screen in this applet reads them back.

**Read without a control.** The Employee Link tab's employee grid hides the *Employee Code* column when `HIDE_EMPLOYEE_CODE` is true in the master settings; the key is not in the model and has no toggle, so the column always shows.

**Dead links in the settings shell** (present in the shared menu, absent from `app.routing.ts`, so they land on the applet's 404 page): Outlet Type, Outlet Size, Release Notes, Developer Tools › Audit Trail, and Personalization › Field Settings. *Client Side Permissions* under Settings is commented out of both the routes and the menu.

### Settings in other applets that control this applet

None. The registry (`bl_applet_hdr`, permission templates, client-side permission definitions) is maintained by the platform sysadmin tools, not by an applet setting.

### Feature visibility / permissions

- **Client-side permissions:** 0 rows seeded in `bl_applet_client_side_perm_dfn` for `TenantAdminApplet`, and the code checks none. Nothing in this applet can be hidden per role; only tenant-wide via the `HIDE_*_MENU` settings above.
- **Server-side authorisation** is by rank (master database) for the applet's own endpoints and by tenant-database permission for role assignment and the Settings › Server Side Permissions screens — see *Before you can use it*.
- **Permission Wizard** (Settings) posts to `tnt/permission-wizard` and requires rank ADMIN or OWNER on the *applet's* login-subject link (`bl_applet_login_subject_link`, `doesUserHavePermissionToEditApplet`), which is a third, different check.
- `TNT_TENANT_ADMIN` / `TNT_TENANT_OWNER` are super-user permissions across the backend (`AkaunAuthorizer.superUsers`); a user or role holding either passes every permission check and sees every branch and location target.

## Fields

### Catalogue › Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Catalogue Code | Short code | No | Pattern `^[a-zA-Z0-9-_]+$` |
| Catalogue Name | Display name | Yes | |
| Catalogue Type | `access_type` | Yes | Default PRIVATE |
| Applet Store | Store the catalogue draws applets from | Yes | Drop-down of stores |
| Description | Free text | No | |
| Status | ACTIVE / … | No | Default ACTIVE |
| Subscription Name / Type | Free text | No | |
| Created / Modified By, Created / Modified Date | Audit | — | Read-only |

### Catalogue › User › Add

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Email | E-mail or mobile number to verify | Yes | *Verify* calls `users/login-tenant-ep/{catalogGuid}`; replies `OK_RESPONSE` (existing login), `THIS_USER_ALREADY_ADDED_IN_THIS_CATALOG`, or `THE_USER_NOT_FOUND` (then *Send Invite* appears, e-mail only). |
| Rank | Catalogue rank | Yes | OWNER / ADMIN / MEMBER / GUEST |

*Send Invite* posts `{email, postRegistrationRequest: {add_user_to_tenant: true}}` to the same endpoint; the invited person is added to the tenant on registration.

### Catalogue › Applet › Add to catalogue

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Applet | Registry applet | Yes | Only `status = ACTIVE` applets are listed |
| Rank | Rank written on `bl_applet_to_catalog_link` | Yes | OWNER / ADMIN / MEMBER, default MEMBER; copied to each user-applet link installed from this catalogue |
| Edition / pricing | From `applet-edition-pricing` | No | |

### Subscription › Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Subscription Code | | No | Pattern `^[a-zA-Z0-9-_]+$`; every field except audit fields is disabled in edit mode |
| Subscription Name | | Yes | |
| Subscription Type | | Yes | Default STANDARD |
| Currency | | Yes | |
| Credit Limit | | Yes | Default 0.00 |
| Country | | Yes | |
| Description | | No | |
| Status | | Yes | Default ACTIVE |

### Tenant Users › Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| User GUID | Login subject GUID | — | Read-only |
| Given Name | | Yes | |
| Family Name | | Yes | |
| Email | | — | Read-only |
| Created / Modified By, Dates | | — | Read-only |

Save posts to `user-profile/tenant-admin-ep`, which updates the master record and then updates or creates the tenant-database copy. Platform Users › Details shows the same fields entirely read-only.

### Tenant Admins › Add / Edit

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Select Email | Existing login | Yes | Check via `users/tenant-admin-ep/{tenantGuid}?email=…`: `OK_RESPONSE` → rank pre-set to ADMIN; `THIS_USER_ALREADY_ADDED_IN_THIS_TENANT` with rank ADMIN/OWNER → "already added as an admin/owner"; with another rank → the existing link is edited; `THE_USER_NOT_FOUND` → *Send* button (e-mail only). |
| Full Name, Phone Number | From the login | — | Read-only |
| Start Date, End Date | Link validity | No | |
| Rank | OWNER / ADMIN | Yes | |
| Description | | No | |

### Tenant Roles › Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Name | | Yes | Max 255 |
| Code | | Yes | Max 255 |
| Status | ACTIVE / INACTIVE | Yes | Default ACTIVE |

### Permission Sets › Add

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Perm Set Name | | Yes | Max 255 |
| Perm Set Code | | Yes | Max 255; "Code must be unique" |
| Applet | Applet the template belongs to | Yes | |
| Permission Template | Registry template | Yes | Fills Target Type from the template |
| Target Type | From template | — | e.g. `UNIQUE`; the *Select Target* control appears only for a single-target type |
| Target Table | `bl_fi_mst_comp`, `bl_fi_mst_branch` or `bl_inv_mst_location` | — | Drives which master list *Select Target* searches |
| Select Target / Configure Permission Targets | The one company, branch or location the set is scoped to | Yes when shown | Written as `target_hdr_guid` on the header and every line |
| Description | | No | |
| Status | | Yes | Default ACTIVE |

### Role File Import › CSV

| Column | Required | Notes |
|---|---|---|
| `ROLE_NAME` | Yes | Blank → row error "Role Name is Invalid" |
| `ROLE_CODE` | Yes | Blank → "Role Code is Invalid"; an existing code updates that role, a new code creates one |

Upload is comma-delimited (`?delimiter=COMMA`) to `erp/app-mst-role-import-file-hdrs/backoffice-ep`.

### Audit Trail › search

Applet Code, Table Name (`foreign_table`), Action By (matched as `action_by_subject_name`), Date Created from/to, Date Updated from/to.

## Lifecycle and effects

This is an administration applet: no server document type, no signums, no journal, no stock, no open queue. What each menu writes:

| Menu | Endpoint (ts-lib → backend) | Writes |
|---|---|---|
| Catalogue | `catalogs/…/tenant-admin-ep`, `applet-to-catalog-links/…`, `catalog-login-subject-links/{tenant}/tenant-ep` | `bl_applet_catalog_hdr`, `bl_applet_to_catalog_link`, `bl_catalog_login_subject_link` (master) |
| Catalogue › Installed By User, Platform Users › Available Applet | `user-applet-links/tenant-admin-ep/{tenant}/multiple-install` | `bl_applet_login_subject_link`; also makes sure the login exists in the tenant database (`TenantUserConfigurationService.stepAddUserToTenant`) |
| Installed Applet › Uninstall | `applet-login-subject-link/tenant-admin-ep/{tenant}/multi-uninstall` | Soft-deletes the applet links; each install / uninstall is logged to `bl_applet_audit_trail` by `AppletLoginSubjectService` |
| Tenant Admins | `login-subject-tenant-link/tenant-ep` (create), platform `login-tenant-links/admin/tenant-admin-ep` (rank change) | `app_mst_link_login_subject_to_tenant.rank` (master) — the row every other authorisation here depends on |
| Tenant Roles | `iam/roles/login-tenant-ep` (create / update / delete, rank-checked) | `app_mst_role` (tenant) |
| Roles › User / Tenant Users › Roles | `iam/team-role-links/user-to-role` POST / DELETE (permission-checked) | `app_mst_link_subject_to_role` |
| Permission Sets | `iam/app-permission-sets` POST / PUT / DELETE | `app_perm_set_hdr` + `app_perm_set_line`; on update the applet re-points every `app_perm_assignee_target_link` of the set to the new target; on delete it deletes those links first |
| Roles › Permission Set tab | `permission-assignee-target/create-assignee-perm/backoffice-ep` | `app_perm_assignee_target_link` (assignee = role) |
| Roles › Applet › Permission Sets (Branch / Company / Location) | `app-permission-sets/modify/tenant-admin-ep` → `AppPermissionSetService.checkedAndCreatePermSet` | For every (template, checked target) pair: creates the permission set if it does not exist, then creates or deletes the role's assignee target links so they match the selection |
| Roles › Applet › Client-Side Permissions | `client-side-permission-role-links/custom-modify/tenant-admin-ep` → `ClientSidePermissionRoleLinkService.createOrDeleteLinks` | Deletes the role's links to that applet's client-side permissions that were unticked, creates the ticked ones |
| Settings › Permission Wizard | `tnt/permission-wizard` → `PermissionWizardService` | One permission set per location × company × branch named `<permSetPrefix>_<LOCATION>_<COMPANY>_<BRANCH>` with the template's lines targeted to those three records; with *auto create* also one role per set (prefixed `rolePrefix`) plus its assignee links |
| Role File Import | `erp/app-mst-role-import-file-hdrs/backoffice-ep` | `app_mst_role_import_file_hdr` (process status PROCESSING → FAILED on any error) and `…_helper` rows per CSV line; then `app_mst_role` create or update by code |
| Settings › Custom Field Management | `erp/custom-fields`, `custom-field-definitions/options/targets` | Custom field definitions; **Sync** calls `CustomFieldCreateService`, which runs `CREATE TABLE IF NOT EXISTS bl_cus_field_<target_table>` and `ALTER TABLE … ADD COLUMN IF NOT EXISTS` on the tenant database for each selected field |
| Data Sync | none | Nothing (buttons are stubs) |
| Audit Trail | `erp/listing/audit-trails/backoffice-ep` | Read-only. Rows are written by `AppletAuditTrailService` from generic documents (`GenericDocumentService`), applet install / uninstall (`AppletLoginSubjectService`) and the PDG controllers — **not** from role, permission-set or user-link changes, which leave no audit row |

**How a permission decision is made once this is configured.** `PermissionMigrationUow.getAllUserPermissionAsDTO` unions the user, the user's groups, the user's roles and group-roles, joins `app_perm_assignee_target_link` → `app_perm_dfn`, and returns one `(perm_code, target_hdr_table, target_hdr_guid)` per grant; a blank target GUID means `ALL`. Deletes in this applet are soft (`status = DELETED`) and the query excludes them — except that its trailing `OR (… perm_code IN ('TNT_TENANT_ADMIN','TNT_TENANT_OWNER'))` clause is not inside the `status != 'DELETED'` guard (backend 1ff620ef0e, `PermissionMigrationUow.java` ~L383), so a *soft-deleted* tenant-admin grant on a role still resolves as `hasPermission = true`. The result is cached per user and served from the cached inquiry endpoint; the functional applets' branch / location drop-downs short-circuit to "all targets" when `TNT_TENANT_ADMIN` or `TNT_TENANT_OWNER` is present.

## Related applets

- [Developer Sysadmin Applet](/applets/integrations/developer-sysadmin-applet/) — the platform-level counterpart; creates tenants, registers applets and permission templates, and can act on every `tenant-admin-ep` endpoint as a platform system administrator.
- [Organisation Applet](/applets/master-data/organisation-applet/) — companies, branches and locations are the only three target tables a permission set, the role Permission Sets tab and the Permission Wizard can scope to.
- [Employee Maintenance](/applets/master-data/employee-applet/) — the Employee Link tab writes `bl_fi_mst_entity_login_subject_link`; the employee's own Login tab can invite a user into the tenant with `add_user_to_tenant: true`.
- [Merchant Admin](/applets/master-data/merchant-applet/) — merchant Login tabs create tenant users (*Verify Email*) and send invitations (`create_entity: true`) that then appear under Tenant Users here.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Assigning a user to a role fails with **403** on `iam/team-role-links/user-to-role` (Tenant Users › Roles, Tenant Roles › User, or Settings › Role Permission). | The caller has the OWNER/ADMIN *rank* but no matching *permission* in the tenant database: the endpoint requires `TNT_TENANT_OWNER` / `TNT_TENANT_ADMIN` or a `TNT_LOG_TEAM_ROLE_ASSIGNMENT_*` / `TNT_API_TEAM_ROLE_ASSIGNMENT_CREATE` grant. | Grant the admin user (Settings › User Permission) or a role they hold one of those permissions; a platform sysadmin can do it from the sysadmin applet. |
| A role scoped to one branch sees **all** branches and locations in an applet's filter drop-downs. | The role once held `TNT_TENANT_ADMIN`/`OWNER`; the grant was soft-deleted, but the permission inquiry's unguarded `OR` clause resurrects it and the cache re-sync re-runs the same query. | Ask the platform team to hard-delete the `DELETED` `app_perm_assignee_target_link` row for that role and re-sync the user's cache. Never attach `TNT_TENANT_ADMIN`/`OWNER` to a role you intend to scope later. |
| A sidebar menu is missing for everyone. | Its `HIDE_*_MENU` toggle is on in Settings › Field Settings. | Switch it off and Save; there is no per-role `SHOW_*` override for this applet. |
| No **Sync** button (or checkbox column) in Custom Field Management. | `SHOW_SYNC_BUTTON` is off (hidden by default). | Enable it in Field Settings and Save. |
| Settings › Default Selection: SAVE does nothing, or the page errors when a branch is chosen. | Dead screen: no container bound, `save` output unhandled (commit a5973ab). | Use Personalization › Default Selection for personal defaults; nothing in this applet needs a tenant default branch. |
| Data Sync buttons do nothing. | Both handlers are stubs. | Client-side permission definitions and user copies are synced by platform tools; raise it with the platform team if you need the feature. |
| Outlet Type / Outlet Size / Release Notes / Developer Tools › Audit Trail / Personalization › Field Settings open a 404. | Menu entries come from the shared settings shell; the routes are not defined in this applet. | Use the sidebar **Audit Trail** menu for the audit trail; the other items have no equivalent here. |
| Role File Import shows Process Status FAILED; Checking tab says "Role Code is Invalid" / "Role Name is Invalid". | A CSV row has an empty `ROLE_CODE` / `ROLE_NAME`, or the file is not comma-delimited with those two headers. | Download the template from the Create screen, fill both columns, re-upload. Existing codes are updated, not duplicated. |
| Tenant Admins › Add says the user was not found. | The e-mail has no platform login yet; a mobile number cannot be invited. | Use *Send* (e-mail only) so the person registers, then add them; or add them via Catalogue › User › Send Invite. |
| Installing an applet for a user fails with "Unable to add user and sysadminLoginSubject to tenant … Failed to obtain JDBC Connection". | The tenant's own database was unreachable from the API while `multiple-install` tried to copy the login into it. | Infrastructure: check the tenant database and its connection record; retry when it is reachable — the request body is fine. |
| A user with a tenant link is missing from listings or admin checks. | Rank comparisons are exact strings (`ADMIN`, `OWNER`, `MEMBER`); some tenants carry historical rows with a misspelled rank value, which silently drop out. | Ask the platform team to correct the rank value; do not re-add the user (the check reports "already added"). |
| Audit Trail never shows role or permission changes. | By design: only documents, applet install / uninstall and PDG actions write `bl_applet_audit_trail`. | Use the role's User / Permission Set tabs and the permission-set Roles tab to see the current state; there is no history for these tables. |
| Audit Trail advanced search on *Action By* returned nothing. | Fixed in applet issue #3 (search now matches the actor's profile name server-side). | Update to the current build. |
| Custom field created against the wrong tenant. | Fixed in applet issue #6 (tenant GUID taken from the session). | Update to the current build. |

## Related documentation

- [Team management (user guide)](/user-guide/administration/team/)
- [Core platform module](/modules/core/)
- [Applet Store](/applets/applet-store/) and [Applet Catalog](/applets/applet-catalog/)
