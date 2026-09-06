---
status: running
started: 2026-09-05
owner: Vincent (decides); Claude (drives); GPT via codex exec (attacks)
---

# The improvement loop — how the wiki gets iterated until it converges

Vincent (2026-09-05): *"set up loop or goal, and iterate this wiki website, together with
codex exec, until things converge … lateral thinking … source code, databases, emails, jira and
github issues, google drive … keep going for a very long time, pace yourself properly."*

## Objective

wiki.bigledger.com is comprehensive, professional, well organised, easy to navigate, SEO/GEO
optimised, and accurate to the product as it actually is — for **akaun.com by BigLedger**.

## One iteration = one bounded unit of work

Each wake-up does exactly one of these, then records state and schedules the next wake-up:

| Kind | What | Ships? |
|---|---|---|
| **batch** | `process-batch`: all open inbox items for one page or one theme | yes, via `ship` |
| **ingest** | `ingest`: one source, one scope, from its cursor → ledger + topics + questions | commits kb/ only |
| **write** | rewrite or write one guide/page from its topic notes (CLAUDE.md voice; GadgetSphere) | yes, after a codex review |
| **review** | `second-opinion`: codex attacks last N changes or the plan; findings → inbox/discussions | no |
| **decide** | `decide`: a discussion/ADR/spec that unblocks structural work; questions queued for Vincent | no |
| **measure** | re-run the health metrics below; update this file | commits planning/ only |

Never two kinds in one wake-up. Never more than ~90 minutes of work per wake-up.

## Priority (top first) — re-derived at every `measure`

1. **Customer-visible defects** in the inbox (broken, wrong, leaked, dead) — **including F-0075, a PII sweep of all 1,766 images.**
2. **Quality gate on deploy** (F-0017) — until it exists, every batch risks regressions.
3. **Setup section content** — the master-data applets are in 100+ tenants each
   (`kb/research/2026-09-05-applet-adoption.md`): Organization, Doc Item, Customer, Chart of
   Account, Supplier, Cashbook. Reference pages exist; **how-to/setup guides mostly do not**.
4. **E-Invoice guides** vs the backend's last 90 days (`kb/topics/e-invoice.md`) — 70 tenants.
5. **Order-to-cash core** (Sales Invoice, Sales Order, Sales Return, Receipt Voucher) and
   **procure-to-pay core** — the 7 + 5 workflow guides rewritten to the voice bar.
6. **ADR-0002 applet batches** (merge, archive, retitle + `applet_code:`); F-0011 roadmaps; F-0013 links.
7. **Ingestion breadth** (Vincent, 2026-09-05: emails, docs and issues are *raw material for brainstorming what to improve* — every ingest unit ends with a lateral pass and a list of wiki-impact candidates): applet repos ↔ pages (lanes); **blg-intranet** (content sections +
   ~560 e-invoice issues, then per module); backend issues; Jira/Confluence (40 registry doc
   links still point there); email and Drive via the claude.ai connectors once Vincent
   authenticates them (/mcp) — one scope per wake-up.
8. **Structural**: v1-vs-v2 comparison → restructure spec (ADR-0001) → implementation, one
   section per wake-up. Needs Vincent's per-section approval: ask, don't block.
9. **Translations** (ADR-0003 order: manuals first; zh, ms, ar).

## Lateral rule

Every ingest or write touches a topic; every touched topic's `related:` edges get walked and
the question "what does this change for the neighbour?" gets answered in the note or logged in
`kb/questions/`. That is the mechanism — not optional.

## Convergence test (measured at `measure` wake-ups)

| Metric | Now (2026-09-05) | Converged when |
|---|---|---|
| Open inbox items not waiting on Vincent | 22 → 19 (unit 2) | 0 |
| ACTIVE general-purpose applets without a page | ~40 | 0 |
| Applet pages with `applet_code:` matching the registry | 29 / 165 (unit 4) | all |
| Guides meeting the CLAUDE.md voice checklist (codex-judged) | 4 / 47 | all |
| lychee errors (offline) | 383 | 0 new; baseline retired by F-0013 |
| Pages with WIP banners | 54 | 0 |
| Pages without `description:` | 57 | 0 |
| Sources with a live cursor | 5 / 6 (unit 7: +gdrive, +email, +blg-intranet content; jira pending) | all, each < 7 days behind |
| Deploy gated by tests | **yes** (unit 1) | yes |

