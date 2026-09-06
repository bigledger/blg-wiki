---
id: Q-0014
asked: 2026-09-06
closed: 2026-09-06
answered_by: source, not Vincent
evidence: planning/drafts/2026-09-06-datahub-integration-path.md
---

# Q-0014 — What is the "data-hub", and how does an external system use it?

Raised in F-0292 as four questions. All four were settled by reading
`refs/blg-akaun-platform-java`, the ETL agent repos, and the live API — so this is filed here as
the record of *why the wiki says what it says*, not as an answer from Vincent. The parts that still
need him became **Q-0021 to Q-0024**.

## 1. What is the "data-hub" called in the product?

**Nothing.** There is no "data hub", "datahub" or "data platform" in the platform code, the applet
registry or the API. What the term points at is the **`etl-ep` access endpoint** — the
server-to-server variant of the core2 REST surface: ~950 endpoint methods over 156 controllers,
covering ~287 resources.

"Data hub" is a marketing phrase, not an engineering surface: it appears on the websites and on
nine wiki pages, and the platform's own signup copy calls the same idea an *"Operational
Datalake"*. Whether it should become the public name is **Q-0022**. The new pages name the thing by
what it is rather than invent a brand.

The three ACTIVE registry rows in this space are not it. `blg-applet-wavelet-virtual-etl-applet`
is a fork of the blanket-purchase-order applet with its only feature route commented out — it has
no ETL screen (P-0044).

## 2. How does an external system authenticate?

A **25-character access key** with a **10-character access id**, sent as `AccessKey` and
`AccessId` headers alongside `tenantCode`. Minted by the holder at
`POST /core2/platform/dm/identity/access-keys/login-ep` using an ordinary user token; the secret is
returned once and stored Argon2-hashed. It **inherits the permissions of the user it was issued
for** and has no scope of its own. It expires only if you ask it to — the default is 9999-12-31
(P-0042).

## 3. Push, pull, or both?

**Both, over the same endpoints.** Every resource carries the same six operations, and the
`etl-ep` and `backoffice-ep` variants call the same handler with the same permission checks; only
the credential order differs.

There is also an event path out — webhooks — but it offers **no signature, no retry, no alerting
and no readable delivery log** (P-0033 to P-0037, P-0039, P-0040). It is a hint that something
changed, not a delivery guarantee, and the wiki now says so.

## 4. Is any of it self-service?

**The credential is. Nothing else is.** `POST …/access-keys/login-ep` has no permission gate at
all. But the tenant code and the integration user's permissions both come from BigLedger or the
customer's administrator, there is no sandbox tenant (**Q-0024**), no published client library for
this surface, and no machine-readable schema.

## What the reader can and cannot do from the wiki now

**Can:** authenticate, discover, and read any resource on the surface, incrementally and
correlated to their own identifiers.

**Cannot, without asking:** write a business document. The generic-document create runs several
hundred lines of fill-and-validate and we will not guess a minimal body — that is **Q-0023**, and
it is the largest remaining gap.
