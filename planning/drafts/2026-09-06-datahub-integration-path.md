---
date: 2026-09-06
topic: The external-integration path under content/en/developers/
closes: Q-0014
status: notes + evidence for the pages shipped 2026-09-06
---

# The "data-hub" integration path — what is actually there

Working notes and citations for the rewrite of the external-integration half of
`content/en/developers/`. Everything published is traceable to a line here. Repo root for all
Java citations: `/home/marketing/repos/refs/blg-akaun-platform-java` at `1ff620ef` (2026-09-05).

---

## Q1. What is the "data-hub" called in the product?

**It has no product name.** Nothing in the platform, the applet registry, or the API is called a
data hub, datahub, or data platform. What the product owner means by "data-hub" is the
**`etl-ep` access endpoint** — the server-to-server half of the core2 REST surface.

Evidence:

- The access endpoint is spelled `etl-ep` in the URL and is served by the
  `EndpointMethod.AuthenticatedTenantEndpointByAccessKey` /
  `AuthenticatedPlatformEndpointByAccessKey` handler interfaces —
  `akaun-api/src/main/java/app/api/core2/common/EndpointMethod.java:292` and `:330`.
- **950** controller methods use `AuthenticatedTenantEndpointByAccessKey` and **24** use
  `AuthenticatedPlatformEndpointByAccessKey` across **156** controller files
  (`grep -rho 'Authenticated\(Tenant\|Platform\)EndpointByAccessKey' akaun-api/src/main/java | sort | uniq -c`).
  Resolving the class-level `@RequestMapping` constants against `Core2Config.java` yields
  **1,049 unique verb+path pairs over 287 distinct resources**; the count is higher than 974
  because several controllers are mounted at two base paths (a legacy alias plus the modern
  `core2/tnt/dm/...` one). The brief's figure of 952 is the same surface counted differently.
  Script: `scratchpad/routes2.py`; output `scratchpad/etl-routes.txt`.
- Three ACTIVE registry rows sit in this space and **none of them is the surface**:
  `ETL_VIRTUAL_APPLET` "ETL Virtual Applet", `virtual_etl_applet` "Virtual ETL Applet",
  `dataFixApplet` "Data Fix" (`SELECT code,name,status FROM bl_applet_hdr ...` on akaun_master).
  `blg-applet-wavelet-virtual-etl-applet` is a **fork of the blanket-purchase-order applet with
  its only feature route commented out** — `micro-fe/projects/wavelet-erp/applets/virtual-etl-applet/src/app/app.routing.ts:26-31`
  and `src/app/models/menu-items.ts:8-20`. It renders Settings, Permissions and Personalization
  and nothing else. There is no ETL screen in the product.

**Conclusion published:** name the thing by what it is — the `etl-ep` server-to-server endpoints —
and do not invent a product name for it.

---

## Q2. How does an external system authenticate?

Fully established. Three credential shapes, one of which is the integration credential.

### The credential: a 25-character access key, self-issued

`javasdk/src/main/java/com/bigledger/core2/domain/platform/identity/IdentityAccessKeyService.java:43-45`

```java
final String keyId     = RandomStringUtils.randomAlphanumeric(10).toUpperCase();
final String keySecret = RandomStringUtils.randomAlphanumeric(25);
```

- `keyId` → `app_login_principal.principal_id` (10 chars, upper-case) → the `AccessId` header.
- `keySecret` → Argon2-hashed into `app_login_principal.credential` → the `AccessKey` header.
  Returned **once**, in `KeyAddResponse(keyId, keySecret)` (`IdentityAccessKeyService.java:36`).
- `principal_type = ACCESS_KEY`, `status = KEY_ACTIVE`, `principal_value` = the caller's `label`.
- `valid_date_end` defaults to **9999-12-31 UTC** when the request omits it
  (`IdentityAccessKeyService.java:51`) — i.e. it never expires unless you ask for an expiry.
- The key is minted **for the calling user's own `subject_guid`** (`:47`), so it carries exactly
  that user's tenant permissions. There is no separate scope or permission model for keys.

### Issuing endpoints

`akaun-api/src/main/java/app/api/core2/controller/platform/dm/identity/IdentityAccessKeyController.java:54`
— class mapping `Core2Config.PLATFORM_DOMAIN_URL_PREFIX + "identity/access-keys"` →
`/core2/platform/dm/identity/access-keys`.

