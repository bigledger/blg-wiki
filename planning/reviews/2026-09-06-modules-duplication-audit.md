---
date: 2026-09-06
unit: modules-duplication-audit
scope: content/en/modules/ (92 pages) + content/en/modules-v2/ (122 pages)
relates_to: Q-0038, ADR-0002, ADR-0007, ADR-0008
verdict: modules-v2 wins outright; modules/ is not a merge candidate, it is a takedown candidate
---

# `modules/` vs `modules-v2/` — duplication map, applet verification, and the answer to Q-0038

## Summary in one paragraph

The two trees are **not two drafts of the same content**. `modules-v2/` is a deliberately pruned,
template-driven rebuild that **omits every invented module** and whose applet links are almost all
real; `modules/` is the original tree and it is, in substantial part, a **catalogue of applets that
do not exist**. Of the ~89 distinct `/applets/…` link targets in `modules/`, **73 point at a page
that exists nowhere on the site**, and of the applets those links name, **the great majority have no
row in `bl_applet_hdr` at any status**. Four to five whole module pages describe product areas with
**zero** backing applets. `modules-v2/` had **11 broken link instances across 5 targets** before this
pass and **0 after it**. The merge Q-0038 imagines — page-by-page reconciliation — is the wrong shape
of work: there is very little in `modules/` worth merging forward, and a great deal that should not
be on a public documentation site at all.

---

## Pass 1 — the duplication map

### Method

Paired in three stages, as the translation sweep recommended: (1) identical relative path,
(2) identical basename or identical front-matter title among the leftovers, (3) manual semantic
pairing of module concepts. Byte comparison by `cmp`; divergence measured as changed diff lines as a
percentage of combined line count.

### Counts

| bucket | count |
|---|---|
| Pages in `content/en/modules/` | 92 |
| Pages in `content/en/modules-v2/` | 122 |
| **Same relative path in both trees** | **51** |
| — of those, **byte-identical** (`cmp` clean) | **21** |
| — of those, **near-identical** (≤10% diff) | **3** |
| — of those, **diverged** (>10% diff) | **27** |
| Paired by basename/title only | 1 |
| Unique to `modules/` after all pairing | 40 |
| Unique to `modules-v2/` after all pairing | 70 |

Volume: `modules/` is ~154,000 words / 31,300 lines. `modules-v2/` is ~90,000 words / 14,800 lines.
`modules/` is roughly **twice the size and a fraction of the accuracy**.

### The 21 byte-identical pairs — all `membership/`

The earlier fabricated-API sweep found six identical `membership/api-reference/` files. The real
number is **21**, all under `membership/`, and three more are near-identical:

```
IDENTICAL  membership/api-reference/GET Members by Criteria.md
IDENTICAL  membership/api-reference/GET Membership Points Current Balance.md
IDENTICAL  membership/api-reference/GET Membership Points Transactions by Criteria.md
IDENTICAL  membership/api-reference/POST Create Member Point Transaction.md
IDENTICAL  membership/api-reference/POST Create Member.md
IDENTICAL  membership/api-reference/PUT Update Member.md
IDENTICAL  membership/best-practices/_index.md
IDENTICAL  membership/best-practices/data-management.md
IDENTICAL  membership/best-practices/program-design.md
IDENTICAL  membership/best-practices/security-compliance.md
IDENTICAL  membership/best-practices/troubleshooting.md
IDENTICAL  membership/configuration/member-setup/_index.md
IDENTICAL  membership/configuration/points-setup/_index.md
IDENTICAL  membership/configuration/rewards-setup/_index.md
IDENTICAL  membership/core-concepts/customer-membership-relationship.md
IDENTICAL  membership/core-concepts/points-expiry.md
IDENTICAL  membership/core-concepts/reward-types.md
IDENTICAL  membership/use-cases/fnb-membership.md
IDENTICAL  membership/use-cases/points-redemption.md
IDENTICAL  membership/use-cases/seasonal-campaigns.md
IDENTICAL  membership/use-cases/tiered-membership.md
NEAR(0%)   membership/core-concepts/membership-tiers.md          (587 vs 597 lines)
NEAR(0%)   membership/core-concepts/points-currencies.md         (548 vs 556)
NEAR(0%)   membership/use-cases/retail-loyalty-program.md        (589 vs 596)
```

