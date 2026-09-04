---
status: accepted
date: 2026-09-05
discussion: ../discussions/2026-09-05-translations-zh-ms-ar.md
---

# ADR-0003: Translate user manuals first; support Chinese, Malay and Arabic equally; Malay means Bahasa Melayu

## Context

Translation effort had gone into applet reference docs (zh 62, ms 12) while the user
manuals a clerk actually reads had two Chinese pages and zero Malay. Thirty `zh/applets/`
pages were orphaned by an earlier English move. Three Malay pages contained Indonesian.
Arabic had 7 stub files.

## Decision

1. **Priority:** `user-guide/processes/`, `setup/`, `getting-started/` first, in zh and ms
   (and ar). Applet reference is translated last, if at all — the UI and field names are English.
2. **Arabic is a supported language on equal footing with zh and ms** (Vincent's call).
   It stays enabled; it follows the same priority order.
3. **Malay is Bahasa Melayu (Malaysia).** The Indonesian-word blocklist in CLAUDE.md is
   enforced by a lint on `content/ms/`.
4. **Translations move with their English twin** in the same commit, with their own aliases.
   A parity test fails the build on any zh/ms/ar file without an English counterpart at the
   same path.

## Consequences

- Fix the 30 `zh/applets/` orphans and the 3 Indonesian-contaminated ms files (batches).
- `tests/translation-parity.sh` and `tests/malay-lint.sh` join `run-all.sh`.
- The restructure spec carries a zh/ms/ar row per move.

## Alternatives rejected

- Disable Arabic until there is a reader — Claude's recommendation; Vincent chose to support it.
- Continue translating applet reference first — the reverse of reader value.
- Freeze translations during the restructure — leaves the orphan problem in place.
