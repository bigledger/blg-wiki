---
description: Build a BigLedger applet from an empty directory - toolchain, the custom element, routing, session context, the API client, the bundle, and the registration hand-off.
tags:
- applet-development
- angular
- getting-started
title: Getting Started
weight: 10
---

This page takes you from an empty directory to an applet bundle that BigLedger's shell can load
and mount inside a tenant. It assumes you are comfortable with Angular and the Angular CLI.

Read [Applet Development](/developers/applets/) first if you have not: two of the eight steps
below are hand-offs to BigLedger rather than things you can do yourself, and it is better to know
that before you start.

## Before you start

**You need, and can get yourself:**

- Node.js and the Angular CLI. Angular **11 through 15** — that is the window the API client
  library declares as its peer dependency range (`@angular/core: >=11 <16`). BigLedger's own
  applets sit at Angular 11 and Angular 14. No BigLedger applet repository pins a Node version -
  neither an `engines` field nor an `.nvmrc` - so use the Node release your chosen Angular major
  supports.
- An HTTPS location to serve a static JavaScript file from, readable by a browser with no
  credentials.

**You need, and only BigLedger can give you:**

- A **registration record** for your applet in the platform registry (step 7).
- A **tenant** to install it into, and a user account in that tenant.
- **Permission codes**, if your applet needs any beyond the defaults.

Ask for all three at [developers@bigledger.com](mailto:developers@bigledger.com).

{{< callout type="info" >}}
**There is no applet CLI and no scaffolding generator.** Any documentation you find referring to
`@bigledger/applet-cli`, `@bigledger/applet-sdk` or `@bigledger/ui-components` is describing
packages that do not exist. The two packages that do exist are `blg-akaun-ts-lib` and
`blg-akaun-ng-lib`, both on the public npm registry.
{{< /callout >}}

---

## Step 1: Create the workspace

Standard Angular CLI, nothing BigLedger-specific yet.

```bash
ng new my-applet --routing --style=scss
cd my-applet
```

Then add the three things every applet needs:

```bash
npm install @angular/elements
npm install blg-akaun-ts-lib blg-akaun-ng-lib
npm install --save-dev @angular-builders/custom-webpack concat fs-extra
```

- `@angular/elements` turns your root component into a custom element.
- `blg-akaun-ts-lib` is the API client — typed services, one per resource.
- `blg-akaun-ng-lib` is the Angular component library BigLedger's applets use. Optional; the
  client library does not depend on it.
- `@angular-builders/custom-webpack`, `concat` and `fs-extra` are for the bundle step (step 6).

Match the major version of `@angular/elements` and `@angular-builders/custom-webpack` to your
Angular major. A BigLedger applet on Angular 14 uses `@angular/elements ^14.3.0` and
`@angular-builders/custom-webpack ^14.0.0`.

## Step 2: Define the custom element

The shell does not bootstrap your application. It injects a `<script>` tag for your bundle and
expects that loading it registers a custom element with a specific name, then it mounts that
element. So your root module registers the element itself and does nothing on bootstrap.

Two details are not obvious and both are load-bearing:

- **The element name carries a per-launch suffix.** Before loading your bundle the shell writes
  an 8-digit number into `sessionStorage` under the key `randomNumber`, and mounts
  `<your-tag-NNNNNNNN>`. You must define your element under that same suffixed name. This is how
  the shell keeps two applets — or two launches of the same applet — from colliding over one
  custom-element name, which the browser allows to be registered only once.
- **Your `index.html` placeholder has to be renamed at runtime**, because you wrote it before you
  knew the suffix.

`src/index.html`:

```html
<body>
  <my-applet-elements id="customtag"></my-applet-elements>
</body>
```

`src/app/app.module.ts`:

```typescript
import { Injector, NgModule } from '@angular/core';
import { createCustomElement } from '@angular/elements';
import { RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { AppRoutes } from './app.routing';

@NgModule({
  declarations: [AppComponent],
  imports: [
    // ...
    RouterModule.forRoot(AppRoutes, { useHash: true })
  ]
})
export class AppModule {
  constructor(private injector: Injector) {
    const tagName = 'my-applet-elements-' + sessionStorage.getItem('randomNumber');
    if (!customElements.get(tagName)) {
      const el = createCustomElement(AppComponent, { injector: this.injector });
      customElements.define(tagName, el);
      if (document.getElementById('customtag')) {
        this.changeTagName(document.getElementById('customtag'), tagName);
      }
    }
  }

  changeTagName(el, newTagName) {
    const n = document.createElement(newTagName);
    const attr = el.attributes;
    for (let i = 0, len = attr.length; i < len; ++i) {
      n.setAttribute(attr[i].name, attr[i].value);
    }
    n.innerHTML = el.innerHTML;
    el.parentNode.replaceChild(n, el);
  }

  ngDoBootstrap() {}
}
```

