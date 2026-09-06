---
question: How much of content/en/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet.md is invented, and should it be cut back to what source supports?
topics: [e-invoice, applet-registry]
raised: 2026-09-06
status: open
who_can_answer: Vincent
---

## The problem

`content/en/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet.md` is flagged "Work in
Progress" and reads as generated rather than sourced — analogies ("you are the Shopkeeper", "the Head
Auditor"), invented accounting rationale, and a menu walkthrough whose facts do not survive checking.
Two errors found while writing the incoming-supplier guide:

- L180 and L282–284 say the Posting Queue and the matching flow are fed from **Internal Purchase GRN**.
  They are not. `EInvoiceConstants.PURCHASE_DOC_TYPES` is purchase invoice, self-billed purchase invoice,
  purchase debit / credit / refund note and purchase return — no GRN anywhere. The page then builds a
  whole "Receiving Bay" narrative on top of the wrong document type.
- L210–213 and L329 tell the reader that *External Reception → From IRB E-Invoice* is "pulled in real-time
  from the LHDN Government Portal" and is "how you verify your Input Tax Credits". The table is empty on
  every production tenant and nothing populates it. A reader following L327–332 ("How to Match a Supplier
  Invoice (For AP Staff)") reaches an empty screen and a step that cannot be performed.

The applet itself is real and its screens are real — verified in
`blg-applet-wavelet-my-einvoice-for-customer-and-supplier-applet@6517a6b`, including one detail worth
recording: the **Self Bill** button on *External Reception → Queue Edit* is dead
(`external-reception-queue-edit.component.ts:65-68` only `console.log`s; the dispatch is commented out).

## What we need decided

Whether to rewrite this page against source in the style of `my-e-invoice-admin-applet.md`, cut it back
to a stub that points at the admin applet page, or unpublish it pending a rewrite. It is not a
proofreading fix; the errors are structural.
