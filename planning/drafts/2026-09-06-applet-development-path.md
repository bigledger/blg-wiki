---
title: "Applet development path — notes, citations and page plan"
date: 2026-09-06
status: drafted
scope: content/en/developers/applets/ (new), content/en/developers/_index.md (rewritten)
ground_truth: /home/marketing/repos/refs/ (pulled 2026-09-06), npm registry, public DNS, akaun_master registry (aggregates only)
---

## Why this exists

`planning/reviews/2026-09-06-developers-section-audit.md` unpublished sixteen pages, including
`applet-development.md`, because they documented a toolchain that does not exist
(`@bigledger/applet-cli`, `@bigledger/applet-sdk`, `@bigledger/ui-components`,
`@bigledger/applet-builders` — all 404 on npm). Nothing here is carried over from those pages.
Every claim below has a file, a package or a DNS answer behind it.

The product owner's goal: *"if you look at android, anyone can just read the documentation and
able to develop android apps. We hope our wiki will be able guide all developers developing new
applets, to be able to do so, by reading the wiki."*

Two audiences for `content/en/developers/`, both **external**:
1. building an applet on the platform (this unit),
2. integrating an outside system with the data hub (next unit — evidence at the bottom).

Platform internals (backend service design, front-end architecture) stay in `blg-intranet`.
The line applied throughout: **need, not interest.**

---

## Method

Read one applet end to end, then confirmed the pattern against three more.

- **Primary:** `refs/blg-applet-akaun-platform-example-applet` —
  `micro-fe/projects/akaun-platform/applets/example-applet/`. This is BigLedger's own template
  applet: a full Angular project with routing, settings routes, permission resolver, an ngrx
  state controller and a worked API call. It is the closest thing that exists to an "applet
  starter".
- **Confirmed against:** `refs/blg-applet-wavelet-chart-of-account-applet` (single-project
  workspace, Angular 14, actively maintained — last commits reference live issues),
  `refs/blg-applet-wavelet-url-shortener-applet` and `refs/blg-applet-wavelet-forex-applet`
  (145-project workspaces, Angular 11).
- **Shell side:** `refs/blg-applet-akaun-platform-example-applet/micro-fe/projects/akaun-platform/shells/akaun-shell/`
  — the loader that fetches an applet bundle and hands it its session.
- **Client library:** `refs/blg-akaun-ts-lib`.
- **Registry:** `akaun_master.bl_applet_hdr`, aggregates and two BigLedger-owned rows only.

---

## Verified facts, with citations

### 1. An applet is an Angular Elements bundle, loaded at runtime by the shell

- The applet's `AppModule` constructor wraps its root component with
  `createCustomElement(AppComponent, { injector })` and registers it as
  `"<name>-elements-" + sessionStorage.getItem("randomNumber")`, then rewrites the tag of the
  element carrying `id="customtag"` in `index.html` to that same name.
  `…/example-applet/src/app/app.module.ts:106-140`;
  identical shape at `…/chart-of-account-applet/src/app/app.module.ts` (the
  `customElements.get / define / changeTagName` block).
- `index.html` body is a single element with `id="customtag"`:
  `…/example-applet/src/index.html` → `<example-applet-elements id="customtag">`;
  `…/chart-of-account-applet/src/index.html` → `<chart-of-account-applet-elements id = "customtag">`.
- `ngDoBootstrap() {}` — no `bootstrap:` array. Same in both.
- The shell injects a `<script src=…>` for the bundle URL into `<head>`:
  `blg-akaun-ts-lib/…/services/load-scripts/load-mf-script.service.ts` (`LoadMFScriptService.loadScript`),
  called from `akaun-shell/src/app/modules/applet-loader/applet-loader.component.ts:44`.

### 2. The shell hands the applet its session through Web Storage

`akaun-shell/src/app/modules/launchpad-container/default-launchpad-panel/default-launchpad-panel.component.ts:155-176`
generates `num = Math.floor(Math.random() * 90000000) + 10000000` (8 digits), substitutes it for
`XXXXXXXX` in the registered tag, rewrites the applet-loader route's `path` to the applet's
`routerlink`, then sets:

| Key | Store | Set by | Source |
|---|---|---|---|
| `randomNumber` | session | shell | `default-launchpad-panel.component.ts:170` |
| `routerLink` | session | shell | `:171` |
| `es_module_url` | session | shell | `:172` |
| `appletMFTag` | session | shell | `:173` |
| `tenantCode` | session | shell | `:174` |
| `authToken` | local | shell login | read in `akaun-shell/src/services/user-auth-service.ts:22`, and in `projects/shared-utilities/visa.ts` |
| `appletToken` | session | shared layout | `refs/blg-shared-utilities/modules/layout/layout.component.ts:88,136` |
| `appletCode` | session | applet's own `main.ts`, dev only | `…/chart-of-account-applet/src/main.ts:14` |

Enum of the shell-set keys: `akaun-shell/src/app/models/storge.enum.ts`.

### 3. Routing: hash router, and the route prefix must equal the registry `routerLink`

- `RouterModule.forRoot(AppRoutes, { useHash: true })` — `example-applet/src/app/app.module.ts:66`.
- The applet's top route path is a constant: `export const mainPath = 'applets/akaun/dev/example-applet'`
  (`example-applet/src/app/app.routing.ts:19`);
  `appletMainRouter = 'applets/tnt/wavelet/erp/accounting/chart-of-account-applet'`
  (`chart-of-account-applet/src/app/models/chart-of-account-constants.ts:11`).
- **Confirmed against the live registry.** `akaun_master.bl_applet_hdr` row `chartOfAccountApplet`
  carries `property_json->>'routerLink' = applets/tnt/wavelet/erp/accounting/chart-of-account-applet`
  and `applet_mf_html_tag = <chart-of-account-applet-elements-XXXXXXXX></chart-of-account-applet-elements-XXXXXXXX>`
  — exactly the source constant and exactly the element name. The two sides of the contract match.

### 4. Reaching the API — `blg-akaun-ts-lib`, and it is genuinely public

- `blg-akaun-ts-lib` on npm: **200**, latest `0.2.910046280324`, 4,715 versions, modified
  2026-09-02, licence MIT. `blg-akaun-ng-lib`: **200**, latest `2.0.11`, 66 versions, MIT.
  Both usable by anyone.
- `peerDependencies: { "@angular/common": ">=11 <16", "@angular/core": ">=11 <16" }` —
  `refs/blg-akaun-ts-lib/projects/blg-akaun-ts-lib/package.json`. This is the authoritative,
  publicly checkable Angular version window.
- Every call takes an `ApiVisa`:
  `{ tenantCode?, applet_code?, api_domain_url?, jwt_secret, AccessID?, AccessKey? }` —
  `…/core2/api-services/shared/api-visa.model.ts`.
- Applets build it from storage:
  `projects/shared-utilities/visa.ts` — `tenantCode` from `sessionStorage`, `api_domain_url` from
  `environment.api_domain`, `jwt_secret` from `localStorage.authToken`; `setAppletToken()` swaps in
  `sessionStorage.appletToken`.
- Headers actually sent: `authorization: <jwt_secret>`, `tenantCode`, `appId` (defaults to the
  string `'none'`) — `…/shared/base-api-template-service.model.ts:41-58`.
  Access-key variant sends `accessId`, `accessKey`, `tenantCode`, `appId` (`:104-118`).
- URL shape: `api_domain_url + endpoint_path`, where `endpoint_path` is assembled from
  `Core2Config` constants — `…/shared/core2Config.ts`. Access-endpoint suffixes are class
  constants on the base service: `backoffice-ep`, `login-entity-ep`, `login-ep`, `sysadmin-ep`,
  `public-ep`, `website-ep`, `tenant-admin-ep` (`base-api-template-service.model.ts:24-30`).
- Worked example: `CompanyService` sets
  `endpoint_path = 'core2/dm/' + 'companies/' + 'backoffice-ep'`
  (`…/erp/company-services/company.service.ts:22-27`), and the example applet's ngrx effect calls
  `compService.post / put / delete / getByGuid` with `AppConfig.apiVisa`
  (`example-applet/src/app/state-controllers/company-controller/store/effects/company.effects.ts`).
- Environments: `api_domain: 'https://api.akaun.com/'`, `url_domain: 'https://akaun.com/#/'`,
  `master_tenant_code: 'akaun_master'` — `…/environments/environment.prod.ts`.
  `api.akaun.com` resolves (56.69.230.99); `akaun.com` returns 200.

### 5. Build and packaging

- Custom webpack builder: `@angular-builders/custom-webpack:browser`, with a per-applet
  `*-webpack.config.js` that sets a unique `library` name and a unique jsonp global —
  `jsonpFunction: 'webpackJsonpExampleApplet'` (webpack 4 / Angular 11) or
  `chunkLoadingGlobal: 'webpackJsonpChartOfAccountApplet'` (webpack 5 / Angular 14).
  Files: `example-applet/example-applet-webpack.config.js`,
  `chart-of-account-applet/chart-of-account-applet-webpack.config.js`.
  Merge strategy `{"externals": "replace"}` — `angular.json`.
