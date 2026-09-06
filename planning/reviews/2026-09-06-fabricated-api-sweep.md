---
title: "Fabricated-API sweep — every page outside developers/ that documents an endpoint"
date: 2026-09-06
status: complete
scope: all of content/ except content/en/developers/ (which was audited separately on the same day)
ground_truth: refs/blg-akaun-platform-java @ HEAD (pulled 2026-09-06, "Already up to date")
method: >
  Balanced-paren extraction of every Spring @RequestMapping / @GetMapping / @PostMapping /
  @PutMapping / @DeleteMapping / @PatchMapping in the repo, with class-level mappings resolved and
  every String constant in the repo (2 passes, ~4,900 constants) substituted into the concatenated
  path expressions. 18,630 resolved mappings over 12,050 unique paths, 11,999 of them under
  /core2/. Wiki side: every METHOD+path, every /core2/... token and every /api/v<n>/ or /v<n>/
  token extracted per page, source-file paths (.java, .ts, /api-services/, /validator/) excluded,
  and each remaining path matched against the route table with {placeholder} segments wildcarded.
relates_to: planning/reviews/2026-09-06-developers-section-audit.md, planning/decisions/0008-verify-or-unpublish.md
---

## Headline

**The cluster the brief expected to be fabricated is real, and the fabrication was somewhere
else.**

- **121 pages** outside `content/en/developers/` carry endpoint-shaped content.
- **119 of them are innocent** (98%). Only two of the 121 needed action. The overwhelming majority of hits are Java and TypeScript
  *source file paths* in the `sources:` front matter of lane-rebuilt applet pages —
  `com/core2/domain/erp/stock/StockBalanceHelper.java`, not an endpoint. That is the expected
  result and it is the finding: the applet programme's citations are clean.
- **The `modules/membership/api-reference/` cluster — the twelve files literally named
  `POST Create Member.md` — is genuine.** All five distinct endpoints they document are exact
  matches in the backend route table. They appear to have been captured from real Postman traffic,
  which is why they are right, and also why they leaked a signed admin token (below).
- **Five pages were wrong**, in three separate ways (two inside the 121, three found only by the
  wider signature sweep): one page duplicated across both module trees
  with an invented schema and four invented endpoints; ten module stubs pointing at API references
  that were unpublished the same morning, two of which invented endpoint families of their own; and
  a Chinese translation of a page whose English original had already been unpublished.
- **A real RS256-signed platform JWT with `sysAdminRank: ADMIN` was live on the wiki for nine
  months**, and was still a valid token for the first eighteen days. Not an API-fabrication
  problem, but the sweep found it and it is the most serious single item here.

---

## Task 1 — the measurement

### 1a. The 121 candidates, by class

| Class | Pages | Documented endpoints | Verified real | Not found | Verdict |
|---|---:|---:|---:|---:|---|
| `applets/**` — lane-rebuilt pages citing `com/…/core2/…` **source files** in `sources:` | 101 | 0 | — | — | **innocent** |
| `applets/**` — pages quoting a real endpoint in prose (`finance/deposit-applet.md`, `finance/fixed-asset-applet.md`) | 2 | 4 | 4 | 0 | **innocent** |
| `modules*/membership/api-reference/` — the twelve `VERB Name.md` files | 12 | 5 distinct | **5** | 0 | **innocent (real API)** |
| `modules-v2/e-invoice/concepts/` | 3 | 0 | — | — | **innocent** |
| `modules/pos.md` | 1 | 0 (a prose mention of `/core2/`) | — | — | **innocent** |
| `modules*/membership/core-concepts/customer-membership-relationship.md` | 2 | 4 | **0** | 4 | **tier 1 — unpublished** |
| **total** | **121** | | | | **119 innocent / 2 acted on** |

(The third page acted on — `content/zh/applets/webhook-applet.md` — and the ten `modules-v2`
API-reference stubs were found by the wider signature sweep in 1c, not by endpoint extraction: they
carry no endpoint paths at all, which is exactly why the first sweep missed them.)

### 1b. The membership API pages — verified endpoint by endpoint

