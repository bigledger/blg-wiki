---
date: 2026-09-06
unpublished_from: content/en/developers/api-reference/sales.md
url: /developers/api-reference/sales/
tier: 1
mechanism: draft
reason: 'Documents endpoints under /api/v1/ that do not exist; 0 of the documented endpoints verified.'
evidence:
  - "akaun-api Core2Config.java:19-90 — every mapping is served under /core2/"
  - "17,256 resolved Spring mappings, 11,180 unique paths; zero match /api/v1"
  - "planning/reviews/2026-09-06-developers-section-audit.md — per-page endpoint counts"

salvage: 'The response-envelope shape is broadly right.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/api-reference/sales.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
