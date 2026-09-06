---
title: Getting Started
description: From nothing to moving real data - sign in, issue an access key, read records out of BigLedger and write records back, with a worked end-to-end example.
weight: 10
tags:
- developers
- integrations
- api
- etl
---

By the end of this page you will have an access key, a verified connection to a tenant, a
paginated read of real records, and a clear picture of exactly how far the write path is documented
and where you have to ask us.

Everything below is plain HTTPS and JSON. There is no SDK to install.

## The worked example

Throughout, the example is **GadgetSphere Online Sdn Bhd** (tenant code `gso`), the e-commerce arm
of a Malaysian multi-branch consumer electronics group. Its storefront runs outside BigLedger and
needs two flows:

- **Out of BigLedger:** the item master, so the storefront shows the right products and prices.
- **Into BigLedger:** completed online orders, as sales documents.

Substitute your own tenant code and resources; the shape does not change.

## Before you start

You need three things. One of them you can get yourself.

| | Where it comes from |
|---|---|
| A **tenant code** | BigLedger, or the customer whose tenant you are integrating with |
| A **user in that tenant** with the permissions your integration needs | A tenant administrator, inside the product |
| An **access key** for that user | You, in Step 2 |

{{< callout type="warning" >}}
**Ask for a dedicated integration user, not a person's login.** An access key carries the
permissions of the user it belongs to, and nothing narrows it — there is no read-only key and no
per-endpoint scope. A key issued against a finance manager's account can do everything that
manager can do. A key issued against `integration-storefront` can do what you asked for and
nothing more.
{{< /callout >}}

## The two hosts

| Host | Use it for |
|---|---|
| `https://api.akaun.com` | Signing in and managing access keys |
| `https://api-etl.akaun.com` | Your data traffic |

Both serve the same `/core2/` paths and behave identically. `api-etl.akaun.com` is the ingress
BigLedger's own integrations point at, and it is the one to use for anything running unattended.

## Step 1 — Sign in and get a token

You need a token once, to mint the key. After that you will not use it again.

```bash
curl -s -X POST "https://api.akaun.com/core2/platform/dm/identity/login" \
  -H "Content-Type: application/json" \
  -d '{"email":"integration-storefront@gadgetsphere.example","password":"…"}'
```

```json
{
  "code": "OK_RESPONSE",
  "data": {
    "authToken": "eyJhbGciOiJSUzI1NiJ9…",
    "subjectGuid": "…",
    "email": "integration-storefront@gadgetsphere.example",
    "mobileNumber": null,
    "data": [],
    "appletTenantTokenList": []
  },
  "message": ""
}
```

Take `data.authToken`.

**If this fails:** `code` will tell you why. A wrong password gives an authentication code, not a
`500`. Note that this endpoint takes no `tenantCode` — logging in is a platform-level operation,
and the same login can reach several tenants.

## Step 2 — Issue an access key

```bash
curl -s -X POST "https://api.akaun.com/core2/platform/dm/identity/access-keys/login-ep" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
        "label": "GadgetSphere storefront sync",
        "type": "",
        "validDateEnd": "2027-09-06T00:00:00+08:00"
      }'
```

```json
{
  "code": "OK_RESPONSE",
  "data": { "keyId": "7K2QW9XR4M", "keySecret": "p3Rt9mZ2vQ8hL5nD1sJ6kW4bA" },
  "message": ""
}
```

- `keyId` — 10 characters — is your `AccessId`.
- `keySecret` — 25 characters — is your `AccessKey`.

Store both now.

{{< callout type="warning" >}}
**`keySecret` is returned exactly once.** It is stored hashed and no endpoint will show it again.
If you lose it, `DELETE` the key and issue another.
{{< /callout >}}

{{< callout type="warning" >}}
**Send `validDateEnd`.** Omit it and the key is created with an expiry of 31 December 9999 — a
credential that never lapses. Most keys in production were created that way. Set a real date,
diarise it, and rotate by issuing the new key, deploying it, confirming traffic has moved, then
deleting the old one. Both work at once, so there is no cutover gap.
{{< /callout >}}

`GET` and `DELETE` on the same path list and remove your own keys. The full credential model is in
[Authentication](/developers/authentication/).

## Step 3 — Prove the connection

Three things have to be right — the key, the tenant code, and the user's permissions in that
tenant. One call tests all three.

```bash
export BLG=https://api-etl.akaun.com
export H_ID="AccessId: 7K2QW9XR4M"
export H_KEY="AccessKey: p3Rt9mZ2vQ8hL5nD1sJ6kW4bA"
export H_TNT="tenantCode: gso"

curl -s "$BLG/core2/tnt/dm/erp/gen-doc/etl-ep/server-doc-types" \
  -H "$H_ID" -H "$H_KEY" -H "$H_TNT"
```