Every path is an **exact** string match in the resolved route table, and the pages get the host,
the headers and the response envelope right too (`Authorization`, `tenantCode` — both in the real
CORS allow-list at `akaun-api/src/main/java/app/api/config/CorsInterceptor.java:40`;
`"code": "OK_RESPONSE"`; real table names as JSON keys).

| Page (both trees) | Documented | In route table |
|---|---|---|
| `POST Create Member.md` | `POST https://api.akaun.com/core2/tnt/dm/membership-cards` | ✅ `/core2/tnt/dm/membership-cards` |
| `PUT Update Member.md` | `PUT …/core2/tnt/dm/membership-cards` | ✅ same path |
| `GET Members by Criteria.md` | `GET …/core2/tnt/dm/membership-cards/query` | ✅ `/core2/tnt/dm/membership-cards/query` |
| `GET Membership Points Current Balance.md` | `GET …/core2/tnt/dm/crm/membership-points-txn/current-balance/query` | ✅ exact |
| `GET Membership Points Transactions by Criteria.md` | `GET …/core2/tnt/dm/crm/membership-points-txn/backoffice-ep/lines/query` | ✅ exact |
| `POST Create Member Point Transaction.md` | `POST …/core2/tnt/dm/crm/membership-points-txn/txn-line/backoffice-ep` | ✅ exact |

`api.akaun.com` resolves (56.69.230.99). The backend carries 340 membership-related paths in
total, so these six pages document about 1.5% of the membership surface — thin, but true.

### 1c. The wider signature sweep — what else was looked for and found nothing

| Signature | Hits outside `developers/` | Result |
|---|---|---|
| `/api/v<n>/` or bare `/v<n>/` path | 1 | `applets/ecommerce/cp-commerce/push-notification-configuration.md:125` — `https://www.googleapis.com/oauth2/v1/certs`, Google's own URL. **Innocent** |
| `curl` invocation | 0 | — |
| `Authorization: Bearer` | 0 | — |
| HMAC / request signing | 2 | `modules/membership/integration/third-party-integration.md` (already `draft: true`) and `applets/ecommerce/shopping-cart-applet.md` — the latter describes a **real** per-line HMAC token driven by `bl_cms_website_hdr.property_json.line_integrity_config`. **Innocent** |
| `X-Company-Id` / `blg_live_sk_` / `X-BigLedger-Signature` / `X-API-Key` | 1 | `content/zh/applets/webhook-applet.md:228` — see Task 2 |
| `api|sandbox-api|api-sandbox|auth|developers|app .bigledger.com` | 0 | the developers audit cleared them all |
| signed JWT (`eyJ….eyJ….sig`) | 2 files ×2 trees | see Task 4 |

---

## Task 2 — what came down, with evidence

Three pages. Under the five-page guard rail, so acted on rather than reported.

### (1) and (2) `customer-membership-relationship.md` — both trees — tier 1

`content/en/modules/membership/core-concepts/customer-membership-relationship.md` and
`content/en/modules-v2/membership/core-concepts/customer-membership-relationship.md`
(459 lines each, **byte-identical**, `cmp` clean).

The first 400 lines are orientation prose about one customer holding several memberships. That
claim is true — `bl_crm_membership_hdr.entity_hdr_guid` is an ordinary nullable column with no
unique constraint. Everything under `## Technical Implementation` is invented:

| Page says (file:line) | Reality |
|---|---|
| `:439` `GET /api/customers/{customer_id}/memberships` | No such path among 12,050. Real: `GET /core2/tnt/dm/membership-cards/query` |
| `:442` `POST /api/memberships/{membership_id}/earn-points` | No such path. Real: `POST /core2/tnt/dm/crm/membership-points-txn/txn-line/backoffice-ep` |
| `:443` `POST /api/memberships/{membership_id}/redeem-points` | No such path; earning and redeeming are the same endpoint with a sign |
| `:446` `POST /api/transactions` | No such path |
| `:404-437` `MEMBERSHIP` table with `membership_id`, `program_id`, `member_class_id`, `enrollment_date` | Real table `bl_crm_membership_hdr`: PK `guid`; no `membership_id`, no `program_id`, no `member_class_id`, no `enrollment_date`. `tenant-schemas/pcimage/tables/bl_crm/bl_crm_membership_hdr.sql` |
| `:404-437` `POINTS_BALANCE` table with `lifetime_earned`, `lifetime_redeemed` | Real table `bl_crm_membership_points_current_balance`: `guid, membership_hdr_guid, card_no, point_currency, point_balance` — no lifetime columns. Same directory |
| `:404-437` a `PROGRAM` table | No such table. The class table is `bl_crm_membership_class_hdr` |

