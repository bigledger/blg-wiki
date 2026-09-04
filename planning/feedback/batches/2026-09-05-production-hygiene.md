---
status: done
date: 2026-09-05
items: F-0014, F-0015, F-0016
decision: —
commit: (see git log — "Fix production hygiene defects")
---

# Batch: production hygiene — conflict markers, leaked AI transcript, dead links

## Analysis

All three surfaced from the GPT-5.6-sol strategy review and were verified live. The common
cause is F-0017: nothing gates a deploy, so a page with unresolved Git conflict markers and a
page ending in a raw tool-call transcript both reached production and stayed there.

## Changes

- `content/en/applets/master-data/cashbook-applet.md` — resolved a stash/upstream conflict
  spanning 19 marker lines. Kept the flat numbered version (the "Stashed changes" side);
  the "Updated upstream" side was a half-converted tabs layout with no closing tag. Its only
  unique content (Automatic Bank Charges, Branch Linking) also existed on the kept side in
  flattened, duplicated form; replaced that block with one clean version (sections 4 and 5).
  Fixed 5 lines of mojibake (`â€”` → `—`, `â€œ…â€` → `“…”`, `â€“` → `–`).
- `content/en/support/beginner-guide/cost-and-roi-questions.md` — removed the trailing
  `<function_calls><invoke name="TodoWrite">…` block (3 lines). Only occurrence repo-wide.
- `content/en/_index.md` — `/user-guide/introduction/` (×3, incl. the "Start Free Trial"
  button) → `/user-guide/getting-started/introduction/`; `/ecommerce/` → `/modules-v2/ecommerce/`;
  `…/automotive-and-workshop-industry` → `…/automotive-and-workshop/`; the three `/partners/*`
  cards (no such pages ever existed) collapsed to one card → `https://www.bigledger.com/partners`.
- `layouts/partials/custom/footer.html` — `/privacy`, `/terms`, `/security` → the corporate
  site's `privacy-policy`, `terms-of-service`, `security` pages (all verified 200).

## Verified

`hugo --gc --minify --cleanDestinationDir`: 0 conflict markers in the built cashbook page,
0 `function_calls` in the built FAQ, home page hrefs point at the new targets.

## Found on the way

- The cashbook page names real banks in examples (RHB, CIMB, Hong Leong). Reference pages are
  not bound by the guide rule, but it is worth a policy line. Not logged yet.

## Not done

- F-0017 (quality gate on deploy) — separate batch; it is CI work, not content.
- A wiki-native `/privacy` page — the footer now points off-site, which is honest; an on-wiki
  page is an SEO/GEO item under F-0008.