A `200` with `"code": "OK_RESPONSE"` and a list of document types means you are connected. The
list is the set of business document types this platform understands — `INTERNAL_SALES_INVOICE`,
`INTERNAL_SALES_ORDER`, `INTERNAL_PURCHASE_INVOICE` and around ninety more.

{{< callout type="info" >}}
**The names it returns are not the names the URLs use.** This endpoint returns
`INTERNAL_SALES_INVOICE`; the URL for that document is
`…/gen-doc/internal-sales-invoices/etl-ep` — lower case, hyphenated, and usually plural. Use this
call to confirm a document type exists, then check the slug in the
[Data API](/developers/integration/data-api/).
{{< /callout >}}

**If it fails**, read `code` rather than the HTTP status — the table in
[Authentication](/developers/authentication/#error-codes) maps every one. The three you will
actually hit:

| `code` | Fix |
|---|---|
| `AUTH_TOKEN_OR_INVALID_ACCESS_ID` | The `AccessId` is wrong or the key was deleted |
| `CLIENT_TENANT_CODE_DOES_NOT_EXIST` | The `tenantCode` is wrong |
| `CLIENT_AUTH_USER_NOT_AUTHORIZED` | Key and tenant are fine; the **user** lacks the permission. Go back to the tenant administrator. |

## Step 4 — Read data out

Every resource has a `query` endpoint that filters and paginates. For GadgetSphere's item master:

```bash
curl -s "$BLG/core2/tnt/dm/erp/fi/fi-items/etl-ep/query?limit=200&offset=0&calcTotalRecords=true" \
  -H "$H_ID" -H "$H_KEY" -H "$H_TNT"
```

```json
{
  "totalRecords": 5217,
  "offset": 0,
  "limit": 200,
  "code": "OK_RESPONSE",
  "message": "",
  "data": [ { "bl_fi_mst_item_hdr": { "…": "…" }, "bl_fi_mst_item_lines": [] } ]
}
```

Then walk `offset` forward in steps of `limit` until you have `totalRecords` rows.

Three things to know before you build the loop:

- **`limit` defaults to 100** if you omit it. There is no enforced maximum, but responses stream
  and are not buffered — a very large page is a long single response, not a fast one.
- **`calcTotalRecords` defaults to `false`** and costs an extra `COUNT` query when true. Send it
  on the first page to size the job, then drop it.
- **Set the sort explicitly.** With no `orderBy`, results come back ordered by the record's
  `guid` — stable, but arbitrary, and rows created while you are paging still land unpredictably.
  Pass `orderBy` (a column on the record, e.g. `updated_date`) and `order` (`ASC` or `DESC`).

## Step 5 — Pull only what changed

Full pulls are for the first run. After that, filter on the update timestamp. Most of the
resources you will actually sync — documents, customers and suppliers, items — accept
`updated_date_from` and `updated_date_to` in ISO-8601. Not every resource does; if a filter has no
effect on the result count, that resource does not support it, and you will have to page the whole
set and diff on your side.

```bash
curl -s -G "$BLG/core2/tnt/dm/erp/gen-doc/internal-sales-invoices/etl-ep/query" \
  --data-urlencode "updated_date_from=2026-09-01T00:00:00+08:00" \
  --data-urlencode "limit=200" \
  --data-urlencode "offset=0" \
  --data-urlencode "orderBy=updated_date" \
  --data-urlencode "order=ASC" \
  -H "$H_ID" -H "$H_KEY" -H "$H_TNT"
```

Store the high-water mark and pass it as `updated_date_from` next run. Overlap it by a minute or
two and de-duplicate on `guid` — cheaper than missing a record.

`created_date_from` / `_to` and `date_txn_from` / `_to` are available on document queries too.
`date_txn` is the business transaction date and `updated_date` is when the row last changed; for
change-data-capture you want `updated_date`.

## Step 6 — Write data in

Creating a record is a `POST` of the same JSON object shape a `GET` returns, to the same path
without a trailing GUID:

```
POST /core2/tnt/dm/erp/gen-doc/internal-sales-invoices/etl-ep
POST /core2/tnt/dm/erp/entity/customers/etl-ep
POST /core2/tnt/dm/erp/fi/fi-items/etl-ep
```

`PUT` to the same path updates; `DELETE …/etl-ep/{guid}` removes.

Bodies are **containers** — a header object plus arrays of related rows — and the JSON keys are the
underlying table names:

```json
{
  "bl_fi_generic_doc_hdr":  { "…": "…" },
  "bl_fi_generic_doc_line": [ { "…": "…" } ],
  "bl_fi_generic_doc_ext":  [],
  "bl_fi_generic_doc_link": []
}
```

{{< callout type="warning" >}}
**The container key names are not consistently pluralised.** The document lines array is
`bl_fi_generic_doc_line` (singular) while the item lines array is `bl_fi_mst_item_lines` (plural).
The key is whatever the platform's own field is called. Do not guess it — read a record back and
copy the keys exactly.
{{< /callout >}}

### The technique: read one, then mirror it

Because `GET` and `POST` on a resource use the same container type, the reliable way to learn a
write body is to create one record by hand in the BigLedger user interface, read it back through
`…/etl-ep/query`, and use that as your template. Strip the server-assigned fields (`guid`,
`revision`, `created_date`, `updated_date`, `vrsn`), substitute your own values, and post it.

This works for any resource on the surface and it is what we would tell you to do anyway.

### Where this stops, and what to ask for

{{< callout type="warning" >}}
**We do not publish a field-by-field schema for business documents.** A sales invoice runs through
several hundred lines of fill-and-validate before it is accepted — company, branch, entity, item,
tax, price, quantity and sign conventions all cross-check each other, and the rules differ by
document type. We are not going to guess a minimal body and publish it as fact.
{{< /callout >}}

So, concretely, this is where you stop and ask:

- **Master data — customers, suppliers, items, branches, locations, labels, pricing.** Read-one-then-mirror
  is enough. Expect to iterate against validation errors; the response tells you which field
  failed.
- **Business documents — invoices, orders, deliveries, credit notes.** Read-one-then-mirror gets
  you close, but the posting rules are where integrations fail. Email
  [developers@bigledger.com](mailto:developers@bigledger.com) with the **document type**, the
  **tenant**, and **one real example of what you want to create**. Ask for a worked request body
  for that document type in that tenant's configuration. That is a request BigLedger can answer
  quickly and one you cannot answer from documentation.

There is also a bulk path — `POST …/{docType}/etl-ep/multi` takes an array of the same containers,
and several resources have a CSV import-file endpoint. Both have the same schema question, so
settle the single-record body first.

## Step 7 — Keep your own identifiers

Do not build your correlation on BigLedger's GUIDs alone. Document headers carry three fields for
your side of the mapping:

| Field | Use it for |
|---|---|
| `client_key` | Your primary key for the record |
| `client_source` | Which of your systems it came from |
| `client_value` | Anything else you need to carry |

Both `client_key` and `client_source` are filterable, as `hdr_client_key` and `hdr_client_source`:

```bash
curl -s -G "$BLG/core2/tnt/dm/erp/gen-doc/internal-sales-invoices/etl-ep/query" \
  --data-urlencode "hdr_client_source=storefront" \
  --data-urlencode "hdr_client_key=WEB-2026-0043117" \
  -H "$H_ID" -H "$H_KEY" -H "$H_TNT"
```

That query is your idempotency check: before posting an order, ask whether it is already there.
The API has no idempotency-key header, so this is the mechanism.

## What success looks like

Run these four in order. If all four pass, your integration has everything it needs.

1. `GET …/gen-doc/etl-ep/server-doc-types` returns `OK_RESPONSE` and a list.
2. `GET …/fi/fi-items/etl-ep/query?limit=1&calcTotalRecords=true` returns a `totalRecords` that
   matches what the tenant's users see.
3. The same query with `offset=1` returns a *different* record.
4. A `POST` of a mirrored record returns `OK_RESPONSE`, and reading it back by
   `hdr_client_key` finds it.

## Common mistakes

**Paging on the default sort.** With no `orderBy` you get `guid` order — arbitrary, and rows
created mid-run still appear unpredictably. Sort explicitly, and prefer `updated_date`.

**Treating `CLIENT_AUTH_USER_NOT_AUTHORIZED` as a credential problem.** It is a permission
problem. Re-issuing the key will not fix it; granting the permission to the user will.

**Assuming an unknown path returns 404.** A path the platform does not recognise returns **417**
with `SERVER_GENERAL_UNKNOWN_ERROR` and a message beginning *No static resource*. If you see that,
fix the path before you suspect anything else.

**Using the document-type name from `server-doc-types` in a URL.** It returns
`INTERNAL_SALES_INVOICE`; the URL wants `internal-sales-invoices`.

**Letting a key live forever.** Omitting `validDateEnd` produces a credential dated 31 December
9999. Set an expiry, and delete keys for integrations you have retired.

**Assuming you will be throttled before you cause a problem.** Nothing rate-limits you and nothing
returns `429`. Pace your own jobs.

## Related documentation

{{< cards >}}
{{< card link="/developers/integration/data-api/" title="Data API" icon="server" subtitle="The full path grammar, the resources available, paging, envelopes, limits and error codes." >}}
{{< card link="/developers/authentication/" title="Authentication" icon="key" subtitle="Credentials, headers and every failure code in one table." >}}
{{< card link="/developers/webhooks/" title="Webhooks" icon="bell" subtitle="Being told when something changes, instead of polling for it - and what that path cannot do." >}}
{{< /cards >}}
