---
title: "Developer SysAdmin Applet"
description: "Platform-level reference for the applet registry: registering an applet, its vendor, its store listing, pricing, images, catalogue placement and installations"
applet_code: "developer-sysadmin-applet"
page_type: applet
applet_repo: "blg-applet-core-akaun-platform-developer-sysadmin-applet"
modules: []
related_applets:
  - tenant-admin-applet
  - applet-store
  - webhook-applet
guides: []
sources:
  screens_and_menus:
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/app.routing.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/models/menu-items.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/services/applet-pages.service.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/services/vendor-pages.service.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/services/module-pages.service.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/services/category-pages.service.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/services/developer-pages.service.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/applet-container/applet-edit/applet-edit.component.html
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/vendor-container/vendor-edit/vendor-edit.component.html
  configuration:
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/app.module.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/shared-utilities/modules/settings/webhook/webhook.component.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/shared-utilities/modules/settings/feature-visibility/feature-visibility.component.html
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/applet/AppletController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunMasterPermissionsV2.java
  fields:
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/applet-container/applet-create/details/details.component.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/applet-container/applet-create/details/details.component.html
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/vendor-container/vendor-create/details/details.component.html
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/module-container/module-create/main-details/main-details.component.html
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/category-container/category-create/main-details/main-details.component.html
  lifecycle:
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/state-controllers/applet-controller/effects/applet.effects.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/module-container/module-edit/module-edit.component.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/category-container/category-edit/category-edit.component.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/services/module-applet-hdr.service.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/services/module-applet-link.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/applet/AppletController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/vendor/VendorController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/applet/ModuleAppletHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/applet/ModuleAppletLinkController.java
  troubleshooting:
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/category-container/category-listing/category-listing.component.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/developer/developer-listing/developer-listing.component.ts
    - blg-applet-core-akaun-platform-developer-sysadmin-applet/micro-fe/projects/akaun-platform/applets/developer-sysadmin-applet/src/app/components/applet-container/applet-edit/client-side-permission/client-side-permission.component.ts
    - gh:bigledger/blg-applet-core-akaun-platform-developer-sysadmin-applet#1
tags:
- platform-administration
- developer-tools
- system-governance
- applet-management
- vendor-coordination
weight: 5
---

## Overview

The Developer SysAdmin Applet is the **platform** console for the applet registry. It is where an
applet is registered — its code, its vendor, its store, its type, the URL the shell loads it from —
and where its store-facing detail is maintained: languages, images, edition and plugin pricing,
which developers own it, which catalogues it sits in, and which tenants have installed it.

It is a `ROOT-ADMIN` applet. It does not belong to any tenant module and it is not something a
customer opens. Its tenant-facing counterpart is the
[Tenant Admin Applet](/applets/external-tenant-admin/tenant-admin-applet/), which governs one
tenant's users, roles and installed applets; this applet governs the registry those tenants draw
from.

{{< callout type="warning" >}}
**Large parts of this applet are unfinished screens with sample data.** The Applet, Vendor and
Modules menus are wired to real platform endpoints. The **Categories** and **Developer** menus, and
several tabs inside Edit Applet, render hard-coded placeholder rows and save nothing. Each one is
identified below — do not plan work around a screen that is listed here as a placeholder.
{{< /callout >}}

## Where it fits

| Direction | What | Why |
| :--- | :--- | :--- |
| Downstream | [Applet Store](/applets/applet-store/) and [Applet Catalog](/applets/applet-catalog/) | Everything a tenant sees in the store — name, icon, description, images, pricing, categories — is the record maintained here. |
| Downstream | [Tenant Admin Applet](/applets/external-tenant-admin/tenant-admin-applet/) | A tenant's Catalogue and Applets menus read `bl_applet_hdr`; the applet has to exist here first. |
| Downstream | every applet page in this wiki | The registry row this applet writes is the source of truth for an applet's `code`, `name`, `applet_type`, `status` and `documentation_url`. |
| Alongside | Vendor and module records | `bl_applet_hdr.vendor_guid` and the module–applet links decide who owns an applet and which module groups it. |
| Adjacent | [Webhook Applet](/applets/integrations/webhook-applet/) | Applet triggers are a separate subsystem; the **Triggers** entry in this applet's settings is a placeholder (see Configuration). |

## Screens and menus

`app.routing.ts` mounts everything under
`applets/bigledger/akaun-platform/developer-sysadmin-applet`. The sidebar (`models/menu-items.ts`)
has five entries; the layout header reads **Developer SysAdmin Applet**.