| Method | Path | Line | Gate |
|---|---|---|---|
| POST | `/core2/platform/dm/identity/access-keys/login-ep` | 133 | **none beyond a valid token** |
| GET | `/core2/platform/dm/identity/access-keys/login-ep` | 181 | none beyond a valid token |
| DELETE | `/core2/platform/dm/identity/access-keys/login-ep/{guid}` | 236 | must own the key (`:262-263`) |
| POST/GET/DELETE | same without `/login-ep` | 118/160/216 | `MST_API_DM_IDENTITY_ACCESS_KEY_*` |

The `login-ep` variants are the self-service path: `addKeyLoginEp` calls `addKeyLoginFn` with no
permission check at all (`:133-141`). The path is in `escape_urls` — "No Tenant DataSource, No
Permissions" — at `akaun-api/src/main/java/app/api/config/WebMvcConfig.java:160`, so no
`tenantCode` header is required for key management.

### Getting the token that lets you mint a key

`POST /core2/platform/dm/identity/login` —
`akaun-api/.../platform/dm/identity/IdentityAuthenticationController.java:66,70`.
Body is `LoginRequest` (`javasdk/.../core2/dto/identity/LoginRequest.java` via client-sdk:
`password`, `email?`, `mobileNumber?`, `login_key?`). Response is `LoginResponse`
(`javasdk/.../core2/dto/identity/LoginResponse.java:16-21`): `authToken`, `subjectGuid`, `email`,
`mobileNumber`, `data` (entity/login-subject links), `appletTenantTokenList`.

JWT lifetime: **30 days**, `JwtGenerator.generateJwt` default
(`javasdk/.../core2/auth/JwtGenerator.java:39-40`, `Duration.ofDays(30)`), RS256.

### How the server reads a credential

`javasdk/.../core2/auth/AuthenticationInterceptor.java:104-116` collects a token from, in order:
the `Authorization` header (stripping `Bearer `), a `jwtToken` cookie, a `jwtToken` query
parameter. Then `TenantAuthorizationInterceptor.parseAuth`
(`javasdk/.../core2/auth/TenantAuthorizationInterceptor.java:63-80`):

- token present and **length != 25** → `validators.get(0)` = `JwtValidator` (RS256, checks `exp`)
- token present and **length == 25** → `validators.get(1)` = `AccessKeyDatabaseValidator`
- **no token at all** → falls through to `AccessIdKeyInterceptor.handleAccessIdKey`, which reads
  the `AccessId` + `AccessKey` header pair.

Validators are wired at `akaun-api/src/main/java/app/api/config/WebMvcConfig.java:220-223`.

`AccessIdKeyInterceptor` (`javasdk/.../core2/auth/AccessIdKeyInterceptor.java:46-74`) accepts the
id under `AccessId`, `AccessID`, `accessId`, `accessID`, `access-id` and the secret under
`AccessKey`, `accessKey`, `access-key`. It looks the row up by `principal_id`, **checks
`valid_date_end`** (`:35-38`), then Argon2-matches.

### Tenant selection

`tenantCode` header, read by `TenantInterceptor.getTenantCodeFromRequest`
(`akaun-api/src/main/java/app/api/core1/common/TenantInterceptor.java`, called from
`EndpointMethod.java:158`). Missing → `CLIENT_TENANT_CODE_IS_EMPTY`, HTTP 400
(`EndpointMethod.java:35`). Unknown → `CLIENT_TENANT_CODE_DOES_NOT_EXIST`, HTTP 404
(`EndpointMethod.java:128-134`).

### Live verification, 2026-09-06

```
GET https://api.akaun.com/core2/tnt/dm/erp/gen-doc/etl-ep/server-doc-types
  -H "tenantCode: probe-does-not-exist"
→ 400 {"code":"AUTH_TOKEN_OR_ACCESS_ID_WAS_NOT_PROVIDED","data":null,"message":""}

  + -H "AccessId: AAAAAAAAAA" -H "AccessKey: <25 chars>"
→ 403 {"code":"AUTH_TOKEN_OR_INVALID_ACCESS_ID","data":null,"message":""}

  + -H "Authorization: Bearer not-a-jwt"
→ 403 {"code":"CLIENT_AUTH_INVALID_TOKEN","data":null,"message":""}
```

The `AUTH_TOKEN_OR_` prefix is built at `TenantAuthorizationInterceptor.java:76`. The observed
behaviour matches the traced code exactly, including that auth is checked before the tenant code.

### What we publish and what we deliberately do not

