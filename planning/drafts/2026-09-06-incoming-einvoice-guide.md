---
date: 2026-09-06
scope: GPT review P0 #1 — "Match incoming supplier e-invoices against your purchase documents" is promised in the guides index and taught nowhere
status: research notes + draft record
---

# Incoming supplier e-invoices — what the product actually does

## The promise being audited

`content/en/guides/einvoice-guides/_index.md`, "Every day", step 5:

> 5. Match incoming supplier e-invoices against your purchase documents.

No page on the wiki explains how. The GPT review calls this the section's clearest broken promise
(`planning/reviews/2026-09-06-gpt-5.6-sol-einvoice-guide-set.md` §1.1).

## What I established, and how

### 1. The screens exist

`content/en/applets/e-invoice/my-e-invoice-admin-applet.md` L124–127 (source-verified against
`blg-applet-wavelet-my-invoice-admin-applet`) lists two menu groups:

| Group | Tabs | Route slug |
|---|---|---|
| External Reception | Queue · From IRB E-Invoice | `external-reception-queue`, `external-reception-from-irb` |
| Reconciliation (Purchase) | PD Matching Q. · Inc. E-Invoice Match Q. · Matched History · Inc. Unmtch. E-Inv. Hist. · Unmatched PD Hist. | `puchase-doc-matching-queue` … |

Actions on the Reconciliation screens: **Auto Match**, **Export**, **Push to Unmatched History**.
`HIDE_EXTERNAL_RECEPTION_MENU` (Side Menu Settings) removes the External Reception group entirely.

### 2. Purchase documents *are* queued for matching

`blg-intranet/content/1100-malaysia-einvoice/README.md` L43–44 (verbatim, trigger-processor table):

> `E_INVOICE_SALES_DOC_MATCHING_QUEUE_PROCESSOR` | Triggered when a sales document is finalized with
> `skip_einvoice = true`. Creates an entry in `bl_fi_einvoice_sales_doc_matching_queue` for documents
> that have been skipped from e-invoice but need to be matched against incoming e-invoices from suppliers.

> `E_INVOICE_PURCHASE_DOC_MATCHING_QUEUE_PROCESSOR` | Triggered when a purchase document is finalized.
> Creates an entry in `bl_fi_einvoice_purchase_doc_matching_queue` for non-self-billed purchase documents
> where the supplier has a TIN. Used for matching received e-invoices from suppliers.

Gating is mutually exclusive with self-billing: self-billed purchase document → the tenant issues the
e-invoice itself, no queue row. Not self-billed **and** supplier has a TIN → queue row. Not self-billed
and supplier has no TIN → no row at all, and nothing documents what happens to it.

### 3. Nothing ever drains those queues

Intranet repo, full `git grep` over `git rev-list --all`: `matching_queue` occurs **only** at README
L40, 41, 43, 44, 58, 61 — the trigger-table header, the two rows, and the ASCII diagram. The eight cron
processors are listed by name (L24–33) and **none of them reads either matching queue**. In the ASCII
diagram both matching processors are drawn as terminal boxes with no outgoing edge; the posting-queue
processor has one. `flow-chart/lhdn-core-workflow.drawio` (163 labels, both pages) contains **zero**
labels matching `match`, `purchase`, `incoming`, `inbound`, `receiv`, `reject` or `self-bill` — the whole
diagram is outbound.

### 4. Production proves it — 662,000 rows, never processed

Read-only sweep of every active tenant database (93 connection records in `app_generic_resources_hdr`;
89 reachable, 4 dead hostnames in a decommissioned region). Aggregate counts only — **no tenant name,
document number, amount, TIN or LHDN identifier was recorded**.

