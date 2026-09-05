---
topic: emp-etl-sync
aliases: [EMP sync, ETL applet, legacy platform sync, EMPL synchronization, three-way matching]
applets: []
modules: [e-invoice]
related: [e-invoice-consolidation, e-invoice, e-invoice-submission-errors, doc-item-maintenance, customer-maintenance, internal-sales-credit-note-applet]
wiki: []
status: seed
updated: 2026-09-05
---

# Legacy-platform (EMP) to BigLedger ETL sync

A group of tenants still transact on the legacy Enterprise Management Platform (EMP) and have their documents, items and customers copied into BigLedger by an ETL process so that BigLedger can e-invoice them. That sync — not LHDN — is where their consolidated submissions fail first. No wiki page covers it today.

## Facts

- 2026-08-04 — ETL synchronisation identified as the primary failure point for consolidated submissions of synced tenants; proposal for three-way matching of document amounts across the legacy platform, BigLedger and the LHDN portal (valid, invalid and queued), replacing manual database and API checks. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-04 — Classification-code configuration was added on the legacy-platform side; the ETL reads that mapping from the source before syncing to BigLedger and LHDN, so classification is set at the source, not patched in BigLedger. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-04 — A reverse-document processor handles credit memos voided on the legacy platform: it generates a second document with negative values to negate the original, linked through the remarks field, and finds reversals by status fields and prefixes in the source database. Deployment to the customer tenant was the next step. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-18 — Eight priority ETL issues (data duplication, missing information); the ETL applet enhancement must handle every document-failure scenario — drafts, missing syncs — not only missing items. Synced tenants were excluded from the first automation wave for this reason. [src:gdrive:1ZouyeoW0cu0-7tl8l3vADWrZpuA9e0qyCXDQwSm6xdg]
- 2026-08-26 — Decision: when a synced document references an item BigLedger does not have, re-sync the item on the spot rather than substitute a dummy item code; a self-service data-synchronisation feature is under analysis. [src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA]
- 2026-09-01 — Several high-volume synced tenants added to the automation pilot specifically to surface sync problems early. [src:gdrive:1hMhWYLFK2em4cqdU-P4oNt-jTpklJBEGdtO6V02YlG4]
- 2026-09-03 — A processor now monitors unsynced documents and notifies both the ETL team and the customer; sync errors traced to customers with no state configured; zero unit costs on one tenant's reports and ~400,000 duplicate item rows on another were attributed to the sync method and cleaned up. [src:gmail:1a0663d23d98e303]

## How it connects

- **e-invoice-consolidation** — synced tenants were last in the rollout; their consolidation fails on missing documents and items before anything reaches LHDN.
- **e-invoice-submission-errors** — "document never appeared" and "posting failed on missing item / state" are the sync-side versions of the errors there.
- **doc-item-maintenance** — items must exist in BigLedger before a synced document can post; on-the-spot re-sync is the chosen remedy.
- **customer-maintenance** — a customer with no state cannot be synced/e-invoiced (state is mandatory in the LHDN address).
- **internal-sales-credit-note-applet** — voided source credit memos become a negating document rather than a deletion.

## Open questions

- Is the EMP→BigLedger sync something the public wiki should describe at all, or is it an internal service? → kb/questions/2026-09-05-emp-etl-sync-on-wiki.md

## Wiki impact

- None until the question above is answered; if yes, a short guide "E-invoicing documents synced from EMP" under einvoice-guides.