**All 24 are still identical/near-identical after this pass** — the link repairs below were applied
to both copies deliberately, so the merge decision is not prejudged.

### The 27 diverged pairs, and which one is right

Two distinct shapes.

**(a) `modules-v2/` is a stub where `modules/` has the real content — 12 pairs, all under
`membership/configuration/`.** These are the ones showing 90–96% divergence with a v2 line count of
18–23. Example:

| path | modules/ | modules-v2/ | more correct |
|---|---|---|---|
| membership/configuration/rewards-setup/pricebook-configuration.md | 432 | 18 | `modules/` |
| membership/configuration/points-setup/cash-conversion.md | 425 | 19 | `modules/` |
| membership/configuration/rewards-setup/voucher-rewards.md | 443 | 23 | `modules/` |
| membership/configuration/points-setup/expiry-rules.md | 422 | 20 | `modules/` |
| membership/configuration/rewards-setup/pricing-scheme-rewards.md | 387 | 20 | `modules/` |
| membership/configuration/points-setup/conversion-rates.md | 323 | 20 | `modules/` |
| membership/configuration/member-setup/bulk-import.md | 324 | 21 | `modules/` |
| membership/configuration/points-setup/currency-configuration.md | 290 | 22 | `modules/` |
| membership/configuration/member-setup/member-labels.md | 248 | 20 | `modules/` |
| membership/configuration/member-setup/member-classes.md | 208 | 21 | `modules/` |
| membership/configuration/member-setup/member-creation.md | 168 | 21 | `modules/` |
| membership/api-reference/_index.md | 11 | 15 | tie |

This is the **only** place in 214 pages where `modules/` holds content `modules-v2/` lacks — and even
here the "content" is unverified reference material that duplicates
`applets/membership/membership-admin-applet.md`, which *is* sourced (`applet_code: MEMBERSHIPADMIN`).
The v2 stubs are short because they were deliberately replaced by links into the applet doc.

**(b) `modules-v2/` is a rebuilt page where `modules/` is the original — 15 pairs, the module
`_index.md` files.** These are the real modules: `core`, `financial-accounting`, `inventory`, `pos`,
`purchasing`, `manufacturing`, `ecommerce`, `e-invoice`, `hr-payroll`, `membership`, and the tree
roots. **`modules-v2/` is more correct in every one of them, checked against source rather than
length.** Sample of claims checked:

| claim | `modules/` | `modules-v2/` | source |
|---|---|---|---|
| Journal / PV / RV approval workflow | `financial-accounting/_index.md:151` asserts a 3-way-match approval flow | states outright "there is no PV approval workflow", links `/guides/document-approvals/` | `kb/topics/document-approval.md` |
| Master-data approvals | `core/_index.md` silent | `core/_index.md:211` "BigLedger has no approval workflow for master data changes" | audited applet pages |
| Sales approval | `sales-crm/_index.md` describes pipeline approvals | `pos/configuration/_index.md:55` "Sales documents have no approval engine" | audited sales applets |
| GL account inquiry | `accounting/_index.md:24` "General Ledger Applet" | links `Ledger & Journal Applet` correctly in most places | `LedgerAndJournal` is the registry row |
| Applet link resolution | 225 broken instances | 11 broken instances (now 0) | site file tree |

The one place `modules-v2/` was *worse* is the Deposit family (it invented two applets from one
registry row) and Event Management (it invented four features). Both are fixed below.

### Unique to one tree

**Unique to `modules-v2/` (70 pages).** Almost entirely the eight-part scaffold applied to each of
ten modules — `api-reference` (12–15 lines), `best-practices` (16–20), `configuration` (65–86),
`core-concepts` (27–78), `related-applets` (19–29), `reports` (33–44), `use-cases` (24–33). Thin, but
structurally sound and, after this pass, factually clean. Plus three genuinely good e-invoice concept
pages and `financial-accounting/opening-balance.md` (369 lines, 26 screenshots).

**Unique to `modules/` (40 pages).** This is where the problem lives. Broken down:

