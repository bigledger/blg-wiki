---
question: What exactly is supported for self-billed e-invoices, and where is the flag set?
topics: [e-invoice-self-billed, internal-purchase-invoice-applet]
raised: 2026-09-06
status: open
who_can_answer: E-invoice product owner
---

## The question

Self-billed e-invoices are visible everywhere in the internal material — a dedicated purchase
document type, a self-billed flag on the entry gate, foreign-supplier general TIN, purchase-side
consolidation grouping, a share of the Discrepancies Report, and a steady stream of support tickets
— but the six e-invoice guides mention them only as a document format in a list.

Before writing a guide we need:

1. Which purchase document types can carry the self-billed flag (invoice, credit note, debit note,
   refund note, return — all of them?).
2. Where a user sets it: a checkbox on the purchase document, a supplier default, or file-import only
   (blg-intranet#4186 asked for the import field, which suggests the UI path may be incomplete).
3. Whether self-billed documents can be consolidated in practice or must always be individual.
4. Which LHDN scenarios BigLedger customers actually use it for (imported services? commissions?
   suppliers below the threshold?) — so the guide can name the situation rather than the flag.

## Why it matters

A self-billed e-invoice is issued *by the buyer on the supplier's behalf*; getting it wrong is a
compliance error, and there is currently no user-facing documentation at all.
