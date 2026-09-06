---
question: By-document or by-branch consolidation — what should the wiki recommend?
topics: [e-invoice-consolidation]
raised: 2026-09-06
status: open
who_can_answer: E-invoice product owner / support lead
---

## The question

Both consolidation methods are in production across tenants, chosen per tenant, and they behave
differently in ways a customer can see:

| | By document | By branch |
|---|---|---|
| Grouping | company + document type | branch + document type + consecutive number range + general TIN |
| Lines | one per source document | one per consecutive document-number range, max 200 |
| Separate e-invoices per counterparty class (local / foreign / government) | no | yes |
| Unit of measure on the line | piece | unit |
| Needs the branch document number populated | no | yes |

The wiki describes consolidation as if there were one behaviour, and the applet page mentions both
buttons without saying which a customer should use.

## What we need

- Is the choice a customer decision or a BigLedger deployment decision?
- What drives it — branch count, receipt volume, whether they have foreign or government
  counterparties?
- Can it be changed later, and what happens to the months already consolidated the other way?

## Why it matters

A multi-branch retailer is the median BigLedger customer, and by-branch is what produces
per-branch traceable consolidated e-invoices. Getting the recommendation wrong changes what their
LHDN records look like for a whole month.
