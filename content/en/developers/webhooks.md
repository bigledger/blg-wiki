---
title: Webhooks
description: How BigLedger notifies your system when a record changes - subscribing to a topic, what arrives, and the four guarantees this mechanism does not offer.
weight: 30
tags:
- developers
- webhooks
- events
- integrations
---

BigLedger can `POST` to a URL of yours when something changes in a tenant, so your system does not
have to poll for it.

This page documents what that mechanism does and — at least as important — what it does not do.
Read the guarantees section before you design around it.

## What it is

You register a **subscription**: a URL, a **topic**, and optionally one HTTP header for the
receiver to authenticate with. When a matching change happens in that tenant, BigLedger `POST`s a
JSON body to your URL. Every attempt is written to a delivery log.

Topics are strings such as `CUSTOMER_CREATED`, `INTERNAL_SALES_INVOICE_CREATED` or
`INVENTORY_UPDATED`. A subscription points at one topic. For several topics, register several
subscriptions.

## What it does not do

Four absences, all of which change how you should build.

{{< callout type="warning" >}}
**There is no signature.** BigLedger does not sign the payload — no HMAC, no shared signing secret,
no timestamp or nonce. The only credential the receiver gets is one static header name and value
that you chose when you created the subscription. Treat your endpoint as unauthenticated in
practice: put it behind a hard-to-guess path, allowlist by source address if you can, and
**re-read the record through the API before you act on it** rather than trusting the body.
{{< /callout >}}

