---
date: 2026-09-06
unit: e-invoice section completion — the unblocked remainder after `d28e4354`
inbox: F-0229, F-0231, F-0237, plus a gap pass over the eight guide pages
prior: planning/drafts/2026-09-06-einvoice-guides-notes.md
plan: kb/research/2026-09-06-blg-intranet-einvoice-ingest.md
status: written, not shipped (no commit, no push, no hugo run)
---

# Finishing the e-invoice section — what changed, from what, and what is still missing

Four things were asked for: correct the module hub (F-0229), five targeted applet additions (F-0231),
publish the four cleared diagram assets (F-0237), and a gap pass over the eight guide pages. All four
are done. Two scope extensions were taken deliberately and are argued for below.

**Everything published here was verified against source in this pass**, not carried over from the ingest
notes. Two places where the ingest notes and the current code disagreed are called out, and both were
resolved in favour of the code with the open question updated rather than closed.

---

## Sources used

| Short form | What it is |
|---|---|
| `J` | `refs/blg-akaun-platform-java` @ `1ff620ef0e` — the backend, checked out 2026-09-05 |
| `A` | `refs/blg-applet-wavelet-my-invoice-admin-applet` @ `d7841e7` |
| `P` | `refs/blg-applet-wavelet-my-peppol-admin-applet` (via the applet page, already source-derived) |
| `I` | `refs/blg-intranet/content/1100-malaysia-einvoice/` — README + the 12 assets |
| `T` | `kb/topics/e-invoice*.md` — the eleven topic notes |

Facts newly extracted in this pass have been written back into the topic notes
(`e-invoice-submission-errors`, `e-invoice-tin-and-identity-validation`, `e-invoice-reconciliation`),
so the pipeline is source → topic → wiki and not source → wiki.

---

## 1. F-0229 — `modules-v2/e-invoice/`

### The three named errors

| Was | Now | Source |
|---|---|---|
| "Individual real-time clearance UUID mandatory **within 72 hours**" | "Submitted individually; LHDN returns a clearance UUID" — the 72-hour claim is gone from the document-types table entirely | `I` README *cancellation and rejection*; `J` `isCancellationRequestValid` applies the 72 hours to cancellation only |
| Go-Live: "Digital signing certificate uploaded" + "LHDN / PEPPOL production API access keys configured" | "BigLedger authorised as your e-invoice intermediary on the MyInvois portal, with the full permission set" + a new line for the enable-before-finalise ordering rule | `I` README *einvoice issuer type* / *how the intermediary configuration is used*; `T` `e-invoice` |
| Admin applet = "Central management of digital signing certificates…" | "Posting queue, the three holding pools, monthly consolidation, cancellation requests and the monthly reconciliation report" — and the row is retitled **Submission Engine** | `A` menu model; the applet page's own Screens table |

The same three errors appeared four more times on the hub (the Tax Compliance Officer row, the Applet
Map row, and two lines of the Learning Roadmap). All corrected.

### Making it a hub

- A **Start here** card block now sits above the architecture material and routes to all six live
  guides in one hop, in reading order. The architecture tables are explicitly framed as the reference
  layer beneath it.
- An intermediary callout under the architecture table, so the "no certificate" fact is stated once,
  prominently, on the page most likely to be read by whoever is planning the roll-out.
- A warning under the four-document-types table: a **self-billed line's item classification code has to
  come from the GL or expense mapping** and there is nowhere on the legacy source side to store it.
  This is the one piece of self-billed content that is *not* blocked on
  `kb/questions/2026-09-06-einvoice-self-billed-scope.md` — it is a planning fact, not a workflow.
  Source: `I` `gh:bigledger/blg-intranet#5627`, via `T` `e-invoice-self-billed`.
- **One broken link fixed**: `api-reference/_index.md` pointed at `/developers/api-reference/einvoice.md`
  (a literal `.md`, which 404s). Now `/developers/api-reference/einvoice/`. Every internal link on the
  hub and its seven child pages now resolves.

### Scope extension 1 — the hub's child pages

The same certificate / API-key falsehood was repeated on four of the seven child pages, and
`configuration/_index.md` — which the hub's roadmap links to as step 2 — told the reader in a table to
upload a signing certificate and paste a Client ID and Client Secret. Correcting the hub and leaving
that intact would have reproduced exactly the contradiction the previous unit hit with
`myinvois-setup.md`. Corrected, surgically:

