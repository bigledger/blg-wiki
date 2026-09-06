---
topic: e-invoice-cancellation-and-credit-notes
aliases: [72-hour rule, rejection request, cancellation queue, processing logic, CANCEL_FOR_EDIT_AND_RESUBMIT, bulk-cancellation, credit note path, DR303, DR308]
applets: [myIEnvoiceAdminApplet, myEInvoicePortalApplet]
modules: [e-invoice]
related: [e-invoice, e-invoice-consolidation, e-invoice-submission-errors, e-invoice-reconciliation, internal-sales-credit-note-applet, internal-sales-debit-note-applet, internal-sales-return-applet, internal-sales-invoice-applet, pos-general-applet, my-e-invoice-portal-applet]
wiki:
  - content/en/guides/einvoice-guides/einvoice-validation.md
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
  - content/en/applets/e-invoice/my-e-invoice-portal-applet.md
status: growing
updated: 2026-09-06
---

# Cancelling a validated e-invoice, and the credit-note path when you can't

Once LHDN has validated an e-invoice you can no longer edit it. You get 72 hours to cancel it; after
that the only correction is a new document (credit note, debit note, refund note or sales return) that
references the original. Both halves have sharp edges: the internal cancellation workflow does not
advance itself, one of its four options is the only one that works for consolidated e-invoices and is
missing from the dropdown, and a credit note that points at a superseded original is itself rejected.

## Facts

### The 72-hour window

