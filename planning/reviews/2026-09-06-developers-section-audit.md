---
title: "Developers section audit — measured against the Java backend"
date: 2026-09-06
status: complete
scope: content/en/developers/ (+ orphaned content/en/api-reference/, content/en/developer-docs/)
ground_truth: refs/blg-akaun-platform-java @ HEAD (pulled 2026-09-06, "Already up to date")
method: regex extraction of every Spring @*Mapping in the repo, Core2Config prefix constants resolved, matched against every METHOD+path documented in the wiki
---

## Headline

**The `/developers/` REST API reference is not a description of BigLedger's API. It is a
description of a generic SaaS API that does not exist.**

- Real endpoint count in the backend: **17,256 resolved mappings, 11,180 unique paths.**
  **Every single one is under `/core2/`.**
- The wiki documents **240 endpoints**. **24 are real (10%).** The 24 real ones are confined
  to three places: the `einvoice-api-reference/` subfolder, the approvals appendix in
  `purchasing.md`, and `automation-workflows.md` — all added by earlier remediation passes.
- The **eight hand-written REST reference pages** (`sales`, `inventory`, `accounting`,
  `reports`, `batch`, `integrations`, `einvoice`, `api-reference/_index`) document
  **159 endpoints, of which 0 are real.** Not "mostly wrong" — **zero**.
- Every hostname the section tells a developer to call **does not resolve**.

### Hostname evidence (public DNS, 2026-09-06)

| Host | Appears in | Resolves? |
|---|---|---|
| `api.bigledger.com` | 11 pages, the documented production base URL | **NXDOMAIN** |
| `sandbox-api.bigledger.com` | getting-started.md, authentication.md | **NXDOMAIN** |
| `api-sandbox.bigledger.com` | getting-started.md | **NXDOMAIN** |
| `auth.bigledger.com` | authentication.md (OAuth token endpoint) | **NXDOMAIN** |
| `developers.bigledger.com` | _index.md (console, explorer, Postman) | **NXDOMAIN** |
| `app.bigledger.com` | getting-started.md ("log in here to get your API key") | **NXDOMAIN** |
| `status.bigledger.com`, `community.bigledger.com` | _index.md support block | **NXDOMAIN** |
| **`api.akaun.com`** | only the einvoice subfolder | **resolves — 56.69.230.99** |

`api.akaun.com` is confirmed as the real host independently by
`refs/akn-kotlin-sdk`, which hardcodes `https://api-test.akaun.com/core2/dm/`.

---

## Task 1 — API reference measurement

Method: every `METHOD /path` in the page text (base URLs applied where a page declares one),
matched against the resolved backend mapping table. "Real" = exact METHOD+path, or the same
path under a different HTTP verb.

| Page | Documented | Real | Not found | % real |
|---|---:|---:|---:|---:|
| `api-reference/_index.md` | 33 | 0 | 33 | **0%** |
| `api-reference/sales.md` | 22 | 0 | 22 | **0%** |
| `api-reference/inventory.md` | 17 | 0 | 17 | **0%** |
| `api-reference/accounting.md` | 14 | 0 | 14 | **0%** |
| `api-reference/reports.md` | 31 | 0 | 31 | **0%** |
| `api-reference/batch.md` | 10 | 0 | 10 | **0%** |
| `api-reference/integrations.md` | 22 | 0 | 22 | **0%** |
| `api-reference/einvoice.md` | 10 | 0 | 10 | **0%** |
| `api-reference/errors.md` | 0 endpoints; 25 error codes | **0 of 25 codes real** | 25 | **0%** |
| `api-reference/purchasing.md` | 38 | 10 | 28 | 26% |
| **subtotal, hand-written REST pages** | **197** | **10** | **187** | **5%** |
| `einvoice-api-reference/` (5 pages) | 20 | 19 | 1 | **95%** |
| `api-reference/ucc/` (35 pages) | 330 | 0 as written / **257 real under a corrected prefix** | 73 | see below |

### The eight generic pages — what is wrong

They document a REST API with `/api/v1/` or `/v1/` prefixes and textbook resource names.
The backend has **one** `/api/…` mapping in 17,256 (a Bank BCA payment-gateway callback) and
**eight** `/v1/…` mappings (the web-chat channel). There is no `/api/v1` anywhere.