{{< callout type="warning" >}}
**There is no retry.** One attempt, ever. If your endpoint returns a `500`, or times out, or is
mid-deploy, the event is gone — there is no backoff, no dead-letter queue and no replay endpoint.
Nothing tells you it was lost. **Webhooks are a hint that something changed, not a delivery
guarantee.** Pair every subscription with a periodic reconciliation pull on `updated_date_from`
(see [Getting Started](/developers/integration/getting-started/#step-5--pull-only-what-changed)).
That pull is what makes your integration correct; the webhook only makes it fast.
{{< /callout >}}

{{< callout type="warning" >}}
**There is no alerting.** A subscription record has fields for success and failure notification
by email and SMS. Nothing reads them. No message is ever sent, on success or on failure.
{{< /callout >}}

{{< callout type="warning" >}}
**You cannot browse the delivery log.** Every attempt is recorded — what was sent, what came back,
the HTTP status, and the error on a transport failure — but the endpoint that lists those records
reads the wrong database and returns an empty list on every tenant. Fetching one by its identifier
works, and you have no way to obtain an identifier. In practice: **log on your side**, and treat
the platform's delivery log as unavailable until this is fixed.
{{< /callout >}}

## Setting one up

### Step 1 — make sure the topic exists

A subscription points at a topic record, not at a topic string, so the record has to exist first.

```bash
curl -s "https://api-etl.akaun.com/core2/tnt/dm/webhook-topic/query?limit=200" \
  -H "AccessId: $BLG_ACCESS_ID" -H "AccessKey: $BLG_ACCESS_KEY" -H "tenantCode: $BLG_TENANT_CODE"
```

If the list is empty, the tenant has never been seeded. Seeding is one call and it is idempotent:

```bash
curl -s -X POST "https://api-etl.akaun.com/core2/tnt/dm/webhook-topic/populate-default" \
  -H "AccessId: $BLG_ACCESS_ID" -H "AccessKey: $BLG_ACCESS_KEY" -H "tenantCode: $BLG_TENANT_CODE"
```

That inserts the platform's built-in list of **54 topics**. Take the `guid` of the one you want
from the query above.

{{< callout type="warning" >}}
**The built-in list is a seed, not the full set — and it does not match what actually fires.**
Around sixty topic codes that BigLedger genuinely emits are absent from the built-in list, so
`populate-default` never creates them and nothing in the product lists them. Conversely, at least
one seeded topic can never fire: the built-in list spells the branch-deleted topic `BRANCH_DELTED`
while the platform emits `BRANCH_DELETED`, so a subscription to the offered topic receives
nothing, forever.

If the event you need is not in the seeded list, do not assume it does not exist — ask
[developers@bigledger.com](mailto:developers@bigledger.com) for the exact topic code, then create
the topic record yourself with `POST /core2/tnt/dm/webhook-topic`. The code must match the
platform's string exactly; there is no fuzzy matching and no error if it never matches.
{{< /callout >}}

### Step 2 — create the subscription

```bash
curl -s -X POST "https://api-etl.akaun.com/core2/tnt/dm/webhook-subscription" \
  -H "AccessId: $BLG_ACCESS_ID" -H "AccessKey: $BLG_ACCESS_KEY" \
  -H "tenantCode: $BLG_TENANT_CODE" -H "Content-Type: application/json" \
  -d '{
        "bl_webhook_subscription_hdr": {
          "topic_hdr_guid": "<guid of the topic record>",
          "url": "https://hooks.gadgetsphere.example/blg/sales-invoice-created",
          "auth_header_name": "X-GadgetSphere-Token",
          "auth_header_value": "<a long random string>",
          "status": "ACTIVE"
        }
      }'
```

| Field | Notes |
|---|---|
| `topic_hdr_guid` | The topic record's GUID, not the topic code |
| `url` | Maximum 255 characters. Not validated — a typo produces a subscription that silently never delivers. |
| `auth_header_name` | A valid HTTP header name. No spaces. |
| `auth_header_value` | The shared secret. Maximum 255 characters. |
| `status` | `ACTIVE`. Only `DELETED` stops delivery; there is no pause. |

{{< callout type="warning" >}}
**Create subscriptions through the API, not through the product.** The Web Hook screen offers
three fields — a title, a URL and a topic — and the field labelled *Web Hook Title* is stored in
the `auth_header_name` column. It never sets `auth_header_value`, and BigLedger only sends the
header when **both** halves are present. A subscription created in the user interface therefore
arrives at your endpoint with **no authentication header at all**. The screen also makes the URL
read-only once saved, so changing a destination means deleting and recreating. The API sets all
four fields properly.
{{< /callout >}}

Managing subscriptions:

| | |
|---|---|
| Create | `POST /core2/tnt/dm/webhook-subscription` |
| Update | `PUT /core2/tnt/dm/webhook-subscription` |
| Delete | `DELETE /core2/tnt/dm/webhook-subscription/{guid}` |
| List | `GET /core2/tnt/dm/webhook-subscription` |
| Read one | `GET /core2/tnt/dm/webhook-subscription/{guid}` |
| Filter | `GET /core2/tnt/dm/webhook-subscription/query` |

These need the tenant permissions `API_TNT_DM_WEBHOOK_SUBSCRIPTION_CREATE`, `_UPDATE`, `_DELETE`
and `_READ`, or tenant owner or administrator rank. Step 1 additionally needs
`API_TNT_DM_WEBHOOK_TOPIC_READ` to list topics and `API_TNT_DM_WEBHOOK_TOPIC_CREATE` to seed or
create them. Ask for all of them when you ask for the integration user — a key that can read
records cannot manage subscriptions unless it was granted these too.

{{< callout type="warning" >}}
**`auth_header_value` is stored and returned in clear text**, and it is a filterable query
parameter. Anyone who can read subscriptions in the tenant can read the secret. Use a value that
is worth nothing except to your endpoint, and rotate it on the same schedule as your access key.
{{< /callout >}}

## What arrives at your endpoint

```http
POST /blg/sales-invoice-created HTTP/1.1
Host: hooks.gadgetsphere.example
Content-Type: application/json
X-GadgetSphere-Token: <your auth_header_value>

{ "bl_fi_generic_doc_hdr": { … }, "bl_fi_generic_doc_line": [ … ] }
```

Always `POST`. Always `application/json`. The method is not configurable.

The body is **the record itself, in the same container shape the
[Data API](/developers/integration/data-api/) returns** — and nothing else.

{{< callout type="warning" >}}
**There is no envelope.** The payload carries no topic name, no event identifier, no timestamp, no
tenant code and no attempt number. Your endpoint knows which event it is only from which URL it
was configured on, so **give every subscription its own path**. And do not assume the body is
always an object: several delete topics send the JSON literal `true`, and a couple send an English
sentence with `Content-Type: application/json`. Parse defensively.
{{< /callout >}}

Your endpoint should return quickly — acknowledge, queue, and process asynchronously. BigLedger
allows 60 seconds to establish the connection and then waits indefinitely for your response, and
delivery for the whole platform runs on a small shared pool. An endpoint that accepts a connection
and then hangs is worse than one that fails fast.

## Topics

`POST /core2/tnt/dm/webhook-topic/populate-default` seeds 54 topics. The ones most integrations
use:

| Area | Topics |
|---|---|
| Entities | `CUSTOMER_CREATED` · `CUSTOMER_UPDATED` · `CUSTOMER_DELETED` · `SUPPLIER_CREATED` · `SUPPLIER_UPDATED` · `SUPPLIER_DELETED` · `EMPLOYEE_CREATED` · `EMPLOYEE_UPDATED` · `EMPLOYEE_DELETED` |
| Items | `FINANCIAL_ITEM_CREATED` · `FINANCIAL_ITEM_UPDATED` · `FINANCIAL_ITEM_DELETED` · `INVENTORY_UPDATED` |
| Sales documents | `INTERNAL_SALES_ORDER_CREATED` · `INTERNAL_SALES_ORDER_UPDATED` · `INTERNAL_SALES_ORDER_DELETED` · `INTERNAL_SALES_INVOICE_CREATED` · `INTERNAL_SALES_RETURN_CREATED` · `INTERNAL_SALES_RETURN_UPDATED` · `INTERNAL_SALES_RETURN_DELETED` |
| Organisation | `COMPANY_CREATED` · `COMPANY_UPDATED` · `BRANCH_CREATED` · `BRANCH_UPDATED` · `LOCATION_CREATED` · `LOCATION_UPDATED` · `LOCATION_DELETED` |
| Membership | `MEMBERSHIP_CARD_CREATED` · `MEMBERSHIP_CARD_UPDATED` · `MEMBERSHIP_CARD_DELETED` · `MEMBERSHIP_CLASS_CREATED` · `MEMBERSHIP_POINTS_TXN_CREATED` |
| Other | `VOUCHER_CREATED` · `VOUCHER_UPDATED` · `VOUCHER_DELETED` · `INQUIRY_CREATED` · `INQUIRY_UPDATED` · `INQUIRY_DELETED` · `PAYMENT_CONFIG_CREATED` · `PAYMENT_CONFIG_UPDATED` · `PAYMENT_CONFIG_DELETED` |

Some seeded topics never fire, because the code path they name does not emit them — the supplier
sales-order and supplier sales-return topics are the clearest example. And document topics follow
the pattern `<SERVER_DOC_TYPE>_CREATED` / `_UPDATED` / `_DELETED`, so document types beyond the
seeded handful do emit events; their topic records just have to be created by hand.

**Before you build on a topic, test it.** Subscribe, make the change in the tenant, and confirm
your endpoint is called. A topic that is registered but never fires looks identical to a quiet
system.

## How to build on this

The pattern that works:

1. **Subscribe** to the topics you care about, one URL each.
2. **Treat every delivery as "something may have changed"** — take the GUID from the body, and
   re-read the record through `…/etl-ep/{guid}` before acting.
3. **Reconcile on a schedule** with an `updated_date_from` pull. This catches everything the
   webhook dropped, and it is the part you must not skip.
4. **Log every delivery on your side**, with the raw body. The platform's own log is not readable.
5. **Return `200` fast.** Queue the work.

The webhook makes your integration responsive. The reconciliation pull makes it correct. You need
both.

## Related documentation

{{< cards >}}
{{< card link="/developers/integration/getting-started/" title="Integration: Getting Started" icon="play" subtitle="Issuing a key, and the reconciliation pull this page depends on." >}}
{{< card link="/developers/integration/data-api/" title="Data API" icon="server" subtitle="The endpoints to re-read a record from, and the container shapes webhooks deliver." >}}
{{< card link="/developers/authentication/" title="Authentication" icon="key" subtitle="The credential these subscription endpoints need." >}}
{{< /cards >}}
