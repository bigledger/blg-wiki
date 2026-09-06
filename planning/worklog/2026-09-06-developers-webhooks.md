---
date: 2026-09-06
unpublished_from: content/en/developers/webhooks.md
url: /developers/webhooks/
tier: 2
mechanism: draft
reason: 'The webhook mechanism is real, but all seven documented endpoints and both key behaviours are invented — it promises an HMAC signature and retries, and neither exists.'
evidence:
  - "WebhookService.java — 4-thread pool, HTTP POST, logged to bl_webhook_activity_event; no signing, no retry"
  - "WebhookTopics.java — a fixed enum of 53 topics, not free-form names"

salvage: 'The concept of subscribing to topics is right; the topic list is knowable from WebhookTopics.java.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/webhooks.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