We publish **only** the `AccessId` + `AccessKey` header pair. We do not publish the
"25-character bearer" alternative, because `AccessKeyDatabaseValidator.getFromDb`
(`javasdk/.../core2/auth/AccessKeyDatabaseValidator.java:42-46`) loads **every** credential row
in the master database and Argon2-verifies the candidate against each one:

```sql
SELECT * FROM app_login_principal WHERE credential is not null AND credential != '' AND status != 'DELETED'
```
(`javasdk/.../dal/uow/identity/AppLoginPrincipalUow.java:477-480`)

A single measured request against production with an unknown 25-character bearer took
**82.8 seconds** to return 403, versus well under a second for every other rejection. That path
also **skips the `valid_date_end` check** that the header pair performs. Both are filed as
product defects; neither belongs in a public page.

---

## Q3. Push, pull, or both? Is there an event path out?

**Both, over the same `etl-ep` endpoints.** Each resource exposes the same six-method CRUD shape,
verified on `PricingSchemeLinkController.java:118,163,210,255,292,333`:

```
POST   .../etl-ep            create
PUT    .../etl-ep            update
DELETE .../etl-ep/{guid}     delete
GET    .../etl-ep            list all
GET    .../etl-ep/{guid}     read one
GET    .../etl-ep/query      filtered, paginated
```

The `etl-ep` method and the `backoffice-ep` method call the **same handler** with the same
permission checks — compare `createPricingSchemeLinkBackOffice` (`:69`) and
`createPricingSchemeLinkEtl` (`:118`), both delegating to `createPricingSchemeLink` (`:129`).
Only the authentication differs. This is why "read a record back, then post the same shape" is
correct advice: the request and response body are the same container type.

Documents go through one generic controller,
`akaun-api/.../erp/genericDocument/GenericDocumentController.java`, keyed by a URL slug:
`POST /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep` (`:2241`), `/multi` (`:2273`), and a discovery
endpoint `GET /core2/tnt/dm/erp/gen-doc/etl-ep/server-doc-types` (`:2448`). **97 slugs** are
registered in `GenericDocumentTypeHandler.handlers`
(`javasdk/.../domain/tenant/GenericDocumentTypeHandler.java:850+`), mapping kebab-plural slugs
(`internal-sales-invoices`) to `serverDocType` constants (`INTERNAL_SALES_INVOICE`) drawn from the
198-entry `handlersByDoc` map (`:64+`).

Note for a future page: `server-doc-types` returns the **UPPER_SNAKE** `serverDocType` values
(`:2452-2455`), but the URL wants the **kebab-plural slug**. The response does not give you the
value you need to build the next URL.

### The event path out — webhooks

Real, and much weaker than our old page claimed. Delivery engine:
`javasdk/src/main/java/com/bigledger/core2/domain/tenant/WebhookService.java` (322 lines, the whole
thing).

- Always `HTTP POST` to the subscriber's URL — `:164`.
- Dispatched on a **fixed 4-thread pool** shared by the whole JVM — `:56`.
- `RequestConfig.custom().setConnectTimeout(60 * 1000)` — `:57`. **Connect timeout only**;
  socket timeout is never set, so a receiver that accepts the connection and stalls holds a
  delivery thread indefinitely.
- **No HMAC, no signature, no secret.** `grep -cniE "hmac|signature|retry|backoff" WebhookService.java`
  → `0`.
- **No retry, no dead-letter, no replay.** A `500` from the receiver is not an exception: the
  status is recorded and the event is dropped (`:71-96`). A timeout is caught by a bare
  `catch (Exception e)` and also dropped.
- Authentication to the receiver is **one static header name/value pair** per subscription,
  `bl_webhook_subscription_hdr.auth_header_name` / `auth_header_value` — `:163-167`. Both are
  plaintext `varchar(255)`, both are filterable via the public `/query` criteria
  (`WebhookSubscriptionQueryCriteria.java:16-17`) and both are returned on every GET.
- The payload is the **raw internal container object**, serialised as-is. No envelope, no topic
  name, no event id, no timestamp. Many delete topics send the literal string `true`
  (e.g. `CustomerService.java:41`, `PaymentConfigurationService.java:36`).
- Every attempt is logged to `bl_webhook_activity_event` with `sent_body`, `received_body`,
  `received_http_code`, and — on transport failure — the Java stack trace in `property_json`
  (`:76-94`). `status` is `ACTIVE` on **both** the success and the failure branch, so the row
  carries no success flag; the only failure signal is a null `received_http_code`.
