---
description: The structure of a BigLedger applet - project layout, the runtime contract with the shell, the API client, settings, permissions, packaging and the registration record.
tags:
- applet-development
- angular
- architecture
title: Applet Structure
weight: 20
---

Reference for the parts of an applet that the platform constrains. Everything not described here
is yours to decide.

[Getting Started](/developers/applets/getting-started/) walks the same ground in build order. This
page is organised by subject and is the one to come back to.

## Project layout

An applet is one Angular application. A minimal one has four files that differ from any other
Angular application:

```
my-applet/
├── angular.json                      # builder switched to custom-webpack
├── my-applet-webpack.config.js       # unique bundle globals
├── elements-build.js                 # concatenates the build output into one file
└── src/
    ├── index.html                    # single placeholder element, id="customtag"
    ├── main.ts                       # standard platformBrowserDynamic bootstrap
    ├── environments/
    │   └── environment.prod.ts       # api_domain
    └── app/
        ├── app.module.ts             # defines the custom element; ngDoBootstrap() {}
        ├── app.routing.ts            # one exported route-prefix constant
        └── app.component.ts          # root component; becomes the custom element
```

BigLedger's own applets are built in shared Angular workspaces holding many applet projects at
once, which is why their paths are long (`projects/<group>/applets/<applet>/src/…`) and their
build commands always pass `--project`. That arrangement exists to share code across dozens of
internally-maintained applets. An external applet has no reason to copy it: use a single-project
workspace and drop `--project` from the build command.

## The runtime contract

### What the shell does

1. The user launches your applet from the shell.
2. The shell reads your registration record and generates an 8-digit instance number.
3. It writes the session into browser storage (table below).
4. It rewrites its own route table so that your registered route prefix points at its applet
   loader, and navigates there.
5. The loader appends `<script src="{your bundle URL}" async defer>` to the document head.
6. Loading your bundle registers your custom element as a side effect.
7. The loader mounts `<your-tag-NNNNNNNN>`.

Your applet has no lifecycle hook into any of this. It runs when its element is upgraded.

### Session keys

| Key | Store | Written by | Meaning |
|---|---|---|---|
| `randomNumber` | session | shell, per launch | 8-digit instance number; suffix of your element name |
| `tenantCode` | session | shell | the tenant this launch is scoped to |
| `routerLink` | session | shell | the route prefix the shell navigated to |
| `es_module_url` | session | shell | the URL your bundle was loaded from |
| `appletMFTag` | session | shell | the resolved element tag, with the suffix substituted |
| `authToken` | local | shell, at sign-in | the signed-in user's bearer token |

Treat all of these as read-only. `authToken` is the only one in **local** storage.

Two further keys appear in BigLedger's own applets and are worth knowing about:

- `appletToken` (session) — a token scoped to one applet within one tenant, rather than to the
  user across the platform. BigLedger's shared layout obtains and refreshes it. An external applet
  using the user's `authToken` does not need it.
- `appletCode` (session) — the applet's own registered code. BigLedger's applets set it themselves
  in `main.ts` for local development, and their shared settings screens read it to decide which
  settings to render.

### The four agreements

| Agreement | Your side | Registered as | Symptom when wrong |
|---|---|---|---|
| Bundle URL | where you host the file | `ES Module Url` | nothing loads; 404 in the network panel |
| Element name | `customElements.define('my-applet-elements-' + randomNumber, …)` | `Custom Element Tag` (bare, no suffix) | bundle loads, blank page, no error |
| Route prefix | the `path` of your top-level route | `Applet Router` | applet loads, then falls through to its wildcard route |
| Session keys | your reads | not configurable | no tenant context; API calls unauthorised |

The element name and the route prefix are the two that fail quietly. Check them first.

## Reaching the API

### The client library

`blg-akaun-ts-lib` is on the public npm registry under the MIT licence. It is an Angular library:
`@angular/core` and `@angular/common` are peer dependencies, declared as `>=11 <16`. It contains
one injectable service per resource, plus the models and query-criteria classes those services
take and return.

Install it and inject the service you need. Do not construct URLs by hand — the library owns the
URL shape, and the URL shape changes.

### The API visa

Every service method takes an `ApiVisa` as its last argument:

```typescript
interface ApiVisa {
  tenantCode?: string;      // which tenant the call is scoped to
  applet_code?: string;     // your registered applet code; defaults to 'none'
  api_domain_url?: string;  // 'https://api.akaun.com/'
  jwt_secret: string;       // the bearer token
  AccessID?: string;        // long-lived key pair, for server-to-server callers
  AccessKey?: string;
}
```

