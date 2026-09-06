---
status: executed
date: 2026-09-07
executed: 2026-09-07
worklog: ../worklog/2026-09-07-modules-tree.md
answered: ../questions/answered/Q-0038-modules-vs-modules-v2.md
decided_by: Vincent, 2026-09-06 ("keep the URL as /modules/")
adr: ../decisions/0008-verify-or-unpublish.md
audit: ../reviews/2026-09-06-modules-duplication-audit.md
question: Q-0038
---

# Spec: consolidate `modules-v2/` into `/modules/`, in one commit

## The decision

`content/en/modules/` and `content/en/modules-v2/` are two trees documenting the same modules.
The audit settled which is correct, and I verified the headline independently:

| | `modules/` | `modules-v2/` |
|---|---:|---:|
| Pages (en) | 92 | 122 |
| Distinct `/applets/…` targets that do not resolve | **113 of 125** | **1 of 125** |
| Broken link instances | 206 | 11 → **0** after today's fixes |
| Pages with zero real applets behind them | 5 | 0 — already pruned |

Vincent chose: **`modules-v2/` content takes over the `/modules/` URLs in a single commit** — no
redirect hop, no later rename, and "v2" never appears in a public URL again.

## What makes this risky, stated plainly

214 files move at once, 364 links point at `/modules-v2/` and 406 at `/modules/`, `hugo.yaml`'s
main menu references `/modules-v2` in eleven places, and zh/ms/ar each carry five `modules/` pages
that Hugo pairs by path. **A page that moves without its links is the failure this repo keeps
repeating.** Hence the ordering below is not optional.

## Order of operations — one commit

1. **Migrate what `modules/` uniquely holds** (40 paths). Triage each into:
   - **carry forward** — content with no `modules-v2/` equivalent that is worth keeping and is not
     already better covered by a sourced applet page. The EcomSync fragments under
     `ecommerce/` and `claim-module/` are the main candidates.
   - **archive** — the five zero-applet pages (`it-ce`, `service-industry`, `drop-shipping`,
     `digital-crm`, and `erp`/`accounting`'s invented applet lists), `budgetary.md` (1,052 lines,
     1.0 MB, 35 base64-embedded screenshots, zero links — an applet manual in the module tree),
     and `cp-commerce/_index.md` (92% a widget catalogue that contradicts the sourced one).
   - **drop as duplicate** — `membership/configuration/` and `membership/getting-started/`, which
     duplicate the sourced `membership-admin-applet` page.
   Anything carried forward is checked against source before it moves; nothing is migrated on the
   strength of "it was there".
2. **Archive `content/en/modules/`** to `planning/archive/2026-09-07-modules-tree/`, with a
   worklog entry recording the counts above and what was carried forward.
3. **`git mv content/en/modules-v2` → `content/en/modules`**, preserving history.
4. **Rewrite every internal link**: `/modules-v2/` → `/modules/`, across `content/` (all four
   languages), `layouts/`, and `hugo.yaml`'s eleven `pageRef`s.
5. **Add `aliases:`** for the old `/modules-v2/…` URLs on their new `/modules/…` pages, so the 364
   existing `/modules-v2/` references and any external bookmarks redirect rather than 404.
6. **Translations**: the fifteen zh/ms/ar `modules/` pages stay at their paths. Where their English
   twin no longer exists at that path, they become orphans — handle them by the rule already
   established in the translation sweep: pair by basename, repair with `translationKey` where a
   faithful twin exists, and `draft: true` where the English original is gone. They move in **this**
   commit, not a later one (CLAUDE.md's translation-pairing rule).

## Definition of done

- `hugo --gc --minify` builds clean.
- `tests/content-lint.sh` passes all checks.
- **Broken links do not increase** (baseline 172), and the `/applets/` resolution rate for the new
  `/modules/` tree stays at 124 of 125.
- Playwright 42/42.
- Every `/modules-v2/` URL redirects to its `/modules/` equivalent — spot-checked in the built
  `public/` output, not assumed.
- No page under `content/en/modules/` lists an applet with no ACTIVE `bl_applet_hdr` row.
- A `planning/worklog/` entry for the archived tree, and Q-0038 marked answered.

## Explicitly out of scope

Rewriting the surviving pages. `modules-v2/` is more correct, not correct — it still carries
unaudited prose, and it joins the audit backlog like everything else. This spec moves URLs; it does
not promise the content behind them is finished.
