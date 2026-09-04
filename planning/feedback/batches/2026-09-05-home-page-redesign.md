---
status: done
date: 2026-09-05
items: F-0006, F-0012
decision: ../../decisions/0004-docs-home-is-a-reader-hub.md
commit: (see git log — "Redesign the documentation home page")
---

# Batch: home page redesign

## Analysis

See the discussion and ADR-0004. Root causes: the `hextra-home` layout's `items-start`
wrapper shrinking every un-sized block to 483 px, and marketing content on a docs site.
Vincent approved all five recommendations (map, shape, search box, no industries row,
neutral hero) on 2026-09-05.

## Changes

- `content/en/_index.md` — replaced with the reader-intent hub (hero + platform map,
  search, 8 intent cards, 8 role cards, 3 reference cards, 5 popular links, help line).
- `layouts/shortcodes/hero-split.html` — two-column hero using Hextra's own grid classes.
- `layouts/shortcodes/platform-map.html` + `layouts/_partials/shortcodes/platform-map-inline.html`
  — the generated SVG platform map (`currentColor`, dark-mode safe).
- `content/en/home-draft/` — removed (was the temporary preview).

## Verified

Local: build, lychee (baseline unchanged), Playwright 42/42; measured grid 1,392 px / 3
columns, 2.3 screens desktop. Live: see ship log in the commit.

## Found on the way

- F-0018: zh/ms/ar home pages need the same treatment.

## Not done

- Re-pointing the eight intent cards to the ADR-0001 tree — after the restructure.
- Analytics-driven "Popular right now".