For an applet, `tenantCode` and `jwt_secret` come from browser storage and `api_domain_url` from
your environment file. `AccessID` / `AccessKey` are for integrations that run outside a browser
session; they are not how an applet authenticates.

The library turns the visa into request headers. An applet call carries `authorization`,
`tenantCode` and `appId`.

### URL shape

The library composes each request URL as:

```
{api_domain_url}core2/{scope}/{layer}/{module}/{resource}/{access-endpoint}
```

- **scope** — `tnt` for tenant-scoped resources, `platform` for platform-scoped ones. A few
  resources sit directly under `core2/dm/`.
- **layer** — `dm` (domain) or `ms` (micro-services).
- **module** — the functional area: `erp`, `inv`, `fi`, `crm`, `hr`, `alg`, and others.
- **resource** — the plural resource name, e.g. `companies`, `items`, `generic-doc`.
- **access endpoint** — who is allowed to call it.

Example, the resource behind `CompanyService`:
`https://api.akaun.com/core2/dm/companies/backoffice-ep`.

### Access endpoints

The last path segment is not decoration. It selects which category of caller the endpoint serves,
and the same resource is usually exposed under several. The client library reflects this in its
method names — `getByCriteria` targets the back-office endpoint, `getByCriteriaPublic` the public
one, `getByCriteriaLoginEntity` the entity-login one, and so on.

| Endpoint | Caller |
|---|---|
| `backoffice-ep` | a signed-in staff user working inside the shell — **this is the applet case** |
| `login-ep` | a signed-in user acting on their own records |
| `login-entity-ep` | a signed-in external party — a customer or supplier acting on their own records |
| `public-ep` | unauthenticated callers, where the resource permits it |
| `etl-ep` | server-to-server integrations authenticating with a long-lived key |
| `tenant-admin-ep`, `sysadmin-ep` | administrative callers |

Unless your applet is deliberately serving customers or suppliers, use the plain method names —
they resolve to `backoffice-ep`.

### Responses

```typescript
interface ApiResponseModel<T>      { code: string; message?: string; data?: T[]; }
interface BasicApiResponseModel<T> { code: string; message?: string; data?: T; }
interface PagingResponseModel<T>   { data: T[]; totalRecords: number; offset: number;
                                     limit: number; code: string; message: string; }
```

`code` is a platform response code, not an HTTP status — read it, do not infer success from the
transport alone. List calls that take a `Pagination` return the paging envelope.

## Settings

BigLedger models applet configuration at two levels.

**At registration.** A small number of values are fixed when the applet is registered — its route,
its element tag, its bundle URL, its short code and the permission codes it declares it needs.
Changing any of them means changing the registration record, which is a hand-off to BigLedger.

**Per tenant.** Everything a tenant can vary — which fields are visible, which are mandatory,
which defaults are pre-selected — is stored against the applet within that tenant and edited from
inside the applet. By convention this lives under a `settings` child route with one child per
settings screen, and a matching `personalization` route for per-user rather than per-tenant
preferences:

```
{route prefix}/settings/field-settings
{route prefix}/settings/default-selection
{route prefix}/settings/feature-visibility
{route prefix}/settings/permission-set-listing
{route prefix}/settings/user-permission-listing
{route prefix}/settings/team-permission-listing
{route prefix}/settings/role-permission-listing
{route prefix}/personalization/personal-default-selection
{route prefix}/personalization/sidebar
```

{{< callout type="warning" >}}
**The screens behind those routes are not published.** In BigLedger's own applets, most of them
are components imported from an internal shared Angular library. That library is not on npm and
not publicly readable. The route convention above is worth following so your applet is where users
expect it to be, but you have to implement the screens yourself.
{{< /callout >}}

Users reach these screens from the applet's own navigation, not from a platform-wide settings
area. An applet with no settings simply omits the routes.

## Permissions

Permissions are defined by the platform, granted inside a tenant, and consumed by your applet.

- **At registration**, your applet names the permission codes it requires. These are selected from
  the codes the platform already defines; an applet does not invent permission codes.
- **Inside a tenant**, an administrator grants those permissions to users, teams and roles.
- **At runtime**, the API enforces them. A call the signed-in user is not permitted to make fails
  at the API, whatever your applet's UI allows.

