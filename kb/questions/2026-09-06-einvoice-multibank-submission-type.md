---
question: What is the "multibank" e-invoice submission type in the core workflow diagram?
topics: [e-invoice, e-invoice-consolidation]
raised: 2026-09-06
status: open
who_can_answer: E-invoice backend engineer
---

## The question

The internal core-workflow diagram (`flow-chart/lhdn-core-workflow.drawio`, and the rendered PNG)
shows **four** branches off the submission type — individual, single-general, consolidated and
**`multibank`** — with the multibank branch running its own mandatory-field check straight into the
batch pool or the to-IRB tables.

`multibank` appears nowhere else: not in the routing table of 23 scenarios, not in the pool
descriptions, not in any of the 561 e-invoice issues, and not on any wiki page. The wiki documents
three submission types plus "not set".

## What we need

- Is `multibank` a live submission type, a planned one, or dead scaffolding in the diagram?
- If live, which customers use it and what does it change about routing?

## Why it matters

If it is live, the pools-and-routing guide's decision table is incomplete. If it is not, the diagram
should not be published (the workflow diagram is otherwise a strong candidate for the wiki).
