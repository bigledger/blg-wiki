---
bookCollapseSection: true
cascade:
  type: docs
description: Developer documentation for BigLedger - build an applet that runs inside the platform, or integrate an external system with BigLedger data.
tags:
- developer-platform
- apis
- integrations
- applet-development
title: Developers
weight: 25
---

Documentation for developers building on BigLedger. There are two different jobs here, with
different toolchains and different starting points. Pick yours.

{{< cards >}}
{{< card link="/developers/applets/" title="Build an applet" icon="cube" subtitle="A screen that runs inside BigLedger, alongside the built-in ones. Angular, loaded by the shell at runtime." >}}
{{< card link="/developers/integration/" title="Integrate an external system" icon="link" subtitle="Move data between your own system and BigLedger over HTTP. Access keys, REST, webhooks." >}}
{{< /cards >}}

---

## Build an applet {#build-an-applet}

Almost every screen a BigLedger user sees — Chart of Account, Sales Invoice, Cashbook, Point of
Sale — is an applet: a self-contained web application that the BigLedger shell loads at runtime
and mounts inside its own page. Applets are built, versioned and released independently of the
platform and of each other.

{{< cards >}}
{{< card link="/developers/applets/getting-started/" title="Getting Started" icon="play" subtitle="From an empty directory to a bundle running inside a tenant." >}}
{{< card link="/developers/applets/applet-development/" title="Applet Structure" icon="cube" subtitle="The runtime contract, the API client, settings, permissions, packaging and release." >}}
{{< /cards >}}

**What you need:** Node.js, the Angular CLI (Angular 11–15), and two public npm packages —
`blg-akaun-ts-lib` for the API and, optionally, `blg-akaun-ng-lib` for UI components.

**What you need from us:** a registration record for your applet, and a tenant to install it into.
Neither is self-service. [Applet Development](/developers/applets/) says exactly where those
hand-offs fall and what to ask for.

---

## Integrate an external system {#integrate-an-external-system}

Your own system — a storefront, a warehouse tool, a marketplace connector, a data warehouse —
exchanging data with BigLedger over HTTPS. One REST API, JSON in and JSON out, a self-service
credential, and around 950 server-to-server endpoints covering roughly 287 resources.

{{< cards >}}
{{< card link="/developers/integration/getting-started/" title="Getting Started" icon="play" subtitle="Sign in, issue an access key, and read and write your first records - end to end." >}}
{{< card link="/developers/integration/data-api/" title="Data API" icon="server" subtitle="Path grammar, the resources available, paging, envelopes, limits and error codes." >}}
{{< card link="/developers/authentication/" title="Authentication" icon="key" subtitle="Access keys, tokens, the tenantCode header and every failure code." >}}
{{< card link="/developers/webhooks/" title="Webhooks" icon="bell" subtitle="The event path out of BigLedger - and the four things it does not do." >}}
{{< /cards >}}

**What you need from us:** a tenant code, and a user in that tenant with the right permissions.
The access key itself is one API call you make yourself.
[Integrate an external system](/developers/integration/) says where each hand-off falls.

### Module references

{{< cards >}}
{{< card link="/developers/api-reference/einvoice-api-reference/" title="E-Invoice API" icon="document-text" subtitle="Malaysian e-Invoice submission, cancellation, rejection, notifications and document queries. Verified endpoint by endpoint." >}}
{{< card link="/developers/api-reference/ucc/" title="Unified Communications API" icon="chat" subtitle="Conversations, messages, channels and endpoints for the communications module." >}}
{{< card link="/developers/automation-workflows/" title="Automation & Approvals" icon="cog" subtitle="How approvals and automated document flows work, including the approvals endpoints." >}}
{{< card link="/developers/platform-library/" title="Platform Library" icon="server" subtitle="A different job again: building a backend application that depends on the BigLedger Java libraries." >}}
{{< /cards >}}

{{< callout type="warning" >}}
**Parts of the module-level API reference are still being rewritten.** An audit on 6 September 2026
found that several pages described endpoints that do not exist, and those pages were unpublished
rather than left up. Everything linked from this page is verified against the platform source.
Treat anything not linked from here as absent rather than as documentation you have not found —
and if you need a route that is not covered,
[ask](mailto:developers@bigledger.com) rather than guess.
{{< /callout >}}

---

## Getting help

- **Developer contact:** [developers@bigledger.com](mailto:developers@bigledger.com)
- **Public repositories:** [github.com/bigledger](https://github.com/bigledger)
- **The product itself:** [akaun.com](https://akaun.com/)

If a page in this section tells you to call something that does not answer, that is a bug in the
documentation and we want to hear about it.
