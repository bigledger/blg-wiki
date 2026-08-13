---
description: Get access to the BigLedger platform libraries, configure your build, and verify your first successful build.
tags:
- developer-platform
- platform-library
- getting-started
title: Getting Started
weight: 10
---

This page takes you from no access to a project that compiles against the BigLedger platform. Allow about 30 minutes, most of which is your first dependency download.

## Step 1: Request access

The libraries are private. Ask your BigLedger contact to grant your GitHub account or team **read access** to the packages published by `bigledger/blg-akaun-platform-java`.

You will need to supply the GitHub username or organisation team that should be able to download them.

## Step 2: Create an access token

Once access is granted, create a personal access token on GitHub:

1. Go to **Settings → Developer settings → Personal access tokens → Tokens (classic)**
2. Select **Generate new token**
3. Enable only the **`read:packages`** scope
4. Set an expiry date
5. Copy the token — GitHub shows it once

{{< callout type="warning" >}}
**Never commit this token.** Store it outside your repository, as shown in the next step. A token committed to source control remains in the git history even after it is deleted.
{{< /callout >}}

## Step 3: Store your credentials

Put the token in your user-level Gradle properties file, which lives in your home directory and is never part of a project:

- **Windows:** `C:\Users\<you>\.gradle\gradle.properties`
- **macOS and Linux:** `~/.gradle/gradle.properties`

```properties
gpr.user=your-github-username
gpr.key=your-token
```

On a build server, supply the same values as the environment variables `GITHUB_ACTOR` and `GITHUB_TOKEN` instead, using your CI system's secret storage.

## Step 4: Configure your build

Add the BigLedger repository and dependencies to your project.

{{< tabs items="Gradle (Kotlin),Gradle (Groovy),Maven" >}}

{{< tab >}}
```kotlin
plugins {
    java
    id("org.springframework.boot") version "3.2.5"
    id("io.spring.dependency-management") version "1.0.15.RELEASE"
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

repositories {
    maven {
        name = "BigLedger"
        url = uri("https://maven.pkg.github.com/bigledger/blg-akaun-platform-java")
        credentials {
            username = System.getenv("GITHUB_ACTOR") ?: findProperty("gpr.user") as String?
            password = System.getenv("GITHUB_TOKEN") ?: findProperty("gpr.key") as String?
        }
    }
    mavenCentral()
    maven { url = uri("https://jitpack.io") }
    google()
}

dependencies {
    implementation("com.bigledger:akaun-api:1.0.0")
    implementation("com.bigledger:javasdk:1.0.0")
    implementation("org.springframework.boot:spring-boot-starter-web")
}
```
{{< /tab >}}

{{< tab >}}
```groovy
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.2.5'
    id 'io.spring.dependency-management' version '1.0.15.RELEASE'
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

repositories {
    maven {
        name = 'BigLedger'
        url = 'https://maven.pkg.github.com/bigledger/blg-akaun-platform-java'
        credentials {
            username = System.getenv('GITHUB_ACTOR') ?: project.findProperty('gpr.user')
            password = System.getenv('GITHUB_TOKEN') ?: project.findProperty('gpr.key')
        }
    }
    mavenCentral()
    maven { url 'https://jitpack.io' }
    google()
}

dependencies {
    implementation 'com.bigledger:akaun-api:1.0.0'
    implementation 'com.bigledger:javasdk:1.0.0'
    implementation 'org.springframework.boot:spring-boot-starter-web'
}
```
{{< /tab >}}

{{< tab >}}
In `pom.xml`:

```xml
<repositories>
  <repository>
    <id>bigledger</id>
    <url>https://maven.pkg.github.com/bigledger/blg-akaun-platform-java</url>
  </repository>
</repositories>

<dependencies>
  <dependency>
    <groupId>com.bigledger</groupId>
    <artifactId>akaun-api</artifactId>
    <version>1.0.0</version>
  </dependency>
  <dependency>
    <groupId>com.bigledger</groupId>
    <artifactId>javasdk</artifactId>
    <version>1.0.0</version>
  </dependency>
</dependencies>
```

And in `~/.m2/settings.xml`:

```xml
<servers>
  <server>
    <id>bigledger</id>
    <username>your-github-username</username>
    <password>your-token</password>
  </server>
</servers>
```
{{< /tab >}}

{{< /tabs >}}

{{< callout type="warning" >}}
**Declare `javasdk` explicitly, even though `akaun-api` already depends on it.** `akaun-api` exposes `javasdk` at runtime scope only, so without its own entry the core platform classes are not on your compile classpath, and imports such as `DbConnection` or `AuthTokenFields` will not compile.
{{< /callout >}}

## Step 5: Verify the libraries resolve

```bash
./gradlew dependencies --configuration compileClasspath
```

You should see all three artifacts, including `client-sdk`, which you never declared — it arrives automatically as a transitive dependency:

```
+--- com.bigledger:akaun-api:1.0.0
+--- com.bigledger:javasdk:1.0.0
     \--- com.bigledger:client-sdk:1.0.0
```

The first run downloads roughly 90 MB of BigLedger artifacts plus their dependencies, so allow several minutes. Later builds use your local cache.

## Step 6: Compile against the platform

Create a small class that uses a BigLedger type:

```java
package com.example;

import com.bigledger.core2.dal.model.FinancialDocContainers.GenericDocumentContainer;
import com.bigledger.core2.dal.table.bl_fi_generic_doc_hdr;

public class PlatformCheck {

    public static void main(String[] args) {
        bl_fi_generic_doc_hdr header = new bl_fi_generic_doc_hdr();
        header.setServer_doc_type("PURCHASE_ORDER");

        GenericDocumentContainer document = new GenericDocumentContainer(header);
        System.out.println("Document type: " + document.getBl_fi_generic_doc_hdr().getServer_doc_type());
    }
}
```

Then build:

```bash
./gradlew build
```

## What success looks like

Run the class. If it prints:

```
Document type: PURCHASE_ORDER
```

then your credentials work, the libraries resolved, and BigLedger platform classes are compiling and running inside your own application. You are ready to start [building your application](../building-your-application/).

## Common problems

| Symptom | Cause | Fix |
|---|---|---|
| `401 Unauthorized` | Token missing, expired, or without `read:packages` | Recreate the token with the correct scope and update your `gradle.properties` |
| `Could not find com.bigledger:akaun-api` | Your account has not been granted read access to the packages | Ask your BigLedger contact to grant access |
| `cannot find symbol` on a BigLedger import | The `javasdk` dependency is missing | Add the explicit `javasdk` entry described in Step 4 |
| The first build appears to hang | Roughly 90 MB is downloading | Wait; subsequent builds use the cache |

## Related documentation

- [Building Your Application](../building-your-application/) — add your own endpoints and services
- [Versioning & Upgrades](../versioning-and-upgrades/) — how to move to a newer release
- [Troubleshooting](../troubleshooting/) — errors and current limitations
