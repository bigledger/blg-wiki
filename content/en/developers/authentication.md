---
title: Authentication
description: How an external system authenticates against the BigLedger API - access keys, tokens, the tenantCode header, and the exact error codes each failure returns.
weight: 10
tags:
- developers
- api
- authentication
- integrations
---

Every call to the BigLedger API carries two things: a credential, and the code of the tenant the
call applies to. This page documents both, the three credential shapes the platform accepts, and
the exact response code each failure returns.

If you are writing a server-to-server integration, the credential you want is an **access key**,
and [Integration → Getting Started](/developers/integration/getting-started/) walks you through
issuing one end to end.

## The two headers

| Header | Required | Value |
|---|---|---|
| `AccessId` + `AccessKey` | one credential is required | An access key pair (server-to-server) |
| `Authorization` | one credential is required | `Bearer <token>` (a signed-in user's token) |
| `tenantCode` | yes, on every tenant endpoint | The tenant you are addressing |

`tenantCode` is not part of the credential. It selects which customer database the request runs
against, and the same credential can be valid in more than one tenant. Endpoints under
`/core2/platform/` are not tenant-scoped and do not need it.

## Credential 1 — access keys (server-to-server)

An access key is a long-lived credential intended for processes that make many API calls. It is
the credential every BigLedger data integration uses.

A key has two halves:

| Half | Shape | Sent as |
|---|---|---|
| Access ID | 10 upper-case alphanumeric characters | `AccessId` header |
| Access key | 25 alphanumeric characters | `AccessKey` header |

```http
GET /core2/tnt/dm/erp/fi/fi-items/etl-ep/query?limit=100 HTTP/1.1
Host: api-etl.akaun.com
AccessId: 7K2QW9XR4M
AccessKey: p3Rt9mZ2vQ8hL5nD1sJ6kW4bA
tenantCode: your-tenant-code
```

Both header names are matched case-insensitively and in hyphenated form, so `AccessId`,
`AccessID`, `accessId`, `accessID` and `access-id` are all accepted, as are `AccessKey`,
`accessKey` and `access-key`. Pick one spelling and keep it.

### Issuing a key

Key issuance is self-service. You sign in as a normal user, and mint a key for that user.

```http
POST /core2/platform/dm/identity/access-keys/login-ep HTTP/1.1
Host: api.akaun.com
Authorization: Bearer <your user token>
Content-Type: application/json

{
  "label": "GadgetSphere Online order sync",
  "type": "",
  "validDateEnd": "2027-09-06T00:00:00+08:00"
}
```

```json
{
  "code": "OK_RESPONSE",
  "data": { "keyId": "7K2QW9XR4M", "keySecret": "p3Rt9mZ2vQ8hL5nD1sJ6kW4bA" },
  "message": ""
}
```

`keyId` is the `AccessId`; `keySecret` is the `AccessKey`.

{{< callout type="warning" >}}
**`keySecret` is shown once and never again.** It is stored hashed. If you lose it, delete the key
and issue another — there is no endpoint that reveals it.
{{< /callout >}}

{{< callout type="warning" >}}
**Always send `validDateEnd`.** If you omit it, the key is created with an expiry of
**31 December 9999** — in practice, a credential that never expires. Set a real date and diarise
the rotation.
{{< /callout >}}

### Managing your keys

| | |
|---|---|
| Issue a key | `POST /core2/platform/dm/identity/access-keys/login-ep` |
| List your keys | `GET /core2/platform/dm/identity/access-keys/login-ep` |
| Delete a key | `DELETE /core2/platform/dm/identity/access-keys/login-ep/{guid}` |

These three need only a valid user token — no extra permission. Delete only works on a key that
belongs to you.

The listing returns each key's record: `principal_id` (the access id), `principal_value` (your
label), the validity dates and the status. It does **not** return the secret — but it does return
the stored hash of it in `credential`, so treat the listing response as sensitive and do not log
it.

There is a second set of the same endpoints without the `/login-ep` segment. Those act on other
users' keys and require platform-level permissions you will not have as a customer or partner.
Use the `/login-ep` variants.

### What a key can do

**A key inherits the permissions of the user it was issued for. It has no scopes of its own.**

There is no per-key permission model, no read-only flag and no endpoint allowlist. The key
resolves to a login subject, and every endpoint then runs the same permission checks it would run
for that person signed in through the browser.

The practical consequence is the one rule worth building around:

{{< callout type="warning" >}}
**Create a dedicated integration user.** Do not mint keys against a finance manager's login.
Create a user whose only job is the integration, grant it exactly the permissions that integration
needs in the tenant, and issue the key against that user. When the integration is retired or the
key leaks, you disable one account and nothing else changes.
{{< /callout >}}

Granting those permissions is a job for a tenant administrator inside the product. It is not
something the API lets an integrator do for itself.

## Credential 2 — a signed-in user's token

Interactive clients — the BigLedger shell, applets, portal logins — carry a signed token in the
`Authorization` header.

```http
POST /core2/platform/dm/identity/login HTTP/1.1
Host: api.akaun.com
Content-Type: application/json

{ "email": "you@example.com", "password": "…" }
```

The response carries `authToken`, `subjectGuid`, `email`, `mobileNumber`, the entity links for
that login, and the per-applet tokens the shell needs:

