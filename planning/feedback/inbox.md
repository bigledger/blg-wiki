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
- [ ] F-0051 (2026-09-05) The claim that a credit limit "hard-stops a sale" is not supported by javasdk domain code. Removed from the rewritten page pending an answer — kb/questions/2026-09-05-credit-limit-enforcement.md. Decision/answer needed from Vincent or backend lead.

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