- `notification_contact_json` declares success/client-error/server-error email and SMS
  (`bl_webhook_subscription_hdr.java:122-165`). It is read into the `Subscription` object and
  **never used**. No alert is ever sent.

Topics: `javasdk/.../common/api/constants/WebhookTopics.java` is an enum of **54** constants. It is
only a **seed list** — `WebhookService.populateTopicTable()` (`:174-202`) inserts the missing ones
into `bl_webhook_topic_hdr`, and dispatch is keyed on the free-text `topic_code` string
(`WebhookTopicHeaderUow.java:158-164`). `POST /core2/tnt/dm/webhook-topic` lets a tenant create any
topic code at all (`WebhookTopicController.java:53-72`).

The mismatch that matters: roughly 60 topic codes that BigLedger actually fires are **not** in the
enum, so `populate-default` never seeds them and they are undiscoverable from the product. And one
seeded topic can never fire: the enum constant is `BRANCH_DELTED` (`WebhookTopics.java:27`) while
the code fires the string `"BRANCH_DELETED"` (`BranchService.java:178`).

Controllers (all `EndpointMethod.AuthenticatedTenantEndpoint`, i.e. a signed-in user's token —
**no `etl-ep` variant, so an access key cannot manage subscriptions**):
`core2/tnt/dm/webhook-subscription` (`WebhookSubscriptionController.java:40`),
`core2/tnt/dm/webhook-topic` (`WebhookTopicController.java:39-40`),
`core2/tnt/dm/webhook-activity` (read-only; `WebhookActivityEventController.java:35-36`).

---

## Q4. Is any of it self-service?

**Credentials: yes.** `POST /core2/platform/dm/identity/access-keys/login-ep` with any valid user
token, no permission gate. That is a genuine self-service path and it is the headline of the new
Getting Started page.

**Everything else: no, or only partly.**

- **The tenant code and a user account** come from BigLedger or from the customer's own tenant
  administrator. There is no public sign-up that yields a tenant.
- **Permissions** are the tenant permissions of the user the key belongs to. Granting them is a
  tenant-admin job inside the product, not an API call the integrator can make.
- **Webhook subscriptions** need a `bl_webhook_topic_hdr` row to point at. The Web Hook applet's
  topic picker can only select existing rows — its "Create" button is behind `*ngIf="toggleMode"`
  whose toggle control is commented out, so topic creation is unreachable from that screen. For
  the ~60 fired-but-unseeded topic codes, someone has to `POST` the topic row with the exact
  string, which means reading the Java source. That is a BigLedger hand-off.
- **The Web Hook applet itself is not registered.** `SELECT ... FROM bl_applet_hdr` on
  akaun_master matches nothing for `web`, `hook`, or `webhook` in `code`, `name`, or
  `property_json` (209 ACTIVE rows). `blg-applet-wavelet-web-hook-applet` is built and maintained
  but has no registry row, so no tenant can open it. Same class of finding as P-0029.
- **The Java `client-sdk` is not publicly available.** It publishes to GitHub Packages at
  `maven.pkg.github.com/bigledger/blg-akaun-platform-java`
  (`client-sdk/build.gradle.kts:11-24`), and `gh repo view` reports that repository as
  **PRIVATE**. An external integrator cannot resolve the artifact.
- **`blg-akaun-ts-lib` is not an integration client.** `grep -rho "etl-ep" --include=*.ts` over the
  repo returns **0**. It targets `backoffice-ep` for applets running in the browser.

So the honest summary for the wiki: the credential is self-service, the tenant and the permissions
are not, and there is no published client library for this surface — you write HTTP yourself.

---

## Q5. What are the real limits?

From `akaun-api/src/main/resources/application.properties`:

| Setting | Value |
|---|---|
| `spring.servlet.multipart.max-file-size` | `2GB` |
| `spring.servlet.multipart.max-request-size` | `2GB` |
| `spring.mvc.async.request-timeout` | `7200000` ms = **2 hours** |
| `server.tomcat.max-threads` | `200` |
| `server.tomcat.accept-count` | `5000` |
| `server.tomcat.keep-alive-timeout` | `3601000` ms |
| `spring.task.execution.pool.core-size` | `20` |
| `spring.task.execution.pool.queue-capacity` | `5000` |
| `server.compression.enabled` | `true`, min 1024 bytes, includes `application/json` |

**There is no rate limiting.** `grep -rniE "ratelimit|rate-limit|bucket4j|throttl|resilience4j"`
over `--include=*.java --include=*.properties --include=*.xml --include=*.gradle` returns only
four comments about *third-party* services throttling us. No limiter, no quota, no 429 anywhere.

