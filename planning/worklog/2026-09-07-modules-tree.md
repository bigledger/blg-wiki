---
date: 2026-09-07
unpublished_from: content/en/modules/ (92 pages) + content/en/modules.md + content/zh/modules.md
url: /modules/ and its 86 built children, plus /zh/modules/ (the shadow page)
tier: 1
mechanism: moved
spec: ../specs/modules-tree-consolidation.md
adr: ../decisions/0008-verify-or-unpublish.md
audit: ../reviews/2026-09-06-modules-duplication-audit.md
question: Q-0038
reason: "Two trees documented the same modules. The original `modules/` tree was in substantial part a catalogue of applets that do not exist: 113 of its 125 distinct /applets/… link targets did not resolve, ~70 named applets have no row in bl_applet_hdr at any status, five whole module pages had zero backing applets, and three pages were applet manuals living in the module tree against the CLAUDE.md module/applet rule. `modules-v2/` is the pruned, template-driven rebuild of the same material with 0 unresolved applet links. Vincent decided 2026-09-06 that modules-v2 content takes over the /modules/ URLs in a single change, so that \"v2\" never appears in a public URL again."
evidence:
  - "planning/reviews/2026-09-06-modules-duplication-audit.md — full duplication map, applet verification against bl_applet_hdr (236 rows: 209 ACTIVE, 26 DELETED, 1 INACTIVE), and per-page verdicts."
  - "Re-measured 2026-09-07 on the new tree: 89 distinct /applets/… targets, 0 unresolved, 70 backed by an ACTIVE bl_applet_hdr row."
  - "modules/erp/_index.md enumerated 41 applets, ~34 with no registry row; modules/accounting/_index.md 26 applets, 19 with no registry row; it-ce 0 of 6 real, service-industry 0 of 7, drop-shipping 0 of 2, digital-crm 0 of 3."
  - "modules/budgetary.md — 1,052 lines, 1.0 MB, 35 base64-embedded PNGs, zero internal links; duplicates the sourced applets/finance/budgetary-applet.md (Q-0148)."
  - "modules/cp-commerce/_index.md — 843 lines of which 775 are a widget-by-widget catalogue that contradicts the sourced one in applets/ecommerce/cp-commerce-admin-applet.md; also carried a raw <div style=…> YouTube embed, forbidden by CLAUDE.md."
  - "modules/financial-accounting.md, inventory.md, pos.md, manufacturing.md each rendered to the same URL as the sibling X/_index.md in their own tree — one of each pair was unreachable and nobody knew which."
  - "content/en/modules.md carried <script>window.location.href = \"/modules-v2/\"</script>, forbidden by CLAUDE.md, shadowing /modules/ with 386 lines of stale prose (Q-0147)."
  - "modules/membership/integration/{pos,ecommerce}-integration.md — ~30 pseudo-JavaScript blocks calling GET /members/{id}, /points/balance/{id}, GET /members?search=… . The same invented surface disproved for third-party-integration.md on 2026-09-06 (planning/worklog/2026-09-06-membership-third-party-integration.md): there is no /members route and no /points route anywhere in the platform; membership resources sit at /core2/tnt/dm/crm/membership-cards/etl-ep and siblings."
salvage: "Carried forward before the archive (both checked against source first): (1) the Engagement Applet, which modules/claim-module/_index.md listed and modules-v2/claims/ did not — engagementApplet is ACTIVE and content/en/applets/crm/engagement-applet.md is a sourced page, so it was added to the Claims module's applet map and related-applets list; (2) the EcomSync material under modules/ecommerce/, whose substance had already been rebuilt from source into content/en/applets/integrations/90-ecomsync-related-applets.md — the E-Commerce module now points at that page from its applet map and its related-applets page, which also corrects the module's claim that marketplace sync lives in a \"Seller Admin Applet\". Nothing else in the 41 unique paths survived the source check."
to_rewrite: "Nothing from this tree returns as-is. If a Sales & CRM module, an ERP overview, an IT & CE, a Service Industry or a Drop Shipping module is wanted, it must be written from the applet registry, not from this text. The five zero-applet pages are the clearest example of what not to reproduce."
---

