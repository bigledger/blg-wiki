---
status: open
raised_by: developers-section audit, 2026-09-06
topics: [developers, api, infrastructure]
who_can_answer: platform / infrastructure owner
---

# What is the public API base URL, and does any gateway rewrite paths in front of it?

The wiki's developer section documents `https://api.bigledger.com/v1` (and
`sandbox-api.bigledger.com`, `api-sandbox.bigledger.com`, `auth.bigledger.com`,
`developers.bigledger.com`, `app.bigledger.com`). **All of those are NXDOMAIN in public DNS
as of 2026-09-06.** `api.akaun.com` resolves (56.69.230.99) and is the host hardcoded in
`refs/akn-kotlin-sdk` alongside `https://api-test.akaun.com/core2/dm/`.

Every one of the 17,256 Spring mappings in `blg-akaun-platform-java` sits under `/core2/`.
No servlet context-path is configured in the repo.

Needed before any API page is rewritten:
1. The canonical public base URL for third-party developers (and a sandbox, if one exists).
2. Whether any gateway/CDN in front of it rewrites a public prefix onto `/core2/…` — nothing
   in the repos suggests it, but the deployment config is outside them.
3. Whether the documented rate limit ("1,000 requests/hour per API key with burst support")
   corresponds to a real limiter at the edge. No rate-limiting code was found in the backend.
4. Whether `developers@bigledger.com` is monitored, and whether a developer console / API
   explorer / Postman collection exists anywhere (the `_index.md` cards point at a dead host).