| Menu | Route | Backed by | State |
| :--- | :--- | :--- | :--- |
| Applet | `applet` | Platform `applets` endpoints (`AppletService`, server-side ag-grid) | Working |
| Vendor | `vendor` | Platform `vendors` endpoints (`VendorService`) | Working |
| Categories | `categories` | — | **Placeholder** — the listing renders one hard-coded row and the edit screen's SAVE only shows a success toast |
| Modules | `modules` | `core2/platform/dm/module-applet-hdrs` and `.../module-applet-links` | Working |
| Developer | `developers` | — | **Placeholder** — one hard-coded row; no create screen exists |

An empty path redirects to `applet`; anything unmatched goes to the applet's 404 screen.

### Applet

The listing is a server-side ag-grid with columns Applet Code, Applet Name, Rank, Applet Store,
Type, Vendor, No. of Developers, Date Modified, Status. **+** opens Create Applet (Details only);
clicking a row opens Edit Applet, which has thirteen tabs:

| Tab | What it holds | State |
| :--- | :--- | :--- |
| Details | The registry record itself — see [Fields](#fields). | Working |
| Languages | `bl_applet_language_hdr` rows: Language Code, Language Name, Resource Bundle, Updated By, Updated Date. | Working |
| Category | Category Code, Category Name, Level, Status, with Add and Edit panels. | **Placeholder** — two hard-coded rows |
| Module | The modules this applet belongs to, with Add and Edit panels, over `module-applet-links`. | Working |
| Pricing | Two sub-grids: Edition Pricing (Edition Code, Edition Name, Country, Currency, UOM, One Time Fee, Price Per Month, Price Per Year) and Plugin Pricing. | **Placeholder** — hard-coded rows |
| Developer | User ID, User Name, Email Address, Status, with Add and Edit panels. | **Placeholder** — one hard-coded row |
| Images | Store screenshots for the applet, drag-to-reorder; the order is saved with the applet. | Working |
| Reviews | User ratings and comments sub-tabs. | **Placeholder** — no service calls |
| Catalog | Which catalogues carry the applet and which tenants subscribe: Catalog Name, Rank, Tenant, Billing Account, No. of Users, Status. Server-side grid. | Working |
| Permission Template | Approved and Requested permission templates: Code, Name, No. of Permission, Created Date, Modified Date, Status. | **Placeholder** — hard-coded rows |
| Client-Side Permission | Code, Name, No. of Permission, dates, Status, with Add and Edit panels. | **Placeholder** — one hard-coded row |
| Events | Event Code, Date/Time, User ID, Device ID, Action. | **Placeholder** — one hard-coded row |
| Installations | User Email, Installed Date — who has this applet installed. | Working |

Two further tabs exist in the source and are commented out of the template: **Review** ("Hidden
until Review flow is ready") and **Retire Applet** ("Hidden until Retire Applet flow is ready").
There is no retire or delete action anywhere in the UI; an applet is withdrawn by setting its
Status to `INACTIVE` on the Details tab.

### Vendor

Listing columns: Vendor Account Code, Vendor Name, Description, Created By, Created Date, Modified
By, Modified Date. **+** opens Create Vendor; a row opens Edit Vendor with five tabs — Details,
Developer, Applets, Module, Events. Details, Developer and Applets are wired to services; the
Events tab is a placeholder with one hard-coded row, and **Developer → Add** is an empty grid whose
`onAdd()` method has no body.

The Applets tab drills into the same Create Applet / Edit Applet screens as the Applet menu, so an
applet can be registered from either side.

### Modules

Listing columns: Module Code, Module Name, Level Value, Creation Date, Modified Update, Status.
Create and Edit both call `core2/platform/dm/module-applet-hdrs`; the Edit screen's Applets tab
manages `module-applet-links`, and an Images tab uploads module artwork. SAVE reports success only
when the API answers `OK_RESPONSE`.

### Categories and Developer

Both menus render finished-looking screens over hard-coded arrays.

- **Category Listing** displays a single row with a sample code and name; there is no category
  service anywhere in the component. **Category Edit → SAVE** calls `onReturn()` and then raises the
  toast *"Category updated successfully"* — nothing is sent anywhere. Its Applets and Images tabs are
  likewise hard-coded or empty.
- **Developer Listing** displays a single row of sample developer data. There is no Create Developer
  screen in `developer-pages.service.ts` (only Listing and Edit), and the Edit screen's Applets and
  Vendor tabs are hard-coded too.

Treat both menus as unbuilt. Category and developer data that is real lives in the platform
database and is not reachable from here.

{{< callout type="info" >}}
No product screenshots have been captured for this applet. The screens described above are read from
the templates and components in the repository, not from a capture.
{{< /callout >}}

## Configuration

### Before you can use it

| Prerequisite | Why |
| :--- | :--- |
| A platform login with applet-registry permission | Every write goes to a `core2/platform/dm/...` endpoint gated by the master permissions listed below. There is no tenant-level route into this applet. |
| At least one vendor record | Vendor is `Validators.required` on Create Applet, and the drop-down is the vendor list. Create the vendor first. |
| At least one applet store | Store is `Validators.required` and the drop-down is loaded from the platform's store list. |
| The applet's deployed bundle URL | Applet URL (`property_json.es_module_url`) and Router Link are both required; the shell loads the applet from that URL. |

### Applet settings

Settings live in **applet-local** components — `app.routing.ts` routes
`./components/settings-container/field-configuration/` and `./default-settings/`, not the shared
`FieldConfigurationComponent`. The repository has no `.gitmodules`; it vendors its own copy of
`projects/shared-utilities`, so the shared settings screen and `kb/tools/gates.py` do not apply here
(METHOD §27).

The Settings gear shows three groups (`settingItems` in `models/menu-items.ts`):

| Group | Entry | Route | State |
| :--- | :--- | :--- | :--- |
| System Configuration | Field Settings | `settings/field-settings` | **Non-functional stub.** Eight `mat-slide-toggle`s under "Lines Settings" and "Department Settings" with no `formControl`, no `[(ngModel)]` and a SAVE button with no `(click)` handler. The labels (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) are copied from a document applet and mean nothing here. |
| System Configuration | Default Selection | `settings/default-selection` | **Non-functional.** Default Branch and Default Location drop-downs whose `valueChanges` handlers write `DEFAULT_BRANCH` / `DEFAULT_LOCATION` into an `appletContainer` field that is never assigned, and whose `@Output() save` is not bound by the container. Nothing is persisted. |
| Server Side Permissions | Permission Set, User Permission, Role Permission | `settings/permission-set-listing`, `.../user-permission-listing`, `.../role-permission-listing` | The vendored shared permission containers; Permission Set resolves its target services through `PermissionResolver`. |
| Integration | Triggers | `settings/webhook` | **Placeholder.** The vendored `WebhookComponent` renders a grid of ten literal "Sample Event #n" rows with sample descriptions, and its `ngOnInit` is copy-pasted from Default Selection — it writes branch and location into an undefined `appletContainer`. |

Two further routes exist with no menu entry: `settings/feature-visibility` (also the redirect target
when `settings` is opened with no child) and `settings/team-permission-listing`. Feature Visibility
is a single "Teams — Manage Team Access" accordion with an unbound SAVE button.

**Personalization** (`personalization/personal-default-selection` and `personalization/sidebar`)
offers a per-user Default Branch / Default Location pair with the same unwired implementation as the
applet-level one.

### Settings read at runtime

None. There is no `appletSettings` or master-settings read anywhere in the applet — no
`APPLET_SETTINGS` key is declared, rendered, persisted **or** consumed. The settings screens above
are the whole surface, and none of them works.

### Feature visibility and permissions

`bl_applet_client_side_perm_dfn` has **no rows** for applet code `developer-sysadmin-applet`
(checked against `akaun_master`, 2026-09-06). Access is decided entirely by platform-level
permissions on the endpoints.

`AppletController` (`core2/platform/dm/applets`) accepts a write when **any** of the following is
true: the caller is a platform system OWNER/ADMIN rank; the caller holds one of the required
permissions on the applet target; or the caller is a platform admin
(`UserPermissionService.isUserPlatformAdmin`).

| Action | Required permission (any of) |
| :--- | :--- |
| Create an applet | `MST_APPLET_OWNER`, `MST_APPLET_ADMIN`, `MST_API_APPLET_CREATE` |
| Update an applet | `MST_APPLET_OWNER`, `MST_APPLET_ADMIN`, `MST_API_APPLET_UPDATE` |
| Delete an applet | `MST_APPLET_OWNER`, `MST_APPLET_ADMIN`, `MST_API_APPLET_DELETE` |
| Read an applet | `MST_APPLET_OWNER`, `MST_APPLET_ADMIN`, `MST_API_APPLET_READ` |
| Vendor create / update / delete / read | the matching `MST_VENDOR_*` / `MST_API_VENDOR_*` codes |

The update endpoint scopes the permission to a `PermissionTarget("bl_applet_hdr", <guid>)`, so
per-applet ownership is possible. When the caller lacks permission,
`AppletController.replaceAppletWithoutPermission` returns a stripped container carrying only the
applet GUID and icon file GUID rather than an error — a read can therefore come back looking empty
instead of refused.

## Fields

### Create / Edit Applet — Details

| Field | Meaning | Required | Notes |
| :--- | :--- | :--- | :--- |
| Applet Name | `bl_applet_hdr.name` | Yes | This is the name every wiki applet page's `title:` must match. |
| Applet Code | `bl_applet_hdr.code` | No validator, but effectively mandatory | Written on create only; the update effect does not send `code`, so **the code is immutable after creation**. The template renders a separate read-only copy of the field in edit mode. |
| Vendor | `bl_applet_hdr.vendor_guid` | Yes | Drop-down over the vendor list. |
| Store | `bl_applet_hdr.store_guid` | Yes | Which applet store the record belongs to. |
| Type | `bl_applet_hdr.applet_type` | Yes | `ROOT-ADMIN`, `ROOT-USER`, `TNT-ADMIN`, `TNT-APPLET`, `TNT-USER`, `CLI-CLIENT`, `ETL-CLIENT`, `WEB-CLIENT`, `PROGRAM-CLIENT`, `SDK-CLIENT`. |
| Status | `bl_applet_hdr.status` | No | `ACTIVE` or `INACTIVE`. Setting `INACTIVE` is the only withdrawal mechanism the UI offers. |
| Description | `bl_applet_hdr.description` | No | Shown in the store. |
| Router Link | `property_json.routerLink` | Yes | The path the shell routes to. |
| Applet URL | `property_json.es_module_url` | Yes | The deployed ES-module bundle the shell loads. |
| Documentation URL | `bl_applet_hdr.documentation_url` | No | Where the product links out to for help — for BigLedger applets this should be the applet's page on this wiki. |
| Custom Element Tag | `property_json.custom_element` | No | Also used to build `property_json.applet_mf_html_tag` as `<{tag}XXXXXXXX></{tag}XXXXXXXX>`; the `XXXXXXXX` is a literal placeholder the shell substitutes at load time. |
| Version | `vrsn` | No | Validated against `^[0-9]*.[0-9]*$`. |
| Size | | No | Same numeric pattern. |
| Catalog Restriction | `bl_applet_ext` row `CATALOG_RESTRICTIONS` | No | Defaults to `'false'`; written as a JSON applet-ext row on create. |
| Password policy check / expiry days | `bl_applet_hdr.acl_policy` | No | Only written when the policy check box is ticked. |
| Created / Updated Date and By | Audit | — | Read-only. |

### Create / Edit Vendor — Details

Vendor Code (read-only copy shown in edit mode), Vendor Name, Description, and read-only Created
Date / Created By / Modified Date / Modified By.

### Create / Edit Module — Main Details

Module Code (read-only in edit mode), Module Name, Search Filter, Description, Status, and the four
read-only audit fields.

### Create / Edit Category — Main Details

Category Code, Category Name, Search Filter, Description, Status, and the four read-only audit
fields. The form renders, but nothing it collects is sent anywhere (see
[Lifecycle](#lifecycle-and-effects)).

### Developer — Main Details

Developer Code, Developer Name, Developer Email, Description, Status, and the four read-only audit
fields. Read-only in practice; the listing behind it is sample data.

## Lifecycle and effects

### Posting proof

| Aspect | Value |
| :--- | :--- |
| Server document type | None. This applet writes platform master data, not documents. |
| Amount signum / quantity signum | Not applicable — no `FinancialDocDataConsistencyObject` and no financial document. |
| Dr/Cr equation | None. Nothing here posts a journal. |
| GL precedence | Not applicable. |
| Stock processor | None. |
| What VOID reverses | There is no VOID, no FINAL and no posting status anywhere in this applet. Records carry `ACTIVE` / `INACTIVE` only. |

### What it writes

| Screen | Table / endpoint | On save |
| :--- | :--- | :--- |
| Create Applet | `bl_applet_hdr` (+ a `CATALOG_RESTRICTIONS` row in `bl_applet_ext`) via `createAppletAsSysAdmin` | Toast *"Applet created successfully"*, then the listing resets to the first column. |
| Edit Applet | The effect **re-reads the applet by GUID** (`getByGuidAsSysadmin`), overwrites name, vendor, store, type, status, description, documentation URL and `property_json`, and PUTs the whole container back. Image ordering is dispatched separately. | The read-modify-write means concurrent edits from two sessions silently overwrite each other. |
| Create / Edit Vendor | Platform `vendors` endpoints | |
| Create / Edit Module | `core2/platform/dm/module-applet-hdrs`; the Applets tab writes `core2/platform/dm/module-applet-links` | Success toast only when the response `code` is `OK_RESPONSE`. |
| Edit Applet → Languages, Images, Module, Catalog, Installations | The matching platform endpoints | |
| **Edit Category** | **nothing** | `onSave()` navigates back and raises *"Category updated successfully"*. No HTTP call is made and no service is injected. |
| Edit Developer, and the Category / Developer / Pricing / Events / Reviews / Permission Template / Client-Side Permission tabs | nothing | Placeholder grids. |

There is no delete or retire action in the UI. `MST_API_APPLET_DELETE` exists on the backend and is
reachable only through the API.

## Related applets

- [Tenant Admin Applet](/applets/external-tenant-admin/tenant-admin-applet/) — the tenant-side
  counterpart. It reads the registry this applet writes; a platform system administrator can also act
  on its endpoints.
- [Applet Store](/applets/applet-store/) and [Applet Catalog](/applets/applet-catalog/) — the
  customer-facing view of the same records; the Catalog tab here shows which catalogues carry an
  applet and which tenants subscribe.
- [Applet Directory](/applets/applet-directory/) — the wiki's own index of applets; its `title` and
  `applet_code` values must match `bl_applet_hdr.name` and `.code` as maintained here.
- [Webhook Applet](/applets/integrations/webhook-applet/) — the real applet-trigger surface. The
  **Triggers** entry in this applet's settings is sample data and is not that mechanism.

## Troubleshooting

| Symptom | Cause | Fix |
| :--- | :--- | :--- |
| A category saved here does not appear anywhere | The Categories menu is a placeholder: the listing is one hard-coded row and Edit → SAVE raises a success toast without calling any service. | Do not use this menu. Category data has to be written through the platform API. The toast is not evidence of a save. |
| The Developer menu shows one developer and no **+** button | The Developer listing is hard-coded sample data, and `developer-pages.service.ts` registers only a listing and an edit screen — there is no create screen. | Manage developer records elsewhere; the vendor/applet Developer tabs are placeholders too, and Vendor → Developer → Add has an empty `onAdd()`. |
| Client-side permissions added on the Client-Side Permission tab never appear for the applet | That tab is a placeholder grid with one sample row and no service. | Seed `bl_applet_client_side_perm_dfn` through the API. This is why so many applets have no client-side permission rows at all. |
| Applet Code cannot be changed after creation | The update effect sends name, vendor, store, type, status, description, documentation URL and `property_json` — it does not send `code`. | Register a new applet with the correct code; the old one can only be set to `INACTIVE`. |
| Two people edited the same applet and one set of changes vanished | The update effect re-reads the applet by GUID and overwrites the fields from the form before PUTting the whole container. There is no revision check on this path. | Coordinate edits, or make the change through the API with the current revision. |
| A read of an applet comes back with only a GUID and an icon and no error | `AppletController.replaceAppletWithoutPermission` strips the container instead of returning *not authorised* when the caller lacks permission. | Check the caller's `MST_APPLET_*` / `MST_API_APPLET_READ` grants rather than looking for a failed request. |
| The applet loads a blank screen in the shell after registration | Router Link and Applet URL are both required by the form but nothing validates that the URL actually serves the bundle, or that Custom Element Tag matches the tag the bundle defines. | Check `property_json.es_module_url` and `property_json.custom_element` against what the applet's own `app.module.ts` registers with `customElements.define`. |
| The Triggers screen lists "Sample Event #1…#10" | The vendored `WebhookComponent` is a design mock; its detail grid is three literal sample rows and its `ngOnInit` is copy-pasted from the Default Selection screen. | Applet triggers are configured elsewhere — see [Webhook Applet](/applets/integrations/webhook-applet/). |
| Field Settings toggles do not stick | The local Field Configuration component has eight toggles with no form binding and a SAVE button with no handler, and its labels are copied from a document applet. | There is nothing to configure here. |
| The Settings gear opens on Feature Visibility, a screen with no menu entry | `settings` with no child redirects to `feature-visibility`, which is not in `settingItems`. | Pick an entry from the settings menu; the redirect target is an unlinked stub. |

## Related documentation

- [Applet Directory](/applets/applet-directory/) — every applet documented in this wiki
- [Applet Store](/applets/applet-store/) — how tenants find and install applets
- [Tenant Admin Applet](/applets/external-tenant-admin/tenant-admin-applet/) — the tenant-side console
