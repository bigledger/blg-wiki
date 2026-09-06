---
title: Data API
description: The server-to-server REST surface - path grammar, the resources available, the six operations, paging, response envelopes, limits and error codes.
weight: 20
tags:
- developers
- integrations
- api
- etl
---

Reference for the `etl-ep` endpoints — the server-to-server half of the BigLedger REST API. If you
have not issued an access key yet, start with
[Getting Started](/developers/integration/getting-started/).

## Hosts

| Host | Use it for |
|---|---|
| `https://api-etl.akaun.com` | Data traffic. The ingress BigLedger's own integrations use. |
| `https://api.akaun.com` | Signing in and managing access keys |

Both serve the same paths. Everything on this page is under `api-etl.akaun.com`.

## Path grammar

```
/core2/{tnt|platform}/{dm|ms}/<module>/<resource>/<access-endpoint>
```

| Segment | Meaning |
|---|---|
| `tnt` | Tenant-scoped. Needs a `tenantCode` header. This is where business data lives. |
| `platform` | Platform-scoped: identity, applets, tenants. No `tenantCode`. |
| `dm` | Domain model — the normal, current surface |
| `ms` | Micro-service — older, narrower endpoints |
| `<module>` | `erp`, `crm`, `inv`, `fi`, `cms`, `pgw`, `fm` and others |
| `<resource>` | The thing you are addressing |
| `<access-endpoint>` | Who the endpoint is for |

Access endpoints:

| | |
|---|---|
| `etl-ep` | Server-to-server integrations. **Yours.** |
| `backoffice-ep` | A staff user working in the BigLedger shell |
| `login-ep` | A signed-in user acting on their own records |
| `login-entity-ep` | An external party — a customer or supplier — acting on their own records |
| `public-ep` | Deliberately unauthenticated |

Almost every business resource has both a `backoffice-ep` and an `etl-ep` variant, calling the
same handler with the same permission checks. Build against `etl-ep`: it is the variant maintained
for unattended callers, and it will not move when the user interface changes.

{{< callout type="info" >}}
**An unrecognised path returns `417`, not `404`,** with `"code": "SERVER_GENERAL_UNKNOWN_ERROR"`
and a message beginning *No static resource*. If you see that, the path is wrong.
{{< /callout >}}

## The six operations

Most resources on this surface expose the same shape. Taking the item master as the example:

| Operation | Request |
|---|---|
| Create | `POST /core2/tnt/dm/erp/fi/fi-items/etl-ep` |
| Update | `PUT /core2/tnt/dm/erp/fi/fi-items/etl-ep` |
| Delete | `DELETE /core2/tnt/dm/erp/fi/fi-items/etl-ep/{guid}` |
| List all | `GET /core2/tnt/dm/erp/fi/fi-items/etl-ep` |
| Read one | `GET /core2/tnt/dm/erp/fi/fi-items/etl-ep/{guid}` |
| Filter and page | `GET /core2/tnt/dm/erp/fi/fi-items/etl-ep/query` |

Many resources add extras — `…/etl-ep/multi` for batch create, `…/etl-ep/query/count`,
`…/etl-ep/query/snapshot`, file attachment endpoints.

{{< callout type="warning" >}}
**Do not assume all six exist on every resource.** They usually do, but there are real gaps and
they are not signposted. Entities are the one you will hit first: `POST`, `PUT`, `GET` and
`…/query` all work at `entity/{entityType}/etl-ep`, but **there is no delete on the typed path** —
delete is only on the type-agnostic `DELETE /core2/tnt/dm/erp/entity/etl-ep/{guid}`, and there is
also `PUT /core2/tnt/dm/erp/entity/etl-ep/inactivation/{guid}` if you want to retire a record
rather than remove it. Contacts are narrower still: on this surface they offer only
`POST …/contacts/etl-ep/multi`. Probe the operation you need before you design around it — an
absent route returns `417`, so a probe is unambiguous.
{{< /callout >}}

## What is on the surface

Around **950 endpoint methods across 156 controllers**, covering roughly **287 resources**. The
groups you are most likely to need:

### Master data

| Resource | Path under `/core2/tnt/dm/erp/` |
|---|---|
| Customers, suppliers, employees, merchants | `entity/{entityType}/etl-ep` |
| All entities regardless of type | `entity/etl-ep` |
| Financial items (the sellable/purchasable item master) | `fi/fi-items/etl-ep` |
| Inventory items | `inv/inv-items/etl-ep` |
| Companies | `companies/etl-ep` |
| Branches | `branches/etl-ep` |
| Locations | `locations/etl-ep` |
| Contacts (batch create only) | `contacts/etl-ep/multi` |
| Labels and label lists | `labels/etl-ep`, `label-lists/etl-ep` |
| Pricing scheme links | `pricing-scheme-link/etl-ep` |
| Credit limits and credit terms | `fi/entity-sales-credit-limit/etl-ep` and siblings |

`{entityType}` is one of `entities`, `customers`, `suppliers`, `employees`, `merchants` — so a
customer read is `GET /core2/tnt/dm/erp/entity/customers/etl-ep/query`.

