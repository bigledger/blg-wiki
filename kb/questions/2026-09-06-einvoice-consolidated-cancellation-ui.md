---
question: Can a consolidated e-invoice be cancelled from the applet yet, or is it still support-only?
topics: [e-invoice-cancellation-and-credit-notes, e-invoice-consolidation]
raised: 2026-09-06
status: open
who_can_answer: E-invoice frontend engineer / e-invoice support lead
---

## The question

The only processing logic that works for a consolidated e-invoice is
*cancel-for-edit-and-resubmit*; the other three fail before LHDN is called because a consolidated
request has no source document to void or regenerate. As documented internally, that option was
**missing from the applet's Processing Logic dropdown**, so a consolidated e-invoice could not be
cancelled through the Rejection Requests screen at all — only through a direct endpoint.

The wiki's applet page already lists all four options as if all four were selectable.

## What we need

- Is the fourth option in the dropdown now?
- If not, what should the wiki tell a customer who needs a consolidated e-invoice cancelled inside
  72 hours — raise a support request immediately?

## Why it matters

The 72-hour window means a wrong answer here costs the customer the cancellation entirely and forces
a credit note with accountant sign-off.
