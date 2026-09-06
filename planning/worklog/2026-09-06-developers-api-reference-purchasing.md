---
date: 2026-09-06
unpublished_from: content/en/developers/api-reference/purchasing.md
url: /developers/api-reference/purchasing/
tier: 1
mechanism: draft
reason: '10 real endpoints under 28 fabricated ones — the mix is worse than either, because a reader cannot tell them apart.'
evidence:
  - "akaun-api Core2Config.java:19-90 — every mapping is served under /core2/"
  - "17,256 resolved Spring mappings, 11,180 unique paths; zero match /api/v1"
  - "planning/reviews/2026-09-06-developers-section-audit.md — per-page endpoint counts"

salvage: 'The 10 verified endpoints; listed in the audit.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/api-reference/purchasing.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