### Business documents

Every document type goes through one controller, keyed by a URL slug:

| Operation | Request |
|---|---|
| List the document types this platform knows | `GET /core2/tnt/dm/erp/gen-doc/etl-ep/server-doc-types` |
| Create | `POST /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep` |
| Create many | `POST /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep/multi` |
| Update | `PUT /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep` |
| Delete | `DELETE /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep/{guid}` |
| Read one | `GET /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep/{guid}` |
| Filter and page, one type | `GET /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep/query` |
| Filter and page, all types | `GET /core2/tnt/dm/erp/gen-doc/etl-ep/query` |
| Void | `PUT /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep/void/{guid}` |
| Print to PDF | `GET /core2/tnt/dm/erp/gen-doc/{docType}/etl-ep/print-jasper-pdf/{guid}` |

There are **97 document-type slugs**. The common ones:

| `{docType}` slug | Document type |
|---|---|
| `internal-sales-invoices` | `INTERNAL_SALES_INVOICE` |
| `internal-sales-cashbills` | `INTERNAL_SALES_CASHBILL` |
| `internal-sales-orders` | `INTERNAL_SALES_ORDER` |
| `internal-sales-returns` | `INTERNAL_SALES_RETURN` |
| `internal-sales-credit-notes` | `INTERNAL_SALES_CREDIT_NOTE` |
| `internal-sales-debit-notes` | `INTERNAL_SALES_DEBIT_NOTE` |
| `internal-purchase-orders` | `INTERNAL_PURCHASE_ORDER` |
| `internal-purchase-invoices` | `INTERNAL_PURCHASE_INVOICE` |
| `internal-purchase-goods-received-notes` | `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` |
| `internal-stock-adjustment` | `INTERNAL_STOCK_ADJUSTMENT` |
| `internal-payment-vouchers` | `INTERNAL_PAYMENT_VOUCHER` |
| `internal-receipt-vouchers` | `INTERNAL_RECEIPT_VOUCHER` |

{{< callout type="warning" >}}
**`server-doc-types` returns the type names, not the URL slugs.** It gives you
`INTERNAL_SALES_INVOICE`; the URL wants `internal-sales-invoices`. Use it to confirm a type exists,
then take the slug from the table above. If the type you need is not in that table, ask
[developers@bigledger.com](mailto:developers@bigledger.com) for its slug — do not guess the
pluralisation, because it is not consistent (`internal-stock-adjustment` is singular).
{{< /callout >}}

### Other modules

`crm/` carries membership cards, classes, points transactions and contacts. `alg/cc/` carries the
contact-centre resources — agents, conversations, channels, tasks. `cms/` carries website and post
resources. `fm/` carries files and labels. `pgw/` carries payment providers and payment
transactions. All follow the same six-operation shape.

If a resource you need is not listed here, it may still exist — ask for the current route rather
than guessing it.

## Request and response format

### Headers

```http
AccessId: <10 characters>
AccessKey: <25 characters>
tenantCode: <the tenant>
Content-Type: application/json      # on POST and PUT
```

Full credential detail in [Authentication](/developers/authentication/).

### Envelopes

Single object or non-paged list:

```json
{ "code": "OK_RESPONSE", "data": { }, "message": "" }
```

Paged (`…/query`):

```json
{
  "totalRecords": 5217,
  "offset": 0,
  "limit": 200,
  "code": "OK_RESPONSE",
  "message": "",
  "data": [ ]
}
```

`code` is a platform response code, not an HTTP status. Match on it.

Responses are **streamed**, not buffered. A large page arrives progressively and the connection
stays open for the duration — parse incrementally rather than waiting for a complete body.

Responses are gzip-compressed above 1 KB. Send `Accept-Encoding: gzip`.

### Bodies

Write bodies are **containers**: a header object plus arrays of related rows, keyed by the
underlying table names.

```json
{
  "bl_fi_generic_doc_hdr":  { },
  "bl_fi_generic_doc_line": [ ],
  "bl_fi_generic_doc_ext":  [ ],
  "bl_fi_generic_doc_link": [ ]
}
```

The same container type comes back from `GET`, so the reliable way to learn a write body is to
read a record and mirror it. Dates are ISO-8601 strings, never epoch numbers.

{{< callout type="warning" >}}
**Key names are not consistently pluralised.** Document lines are `bl_fi_generic_doc_line`
(singular); item lines are `bl_fi_mst_item_lines` (plural). Copy the keys from a real response.
{{< /callout >}}

## Query parameters

`…/query` endpoints share a common set, plus per-resource filters.

| Parameter | Default | Notes |
|---|---|---|
| `limit` | `100` | No enforced maximum. Responses stream, so a big page is a long response. |
| `offset` | `0` | |
| `orderBy` | record `guid` | A column on the record, e.g. `updated_date` |
| `order` | `ASC` | `ASC` or `DESC`; anything else is treated as `ASC` |
| `calcTotalRecords` | `false` | Costs an extra `COUNT`. Send it on the first page only. |
| `status` | — | Filter by record status |
| `excluded_statuses` | — | Exclude statuses |
| `search_word` | — | Free-text search, where the resource supports it |
| `querying_timezone` | `Asia/Kuala_Lumpur` | The zone date filters are interpreted in |

