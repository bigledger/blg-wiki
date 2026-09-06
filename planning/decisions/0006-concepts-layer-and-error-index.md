---
status: accepted
date: 2026-09-06
decided_by: Vincent (2026-09-06, in session)
supersedes: none
relates_to: 0001-content-folder-restructure.md, ../specs/applet-page-standard.md
---

# ADR-0006: The wiki gains a concepts layer per module and a source-generated error index

## Context

The standard Vincent set is explicit: *"if you study the aws documentation, nobody needs any
training or instructor, they can just read the documentation and users will know how to use
the aws cloud. We want our documentation to be as good, if not better than the aws
documentation."*

Our accuracy problem is largely solved — we triangulate the Java backend, the applet Angular
source and the read-only production tenants, and a claim needs two of the three. What AWS has
that we do not is **structure**. Two gaps account for most of the difference a reader feels:

1. **No concepts layer.** AWS explains what a thing *is* before it explains how to do
   something with it. Our guides jump straight to steps, so a reader meets "Batch Pool" or
   "consolidated e-invoice" for the first time in the middle of a procedure and has to infer
   it. The current workaround — a "What you need to know first" section in each guide — was
   used in the new e-invoice guides and immediately showed the cost: the same three concepts
   are now explained, slightly differently, on four pages. That is drift waiting to happen.

2. **No way to search an error.** AWS lets a reader paste an error message and land on the
   fix. Our backend holds every literal error constant it can throw, and the applet Angular
   holds the client-side ones — but a reader who sees *"Cannot move transaction with amount
   more than or equal to 10000."* has no way to find the page that explains it. Meanwhile the
   troubleshooting we do have is scattered across guides, keyed to our headings rather than
   to what the reader actually saw.

Two further AWS traits were considered and are **not** part of this ADR: a ten-minute
getting-started that produces a working result, and quotas/limits as a single table. Both are
real gaps; both are cheaper once concepts exist, so they wait.

## Decision

### 1. Concepts live per module, not site-wide

Each module gets a `concepts/` folder beside its `_index.md`:

```
content/en/modules-v2/e-invoice/
  concepts/
    _index.md
    consolidated-e-invoice.md
    pools-and-queues.md
    validation-and-clearance.md
  _index.md
```

Rules:

- **A concept page answers "what is this and why does it exist".** It does not contain steps,
  menu paths, or field tables. If it tells the reader to click something, it is a guide.
- **A concept is owned by exactly one module.** A concept two modules share (document
  approval, moving average costing) is owned by the module that implements it and linked
  from the other. If ownership is genuinely ambiguous, that is a discussion, not a coin flip.
- **Guides link to the concept on first mention** and then get on with the task. The
  "What you need to know first" block shrinks to a line of links once the concept exists.
- **Concept pages carry the same sourcing discipline as everything else** — the behaviour
  described must be verifiable in the backend, the applet source, or tenant data, cited in
  the page's `sources:` map.
- Front matter adds `page_type: concept`.

A single site-wide `/concepts/` was rejected: accounting and inventory concepts have nothing
to do with each other, the folder becomes an unowned glossary, and the module hub loses the
thing that makes it a hub.

### 2. The error index is generated from source, site-wide

One searchable reference, built by extracting every user-visible error constant from
`blg-akaun-platform-java` and the client-side messages from the applet repos, each mapped to
a plain-English cause and fix.

Rules:

- **Keyed on the literal string the reader sees**, not on our name for the problem. The
  reader pastes what is on their screen.
- **Generated, then annotated.** A tool produces the inventory of constants; a human (or an
  agent, sourced) writes cause and fix. The inventory is regenerable; the annotations are
  content and are preserved across regeneration by error key.
- **Ranked by real frequency where we have it.** Tenant data tells us which errors actually
  happen — an error that fires 322 times is not the same as one that has never fired.
  Frequency counts are aggregate patterns only; no tenant is identifiable (ADR privacy rules
  and CLAUDE.md apply unchanged).
- **Guides link into it; it does not replace guide troubleshooting.** A guide still names the
  most common failure inline, because a reader mid-task should not have to leave the page.
  The index is for the reader who arrives from a search engine holding an error string.
- Errors that no user can ever see (internal assertions, developer-only paths) are excluded.
  An index padded with unreachable errors is worse than a short one.

## Consequences

- Both are structural changes to `content/en/`, so each needs a spec in `planning/specs/`
  citing this ADR before any page is written. Two specs follow: `concepts-layer.md` and
  `error-index.md`.
- The e-invoice module is the pilot for both — it is the section we have just finished, it
  has the best source coverage, and it has real rejection-frequency data to rank by.
- The four repeated "What you need to know first" blocks in the e-invoice guides become the
  first three concept pages; those guides then get an editing pass to link out instead of
  re-explaining. This is rework we accepted knowingly.
- ADR-0001's tree gains a per-module `concepts/` level. The two are compatible: ADR-0001
  moves sections around, this ADR adds a layer inside `modules-v2/`.
- The error index needs a generator under `kb/tools/`, a stable error-key format, and a
  regeneration story that does not destroy written annotations. That is the main engineering
  cost and it is front-loaded.

## Alternatives rejected

- **One site-wide `/concepts/`** — unowned, incoherent across domains, weakens module hubs.
- **Keep concepts inside guides** — cheapest, and it is what we have; it produced four
  slightly different explanations of the same three concepts within a single day's writing.
- **Hand-written troubleshooting only** — does not scale, cannot be keyed to strings we do
  not know we throw, and goes stale silently when a message changes in the backend.
