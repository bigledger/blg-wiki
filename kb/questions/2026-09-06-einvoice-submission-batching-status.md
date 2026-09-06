---
question: Has LHDN submission batching shipped, and what throughput may we publish?
topics: [e-invoice-throughput-and-limits, e-invoice-consolidation]
raised: 2026-09-06
status: open
who_can_answer: E-invoice backend engineer
---

## The question

As traced in 2026-06, submissions are sent one document per LHDN call, serially, with no parallelism,
no connection pooling, no timeouts and no back-off on rate limiting — a measured ceiling of roughly
600–3,000 documents per hour, against an LHDN allowance of 100 documents per call and 100 calls per
minute. A customer measured about 100 e-invoices per two hours during the August 2026 cycle.

## What we need

- Has batching (or the config-only quick win of larger per-run limits) shipped?
- What is a safe planning figure to publish for a month-end run: "allow N hours for N thousand
  documents"?

## Why it matters

A month-end guide must tell the reader when to start. Starting on the 6th for a 20,000-document month
is a compliance failure if the pipeline runs at a few hundred an hour.
