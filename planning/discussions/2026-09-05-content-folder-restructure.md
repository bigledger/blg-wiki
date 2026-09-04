---
status: decided
started: 2026-09-05
participants: Vincent, Claude (Opus 5), GPT via codex (adversarial review pending)
decision: ../decisions/0001-content-folder-restructure.md
related:
  - 2026-09-05-translations-zh-ms-ar.md  (every move must be mirrored in zh/ms/ar)
  - ../reviews/2026-09-05-gpt-5.5-content-folder-restructure.md
  - ../reviews/2026-09-05-gpt-5.6-sol-content-folder-restructure-rulings.md
---

# Restructuring `content/en/` — folder names that reflect content

## Why this came up

Vincent asked what the difference is between `guides/` and `user-guide/`. There is a
real difference in the content, but nothing in the names reveals it. That led to a
survey of the whole top level, which found the same disease in several places.

Vincent's brief: **"I don't mind changing every single URL. I prefer housekeeping and
long-term usability of the wiki."** So this is a clean-slate redesign, not a minimal rename.

## What exists today (surveyed 2026-09-05, commit b4b717c4)

| Folder | Files | Inbound links | What it actually holds |
|---|---|---|---|
| `guides/` | 47 | 214 | End-to-end cross-applet workflows (7 sales variants, 5 procurement variants, 4 accounting), 8 role pages, `advanced/`, e-invoice setup |
| `user-guide/` | 70 | 214 | Single-task pages ordered by learner progression (getting-started → basic-operations → daily-tasks → administration → reports → industry-solutions → troubleshooting → best-practices), plus the whole `demo/` tree. `_index.md` JS-redirects to `/user-guide-v2/` |
| `user-guide-v2/` | 1 | 0 | A hub page. Main nav points here. Links into `user-guide/*-v2/` sub-hubs which are mostly bare `_index.md` |
| `modules/` | 92 | 195 | Old module docs |
| `modules-v2/` | 118 | 45 | Main nav points here. Several nav `pageRef`s (e.g. `/modules-v2/sales-crm`) point at directories that do not exist |
| `applets/` | 188 | **1321** | Reference docs, single source of truth. Well named. Leave alone. |
| `business-operations/` | 12 | 10 | Dashboards + order screens |
| `developers/` / `developer-docs/` / `api-reference/` | 67 / 2 / 1 | 51 / 8 / 3 | Three folders for one audience |
| `tutorials/` | 3 | 20 | first-invoice, month-end-closing |
| `support/` | 10 | 5 | FAQ + beginner-guide |
| `applications/` | 2 | 0 | unified-contact-center |
| root `*.md` | 5 | — | `ai-intelligence`, `applets-workflows`, `modules` (JS redirect), `e-invoice-peppol`, `demos-resources` — marketing landing pages |

Only **1 file** in the repo uses Hugo `aliases:`. Redirect discipline does not exist yet.

## The actual distinction between `guides/` and `user-guide/`

- `user-guide/` answers **"how do I do this one thing on this one screen"** — one document, one applet. *Creating a Sales Order.*
- `guides/` answers **"how does this whole business process run end to end, and what's my part"** — many documents, many applets, several departments. *Standard Sales Workflow* runs Sales Admin → Customer Profile → Sales Order → Deposit → Delivery Scheduling → Warehouse → Stock Conversion → Invoice & DO → Delivery → Payment → Reconciliation.

They cross-link in both directions on purpose. The distinction is real; the names hide it.

## Diagnosis: four naming diseases

1. **Synonym pairs.** `guides` / `user-guide` / `tutorials` / `business-operations`. `developers` / `developer-docs`. `api-reference` / `developers/api-reference`. No reader can predict which holds what.
2. **Version suffixes leaked into public URLs.** Main nav points at `/user-guide-v2/` and `/modules-v2/`; the hub links to `/user-guide/administration-v2/` etc. Customers are bookmarking `-v2` URLs. This is the worst single problem.
3. **Self-referential suffixes.** `/guides/sales-guides/standard-sales-workflow/` reads "guides guides workflow".
4. **Non-topics as folders.** `advanced/`, `best-practices/`, and `basic-operations/` vs `daily-tasks/` — not distinctions a reader can predict.

