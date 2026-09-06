---
topic: unified-contact-center
aliases: [UCC, contact centre, omnichannel inbox, task queue, task router]
applets: [UnifiedContactCenter]
modules: [crm-digital]
related: [task-routing, crm-contacts, shopping-cart, e-invoice-request, membership, platform-permissions]
wiki:
  - content/en/applets/crm/unified-contact-center-ucc-applet.md
status: growing
updated: 2026-09-06
---

# Unified Contact Center

BigLedger's contact-centre desk. Inbound messages on twelve kinds of channel arrive in one inbox,
each becomes a task, and a rule engine routes that task to a team or an agent. The agent answers
beside the customer's CRM record, cart, transaction history and e-invoice details.

## Facts

- 2026-09-06 — Two registry rows are ACTIVE with names beginning *Unified Contact Center*.
  `UnifiedContactCenter` (2021) mounts at `applets/tnt/ailedger/ucc` and holds the wiki
  `documentation_url`; the second is marked internal-tool in the exclusions list and mounts at
  `…/uccjava`. The route is declared as `mainRoute` in each repo's `shared.module.ts`.
  [src:git:alg-applets-ucc@adc3915e1] [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-06 — The documented applet's repository has not moved since 2026-04-01; its last commit is
  the cut-over to the newer implementation. [src:git:alg-applets-ucc@adc3915e1]
- 2026-09-06 — Twelve channel types are declared: WHATSAPP, TELEGRAM, SMS, FB_MESSENGER, EMAIL,
  VOICE, LAZADA, WEB, SHOPEE, INSTAGRAM_FEED, INSTAGRAM_CHAT, LINE. The shared ts-lib copy of the
  same enum omits INSTAGRAM_FEED. [src:alg-applets-ucc/…/models/channel-constants.ts]
- 2026-09-06 — **Conversation data is not in PostgreSQL.** Conversations, messages, sessions,
  conversation events and tags, e-mails and threads, predefined messages, Facebook posts, lines,
  comments and reactions, voice calls, vouchers and Telegram group topics are stored in a per-tenant
  **MongoDB** database reached through `MongoTemplate`. Tasks, queues, agents, squads, skills,
  projects, rules, actions, virtual contacts, endpoints, template messages, QR codes and
  quality-control records are 55 `bl_alg_cc_*` tables in the tenant's PostgreSQL.
  [src:blg-akaun-platform-java/javasdk/…/alg/cc/cudServices/ConversationResourceService.java]
- 2026-09-06 — The Angular app's `models/firestore-models/` folder is a misnomer: those models are
  serialised over HTTP to `core2/tnt/dm/alg/cc/`. The only Firebase use is `AngularFireMessaging`
  for browser push, topic code `UCC_MESSAGE_RECEIVED`, and registration is skipped entirely when the
  tenant has no matching `bl_applet_notification_subscription_hdr` row.
  [src:alg-applets-ucc/…/app.module.ts] [src:alg-applets-ucc/…/app.component.ts]
- 2026-09-06 — Contacts created in UCC are rows in the shared CRM table `bl_crm_contact_hdr`, with
  `id_type` = the channel, `ref_5 = 'AI_LEDGER'` and a source whose `ds_code = 'AI_LEDGER'`. It is
  not a UCC-private address book. [src:alg-applets-ucc/…/phonebook/contacts/create-contact/create-contact.component.ts:149-164]
- 2026-09-06 — Teams are rows in the platform group table `app_mst_grp_hdr`, shared with the rest of
  the product. [src:alg-applets-ucc/…/configurations/teams/create-team/create-team.component.ts:79-84]
- 2026-09-06 — Contact merging is **manual**: a four-tab panel (Contact Hdr, Entity, Membership,
  Login Subject) in which an agent searches for and links a record. There is no automatic
  cross-channel identity algorithm. [src:alg-applets-ucc/…/inbox/customer-details/contact-merging/contact-merging.component.html]
- 2026-09-06 — 67 `CLIENT_SIDE_PERM` rows are seeded for `UnifiedContactCenter` in
  `bl_applet_client_side_perm_dfn`. That is unusual: most applets check codes that were never
  seeded. A code with no definition row can never be granted, because the granted list is fetched by
  subject and applet from that table and the selector tests membership.
  [src:akaun_master:bl_applet_client_side_perm_dfn] [src:alg-applets-ucc/…/client-side-permission.effects.ts:29-38]
- 2026-09-06 — Settings are applet-local, not the shared `FieldConfigurationComponent`. Exactly one
  setting passes all four proofs: `ISSUE_CATEGORY_CATEGORY_GROUP_SETTINGS_LIST`, eleven
  category-group slots each with a *Mandatory* flag, sourced from `bl_wf_issue_label_list_hdr` where
  `namespace = 'WF_CATEGORY'` and consumed by the Issue Tracker panel. `ISSUE_CODE_FORMAT` is
  declared and rendered nowhere. [src:alg-applets-ucc/…/settings-container/application-settings/application-settings.component.ts]
- 2026-09-06 — Task routing: rules for the task's queue and automation-rule set are fetched ordered
  by priority; the first match runs its action; if none match the automation rule's default rule
  runs; if that fails the fallback is "assign to any agent with the fewest tasks".
  [src:blg-akaun-platform-java/akaun-api/…/jobProcessor/alg/cc/SkillBasedTaskAssignmentProcessor.java:120-230]
- 2026-09-06 — Thirteen `ActionType` values are declared; the inbound executor implements nine.
  `ASSIGN_TO_TEAM`, `ASSIGN_TO_AVAILABLE_AGENT` and `CREATE_ISSUE` hit the default branch and the
  rule is treated as failed. The outbound executor supports **only** `ASSIGN_TO_TEAM`.
  [src:…/ruleEngine/SkillBasedActionExecutionService.java:54-80] [src:…/ruleEngine/OutboundActionExecutionService.java:190-205]
- 2026-09-06 — The back-end `TaskStatus` enum has five values (CREATED, TEAM_ASSIGNED,
  AGENT_ASSIGNED, COMPLETED, CANCELLED); the front end adds `IN-PROGRESS` and `UNASSIGNED`.
  [src:…/taskAssignment/TaskStatus.java] [src:alg-applets-ucc/…/models/task-constants.ts]
- 2026-09-06 — The task-expiry chain never completes: `ExpiredTaskQueueDeletionProcessor.processEvent`
  is entirely commented out behind a note that the code broke the platform. Nothing closes or
  deletes an expired task. [src:…/jobProcessor/alg/cc/ExpiredTaskQueueDeletionProcessor.java:31-39]
- 2026-09-06 — The Automation Rule create screen offers only two rule-set codes, while the
  skill-based processor's default look-up uses a third that the screen cannot create.
  [src:alg-applets-ucc/…/configurations/automation-rule/automation-rule-constants.ts:27-30]
  [src:…/SkillBasedTaskAssignmentProcessor.java:180]
- 2026-09-06 — Endpoint credentials are per provider: WhatsApp offers TWILIO, VONAGE and
  WHATSAPP_BUSINESS and requires an access id and auth token (the access id is labelled *WhatsApp
  Business Phone number ID* for the third); Telegram, SendGrid, Amazon SES, Lazada, Shopee and both
  Instagram providers need no access id or auth token; Web has no provider at all.
  [src:alg-applets-ucc/…/configurations/virtual-contacts/virtual-contact-constants.ts:116-131]
  [src:…/endpoints/create-endpoint/create-endpoint.component.ts:236-320]
- 2026-09-06 — The applet's own route guard returns `true` from both the success and the error path,
  so it never denies entry; applet access is a platform assignment.
  [src:alg-applets-ucc/…/guards/auth.guard.ts:24-36]

## How it connects

- **crm-contacts** — a UCC contact *is* a CRM contact (`bl_crm_contact_hdr`). Anything said about
  contact de-duplication, sources or ownership on the CRM side applies to conversations too.
- **task-routing** — the queue/rule/action engine here is the only rule engine of its shape in the
  product; it is not the workflow-design engine used by RMA and approvals.
- **shopping-cart** — a cart created inside a conversation is an ordinary cart; UCC posts nothing.
- **e-invoice-request** — the E-Invoice panel requests an e-invoice and reports its validation
  status; the document and the submission belong to the e-invoice applets.
- **membership** — one of the four things Contact Merging can link a conversation contact to.
- **platform-permissions** — UCC is the counter-example to the usual finding that client-side
  permission codes are never seeded. It shows the mechanism works when the rows exist.

## Open questions

- Which of the two ACTIVE registry rows customers actually run today, and whether the newer
  implementation is genuinely internal-only (raised as Q-0050).
- Whether the Mongo store is per-tenant by database or by collection prefix, and what the retention
  policy for conversation data is. Nothing read so far states it.
- What creates a task from an inbound message. The webhook receivers live in a separate lambda
  repository that was not read in this pass.

## Wiki impact

- `content/en/applets/crm/unified-contact-center-ucc-applet.md` — rewritten from these facts
  2026-09-06.
- `content/en/applications/unified-contact-center.md` — not yet checked; likely repeats the
  contact-merging and Task Router claims that were removed (F-0342).
- Any architecture or developer page that says tenant data lives in PostgreSQL needs the MongoDB
  qualification for contact-centre data.