| Table | Total rows | Tenants with >0 |
|---|---:|---:|
| `bl_fi_my_einvoice_from_irb_hdr` (External Reception → From IRB E-Invoice) | **0** | **0** |
| `bl_fi_my_einvoice_from_irb_run_hdr` | 0 | 0 |
| `bl_fi_my_einvoice_from_irb_document_queue` | 41 | 1 |
| `bl_fi_my_einvoice_from_irb_document_cache` | 41 | 1 |
| `bl_fi_my_einvoice_from_irb_match_gen_doc_queue` | 0 | 0 |
| `bl_fi_my_einvoice_from_irb_match_gen_doc_hdr_link` | 0 | 0 |
| `bl_fi_einvoice_purchase_doc_matching_queue` (PD Matching Q.) | **35,704** | 33 |
| `bl_fi_einvoice_purchase_doc_unmatched_history` | **0** | 0 |
| `bl_fi_incoming_einvoice_lhdn_matching_queue` | 0 | 0 |
| `bl_fi_incoming_einvoice_lhdn_matched_history` | **0** | 0 |
| `bl_fi_incoming_einvoice_lhdn_unmatched_history` | 0 | 0 |
| `bl_fi_einvoice_sales_doc_matching_queue` (SD Matching Q.) | **626,732** | 34 |
| `bl_fi_incoming_ecom_einvoice_matching_queue` | 0 | 0 |
| `bl_fi_incoming_ecom_einvoice_matched_history` | **0** | 0 |
| `bl_fi_incoming_ecom_einvoice_unmatched_history` | 0 | 0 |

Status breakdown of every row in both matching queues, all tenants:

| Queue | queue_status | process_status | status | Rows | created_date range |
|---|---|---|---|---:|---|
| Sales doc matching | `PENDING` | `UNPROCESSED` | ACTIVE | 626,717 | 2024-09-25 → 2026-09-06 |
| Purchase doc matching | `PENDING` | `UNPROCESSED` | ACTIVE | 35,531 | 2024-08-17 → 2026-09-05 |
| Purchase doc matching | `PENDING` | `UNPROCESSED` | DELETED | 173 | 2025-06-18 → 2025-07-21 |
| Sales doc matching | `PENDING` | `UNPROCESSED` | DELETED | 15 | 2025-06-19 → 2025-07-01 |

**There is not one row in any other state, on any tenant, in two years.** No `MATCHED`, no `PROCESSED`,
no `FAILED`. Every matched-history and unmatched-history table is empty everywhere.

### 4b. CORRECTION after reading the Java backend — there *is* an inbound pull, and there *is* a live matcher

Source: `blg-akaun-platform-java@1ff620ef0e` (read-only; nothing pulled or modified). The intranet
README understates the product. Three separate, unconnected inbound pipelines exist.

**(i) The LHDN inbound pull is real but write-only.**
`MyEInvoiceLHDNIntegrationService.getRecentDocuments` (javasdk L895-917) calls MyInvois'
recent-documents API with `direction=Received` **hard-coded** — it can only ever fetch documents where
the tenant is the buyer. Two callers: the scheduled `E_INVOICE_FROM_IRB_RUN_PROCESSOR`
(`akaun-api/.../jobProcessor/eInvoice/EInvoiceFromIrbRunProcessor.java` L84-88, registered
`JobProcessorClassName.java:569`) and a manual `POST …/from-irb-document-queues/backoffice-ep/fetch-now`.
Output goes to `bl_fi_my_einvoice_from_irb_document_cache` (dedupe on submissionUid+uuid) and
`bl_fi_my_einvoice_from_irb_document_queue` (`EInvoiceFromIrbRunProcessorService` L52-137).
**Nothing reads that queue.** No processor turns a received document into
`bl_fi_my_einvoice_from_irb_hdr/line`; those are CRUD-API-only. The one producer-shaped class,
`MyEInvoiceFromRBProcessorService.pullFromLHDN`, is dummy scaffolding with a comment
*"the lhdn api is not available yet, so we just construct dummy container"* and **zero callers**.
Known bug on the live path: `dateTimeReceived` is written into `date_time_issued`
(`EInvoiceFromIrbRunProcessorService` L108-113).

**(ii) A live matching processor exists — and it is never fed from LHDN.**
`INCOMING_EINVOICE_MATCHING_QUEUE_PROCESSOR`
(`akaun-api/.../jobProcessor/eInvoice/IncomingEinvoiceMatchingQueueProcessor.java` L48-99,
`JobProcessorClassName.java:638`) pairs `bl_fi_incoming_einvoice_matching_queue` against
`bl_fi_einvoice_purchase_doc_matching_queue` on a **four-field exact equality** lookup (L60-65):
`reference_no`, `date_txn`, `amount_txn`, `supplier_id_no`. No tolerance, no fuzzy, no partial match.
On a hit it writes `bl_fi_incoming_einvoice_matched_history` and **hard-deletes both queue rows**
(L84-89) — so the PD Matching Queue's `UNPROCESSED` status is vestigial; a matched row does not change
status, it disappears.

