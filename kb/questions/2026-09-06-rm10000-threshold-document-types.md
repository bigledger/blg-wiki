---
question: Should the RM 10,000 consolidation threshold apply to sales document types other than the sales invoice and the cash bill?
topics: [e-invoice-consolidation, e-invoice-throughput-and-limits]
raised: 2026-09-06
status: open
who_can_answer: E-invoice product owner / LHDN compliance lead
---

## The question

The RM 10,000 divert — the rule that a sale of RM 10,000 or more cannot sit inside a consolidated
e-invoice — is enforced against a fixed list of two document types.

Verified at `blg-akaun-platform-java@1ff620ef0e`:

- `EInvoiceConstants.ENFORCE_INDIVIDUAL_DOCS` contains exactly `INTERNAL_SALES_INVOICE` and
  `INTERNAL_SALES_CASHBILL`.
- `GenericDocEInvoicePostingQueueService.processGendocForPostingQueue` only diverts a
  `CONSOLIDATED` document to the Individual Pool when `isDocTypeInEnforceIndividual(serverDocType)`
  is true **and** `amount_txn >= 10000`.
- `MyEInvoicePoolConversionService.checkIfPoolConversionAllowed` applies the same two-type test
  before refusing a manual move into the Batch Pool.

`EInvoiceConstants.SALES_DOC_TYPES` is a wider list: it also holds the sales debit note, credit note,
refund note and sales return. A ≥RM 10,000 document of one of those types, carrying a
`CONSOLIDATED` submission type, falls through into consolidation with no divert and no refusal.

## What we need

- Is that correct behaviour? LHDN's rule is framed around the sale; a credit note or return may
  legitimately follow the treatment of the original document rather than its own amount.
- If it is not correct, which types should join `ENFORCE_INDIVIDUAL_DOCS`, and what happens to
  documents already consolidated the other way?
- Either way: what should the wiki say? Today
  `content/en/modules/e-invoice/concepts/consolidated-e-invoice.md` and
  `content/en/guides/einvoice-guides/einvoice-pools-and-routing.md` describe the divert without
  naming the two types, which reads as broader than the code is.

## Why it matters

Same class as `gh:bigledger/blg-intranet#5623`, which flagged the two-type list as needing an
explicit audit and has not had one. If the wider types should be enforced, every affected document
is a high-value sale reported to LHDN in a way LHDN forbids — and it is invisible, because nothing
raises an error.
