---
date: 2026-09-06
unpublished_from: content/en/guides/advanced/ (8), content/en/guides/roles/ (9), content/en/user-guide/demo/ (13), content/en/user-guide/{administration,basic-operations,daily-tasks,getting-started,reports-analytics}-v2/ (5)
url: /guides/advanced/, /guides/roles/, /user-guide/demo/, /user-guide/*-v2/
tier: 1 and 2
mechanism: draft
decided_by: Vincent, 2026-09-06
reason: "110 guide pages triaged — 13 sound, 34 needing correction, 63 substantially invented. These four folders carry the exposures and the unrecoverable material."
evidence:
  - "user-guide/demo/role-based/*/_index.md:119-121 — thirteen usernames and the shared password Demo2025! for demo-v1.bigledger.com, which is NXDOMAIN; 222 'Expected Result' assertions about a system nobody can open"
  - "guides/advanced/integration-best-practices.md:45-59 — asserted API integrations with Maybank, Public Bank, CIMB and others, seven payment gateways, a PCI DSS conformance narrative and GDPR compliance"
  - "guides/advanced/performance-optimization.md — ALTER SYSTEM, DROP TABLE, COPY … FROM PROGRAM and CREATE EXTENSION aws_s3 aimed at SaaS tenants, against a fabricated schema, plus MySQL and SQL Server settings for a PostgreSQL product"
  - "guides/roles/ — 500+ first-person requirements questions, zero answers, zero steps, zero menu paths; TntErpPermissions.java has no named-role construct and exactly 2 APPROVE verbs, neither about documents"
  - "user-guide/*-v2 — live and indexed but unreachable from navigation, behind a raw <script> redirect"
salvage: "The role *taxonomy* in guides/roles is a reasonable hub shape if it links to real pages instead of owning content (GPT's IA review said the same). The demo folder's module-by-module structure is sound once every credential and unverifiable assertion is removed. guides/advanced has no salvage."
to_rewrite: "roles/ returns as hub pages linking to verified guides, not as owning content. demo/ returns only if a demo tenant actually exists and someone owns its credentials. advanced/ should not return; write real integration and performance pages from source if they are wanted."
---

35 pages `draft: true`, in place, so the URLs are reserved. 123 inbound links repaired in the
same commit — 5 `-v2` links repointed to their live equivalents, 113 card and list entries
removed, 8 emptied card blocks collapsed. Nothing deleted.