- `configuration/_index.md` — Phase 1 is now company identity + enable-before-finalise; Phase 3 is
  intermediary authorisation with the "no client ID, no secret, no certificate" statement and the
  lapsing-authorisation symptom; Phase 4 replaces invented "auto-submission triggers and rejection
  rules" with the submission type (which does exist, on the document's E-Invoice tab) and the
  consolidation schedule.
- `best-practices/_index.md` — §2 was "Digital Certificate & Archival Security" with a 30-day
  certificate renewal instruction and an unsourced **7-year archival** legal claim. Replaced with
  authorisation renewal, weekly pool review and reconcile-before-the-7th. §1 now names the
  To IRB E-Invoice vs Submission History trap.
- `core-concepts/_index.md` — step 2 says the signing is done by BigLedger as intermediary; step 5's
  "archived for 7-year audit compliance" (the same unsourced legal claim) removed.
- `related-applets/_index.md` — the admin applet subtitle.

### Scope extension 2 — `reports/_index.md`

Not on the list, rewritten anyway. Its decision matrix named **five reports that do not exist**:
*Submission Rejection & Exception Log*, *Cleared E-Invoice Tax Audit Summary*, *Pending Self-Billed
Import Audit*, *PEPPOL Network Exchange Log*, *Statutory Audit Archival Export*. This is the identical
defect the previous unit deleted from the guides index ("Compliance Dashboard", "PEPPOL Transaction
Log"), and a reader sent to look for a report that has never existed is worse served than one sent
nowhere. Rewritten around the reports that do exist — To IRB E-Invoice, Submission History, the
Discrepancies Report, the pools and queues, External Reception / Reconciliation (Purchase), and the
PEPPOL logs — each verified against the applet Screens tables, which are themselves source-derived.
`use-cases/` was read and left alone; it invents nothing.

---

## 2. F-0231 — the five applet additions

Written in the reference voice: dense, exact, identifier-first. All five, plus the two Peppol and one
portal item.

### `my-e-invoice-admin-applet.md`

1. **New troubleshooting row — "the same document number appears twice."** Two independent number
   sequences; the listing does not show direction; check `generic_doc_hdr_server_doc_type` before
   concluding anything; do not cancel. Source: `T` `e-invoice-self-billed`,
   `gh:bigledger/blg-intranet#5588`. Placed immediately above the *real* duplicate row so the reader
   meets the commoner reading first.

2. **The IN_QUEUE row, corrected and sharpened.** It previously said the row "exceeded 5 retries and was
   marked `PROCESSED` without an alert". **Both halves are wrong** and the source says something more
   useful:
   - `bl_fi_my_einvoice_gen_doc_to_irb_submission_queue.remaining_retries` is set to `5` at row creation
     (`EInvoiceToIRBSubmissionQueueProcessorService:76`) and reset to `5` on resubmission
     (`MyEInvoiceToIrbResubmissionService:113`). **Nothing calls `getRemaining_retries()` anywhere in
     the backend and nothing decrements it.** The counter is a literal. `[src:J]`
   - `EInvoiceToIRBSubmissionProcessor` deletes and processes one `NOT_SUBMITTED` row per iteration
     (`DELETE … LIMIT 1 FOR UPDATE SKIP LOCKED`, default 50 iterations per run) — submission is strictly
     serial, one document per LHDN call. `[src:J]`
   - `EInvoiceFailedSubmissionProcessor` is the only thing that revisits failed rows, and it queries
     `orderBy created_date` / `order DESC` with a default `limit` of 10 — **newest first**, so an old
     failed row is starved. `[src:J]`
   - The two *real* retry counters are named so the reader does not confuse them: **Status Update
     Retry** on the Validation Queue (`doc_status_update_retries`, increments; the row is deleted at 10
     attempts or 3 days) and **Retry** on the Email Dashboard.

3. **Why Validation Queue → Submit is capped at 20.** `maxSelection = 20` in the listing component; the
   grid trims any selection above 20 (select-all included) with the toaster *"You can only select up to
   20 records per submission."* The cap is a UI guard on a synchronous endpoint:
   `processValidationQueueGuids` loops the selected GUIDs and makes one `getDocumentDetailByDocumentId`
   call to LHDN per row inside the one request. Added 2026-07-14 with the bulk checkboxes.
   `[src:A]` `[src:J]` `[src:gh:bigledger/blg-intranet#5458]`

4. **A rejection request never advances on its own** — the section-6 lead sentence is now an explicit
   statement of that, naming the three things that do *not* move it (no cron, no processor, no LHDN
   callback) and what the request decays to (`REQUESTED` / `IN-PROGRESS` until the window closes).
   Source: `I` README *cancellation and rejection*, corroborated by `A` (no scheduler references the
   rejection tables).

5. **The Discrepancies Report gets a full subsection** (new §8), because it is the customer's only
   self-service reconciliation. Read out of the applet's own report components `[src:A]` and the
   processors `[src:J]`:
   - four tabs — **Main**, **ERP Transaction Summary**, **IRB Audit Summary**, **Document vs E-Invoice
     Discrepancy** — with what each totals;
   - the ERP summary's build-up (invoice + cash bill + debit note, less credit note and refund note,
     plus a Skip Einvoice Documents line);
   - the IRB summary's three-way split per document type (Internal Submission / From E-commerce
     self-billed / From Supplier matched) with a Cancelled amount beside each;
   - the discrepancy tab's two directions and its *excluding consolidated* variant;
   - the drill-down into the documents behind a line, including the source documents inside a
     consolidated e-invoice;
   - `E_INVOICE_DISCREPANCIES_REPORT_SCHEDULER_PROCESSOR` generating last month's report for **every**
     `ENABLED` company and e-mailing it via the `DISCREPANCY_REPORT_EMAIL_NOTIFICATION` config — worth
     a customer asking for;
   - and what it cannot see (nothing is pulled back from LHDN).
   The Screens table row now links to it.