The real shape is `/core2/{tnt|platform}/{dm|ms}/<module>/<resource>/<endpoint-kind>`, where
endpoint-kind is one of `backoffice-ep`, `login-ep`, `login-entity-ep`, `etl-ep`, `public-ep`,
`sysadmin-ep`, `tenant-admin-ep`. Prefixes are in
`javasdk/src/main/java/com/bigledger/core2/common/api/constants/Core2Config.java:19-90`.

Worked example — the reader wants a customer:

- Wiki says: `GET /api/v1/customers` — `api-reference/sales.md:97`
- Reality: `GET /core2/tnt/dm/erp/entity/backoffice-ep/query`
  (`akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entity/EntityController.java:84,678`)
- There is no root `/customers` path in the backend at all.

Worst offenders, file:line:

| Documented (file:line) | Exists? |
|---|---|
| `sales.md:97` `GET /api/v1/customers` | no |
| `sales.md:176` `POST /api/v1/customers` | no |
| `inventory.md:146` `GET /api/v1/items` | no (real: `/core2/tnt/dm/erp/inv/items/backoffice-ep/query`) |
| `inventory.md:346` `GET /api/v1/inventory/stock` | no |
| `accounting.md:61` `GET /api/v1/accounts` | no |
| `accounting.md:249` `GET /api/v1/journal-entries` | no (49 real `journal*` paths exist, none named this) |
| `reports.md:32` `GET /v1/reports/balance-sheet` | no — **zero** backend paths contain `balance-sheet` |
| `reports.md:221` `GET /v1/reports/trial-balance` | no — zero contain `trial-balance` |
| `reports.md:229` `GET /v1/reports/cash-flow` | no — zero contain `cash-flow` |
| `batch.md:134` `POST /v1/batch/customers` | no — there is no `/batch` namespace |
| `einvoice.md:118` `POST /api/v1/einvoice/create` | no (real e-invoice API is fully documented one folder away) |
| `integrations.md:144` `POST /v1/integrations/shopify/sync-orders` | no (Shopify exists, as `/core2/tnt/dm/ecomsync/shopify/…`, 26 mappings) |
| `integrations.md:228` `POST /v1/integrations/woocommerce/sync-orders` | no — **WooCommerce does not exist in the product at all** |
| `integrations.md:296` Stripe integration | no — zero `stripe` mappings |
| `integrations.md:350` QuickBooks Online migration | no — zero `quickbooks` mappings |
| `integrations.md:405` Xero migration | no — zero `xero` mappings |

`integrations.md` is the clearest tell that these pages were written from a generic template:
it documents WooCommerce, Amazon Seller Central, Stripe, QuickBooks and Xero (none exist) and
**omits Lazada (44 mappings), Shopee (47), TikTok (5) and Magento (7)** — the connectors
BigLedger actually ships for its Malaysian/SEA market.

`errors.md` documents 25 error codes (`REQUIRED_FIELD`, `INVALID_API_KEY`,
`RATE_LIMIT_EXCEEDED`, `INSUFFICIENT_FUNDS`, …). The backend defines 479 response codes in
`javasdk/.../constants/ResponseCodeConstants.java`, prefixed `OK_`, `SERVER_`, `CLIENT_`
(e.g. `CLIENT_VALIDATION_GUIDDOESNOTEXIST`, `SERVER_GENERAL_SQLERROR`).
**Overlap between the two sets: zero.**

### The parts that are real

**`einvoice-api-reference/` (5 pages, ~2,000 lines) — 19/20 endpoints verified.**
Correct base URL (`https://api.akaun.com/core2/tnt/dm/erp/fi/e-invoice/to-irbs`), correct
paths. Spot-checked against
`MyEInvoiceRequestRejectionController.java:59,79,267`,
`MyEInvoiceDirectCancellationController.java:57,119`,
`MyEInvoiceLHDNIntegrationController.java:254`,
`EInvoiceEmailPrintableQueueController.java:115`. **This is the model the rest should follow.**

**`api-reference/ucc/` (35 pages, 330 endpoints) — generated from real controllers, one
systematic prefix error.** Every path is written `/core2/alg/cc/…`; the real prefix is
`/core2/tnt/dm/alg/cc/…` (`Core2Config.TENANT_DOMAIN_URL_PREFIX + ALG_MODULE_PREFIX`).
Correct that one string and **257 of 330 (78%) verify exactly**. Of the remaining 73:
about 40 use a second wrong prefix `/core2/{tenantId}/dm/alg/cc/…` (there is no `{tenantId}`
path segment — the tenant travels in a `tenantCode` header), and the rest are `.../{guid}`
variants whose real form differs. **This is a cheap, high-value fix — but it is a
find-and-replace across 35 files and belongs in its own unit.**