`ngDoBootstrap()` must be present and empty, and `@NgModule` must have no `bootstrap` array.
Every BigLedger applet is written exactly this way.

**Most common failure:** you register `my-applet-elements` without the suffix. The bundle loads,
no error appears in the console, and the shell shows an empty page — the browser silently ignores
an unknown element name.

## Step 3: Route under your own prefix

Your applet's routes live under a single prefix, and that prefix must be the same string
BigLedger records as your **Applet Router**. The shell rewrites its own route table to that
string and then navigates to it; if the two differ, your applet loads and immediately falls
through to its own wildcard route.

`src/app/app.routing.ts`:

```typescript
import { Routes } from '@angular/router';

export const mainPath = 'applets/acme/my-applet';

export const AppRoutes: Routes = [
  {
    path: mainPath,
    children: [
      { path: 'home', component: HomeComponent },
      { path: '', redirectTo: 'home', pathMatch: 'full' }
    ]
  },
  { path: '**', redirectTo: mainPath, pathMatch: 'full' }
];
```

Keep the prefix in one exported constant. You will quote it verbatim in step 7.

Routing uses the **hash** location strategy (`useHash: true`, step 2), because the shell owns the
page URL and the applet owns the fragment.

## Step 4: Read the session the shell gave you

The shell writes the session into browser storage before your bundle loads. Read it; do not try to
obtain it yourself.

| Key | Store | What it is |
|---|---|---|
| `randomNumber` | `sessionStorage` | The per-launch element-name suffix (step 2) |
| `tenantCode` | `sessionStorage` | The tenant this launch is scoped to |
| `routerLink` | `sessionStorage` | The route prefix the shell navigated to |
| `es_module_url` | `sessionStorage` | The URL your bundle was loaded from |
| `appletMFTag` | `sessionStorage` | The resolved element tag, suffix substituted |
| `authToken` | `localStorage` | The signed-in user's bearer token |

`authToken` is in **local** storage; everything else is in **session** storage.

## Step 5: Call the API

Every service in `blg-akaun-ts-lib` takes an *API visa* as its last argument — a small object
carrying the host, the tenant and the token. Build it from the values in step 4.

`src/app/api-visa.ts`:

```typescript
import { ApiVisa } from 'blg-akaun-ts-lib';
import { environment } from '../environments/environment';

export class AppConfig {
  static readonly apiVisa: ApiVisa = {
    tenantCode: sessionStorage.getItem('tenantCode'),
    api_domain_url: environment.api_domain,
    jwt_secret: localStorage.getItem('authToken')
  };
}
```

`src/environments/environment.prod.ts`:

```typescript
export const environment = {
  production: true,
  api_domain: 'https://api.akaun.com/',
  master_tenant_code: 'akaun_master'
};
```

Then inject a service and call it. The library builds the URL and the headers; you never assemble
either by hand:

```typescript
import { CompanyService } from 'blg-akaun-ts-lib';
import { AppConfig } from '../api-visa';

@Component({ /* ... */ })
export class HomeComponent implements OnInit {
  constructor(private companyService: CompanyService) {}

  ngOnInit() {
    this.companyService.get(AppConfig.apiVisa)
      .subscribe(response => console.log(response.code, response.data));
  }
}
```

Each service exposes the same shape against one resource — `get`, `getByGuid`, `getByCriteria`,
`post`, `put`, `delete`, and a `…Promise` variant of most of them — plus whatever extra methods
that resource has. Responses are `{ code, message?, data? }`, where `code` is a platform response
code rather than an HTTP status. Which calls succeed depends on the permissions granted to the
signed-in user, not on your applet.

