---
topic: ledger-and-journal-applet
aliases: [ledger and journal, L&J, journal transaction, general ledger applet, LedgerAndJournal]
applets: ["LedgerAndJournal"]
modules: [financial-accounting]
related: [gl-posting, chart-of-accounts, sub-ledger, financial-report, month-end, default-gl-codes, error-checking, journal-import]
wiki:
  - content/en/applets/finance/ledger-and-journal-applet.md
  - content/en/guides/accounting-guides/journal-entries.md
  - content/en/applets/finance/financial-report-applet.md
status: growing
updated: 2026-09-05
---

# Ledger And Journal applet

The General Ledger workspace: every FINAL document writes an AUTO journal here; accountants key MANUAL journals; ledgers and sub-ledgers are maintained; journals can be imported; Error Checking finds unbalanced or missing journals.

## Facts

- 2026-09-05 — Registry: code `LedgerAndJournal`, name "Ledger And Journal", TNT-USER, ACTIVE, documentation_url `/applets/finance/ledger-and-journal-applet/`. Page title changed from "Ledger and Journal Applet" to the registry name. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-wavelet-ledger-and-journal-applet` (last commit 2026-08-27). Menus: Journal Transaction, Sub Ledger, Ledger, Import Journal, Error Checking. Settings: Application Settings, Default Selection, Printable Format Settings (+ webhook, feature visibility, permissions, release notes, applet log). [src:.../models/menu-items.ts] [src:.../app.routing.ts]
- 2026-09-05 — Applet settings model has only DEFAULT_BRANCH, DEFAULT_COMPANY, DEFAULT_LEDGER, DEFAULT_CURRENCY, PRINTABLE, DISPLAY_JOURNAL_TRANSACTION_RUNNING_NUMBER; the Application Settings screen is applet-specific (not the shared field-configuration) with two switches: ALLOW_USER_TO_EDIT_AUTO_POSTED_JOURNAL and DISPLAY_JOURNAL_TRANSACTION_RUNNING_NUMBER ("DISPLAY RUNNING NUMBER"). [src:.../models/applet-settings.model.ts] [src:.../settings-container/application-settings/application-settings.component.ts]
- 2026-09-05 — One client-side permission: ALLOW_USER_TO_EDIT_AUTO_POSTED_JOURNAL; the listing also checks a permission named DISPLAY_JOURNAL_TRANSACTION_RUNNING_NUMBER. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:.../journal-listing/journal-listing.component.ts]
- 2026-09-05 — Create is disabled until Company, Currency, Ledger, Transaction Date are set, ≥1 line, debit total == credit total, total != 0; tooltip lists the unmet reasons. Journal edit locked when unbalanced or when auto_flag is AUTO and the setting is off. [src:.../journal-create/journal-create.component.ts] [src:.../journal-view/journal-view.component.ts]
- 2026-09-05 — Listing "Void"/delete calls `JournalService.delete` → DELETE /fi/journals/{guid} → `JournalUow.delete` (soft delete of hdr + lines). No reversing journal is created. Permanent delete endpoint exists (`/permanent/multiple/backoffice-ep`). [src:.../state-controllers/journal-controller/store/effects/journal.effects.ts] [src:blg-akaun-platform-java/akaun-api/.../JournalController.java] [src:blg-akaun-platform-java/javasdk/.../dal/uow/JournalUow.java]
- 2026-09-05 — Backend create: resolves the company's PRM ledger (`PRIMARY_LEDGER_NOT_EXIST` otherwise), creates a sub-ledger per GL code if missing, assigns tenant and company running numbers, validates "Journal not balanced: debit X != credit Y" ignoring soft-deleted lines, status ACTIVE. [src:blg-akaun-platform-java/javasdk/.../tenant/JournalService.java] [src:blg-akaun-platform-java/javasdk/.../validator/JournalDataConsistencyObject.java]
- 2026-09-05 — Error Checking tabs: Journal Not Balance, Missing Journal (Date From/To, Server Doc Type), Missing Journal Forex Gain Loss, Update Journal Remarks, Missing Credit Card Charge. [src:.../components/error-checking-container/]
- 2026-09-05 — Ledger types PRM / SEC (SECONDARY) / CONSOLIDATED; PRM flagged `isPrimary` in the view (protected). [src:.../ledger-container/ledger-view/ledger-view.component.ts]
- 2026-09-05 — Release notes: allow delete of auto-posted journals; Reference Number changed to text; sub-ledger hides void txns and BD/CD rows; Missing Journal for Cash Transfer; Missing Credit Card Charge tab; auto set debit/credit 0 on manual create. [src:.../settings-container/release-notes/release-notes.component.html]
- 2026-09-05 — Issues (anonymised): create button disabled despite complete form (balance/zero) [src:gh:bigledger/customer-repo-8ae0c8#481] [src:gh:bigledger/customer-repo-c9d39c#1786]; clone/update fails on lines with null amounts [src:gh:bigledger/customer-repo-f18431#947]; forex documents posted twice (source + shadow) [src:gh:bigledger/customer-repo-07a437#441]; imported journals not in monthly closing [src:gh:bigledger/customer-repo-ce5219#252]; "bd/cd" meaning [src:gh:bigledger/customer-repo-15f651#334]; sub-ledger listing empty for GL codes with data [src:gh:bigledger/customer-repo-15f651#429] [src:gh:bigledger/customer-repo-509138#247]; Update Journal Remarks empty when the journal is missing [src:gh:bigledger/customer-repo-f18431#220].

## How it connects

- **gl-posting** — JournalPostingTypeHandler decides Dr/Cr per document type; this applet is where the result is inspected.
- **chart-of-accounts / default-gl-codes** — missing mappings surface here as Missing Journal.
- **financial-report / month-end** — reports read balances after month-end processing, not raw journals.
- **sub-ledger** — auto-created per GL code/company/ledger by both automatic and manual posting.

## Open questions

- Does the Missing Journal "re-post" delete and rebuild, or only create when absent? (`createJournalGenDocRePosting` deletes then rebuilds — confirm the UI calls that endpoint.)
- Whether `SqlDeleteObject(..., true)` is a soft delete (status DELETED) — inferred from the DCO comment on soft-deleted lines; confirm in DbTableDao.

## Wiki impact

- `content/en/guides/accounting-guides/journal-entries.md` — check any statement that voiding a manual journal creates a reversing entry; it does not.
- `content/en/applets/finance/financial-report-applet.md` — cross-link to this page's month-end note.