**`purchasing.md:435-449` and `automation-workflows.md:776-781`** — 16 real
`/core2/tnt/dm/erp/generic-doc/approvals/…` endpoints, added by commit `f25a917f`
("approvals are optional, and the wiki was documenting the wrong engine"). Correct.
But they sit in the *same file* as 28 invented `/v1/…` endpoints, which is arguably worse
than uniform fiction: a reader has no way to tell which half to trust.

---

## Task 2 — narrative pages

| Page | Lines | Verdict |
|---|---:|---|
| `getting-started.md` | 1,015 | **Invented.** Instructs the reader to sign up at `developers.bigledger.com` (NXDOMAIN), log in to `app.bigledger.com` (NXDOMAIN), collect an `blg_live_sk_…` key and a `company_abc123` id (neither format exists), and call `https://api.bigledger.com/v1` (NXDOMAIN). Claims "100% coverage … every feature" (`:15`) — unverifiable and almost certainly false. Claims WebSocket support (`:26`) — no WebSocket endpoint found. |
| `authentication.md` | 456 | **Partly right in shape, wrong in every detail.** Real: `Authorization: Bearer <token>` is correct — `AuthenticationInterceptor.java:106,116` reads the header and strips `Bearer `. Two validators run (`WebMvcConfig.java:220-223`): a JWT validator, and `AccessKeyDatabaseValidator` which Argon2-matches an API key against `app_login_principal.credential` — so "API key or bearer token" is broadly true. Everything else is invented: `X-Company-Id` (real CORS allow-list is `tenantCode`, `tenant-code`, `appId`, `accessId`, `accessKey`, `X-BigLedger-Instance-Code` — `CorsInterceptor.java:40`), the `blg_live_sk_` key format, the Settings > API Keys screen, and the whole OAuth 2.0 authorization-code flow against `auth.bigledger.com` (`:133,148,158`). The one real OAuth mapping in the backend is a Bank BCA payment-gateway callback. |
| `webhooks.md` | 924 | **Right that webhooks exist; wrong about all of it.** See below. |
| `sdks.md` | 946 | **Invented.** Six SDKs documented; **none of the packages exist.** `@bigledger/sdk` 404 on npm, `@bigledger/react-hooks` 404, `bigledger/sdk` 404 on Packagist. `bigledger-sdk` **does** exist on PyPI at v0.1.0 — but its summary is "PythonBot Twin Framework" pointing at `github.com/pythonbot-com/ptb-twin-framework`; it is a name placeholder, not this SDK. What is real: `refs/akn-kotlin-sdk` (Kotlin/Retrofit, published via JitPack as `com.github.bigledger:akn-kotlin-sdk`), `akn-kmp-sdk`, `akn-kotlin-sdk-mobile-lib`, and the Java `client-sdk`/`javasdk` in the platform repo. **None of the four real SDKs is mentioned on this page.** |
| `tutorials.md` | 1,255 | **Unrunnable.** Every code sample begins `require('@bigledger/sdk')` (`:93`, `:495`). Includes a "QuickBooks to BigLedger Migration" tutorial (`:1130`) for a migration path with no backend support. |
| `applet-development.md` | 870 | **Invented toolchain.** Tells the reader to `npm install -g @bigledger/applet-cli` (`:40`), depend on `@bigledger/applet-sdk` (`:112,122`), `@bigledger/ui-components` (`:274`) and build with `@bigledger/applet-builders:build` (`:581`). **All four 404 on npm.** A real applet — `refs/blg-applet-akaun-platform-example-applet/package.json` — has exactly one BigLedger dependency: `blg-akaun-ts-lib`, which **is** published on npm (200). The whole page names the wrong package. |
| `architecture/overview.md` | 812 | **Describes a different system.** Diagrams a microservices mesh behind an API gateway with Redis caching (`:422`), Elasticsearch search (`:448`), a message queue and distributed tracing (`:691`). The real backend is a **single Spring Boot Web deployable** (`akaun-api`) over JDBI + PostgreSQL, with per-tenant databases and a **PostgreSQL-table-backed queue** (`com.bigledger.core2.infra.postgresql.Queue`). Greps across the whole repo: `Elasticsearch` 0 files, `RedisTemplate` 0, `KafkaTemplate` 0, `RabbitTemplate` 0, `prometheus` 0. Multi-tenancy and DDD framing are directionally right; the infrastructure is fiction. |
| `platform-library/` (5 pages) | 636 | **Real.** Documents consuming the platform Java library from GitHub Packages / JitPack — `maven.pkg.github.com/bigledger/blg-akaun-platform-java` matches the actual repo, and JitPack is how `akn-kotlin-sdk` is genuinely published. Nothing contradicted. |