- Build then concatenate. Real commands, from real publish scripts:
  - `ng build --configuration=production --project=chart-of-account-applet --output-hashing none`
  - `node elements-build-scripts/wavelet-erp/chart-of-account-applet/chart-of-account-applet-elements.js`
  The second script uses `fs-extra` + `concat` to join `runtime.js`, `polyfills.js`, `scripts.js`,
  `main.js` into one `<applet>-elements.js` and copy `styles.css` beside it.
  (Angular 11 example applet concatenates `polyfills-es5.js` instead of `polyfills.js`.)
- `--output-hashing none` is mandatory: the concat script names the four inputs literally.
- Workspace bootstrap, from the maintained repo's `package.json`:
  `"setup": "git submodule update --init --recursive && npm install --legacy-peer-deps"`,
  `"postinstall": "ngcc"`.
- Versions in the maintained single-applet repo: `@angular/core ^14.3.0`, `@angular/cli ^14.2.13`,
  `@angular/elements ^14.3.0`, `typescript 4.6.4`, `@angular-builders/custom-webpack ^14.0.0`.
  The older multi-applet workspaces are Angular 11 / TypeScript 4.1. No `engines` field, no
  `.nvmrc` anywhere — Node version is unstated in every repo read.

### 6. Hosting

- Registry hosts, from `bl_applet_hdr` (aggregate only, 211 rows with a URL):
  205 on one `ap-southeast-5` object-storage bucket, 2 on an `ap-southeast-1` bucket,
  1 development bucket, 1 staging bucket, 1 on `akaun.com`.
- Bundles are world-readable: fetching the Developer applet's own production bundle over plain
  HTTPS returns **200, 3,174,662 bytes, `application/javascript`** with no credentials.
  So the loading mechanism needs nothing but a public HTTPS URL.
- **The example applet has no production registry row.** Querying `bl_applet_hdr` for
  `code ILIKE '%example%'` returns 0 rows; the only developer-ish rows are `developerApplet`
  (ROOT-USER) and `developer-sysadmin-applet` (ROOT-ADMIN). There is no live reference applet an
  outsider could open and inspect.
- Internal publish scripts, their bucket names and their AWS profile names are deployment
  internals and are **not** published to the wiki.

### 7. Registration

Done through the **Developer applet** (`developerApplet`, ROOT-USER, `routerLink: developer-applet`),
`new-applet.component.ts` in `refs/blg-applet-core-akaun-platform-akaun-developer-applet`.
Form controls and validators (`ngOnInit`, `:121-131`):

| Field | Required | Validator |
|---|---|---|
| Applet Name | yes | — |
| Applet Code | yes | no spaces |
| Applet Short code | yes | no spaces, exactly 2 characters |
| Applet Type | yes | one of ten values (see below) |
| Applet Router | yes | — |
| ES Module Url | yes | URL |
| Custom Element Tag | yes | — |
| Applet Store | yes | chosen from registered stores |
| Applet Vendor | yes | chosen from registered vendors |
| Required Permission | — | multi-select of existing permission codes |
| Description, Icon | — | — |

`onSubmit` (`:160-176`) writes `property_json` as
`{ routerLink, custom_element, applet_mf_html_tag: '<' + tag + 'XXXXXXXX></' + tag + 'XXXXXXXX>',
es_module_url, applet_shortcode }`, sets `status: 'ACTIVE'`, and appends one extension row
`REQUIRED_PERMISSIONS` (JSON, `{ required_permission: [...] }`).

**The `XXXXXXXX` suffix is synthesised by the form** — the developer types the bare tag
(`chart-of-account-applet-elements-`), not the wrapped one.

Applet types offered: `ROOT-ADMIN`, `ROOT-USER`, `TNT-ADMIN`, `TNT-USER`, `CLI-CLIENT`,
`ETL-CLIENT`, `WEB-CLIENT`, `PROGRAM-CLIENT`, `SDK-CLIENT`, `TENANT-APPLET`
(`new-applet.component.ts:46-57`). Live distribution: TNT-USER 145 ACTIVE, TNT-APPLET 32,
TNT-ADMIN 21, ROOT-ADMIN 4, ROOT-USER 4, ETL-CLIENT 2, VIRTUAL_APPLET 1.
(`TNT-APPLET` and `VIRTUAL_APPLET` exist in data but are not offered by the form.)

