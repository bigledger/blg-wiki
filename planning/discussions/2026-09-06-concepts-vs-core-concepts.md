---
topic: Two sibling sections named "Concepts" and "Core Concepts" inside every modules-v2 module
raised: 2026-09-06
by: concepts-layer pilot unit (ADR-0006 §1)
status: open
relates_to: ../decisions/0006-concepts-layer-and-error-index.md, ../specs/concepts-layer.md
---

# `concepts/` vs `core-concepts/` under `modules-v2/`

## What happened

`planning/specs/concepts-layer.md` places the new layer at
`content/en/modules-v2/<module>/concepts/`. Implementing the e-invoice pilot created that folder
next to a `core-concepts/` folder that already existed and is linked from the module hub's Learning
Roadmap as step 1.

The reader now sees two sections with nearly the same name in the same left-hand menu:

| | `concepts/` (new) | `core-concepts/` (existing) |
|---|---|---|
| Answers | what is a consolidated e-invoice, a pool, a validation | how clearance, signing and PEPPOL routing work |
| Audience | somebody about to follow a guide | somebody planning an integration |
| Voice | plain English, second person | architecture, tables, applet map |
| Length | 300–800 words per concept | one page |

Neither is wrong. The names do not distinguish them, and "Core" implies the *more* fundamental of
the two, which is the opposite of the reading order we now recommend.

## What the pilot did as a stopgap

- `concepts/` given `weight: 10` so it sorts above `core-concepts/` (20).
- `core-concepts/_index.md` reframed in its opening line as the architecture layer, with a link back.
- The hub's Learning Roadmap now lists Concepts as step 1 and Core Concepts as step 2.

That is a patch. It does not stop the same collision appearing in every other module the layer is
rolled out to — `modules-v2/` has a `core-concepts/` folder in most of them.

## The options

1. **Rename `core-concepts/` to `architecture/`** in every module. Accurate, and it makes the pair
   read as a progression. Costs redirects (`aliases:`) and touches every module hub. Vincent has
   previously preferred housekeeping over URL stability, which favours this.
2. **Merge the two.** Put the plain-English pages and the architecture page in one `concepts/`
   section, ordered plain-English first. Fewest sections; risks the reference voice bleeding into
   the concept pages, which is exactly the failure mode CLAUDE.md opens with.
3. **Move the new layer beside the guides** — `content/en/guides/einvoice-guides/concepts/` — and
   leave `core-concepts/` alone. Solves the collision *and* the section-switch problem raised in
   `planning/reviews/2026-09-06-concepts-pilot-selfcheck.md`, but contradicts ADR-0006's "concepts
   live per module", and a concept owned by a module with no guide section has nowhere to go.
4. **Do nothing.** Two similarly named sections, mitigated by cross-links. Cheapest today, and it
   compounds with every module added.

## Recommendation

Option 1, with option 3 considered on its own merits as a separate question about where the reading
path lives. Both are spec amendments; neither should be decided inside a writing unit.

## What is blocked until this is decided

Rolling the concepts layer out to a second module. The e-invoice pilot stands as written either way
— only the folder name and its location would change, and both are `aliases:`-able.
