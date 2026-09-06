---
description: Diagnose build, authentication and runtime problems when developing against the BigLedger platform libraries, and understand current limitations.
tags:
- developer-platform
- platform-library
- troubleshooting
title: Troubleshooting
weight: 40
---

Common problems, what causes them, and current limitations you should design around.

## Access and download problems

### `401 Unauthorized` when resolving dependencies

Your token is missing, expired, or lacks the right scope.

- Confirm `gpr.user` and `gpr.key` are in your **user-level** `~/.gradle/gradle.properties`, not the project's copy
- Confirm the token has the **`read:packages`** scope
- Confirm the token has not expired

On a build server, check that `GITHUB_ACTOR` and `GITHUB_TOKEN` are reaching the build — a secret that is defined but not passed into the job produces exactly this error.

### `Could not find com.bigledger:akaun-api:1.0.0`

Either your account has no read access to the packages, or the version does not exist.

- Ask your BigLedger contact to confirm access has been granted to your account or team
- Check the version number for typos, and confirm the release exists
- Confirm the repository URL is exactly `https://maven.pkg.github.com/bigledger/blg-akaun-platform-java`

### The first build seems to hang

It is downloading. The BigLedger artifacts are roughly 90 MB before their dependencies. Later builds use the local cache.

## Compilation problems

### `cannot find symbol` on a BigLedger import

The most common cause is a missing `javasdk` dependency. `akaun-api` exposes `javasdk` at runtime scope only, so it is not on your compile classpath unless you declare it yourself:

```kotlin
implementation("com.bigledger:akaun-api:1.0.0")
implementation("com.bigledger:javasdk:1.0.0")   // required
```

If both are declared and the symbol is still missing, the class may be internal to the platform and not part of the published surface.

### Version conflicts with your own dependencies

The platform brings a large dependency tree, including Spring, Jackson, Guava and the AWS SDK. If one of your own libraries needs a different version of something, inspect the resolution first:

```bash
./gradlew dependencyInsight --dependency jackson-databind --configuration compileClasspath
```

Prefer aligning with the version the platform brings. Forcing a different version can produce failures at runtime that compile perfectly.

## Startup problems

### The application fails to start with an ambiguous mapping error

Two controllers are mapped to the same path and HTTP method — almost always one of yours colliding with a BigLedger route. Move your endpoint into your reserved namespace, for example `/core2/tnt/x-yourcompany/...`. See [URL naming](/developers/platform-library/building-your-application/#url-naming-use-your-own-namespace).

### The application fails to start with a database error

BigLedger connects to the master database during startup. Confirm `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASS` and `DB_NAME` are all set and reachable from where the application runs.

### Your beans are not picked up

Your `@SpringBootApplication` class must be at the root of your package tree so component scanning reaches your controllers and services, and it must be registered alongside BigLedger's application class:

```java
.sources(WebserviceApplication.class, YourApplication.class)
```

If only `WebserviceApplication` is listed, BigLedger starts but none of your code loads.

## Current limitations

These are known characteristics of the current release. Design around them rather than working against them.

### Some runtime features are unavailable

A small number of platform capabilities depend on libraries that cannot be expressed in published dependency metadata. In applications built on the platform libraries, these fail at **runtime**, although everything compiles normally:

- **Jasper-based printing and PDF templates** — depends on bundled font libraries
- **The Lazada marketplace integration** — depends on a bundled vendor SDK

This is a known gap and is being addressed. If your application needs either capability, raise it with your BigLedger contact before you build on it.

### No extension points for existing behaviour

You can add endpoints, services and data. You cannot change how existing BigLedger endpoints and services behave — there are no published hooks, filters or replaceable strategies in this release. See [Changing existing behaviour](/developers/platform-library/building-your-application/#changing-existing-behaviour) for the supported alternatives.

### Do not modify platform behaviour by other means

Patching platform classes, shadowing them on the classpath, or overriding them by package name may appear to work. It is unsupported, and it is likely to break without warning at your next upgrade. If you find yourself reaching for one of these, raise the requirement with BigLedger instead.

## Getting help

When reporting a problem, include:

- The platform version you are on, for example `1.0.0`
- The full error message and stack trace
- Your Java and Gradle versions (`java -version`, `./gradlew --version`)
- The relevant part of your build file
- Whether the problem occurs at dependency resolution, compilation, startup, or runtime

Please do not include tokens, passwords, database credentials or real customer data in a report.

## Related documentation

- [Getting Started](/developers/getting-started/) — access and dependencies
- [Building Your Application](/developers/platform-library/building-your-application/) — endpoints, services and data
- [Versioning & Upgrades](/developers/platform-library/versioning-and-upgrades/) — moving between releases
