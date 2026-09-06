---
purpose: Open proofreading feedback from Vincent on the live site. Recorded here first, fixed later in batches.
rule: Do NOT fix items as they arrive. Record, then batch by page.
---

# Feedback inbox

Every item Vincent reports while proofreading https://wiki.bigledger.com lands here
**before** anything is edited. Items are grouped by page so that one batch touches
one page once. When a batch is processed, its items move to `batches/YYYY-MM-DD-<slug>.md`
with the analysis, the changes made, and the commit hash.

## Item format

```
### /user-guide/some-page/                      ← live URL path, one H3 per page
- [x] F-0001 (2026-09-05) "verbatim or near-verbatim of what Vincent said"
      → source: content/en/user-guide/some-page.md
      → note: anything Claude noticed while recording (optional)
```
      → lint: allowlisted in tests/lint-allowlist.tsv (key malay) until fixed; remove the line when done
      → batch: batches/2026-09-05-malay-pages.md — archived to planning/archive/ (Indonesian throughout; English page is canonical until a proper BM translation exists)

- IDs are sequential across the whole inbox, never reused.
- Keep Vincent's words. Do not paraphrase the complaint into something tidier.
- If an item is not page-specific (site-wide, nav, theme), file it under `### site-wide`.
- If an item is a *design* or *structure* question rather than a fix, record it here
  AND open a discussion in `../discussions/`.

## Open items

### /ms/applets/customer-consignment-applet/
- [ ] F-0001 (2026-09-05) Indonesian vocabulary in a Malay page: inventaris ×3, bisnis ×2, melacak, bisa, fitur, mengelola
      → source: content/ms/applets/customer-consignment-applet.md
      → note: found by Claude during the translation survey, not reported by Vincent. Malay: inventori, perniagaan, menjejak, boleh, ciri, mengurus

### /ms/applets/driver-delivery-order-applet/
- [x] F-0002 (2026-09-05) Indonesian vocabulary: pengiriman, mengelola
      → source: content/ms/applets/driver-delivery-order-applet.md
      → note: Malay: penghantaran, mengurus
      → lint: allowlisted in tests/lint-allowlist.tsv (key malay) until fixed; remove the line when done
      → batch: batches/2026-09-05-malay-pages.md — fixed: pengiriman→penghantaran, kelola→urusan, mengelola→mengurus

### /ms/applets/internal-sales-order-applet/
- [x] F-0003 (2026-09-05) Indonesian vocabulary: fitur
      → source: content/ms/applets/internal-sales-order-applet.md
      → note: Malay: ciri
      → lint: allowlisted in tests/lint-allowlist.tsv (key malay) until fixed; remove the line when done
      → batch: batches/2026-09-05-malay-pages.md — fixed: fitur→ciri

### /applets/e-invoice/my-einvoice-for-customer-and-supplier-applet/
- [ ] F-0004 (2026-09-05) "we actually DO NOT HAVE this applet 'MY E-Invoice for Customer & Supplier Applet', i do not know why you included this ... This is a non-existence applet"
      → source: content/en/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet.md
      → also listed on: content/en/modules-v2/e-invoice/_index.md (live: /modules-v2/e-invoice/)
      → note: Vincent's wider ask — "i am not sure how many other similar mistakes you made, I would need you to ensure the consistency of the entire wiki website." → site-wide applet-existence audit, see discussions/2026-09-05-applet-existence-audit.md

### site-wide
- [ ] F-0005 (2026-09-05) Audit every documented applet against the real applet registry; remove or flag any that do not exist. Raised with F-0004.
      → note: analysis task, not a single-page fix. DONE 2026-09-05 → discussions/2026-09-05-applet-existence-audit.md (12 phantom candidates, 3 pages on a DELETED applet, 33 broken product→wiki doc links, ~12 title mismatches, 80 undocumented). Decisions taken 2026-09-05 → ADR-0002. Alias batch DONE: batches/2026-09-05-product-doc-link-aliases.md. Remaining batches (archive phantoms, merge renamed page, retitle + applet_code) pending.

### / (home page)
- [x] F-0006 (2026-09-05) "The home page https://wiki.bigledger.com/ is quite ugly too, need redesign"
      → source: content/en/_index.md (160 lines) + layouts/ (custom index templates, if any)
      → note: design/structure item, not a fix → discussion opened: discussions/2026-09-05-home-page-redesign.md. Depends on ADR-0001 (the home page must point at the new tree, so redesign after or alongside the restructure).
      → batch: batches/2026-09-05-home-page-redesign.md

### /applets/master-data/inv-item-maintenance-applet/ (duplicate page)
- [ ] F-0007 (2026-09-05) Same applet documented twice: master-data/inv-item-maintenance-applet.md (313 lines, 2026-05-12) and inventory-workflow/inv-item-maintenance-applet.md (301 lines, 2026-03-15)
      → note: found by Claude during the alias batch. Alias placed on the master-data copy (newer). Dedup in the applet-naming batch (ADR-0002).

### site-wide
- [x] F-0008 (2026-09-05) "i would like the whole website to be search engine friendly, as well as GEO... (easily pickup by ai crawling), i hope the ai engine to pick up all our akaun.com or bigledger as key words, so that they don't steal the knowledge without mentioning bigledger and akaun.com"
      → note: cross-cutting; discussion opened: discussions/2026-09-05-seo-and-geo.md. hugo.yaml already declares an `llms` output format (unused?) — check.
      → batch: batches/2026-09-05-seo-geo-layer.md (site-level layer; content-side items split out as F-0019/F-0020)

### site-wide
- [ ] F-0009 (2026-09-05) Site description in hugo.yaml (all 4 languages) says "Next-Generation Blockchain Platform". BigLedger/Akaun is an ERP. This string is the site meta description AND the summary line of the generated llms/index.txt that AI crawlers read.
      → source: hugo.yaml languages.{en,zh,ms,ar}.params.description
      → note: found by Claude during the SEO/GEO audit. One-line fix per language, but wait for the canonical brand string decision (F-0008).