When every row is converged, the loop drops to **maintenance cadence**: one `ingest` per source
per day, `measure` weekly, batches as the inbox fills. It never ends; it slows down.

## Pacing

- Wake-ups are self-scheduled (`/loop` dynamic). Default gap 20–45 min after a shipping unit,
  up to 60 min after a quiet one. Codex reviews run in the background across a gap.
- Every 4th wake-up is a `review`; every 8th is a `measure`. Vincent's messages pre-empt the
  queue: `record-feedback` first, then resume.
- **Rate limits:** four lanes plus the loop can exhaust the session window. On a 429 "session limit" error, stop launching, note the reset time, and relaunch lanes from `state.json` after it. Killed lanes leave complete files but may skip bookkeeping — merge-lane.sh commits the files; the relaunch prompt tells the lane to complete the ledger/topic/state entries first.
- Budget: one unit per wake-up keeps context small. Don't re-read whole trees; use cursors,
  the inbox, and this file.

## Guardrails (non-negotiable)

- Privacy sweep before every commit of `kb/` or `planning/`. Raw material stays in `*/private/`.
- No push without the local suite (build, lychee ≤ baseline, Playwright green). Live verify after.
- No structural move without an approved spec. No new pages for applets not in the registry.
- Never reintroduce marketing claims, invented roadmaps, or "blockchain".
- Decisions that are Vincent's are queued in `## Lanes (started 2026-09-05, Vincent's instruction) — **run lanes continuously until Monday 2026-09-07 07:00 Asia/Kuala_Lumpur** (Vincent, 2026-09-05 morning). **Drained to TWO lanes from ~11:30 2026-09-05 (Vincent: stay under the 5-hourly token quota):** lanes 1 and 2 finish their current run and are not relaunched; lanes 3 (e-invoice/purchasing) and 4 (master data/inventory) continue. When 3 or 4 empties its queue, pick up lane 1's or 2's remaining queue. After Monday 07:00: stop launching lanes, keep the loop at single units, and report.

Four parallel agents upgrade `content/en/applets/**` to `specs/applet-page-standard.md` from
source code + backend + issues (`planning/lanes/`). **While lanes are running, loop units must not
edit `content/en/applets/`.** When a lane finishes: merge its ledger shard into
`kb/sources/applet-repos/ledger.jsonl`, fold `findings.md` into the inbox/discussions, run the gate,
commit that lane's pages, ship, then re-launch the lane from its `state.json` (prompt:
`planning/lanes/PROMPT.md` with {N} substituted) until its queue is empty.

## Waiting on Vincent` below and asked at the next
  opportunity; work continues on everything else.

## Lanes (started 2026-09-05, Vincent's instruction) — **run lanes continuously until Monday 2026-09-07 07:00 Asia/Kuala_Lumpur** (Vincent, 2026-09-05 morning). **Drained to TWO lanes from ~11:30 2026-09-05 (Vincent: stay under the 5-hourly token quota):** lanes 1 and 2 finish their current run and are not relaunched; lanes 3 (e-invoice/purchasing) and 4 (master data/inventory) continue. When 3 or 4 empties its queue, pick up lane 1's or 2's remaining queue. After Monday 07:00: stop launching lanes, keep the loop at single units, and report.

Four parallel agents upgrade `content/en/applets/**` to `specs/applet-page-standard.md` from
source code + backend + issues (`planning/lanes/`). **While lanes are running, loop units must not
edit `content/en/applets/`.** When a lane finishes: merge its ledger shard into
`kb/sources/applet-repos/ledger.jsonl`, fold `findings.md` into the inbox/discussions, run the gate,
commit that lane's pages, ship, then re-launch the lane from its `state.json` (prompt:
`planning/lanes/PROMPT.md` with {N} substituted) until its queue is empty.

## Waiting on Vincent

- **F-0232** a later lane disproved two already-shipped pages (WMS does not own stock locations) — schedule a verification pass over the ~89 shipped applet pages once the queue empties.

- **F-0217 SECURITY (urgent):** two images in the blg-intranet repo (`content/1100-malaysia-einvoice/images/postman-*.jpg`, added 2026-05-12) show **live LHDN credentials in readable text** — client id, client secret, full bearer tokens — plus a real customer TIN. Rotate the secrets and replace the images. (Private repo, so employee-visible rather than public — unlike F-0181, which was public.)