Its incoming side is fed from exactly two sources
(`IncomingEinvoiceMatchingQueueProcessorService` L27-55): **PEPPOL** (`match_source = PEPPOL`, from
`FromPeppolDocHdrQueueProcessor:56`) and **e-mail OCR** (`match_source = EMAIL`, from
`EInvoiceEmailOcrProcessor:130-131`). **Never LHDN.** The LHDN-specific trio
`bl_fi_incoming_einvoice_lhdn_matching_queue / _matched_history / _unmatched_history` has CRUD
controllers and validators but **no producer, no processor, and no entry in `JobProcessorClassName`**.

**(iii) No auto-match for e-invoices at all.** `autoMatch` / `AUTO_MATCH` appear in this repo only in
**bank reconciliation** (`BankReconAutoMatchingProcessor`). `matchStatus`, `PARTIAL_MATCH`,
`matchDocument` and the literals `"MATCHED"` / `"UNMATCHED"` do not exist anywhere in the repo.

**(iv) Matching never touches the purchase document.** `IncomingEinvoiceMatchingQueueProcessor` does
four writes and imports no `GenericDocumentUow`; `bl_fi_generic_doc_hdr` is never touched. No posting,
no status change, no tax recalculation, no journal, no AP posting. It is reversible with no ledger
consequence — `IncomingEinvoiceMatchedHistoryService.createQueueContainerBasedOnHistoryContainer`
(L73-129) rebuilds both queue rows from the history row and deletes the history.

**(v) A buyer cannot reject a supplier e-invoice from BigLedger.** The only LHDN document-state call in
the repo is `MyEInvoiceLHDNIntegrationService` L848/857-858 with the body **hard-coded**
`status = "cancelled"` — the supplier-side cancellation. The literal `"Rejected"` never appears in an
LHDN context. `rejectDocument` as an outbound action: NOT FOUND. What BigLedger *does* hold is the
seller-side receiving end: `LHDNRecentDocument.rejectRequestDateTime` lands in the from-IRB staging
queue, and `bl_fi_my_einvoice_to_irb_hdr.irb_reject_request_datetime` on the outgoing side.

### 4c. Second production sweep — the live matcher has never matched anything

Same read-only method, 89 of 93 tenants reachable, aggregate counts only.

| Table | Total rows | Tenants with >0 |
|---|---:|---:|
| `bl_fi_incoming_einvoice_matching_queue` (live matcher, incoming side) | 7 | 1 |
| `bl_fi_incoming_einvoice_matched_history` | **0** | **0** |
| `bl_fi_incoming_einvoice_unmatched_history` | 0 | 0 |
| `bl_fi_einvoice_email_ocr_doc_hdr` | 316 | 1 |
| `bl_ppl_from_peppol_generic_doc_hdr` | 7 | 1 |
| `bl_ppl_from_peppol_doc_hdr_queue` | 0 | 0 |
| `bl_fi_einvoice_purchase_doc_hdr` | 0 | 0 |
| `bl_b2b_process_tracking_einvoice_hdr` | 0 | 0 |

**`bl_fi_incoming_einvoice_matched_history` is empty on every tenant.** Combined with the fact that a
successful match *deletes* the purchase-doc queue row, the 35,704 surviving `UNPROCESSED` rows are the
unmatched remainder — and the matched set is empty. **No incoming supplier document has ever been
matched to a purchase document in production, from any source.**

The most likely reason is the match rule itself: four fields, all exactly equal, including the
supplier's own `reference_no`. A purchase document keyed from a supplier's paperwork rarely carries the
supplier's reference verbatim, and the OCR / PEPPOL side is barely used (one tenant each).

### 4d. What this changes in the page

- Do **not** write "BigLedger does not pull documents from LHDN". It does; the pull stops in a staging
  area that nothing consumes, so the *From IRB E-Invoice* screen never fills. Reader-facing outcome is
  identical, the cause is not.
- Do **not** describe **Auto Match** as pairing against LHDN documents. The live matcher is fed from
  PEPPOL and e-mail OCR only.
- The four-field exact-equality rule is worth telling the reader: it is the one thing a customer could
  influence, and it explains why nothing matches.

### 5. The incoming side is empty because nothing fills it

`kb/topics/e-invoice-reconciliation.md`, sourced to `gh:bigledger/blg-intranet#5617` (2026-08-06):

> The inbound store (`from_irb` header/line tables) exists but **nothing populates it**; the only
> producer-shaped code is dummy scaffolding with zero callers. A real LHDN inbound client does exist
> (recent-documents and search-documents) and writes to a **side cache** that no comparison reads.