See [Applet Structure](/developers/applets/applet-development/#reaching-the-api) for the URL and
header shape the library produces, and for what the different access endpoints mean.

## Step 6: Build one bundle

The shell loads exactly one JavaScript file. An Angular production build produces four, so the
build is two commands: compile, then concatenate.

**First**, give the build a custom webpack configuration so your bundle's internal globals do not
collide with the shell's or with another applet's. Create
`my-applet-webpack.config.js` at the project root:

```javascript
module.exports = {
  output: {
    chunkLoadingGlobal: 'webpackJsonpMyApplet',
    library: 'myapplet'
  }
};
```

On Angular 11 (webpack 4) the key is `jsonpFunction` rather than `chunkLoadingGlobal`. Both
values must be unique across every applet a tenant might load at once.

Point `angular.json` at it, switching the builder:

```json
"build": {
  "builder": "@angular-builders/custom-webpack:browser",
  "options": {
    "customWebpackConfig": {
      "path": "my-applet-webpack.config.js",
      "mergeStrategies": { "externals": "replace" }
    }
  }
}
```

Set `"vendorChunk": false` and `"namedChunks": false` in your production configuration, so the
build emits the four files the next step expects and no others.

**Second**, compile with hashing turned off:

```bash
ng build --configuration=production --project=my-applet --output-hashing none
```

`--output-hashing none` is not optional. Production configurations normally set
`"outputHashing": "all"`, and the concatenation step below names its inputs literally.

**Third**, concatenate. Create `elements-build.js`:

```javascript
const fs = require('fs-extra');
const concat = require('concat');

(async function build() {
  const files = [
    './dist/my-applet/runtime.js',
    './dist/my-applet/polyfills.js',
    './dist/my-applet/scripts.js',
    './dist/my-applet/main.js'
  ];

  await fs.ensureDir('./elements/my-applet');
  await concat(files, './elements/my-applet/my-applet-elements.js');
  await fs.copyFile('./dist/my-applet/styles.css', './elements/my-applet/styles.css');
})();
```

```bash
node elements-build.js
```

The order matters: `runtime`, `polyfills`, `scripts`, `main`. Two adjustments:

- `scripts.js` is emitted only if your `angular.json` build options declare a non-empty `scripts`
  array. If yours is empty, drop that line.
- On Angular 11 with a differential build the polyfills file is `polyfills-es5.js`.

You now have `elements/my-applet/my-applet-elements.js` and a `styles.css` beside it.

## Step 7: Host the bundle, then hand it over

Upload `my-applet-elements.js` to any HTTPS location a browser can fetch with no credentials, and
note the full URL. BigLedger's own applets are served as public static files; there is nothing
special about the hosting.

Give the URL a stable path and treat every release as an overwrite of it: the registration record
holds one URL, and every tenant with your applet installed picks up whatever is at that URL on
their next launch. Keep your own copy of the previous bundle so you can roll back by re-uploading
it.

Then send BigLedger the registration values:

| Value | Example | Comes from |
|---|---|---|
| Applet Name | `My Applet` | you |
| Applet Code | `myApplet` | you — no spaces |
| Applet Short code | `MA` | you — exactly two characters, no spaces |
| Applet Router | `applets/acme/my-applet` | step 3, verbatim |
| Custom Element Tag | `my-applet-elements-` | step 2, **without** the suffix |
| ES Module Url | `https://…/my-applet-elements.js` | this step |
| Required Permissions | permission codes, if any | you |
| Description, icon | optional | you |

The suffix placeholder is added for you when the record is created — supply the bare tag with its
trailing hyphen.

{{< callout type="warning" >}}
**This step is a hand-off and there is no way around it.** The registration record lives in
BigLedger's platform registry, is created through an internal administration applet, and no public
API issues one. Until it exists and your applet is installed into a tenant, nothing can launch it.
Contact [developers@bigledger.com](mailto:developers@bigledger.com).
{{< /callout >}}

## Step 8: Confirm it works

Sign in to the shell at [akaun.com](https://akaun.com/) as a user in the tenant your applet was
installed into, and launch it. In four checks:

1. **The bundle loaded.** In the browser's network panel, your `…-elements.js` returns 200.
2. **The element mounted.** In the elements inspector, the page contains
   `<my-applet-elements-NNNNNNNN>` — with an 8-digit suffix — and it has children.
3. **The route resolved.** The address bar's fragment starts with your Applet Router value.
4. **The API answered.** Your step 5 call returns data for the tenant you signed in to, not an
   authorisation error.

If check 1 passes and check 2 fails, the element name is wrong — compare
`sessionStorage.getItem('appletMFTag')` in the console against the name you registered. If checks
1 and 2 pass and 3 fails, your route prefix and the registered Applet Router differ.

## Where this leaves you

You have an applet that loads, mounts, routes and reads tenant data. What you do not have, and
what BigLedger's own applets get from an internal shared library that is not published:

- the standard applet page layout, header and sidebar,
- the standard Settings and Permissions screens,
- the shared grid, picker and search components.

Build your own, or do without them. [Applet Structure](/developers/applets/applet-development/)
covers what those screens do and how the platform expects an applet to expose settings and
permissions, so that what you build fits.

## Related documentation

{{< cards >}}
{{< card link="/developers/applets/applet-development/" title="Applet Structure" icon="cube" subtitle="Project layout, the full runtime contract, settings, permissions and release." >}}
{{< card link="/developers/api-reference/" title="API Reference" icon="book-open" subtitle="The HTTP surface behind the client library." >}}
{{< card link="/developers/platform-library/" title="Platform Library" icon="server" subtitle="A different job: building a backend application on the BigLedger Java libraries." >}}
{{< /cards >}}
