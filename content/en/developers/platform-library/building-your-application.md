---
description: Structure your application, add REST endpoints and services on top of the BigLedger platform, and run the result.
tags:
- developer-platform
- platform-library
- spring-boot
title: Building Your Application
weight: 20
---

Your application is an ordinary Spring Boot project that happens to have the whole BigLedger platform on its classpath. This page covers how to structure it, how to add your own functionality, and what you may and may not change.

## Project structure

Keep everything you write inside your own package. Nothing from BigLedger is copied into your repository.

```
your-api/
├── build.gradle.kts          # declares the BigLedger dependencies
└── src/main/java/com/yourcompany/
    ├── YourApplication.java  # the launcher
    ├── controller/           # your REST endpoints
    ├── service/              # your business logic
    └── config/               # your configuration
```

## The launcher

One class starts both platforms. Registering BigLedger's `WebserviceApplication` as a Spring source brings in every BigLedger controller, service and background queue; your own `@SpringBootApplication` class contributes everything in your package.

```java
package com.yourcompany;

import app.api.WebserviceApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

import java.util.Map;

@SpringBootApplication
public class YourApplication {

    public static void main(String[] args) {
        new SpringApplicationBuilder()
                .sources(WebserviceApplication.class, YourApplication.class)
                .properties(Map.of("server.port", 5000))
                .run(args);
    }
}
```

The application this produces serves the complete BigLedger API **and** your own endpoints from a single process.

## Adding a REST endpoint

Write a normal Spring `@RestController`. To run it with BigLedger's authentication, tenancy and permissions, wrap the body in `EndpointMethod.AuthenticatedTenantEndpoint` — the same handler BigLedger's own controllers use.

```java
package com.yourcompany.controller;

import app.api.core2.common.EndpointMethod;
import com.bigledger.core2.auth.AuthTokenFields;
import com.bigledger.core2.common.api.ApiResponse;
import com.bigledger.core2.common.api.constants.ResponseCodeConstants;
import com.bigledger.core2.common.ddd.TenantInfo;
import com.bigledger.core2.dal.util.DbConnection;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

@RestController
@RequestMapping("/core2/tnt/x-yourcompany/suppliers")
public class SupplierSummaryController {

    @GetMapping("/status-summary")
    public ResponseEntity<StreamingResponseBody> statusSummary(HttpServletRequest request) {

        EndpointMethod.AuthenticatedTenantEndpoint handler =
                (AuthTokenFields auth, TenantInfo tenantInfo, DbConnection masterDb) -> {

                    DbConnection tenantDb = tenantInfo.dbConn;

                    // Your logic here. You have the authenticated user, the tenant's
                    // database connection, and every BigLedger service and unit of work.

                    ApiResponse<String> response = new ApiResponse<>(
                            ResponseCodeConstants.OK_RESPONSE,
                            "Summary for tenant " + tenantDb.getTenantCode(),
                            "OK");

                    return ResponseEntity.ok()
                            .contentType(MediaType.APPLICATION_JSON)
                            .body(response.asStreamingResponse());
                };

        return handler.writeResponse(request);
    }
}
```

Inside the handler you receive:

| Object | What it gives you |
|---|---|
| `AuthTokenFields` | The authenticated user and their claims |
| `TenantInfo` | The current tenant, including `tenantInfo.dbConn`, its database connection |
| `DbConnection` (third parameter) | The master database connection |

## URL naming: use your own namespace

Your endpoints share a URL space with BigLedger's. To guarantee that a future BigLedger release never collides with a path you own, include a segment of the form `x-<yourcompany>` in every route you add.

```
/core2/tnt/x-yourcompany/suppliers/status-summary     ✅ safe forever
/core2/tnt/suppliers/status-summary                   ❌ may collide with a future release
```

BigLedger will never introduce a path segment beginning with `x-`.

{{< callout type="warning" >}}
If you map a route that exactly matches an existing BigLedger route and HTTP method, the application **fails to start** with an ambiguous mapping error. This is deliberate: it prevents a customer endpoint from silently replacing a platform one.
{{< /callout >}}

## Reusing BigLedger services

Everything the standard endpoints use is available to you. Domain services, units of work, table classes and containers can all be called directly, using the tenant `DbConnection` from your handler.

This is the recommended way to build features that combine BigLedger behaviour with your own: call the platform service, then apply your logic around the result, rather than reimplementing what the platform already does.

## Your own data

Tables you create belong to your application. Keep them in your own namespace so they are never confused with platform tables and never collide with a future BigLedger migration — for example prefix them `yc_` for "yourcompany".

Do not add columns to BigLedger tables. Many of them carry a `custom_field_json` column intended for exactly this purpose; use it for values that belong to an existing record.

## Changing existing behaviour

The current release supports **adding** to the platform. It does not provide published extension points for changing how existing BigLedger endpoints and services behave.

If you need built-in behaviour to work differently, your options today are:

1. **Compose instead of modify.** Add your own endpoint in your namespace that calls the same BigLedger services with your logic wrapped around them, and point your client at it. The built-in endpoint continues to exist and is unaffected.
2. **Talk to BigLedger.** Extension points — hooks in document lifecycles, query filters, and replaceable strategies — are on the roadmap. Requirements from customers determine which are built first, so tell your BigLedger contact what you need and why.

{{< callout type="info" >}}
Do not attempt to work around this by patching platform classes or shadowing them on the classpath. Anything built that way is unsupported and is likely to break on your next upgrade.
{{< /callout >}}

## Running your application

Your application needs the same database configuration a BigLedger deployment needs. BigLedger connects to the master database during startup, so these must be present before the application starts:

| Variable | Meaning |
|---|---|
| `DB_HOST` | Master database host |
| `DB_PORT` | Master database port |
| `DB_USER` | Database user |
| `DB_PASS` | Database password |
| `DB_NAME` | Master database name |

Build and run:

```bash
./gradlew bootJar
java -jar build/libs/your-api.jar
```

Your BigLedger contact provides the connection details for your development environment. Never point a development build at a production database.

## What success looks like

Start the application and call one of your own endpoints together with a standard BigLedger endpoint using the same authentication token. Both should respond from the same process. At that point you have a working BigLedger deployment with your own functionality inside it.

## Related documentation

- [Getting Started](/developers/getting-started/) — access and dependencies
- [Versioning & Upgrades](/developers/platform-library/versioning-and-upgrades/) — moving to a newer release
- [API Reference](/developers/api-reference/) — the endpoints your application inherits
- [Authentication](/developers/authentication/) — how requests are authenticated