### Does BigLedger have webhooks? — **Yes. Real, and nothing like the docs.**

The mechanism is real and complete:

- `WebhookSubscriptionController.java:40` → `/core2/tnt/dm/webhook-subscription`
  (POST, PUT, DELETE `/{guid}`, GET, GET `/{guid}`, GET `/query`)
- `/core2/tnt/dm/webhook-topic` (same CRUD set)
- `WebhookActivityEventController.java:36` → `/core2/tnt/dm/webhook-activity`
  (GET `/{guid}`, GET `/query`) — the delivery log
- `javasdk/.../domain/tenant/WebhookService.java` does the delivery: a 4-thread pool POSTs
  the JSON body to each subscribed URL over Apache HttpClient with a 60s connect timeout,
  and writes every send/receive body into `bl_webhook_activity_event`.
- Topics are a **fixed enum of 53**, `javasdk/.../constants/WebhookTopics.java`:
  `CUSTOMER_CREATED/UPDATED/DELETED`, `SUPPLIER_*`, `EMPLOYEE_*`, `FINANCIAL_ITEM_*`,
  `BRANCH_*`, `LOCATION_*`, `VOUCHER_*`, `INTERNAL_SALES_ORDER_*`,
  `INTERNAL_SALES_INVOICE_CREATED`, `INTERNAL_SALES_RETURN_*`, `MEMBERSHIP_CARD_*`,
  `MEMBERSHIP_POINTS_TXN_*`, `PAYMENT_CONFIG_*`, `INVENTORY_UPDATED`, `INQUIRY_*`,
  `COMPANY_*`. **Subscribers pick from this list; they cannot define topics.**
- Authentication of the callback is a **single static header pair** stored on the
  subscription row — `auth_header_name` / `auth_header_value` (`WebhookService.java:166`).
  Fields on `bl_webhook_subscription_hdr`: `url`, `topic_hdr_guid`, `status`,
  `auth_header_name`, `auth_header_value`, `notification_contact_json`, plus per-outcome
  e-mail/SMS alert lists (`success_email`, `client_error_email`, `server_error_email`, …).
- **There is no HMAC signature and no retry.** No `signature`, `hmac` or `secret` appears in
  `WebhookService`; no retry/backoff/attempt logic exists.

What `webhooks.md` says instead: subscribe at `POST /api/v1/webhooks/subscribe` (`:135`),
manage at `/api/v1/webhooks/{webhookId}` (`:216,235`), read statistics at `:612`, fire a test
at `:669`, read logs at `:730` — **all seven endpoints invented**; free-form dotted topic
names (`invoice.created`-style) instead of the 53-value enum; HMAC signature verification
that does not exist; and a retry schedule that does not exist. A developer who builds a
receiver from this page will verify a signature that never arrives and rely on retries that
never happen.

There is **no `webhook-applet` in `bl_applet_hdr`** — querying `akaun_master` for
`code/name ILIKE '%webhook%'` returns 0 rows (the only developer-ish applets are
`developerApplet` and `developer-sysadmin-applet`, both ACTIVE). The wiki page
`content/en/applets/integrations/webhook-applet.md` exists and is currently being edited by
another lane; it is not in this unit's scope. Whatever that page describes, the
**subscription surface above is the real webhook mechanism** and it is an API, not an applet.

### Is there an MCP server? — **No.**

