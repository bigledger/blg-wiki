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

- **E-invoice guide set (2026-09-06)** — six answers unblock the rest of the section:
  1. **F-0236** submission throughput — what should a customer with ~38,000 receipts budget for the 1st–7th? (Two conflicting figures in the notes; may be cheaper to measure than to answer.)
  2. **F-0219 residual / F-0238** publish the intermediary permission set the customer must grant BigLedger on the MyInvois portal? This is the single biggest win left on the setup page.
  3. **F-0226 residual** by-document vs by-branch consolidation — which do we recommend? And by-branch is documented as producing separate e-invoices for foreign counterparties, which contradicts the rule that a consolidated e-invoice cannot carry a foreign buyer. Which is true?
  4. **F-0225 residual** the consolidated-cancellation dropdown — which of the four source-document options are actually offered for a consolidated e-invoice?
  5. **F-0227** self-billed scope (which document types, where the flag is set, whether they can be consolidated) — a whole guide is written and blocked on this.
  6. **F-0228** Peppol participant-ID scheme — our guide and our applet page disagree; the rewrite is blocked.
  Plus: does **einvoice@bigledger.com** route anywhere? (Removed from the setup page rather than published unverified.) Identity-normalisation status?

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
| 9 | 2026-09-06 | write | **First unit in the AWS-standard mode:** the e-invoice guide set, written from `kb/research/2026-09-06-blg-intranet-einvoice-ingest.md` (the guide-by-guide plan built from the intranet + email + Drive ingest) | Shipped d28e4354. Two new guides — **The Month-End E-Invoice Cycle (1st to 7th)** (the highest-value missing page: clear the pools, trigger consolidation, work the Invalid list from the *live-status* export, reconcile) and **Cancelling and Correcting a Validated E-Invoice** (the 72-hour window in UTC, the human-approval step that makes "it's stuck" the commonest ticket, the credit-note path). Corrections to `_index.md` (two false statements, two non-existent reports), `einvoice-validation.md` (identity formatting — 426 of 448 rejections on one measured tenant were formatting, not policy — plus which address BigLedger sends), `einvoice-pools-and-routing.md`, `malaysia-e-invoice-guide.md` (~20 raw `<mcreference>` tags removed) and `myinvois-setup.md` (rewritten to the intermediary model — the old page told readers to obtain a Client ID and generate certificates, which no customer does). Broken links fell 383 → 376. Closed F-0218…F-0226, F-0230; opened F-0236…F-0238. **Six e-invoice questions now block the rest of the section** — see Waiting on Vincent. Self-billed and Peppol deliberately not written. |
| 10 | 2026-09-06 | write+batch | Completing the e-invoice section (module hub + applet references + diagram + gap pass); Lane 4 run 29 (Workflow Design); site-wide relative-card-link sweep | Shipped 91a01519, 373e0525, 7fb34418. **Broken links 383 → 273 across the day** — 103 of them from one pattern nobody had noticed: 118 Hextra `card` links written relative (`link="einvoice-validation"`), which a browser resolves and a link checker does not, and which any page move silently strands (F-0242). The e-invoice module hub carried the certificate/API-key falsehood on five more pages than F-0229 named, and `reports/_index.md` listed five reports that do not exist — both corrected. LHDN core workflow redrawn as a theme-safe inline SVG shortcode. Workflow Design's old page claimed webhooks, notifications, conditional routing, delegation and version control — none of it exists (F-0244), and the wiki has been pointing customers at the **inert** approval engine while the real one is `bl_fi_generic_doc_approval_*` (F-0245). Lane 2 fully drained into lane 4 (24 queued). New: F-0239…F-0248. |
| 11 | 2026-09-06 | batch+review+decide | Approvals sweep (Vincent's correction); Lane 4 run 30; GPT review of the e-invoice set; ADR-0006 | Shipped f25a917f, feab49c4. **Vincent corrected the model, not just a page**: approvals are OPTIONAL, and the wiki was documenting the inert engine. Proof from source — `GenericDocumentService` never mentions approval; the approval processor *calls* the finalise method, so approval causes FINAL and FINAL never requires approval. Sweep: **209 pages read, 77 wrong, 75 fixed across 80 files** (13 pointed at Workflow Design, 48 made approval look mandatory, 30 invented features); new canonical `/guides/document-approvals/`. Lane 4 run 30: Deposit, Developer SysAdmin, Engagement, Event Management — and the finding that closes three runs' worth of loose ends: **the only screen that would seed client-side permission definitions is a mock**. Vincent's permission taxonomy (client-side / company / branch / location / IMPLICIT) verified against `app_perm_dfn`: 11,183 defs, 10,410 `NA` vs 762 `UNIQUE` scoped to company, branch, location or entity, **zero** SHOW_*/HIDE_* (F-0250…F-0252). GPT's adversarial review of the eight e-invoice pages filed — verdict: does not meet the no-trainer bar; its top blocker is the same MyInvois intermediary permission set already waiting on Vincent. **ADR-0006 accepted** (per-module concepts layer + source-generated error index) with `specs/concepts-layer.md`. Two more anonymous endpoints found (F-0255, F-0256). New: F-0249…F-0260. |
| 12 | 2026-09-06 | write | ADR-0006 concepts pilot: three e-invoice concept pages + six guides de-duplicated | Shipped ae64ec9b; broken links 273 → 270. **The required self-check does not clear the ADR**: verdict *"better, but by less than the rework cost, and mostly through de-duplication that the layer prompted rather than delivered"*. Deleting twelve duplicated lines from the pools guide needed somebody to notice the duplication, not a concepts layer. Two structural errors in the spec I wrote (F-0262): `modules-v2/e-invoice/core-concepts/` already existed, so the menu now has sibling "Concepts" and "Core Concepts"; and placing concepts under `modules-v2/` puts them in the architecture section while the reader who needs them is in `/guides/` — AWS keeps concepts inside the same user guide. **Rollout to a second module is held.** Also surfaced F-0264: the RM 10,000 divert is enforced for only two document types, so credit/debit/refund notes and returns above RM 10,000 may already be sitting inside consolidated e-invoices at LHDN in a shape LHDN forbids. Next unit is the ADR's own go/no-go test — write one P0 procedural gap and measure whether the concept pages made it cheaper. |
| 13 | 2026-09-06 | decide | ADR-0007 (proposed): applets that are built but not registered; Lane 4 run 31 merged | Lane 4 run 31 shipped 06e9d56e (Fixed Asset, RMA Internal) — and found the worst product defect in 31 runs: **every depreciation journal posts with zero lines**, because the processor only appends a line when two subledger columns are non-null and nothing in the Java tree ever sets them; the validator has no line-count or debit=credit check, so a POSTED header with no lines is written silently (F-0265). Also a **fourth** approval engine (RMA's `SVCApprovalStatus`), and the finding that a stale screenshot is a factual error — Fixed Asset's whole configuration section had been transcribed from an image whose menu was commented out upstream months earlier (F-0271). 22 more images quarantined (206). **ADR-0007 drafted as `proposed`**: three maintained applet repos now have no ACTIVE registry row (Group Maintenance, E-Mandate, Team Maintenance), affecting seven wiki pages — archive rather than publish, track for auto-restore, delete the four "Introduction to…"/"Installation of…" stubs outright, and ask the platform team once about the pattern rather than three times about instances. Needs Vincent. |
| 14 | 2026-09-06 | write | The top P0 gap: incoming supplier e-invoices — and the ADR-0006 go/no-go test | Shipped 805e3708. **The wiki was instructing readers to perform a daily task no customer has ever been able to do.** Verified across the backend, five applet repos, the internal knowledge repo and a read-only sweep of **89 of 93 production tenants**: three inbound pipelines, none connected. The LHDN inbound pull is write-only (its consumer carries the comment *"the lhdn api is not available yet"* and has zero callers); *From IRB E-Invoice* holds **0 rows on every tenant**; the live matcher is fed only by PEPPOL and e-mail OCR and pairs on four-field exact equality; **nothing has ever matched** — matched-history empty on all 89 tenants while 35,704 purchase-doc and 626,732 sales-doc rows have queued since August 2024. The new guide teaches the manual path that does work and is honest about the rest (F-0273…F-0275). **ADR-0006's own test failed** (F-0276): the concept pages made no measurable difference and one was a net cost — linked only to be contradicted. §1 rollout held; the ADR now carries an Outcome section. |
| 15 | 2026-09-06 | measure | Audit of `developers/` — the section that has never been audited | ~24,000 lines including several 1,000-line API references, and every audit of `content/en/applets/` so far has found large-scale invention. Ground truth is the controller mappings in `akaun-api`. Unit measures the invention rate per API-reference page before anything is rewritten, settles two positioning questions (**does BigLedger actually have webhooks; is there an MCP server** — CLAUDE.md's product line claims MCP is first-class), and fixes only the unambiguous: the eleven phantom cards on `developers/_index.md` and two on `getting-started.md` (F-0243). Running. |
| 16 | 2026-09-06 | batch | Developers audit acted on; UTM tender pages unpublished; core1 kept off the public site | Shipped 8e122d4c, a59fa3e8. **The `/developers/` REST reference documented an API that does not exist** — 24 of 240 endpoints real (10%), eight main pages at **0%**, every hostname NXDOMAIN, `/api/v1/` paths against a backend with 17,256 mappings all under `/core2/`. Vincent: **v1 is core1, deprecated, and must not be known to the public** — so 16 pages are now `draft: true`, `api-reference/_index.md` is an honest index carrying the real route shape, `modules/pos.md`'s fabricated REST block is gone, and content-lint fails on `/api/v1`/`core1` in any published page. Two verified survivors kept and promoted: `einvoice-api-reference/` (95%) and `platform-library/`. Also: **eleven pages naming a prospect's evaluation panel were live** — archived on Vincent's decision with aliases, and a lint added; the same lint's sibling check caught **three surviving blockchain-era stubs** ("Wallet API", "Smart Contract API", "Building a Simple DApp") that the 2026-09-05 cleanup missed because it grepped only the literal word. Broken links **270 → 176**. Positioning answers: webhooks are real but have no HMAC and no retry (we promise both); **there is no MCP server** and the only mention in any repo is a spec headed "Why NOT an MCP Server?" (F-0287, needs Vincent). New: F-0283…F-0290. |
| 17 | 2026-09-06 | write | The applet development path, rebuilt from source for an external developer | Shipped 47e68247: `developers/applets/` — `_index`, `getting-started` (empty directory → running bundle, every command from a real repo config) and `applet-development`. Written from BigLedger's own template applet read end to end, confirmed against three more. The runtime contract is verified **from both sides**: the source constant `appletMainRouter` and the `app.module.ts` element name match the live `bl_applet_hdr` row exactly. **The honest answer to Vincent's Android bar: an outsider can build and host a bundle but cannot get it running** — registration is not self-service, `blg-shared-utilities` is private and not on npm, there is no public reference applet and no local shell (F-0296). Also unpublished `architecture/_index.md`, live and claiming a Node/Express/Kubernetes stack against a Java/Spring Boot backend **plus SOC 2 / ISO 27001 / GDPR certifications nobody has evidenced** (F-0294). |
| 18 | 2026-09-06 | decide | **ADR-0008 (verify or unpublish) + the three streams** — Vincent's two standing instructions | Vincent authorised unpublishing unconfirmed content to a worklog, and asked for separate places for questions to him and for product findings. **ADR-0008** sets the threshold, because 618 pages exist and only 105 have ever been checked: tier 1 (source contradicts) and tier 2 (unconfirmable **and** actionable) come down; tier 3 (unverified, plausible, non-actionable) stays and joins an audit backlog. A page mixing tiers goes. Guard rails: evidence with file:line before removal, never delete, links repaired in the same commit, report to Vincent if more than five pages go at once. `planning/worklog/` created and **backfilled with 20 entries** for everything unpublished today. **`planning/questions/`** (20 open, ordered by cost of delay) and **`planning/product/`** (30 issue-shaped findings: 10 security, 4 data-loss, 5 broken) split what was one tangled inbox. CLAUDE.md carries both rules and the routing table. |
| 19 | 2026-09-06 | write | The data-hub integration path — the second external audience | The applet path is written; this is the other job Vincent named for `developers/`. Unit establishes from source what the data-hub actually is (the `etl-ep` surface, 952 mappings, plus the three ETL registry rows), how an external system authenticates, whether it is push or pull or both, whether any of it is self-service, and the real limits — then writes the path and **rewrites `authentication.md` from source and un-drafts it if it can be established fully**. Answers most of Q-0014 as a side effect. Lane 4 run 33 relaunched alongside it, now carrying the ADR-0008 unpublish authority and the three-stream routing. |

