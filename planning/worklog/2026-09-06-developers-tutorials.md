---
date: 2026-09-06
unpublished_from: content/en/developers/tutorials.md
url: /developers/tutorials/
tier: 1
mechanism: draft
reason: '1,255 lines of samples importing @bigledger/sdk, which 404s on npm.'
evidence:
  - "akaun-api Core2Config.java:19-90 — every mapping is served under /core2/"
  - "17,256 resolved Spring mappings, 11,180 unique paths; zero match /api/v1"
  - "planning/reviews/2026-09-06-developers-section-audit.md — per-page endpoint counts"
  - "npm registry: @bigledger/sdk returns 404; real applets use blg-akaun-ts-lib, which resolves"

salvage: 'The choice of tutorial topics is sound.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/tutorials.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
