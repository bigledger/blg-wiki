---
date: 2026-09-06
unpublished_from: content/en/developers/sdks.md
url: /developers/sdks/
tier: 1
mechanism: draft
reason: 'Lists six SDKs whose packages all 404; omits the four SDKs that exist.'
evidence:
  - "npm 404 for all six documented packages"
  - "refs/ holds akn-kmp-sdk, akn-kotlin-sdk, akn-kotlin-sdk-mobile-lib and others"

salvage: 'The real SDK list is in the audit.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/sdks.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