- **Zero** MCP-related mappings, classes, or dependencies in `blg-akaun-platform-java`.
- Across all of `refs/`, four hits: two `package-lock.json` transitive dependencies
  (`@modelcontextprotocol/sdk` pulled in by a tooling package), one study note
  (`blg-robot-support/knowledge/reviews/2026-06-30-koog-1.0-study.md:94`), and one
  architecture spec — `blg-poc-mbf-group/specs/02-architecture.md:188`, headed
  **"Why NOT an MCP Server?"**, which records the decision: *"Koog agent with Claude API
  integration, not MCP."*
- The `/developers/` section **never mentions MCP** — not once in 21,265 lines.

So the positioning line *"the backbone for AI agents via API, MCP and SDK"* — in `hugo.yaml`
(4 languages) and `content/en/_index.md:3,22,69` — asserts a capability that does not exist
and that the docs site does not document. The `/developers/` card on the home page reads
*"REST API, SDKs, webhooks and MCP"* and links to a section with no MCP page.

**This needs a decision, not a quiet edit.** Either MCP is on the roadmap and the line should
say so explicitly, or it should be dropped from the four `hugo.yaml` descriptions and
`_index.md`. CLAUDE.md's own rule — *"A docs site documents what exists"* — points at
dropping it. Raised as `kb/questions/2026-09-06-mcp-server-existence.md`.

---

## Task 3 — what was fixed

Unambiguous only. No API reference page was rewritten.

1. **`content/en/developers/_index.md`** — removed the 11 cards promising pages that do not
   exist: `applet-sdk`, `applet-examples`, `applet-deployment`, `architecture/data-models`,
   `architecture/security`, `architecture/scalability`, `scheduling`, `platform-extensions`,
   `multi-tenant`, `infrastructure`, `enterprise-auth`. Removing the last four emptied the
   "Platform Resources" block, so it was repointed at two pages that do exist
   (`/developers/platform-library/`, `/developers/architecture/overview/`).
   Also normalised 20 `/developers/./x/` dot-segment links left by the earlier relative-link
   sweep.
2. **`getting-started.md`** — removed the `./examples` and `./migration` cards.
3. **`authentication.md`** — removed the `./examples` link; made the other three absolute.
4. **`api-reference/_index.md`** — removed the "POS APIs" block (3 links to a `pos` page that
   has never existed); normalised `../` and `./` segments to absolute paths.
5. **`architecture/_index.md`** — removed 4 links to pages that do not exist
   (`/developers/integrations/`, `/guides/deployment/`, `/guides/monitoring/`,
   `/guides/security/`), repointed at `/developers/api-reference/integrations/` and
   `/developers/platform-library/`.
6. **Section-wide link sweep** — every remaining relative link in `content/en/developers/`
   converted to absolute (`tutorials.md`, `api-reference/_index.md`,
   `einvoice-api-reference/_index.md`, `ucc/_index.md`, and all 4 `platform-library/` pages).

**Verification: 0 broken links and 0 relative links remain anywhere under
`content/en/developers/`.** `tests/content-lint.sh` passes (8/8).

### Not fixed — deliberately, needs a decision

The **"Developer Tools & Resources"** card block in `_index.md:277-286` offers four links to
`developers.bigledger.com/console`, `/explorer`, `/postman` and
`api.bigledger.com/v1/openapi.yaml`. All four hosts are NXDOMAIN. By the same rule that
removed the eleven internal cards these should go, but removing them empties the section, and
that is a page rewrite rather than a link fix. Same for the Support & Community block
(`status.bigledger.com`, `community.bigledger.com` — both NXDOMAIN;
`github.com/bigledger` is real).

---

## `content/en/api-reference/` and `content/en/developer-docs/` — what they are

Not near-duplicates of `/developers/`. They are **surviving blockchain-era stubs**, and they
are live on the site right now.

`content/en/api-reference/_index.md` (22 lines, `weight: 30`) lists as BigLedger's APIs:

> Transaction API · Account API · **Wallet API** · **Smart Contract API** · Analytics API · Webhook API

`content/en/developer-docs/_index.md` (23 lines, `weight: 20`) lists as its topics:

> SDK Installation · API Integration · **Smart Contract Development** · Security Considerations · Best Practices · Code Examples

`content/en/developer-docs/installation.md` (69 lines) instructs `npm install @bigledger/sdk`
and `pip install bigledger-sdk` — both non-existent.