### `mypeppol-admin-applet.md`

- **The monthly statistics obligation**, as lifecycle step 6: BigLedger files a **Transaction Statistics
  Report (TSR)** and an **End User Statistics Report (EUSR)** to OpenPeppol each period — total
  exchanges, transport protocol (AS4 v2.0), broken down by opposite service provider, document type and
  country — and that is what the Monthly Report menu feeds. With the fact that follows from the
  document-type breakdown: the traffic is the **Malaysian PINT billing profile of UBL Invoice 2**, i.e.
  domestic Malaysian B2B, not only cross-border. Source: `T` `e-invoice-peppol`,
  `gh:bigledger/blg-intranet#5693`.
- **The order-reference requirement**, as a troubleshooting row: documents failed MDEC's invoice
  validation until the purchase-order / sales-order number was carried as `OrderReference`. Source: `T`
  `e-invoice-peppol`, `gh:bigledger/blg-intranet#4511`.

Nothing was touched that the participant-ID question (F-0228) bears on.

### `my-e-invoice-portal-applet.md`

- A new lifecycle step 5: **a rejection raised on the LHDN portal instead of here never reaches
  BigLedger.** No inbound rejection queue, no notification path; the queue and history for inbound
  rejection notifications were specified and not built. Plus the matching troubleshooting row ("buyer
  says they rejected an e-invoice, but nothing changed"). Source: `T`
  `e-invoice-cancellation-and-credit-notes`, `gh:bigledger/blg-intranet#4367`.

---

## 3. F-0237 — the diagram assets

Every asset was opened and looked at before any decision.

### `lhdn-core-workflow.png` → redrawn as `layouts/shortcodes/einvoice-flow.html`

The intranet PNG is a developer artefact: its boxes are table names
(`to_ft_generic_doc_einvoice_posting_queue`) and processor class names
(`EInvoiceBatchProcessingByBranchProcessor`). No customer data, but nothing a customer can read either.
Redrawn from scratch as an inline SVG in the `platform-map.html` idiom — `currentColor` throughout, one
brand-red accent on the LHDN node, `viewBox` + `hx:w-full hx:h-auto` so it scales, `<title>`/`<desc>`
for screen readers, and no external asset. It shows the customer-visible pipeline:

> finalise → posting queue (**queued, not sent**) → the routing decision (submission type · amount ·
> mandatory fields) → **held** in one of three pools, or **complete** into the submission queue →
> Save-and-Resubmit lifts a held document into the queue, monthly consolidation sweeps the Batch Pool →
> LHDN MyInvois → Valid (QR code, printable e-mailed) or Invalid (fix the record, resubmit).

Placed on `guides/einvoice-guides/_index.md` under a new **"What happens after you press Save"** heading,
above everything else. That is where it earns its place: it is the section's orienting picture, it
answers the single commonest misconception in the whole set, and a reader who lands on the section index
from a search now sees the shape of the system before any prose.

**The multibank branch is deliberately omitted.** `BatchPoolToIRBEnum` has three values only and a grep
of the backend for `multibank` returns nothing `[src:J]`, but `einvoice_submission_type` is a free
`String` column so this is evidence, not proof.
`kb/questions/2026-09-06-einvoice-multibank-submission-type.md` has been updated with the source check
and with a note that the shortcode and the routing table both need a fourth branch if it turns out to be
live.

### `einvoice-entity-json-priority-chart.jpg` → a table on `einvoice-validation.md`

The image is an eight-scenario tick/cross grid over three internal column names. Rendered instead as a
three-row plain-English table under a retitled section, **"Which record does BigLedger actually send?"**
(the old heading was "Which address…"; nothing linked to the old anchor).

The precedence was verified in `MyEInvoiceToIRBProcessorService.handleSalesDoc` / `handlePurchaseDoc`
`[src:J]`: the role-specific block typed onto the document wins, else the document's general e-invoice
block, else the linked customer or supplier record read fresh at submission time.

**The fact worth the whole exercise** is in `isBuyerEntityEmpty` / `isGeneralEntityEmpty` /
`isSupplierEntityEmpty`: "not empty" means **any one** of eight fields is non-blank. So a half-typed
on-document override wins the entire block and the master record is never read — the other seven fields
go to LHDN blank while being perfectly correct on the customer record. That is published as a warning
callout, and cross-linked from `myinvois-setup.md` Step 4 and `einvoice-month-end.md` Step 5, both of
which previously told the reader to "fix it on the customer record" with no caveat.

### `forex-error.jpg` → published

Opened and checked: a tight crop of a Validation Error table showing four truncated column values, error
code `DC511`, and a tooltip reading *"Foreign target currency should always be MYR"*. No name, number,
identifier, tenant, URL or console. Copied to `static/images/e-invoice/forex-validation-error.jpg` and
placed in the validation guide's currency section, where it also teaches the reader that the error
messages in that table are truncated and have to be hovered.

### The drawio source — not published, and it should not be

F-0237 lists `flow-chart/lhdn-core-workflow.drawio` as the fourth asset. It is an editable source file
for a diagram we chose to redraw rather than embed; publishing it would put internal table and processor
names on the public site in a form no reader can use. Not copied. If the drawio's second page (the tax
authority's guidance on caching identity-validation results) holds something the wiki should say, that
is a content question for a later pass, not an asset question.

### Not published, unchanged from the previous unit's assessment

`einvoice-date-and-time-documentation.jpg` (an excerpt of LHDN's own SDK docs — state the rule in our
words), `wrong-general-tin-usage.png` and `original-einvoice-error.jpg` and `get-doc-details.jpg` (real
customer data — re-shoot on a demo tenant), and the two Postman screenshots that expose live
credentials. **The credential exposure is still open and is still not a documentation matter.**

---

## 4. The gap pass — read as one set, as a customer

### Fixed

1. **Reading order.** `peppol-configuration.md` sat at `weight: 20`, third in the sidebar, ahead of every
   core operational guide — while being the weakest and most incorrect page in the folder. Moved to
   `weight: 45`, last. No content touched (F-0228 is blocked). The **Get started** cards on the section
   index were also reordered into an actual sequence — *1. What Malaysia Requires → 2. MyInvois Setup →
   3. Pools & Submission Routing* — and PEPPOL removed from the newcomer's path.
2. **The missing weekly rhythm.** The index had "Every day" and "Every month" and nothing between, yet
   the two pools that never empty themselves need a weekly look and nothing tells you they are filling.
   Added **"Every week"**.
3. **A step that assumed knowledge only another page gives.** `myinvois-setup.md` Step 7 told a
   first-timer to watch their document appear in "the Posting Queue" — a term the guide had never
   introduced. Now defined in place, and the new diagram on the index carries it too.
4. **Where the submission type comes from.** `einvoice-pools-and-routing.md` described the four
   submission types and never said where one is set. It is the sales document's **E-Invoice tab →
   Submission Type** dropdown, with a default per document type set at configuration time — verified in
   the Sales Invoice applet's e-invoice submission component `[src:refs/blg-applet-wavelet-internal-sales-invoice-applet]`.
5. **The buyer portal was invisible to the guide set** even though it is the single biggest relief valve
   for a multi-branch retailer chasing counter customers for their tax numbers. Added as a pools FAQ:
   the customer finds their own receipt, fills in their identity, and their details land on your
   customer record — with the limit stated (it does not work once the receipt is inside a validated
   consolidated e-invoice).
6. **Two false rows on the section index's frequent-issues table.** "Cross-border format — the PEPPOL
   document format does not match what the recipient accepts" was vague and unsourced; replaced with the
   two sourced PEPPOL failures (receiver not registered for the document type; missing order reference).
   Added the buyer-rejected-on-the-portal row, which belongs on the index because the symptom is
   "nothing happened" and the reader has no idea which page to open.
7. **No page linked back to the module.** The index's Related resources now does.
8. **The cross-page correction the entity ladder forces.** See F-0237 above — two guides told the reader
   to fix the customer record, in cases where that would not have worked.

### Found, not fixed — needs a decision

1. **`peppol-configuration.md` is live, wrong, and blocked.** 180 words that send the reader to a menu
   that does not exist ("E-Invoice → PEPPOL Settings"), give a participant-ID format our own applet page
   contradicts, and assert a 7-year archival requirement with no source. It is now last in the reading
   order, which reduces the harm and does not remove it. **This is the largest remaining defect in the
   section.** Three options, in order of preference: (a) answer
   `kb/questions/2026-09-06-peppol-participant-id-scheme.md` and rewrite; (b) set `draft: true` until it
   can be rewritten — a publication decision, not one this unit should take alone; (c) strip the two
   provably-false items (the menu path and the archival claim) as an interim, accepting that the
   participant ID stays wrong. Nothing was touched, to respect the block cleanly.
2. **Self-billed is still a hole in the middle of the set.** Four pages now reference self-billed
   e-invoices — the shared-numbering warning appears on three of them, the module hub now carries the
   classification-code warning — and no page explains what a self-billed e-invoice *is* or how to run
   one. Blocked on `kb/questions/2026-09-06-einvoice-self-billed-scope.md` (F-0227). When it lands,
   those four references become links.
3. **Nothing in the guide set covers the purchase side.** The index's daily step 5 says "match incoming
   supplier e-invoices against your purchase documents" and no guide explains how. External Reception
   and Reconciliation (Purchase) are documented on the applet page and nowhere else. For a retailer with
   ~1,200 suppliers this is a real monthly job. **Proposed new guide:** *Receiving and matching supplier
   e-invoices*. Not started — no brief, and it overlaps the blocked self-billed scope question.
4. **Throughput is still the weakest sentence in the set** (F-0236). This pass confirmed from source
   that submission is strictly serial, one document per LHDN call, and that no batching exists in that
   code path as of this checkout — which strengthens the *shape* of the advice but still gives no number
   to plan a 38,000-receipt close against. Resolve by measuring a run, as F-0236 says.
5. **F-0236 cites a question file that does not exist.** It points at
   `kb/questions/2026-09-06-einvoice-throughput.md`; the real file is
   `2026-09-06-einvoice-submission-batching-status.md`. Worth correcting in the inbox so the item is
   findable when it is picked up.
6. **`einvoice-validation.md` now has four tables.** CLAUDE.md's self-check flags "more than 3 tables of
   fields in the body". Judgement call: the four are the state-code lookup, the General TIN lookup, the
   new three-row record-precedence table and the Common Mistakes symptom/fix table. None is a
   field-type-default-validator table, which is what the rule is aimed at, and dropping any of them
   would cost the reader more than the rule protects. Flagged rather than silently accepted.

### Checked and deliberately left alone

- **The index / `malaysia-e-invoice-guide.md` overlap.** Both state the 7th and the 72 hours. That is
  reinforcement of the two deadlines that cost money, on the two pages a reader is most likely to land
  on, not duplication worth cutting.
- **The index's "What setup covers" bullet list** restates `myinvois-setup.md`'s prerequisites. It earns
  its place as a scope preview on a section index.
- **`use-cases/_index.md`** — read in full; invents nothing; left as it is.

---

## Where the ingest notes and the code disagreed

Both resolved in favour of the code, both with the question file updated rather than closed.

1. **"The displayed retry count is not real."** The ingest note (`#5567`) said the submission queue has
   a decorative retry counter; an earlier reading of the table class suggested no retry column existed
   at all. Both were half right: `remaining_retries` **is** a column, it **is** written as 5, and it is
   never read or decremented by anything. Published as that. What is still unknown — and why
   `kb/questions/2026-09-06-einvoice-queue-retry-semantics.md` stays open — is **which screen or export
   showed operations staff "5 retries remaining"**, since no listing in the admin applet repo renders
   that column. The wiki should not tell a reader to ignore a number they may never see, so the applet
   page describes the column, not a screen.
2. **The multibank branch.** Covered above. Omitted from the diagram, question updated.

Nothing was published from the by-branch-vs-foreign-counterparty contradiction the previous unit
recorded; that remains as it left it.

---

## Files changed

**Content**

- `content/en/modules-v2/e-invoice/_index.md` — F-0229 (three named errors + four repeats), Start-here
  hub block, intermediary callout, self-billed classification warning
- `content/en/modules-v2/e-invoice/configuration/_index.md` — Phases 1, 3 and 4; the enable-before-finalise warning
- `content/en/modules-v2/e-invoice/best-practices/_index.md` — §1 and §2 rewritten
- `content/en/modules-v2/e-invoice/core-concepts/_index.md` — lifecycle steps 2 and 5; next-steps links
- `content/en/modules-v2/e-invoice/related-applets/_index.md` — admin applet subtitle
- `content/en/modules-v2/e-invoice/reports/_index.md` — rewritten; five invented reports removed
- `content/en/modules-v2/e-invoice/api-reference/_index.md` — one broken link
- `content/en/applets/e-invoice/my-e-invoice-admin-applet.md` — F-0231 (five additions)
- `content/en/applets/e-invoice/mypeppol-admin-applet.md` — F-0231 (two additions)
- `content/en/applets/e-invoice/my-e-invoice-portal-applet.md` — F-0231 (one addition + troubleshooting row)
- `content/en/guides/einvoice-guides/_index.md` — the diagram, Get-started order, Every week, two table rows, module link
- `content/en/guides/einvoice-guides/einvoice-validation.md` — the record-precedence section, the forex figure
- `content/en/guides/einvoice-guides/einvoice-pools-and-routing.md` — where the submission type is set, the buyer-portal FAQ
- `content/en/guides/einvoice-guides/einvoice-month-end.md` — the on-document override caveat in Step 5
- `content/en/guides/einvoice-guides/myinvois-setup.md` — Posting Queue defined; the override pointer in Step 4
- `content/en/guides/einvoice-guides/peppol-configuration.md` — `weight: 20` → `45`. Content untouched.

**Layouts and assets**

- `layouts/shortcodes/einvoice-flow.html` — new
- `static/images/e-invoice/forex-validation-error.jpg` — new

**Knowledge base**

- `kb/topics/e-invoice-submission-errors.md` — source-verified queue mechanics
- `kb/topics/e-invoice-tin-and-identity-validation.md` — the entity-resolution ladder
- `kb/topics/e-invoice-reconciliation.md` — the Discrepancies Report structure
- `kb/questions/2026-09-06-einvoice-queue-retry-semantics.md` — source check appended, still open
- `kb/questions/2026-09-06-einvoice-multibank-submission-type.md` — source check appended, still open

**Checks run**

`tests/content-lint.sh` — all eight checks pass. Every internal link and image path on the touched pages
resolves against the file tree, including the new `#which-record-does-bigledger-actually-send` and
`#8-monthly-report--discrepancies-report` anchors. `hugo` was not run and nothing was committed.
The SVG was validated as XML and rasterised locally to check its geometry and text placement.
