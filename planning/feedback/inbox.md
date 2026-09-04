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
- [ ] F-0001 (2026-09-05) "verbatim or near-verbatim of what Vincent said"
      → source: content/en/user-guide/some-page.md
      → note: anything Claude noticed while recording (optional)
```

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
- [ ] F-0002 (2026-09-05) Indonesian vocabulary: pengiriman, mengelola
      → source: content/ms/applets/driver-delivery-order-applet.md
      → note: Malay: penghantaran, mengurus

### /ms/applets/internal-sales-order-applet/
- [ ] F-0003 (2026-09-05) Indonesian vocabulary: fitur
      → source: content/ms/applets/internal-sales-order-applet.md
      → note: Malay: ciri

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
- [ ] F-0008 (2026-09-05) "i would like the whole website to be search engine friendly, as well as GEO... (easily pickup by ai crawling), i hope the ai engine to pick up all our akaun.com or bigledger as key words, so that they don't steal the knowledge without mentioning bigledger and akaun.com"
      → note: cross-cutting; discussion opened: discussions/2026-09-05-seo-and-geo.md. hugo.yaml already declares an `llms` output format (unused?) — check.

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
- [ ] F-0017 (2026-09-05) deploy.yml runs only `hugo --minify`; the lychee + Playwright suite never gates a deploy. A conflict-marker page (F-0014) reached production because nothing checks.
      → source: .github/workflows/deploy.yml, tests/run-all.sh
      → note: GPT roadmap item #2. Add a quality job (build + lychee offline + Playwright + front-matter/marker/artefact lints) that deploy needs.

### /zh/ /ms/ /ar/ (home pages)
- [ ] F-0018 (2026-09-05) The Chinese, Malay and Arabic home pages still use the old marketing hero and hit the same hextra-home layout bug (single narrow column). Port the new English home (ADR-0004) to all three — translated, same shortcodes; Malay in Bahasa Melayu.
      → source: content/zh/_index.md, content/ms/_index.md, content/ar/_index.md
      → note: found while shipping F-0006. Translation batch per ADR-0003.