Mechanism: `draft: true` in place — the URL should come back once the technical section is
rewritten from source. Worklog:
`planning/worklog/2026-09-06-fabricated-api-sweep-customer-membership-relationship.md`.
Inbound links: one, `modules/membership/core-concepts/_index.md:235`, removed in the same pass.

**The narrower option, for the record.** Excising only `## Technical Implementation` would keep
400 lines of usable concept prose live. ADR-0008 says a page that mixes tiers goes, so it went; if
you would rather keep the prose up with the fabricated appendix cut, say so and it is a two-minute
change with the worklog already written.

### (3) `content/zh/applets/webhook-applet.md` — tier 1

The Chinese twin of a page the applet programme drafted on the morning of 6 September. It stayed
live carrying the same invented claims: 自动重试 (`:37`), OAuth/JWT (`:48`), 请求签名 (`:49`),
IP 白名单 (`:50`), 200+ 事件类型 (`:82`), 99.9% 传递保证 (`:90`), 90 天保留 (`:92`). Every one is
contradicted by `javasdk/…/domain/tenant/WebhookService.java:16-52` (single POST, no retry) and
`javasdk/…/constants/WebhookTopics.java` (a fixed enum of 53 topics).

Mechanism: `draft: true`, addendum appended to
`planning/worklog/webhook-applet-2026-09-06-unpublish.md`, three inbound `zh/` links repaired.

**The general lesson matters more than the page.** It sits at `zh/applets/…` while the English
sits at `en/applets/integrations/…`, so a same-relative-path twin check finds nothing. Every
unpublish from now on should check `zh/`, `ms/` and `ar/` **by basename**, not by path.

## Task 2b — what was repaired rather than unpublished

**Eighteen links across seventeen files pointed at pages the developers audit unpublished the same
morning.** ADR-0008 guard rail 3 requires inbound links to be repaired in the same commit as an
unpublish; that did not happen, and the result was eighteen live 404s.

| File:line | Was | Now |
|---|---|---|
| 10 × `modules-v2/*/api-reference/_index.md:10` | `/developers/api-reference/{sales,inventory,purchasing,integrations,einvoice}/` | `/developers/integration/`, except e-invoice → `/developers/api-reference/einvoice-api-reference/` and membership → its own six verified pages |
| `modules/sales-crm/_index.md:357` | `…/api-reference/sales/` | `/developers/integration/` |
| `modules/inventory/_index.md:300` | `…/api-reference/inventory/` | `/developers/integration/` |
| `modules/purchasing/_index.md:350` | `…/api-reference/purchasing/` | `/developers/integration/` |
| `modules/financial-accounting/_index.md:271` | `…/api-reference/accounting/` | `/developers/integration/` |
| `e-invoice-peppol.md:296` | `…/api-reference/einvoice/` | `…/api-reference/einvoice-api-reference/` |
| `modules/e-invoice/_index.md:305` | `…/api-reference/einvoice/` | `…/api-reference/einvoice-api-reference/` |
| `tutorials/_index.md:14` | `/developers/tutorials/` | `/developers/integration/getting-started/` |
| `developer-docs/_index.md:13,14` | `/developers/getting-started/`, `/developers/applet-development/` | `/developers/integration/getting-started/`, `/developers/applets/` |

Two of the ten stubs also invented endpoint families of their own, and those sentences were
removed rather than repointed:

- `modules-v2/manufacturing/api-reference/_index.md:8` — *"shop floor IoT machine logging
  endpoints"*. The route table contains **zero** paths matching `iot`.
- `modules-v2/hr-payroll/api-reference/_index.md:8` — *"biometric attendance terminal integration
  endpoints"*. **Zero** paths matching `biometric`. (Attendance itself is real —
  `/core2/tnt/dm/hr/time-attendance-clock-in-out-event/…`, 13 paths — but nothing biometric.)

The other eight named capabilities that do exist (OCR: 136 paths; WhatsApp: 5; PEPPOL: 31), so
only the two above were tier 1; the rest were repointed.

