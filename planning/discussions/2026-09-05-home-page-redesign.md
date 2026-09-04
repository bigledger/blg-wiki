---
status: open
started: 2026-09-05
participants: Vincent, Claude
trigger: feedback F-0006
related:
  - ../decisions/0001-content-folder-restructure.md
---

# Home page redesign

Vincent (2026-09-05): *"The home page https://wiki.bigledger.com/ is quite ugly too, need redesign."*

## Not started — questions to settle before any design work

1. **What is the home page for?** A docs home usually has one job: get the reader to the
   right section in one click. Candidates for the primary paths, per ADR-0001: Getting
   started · Set up · How-to · Business processes · Modules · Applets · Developers · Support.
2. **Sequencing.** The home page must link into the *new* tree. Redesign lands with or after
   the restructure, not before — otherwise it is built twice.
3. **Constraints.** Hextra: no inline-styled divs, no CSS grid in markdown (CLAUDE.md).
   Hextra's own hero components (`hextra/hero-*`, `cards`) are the toolkit; anything beyond
   that is a `layouts/` override, which is allowed but must stay theme-upgrade-safe.
4. **Reference points.** Xero Central, QuickBooks support home, Stripe docs home — each is a
   search box + 6–8 large entry cards + a thin "popular" strip. Nothing else.
5. **What is wrong with the current one, specifically?** To be captured from Vincent —
   density? visual style? wrong entry points? all three? (See inbox F-0006.)

## Next steps

- [ ] Vincent: what specifically is wrong (item 5) and any reference site he likes
- [ ] Claude: mockup as a `planning/drafts/home/` artifact or design canvas for review
- [ ] Spec after ADR-0001 implementation is scheduled