The production sweep matches that exactly: `from_irb_hdr` is empty on all 89 tenants, while the side
cache holds 41 rows on a single tenant. The intranet README documents no inbound path of any kind —
no polling processor, no webhook, no `getRecentDocuments`; the only LHDN read documented is a manual
Postman "Get Document Details" lookup by GUID, described as a human troubleshooting action.

### 6. Matching key fields (from the DDL, if it is ever wired up)

`bl_fi_einvoice_purchase_doc_matching_queue` carries `reference_no`, `supplier_id_no`, `amount_txn`,
`date_txn`, `generic_doc_hdr_guid`, `generic_doc_hdr_server_doc_type`, `queue_status`,
`process_status`, `validation_error`. `bl_fi_einvoice_purchase_doc_unmatched_history` carries the same
four business keys plus `peppol_generic_doc_hdr` — so the intended match is supplier identity +
reference number + amount + date, and PEPPOL is an intended second source of incoming documents.
**This is the shape of an intended design, not observed behaviour, and must not be written as a
procedure.**

### 7. Effect on the purchase document

`NOT FOUND` in the intranet README: no post-match status transition, no posting change, no tax or GL
treatment, no write-back to `bl_fi_generic_doc_hdr`. Contrast with consolidation, which the README
documents step by step including the write-back of `einvoice_to_irb_hdr_guid`. The applet reference
already states it plainly: *"Nothing here changes the purchase or sales document."*
(`my-e-invoice-admin-applet.md` L344.)

### 8. Buyer rejection

`kb/topics/e-invoice.md` and the guides index already carry the verified fact: a rejection raised on
the MyInvois portal, rather than through BigLedger's buyer portal, never reaches BigLedger. The
intranet README neither states nor contradicts this; it documents **no inbound path at all**, which is
consistent with it. The README's "Rejection Request" is BigLedger's *internal* approval wrapper around
a supplier-side cancellation (`bl_fi_my_einvoice_request_rejection_internal_doc_hdr`), gated on the
supplier's own 72-hour window — not a record of a rejection arriving from LHDN. Nothing advances a
rejection request automatically; it needs create → approve (with a processing logic) → submit.

## The verdict for the wiki

BigLedger **does not match incoming supplier e-invoices today.** The tables, the screens and the
trigger processors exist; the incoming store is empty in every production tenant; and no match has
ever been recorded anywhere. Writing a matching procedure would be inventing one.

So the page tells the truth and gives the reader the check they can actually run — their own purchase
records against the supplier's validated e-invoice, using the supplier's PDF/QR, plus the two things
BigLedger genuinely does show them (the Discrepancies Report's purchase side, and the self-billed
route when the supplier will not issue). And the index stops promising a daily task nobody can do.

## Blocked / not settled — deliberately kept off the page

- Self-billed scope (F-0227), Peppol participant ID (F-0228), throughput (F-0236), the MyInvois
  intermediary permission set (F-0238), by-document vs by-branch consolidation (F-0226 residual).
- The Discrepancies Report's **From Supplier (Matched)** column in the IRB Audit Summary: it exists in
  the report structure, and given the evidence above it must read zero everywhere. Named on the page
  only as "will be zero", never as a working figure.

## Files changed

- **New** `content/en/guides/einvoice-guides/einvoice-incoming-supplier.md` (weight 33, between
  Validation 30 and Month End 35)
- **Edited** `content/en/guides/einvoice-guides/_index.md` — the daily loop now ends at step 4 and says
  so; the purchase side is broken out as a monthly job with its own card
- **Edited** `content/en/guides/einvoice-guides/einvoice-pools-and-routing.md` — the skip FAQ no longer
  implies that a skipped sales document gets matched
- **Edited** `content/en/applets/e-invoice/my-e-invoice-admin-applet.md` §7 — corrected: the incoming
  side is fed from PEPPOL and e-mail OCR, never LHDN; the exact match rule, the manual match path and the
  pushback actions are named
- **Edited** `content/en/modules-v2/e-invoice/reports/_index.md` — the "which supplier e-invoices" row no
  longer says documents are fetched from LHDN
- **Edited** `kb/topics/e-invoice-reconciliation.md` — a source-verified facts block on the three inbound
  pipelines, the match rule, and the production evidence
