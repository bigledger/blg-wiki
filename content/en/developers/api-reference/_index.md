---
title: "API Reference"
description: "The BigLedger REST API — what is documented today, and what is being rebuilt from source"
weight: 30
bookCollapseSection: true
tags:
- developers
- api
---

BigLedger's REST API is served under `/core2/`. Every endpoint follows one shape:

```
/core2/{tnt|platform}/{dm|ms}/<module>/<resource>/<access-endpoint>
```

The last segment is the **access endpoint**, and it decides who may call it — `backoffice-ep` for a signed-in back-office user, `login-ep` for an authenticated portal login, `login-entity-ep` for a customer or supplier acting on their own records, `etl-ep` for bulk data movement, and `public-ep` where an endpoint is deliberately unauthenticated.

{{< callout type="warning" >}}
**Most of this reference is being rebuilt.** An audit on 6 September 2026 found that the module pages here described endpoints that do not exist. Rather than leave them up, they have been unpublished while they are rewritten from the live route table. The two references below are verified and safe to build against today.
{{< /callout >}}

## Verified references

{{< cards >}}
  {{< card link="/developers/api-reference/einvoice-api-reference/" title="E-Invoice API" subtitle="Submission, cancellation and rejection, document query and notifications — checked against the backend" >}}
  {{< card link="/developers/api-reference/ucc/" title="Unified Contact Center API" subtitle="Agents, conversations, channels and messaging" >}}
  {{< card link="/developers/platform-library/" title="Platform Library" subtitle="The shared library BigLedger applets are built on" >}}
{{< /cards >}}

## Being rewritten

Sales, Purchasing, Inventory, Accounting, Reports, Batch, Integrations and the error-code index are unpublished pending a rewrite from the live route table. If you need one of them now, ask your BigLedger contact for the current route list rather than working from a cached copy of the old page.