## Proposal v1 — rejected

Named workflow sub-folders after departments: `workflows/sales/`, `workflows/purchasing/`,
`workflows/accounting/`, `workflows/inventory/`, `workflows/e-invoice/`.

**Vincent's objection (correct):** those are module names. A workflow is by definition a
process that *crosses* modules — order-to-cash touches Sales & CRM, Inventory, Financial
Accounting, and E-Invoice. Naming the folder `sales/` collapses it back onto the module
taxonomy and hides the one thing that makes it a workflow.

**Rule adopted from this:** *If a workflow folder's name matches a module's name, it is
not a workflow.*

## Proposal v2 — current

The three BigLedger layers, kept distinct, plus one more for the docs:

| Layer | Answers | Named after |
|---|---|---|
| `applets/` | "What does this field do?" | The component |
| `modules/` | "What's in Financial Accounting, which applets does it group?" | The business grouping |
| `workflows/` | "How does an order become cash, who touches it on the way?" | **The process — which crosses modules** |
| `tasks/` | "How do I create a sales order?" | One document on one screen |

A second distinction surfaced: **setup ≠ workflow.** Chart of Accounts Setup, MyInvois
Setup, PEPPOL Configuration are one-time implementation tasks, not recurring processes.
Today's `guides/_index.md` is even titled "Getting Started & *Implementation* Guides".

```
content/en/
  getting-started/    first login, orientation, core concepts
  implementation/     one-time setup: chart of accounts, company/branch, GL defaults,
                      MyInvois registration, PEPPOL config
  tasks/              one screen, one document
  workflows/          multi-document processes that CROSS modules
    order-to-cash/      the 7 sales variants
    procure-to-pay/     the 5 procurement variants
    record-to-report/   journal entries, bank rec, financial reporting, month-end
    stock-movement/     stock transfer, stock take, adjustments, consignment stock
  roles/              what each job function does day to day
  industries/         retail, F&B, manufacturing, automotive, ...
  reports/            getting the number you need
  administration/     users, roles, permissions (reader = the sysadmin)
  modules/            what each module is + which applets it groups (v2 content wins)
  applets/            REFERENCE — unchanged
  developers/         absorbs developer-docs/ and root api-reference/
  support/            absorbs user-guide/troubleshooting/
  demos/              from user-guide/demo/
```

## Adversarial review round (2026-09-05)

Two GPT passes via codex, both read-only against the repo. Full text in `../reviews/`.

**GPT-5.5** (full review of proposal v2). Three factual claims, all verified by Claude:
- `hugo.yaml` menu has 5 dead `pageRef`s: `/modules-v2/{sales-crm, erp, it-ce, service-industry, drop-shipping}`.
- **"Workflow" is already a BigLedger product term** — `applets/sales-workflow/`, `purchase-workflow/`, `inventory-workflow/` exist. `workflows/` as a folder name would collide with it.
- `user-guide/daily-tasks/creating-sales-order.md` is not "one screen" — 12 steps, order modifications, special order types. The "task = one document, one screen" definition in proposal v2 was fiction.

Adopted from 5.5: `how-to/` + `processes/` replace `tasks/` + `workflows/`; plain-English slugs with ERP jargon as aliases; dissolve `stock-movement/` into how-tos; `roles/` and `industries/` and most of `reports/` are hubs that link out, not owners; setup stays its own section because chart of accounts is infrastructure for every process.
Rejected from 5.5: a folder literally named `views/` in public URLs; sentence-length slugs (`buy-receive-and-pay-suppliers`).

**GPT-5.6-sol** (rulings on the four points still contested):
1. `how-to/` + `processes/` — confirmed. Display as "How-to guides" and "Business processes".
2. Slugs: short plain English — `customer-orders-to-payment/`, `supplier-orders-to-payment/`, `closing-the-books/`. Titles carry the jargon in parentheses: *"Sell, deliver and get paid (order to cash)"*. Aliases for `order-to-cash` etc. are worth adding.
3. `views/` rejected; nesting under `getting-started/` rejected (a finance manager revisits the role hub long after onboarding). Roles and industries sit as plain hub folders under the umbrella.
4. **One umbrella, and it keeps the name `user-guide/`.** The original problem was not having an umbrella; it was having two indistinguishable ones. Keep exactly one, matching the visible top-menu label "User Guide", and retire `guides/` through aliases.