**Paging** is `BaseQueryCriteria` (`javasdk/.../dal/criteria/BaseQueryCriteria.java:15-22`):
`limit` defaults to **100**, `offset` to `0`, `order` to `ASC`, `calcTotalRecords` to `false`,
`querying_timezone` to `Asia/Kuala_Lumpur`. **No maximum limit is enforced anywhere in that class.**
`calcTotalRecords=true` costs a second `COUNT(*)` query (e.g.
`PricingSchemeLinkController.java:340`), so it is off by default.

**No documented batch cap.** `POST .../{docType}/etl-ep/multi` takes a bare
`List<GenericDocumentContainer>` (`GenericDocumentController.java:2273-2276`) with no size check.
Responses stream (`StreamingResponseBody` throughout), which is why the 2-hour async timeout
matters more than a row cap.

Webhook-side limits, for the receiver: 60 s connect timeout, no socket timeout, 4 delivery threads
JVM-wide, `url` capped at `varchar(255)`, `auth_header_name`/`auth_header_value` capped at
`varchar(255)` each.

---

## Response envelopes

Non-paged — `javasdk/.../core2/common/api/ApiResponse.java:39-41`:

```json
{ "code": "OK_RESPONSE", "data": ..., "message": "" }
```

Paged — `javasdk/.../core2/common/api/StreamingPagingResponse.java:30-65`, field order as written:

```json
{ "totalRecords": 0, "offset": 0, "limit": 100, "code": "OK_RESPONSE", "message": "", "data": [ ... ] }
```

`code` is a platform response code, not an HTTP status
(`javasdk/.../common/api/constants/ResponseCodeConstants.java`): `OK_RESPONSE`, `OK_NODATA`,
`CLIENT_AUTH_NO_TOKEN`, `CLIENT_AUTH_INVALID_TOKEN`, `CLIENT_AUTH_USER_NOT_AUTHORIZED`,
`CLIENT_TENANT_CODE_IS_EMPTY`, `CLIENT_TENANT_CODE_DOES_NOT_EXIST`,
`CLIENT_VALIDATION_GUID_DOES_NOT_EXIST`, `SERVER_GENERAL_UNKNOWN_ERROR`. The access-key failures
are `ACCESS_ID_WAS_NOT_PROVIDED`, `ACCESS_KEY_WAS_NOT_PROVIDED`, `INVALID_ACCESS_ID`,
`EXPIRED_ACCESS_ID`, `ACCESS_ID_TOKEN_NOT_MATCHED` (`AccessIdKeyInterceptor.java:37-74`), each
prefixed `AUTH_TOKEN_OR_` when reached through the fall-through in
`TenantAuthorizationInterceptor.java:76`.

---

## Production shape of access keys (anonymised aggregates, akaun_master, 2026-09-06)

| | |
|---|---|
| `app_login_principal` rows with `principal_type = 'ACCESS_KEY'` | 8,317 |
| distinct `subject_guid` holding at least one | 2,436 |
| `status = 'KEY_ACTIVE'` | 8,210 |
| unexpired (`valid_date_end > now()`) | **185** |
| of those, `valid_date_end` in year 9999 (the "never expires" default) | 152 |
| duplicate `principal_id` values | 0 |

Read this as: keys are minted freely, almost all of them have lapsed, and the ones still live are
overwhelmingly the never-expiring default. It supports advising an explicit `validDateEnd` and a
rotation habit, and it is the reason the expiry-skipping bearer path is dangerous rather than
theoretical.

`app_login_principal` columns (akaun_master `\d`): `guid, subject_guid, principal_type,
principal_id, principal_value, credential, valid_date_start, valid_date_end, status, revision,
vrsn, created_date, updated_date`.

---

## What was decided for the pages

1. **Do not invent a "Data Hub" brand.** Call it what the URL calls it.
2. **Publish only the header-pair credential.** The bearer-25 path is real but slow and skips
   expiry; documenting it would be publishing an attack.
3. **Publish the read path in full; be explicit about where the write path stops.** Reading is
   completely establishable. A minimal valid `GenericDocumentContainer` for a sales invoice is
   not — `GenericDocumentDataConsistencyObject` runs several hundred lines of fill-and-validate
   (`javasdk/.../validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java`)
   and we will not guess it. The page says so, and gives the read-then-mirror technique plus a
   named hand-off.
