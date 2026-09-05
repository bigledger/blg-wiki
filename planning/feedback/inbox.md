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