| group | pages | verdict |
|---|---|---|
| **Invented modules** — `erp/`, `accounting/`, `it-ce/`, `service-industry/`, `drop-shipping/`, `projects.md`, `digital-crm/` | 7 | describe product areas with no applets behind them |
| **Applet manuals in the module tree** — `budgetary.md` (1,052 lines, **1.0 MB**), `cp-commerce/_index.md` (843 lines, 92% of it a widget reference), `journal.md` (677 lines, 7 field tables) | 3 | straight violation of the CLAUDE.md module/applet rule |
| **Duplicate-of-a-duplicate** — `financial-accounting.md`, `inventory.md`, `pos.md`, `manufacturing.md`, `hr.md`, `procurement.md`, `crm.md`, `inventory-warehouse/_index.md`, `sales-crm/_index.md` | 9 | second copies of pages that also exist as `X/_index.md` in the same tree |
| `membership/getting-started/*` and `membership/integration/*` | 7 | unverified but plausible; no v2 twin |
| `ecommerce/*` fragments (10–269 lines each) | 11 | EcomSync/CP-Commerce stubs, several under 15 lines |
| `inventory/category-groups.md` | 1 | unverified |
| `claim-module/_index.md` | 1 | **the one good page** — 3 real, ACTIVE, audited applets |

**Four of those pages collide on a URL with a sibling in their own tree.** `modules/financial-accounting.md`
and `modules/financial-accounting/_index.md` both render to `/modules/financial-accounting/`; same for
`inventory`, `pos`, `manufacturing`. One of each pair is unreachable and nobody knows which.

---

## Pass 2 — do the module pages do their job?

CLAUDE.md: *modules are logical groupings that reference applets; they must never duplicate applet
documentation.* Tested three ways against `bl_applet_hdr` (236 rows: 209 ACTIVE, 26 DELETED,
1 INACTIVE).

### 2a. Do the applets they list exist?

**`modules-v2/`: 116 distinct `/applets/…` targets. 96 resolve to an applet page; of those, 61 carry
an `applet_code` that matches a live registry row.** The rest link pages that are real but unaudited.
Eleven names have **no registry row at any status**:

| named applet | linked from | nearest real thing |
|---|---|---|
| AI Customer Analytics Applet | 8 refs across 6 `crm-digital/` pages | *nothing* |
| Admin Time Attendance Applet | 8 refs across 5 `hr-payroll/` pages — the **only** core applet the HR module lists | *nothing; the sole HR row is `employeeApplet`* |
| Accounts Receivable Applet | `financial-accounting/_index.md:148` | `debtor_report_applet` |
| General Ledger Applet | 7 refs, `financial-accounting/_index.md` | `LedgerAndJournal` |
| Investment Applet | 3 refs (**fixed below**) | `depositApplet` |
| MM Deposit Applet | 3 refs (**fixed below**) | `depositApplet` |
| Revenue Management Applet | 2 refs; **page already archived, so the link 404s** (**fixed below**) | *nothing* |
| Vote Book Applet | 3 refs | `budgetaryApplet`'s votebook menu |
| Transaction Reconciliation Applet | 2 refs | `bankReconApplet` |
| E-Mandate Applet | 2 refs | *ADR-0007 pending* |
| Seller Admin Applet | 6 refs, `ecommerce/` | `MerchantAdminApplet` / `seller_applet` |
| Group Maintenance Applet | 1 ref, `core/_index.md` | *ADR-0007 pending; registry row DELETED* |

**`modules/`: far worse.** `accounting/_index.md` numbers 26 applets — **19 have no registry row**,
5 are renames, 2 are real. `erp/_index.md` enumerates "41 specialized applets" — **~34 have no
registry row**. `it-ce/` 0 of 6 real. `service-industry/` 0 of 7. `drop-shipping/` 0 of 2.
`digital-crm/` 0 of 3, plus one dependency whose registry row is `DELETED`. `projects.md`, `crm.md`,
`hr.md` and `procurement.md` name **no applets at all** while describing whole products.

Aggregate: **70 distinct `/applets/<slug>/` targets in `modules/` resolve to no page anywhere**, and
the applets they name are inventions, not moved pages.

### 2b. Do the links resolve, and to the canonical page?

| tree | broken link instances (before) | distinct targets | broken (after this pass) |
|---|---|---|---|
| `modules/` | 225 | 137 | 206 |
| `modules-v2/` | 11 | 5 | **0** |

Of `modules/`'s 137 distinct broken targets: 89 are `/applets/…`, of which **16 are moved pages**
(missing the category folder — mechanically repairable) and **73 are dead**. The remaining 48 are dead
`/guides/…` and `/user-guide/…` targets, mostly whole "Related Documentation" blocks (`hr-payroll/_index.md`
loses all 9 of its).

