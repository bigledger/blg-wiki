---
question: The LHDN inbound pull works but nothing consumes it — is this a known gap with an owner, and should the wiki keep saying so?
topics: [e-invoice, e-invoice-reconciliation, e-invoice-self-billed, e-invoice-ocr-intake]
raised: 2026-09-06
status: open
who_can_answer: E-invoice engineering lead / product owner
---

## What we established

Source-verified against `blg-akaun-platform-java@1ff620ef0e`, the applet repos, the internal e-invoice
knowledge repo, and a read-only sweep of 89 of 93 active production tenants (aggregate counts only, no
tenant identified).

1. **The inbound pull is real.** `MyEInvoiceLHDNIntegrationService.getRecentDocuments` calls MyInvois'
   recent-documents API with `direction=Received` hard-coded. It is driven by a scheduled processor
   (`E_INVOICE_FROM_IRB_RUN_PROCESSOR`) and by a manual `…/from-irb-document-queues/backoffice-ep/fetch-now`.
2. **Nothing consumes the result.** It lands in `bl_fi_my_einvoice_from_irb_document_cache` and
   `bl_fi_my_einvoice_from_irb_document_queue`; no processor promotes it to
   `bl_fi_my_einvoice_from_irb_hdr/line` (CRUD-only) and none feeds it into any matching queue. The one
   producer-shaped class, `MyEInvoiceFromRBProcessorService.pullFromLHDN`, is dummy scaffolding with a
   comment *"the lhdn api is not available yet"* and zero callers.
3. **Production agrees.** `bl_fi_my_einvoice_from_irb_hdr` holds **0 rows on every tenant**. The staging
   cache and queue hold 41 rows on exactly one tenant.
4. **The live matcher is never fed from LHDN.** `INCOMING_EINVOICE_MATCHING_QUEUE_PROCESSOR` pairs
   `bl_fi_incoming_einvoice_matching_queue` (fed only by PEPPOL and e-mail OCR) against
   `bl_fi_einvoice_purchase_doc_matching_queue`, on four-field exact equality (supplier id, reference no,
   amount, date). The LHDN-specific trio `bl_fi_incoming_einvoice_lhdn_*` has CRUD endpoints but no
   producer, no processor, and no `JobProcessorClassName` registration.
5. **No pair has ever been made.** `bl_fi_incoming_einvoice_matched_history` is empty on all 89 tenants.
   `bl_fi_einvoice_purchase_doc_matching_queue` holds 35,704 rows and
   `bl_fi_einvoice_sales_doc_matching_queue` 626,732 rows, **all** `PENDING` / `UNPROCESSED`, accruing
   since August 2024. A successful match deletes both queue rows, so the surviving rows are the
   never-matched remainder.
6. **A known field bug on the live inbound path:** `EInvoiceFromIrbRunProcessorService` writes
   `dateTimeReceived` into `date_time_issued`, overwriting the issue date; the `date_time_received`
   column is never populated.

## What we need answered

- Is the from-IRB consumer **planned, abandoned, or forgotten**? blg-intranet#5617 (2026-08-06) proposes
  exactly this work; the wiki currently tells readers it does not exist. If it ships, the new guide
  `content/en/guides/einvoice-guides/einvoice-incoming-supplier.md` needs rewriting rather than editing.
- Is the four-field exact-equality match rule intended to stay? Nothing has ever matched under it. If a
  tolerance or a reference-number normalisation is coming, the guide should not teach the current rule as
  permanent.
- Do we want to tell customers that **662,000 matching-queue rows are accumulating and are never read**?
  The guide currently frames the queue as a usable worklist (which it is) without naming the volume.
- Should the `date_time_issued` overwrite be raised as a defect? It has no customer impact today because
  nothing reads the table, but it will the day something does.

## Why it matters

The guides index promised "Match incoming supplier e-invoices against your purchase documents" as a
**daily** task. No reader could do it. The index has been corrected and a guide written that tells the
truth, but the truth is unusual enough that somebody who owns the feature should confirm it before a
customer reads it.
