---
topic: applet-registry
aliases: [bl_applet_hdr, applet registration, applet store record, vendor registry, module-applet link]
applets: [developer-sysadmin-applet, PlatformSysAdmin, tenant_admin_applet]
modules: []
related: [applet-store, tenant-admin, applet-permissions, applet-settings]
wiki:
  - content/en/applets/integrations/developer-sysadmin-applet.md
  - content/en/applets/applet-store.md
  - content/en/applets/applet-catalog.md
  - content/en/applets/applet-directory.md
status: seed
updated: 2026-09-06
---

# Applet registry

`bl_applet_hdr` in the master database is the platform's list of every applet that exists: its
`code`, `name`, `applet_type`, `status`, `vendor_guid`, `store_guid`, `documentation_url`, and a
`property_json` holding the router link, the custom-element tag and the ES-module URL the shell
loads. The Developer SysAdmin Applet is the console that maintains it.

## Facts

- 2026-09-06 — Registry row `developer-sysadmin-applet` "Developer SysAdmin Applet" is `ROOT-ADMIN`
  and ACTIVE; its `documentation_url` points at Confluence, not at this wiki.
  [src:file:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-06 — Five sidebar menus: Applet, Vendor, Categories, Modules, Developer, all under
  `applets/bigledger/akaun-platform/developer-sysadmin-applet`.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../developer-sysadmin-applet/src/app/app.routing.ts]
- 2026-09-06 — **The Categories and Developer menus are placeholders.** Both listings bind a
  hard-coded array of one sample row and inject no service. `CategoryEditComponent.onSave()` calls
  `onReturn()` and raises the toast "Category updated successfully" without any HTTP call. There is
  no Create Developer screen in `developer-pages.service.ts`.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../category-container/category-edit/category-edit.component.ts]
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../developer/developer-listing/developer-listing.component.ts]
- 2026-09-06 — Inside Edit Applet, thirteen tabs render; **Category, Pricing, Developer, Reviews,
  Permission Template, Client-Side Permission and Events are hard-coded placeholders**. Details,
  Languages, Module, Images, Catalog and Installations are wired to platform endpoints. Two more
  tabs, Review and Retire Applet, are commented out with "Hidden until … flow is ready".
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../applet-container/applet-edit/applet-edit.component.html]
- 2026-09-06 — That the Client-Side Permission tab is a mock explains why so many applets have zero
  rows in `bl_applet_client_side_perm_dfn`: there is no working screen anywhere in the product that
  seeds them. Lane findings for Workflow Design (run 29), Warehouse Management (run 28) and Deposit
  (run 30) each recorded "no client-side permission rows" independently.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../applet-edit/client-side-permission/client-side-permission.component.ts]
- 2026-09-06 — Applet Code is immutable after creation: the create effect sets
  `bl_applet_hdr.code`, the update effect does not send it.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../state-controllers/applet-controller/effects/applet.effects.ts]
- 2026-09-06 — The update effect re-reads the applet by GUID, overwrites the form fields and PUTs the
  whole container back, with no revision check on that path — concurrent edits overwrite silently.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../state-controllers/applet-controller/effects/applet.effects.ts]
- 2026-09-06 — `applet_type` domain, exactly as the form offers it: `ROOT-ADMIN`, `ROOT-USER`,
  `TNT-ADMIN`, `TNT-APPLET`, `TNT-USER`, `CLI-CLIENT`, `ETL-CLIENT`, `WEB-CLIENT`, `PROGRAM-CLIENT`,
  `SDK-CLIENT`. Status is `ACTIVE` / `INACTIVE` only; there is no delete or retire action in the UI.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../applet-container/applet-create/details/details.component.ts]
- 2026-09-06 — `property_json.applet_mf_html_tag` is built as
  `"<" + customElTag + "XXXXXXXX></" + customElTag + "XXXXXXXX>"` — the `XXXXXXXX` is a literal
  placeholder the shell substitutes at load time, matching the `sessionStorage.getItem('randomNumber')`
  suffix each applet's `app.module.ts` uses in `customElements.define`.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../state-controllers/applet-controller/effects/applet.effects.ts]