CLAUDE.md records that "blockchain platform" was removed from the site description on
2026-09-05. **The wallet/smart-contract vocabulary was missed**, and
`tests/content-lint.sh` does not catch it because its check greps only for the literal word
"blockchain". Both sections also render as top-level nav entries (weights 20 and 30) beside
"Developers", so a reader meets three competing developer sections.

There is one translation: `content/zh/api-reference/_index.md` (`content/zh/developer-docs/`
does not exist, so `installation.md` is already an orphan for the language switcher).

**Recommendation (not executed — structural, needs a spec):** delete both directories and
their `zh/` twin, with redirects to `/developers/api-reference/` and `/developers/`. Nothing
in them is worth merging. Until that ships, the lint check should be widened from
"blockchain" to also catch "smart contract" and "wallet" so this cannot regress.

---

## Unverified

- Whether an API gateway in front of `api.akaun.com` rewrites some public prefix onto
  `/core2/…`. Nothing in the Java repo sets a servlet context path, and the real Kotlin SDK
  calls `/core2/` directly, so this is unlikely — but the deployment config is outside these
  repos. If such a gateway existed it would still not produce `/api/v1/customers`, since no
  `customers` resource exists at any depth.
- Whether `developers@bigledger.com` is a monitored mailbox.
- Whether the documented rate limit ("1,000 requests/hour per API key with burst support",
  `_index.md`) reflects any real limiter. No rate-limiting code was found, but it could live
  at the edge (CloudFront/WAF).

Filed: `kb/questions/2026-09-06-mcp-server-existence.md`,
`kb/questions/2026-09-06-public-api-base-url-and-gateway.md`.

---

## Recommendation

**Cut it back to what can be verified. Do not repair the eight generic pages in place.**

Repairing them means replacing every path, every base URL, every request and response body,
every error code and every code sample — with content that would have to be re-derived from
the controllers anyway. That is not editing; that is writing the page from scratch with the
old text as a distraction. And leaving them up while that happens keeps costing developer
hours: `purchasing.md` already shows the failure mode, where a correct appendix sits under 28
fabricated endpoints with nothing to tell them apart.

Proposed sequence:

1. **Unpublish the eight generic REST pages** (`sales`, `inventory`, `accounting`, `reports`,
   `batch`, `integrations`, `einvoice`, `errors`) plus `sdks.md`, `tutorials.md`,
   `applet-development.md` and `architecture/overview.md`. Draft-flag them (`draft: true`) or
   move them to `planning/drafts/` — they are a useful inventory of *what a reader wants
   documented*, which is exactly the outline for the rewrite. Replace
   `api-reference/_index.md` with a short honest page: the real base URL, the
   `/core2/{tnt|platform}/{dm|ms}/…` shape, the `*-ep` endpoint-kind convention, the real
   auth headers, and links to the three surfaces that are verified.
2. **Keep and promote what is real**: `einvoice-api-reference/` (95%), `platform-library/`,
   and the approvals content in `automation-workflows.md`.
3. **One cheap high-value unit: fix the UCC prefix.** `/core2/alg/cc/` →
   `/core2/tnt/dm/alg/cc/` across 35 files takes 257 endpoints from wrong to verified. Handle
   the ~40 `/core2/{tenantId}/dm/alg/cc/` paths in the same pass.
4. **Rewrite `webhooks.md` from `WebhookService.java` and `WebhookTopics.java`.** The
   mechanism is real, small, and fully readable from source — three controllers, 53 topics,
   one auth header, no signature, no retry. This is the single highest-value new page in the
   section and it can be written accurately today.
5. **Rewrite `authentication.md`** against `AuthenticationInterceptor.java`,
   `WebMvcConfig.java` and `CorsInterceptor.java`. Also small and fully knowable.
6. **`sdks.md` → the four SDKs that exist** (`akn-kotlin-sdk`, `akn-kmp-sdk`,
   `akn-kotlin-sdk-mobile-lib`, the Java `client-sdk`), with their real JitPack/GitHub
   Packages coordinates. **`applet-development.md` → `blg-akaun-ts-lib`**, verified against
   `blg-applet-akaun-platform-example-applet`.
7. **Settle the MCP line** before it appears anywhere else.
8. **Spec the removal** of `content/en/api-reference/` and `content/en/developer-docs/`, and
   widen the lint check to "smart contract" / "wallet".

An API reference that is 10% true is worse than a short one that is 100% true. The einvoice
folder proves this team can produce the second kind.