**A distinct bug worth naming: the `organisation-applet` copy-paste.** In `accounting/_index.md:333–342`
(8 links), `erp/_index.md:201–214` (10), `it-ce/:101–104`, `service-industry/:113–116`,
`digital-crm/:65–67` and `drop-shipping/:53–56` — **~35 links** — Customer Maintenance, Supplier
Maintenance, Employee Maintenance, Chart of Accounts, Tax Configuration, Cashbook and Tenant Admin all
point at `/applets/organization-applet/`. The links resolve (an alias exists), so no checker catches
them; roughly three quarters land on a page that is not what their label says.

### 2c. Does it duplicate applet documentation?

| page | verdict |
|---|---|
| `modules/budgetary.md` | **1,052 lines, 1.0 MB, zero internal links.** A screen-by-screen Budgetary Applet manual — 154 table rows, 35 base64-embedded PNG screenshots. Duplicates the sourced `applets/finance/budgetary-applet.md`. Worst offender on the site. |
| `modules/cp-commerce/_index.md` | 843 lines, of which **775 (92%) are a widget-by-widget reference for widgets 1–28**, duplicating the audited widget catalogue in `applets/ecommerce/cp-commerce-admin-applet.md`. The two catalogues **disagree**: only ~7 of 28 map cleanly and ~19 appear in no sourced catalogue. Header at L15 reads "Who Uses This **Applet**". Also carries a raw `<div style=…>` YouTube embed (L34–43), forbidden by CLAUDE.md. |
| `modules/journal.md` | 7 field tables (L235, 273, 283, 305, 336, 420, 600) plus screen-step walkthroughs. Over the 3-table self-check limit. |
| `modules/accounting/_index.md` | L370–672 is a full opening-balance import manual with 6 CSV column tables and 22 screenshots. |
| `modules/financial-accounting.md` | Hard-codes a 40-line **numeric** chart of accounts (L54–98), against the CLAUDE.md mnemonic standard; plus a YAML config block and a JSON tax-rule block. |
| `modules/claim-module/_index.md` | Mild — a report inventory (L309–329) that belongs in the applet doc. |
| `modules-v2/*` | **No violations found.** The template lists and links; it does not restate fields. |

### 2d. Established facts the pages got wrong

