---
date: 2026-09-06
unpublished_from: content/en/developers/architecture/overview.md
url: /developers/architecture/overview/
tier: 1
mechanism: draft
reason: 'Describes microservices with Redis, Elasticsearch and Kafka; the backend is one Spring Boot deployable with JDBI/PostgreSQL and a PostgreSQL-table queue.'
evidence:
  - "greps across blg-akaun-platform-java: Elasticsearch 0, Redis 0, Kafka 0"

salvage: 'None identified.'
to_rewrite: "Rewrite from the live /core2/ route table. Never document a core1 route (ADR-0008, F-0288)."
---

The page text remains in place at `content/en/developers/architecture/overview.md` behind `draft: true`, per ADR-0008 — the URL is reserved for the rewrite.
