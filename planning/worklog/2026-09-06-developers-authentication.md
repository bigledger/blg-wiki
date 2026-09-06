---
date: 2026-09-06
unpublished_from: content/en/developers/authentication.md
url: /developers/authentication/
tier: 2
mechanism: draft
reason: 'The bearer-token shape is correct and every detail around it is wrong: X-Company-Id, the blg_live_sk_ key format and the whole OAuth flow are invented.'
evidence:
  - "AuthenticationInterceptor.java:106,116 — bearer token accepted"
  - "WebMvcConfig.java:220 — two validators"

salvage: 'The bearer-token mechanism itself; the rewrite is small and fully knowable.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/authentication.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.

---

## Resolved 2026-09-06 — rewritten from source and republished

`content/en/developers/authentication.md` is live again. It is written entirely from
`blg-akaun-platform-java` and verified against the live API; nothing from the drafted text
survived. The mechanism was indeed real and every documented detail was indeed wrong:

| The old page said | The platform does |
|---|---|
| API keys `blg_live_sk_…` from Settings → API Keys | A 10-character `AccessId` and a 25-character `AccessKey`, minted at `POST /core2/platform/dm/identity/access-keys/login-ep` |
| OAuth 2.0 authorization code + PKCE, `auth.bigledger.com` | No OAuth of any kind. Two credentials only. |
| Access tokens expire in 1 hour, refresh-token exchange | RS256 JWT, **30 days**, no refresh endpoint |
| Ten named scopes, `admin` scope | No scopes. A key inherits its user's tenant permissions wholesale. |
| `X-Company-Id` header | `tenantCode` header |
| `api-sandbox.bigledger.com`, `blg_test_sk_` keys | No sandbox environment exists |
| IP whitelisting in the dashboard | No such feature |
| `GET /v1/auth/verify` | No such endpoint |
| Three official SDKs handling auth automatically | No published client library for this surface |

Deliberately **not** published: the platform also accepts a bare 25-character access key as a
`Authorization: Bearer` value. That path skips the expiry check and triggers a full-table
credential scan; documenting it would be publishing an attack. Filed as P-0031 and P-0032 instead.

Evidence and citations: `planning/drafts/2026-09-06-datahub-integration-path.md`.