| fact | violations found | where |
|---|---|---|
| **No three-way-matching engine** | 9 | `modules-v2/purchasing/` ×7 (whole doctrine, incl. an ASCII "3-Way Match" diagram); `modules/procurement.md:38,46`; `modules/purchasing/_index.md:35,108`; `modules/financial-accounting.md:146`; `modules/financial-accounting/_index.md:41,42,151`; `modules/accounting/_index.md:96` |
| **No credit-limit hard block** | 6 | `modules-v2/pos/best-practices:15` ("Configure hard blocks on Sales Order creation"); `modules-v2/pos/configuration:55,60`; `modules-v2/pos/_index.md:54,88`; `modules-v2/ecommerce/use-cases:24`; `modules/accounting/_index.md:80–89`; `modules/financial-accounting.md:125,170` |
| **Approvals are optional, off until configured, and only PO/PR/SR have them** | 14 | `modules/hr-payroll/_index.md:134,142–145,185,212,262`; `modules/hr.md:101`; `modules/procurement.md:17,49,69`; `modules/service-industry/:42,225,341`; `modules/budgetary.md:844`; `modules/journal.md:257` (which contradicts the page's own correct L577–581) |
| **Workflow Design is inert** | 2 | `modules/erp/_index.md:97–104` ("SLA monitoring, process optimization"); `modules/it-ce/:72–82` invents an "Automation Workflow Engine Applet" |
| **Registered GIN/GRN applets are inert (signum 0/0)** | 3 | `modules-v2/purchasing/core-concepts` GRNI section said stock rises at GRN — **backwards**; `modules-v2/pos/use-cases:24`; `modules/budgetary.md:858` lists PGRN as a budget-utilising doc |

Claims audits confirmed **legitimate**: Claims module approvals (the Claim applet has its own engine,
`bl_aat_claim_approval_setting`) and Purchase Requisition / Purchase Order approvals.

### 2e. Images

**5 generated infographics survived the 128-image quarantine**, all in `modules-v2/`, all viewed:
`crm_architecture.png`, `crm_lifecycle.png`, `crm_configuration_workflow.png`, `hr_lifecycle.png`,
`hr_configuration_workflow.png`. They are raster diagrams (against F-0381) **and they carry the
fabricated claims in the pixels** — "Event Ticketing", "Ticketing, Workshop Pages & Attendance QR
Check-in", "AI Customer Analytics · Predictive Churn Scoring", "Biometric terminal & mobile GPS
attendance collection". `hr_lifecycle.png` also has overlapping text ("hours &Approved"). All five
references removed; **the files themselves were left in `static/` for someone with delete authority**.

**35 base64-embedded PNGs in `modules/budgetary.md`** — extracted and viewed, all 35. They are real
Budgetary Applet captures from what looks like a test tenant: sidebar labelled `TESTING`, item names
`Marketing`, `sales`, `TEST`, `Promotion Marketing`, profit-centre codes `RQ_C`/`DC_1`/`PCI`,
virement doc numbers `1200003`–`1200012`. **No personal names, no customer brand, no real amounts.**
Top-bar avatar present — Q-0100, not disqualifying. **Nothing here is a privacy exposure.** The
problem is different and still serious: 35 screenshots that never went through the CDN pipeline, are
not reviewable by the image checks, and inflate one markdown file to 1 MB.

`financial-accounting/opening-balance.md` references 26 `/images/user-guide/Opening-Balance/*.png`;
those are under the normal image pipeline and out of this unit's scope.

---

## Pass 3 — what was fixed

All edits are in `modules-v2/`, plus paired link repairs applied to both trees.

**Tier-1 contradicted claims removed (evidence in brackets):**

1. **Event Management, 4 pages** — landing-page builder, ticketing, QR check-in and post-event surveys
   deleted and replaced with what the applet actually does: calendars, events, participants, entity
   links, and a claim-based Event Expense Report.
   *Evidence: `content/en/applets/crm/events-management-applet.md` (`applet_code: eventManagementApplet`,
   sourced from `blg-applet-wavelet-events-management-applet` — "It is master data plus links: no
   journal, no posting status, no stock"; the words ticket, QR, landing and survey appear nowhere in it.*
   Also corrected the name throughout: registry says **Event** Management Applet, not Events.
2. **Deposit family collapsed to one applet** — the "MM Deposit Applet" and "Investment Applet" rows
   in `modules-v2/financial-accounting/_index.md` deleted; three references repointed to
   `/applets/finance/deposit-applet/`.
   *Evidence: one registry row, `depositApplet | Deposit Applet | ACTIVE`, one repo,
   `blg-applet-wavelet-deposit-applet`, three menus. Nothing about security deposits, utility deposits,
   reclaim tracking, market value or gain/loss exists in the code (lane-4 run 30, findings L2270–2290
   and L3610–3614, which addressed this request to "whoever owns modules-v2").*
3. **Revenue Management Applet references removed** (2) — the page was archived to
   `planning/archive/2026-09-06-utm-tender-pages/revenue-management-applet.md`; the links 404'd.
4. **Three-way matching doctrine rewritten, `modules-v2/purchasing/`, 5 pages.** The "3-Way Invoice
   Matching Mechanics" section (with its ASCII diagram) and the GRNI section are replaced with a
   sourced account of **knock-off** and of **which document actually moves the stock**, plus a mermaid
   fence.
   *Evidence: `content/en/applets/finance/internal-purchase-invoice-applet.md` — the mechanism is the
   *KO For* tab copying a finalised PO/GRN; the `settings/knock-off-settings` route "exists but its
   menu entry is commented out and its switches are read by nothing"; the FINAL validation list
   (`GenericDocumentService.updatePostingStatusWithChecks`) contains no price or quantity variance
   check. And: "Purchase GRN (Internal) records receipt without a stock movement (its quantity signum
   is 0); the Purchase Invoice books the quantities in" — the exact reverse of what the GRNI section
   claimed.*
5. **Credit-limit hard block removed, `modules-v2/pos/` + `ecommerce/`, 4 pages.** "Configure hard
   blocks on Sales Order creation" replaced with the truth: credit availability is a read-only display
   and the control is permissions.
   *Evidence: `EntityCreditAvailabilityService` is a read-only query for display (F-0233 thread).*
6. **Inert GIN named**, `modules-v2/pos/use-cases`.
7. **Loose approval wording** softened in `modules-v2/financial-accounting/_index.md` (two places),
   consistent with that page's own correct statement at L444.

**Links repaired — 16 files, both trees, applied in pairs so the 21 identical membership pages stay
identical:**
`/applets/doc-item-maintenance-applet` → `/applets/master-data/…`;
`/applets/pricebook-applet` → `/applets/master-data/…`;
`/applets/customer-maintenance-applet` → `/applets/master-data/…`;
`/applets/membership-admin-console-applet` → `/applets/membership/membership-admin-applet`.
`modules-v2/` broken links: **11 → 0**. `modules/`: 225 → 206.

**Hextra violation fixed:** `<div style="margin-bottom: 2rem;">` removed from `modules-v2/_index.md`.

**Infographics:** 5 image references removed (files left in place).

`tests/content-lint.sh` passes (exit 0). No `hugo` run. Nothing committed.

### What was deliberately NOT fixed

- **Links to applet pages that still exist but have no registry row** (AI Customer Analytics,
  Accounts Receivable, General Ledger, Vote Book, Admin Time Attendance, Seller Admin, Transaction
  Reconciliation). Lane 2 has already asked whether those *pages* should go (its item 14 and 17). If
  the pages go, the links go with them, in one commit. Ripping them out of the module pages first
  would leave orphans and pre-empt an open question.
- **E-Mandate and Group Maintenance links** — ADR-0007 is still `proposed — awaiting Vincent`.
- **The 206 remaining broken links in `modules/`** — see the recommendation. Repairing links into
  fabricated applets is not a repair.
- **Anything structural.** No merges, no moves, no aliases.

---

## The answer to Q-0038

### Q-0038 assumes a merge. There is almost nothing to merge.

The question as filed reads *"which one survives — and a page-by-page merge needs a spec"*. Three
measurements say the merge premise is wrong:

1. **`modules-v2/` is the pruned tree, and the pruning was correct.** It deliberately omits `erp`,
   `it-ce`, `service-industry`, `drop-shipping` and `projects` — which are precisely the five pages
   this audit independently found to have **zero** real applets behind them. Whoever built v2 already
   made the call this audit is being asked to make.
2. **The only content `modules/` uniquely holds that `modules-v2/` lacks is 12 membership
   configuration pages** — and those duplicate the sourced `membership-admin-applet` page, which is
   where CLAUDE.md says that material belongs anyway.
3. **The accuracy gap is not close.** 0 broken links vs 206. ~11 unregistered applet names vs ~70
   dead applet targets and ~34 invented applets in two pages alone.

### Recommendation

**`modules-v2/` survives; `modules/` is unpublished under ADR-0008 rather than merged.** Concretely:

- **Tier 1 — unpublish now (evidence: no registry row for any named applet).**
  `modules/erp/_index.md`, `modules/accounting/_index.md`, `modules/it-ce/_index.md`,
  `modules/service-industry/_index.md`, `modules/drop-shipping/_index.md`, `modules/projects.md`,
  `modules/digital-crm/_index.md`, `modules/hr.md`, `modules/crm.md`. **Nine pages.**
- **Tier 1 — move to the applet tree or unpublish.** `modules/budgetary.md` (1 MB applet manual
  duplicating a sourced applet page), `modules/cp-commerce/_index.md` (widget catalogue that
  contradicts the sourced one). **Two pages.**
- **Delete the URL collisions.** `modules/financial-accounting.md`, `modules/inventory.md`,
  `modules/pos.md`, `modules/manufacturing.md` — each shadows an `_index.md` at the same URL.
  **Four pages.**
- **Migrate forward, then unpublish the source.** The 12 membership configuration pages (into
  `applets/membership/membership-admin-applet.md`, per CLAUDE.md), `modules/claim-module/_index.md`
  (→ `modules-v2/claims/`, it is the one good page), and the `modules/ecommerce/*` EcomSync fragments
  (→ `applets/ecommerce/`).
- **Alias the whole `/modules/` prefix to `/modules-v2/`** so the 88 inbound links from `guides/`,
  `user-guide/` and `applets/` do not 404 — and then **rename `modules-v2/` to `modules/`**, because
  "v2" in a public URL is a permanent apology.

**This is 15+ pages coming down, far past the five-page stop threshold, so nothing on that list was
touched.** It needs an ADR and a spec, and the ADR needs one word from Vincent.

**The one-word question for Q-0038:** *"`modules/` down — yes or no?"*