- 2026-09-06 — Platform permission model: create/update/delete/read each accept any of
  `MST_APPLET_OWNER`, `MST_APPLET_ADMIN` or the matching `MST_API_APPLET_*` code, **or** a platform
  system OWNER/ADMIN rank, **or** `UserPermissionService.isUserPlatformAdmin`. Update scopes the
  permission to `PermissionTarget("bl_applet_hdr", <guid>)`. Vendors use the parallel `MST_VENDOR_*`
  / `MST_API_VENDOR_*` codes.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../platform/dm/applet/AppletController.java]
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../permissions/AkaunMasterPermissionsV2.java]
- 2026-09-06 — `AppletController.replaceAppletWithoutPermission` returns a container carrying only
  the applet GUID and icon file GUID when the caller lacks permission, instead of a not-authorised
  response — an unauthorised read looks like an empty applet rather than an error.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../platform/dm/applet/AppletController.java]
- 2026-09-06 — Modules are `core2/platform/dm/module-applet-hdrs` and the applet↔module link is
  `core2/platform/dm/module-applet-links`, both called directly by the applet's own thin services
  rather than through `blg-akaun-ts-lib`.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../services/module-applet-hdr.service.ts]
- 2026-09-06 — The repo has **no `.gitmodules`**; it vendors its own copy of
  `projects/shared-utilities` (METHOD §27), so shared-utilities fixes do not reach it and gates.py
  cannot be run. Its vendored `WebhookComponent` ("Triggers") is a design mock: ten literal
  "Sample Event #n" values and an `ngOnInit` copy-pasted from the Default Selection screen.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 micro-fe/projects/shared-utilities/modules/settings/webhook/webhook.component.ts]
- 2026-09-06 — Its own settings are the familiar unbound stubs: the local Field Configuration is the
  eight-toggle "Lines Settings / Department Settings" screen with no form binding and no SAVE
  handler, and Default Selection writes `DEFAULT_BRANCH` / `DEFAULT_LOCATION` into an
  `appletContainer` that is never assigned while its `@Output() save` is not bound by the container.
  No `APPLET_SETTINGS` key is read anywhere in the applet.
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../settings-container/field-configuration/field-configuration.component.html]
  [src:git:blg-applet-core-akaun-platform-developer-sysadmin-applet@c7f2b59 .../settings-container/default-settings/default-settings.component.ts]
- 2026-09-06 — `bl_applet_client_side_perm_dfn` has no rows for `developer-sysadmin-applet` itself
  (akaun_master, checked 2026-09-06).

## How it connects

- **applet-store** — the store listing is this registry plus the Images, Pricing and Category tabs.
  Two of those three tabs are placeholders, so store pricing and categorisation are not maintained
  from here today.
- **tenant-admin** — a tenant's Catalogue and Applets menus read `bl_applet_hdr`; the applet must be
  registered here first, and a platform system administrator can act on the tenant-admin endpoints.
- **applet-permissions** — the missing Client-Side Permission screen is the upstream cause of the
  "checked in code but not seeded in the registry" pattern recorded across the lane findings.
- **applet-settings** — `bl_applet_ext` rows with `param_code = 'APPLET_SETTINGS'` are what every
  applet's settings screen writes. This applet writes one `bl_applet_ext` row of its own on create,
  `CATALOG_RESTRICTIONS`.

## Open questions

- Which console actually maintains applet categories and developer records today, given both menus
  here are mocks? `PlatformSysAdmin` "Platform SysAdmin" is a separate ACTIVE ROOT-ADMIN registry row
  with its own repo (`blg-applet-core-akaun-platform-sysadmin-applet`) and has not been read.
- `content/en/applets/finance/budgetary-applet.md` states that job-processor subscriptions are
  configured in this applet. No job-processor or trigger-template screen exists in it. Where are
  they configured?
- Is the `Rank` column on the applet listing the store-ranking used for ordering, or a permission
  rank? It is displayed but has no editor.
