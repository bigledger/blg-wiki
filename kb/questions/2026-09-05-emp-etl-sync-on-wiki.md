---
status: open
raised_by: e-invoice email/Drive ingest, 2026-09-05
topics: [emp-etl-sync, e-invoice-consolidation]
who_can_answer: Vincent
---

# Should the public wiki describe the legacy-platform (EMP) → BigLedger ETL sync used for e-invoicing?

Several tenants e-invoice through BigLedger while transacting on the legacy platform; their documents arrive by ETL, and that sync is the first failure point for consolidation (missing items, drafts, missing state, duplicate items, voided credit memos) [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0] [src:gdrive:1ZouyeoW0cu0-7tl8l3vADWrZpuA9e0qyCXDQwSm6xdg] [src:gmail:1a0663d23d98e303]. The wiki has no page. Decision needed: document it (a short guide on what must be complete at the source and what the unsynced-document notification means), or keep it an internal service.

Checked: grep of content/en for EMP/ETL — only unrelated e-commerce and API pages.