- **New** `kb/questions/2026-09-06-einvoice-lhdn-inbound-never-consumed.md`
- **New** `kb/questions/2026-09-06-einvoice-customer-supplier-applet-page-invented.md`

`tests/content-lint.sh` passes. `hugo` not run, nothing committed, nothing pushed. Every internal link in
the new page is absolute and its target file exists.

## Not written into the page

- The row counts (35,704 / 626,732 / zero matched). Internal evidence; the page says the behaviour, not
  the volume.
- The dead **Self Bill** button on *External Reception → Queue Edit* — the screen is empty, so no reader
  meets it. Recorded in the applet-page question file instead.
- The `date_time_issued` / `date_time_received` overwrite bug — no customer impact while nothing reads the
  table. Recorded in the question file.
- Self-billed scope (F-0227), PEPPOL participant ID (F-0228), throughput (F-0236), the MyInvois
  intermediary permission set (F-0238), by-document vs by-branch consolidation (F-0226). Step 5 names
  self-billing and explicitly hands the scope decision to LHDN's guideline rather than stating it.

---

# The concepts-layer test (ADR-0006 §1)

The pilot self-check asked for exactly this: close one P0 procedural gap and report whether the three
e-invoice concept pages made it cheaper. Here is what happened, without spin.

## Where I actually used them

**Two links, one of them defensive.**

- `validation-and-clearance` — **a genuine save.** The reader needs "Valid means LHDN said yes and the
  document carries an LHDN identifier and a QR code", because that is the thing they hold up against the
  supplier's PDF in Step 4. One sentence and a link instead of a paragraph. Call it four lines saved.
- `pools-and-queues` — **a net cost.** I linked it, but only to *contradict* it. That page's central
  claim is: "A **queue** holds a document that is complete and on its way — it will be sent, you only
  have to wait." The Purchase Doc Matching Queue is a queue that never moves and is not waiting to be
  sent at all. Because the concept page exists and is authoritative, I had to spend a bullet warning the
  reader not to carry its definition across. Without the concept page I would have written one plain
  sentence about what this screen holds and moved on.
- `consolidated-e-invoice` — not applicable. Never linked.

**Net effect on this guide: roughly zero.** One concept saved four lines; one concept cost three
correcting it.

## What actually made the guide cheap to write

Not the concepts layer. Three other things:

1. **`kb/topics/e-invoice-reconciliation.md`.** Its existing "third side of the triangle" section pointed
   straight at blg-intranet#5617, which is the whole story. That is the ingestion pipeline paying off,
   and it is a different ADR.
2. **The source triangulation itself** — backend, applet repos, and 89 production tenant databases. The
   single most valuable fact on the page (nothing has ever matched) came from a database sweep, not from
   any prose layer.
3. **`my-e-invoice-admin-applet.md`'s screen inventory.** Having the menu tree and route slugs already
   source-verified in a reference page meant I could write menu paths without re-reading the Angular
   routing. **This is what the ADR wanted a concepts layer to be, and the applet reference already was
   it** — for procedures, the reusable substrate turns out to be the reference page, not the concept page.

## The uncomfortable finding

A concept page is authoritative prose about what a thing *is*. That makes it brittle in exactly the place
procedures need flexibility. `pools-and-queues` generalised from the submission pipeline — correctly, for
the five guides that existed when it was written — and the sixth guide had to fight it. That is the
predictable failure mode of a concepts layer written from a sample of the module rather than the whole of
it, and it will recur every time a module grows a guide the concept pages did not anticipate.

The self-check already suspected the wins were de-duplication rather than concepts. This unit is
consistent with that and adds a second data point: a concept page can also be a *tax* on new writing.

## Verdict

**The concept pages made no measurable difference to the cost of writing this guide, and one of the three
actively cost me words.** The ADR's testable promise — "both are cheaper once concepts exist" — is not
supported by this unit.

That is a negative result on the specific question the self-check posed. It is not an argument for
deleting the pages: they are good pages, and a reader arriving cold at the e-invoice section is better off
for them. It is an argument against rolling the layer out to ten modules on the strength of a
"procedures get cheaper" claim, because that claim now has one pilot that could not demonstrate it and one
follow-up that contradicts it.

**Recommendation:** treat recommendation 3 of the pilot self-check as answered **no**. Before any
rollout, revisit ADR-0006 on two points: whether concept pages should be written only *after* a module's
procedures are complete (so they generalise from the whole, not a sample), and whether the reusable
substrate for procedure-writing is really the concepts layer or the applet reference page.
