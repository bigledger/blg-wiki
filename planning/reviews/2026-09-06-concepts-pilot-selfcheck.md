---
date: 2026-09-06
scope: ADR-0006 §1 / planning/specs/concepts-layer.md — the three-page e-invoice concepts pilot
mode: self-check, required by the spec's definition of done
question: did the pilot make the guides better, or just longer to navigate?
verdict: better, but narrowly — and for a reason that partly undercuts the ADR's argument
---

# Concepts pilot self-check

The spec requires one question answered without spin. Here it is, with the evidence for both sides
and the recommendation that follows.

## What was built

- `content/en/modules-v2/e-invoice/concepts/` — `_index.md` plus `consolidated-e-invoice.md`
  (680 words), `pools-and-queues.md` (672) and `validation-and-clearance.md` (721). All inside the
  spec's 300–800 band, all six required sections, all sourced against
  `blg-akaun-platform-java@1ff620ef0e` and the eleven `kb/topics/e-invoice*` notes.
- Six guides edited to link out: the guides index, `malaysia-e-invoice-guide`,
  `einvoice-pools-and-routing`, `einvoice-validation`, `einvoice-month-end`,
  `einvoice-cancel-and-correct`.
- The module hub now leads with the concepts block above the guide block; `core-concepts/` was
  reframed as the architecture layer beneath it.

Every guide kept its inline failure warnings. Nothing that tells a reader mid-task what goes wrong
was moved to a concept page.

## The case that it made the guides better

**1. One guide is genuinely shorter and clearer.** `einvoice-pools-and-routing.md` carried a
"Who lands here / Default outcome / Available actions" block per pool, immediately below a nine-row
routing table that already answered "who lands here" for every case, and above a comparison table
that already answered "default outcome". Twelve lines of restatement are gone. What is left —
"What you can do in each pool" — is the only part that was ever unique to that section.

**2. A reader with a broken document acts sooner.** `einvoice-validation.md` opened with two
paragraphs defining two failure modes. It now opens with a two-item check ("held in a pool" vs
"submitted then Invalid") and a link for the reader who wants the model. The page's job is
troubleshooting; it now starts troubleshooting on line one.

**3. The month-end preamble now leads with the fact that matters.** The old
"What you need to know first" block gave three definitions of equal weight. The one a month-end
reader must have — *To IRB E-Invoice* carries live status, *Submission History* does not — was
third. It is now the standalone sentence before the warning callout.

**4. Three principles now exist in one place instead of being implicit in four.** "Processed does
not mean submitted", "nothing retries itself", and "Submitted is not Valid" were each spread across
pages as local warnings. They are now stated once as behaviour of the system, with the source
citation, and the local warnings still stand where a reader meets them.

## The case that it just made things longer to navigate

**1. Every measurable win above is a de-duplication win, not a concepts win.** Deleting twelve
duplicated lines from the pools guide required somebody to notice the duplication. It did not
require a concepts layer. The layer is where the text went; it is not why removing it helped. That
is a weaker result than the ADR predicted, which was that a reader meeting a term mid-procedure
would be unstuck by having a page to go to.

**2. The concepts are in a different top-level section from the guides.** A reader working the
month-end close on `/guides/einvoice-guides/` is now sent to `/modules-v2/e-invoice/concepts/`.
AWS — the stated bar — does not do this: its concepts sit inside the same service's user guide, one
level up from the procedures. The ADR rejected a site-wide `/concepts/` for good reasons, but
"per module" resolved to "inside `modules-v2/`", which is the architecture section, not the reading
path. This is the single weakest structural decision in the pilot.

**3. There are now two sibling sections called "Concepts" and "Core Concepts".** `core-concepts/`
already existed under `modules-v2/e-invoice/` and holds the clearance-lifecycle and PEPPOL-routing
architecture. I followed the spec's path and mitigated the collision with cross-links and a reframed
opening on `core-concepts/`. Cross-links are a patch, not a fix. See
`planning/discussions/2026-09-06-concepts-vs-core-concepts.md`.

**4. Nothing on the GPT review's P0 list is touched by this work.** That review's blocking
complaints were missing procedures: the MyInvois intermediary appointment, a real
BigLedger-to-LHDN reconciliation, the credit-note walkthrough, PEPPOL. Those are the reasons a
reader still needs a trainer. The concepts layer addresses a lesser complaint — a term met without
a definition — and it addresses it well. It does not move the section toward the bar Vincent set.

**5. Three pages is a thin sample, and only one of them is really a cross-cutting concept.**
"Consolidated e-invoice" genuinely spans five guides and deserves its own page. "Pools and queues"
has a natural home in the pools guide, and "validation and clearance" in the validation guide; both
were extracted because the spec's table said to, not because a reader was demonstrably stuck.

## Verdict

**Better — but by less than the rework cost, and mostly through de-duplication that the layer
prompted rather than delivered.** The guides are shorter and start faster; no guide lost a warning;
no reader is worse off. But the ADR's central claim — that a concepts layer is what separates our
documentation from AWS's — is not supported by this pilot. What separates them is still procedures
a reader can complete unaided.

## Recommendation

Do not roll the layer out to a second module yet. Three things first, in this order:

1. **Resolve the `concepts/` vs `core-concepts/` collision** for e-invoice, and decide the rule for
   every other module before any of them grows a second section with almost the same name.
   Discussion opened; this is a spec amendment, not a judgement call in the moment.
2. **Decide whether concepts belong under `modules-v2/` or beside the guides.** If a reader in a
   guide is the primary audience — and for e-invoice they demonstrably are — the current location
   costs a section switch on every link. This may be an ADR-0006 amendment.
3. **Close at least one P0 procedural gap** from `2026-09-06-gpt-5.6-sol-einvoice-guide-set.md`, and
   see whether the concept pages make writing it cheaper. That is the ADR's actual promise —
   "both are cheaper once concepts exist" — and it is testable. If writing the go-live guide is not
   measurably easier for having the three concept pages, the layer is decoration.

If the answer to 3 is yes, roll out. If it is no, the ADR should be revisited as it says it will be.