The practical consequence: **do not treat your UI as the enforcement point.** Hiding a button is a
usability decision. Whether the operation is allowed is decided server-side, and your applet
should handle the refusal.

If your applet needs a permission code that does not exist, that is a request to BigLedger, not
something you can add.

## Packaging and release

### The bundle contract

One JavaScript file, fetched by `<script src>`, that registers a custom element as a side effect
of loading. That is the whole contract. It implies three things:

- **No module system at load time.** The file is loaded as a classic script, not as an ES module,
  despite the registration field being called *ES Module Url*.
- **Everything is inlined.** There is no code-splitting, no lazy chunk loading and no shared
  vendor bundle across applets. Each applet ships its own copy of Angular, so a bundle of a
  few megabytes is normal.
- **Bundle globals must be unique.** Two applets whose webpack chunk-loading globals or library
  names collide will break each other when both are loaded into one page. Derive both from your
  applet name.

`styles.css` is emitted next to the bundle. Component styles are inside the bundle; the separate
stylesheet carries the global styles declared in `angular.json`.

### Versioning

The registration record holds **one** bundle URL. There is no version field, no channel and no
staged rollout: every tenant with your applet installed loads whatever is at that URL the next
time a user launches it.

Two consequences worth planning for:

- **Releasing is overwriting.** Keep the previous bundle so you can roll back by re-uploading it.
- **Users get the new version on their next launch, not immediately.** A session already running
  keeps the bundle it loaded.

If you need staging and production to differ, that is two registration records with two URLs, and
they are installed into different tenants.

## The registration record

What BigLedger records about your applet. You supply these values; BigLedger creates the record.

| Field | Required | Constraint |
|---|---|---|
| Applet Name | yes | display name in the shell |
| Applet Code | yes | no spaces; unique |
| Applet Short code | yes | exactly two characters, no spaces |
| Applet Type | yes | see below |
| Applet Router | yes | your route prefix, verbatim |
| Custom Element Tag | yes | your element name **without** the instance suffix |
| ES Module Url | yes | must be a URL |
| Applet Store | yes | which catalogue the applet is listed in |
| Applet Vendor | yes | who publishes it |
| Required Permissions | no | permission codes, selected from those the platform defines |
| Description | no | |
| Icon | no | image upload |

**Applet types.** The type determines the scope the applet is installed and launched at:

| Type | Scope |
|---|---|
| `TNT-USER` | a normal user applet inside a tenant — **the usual choice** |
| `TNT-ADMIN` | a tenant-administration applet |
| `ROOT-USER`, `ROOT-ADMIN` | platform-level applets |
| `ETL-CLIENT`, `SDK-CLIENT`, `CLI-CLIENT`, `PROGRAM-CLIENT`, `WEB-CLIENT` | registrations for non-browser callers rather than for shell-mounted applets |

Most applets in the catalogue are `TNT-USER`.

## Known limits

Stated plainly, because they change what is worth building.

- **Registration is not self-service.** There is no public API and no console for creating or
  editing a registration record. Every change to your route, tag or bundle URL is a request to
  BigLedger.
- **The shared applet chrome is not published.** Layout, settings screens, permission screens,
  grids and pickers are internal. An external applet builds its own.
- **There is no published applet starter.** No CLI, no schematic, no template repository, and no
  reference applet registered in production that you could open and inspect.
- **There is no local shell.** You cannot run the shell locally, so end-to-end verification means
  hosting a bundle and launching it in a real tenant. During development, serve the applet
  standalone with `ng serve` and set the session keys by hand — with no `randomNumber` present
  your element simply registers as `my-applet-elements-null` and mounts normally. BigLedger's own
  applets do the equivalent, seeding development-only session values in `main.ts` behind an
  `if (environment.production) { … } else { … }` guard.
- **One URL per registration.** No versions, no channels, no rollback other than re-uploading.

If any of these blocks you, say so to
[developers@bigledger.com](mailto:developers@bigledger.com) — several are product gaps rather than
deliberate design.

## Related documentation

{{< cards >}}
{{< card link="/developers/applets/getting-started/" title="Getting Started" icon="play" subtitle="The same material in build order, with the commands." >}}
{{< card link="/developers/api-reference/" title="API Reference" icon="book-open" subtitle="The HTTP surface behind the client library." >}}
{{< card link="/developers/platform-library/" title="Platform Library" icon="server" subtitle="Building a backend application on the BigLedger Java libraries." >}}
{{< /cards >}}
