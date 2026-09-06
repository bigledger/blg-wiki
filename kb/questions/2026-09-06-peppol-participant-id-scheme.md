---
question: What is the correct Malaysian Peppol participant-ID scheme to publish on the wiki?
topics: [e-invoice-peppol, mypeppol-admin-applet]
raised: 2026-09-06
status: open
who_can_answer: Peppol / access-point engineer (the team that files the monthly TSR/EUSR reports)
---

## The question

Two published wiki pages disagree:

- `content/en/guides/einvoice-guides/peppol-configuration.md` tells the reader their Peppol ID is
  `0195:<registration number>` and calls `0195` "Malaysia country code".
- `content/en/applets/e-invoice/mypeppol-admin-applet.md` gives `0230` as the scheme for
  Malaysian TIN-based IDs, and describes the participant ID as *special identifier* + *business
  identifier* keyed on the Registration screen.

They cannot both be right, and a reader who follows the guide will register the wrong identifier.

## What was checked

- The internal e-invoice knowledge repo (`content/1100-malaysia-einvoice/`) covers LHDN only; it
  says nothing about Peppol identifiers.
- MDEC's Peppol ID specification v1.8 (referenced in blg-intranet#1373) changes the structure of
  special identifiers 02 (Sabah) and 03 (Sarawak) — so "the scheme" is not a single constant and the
  guide's one-line format is probably wrong in shape as well as in value.
- The applet's Registration screen exposes *Special Identifier*, *Business Identifier* and optional
  *Additional Identifier* pairs, which matches the MDEC spec and not the guide.

## What we need

1. The scheme value(s) a Malaysian company actually registers under today (post wildcard migration).
2. Whether the customer chooses the special identifier or BigLedger does.
3. Whether a customer ever needs to know their participant ID at all, or only their counterparty's.

## Why it matters

`peppol-configuration.md` is one of only six e-invoice guides and its central instruction may be
wrong. It should not be rewritten until this is settled.
