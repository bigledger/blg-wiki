---
date: 2026-09-06
unpublished_from: content/en/applets/integrations/webhook-applet.md
url: /applets/integrations/webhook-applet/
tier: 1
mechanism: draft
reason: "Every quantified claim on the page is contradicted by the webhook engine in the backend — retries, OAuth/JWT, request signing, IP whitelisting, rate limiting, batching, transformation, 200+ event types, a 99.9% delivery guarantee and 90-day retention. None of it exists. The applet it describes also has no ACTIVE registry row (ADR-0002), so a reader cannot install it."
evidence:
  - "blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/WebhookService.java:16-52 — one HTTP POST per subscription on a fixed 4-thread pool with a 60s connect timeout; a failure is written to bl_webhook_activity_event and never retried. No retry policy exists anywhere in the class."
  - "…/WebhookService.java:120-128 (Subscription.fromDbRow) — authentication is exactly one custom header: auth_header_name + auth_header_value from the subscription row. No OAuth, no JWT, no request signing, no SSL pinning."
  - "blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/WebhookTopics.java — a fixed enum of 53 topics seeded per tenant by WebhookService.populateTopicTable, not '200+ supported event types'."
  - "…/WebhookService.java:20-50 — the event row is inserted and never purged; there is no retention job, so '90 days of event history' is invented in both directions."
  - "No event filtering, conditional routing, payload transformation or batching exists: callWebhooksAndLogResponses sends the same body to every subscription whose topic code matches."
  - "planning/private/registry-applets-2026-09-05.tsv and live bl_applet_hdr (checked 2026-09-06, incl. a property_json search for 'webhook' and 'web-hook'): no row for a Webhook applet under any name. The repo blg-applet-wavelet-web-hook-applet exists and is maintained (HEAD 5dcadf1, 2026-08-30) with route applet/tnt/wavelet/erp/web-hook-applet."
  - "Same finding, same evidence, already applied to the developer-facing twin: planning/worklog/2026-09-06-developers-webhooks.md."
salvage: |
  The subject is real and worth a page once the applet is registered:
  - Webhooks are a per-tenant subscription mechanism over three tables — bl_webhook_topic_hdr (the
    topic), bl_webhook_subscription_hdr (URL + optional single auth header + notification contact),
    bl_webhook_activity_event (one row per delivery attempt, holding sent_body, received_body and
    received_http_code, or the exception map when the call threw).
  - 53 topics are seeded into every tenant from the WebhookTopics enum, covering company, customer,
    supplier, employee, financial item, inquiry, branch, location, voucher, sales order, sales
    invoice, sales return, membership card/points/class, payment config and inventory events.
  - Topics can also be created by hand, which is the only way some backend call sites can ever fire:
    T2TItemToTenantLinkService raises T2T_ITEM_TO_TENANT_LINKING_ADDED / _UPDATED, and neither code
    is in the seeded enum, so those calls find no topic row and send nothing on a stock tenant.
  - Delivery is asynchronous on a 4-thread executor shared by the JVM; the caller does not wait and
    does not learn the outcome.
  - Creating a topic also writes a bl_webhook_topic_subscription_event row with the action
    WEBHOOK_TOPIC_<code>_HAS_BEEN_CREATED.
  - The built-but-unregistered applet's own routes are: web-hook (the working screen) plus the
    standard shared settings shell — default-selection, field-settings, printable-format-settings,
    webhook, feature-visibility and the four permission listings.
to_rewrite: |
  Only after the registry question is settled (Q-0021 — six maintained applets now have no ACTIVE
  registry row). If it is registered, write the applet page to planning/specs/applet-page-standard.md
  from blg-applet-wavelet-web-hook-applet plus WebhookService/WebhookTopics, using the salvage above.
  If it is not, the webhook mechanism belongs in the platform/developer documentation instead — but
  that area is being rebuilt separately and already has its own worklog entry
  (2026-09-06-developers-webhooks.md), so the two must be written together, not twice.
inbound_links_repaired:
  - content/en/applets/master-data/workflow-design-applet.md (3 references)
  - content/en/applets/integrations/developer-sysadmin-applet.md (4 references, incl. related_applets)
inbound_links_not_repaired:
  - "content/en/applets/applet-catalog.md:114,419 and its zh twin link to /applets/webhook-applet/, which the page never claimed as an alias — those links were already broken before this unpublish. Outside lane 4's editable folders; recorded in findings.md run 33."
---

The page text remains at `content/en/applets/integrations/webhook-applet.md` behind `draft: true`,
per ADR-0008 — the URL is reserved for the rewrite. Nothing was deleted.

---

## Addendum — 2026-09-06, fabricated-API sweep

The Chinese twin was left live when the English page was drafted.
`content/zh/applets/webhook-applet.md` (334 lines) carries the same invented claims —
自动重试 (automatic retry, `:37`), 多种认证方法（API 密钥、OAuth、JWT） (`:48`),
请求签名和验证 (request signing, `:49`), IP 白名单 (`:50`),
200+ 支持的事件类型 (`:82`), 99.9% 传递保证 (`:90`), 90 天事件历史 (`:92`) — every one of
which is contradicted by the same `WebhookService.java` / `WebhookTopics.java` evidence above.

It is now `draft: true` with the same reason. Note that it sits at a *different* relative path
from the English page (`zh/applets/…` vs `en/applets/integrations/…`), so it was already an orphan
for the language switcher and did not appear in a same-path twin check.

Inbound links repaired in the same commit:
- `content/zh/applets/tenant-admin-applet.md:198` — link removed
- `content/zh/applets/applet-catalog.md:100` — heading de-linked
- `content/zh/applets/applet-catalog.md:374` — link removed
