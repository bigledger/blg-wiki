---
question: Do e-invoice submissions retry, and what should we tell a user whose document is stuck?
topics: [e-invoice-submission-errors, e-invoice-throughput-and-limits]
raised: 2026-09-06
status: open
who_can_answer: E-invoice backend engineer
---

## The question

As documented internally in 2026-07/08:

- the submission queue shows "5 retries remaining" on rows that will never be retried;
- a posting-queue row that exceeds its attempt ceiling is marked **processed**, hiding it;
- failed submissions are recovered newest-first with a small limit, starving the oldest;
- nothing detects a row that has been sitting for more than 24 hours.

Fixes were requested (blg-intranet#5567, #5626) but not confirmed as shipped.

## What we need

- Which of those are fixed as of today.
- The honest answer to "my e-invoice has been in the queue since yesterday — what do I do?"

## Why it matters

The applet page currently tells the reader to press Submit and then contact support. If retries are
still fictional, the guides must not imply the system will sort itself out; if they now work, the
advice changes.