## Proposal v3 — converged (Claude + GPT-5.5 + GPT-5.6-sol)

```
content/en/
  user-guide/                        the ONE reader-facing umbrella (matches top nav)
    getting-started/                 first login, orientation, first success
    setup/                           one-time go-live config: chart of accounts,
                                     company/branch, GL defaults, users & permissions
                                     baseline, tax/SST, MyInvois, PEPPOL, cashbooks
    how-to/                          one outcome per page — create a sales order,
                                     transfer stock between branches, run a trial balance
    processes/                       cross-module, end-to-end journeys
      customer-orders-to-payment/    the 7 sales variants  (order to cash)
      supplier-orders-to-payment/    the 5 procurement variants  (procure to pay)
      closing-the-books/             journals, bank rec, month-end, reporting pack
                                     (record to report)
    roles/                           hub pages by job function — link out, own nothing
    industries/                      hub pages by industry — link out, own nothing
    training/                        video libraries (today's *-v2 hubs) + demo platform
  modules/                           what each module is + which applets it groups
  applets/                           REFERENCE — unchanged
  developers/                        absorbs developer-docs/ and root api-reference/
  support/                           FAQ, troubleshooting, beginner guide
```

Five roots. Where the previously-floating sections went:
- `reports/` — dissolved: "run X report" → `how-to/`; month-end pack → `processes/closing-the-books/`; per-module report catalogues → `modules/`.
- `administration/` — baseline user/role/permission setup → `setup/`; ongoing admin tasks → `how-to/`.
- `demos/` → `training/`.
- `business-operations/` — order how-tos → `how-to/`; dashboards → `how-to/` or retire.
- `tutorials/` (first-invoice, month-end-closing) → `getting-started/` and `processes/closing-the-books/`.
- `applications/` (UCC) → `modules/`.
- Root marketing pages (`ai-intelligence`, `applets-workflows`, `e-invoice-peppol`, `demos-resources`, `modules.md`) → retire or fold into the matching `modules/` overview.

## Decisions still Vincent's

1. **Approve proposal v3 as the shape?** (→ ADR-0001)
2. **Process slugs.** 5.6's picks are `customer-orders-to-payment` / `supplier-orders-to-payment` / `closing-the-books`. Alternatives if those feel clunky: `sell-and-get-paid` / `buy-and-pay` / `closing-the-books`. Both sets pass the "not a module name" test.
3. **`setup/` vs `implementation/`.** Both reviewers said `setup`; it is the plainer word.
4. **`training/`** for video hubs + demos — or `learn/`, or `videos/`?
5. **v1 vs v2 content**: per section, which wins. Must be settled before any `git mv`.
6. **Translations move with the English.** Hugo pairs translations by identical path; see
   `2026-09-05-translations-zh-ms-ar.md`. The spec carries a zh/ms/ar row per move.

## Not in scope here

The rename fixes the *shelf*. Only `guides/accounting-guides/` currently meets the
GadgetSphere / Xero voice bar; every other guide is older generic voice. That rewrite is
separate work and should get its own discussion.

## Next steps

- [x] GPT-5.5 adversarial review → `reviews/`
- [x] GPT-5.6-sol rulings on contested points → `reviews/`
- [x] Reconcile → proposal v3 (above)
- [ ] Vincent decides items 1–5 → write `decisions/0001-content-folder-restructure.md`
- [ ] Write `specs/content-folder-restructure.md`: exact `git mv` table, link-rewrite
      plan (~700 inbound links), alias for every moved page, `hugo.yaml` menu rewrite
      incl. the 5 dead pageRefs, removal of the JS redirects, weight pass, verification
      (hugo build + lychee + playwright)
- [ ] Implement, one section per commit
