# Questions for Vincent

Things **only Vincent can answer** — decisions, confirmations, and verifications that no amount of
source reading will settle. Kept separate from `planning/feedback/` (proofreading and doc fixes)
and from `planning/product/` (defects and enhancements for the engineers).

Vincent, 2026-09-06: *"you can have some sub-folders to store questions, verification, confirmation
that you need to ask me, and from time to time, i will ask you to show me to questions, and give
you tips."*

## How to use it

- **`INDEX.md` is the review surface.** When Vincent asks to see the questions, show him that —
  it is ordered so the most expensive-to-leave-open sit at the top, and each line is short enough
  to answer in a sentence.
- **`open/`** holds one file per question that needs more than a line of context: what we know,
  what we cannot determine, why it blocks, and the options with a recommendation.
- **`answered/`** is where a question moves once Vincent answers, with his answer and the date
  recorded in the front matter. Never edit the question away — the answer plus its question is the
  record of why the wiki says what it says.

## What belongs here

- A decision about what the wiki should say or do (structure, publication, tone).
- A confirmation of product intent that source cannot reveal — "is this deliberate or a bug".
- A fact only BigLedger holds — whether an address is monitored, whether a certification is held,
  whether an applet is meant to be registered.

## What does NOT belong here

- **Source ambiguity** an agent could resolve by reading more → `kb/questions/`.
- **A defect or an enhancement** for the engineers → `planning/product/`.
- **A wiki mistake** Vincent spotted → `planning/feedback/inbox.md`.

## Writing one

```markdown
---
id: Q-0001
opened: 2026-09-06
blocks: "F-0219, the MyInvois setup guide"
urgency: high      # high = work is stopped · medium = work continues degraded · low = tidy-up
---

# The question, as a single sentence ending in a question mark

**What we know** — two or three lines, sourced.
**What we cannot determine** — and why source will not settle it.
**Why it blocks** — what is stopped or wrong until it is answered.
**Options** — with a recommendation, so the answer can be one word.
```
