---
title: "Integration"
description: "How the Membership Module connects to point-of-sale and e-commerce, and where to go for the REST API."
weight: 40
bookCollapseSection: false
---

The Membership Module connects to the rest of BigLedger through the same applets and the same REST
API as every other module. There is no separate membership API and no separate membership
credential.

{{< cards >}}
{{< card link="/modules/membership/integration/pos-integration/" title="POS Integration" subtitle="Member identification, points accrual and redemption at the point of sale." >}}
{{< card link="/modules/membership/integration/ecommerce-integration/" title="E-commerce Integration" subtitle="Member portals, points on online orders, and redemption at checkout." >}}
{{< /cards >}}

## Integrating an external system with membership data

Membership records are reachable over the same server-to-server REST surface as the rest of the
platform — `crm/membership-cards`, `crm/membership-class`, `crm/membership-points-txn` and their
siblings, under the standard path grammar. The credential, the paging, the response envelopes and
the error codes are all the ones documented for the API as a whole.

{{< cards >}}
{{< card link="/developers/integration/" title="Integrate an external system" icon="link" subtitle="The integration path: what the surface is and what BigLedger has to give you first." >}}
{{< card link="/developers/integration/data-api/" title="Data API" icon="server" subtitle="Path grammar, resources, paging, envelopes, limits and error codes." >}}
{{< card link="/developers/authentication/" title="Authentication" icon="key" subtitle="Access keys, the tenantCode header, and every failure code." >}}
{{< card link="/developers/webhooks/" title="Webhooks" icon="bell" subtitle="Membership events BigLedger can push to you - and the guarantees it does not offer." >}}
{{< /cards >}}

{{< callout type="warning" >}}
**A previous version of this section described a separate "Data Hub Membership API"** with its own
OAuth 2.0 flow, its own API keys, its own event names and signed webhook payloads. None of it
exists. There is one API, one credential model, and one webhook mechanism, and they are documented
under [Developers](/developers/integration/). If you built against the old page, the
[Data API](/developers/integration/data-api/) is where to re-point.
{{< /callout >}}
