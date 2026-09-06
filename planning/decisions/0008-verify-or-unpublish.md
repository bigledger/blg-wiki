---
status: accepted
date: 2026-09-06
authorised_by: Vincent (2026-09-06, in session)
relates_to: 0002-applet-existence-and-naming.md, 0007-built-but-unregistered-applets.md
---

# ADR-0008: Content that source contradicts, or that nobody can confirm, is unpublished to the worklog

## Context

Vincent, 2026-09-06: *"some of the information in blg-wiki right now is not correct / inaccurate,
as you can probably discover it, when looking at the source code, we can unpublish the parts that
are not sure, not confirmed, and put them into the worklog."*

Today alone produced the evidence for this: the `/developers/` REST reference documented an API
that does not exist (24 of 240 endpoints real); `architecture/` claimed a Node/Express/Kubernetes
stack against a Java/Spring Boot backend **and** asserted SOC 2, ISO 27001 and GDPR compliance
nobody has verified; the e-invoice guides instructed readers to perform a daily task no customer has
ever been able to do; the Workflow Design page claimed webhooks, delegation and version control
that do not exist. Thirty-two lane runs have found the same pattern in `applets/`.

**The scale forces a threshold.** `content/en` holds 618 pages. Only **105** carry a `sources:`
map — essentially the applet pages the lanes have rebuilt. **496 have never been checked against
anything.** Read literally, "unpublish what is not confirmed" removes four fifths of the wiki,
including a great deal that is probably fine. Read too loosely it changes nothing. So this ADR
sets the threshold, and the threshold is about **reader harm**, not about whether a page happens
to have been audited yet.

## Decision

### The three tiers

**Tier 1 — Contradicted by source. Unpublish immediately, no discussion.**
The page states something the code, the registry or the database disproves: an endpoint that does
not exist, a screen that was removed, a setting that is never read, a behaviour that is the
reverse of what the backend does, a certification we cannot evidence. Any agent or session may act
on this the moment it is proven, and must record it in the worklog.

**Tier 2 — Unverifiable and load-bearing. Unpublish.**
Nobody can confirm it *and* a reader would act on it: a procedure to follow, an endpoint to call,
a setting to change, a number to plan against, a compliance claim. If it cannot be confirmed and
acting on it could waste a reader's day or mislead a decision, it does not stay up.

**Tier 3 — Unverified, plausible, non-actionable. Keep, and queue for audit.**
Overviews, orientation prose, descriptions of what a module is for. A reader cannot be led into
error by a page that only orients. These are the bulk of the 496 and they are an audit backlog,
not an unpublishing backlog.

**When a page mixes tiers, the page goes.** `purchasing.md` was the lesson: 10 real endpoints
under 28 fabricated ones is worse than nothing, because a reader cannot tell which is which.
Salvage the verified fragment into the worklog note so the rewrite starts from it.

### The worklog

Unpublished material goes to `planning/worklog/`, never to deletion. Each item is one file:

```
planning/worklog/YYYY-MM-DD-<slug>.md
```

with front matter recording `unpublished_from` (the live URL), `reason` (tier + one line),
`evidence` (file:line or query that proves it), `salvage` (what in it was true), and
`to_rewrite` (what a correct page would need). The page's own content follows, verbatim.

Two mechanisms, chosen by whether the URL should survive:

- **`draft: true` in place** — the page keeps its path and comes back when rewritten. Use this
  when a correct page will occupy the same URL. The file stays in `content/`, so it is excluded
  from published-content lints but is not lost.
- **Move to `planning/worklog/`** — for material that should not reoccupy that URL, with an alias
  added to the nearest correct page so inbound links do not 404.

### Guard rails, because this is a broad licence

1. **Evidence before removal.** A tier-1 or tier-2 call needs the file:line, query or command that
   proves it, recorded in the worklog entry. "It looks wrong" is not a reason; it is a reason to
   go and check.
2. **Never delete.** Everything is recoverable from the worklog or from `draft: true`.
3. **Inbound links are repaired in the same commit.** The recurring failure in this repo is a page
   moving without its links.
4. **Unpublishing more than five pages at once is reported to Vincent** in the same turn, with the
   count and the tier for each. Individual pages need no approval; a visible hole in the site does.
5. **Sections are not unpublished wholesale** on the strength of a sample. Audit, then act page by
   page.
6. **A tier-3 page is never unpublished for being unaudited.** Absence of a `sources:` map is not
   evidence of error.

### What this changes about how units work

Every writing or lane unit already verifies before publishing. From now on they also carry the
authority to unpublish what they disprove along the way, rather than filing a finding and leaving
the false page live — which is what happened with `architecture/_index.md`, missed by the audit
that unpublished its own sibling and left live for hours afterwards.

## Consequences

- `planning/worklog/` is created, with a README defining the entry format.
- The 496 unaudited pages become an explicit audit backlog, prioritised by inbound links and by
  how actionable the page is. `guides/` (51 pages, 0 sourced), `modules/` (92, 0) and
  `user-guide/` (59, 0) are the largest untouched blocks.
- The site will visibly shrink before it grows. That is the intended direction: a smaller wiki a
  reader can trust beats a large one they cannot.
- Lints already enforce three specific classes of never-again (blockchain vocabulary, named
  prospects, the core1 surface). Each new class of error found should get one.

## The judgement call I am flagging rather than deciding

Tier 3 keeps 400-odd unverified pages live while they wait for audit. The alternative — unpublish
everything without a `sources:` map and rebuild — is defensible, faster to state, and would leave
roughly 105 pages standing. I have not taken it, because most of those pages orient rather than
instruct, and an empty wiki helps nobody. **If Vincent wants the harder line, this ADR is amended
rather than reinterpreted.**