**Verification: no published page in any language now links to a `draft: true` page.**

---

## Task 3 — the `modules/` ↔ `modules-v2/` duplication

**Answer for the membership API pages: byte-identical.** All six `VERB Name.md` files pass `cmp`
clean between the two trees. Only `_index.md` differed — `modules/` listed the three things the
folder covers, `modules-v2/` pointed at a `/developers/` page that no longer exists.

Wider shape of the duplication, measured:

- `modules/` holds 92 markdown files, `modules-v2/` 122.
- Under `membership/`, seventeen files differ and six are identical; `modules/` alone has
  `getting-started/` and `integration/`, `modules-v2/` alone has `reports/`.
- At the top level the two trees have diverged into different taxonomies —
  `claim-module` vs `claims`, `digital-crm` vs `crm-digital`, `financial-accounting.md` vs
  `financial-accounting/`, `hr.md` vs `hr-payroll/` — and `modules-v2/` has grown a uniform
  seven-folder skeleton (`api-reference`, `best-practices`, `configuration`, `core-concepts`,
  `related-applets`, `reports`, `use-cases`) that `modules/` does not have.
- Both are built. `modules-v2/_index.md` carries `bookHidden: true` and `weight: 999`, but its
  children are reachable and the main nav points into them.

**Recommendation — not executed, it needs a spec.** `modules-v2/` should win on structure and
`modules/` on content: `modules-v2/` has the skeleton but nine of its ten `api-reference/` folders
were empty stubs, while `modules/membership/` holds the only real API pages and the honest,
already-remediated `integration/` folder. The merge is a page-by-page decision, not a `mv`. It
should follow ADR-0001's restructure and be specced. Raised as **Q-0038**; the reader-facing cost
of leaving it is that a search for "create member" returns two identical results at two URLs.

---

## Task 4 — the leaked credential

Not what the sweep was looking for, and the most serious thing it found.

`modules/membership/api-reference/GET Membership Points Current Balance.md` and
`POST Create Member Point Transaction.md` — and their `modules-v2/` copies — pasted a **real
RS256-signed platform JWT** into the sample `--header 'Authorization: …'`:

```
alg RS256
subjectGuid  a982e148-3026-45db-b0e5-075003d5d3a4
sysAdminGuid 1dd4556c-4664-41eb-9ffb-e381be47e975
sysAdminRank ADMIN
exp          1765701274  →  2025-12-14T08:34:34Z
```

Live from commit `97a325cc` (2025-11-26), copied into `modules-v2/` by `feb58e52` (2026-06-19).
It was a **valid, signed, ADMIN-ranked token for the first eighteen days it was published**, and
has been an expired one for nine months since.

Scrubbed to `<JWT Token>` in all four files, and a lint added so it cannot recur. **It is still in
git history and this repository is public** — filed as **P-0062** for rotation and a
history decision.

The same pages still carry real-looking GUIDs, `tenantCode: testing`, and four `card_no` values —
`930425035604`, `930425035605`, `930425035569`, `8888880100655908`. The first three are in
Malaysian NRIC format (`930425` = 25 Apr 1993; `03` = a birth-state code), which is exactly what
CLAUDE.md's privacy rules forbid publishing. Raised as **Q-0037** and **F-0325**; a full
anonymisation pass over the twelve files is a small separate unit.

---

## Task 5 — the lints

Four checks added to `tests/content-lint.sh`, each verified to fire on a probe page and to be
clean on the current tree. The first three exclude `draft: true` pages, matching the existing
core1 check; the fourth does not, because a credential in the repo is exposed whether Hugo builds
the page or not.

