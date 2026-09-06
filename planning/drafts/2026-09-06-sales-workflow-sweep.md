---
date: 2026-09-06
unit: sales-workflow lane sweep
scope: content/en/applets/sales-workflow/ (30 pages + _index)
adr: decisions/0002-applet-existence-and-naming.md, decisions/0007-built-but-unregistered-applets.md, decisions/0008-verify-or-unpublish.md
---

# Sales workflow sweep — pass 1 (registry triage) and pass 2 (rebuilds)

## Pass 1 — registry triage, all 30 pages

Source of truth: `bl_applet_hdr` in `akaun_master`, read 2026-09-06 (236 rows: 209 ACTIVE,
26 DELETED, 1 INACTIVE). Matching was attempted by `code`, by `name`, by
`property_json->>'routerLink'`, by `property_json->>'es_module_url'` and by the dev-only
`appletGuid` in each repo's `main.ts`. Repos checked under `/home/marketing/repos/refs/`.

Legend — **Row**: ACTIVE registry row found · **Repo**: source repo present in `refs/` ·
**Title**: page title equals the registry `name` exactly (ADR-0002 §2).

| # | page | registry code | registry name | Row | Repo | Title before | now |
|---:|---|---|---|:--:|:--:|---|---|
| 1 | car-workshop-applet | `carWorkshopApplet` | Car Workshop Applet | ✅ | ✅ | ✅ | ✅ |
| 2 | commission-scheme-applet | `Commission_Scheme` | Commission Scheme | ✅ | ✅ | ❌ | **archived — duplicate of /applets/membership/** |
| 3 | custom-processor-applet | `custom-processor-applet` | Custom Processor Applet | ✅ | ✅ | ✅ | ✅ |
| 4 | customer-consignment-applet | `customerConsignmentApplet` | Customer Consignment Applet | ✅ | ✅ | ✅ | ✅ |
| 5 | daily-cashier-report-applet | `dailyCashierReports` | Daily Cashier Reports | ✅ | ✅ | ❌ | ✅ fixed |
| 6 | external-sales-invoice-applet | — | — | ❌ **no row** | ✅ | — | already `draft: true` (unpublished earlier today) |
| 7 | internal-consignment-billing-applet | `internalConsignmentBillingApplet` | Consignment Billing Applet (Internal) | ✅ | ✅ | ❌ | ✅ fixed |
| 8 | internal-delivery-order-applet | `InternalDeliveryApplet` | Delivery Order Applet (Internal) | ⚠️ ACTIVE but customer-namespaced bundle | ❌ none | ❌ | ✅ fixed — see Q-0094 |
| 9 | internal-delivery-order-processing-applet | — | — | ❌ **no row** | ✅ (HEAD 2026-08-24) | — | left live pending Q-0093 |
| 10 | internal-jobsheet-applet | `Internal_job_sheet` | Job Sheet (Internal) | ✅ | ✅ | ❌ | ✅ **rebuilt from source** |
| 11 | internal-outbound-delivery-order-applet | — | — | ❌ **no row** | ✅ (HEAD 2026-09-01) | — | left live pending Q-0093 — **22 inbound links** |
| 12 | internal-sales-credit-note-applet | `InternalSalesCreditNote` | Sales Credit Note (Internal) | ✅ | ✅ | ✅ | ✅ (already rebuilt by an earlier lane) |
| 13 | internal-sales-debit-note-applet | `InternalSalesDebitNote` | Sales Debit Note (Internal) | ✅ (a DELETED row shares the code) | ✅ | ✅ | ✅ (already rebuilt) |
| 14 | internal-sales-gin-applet | `internalSalesGINApplet` | Sales GIN (Internal) | ✅ | ✅ | ✅ | ✅ + `applet_code` added, tier-1 fixes |
| 15 | internal-sales-gin-stock-out-applet | — | — | ❌ **no row** | ✅ (HEAD 2026-08-31) | — | left live pending Q-0093 |
| 16 | internal-sales-grn-applet | `internalSalesGRNApplet` | Sales GRN (Internal) | ✅ | ✅ | ❌ | ✅ **rebuilt from source** |
| 17 | internal-sales-inquiry-applet | `internal_sales_inquiry_applet` | Sales Inquiry (Internal) | ✅ | ✅ | ❌ | ✅ fixed |
| 18 | internal-sales-invoice-applet | `salesInvoiceApplet` | Sales Invoice (Internal) | ✅ | ✅ | ✅ | ✅ (already rebuilt) |
| 19 | internal-sales-invoice-no-stock-out-applet | — | — | ❌ **no row** | ✅ (HEAD 2026-07-15) | — | left live pending Q-0093 |
| 20 | internal-sales-order-applet | `erp_internal_sales_order_applet_v2` | Sales Order (Internal) | ✅ | ✅ | ✅ | ✅ (already rebuilt) |
| 21 | internal-sales-proforma-invoice-applet | `internalSalesProformaInvoiceApplet` | Sales Proforma Invoice (Internal) | ✅ (a DELETED near-twin exists) | ✅ v1 shipped | ❌ | ✅ fixed |
| 22 | internal-sales-quotation-applet | `InternalSalesQuotationApplet` | Sales Quotation (Internal) | ✅ | ✅ | ✅ | ✅ (already rebuilt) |
| 23 | internal-sales-refund-note-applet | `internalSalesRefundNoteApplet` | Sales Refund Note Applet (Internal) | ✅ | ✅ **v3 is what ships** | ❌ | ✅ fixed |
| 24 | internal-sales-return-applet | `internalSalesReturnApplet` | Sales Return (Internal) | ✅ | ✅ | ✅ | ✅ (already rebuilt) |
| 25 | pos-general-applet | `posGeneral` | POS General | ✅ | ✅ | ✅ | ✅ (already rebuilt) |
| 26 | recurring-sales-invoice-applet | `recurringSalesInvoiceApplet` | Recurring Sales Invoice Applet | ✅ | ✅ v1 shipped | ✅ | ✅ + `applet_code` added |
| 27 | sales-commission-applet | `salesCommissionApplet` | Sales Commission Applet | ✅ | ✅ | ❌ | ✅ fixed |
| 28 | sales-contract-applet | `salesContractApplet` | Sales Contract Applet | ✅ | ✅ | ✅ | ✅ + `applet_code` added |
| 29 | sales-report-applet | `salesReport` | Sales Report | ✅ | ✅ | ✅ | ✅ (already rebuilt) |
| 30 | sales-report-supplier-access-applet | `SalesReportSupplierAccess` | Sales Report Supplier Access | ✅ | ✅ | ❌ | ✅ fixed |

**Totals.** 25 of 30 pages map to an ACTIVE registry row. **Five do not**: one was already
unpublished this morning (external-sales-invoice) and four are new. One further page
(internal-delivery-order-applet) has an ACTIVE row whose bundle is served from a customer-namespaced
S3 prefix and has no repository at all — an exclusion-list candidate, not a documentation gap.

Before this pass, 20 of the 30 carried no `applet_code`. Twelve now do; the four unregistered ones
cannot, and external-sales-invoice is unpublished. Nine titles were not the registry name and are
now.

### What the registry told us that the pages did not

Three applets ship a **different bundle** from the repo their name implies. Read
`property_json->>'es_module_url'` before choosing a repo to document from:

| registry code | bundle actually served |
|---|---|
| `internalSalesRefundNoteApplet` | `…/internal-sales-refund-note-applet-**v3**/prod/…` (repos v1, v2 and v3 all exist in `refs/`) |
| `internalSalesProformaInvoiceApplet` | the **v1** bundle, although a v2 repo exists |
| `recurringSalesInvoiceApplet` | the **v1** bundle, although a v2 repo exists |
| `InternalDeliveryApplet` | a **customer-namespaced** prefix, not `bigledger/wavelet-erp/…` |

## Pass 2 — what was rebuilt

### `internal-sales-grn-applet.md` — rebuilt from source (1,090 → 286 lines, of which 45 are the sources map)

Ranked 5th on `planning/audit-backlog.md` (risk 466) and the highest-risk live page in this folder.
Everything load-bearing about it was wrong in one direction.

**The tier-1 finding.** `INTERNAL_SALES_GOODS_RECEIVED_NOTE` carries **quantity signum 0 and amount
signum 0** and has no entry in `JournalPostingTypeHandler`. The document moves no stock and posts no
journal. The old page promised "inventory precision", "real-time stock movements as goods are
returned to warehouse locations", costing reconciliation "using MAUC, FIFO, or manual cost methods",
and finance teams "reconciling returns against posted invoices with precision". Three independent
citations agree: `InternalSalesGoodsReceivedNoteDataConsistencyObject.java:17-18`,
`ServerDocTypes.java:30` (`INTERNAL_SALES_GOODS_RECEIVED_NOTE(0,0)`), and the applet's own
`models/constants/applet-constants.ts`.

Also corrected: the page described a **VOID** — the string does not appear anywhere in the repo; the
lifecycle is DRAFT → FINAL only, one-way. It described a "Return Tracking" screen — the left menu has
exactly three entries (Internal Sales GRN, Line Items, Audit Trail).

The rebuilt page carries a per-section `sources:` map, the standard posting-proof block, the real
menu and tab inventory, the four-proof settings intersection (33 keys render; 55 declared keys do
not), the 21 seeded client-side permissions, and troubleshooting rows drawn from the actual
validators.

### `internal-sales-gin-applet.md` — tier-1 corrections

Same error class, same direction. `INTERNAL_SALES_GOODS_ISSUED_NOTE` is also 0/0. The page said a
GIN "confirms stock is leaving" and hedged the FAQ with "exact stock ledger timing is defined by your
ERP configuration". Eleven statements corrected, a posting-proof callout added, and a
`sources: lifecycle:` map added. The rest of the page (screens, procedures, fields) remains
unaudited and keeps no `sources:` claim for those sections.

### `internal-jobsheet-applet.md` — rebuilt from source (719 → 290 lines, of which 44 are the sources map)

Backlog rank 203, 18 inbound links. Same tier-1 error class as the GRN and GIN pages, plus two of
its own.

**Stock and journal.** `INTERNAL_JOBSHEET` is `(0,0)` (`ServerDocTypes.java:66`,
`InternalJobsheetDataConsistencyObject.java:16-17`, the applet's `applet-constants.ts`) with no
journal posting handler. The old page said the Lines tab "deducts stock from inventory if physical
parts are used" and that FINAL deducts "any stock-tracked line items ... at the Location selected on
Main Details". Neither happens.

**The Convert tab.** The old page said finance "converts the Jobsheet into a Sales Invoice" and that
"line items, account details, and pricing flow directly from the Jobsheet into the Invoice". The tab
has one button labelled *CONVERT TO INTERNAL RECEIPT VOUCHER*, under the hint *"This will cancel the
current job sheet"*, and its effect does neither: it re-PUTs the same document with
`status = 'ACTIVE'` — the TEMP→ACTIVE promotion SAVE already performs. Filed as **P-0108**.

**Approval.** The page framed FINAL as "approve the jobsheet for processing by the finance
department". There is no approval engine for this document (`kb/topics/document-approval.md`), and
the applet's own `HIDE_APPROVAL_CODE` / `MANDATORY_APPROVAL_CODE` settings are **card authorisation
codes** on the Payment tab, sitting beside `HIDE_CARD_NO` and `HIDE_CVV`. Exactly the four-meanings
trap.

**Permissions.** 24 codes seeded, 27 checked. Five are checked but never seeded — including
`SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON` and `SHOW_GENDOC_DISCARD_BUTTON`, so the
per-role escape hatch for those three buttons can never be granted (**P-0109**). Two are seeded but
never read. And the technician label is spelled **Techniqian** throughout the UI (**P-0110**), which
the page now documents as-is because that is what a reader sees.

The rebuilt page carries the twelve-tab inventory with each tab's hide key, the 72-of-127 settings
intersection grouped by purpose, both applet-local settings screens (Branch Settings, Workflow
Settings), the field table, and the posting-proof block.

### `commission-scheme-applet.md` — archived as a duplicate

`Commission_Scheme` already had a fully sourced page at `/applets/membership/commission-scheme-applet/`
— which is also the registry's own `documentation_url` target. The sales-workflow copy was archived
to `planning/archive/2026-09-06-sales-workflow/`, an alias added to the membership page, and the four
inbound links repointed in the same change. Worklog:
`planning/worklog/2026-09-06-sales-workflow-commission-scheme-duplicate.md`.

## The pattern worth carrying forward

The **registered** GIN/GRN applets are the inert ones, and the document types that actually move
stock on the sales side are served by applets with **no registry row**:

| type | signums | applet registered? |
|---|---|---|
| `INTERNAL_SALES_GOODS_ISSUED_NOTE` | 0 / 0 | yes |
| `INTERNAL_SALES_GOODS_RECEIVED_NOTE` | 0 / 0 | yes |
| `INTERNAL_SALES_GIN_STOCK_OUT` | qty −1, amt +1 | **no** |
| `INTERNAL_SALES_GRN_STOCK_IN` | qty +1, amt −1 | **no** |
| `INTERNAL_SALES_INVOICE_NO_STOCK_OUT` | qty 0, amt +1 | **no** |

That symmetry is why the four unregistered pages were **left live** rather than taken down. Their
content is broadly *correct* — the gin-stock-out page rightly says FINAL reduces stock — which is
evidence for a registration gap rather than for invented documentation. ADR-0007 is still `proposed`;
taking four more pages down under it, on top of the commission-scheme archive, would reach the
ADR-0008 five-page guard rail. Routed as **Q-0093** instead.

Recorded in `kb/topics/sales-gin-grn-no-ledger-effect.md`.

## Findings routed

| id | register | what |
|---|---|---|
| Q-0093 | questions | Four more built-but-unregistered applets — and they are the ones that move stock |
| Q-0094 | questions | Is `InternalDeliveryApplet` customer-specific? Customer-namespaced bundle, no repo |
| P-0105 | product | `internalSalesGRNApplet` missing from the shared settings screen's `tabMappings`; 55 declared keys never render |
| P-0106 | product | Sales GRN ships a second, unrouted settings screen — dead code |
| P-0107 | product | Member Card is `Validators.required` on Sales GRN; a non-member's return cannot be recorded |
| P-0108 | product | Job Sheet's Convert button is labelled "convert to internal receipt voucher" and performs a TEMP→ACTIVE save |
| P-0109 | product | Job Sheet checks five client-side permission codes that have no definition row — FINAL/VOID/DISCARD escape hatch is dead |
| P-0110 | product | "Techniqian" misspelled throughout the Job Sheet UI |
| F-0403 | feedback | GRN page premise wrong (done this pass) |
| F-0404 | feedback | GIN page premise wrong (done this pass) |
| F-0405 | feedback | Commission Scheme duplicate (done this pass) |
| F-0406 | feedback | 20 pages without `applet_code`, 9 wrong titles (done this pass) |
| F-0407 | feedback | Four pages for unregistered applets (open, pending Q-0093) |
| F-0408 | feedback | "A standard invoice automatically generates a Goods Issue Note" — wrong mechanism (open) |
| F-0409 | feedback | Screenshots needing a quarantine decision |
| F-0410 | feedback | Jobsheet page premise wrong (done this pass) |

## Screenshots — checked by eye

- `/images/internal-sales-grn-applet/main-details.png` — Branch reads `05SS | ONE LIVING SS2`, which
  reads as a real customer branch rather than test data. **Quarantine candidate.** Not referenced by
  the rebuilt page.
- `/images/internal-sales-grn-applet/tab-lines.png` — item grid shows `Digi External Item` (a real
  customer brand, with its own applets in the registry) and several `kawsar Test …` items carrying a
  developer's given name. **Quarantine candidate.** Not referenced by the rebuilt page.
- `/images/internal-sales-grn-applet/grn-listing.png` and `tab-settlement.png` — STAGING_TENANT,
  empty grids, no names. **Safe**; both are used on the rebuilt page.
- Site-wide pattern, not this folder's alone: every akaun screenshot carries a real person's
  **profile photograph** in the top-right avatar. Small, but a photograph of an identifiable person
  on a public site. Worth one decision for the whole wiki.

## Not done — the queue for the next unit

In descending order of what a reader can act on:

1. `internal-sales-invoice-no-stock-out-applet.md` (454 lines) — pending Q-0093, but the content is
   good and F-0408 is a single-paragraph fix if it stays.
2. `internal-consignment-billing-applet.md` (705 lines) — ACTIVE, repo present, unaudited.
3. `internal-sales-inquiry-applet.md` (521 lines) — ACTIVE, repo present, unaudited.
4. `internal-sales-proforma-invoice-applet.md`, `internal-sales-refund-note-applet.md` — ACTIVE,
   unaudited, and both must be read from the correct bundle (see the table above).
5. `internal-delivery-order-applet.md` — a 12-line stub for an ACTIVE applet; blocked on Q-0094.

## Method notes for `planning/lanes/METHOD.md`

Three things this run would have saved time knowing:

- **Check `property_json->>'es_module_url'` before choosing a repo.** Repo name ≠ shipped bundle for
  at least four sales applets, and one of them ships a v3.
- **Each applet restates its own signums** in `src/app/models/constants/applet-constants.ts`. That is
  a one-line check before opening the Java tree, and it agreed with the backend in every case here.
- **The plain GIN/GRN family is 0/0 on both sides** (extends METHOD §14 and §22 from Purchase GIN to
  Sales GIN, Sales GRN and Purchase GIN alike). The stock-moving variants are separate
  `*_STOCK_IN` / `*_STOCK_OUT` document types.

---

# Pass 3 — five more rebuilds (second unit, 2026-09-06)

Continued from the queue at the end of pass 2, in descending order of reader risk. Five pages
rebuilt from source; nothing unpublished (well inside the ADR-0008 guard rail).

| page | before | after | what was false |
|---|---:|---:|---|
| `internal-consignment-billing-applet` | 704 | 300 | **Direction inverted.** Documented as a sales/AR document; it is a purchase/AP document |
| `internal-sales-inquiry-applet` | 521 | 290 | VOID that does not exist; four export formats of which three are disabled; Convert described as "completing" a document it deletes; an invented history tab |
| `internal-sales-refund-note-applet` | 172 | 300 | Three overstated guarantees; missed that e-Invoice removes VOID entirely; read from the wrong repo |
| `daily-cashier-report-applet` | 85 | 200 | Screenshots of a different applet; user-guide voice on a reference page; nothing about what the Z Report counts |
| `sales-commission-applet` | 218 | 250 | "Cycle period locking", "1-click conversion" and a "zero double-payout guarantee" that is real but is a queue flag, not a lock |

## The tier-1 finding of this pass

**`internal-consignment-billing-applet` documented the document backwards.** The page said the applet
"converts Goods Issue Notes into final sales invoices", that finalising "moves the asset from
Consignment Out to Revenue", and that VOID removes "the AR entry".

The applet's server document type is `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`, short code `CSGINV`,
**amount signum −1**. Its internal route is `internal-purchase-invoice`. Its entity picker is
titled *Select Supplier*. Its file import posts to the internal **purchase** invoice endpoint. Its
journal is Dr Purchase / Dr Input Tax, Cr Creditor, plus Dr `CONSIGNMENT_LIABILITY` /
Cr `CONSIGNMENT_STOCK`. There is no debtor line, no sales line and no output tax anywhere in it.

It is the **consignor's bill to you**: stock arrives on a Consignment GRN and is held as consignment
stock against a consignment liability; when it sells, this document clears that pair and creates a
real payable. It also moves no stock — the backend forces every line's quantity signum to 0, even
though the applet sends 1.

Recorded in `kb/topics/consignment-billing-is-a-purchase-document.md`. The page is still filed under
`sales-workflow/`; moving it is a structural change, so it is Q-0125 rather than a silent move.

## Two method corrections this pass produced

1. **METHOD §32 needs a caveat.** "Every applet restates its own signums and it agreed with the
   backend in every case checked" now has two counterexamples, in opposite directions — Consignment
   Billing (applet says qty 1, DCO says 0) and Sales Refund Note (`ServerDocTypes` says qty 0, DCO
   says +1). The DCO wins both times, because `fillQuantitySignumAndAmountSignumForLine` **overwrites**
   rather than fills. Recorded as METHOD §35 and, for the refund note, as P-0135.
2. **The "consumed" proof should be built from the rendered list, not a prefix regex.** Three keys
   were missed on the first pass of each applet: keys read by indirection
   (`appletSettings[panel.expandSetting]`), keys not starting with `HIDE_`/`SHOW_`
   (`VERTICAL_ORIENTATION`), and a typo'd accessor that is real in two repos
   (`appletSettinsgMain.HIDE_KO_FOR_TAB`). METHOD §38.

## The pattern that repeats across all five

Two settings defects turned up on almost every applet, and both change how the Configuration section
has to be worded:

- **`tabMappings` gaps.** `internalConsignmentBillingApplet`, `internalSalesRefundNoteApplet` and
  `internal_sales_inquiry_applet` are all absent from `FieldConfigurationComponent.getTabValue()`'s
  map, so between them fifteen tab-hide keys and two menu-hide keys are read at runtime with no
  control anywhere. Same class as P-0105 (Sales GRN). Now P-0133.
- **Client-side permissions seeded for nobody.** `bl_applet_client_side_perm_dfn` holds **zero** rows
  for `internalConsignmentBillingApplet` (43 codes checked), `recurringSalesInvoiceApplet`,
  `salesContractApplet`, `salesCommissionApplet` and `SalesReportSupplierAccess`, and **one** row for
  `internalSalesRefundNoteApplet` against 45 checked. Consequence, worth stating on every page: a
  `HIDE_*` setting is absolute — hide FINAL and nobody can post, with no per-role exception. Now
  P-0134. (`internal_sales_inquiry_applet` and `dailyCashierReports` are the two that are seeded
  properly, which is what makes the others diagnosable rather than a platform-wide truth.)

And a third, new: **mock screens shipped in production**. Both Sales Inquiry and Consignment Billing
carry an **Issue Link** tab fed by one hard-coded row, and behind Sales Inquiry's sits a nine-screen
Jira-style **Edit Issue** sub-application in which no component makes a single HTTP call. Daily
Cashier Reports has eight unbound toggles on its settings screen and a third report screen that
cannot be reached from the menu. Written up as a class in
`kb/topics/mock-screens-shipped-in-production.md` with a test for each of four shapes.

## Settings coverage measured (four proofs, per applet)

| applet | declared | pass all four | notes |
|---|---:|---:|---|
| `internalConsignmentBillingApplet` | 103 | 52 | 19 read with no control, of which 8 are tab-hide keys |
| `internal_sales_inquiry_applet` | 86 | 31 | `EXPAND_CONTRA` is read but the screen only offers `EXPAND_MAIN_CONTRA` |
| `internalSalesRefundNoteApplet` | 165 | 101 | the richest settings surface in the folder |
| `dailyCashierReports` | — | 5 | applet-local screen; 8 of its 13 controls are unbound |
| `salesCommissionApplet` | 35 | **3** | 32 keys appear only in the model file (P-0138) |

## Screenshots checked by eye

Fourteen consignment-billing images, three sales-inquiry, two refund-note, four commission, five
POS-General (used by the cashier page). Quarantine candidates recorded as **F-0452**; two of the
three are now unreferenced because the rebuilt pages do not use them.

## Findings routed this pass

| id | register | what |
|---|---|---|
| P-0131 | product | Consignment Billing's KO For advanced search filters on the wrong document type — the grid always empties |
| P-0132 | product | A mock Jira clone ships in production in two applets (Issue Link → Edit Issue) |
| P-0133 | product | Two more applets missing from the shared settings screen's `tabMappings` |
| P-0134 | product | Five applets check client-side permissions seeded for none of them |
| P-0135 | product | `ServerDocTypes` and the DCO disagree on the sales refund note's quantity signum |
| P-0136 | product | Daily Cashier Reports ships a third report screen that cannot be reached |
| P-0137 | product | Eight unbound toggles on the Daily Cashier Reports settings screen |
| P-0138 | product | 32 of Sales Commission's 35 declared settings are model-only |
| P-0139 | product | Sales Commission tags printable formats with a misspelled, non-existent document type |
| Q-0125 | questions | Should the consignment-billing page move to `purchase-workflow/`? |
| Q-0126 | questions | Four applets point `documentation_url` at Confluence, two at nothing |
| F-0447…F-0451 | feedback | One item per rebuilt page (all done this pass) |
| F-0452 | feedback | Four more screenshots needing a quarantine decision (open) |

## Not done — the queue for the next unit

1. `internal-sales-proforma-invoice-applet.md` (294 lines) — ACTIVE, unaudited, **0 inbound links**,
   and the registry serves the **v1** bundle although a v2 repo exists. Lowest reader risk of the
   remaining unaudited pages, which is why it was skipped in favour of the commission page.
2. `sales-report-supplier-access-applet.md` (270 lines) — ACTIVE, unaudited, zero seeded client-side
   permissions (already confirmed for P-0134), 2 inbound links.
3. `recurring-sales-invoice-applet.md` (129) and `sales-contract-applet.md` (169) — ACTIVE,
   unaudited, both serve the **v1** bundle, both with zero seeded permissions.
4. `internal-delivery-order-applet.md` — still a 12-line stub with 8 inbound links, blocked on
   Q-0094 (customer-namespaced bundle, no repo).
5. `car-workshop-applet.md`, `custom-processor-applet.md`, `customer-consignment-applet.md` — not
   examined by either pass.
6. F-0408 on `internal-sales-invoice-no-stock-out-applet` is still a one-paragraph fix, still held
   behind Q-0093.
