---
title: Integrate an External System
description: Move data between your own system and BigLedger over HTTP - what the integration surface is, what it can do, and where BigLedger has to hand you something.
weight: 20
bookCollapseSection: true
cascade:
  type: docs
tags:
- developers
- integrations
- api
- etl
---

You have a system of your own — a storefront, a warehouse tool, a marketplace connector, a data
warehouse — and you need it to exchange data with BigLedger. This section is the path from nothing
to moving real records.

{{< cards >}}
{{< card link="/developers/integration/getting-started/" title="Getting Started" icon="play" subtitle="Sign in, issue an access key, and read and write your first records - end to end." >}}
{{< card link="/developers/integration/data-api/" title="Data API" icon="server" subtitle="The server-to-server endpoints: path grammar, paging, envelopes, limits and error codes." >}}
{{< card link="/developers/authentication/" title="Authentication" icon="key" subtitle="Access keys, tokens, the tenantCode header and every failure code." >}}
{{< card link="/developers/webhooks/" title="Webhooks" icon="bell" subtitle="The event path out of BigLedger - what it does, and the four things it does not do." >}}
{{< /cards >}}

## What the integration surface is

BigLedger has one REST API, served over HTTPS, returning JSON. Every path is built the same way:

```
/core2/{tnt|platform}/{dm|ms}/<module>/<resource>/<access-endpoint>
```

The last segment is the **access endpoint**, and it says which category of caller an endpoint is
built for — `backoffice-ep` for a staff user in the BigLedger shell, `login-ep` and
`login-entity-ep` for signed-in users acting on their own records, `public-ep` where a resource is
deliberately open, and **`etl-ep` for server-to-server integrations**. That last one is your
surface.

It is not a narrow surface. Around **950 endpoint methods across 156 controllers** carry the
`etl-ep` variant, covering roughly **287 resources** — customers and suppliers, items and
inventory, companies, branches and locations, pricing, labels, stock take, membership, contacts,
payment gateways, and every business document type through one generic document endpoint.

Each resource exposes the same six operations:

| | |
|---|---|
| `POST` | `…/etl-ep` — create |
| `PUT` | `…/etl-ep` — update |
| `DELETE` | `…/etl-ep/{guid}` — delete |
| `GET` | `…/etl-ep` — list |
| `GET` | `…/etl-ep/{guid}` — read one |
| `GET` | `…/etl-ep/query` — filter and paginate |

So the answer to *push or pull* is **both, over the same endpoints**, plus an outbound event path
via [webhooks](/developers/webhooks/).

## What you need before you start

Three things, and only one of them is self-service.

| | Self-service? |
|---|---|
| A **tenant code** — the customer database you are integrating with | No. It comes from BigLedger or from the customer. |
| A **user account in that tenant, with the right permissions** | No. A tenant administrator creates it and grants the permissions. |
| An **access key** for that user | **Yes.** One API call. See [Getting Started](/developers/integration/getting-started/). |

An access key carries the permissions of the user it belongs to and nothing else — there is no
per-key scope. That makes the second row the one that decides what your integration can do, so
settle it before you write code.

## What BigLedger does not give you

Stated plainly, so you can plan around it rather than search for it.

{{< callout type="warning" >}}
**There is no published client library for this surface.** The public npm packages
(`blg-akaun-ts-lib`, `blg-akaun-ng-lib`) are Angular libraries for applets running inside the
BigLedger shell; they do not target the server-to-server endpoints. The Java client library is
published to a private repository. **You write HTTP yourself** — which is not onerous, because
every resource has the same six-method shape.
{{< /callout >}}

{{< callout type="warning" >}}
**There is no sandbox tenant and no self-service sign-up that yields one.** Ask BigLedger for a
test tenant before you build against a customer's live data.
{{< /callout >}}

{{< callout type="warning" >}}
**There is no machine-readable schema.** No OpenAPI document, no JSON Schema, no generated client.
The [Data API](/developers/integration/data-api/) page documents the shapes you need and the
technique for discovering the rest — read a record back and mirror what you get.
{{< /callout >}}

{{< callout type="warning" >}}
**There is no rate limiting, and that is not a licence.** Nothing in the platform throttles you,
returns `429`, or enforces a quota. Requests stream and can run long. Pace your own jobs — see the
limits in the [Data API](/developers/integration/data-api/).
{{< /callout >}}

## Where to ask

When one of the hand-offs above is what stands between you and a working integration, the contact
is [developers@bigledger.com](mailto:developers@bigledger.com). Say which tenant, which resources
you need to read or write, and in which direction. The three things worth asking for by name are a
**test tenant**, an **integration user with a named permission set**, and — if you need a resource
that is not documented here — the **current route for it**.

## Related documentation

{{< cards >}}
{{< card link="/developers/applets/" title="Build an applet" icon="cube" subtitle="A different job: a screen that runs inside BigLedger rather than a system that talks to it." >}}
{{< card link="/developers/api-reference/" title="API Reference" icon="book-open" subtitle="Module-level endpoint references, including the verified E-Invoice and communications APIs." >}}
{{< card link="/developers/platform-library/" title="Platform Library" icon="server" subtitle="Building a backend application on the BigLedger Java libraries." >}}
{{< /cards >}}