## What happened

`content/en/modules-v2/` took over the `/modules/` URLs in one working-tree change:

1. Two things were carried forward from `modules/` (see `salvage` above), each verified against
   `bl_applet_hdr` and the sourced applet page before it moved.
2. `content/en/modules/` (92 pages), `content/en/modules.md` and `content/zh/modules.md` were moved
   here, to `planning/archive/2026-09-07-modules-tree/` — 94 files, 2.5 MB, of which
   `en-modules/budgetary.md` alone is 1.0 MB.
3. `content/en/modules-v2/` was `git mv`'d to `content/en/modules/` (122 pages, history preserved).
4. Every `/modules-v2/` reference was rewritten to `/modules/` — 132 files under `content/`,
   plus `hugo.yaml`'s main menu and 27 `kb/topics/` path citations. There is no `modules-v2` left
   in the repository outside this archive.
5. All 121 `/modules-v2/…` URLs redirect to their `/modules/…` equivalent via `aliases:` on the
   122 new pages (one page is `draft: true`, so it builds no alias).

## The triage of the 41 paths unique to `modules/`

| group | pages | outcome |
|---|---|---|
| Invented modules — `erp/`, `accounting/`, `it-ce/`, `service-industry/`, `drop-shipping/`, `digital-crm/`, `projects.md` | 7 | archived. No applets behind them. |
| Applet manuals in the module tree — `budgetary.md`, `cp-commerce/_index.md`, `journal.md` | 3 | archived. Each duplicates a sourced applet page; two contradict it. |
| URL collisions and duplicates-of-duplicates — `financial-accounting.md`, `inventory.md`, `pos.md`, `manufacturing.md`, `hr.md`, `procurement.md`, `crm.md`, `inventory-warehouse/_index.md`, `sales-crm/_index.md` | 9 | archived. Second copies of pages that also existed as `X/_index.md`. |
| `membership/getting-started/*` | 4 | archived as duplicates of the sourced `applets/membership/membership-admin-applet.md`. |
| `membership/integration/*` | 4 | archived. `third-party-integration.md` was already `draft: true` (tier 1); the two children re-checked today carry the same invented `/members` API in ~30 code blocks. |
| `ecommerce/*` EcomSync and CP-Commerce fragments | 12 | archived; the material is carried forward as a pointer to the sourced EcomSync index (see `salvage`). Ten of the twelve are 10–29-line Confluence exports still carrying `**Page ID**` / `**Last Updated**` stamps; `ecomsync-features.md` is an internal readiness-status tracker; `cp-commerce-menu-pages.md` describes a "Menu Module" and "Pages Module" that the sourced CP Commerce Admin page shows as the *Menu List* tab and *Posts*. |
| `inventory/category-groups.md` | 1 | archived. A field-table reference for a Doc Item Maintenance screen. |
| `claim-module/_index.md` | 1 | archived; its one unique fact (the Engagement Applet) carried forward. |

## URLs

No `/modules/…` URL that anything on the site linked to was left pointing at nothing. Archived URLs
that had inbound links or are plausible bookmarks now redirect:

| archived URL | redirects to |
|---|---|
| `/modules/crm/`, `/modules/sales-crm/`, `/modules/digital-crm/` | `/modules/crm-digital/` |
| `/modules/procurement/` | `/modules/purchasing/` |
| `/modules/accounting/`, `/modules/journal/` | `/modules/financial-accounting/` |
| `/modules/hr/` | `/modules/hr-payroll/` |
| `/modules/inventory-warehouse/` | `/modules/inventory/` |
| `/modules/claim-module/` | `/modules/claims/` |
| `/modules/membership/getting-started/`, `/modules/membership/integration/` | `/modules/membership/` |
| `/modules/budgetary/` | `/applets/finance/budgetary-applet/` |
| `/modules/cp-commerce/`, `/modules/ecommerce/cp-commerce/`, `/modules/ecommerce/cp-commerce-menu-pages/`, `/modules/ecommerce/20-website-configuration/` | `/applets/ecommerce/cp-commerce-admin-applet/` |
| the nine `/modules/ecommerce/*` EcomSync fragments | `/applets/integrations/90-ecomsync-related-applets/` |
| `/modules/inventory/category-groups/` | `/applets/master-data/doc-item-maintenance-applet/` |

