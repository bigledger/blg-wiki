---
title: User Permission Manager
description: "How the Website Builder's User Permission Manager grants and removes CP Commerce Admin access: the website_builder_config block it reads, the invitation it sends, the applet link and role link it writes, and why removing access does not remove the applet."
page_type: applet-feature
applet_code: "cp_commerce_admin_console_v1"
applet_repo: "wavelet-cp-commerce"
parent_page: /applets/ecommerce/cp-commerce-admin-applet/
modules: [ecommerce, core]
related_applets:
  - cp-commerce-admin-applet
  - tenant-admin-applet
  - shopping-cart-applet
guides: []
weight: 10
sources:
  configuration:
    - wavelet-cp-commerce/src/app/models/website-builder-config.model.ts
    - wavelet-cp-commerce/src/app/utils/resolvers/website-setting-resolvers.ts
    - wavelet-cp-commerce/src/app/state-controllers/website-configuration/reducers/website-configration.reducer.ts
    - wavelet-cp-commerce/src/app/state-controllers/website-configuration/selectors/website-configuration.selectors.ts
    - wavelet-cp-commerce/src/app/pages/website-builder/webstore/webstore.component.ts
    - wavelet-cp-commerce/src/app/pages/website-builder/website-builder-routing.module.ts
    - wavelet-cp-commerce/src/app/guards/website-builder.guard.ts
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/website-edit.component.html
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/state-controllers/website-controllers/store/effects/website.effects.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/sdk/CPCommerce/cp-commerce-constants.ts
    - akaun_master.bl_applet_client_side_perm_dfn (applet code cp_commerce_admin_console_v1 — no rows)
  fields:
    - wavelet-cp-commerce/src/app/pages/website-builder/webstore/user-permission-manager/user-permission-manager.component.html
    - wavelet-cp-commerce/src/app/pages/website-builder/webstore/user-permission-manager/user-permission-manager.component.ts
  lifecycle:
    - wavelet-cp-commerce/src/app/pages/website-builder/webstore/user-permission-manager/user-permission-manager.component.ts
    - wavelet-cp-commerce/src/app/state-controllers/session-store/effects/session-website-access.effects.ts
    - wavelet-cp-commerce/src/app/state-controllers/session-store/effects/session.effects.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/user-services/user.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/platform/applets/user-applet-links.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/role-services/tenant-user-role.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/applet/UserAppletLinkController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/user/PlatformTenantUserController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/user/TenantUserTeamRoleAssignmentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/applet/GetAppletTokenController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/platform/applet/UserAppletLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TenantUserConfigurationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TenantUserService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TenantUserTeamRoleService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/UserInvitationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/platform/identity/PostRegistrationService.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/user/UserPermissionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/identity/AppLoginPrincipalUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/applogin/AppLoginPrincipalController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/GroupUows/LinkSubjectToRoleUow.java
    - customer-repo-1322ac#177
tags:
- website-builder
- user-management
- permissions
- admin
- e-commerce
- cp-commerce
---

## Overview

The **User Permission Manager** is one tile on the Webstore Management Dashboard that the [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) applet opens — the *Website Builder* area served by the Customer Portal storefront app itself. It is not an applet of its own and has no row in the applet registry.

It does one job: give a named person access to **CP Commerce Admin** for this tenant, and take it away again. Behind the two buttons it installs the CP Commerce Admin applet for that person and links them to one tenant role; if the e-mail address has no Akaun account yet, it sends them an invitation to create one first.

Everything on the screen depends on a small `website_builder_config` block stored on the Website record. There is no screen anywhere that writes that block — see *Configuration*.

## Where it fits

| Piece | What it does | Where it is configured |
|---|---|---|
| **Webstore dashboard tile** | Opens `/page/website-builder/layout-menu/user-permission-manager` on the storefront. | Shown unless the website carries `HIDE_USER_PERMISSION_MANAGER = 'true'`. |
| **Website record** (`bl_cms_website_hdr.property_json.website_builder_config`) | Supplies the five identifiers the screen needs: the applet, its catalogue link, the tenant, and the role new admins are added to. | No screen writes it — see below. |
| **Applet link** (`bl_applet_login_subject_link`) | The row that makes CP Commerce Admin available to that person, and the only thing the storefront's admin mode depends on. | Written by **Make Admin**; also managed from [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/). |
| **Tenant link** (`app_mst_link_login_subject_to_tenant`) | Says the person belongs to the tenant, and at what rank. This screen's own server calls require rank `ADMIN` or `OWNER` here. | Created at rank `GUEST` if the person was not already in the tenant; raised elsewhere. |
| **Role link** (`app_mst_link_subject_to_role`) | The row the *Admin Users* list shows and the trash icon deletes. | Written by **Make Admin**, deleted by **Remove Access**. |
| **Invitation** (`app_login_registration`) | The pending sign-up created by **Send Invitation**. | Post-registration adds the person to the tenant; it does not grant admin. |

