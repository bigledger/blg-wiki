---
question: Which permissions must a customer grant BigLedger as intermediary on the MyInvois portal, and may we publish the list?
topics: [e-invoice, e-invoice-submission-errors]
raised: 2026-09-06
status: open
who_can_answer: E-invoice support lead / onboarding
---

## The question

Two of the most common "nothing is submitting" incidents are entirely in the customer's own hands:

1. When the customer sets BigLedger as their intermediary on the MyInvois portal they tick **only one
   permission**; the correct set is larger, and with the wrong set every submission fails
   (blg-intranet#2048 shows the wrong and the right permission screens side by side).
2. The intermediary authorisation **expires** and submissions stop for that company until it is
   renewed (blg-intranet#1778, #1749, #1745 across several tenants).

Neither is documented anywhere on the wiki. `myinvois-setup.md` says only "Enter LHDN credentials",
which is not what actually happens in the intermediary model.

## What we need

- The exact permission set to tick on the MyInvois portal (screenshot exists internally but shows a
  customer's portal — we need a clean statement of the permissions, not the image).
- Whether the authorisation has a fixed expiry the customer can plan for, or whether it lapses for
  other reasons.
- Whether BigLedger can detect a lapsed authorisation and warn the customer.

## Why it matters

This is the single highest-value correction available to the MyInvois setup guide: it converts a
support ticket into a self-service step.