`/modules/erp/`, `/modules/it-ce/`, `/modules/service-industry/`, `/modules/drop-shipping/` and
`/modules/projects/` get **no** alias: there is no honest destination for a module that has no
applets, and nothing on the site linked to them. Their five main-menu entries in `hugo.yaml` were
removed in the same change, which answers the fix half of **Q-0146**.

## Inbound links repaired in the same change

18 links in 15 English pages (`user-guide/`, `guides/sales-guides/`, `applications/`,
`applets/finance/`, `applets/integrations/`) plus ten deferral links in
`applets/finance/budget-applet.md` that pointed into sections of the archived `budgetary.md` and now
point at the sourced Budgetary Applet reference. Six links in three Chinese pages were repointed
from the Chinese module pages drafted below to the English module pages.

## Translations

The fifteen `zh/ms/ar` `modules/` pages moved in this change, paired by basename as the translation
sweep established:

- `financial-accounting.md` (zh, ms, ar) — already `draft: true` from the 2026-09-06 orphan sweep.
- `crm.md`, `inventory.md`, `pos.md` (zh, ms, ar) — **nine pages set `draft: true`**. Their English
  originals (`modules/crm.md`, `modules/inventory.md`, `modules/pos.md`) are archived here, and the
  rebuilt English pages at the same URLs are different pages, not faithful twins, so no
  `translationKey` repair applies.
- `_index.md` (zh, ms, ar) — kept live. They anchor the Modules entry in the shared main menu in
  three languages, and drafting them would remove it. Their cards, which pointed at the now-drafted
  translated pages and at four sections that never existed in those languages, were repointed to
  the English module pages; the Chinese "项目管理" card was removed (there is no Projects module).
  These three pages remain on the retranslation backlog under Q-0070/Q-0071.

## Measurements

| | before | after |
|---|---:|---:|
| `hugo --gc --minify` | clean | clean |
| `tests/content-lint.sh` | pass | pass |
| lychee (built site, `tests/lychee-gate.sh`) | 172 errors | **159** — baseline lowered to 159 |
| distinct broken internal targets (all absolute in-site links in `public/`) | 387 | **223** |
| broken internal link instances | 9,960 | **2,651** |
| Playwright | 42/42 | 42/42 |
| `/applets/…` targets in the modules tree that do not resolve | 113 of 125 (`modules/`) | **0 of 89** |
| new broken targets introduced | — | **0** |

lychee's `--offline` mode skips every absolute `https://wiki.bigledger.com/…` link, which is how
Hugo renders internal links here, so it sees only relative ones. The distinct-broken-target figures
above come from resolving every absolute in-site `href`/`src` in `public/` against the built tree —
the same method the audit used, and the one that actually measures this change.

## Not done — needs Vincent

Ten applet names linked from the surviving modules tree have **no ACTIVE `bl_applet_hdr` row**:
AI Customer Analytics (8 refs), Seller Admin (7), Accounts Receivable (1), Budget (3), E-Mandate (3),
General Ledger (7), Transaction Reconciliation (2), Vote Book (3), Admin Time & Attendance (19),
Group Maintenance V2 (1 — its `GroupApplet` row is `DELETED`). 54 references across 20 pages.

They were left in place. Removing them is rewriting the surviving pages, which this spec puts out of
scope, and three separate open questions govern them: ADR-0007 is still `proposed — awaiting
Vincent` for E-Mandate and Group Maintenance; Q-0016 holds the `general-ledger-applet` merge and the
tax-page merge; and the audit's own note records that Lane 2 has already asked whether the *pages*
those links point at should come down. Ripping the links out first would orphan those pages and
pre-empt all three.