Upstream: [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) owns the Website record this screen reads. Downstream: nothing — the person you promote here uses CP Commerce Admin and the Website Builder, and those pages describe what they can then do.

## Screens and menus

One page, two cards and one dialog.

- **Add New Admin User** — an *Email Address* box and a **Verify User** button. After verification the card shows either a green *User Verified Successfully!* panel with a **Make Admin** button, or an amber *User Not Found* panel with a **Send Invitation** button. Only one of the three buttons is visible at a time.
- **Admin Users** — a table of everyone linked to the configured role, with a refresh button in the card header, and Previous / Next paging that appears only when there are more than 10 rows.
- **Remove Admin Access** — a confirmation dialog with *Cancel* and *Remove Access*, opened by the trash icon on a row.

A back arrow returns to the Webstore dashboard.

{{< callout type="info" >}}
The screenshots that used to illustrate this page showed a live tenant's URL and real people's e-mail addresses in the Admin Users grid, and one was a photograph of somebody's mailbox. They have been withdrawn. Recaptures on a demo website with placeholder addresses are wanted.
{{< /callout >}}

## Configuration

### Before you can use it

1. **A Website record** in [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) for this storefront, carrying the `website_builder_config` block described below.
2. **An ACTIVE tenant role** to put new admins in. Roles are created in [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) (*Tenant Roles*). The backend rejects the role link with `CLIENT_ROLE_VALIDATOR_GUID_IS_INVALID` if the role guid does not exist or is not `ACTIVE`.
3. **The CP Commerce Admin applet published in a catalogue**, so that a catalogue guid and catalogue-link guid exist to install from.
4. **Rank `ADMIN` or `OWNER` on the tenant for you, the person using the screen.** Both server calls behind *Send Invitation* and *Make Admin* check `app_mst_link_login_subject_to_tenant` for rank `ADMIN` or `OWNER` (a platform system administrator also passes the install check). Without it every button fails — silently, see *Troubleshooting*.

### The `website_builder_config` block

The screen reads five values out of `bl_cms_website_hdr.property_json.website_builder_config` when the website configuration loads. **No screen in CP Commerce Admin or in the Website Builder writes them**; they are set through the website API when the storefront is commissioned.

| Key | What it is used for | What happens when it is missing |
|---|---|---|
| `applet_hdr_guid` | Identifies CP Commerce Admin in the install payload. | The install call is rejected by the applet-link validator; **Make Admin** appears to do nothing. |
| `applet_catalog_guid` | The catalogue the applet is installed from. | As above. |
| `applet_catalog_link_guid` | The catalogue-to-applet link; the backend also copies its `rank` onto the new link when the payload leaves rank blank. | As above. |
| `tenant_guid` | The tenant the applet link is created in. | As above. |
| `app_mst_role_guid` | The role new admins are added to, and the only filter on the *Admin Users* query. | The list never loads at all (the component logs a warning and returns), so the card shows *No Admin Users Yet* however many admins exist. **Make Admin** installs the applet and then fails on the role step. |

### Showing and hiding the tile

The Webstore dashboard filters its thirteen tiles against `bl_cms_website_ext` rows whose `param_code` is `HIDE_<TILE>` and whose `value_string` is the literal string `'true'`. For this tile the code is `HIDE_USER_PERMISSION_MANAGER`, default `false` (the tile shows).

Eleven of the thirteen tiles have a checkbox under *Website → edit → Details → Hide Website Builder Elements* in CP Commerce Admin. **`HIDE_USER_PERMISSION_MANAGER` is not one of them** — neither it nor `HIDE_HIGHLIGHT_ACTIVITY_MANAGER` has a control, and neither is declared in the shared `BLCmsWebSideExtParamCodes` enum; the storefront reads both as bare strings. To hide this tile the extension row has to be written through the website API.

Hiding the tile hides the tile only. The route `/page/website-builder/layout-menu/user-permission-manager` still resolves for anyone who types it.

