---
bookCollapseSection: true
cascade:
  type: docs
description: Build an applet for the BigLedger platform - the runtime contract, the toolchain, and what BigLedger has to issue before your applet can run.
tags:
- applet-development
- angular
- developer-platform
title: Applet Development
weight: 10
---

An applet is a self-contained web application that the BigLedger shell loads at runtime and
mounts inside its own page. Almost every screen a BigLedger user sees is an applet: Chart of
Account, Sales Invoice, Cashbook, Point of Sale. They are built, versioned and released
independently of the platform, and of each other.

This section documents how to build one.

{{< cards >}}
{{< card link="/developers/applets/getting-started/" title="Getting Started" icon="play" subtitle="From an empty directory to a bundle running inside a tenant." >}}
{{< card link="/developers/applets/applet-development/" title="Applet Structure" icon="cube" subtitle="The runtime contract, the API client, settings, permissions, packaging and release." >}}
{{< /cards >}}

## What an applet actually is

Three things, and nothing else:

1. **A JavaScript bundle** served from any HTTPS URL a browser can reach. It defines one
   [custom element](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements).
2. **A registration record** held by BigLedger, which tells the shell the bundle's URL, the
   element name to mount, and the route to mount it at.
3. **A contract about session state.** The shell puts the tenant code, the signed-in user's
   token and a per-launch instance number into browser storage before it loads your bundle. Your
   applet reads them from there.

Everything else — framework, state management, styling, build tooling — is your choice, with one
practical constraint: the official client library is an Angular library, so applets that use it
are Angular applications.

## The runtime contract

These are the four points where your code and the platform have to agree exactly. Get any one of
them wrong and the applet loads but never appears.

| # | Contract | Where it lives in your code | Where it lives in the registration |
|---|---|---|---|
| 1 | **Bundle URL** | your hosting | `ES Module Url` |
| 2 | **Custom element name** | `customElements.define(...)` in your root module | `Custom Element Tag` |
| 3 | **Route prefix** | the `path` of your top-level route | `Applet Router` |
| 4 | **Session keys** | `sessionStorage` / `localStorage` reads | set by the shell, not configurable |

[Applet Structure](/developers/applets/applet-development/) documents each one in full.

## What you need from BigLedger

Two steps in the path are not self-service. Plan for them before you start building.

{{< callout type="warning" >}}
**Registration is a hand-off.** The registration record lives in BigLedger's platform registry
and is created through an internal administration applet. You cannot create it yourself, and no
public API issues one. When your bundle is built and hosted, send BigLedger the four contract
values above plus an applet name, a two-character short code and the permission codes your applet
needs. Ask at [developers@bigledger.com](mailto:developers@bigledger.com).
{{< /callout >}}

{{< callout type="warning" >}}
**The shared applet chrome is not published.** BigLedger's own applets import a shared internal
Angular library for their page layout, sidebar, settings screens, permission screens and grid
helpers. That library is not on npm and not publicly readable. An external applet builds its own
equivalents, or does without them. Nothing in this section depends on it.
{{< /callout >}}

## What is public

| Thing | Where | Status |
|---|---|---|
| `blg-akaun-ts-lib` — the API client library | npm | Public, MIT |
| `blg-akaun-ng-lib` — Angular UI components used by applets | npm | Public, MIT |
| The API host | `https://api.akaun.com/` | Public |
| The shell | `https://akaun.com/` | Public, sign-in required |

## Related documentation

{{< cards >}}
{{< card link="/developers/platform-library/" title="Platform Library" icon="server" subtitle="Building a backend application on the BigLedger Java libraries - a different job from building an applet." >}}
{{< card link="/developers/api-reference/" title="API Reference" icon="book-open" subtitle="The HTTP surface your applet calls." >}}
{{< card link="/applets/" title="Applet Catalogue" icon="collection" subtitle="What the existing applets do, from a user's point of view." >}}
{{< /cards >}}
