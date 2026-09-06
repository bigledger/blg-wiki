---
status: open
started: 2026-09-06
participants: Vincent, Claude
supersedes-working-mode-in: ../lanes/PROMPT.md
related:
  - 2026-09-05-content-folder-restructure.md
  - ../decisions/0001-content-folder-restructure.md
---

# The bar is AWS documentation — and the working mode changes to match

Vincent (2026-09-06):

> "i don't mind being slow, but i would prefer, the agents to be running slowly, reading the
> materials, emails, creating drafts, review, and then study existing content in the wiki, do some
> planning of the content, identify the missing part, do some internet search, and then propose the
> content, and restructure the wiki if necessary... basically, my intention is to have a
> comprehensive, cohesive, useful content at the wiki"

> "if you study the aws documentation, nobody needs any training or instructor, they can just read
> the documentation and users will know how to use the aws cloud. We want our documentation to be as
> good, if not better than the aws documentation"

## What that means, concretely

**The test of success is self-sufficiency:** a new finance clerk, warehouse supervisor or developer
can do their job from the wiki alone — no instructor, no support ticket, no tribal knowledge.

AWS achieves that with a **fixed per-service shape** the reader learns once and then navigates
everywhere. Ours must have the same property. Mapped onto BigLedger (module ≈ AWS service,
applet ≈ AWS feature/API):

| AWS layer | What it does | Our equivalent | State today |
|---|---|---|---|
| *What is X?* | one page: what the service is, who it is for, what it is not | module overview | thin / marketing |
| *How it works* | the concepts and the mental model, with diagrams | **missing entirely** | — |
| *Getting started* | one end-to-end tutorial on a realistic example | `getting-started/` | thin |
| *How-to guides* | one page per task the reader wants to accomplish | `how-to/` (ADR-0001) | scattered, invented |
| *Reference* | every field, setting, permission, error, limit | `applets/` | **76 pages done, code-derived** |
| *Troubleshooting* | symptom → cause → fix | inside applet pages | good, growing |
| *Best practices* | how to use it well, what to avoid | — | missing |
| *Quotas & limits* | the hard numbers | — | missing |
| *Document history* | what changed and when | — | missing |

**The reference layer is the one we have.** Everything above it is missing or invented. That is the
gap between where we are and the AWS bar — and it is why the applet pass, though necessary, is not
sufficient.

## The working mode changes

The lane model (one applet page per run, source → standard) built the reference layer well. It is
the wrong shape for the layers above it. New mode for content work, per Vincent's list:

1. **Read the materials** — intranet, e-mail, Drive, issues, code — into `kb/topics/` first.
2. **Study what the wiki already says** on the subject; name what is wrong, thin or missing.
3. **Plan the content** — an outline for the page set, not one page at a time.
4. **Look outward** — how do AWS / Stripe / Xero present this kind of thing? Borrow the shape.
5. **Draft** in `planning/drafts/`, **review** (codex second opinion, and against the facts in
   `kb/topics/`), then publish.
6. **Restructure when the content demands it** — ADR-0001 is the tree; extend it if a layer is
   missing (a `concepts/` layer looks likely).

Slower per page, and correct. Explicitly: **quality over throughput; no page ships that a reader
could not act on.**

## Immediate consequences

- The applet pass finishes (2 pages left in lane 4, 7 in lane 3), then lanes convert to this mode.
- The **e-invoice set is the pilot**: deep intranet ingest (running 2026-09-06) → plan → concept
  page + six guides + module hub, written from `kb/topics/`, reviewed, then shipped.
- A **documentation architecture** unit produces the target shape (the table above, filled in per
  module) and the gap list, extending ADR-0001 with the missing layers.
- `planning/lanes/PROMPT.md` stays as the *reference-page* prompt; a second prompt is written for
  content work in this mode.

## Open for Vincent

1. Confirm the layer table above is the target shape (especially: add a `concepts/` layer).
2. Which module is the pilot after e-invoice — order-to-cash, or the setup/master-data set?
3. Are quotas/limits publishable (they need product input)?