```json
{
  "code": "OK_RESPONSE",
  "data": {
    "authToken": "eyJhbGciOiJSUzI1NiJ9…",
    "subjectGuid": "…",
    "email": "you@example.com",
    "mobileNumber": null,
    "data": [],
    "appletTenantTokenList": []
  },
  "message": ""
}
```

Send it as `Authorization: Bearer <authToken>`.

The token is an RS256-signed JWT and it **expires 30 days after issue**. Log in again to get a new
one; there is no refresh-token exchange. Because it expires and because it carries the full rights
of a human user, a token is the wrong credential for an unattended integration — use it to mint an
access key, then use the key.

The platform also accepts the token in a `jwtToken` cookie or a `jwtToken` query parameter. Both
exist for the browser shell. Do not use them from a server: a token in a query string ends up in
logs, proxies and browser history.

## Credential 3 — no credential

A small number of endpoints are deliberately open, and are marked with a `public-ep` access
endpoint or an equivalent path. Everything else requires one of the two credentials above.

## Which credential works where

The rule follows the first path segment, not the access endpoint:

| Endpoints under | Access key | User token |
|---|---|---|
| `/core2/tnt/…` and tenant-scoped `/core2/dm/…` | yes | yes |
| `/core2/platform/…` | only on the endpoints built for it | yes |

Within the tenant surface, both credentials are accepted on both `backoffice-ep` and `etl-ep`
variants of an endpoint; the two differ only in which credential they check first.

**Use `etl-ep` anyway.** It is the variant maintained for server-to-server callers, it is the one
the [Data API](/developers/integration/data-api/) documents, and building against
`backoffice-ep` means building against the surface the user interface moves around.

## Error codes

Responses carry a platform response code in `code` that is more specific than the HTTP status.
Match on `code`, not on the status.

| HTTP | `code` | What happened |
|---|---|---|
| 400 | `AUTH_TOKEN_OR_ACCESS_ID_WAS_NOT_PROVIDED` | No credential of any kind on a tenant endpoint |
| 400 | `AUTH_TOKEN_OR_ACCESS_KEY_WAS_NOT_PROVIDED` | `AccessId` sent without `AccessKey` |
| 401 | `CLIENT_AUTH_NO_TOKEN` | No credential on a platform endpoint |
| 403 | `AUTH_TOKEN_OR_INVALID_ACCESS_ID` | No key with that `AccessId` |
| 403 | `AUTH_TOKEN_OR_EXPIRED_ACCESS_ID` | The key's `validDateEnd` has passed |
| 403 | `AUTH_TOKEN_OR_ACCESS_ID_TOKEN_NOT_MATCHED` | Right `AccessId`, wrong `AccessKey` |
| 403 | `CLIENT_AUTH_INVALID_TOKEN` | The token is malformed, expired, or not signed by BigLedger |
| 403 | `CLIENT_AUTH_USER_NOT_AUTHORIZED` | Authenticated, but the user lacks the permission this endpoint needs |
| 400 | `CLIENT_TENANT_CODE_IS_EMPTY` | No `tenantCode` header on a tenant endpoint |
| 404 | `CLIENT_TENANT_CODE_DOES_NOT_EXIST` | The `tenantCode` is not a tenant |

Two of these are worth reading carefully:

- **`CLIENT_AUTH_USER_NOT_AUTHORIZED` is not an authentication failure.** Your credential was
  accepted. The user behind it does not hold the permission the endpoint requires. Fix it by
  granting the permission in the tenant, not by re-issuing the key.
- **The `AUTH_TOKEN_OR_` prefix** appears because the endpoint tried a token first, found none,
  and fell through to the access-key pair. The part after the prefix is the real reason.

Authentication is checked before the tenant code, so a request with a bad credential *and* a bad
`tenantCode` reports the credential problem first.

## Testing a credential

Any cheap authenticated `GET` will do. This one takes no parameters and returns a short list:

```bash
curl -s "https://api-etl.akaun.com/core2/tnt/dm/erp/gen-doc/etl-ep/server-doc-types" \
  -H "AccessId: $BLG_ACCESS_ID" \
  -H "AccessKey: $BLG_ACCESS_KEY" \
  -H "tenantCode: $BLG_TENANT_CODE"
```

A `200` with `"code": "OK_RESPONSE"` means the key, the tenant and the permission are all in
place.

If you get `SERVER_GENERAL_UNKNOWN_ERROR` with a message beginning *No static resource*, the path
is wrong — an unrecognised route returns `417`, not `404`. Check the spelling before you suspect
the credential.

## Handling credentials

- Keep the access key in a secret store or an environment variable. Never in source control, never
  in a URL.
- One key per integration, labelled so you can tell which is which in the listing.
- Set `validDateEnd` and rotate: issue the new key, deploy it, confirm traffic has moved, then
  delete the old one. Both work at once, so there is no cutover gap.
- Delete keys for integrations you have retired. An unexpired key is a live credential whether
  anything is using it or not.

## Related documentation

{{< cards >}}
{{< card link="/developers/integration/getting-started/" title="Integration: Getting Started" icon="play" subtitle="Sign in, issue a key and make your first data call, end to end." >}}
{{< card link="/developers/integration/data-api/" title="Data API" icon="server" subtitle="The server-to-server endpoints an access key is for - paths, paging, envelopes and limits." >}}
{{< card link="/developers/integration/" title="Integrate an external system" icon="link" subtitle="What the integration surface is, and where BigLedger has to hand you something." >}}
{{< /cards >}}