The Developer applet writes to `akaun_master`
(`apiVisa.tenantCode = environment.master_tenant_code`, `new-applet.component.ts:31-35`).
**An outside developer has no access to it.**

### 8. What is public and what is not — measured 2026-09-06

Unauthenticated `api.github.com/repos/bigledger/<repo>`:

| Repo | Status |
|---|---|
| `blg-applet-akaun-platform-example-applet` | 404 |
| `blg-applet-core-akaun-platform-example-applet` | 404 |
| `blg-shared-utilities` | 404 |
| `blg-akaun-ts-lib` | 404 |
| `blg-akaun-ng-lib` | 404 |
| `blg-akaun-mf-app-ng` | 404 |
| `blg-akaun-platform-java` | 404 |
| `blg-applets-akaun-platform` | 404 |
| `akn-kotlin-sdk` | **200** |

npm: `blg-akaun-ts-lib` **200**, `blg-akaun-ng-lib` **200**, `shared-utilities` 200 (an unrelated
package, not BigLedger's), `blg-shared-utilities` **404**, `blg-sdk-ng-ui-kit` **404**,
`@bigledger/sdk` 404, `@bigledger/applet-sdk` 404.

So: the client library is public and installable; **the shared UI/settings/permission component
library is not published anywhere** and every applet consumes it as a git submodule from a private
GitHub repo (`.gitmodules` → `https://github.com/bigledger/blg-shared-utilities.git`), or vendors a
private copy (lane findings §27).

`refs/blg-bigledger-cli` is **not** an applet CLI — it is an internal GitHub/JIRA/HR ops tool, its
own README marks the repo as permanently private. Do not cite it as developer tooling.

---

## The honest bottom line

An outside developer **can** build and self-host a working applet bundle from public information:
Angular + `@angular/elements` + `blg-akaun-ts-lib` from npm, following the element/routing/session
contract above. Two things they **cannot** do alone:

1. **Register it.** The registry row lives in `akaun_master` and is written through the Developer
   applet, which is a ROOT-USER applet. Nothing about it is self-service. Until the row exists, no
   tenant can launch the applet.
2. **Use the shared applet chrome.** Layout, settings screens, permission screens, the grid
   helpers, the pickers — `projects/shared-utilities` — are in a private repo, unpublished. An
   external applet must build its own equivalents.

Both are product facts, not documentation gaps. See the report for the (a)/(b) split.

---

## Page plan

New subsection `content/en/developers/applets/` — the drafted `applet-development.md` and
`getting-started.md` at the section root stay `draft: true` and must not be reused.

| Page | Weight | Job |
|---|---|---|
| `applets/_index.md` | 10 | What an applet is, the runtime contract in one table, what you need from BigLedger, links to the two pages. |
| `applets/getting-started.md` | 10 | Nothing → a bundle running inside a tenant. Every command taken from a real repo config. Ends with the registration hand-off and a "what success looks like" check. |
| `applets/applet-development.md` | 20 | The real structure: project layout, the runtime contract in full, the API client, settings and permissions, packaging, hosting, registration reference, known limits. |
| `developers/_index.md` | 25 | Rewritten. Two labelled paths: build an applet / integrate a system. The second is an explicit placeholder. |

**Structural note (CLAUDE.md `planning/` gate).** This adds one subsection under an existing
section and moves no existing page or URL. It was directed by the coordinator relaying the product
owner. If `developers/` is restructured further — merging `content/en/api-reference/` and
`content/en/developer-docs/`, or moving the drafted pages out — that needs a spec citing an ADR.

Deliberately **not** written: an SDK page (the four real SDKs are Kotlin/Java and belong with the
integration path), a webhooks rewrite, an authentication rewrite. All three are named in the audit
and remain open.

---

## Handover to the integration / data-hub unit

Evidence gathered while establishing the applet path. Not written up anywhere yet.

- **`etl-ep` is the integration access endpoint.** 156 controllers in `akaun-api` carry an
  `etl-ep` mapping. Shapes, by frequency: `/etl-ep` (306), `/etl-ep/{guid}` (215),
  `/etl-ep/query` (135), `/etl-ep/export/csv` (17), `/{docType}/etl-ep` (13),
  `/etl-ep/lines`, `/etl-ep/extensions`, `/etl-ep/query/snapshot`,
  `/add-files/etl-ep/{hdrGuid}`, `/file/etl-ep/{extGuid}`, `/replace-file/etl-ep/{extGuid}`,
  `/permanent/etl-ep/{guid}`. So the surface is CRUD + query + snapshot + CSV export + file
  attachment, per resource — the same resource set as `backoffice-ep`, under a different gate.
- **How an outside system authenticates.** `AccessKeyDatabaseValidator`
  (`javasdk/src/main/java/com/bigledger/core2/auth/AccessKeyDatabaseValidator.java`) Argon2-matches
  the presented key against stored credentials and caches the result for 10 minutes. Its own class
  comment: *"Access keys are normally used by processes that make a lot of API calls (e.g. ETL),
  and the keys are long-lived."* That is the intended integration credential, stated in source.
- **Two header styles exist in the client library.** `getHttpHeader` sends
  `authorization` + `tenantCode` + `appId`; `getHttpHeaderAccessKey` sends
  `accessId` + `accessKey` + `tenantCode` + `appId`
  (`base-api-template-service.model.ts:41-58, 104-118`). The CORS allow-list on the server includes
  `accessId` and `accessKey` (`akaun-api/src/main/java/app/api/config/CorsInterceptor.java:40`),
  which corroborates that this is a supported external path, not a leftover.
- **Registry.** Applet type `ETL-CLIENT` is offered by the Developer applet form and there are
  **2 ACTIVE `ETL-CLIENT` rows** — so an integration is modelled as an applet registration too.
  Also 1 ACTIVE `VIRTUAL_APPLET`.
- **Repos to read next:** `refs/blg-etl-agents`, `refs/blg-custom-integration-platform-java`,
  `refs/blg-custom-processing-etl-agent`, `refs/blg-applet-wavelet-virtual-etl-applet`.
  Several sibling ETL repos are customer-specific — cite by pseudonym only.
- **Open question for that unit:** whether an outside integrator can obtain an access key without
  BigLedger creating it. Nothing read here suggests self-service issuance.

---

## Found while working — not in scope, needs a decision

### `content/en/developers/architecture/_index.md` is live fiction and was missed by the audit

The audit unpublished `architecture/overview.md`. Its sibling `_index.md` (≈270 lines) is
**still published** and is fabricated by the audit's own measurements. It states, as fact:

- Backend is **Node.js / Express.js** (it is a Spring Boot Java deployable).
- **Redis** for caching, **Elasticsearch** for search, **Kubernetes** orchestration,
  **GraphQL**, **WebSocket**, **event sourcing**, **API gateways**, **distributed tracing**.
  The audit greps the whole backend repo: `Elasticsearch` 0 files, `RedisTemplate` 0,
  `KafkaTemplate` 0, `RabbitTemplate` 0, `prometheus` 0.
- **SOC 2 Type II**, **ISO 27001**, **GDPR** compliance claims.
- A **"Future Architecture (v3.x)"** roadmap — AI/ML integration, edge computing, serverless,
  streaming analytics. CLAUDE.md: *"Do not invent roadmap features… A docs site documents what
  exists."*
- An "Architecture Board", "Architecture Office", "Professional Services" and "Training Programs".

It also holds the only two remaining published→draft links in the section
(`/developers/architecture/overview/`, `/developers/api-reference/integrations/`).

It is also the clearest case of publishing platform internals to an external audience — which,
per the product owner's 2026-09-06 note, belongs in `blg-intranet` if anywhere.

**Not acted on.** Unpublishing is a visibility decision and the audit handled that class of change
as its own unit. Recommend the same treatment as its sibling: `draft: true` with a dated comment.
The new `developers/_index.md` no longer links to it.

### Small adjacent fixes made, to stop the section dead-ending

- `api-reference/_index.md` — the Platform Library card said *"the shared library BigLedger applets
  are built on"*. It is not: it is the Java backend library. Corrected to *"Building a backend
  application on the published BigLedger Java libraries."* This one is worth noting because it is
  exactly the confusion the applet path exists to clear up.
- `platform-library/_index.md` — dropped a link to the unpublished `/developers/sdks/`; replaced
  the `/developers/authentication/` link with `/developers/applets/`.
- `platform-library/building-your-application.md`, `versioning-and-upgrades.md`,
  `troubleshooting.md` — three "Getting Started" links pointed at `/developers/getting-started/`
  (unpublished, and the wrong page anyway); repointed at
  `/developers/platform-library/getting-started/`. Dropped one `/developers/authentication/` link.

After these, **zero published pages under `content/en/developers/` link to a draft page**, except
`architecture/_index.md` above.
