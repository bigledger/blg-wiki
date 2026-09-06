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

---

## Resolved 2026-09-06 — rewritten from source and republished

`content/en/developers/webhooks.md` is live again, written from `WebhookService.java`, the three
webhook controllers and `WebhookTopics.java`, with the tenant-versus-master database behaviour
confirmed by query. The page now leads with the four absences rather than burying them.

Corrections to this entry's own notes, from the fuller read:

- The topic enum has **54** constants, not 53.
- The enum is a **seed list, not a constraint**. `populateTopicTable()` only inserts missing rows
  into `bl_webhook_topic_hdr`; dispatch is keyed on the free-text `topic_code`, and
  `POST /core2/tnt/dm/webhook-topic` accepts any code. Around sixty codes the platform actually
  fires are absent from the enum, so `populate-default` never seeds them.
- `BRANCH_DELTED` (`WebhookTopics.java:27`) is misspelled against the fired string
  `"BRANCH_DELETED"` (`BranchService.java:178`) — a seeded topic that can never fire.
- Beyond the missing HMAC and retry: **no alerting** (`notification_contact_json` is read and
  never used) and **no readable delivery log** — `GET /core2/tnt/dm/webhook-activity/query` passes
  `mstDbConn` where `/{guid}` passes `tntInfo.dbConn`, and the master copies of all three webhook
  tables hold 0 rows, so the listing is always empty.
- The webhook applet exists as a repo but still has **no `bl_applet_hdr` row** — confirmed against
  209 ACTIVE rows by `code`, `name` and `property_json`. The screen it offers also stores its
  "Web Hook Title" field in the `auth_header_name` column and never sets `auth_header_value`, so
  subscriptions created through it send no authentication header at all.

Filed as P-0033 through P-0037.

Evidence and citations: `planning/drafts/2026-09-06-datahub-integration-path.md`.
