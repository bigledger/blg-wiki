---
topic: e-invoice-reconciliation
aliases: [tallying, BLG vs e-invoice, discrepancies report, from_irb, ghost documents, unsubmitted documents, month-end tally, LHDN pull]
applets: [myIEnvoiceAdminApplet]
modules: [e-invoice]
related: [e-invoice, e-invoice-consolidation, e-invoice-submission-errors, e-invoice-self-billed, e-invoice-cancellation-and-credit-notes, emp-etl-sync, sales-report-applet, my-e-invoice-admin-applet]
wiki:
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
  - content/en/guides/einvoice-guides/einvoice-validation.md
status: growing
updated: 2026-09-06
---

# Making the books agree with LHDN

Every month someone has to answer: *is everything we invoiced actually at LHDN, once and only once?*
That question has three sides — documents BigLedger holds, e-invoices BigLedger sent, and documents
LHDN holds — and only the first two are compared today. This note holds the tallying method, the five
standard reasons a tally does not balance, and the known blind spots.

## Facts

### The tally itself

- 2026-09-01 — The tally compares, per sales document type and per month: **left side** = the sum of `amount_txn` and `amount_net` over finalised, active, non-skipped documents belonging to e-invoice-enabled companies; **right side** = the sum over to-IRB headers whose status is `IN_CONSOLIDATED_QUEUE`, `Submitted` or `Valid`. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#tallying-e-invoice]
- 2026-09-01 — Timing: tally **before** the consolidated submission but **after** the consolidated queues exist, and again **after** pushing failed/invalid documents into a new consolidation. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#when-to-tally]
- 2026-09-01 — The five standard reasons the two sides differ: (1) documents stuck in the **individual pool**; (2) batch-pool rows that are `PROCESSED` but `FAILED` — a Save-and-Resubmit that did not have enough data, and which will **not** be swept into the monthly consolidation; (3) documents stuck in the **single-general pool**; (4) documents that never entered the pipeline at all ("ghosts"); (5) **VOID or DRAFT documents that were never marked skip-e-invoice**, so they count on the BigLedger side but have no e-invoice. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#troubleshooting-e-invoice-not-tallying]
- 2025-08 → 2026-06 — The tally is a standing monthly task, run per tenant, and the recorded output shape is: totals per document type for BigLedger vs e-invoice, plus the residual "individual pool", "invalid above 10k" and "backdated" buckets that explain the gap. [src:gh:bigledger/blg-intranet#947] [src:gh:bigledger/blg-intranet#581]
- 2026-06-22 — Foreign-currency documents have broken a tally at least once, because the base and transaction currency amounts are not the same number and the forex child document is what was submitted. [src:gh:bigledger/blg-intranet#4629]

### Ghost documents — finalised but never in the pipeline

- 2026-08-26 — A finalised, e-invoice-eligible document can end up in **no pool, no queue and no to-IRB record**, with no error and no log. The entry gate requires FINAL **and** company e-invoice status ENABLED **and** a valid document type **and** the duplicate check to pass; if any one fails, the event is consumed and nothing is written. Concretely: a company whose e-invoice was enabled *after* some documents were finalised loses those documents permanently. [src:gh:bigledger/blg-intranet#5618]
- 2026-08-26 — Two further loss paths: the duplicate check matches on `(server_doc_1, document type)` against the **posting queue only**, and the queue drains by deleting rows — so a genuinely distinct document colliding while a row is in flight is dropped (false positive), while a re-finalised document passes (false negative). And queue drains delete the row in a **separate transaction** from the downstream write, so a crash between the two loses the document silently. [src:gh:bigledger/blg-intranet#5618]
- 2026-08-26 — **No reconciliation job exists** that asks "which finalised eligible documents have no pool row, no queue row and no to-IRB row". The ask is a standing detector plus a dead-letter table. [src:gh:bigledger/blg-intranet#5618]
- 2026-09-01 — The manual equivalent exists as a support query (finalised, non-skipped, enabled-company documents absent from all five e-invoice tables), followed by pushing the found documents to the posting queue. Foreign-currency child documents must be excluded from that push first. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#missing-e-invoice-documents-due-to-server-issues]
- 2026-06-22 — The same class has been caused by plain infrastructure outages: "due to server down, some finalised documents did not get synced to the e-invoice applet" — remediated by extracting the GUIDs and pushing them. [src:gh:bigledger/blg-intranet#1638] [src:gh:bigledger/blg-intranet#1746] [src:gh:bigledger/blg-intranet#1747]

### The third side of the triangle — what LHDN holds

- 2026-08-06 — Today's reconciliation only compares what **we sent**. Documents that exist at LHDN but not in BigLedger — created by hand on the MyInvois portal, or by another system — and LHDN-side rejections or cancellations we never pulled, are invisible. Customers then ask why their LHDN dashboard differs from BigLedger and the question cannot be answered from BigLedger's own records. [src:gh:bigledger/blg-intranet#5617]
- 2026-08-06 — The inbound store (`from_irb` header/line tables) exists but **nothing populates it**; the only producer-shaped code is dummy scaffolding with zero callers. A real LHDN inbound client does exist (recent-documents and search-documents) and writes to a **side cache** that no comparison reads. A field-mapping bug on that path overwrites the issue date-time with the received date-time. [src:gh:bigledger/blg-intranet#5617]
- 2026-08-06 — LHDN's recent-documents API covers roughly 30 days with rate limits; the proposal is to pull every few days and accumulate, then run two outer-join reports: LHDN-side vs BigLedger documents (both directions) and LHDN-side vs to-IRB records for an agreed document-type subset. [src:gh:bigledger/blg-intranet#5617] [src:gh:bigledger/blg-intranet#5476]

### Legacy-platform tenants: a fourth side

- 2026-08-26 — For tenants fed by ETL there is **no automated comparison of the source document amount against the BigLedger amount**. The only amount comparison anywhere is an equality join used to *delete* rows from a missing-documents report — so a document synced with the wrong amount fails the equality, stays in the "missing" report, and is indistinguishable from a document that never arrived. The mismatch signal is actively discarded. [src:gh:bigledger/blg-intranet#5620]
- 2026-09-01 — The unsynced-document comparison covers only three document types (sales invoice, credit memo, sales order) and is e-mail-only; purchase invoice, purchase return and sales return have no checking or missing-report processor at all. It also has a structural blind spot: the test inner-joins the source system's syncing-event tables, so a document that never got a syncing-event row is invisible to every report. [src:gh:bigledger/blg-intranet#5619]
- 2026-08-26 — Why it matters: unsynced documents become missing e-invoices, and this is the largest recurring incident class across the ETL-fed tenants. Drift found late means already-submitted wrong-amount e-invoices needing cancellation inside 72 hours — or credit notes after it. [src:gh:bigledger/blg-intranet#5619] [src:gh:bigledger/blg-intranet#5620]

### Reports that exist

- 2026-09-05 — The **Discrepancies Report** (Monthly Report menu) compares finalised documents against e-invoice records per company and period, with history. [src:refs/blg-applet-wavelet-my-invoice-admin-applet]
- 2026-07-07 — It was extended to cover self-billed, cash-bill and consolidated e-invoices. [src:gh:bigledger/blg-intranet#3367]
- 2026-05-20 — Consolidated submissions are traced back to their source documents through the batch-pool-to-IRB link table; retrieving and displaying that link in the Discrepancy Report was specified as backend + frontend work and was still open. [src:gh:bigledger/blg-intranet#4945] [src:gh:bigledger/blg-intranet#4946] [src:gh:bigledger/blg-intranet#4947]
- 2026-02-19 — Drill-down from the report to the consolidated generic documents and their details was specified for the purchase side. [src:gh:bigledger/blg-intranet#940]
- 2026-09-01 — Standard support reports available as queries today (not necessarily as screens): e-invoice-eligible document counts by type, skipped-document counts and lists, failed/invalid lists, and failed/invalid lists filtered to ≥ RM 10,000 — the last being the compliance-critical one, since those cannot be consolidated. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#generating-reports]

### The human layer

- 2026-08-04 — A monthly PM/engineer verification checklist was proposed as the safety net for silent automation failures, because every automated detector is itself a job that can die quietly. Its items: submission completeness per branch, ghost sweep, unsynced-document review, amount-mismatch review, parked ≥RM 10,000 documents, stuck queues, processor-configuration completeness, LHDN-side pull, duplicate scan, and two random end-to-end spot checks per tenant class. The stated reason it must exist: the scheduler records **enqueue** time, not success time, so a processor that throws on every run still looks healthy. [src:gh:bigledger/blg-intranet#5628] [src:gh:bigledger/blg-intranet#5625]

### What the Discrepancies Report actually contains (source-verified 2026-09-06)

Created per company and date range; lines are grouped totals (amount + document count) keyed by
`section_code` on `bl_fi_einvoice_discrepancies_report_line`, rendered as four tabs:

- **Main** — header: company, start date, end date, process status.
- **ERP Transaction Summary** — your own documents. Total sales = invoice + cash bill + debit note,
  less credit note and refund note; the mirror shape for purchases; plus a **Skip Einvoice Documents**
  line.
- **IRB Audit Summary** — the e-invoice side per document type, each split into **Internal Submission**,
  **From E-commerce (self billed)** and **From Supplier (Matched)**, with a **Cancelled** amount beside
  every type.
- **Document vs E-Invoice Discrepancy** — `existGenDocNotToIRB` ("Exists in ERP, Missing in Einvoice")
  and `existToIRBNotGenDoc` ("Exists in Einvoice, Missing in ERP"), each broken out per document type,
  and repeated in an `…ExclConsolidated` variant.

Each line drills into the documents behind it (generic-doc listing, to-IRB listing, and for a
consolidated e-invoice the list of source documents inside it); `bl_fi_einvoice_discrepancies_report_line_detail`
holds the per-line references. [src:git:blg-applet-wavelet-my-invoice-admin-applet@d7841e7] [src:git:blg-akaun-platform-java@1ff620ef0e]

`E_INVOICE_DISCREPANCIES_REPORT_SCHEDULER_PROCESSOR` generates **last month's** report for every company
whose `einvoice_status` is `ENABLED`, queues `E_INVOICE_DISCREPANCIES_REPORT_PROCESSOR` to build it, and
— when the tenant has a `DISCREPANCY_REPORT_EMAIL_NOTIFICATION` application config with an `email` key —
queues `DISCREPANCY_REPORT_EMAIL_NOTIFICATION_PROCESSOR` to send it. So the monthly reconciliation can be
delivered by e-mail without anyone opening the applet. [src:git:blg-akaun-platform-java@1ff620ef0e]

## How it connects

- **e-invoice-consolidation** — the tally is run inside the 1st–7th window and drives what gets pushed into the last consolidation.
- **e-invoice-submission-errors** — pools, failed batch rows and stuck queues are the arithmetic of the gap.
- **e-invoice-self-billed** — the purchase side has its own matching queue and its own share of the report.
- **e-invoice-cancellation-and-credit-notes** — a tally that finds a duplicate starts a 72-hour clock.
- **emp-etl-sync** — for synced tenants the reconciliation has to start one step further upstream.
- **sales-report-applet** — customers reconcile against their sales report, not against internal tables; the two must agree on what "skip e-invoice" and "void" mean.

## Open questions

- Which two reports make up the month-end pack that support sends after validation, and can a customer produce them unaided? → kb/questions/2026-09-05-einvoice-month-end-report-pack.md
- Is the Discrepancies Report enough for a customer to run their own tally, or does the wiki have to describe a manual method?

## Wiki impact

- **New guide** — a month-end e-invoice checklist is the single highest-value missing page. It should include the five reasons a tally does not balance, in the order support checks them.
- `my-e-invoice-admin-applet.md` — Monthly Report → Discrepancies Report deserves more than one table row; it is the customer's only self-service reconciliation tool.
- Nothing on the wiki tells a customer that **BigLedger does not currently pull LHDN-side documents**, so a portal-created invoice will never appear in a BigLedger report. That is a real expectation to set.
