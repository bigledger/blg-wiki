---
date: 2026-09-06
page: content/en/applets/sales-workflow/external-sales-invoice-applet.md
outcome: unpublished (ADR-0008 tier 1) — no rewrite, because the applet has no registry row
worklog: ../worklog/2026-09-06-external-sales-invoice-applet.md
kb: ../../kb/topics/external-generic-documents.md
routed: [Q-0060, P-0092, P-0093, P-0094, P-0095, F-0352, F-0353, F-0354]
---

# Working notes — External Sales Invoice applet

Number one on `planning/audit-backlog.md`: 3,555 lines, 302 numbered steps, zero inbound links,
never verified against anything, in a folder lane 1 never reached.

## 1. Registry (ADR-0002 step, done first)

`bl_applet_hdr` in `akaun_master`, 2026-09-06: **209 ACTIVE, 26 DELETED, 1 INACTIVE**.

- `name ILIKE '%external%' OR code ILIKE '%external%'` → **0 rows**.
- The two registered sales-invoice bundles are `salesInvoiceApplet` ("Sales Invoice (Internal)",
  router `applet/tnt/wavelet/erp/internal-sales-invoice-applet`) and `recurringSalesInvoiceApplet`.
- `property_json::text ILIKE '%external-sales-invoice%'` and `'%supplier-sales-invoice%'` → **0 rows**.
- The repo's dev-only `sessionStorage.appletCode` is `external-supplier-sales-invoice-applet` and its
  `appletGuid` is `371a8cd4-95e3-4e43-8e5d-b4ec0df48cce`; neither exists in the table.
- Not on `planning/private/applet-exclusions.tsv` either — it is simply absent.

So: no ACTIVE row, ADR-0007 territory, seventh instance of the pattern (P-0029, P-0040, now P-0095).

## 2. The repo (found under refs/, not via `gh repo list`)

`/home/marketing/repos/refs/blg-applet-wavelet-external-sales-invoice-applet`, HEAD `222d5699`
(2026-08-21, merge of `blg-int-general-task#6491`), split from the monorepo 2025-11-02. Angular
project `external-sales-invoice-applet` in the shared `micro-fe` workspace; route
`applet/tnt/wavelet/erp/external-sales-invoice-applet`.

Read in the order METHOD.md prescribes — `app.routing.ts` first, then module imports:

- **Routed screens**: one document container (`external-sales-invoice`), a settings container with
  `default-selection`, `field-settings` (the **shared** `FieldConfigurationComponent`),
  `printable-format-settings`, `webhook`, `feature-visibility` and the five permission listings, and
  a personalization container. `workflow-settings` is commented out of the route table.
- **Menu** (`models/menu-items.ts`): the sidebar has exactly one document entry, "External Sales
  Invoice". The settings sidebar has exactly three: Application Settings, Default Selection,
  Printable Format Settings. **Permission Management, Webhook and Feature Visibility have routes but
  no menu entry** — the page's Step 4 and Step 5 menu paths cannot be walked.
- **METHOD §29 decoy present**: `components/settings-container/field-configuration/` declares a
  local `FieldConfigurationComponent` with a single control (`HIDE_LAST_PURCHASE_PRICE`), declared in
  `AppletSettingsModule` but **not routed** — `app.routing.ts` imports the shared component instead.
  Dead code; do not document it.
- **Default Selection** is real and is the only honest setting pair in the applet: `DEFAULT_BRANCH`,
  `DEFAULT_LOCATION`.

## 3. The mock/dead-code trap, in its most extreme form yet

`state-controllers/external-sales-invoice-controller/store/effects/external-sales-invoice.effects.ts`
is 352 lines of which **one effect is live**: `loadConversionListing$` (L27-86), which calls
`ExternalGenericDocService.getByCriteria` and decorates each row with branch code, location code and
the creator/updater profile names.

Commented out in full: `createExternalSalesInvoice$` (L88-164), `editExternalSalesInvoice$`
(L166-243), `updatePostingStatus$` (L245-296), `loadJobOrderListing$` (L298-346).

