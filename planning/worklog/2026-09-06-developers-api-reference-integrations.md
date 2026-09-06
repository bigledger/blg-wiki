---
date: 2026-09-06
unpublished_from: content/en/developers/api-reference/integrations.md
url: /developers/api-reference/integrations/
tier: 1
mechanism: draft
reason: 'Documents WooCommerce, Amazon, Stripe, QuickBooks and Xero connectors that do not exist, and omits Lazada (44 mappings), Shopee (47), TikTok and Magento, which ship.'
evidence:
  - "akaun-api Core2Config.java:19-90 — every mapping is served under /core2/"
  - "17,256 resolved Spring mappings, 11,180 unique paths; zero match /api/v1"
  - "planning/reviews/2026-09-06-developers-section-audit.md — per-page endpoint counts"

salvage: 'Nothing; the real connector list is the rewrite.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/api-reference/integrations.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