| Check | Catches | Would it have caught the two known cases? |
|---|---|---|
| **impossible endpoint shape** — a verb followed by `/api/…` or `/v<n>/…` | `POST /api/memberships/{id}/earn-points` | **Yes** — this is exactly the `customer-membership-relationship.md` signature, and the signature of `third-party-integration.md` before it |
| **non-existent API hostname** — `(api\|sandbox-api\|api-sandbox\|auth\|developers\|app).bigledger.com` | any page telling a developer to call a host that has never resolved; the API host is `api.akaun.com` | **Yes** for the `/developers/` set; the real host `api.akaun.com` is explicitly not matched |
| **invented auth header** — `X-Company-Id`, `blg_live_sk_`, `blg_test_sk_`, `X-BigLedger-Signature` | pages inventing a credential model. Real headers: `Authorization`, `tenantCode`/`tenant-code`, `appId`, `accessId`, `accessKey`, `X-BigLedger-Instance-Code` (`CorsInterceptor.java:40`). There is no request signing anywhere in the platform | **Yes** — this is the HMAC half of `third-party-integration.md` |
| **signed JWT in content** | a real token pasted into a sample | **Yes** — nine months late |

`X-API-Key` was deliberately **not** added: it appears legitimately in the backend as an
*outbound* header to a third-party payment gateway
(`javasdk/…/paymentGateway/gampay/service/GampayService.java:86`), so a page documenting an
outbound integration could use it correctly.

**The check that would be best and is not here:** validating every `/core2/…` path on the wiki
against the live route table. It is the only way to catch a *plausible but wrong* `/core2/` path,
which is the next failure mode now that the obvious ones are linted. It needs
`refs/blg-akaun-platform-java` present, which CI does not have. Options: commit a generated
`tests/route-table.txt` (12,050 lines, ~500 KB) and refresh it on a schedule, or run the check
only in the local `tests/run-all.sh`. Worth a decision.

---

## Findings filed

| id | stream | what |
|---|---|---|
| F-0321 … F-0328 | `planning/feedback/inbox.md` | the eight wiki-side items; F-0321 to F-0324 already actioned |
| P-0062 | `planning/product/INDEX.md` (security) | the published admin JWT — rotate, decide on history |
| Q-0037 | `planning/questions/INDEX.md` (high) | is the membership sample data real tenant data? |
| Q-0038 | `planning/questions/INDEX.md` (medium) | `modules/` or `modules-v2/` — which survives? |
| Q-0039 | `planning/questions/INDEX.md` (medium) | six `*.bigledger.com` subdomains do not resolve; 56 pages link to them |

---

## Is fabricated API content now cleared from the site?

**For the shapes we can name, yes. For the shape we cannot yet check mechanically, no — and one
more sweep is needed, of a different kind.**

What is genuinely closed:

- The `/api/v1/`-style invented REST surface is gone from published pages in every language, and
  three lints now stop it returning. That was the whole of the `developers/` failure and the whole
  of the `third-party-integration.md` failure, and it was the only shape found outside
  `developers/` — twice, in a page duplicated across both module trees.
- Non-resolving API hostnames: zero in published pages, linted.
- Invented credential models: zero, linted.
- The 104 lane-rebuilt applet pages are clean, and their `sources:` citations point at real files.
  That is the single most reassuring number here.

What is not closed, in the order I would take it:

1. **`/core2/` paths that are plausible but wrong.** The UCC set is the known instance — 330
   endpoints, all written `/core2/alg/cc/…` where the real prefix is `/core2/tnt/dm/alg/cc/…`, so
   257 of them verify once one string is corrected. No lint can catch that class without the route
   table in CI. This is the largest remaining body of wrong-but-believable endpoint text on the
   site and it already has a unit's worth of work scoped in the developers audit.
2. **Translations.** `zh/applets/webhook-applet.md` was found because it tripped a header pattern,
   not because anything was looking. `content/zh/` has 30-odd applet pages at paths that do not
   mirror `content/en/`, several of them translations of pages the lanes have since rewritten or
   unpublished. F-0307 already records one (`t2t-admin-applet`). **A translation-orphan sweep is
   the next unit I would run**, and it is cheap: compare by basename, flag every `zh|ms|ar` page
   whose English original is drafted or substantially changed.
3. **`guides/` and `user-guide/`.** 110 pages, none with a `sources:` map, and none reached by
   this sweep because they contain no endpoint text at all. They fabricate procedures rather than
   endpoints, which no lint will ever catch. `planning/audit-backlog.md` already ranks them.

So: the *endpoint* fabrication is, as far as any mechanical test can tell, cleared. The
*confidence* that it is cleared should stay low until the route table is available to CI, because
today's check ran on my machine and nothing stops the next page from being written tomorrow with a
`/core2/`-shaped path that does not exist.