Most of the resources you will sync also accept, in ISO-8601:

| Parameter | Meaning |
|---|---|
| `updated_date_from` / `updated_date_to` | When the row last changed — use this for incremental pulls |
| `created_date_from` / `created_date_to` | When the row was created |
| `date_txn_from` / `date_txn_to` | The business transaction date, on documents |

Not every resource supports them. If a date filter does not change the result count, that resource
does not implement it.

Document queries add `server_doc_type`, `guid_comp`, `guid_branch`, `hdr_posting_status`,
`doc_entity_hdr_guid`, `hdr_doc_ccy`, and the correlation filters below.

## Correlating with your own identifiers

Records carry three fields for your side of the mapping. They are yours to populate; BigLedger
never writes them.

| Field on the record | Query parameter | Use it for |
|---|---|---|
| `client_key` | `hdr_client_key` | Your primary key for the record |
| `client_source` | `hdr_client_source` | Which of your systems it came from |
| `client_value` | — | Anything else you need to carry |

```
GET …/gen-doc/internal-sales-invoices/etl-ep/query?hdr_client_source=storefront&hdr_client_key=WEB-2026-0043117
```

{{< callout type="warning" >}}
**There is no idempotency-key header.** Query on `hdr_client_key` before you create, and set
`client_key` on everything you write. That is the only mechanism for not posting the same order
twice.
{{< /callout >}}

## Limits

Measured from the platform's own configuration.

| | |
|---|---|
| Request timeout | **2 hours** for asynchronous request handling |
| Multipart upload | **2 GB** per file and per request |
| Response compression | gzip above 1 KB |
| Page size | Defaults to 100; no maximum enforced |
| Batch create | No maximum enforced on `…/etl-ep/multi` |
| Rate limit | **None** |

{{< callout type="warning" >}}
**Nothing throttles you.** There is no rate limiter, no quota and no `429` anywhere in the
platform. A runaway job will not be stopped for you — it will compete with the tenant's own users
for the same server. Pace your jobs, run bulk work outside business hours, and keep concurrency
low. Integrations that work well page in the low hundreds to low thousands of rows and pause
between pages.
{{< /callout >}}

Because there are no enforced maxima, the practical limits are the timeout and your own patience.
A 2 GB multipart upload and a two-hour request are both technically allowed and both bad ideas.

## Error codes

| HTTP | `code` | Meaning |
|---|---|---|
| 200 | `OK_RESPONSE` | Success |
| 200/404 | `OK_NODATA` | The request was valid; nothing matched |
| 400 | `AUTH_TOKEN_OR_ACCESS_ID_WAS_NOT_PROVIDED` | No credential |
| 400 | `AUTH_TOKEN_OR_ACCESS_KEY_WAS_NOT_PROVIDED` | `AccessId` without `AccessKey` |
| 400 | `CLIENT_TENANT_CODE_IS_EMPTY` | No `tenantCode` header |
| 401 | `CLIENT_AUTH_NO_TOKEN` | No credential on a platform endpoint |
| 403 | `AUTH_TOKEN_OR_INVALID_ACCESS_ID` | No key with that `AccessId` |
| 403 | `AUTH_TOKEN_OR_EXPIRED_ACCESS_ID` | The key has passed its `validDateEnd` |
| 403 | `AUTH_TOKEN_OR_ACCESS_ID_TOKEN_NOT_MATCHED` | Wrong `AccessKey` for that `AccessId` |
| 403 | `CLIENT_AUTH_INVALID_TOKEN` | Malformed or expired token |
| 403 | `CLIENT_AUTH_USER_NOT_AUTHORIZED` | Authenticated; the **user** lacks the permission |
| 404 | `CLIENT_TENANT_CODE_DOES_NOT_EXIST` | Unknown tenant |
| 404/403 | `CLIENT_VALIDATION_GUID_DOES_NOT_EXIST` | No record with that GUID |
| 400 | validation codes | The body failed a consistency check; `data` carries the failures |
| 417 | `SERVER_GENERAL_UNKNOWN_ERROR` | Unhandled error — **or an unrecognised path** |

Check `code` before HTTP status. A validation failure and a permission failure can share a status
but never share a code.

## Related documentation

{{< cards >}}
{{< card link="/developers/integration/getting-started/" title="Getting Started" icon="play" subtitle="Issue a key and make these calls, end to end." >}}
{{< card link="/developers/authentication/" title="Authentication" icon="key" subtitle="The credential model in full." >}}
{{< card link="/developers/webhooks/" title="Webhooks" icon="bell" subtitle="Being told when something changes instead of polling for it." >}}
{{< card link="/developers/api-reference/einvoice-api-reference/" title="E-Invoice API" icon="document-text" subtitle="Malaysian e-Invoice submission, cancellation and document queries." >}}
{{< /cards >}}