- 2026-09-01 — LHDN allows a supplier cancellation **within 72 hours of validation**, and BigLedger enforces the same check before calling LHDN (`isCancellationRequestValid`): document status must be `Valid`, the LHDN document GUID must exist, and fewer than 72 hours must have elapsed. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#the-72-hour-rule]
- 2026-09-01 — The clock runs from `validation_datetime` on the to-IRB header, held in UTC. It can be **earlier than what a user reads off the LHDN portal or the applet**, so the real cut-off must be computed from that column. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#the-72-hour-rule]
- 2026-09-01 — Past 72 hours there is **no cancellation**. The remedy is a credit-note e-invoice referencing the LHDN UUID of the e-invoice carrying the wrong amount. This needs accountant sign-off because usually only the LHDN reporting is overstated, not the BigLedger ledger. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#the-72-hour-rule]
- 2026-08-01 — Cancellation is dangerous in the hands of a customer who has misread a report: on one tenant, 129 of 185 e-invoices were still inside the 72-hour window when the customer believed they were duplicates. They were not duplicates (see `e-invoice-self-billed` on shared numbering) and the customer was told explicitly not to cancel anything. [src:gh:bigledger/blg-intranet#5588]

### The internal rejection-request workflow

- 2026-09-01 — Three manual steps, no cron: **create** the request (status `REQUESTED` / `IN-PROGRESS`), **approve** it (set approval status `APPROVED` *and* choose a processing logic), then **submit to LHDN** (builds the cancellation-queue row and calls LHDN synchronously). [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#rejection-request-workflow]
- 2026-09-01 — The queue builder only picks up requests where processing status is `IN-PROGRESS` **and** approval status is `APPROVED` **and** processing logic is not null. A request created but never approved sits there forever and *looks* stuck; nothing is wedged, it is simply waiting for the human. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#rejection-request-workflow]
- 2026-09-01 — The four processing-logic options and what they do after LHDN cancels: `VOID_ORIGINAL_DOC` voids the source document (dry-checked first); `REGEN_NEW_EINVOICE` cancels and regenerates from the same document; `NEW_REVERSAL_DOC` creates a reversal document; `CANCEL_FOR_EDIT_AND_RESUBMIT` cancels at LHDN only and leaves the fixing to you. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#processing_logic-options]
- 2026-09-01 — **Only `CANCEL_FOR_EDIT_AND_RESUBMIT` works for a consolidated e-invoice.** A consolidated request has no source generic document, so the first two fail with "Can not void the generic document" *before LHDN is even called*, and a consolidated replacement usually has to *exclude* documents rather than be a one-for-one regeneration. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#processing_logic-options]
- 2026-08-20 — Applet gap: the portal applet's Processing Logic dropdown offers only the first three options, so `CANCEL_FOR_EDIT_AND_RESUBMIT` can only be set through the update endpoint — meaning a consolidated e-invoice could not be correctly cancelled through the Rejection Requests screen at all. Raised together with the duplicate-guard fix. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#processing_logic-options] [src:gh:bigledger/blg-intranet#5427]
- 2026-09-01 — Direct path used by support for duplicates: `bulk-cancellation` calls LHDN immediately for a list of to-IRB GUIDs with the **hard-coded reason "Duplicated EInvoice."**, then refreshes the status. No approval workflow, no processing logic; LHDN still applies the 72-hour rule. Housekeeping: mark any matching rejection request `COMPLETED` afterwards so it is not processed twice. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#direct-cancellation]
- 2026-09-01 — After cancelling a consolidated e-invoice, the source documents that still need submitting are re-pushed to the batch pool and consolidated with an **explicit list** of pool-row GUIDs — not with consolidate-by-date-range or run-consolidate-by-document, which sweep in every unprocessed row for the period. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#direct-cancellation]
- 2026-04-02 — A queue and history table for **inbound** rejection notifications (a buyer rejecting an e-invoice at the LHDN portal, detected by OCR of the notification e-mail) was specified but not built. Today a buyer-side rejection is not visible in BigLedger in near-real time. [src:gh:bigledger/blg-intranet#4367]

### Credit / debit / refund notes and returns

- 2026-09-01 — A CN/DN/RN/return references the original through `original_einvoice_lhdn_document_guid`. If the original was Invalid, resubmitted, and given a **new** LHDN document GUID, the note still points at the dead one and LHDN rejects it. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#reference-einvoice-is-wrong]
- 2026-09-01 — Two recovery options: clear both `original_einvoice_ref_no` and `original_einvoice_lhdn_document_guid` and submit without a reference, or make the original Valid first and then point the note at the new GUID. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#reference-einvoice-is-wrong]
- 2026-09-01 — The observable errors are `DR303` (the referenced document's status is not acceptable) and `DR308` ("Buyer of document uuid … is not the same as referenced document") — i.e. the note's buyer identity must match the original's, not just the reference. [src:refs/blg-intranet/content/1100-malaysia-einvoice/images/original-einvoice-error.jpg] [src:refs/blg-intranet/content/1100-malaysia-einvoice/images/wrong-general-tin-usage.png]
- 2026-07-07 — Field mapping when a note is created from a source document: source `einvoice_to_irb_hdr_guid` → `einvoice_main_document_ref_irb_guid`; source `einvoice_to_irb_lhdn_document_guid` → `einvoice_main_document_ref_to_irb_lhdn_document_guid`; source `einvoice_number` → `einvoice_to_irb_hdr_ref_no`. [src:gh:bigledger/blg-intranet#3640]
- 2026-06-22 — Live case: resubmitting a credit note **without** the reference document and reference UUID was the accepted fix when no valid original existed. [src:gh:bigledger/blg-intranet#1221]
- 2026-05-09 / 2026-04-21 — Proposed "Cancel Sales Invoice" and "Cancel Cash Sales" menu actions carry an explicit e-invoice safeguard: if the original invoice was already validated, the cancellation must generate a **credit note / refund note** document rather than voiding the original, and a closed accounting period must block the action or force the new document into the current open period. Neither had shipped. [src:gh:bigledger/blg-intranet#4684] [src:gh:bigledger/blg-intranet#4683]

### Where cancellations come from in practice

- 2026-08-20 — The production incident that drove the duplicate-guard work: one cash bill landed in two consolidated e-invoices, both Valid; one had to be cancelled inside the 72-hour window under deadline pressure. Three older documents were each Valid twice and were past the window — fixable only by credit note. [src:gh:bigledger/blg-intranet#5427]
- 2026-06-22 — Recurring class before that: duplicated ETL syncing produced duplicate documents; the standing remedy was "cancel the e-invoices that have not passed 72 hours" and remove the rest from the pending queues. [src:gh:bigledger/blg-intranet#560] [src:gh:bigledger/blg-intranet#559] [src:gh:bigledger/blg-intranet#2003]
- 2026-08-17 — Systemic gap on the source side: voiding (reversing) a credit memo in the legacy platform never propagates to BigLedger — no reversing document is created and no e-invoice cancellation happens, so the original stays live at LHDN. [src:gh:bigledger/blg-intranet#5622]

## How it connects

- **e-invoice-consolidation** — every consolidated cancellation needs `CANCEL_FOR_EDIT_AND_RESUBMIT` plus an explicit re-consolidation of the remaining documents; the by-date-range shortcut re-sweeps everything.
- **e-invoice-reconciliation** — duplicates are found by tallying, and the tally is what tells you whether you are inside or outside the 72-hour window.
- **internal-sales-credit-note-applet / -debit-note / -return** — this is where the corrective document is actually raised, and where the original-invoice reference must be right.
- **my-e-invoice-portal-applet** — a buyer can raise a rejection request from the portal; it lands in the same Rejection Requests screen and still needs the same manual approval.
- **e-invoice-submission-errors** — "Save and Resubmit" is refused on a `Valid` or `Submitted` header, which is why cancellation exists at all.

## Open questions

- Has `CANCEL_FOR_EDIT_AND_RESUBMIT` been added to the Processing Logic dropdown? If not, the wiki must say a consolidated cancellation requires support. → kb/questions/2026-09-06-einvoice-consolidated-cancellation-ui.md
- Do the proposed Cancel Sales Invoice / Cancel Cash Sales actions exist now, and do they honour the "validated → credit note, not void" rule?

## Wiki impact

- `einvoice-validation.md` — the 72-hour callout should say the clock runs from **LHDN validation time as recorded on the e-invoice**, and can be earlier than the portal suggests.
- New guide (or a big section) — "I need to cancel an e-invoice": the decision tree individual vs consolidated, inside vs outside 72 hours, and the credit-note path with the accountant caveat.
- `my-e-invoice-admin-applet.md` — already has the processing-logic table; add that a request never advances on its own (the single most common "it's stuck" ticket).
