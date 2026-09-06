---
question: Has buyer-identity normalisation (hyphens, zero-width characters, NRIC length) shipped?
topics: [e-invoice-tin-and-identity-validation, e-invoice-submission-errors]
raised: 2026-09-06
status: open
who_can_answer: E-invoice backend engineer
---

## The question

blg-intranet#5567 (open at 2026-07-28) asked for two things before the LHDN call: strip hyphens,
whitespace and zero-width/format characters from the buyer ID value and TIN, and validate
"NRIC = exactly 12 digits" locally with a readable rejection reason.

Space-stripping on the TIN field shipped in customer maintenance on 2026-09-03. Hyphen stripping,
zero-width-character stripping and the local NRIC length check have not been confirmed.

## What we need

A yes/no per item, so the validation guide can either say "BigLedger cleans this up for you" or
"key the NRIC as 12 digits with no dashes, and retype rather than paste".

## Why it matters

On the tenant measured, 82 documents failed on hyphens alone and 12 on an invisible pasted character.
The advice we publish is opposite depending on the answer.