### /applets/master-data/doc-item-maintenance-applet/
- [ ] F-0010 (2026-09-05) Page embeds 5 screen-recording GIFs totalling 213 MB (largest 61.6 MB); page image weight 226 MB. Unusable on mobile; kills Core Web Vitals.
      → source: content/en/applets/master-data/doc-item-maintenance-applet.md, static/images/doc_item_maintenance/*.gif
      → note: convert to short MP4/WebM (10-20x smaller) or replace with 3-4 stills. Two more pages exceed 20 MB (modules/cp-commerce/_index.md, applets/purchase-workflow/internal-purchase-gin-applet.md). static/images is 863 MB total.

### site-wide
- [ ] F-0011 (2026-09-05) Invented "future roadmap / emerging technologies / next-generation features" sections on 23 pages — quantum-ready algorithms, augmented reality, voice-activated commands, IoT pricing, self-checkout, etc. None are product commitments. Found while removing the blockchain claims (F-0009).
      → source: list in scratchpad roadmap-pages.txt (regenerate: grep -rliE "future (enhancements|roadmap|features)|emerging technolog|next-generation features" content/en)
      → note: one batch — delete every such section outright. A docs site documents what exists; roadmap belongs to product marketing, and these were never real.

### / (home page)
- [x] F-0012 (2026-09-05) Home page description/hero claims "Trusted by 1 Million Users" and "100+ Integrated Modules". Unverified marketing numbers on a docs site; also the page-level description that overrides the new site description in <head>.
      → source: content/en/_index.md (description: + hero-subtitle)
      → note: Vincent to confirm or replace. Fold into the home-page redesign (F-0006).
      → batch: batches/2026-09-05-home-page-redesign.md

### site-wide
- [ ] F-0013 (2026-09-05) 383 broken internal links (196 distinct targets) in the production build — relative hrefs like `core-concepts`, `use-cases`, `../../guides/sales-guides/standard-sales-workflow` resolved from the wrong depth. Pre-existing; the test runner had never actually run lychee (two harness bugs fixed today).
      → source: list in planning/research/2026-09-05-broken-internal-links.md
      → note: fix as one batch: rewrite to root-relative `/path/` links. Many will be superseded by the ADR-0001 restructure, so sequence after the spec or fix only the ones that survive.

### /applets/master-data/cashbook-applet/
- [x] F-0014 (2026-09-05) LIVE: unresolved Git conflict markers (`<<<<<<< Updated upstream` … `>>>>>>> Stashed changes`, lines 37–47) plus 5 lines of mojibake, rendered on the public page.
      → source: content/en/applets/master-data/cashbook-applet.md
      → note: found by GPT-5.6-sol review, verified. Severity: customer-visible. Recommend immediate hygiene batch with F-0015/F-0016.
      → batch: batches/2026-09-05-production-hygiene.md

### /support/beginner-guide/cost-and-roi-questions/
- [x] F-0015 (2026-09-05) LIVE: a raw AI tool-call transcript (`<function_calls><invoke name="TodoWrite">…`) is published at the end of the page (line ~541).
      → source: content/en/support/beginner-guide/cost-and-roi-questions.md
      → note: found by GPT-5.6-sol review, verified. Only occurrence repo-wide. Severity: customer-visible.
      → batch: batches/2026-09-05-production-hygiene.md

### / (home page) + footer
- [x] F-0016 (2026-09-05) 9 dead links on the home page and site footer, verified live 404: /ecommerce/, /partners/, /partners/resources/, /partners/training/, /privacy, /security, /terms, /user-guide/introduction/ (the "Start Free Trial" button), /user-guide/industry-solutions/automotive-and-workshop-industry.
      → source: content/en/_index.md, layouts/partials/custom/footer.html
      → note: found by GPT-5.6-sol review, verified. /privacy /terms /security need real pages or removal — a docs site without a privacy page is also an SEO/trust signal (F-0008).
      → batch: batches/2026-09-05-production-hygiene.md

### site-wide
- [x] F-0017 (2026-09-05) deploy.yml runs only `hugo --minify`; the lychee + Playwright suite never gates a deploy. A conflict-marker page (F-0014) reached production because nothing checks.
      → source: .github/workflows/deploy.yml, tests/run-all.sh
      → note: GPT roadmap item #2. Add a quality job (build + lychee offline + Playwright + front-matter/marker/artefact lints) that deploy needs.
      → batch: batches/2026-09-05-quality-gate.md

### /zh/ /ms/ /ar/ (home pages)
- [ ] F-0018 (2026-09-05) The Chinese, Malay and Arabic home pages still use the old marketing hero and hit the same hextra-home layout bug (single narrow column). Port the new English home (ADR-0004) to all three — translated, same shortcodes; Malay in Bahasa Melayu.
      → source: content/zh/_index.md, content/ms/_index.md, content/ar/_index.md
      → note: found while shipping F-0006. Translation batch per ADR-0003.

### site-wide
- [ ] F-0019 (2026-09-05) 57 pages under content/en have no `description:` front matter — they fall back to an auto-summary in meta description, og:description and JSON-LD. Write one-sentence descriptions that name the outcome and, where natural, BigLedger.
      → note: split from F-0008. List: `grep -L '^description:' $(find content/en -name '*.md')`.

### site-wide
- [ ] F-0020 (2026-09-05) 54 pages carry "Work in Progress / under development / coming soon" banners in production. Credibility problem for readers and a quality signal for crawlers. Policy needed: finish, unpublish (draft: true), or a single honest "in review" note.
      → note: split from F-0008 and GPT review roadmap #1. List: `grep -rliE "work in progress|under progress|under development|coming soon" content/en`.

## From GitHub issues (bigledger/blg-wiki, ingested 2026-09-05 — source ids in kb/sources/github-issues/ledger.jsonl)

### site-wide
- [ ] F-0021 (2026-09-05) GitHub issue #1: "Create documentation for UTM project" — open since/updated 2026-03-05, 0 comments, 478 chars of body
      → source: (no matching applet page — check registry / slug)
      → src: gh:bigledger/blg-wiki#1

### site-wide
- [ ] F-0022 (2026-09-05) GitHub issue #2: "Request: CMS Testing - Identify Broken Links" — open since/updated 2026-01-22, 0 comments, 805 chars of body
      → source: (no matching applet page — check registry / slug)
      → src: gh:bigledger/blg-wiki#2

### site-wide
- [ ] F-0023 (2026-09-05) GitHub issue #3: "Review Request: Demo Guide Introduction and Role-Based Journeys" — open since/updated 2026-01-22, 0 comments, 2141 chars of body
      → source: (no matching applet page — check registry / slug)
      → src: gh:bigledger/blg-wiki#3

### site-wide
- [ ] F-0024 (2026-09-05) GitHub issue #20: "accounts-receivable-applet User Guide" — open since/updated 2026-03-02, 1 comments, 10 chars of body
      → source: (no matching applet page — check registry / slug)
      → src: gh:bigledger/blg-wiki#20

### site-wide
- [ ] F-0025 (2026-09-05) GitHub issue #27: "cashbook-applet User Guide" — open since/updated 2026-01-09, 0 comments, 0 chars of body
      → source: (no matching applet page — check registry / slug)
      → src: gh:bigledger/blg-wiki#27

### /applets/finance/deposit-applet/
- [ ] F-0026 (2026-09-05) GitHub issue #56: "[deposit-applet] User Guide Documentation" — open since/updated 2026-06-21, 6 comments, 1967 chars of body
      → source: content/en/applets/finance/deposit-applet.md
      → src: gh:bigledger/blg-wiki#56

### /applets/master-data/forex-applet/
- [ ] F-0027 (2026-09-05) GitHub issue #62: "[forex-applet] User Guide Documentation" — open since/updated 2026-01-19, 0 comments, 309 chars of body
      → source: content/en/applets/master-data/forex-applet.md
      → src: gh:bigledger/blg-wiki#62

### site-wide
- [ ] F-0028 (2026-09-05) GitHub issue #69: "[internal-goods-delivery-note-applet] User Guide Documentation" — open since/updated 2026-01-09, 0 comments, 332 chars of body
      → source: (no matching applet page — check registry / slug)
      → src: gh:bigledger/blg-wiki#69

### /applets/purchase-workflow/internal-purchase-return-applet/
- [ ] F-0029 (2026-09-05) GitHub issue #90: "[internal-purchase-return-applet] User Guide Documentation" — open since/updated 2026-06-29, 6 comments, 9268 chars of body
      → source: content/en/applets/purchase-workflow/internal-purchase-return-applet.md
      → src: gh:bigledger/blg-wiki#90

### /applets/sales-workflow/internal-sales-invoice-applet/
- [ ] F-0030 (2026-09-05) GitHub issue #104: "[internal-sales-invoice-applet] User Guide Documentation" — open since/updated 2026-06-11, 6 comments, 4692 chars of body
      → source: content/en/applets/sales-workflow/internal-sales-invoice-applet.md
      → src: gh:bigledger/blg-wiki#104

### /applets/sales-workflow/internal-sales-quotation-applet/
- [ ] F-0031 (2026-09-05) GitHub issue #107: "[internal-sales-quotation-applet] User Guide Documentation" — open since/updated 2026-01-09, 0 comments, 328 chars of body
      → source: content/en/applets/sales-workflow/internal-sales-quotation-applet.md
      → src: gh:bigledger/blg-wiki#107

### /applets/master-data/pricebook-applet/
- [ ] F-0032 (2026-09-05) GitHub issue #128: "[pricebook-applet] User Guide Documentation" — open since/updated 2026-03-02, 1 comments, 379 chars of body
      → source: content/en/applets/master-data/pricebook-applet.md
      → src: gh:bigledger/blg-wiki#128

### /applets/finance/statement-of-account-applet/
- [ ] F-0033 (2026-09-05) GitHub issue #141: "[statement-of-account-applet] User Guide Documentation" — open since/updated 2026-02-13, 0 comments, 324 chars of body
      → source: content/en/applets/finance/statement-of-account-applet.md
      → src: gh:bigledger/blg-wiki#141

### site-wide
- [ ] F-0034 (2026-09-05) GitHub issue #200: "[internal-sales-order-applet-v2] User Guide Documentation" — open since/updated 2026-05-04, 3 comments, 1707 chars of body
      → source: (no matching applet page — check registry / slug)
      → src: gh:bigledger/blg-wiki#200

### /applets/finance/mm-deposit-applet/
- [x] F-0035 (2026-09-05) 57 mojibake sequences (â€‘ for non-breaking hyphens, â€” for em dashes, â€œ/â€ for quotes) across the page. Found by the new content lint; fixed mechanically in the quality-gate batch.
      → source: content/en/applets/finance/mm-deposit-applet.md
      → batch: batches/2026-09-05-quality-gate.md

### site-wide
- [ ] F-0036 (2026-09-05) 56 pages have no `title:` front matter — 35 under developers/api-reference (UCC controllers, some with spaces in filenames), 20 under modules/membership + modules-v2/membership, 1 zh applet. They render with filename titles and ugly URLs.
      → note: allowlisted in tests/lint-allowlist.tsv (key title) so the gate can ship; one batch to add titles (and rename the 12 space-containing filenames with aliases).

### /ms/applets/internal-sales-order-applet/
- [x] F-0037 (2026-09-05) Indonesian "fitur" ×3 in a Malay page (Malay: ciri). Found by the content lint; joins F-0001..F-0003.
      → source: content/ms/applets/internal-sales-order-applet.md
      → lint: allowlisted (key malay) until fixed
      → batch: batches/2026-09-05-malay-pages.md — fixed: fitur→ciri ×3

## From Lane 2 findings (2026-09-05, planning/lanes/lane-2/findings.md)

### /applets/purchase-workflow/internal-purchase-grn-applet/ + /guides/purchasing-guides/standard-procurement-workflow/
- [ ] F-0038 (2026-09-05) Stock-movement claim inverted: backend constants say Purchase Invoice (Internal) posts stock IN (quantity signum +1) and Purchase Invoice No Stock In posts 0; GRN Stock In posts +1. The GRN page and the standard-procurement guide describe the opposite. Lane 2 rewrote the PI page to match the code; the GRN page (lane 3) and the guide still say the old thing.
      → source: content/en/applets/purchase-workflow/internal-purchase-grn-applet.md, content/en/guides/purchasing-guides/standard-procurement-workflow.md
      → src: refs/blg-akaun-platform-java/javasdk/.../FinancialDocDataConsistencyObject/InternalPurchase*DataConsistencyObject.java
      → note: WAITING ON VINCENT to confirm before lane 3 and the guide are corrected (loop.md).

### /modules-v2/purchasing/
- [x] F-0039 (2026-09-05) Module index links "Purchase Invoice Applet" (lines 19, 31) to the No-Stock-In variant page instead of /applets/finance/internal-purchase-invoice-applet/.
      → source: content/en/modules-v2/purchasing/_index.md
      → fixed 2026-09-05 (loop unit 5): both cards now link /applets/finance/internal-purchase-invoice-applet/

### site-wide (applets)
- [ ] F-0040 (2026-09-05) Tax Configuration is documented twice with the same title: applets/finance/tax-config-applet.md and applets/master-data/tax-configuration-applet.md. One must become canonical (alias the other). Decision for Vincent.
- [ ] F-0041 (2026-09-05) Reimbursement Payment Voucher Applet (Internal) is ACTIVE (since 2025-04) with a repo and no wiki page. Add to lane 2's queue? Decision for Vincent.
- [ ] F-0042 (2026-09-05) Registry documentation_url for creditor_report_applet points at the combined debtor-and-creditor page while the separate creditor-report-applet.md also exists — merge the separate page into the combined one? Decision for Vincent.
- [ ] F-0043 (2026-09-05) ~28 related_applets back-links requested by lane 2 on pages owned by lanes 1/3/4 (list in lane-2/findings.md "Cross-lane link requests"). Apply after those lanes' current runs, as one cross-link batch.

## From Lanes 1 and 3 findings (2026-09-05)

### site-wide (applets — permissions)
- [ ] F-0044 (2026-09-05) Every applet checks `SHOW_*_MENU` (and SHOW_DRAFT_BUTTON, SHOW_GENDOC_CLONE_BUTTON, ALLOW_APPROVE_SELL_BELOW_PRICE, ALLOW_<TYPE>_ITEM_PRICE_EDIT) client-side permission codes that are NOT seeded in bl_applet_client_side_perm_dfn for those applet codes. Either a master-registry omission or per-tenant seeding — changes how Troubleshooting rows are worded on every page. Decision for Vincent.

### /applets/purchase-workflow/internal-purchase-debit-note-applet/ + credit-note + /applets/sales-workflow/internal-sales-debit-note-applet/
- [ ] F-0045 (2026-09-05) Posting direction: backend fixes Purchase Debit Note amount signum +1 (Dr Creditor / Cr Purchase — supplier balance DOWN) and Purchase Credit Note −1 (balance UP). The old pages said the opposite; lane 3 rewrote both to follow the code. Vincent to confirm this is the intended semantics. Also: the intercompany table pairs Sales Debit Note (+1, AR up) → Purchase Debit Note (+1, AP down) — name-matched but financially opposite — bug or intended?
      → src: refs/blg-akaun-platform-java/javasdk/.../InternalPurchaseDebitNoteDataConsistencyObject.java

### /applets/sales-workflow/internal-sales-order-applet/
- [ ] F-0046 (2026-09-05) Lane 1 removed the "Under Review" banner and corrected: CLOSE is a per-line action, not a document status. Vincent to confirm the banner removal. Pre-existing image filenames name third-party marketplaces (so-shopee-ecomsync.png, so-lazada-ecomsync.png); captions neutralised — keep or rename?

### site-wide (registry hygiene)
- [ ] F-0047 (2026-09-05) Registry hygiene found by lanes: trailing spaces in `name` (internalSalesReturnApplet, salesContractApplet); duplicate rows sharing a code with one DELETED (InternalSalesDebitNote, internal_purchase_invoice_applet); documentation_url for the purchase debit note still points at Confluence. Platform-side fixes; list for Vincent.

### site-wide (undocumented ACTIVE applets seen by lanes)
- [ ] F-0048 (2026-09-05) SFA (Sales Force Automation), the marketplace sales-order applet (registry name "Tiktok Sales Order Applet"), internalconsignmentGRNApplet, the three CORE1 "… - Delivery Order" rows, Reimbursement Payment Voucher (F-0041). Add to lane queues once Vincent confirms they are general-purpose.

### cross-link batch (lanes 1+3, joins F-0043)
- [ ] F-0049 (2026-09-05) ~30 (lane 1) + 14 pages (lane 3) of related_applets back-links plus two content requests (chart-of-account: MISSING_DEFAULT_GL_CODE behaviour; stock-availability: open sales orders reduce availability; sales debit note: direction correction). One cross-link batch after the current lane runs.

## From Lane 4 findings (2026-09-05)

### /applets/master-data/customer-applet/
- [ ] F-0050 (2026-09-05) Second page for the same registry row as customer-maintenance-applet (customer_applet_v1); it invents a "front desk / back office" split that does not exist. Merge into customer-maintenance and alias. Decision for Vincent (recommended: merge).

### /applets/master-data/customer-maintenance-applet/ (+ sales pages)
- [x] F-0051 (2026-09-05) The claim that a credit limit "hard-stops a sale" is not supported by javasdk domain code. Removed from the rewritten page pending an answer — kb/questions/2026-09-05-credit-limit-enforcement.md. Decision/answer needed from Vincent or backend lead.
      → ANSWERED 2026-09-06 (lane 4 run 26): supplier side has no enforcement; customer side blocks via a nightly is_customer job + four sales doc types, not a live check at save. See kb/questions/2026-09-05-credit-limit-enforcement.md.

### site-wide (applets — UI defects found by lanes, for the product team, not the wiki)
- [ ] F-0052 (2026-09-05) Three settings screens are unbound (Doc Item Department Settings; Chart of Account and Stock Adjustment Field Settings); the customer create form binds phone `[required]="NOT_MANDATORY_PHONE_NO"` (inverted vs the edit form). Pass on as product bugs; the wiki documents current behaviour.

### /applets/master-data/doc-item-maintenance-applet/
- [ ] F-0053 (2026-09-05) YouTube embed converted from inline-styled HTML to `{{< youtube >}}`. Vincent to confirm keeping the video.

### site-wide (cross-link batch, joins F-0043/F-0049)
- [ ] F-0054 (2026-09-05) 17 back-link entries from lane 4, each with the exact sentence and Java source line the neighbouring page should state (t2t-admin, pos-general, cp-commerce-admin, voucher-management, my-e-invoice-portal, sales order/invoice, accounts-receivable, statement-of-account, general-ledger, ledger-and-journal, financial-report, bank-reconciliation, receipt/payment voucher, purchase order/grn).

## From Lane 2 run 2 (2026-09-05)

### /guides/accounting-guides/financial-reporting/ + /modules-v2/financial-accounting/
- [ ] F-0055 (2026-09-05) The financial-reporting guide documents a three-button Month End Processing flow (closing, COGS, retained earnings); the UI has ONE button — the COGS and Retained-Earnings processor buttons are commented out (backend endpoints exist). Also: a Financial Report snapshot reads only the monthly summaries Month End writes, so an empty Trial Balance = months never closed for that Set of Books — the guide should say so as the first troubleshooting item.
      → source: content/en/guides/accounting-guides/financial-reporting.md
      → src: see kb/topics/financial-report-applet.md and lane-2/findings.md
      → note: WAITING ON VINCENT: are the hidden processors intentional or a regression? The guide correction depends on it.

### site-wide (registry)
- [ ] F-0056 (2026-09-05) Active repos with no ACTIVE registry row: blg-applet-wavelet-month-end-processing-applet (updated 2026-08 — unreleased split or dead?), blg-applet-MITRS-applet. Decision for Vincent.

## From Lane 4 run 2 (2026-09-05)

### /guides/accounting-guides/ (period locking) + /applets/inventory-workflow/stock-transfer-applet/
- [ ] F-0057 (2026-09-05) Stock transfers post no journal (amount_signum 0, absent from JournalPostingTypeHandler) and are explicitly exempt from LOCK_TXN/LOCK_ALL (GenericDocumentService ~L1681-1696): period closing does not stop branch movements. The accounting guides do not mention this. Vincent: document as a feature or report as a gap?
- [ ] F-0058 (2026-09-05) The old Stock Transfer page's approval workflow (Submitted / In Transit / Approve / Reject / Delegate) was invented; removed. Real in-transit record = bl_fi_generic_doc_line_open_queue rows knocked off by the inbound ST-GIN tab.

### site-wide (registry / product)
- [ ] F-0059 (2026-09-05) consignee-stock-transfer has no documentation_url in the registry although the page exists — set it. Consignee applet frontend still carries INTERNAL_CUSTOMER_CONSIGNMENT_IN (+1) state alongside the OUT endpoint — dead code? Open backend issue on auto-creating inbound drafts on outbound FINAL would change the Stock Transfer page if shipped — track in kb/topics/stock-transfer.md.

## From Lanes 1 and 3 run 2 + codex review (2026-09-05)

### /applets/master-data/chart-of-account-applet/ + /applets/sales-workflow/internal-sales-invoice-applet/
- [x] F-0060 (2026-09-05) Codex review (verified in source): CoA page said a missing default GL "saves without a journal" — backend THROWS MISSING_DEFAULT_GL_CODE (JournalPostingService:339,412). Sales Invoice page called VALIDATE_STOCK_ON_FINALIZE a backend check — it is a client-side confirm dialog. Both hot-fixed by the loop; full rework queued in lanes 4 and 1.
      → batch: hot-fix commit (see git log "Hot-fix two inverted claims")

### site-wide (applets) — codex verdicts on run 1
- [ ] F-0061 (2026-09-05) 5 of 6 reviewed run-1 pages marked "rework" (PI, PDN, CoA, Stock Availability, SI) and 1 "fix minor" (Cashbook): model-only settings documented, GL precedence wrong on two pages (correct: line GL → header GL → item-company link → company default), defaults not sourced. Queued as `rework` at the front of each lane. Standard and METHOD.md corrected (four proofs per setting; posting proof block; settings-location discovery).
      → review: planning/reviews/2026-09-05-gpt-5.6-sol-lane-run-1-review.md

### site-wide (registry / permissions)
- [ ] F-0062 (2026-09-05) More unseeded/unread permission codes: posGeneral reads 4 codes not registered and has 3 registered never read; salesReport has 24 SHOW_ADVANCED_SEARCH_* defs the shared search no longer reads (one registered twice); MEMBERSHIPADMIN's SHOW_DOCUMENT_DELETE_BUTTON read nowhere; internalPurchaseGRNApplet seeds SHOW_FINAL_BUTTON (unread) and omits SHOW_GENDOC_* (read); internalPurchaseGrnStockInApplet documentation_url points at the supplier-access page; cp_commerce_admin_console_v1 doc URL still Confluence. Joins F-0044/F-0047.

### product bugs surfaced by lanes (for the product team)
- [ ] F-0063 (2026-09-05) GRN showFinal()/showVoid() ignore both SHOW_FINAL_BUTTON and SHOW_GENDOC_FINAL_BUTTON (only DISCARD honours its override). CP Commerce Admin: Review / Shipping Provider / Users screens complete and routed but commented out of the sidebar. **Personal data in a source repo**: the Membership Admin repo's Membership_Template_Format.csv sample row looks like a real person (name, IC, phone, email) — clean the repo.

### site-wide (undocumented ACTIVE applets, joins F-0048)
- [ ] F-0064 (2026-09-05) posCustomerDisplay (ACTIVE, has a repo, no page).

### orphaned images after invented content was removed
- [ ] F-0065 (2026-09-05) GRN AI-generated infographic (garbled text), two CP Commerce and two Purchase Report images now unreferenced. Delete in a media batch (with F-0010).

### confirmations for Vincent
- [ ] F-0066 (2026-09-05) Lane 1 replaced Sales Report / Membership Admin content describing settings and menus that do not exist in code (calculation sets, "My Sales", physical/virtual card types, custom-status earn/redeem flags) — confirm these were not from a product brief. daily-cashier-report raw iframe → youtube shortcode when reached.

## From Lane 2 run 3 (2026-09-05)

### /guides/accounting-guides/bank-reconciliation-guide/
- [ ] F-0067 (2026-09-05) Four factual corrections from the applet source (lane-2/findings.md): the button label; where possible matches are reviewed; journals never create cashbook lines (so the guide's "post an adjustment journal to fix the variance" step cannot work as written); reconciliation status is ACTIVE/CLOSE. Also document the real auto-match rule: 90-day window either side, four weighted dimensions from the cashbook config_json (defaults 0.25 each), auto-link when exact amount AND payee ≥ 0.85, possible link ≥ 0.55, groups of 2–5 lines summing to one bank line.
      → source: content/en/guides/accounting-guides/bank-reconciliation-guide.md
      → src: kb/topics/bank-reconciliation.md (20 cited facts)
      → note: guide rewrite unit for the loop (not lane territory). High priority — this is the exemplar guide.

### /applets/finance/bank-reconciliation-applet/
- [ ] F-0068 (2026-09-05) Vincent decisions: keep the verbatim Import Format list (real bank names as product labels) or genericise (Q7)? document the 5 inert toggles + 3 unread permissions or file as bugs (Q8)? auto-matcher looks 90 days AFTER the closing date while the grid stops at it — intended (Q9)? permission facts cited from a read-only akaun_master query in findings/ledger rather than a file — acceptable?

## From Lane 2 run 5 (2026-09-05)

### site-wide (applets — method)
- [ ] F-0069 (2026-09-05) The four-proof scan misses (a) checkboxes nested inside gated *ngIf blocks, (b) keys consumed through indirection (panel.expandSetting), (c) keys proven via another listing's Default Selection. Add these three checks to METHOD.md / applet-scan.sh so other lanes do not under-document.

### /applets/purchase-workflow/internal-purchase-debit-note-applet/
- [ ] F-0070 (2026-09-05) Cross-lane correction for lane 3: the `checkIsGenDocConvertibletoVoid` guard runs only in the e-Invoice cancellation queue, not on applet VOID — the PDN page states otherwise. (Lane 3 is reworking that page now — relay.)

### site-wide (registry — seeded-but-unread permissions)
- [ ] F-0071 (2026-09-05) Purchase Invoice: EDIT_CURRENCY_RATE, DISABLE_EMPLOYEE_LOGIN_AUTO_DETECTION, IPI_HIDE_TRACKING_ID_AND_PERMIT_NO, SHOW_SAVE/PRINT/CLOSE/SEND_EMAIL_BUTTON, SHOW_REFERENCE/REMARKS/CURRENCY are seeded and read by no code; the run-1 "EDIT_CURRENCY_RATE overrides the rate lock" claim was an invention (now removed). Joins F-0044/F-0062 for the registry clean-up decision.

## From Lane 4 run 4 (2026-09-05)

### /guides/accounting-guides/ (cash documents) + /applets/master-data/cashbook-applet/
- [ ] F-0072 (2026-09-05) Cash documents are a third posting family: Cash Adjustment posts NO journal (CashDocumentJournalPostingJobProcessor returns for INTERNAL_CASH_ADJUSTMENT — cashbook lines only) and cannot be voided from the applet; cash-document GL comes from the settlement item's sub-ledger link → owning cashbook, no header/company-default fallback; no fiscal-lock check; FINAL edit refused once lines are reconciled. The run-1 cashbook page and the accounting guides said the opposite. Vincent: is "no ledger effect / no VOID" for cash adjustments intended?
      → src: kb/topics/cashbook.md

### site-wide (product / registry, joins F-0044/F-0062/F-0071)
- [ ] F-0073 (2026-09-05) Stock Availability + Cashbook: 11 more unseeded SHOW_* codes; 10+ rendered-but-not-consumed settings; the "initialise true, consumers read stored value" pattern means cost/supplier columns are visible until the first Save, then hidden for everyone lacking a (often unseeded) SHOW_* permission — a confidentiality trap. Report as UX defect?

## From Lane 1 run 4 (2026-09-05)

### static/images — PERSONAL DATA (urgent)
- [x] F-0074 (2026-09-05) 17 screenshots (internal-sales-quotation-applet/edit-form.png, quote-templates.png; all 15 car-workshop-applet/*.png) show real person names, e-mails, phone numbers, tenant-prefixed branch codes. Unreferenced by any page but publicly fetchable. QUARANTINED by the loop: moved to planning/private/quarantined-images/ (gitignored) — the deploy removes them from S3/CloudFront. Vincent: confirm deletion, or re-capture with synthetic data.
- [ ] F-0075 (2026-09-05) Sweep every file under static/images for personal or customer data (names, e-mails, phones, real company/branch names, IC numbers) — the lanes found PII in 17 of the first ~60 screenshots they inspected. Needs an image-review batch (vision pass); until then, treat every pre-existing screenshot as suspect.

### /applets/master-data/chart-of-account-applet/ + accounting guides
- [x] F-0076 (2026-09-05) MISSING_DEFAULT_GL_CODE is thrown only for the debtor/creditor entity line (five throw sites); missing SALES/OUTPUT_TAX/INPUT_TAX/COGS/PURCHASE defaults fail on bl_fi_jrnl_line.glcode_guid NOT NULL (liquibase 202104141527) with a bare DB error. CoA page already scoped correctly by lane 4's rework (line 256, table row 406); remaining: the chart-of-accounts-setup guide must stop listing those as MISSING_DEFAULT_GL_CODE messages.

### product / registry (joins F-0044 family)
- [ ] F-0077 (2026-09-05) carWorkshopApplet: documentation_url → Confluence though the page exists; zero client-side perm defs; route root typo `car-worshop-applet`; Settings → Field Settings is a non-functional stub (146 keys read, nothing can write them). InternalSalesQuotationApplet: 2 perm defs seeded, ~50 checked. blg-shared-utilities template bug: `appletCode==='posGeneral' || 'salesInvoiceApplet'` guard is always true. Quotation Convert sends a FINAL RV header when converting a FINAL quotation — intended?

## From Lane 3 run 4 + Lane 2 run 6 (2026-09-05)

### site-wide (applets — method)
- [ ] F-0078 (2026-09-05) Inline gear toggles are a second rendering path; run 1–3 pages' "read but no control" lists may be wrong where a gear is embedded. Re-audit when each lane next touches those pages (METHOD §8).

### site-wide (registry / phantoms — ADR-0002 batch)
- [ ] F-0079 (2026-09-05) Lane 2 triage: accounts-receivable-applet, admin-time-attendance-applet, ai-customer-analytics-applet are TODO placeholders with no ACTIVE row (delete?); budget-applet.md (1,495 lines) has no row — the row is budgetaryApplet whose doc URL points at the 10-line budgetary-applet.md → rewrite budgetary under the registry name, alias /applets/finance/budget-applet/, delete budget-applet.md (Vincent to approve). ecomSyncApplet / ecomSyncOrganisationApplet are ACTIVE with no code in any cloned repo — live elsewhere or leftovers? "Tiktok Sales Order Applet" (shopee_sales_order_applet) — generic product or customer-specific? Hub/index pages (90-ecomsync-related-applets) need a `page_type: index` allowlist in the parity check.

### /applets/purchase-workflow/blanket-purchase-order-applet/ + procurement guides
- [ ] F-0080 (2026-09-05) Nothing enforces a blanket order's validity window on knock-off; draw-down is entirely the company gendoc flow configuration (bl_fi_comp_gendoc_flow_config, INTERNAL_BLANKET_PURCHASE_ORDER → INTERNAL_PURCHASE_ORDER, flow_type LINE). Which applet page owns the flow-configuration UI? (GRN/PO/BPO pages can only cite the table.) Procurement-manager guide's spend-cap claims need correcting.

### /applets/ (hub)
- [x] F-0081 (2026-09-05) Dead link /applets/90-ecomsync-related-applets/ from applets/_index.md and applet-catalog.md — fixed by alias on the index page (lane 2 run 6).

## From Lane 4 run 5 (2026-09-05)

### /applets/inventory-workflow/delivery-installation-applet-V2-applet/
- [ ] F-0082 (2026-09-05) Second page for registry row delivery-installation-applet (no "V2" code exists); canonical is delivery-installation/delivery-installation-applet.md (lane 3). Merge with alias (recommended); facts for lane 3 in lane-4/findings.md. Same class as F-0050. Vincent to approve.

### /applets/inventory-workflow/driver-delivery-order-applet/ (product)
- [ ] F-0083 (2026-09-05) Driver Delivery Order: drivers can SAVE-edit FINAL delivery orders (no backend block) — intended? ~50 rendered toggles + the Custom Status screen persist keys nothing reads; two settings menu entries route to 404. The old page's "Add" / "custom status" instructions were invented (removed). Open question in kb/topics: where an internal outbound DO gets its driver.

## From Lane 1 run 5 (2026-09-05)

### static/images/claim-applet — PERSONAL DATA
- [ ] F-0084 (2026-09-05) Lane 1 lists 20 of 36 Claims screenshots showing a real customer group's legal-entity names or real employee names. Loop quarantining the unreferenced ones (see next commit); the 6 embedded on the Claim Applet page were checked safe by the lane. Joins F-0074/F-0075.

### /applets/membership/commission-scheme-applet/ + /applets/sales-workflow/commission-scheme-applet/
- [ ] F-0085 (2026-09-05) Two pages for one registry code (Commission Scheme). ADR-0002: one applet, one page. Lane 1 to document once in the folder matching the applet's module and mark the other for merge+alias — Vincent to confirm which folder.

### /modules-v2/claims/
- [ ] F-0086 (2026-09-05) Module index wrongly places approval matrices in the Claim Cycle applet and claims automatic AP disbursement — neither exists (no PV is ever created; money leaves via the cycle's Bank Report / PV Details / salary CSV). Correct in the module batch.

### product (claims)
- [ ] F-0087 (2026-09-05) Claims module is visibly built for one customer (tenant-code branches in UI and controller; a hard-coded job-title auto-approval) yet is a generic ACTIVE applet. Documented generically. Vincent: confirm policy; product ticket to turn the branches into settings? Also: ENABLE_AUDIT_TRAIL is a no-op; auto_add_approved_claim_to_cycle has no UI control; personal settings DEFAULT_PAYMENT_PROCESSING_OPTION / HIDE_PAYMENT_SALARY_TAB make two users see different cycle totals.

## From Lane 2 run 7 (2026-09-05)

### /modules/budgetary/ + /modules-v2/financial-accounting/ + /user-guide/industry-solutions/professional-services/
- [ ] F-0088 (2026-09-05) Every "blocks overspend" / budget-check claim is false: no validator anywhere; registers can go negative; purchase orders never move a register (only the two invoice types). Correct in the module batch. Also Budget Report binds "Initial" and "Latest" to the same column (product bug).

### /applets/finance/vote-book-applet/
- [ ] F-0089 (2026-09-05) No registry row for any "vote" applet — the Vote Book the module pages describe is the Budgetary applet's votebook. Delete/redirect to budgetary-applet (Vincent, joins F-0079).

### static/images (budgetary) — personal data
- [x] F-0090 (2026-09-05) budgetary-module-04/06/11.png and figure-1-1.png show staff e-mails / first names; quarantined by the loop. budgetary-module-01.png is referenced by the old budget-applet page but does not exist.

### product (budgetary)
- [ ] F-0091 (2026-09-05) Which page owns profit centres (Budgetary creates them; Organisation v3 has no screen)? Backend-only approval flow (bl_fi_budget_register_approval_*) and reserved_amt — roadmap, dead, or customer-specific? Manual txn lines fail the register-update job; VOID reverses nothing and has no button.

## From Lane 3 run 5 + Lane 4 run 6 (2026-09-05)

### static/images — personal data (delivery-installation V2, employee)
- [x] F-0092 (2026-09-05) 10 of 13 Delivery Installation V2 screenshots and 14 of 27 Employee screenshots carry staff names / e-mails / phones / a customer reference prefix. Quarantined by the loop; the duplicate V2 page's embeds were removed so nothing references them. Running tally: 60+ images quarantined (kb/tools/quarantine-images.sh per lane). F-0075 sweep still needed for the untouched ~1,600.

### product (delivery installation)
- [ ] F-0093 (2026-09-05) Backend guard mismatch: "cancelled job cannot be completed" checks `CANCELLED` while cancelJobs writes `Cancelled` — guard holds only for trip-cancelled jobs. Two cancel paths (document- vs shipment-sourced) throw SHIPMENT LINK TABLE NOT FOUND if the wrong listing is used. Dead Default Selection / Field Settings screens. Who seeds the RETURN_REASON bl_applet_config row for new tenants? Registry: one code, two repos (V1 dead); doc URL still Atlassian; name lacks the ampersand the UI shows.

### product (employee maintenance)
- [ ] F-0094 (2026-09-05) Mis-wired settings: HIDE_CREATION_DATE saved vs HIDE_CREATED_DATE read; Modified Date bound to HIDE_MODIFIED_BY; HIDE_CLAIMS hides the Org Chart menu. Approved Leave tab is dead UI. File Import matches across ALL entity types (ID → tax no → e-mail → phone) and flips the match to is_employee=true — an existing customer can silently become an employee. Intended or defects?

### site-wide (link text)
- [ ] F-0095 (2026-09-05) Six pages still say "Employee Applet"; the registry name is "Employee Maintenance". Cross-link batch.

## From Lane 1 run 6 (2026-09-05)

### static/images/commission-scheme-applet — personal data
- [x] F-0096 (2026-09-05) All 14 UI captures show staff first names as scheme codes, a staff e-mail, a real company name. Quarantined by the loop.

### product (commission scheme / custom processor)
- [ ] F-0097 (2026-09-05) Commission Scheme backend gaps: SALES_GROUP rule and RELATIVE date ranges unimplemented (always false); MEMBER_LABEL ignores picked labels; Sales Contract doc-type checkbox never evaluated; no scheme-code uniqueness check. Settings skeleton (Default Branch/Location saved but unread; Field Settings SAVE unwired; personal Default Selection loader commented out) — same template as Car Workshop. Custom Processor: DRAFT filter can never fire; Price Tag Sync NFC URL hard-coded to a real company's website; documentation_url empty. mlm-admin-applet is ACTIVE with no wiki page. Product tickets?
- [ ] F-0098 (2026-09-05) Should Custom Processor move to applets/integrations/ (it is a hand-off queue to external integrations)? Folder decision for Vincent.

## From Lane 2 run 8 (2026-09-05)

### registry (resolves F-0042)
- [x] F-0099 (2026-09-05) F-0042 resolved wiki-side: creditor_report_applet, debtor_report_applet and debtor-and-creditor-report are three distinct ACTIVE applets with three live repos — no merge. Only the registry row is wrong: creditor_report_applet.documentation_url must point at /applets/finance/creditor-report-applet/ (DB change, Vincent).

### static/images/creditor-report-applet — personal data
- [x] F-0100 (2026-09-05) All five screenshots show real company/brand or person names; quarantined. Page is image-less until re-captured on a synthetic tenant.

### product (creditor report)
- [ ] F-0101 (2026-09-05) Contra tab writes arap-contra pairs with NO server-side over-contra check (client ADD guard only) — product issue? Aging Period Settings silently overwrites AGING_PERIOD_TYPE; DAY with no DAY period yields no bucket columns; Personalization → Default Selection screen dead; Statement of Account / Historical Creditor served by DEBTOR_* permissions (AP-only roles get 403).

## From Lane 4 run 7 (2026-09-05)

### product (entity maintenance)
- [ ] F-0102 (2026-09-05) Entity Maintenance has no functional configuration (Field Settings unbound; Default Selection/Personalisation write to a container never loaded); four edit tabs are dead UI (Entity Category, Login, Credit Term, Credit Limit — onSave discards input); category label codes are unique tenant-wide across entity AND item categories. Recommended: report for clean-up/retirement; keep the page for category trees and company/intercompany links. Registry documentation_url → Confluence; should be /applets/master-data/entity-applet/.

### static/images/entity-applet — personal data
- [x] F-0103 (2026-09-05) 10 of 12 show staff names/e-mails/phones and a customer-name fragment; quarantined.

### /modules-v2/claims/ /modules-v2/hr-payroll/ /modules-v2/purchasing/
- [ ] F-0104 (2026-09-05) These credit Entity Maintenance with employee bank profiles / supplier payment terms that live in Employee Maintenance / Supplier / Customer Maintenance. Module batch.

## From Lane 1 run 7 (2026-09-05) — lane 1 drained after this run

### /applets/sales-workflow/customer-consignment-applet/ (product)
- [ ] F-0105 (2026-09-05) Settings › Default Selection Default Branch/Location never save (loose controls); SHOW_TRANSACTION_DATE not seeded so the date is read-only for everyone; UI gates on INBOUND/OUTBOUND_STOCK_TRANSFER permissions while the backend enforces CUSTOMER_CONSIGNMENT_IN/OUT. Open cross-company transfer gap (repo issue) — flag in the inventory guide? Tickets?
- [x] F-0106 (2026-09-05) 7 of 18 screenshots (staff first names as location names; a User Permission screen with names/e-mails/mobile) quarantined.

### accounting/inventory guides (fact)
- [ ] F-0107 (2026-09-05) Backend stock validation is ON by default (validate_stock_balance .orElse(true)) for every outbound-stock document regardless of applet toggles; error is STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION. Consignment types are NOT exempt from the fiscal lock (plain stock transfers are). Guides must say so (joins F-0057).

## From Lane 3 run 6 — e-invoice (2026-09-05)

### /guides/einvoice-guides/ + /modules-v2/e-invoice/ (facts from code + blg-intranet)
- [ ] F-0108 (2026-09-05) Guides and the old pages say the Peppol Waiting Queue waits for LHDN "Valid" — it does not: it is gated on the mandatory-field check plus company/entity participant IDs. Also: documents finalised BEFORE company einvoice_status=ENABLED are dropped silently (no queue row, no error); RM 10,000 inclusive hard-coded threshold forces the individual pool for Sales Invoice and Cash Bill only; 72-hour cancellation window from validation_datetime; CANCEL_FOR_EDIT_AND_RESUBMIT is the only logic that works for consolidated e-invoices and exists only in the admin applet. Guide correction unit (high priority — 70 tenants). Vincent: is Peppol-before-LHDN intended?

### static/images/my-e-invoice-admin-applet/lhdn-core-workflow.png
- [ ] F-0109 (2026-09-05) Internal LHDN core-workflow diagram (processor/table names, no PII, no credentials) copied from blg-intranet and embedded on the admin page. Vincent: may an internal engineering diagram stay on the public wiki? (Loop kept it pending your answer.)

### registry (e-invoice)
- [ ] F-0110 (2026-09-05) myEInvoicePortalApplet has no documentation_url; peppolApAdminApplet's points at a page that does not exist; 0 client-side permission rows for all four e-invoice codes; website-builder/user-permission-manager.md has no registry row (duplicate of ecommerce/website-builder/user-manager.md — merge). The forex setting einvoice_forex_gendoc_posting_logic has no UI — how to present it?

## From Lane 2 run 9 (drained after) + Lane 4 run 8 (2026-09-05)

### product (report applets)
- [ ] F-0111 (2026-09-05) Debtor and Creditor Report applet: Field Settings placeholder, Default Selection never persists, contra endpoint declared but never called, creditor rows open nothing; creditor listings scoped by DEBTOR_* permission targets (AP-only roles get an empty dropdown); Historical/AR Transaction/Collection need permissions the start-up inquiries never request. Debtor Report: DEFAULT_ORIENTATION unused; Aging Report lacks AR_EMPLOYEE type. Product issues?
- [x] F-0112 (2026-09-05) 8 report screenshots (real names) quarantined.

### SECURITY (forex)
- [ ] F-0113 (2026-09-05) A third-party market-data API key is compiled into the front end (forex applet and blg-shared-utilities) and called from the browser on a shared free tier. Not in the wiki. Report to the platform team — Vincent.

### product / registry (forex)
- [ ] F-0114 (2026-09-05) forexApplet.documentation_url points at a catalogue anchor (/applets-workflows/#-forex-applets) — registry fix. Dead local settings screens (same pattern as Entity Maintenance). "Newest history row wins" rate semantics with no date matching; soft delete leaves dangling forex_source_history_guid on generic docs — document only, or change request?

### standard
- [ ] F-0115 (2026-09-05) Master-data applets controlled by settings that live in OTHER applets (forex: SHOW_FOREX_DATA_SOURCE, CANNOT_EDIT_CURRENCY_RATE) — add a "Settings in other applets that control this applet" slot to §4 of the standard.

## From Lane 3 run 7 (2026-09-05)

### product (delivery installation driver)
- [ ] F-0116 (2026-09-05) The web driver applet cannot list trips as shipped: app.effects.ts L52–88 dereferences bl_del_trip_hdr on the paged envelope and throws ("Failed to retrive trips") — same in the deployed bundle. Failure Reason list queries bl_applet_config with a hard-coded applet guid not in bl_applet_hdr. An Android driver app (akn-kotlin-mobile-delivery-driver) implements the same flow. Vincent: is the web applet used in production or is Android the real client? Should the Android app get a wiki presence (no registry row)?
- [x] F-0117 (2026-09-05) Two calendar screenshots showing a real tenant code quarantined.

### ADR-0002 triage (ecommerce)
- [ ] F-0118 (2026-09-05) ecommerce-catalog-applet.md (TODO placeholder; the catalog is a CP Commerce Admin tab) → delete + alias to cp-commerce-admin-applet; installation-of-pricebook-applet.md (an Applet Store install how-to) → fold into a generic "install an applet" section + alias. PricebookApplet documentation_url points at /applets/pricebook-applet/ but the page is under master-data/ (alias exists?).


## From e-invoice email/Drive ingest (2026-09-05)

- [ ] F-0119 (2026-09-05) Submission History export status is a snapshot at submission time; live LHDN status and the Invalid filter come from To IRB E-Invoice → Export — say so in the Screens table → source: content/en/applets/e-invoice/my-e-invoice-admin-applet.md → src: gmail:1a066c168bdcd3cb
- [ ] F-0120 (2026-09-05) Troubleshooting rows: E-Invoice Number blank on export (running-number write-back gap, fixed 2026-09-03), client_doc_1 blank / row stuck IN_QUEUE (processor DB-connection timeout), totals differing between individual and consolidated exports (reconcile per doc_reference) → source: content/en/applets/e-invoice/my-e-invoice-admin-applet.md → src: gmail:1a066c168bdcd3cb, gmail:1a0663d23d98e303, gmail:1a06ba1478ffadde, gmail:1a06b63c96b0119c
- [ ] F-0121 (2026-09-05) Monthly consolidation cycle is now processor-driven per company (Aug–Sep 2026 rollout), triggered before the 7th to leave correction time; manual Submit is the fallback; a document is individual or consolidated, never both → source: content/en/guides/einvoice-guides/einvoice-pools-and-routing.md → src: gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA, gdrive:1hMhWYLFK2em4cqdU-P4oNt-jTpklJBEGdtO6V02YlG4
- [ ] F-0122 (2026-09-05) Foreign buyers cannot be consolidated — ID type Passport, submit individually; government buyers pending (kb/questions/2026-09-05-consolidation-foreign-and-government-buyers.md) → source: content/en/guides/einvoice-guides/einvoice-validation.md → src: gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8
- [ ] F-0123 (2026-09-05) New user guide: month-end e-invoice submission checklist (1st–7th) — exports to pull, working the Invalid list (TIN lookup on MyInvois, fix customer, Save and Resubmit / Bulk TIN Validation, document date kept), what IN_QUEUE means next morning, realistic throughput (~50/hour today, enhancement pending). Blocked on kb/questions/2026-09-05-einvoice-month-end-report-pack.md → source: content/en/guides/einvoice-guides/month-end-submission-checklist.md (new) → src: gmail:1a05ff766425665d, gmail:1a064ab8ca823fb0, gmail:1a066f3fb420ca81, gmail:1a0609d7143fa9b7
- [ ] F-0124 (2026-09-05) When shipped: per-company e-invoice on/off switch and processor schedule in Organization Applet settings (decision 2026-08-04) — hold until visible → source: content/en/guides/einvoice-guides/myinvois-setup.md → src: gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0
- [ ] F-0125 (2026-09-05) SVDP submission type (payload 1.3, own pool, FINAL required, auto-submit) designed 2026-08-26, not shipped. Vincent: pre-announce or wait? → source: content/en/guides/einvoice-guides/einvoice-pools-and-routing.md → src: gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA
- [ ] F-0126 (2026-09-05) "Duplicate submission → System prevents duplicates; check submission history" is wrong: the guard (2026-08-20) covers batch-pool pushes only and Submission History is a snapshot — point to the admin page's duplicate row and To IRB export → source: content/en/guides/einvoice-guides/_index.md → src: gmail:1a066c168bdcd3cb, gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA
- [ ] F-0127 (2026-09-05) New guide for tenants synced from the legacy platform (what must be complete at source, voided credit memo negation, unsynced-document notification). Vincent: public wiki or internal? (kb/questions/2026-09-05-emp-etl-sync-on-wiki.md) → source: content/en/guides/einvoice-guides/documents-synced-from-emp.md (new) → src: gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0, gdrive:1ZouyeoW0cu0-7tl8l3vADWrZpuA9e0qyCXDQwSm6xdg, gmail:1a0663d23d98e303
- [ ] F-0128 (2026-09-05) Processors table: individual-pool failure e-mail now daily (decision 2026-08-11); add reconciliation-error dashboard and per-branch consolidation monitor only when they appear in the menu → source: content/en/applets/e-invoice/my-e-invoice-admin-applet.md → src: gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8, gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0
- [ ] F-0129 (2026-09-05) Customer e-invoice fields: TIN saved without spaces (2026-09-03); foreign buyer = ID type Passport; missing state breaks address construction → source: content/en/applets/… customer maintenance page → src: gmail:1a0663d23d98e303, gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8
- [ ] F-0130 (2026-09-05) OCR e-mail intake (SES receiving) deployed ~2026-09-05, no wiki mention; scope unknown (kb/questions/2026-09-05-ocr-email-intake-scope.md). Vincent → source: new page, location TBD → src: gmail:1a069e68f3133a81
- [ ] F-0131 (2026-09-05) Lateral from the 2026-09-03 technical meeting, verify against repos before writing: draft GRN balance in stock availability; auto currency rate for foreign suppliers on purchase CN; batch number/date fields on PI and GRN; repost on failed status in stock adjustment; sales report load time; entity status filter proposed → source: stock-availability, internal-purchase-credit-note, internal-purchase-invoice, internal-purchase-grn, stock-adjustment, sales-report applet pages → src: gmail:1a0663d23d98e303

## From Lane 4 run 10 (2026-09-05)

### product (consignment GIN/GRN)
- [ ] F-0132 (2026-09-05) BUG: the shared settings screen's tab-hide map is keyed by the GIN applet's dev-only code, not its registry code, so Payment / Department Hdr / Doc Link / Export tab toggles never render on a live tenant (matches a customer UAT complaint verbatim). Report to the platform team. Consignment GIN posts via the generic PURCHASE handler (Cr Purchase / Dr Creditor) while GRN/Return use the CONSIGNMENT_STOCK/LIABILITY branch — possible backend oversight. VOID refused with GENERIC_DOCUMENT_HAS_TARGET_LINKS once billed.
- [x] F-0133 (2026-09-05) 5 of 9 consignment-pair screenshots (tester names / possible real branch codes) quarantined.

### registry
- [ ] F-0134 (2026-09-05) internalconsignmentGRNApplet.documentation_url → Confluence, should be the wiki page. Group Maintenance: no ACTIVE row (only DELETED GroupApplet / newTeamMaintenanceApplet) — the three wiki pages are phantoms (joins F-0079 triage).

## From Lane 3 run 9 (2026-09-05)

### product (consignment PO / return)
- [ ] F-0135 (2026-09-05) Consignment Return: DCO forces quantity signum 0 (applet constant says −1, overwritten) — no stock movement; old page, infographic and guide say the opposite. Intended (movement only via GIN) or defect? Consignment PO Payment/Contra tabs and Return Settlement tab write sales-side INTERNAL_RECEIPT_VOUCHER lines on purchase documents — defect or "do not use"? Return's Search tab searches purchase invoices, not Consignment GRN lines. 0 client-side perm defs for either applet (~50 codes checked; ordinary buyers cannot see line prices). Both documentation_url empty.
- [x] F-0136 (2026-09-05) Unreferenced images (invented-feature infographics; screenshots with personal/real-looking names) quarantined.

### /guides/purchasing-guides/consignment-purchasing/ + /applets/master-data/organisation-applet/
- [ ] F-0137 (2026-09-05) Knock Off Configuration (company gendoc flow config) ownership: it decides whether FINAL opens the queue for EVERY document type; Organisation page should own it (answers F-0080's "who owns the flow-config UI"). Consignment guide must be corrected on return stock behaviour.

## From Lane 4 run 11 (2026-09-05)

### registry / product (goods delivery note)
- [x] F-0138 (2026-09-05) internal-goods-dispatch-note-applet.md renamed to internal-goods-delivery-note-applet.md under the registry name "Goods Delivery Note (Internal)" with an alias for the old URL (resolves the phantom entry + wiki issue #69). "Goods Dispatch Note" is a real, separate, UNREGISTERED document type (INTERNAL_GOODS_DISPATCH_NOTE, own repo, commits in 2026-07) — Vincent: register or archive that repo?
- [ ] F-0139 (2026-09-05) The Goods Delivery Note form inherits Member Card + Sales Agent as REQUIRED (clone of Sales Credit Note) and disables CREATE while invalid — a plain delivery to a non-member customer may be blocked. Confirm on a tenant; bug? Also: the akaun_master journal-posting subscriber has no serverDocTypes constraint, so the journal job runs and fails with NO_JOURNAL_CREATED for every FINAL signum-0 document (Sales Order, Quotation, Jobsheet, Outbound DO too) — keep documenting "expected, ignore", or point users at a job-queue screen? Ten tab-hide toggles never render (registry code absent from getTabValue(), third applet in this lane — joins F-0132).

## From Lane 3 run 10 (2026-09-05)

### product (consignor purchase billing)
- [ ] F-0140 (2026-09-05) Two shipped features do not work: Payment tab guard compares to the header object (NaN) so every ADD fails "Payment Exceeds Outstanding" (and payment lines are never sent); SAVE on the edit screen resends lines as loaded (draft assignment commented out) so line edits are lost. Quantity To Bill is typed (UI parseInt formula) — the backend /item/calc endpoint is never called. Consignor optional but a billing without one breaks the listing. Vincent: fix or hide the Payment tab ("settle via PI + PV")? persist line edits? which formula?
- [x] F-0141 (2026-09-05) Two listing screenshots with a real customer's legal name quarantined.

## From Lane 4 run 12 (2026-09-05)

### registry (unregistered but maintained applets — joins F-0138)
- [ ] F-0142 (2026-09-05) Inbound Delivery Order (Internal): backend type INTERNAL_INBOUND_DELIVERY_ORDER and a maintained repo exist, but no registry row — page skipped (ADR-0002). Register or archive? Meanwhile hide the page or add a callout. Three CORE1 "Buyer/Supplier/Transporter – Delivery Order" placeholder rows added to the exclusion list (customer-specific).

### product (stock requisition)
- [ ] F-0143 (2026-09-05) Approval Settings / Branch Designation tables are written but NOT enforced by create/FINAL or the backend generic-document path (approval service reachable only via a controller the applet never calls) — page says "configured but not enforced", citing the open customer request. CREATE ST bypasses the Knock Off Configuration (calls knockOff directly). 14 keys the applet reads have no control for its code on the shared screen (HIDE_FILE_IMPORT_MENU etc.). No screenshots exist for this applet — capture set needed.

## From Lane 3 run 11 (2026-09-05)

### /applets/purchase-workflow/internal-purchase-grn-applet/ + grn-stock-in + /guides/purchasing-guides/ (fact)
- [ ] F-0144 (2026-09-05) Purchase GIN is a 0/0 document (no stock movement, no journal; absent from MA cost types). GRN pages and the procurement guide say "GIN reduces stock" — wrong; the stock-moving purchase-side out document is Purchase Return. A backend type INTERNAL_PURCHASE_GIN_STOCK_OUT exists with no applet/registry row. Vincent: is 0/0 intended with a Stock Out applet planned?

### product (purchase GIN)
- [ ] F-0145 (2026-09-05) 47 shared toggles never render (code in no tabMappings list); 31 gear keys neither declared nor read (copied from PO); Default Selection branch/location persisted but never applied; personal Default Selection non-functional; Payment tab writes receipt-voucher lines on a purchase document; DELETE has no backend FINAL check; serial validation skips signum-0 lines. INTERNAL_PURCHASE_GIN_DISPLAY_PRICING and SHOW_GENDOC_FINAL_BUTTON checked but not seeded (non-admins see no prices). Tickets?
- [x] F-0146 (2026-09-05) Four infographics (24 MB, invented features) and four screenshots (names, a phone number) quarantined.

## From Lane 4 run 13 (2026-09-05)

### ADR-0002 triage (stock take)
- [ ] F-0147 (2026-09-05) introduction-to-stock-take-applet.md is a second page for the same registry row (marketing intro, no unique facts, no inbound links) → delete + alias to stock-take-applet (F-0050 pattern). stockTakehq / st_staff added to the exclusion list.

### /modules-v2/inventory/ + /modules/inventory/ (fact)
- [ ] F-0148 (2026-09-05) Stock Take moves nothing and posts nothing (no signums, no journal, nothing writes bl_inv_txn_line; action_adjust_* columns unused). Module pages claim variance posting and GL shrinkage entries — wrong. Vincent: correct the module pages, or treat stock-take-to-adjustment as a planned feature?

### product (stock take)
- [ ] F-0149 (2026-09-05) Saving a session CLOSED without ever saving Field Settings throws "Applet Settings Not Found!" AFTER the status commits; status_variance at close evaluates only the first row; CLOSED and report generation enforced client-side only; the generate endpoint is anonymous; date_start/date_end stamped by the web applet, not the server. Tickets?

## From Lane 3 run 12 (2026-09-05)

### product / registry (GRN stock in)
- [ ] F-0150 (2026-09-05) The intercompany "Search" tab in GRN Stock In creates a plain 0/0 GRN (IntercompanyController hard-codes the type) — intercompany receipts through it never move stock. Backend change or hide the tab? Line GL codes are silently ignored on GRN Stock In journals (isConsignmentStockIn branch) — intended? then the Lines tab should not offer a GL code. Shared screen gates the attachment toggle on a misspelt code (internalPurchaseGRNStcokInApplet). documentation_url points at the supplier-access page. 14 checked SHOW_* codes unseeded (joins F-0044 family).
- [x] F-0151 (2026-09-05) One infographic + one screenshot quarantined.

### /applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/ (next, fact)
- [ ] F-0152 (2026-09-05) Current page describes PI No Stock In as "non-inventory expenses — services, overheads"; wrong premise — it is the invoice leg of the GRN Stock In pair. Lane 3's next rewrite replaces it; guides that repeat the "services/overheads" framing must be corrected.

## From Lane 4 run 14 (2026-09-05)

### ADR-0002 triage (F-0007 resolved)
- [ ] F-0153 (2026-09-05) inventory-workflow/inv-item-maintenance-applet.md is the duplicate (7 inbound links) — delete + alias to master-data/inv-item-maintenance-applet/ (now canonical under the registry name "Inventory Item Maintenance"). Vincent to approve; joins the F-0050/F-0147 delete-and-alias batch.

### product (inventory item maintenance) — SERIOUS
- [ ] F-0154 (2026-09-05) The Item Edit Main-tab Save is dead in source at commit 06aebbc: resetForm() declares a hidden required control `currentGlCode` nothing populates and the button is disabled while the form is invalid — GL code, category links, EAN, currency, status and dimensions cannot be saved from the UI since the monorepo split (multi-UOM, images, min/max, company links still save). Stated plainly in Troubleshooting. Vincent: confirm the deployed build matches main. Also: doc-item → inventory-item link is one-shot async (scan-code drift is a recurring incident; data-fix endpoints exist); HIDE_ITEM_CATEGORY never read; four Department Settings toggles unbound; both Default Selection screens dead.

## From Lane 3 run 13 (2026-09-05)

### backend (GRN Stock In / PI No Stock In pair) — possible accounting bug
- [ ] F-0155 (2026-09-05) The accrual reversal on PI No Stock In uses totalAmount summed AFTER tax lines (net + tax) while GRN Stock In accrued INVENTORY_NOT_INVOICED for net only; Input Tax is debited on both documents. A residual equal to the tax stays on the accrual accounts every time. Also the reversal fires on ANY active knock-off link (status-only filter), not just GRN Stock In sources. Vincent: backend fix (net, not net+tax; restrict trigger)? Until then guides must say "tax on one document of the pair; reconcile the residual".

### product (PI no stock in)
- [ ] F-0156 (2026-09-05) Applet ships SELF-BILLED bulk action and an E-Invoice tab, but the backend's self-billed pipeline (MyEInvoiceToIRBProcessorService.PURCHASE_DOC_TYPES) does not list this type (applet issue open) — add the type or hide the UI. Dead applet-local Knock Off Settings screen (8 keys saved, never read) in this applet and the PI. 27 checked-not-seeded permission codes (SHOW_GENDOC_SAVE_BUTTON, ALLOW_TO_CREATE_EDIT_ACCOUNT…), 28 seeded-never-checked.
- [x] F-0157 (2026-09-05) 12 of 20 screenshots (developer/staff names and e-mails, real brand/model names, a marketing infographic) quarantined.

## From Lane 3 run 15 (2026-09-05)

### product (purchase quotation)
- [ ] F-0158 (2026-09-05) The KO For tab is a copy of the Purchase Order applet's: renders only when the company's PR→PO flow row is enabled, lists PR→PO queue rows, checks the PO create permission — quoting from a requisition needs a row naming a different document, and the knock-off does not reduce the requisition's open quantity. Knock-off is one-shot and TEMP-only. SHOW_TRANSACTION_DATE locks the date picker tenant-wide by default — intended? SHOW_AMOUNT_MAIN_LISTING / SHOW_SST_VAT_GST_AMOUNT checked but unseeded (skipped by the 2026-07 seeding sweep).
- [x] F-0159 (2026-09-05) Six images quarantined (a video-site screenshot with a third-party ad, four generated infographics, one listing whose code matches a customer repo slug).

## From Lane 4 run 16 (2026-09-05)

### registry (merchant)
- [ ] F-0160 (2026-09-05) MerchantAccessApplet "Merchant Access" — ACTIVE with its own build, no repo in refs/ or the org, no page; marketing withheld a webinar because it kept crashing. Exclude as a stub or locate its source? MerchantAdminApplet and nonStockAndTradeInApplet documentation_url → Confluence.

### product (NSTI / merchant admin)
- [ ] F-0161 (2026-09-05) NSTI: manual "Add Transaction" lines never move the balance; CSV import fills a staging table only (issues open); units are created only by NSTI_TXN_LINE_PROCESSOR from FINAL docs when the tenant's job-template links subscribe the two processors. Merchant Admin: physical delete without confirmation/dependency checks; non-unique Merchant ID; browser-computed contract code; Verify Email creates tenant users as a side effect. Confirm deployed build; tickets?
- [x] F-0162 (2026-09-05) Five NSTI screenshots (staff names, a brand as test data) quarantined.

## From Lane 3 run 16 (2026-09-05)

### backend/applet MISMATCH — purchase refund note likely un-creatable (verified by the loop in source)
- [ ] F-0163 (2026-09-05) On 2026-04-23 a one-file backend commit flipped InternalPurchaseRefundNoteDataConsistencyObject to amount +1 / quantity −1 (the Purchase Return shape); the applet constants still send amount −1 / quantity 0. The TEMP→ACTIVE PUT validates the header signum, so CREATE/SAVE should fail with GENERIC_DOC_INVALID_SIGNUM on any backend carrying that commit (TEMP create skips validation, so a smoke test looks fine). Vincent: confirm on production (an aggregate count of headers created after 2026-04-23 would show it); fix = align the applet constants with the DCO or revert the DCO. Also decide the intended accounting shape (Purchase-Return-like vs supplier refund Dr Cashbook / Cr Creditor). 25 client-side codes checked, none seeded (DISPLAY_PRICING hides prices for every role; SHOW_TRANSACTION_DATE locks the date picker).
- [x] F-0164 (2026-09-05) Five images (infographic, staff name/e-mail, bookmarks bar, developer test data) quarantined.

## From Lane 4 run 17 — Organization (2026-09-05)

### resolves earlier questions
- [x] F-0165 (2026-09-05) F-0080/F-0137 answered: Knock Off Configuration (company gendoc flow config) is owned by the Organization page now; all "Organisation" cross-link requests from lanes 1–4 satisfied there (53 related_applets). Default GL codes are NOT set in Organization — they stay in Chart of Account › Companies › Default GL Codes.

### product (organization)
- [ ] F-0166 (2026-09-05) TimeZoneHandler L28 has an inverted isBlank() guard so the branch timezone is never used (company default_timezone always wins) — backend bug? einvoice_settings_json keys issuer_type / forex_gendoc_posting_logic / running_no_config / line_item_desc_config have no UI ("set via API or support"). Branch tax_applicable and the PICK_PACK_QUEUE extension have no reader; member_point_award_doc_in / posting_final_json have no UI. Knock Off Configuration UI writes KO/LINE only; the CP "Copy From" tab is commented out; source=target and GRN-family conflicts are client-side only. Registry name has a trailing space.
- [ ] F-0167 (2026-09-05) Screenshot policy: every Organization capture (incl. the 4 kept) shows the staff login e-mail in the top bar; earlier runs tolerated this. Vincent: acceptable, or recapture everything with a synthetic login? (Applies across all lanes.)
- [x] F-0168 (2026-09-05) Eight Organization screenshots (a first name, brands as test data, a possible customer abbreviation, infographic) quarantined.

## From Lane 3 run 17 (2026-09-05)

### backend (approvals) — affects Purchase Requisition AND Purchase Order
- [ ] F-0169 (2026-09-05) Auto-FINAL fires on the FIRST approve action, not the last level (GenericDocApprovalRequestProcessor L200–201: date_final_approval != null || approval_status == APPROVED). Plain FINAL from the listing is never gated on approval (only HIDE_GENDOC_FINAL_BUTTON, whose SHOW_ override is unseeded). Approval Logic (ANY/ALL) and Min/Max Amount are stored but never evaluated; Employee Ranking has no reader. Vincent: intended? Should the backend gate FINAL when an approval setting exists? Answers lane 4's F-0143 for the Stock Requisition too (there: NOT enforced; here: enforced via approvals/processors/submission).
- [ ] F-0170 (2026-09-05) KO For panel gate queries the Jobsheet→Sales Invoice flow row instead of Jobsheet→Purchase Requisition (copy-paste; same class as F-0158). Line Items Queue APPROVE writes a flag nothing reads.
- [x] F-0171 (2026-09-05) Five images (real company names, staff first names, developer names as item codes, two infographics) quarantined.

## From Lane 4 run 18 — Pricebook (2026-09-05)

### product (pricebook) — evaluation divergence
- [ ] F-0172 (2026-09-05) Client-side PricebookCalculator (blg-shared-utilities; POS/SI/SO/SQ) ignores Multi Line rules, OR logic, Calculation Logic, relative date ranges and five header rule types (Company, Member Label, OCR Company, Currency, Settlement Method); three line rule types never match; treatment FORMULA is evaluated with JavaScript eval on the client. The server engine (OCR points only) behaves differently. An Inactive price book keeps applying while it is a document applet's Default Pricebook (Status is an extension no consumer reads). Two editors for the same price set with different rule menus. Vincent: bugs against blg-shared-utilities, or intended?
- [ ] F-0173 (2026-09-05) AkaunPriceBookApplet "Akaun Price Book" — ACTIVE (2025-11) with its own build, no page, only a deprecated one-commit repo in refs/. Document or clean the registry row?
- [ ] F-0174 (2026-09-05) Pricebook user guide requested (blg-wiki #128 / F-0032) — write after the applet pass, from kb/topics/pricebook-applet.md. No product screenshots exist; recapture list from a GadgetSphere-seeded tenant in lane-4 findings.

## From Lane 3 run 18 — PDG (2026-09-05)

### registry / policy
- [ ] F-0175 (2026-09-05) pdgApplet (inventory planning; repo renamed to a customer slug, old page named the customer in paragraph one — removed) is ACTIVE and not excluded, so it was documented generically. Vincent: customer-specific → exclusion list, or keep the page? documentation_url is empty → set /applets/ecommerce/pdg-applet/ (page sits under ecommerce/ though it is inventory planning).

### product (PDG)
- [ ] F-0176 (2026-09-05) PDG create is async: 200 + PROCESSING, then a job generates combinations; if no location matches, the job throws and sets the header DELETED, which the listing silently hides. OPDG copies created without quantities. Empty location target list = every outlet visible. Delete PDG is a hard delete FK-blocked once an OPDG exists. Effective/End dates and brand-corner rules are client-side only. Tickets?
- [x] F-0177 (2026-09-05) 26 of 33 screenshots (real tenant/company/mall/distributor names, staff e-mails, developer name, brands, infographics) quarantined.

## From Lane 4 run 19 — Stock Balance hub (2026-09-05)

### site-wide (fact) — stock movement
- [ ] F-0178 (2026-09-05) Eight pages (all sales/purchase credit & debit notes, plain GRN, plain GIN) must say FINAL does NOT move stock (signum 0); the two return pages need the location-precedence troubleshooting row; Stock Report needs the "HBAL snapshot vs ledger sum" distinction. Cross-link batch.
- [ ] F-0179 (2026-09-05) INTERNAL_SUPPLIER_RTV has quantity signum +1 — intended (supplier-tenant mirror) or inverted? Vincent.

### registry
- [ ] F-0180 (2026-09-05) stockLevelMonitoringApplet (ACTIVE 2026-08, repo exists, reads the balance) has no page — add to lane 4's queue? `page_type: index` added to the standard for hub pages (EcomSync, Stock Balance) so the parity check can allowlist them.

## From Lane 3 run 19 — push notifications (2026-09-05) — SECURITY

### SECURITY INCIDENT — credential exposure on the public wiki (2026-02-16 → 2026-09-05)
- [x] F-0181 (2026-09-05) Five screenshots under static/images/push-notifications/ (added 2026-02-16, wiki issue #207) exposed a customer's Firebase service-account e-mail, client id, private_key_id and the head of the private key, plus a second customer's bundle IDs, Firebase project id/number, OAuth client id, APNs key IDs, Team ID and App Store ID. The old page text also named the customer with identifiers. Images quarantined and removed from the CDN by the loop (this commit); page rewritten without identifiers.
      → STILL NEEDED (Vincent, urgent): (1) treat that Firebase service-account key as compromised — rotate it in the customer's Firebase project and update bl_cms_website_hdr.property_json.firebase; (2) decide whether to purge the images and the old page text from git history (3 commits) — the repo is private but the files were public via CloudFront for ~7 months; (3) request a CloudFront invalidation is already done by the deploy; consider checking CDN/S3 access logs for fetches of /images/push-notifications/.

### standard
- [ ] F-0182 (2026-09-05) `page_type` needs a third value `applet-feature` (parent_page:) for feature sub-pages like push-notification-configuration and website-builder/user-manager — or fold them into the parent. Vincent.

### product (push notifications)
- [ ] F-0183 (2026-09-05) No admin screen writes the Firebase credential (support edits the DB row); FirebaseApp cached per tenant+website for the API lifetime (rotation needs restart); pushToTopic() swallows FCM errors into a 200; two different "default topic" notions (app: Website Default Topic; backend member-restore: the topic described literally "DEFAULT"). Tickets? wavelet-cp-commerce#245 has an unread "Push Notification Configuration Guide" PDF — ingest with identifiers stripped?

## From Lane 4 run 20 — Shipping Pricebook (2026-09-05)

### product (shipping pricebook / storefront)
- [ ] F-0184 (2026-09-05) No working setting in the applet (Field Settings unbound; Default Selection screens write to a container never loaded). Storefront evaluation diverges from the applet UI in five ways (Single Line rules never evaluated; Valid Date Range always passes; Delivery Region compares state only; Calculation Logic always Sequential Match; Handling Fee / Fuel Surcharge ignore Price Source). Inactive shipping price books still offered at checkout (status is an extension; storefront filters hdr.status). No code-uniqueness check; PRICE_BOOK_CREATED audit never written; shipping_price_book_rule_* backend family has no UI. Vincent: issues against wavelet-cp-commerce? make Status set hdr.status? hide or fix the dead Settings entries?
- [x] F-0185 (2026-09-05) Five screenshots (tenant code in sidebar, a possible given name, infographic) quarantined.

## From Lane 3 run 20 — Seller (2026-09-05)

### registry (seller admin — ADR-0002)
- [ ] F-0186 (2026-09-05) seller-admin-applet.md skipped: no registry row under any name; a maintained repo exists (last commit 2026-08-31) but it is not installable from the Applet Store. Register it (then it re-enters the queue) or retire the page and the module links crediting it with "multi-channel inventory sync"? seller_applet documentation_url is empty → set /applets/ecommerce/seller-applet/.

### product (seller applet)
- [ ] F-0187 (2026-09-05) A dozen controls reach no backend call (seller-order SAVE/FINAL/Delete, PI edit actions, PV Create, product Create, Multi UOM/Image/Attribute writes, stock-balance edit/delete…); only PRINTABLE persists; ~45 keys read with no control. Backend: purchase_amount = quantity bug in TmpSellerOrderLineService; discarded BigDecimal.add in EcomSync seller-stock mode (seller totals stay 0); no scheduler wiring for the seller-order processors; no mkp item-code uniqueness. Is the Seller Applet live for any tenant? If not, exclusion may beat documenting 12 dead buttons.
- [x] F-0188 (2026-09-05) Seven images (staff e-mails/phone as rows, person/business names as test branches, developers' names, infographics) quarantined.

## From Lane 4 run 22 — Stock Balance + Stock Conversion (2026-09-05)

### product (stock conversion)
- [ ] F-0189 (2026-09-05) Direction is the reverse of the old page: Input lines ADD stock, Output lines REMOVE it (stored +/− quantity_base, signum 1). Intended, or should the constants flip so Input = consumed? DEFAULT_BRANCH is a silent hard prerequisite (branch drop-down commented out but Validators.required kept → SAVE never enabled without an applet-level Default Branch). VOID endpoint un-permissioned; FINAL gated by _READ only; dead Field Settings / personal defaults.
- [ ] F-0190 (2026-09-05) Stock Balance: DropDownController location lookup has its permission check commented out; unreachable scaffolding in the applet. Registry: stockReplenishmentApplet documentation_url → Confluence (repoint before its page lands); blg-applet-wavelet-internal-kitting-applet exists with no ACTIVE row and no page.
- [x] F-0191 (2026-09-05) Three Stock Conversion images (a first name in listing rows, infographic) quarantined.

## From Lane 3 run 22 — Shopping Cart (2026-09-05)

### product (shopping cart)
- [ ] F-0192 (2026-09-05) Back-office PUT /internal-shopping-carts does not re-stamp the per-website line_integrity_config HMAC, so a staff price edit breaks the customer's checkout when integrity is on. Convert / Print / Export exist as effects with no bound button; Printables targets the Sales Quotation extension code; DEFAULT_BRANCH/LOCATION saved but never read (master screen displays personal values). FINAL only opens the queue when the company's INTERNAL_SHOPPING_CART → INTERNAL_SALES_ORDER row is enabled (old page's "FINAL generates a Sales Order" was wrong). Tickets?
- [x] F-0193 (2026-09-05) Three images (two showing real people, one marketing graphic) quarantined.

## From Lane 4 run 23 — Stock Replenishment (2026-09-05)

### product (stock replenishment)
- [ ] F-0194 (2026-09-05) Dead at processing time: Category filters (cloned, never read), Rules Logic AND/OR, DEFAULT_BRANCH/LOCATION, email_format, Target Scope "Selected companies only" (no company picker → always empty), printable formats, Personal Default Selection (throws). Generation pitfalls: PO fulfillment lines default Quantity To Approve = 0 (zero-quantity PO if unedited); generated PO lines hard-code UOM PCS with no GL/tax; "Block existing open PO" matches supplier+item at any location; re-runs append duplicate lines; a run without a template is never queued. Strategy precedence is by cloning (template → event → run) — editing a template never changes an existing run. Tickets? Registry doc URL → Confluence.

## From Lane 3 run 23 — Supplier Delivery Order (2026-09-05)

### product intent (needs Vincent, blocks a user guide)
- [ ] F-0195 (2026-09-05) "Supplier Delivery Order" is not a purchase document: the applet writes the tenant's INTERNAL_OUTBOUND_DELIVERY_ORDER with the supplier as entity (client_doc_type marker only); 0/0; supplier-access scoping is the entity-login link. Are these drop-ship suppliers delivering to the tenant's customers (driver features suggest so) or deliveries TO the tenant? Move the page out of purchase-workflow/? Dead in templates: FINAL/VOID/DISCARD/CLOSE/print/e-mail (commented out), Create screen unreachable, batch print → unregistered endpoint, permission loader no-op. Legacy CORE1 "Supplier - Delivery Order" row (no code) → registry clean-up.
- [x] F-0196 (2026-09-05) 5.9 MB infographic quarantined.

## From Lane 4 run 24 — Stock Reservation (2026-09-05)

### backend (stock reservation) — availability drift
- [ ] F-0197 (2026-09-05) (a) Expiry job (EXPIRED_STOCK_RESERVATION_REMOVAL_PROCESSOR, only if scheduled, 10/run) soft-deletes expired headers WITHOUT releasing qty_reserved — expired holds vanish from the listing but keep reducing availability. (b) The bin-pinned path sets RESERVED by direct SQL without the processor, so a later RELEASE subtracts what was never added (negative qty_reserved). (c) TMP-removal job TTL filter inverted. (d) No availability check on plain reservations. Together (a)+(b) drift balance-row availability on any tenant using expiry or bins. Old page's "at midnight status becomes Expired and stock is restored" was fiction. Tickets?
- [ ] F-0198 (2026-09-05) Every applet setting is dead (208 shared controls render and save; nothing reads any key). Registry doc URL → Confluence. Scheduler applet (schedulerApplet, ACTIVE, no page) is the only place processor-driven jobs can be configured — commission a page? Job Order applet (writer of reservations) has no page and no registry row.
- [x] F-0199 (2026-09-05) Three screenshots (a username + phone numbers; codes resembling a company abbreviation; infographic) quarantined.

## From Lane 3 run 24 — Tenant Admin (2026-09-05)

### SECURITY (authorisation) — verified by the loop in source
- [ ] F-0200 (2026-09-05) PermissionMigrationUow.getAllUserPermissionAsDTO (javasdk …/dal/uow/permission/PermissionMigrationUow.java ~L383): the trailing `OR (assignee = perm_assignee AND perm_code IN (TNT_TENANT_ADMIN, TNT_TENANT_OWNER))` is appended after `WHERE status != 'DELETED'` and the applet filter without parentheses, so a SOFT-DELETED admin grant on a role still resolves true and the applet filter is bypassed — functional applets show ALL branches/locations to such users (gt#9759); cache re-sync re-runs the same query. Escalate as a product security issue.
- [ ] F-0201 (2026-09-05) Two inconsistent authorisation models: the applet's own endpoints check rank OWNER/ADMIN on the master-DB tenant link; role assignment and root iam/roles CRUD check tenant-DB permissions (TNT_TENANT_ADMIN/OWNER, TNT_LOG_TEAM_ROLE_ASSIGNMENT_*) — rank-only admins get 403 assigning roles (intranet #1927). Should rank-ADMIN admins automatically get TNT_TENANT_ADMIN in the tenant DB? Also: the Tenant Admin Applet CANNOT seed bl_applet_client_side_perm_dfn rows (Applets menu read-only) — every page saying "ask your tenant admin to attach the SHOW_* permission" needs rewording (cross-link batch). Audit Trail never records role/permission changes. Data Sync buttons are stubs; five settings links 404.
- [x] F-0202 (2026-09-05) Four tenant-admin screenshots (real names, an e-mail, customer-identifying applet names) quarantined; one was embedded by user-guide/administration/team.md — embed removed. Four YouTube walkthroughs dropped with an inline-styled div grid — re-embed with {{< youtube >}}? (Vincent)

## From Lane 3 run 26 — User Permission Manager (2026-09-06)

### PRIVACY — five screenshots with personal Gmail addresses
- [x] F-0203 (2026-09-06) All five images under static/images/website-builder/user-permission-manager/ show real personal Gmail addresses; two also a live customer hostname; one is a photograph of a private mailbox. They were embedded by the DUPLICATE page (e-invoice/website-builder/user-permission-manager.md). Embeds stripped and files quarantined by the loop.

### product (website builder access) — revoke does not revoke
- [ ] F-0204 (2026-09-06) "Remove Access" deletes only the app_mst_link_subject_to_role row, but Website Builder admin mode is decided by the CP Commerce Admin applet token from bl_applet_login_subject_link — so a removed person keeps full access (the dialog says "cannot be undone"). "Make Admin" sets the applet-link rank, not the tenant link (created at GUEST), so the promoted person cannot promote anyone else. Five guids in bl_cms_website_hdr.property_json.website_builder_config drive the screen and nothing writes them; HIDE_USER_PERMISSION_MANAGER read with no control; the route guard degenerates to "is logged in"; server failures end in console.error only. Staging sets cpCommerceAdminAppletCode "CPCommerceAdminConsole" — no registry row, so Website Builder admin mode never turns on there. Vincent: should Remove Access also uninstall the applet link? Register the staging code or fix the environment file?

### /applets/ecommerce/cp-commerce-admin-applet/
- [ ] F-0205 (2026-09-06) Its Webstore dashboard section claims 10 tiles and "role-based access control"; there are 13 tiles, 11 checkboxes, and no role is involved. Cross-link batch.

## From Lane 4 run 26 — Supplier (2026-09-06)

### /applets/master-data/customer-maintenance-applet/ + sales guides (fact, follows F-0051)
- [ ] F-0206 (2026-09-06) Credit limit: describe the real mechanism — a nightly `is_customer` job plus four sales document types — and stop implying a real-time hard stop at save. Supplier credit terms/limits are read by nothing at posting time (no due-date derivation, no limit check); say so on the supplier page's neighbours too.

### product (supplier) — entity merge is irreversible and unbounded
- [ ] F-0207 (2026-09-06) The entity merge GUID swap rewrites EVERY entity-referencing column in the tenant database — posted documents, journal rows, balance tables — with no posting-state filter, no fiscal-period-lock check, no type check (a customer can be merged into a supplier), no lock during the run and NO UNMERGE; the history table records only a row count. Vincent: product guard rail, or an explicit irreversible-operation warning in the guides? Also: supplier export writes 11 columns while import accepts 41, so a re-imported export silently blanks e-Invoice, SST, tourism-tax, MSIC and category data — fix the export or warn? Backend one-liner: duplicate supplier code returns "…should not be set" (wrong message template; merchant/employee siblings are correct). Credit limit is integer-only on the supplier side but 2 dp on the customer side — drift? Invitation links never expire; Peppol routing is non-deterministic when two IDs are flagged default.

### registry
- [ ] F-0208 (2026-09-06) supplier-applet has no documentation_url; zero client-side permissions seeded although the code checks ten SHOW_* codes; HIDE_AUDIT_LOG_MENU has no SHOW_* pair so it hides the menu for everyone (F-0044 family). ACTIVE rows with no page: APAutomationSupplierAccess, rma_supplier.

### cross-lane correction for lane 3
- [ ] F-0209 (2026-09-06) Lane 3's claimed `default_einvoice_address` precedence "shipping → billing → main" does NOT exist on the supplier side (the flag is set explicitly from the custom address type). Re-check the claim on the customer page before it is repeated.

## From Lane 4 run 27 — Tax Configuration (2026-09-06)

### F-0040 sharpened — the product's own doc link lands on the wrong page
- [ ] F-0210 (2026-09-06) One registry row (`taxConfiguration`), two wiki pages. master-data/tax-configuration-applet.md is now the derived reference and holds the new alias /applets/tax-configuration-applet/ (which ~12 module/applet pages were linking to as a 404). finance/tax-config-applet.md holds /applets/tax-config-applet/ — the registry's own documentation_url — and is NOT derived. Two pages cannot hold one alias. **Vincent: approve merging finance → master-data and moving that alias**; until then the in-product Documentation button opens the un-derived page.

### product (tax) — user-visible defects
- [ ] F-0211 (2026-09-06) `VAT-SALES` can never be selected on a sales document (blg-shared-utilities sst.component.ts keeps only SST-SLS-OUTPUT / SST-SVC-OUTPUT / GST-OUTPUT on the sales side; VAT-PURCHASE only passes because its name contains "PURCHASE") — Singapore/Thailand/Indonesia tenants have no line-level sales VAT code. One-string fix. Fractional rates are silently rounded to whole percent in Tax Configuration but not in MY-SST (8.5% → 8 or 9). Delete is irreversible in practice (soft delete + non-partial unique constraint permanently consumes the code) with no confirmation dialog. MY-SST and Tax Configuration write bl_fi_cfg_tax_code incompatibly (alpha-3 vs full country name; unrounded vs 2 dp), so MY-SST rows cannot be opened in Tax Configuration (null-check missing).
- [ ] F-0212 (2026-09-06) Tax GL mapping is not in the tax applet: the tax journal line takes GL + subledger from the company default GL link for the doc type's PNS_TAX handler (OUTPUT_TAX / INPUT_TAX). A link with a null subledger drops the tax line silently and FINAL later fails TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES — same silent-failure shape as F-0155. Seven linked applet pages have no registry row and no file (/applets/tax-reporting-applet/, /applets/sales-tax-applet/, …).

## From Lane 3 run 27 — supplier-access family, 6 pages (2026-09-06)

### ACCESS CONTROL — supplier CSV import bypasses the entity-link check
- [ ] F-0213 (2026-09-06) Supplier-portal access is enforced by a row, not a permission: every login-entity-ep read appends `hdr.doc_entity_hdr_guid IN (SELECT entity_hdr_guid FROM bl_fi_mst_entity_login_subject_link WHERE status='ACTIVE' AND subject_guid = <login>)` with the "without permission checking" row mapper. But the supplier **CSV import creates purchase orders in the buyer's tenant and its create endpoint does not check the entity link** — documented behaviour, gap deliberately kept off the page. Vincent: intended, or an access-control bug to fix? Also: Purchase Return SA exposes the buyer's DRAFT returns while the other portals do not — should the five portals agree on which posting statuses a supplier sees?

### product (supplier access) — three of four PDF exports cannot work
- [ ] F-0214 (2026-09-06) GRN SA calls the back-office print endpoint (403 for a plain supplier); PI SA and PR SA build `…/login-entity-ep/print-jasper-pdf/{guid}`, which matches no controller mapping (404); BPO SA passes a hard-coded printable-format GUID. Only PO SA is correct. Same shape for attachments. File as product bugs? Also: `GenericDocumentTypeHandler` registers the Blanket Purchase Order handler with the read and update permission arguments **swapped** (constructor is create/read/update/delete). Register SHOW_COSTING_DETAILS for PO Supplier Access?

### registry
- [ ] F-0215 (2026-09-06) internalPurchaseGrnStockInApplet.documentation_url points at the GRN *Supplier Access* page; PI and PO supplier access still point at Confluence.

### images
- [x] F-0216 (2026-09-06) Nine buyer-side screenshots showing six real staff names quarantined (internal-purchase-return-supplier-access-applet). Twelve clean buyer-side screenshots under internal-purchase-order-supplier-access-applet are reusable on the buyer PO page — noted for the cross-link batch.


## From the blg-intranet e-invoice deep ingest (2026-09-06)

Source: kb/research/2026-09-06-blg-intranet-einvoice-ingest.md (page-by-page brief, with the fact ids
behind every point). Ledger: kb/sources/blg-intranet/ledger.jsonl — 561 issues + 22 README sections +
12 assets. Nothing has been edited on the wiki; these are the changes the material supports.

### security — not a documentation item
- [ ] F-0217 (2026-09-06) Two screenshots in the internal e-invoice knowledge repo expose **live LHDN credentials**: `images/postman-environment-variables.jpg` shows the client id, client secret and a bearer token in readable text, and `images/postman-login-intermediary-system.jpg` shows a full bearer token plus a real customer tax number. Vincent: rotate the secrets and replace the images. Neither was copied anywhere; both are recorded in the ledger as DO NOT PUBLISH.

### /guides/einvoice-guides/
- [x] F-0218 (2026-09-06) The "frequent issues" table has two wrong rows. **Duplicate submission — "System prevents duplicates; check submission history"**: the duplicate guard was only added 2026-08-20, covers the batch-pool push and consolidation sweep only, and was added *because* one sale was validated twice at LHDN; Submission History is a snapshot at submission time, not the live status. **API timeout — "retry after a few minutes"**: the submission path has no timeouts and no rate-limit back-off, and the retry counter shown in the queue is never decremented — nothing is retrying. Also delete "Compliance Dashboard" and "PEPPOL Transaction Log" from the reports list (neither exists), and add one line under Daily Tasks saying a finalised document is *queued*, not submitted, at Save.

### /guides/einvoice-guides/myinvois-setup/
- [x] F-0219 (2026-09-06) The page describes a setup that does not happen. Steps 1–2 tell the reader to obtain a client id, client secret and certificates and enter them in the admin applet. In the intermediary model (the default, and what nearly every tenant uses) the customer instead **authorises BigLedger as their e-invoice intermediary on the MyInvois portal**; BigLedger holds the credentials centrally and mints a token on behalf of their tax number, and there is no certificate for the customer to upload anywhere. Rewrite Steps 1–2, delete Step 4 ("Set up validation rules" — no such configuration exists), and reconcile the three-phase implementation timeline with the five-phase one on malaysia-e-invoice-guide.md.
- [x] F-0220 (2026-09-06) Add the ordering rule that costs customers documents: **the company's e-invoice status must be ENABLED before any document is finalised**. A document finalised while the company is not enabled is dropped silently — no queue row, no pool row, no error — and is only recoverable by a support query. Also add the two setup failures that are entirely in the customer's hands: too few permissions granted to the intermediary on the MyInvois portal (the commonest hard failure), and an intermediary authorisation that has lapsed (symptom: every submission fails at once with no data problem). Exact permission list blocked on kb/questions/2026-09-06-myinvois-intermediary-permission-set.md.

### NEW /guides/einvoice-guides/einvoice-month-end/
- [x] F-0221 (2026-09-06) The highest-value missing page: what happens between the 1st and the 7th. Clear the Individual Pool before the run (below RM 10,000 you can move a document to the Batch Pool to be consolidated instead — above it the backend refuses); work the Invalid list after it (resubmission keeps the original document date, so a correction on the 3rd still belongs to last month); reconcile, with the five reasons a tally does not balance in the order support checks them — including the trap that a batch-pool row marked *processed but failed* is **not** swept into the monthly consolidation; and set the expectation that submission is a background queue running at a few hundred documents an hour. Publish none of the SQL, endpoints or the per-tenant schedule.

### /guides/einvoice-guides/einvoice-validation/
- [x] F-0222 (2026-09-06) The guide covers general-TIN misuse but misses the largest real failure class. On one measured tenant, 426 of 448 recorded rejections were identity **formatting**: foreign customers keyed as NRIC instead of PASSPORT (322), national ID stored with hyphens (82 — and no hyphenated ID on that tenant ever passed, while 1,803 clean ones did), a registration number in the national-ID field (20), plus an invisible zero-width character pasted into the tax-number field. Add the rule: PASSPORT for non-Malaysians, BRN for companies, national ID as 12 digits with no dashes, typed not pasted. Whether BigLedger normalises any of this is blocked on kb/questions/2026-09-06-einvoice-identity-normalisation-status.md.
- [x] F-0223 (2026-09-06) Three more additions to the same page: (a) **which address BigLedger sends** — the first flagged as the e-invoice address, in the order shipping → billing → main — which appears nowhere on the wiki and is the first question a multi-address customer asks, plus the recognised state aliases (KL, N9, Johore, Malacca…); (b) the **apparent** duplicate — sales invoices and self-billed purchase invoices draw numbers from two independent sequences that both start at the same value and the listing does not show the document type, so check the type before cancelling anything (one customer was one step from cancelling 129 valid e-invoices); (c) the credit-note reference error has a second code, where the note's **buyer** must match the referenced invoice's buyer, not just the reference.
- [x] F-0224 (2026-09-06) Sharpen the cancellation callout: the 72-hour clock runs from the validation time recorded on the e-invoice, in UTC, and can be **earlier** than what the portal appears to show — compute the deadline from the e-invoice record.

### NEW /guides/einvoice-guides/einvoice-cancel-and-correct/
- [x] F-0225 (2026-09-06) A short guide for a high-stakes decision tree that today lives in an applet reference table: you cannot edit a validated e-invoice (Save and Resubmit is refused by design); inside 72 hours you cancel, but **nothing advances a cancellation request automatically** — it waits for a human to approve it and choose what happens to the source document, which is why "it's stuck" is the commonest ticket; consolidated e-invoices only work with one of the four options and the others fail before the tax authority is even called; past 72 hours it is the credit-note path with accountant sign-off; and a credit note pointing at an original that was rejected and resubmitted is itself rejected. Blocked in part on kb/questions/2026-09-06-einvoice-consolidated-cancellation-ui.md.

### /guides/einvoice-guides/einvoice-pools-and-routing/
- [x] F-0226 (2026-09-06) Accurate page, four additions: consolidation and consolidated submission are now **processor-driven per company** (Aug–Sep 2026 rollout) and deliberately triggered days before the 7th; there are **two consolidation methods** that look different to the customer (by document = one line per receipt; by branch = one line per consecutive range of branch document numbers, capped at 200 lines, with separate e-invoices for local, foreign and government counterparties); **a consolidated e-invoice cannot contain a foreign buyer** (key ID type PASSPORT and submit individually); and the batch-pool trap — a row marked *processed / failed* is stranded, not waiting. Also: the guide dates the RM 10,000 rule to January 2026 — do not date it unless the date can be sourced from LHDN. Recommendation on by-document vs by-branch blocked on kb/questions/2026-09-06-consolidation-by-document-vs-by-branch.md.

### NEW /guides/einvoice-guides/einvoice-self-billed/ — blocked
- [ ] F-0227 (2026-09-06) Self-billed e-invoices appear in the guides only as an item in a list of document formats, yet they are a full pipeline: roles reversed (your company is the buyer, the supplier is the issuer of record), their own foreign-supplier general tax number, their own consolidation grouping, their own share of the reconciliation report, and a steady support load. The material is ready; the guide is blocked on kb/questions/2026-09-06-einvoice-self-billed-scope.md (which document types, where the flag is set, whether they can be consolidated, which LHDN scenarios our customers use it for). It also needs the classification-code problem: an expense line has no item master, and the legacy source side has nowhere to store the code.

### /guides/einvoice-guides/peppol-configuration/
- [ ] F-0228 (2026-09-06) 180-word page whose central instruction contradicts our own applet page: it tells the reader their Peppol ID is `0195:<registration number>` while mypeppol-admin-applet.md gives a different scheme and the registration screen takes a *special identifier* plus a *business identifier*, not one concatenated string. It also sends the reader to an "E-Invoice → PEPPOL Settings" menu that does not exist, claims a 7-year archival requirement with no source, and (with _index.md) frames Peppol as "cross-border only" — the monthly statistics BigLedger files as an access point are Malaysian **domestic** invoices. Rewrite from scratch; blocked on kb/questions/2026-09-06-peppol-participant-id-scheme.md. Add the one sentence that saves tickets: a Peppol document waits on the same master data as the LHDN e-invoice and runs beside it, not after it.

### /modules-v2/e-invoice/
- [x] F-0229 (2026-09-06) Three factual errors on the hub. "Individual real-time clearance UUID mandatory **within 72 hours**" — 72 hours is the cancellation window after validation, not a submission deadline. Go-Live Checklist: "Digital signing certificate uploaded in MY E-Invoice Admin Applet" and "LHDN / PEPPOL production API access keys configured" — neither is a customer task in the intermediary model; replace with "BigLedger authorised as your e-invoice intermediary on the MyInvois portal, with the full permission set". And the admin applet is described as "central management of digital signing certificates" — it manages queues, pools, consolidation, cancellation and reconciliation; there is no certificate screen in it.

### /guides/einvoice-guides/malaysia-e-invoice-guide/
- [x] F-0230 (2026-09-06) Delete the ~20 `<mcreference link="…">` tags — raw markup from another tool that renders as literal text on the live page. Then decide the page's job: it duplicates the section index's compliance framing and is sourced entirely from third-party summaries. Either make it the single "what Malaysia requires" reference (moving the phase table here and deleting the conflicting one on myinvois-setup.md) or fold the useful parts into _index.md and delete it. Its "55 data fields" claim is corroborated internally (55 fields, 37 mandatory, 18 optional) — keep it, cited.

### /applets/e-invoice/ — targeted additions
- [x] F-0231 (2026-09-06) The applet pages are already strong; five small additions. **Admin applet**: a troubleshooting row for "the same document number appears twice" (two independent number sequences, not a duplicate — check the document type before cancelling); sharpen the IN_QUEUE row to say the displayed retry count is not real; say why Validation Queue → Submit is capped at 20 rows; state plainly that a rejection request never advances on its own; and give the Discrepancies Report more than a table row, since it is the customer's only self-service reconciliation tool. **Peppol applet**: the monthly statistics obligation (it explains the Monthly Report menu) and the order-reference requirement. **Portal applet**: a buyer rejection raised on the tax portal instead of here does not reach BigLedger at all.

## From Lane 4 run 28 — Warehouse Management (2026-09-06)

### SELF-CORRECTION — two already-shipped pages are wrong
- [ ] F-0232 (2026-09-06) `inv-item-maintenance-applet.md` and `stock-reservation-applet.md` (both already rewritten and live) state that Warehouse Management owns stock locations (`bl_inv_mst_location`) and reservation bins. Neither is true: the WMS owns a separate `bl_wms_*` warehouse→layout→node→container hierarchy, and its Bin Number tab is dead code with no save handler. Correct both pages in the cross-link batch — this is the first case of a later lane disproving an earlier lane, and it argues for a verification pass over the ~89 shipped pages once the applet queue empties.

### product (WMS) — two real bugs
- [ ] F-0233 (2026-09-06) (a) `createPickingList` ignores the queue selection and the remaining balance — it walks EVERY line of the source document at full `quantity_base`, and truncates to `int` because `qty_to_pick`/`qty_picked` are Integer columns in a BigDecimal system. (b) The Receiving Doc FINAL button has two code paths: the listing honours `ENABLE_AUTO_ITEM_ALLOCATION_TO_CONTAINER`, the editor always auto-allocates. Also: Settings › Release Notes and Audit Trail are 404s (shared sidebar links routes the applet does not define); Feature Visibility is the default landing screen yet has no sidebar link, and is a stub with hard-coded team names. Tickets?
- [ ] F-0234 (2026-09-06) The whole WMS outbound flow is inert until a button in ANOTHER applet is pressed: the Picking Queue's only producer is `insert-wms-picking-queue`, called solely from Sales Order (Internal) V2's Pick Pack Queue screen, which also deletes the finance-side `bl_fi_pick_pack_queue` rows. Nothing in the WMS repo reveals this. The inventory guides must say so.
- [x] F-0235 (2026-09-06) 21 of 23 WMS screenshots quarantined (a full personal name repeated across PIC/Supplier columns, a real insurer's registered name, developer test records built from first names, infographic). 13-shot recapture list in lane-4 findings.


## From the e-invoice guide-writing unit (2026-09-06)

Shipped in `d28e4354`: new `einvoice-month-end.md` and `einvoice-cancel-and-correct.md`; corrections to `_index.md`, `einvoice-validation.md`, `einvoice-pools-and-routing.md`, `malaysia-e-invoice-guide.md`, `myinvois-setup.md`. F-0218…F-0226 and F-0230 closed by it. Residuals and new items below.

### /guides/einvoice-guides/einvoice-month-end/
- [ ] F-0236 (2026-09-06) The weakest sentence in the new guide set is the throughput advice. The month-end guide can only say "hours, not minutes; plan a few hundred an hour; start on the 1st" because the ingest notes hold two conflicting submission-rate figures and an open question on whether batched submission shipped. A reader planning a 38,000-receipt close needs a number. Blocked on kb/questions/2026-09-06-einvoice-throughput.md — resolve by measuring a real consolidation run rather than by asking.
- [x] F-0237 (2026-09-06) Four intranet assets are cleared for publication but not yet copied into `static/images/`: `lhdn-core-workflow.png` (redraw as a Hextra-safe SVG rather than embedding the PNG), its drawio source, `einvoice-entity-json-priority-chart.jpg` (better rendered as a table on einvoice-validation.md than as an image) and `forex-error.jpg`. Do this in the next e-invoice unit — several guides currently carry no diagram at all.

### /guides/einvoice-guides/myinvois-setup/ — scope call to review
- [ ] F-0238 (2026-09-06) The setup page was rewritten to the intermediary model even though it was outside the unit's brief, because correcting `_index.md` to say "authorise BigLedger as your intermediary" would otherwise have left its own landing page linking to a page still telling readers to obtain a Client ID and Client Secret and generate certificates. The rewrite is well sourced. Two things were withheld: the intermediary permission set (the guide says "grant the full set, ask before you save the form" — F-0219's residual, still the single biggest win available on this page), and the address `einvoice@bigledger.com`, removed rather than published because nobody has confirmed it routes anywhere. Vincent: does it?


## From the e-invoice section-completion unit (2026-09-06)

Done, not shipped (no commit): F-0229, F-0231 and F-0237 are closed. Notes, sources and the full
findings list are in `planning/drafts/2026-09-06-einvoice-section-completion.md`. Two scope extensions
were taken and are argued for there: the module hub's child pages repeated the same certificate /
API-key errors as the hub, and `modules-v2/e-invoice/reports/` named five reports that do not exist.

- [ ] F-0239 (2026-09-06) `peppol-configuration.md` is the largest remaining defect in the e-invoice section and it is live. 180 words sending readers to an "E-Invoice → PEPPOL Settings" menu that does not exist, a participant-ID format our own applet page contradicts, and an unsourced 7-year archival claim. F-0228 blocks the rewrite on kb/questions/2026-09-06-peppol-participant-id-scheme.md. Its weight was moved 20 → 45 so it stops sitting third in the reading order, which reduces the harm and does not remove it. Vincent: while the rewrite is blocked, do we (a) set `draft: true`, or (b) strip just the menu path and the archival claim as an interim and leave the participant ID wrong? Option (a) is a publication decision, not a writing one.
- [ ] F-0240 (2026-09-06) The guide set has no page on the **purchase side**. The section index's daily routine says "match incoming supplier e-invoices against your purchase documents" and no guide explains how — External Reception and Reconciliation (Purchase) are documented on the applet page and nowhere else. For a retailer with ~1,200 suppliers this is a real monthly job and the natural companion to the blocked self-billed guide (F-0227). Proposed: *Receiving and matching supplier e-invoices*. Needs a brief and probably wants the self-billed scope question answered first.
- [ ] F-0241 (2026-09-06) Housekeeping: F-0236 cites `kb/questions/2026-09-06-einvoice-throughput.md`, which does not exist — the real file is `kb/questions/2026-09-06-einvoice-submission-batching-status.md`. Also worth recording there: this pass verified from the current backend that submission is still strictly serial (one row per processor iteration, one document per LHDN call) and that no batching exists in that code path, so the F-0236 number still has to come from measuring a run.


## From the loop coordinator (2026-09-06)

### site-wide — link hygiene
- [x] F-0242 (2026-09-06) **118 Hextra `{{< card >}}` links were written relative** (`link="einvoice-validation"`, `link="../cash-management"`, `link="./sdks"`). A browser resolves most of them, so nobody noticed — but they are resolved against the site root by the link checker, and any page move silently strands them. All 118 rewritten to absolute URLs, verified against the target file. **Broken links fell 376 → 273 in one pass** — this single pattern was 27% of the site's link breakage. Commit 373e0525. Left alone deliberately: `./examples` and `./migration` on `/developers/getting-started/` point at pages that do not exist (see F-0243), and two `mailto:` cards.
- [ ] F-0243 (2026-09-06) `/developers/getting-started/` offers cards for **Examples** and **Migration** — neither page exists, and never has. Either write them or drop the cards. Same class as the phantom-applet problem: a card that promises a page is worse than no card. While there: `content/en/modules/membership/_index.md` links `setup-configuration` and `operations`, and `content/en/developers/_index.md` links eleven pages (`applet-sdk`, `applet-examples`, `applet-deployment`, `architecture/data-models`, `architecture/security`, `architecture/scalability`, `scheduling`, `platform-extensions`, `multi-tenant`, `infrastructure`, `enterprise-auth`) that do not exist either. The developers section promises far more than it delivers — and CLAUDE.md says `developers/` deserves the same care as the user manuals.

## From Lane 4 run 29 — Workflow Design (2026-09-06)

### /applets/master-data/workflow-design-applet/ — shipped
- [x] F-0244 (2026-09-06) The old page was 358 lines of invented user guide. It claimed webhooks, e-mail/SMS notification, database updates on status change, amount-based conditional routing, approver delegation, process version control, a workflow-design audit trail, and that the system blocks deletion of an in-use status. **None of it exists.** Rewritten to 369 lines of sourced reference (commit 91a01519).

### product — the wiki has been documenting the wrong approval engine
- [ ] F-0245 (2026-09-06) BigLedger has **two** things that look like approvals, and the wiki conflates them. Workflow Design (`bl_wf_md_*`) is inert: Transition Actions, Action Types and Subscribers have CRUD services but no job processor ever reads those tables, and Triggers fire only for Service Note / RMA. The **real** engine is `bl_fi_generic_doc_approval_*` — it has a processor and pending/reject e-mails, and is configured from PO / PR / Stock Requisition **Approval Settings**. Every guide or module page that says "configure your approval workflow in Workflow Design" is pointing customers at the dead one. Needs a sweep, and it is the reason METHOD gains §34: *before documenting a feature, grep the schema for a second table family with the same noun.*
- [ ] F-0246 (2026-09-06) Two facts that change how support reads a ticket. (a) **The status track is a label, not a gate**: the backend validates only that the process and status GUIDs exist — nothing checks that the status belongs to the process, or that a transition between two statuses was ever defined. The only enforcement anywhere is a client-side setting that hides the FINAL *button* on one screen. (b) **"Who can move it" is a SQL join**: available statuses come from an inner join transition → transition-role-link → role → subject; a transition with no role row returns nothing, for everyone. That is the empty status drop-down support keeps seeing. METHOD §33: when an applet's screens are a role-filtered list, read the SQL, not the component.

### product (Workflow Design) — nine defects
- [ ] F-0247 (2026-09-06) Filed as F-lane4-29-a…i in planning/lanes/lane-4/findings.md. The ones worth a ticket: Printable Format Settings queries `INTERNAL_BLANKET_PURCHASE_ORDER` (leftover from the fork — the applet has no print button at all); a Release Notes link that 404s; `ProcessStatusService.delete` has no in-use check, so a status referenced by live documents can be deleted; Create Process's Status and Transition tabs are grids bound to `[]` with no Add control, so work only happens in Edit; a Transition Trigger can be saved with a null target; and the Action screen stores the typed Name in the `namespace` column. Dead fork code is tracked by intranet #4126.

### /applets/finance/ — one applet, two pages
- [ ] F-0248 (2026-09-06) `depositApplet` "Deposit Applet" has two wiki pages — `finance/deposit-applet.md` and `finance/mm-deposit-applet.md` (the latter holds the registry `documentation_url` alias) — for one applet with three menus (MM Deposit Requisition / Register / Category). There is no second "general deposits" applet, so `modules-v2/financial-accounting/_index.md` L178–179, which lists them as two applets with different scopes, is also wrong. Recommendation: keep `deposit-applet.md`, move the alias onto it, delete `mm-deposit-applet.md`. Same shape as F-0050. **Vincent's call.**

### site-wide — approvals (Vincent, 2026-09-06)
- [ ] F-0249 (2026-09-06) Vincent confirms F-0245 and adds the fact the wiki is missing: **"the workflow approval for purchase order, sales invoice, sales order and other applets are actually optional."** Verified in `blg-akaun-platform-java`: nothing in the generic-document validators or the generic-document domain services references approval at all — the approval subsystem sits *beside* the document lifecycle, not inside it. A document finalises whether or not an approval setting exists. Approval only happens if you configure `bl_fi_generic_doc_approval_setting` (per submitter designation, with `total_required_approval_level` levels defined in `approval_setting_json`) from the applet's own Approval Settings. **115 English pages mention approval**; the sweep must (a) say plainly that approvals are optional and off until configured, (b) stop pointing readers at Workflow Design, which is the inert engine, and (c) name the real one and where it is configured.

### site-wide — the permission model (Vincent, 2026-09-06)
- [ ] F-0250 (2026-09-06) Vincent: *"We have different type of permissions, some are client-side only, some are by company, by branch, by locations, and some are IMPLICIT, means, thru the database relations."* Confirmed against the live registry (`app_perm_dfn`, akaun_master, read-only, aggregate only): **11,183 active permission definitions**, and the taxonomy is visible in `target_options.target_type` — **10,410 are `NA`** (a plain grant with no scoping target) and **762 are `UNIQUE`**, scoped to a specific row in `bl_fi_mst_comp` (company), `bl_fi_mst_branch` (branch), `bl_inv_mst_location` (location) or `bl_fi_mst_entity_hdr` (entity); 453 of those offer all four. The wiki documents none of this — it talks about "roles and permissions" as if there were one kind. **This is the clearest candidate yet for an ADR-0006 concept page**, and it is cross-module, so ownership needs deciding.
- [ ] F-0251 (2026-09-06) The verified consequence, and it is a confidentiality problem, not a documentation one. Every seeded definition is a **server-side API permission** (`TNT_API_*_CREATE/READ/UPDATE/DELETE/ADMIN`) — a sample of 11,183 rows returned **zero** `SHOW_*` or `HIDE_*` codes. But the applets check client-side visibility codes of exactly that shape (F-0044, F-0073). A permission code that is not in `app_perm_dfn` **cannot be granted to anyone**, so a hide-switch whose default is "shown" and whose permission can never be granted means the data is permanently visible to every user of that applet. Two lanes hit this independently and it was recorded as a docs question both times; with the registry counted it is a product defect. **Needs Vincent: is this a seeding omission or is client-side visibility deliberately outside the permission registry?**
- [ ] F-0252 (2026-09-06) The **IMPLICIT** class is the one that has bitten us most and is entirely undocumented: access granted by the existence of a row rather than by a permission. Confirmed instances so far — supplier-portal access via `bl_fi_mst_entity_login_subject_link` (F-0213, which also has a bypass), Workflow Design transitions via `bl_wf_md_transition_role_link` (F-0246 — a missing row silently returns nothing for everyone), and `PermissionMigrationUow`'s unparenthesised `OR` that lets soft-deleted tenant-admin grants still resolve (F-0200). A reader cannot reason about who can see what without knowing this class exists. It belongs in the same concept page as F-0250.

## From the approvals sweep and Lane 4 run 30 (2026-09-06)

### site-wide — approvals, shipped
- [x] F-0253 (2026-09-06) Sweep complete (commit f25a917f). **209 of 227 pages mentioning approval read; 77 were wrong; 75 fixed across 80 files.** By failure mode: 13 pointed at Workflow Design (the inert engine), 48 presented approval as mandatory or attached it to a document type with no engine at all, 30 invented features. Proof that approvals are optional, from source: the generic-document validators contain no reference to approval, `GenericDocumentService` contains the string zero times including `updatePostingStatusWithChecks` (the method that sets FINAL), and the dependency runs the other way — `GenericDocApprovalRequestProcessor` *calls* that method on the last approval. **Approval causes FINAL; FINAL never requires approval.** New canonical page: `/guides/document-approvals/`.
- [ ] F-0254 (2026-09-06) Scope is far narrower than the wiki claimed: only **Purchase Order, Purchase Requisition and Stock Requisition** carry Approval Settings, and **Stock Requisition is a dead end** — settings screen and menu item, but no approval tab on the document, no Approval Request screen, no history. A setting made there cannot be used. Does not exist anywhere: delegation, escalation, reminders, SLA, approval matrix, auto-approval, amount-band routing, mobile approval. `approval_logic` (ANY/ALL) and `max_approval_amount` are collected by the UI, stored, copied to the sequence row and **never read**; `min_approval_amount` is the only live amount rule and does not route — it counts how many levels apply. **Vincent: are the two inert fields a product decision to fix, or does the guide keep explaining them?**

### SECURITY — two more anonymous endpoints
- [ ] F-0255 (2026-09-06) **The approval decision endpoint is unauthenticated.** The link in the approver's e-mail posts to `PUT …/approval-requests/processors/public-ep`, declared `AnonymousTenantEndpoint`. Anyone holding an `approval_request_guid` can approve or reject a purchase order, and the history then records the real approver's name. Deliberate convenience or oversight? It also decides whether the new guide should advertise "approve without logging in". `kb/questions/2026-09-06-approval-public-decision-endpoint.md`.
- [ ] F-0256 (2026-09-06) The **deposit invitee quotation form and both its endpoints are also `AnonymousTenantEndpoint`** — no token, no expiry; the link GUID is the only credential. Same class as F-0255 and as the supplier-portal bypass (F-0213). Three independent instances now: worth asking whether `AnonymousTenantEndpoint` is reviewed at all.

### product — why client-side permissions are never seeded (answers F-0251)
- [ ] F-0257 (2026-09-06) Runs 28, 29 and 30 each found no rows in `bl_applet_client_side_perm_dfn`, and run 30 found the reason: **the only screen that would seed them is a mock.** The Developer SysAdmin Applet ships two whole menus and seven Edit-Applet tabs bound to hard-coded `rowData` literals; Category → SAVE raises *"Category updated successfully"* and makes no HTTP call. This closes the loop on F-0251 — the `SHOW_*`/`HIDE_*` codes cannot be granted because nothing can create them. **Vincent: is Developer SysAdmin unfinished, or has its job moved to PlatformSysAdmin?** `finance/budgetary-applet.md` also credits it with job-processor subscription screens it does not have.

### /applets/ — registry and structure
- [ ] F-0258 (2026-09-06) **`finance/e-mandate-applet.md` documents an applet that is not registered.** No row in the TSV or in the live `bl_applet_hdr` (236 rows; searched code, name and `property_json` for mandate / ddebit / direct-debit / fpx). The repo is real and current (last commit 2026-08-12, three menus) — built but never registered. Per ADR-0002 the page was not rewritten. **This will recur; it deserves an ADR amendment rather than a per-page call**: register, mark "not yet available", or unpublish.
- [ ] F-0259 (2026-09-06) Cross-lane corrections queued from run 30: `modules-v2/financial-accounting/_index.md` L178–179 invents two deposit applets from one registry row; six lines across four `modules-v2/crm-digital/` pages credit Event Management with a landing-page builder, ticketing, QR check-in, surveys and an attendance/conversion report — **none exists**; `applets/finance/internal-purchase-invoice-applet.md:386` and `applets/rma/internal-rma-applet.md:252` still point at Workflow Design for approvals (reserved paths during the sweep); `applets/finance/budget-applet.md` says "approval matrices" — and the Budget Register has its **own** parallel approval engine (`bl_fi_budget_register_approval_*`) that nobody has audited, so document-approval facts do not transfer to it.
- [ ] F-0260 (2026-09-06) 16 further defects filed as F-lane4-30-a…r, notably: `DepositRolloverProcessor` writes orphan MONTH_OPENING/MONTH_CLOSING rows and rolls nothing over; DELETE is unreachable on both deposit document screens; Engagement Code and Name are `readonly` with no writer, so engagements can only arrive via `/etl-ep`; deposit register create/update/**delete** are all gated by `TNT_API_DEPOSIT_READ` while the `_UPDATE`/`_DELETE` permissions exist and are used by no controller. Also: 16 screenshots quarantined this run — 7 of them engagement captures showing a live tenant's **real client company names** (total quarantined now 184).

## From the concepts pilot (2026-09-06)

### ADR-0006 — the pilot does not support its own central claim
- [ ] F-0261 (2026-09-06) The e-invoice concepts pilot shipped (commit ae64ec9b): three concept pages, six guides de-duplicated, no guide lost a warning, broken links fell 273 → 270. But the required self-check verdict is **"better, but by less than the rework cost, and mostly through de-duplication that the layer prompted rather than delivered"**. The honest finding: deleting twelve duplicated lines from the pools guide needed somebody to *notice* the duplication, not a concepts layer. **The ADR's claim — that a concepts layer is what separates us from AWS — is not supported.** What separates us is still procedures a reader can complete unaided. Recommendation accepted: **do not roll out to a second module yet.**
- [ ] F-0262 (2026-09-06) **My spec put the layer in the wrong place, and I should have caught it.** `planning/specs/concepts-layer.md` says concepts live under `modules-v2/<module>/concepts/`. Two problems: (a) `modules-v2/e-invoice/core-concepts/` **already existed**, so the menu now shows sibling sections called "Concepts" and "Core Concepts" — patched with cross-links, which is a patch, not a fix; (b) it puts concepts in the architecture section while the reader who needs them is working in `/guides/`, so every link costs a section switch. AWS — the stated bar — keeps concepts inside the same service's user guide, one level up from the procedures. **Needs Vincent: amend ADR-0006 to place concepts beside the guides, and rename `core-concepts/` to `architecture/`?** Discussion with four options: `planning/discussions/2026-09-06-concepts-vs-core-concepts.md`.
- [ ] F-0263 (2026-09-06) The ADR's testable promise was that a concepts layer makes the missing procedures *cheaper to write*. That is now the next unit and the actual go/no-go: write one P0 procedural gap from the GPT review and measure whether the three concept pages helped. If they did not, the layer is decoration and ADR-0006 gets revisited as it says it will.

### e-invoice — a possible compliance exposure
- [ ] F-0264 (2026-09-06) The RM 10,000 divert into individual submission is enforced for **only two document types** — `INTERNAL_SALES_INVOICE` and `INTERNAL_SALES_CASHBILL` (`EInvoiceConstants.ENFORCE_INDIVIDUAL_DOCS`). The concept page now names those two. **Open question: should credit notes, debit notes, refund notes and sales returns of RM 10,000 or more also be blocked from consolidation?** If the answer is yes, affected documents are already at LHDN inside consolidated e-invoices in a shape LHDN forbids — silently, with nobody looking. An internal issue asked for this audit and never got one. `kb/questions/2026-09-06-rm10000-threshold-document-types.md`. `einvoice-pools-and-routing.md` still carries the older unqualified wording; correct it in the next e-invoice pass.

## From Lane 4 run 31 — Fixed Asset, RMA (2026-09-06)

### product (Fixed Asset) — the depreciation journal is always empty
- [ ] F-0265 (2026-09-06) **Every depreciation journal BigLedger posts has zero lines.** The processor appends each journal line only when the asset header's `fi_depr_subledger_guid` / `fi_acc_depr_subledger_guid` is non-null — and a grep of the entire Java tree finds both columns read, filtered and FK-checked but **never set by anything**. The journal validator has no line-count check and no debit=credit check, so a `POSTED` header with no lines is written silently. The same applet's Transactions tab sends null subledgers and works, because `JournalService.createJournal` resolves them from the GL code; the depreciation path filters the lines out *before* that code can run. Two compounding bugs on top: the run selects assets by month and year only — ignoring its own company and branch parameters — and keeps `BaseQueryCriteria`'s default limit of **100**; and the stop condition is `accumulated <= residual`, so an asset with residual 0 is flagged `DEPRECIATED` on the first run and its later lines and journals are permanently deleted. This is the most serious product defect found in 31 lane runs. **Needs a ticket, not a doc change.**
- [ ] F-0266 (2026-09-06) `ledger-and-journal-applet.md` states "FINAL on Fixed Asset creates an `AUTO` journal". There is no FINAL on a fixed asset, and only the depreciation processor writes `AUTO`. Fix in the cross-link batch.

### product — there are FOUR approval engines, not three
- [ ] F-0267 (2026-09-06) RMA Requests use a fourth, unrelated mechanism: `SVCApprovalStatus` on `bl_svc_issue_request_hdr` — no shared table, no shared enum, no settings screen anywhere. Approving enqueues a processor that `SELECT`s the request row and casts it into `bl_svc_issue_hdr`, guarded only by `svc_issue_hdr_guid IS NULL`. With Workflow Design (inert), `bl_fi_generic_doc_approval_*` (real), `bl_fi_budget_register_approval_*` (unaudited) and now this, **"approval" in BigLedger means four different things**. `kb/topics/document-approval.md` updated. This strengthens the case that the permission/approval model deserves a concept page of its own.

### /applets/ — three applets built but not registered
- [ ] F-0268 (2026-09-06) Group Maintenance (run 9), E-Mandate (run 30) and now Team Maintenance (run 31) are all actively maintained repos with **no ACTIVE row in `bl_applet_hdr`**. Three instances is a pattern, not a curiosity: either the registry is stale or applets ship outside it. **This needs an ADR-0002 amendment** deciding what the wiki does with a built-but-unregistered applet — register, publish with a "not yet available" banner, or unpublish.
- [ ] F-0269 (2026-09-06) `finance/general-ledger-applet.md` is a TODO placeholder for an applet with no registry row (only `LedgerAndJournal`, already documented) — but it has **19 inbound links in two URL shapes, neither claimed as an alias by any page, so all 19 are broken today**. Merge-plus-alias plan in lane-4 findings; needs Vincent, and the zh twins move in the same commit.
- [ ] F-0270 (2026-09-06) Recommended deletions, all evidenced: `integrations/ingram-micro-ms-esd-applet.md` and `integrations/vstecs-ms-esd-order-applet.md` (every related registry row is in `applet-exclusions.tsv` as customer-specific; one page is front matter with no body and names a real distributor in its title), and the three Team Maintenance pages (all stubs — one page's entire body is the character `1`). Deleting the VSTECS page also frees a registry `documentation_url` alias.

### screenshots — a stale image is a factual error, not only a privacy risk
- [ ] F-0271 (2026-09-06) Fixed Asset's entire old configuration section had been transcribed from a **screenshot whose menu was commented out upstream months earlier**. The page documented a screen that no longer exists, and nothing flagged it because the image was clean. Add to METHOD: verify a screenshot against current source before writing from it. Separately, 22 images quarantined this run (total 206) — RMA's Personalization screens showed a real person's photograph, full name and work e-mail *as the subject of the page*. **Still needs Vincent: does the small top-bar avatar disqualify the 16 images kept across these two pages?**

### /applets/ — ADR-0007 drafted (2026-09-06)
- [ ] F-0272 (2026-09-06) F-0268's pattern is now a proposed decision: `planning/decisions/0007-built-but-unregistered-applets.md` (+ discussion). **Needs Vincent to accept, amend or reject.** Proposal: archive rather than publish a page for a built-but-unregistered applet, track it for automatic restore when a registry row appears, repoint inbound links in the same commit, delete the four "Introduction to…"/"Installation of…" stubs outright, and ask the platform team **once** whether the three are meant to be registered — one question that resolves the pattern instead of three that resolve instances. Seven pages affected; three of them carry inbound links (7, 3 and 2).

## From the incoming-supplier-e-invoice unit (2026-09-06)

### /guides/einvoice-guides/ — the wiki promised a daily task nobody could perform
- [x] F-0273 (2026-09-06) Shipped 805e3708. New guide `einvoice-incoming-supplier.md`, and the index's daily loop corrected. Verified against the backend, the five e-invoice applet repos, the internal knowledge repo, **and a read-only sweep of 89 of 93 active production tenants** (aggregate only): there are **three inbound pipelines and they are not connected to each other**. (1) The LHDN inbound pull is real but **write-only** — `getRecentDocuments` hard-codes `direction=Received` and lands in a staging cache that nothing reads; the only producer-shaped class for the real store carries the comment *"the lhdn api is not available yet"* and has zero callers. `bl_fi_my_einvoice_from_irb_hdr` — the *From IRB E-Invoice* screen — holds **0 rows on every tenant**. (2) A live matcher exists but is **never fed from LHDN**; its only producers are PEPPOL and e-mail OCR, and it pairs on **four-field exact equality** with no tolerance. (3) **Nothing has ever matched**: the matched-history table is empty on all 89 tenants, while the purchase-doc queue holds **35,704** rows and the sales-doc queue **626,732**, all PENDING since August 2024 — and since a successful match deletes both rows, those are the never-matched remainder. A buyer also cannot reject a supplier's e-invoice from BigLedger at all: the only document-state call hard-codes `status="cancelled"`.
- [ ] F-0274 (2026-09-06) **Needs Vincent, and it decides whether the new guide is right or needs rewriting**: is the from-IRB consumer planned, abandoned or forgotten? blg-intranet#5617 proposes exactly this work. Second: **is four-field exact equality intended to stay?** Nothing has ever matched under it; if a tolerance is coming, the guide should not teach the current rule as permanent. Third, a live-path bug not put on the page: the inbound processor writes `dateTimeReceived` into `date_time_issued`, overwriting the issue date — harmless while nothing reads the table, and not harmless the day something does.
- [ ] F-0275 (2026-09-06) `applets/e-invoice/my-einvoice-for-customer-and-supplier-applet.md` is **substantially invented** and the errors are structural, not proofreading. It tells readers the matching flow is fed from **GRNs** (GRN is not in the purchase document types at all), that *From IRB E-Invoice* is "pulled in real-time from the LHDN Government Portal", and that this is "how you verify your Input Tax Credits" — then walks AP staff step-by-step to a screen that is empty on every tenant. Rewrite, stub or unpublish: Vincent's call. Two other pages carried the same false claim and were corrected in this commit (`my-e-invoice-admin-applet.md` §7 and `modules-v2/e-invoice/reports/_index.md`).

### ADR-0006 — the go/no-go test came back NO
- [ ] F-0276 (2026-09-06) The concepts layer was given its own testable promise ("procedures get cheaper to write") and failed it. Verdict from the unit that wrote the procedure: **"they made no measurable difference, and one of the three cost me words."** `validation-and-clearance` saved about four lines. `consolidated-e-invoice` was never relevant. **`pools-and-queues` was a net cost** — it was linked only in order to be contradicted: its central claim is *"a queue holds a document that is complete and on its way — it will be sent, you only have to wait"*, and the Purchase Doc Matching Queue is a queue that never moves and was never on its way anywhere, so a bullet had to be spent warning the reader not to carry the definition across. What actually made the guide cheap was the `kb/topics/` note, source triangulation, and **the applet reference page's verified screen inventory** — the reusable substrate is the reference page, not the concept page, which is the opposite of what ADR-0006 predicts. Underneath is a structural failure mode that will recur: **a concept page generalises from the guides that existed when it was written**, so every module that later grows a guide the concepts did not anticipate has to fight them. **Recommendation to Vincent: revisit ADR-0006 — specifically whether concept pages should be written *after* a module's procedures are complete, rather than before.** Not an argument for deleting the three pages; they are good and a cold reader benefits.

## From Lane 4 run 32 — MY-SST, Statement of Account (2026-09-06)

### ⚠️ CONFIDENTIALITY — a named prospect's tender evaluation is published on the public wiki
- [x] F-0277 (2026-09-06) `content/en/user-guide/demo/education/` is **eleven published pages addressed by name to one prospect's evaluation panel**. Its `_index.md` is titled *"UTM Integrated Financial System Evaluation Guide"* and opens *"Thank you for taking the time to evaluate the BigLedger Integrated Financial System for Universiti Teknologi Malaysia (UTM)."* Twelve files name UTM in total (the twelfth is `modules/budgetary.md`). Anyone — including a competitor bidding the same tender — can read exactly what we are pitching, which modules we claim, and the evaluation script we wrote for their panel. Two applet-tree pages carry that tender's module names as if they were shipping applets: `finance/revenue-management-applet.md` (no registry row, no repo; "Bill of Claims", "Inter-PTJ Claims Journal", "Staff Loan Subsidiary Ledger" is Malaysian public-sector vocabulary) and `finance/investment-guide.md`. **Needs Vincent now**: unpublish, genericise, or leave. I have not touched them — unpublishing is a business decision, not a documentation one.

### product (MY-SST) — the "doesn't tally" tickets have one cause
- [ ] F-0278 (2026-09-06) The SST-02 return **hard-codes tax-code string literals**: `SRS6/SVU-6/IMS6` for the original, `SRS8/…` for Version 2, both for Version 3 — the three tabs are the 6% → 8% service-tax change, which no document anywhere says. Item 10 filters on tariff code while item 11c filters on those literals over the same table, which is the structural cause of the "item 10 and 11c do not tally" tickets **three unrelated tenants** have filed. There is no setting to correct it. Related: **reports read live data, returns read a snapshot** — SST Reports query live documents, the SST-02 queries `bl_fi_tax_txn` frozen at filing time, so they diverge permanently the moment a filed document is edited. That is the standing "SST report and SST-02 don't tally" complaint, and the same shape is worth checking on every report page in the wiki.
- [ ] F-0279 (2026-09-06) SST filing defects worth tickets: the filing-cycle **lock endpoint checks no permission**; **delete** requires only a READ permission; locking **blanks its own SST-02 Part A**; the lock endpoint's carry-forward branch posts a journal with hard-coded RM 1,500 / RM 1,000 (unreachable from the UI, live on the endpoint); **unfile deletes a `bl_fi_tax_txn` row** and marks the document unfiled, which is the duplicate-filing mechanism behind two customer tickets; `FILE ALL` ignores the already-filed guard; SST-02 **item 13 is never assigned** and item 14 = item 12, so credit notes never reduce tax payable; and the Sales item 12 sums taxable amounts where tax belongs.
- [ ] F-0280 (2026-09-06) **Scheduled Statement of Account runs produce nothing.** The event→run converter writes `customer_categories` / `sales_agents`; the line processor reads `categories` / `agents`. The run therefore has no lines, and the failure path is unreachable so it never reports FAILED. Matches live Critical ticket `blg-intranet#4254`. Four Statement of Account action endpoints also have no permission check, one of which sweeps the whole tenant.

### method — a fourth way a settings screen can be inert
- [ ] F-0281 (2026-09-06) `@Input()` / `@Output()` on a **directly-routed** component are dead: `appletContainer` is undefined and SAVE emits into the void. Two applets in this lane (Fixed Asset, MY-SST) have settings screens broken for exactly this reason. Check the routing table before believing a settings screen saves anything. Statement of Account is the counter-example — genuinely wired, 19 keys, 13 consumed. Also: the `mySST` registry `name` is upper-cased, so ADR-0002's "title = registry name exactly" produces a shouting page title; **normalising `bl_applet_hdr.name` is the real fix**, not a wiki exception.
- [ ] F-0282 (2026-09-06) `finance/investment-applet.md` and `finance/investment-guide.md`: no registry row matching `invest` anywhere in 236 rows. The repo exists and is maintained, but its four menus are Deposit Requisition/Register/Category plus a fixed-asset Depreciation Schedule — **a fork of the Deposit and Fixed Asset applets, not a securities register**, which is what `finance/deposit-applet.md` and the financial-accounting module page currently claim. Fourth instance of the built-but-unregistered pattern; folds into ADR-0007 (F-0272). 26 SST screenshots quarantined this run (total 232).

**F-0277 resolved (2026-09-06):** Vincent chose "unpublish now, decide later". Shipped 8e122d4c — eleven `demo/education/` pages plus `revenue-management-applet.md` and `investment-guide.md` archived to `planning/archive/2026-09-06-utm-tender-pages/`, old URLs aliased to `/user-guide/demo/`, inbound cards removed from the en/ms/zh demo indexes. Two new lint checks added so it cannot recur: named prospect organisations, and blockchain-era vocabulary. What to do with the material long-term is still open.

## From the developers-section audit (2026-09-06)

### /developers/api-reference/ — the API reference documents an API that does not exist
- [ ] F-0283 (2026-09-06) Ground truth is **17,256 resolved Spring mappings, 11,180 unique paths, every one under `/core2/`** (`/core2/{tnt|platform}/{dm|ms}/<module>/<resource>/{backoffice-ep|login-ep|…}`, prefixes in `Core2Config.java:19-90`). The docs use `/api/v1/…`; the backend has **zero** `/api/v1` mappings. Every hostname we tell a developer to call is **NXDOMAIN** — `api.bigledger.com`, `sandbox-api.bigledger.com`, `auth.bigledger.com`, `developers.bigledger.com`, `app.bigledger.com`, `status.`, `community.`. The real host is `api.akaun.com` (resolves; independently confirmed by `refs/akn-kotlin-sdk`). **24 of 240 documented endpoints are real — 10%.** The eight main pages are at **0%**: `_index`, `sales`, `inventory`, `accounting`, `reports`, `batch`, `integrations`, `einvoice`. `errors.md` documents 25 error codes against 479 real ones, none matching. `purchasing.md` is 26% (10 of 38) — a correct appendix under 28 fabricated endpoints, which is the worst shape of all because a reader cannot tell them apart. `integrations.md` is the giveaway: WooCommerce, Amazon, Stripe, QuickBooks and Xero (**none exist**), while Lazada (44 mappings), Shopee (47), TikTok and Magento — the connectors we actually ship — are absent.
- [ ] F-0284 (2026-09-06) Two parts are worth protecting and promoting: **`einvoice-api-reference/` is 95% correct** (19 of 20) and **`platform-library/` is real**. And one cheap, high-yield fix: the 35 `ucc/` pages document **330 endpoints that are wrong only in their path prefix** — `/core2/alg/cc/` should be `/core2/tnt/dm/alg/cc/`. Correcting the prefix turns **257 endpoints from fabricated to verified** in a single mechanical pass.
- [ ] F-0285 (2026-09-06) Narrative pages: `getting-started.md` invented end to end (signup, login, key format, base URL). `authentication.md` — the bearer-token *shape* is right (`AuthenticationInterceptor.java:106,116`; two validators at `WebMvcConfig.java:220`) and every detail around it is wrong (`X-Company-Id`, `blg_live_sk_`, the whole OAuth flow). `sdks.md` lists six SDKs whose packages **all 404**, and omits the four real ones (`akn-kotlin-sdk` and friends). `tutorials.md` is 1,255 lines of unrunnable samples importing `@bigledger/sdk` (404). `applet-development.md` names four `@bigledger/*` npm packages, all 404 — real applets use `blg-akaun-ts-lib`, which is published. `architecture/overview.md` describes microservices with Redis, Elasticsearch and Kafka; the reality is one Spring Boot deployable with JDBI/PostgreSQL and a PostgreSQL-table queue (greps: Elasticsearch 0, Redis 0, Kafka 0).

### positioning — the two answers
- [ ] F-0286 (2026-09-06) **Webhooks are real and nothing like the documentation.** Three controllers (`webhook-subscription`, `webhook-topic`, `webhook-activity`), delivery by `WebhookService` (4-thread pool, HTTP POST, logged to `bl_webhook_activity_event`), a **fixed enum of 53 topics** (`WebhookTopics.java`) rather than free-form names, and auth by **one static header pair** stored on the subscription row. There is **no HMAC signature and no retry** — our page promises a signature to verify and retries to rely on, and a developer who builds against either will be wrong. Also: there is **no `webhook-applet` row in `bl_applet_hdr`** (0 rows), though the wiki has a page for it.
- [ ] F-0287 (2026-09-06) **There is no MCP server.** Zero references in the backend. Across all of `refs/`, the only substantive hit is `blg-poc-mbf-group/specs/02-architecture.md:188`, headed *"Why NOT an MCP Server?"* — a decision **against** building one. Meanwhile `hugo.yaml` claims MCP in all four languages and `content/en/_index.md` repeats it, while `/developers/` never mentions MCP once in 21,265 lines. **Needs Vincent**: is MCP shipped, planned, or aspirational? CLAUDE.md makes this line the canonical product description, so it cannot stay ambiguous. `kb/questions/2026-09-06-mcp-server-existence.md`.

### developers — Vincent's two rulings (2026-09-06)
- [x] F-0288 (2026-09-06) Vincent: *"v1 is 'core1' endpoints, no longer supported, now we are mainly using core2, and **we do not want core1 to be known to the public**."* So the fabricated `/api/v1/…` paths were not only wrong, they exposed a deprecated surface we want private. Acted (a59fa3e8): 16 developer pages `draft: true`; `modules/pos.md`'s fabricated POS REST block replaced; `api-reference/_index.md` rewritten as an honest index carrying the real `/core2/` shape and the access-endpoint suffixes; **`tests/content-lint.sh` now fails on `/api/v1/` or `core1` in any published page** (drafts excluded, so the material survives for the rewrite). Note for the rewrite: never document a core1 route, even to say it is deprecated.
- [ ] F-0289 (2026-09-06) Vincent sets the standard for `developers/`: *"if you look at android, anyone can just read the documentation and able to develop android apps. We hope our wiki will be able guide all developers developing new applets, to be able to do so, by reading the wiki."* That makes **applet development the primary job of the section**, not the API reference. The current `applet-development.md` is one of the pages just unpublished — it names four `@bigledger/*` npm packages that all 404, while real applets are built on `blg-akaun-ts-lib` (published). The rebuild needs to be a path, not a page: scaffold → shared library → routing and settings → permissions → registry → publish. Everything needed to write it is in `/home/marketing/repos/refs/` (60+ real applet repos, the shared utilities, the platform library) and is unusually well evidenced, because 32 lane runs have already read those repos closely.
- [ ] F-0290 (2026-09-06) A dev-tunnel URL is published: `applets/crm/unified-contact-center-ucc-applet.md:124` carries `https://3db9-121-121-122-11.ap.ngrok.io/v1/integration/channels/whatsapp/receive` — an ngrok host with an IP address in it. Replace with a placeholder.
- [ ] F-0291 (2026-09-06) Vincent narrows F-0289: *"Applet development is not the only primary job of the developers, there's external developers, and internal developers. For external developers, they might want to do integrations with our data-hub"* and *"for internal developers, the documentation will be mainly blg-intranet, of course, it will cover both front and back ends."* So the boundary is: **`content/en/developers/` on the public wiki is external-facing**, with two entry paths — build an applet, and integrate an external system with the **data-hub**. Internal platform documentation (Java backend, front-end architecture) belongs in **blg-intranet**, not here. Consequences: (a) the applet path must work for someone with no internal access — no internal hostnames, no private repos, no internal-only tooling as a required step, and every BigLedger-issued prerequisite named as an explicit hand-off; (b) platform internals must not be published here even though we read them to establish truth; (c) `developers/_index.md` needs two labelled paths, not one. The running unit has both corrections.
- [ ] F-0292 (2026-09-06) First evidence for the data-hub path, gathered while scoping F-0291 and not yet written up: the integration surface appears to be the **`etl-ep` access endpoint** — **952 resolved mappings** in `akaun-api`. Three ACTIVE registry rows sit in this space: `ETL_VIRTUAL_APPLET` "ETL Virtual Applet", `virtual_etl_applet` "Virtual ETL Applet", `dataFixApplet` "Data Fix". Relevant repos: `blg-etl-agents`, `blg-custom-integration-platform-java`, `blg-custom-processing-etl-agent`, `blg-applet-wavelet-virtual-etl-applet` (several other ETL agents are customer-specific — pseudonyms only). **Open questions for that unit**: what "data-hub" is called in the product and whether it is the same thing as the ETL surface; how an external system authenticates to it; whether it is push, pull or both; and whether any of it is self-service or all of it is onboarding-mediated. Note the wiki currently mentions "data hub" on nine pages with no page owning the term.
- [ ] F-0293 (2026-09-06) Vincent completes the split: *"internal-developers will use both blg-intranet repository as well as the blg-wiki, external developers only make use of blg-wiki."* **The wiki is the sole source for an external developer**, so completeness is a hard requirement for the two external paths (build an applet; integrate with the data-hub) — "it's covered in the intranet" is never an acceptable answer for anything an outside developer needs. The rule that platform internals stay in the intranet is unchanged; the line between the two is **need, not interest**: required to complete the task → wiki; explains how the platform is built → intranet. Every gap the developer units find should be classified **(a) missing but publishable** — our backlog — or **(b) genuinely BigLedger-only**, e.g. a credential or a registry row we must create. Category (b) is the real answer to "can an outsider build an applet from the wiki alone".

## From the applet-development-path unit (2026-09-06)

### ⚠️ /developers/architecture/ — fabricated stack AND unverified compliance claims
- [x] F-0294 (2026-09-06) `content/en/developers/architecture/_index.md` was **live** and stated the backend is Node.js + Express with Redis, Elasticsearch, Kubernetes, GraphQL and WebSocket — against a Java/Spring Boot backend with JDBI/PostgreSQL and a PostgreSQL-table queue (audit greps: 0 hits for each of those technologies). The audit unpublished its sibling `overview.md` and missed this one. Worse than the stack: it publicly claimed **SOC 2 Type II**, **ISO 27001** and **GDPR compliance** (L162–164), none of which anyone has verified we hold — that is a commercial and legal exposure, not a documentation error, and it is the same class of problem as the UTM pages. Unpublished in 47e68247 under the decision Vincent already made for its siblings. **Vincent: do we hold any of those three certifications?** If we do, the claim needs a sourced page; if we do not, it must never come back, and it is worth checking whether the same claim appears in sales material.

### /developers/applets/ — the path exists now, and the honest answer is uncomfortable
- [x] F-0295 (2026-09-06) Shipped 47e68247: `applets/_index.md`, `applets/getting-started.md` (empty directory → running bundle, 8 steps, every command taken from a real repo config) and `applets/applet-development.md`. Written from `blg-applet-akaun-platform-example-applet` read end to end, confirmed against the wavelet chart-of-account, url-shortener and forex applets, the `akaun-shell` loader and `blg-akaun-ts-lib`. The contract is verified **from both sides**: the source constant `appletMainRouter` and the `app.module.ts` element name match the live `bl_applet_hdr` row (`routerLink`, `applet_mf_html_tag`) exactly — that check proves the model rather than describing it. `developers/_index.md` now offers two labelled paths per F-0291.
- [ ] F-0296 (2026-09-06) **Can an outside developer build an applet from the wiki alone? They can build and host a working bundle. They cannot get it running.** Category (b) gaps — the ones only BigLedger can close, per F-0293: (1) **registration is not self-service** — no public API, no console, and two required fields (Applet Store, Applet Vendor) are records only BigLedger holds; (2) **no self-service tenant**; (3) **the shared applet chrome is unpublished** — layout, settings screens, permission screens, grids and pickers all live in `blg-shared-utilities`, a private GitHub repo that 404s unauthenticated and is not on npm, yet every BigLedger applet consumes it as a submodule; (4) **no public reference applet** (`bl_applet_hdr` has zero rows matching `%example%`); (5) **no local shell**, so end-to-end verification needs a hosted bundle in a real tenant; (6) **one bundle URL per registration** — no version, no channel, no rollback except re-upload. **The Android analogy does not hold yet, and the reason is product, not documentation.** The unit's recommendation, which I agree with: **publishing `blg-shared-utilities` to npm and giving registration a self-service path** are the two changes that move applet development from "possible with our help on every attempt" to "possible by reading". That is Vincent's call and it is the highest-leverage item on this list.
- [ ] F-0297 (2026-09-06) Category (a) — publishable, our backlog, in rough value order: the **`etl-ep` data-hub integration path** (F-0292); **webhooks** (mechanism fully readable from source); **authentication**; the **UCC prefix fix** (257 endpoints wrong → verified by correcting one string); the **four real SDKs**; a genuine REST reference for the eight unpublished modules; the response-code index. Two things could not be sourced and need confirming before they are relied on: **the required Node version** (no `engines` field and no `.nvmrc` in any repo read) and **whether `developers@bigledger.com` is monitored** — the new pages use it as the hand-off contact throughout. Also worth guarding: `blg-bigledger-cli` is an internal GitHub/JIRA/HR ops tool, **not** an applet CLI, and must not be cited as one.

## From the data-hub integration unit (2026-09-06)

Closes Q-0014 and the F-0292 questions. Evidence and citations throughout:
`planning/drafts/2026-09-06-datahub-integration-path.md`. Spec:
`planning/specs/developers-integration-path.md`.

### /developers/ — the external-integration path exists now
- [x] F-0298 (2026-09-06) **Shipped: the second of Vincent's two developer paths (F-0291, F-0293).**
  New: `developers/integration/_index.md`, `integration/getting-started.md` (nothing → moving real
  data, seven steps, one worked example), `integration/data-api.md` (path grammar, resources,
  paging, envelopes, limits, error codes). Rewritten from source and **un-drafted**:
  `developers/authentication.md` and `developers/webhooks.md` — the two URLs ADR-0008 reserved on
  6 September. `developers/_index.md`'s placeholder card and its "what is not written yet"
  paragraph are gone.
  Every path and slug published was checked against a route table resolved from the controllers
  (1,049 unique verb+path pairs, 287 resources, generated by script, not by grep), and the auth
  behaviour was confirmed against the live API. Corrections made during writing rather than
  published wrong: entities have **no** delete on the typed path; contacts expose only
  `…/contacts/etl-ep/multi`; `updated_date_from` exists on roughly 310 of 684 criteria classes, not
  all of them; the default sort is `guid`, not "unordered".
  **Deliberately not published**, and filed as P-0031, P-0032 and P-0038 instead: the bare
  25-character bearer path (an 82-second full-table Argon2 scan per bad request, and it skips the
  expiry check), and the unparameterised `orderBy`. The line CLAUDE.md draws is *need, not
  interest*; an attack recipe fails that test even though an integrator might find it interesting.
- [ ] F-0299 (2026-09-06) **The webhook page is honest now, and the honesty is the finding.**
  `/developers/webhooks/` leads with four absences — no signature, no retry, no alerting, no
  readable delivery log — because a reader who plans around them is better served than one told
  nothing. Two of the four are one-line fixes (P-0034, P-0036) and would materially change what
  that page has to say. Also worth Vincent's eye: the Web Hook applet has **no registry row** at
  all (P-0040, the fifth instance of P-0029's pattern), and the screen it would open stores its
  title in the `auth_header_name` column and never sets the value — so subscriptions created in
  the product send **no** authentication header (P-0035). The page currently tells integrators to
  use the API and avoid that screen, which is correct today and embarrassing to have to write.
- [x] F-0300 (2026-09-06) **Unpublished under ADR-0008: a second fabricated API, under `modules/`
  rather than `developers/`, which is why the September audit missed it.**
  `modules/membership/integration/third-party-integration.md` (716 lines) documents
  `GET /members/{id}`, `POST /members`, `POST /webhooks`, seven `member.created`-style event names
  and an `x-webhook-signature` HMAC-SHA256 verification handler. None of it exists — and the
  signature section is worse than absent, because a receiver written from it rejects every genuine
  delivery. `draft: true`; worklog
  `planning/worklog/2026-09-06-membership-third-party-integration.md`.
  Its `_index.md` claimed a **"Data Hub Membership API"** with OAuth 2.0, API keys, RBAC,
  automatic token refresh and event streams, had **no front matter at all** (every key commented
  out with `[//]: # (…)`, so Hugo saw no title), and linked to an `api-documentation` page that has
  never existed. Rewritten in place rather than drafted, so the section keeps an `_index.md` and
  navigation survives; the original body is preserved verbatim in
  `planning/worklog/2026-09-06-membership-integration-index.md`.
  One sentence corrected in `pos-integration.md`: *"API keys used by POS terminals have restricted
  permissions"* — false, keys have no per-key scope. Its two surviving siblings describe in-product
  flows and were kept (ADR-0008 tier 3).
- [ ] F-0301 (2026-09-06) **"Data hub" is used on nine pages and owned by none.** Eight are
  tier-3 overview prose ("integrates with our central data hub") and were left alone; the ninth was
  the membership API page above. The term has no referent in the product — engineering copy inside
  the platform says *"Operational Datalake"* for the same idea. **Q-0022** asks Vincent whether
  there is an intended public name. Until he answers, the new pages name the surface by what it is,
  and these eight pages are an audit backlog item, not a rewrite.
- [ ] F-0302 (2026-09-06) **Two `developers/` pages still drafted from the September audit now
  have correct replacements to point at**, and should be reviewed in the next pass rather than
  rewritten from scratch: `getting-started.md` and `sdks.md`. `getting-started.md` is a duplicate
  of the job `/developers/integration/getting-started/` now does properly — it may simply want an
  alias. `sdks.md` needs the honest answer this unit established: `blg-akaun-ts-lib` and
  `blg-akaun-ng-lib` are Angular libraries for applets and contain **zero** references to the
  server-to-server surface, and the Java `client-sdk` publishes to GitHub Packages under a repo
  `gh repo view` reports as PRIVATE — so there is no usable published client for integrators, which
  is what the new pages say.
- [ ] F-0303 (2026-09-06) **`applets/applet-catalog.md` links to two URLs that do not resolve.**
  L114 and L419 point at `/applets/webhook-applet/` and the zh twin does the same at L100 and L374.
  `content/en/applets/integrations/webhook-applet.md` never carried that alias, so the links were
  already broken; the page has now been unpublished under ADR-0008 anyway
  (`planning/worklog/webhook-applet-2026-09-06-unpublish.md`), so both entries should be removed
  rather than repointed. Outside lane 4's editable folders; found in run 33.
- [ ] F-0304 (2026-09-06) **`applets/rma/warranty-admin-applet.md` — a member can self-approve their
  own warranty.** Recorded in the wiki as the last Troubleshooting row and filed as **P-0045**; no
  further wiki change needed unless the endpoint changes.
- [ ] F-0305 (2026-09-06) **`applets/rma/warranty-admin-applet.md` — the old page promised automated
  certificate e-mails and automatic expiry calculation; neither exists.** Corrected in the rewrite
  (run 33) and filed as **P-0046** / **P-0050**. Kept here because the same two promises appear in
  sales-facing material and in the AI infographic that was dropped from the page — worth checking
  `blg-www` before the next release.
- [ ] F-0306 (2026-09-06) **`applets/integrations/t2t-admin-applet.md` — three T2T defects the
  rewritten page now describes**, filed as **P-0047**, **P-0048** and **P-0049**. If any is fixed,
  the Troubleshooting table changes with it.
- [ ] F-0307 (2026-09-06) **`applets/integrations/t2t-admin-applet.md` documents an ACTIVE applet
  whose front end has no repository.** The page says so in a callout, which is honest but unusual;
  if Vincent answers **Q-0025** with a location, the Screens/Configuration sections should be
  written properly. The `content/zh/applets/t2t-admin-applet.md` twin is still a translation of the
  fabricated page (SOC 2, 1,000 tenants, six non-existent applets) and is now the only place those
  claims survive — it needs the same treatment.
- [ ] F-0308 (2026-09-06) **Two more built-but-unregistered applets** — Transaction Reconciliation
  (`finance/txn-recon-applet.md`, 557 lines, matches its repo) and Webhook. With Group Maintenance,
  E-Mandate, Team Maintenance and Investment that is six applets and nine-plus pages waiting on
  ADR-0007. Re-asked as **Q-0026**.
- [ ] F-0309 (2026-09-06) **`applets/crm/unified-contact-center-ucc-applet.md` publishes real
  customer telephone numbers.** `/images/ucc-applet/23d97877-0a52-4990-8b54-90fec9fcb59a.jpeg` is a
  Contacts listing of roughly twenty real Malaysian mobile numbers across WhatsApp, SMS and Voice.
  The page carries **71 screenshots of a live contact centre** and a full audit is in progress; the
  result lands under "Screenshots with personal data" in `planning/lanes/lane-4/findings.md` run 33.
  This is the largest single privacy exposure found by the applet programme so far.
- [ ] F-0310 (2026-09-06) **`applets/rma/internal-rma-applet.md` implies an automated warranty
  check.** Its Where-it-fits row reads "Warranty and expiry dates on the service note"; nothing in
  RMA or the service-note backend reads `bl_wrty_warranty_certificate_hdr`. The row should say the
  check is manual. One-line fix, next time that page is opened.

## Site-wide fabricated-API sweep (2026-09-06) — findings and repairs

*Found by the fabricated-API sweep unit, not reported by Vincent. Full audit:
`planning/reviews/2026-09-06-fabricated-api-sweep.md`. Items marked (done) were acted on in the
same pass under ADR-0008; the rest are open.*

- [x] F-0321 (2026-09-06) **`/modules/membership/core-concepts/customer-membership-relationship/`
  and its byte-identical `modules-v2/` twin document a database schema and four REST endpoints that
  do not exist.** `GET /api/customers/{id}/memberships`, `POST /api/memberships/{id}/earn-points`,
  `POST /api/memberships/{id}/redeem-points`, `POST /api/transactions` (page L439-446) match none of
  the backend's 12,050 unique paths; the CUSTOMER / MEMBERSHIP / POINTS_BALANCE schema at L404-437
  matches neither `bl_crm_membership_hdr` nor `bl_crm_membership_points_current_balance`.
  → both `draft: true`; worklog
  `planning/worklog/2026-09-06-fabricated-api-sweep-customer-membership-relationship.md`;
  the one inbound link in `modules/membership/core-concepts/_index.md:235` removed. (done)
- [x] F-0322 (2026-09-06) **All ten `modules-v2/*/api-reference/_index.md` stubs pointed at
  `/developers/api-reference/{sales,inventory,purchasing,integrations,einvoice}/`, every one of
  which was unpublished on 6 September and now 404s.** Two of them also asserted endpoint families
  that do not exist anywhere in the backend — "shop floor IoT machine logging endpoints"
  (manufacturing) and "biometric attendance terminal integration endpoints" (hr-payroll); the route
  table has zero `iot` and zero `biometric` paths.
  → all ten repointed at `/developers/integration/` (e-invoice at the verified
  `/developers/api-reference/einvoice-api-reference/`; membership at its own six verified pages) and
  the invented endpoint-family phrases removed. (done)
- [x] F-0323 (2026-09-06) **Eight more inbound links to pages the developers audit unpublished were
  left pointing at 404s** — `modules/sales-crm/_index.md:357`, `modules/inventory/_index.md:300`,
  `modules/purchasing/_index.md:350`, `modules/financial-accounting/_index.md:271`,
  `e-invoice-peppol.md:296`, `modules/e-invoice/_index.md:305`, `tutorials/_index.md:14`,
  `developer-docs/_index.md:13,14`. Guard rail 3 of ADR-0008 ("inbound links are repaired in the
  same commit") was not met by that unit. → all repaired. (done)
- [x] F-0324 (2026-09-06) **An unpublish did not carry to the translation.**
  `content/zh/applets/webhook-applet.md` (334 lines) stayed live carrying the same invented claims
  as the English page drafted the same day — 自动重试, OAuth/JWT, 请求签名, IP 白名单,
  200+ 事件类型, 99.9% 传递保证, 90 天保留. It sits at `zh/applets/` while the English sits at
  `en/applets/integrations/`, so a same-path twin check misses it. → drafted, three inbound `zh/`
  links repaired, worklog addendum written. **The general rule is the finding: every unpublish must
  check `zh/`, `ms/` and `ar/` by basename, not by path.** (done)
- [ ] F-0325 (2026-09-06) **The six membership API pages published real captured tenant data.**
  A live RS256-signed platform JWT with `sysAdminRank: ADMIN` was in two of them from 2025-11-26
  (valid until 2025-12-14, so ~18 days live and signed); **scrubbed now**, but it is still in git
  history. Also still on the pages: real-looking GUIDs (`subjectGuid`, `sysAdminGuid`,
  `membership_hdr_guid`, `revision`), `tenantCode: testing`, and four `card_no` values —
  `930425035604`, `930425035605`, `930425035569`, `8888880100655908` — of which the first three are
  in Malaysian NRIC format (930425 = 25 Apr 1993; 03 = a birth-state code). Needs a proper
  anonymisation pass across all twelve files. Raised as **P-0062** and **Q-0037**.
- [ ] F-0326 (2026-09-06) **The twelve membership API pages have no front matter at all** — no
  `title`, `description` or `weight`. They are allowlisted out of the title lint
  (`tests/lint-allowlist.tsv`, twelve of its fifty-six entries) and carry an H1 instead, so Hugo
  titles them from the filename and orders them arbitrarily. Worth fixing when the anonymisation
  pass opens them.
- [ ] F-0327 (2026-09-06) **Six `*.bigledger.com` hostnames on 56 published pages do not resolve** —
  `forum`, `academy`, `demo-v1`, `support`, `community`, `status`. Checked by public DNS 2026-09-06;
  all NXDOMAIN. `www.bigledger.com`, `wiki.bigledger.com` and `api.akaun.com` do resolve. Too many
  pages to lint or fix in this unit; raised as **Q-0039** because the answer decides whether these
  are links to repair or links to delete.
- [ ] F-0328 (2026-09-06) **`modules/membership/api-reference/` and
  `modules-v2/membership/api-reference/` hold six byte-identical files each** (`cmp` clean on all
  six), differing only in their `_index.md`. Both are built and both are reachable. The wider
  `modules/` ↔ `modules-v2/` duplication needs a spec; this pair is the concrete, measured case.
  Raised as **Q-0038**.
- [x] F-0340 (2026-09-06) **The Unified Contact Center page was a screenshot walkthrough with five
  claims the source contradicts.** Rewritten to the applet-page standard from
  `alg-applets-ucc@adc3915e1` and `blg-akaun-platform-java@1ff620ef0e`. Taken down under ADR-0008
  (tier 1, evidence and verbatim text in `planning/worklog/2026-09-06-lane4-ucc-applet-rewrite.md`):
  the "WhatsApp Business Set-Up" section, which published a developer's ngrok tunnel URL and a real
  Meta business/WABA id (already P-0010) instead of the real path, Configurations → Virtual Contacts
  → Endpoints; a YouTube integration that exists nowhere in the applet; a Task Router description
  that had Router Queue and Tasks exactly backwards (Router Queue lists `bl_alg_cc_queue_hdr`, the
  queues themselves; Tasks lists every task at any status); an "automatic contact merging algorithm"
  that is in fact a four-tab manual link panel; and a "Ready to Transform Your Customer Service?"
  sales call-to-action. Also corrected: contacts are rows in the shared CRM table
  `bl_crm_contact_hdr`, not a UCC-private database, and conversations, messages, sessions, e-mails
  and social posts live in a **per-tenant MongoDB**, not in PostgreSQL — an earlier note in this
  programme guessed Firestore from a folder name, which is wrong (`AngularFireMessaging` is used for
  push notifications only). Nine product defects raised: **P-0075**–**P-0082**. One question for
  Vincent: **Q-0050**. (done)
- [ ] F-0341 (2026-09-06) **60 of the UCC page's 71 screenshots are gone and most of the applet now
  has no picture.** Run 33 quarantined them for showing live customer data; the eleven that survive
  cover only the summary tiles, Social Media, the Dashboard, two reports and Broadcast. A recapture
  session on a synthetic tenant seeded with GadgetSphere-shaped data is needed for: the Inbox
  conversation view, the customer panel and its twelve tabs, All/Team/My Task Queue and their bulk
  actions, the outbound queues, the task edit screen, Contacts, My Profile with its QR code, the
  Live Dashboard grids and the Task Router screens. Until then the page carries no image for its
  most-used screens.
- [ ] F-0342 (2026-09-06) **`content/en/applications/unified-contact-center.md` was not touched and
  probably repeats the claims just removed from the applet page** (it is outside the applet lane's
  folders). It should be read against the rewritten reference page — in particular the contact-merging
  and Task Router descriptions, and any YouTube or roadmap wording.
- [x] F-0352 (2026-09-06) **`/applets/sales-workflow/external-sales-invoice-applet/` — 3,555 lines
  and 302 numbered steps about an applet that does not exist in the registry, describing a feature
  set the code does not have.** Number one on `planning/audit-backlog.md`. Unpublished under ADR-0008
  tier 1 (`draft: true` in place; evidence in
  `planning/worklog/2026-09-06-external-sales-invoice-applet.md`). Two independent grounds. First,
  ADR-0002/ADR-0007: `bl_applet_hdr` has no row for it under any name, code, guid or bundle URL, so
  no tenant can install or open it. Second, and worse, the page attributed to it the whole feature
  set of Sales Invoice (Internal) — multi-source creation from sales orders, quotations, delivery
  orders and jobsheets; line items, pricing tiers, discounts and rounding; SST/VAT/GST/WHT; serial
  numbers; a draft-to-final review workflow; GL posting and inventory reduction; a `Settings >
  Permission Management` and a `Settings > Webhook` menu path. The real applet
  (`blg-applet-wavelet-external-sales-invoice-applet@222d5699`) is a half-converted Stock Conversion
  clone whose only live behaviour is a read-only listing over `bl_fi_xtn_generic_doc_hdr`: SAVE,
  edit and FINAL dispatch actions whose effects are commented out, the Lines tab is commented out,
  and the create form still asks for "Conversion Code" and "Conversion Name". No inbound links and
  no zh/ms/ar twins, so nothing needed repointing. Product defects **P-0092**–**P-0095**; question
  for Vincent **Q-0060**; what the family really is now sits in
  `kb/topics/external-generic-documents.md`. (done)
- [ ] F-0353 (2026-09-06) **46 AI-generated infographics carrying a visible third-party "NotebookLM"
  watermark are published across 32 applet image folders.** Found while checking this page's three
  images; all 46 share the same two generated canvas sizes (2752×1536 and 1536×2752). Spot-checked
  and confirmed watermarked: `external-sales-invoice-applet/*` (3),
  `internal-purchase-order-applet/internal-purchase-order-overview-infographic.png`,
  `commission-scheme-applet/infograhic.png` (note the typo in that filename too). Two problems, and
  the second is the serious one: we are publishing another product's brand mark on our
  documentation, and the pictures assert product behaviour nobody verified — the three on this page
  illustrated knock-off from sales orders, quotations, delivery orders and jobsheets, a
  draft-to-final lock, GL posting and serial-number tracking, none of which exist in the applet they
  illustrate. **A wrong diagram is a wrong fact**, and unlike prose it survives a text rewrite. The
  46 need a pass: check each against its now-verified page, and decide the watermark question
  separately. List: `find static/images -name '*.png'` filtered to those two dimensions.
- [ ] F-0354 (2026-09-06) **"Internal" in an applet name does not mean inter-company, and at least
  one page said it did.** The External Sales Invoice page's FAQ answered *"What is the difference
  between External Sales Invoice and Internal Sales Invoice?"* with *"Internal Sales Invoice is for
  inter-company transactions (billing between branches or subsidiaries within the same corporate
  group)"*. `salesInvoiceApplet` / "Sales Invoice (Internal)" is the ordinary customer invoice
  applet; intercompany is a separate queue mechanism that runs on top of it
  (`IntercompanyProcessingService`, and see the verified
  `/applets/purchase-workflow/internal-purchase-order-applet/`). That page is now unpublished, so the
  sentence is off the site — but "internal" prefixes ~40 applet pages and the same misreading may
  have been written elsewhere. 20+ applet pages mention inter-company; the verified ones use it
  correctly, the unverified ones have not been checked.

### site-wide (translations)
- [ ] F-0365 (2026-09-06) **58 of 134 translated pages are publishing content the English no longer
  says.** The Web Hook Chinese twin was not one page, it was a class: 69 translated pages have no
  same-path English twin, and drift affects pages that pair perfectly by path as well. Full
  classification, tiers and evidence in
  `planning/reviews/2026-09-06-translation-orphan-sweep.md`. **Nothing was unpublished** — 58 is far
  past the ADR-0008 five-page guard rail, so the call is Vincent's. Breakdown: 24 zh applet pages
  and 10 ms applet pages whose English was rebuilt from source on 2026-09-05/06; 16 zh pages whose
  English page was deleted between 2026-02 and 2026-06; 3 pages (zh/ms/ar) carrying the invented
  approval matrix removed today; 3 zh pages with tier-1 invented claims; 2 zh e-invoice guides.
      → note: 16 faithful-but-path-orphaned zh pages were repaired in the same pass (translationKey);
        a lint was added so the webhook case cannot recur. Retranslation path is Q-0071.

### /zh/
- [ ] F-0366 (2026-09-06) **The Chinese home page is a marketing page, not a documentation hub.**
  It claims 1,000,000+ users (`content/zh/_index.md:3,17,145`), a **99.9% uptime SLA guarantee**
  (`:146`), 24/7 multilingual support (`:148`), and offers a "start free trial" button (`:20`) to
  `/zh/user-guide/introduction/`, which does not exist. Three cards point at `/zh/partners/*`
  (`:61-63`) — there is no `content/zh/partners`. The English home page was rebuilt 2026-09-05 as a
  reader-intent hub and makes none of these claims.
      → source: content/zh/_index.md
      → note: cannot be `draft: true` — it is the language root and `/zh/` would 404. Recommended
        action: replace the body with the honest placeholder `content/ms/_index.md` and
        `content/ar/_index.md` already use. The user and SLA numbers are Q-0072.

### /zh/developers/
- [ ] F-0367 (2026-09-06) **Promises a developer platform that was unpublished from the English the
  same day.** GraphQL endpoints (`content/zh/developers/_index.md:12`), JavaScript / Python / PHP
  SDKs (`:17-20`), sandbox access and test data (`:36-37`). The English `developers/sdks.md`,
  `getting-started.md`, `tutorials.md`, `applet-development.md` and nine `api-reference/*.md` pages
  are all `draft: true` since `a59fa3e8`; Q-0024 records there is no sandbox.
      → source: content/zh/developers/_index.md

### /zh/user-guide/industry-solutions/
- [ ] F-0368 (2026-09-06) **A fabricated named customer testimonial and ~31 invented outcome
  statistics.** `content/zh/user-guide/industry-solutions/_index.md:72` — *"BigLedger turned our
  workshop from chaos to order. We now serve 50% more customers with the same team." — Ahmad, owner*.
  Plus 40% shorter wait times, 25% higher parts turnover, 60% higher satisfaction (`:66-69`), and
  the same shape for F&B (`:117-120`) and manufacturing (`:171-173`). The English page was cut from
  448 to 101 lines and carries no testimonial and no `%` outcome claim.
      → note: CLAUDE.md forbids named customers; content-lint already checks for named prospects.

### /zh/modules/financial-accounting/ · /ms/… · /ar/…
- [ ] F-0369 (2026-09-06) **The invented approval matrix removed from the English today is still
  live in three languages.** `content/zh/modules/financial-accounting.md:274-283`,
  `content/ms/modules/financial-accounting.md:206-212`,
  `content/ar/modules/financial-accounting.md:172`. All three teach amount-based routing to
  different approvers on purchase orders, **journal entries and payments** — journals and payment
  vouchers have no approval step at all, and where approvals do apply a money figure does not change
  the approver. Corrected in the English by `f25a917f`.

### /applets/applet-store/
- [ ] F-0370 (2026-09-06) **33 referenced placeholder images do not exist on disk**, in the English
  page and faithfully copied into the Chinese one. Both
  `content/en/applets/applet-store.md` and `content/zh/applets/applet-store.md` reference 42
  `*_placeholder.svg` paths under `/images/applet-store/`, of which 33 have no file in `static/`.
      → note: found by an all-languages image-resolution scan; every other `/images/…` path in
        `zh`, `ms` and `ar` resolves.

### site-wide (translations)
- [ ] F-0371 (2026-09-06) **16 Chinese pages are translations of English pages that were deleted.**
  Three are full procedure pages — `content/zh/applets/supplier-maintenance-applet.md` (633 lines),
  `einvoice-generation-applet.md` (453), `employee-maintenance-applet.md` (324) — for screens whose
  English documentation was retired between 2026-02-27 and 2026-06-29. Two of them duplicate a
  Chinese page for the *replacement* applet that also exists, so the Chinese site publishes both the
  retired and the current page for the same screen. Deletion commits and successors are tabulated in
  `planning/reviews/2026-09-06-translation-orphan-sweep.md` (section B3).
- [ ] F-0372 (2026-09-06) Inbox hygiene: F-0001 is still open although
  `content/ms/applets/customer-consignment-applet.md` was archived to
  `planning/archive/content-ms-applets-customer-consignment-applet.md` in `d5858dbf`. `content/ms`
  now has zero blocklist hits and the `malay` allowlist is empty.
      → note: recorded, not ticked on F-0001's behalf — that is the batch owner's call.

### images — Vincent's decision on the generated infographics (2026-09-06)
- [ ] F-0380 (2026-09-06) **Decision: keep, redraw later.** 75 AI-generated infographics across 32 applet folders (58 referenced by published pages) carry a visible **NotebookLM watermark** and assert product behaviour nobody verified — e.g. the stock-availability one states "instantly calculates Net Available by subtracting reserved orders from physical stock" and "enforce FIFO". Vincent chose to keep them live and redraw rather than remove. **Two obligations follow.** (1) Redraw them as theme-safe inline SVG in the pattern already used for `layouts/shortcodes/einvoice-flow.html` and `platform-map.html` — `currentColor`, no raster, no third-party mark. (2) **Verify each one's claims against source as it is redrawn**, because a wrong diagram is a wrong fact that survives every text rewrite: the Fixed Asset page had a whole configuration section transcribed from a screenshot whose menu had been removed upstream months earlier. Until redrawn, treat any behaviour stated only in an infographic as unverified. Track progress here; the full list is reproducible with `identify` on the two generated canvas sizes (1024x1024, 1024x571).

- [ ] F-0381 (2026-09-06) **Diagram format decided (Vincent): vector, not raster.** Two routes, chosen by job:
  1. **Mermaid code fences** for flows, sequences, state machines and entity relationships. This Hextra build renders them **natively** — `themes/hextra/layouts/_markup/render-codeblock-mermaid.html` — so a ```mermaid fence in the markdown becomes a diagram with no library to load. The diagram *is* text in the page: anyone can edit it, it shows up in a diff, and it cannot silently drift from the prose the way an image does. This should be the default for most of the 75 generated infographics.
  2. **Inline SVG in a Hugo shortcode** for the few that need real art direction — we already ship `layouts/shortcodes/platform-map.html` and `einvoice-flow.html` this way, using `currentColor` so they work in both light and dark themes.
  **Not** raster for diagrams, and **not** canvas/WebGL 3D: it does not print, is not indexed by search or by AI crawlers (which the GEO work in ADR-0005 cares about), is not accessible, and cannot be reviewed in a diff.
  **The distinction that matters:** *diagrams* become vector; *screenshots* stay raster, because a screen capture cannot be vectorised. Screenshots get the other discipline instead — the privacy rules, and the staleness rule from F-0271 (a screenshot of a removed menu is a factual error).

### images — mermaid conversion pilot (2026-09-06)
- [ ] F-0391 (2026-09-06) **Five generated infographics converted; all five asserted something source
  contradicts.** Pilot for F-0380 / F-0381 — full claim-verification tables, per-diagram, in
  `planning/drafts/2026-09-06-mermaid-conversion-pilot.md`. Converted to mermaid fences (native
  Hextra render, no library, diff-reviewable, theme-safe):
  `/applets/inventory-workflow/stock-availability-applet/` (how Available Qty is really computed),
  `/applets/inventory-workflow/stock-adjustment-applet/` (DRAFT → FINAL lifecycle),
  `/applets/master-data/chart-of-account-applet/` (chart / company / ledger / fiscal-year structure),
  `/applets/purchase-workflow/internal-purchase-order-applet/` (the procurement chain, and that a PO
  posts nothing). The fifth, `/applets/inventory-workflow/driver-delivery-order-applet/`, was replaced
  with **nothing** — it was a "chaos vs solution" marketing split and the page already carries a real
  screenshot of the listing on the next line. The false claims that did **not** survive into the
  replacements: "Available = Physical − Reserved" (it is Stock Balance + a *signed* Adj Qty whose
  backend default includes a **+1** goods-received-note term, `StockAvailabilityService.java:29-42`);
  a stock-adjustment "Review & Approval Workflow" (there is no approval anything in that applet — the
  only match on the word is a copy-pasted spec importing a component that does not exist); three
  adjustment types (there are two, Adjust-In / Adjust-Out); "dead stock 90+ days" (buckets are
  0-30/31-60/61-120/rest or months 1-6/rest); "enforce FIFO" (FIFO is a *cost column*, the applet is
  read-only and creates nothing); Chart of Account "role-based access" (the applet registers **no**
  permission definitions at all); driver "custom delivery statuses" and "real-time syncing" (Custom
  Status is saved and read by nothing; there is no app). Page edits done; the six image files are
  listed for quarantine but **not deleted** — that is F-0393.
      → note: `tests/content-lint.sh` passes; all four fences validated with `mermaid.parse()` and
        rendered at `theme: default` and `theme: dark` — no truncation, legible in both.
      → note: `content/en/applets/inventory-workflow/inv-item-maintenance-applet.md:157-158` hard-codes
        `fill:#f9f` / `fill:#bbf` in an existing mermaid block, which is unreadable in dark mode. Not
        touched in this pass; worth a one-line fix when someone is next in that file.
- [ ] F-0392 (2026-09-06) **A generated infographic invented a product and published its logo.**
  `static/images/driver-delivery-applet/driver-delivery-order-overview-infographic.png` carries a
  designed brand lockup at the bottom centre reading **"DELIVERYCONNECT APPLET — Empowering Your
  Logistics"**. There is no such product, applet, module or brand in BigLedger; the applet is
  `driverDeliveryOrderApplet`, "Driver Delivery Order". It was live on the English, **Malay and
  Chinese** pages (all three references now removed). This is a class F-0353 did not anticipate: the
  generator did not only overstate features, it minted a product identity and drew a logo for it.
  **The other ~70 generated images have not been checked for invented brand marks, product names or
  logos** — that check is cheap (look at the bottom strip of each canvas) and should happen before
  any of them are redrawn.
- [ ] F-0393 (2026-09-06) **Six retired infographics are still on the CDN.** Removing a `figure`
  reference does not unpublish the file. Awaiting quarantine (listed, deliberately not deleted, per
  F-0380): `stock-availability-applet/stock-availability-infographic.jpg`,
  `stock-availability-applet/stock-availability-overview-infographic.png`,
  `stock-adjustment-applet/stock-adjustment-overview-infographic.png`,
  `chart-of-account-applet/chart-of-account-applet-overview-infographic.png`,
  `internal-purchase-order-applet/internal-purchase-order-overview-infographic.png`,
  `driver-delivery-applet/driver-delivery-order-overview-infographic.png` (all under `static/images/`).
      → note: `stock-availability-overview-infographic.png` — the one F-0380 quotes — was **already
        referenced by no page** and has been reachable by URL anyway. A sweep for the other orphaned
        generated images is worth doing at the same time: 75 exist, 58 were referenced.

### /applets/sales-workflow/internal-sales-grn-applet/
- [x] F-0403 (2026-09-06) Found by the sales-workflow lane sweep, not reported by Vincent: the page's
      whole premise was wrong. It promised "inventory precision", "real-time stock movements as goods
      are returned to warehouse locations", costing reconciliation "using MAUC, FIFO, or manual cost
      methods", and finance teams "reconciling returns against posted invoices with precision".
      `INTERNAL_SALES_GOODS_RECEIVED_NOTE` has quantity signum 0 and amount signum 0
      (`InternalSalesGoodsReceivedNoteDataConsistencyObject.java:17-18`, `ServerDocTypes.java:30`,
      and the applet's own `applet-constants.ts`) and has no entry in `JournalPostingTypeHandler`.
      It moves no stock and posts no journal. The page also claimed screens the applet does not have
      ("Return Tracking") and a VOID that does not exist anywhere in the repo.
      → source: content/en/applets/sales-workflow/internal-sales-grn-applet.md
      → done: rebuilt from source this pass (1,090 → 286 lines), with a per-section `sources:` map,
        the fixed posting-proof block, the 21 seeded client-side permissions, and the real DRAFT→FINAL
        lifecycle. Product defects split out as P-0105, P-0106, P-0107.

### /applets/sales-workflow/internal-sales-gin-applet/
- [x] F-0404 (2026-09-06) Same class as F-0403. The page said a GIN "confirms stock is leaving",
      "records goods leaving for the sale", and that Branch and Location "control where stock issues
      from"; its FAQ hedged with "exact stock ledger timing is defined by your ERP configuration".
      `INTERNAL_SALES_GOODS_ISSUED_NOTE` is 0/0 (`InternalSalesGoodIssuedNoteDataConsistencyObject.java:16-17`
      and the applet's `applet-constants.ts`) with no journal posting handler. Nothing happens on FINAL
      beyond the status change.
      → source: content/en/applets/sales-workflow/internal-sales-gin-applet.md
      → done: eleven statements corrected this pass, a posting-proof callout added naming
        `INTERNAL_SALES_GIN_STOCK_OUT` as the type that does move stock, and a `sources: lifecycle:`
        map added. The rest of the page (screens, fields, procedures) is still unaudited.

### /applets/sales-workflow/commission-scheme-applet/
- [x] F-0405 (2026-09-06) Duplicate page. `Commission_Scheme` already has a fully sourced page at
      /applets/membership/commission-scheme-applet/, which is also the registry's own
      `documentation_url` target. This 598-line copy had no `applet_code`, no `sources:` map and a
      title that was not the registry name.
      → done: archived to planning/archive/2026-09-06-sales-workflow/, worklog entry
        planning/worklog/2026-09-06-sales-workflow-commission-scheme-duplicate.md, alias added to the
        membership page, four inbound links repointed.

### /applets/sales-workflow/ (folder-wide)
- [x] F-0406 (2026-09-06) Registry triage of all 30 pages: 20 carried no `applet_code`, so none had
      ever been checked against `bl_applet_hdr`. Nine titles were not the registry name — "Daily
      Cashier Report Applet" (registry: Daily Cashier Reports), "Consignment Billing (Internal)
      Applet" (Consignment Billing Applet (Internal)), "Jobsheet (Internal) Applet" (Job Sheet
      (Internal)), "Sales Inquiry (Internal) Applet", "Sales Proforma Invoice (Internal) Applet",
      "Sales Refund Note (Internal) Applet" (Sales Refund Note Applet (Internal)), "Sales GRN
      (Internal) Applet", "Sales Commission (Internal) Applet" (Sales Commission Applet), "Sales
      Report Supplier Access Applet" (Sales Report Supplier Access), "Delivery Order (Internal)
      Applet" (Delivery Order Applet (Internal)).
      → done: `applet_code`, `applet_repo` and the registry title set on twelve pages this pass
        (ADR-0002 §2/§3). Note for future units: three applets ship a **later** bundle than the base
        repo name suggests — `internalSalesRefundNoteApplet` serves
        `internal-sales-refund-note-applet-**v3**`, while `internalSalesProformaInvoiceApplet` and
        `recurringSalesInvoiceApplet` serve the **v1** bundles even though v2 repos exist. Read
        `property_json->>'es_module_url'` before choosing a repo to document from.

- [ ] F-0407 (2026-09-06) Four pages document applets with **no `bl_applet_hdr` row at all**:
      internal-sales-gin-stock-out-applet, internal-sales-invoice-no-stock-out-applet,
      internal-delivery-order-processing-applet, internal-outbound-delivery-order-applet (22 inbound
      links). All four repos are maintained. **Deliberately left live** pending Q-0093 — ADR-0007 is
      still `proposed`, and taking four more pages down under a proposed ADR (on top of the
      commission-scheme archive) reaches the ADR-0008 five-page guard rail. Spot-checking found their
      *content* is broadly right — the gin-stock-out page correctly says FINAL reduces stock, which
      matches `InternalSalesGinStockOutDataConsistencyObject` (qty −1) — which is itself evidence
      that this is a registration gap rather than invented documentation.
      → source: content/en/applets/sales-workflow/{internal-sales-gin-stock-out,internal-sales-invoice-no-stock-out,internal-delivery-order-processing,internal-outbound-delivery-order}-applet.md

### /applets/sales-workflow/internal-sales-invoice-no-stock-out-applet/
- [ ] F-0408 (2026-09-06) "A standard invoice automatically generates a Goods Issue Note, deducts
      stock from the issuing location, and notifies the warehouse via a picking list." The first two
      clauses are wrong in the same direction as F-0403/F-0404: `INTERNAL_SALES_INVOICE` carries
      quantity signum −1 itself (`InternalSalesInvoiceDataConsistencyObject.java:17`), so the invoice
      deducts stock directly; and Sales GIN is 0/0, so a GIN could not deduct anything even if one
      were generated. The contrast the paragraph is drawing is real (`…NoStockOut` is amt +1 / qty 0);
      only the mechanism is invented.
      → source: content/en/applets/sales-workflow/internal-sales-invoice-no-stock-out-applet.md:76
      → note: hold until Q-0093 settles whether this page stays at all.

### wiki assets — screenshots
- [ ] F-0409 (2026-09-06) Screenshots on sales-workflow pages that need a quarantine decision.
      Checked by eye this pass; not deleted (that is not this unit's call):
      • /images/internal-sales-grn-applet/main-details.png — Branch reads `05SS | ONE LIVING SS2`,
        which looks like a real customer's branch, not test data.
      • /images/internal-sales-grn-applet/tab-lines.png — item grid shows `Digi External Item`
        (a real customer brand that also has its own applets in the registry) and several
        `kawsar Test …` items carrying a developer's given name.
      • Pattern, not specific to this folder: every akaun screenshot in the applet pages carries a
        real person's **profile photograph** in the top-right avatar. It is small but it is a
        photograph of an identifiable person on a public site. Worth one decision for the whole wiki
        rather than page by page.
      → note: all three are STAGING_TENANT captures, so the risk is names and brands rather than
        customer transaction data.

### /applets/sales-workflow/internal-jobsheet-applet/
- [x] F-0410 (2026-09-06) Third page in this folder built on the same invented premise. It said the
      Lines tab "deducts stock from inventory if physical parts are used", that FINAL means "any
      stock-tracked line items are deducted from inventory at this point", and that the Delivery
      Details tab ensures "inventory deductions are traceable". `INTERNAL_JOBSHEET` is
      `(0,0)` — `ServerDocTypes.java:66`, `InternalJobsheetDataConsistencyObject.java:16-17`, and the
      applet's own `applet-constants.ts` — with no `JournalPostingTypeHandler` entry. No stock, no
      journal. It also said "the Finance team converts the Jobsheet into a Sales Invoice. The line
      items, account details, and pricing flow directly from the Jobsheet into the Invoice" — the
      Convert tab's one button is labelled *CONVERT TO INTERNAL RECEIPT VOUCHER* and does neither
      (P-0108). And it framed FINAL as "approve the jobsheet for processing by the finance
      department"; per `kb/topics/document-approval.md` there is no approval engine for this document,
      and the applet's own `APPROVAL_CODE` settings are **card authorisation codes** on the Payment
      tab, not document approvals.
      → source: content/en/applets/sales-workflow/internal-jobsheet-applet.md
      → done: rebuilt from source this pass (719 → 290 lines) with a per-section `sources:` map, the
        real twelve-tab inventory, the 72-of-127 settings intersection, the seeded-vs-checked
        permission diff, and the posting-proof block. Product defects split out as P-0108, P-0109,
        P-0110.
      → note: the rebuild references one screenshot
        (`/images/internal-jobsheet-applet/internal-jobsheet-main-details-tab.png`, verified clean).
        The other twelve images in that folder — including two NotebookLM-watermarked infographics —
        are now unreferenced. Not deleted; they illustrate behaviour the page no longer claims, so
        they should not simply be re-linked.

### /applets/sales-workflow/ (link repairs)
- [x] F-0411 (2026-09-06) Eight broken internal links found while sweeping the folder, all
      pre-existing: seven used a `/en/…` prefix (Hugo serves English at the root, so `/en/applets/…`
      404s) on internal-sales-gin-stock-out-applet and internal-sales-inquiry-applet, and one pointed
      at `/applets/cashbook-applet/` instead of `/applets/master-data/cashbook-applet/` on
      daily-cashier-report-applet. Only two files in all of `content/en` carried the `/en/` bug and
      both were in this folder.
      → done: all eight repaired this pass. The folder now has zero broken internal links.

### images — the quarantine executed (2026-09-06)
- [x] F-0394 (2026-09-06) **Reversed F-0380 on the evidence.** The mermaid pilot audited five infographics and **five of five carried claims source contradicts** — 21 in total, including `Available = Physical − Reserved` (the backend adds a *signed* adjustment with a `+1` GRN↔PI pair, and "reserved" never enters it), "enforce FIFO" on a read-only applet, an approval workflow with no component or route, and "role-based access" on an applet that registers no permission definitions at all. One carried a **fabricated product identity, "DELIVERYCONNECT APPLET · Empowering Your Logistics"**, with a logo, live on the English, Malay and Chinese pages. Another described **property leasing** — leases, renewals, property managers, tenants submitting requests — for the Tenant Admin Applet, where "tenant" means a customer organisation on the platform. Two published generation artefacts verbatim ("sitting stop purchasing", "Write-one"). Shipped 987cf4c4: **128 images quarantined** (not the ~70 first estimated — 75 matched the generated canvas sizes and a further 53 were the same class in other sizes), **89 reference lines removed from 76 pages**, nothing deleted. **46 of the 128 were already unreferenced and still being served from the CDN.** Diagrams worth keeping return as mermaid or inline SVG per F-0381 — as an audit whose usual answer is "no diagram", never as a faithful redraw: four of the five sampled would have reproduced a false claim in crisper vector.

### /guides/ and /user-guide/ — the 110-page audit (2026-09-06)

- [x] F-0421 (2026-09-06) **The whole purchasing family taught that the goods received note moves
      stock.** `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` is quantity-signum **0** and amount-signum
      **0** (`ServerDocTypes.java`); the stock and the liability are booked by
      `INTERNAL_PURCHASE_INVOICE` (+1,−1), or by the separate *GRN Stock In* / *Invoice No Stock In*
      pair. Six pages said otherwise, in the same words that had already been caught on Sales GRN
      and Jobsheet: `standard-procurement-workflow.md:548-568` ("System processes: Updates inventory
      quantities … Creates accounting entries" and "Stock increased … Stock is available for use or
      sale"); `goods-received-note.md:7, 566-584, 619, 748` (`Debit: Inventory / Debit: Input Tax /
      Credit: GRN Accrual`); `direct-grn-workflow.md:270, 393-407, 512-515`;
      `inventory-guides/_index.md:31, 45`; `demo/manufacturing:849-875`; `demo/retail:372-380`;
      `demo/food-beverage:486-507`. `consignment-purchasing.md:162-176` gets it exactly inverted the
      other way — it calls the consignment GRN "a memo entry only, no expense recorded" when
      `INTERNAL_PURCHASE_CONSIGNMENT_GRN` is (+1,−1) and does post.
      → done: `standard-procurement-workflow.md`, `goods-received-note.md`,
        `creating-purchase-order.md` and `purchase-invoice-processing.md` rebuilt from source this
        pass, each with a `sources:` map, the GadgetSphere example and the two receipt-to-bill paths
        stated as a warning callout. The remaining pages listed above are still live and still wrong.

- [x] F-0422 (2026-09-06) **The sales family attributes stock movement to documents with none, and
      invents a credit-limit block.** `standard-sales-workflow.md:518-531, 551` says a sales-order
      status change "Updates available inventory quantities" and tells the reader to "Verify
      Inventory Deduction"; `INTERNAL_SALES_ORDER` is (0,0). `delivery-order-processing.md:16, 37-46`
      says the delivery order "triggers invoice finalisation" and that a "Stock Conversion section"
      on the sales order allocates stock — Stock Conversion is an unrelated inventory applet that
      converts stock *between items*. `returns-exchanges-workflow.md:327-353` processes a physical
      goods return as a **credit note**; `INTERNAL_SALES_CREDIT_NOTE` is (0,−1) and moves no stock —
      the stock-returning document is `INTERNAL_SALES_RETURN` (1,−1), whose applet the page never
      names. And `credit-sales-workflow.md:228` / `creating-sales-order.md:240` state that "BigLedger's
      credit-limit check … blocks the order outright": `EntityCreditAvailabilityService` is a
      read-only query for display, and the only hard block is
      `GenericDocumentService.disallowBlacklistedCustomer`, which fires solely on a manually-set
      `BLACKLISTED` status. Exceeding a credit limit blocks nothing.
      → not yet fixed. These eight sales guides should be rebuilt after `applets/sales-workflow/`
        is finished, in one pass, from that folder.

- [x] F-0423 (2026-09-06) **The approval remediation of `f25a917f` stopped four folders short.**
      That commit correctly rewrote about a dozen approval passages to say approvals are optional,
      cover only PO / PR / SR, and gate nothing. It never reached `guides/roles/` (approval limits,
      delegation controls, two-signature payments, journal-threshold approvals, credit approval,
      return approval — `internal-audit.md:47-50, 54, 67, 85, 157, 270`, `finance-manager.md:20, 24,
      49, 66`, `ecommerce-specialist.md:171`), `user-guide/demo/` (`manufacturing:177` "Click Approve
      BOM"; `services:218-232, 294, 448-465` timesheet, milestone and expense approval;
      `operations-manager:32, 92-93, 146, 374, 491` — twelve lines after its own corrected passage),
      `guides/advanced/` (`industry-specific-workflows.md:982-999, 1387-1391`;
      `integration-best-practices.md:172, 629, 714`), or `guides/content-guidelines.md:481, 598-599`,
      whose model guide teaches a purchase order defaulting to "Pending Approval" with "Notification
      sent to approver". Several pages now carry a correct callout and an incorrect workflow twenty
      lines apart, which is worse than either alone.
      → not yet fixed. Worth one sweep across all four folders rather than page by page.

- [x] F-0424 (2026-09-06) **`/applets/supplier-maintenance-applet/` is a broken link in 19 places.**
      The real page is `/applets/master-data/supplier-applet-1/` and it carries no alias.
      → done: 11 occurrences repaired in `guides/` and `user-guide/` this pass. Eight remain, all
        outside this unit's scope: `modules/financial-accounting/_index.md`, `modules/journal.md`,
        `modules/financial-accounting.md`, `modules/purchasing/_index.md`, `modules/inventory/_index.md`,
        `modules/manufacturing/_index.md`, `applets/_index.md`, `applets/applet-catalog.md`. Either
        repair those or add an alias to the supplier page — the alias is probably the better fix
        given how many module pages reference the old flat path.

- [x] F-0425 (2026-09-06) **Three pricing pages document a three-level model and an applet that do
      not exist.** The verified `applets/master-data/pricebook-applet.md` documents **two** levels — a
      Price Book header containing Price Sets — both being menus *inside* the one `PricebookApplet`.
      There is no Pricing Scheme applet; "Pricing Scheme" is one option of a treatment's Price Source.
      So `pricing-scheme.md` (376 lines) documents an applet that is not one, and
      `pricing-scheme.md:51` and `price-set.md:67` send readers to screens that do not exist. Four
      further contradictions of the same verified page: codes are user-entered, required and unique,
      not "system generated" (`price-book.md:88-92`, `pricing-scheme.md:85-89`, `price-set.md:88`);
      **priority is inverted** — the calculator evaluates the *highest* number first, and
      `price-set.md:93, 448-458` teaches "1 = highest" and builds a whole banding methodology on it;
      only Active/Inactive statuses exist (`price-book.md:154-155`, `pricing-scheme.md:142` invent
      Draft and Archived); the Calculation Logic list at `price-book.md:157-163` ("Fixed, Cost-Plus,
      Market-Based, Competitive, Value-Based") is not the enum. Customers are never assigned to price
      books — a consuming applet loads exactly one from its own Default Selection — yet
      `price-book.md:167-221` describes direct, group, geographic and channel assignment with an
      automatic lookup at sale time. All three pages also close with an unsourced ROI claim
      (`price-book.md:558`, `pricing-scheme.md:347`, `price-set.md:771`) and `price-set.md:680-722`
      promises machine learning, IoT, voice-activated pricing and augmented reality.
      → not yet fixed. One rebuild covering both real levels would replace all three pages.

- [x] F-0426 (2026-09-06) **Every error code on the troubleshooting page is fabricated.**
      `troubleshooting/_index.md` quotes twelve codes in an `ERR-SYS-####` / `ERR-VAL` / `ERR-TXN` /
      `ERR-MYS` / `ERR-INT` scheme (L65, 77, 93, 104, 119, 133, 152, 169, 181, 201, 211, plus
      sub-codes 3002-A…E at L216-220). A grep for those prefixes across
      `refs/blg-akaun-platform-java` returns **zero hits**; the real scheme is UPPER_SNAKE enum names
      in `ErrorCodesConstants.java` (5,797 lines), e.g. `ITEM_HDR_OBJECT_CODE_ALREADY_EXIST`. The
      same page invents a *Finance > Bank Integration* screen at L201-209 with stored bank logins,
      a Test Connection button and OAuth token refresh; the real Bank Reconciliation applet takes
      **uploaded statement files** with an import-format picker. It also publishes a named
      individual's Telegram handle at L369 (see Q-0113) and invents support SLAs at L382-385.
      → not yet fixed. A troubleshooting page keyed to real error strings would be genuinely
        valuable — this one is worse than nothing, because a reader searching a real error finds
        the page and it does not match.

- [x] F-0427 (2026-09-06) **`guides/advanced/performance-optimization.md` tells a SaaS tenant to run
      destructive DBA statements against a fabricated schema.** 1,487 lines: `ALTER SYSTEM SET
      autovacuum_*` (L246-248), `DROP TABLE` on partitions (L1217), `COPY … FROM PROGRAM` (L965-967,
      arbitrary shell execution), `CREATE USER MAPPING … password 'secure_password'` (L1330-1332),
      `CREATE EXTENSION aws_s3` (L1277). It prescribes **MySQL InnoDB and SQL Server** memory and
      parallelism settings for a PostgreSQL-only product (L26-67). Every table it names is invented
      — `sales_transactions`, `customers`, `products`, `general_ledger`, `inventory_movements` —
      against a real schema of `bl_fi_*` / `bl_inv_*`. Plus invented SLOs (L270-285) and a retention
      table whose Employment Act figure is wrong (L1103: 12 years; the Act requires 6).
      No reader has the access to execute any of it, which is the only reason it has not caused harm.
      → not yet fixed; unpublish candidate, see Q-0111.

- [x] F-0428 (2026-09-06) **`guides/advanced/integration-best-practices.md` asserts bank, payment-gateway
      and PCI DSS integrations that do not exist.** L44-71 names four real Malaysian banks as
      integrated APIs ("Maybank2u Business API", "PB Enterprise API", "CIMB Clicks Business", "HLB
      Connect Enterprise"); L282-330 names seven real payment gateways; L410-467 is a PCI DSS
      conformance narrative ending "**Implementation in BigLedger:** Tokenization … AES-256 …
      Hardware security modules"; L917 claims GDPR compliance; L543-801 is a 260-line EDI
      (X12/EDIFACT/AS2/VAN) implementation guide for a product with no EDI applet; L822-834 asserts
      OAuth 2.0, JWT and certificate auth for an API whose authentication page was unpublished
      today. Naming real banks also breaches the CLAUDE.md running-example rule.
      → not yet fixed; unpublish candidate, see Q-0111. Same certification class as Q-0006.

- [x] F-0429 (2026-09-06) **`getting-started/platform-overview.md` invents the company.** "Over 5,000
      Malaysian SMEs" (L26) against 83 live tenants; an industry-adoption split (L192) with no source;
      "500+ Pre-built Applets" (L79) against ~200 ACTIVE registry rows; a named fictional customer
      presented as a success story with fabricated metrics (L150 "Syarikat Maju Jaya … 75% … 1,000+
      invoices daily with 99% accuracy"); "99.9% uptime" and "ISO 27001 certified data centers"
      (L67, L369) — the Q-0006 class; published pricing (L270-286: RM299/mo, RM2,999/mo, one-time
      licence) and **on-premise / air-gapped / self-hosted deployment** (L280-287), which contradicts
      the cloud-native positioning in CLAUDE.md; "GPT-4 and Claude" and "voice assistants for
      hands-free operation" (L249-260); "Shop Floor Control with IoT" and "Predictive Maintenance"
      (L198-200) — banned invented roadmap features.
      → not yet fixed. This is the page a new reader lands on, and almost every number on it is made up.

- [x] F-0430 (2026-09-06) **`getting-started/navigation.md` documents the wiki's own menu as the
      product's.** L186-191 lists "Modules / Applets / E-Invoice / Business Operations / User Guide" —
      that is wiki.bigledger.com's top nav, not anything inside BigLedger. Everything built on it is
      therefore fiction: eight keyboard shortcuts (L213-225), drag-and-drop dashboard widgets
      (L201-205), offline mode / PWA / swipe gestures (L227-233), pin-to-favourites (L237), a support
      portal and community forum (L247-248). 80 lines, ~90% invented, and it is the page that teaches
      a new user how to move around the product.
      → not yet fixed.

- [x] F-0431 (2026-09-06) **`user-guide/reports-analytics/_index.md` describes an analytics product
      that does not ship.** No dashboard applet, dashboard builder, widget library or report builder
      appears in the 209-row ACTIVE registry. Invented wholesale: dashboard creation and widgets
      (L62-121), the Report Builder (L123-284), scheduled distribution and alerting (L329-467), a
      mobile app (L422-436), an ML/predictive layer (L521-538), BI connectors to Tableau/Power BI/
      Snowflake/Redshift/BigQuery (L456-460), and GDPR + SOX compliance features including a
      "Right to be Forgotten" capability (L606-610). Its own sibling
      `reports-analytics-v2/_index.md` is an honest catalogue of the same territory whose eight rows
      all map to real report applets — that page is the model, and this one should be replaced by it.
      → not yet fixed.

- [x] F-0432 (2026-09-06) **`user-guide/basic-operations/` contradicts the verified item applet on
      five points of fact, and one page invents a document-management product.** Against
      `applets/master-data/doc-item-maintenance-applet.md`: item code is **not** system-generated in
      the default create mode (`creating-an-item.md:39`, `item-maintenance.md:51`,
      `editing-an-item.md:51`); item type is **immutable after save**, not editable
      (`item-maintenance.md:54`, `editing-an-item.md:54`); Base UOM **is** editable, not locked
      (`creating-an-item.md:58` and two others); "Stock Balance Tab", "Sales Order Tab", "Stock
      Allocation Tab", "Create Single Tab" and "Create Group Item Tab" are not tabs
      (`item-maintenance.md:123, 131, 177, 191`, `editing-an-item.md:118`); version history and
      rollback do not exist (`item-maintenance.md:148-151`). `document-item-types.md:17` builds a
      whole page on "five document item types" — the dropdown offers **20**, of which the page
      documents five, and two of the five (`PACKAGE`, commented out and marked out-dated; `KIT`,
      absent) cannot be selected at all. And `document-item-maintenance.md` (709 lines) describes an
      enterprise DMS BigLedger does not have: collaborative rich-text editing, digital signatures
      with eIDAS / E-SIGN / biometrics, HIPAA / SOX / GDPR modules, AES-256, **IoT sensor integration
      and voice-to-text** (L619-631) — banned roadmap features — closing with an ROI claim.
      → not yet fixed. Note all five pages are `bookHidden` and unreachable from navigation, but
        live, indexed, and the top search result for their titles.

- [x] F-0433 (2026-09-06) **`user-guide/administration/team.md` is written to house standard and is
      still wrong about the screen.** Voice, GadgetSphere, permission codes and target scoping are all
      correct — but the Tenant Admin sidebar has **no Team menu** (L47); the real screen is
      *Settings > Server Side Permissions > Team Permission*, which the verified applet page also
      omits. Team Email / Team Visibility / Team Joining (L53-55) do not exist and are copied verbatim
      from the legacy `group-listing.md:57-59`. Team Code is read-only and system-set, not a
      convention you choose (L52, L59-61). The tabs are Details / Members / Role, not "Edit Members" /
      "Edit general info" / "Edit Permission" (L67, 75, 81), and a team is granted **roles**, not
      permissions. There is no Import Users tab (L73) — members are added one at a time by email
      search. The menu is *Tenant Roles*, not "Roles & Permissions" (L81).
      → not yet fixed. Small, high-value fix: one pass over the screen against
        `refs/blg-applet-core-akaun-platform-tenant-admin-applet`.

- [x] F-0434 (2026-09-06) **`user-guide/daily-tasks/_index.md` ships three literal `**TODO:**`
      markers** (L29, L41, L53) and an invented "Performance Metrics" SLA table (L118-123).
      `administration/_index.md` ships three more TODO blocks (L105, L138, L153) and its own metric
      table (L169-175: ">99.5% uptime", ">90% user satisfaction", "0 security incidents/month").
      `administration/group-listing.md` ships a "Development Timeline" (L119-123) on a live page —
      and documents a Group Maintenance applet that is not in the ACTIVE registry (see Q-0009).
      → not yet fixed. The TODO markers are a two-minute fix and should not wait for the rest.

- [x] F-0435 (2026-09-06) **The three `-v2` section indexes violate the Hextra no-inline-HTML rule.**
      `administration-v2/`, `basic-operations-v2/` and `getting-started-v2/` each carry ~110 lines of
      inline `<style>`, `<script>` and `<div>` around a YouTube lesson list. They are **not**
      duplicates of their non-v2 siblings — no prose overlap at all — but the pairing creates a worse
      structural problem: `user-guide-v2/_index.md` is the live hub and links only to the `-v2`
      sections, `user-guide/_index.md:10` carries a raw `<script>` JS redirect to it, and the three
      non-v2 sections are `bookHidden` with a cascade, so **15 non-v2 pages are live and indexed but
      unreachable from navigation**. Back-links are inconsistent too (`administration-v2` points at
      `/user-guide-v2/`, the other two at `/user-guide/`, which redirects away).
      → not yet fixed; this is a structure question, opened as Q-0114.

- [x] F-0436 (2026-09-06) **`user-guide/daily-tasks-v2/_index.md` plays the wrong video for four of
      its 58 lessons.** `7Ll9JAhhmx4` is used for three different titles (L514, L522, L523) and
      `BlC3GtLoHzo` for three more (L515, L519, L524). Otherwise the page is sound — it and
      `reports-analytics-v2/_index.md` are the only two pages in all 110 that make no unverifiable
      claim.
      → not yet fixed. Needs someone with the playlist to hand.

- [x] F-0437 (2026-09-06) **Malaysian tax and statutory facts are wrong across `guides/advanced/`.**
      `accounting-workflows.md:824` posts "GST Input Tax" — GST was abolished in 2018;
      `:911-917` gives Schedule 3 capital-allowance rates that are all wrong (plant & machinery 14%
      not 10%; office equipment 10% not 20%; non-industrial buildings get no allowance);
      `:922-933` books a deferred tax asset where a liability arises. `compliance-audit.md:486-493`
      invents "Form SST-02A / SST-02B" and calls the return monthly (it is SST-02, bi-monthly);
      `:501` invents late-filing penalties; `:438` invents an e-Filing turnover threshold (mandatory
      for all companies since YA2018); `:549-555` gives PCB bands that match no actual schedule;
      `:560-573` presents withholding-tax rates under a "**Residents**" heading when ss.107A/109/109B
      apply to non-residents; `:748-749` gets an MFRS 16 annuity wrong by RM 1,182 and capitalises a
      refundable security deposit into the right-of-use asset. `financial-reporting-excellence.md:44`
      says private companies must file "30 days after AGM" — private companies need not hold AGMs
      under the Companies Act 2016. `roles/finance-manager.md:33` invents an "SST-03 form" and calls
      filing monthly; `:38` cites Forms 24, 44 and 49, abolished in 2017.
      `roles/merchandising-manager.md:54` refers to "the upcoming GST changes in Malaysia".
      → not yet fixed. A Malaysian reader will spot these immediately and stop trusting the site.

### /applets/sales-workflow/internal-consignment-billing-applet/
- [x] F-0447 (2026-09-06) **The page had the document pointing the wrong way round.** It said the
      applet "converts Goods Issue Notes into final sales invoices", that finalising "moves the asset
      from Consignment Out to Revenue", and that VOID removes "the AR entry". The applet's document
      type is `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE` (short code `CSGINV`) — a **purchase** document
      with amount signum **−1**; its internal route is `internal-purchase-invoice`, its entity picker
      is titled *Select Supplier*, and its file import posts to the internal **purchase** invoice
      endpoint. It is the consignor's bill to you, and it posts Dr Purchase / Dr Input Tax, Cr
      Creditor, plus Dr `CONSIGNMENT_LIABILITY` / Cr `CONSIGNMENT_STOCK`. No debtor, no sales, no
      output tax. It also **moves no stock**: the backend DCO forces every line's quantity signum to
      0 (`InternalPurchaseConsignmentInvoiceDataConsistencyObject:16`,
      `GenericDocumentDataConsistencyObject:1215-1219`) even though the applet sends 1. The page also
      built a "GIN-to-Invoice Link" feature and three FAQ answers on the **Issue Link** tab, which is
      a mock grid with one hard-coded row and no service injected.
      → source: content/en/applets/sales-workflow/internal-consignment-billing-applet.md
      → done: rebuilt from source (704 → ~300 lines) with a per-section `sources:` map, the standard
        posting-proof block, the real menu and tab inventory, the 52-of-103 settings intersection and
        troubleshooting drawn from the actual validators.
      → product: P-0131, P-0132, P-0133, P-0134
      → open: the page is filed under `sales-workflow/` but documents a purchase-side document —
        see Q-0125.

### /applets/sales-workflow/internal-sales-inquiry-applet/
- [x] F-0448 (2026-09-06) Four wrong claims on an otherwise plausible page. (1) "the usual options
      are to **VOID** and recreate the inquiry" — there is no VOID on this document; the applet
      contains no void action and no `'VOID'` string. (2) "**Export** (PDF, CSV, DOCX, or ZIP,
      depending on configuration)" — only PDF is implemented; the other three buttons are
      hard-disabled in the template. (3) Convert "treats the inquiry as completed in that pathway" —
      it POSTs a new `INTERNAL_RECEIPT_VOUCHER` built from the header and the **Collection**
      (settlement) lines, not the item lines, and then **DELETEs the inquiry**. (4) "an activity or
      history tab showing status transitions" — there is no such tab. Also documented as a feature:
      the line-level **Issue Link** tab, which is a mock (see P-0132).
      → source: content/en/applets/sales-workflow/internal-sales-inquiry-applet.md
      → done: rebuilt from source (521 → ~290 lines). `INTERNAL_SALES_INQUIRY` is 0/0
        (`ServerDocTypes.java:47`) with no journal handler; added the 31-of-86 settings intersection,
        the panel-versus-tab orientation behaviour the old page did not mention, the seeded-permission
        comparison (23 seeded, 23 checked, one mismatch each way) and the real field list.
      → product: P-0132, P-0133, P-0134

### /applets/sales-workflow/internal-sales-refund-note-applet/
- [x] F-0449 (2026-09-06) The page was mostly directionally right — unusually for this folder — but
      overstated three things and missed two that matter. Overstated: the "**Strict PNS vs. STL
      Balancing Rule**" is a **client-side** check in `onFinal()` that shows a toast and sends
      nothing (an API or file-import refund note is not subject to it); "**Over-Refund Prevention**"
      is the opt-in `WARN_EXCESS_RETURN_QUANTITY` setting on the Search screens, not a built-in
      safeguard; and "**Native Intercompany Support**" is a two-tab queue listing (UNPROCESSED /
      PROCESSED), not routing the applet performs. Missed: **when e-Invoice is enabled the VOID
      button disappears entirely** (`showVoid()` requires `!eInvoiceEnabled`) and cancellation must go
      through the IRB Cancellation sub-tab; and the applet checks **45** client-side permission codes
      of which exactly **one** is seeded.
      → source: content/en/applets/sales-workflow/internal-sales-refund-note-applet.md
      → done: rebuilt from the **v3** repo (the bundle the registry actually serves) with the
        posting-proof block, the 101-of-165 settings intersection, the fifteen-tab edit inventory and
        the four E-Invoice sub-tabs.
      → product: P-0133, P-0134, P-0135

### /applets/sales-workflow/daily-cashier-report-applet/
- [x] F-0450 (2026-09-06) Not invented, but written as a user guide rather than a reference card, and
      **illustrated with four screenshots of a different applet**: all of
      `/images/pos-general-applet/{cashier collection report, report desaign, Z REPORT, EXPORT TO PDF,
      PRINT Z REPORT}.png` show the **POS General** left rail, and the POS Z Report has a Device
      filter and *Show Settlement Methods By User* / *Show Category Details* options that the Daily
      Cashier Reports Z Report does not have. The page also carried an inline-styled `<div>` YouTube
      embed, against the Hextra rule in CLAUDE.md, and said nothing about what the Z Report actually
      counts.
      → source: content/en/applets/sales-workflow/daily-cashier-report-applet.md
      → done: rebuilt as a reference page. The Z Report is restricted to `INTERNAL_SALES_CASHBILL`,
        `INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_RETURN` and `INTERNAL_SALES_REFUND_NOTE`
        (`GenericDocumentUow.java:2587`); documented the five working settings, the two seeded
        permissions, the branch **target** filters that explain "empty drop-down vs not authorised",
        and the third report screen that cannot be reached. Wrong-applet screenshots removed; video
        kept as a plain link.
      → product: P-0136, P-0137
      → note: this applet has no screenshots of its own. Worth capturing two.

### /applets/sales-workflow/sales-commission-applet/
- [x] F-0451 (2026-09-06) The mechanism was invented around a real feature. The page promised a
      "**Zero Double-Payout Guarantee**", "**Cycle Period Locking**" ("once a cycle is closed,
      historical figures are permanently locked"), "converts approved commission reports directly
      into actionable Internal Payment Vouchers with **1-click**" and calculation "directly from
      finalized Sales Invoices and official cash receipts". What is actually there: a cycle is only a
      start date and an end date with a DELETE button — there is no close, no lock; the processor is
      **three buttons that must be pressed in order** (Txn Lines Commission → Aggregate Commission →
      Commission Report); the payout is a hand-created Internal Payment Voucher whose *Payout For*
      tab you attach reports to, not a one-click conversion. The double-payment guard is real but is
      a queue flag, not a cycle lock: the candidate query takes only `INTERNAL_SALES_ORDER`,
      `INTERNAL_SALES_INVOICE` and `INTERNAL_SALES_CASHBILL` at `posting_status = 'FINAL'` where
      `posting_sales_commission_queue <> 'POSTED'` (`GenericDocumentUow.java:2558-2588`), and stamps
      each processed document POSTED.
      → source: content/en/applets/sales-workflow/sales-commission-applet.md
      → done: rebuilt from source and from `CommissionPostingServices`. Documented the exact candidate
        query, the three stages, the server-side permission gates (there are no client-side ones), the
        report Line Item tab as the dispute-resolution path, and the fact that only three of the
        applet's 35 declared settings do anything.
      → product: P-0134, P-0138, P-0139

### wiki assets — screenshots (continued from F-0409)
- [ ] F-0452 (2026-09-06) Four more sales-workflow screenshots needing a quarantine decision, found
      by eye this pass. Not deleted — not this unit's call.
      • /images/internal-sales-inquiry-applet/sales-main-details-tab.png and
        /images/internal-sales-inquiry-applet/sales-account-tab.png — the listing behind the panel
        shows branches `ONE LIVING SS2`, `OneLiving Branch` and `1 UTAMA` (a real Malaysian shopping
        centre) and customer names including a real person's full name and two given names. Same
        `ONE LIVING` brand already flagged on the GRN page in F-0409. **Both are now unreferenced** —
        the rebuilt page uses only `sales-line-items-tab.png`, which is clean.
      • /images/sales-commission-applet/payout-processing-ui.png — Branch reads `2ND SKIN | 2NDSKIN`
        (reads as a real customer brand) and **Created By** shows a real person's full name. **Now
        unreferenced** — the rebuilt page uses the other three commission screenshots.
      • /images/pos-general-applet/report desaign.png — a settlement grid with sales-agent given
        names in a `TESTING` tenant. Weak on its own; listed for completeness. Still referenced by
        the POS General page, which is not this unit's lane.
      → note: /images/internal-consignment-billing-applet-applet/*.png (14 files) were all checked
        and are STAGING_TENANT captures with synthetic data; the `Select Supplier` grid on
        `consignment-billing-account-tab.png` and the KO grid on `consignment-billing-ko-for-tab.png`
        carry obviously-fake names (`John Cena`, `testaddd`, `customersupplier`) and are safe.
      → note: the top-bar avatar photograph appears in every one of them; that is Q-0100, not a
        per-image decision.
