---
bookCollapseSection: true
cascade:
  type: docs
description: Build your own backend application on top of the BigLedger platform by depending on the published Java libraries.
tags:
- developer-platform
- platform-library
- java
- extending-bigledger
title: Platform Library
weight: 65
---

The BigLedger platform is published as a set of versioned Java libraries. Your application declares them as dependencies, gains every BigLedger capability, and adds your own logic beside it — without holding a copy of BigLedger source code.

{{< callout type="info" >}}
**This is not the REST API.** If you want to integrate an existing system with BigLedger over HTTP, use the [API Reference](/developers/api-reference/) or an [SDK](/developers/sdks/) instead. The platform library is for teams building a backend application that runs *as* a BigLedger deployment with extra behaviour of their own.
{{< /callout >}}

## What you get

{{< cards >}}
  {{< card link="/developers/platform-library/./getting-started/" title="Getting Started" icon="download" subtitle="Get access, add the dependency, and run your first build" >}}
  {{< card link="/developers/platform-library/./building-your-application/" title="Building Your Application" icon="code" subtitle="Add endpoints and services, and boot the platform" >}}
  {{< card link="/developers/platform-library/./versioning-and-upgrades/" title="Versioning & Upgrades" icon="refresh" subtitle="How releases are numbered and how to move between them" >}}
  {{< card link="/developers/platform-library/./troubleshooting/" title="Troubleshooting" icon="support" subtitle="Common errors and current limitations" >}}
{{< /cards >}}

## The libraries

Three artifacts are published under the `com.bigledger` group. They are released together and always share a version number.

| Artifact | Contains |
|---|---|
| `akaun-api` | The application layer — REST controllers, endpoint handling, request authentication, background queues |
| `javasdk` | The platform core — domain services, units of work, the data access layer, tenancy, permissions |
| `client-sdk` | Shared value types — table classes, containers, query criteria, DTOs |

`akaun-api` depends on `javasdk`, which depends on `client-sdk`, so a single declaration brings in the whole platform.

## How it works

Your application is a standard Spring Boot project. It declares the BigLedger libraries as dependencies and registers BigLedger's application class as a Spring source. At startup, your application serves **every BigLedger endpoint, plus every endpoint you have written yourself**, against the same databases, the same authentication, and the same tenant model.

Because BigLedger arrives as a compiled dependency rather than a branch of source code, upgrading is a version change. There is no merge, and no BigLedger file in your repository that could conflict with an upgrade.

## What you can build today

- **New REST endpoints** alongside the standard BigLedger API
- **New services, scheduled work, and integrations** that reuse BigLedger's domain layer
- **New tables and data** belonging to your application
- **Composition of existing BigLedger services** — call the same services the standard endpoints call, and wrap them in logic of your own

{{< callout type="warning" >}}
**Changing the behaviour of existing BigLedger endpoints is not supported in the current release.** Published extension points for altering built-in behaviour are on the roadmap. If your requirement depends on this, talk to your BigLedger contact before designing around it — see [Building Your Application](building-your-application/#changing-existing-behaviour).
{{< /callout >}}

## Requirements

| Requirement | Version |
|---|---|
| Java | 17 |
| Build tool | Gradle 8.x (recommended) or Maven |
| Spring Boot | 3.2.5 |
| Database | PostgreSQL, provisioned by BigLedger |
| Access | A GitHub account with read access to the BigLedger packages |

## Related documentation

- [Getting Started](getting-started/) — access and first build
- [Developer Platform](/developers/) — the wider developer documentation
- [API Reference](/developers/api-reference/) — the REST API served by the platform
- [Authentication](/developers/authentication/) — how BigLedger authenticates API requests