The components still dispatch into that void:

- create `onSave()` → `createExternalSalesInvoiceInit` — nothing handles it;
- edit `onSave()` → `editExternalSalesInvoiceInit` — nothing handles it;
- listing `onFinal()` and edit `onFinal()` → `updatePostingStatus` — nothing handles it.

This is a step past the usual "mock grid with a SAVE that toasts success": here SAVE and FINAL do
not even toast. Buttons enabled, nothing happens.

The create/edit form is still the donor's: Branch, Location, **Conversion Code**, **Conversion
Name**, Description. Tabs: "Main Details" and an **empty "Matchings"**; Lines, Input, Output and Job
Order Link are commented out in the template. `app.module.ts` still carries commented
`StockConversionModule` imports — the donor was the Stock Conversion applet.

## 4. What it actually reads (and why the page's premise is wrong)

`ExternalGenericDocService` → `/core2/tnt/dm/erp/xtn/gen-doc/backoffice-ep`, over
`bl_fi_xtn_generic_doc_hdr` / `_line`. **"External" means the document came from outside BigLedger**
— not that the customer is outside the group. Full findings in
`kb/topics/external-generic-documents.md`. Key points for anyone who picks this up:

- No `posting_status` column on the table; no signums, no posting-status transition and no journal
  path in `ExternalGenericDocumentDataConsistencyObject` / `ExternalGenericDocumentService`; nothing
  in `JournalPostingService` reads the family. **Posting proof block: not applicable — this applet
  writes nothing and posts nothing.**
- The real concept is **matching** (`bl_fi_xtn_gen_doc_matching_line_link` and the two
  matching-balance tables), which is what the empty "Matchings" tab was going to be.
- The production publish script deploys to `…/wavelet-erp/supplier-sales-invoice-applet/prod`, and
  there is a sibling endpoint `xtn/gen-doc/supplier-ep`. The likeliest intent is a supplier-portal
  screen, not a customer-invoicing one — but nothing in the repo states it, hence **Q-0060**.

## 5. Approval

`kb/topics/document-approval.md` read before writing anything: the generic-document approval engine
covers `INTERNAL_PURCHASE_ORDER`, `INTERNAL_PURCHASE_REQUISITION` and `INTERNAL_STOCK_REQUISITION`
only. **There is no approval engine for any sales document**, so the page's "Finance reviews and
approves the draft" gateway had no counterpart anywhere in the product, never mind in this applet.

## 6. Screenshots

Three images, all in `static/images/external-sales-invoice-applet/`, all viewed:
`external-sales-invoice-applet-overview.png`, `the-invoice-journey.png`,
`choose-your-creation-method.png`. **No privacy problem** — no people, no customer data, no grids,
no consoles. They are AI-generated marketing infographics with a "NotebookLM" watermark, and they
illustrate features the applet does not have. Not quarantine candidates on privacy grounds; they
should go with the page, and the wider family of 46 such images is F-0353.

## 7. Decision

Rewrite was not available: with no registry row there is no page to write (ADR-0002 §1, ADR-0007
§2/§6), and with create/edit/FINAL commented out there is nothing to describe beyond a listing.
`draft: true` in place rather than a move to `planning/archive/`, because ADR-0007 is still
*proposed — awaiting Vincent* (Q-0009, Q-0026) and the URL should survive if the answer is "register
it". One page down; well under the five-page stop-and-report threshold. No inbound links, no zh/ms/ar
twins, nothing to repoint.

## 8. Left for whoever takes this folder next

`content/en/applets/sales-workflow/` is 30 pages, of which **20 have no `applet_code:` front
matter** — the lanes never reached it. Ten of those are `internal-*` documents whose registry rows do
exist and whose pages are probably fine in outline; but this folder is where the one wholly-invented
applet page was found, so the other 19 deserve the registry check first, before anyone reads a word
of their bodies.
