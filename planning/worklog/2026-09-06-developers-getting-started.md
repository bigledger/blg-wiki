---
date: 2026-09-06
unpublished_from: content/en/developers/getting-started.md
url: /developers/getting-started/
tier: 1
mechanism: draft
reason: 'Signup flow, login, API-key format and base URL are all invented; every hostname is NXDOMAIN.'
evidence:
  - "akaun-api Core2Config.java:19-90 — every mapping is served under /core2/"
  - "17,256 resolved Spring mappings, 11,180 unique paths; zero match /api/v1"
  - "planning/reviews/2026-09-06-developers-section-audit.md — per-page endpoint counts"
  - "api.bigledger.com, sandbox-api.bigledger.com, auth.bigledger.com all fail to resolve; the real host is api.akaun.com"

salvage: 'The page structure is a reasonable outline for the rewrite.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/getting-started.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