4. **Publish webhooks as they are, absences included.** No HMAC, no retry, no alerting, a fixed
   topic seed list, and a subscription screen a tenant cannot open. A reader who plans around
   those absences is better served than one who is told nothing.
5. **Never mention the legacy surface**, per ADR-0008 and `tests/content-lint.sh`.

## Pages shipped

| Path | URL | State |
|---|---|---|
| `content/en/developers/integration/_index.md` | `/developers/integration/` | new |
| `content/en/developers/integration/getting-started.md` | `/developers/integration/getting-started/` | new |
| `content/en/developers/integration/data-api.md` | `/developers/integration/data-api/` | new |
| `content/en/developers/authentication.md` | `/developers/authentication/` | rewritten, un-drafted |
| `content/en/developers/webhooks.md` | `/developers/webhooks/` | rewritten, un-drafted |
| `content/en/developers/_index.md` | `/developers/` | placeholder replaced |

---

## Late additions — evidence gathered after the first pass

### `api-etl.akaun.com` is a second, real ingress

Not in the brief, and load-bearing for the worked example. It resolves (`56.69.15.239`, versus
`56.69.230.99` for `api.akaun.com`) and serves the identical `/core2/` surface — the same probe
returns the same `AUTH_TOKEN_OR_ACCESS_ID_WAS_NOT_PROVIDED` / 400.

Every BigLedger ETL agent points at it. The selection logic lives in the agent repos rather than
the platform, keyed on an `API_ENV` variable with a counter-intuitive rule: `akaun.com` resolves
to the `api-etl.` prefix while `akaun.cloud` / `akaun.dev` resolve to `api.`. Four different
environment-variable names are used across the agents for the same knob.

The pages tell integrators to use `api-etl.akaun.com` for data and `api.akaun.com` for sign-in and
key management, which matches what the agents actually do. Confirming that is the intended split
is **Q-0021**.

### What real integrations look like (anonymised, from the agent repos)

Useful as calibration, and the reason the pages give pacing advice rather than a limit:

- **Two authentication generations.** An older set of agents sends `Authorization` + `tenantCode` +
  `appId`; the newer set sends `accessId` + `accessKey` + `tenantCode` with no `appId`. The
  migration is documented in a source comment (*"once all the processor clients migrated using
  Access Keys and Access Ids"*) and is incomplete. The pages document only the current generation.
- **Header casing varies** — `AccessId` in one agent, `accessId` in another. Both work; the
  interceptor accepts `AccessId`, `AccessID`, `accessId`, `accessID`, `access-id` and the three
  corresponding key spellings. The page says so and tells the reader to pick one.
- **Page sizes are folklore, not policy**: 5, 8, 50, 100, 150, 2,500, 50,000 and unbounded all
  appear across agents, with idle backoffs from 250 ms to 5 minutes. There is no shared constant
  and no platform maximum. Hence "low hundreds to low thousands, and pause between pages".
- **Almost no agent sets an HTTP timeout or retries.** Bare `RestTemplate` / `HttpClient`
  throughout; the only retry found anywhere is a single 401-triggered token refresh against a
  third-party gateway.

Customer-specific agents are cited by pseudonym only, per `kb/private/repo-pseudonyms.tsv`, and
none of their names, hosts or identifiers appear in this file or in any published page.

Two secrets are committed in plaintext in agent repos (an AWS access key pair, and an API
username/password plus SES SMTP credentials). Not a wiki matter and not filed in
`planning/product/` either, since it is an operational security issue rather than a product defect
— **raise directly with Vincent**.

### The stale platform fork

`refs/blg-custom-integration-platform-java` has the Gradle root project name
`blg-akaun-platform-java` and is a fork, not a separate product. Its configuration differs from the
current platform (10 MB multipart and a 30-minute async timeout, versus 2 GB and 2 hours), and it
has no server-side reader for the `AccessId`/`AccessKey` headers at all. **Nothing from that fork
was published.** Every fact on the pages comes from `refs/blg-akaun-platform-java` at `1ff620ef`.

### Disproved and unpublished

`modules/membership/integration/third-party-integration.md` and its section `_index.md` — a second
fabricated API, sitting under `modules/` rather than `developers/`, which is why the 6 September
audit did not reach it. Worklog entries:
`planning/worklog/2026-09-06-membership-third-party-integration.md` and
`planning/worklog/2026-09-06-membership-integration-index.md`. Recorded as F-0300.

Worth generalising: the audit swept `developers/`, but invented API documentation is not confined
to it. A grep for fabricated endpoint shapes across `modules/` and `applets/` would likely find
more.
