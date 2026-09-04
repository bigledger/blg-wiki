---
status: done
date: 2026-09-05
items: F-0017, F-0035, (F-0004 duplicate-title leftover)
decision: —
commit: (see git log — "Gate deploys on build, content lints, links and Playwright")
loop: unit 1
---

# Batch: quality gate on deploy

## Changes

- `.github/workflows/deploy.yml` — new `quality` job (Hugo build → `tests/content-lint.sh` →
  lychee offline gated on `tests/lychee-baseline.txt` → Playwright against a local Hugo server);
  `deploy` now `needs: quality`. Playwright report uploaded on failure.
- `tests/content-lint.sh` — conflict markers, leaked AI transcripts, "blockchain", Indonesian words
  in `content/ms`, mojibake, missing `title:`, duplicate H1. Allowlist-aware via
  `tests/lint-allowlist.tsv` (keys `malay`, `title`) so pre-existing debt ratchets down instead of
  blocking every deploy.
- `tests/lychee-gate.sh` + `tests/lychee-baseline.txt` (383) — fail only when broken links increase.
- `tests/run-all.sh` — runs the same lint and gate locally.
- Fixed on the way (mechanical): 57 mojibake sequences in `mm-deposit-applet.md` (F-0035); the
  duplicate H1 in `user-permission-manager.md`.

## What the lint found on first run (now tracked)

4 Malay pages with Indonesian words (F-0001..03, F-0037); 56 pages without a title (F-0036).

## Not done

- The allowlisted debt itself. Each batch that clears it deletes lines from the allowlist.
- WIP-banner lint (F-0020) — needs the policy decision first.