- **F-0213 ACCESS CONTROL** supplier CSV import creates POs in the buyer's tenant without the entity-link check — bug or intended?
- **F-0210** approve the tax-page merge (the product's Documentation button currently opens the un-derived page) · **F-0211** VAT-SALES unusable on sales documents — one-string fix
- **F-0207** entity merge rewrites every entity column with no unmerge — guard rail or documented warning?
- **F-0204** Website Builder "Remove Access" does not revoke access (wrong table) — ticket?
- **F-0200 SECURITY (authorisation):** soft-deleted tenant-admin grants still resolve true (unparenthesised OR in PermissionMigrationUow) — escalate.
- **F-0181 SECURITY (urgent):** a customer's Firebase service-account key head was public via the wiki CDN from 2026-02-16 until today — rotate the key; decide on git-history purge; check CDN logs.

- **F-0038 — confirm stock behaviour of the standard purchase pair** before the GRN page and the
  procurement guide are corrected: code says Purchase Invoice (Internal) = stock in (+1), Purchase
  Invoice No Stock In = 0, Purchase GRN Stock In = +1. The wiki currently says the reverse.
- **F-0045 — confirm posting direction of Purchase Debit/Credit Note** (code: PDN reduces supplier balance, PCN increases it — old pages said the reverse) and whether the intercompany SDN→PDN pairing is a bug.
- **F-0044** — are the unseeded `SHOW_*` client-side permission codes a registry omission or per-tenant seeding?
- **F-0046** — confirm removing the sales-order "Under Review" banner; marketplace image filenames keep/rename.
- **F-0050** merge customer-applet.md into customer-maintenance? **F-0051** does a credit limit hard-stop a sale (kb/questions)? **F-0053** keep the Doc Item video?
- **F-0055** are the hidden COGS / Retained-Earnings month-end processors intentional? (guide correction waits) · **F-0056** month-end-processing applet repo: unreleased or dead?
- **F-0057** stock transfers bypass the fiscal lock — document as feature or report as gap?
- **F-0063** GRN FINAL/VOID ignores per-user overrides — bug or intended? CP Commerce hidden screens — restore? Membership repo sample CSV looks like a real person — clean.
- **F-0066** confirm the removed Sales Report / Membership Admin content was never a product brief.
- **F-0068** Bank Reconciliation: bank names in Import Format list keep/genericise; inert toggles document/omit; 90-day look-ahead intended?
- **F-0072** cash adjustments: no journal and no VOID — intended? · **F-0073** init-true hide switches + unseeded SHOW_* = confidentiality trap — report as defect?
- **F-0074** confirm deletion of 17 quarantined PII screenshots (or re-capture synthetic). **F-0077** Car Workshop Field Settings stub, always-true template guard, Convert-to-RV on FINAL quotations — intended?
- **F-0079** phantom/duplicate triage: delete 3 placeholder pages? budget→budgetary merge? Ecom Sync rows live or leftovers? Tiktok Sales Order generic? · **F-0080** blanket-order validity not enforced — intended? who owns the flow-config UI page?
- **F-0082** merge the delivery-installation V2 duplicate into lane 3's canonical page? · **F-0083** drivers editing FINAL delivery orders — intended?
- **F-0085** Commission Scheme: which folder is canonical (membership or sales-workflow)? · **F-0087** claims module built for one customer — confirm generic documentation policy.
- **F-0089** delete/redirect vote-book-applet → budgetary? · **F-0091** budget approval flow + reserved_amt: roadmap, dead or customer-specific? who owns profit centres?
- **F-0093/F-0094** delivery-installation and employee defects (guard case mismatch; File Import cross-type matching; dead tabs) — product tickets?
- **F-0097/F-0098** commission-scheme backend gaps and settings skeleton — tickets? Custom Processor → integrations/?
- **F-0099** registry: creditor_report_applet.documentation_url → /applets/finance/creditor-report-applet/ (DB) · **F-0101** over-contra check missing server-side — product issue?
- **F-0102** Entity Maintenance: report for clean-up/retirement? registry doc URL → wiki.
- **F-0108** Peppol queue does not wait for LHDN Valid — intended? · **F-0109** may the internal LHDN workflow diagram stay public?
- **F-0113 SECURITY** market-data API key compiled into the forex front end — report to platform team. · **F-0111/F-0114** report/forex applet defects — tickets?
- **F-0116** web driver applet broken as shipped — is Android the real client? · **F-0118** delete ecommerce-catalog + installation-of-pricebook placeholders?
- **F-0135** consignment return quantity signum 0 — intended? sales-side RV lines on purchase docs — defect? seed consignment perm defs?
- **F-0138** Goods Dispatch Note repo: register or archive? · **F-0139** GDN requires Member Card (clone leftover) — bug? NO_JOURNAL_CREATED job noise on signum-0 docs — document or fix?
- **F-0140** consignor billing: Payment tab and SAVE broken as shipped — fix or hide?
- **F-0142** Inbound Delivery Order: register or archive? · **F-0143** stock-requisition approval settings not enforced — keep "not enforced" wording?
- **F-0144** Purchase GIN 0/0 intended? Stock Out applet planned? · **F-0145** GIN dead settings/perm seeds — tickets?
- **F-0147** delete the stock-take intro page + alias? · **F-0148** module pages claim stock-take variance posting that does not exist — correct or planned feature?
- **F-0150** GRN Stock In: intercompany Search creates a non-stock GRN; line GL ignored — intended?
- **F-0154 SERIOUS** Inventory Item Maintenance: Main-tab Save dead in source — confirm deployed build; **F-0153** delete the inventory-workflow duplicate + alias.
- **F-0155 ACCOUNTING** GRN Stock In / PI No Stock In accrual never clears by the tax amount — backend fix? · **F-0156** self-billed e-invoice UI without backend support — add type or hide?
- **F-0158** purchase quotation KO tab copied from PO — fix (PR→PQ row) or document as-is?
- **F-0160** Merchant Access: stub to exclude, or where is its source? · **F-0161** NSTI import/manual lines inert; Merchant Admin delete/ID/verify-email risks — tickets?
- **F-0163 LIKELY LIVE BUG** Purchase Refund Note: backend signums flipped 2026-04-23, applet not updated → creation should fail. Confirm and fix.
- **F-0167 POLICY** staff login e-mail visible in the top bar of most kept screenshots — acceptable, or recapture all? · **F-0166** Organization backend oddities — tickets?
- **F-0169 APPROVALS** auto-FINAL on the first approval; FINAL never gated — intended? (PR and PO)
- **F-0172** pricebook client/server evaluation divergence + eval() — bugs? · **F-0173** Akaun Price Book row: document or clean?
- **F-0175** PDG applet: customer-specific (exclude) or keep? · **F-0176** PDG async create hides failures — tickets?
- **F-0179** SUPPLIER_RTV quantity +1 intended? · **F-0180** queue Stock Level Monitoring (ACTIVE, no page)?
- **F-0184** shipping pricebook: storefront divergences + inactive books still offered — issues?
- **F-0186** Seller Admin: register or retire? · **F-0187** Seller Applet live anywhere? (12 dead controls)
- **F-0189** Stock Conversion: Input adds stock — intended? DEFAULT_BRANCH silent prerequisite.
- **F-0192** shopping cart: back-office edit breaks line-integrity checkout — ticket?
- **F-0194** stock replenishment: zero-qty PO default, duplicate lines on re-run, dead filters — tickets?
- **F-0195** Supplier Delivery Order: drop-ship to customers or delivery to tenant? (blocks the guide)
- **F-0197** stock reservation expiry/bin paths drift availability — tickets? · **F-0198** commission a Scheduler applet page?
- **F-0040** which Tax Configuration page is canonical; **F-0041** document the Reimbursement Payment
  Voucher applet?; **F-0042** resolved (three distinct applets; see F-0099).

- **Email/Drive access WORKS** via the service-account delegation (verified 2026-09-05, `kb/sources/email/ACCESS.md`, `kb/sources/gdrive/ACCESS.md`) for vincent@aimatrix.com. **Still needed from Vincent:** add `gmail.readonly` to the bigledger.com service account's domain-wide delegation so support@bigledger.com and colleagues' mailboxes can be read (currently `unauthorized_client`).

- ADR-0002: is `accounts-receivable-applet` real (wiki issue #20) or was the issue mistaken?
- ADR-0001: per-section v1-vs-v2 winners (comparison table to be produced by a `decide` unit).

## Log

| # | Date | Kind | Unit | Result |
|---|---|---|---|---|
| 1 | 2026-09-05 | batch | F-0017 quality gate on deploy (+ F-0035 mojibake ×94 in 7 pages, one duplicate H1) | Shipped 54caf966→4be6bca2. CI quality job green (lints, lychee-gated 383, Playwright 42/42); deploy needs it. First CI run failed twice on install steps (repo has hugo/ dir; lychee archive nests binary) — fixed. Lints surfaced F-0036 (56 title-less pages) and F-0037; allowlisted. |
| 2 | 2026-09-05 | batch | F-0001..03, F-0037 Indonesian text in Malay pages | Shipped d5858dbf. Two pages fixed in place; the consignment page (Indonesian end to end) archived under planning/ — English is canonical until a real BM translation. Malay lint now has zero exemptions. Follow-up: alias /ms/applets/customer-consignment-applet/ → English page in the next shipping unit (bookmarks currently 404). |
| 3 | 2026-09-05 | lanes | Lanes 1–4 launched (applet standard); lanes 1, 2, 3 run 1 merged: 5 + 4 + 4 pages | Commits 82a38ef5, ccdf5f28, bfcc1a51 via kb/tools/merge-lane.sh (isolated worktree gate). Findings → F-0038..F-0049; METHOD.md written from the three convergent discoveries (shared FieldConfigurationComponent; HIDE/SHOW pairs; posting fixed by backend signums). Lane 4 run 1 merged: 6 pages (Doc Item, Customer, CoA, Cashbook, Stock Availability, Stock Adjustment). Run-1 total: 19 pages / 165. |
| 4 | 2026-09-05 | review | codex on six run-1 pages | 5 rework / 1 fix-minor. Two claims verified WRONG in source and hot-fixed live (CoA missing-GL behaviour inverted; SI stock check is client-side). Standard §4/§6 + METHOD.md corrected (four proofs; posting proof block; settings-location discovery — three lanes had independently hit the same limit). Six reworks queued first in lanes. Lanes 1/3 run 2 merged: +3 +3 (POS General, Sales Report, Membership Admin; Purchase GRN, CP Commerce Admin, Purchase Report). Run totals: L1 8, L2 5, L3 7, L4 9 = 29 pages, 6 back in rework. |
| 5 | 2026-09-05 | batch | F-0039 purchasing module index links; lane recovery after a session rate limit killed all four run-3 lanes mid-page | Both rework pages the lanes were writing (CoA, Sales Invoice) were complete and lint-clean → merged (81d41cad, 31dc862f). merge-lane.sh now includes every kb/topics change (six lane-4 topics had been left untracked). **Pacing rule added: on a 429 session limit, do not retry — wait for the reset time in the error, then relaunch lanes from state.json.** Lanes relaunched. |
| 6 | 2026-09-05 | lanes | Runs merged through the morning: L1 runs 4–7 (SI rework, quotation, car workshop, claims ×2, commission scheme, custom processor, customer consignment); L2 runs 5–8 (PI rework, EcomSync index, budgetary, creditor report); L3 runs 4–5 (PDN rework, blanket PO, delivery installation); L4 runs 4–7 (cashbook + stock availability reworks, driver DO, employee, entity). **67 screenshots with personal data quarantined** (kb/tools/quarantine-images.sh). Lane 1 drained after run 7. | Totals: L1 15, L2 9, L3 9, L4 9 = 42 pages done; ~120 queued. |
| 7 | 2026-09-05 | ingest | First email + Drive ingest (e-invoice): 6 Drive project-note docs, 33 messages / 8 threads | Access verified via service-account delegation (vincent@aimatrix.com; bigledger.com delegation still missing → waiting on Vincent). 4 new topics (+13 facts on e-invoice, 13 consolidation, 13 submission-errors, 7 EMP-ETL sync), lateral facts on 12 neighbours, 7 questions, **13 wiki-impact candidates F-0119..F-0131** (top: Submission History status is a snapshot; monthly consolidation is now processor-driven; duplicate-guard claim in the guide index is wrong; a month-end submission checklist guide is missing). 91 customer-named repo slugs in earlier citations pseudonymised; lint added. |
| 8 | 2026-09-05/06 | lanes | Drained to two lanes (Vincent); lanes 3 and 4 ran runs 15–25 | 73 applet pages live. Two verified security/authorisation items: F-0181 (a customer's Firebase service-account key public via the wiki CDN 2026-02→2026-09, quarantined) and F-0200 (unparenthesised OR in PermissionMigrationUow → soft-deleted tenant-admin grants still resolve). 142 images quarantined. Findings F-0155..F-0202. Session model switched to Opus 2026-09-06 after the Fable quota killed both lanes mid-run (nothing lost — clean tree); lanes relaunched. |

