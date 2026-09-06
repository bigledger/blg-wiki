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
{{< card link="#integrate-an-external-system" title="Integrate an external system" icon="link" subtitle="Move data between your own system and BigLedger over HTTP." >}}
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

{{< callout type="warning" >}}
**This path is being rewritten.** An audit on 2026-09-06 found that most of the REST reference in
this section described endpoints that do not exist, and those pages have been unpublished rather
than left up. What remains below is verified against the platform source. The replacement
integration guide is in progress; until it lands, treat anything not linked from this page as
absent rather than as documentation you have not found.
{{< /callout >}}

What is verified and published today:

{{< cards >}}
{{< card link="/developers/api-reference/einvoice-api-reference/" title="E-Invoice API" icon="document-text" subtitle="Malaysian e-Invoice submission, cancellation, rejection, notifications and document queries. Verified endpoint by endpoint." >}}
{{< card link="/developers/api-reference/ucc/" title="Unified Communications API" icon="chat" subtitle="Conversations, messages, channels and endpoints for the communications module." >}}
{{< card link="/developers/automation-workflows/" title="Automation & Approvals" icon="cog" subtitle="How approvals and automated document flows work, including the approvals endpoints." >}}
{{< card link="/developers/platform-library/" title="Platform Library" icon="server" subtitle="A different job again: building a backend application that depends on the BigLedger Java libraries." >}}
{{< /cards >}}

### What is true about the API, in one paragraph

The API host is `https://api.akaun.com/`. Every endpoint sits under `/core2/`, and paths are
composed as `core2/{tnt|platform}/{dm|ms}/{module}/{resource}/{access-endpoint}` — for example
`core2/dm/companies/backoffice-ep`. The final segment selects the category of caller: `backoffice-ep`
for staff users working in the shell, `login-ep` and `login-entity-ep` for signed-in users and
external parties acting on their own records, `public-ep` where a resource is deliberately open,
and `etl-ep` for server-to-server integrations. Requests carry a bearer token in `Authorization`
and the tenant in a `tenantCode` header. Responses are `{ code, message, data }`, where `code` is a
platform response code rather than an HTTP status.

### What is not written yet

Integration credentials and how to obtain one; the `etl-ep` surface; webhooks; and a general REST
reference beyond the two modules above. If you need any of these now, ask rather than guess —
[developers@bigledger.com](mailto:developers@bigledger.com).

---

## Getting help

- **Developer contact:** [developers@bigledger.com](mailto:developers@bigledger.com)
- **Public repositories:** [github.com/bigledger](https://github.com/bigledger)
- **The product itself:** [akaun.com](https://akaun.com/)

If a page in this section tells you to call something that does not answer, that is a bug in the
documentation and we want to hear about it.
