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

## Checked against source, 2026-09-06 (still open)

Read from the checked-out backend and applet, so this is the current state, not a July report:

- **"5 retries remaining" is a literal.** `bl_fi_my_einvoice_gen_doc_to_irb_submission_queue.remaining_retries`
  is set to `5` at row creation and reset to `5` on resubmission. No code anywhere calls
  `getRemaining_retries()` and nothing decrements it. **Not fixed.** [src:git:blg-akaun-platform-java@1ff620ef0e]
- **Failed rows are still starved oldest-last.** `EInvoiceFailedSubmissionProcessor` queries
  `SUBMISSION_FAILED` / `FAILED` with `orderBy created_date`, `order DESC`, default `limit` 10.
  **Not fixed.** [src:git:blg-akaun-platform-java@1ff620ef0e]
- **Submission is still strictly serial**, one row per iteration
  (`DELETE … LIMIT 1 FOR UPDATE SKIP LOCKED`), default 50 iterations per processor run. Relevant to
  kb/questions/2026-09-06-einvoice-submission-batching-status.md — no batching in this code path as of
  this checkout. [src:git:blg-akaun-platform-java@1ff620ef0e]
- **No ageing detector found.** Nothing in `akaun-api/.../jobProcessor/eInvoice/` looks for rows older
  than N hours. Recorded as "not found", not as "does not exist" — the search was of that package only.

Still unanswered, and why this stays open:

- Which screen or export was showing operations staff "5 retries remaining"? The column is not rendered
  by any listing in the admin applet repo, so it was probably a support query or a CSV. Worth knowing
  before the wiki tells a reader to ignore a number they may never see.
- What is the honest self-service answer for a row queued since yesterday? The wiki currently says
  "select it and press Submit, raise support if it recurs", which the source supports. Confirm that is
  what support wants customers to do.

### Already published from this check

The applet page's IN_QUEUE troubleshooting row previously said the row "exceeded 5 retries and was
marked `PROCESSED` without an alert". That was wrong in two ways — nothing counts the retries and the
submission queue is never stamped `PROCESSED` — and has been corrected to the mechanics above.
