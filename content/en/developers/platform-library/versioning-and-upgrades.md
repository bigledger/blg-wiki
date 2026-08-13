---
description: How BigLedger platform releases are numbered, what each part of the version means, and how to upgrade safely.
tags:
- developer-platform
- platform-library
- versioning
- upgrades
title: Versioning & Upgrades
weight: 30
---

Taking a newer BigLedger release is a change to a version number in your build file. This page explains what the numbers mean and how to move between them without surprises.

## One version for the whole platform

`akaun-api`, `javasdk` and `client-sdk` are always released together and always carry the same version. "We are on BigLedger 1.0.0" is a single, checkable fact about your deployment.

Always keep them aligned. Mixing versions — for example `akaun-api:1.2.0` with `javasdk:1.0.0` — is not tested and not supported.

## What the numbers mean

Releases follow semantic versioning, `MAJOR.MINOR.PATCH`:

| Change | Example | What it means for you |
|---|---|---|
| **Patch** | `1.0.0` → `1.0.1` | Bug fixes only. Your code compiles and behaves the same. Safe to take promptly. |
| **Minor** | `1.0.0` → `1.1.0` | New capability, added without breaking anything. Your code still compiles. |
| **Major** | `1.0.0` → `2.0.0` | Something you may compile against has changed or been removed. Expect to make changes. |

A published version is never modified or replaced. Once `1.0.0` exists, its contents are fixed forever — a build that resolved it today resolves exactly the same bytes next year.

## Pin an exact version

Always depend on an exact version:

```kotlin
implementation("com.bigledger:akaun-api:1.0.0")
implementation("com.bigledger:javasdk:1.0.0")
```

Do not use dynamic versions such as `1.+` or `latest.release`. They make your build non-reproducible and can pull in a major upgrade without warning.

## How to upgrade

1. **Read the release notes** for every version between yours and the target, not just the newest one.
2. **Change the version** in your build file — both artifacts, to the same number.
3. **Build.** Compilation errors point at anything that moved; on a minor or patch upgrade there should be none.
4. **Test against a development database first.** A release may include database migrations that BigLedger applies at startup.
5. **Deploy.**

```kotlin
// Before
implementation("com.bigledger:akaun-api:1.0.0")
implementation("com.bigledger:javasdk:1.0.0")

// After
implementation("com.bigledger:akaun-api:1.1.0")
implementation("com.bigledger:javasdk:1.1.0")
```

There is no merge step, and no BigLedger source in your repository that could conflict.

{{< callout type="warning" >}}
**Database migrations run at startup and are not reversible.** Once a newer release has upgraded a database schema, an older application version may no longer run against it. Take a backup before upgrading a production environment, and never test a new release against a production database.
{{< /callout >}}

## What is stable and what is not

| Area | Stability |
|---|---|
| REST API paths and payloads | Stable within a major version |
| Table and container classes in `client-sdk` | Stable within a major version |
| Domain service and unit-of-work signatures | Stable within a major version, but subject to change at a major release |
| Anything not documented in this section | Internal — may change in any release |

The safest code depends on documented, public entry points. The more deeply you reach into internals, the more work a major upgrade becomes.

## Staying current

Take patch releases quickly — they carry fixes, including security fixes. Take minor releases on a regular cadence rather than saving several up. Plan major releases as a piece of work with time allocated for it.

The larger the gap between your version and the current one, the more expensive each upgrade becomes. Teams that upgrade every few weeks rarely spend more than minutes on it.

## Related documentation

- [Getting Started](../getting-started/) — access and dependencies
- [Building Your Application](../building-your-application/) — what you build on top
- [Troubleshooting](../troubleshooting/) — errors and current limitations