### Feature visibility and permissions

There are **no client-side permission definitions** for `cp_commerce_admin_console_v1` (read-only check of `bl_applet_client_side_perm_dfn`, 2026-09-05: no rows), and this screen checks none.

The route guard is not a permission check either. `WebsiteBuilderGuard` redirects anyone who is not logged in, then returns `true` for every URL containing `/page/website-builder/layout-menu` — which is every child route, including this one — before its admin-mode test can apply. So the page opens for any signed-in storefront user; what stops them is the server:

| Action | Server check |
|---|---|
| Verify User | Master-DB read of `app_login_principal` gated by `MST_API_APP_LOGIN_PRINCIPAL_READ`. Rows the caller may not read are returned with `status = PERMISSION_DENIED` and no subject guid rather than withheld. |
| Send Invitation | Rank `ADMIN` or `OWNER` on the tenant link; otherwise not authorised. |
| Make Admin — install | Rank `ADMIN` or `OWNER` on the tenant link, **or** platform system administrator. |
| Make Admin — role link, Remove Access | Tenant owner/admin, **or** one of `TNT_LOG_TEAM_ROLE_ASSIGNMENT_OWNER`, `TNT_LOG_TEAM_ROLE_ASSIGNMENT_ADMIN`, `TNT_API_TEAM_ROLE_ASSIGNMENT_CREATE` (create) / `TNT_API_TEAM_ROLE_ASSIGNMENT_DELETE` (delete). |
| Admin Users list | Read permission is applied per row; unreadable rows come back as `PERMISSION_DENIED` placeholders instead of being dropped. |

## Fields

### Add New Admin User

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Email Address | The person to look up. | Yes | Client-side pattern `^[^\s@]+@[^\s@]+\.[^\s@]+$`; trimmed before use. Disabled while verifying and after a successful verification. Pressing Enter runs *Verify User*. The lookup is an exact, case-sensitive match on `principal_id` with `principal_type = 'EMAIL_USERNAME'`, so an account registered by mobile number is never found. |

### Admin Users

| Column | What it actually shows |
|---|---|
| # | Row number continued across pages (`page × 10 + index + 1`). |
| User | Always the part of the e-mail address before the `@`. The component overwrites whatever name the account has with that value, so this is never the person's real display name. |
| Email | `principal_id` of the account, or `N/A` when the detail lookup returned nothing. |
| Status | The status of the **role link**, not of the person's account — normally `ACTIVE`, or `PERMISSION_DENIED` when you may not read that link. |
| Added On | `created_date` of the role link, rendered in the browser's locale. |
| Actions | Trash icon → *Remove Admin Access* dialog. |

Paging is fixed at 10 rows and is server-side (`limit` / `offset` with `calcTotalRecords`). Names and e-mails are fetched separately, in batches of 20 subject guids.

## Lifecycle and effects

This screen writes identity and permission rows only. It has no document type, no journal entry and no stock movement.

**Verify User** queries the master-database `app_login_principal` table for `principal_type = 'EMAIL_USERNAME'` and `principal_id = <the address>`, excluding deleted rows. No match → *User Not Found* and the invitation button. A match → the account's `subject_guid` is held in memory and **Make Admin** appears. Verification says only that an Akaun account with that address exists *somewhere on the platform*; it says nothing about this tenant.

**Send Invitation** posts `{ email, postRegistrationRequest: { add_user_to_tenant: true } }` to the platform invitation endpoint for this tenant. The backend creates a registration row with a verification code and mails an *Invitation to AKAUN* message (subject and body overridable per tenant through the messaging templates) containing a confirmation link back through the API to the sign-up page. When the invitee finishes registering, the post-registration step adds them to the tenant — **at rank `GUEST`, with no applet and no role**. You still have to come back, verify again and press **Make Admin**.

**Make Admin** runs two calls in order and then reloads the list:

1. *Install the applet* — one `bl_applet_login_subject_link` with `rank: 'ADMIN'`, `status: 'ACTIVE'` and the three guids from `website_builder_config`. The backend adds the person to the tenant if they are not there yet (rank `GUEST`), copies the applet into the tenant database if it is not there yet, then either creates the link or updates an existing one, keeping the higher of the two ranks.
2. *Link the person to the role* — one `app_mst_link_subject_to_role` row in the tenant database, `status: 'ACTIVE'`, with an `app_user_audit_trail` entry of type `LINK_SUBJECT_TO_ROLE` / `LINK_ADDED`.

