---
date: 2026-09-06
unpublished_from: content/en/developers/architecture/_index.md
url: /developers/architecture/
tier: 1
mechanism: draft
reason: 'States a Node.js/Express stack with Redis, Elasticsearch, Kubernetes, GraphQL and WebSocket, and claims SOC 2 Type II, ISO 27001 and GDPR compliance that nobody has evidenced.'
evidence:
  - "greps: Node/Express/Redis/Elasticsearch/Kubernetes/GraphQL all 0 hits in the backend"
  - "content/en/developers/architecture/_index.md:162-164 — the three compliance claims"

salvage: 'Nothing. The compliance claims need a sourced page or must not return.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/architecture/_index.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
