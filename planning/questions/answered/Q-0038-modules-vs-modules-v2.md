---
id: Q-0038
asked: 2026-09-05
closed: 2026-09-07
answered_by: Vincent, 2026-09-06 — "modules/ down" and "keep the URL as /modules/"
spec: planning/specs/modules-tree-consolidation.md
adr: planning/decisions/0008-verify-or-unpublish.md
evidence: planning/reviews/2026-09-06-modules-duplication-audit.md
worklog: planning/worklog/2026-09-07-modules-tree.md
---

# Q-0038 — `modules/` or `modules-v2/`: which one survives?

## The question

Two trees documented the same modules. The question as filed assumed a page-by-page merge and asked
which tree wins. The audit of 2026-09-06 measured both and found the merge premise wrong: there was
almost nothing to merge.

## The answer

**`modules-v2/` survives. `modules/` came down. The surviving tree took over the `/modules/` URLs,
so "v2" never appears in a public URL.**

Vincent's words, 2026-09-06: *"keep the URL as `/modules/`"* — one change, no redirect hop, no later
rename.

## Why

| | `modules/` | `modules-v2/` |
|---|---:|---:|
| Pages (en) | 92 | 122 |
| Distinct `/applets/…` targets that do not resolve | 113 of 125 | 1 of 125 → **0** |
| Broken link instances | 206 | 11 → **0** |
| Module pages with zero real applets behind them | 5 | 0 — already pruned |

`modules-v2/` was a deliberate, pruned rebuild that already omitted every invented module. Whoever
built it had made the call the audit was being asked to make. `modules/` was, in substantial part, a
catalogue of applets that do not exist — `erp/_index.md` named ~34 with no registry row,
`accounting/_index.md` ~19 — plus three applet manuals living in the module tree against the
CLAUDE.md module/applet rule, and four pages that collided on a URL with a sibling in their own tree.

## What was done, 2026-09-07

Executed as one working-tree change per `planning/specs/modules-tree-consolidation.md`:

- Two things carried forward after checking each against source: the **Engagement Applet**
  (`engagementApplet`, ACTIVE) into the Claims module, and the **EcomSync** material as a pointer to
  the sourced `applets/integrations/90-ecomsync-related-applets.md` in the E-Commerce module.
- `content/en/modules/` (92 pages), `content/en/modules.md` and `content/zh/modules.md` archived to
  `planning/archive/2026-09-07-modules-tree/`.
- `content/en/modules-v2/` → `content/en/modules/` by `git mv`.
- All 121 `/modules-v2/…` URLs redirect to their `/modules/…` equivalent; every archived URL with an
  inbound link or a plausible bookmark redirects to an honest destination.
- Nine `zh/ms/ar` module pages whose English original was archived set `draft: true`; the three
  translated section indexes kept live and their links repaired.

Broken internal targets fell from 387 to 223; lychee from 172 to 159; Playwright 42/42.

Full detail, the per-page triage of the 41 unique paths, and what still needs Vincent are in
`planning/worklog/2026-09-07-modules-tree.md`.

## What this also settled

- **Q-0146** — the five main-nav entries pointing at module sections that do not exist
  (`sales-crm`, `erp`, `it-ce`, `service-industry`, `drop-shipping`) were removed from `hugo.yaml`.
  The remaining 14 `pageRef`s all resolve.
- **Q-0147** — `content/en/modules.md` and its `<script>window.location.href` redirect are archived.
  `/modules/` is now served by the module tree's own index.
- **Q-0148** — `modules/budgetary.md` and its 35 base64-embedded screenshots are archived rather
  than re-linked. `/modules/budgetary/` redirects to the sourced
  `applets/finance/budgetary-applet.md`.

## What it did not settle

Ten applet names linked from the surviving tree have no ACTIVE `bl_applet_hdr` row — 54 references
across 20 pages. They were left in place: three open items govern them (ADR-0007 for E-Mandate and
Group Maintenance, Q-0016 for the General Ledger and tax-page merges, and Lane 2's question about
whether the applet pages themselves come down). See the worklog's *Not done* section.