The two calls are not one transaction. If step 2 fails — most often `CLIENT_LINK_EXISTS`, because an active link is already there — the applet stays installed and the person is left half-promoted.

**Remove Access** deletes only the role link (soft delete, plus an audit entry `LINK_SUBJECT_TO_ROLE` / `LINK_DELETED`). It does **not** uninstall the applet. Admin mode in the Website Builder is decided by `bl_applet_login_subject_link`, so a person you remove here keeps CP Commerce Admin and keeps the Website Builder in admin mode. To take that away, uninstall the applet link from [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/).

**When the change takes effect.** The storefront asks for a CP Commerce Admin applet token once, as part of loading the session after sign-in; that token is what turns admin mode on. A newly promoted person therefore has to sign out and back in before the Website Builder opens for them.

## Related applets

- **[CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/)** — owns the Website record this screen reads, and is the applet this screen grants. Its *Website → Details* tab holds the eleven tile-hiding checkboxes.
- **[Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/)** — where the role is created, where tenant ranks are raised above `GUEST`, and the only place an applet link can be uninstalled.
- **[Shopping Cart](/applets/ecommerce/shopping-cart-applet/)** — the storefront's other back-office touchpoint; unrelated to access control, listed because both sit on the same Customer Portal website.

## Troubleshooting

The component reports nothing to the screen when a call fails: every failure path ends in `console.error`, the spinner stops and the form resets. "Nothing happens" is the normal symptom of every problem below, so open the browser console and the network tab before anything else.

| Symptom | Cause | Fix |
|---|---|---|
| Every button does nothing; the console shows a not-authorised response | You do not hold rank `ADMIN` or `OWNER` on the tenant link. Note that being made an admin *by this screen* does not grant that rank — new admins get `GUEST`. | Raise the rank in Tenant Admin, or have somebody who already holds it do the promotion. |
| *User Not Found* for an address that certainly exists | The lookup is exact and case-sensitive on `principal_id`, and only matches `EMAIL_USERNAME` principals. An address stored with different capitalisation, or an account registered by mobile number, will not match. | Use the exact stored address; for phone-registered accounts add the person from Tenant Admin instead. |
| *Verify User* neither confirms nor reports Not Found | The row came back masked (`PERMISSION_DENIED`, no subject guid) because the caller lacks master-level read on that principal. The component then throws internally and stops. | Have somebody with the master read permission verify, or add the person from Tenant Admin. |
| **Make Admin** does nothing on the second attempt | The role link already exists and the backend answers `CLIENT_LINK_EXISTS`. | Refresh the list — the person is already there. |
| The applet was installed but the person is not in the list | Step 2 failed. Usually `app_mst_role_guid` is missing from `website_builder_config`, or the role is not `ACTIVE` (`CLIENT_ROLE_VALIDATOR_GUID_IS_INVALID`). | Fix the role guid on the website record, then press **Make Admin** again — the install step is idempotent. |
| The list says *No Admin Users Yet* although admins exist | `app_mst_role_guid` is absent, so the query is never sent. | Set it on the website record. |
| A row shows `PERMISSION_DENIED` and `N/A` | You may not read that role link; the backend returns a placeholder rather than dropping the row. | Grant the role-read permission, or ignore the row. |
| Somebody you removed still reaches the Website Builder and CP Commerce Admin | *Remove Access* deletes the role link only; the applet link is what grants access. | Uninstall the applet link for that user in Tenant Admin. |
| A new admin sees the storefront but not the Website Builder | The applet token is fetched once per session. | Sign out and back in. |
| The tile is missing from the Webstore dashboard | `HIDE_USER_PERMISSION_MANAGER = 'true'` on the website. There is no checkbox for it in CP Commerce Admin. | Change the extension row through the website API, or navigate to the route directly. |

## Related documentation

- [CP Commerce Admin applet](/applets/ecommerce/cp-commerce-admin-applet/) — the Webstore dashboard, the Website record and every other tile.
- [Push Notification Configuration](/applets/ecommerce/cp-commerce/push-notification-configuration/) — the other Customer Portal feature configured through the website record rather than a screen.
- [Tenant Admin applet](/applets/external-tenant-admin/tenant-admin-applet/) — roles, ranks, applet installs and uninstalls.
- [E-Commerce module](/modules/ecommerce/)
