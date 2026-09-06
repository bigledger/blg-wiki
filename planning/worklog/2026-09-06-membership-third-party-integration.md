---
date: 2026-09-06
unpublished_from: content/en/modules/membership/integration/third-party-integration.md
url: /modules/membership/integration/third-party-integration/
tier: 1
mechanism: draft
reason: "716 lines documenting a membership REST API and webhook system that does not exist. Every endpoint, every event name and the entire signature-verification scheme are invented, and the signature scheme is the opposite of what the platform does."
evidence:
  - "Invented endpoints: `GET /members/{id}`, `GET /members?email=…`, `POST /members`, `POST /webhooks`. The real membership resources are `/core2/tnt/dm/crm/membership-cards/etl-ep` and siblings; there is no `/members` route and no `/webhooks` route anywhere in the platform."
  - "Invented events: `member.created`, `member.updated`, `member.tier.changed`, `points.earned`, `points.redeemed`, `reward.claimed`, `points.expiring`. Real topics are UPPER_SNAKE and come from WebhookTopics.java — `MEMBERSHIP_CARD_CREATED`, `MEMBERSHIP_POINTS_TXN_CREATED`, `MEMBERSHIP_CLASS_CREATED`. Not one documented event name exists."
  - "Invented subscription shape: `{url, events[], secret, active}` posted to `/webhooks`. The real shape is a `bl_webhook_subscription_hdr` container with a single `topic_hdr_guid`, posted to `/core2/tnt/dm/webhook-subscription`. One topic per subscription; there is no events array and no `active` flag."
  - "Invented HMAC: the page's handler verifies an `x-webhook-signature` header against `crypto.createHmac('sha256', webhookSecret)`. `grep -cniE 'hmac|signature|retry|backoff' javasdk/.../domain/tenant/WebhookService.java` returns 0. There is no signature, no secret column and no signing key. A receiver written from this page rejects every genuine delivery."
  - "Same class of error as F-0286, on a page the developers audit did not reach because it sits under modules/, not developers/."
salvage: "Nothing in the API or webhook sections. The narrative framing of integration patterns (synchronous, asynchronous, batch) is generic and unattributed, and is not worth preserving."
to_rewrite: "If membership needs an integration page at all, it should be a short pointer to /developers/integration/ plus the membership resource paths under crm/. The generic API material now lives once, in /developers/integration/data-api/, rather than being restated per module."
---

The page text remains in place behind `draft: true`, per ADR-0008 — the URL is reserved.

Disproved while establishing the external-integration path (Q-0014). Full evidence and citations:
`planning/drafts/2026-09-06-datahub-integration-path.md`.
