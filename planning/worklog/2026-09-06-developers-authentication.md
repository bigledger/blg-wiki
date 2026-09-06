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
