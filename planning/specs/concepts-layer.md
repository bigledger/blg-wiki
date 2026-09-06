---
status: approved
date: 2026-09-06
adr: ../decisions/0006-concepts-layer-and-error-index.md
pilot: modules-v2/e-invoice
---

# Spec: the per-module concepts layer

Implements ADR-0006 §1. This spec gates every `concepts/` page. Read it before writing one.

## What a concept page is

A concept page answers **"what is this, and why does it exist"** for a reader who has just met
the term and cannot proceed without understanding it. It is the page a guide links to on
first mention so the guide does not have to stop and explain.

It is **not** a guide (no steps, no menu paths, no "click Save"), **not** a reference card
(no field tables, no types and defaults), and **not** a glossary entry (a glossary is one
line; a concept page is the paragraph that makes the line make sense).

**The test:** if the reader could act on the page without a guide, it is a guide. If the
reader could not understand the guide without the page, it is a concept.

## Where it lives

```
content/en/modules-v2/<module>/concepts/
  _index.md               ← lists the module's concepts, one line each
  <concept-slug>.md
```

Ownership rules from the ADR: one module owns each concept; a shared concept is owned by the
module that implements it and linked from the others; genuine ambiguity opens a discussion in
`planning/discussions/` rather than being decided in the moment.

## Front matter

```yaml
---
title: "Consolidated e-invoices"        # the concept as a reader would say it, not the identifier
description: "..."                      # one sentence, used by search and the cards
page_type: concept
weight: 10                              # reading order within the module's concepts
module: e-invoice
related_concepts: [pools-and-queues]
guides: [/guides/einvoice-guides/einvoice-month-end/]
sources:                                # same discipline as the applet standard
  behaviour: "..."
---
```

No duplicate H1 (CLAUDE.md). Title is the plain-English name; the system identifier, if there
is one, appears once in the body and never as a heading.

## Required shape

```
1. Front matter
2. One-paragraph answer. The whole concept in 2–4 sentences, in plain English. A reader who
   stops here should already be unstuck.
3. Why it exists. The business or regulatory reason. This is the part a reference card never
   has and the part that makes the rest memorable.
4. How it behaves in BigLedger. What the system actually does — sourced, cited, no steps.
   Translate identifiers: "the Batch Pool (BATCH_POOL)" once, then plain English.
5. What it is NOT. The confusion this concept is most often mistaken for. This section earns
   its place on nearly every page — most support load is a mistaken adjacent concept.
6. Where you meet it. Links to the guides and applet pages where the reader will act on it.
```

Sections 5 and 6 are mandatory. Section 4 may be short; sections 2 and 3 may not be skipped.

## Length

**300–800 words.** A concept page that runs past 800 words is either two concepts or has
grown steps and should be split. Under 300 and it is a glossary line — put it in the module
index instead.

## Voice

CLAUDE.md's voice rules apply in full: second person, plain English before jargon, active
voice, concrete numbers. The running example (GadgetSphere Sdn Bhd) is used **only where a
number makes the concept clearer** — a concept page is allowed to be abstract in a way a
guide is not, and forcing the example in makes it worse. Where it is used, it must be the
same GadgetSphere as everywhere else.

## What changes in the guides

When a concept page ships, every guide that explains the same thing inline is edited in the
same commit to link out instead:

- The guide's "What you need to know first" block becomes a short list of concept links, plus
  any genuinely task-specific framing that does not belong on the concept page.
- The first mention in the body links to the concept.
- **The guide keeps its inline failure warnings.** A reader mid-task must not be sent away to
  find out what goes wrong.

This edit is not optional and not deferred — an unlinked concept page is invisible, and a
guide that still re-explains the concept is exactly the drift the ADR exists to stop.

## Pilot: e-invoice

First three pages, from the blocks currently repeated across the guides:

| Slug | Owns the explanation of | Replaces the inline block in |
|---|---|---|
| `consolidated-e-invoice.md` | What a consolidated e-invoice is, General Public buyer, why RM 10,000 is a hard boundary | `einvoice-month-end.md`, `einvoice-pools-and-routing.md`, `_index.md` |
| `pools-and-queues.md` | The three pools and the queues, which drain themselves and which do not, why a document lands in each | `einvoice-month-end.md`, `einvoice-pools-and-routing.md`, `einvoice-validation.md` |
| `validation-and-clearance.md` | What LHDN validation is, what Valid actually means, the 72-hour consequence of it, why Submission History is not status | `einvoice-validation.md`, `einvoice-cancel-and-correct.md`, `einvoice-month-end.md` |

Candidates for the second pass, if the pilot holds: `self-billed-e-invoice` (blocked on
F-0227), `peppol-and-lhdn-side-by-side` (blocked on F-0228), `e-invoice-identity-and-tin`.

## Definition of done for the pilot

- Three concept pages plus `concepts/_index.md`, all sourced and cited.
- Six guide edits linking out, with the duplicated blocks removed.
- The module hub links the concepts layer above the guides — concepts come first in reading
  order for a new reader.
- Broken links do not increase; `tests/content-lint.sh` clean; the deploy gate passes.
- A short note in `planning/reviews/` answering one question honestly: **did the pilot make
  the guides better, or just longer to navigate?** If the answer is "just longer", the ADR is
  revisited before the layer is rolled out to a second module.
