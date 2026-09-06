---
date: 2026-09-06
unpublished_from: content/en/user-guide/demo/education/ (11 pages) + content/en/applets/finance/revenue-management-applet.md + content/en/applets/finance/investment-guide.md
url: /user-guide/demo/education/ and its ten children
tier: 2
mechanism: moved
reason: "Eleven published pages addressed by name to one prospect's tender evaluation panel, readable by anyone including a competitor bidding the same tender. The two applet-tree pages carried that tender's module names as if they were shipping applets."
evidence:
  - "content/en/user-guide/demo/education/_index.md — title 'UTM Integrated Financial System Evaluation Guide'; opening line names the institution"
  - "12 files matched 'Universiti Teknologi' or 'UTM' across content/"
  - "revenue-management-applet: no row in bl_applet_hdr (236 rows) and no repo under refs/"
salvage: "The module-by-module evaluation structure is a genuinely good shape for a public-sector or education demo guide, once every prospect-specific reference is removed."
to_rewrite: "If the material is wanted publicly, rewrite as a generic public-sector/education evaluation guide with no named institution and no tender-specific module names. Vincent decided 2026-09-06 to unpublish first and decide the long-term question separately."
---

Moved to `planning/archive/2026-09-06-utm-tender-pages/`. The eleven URLs are aliased to
`/user-guide/demo/` so inbound links redirect rather than 404. Inbound cards were removed from the
English, Malay and Chinese demo indexes in the same commit (`8e122d4c`).

`tests/content-lint.sh` gained a check for named prospect organisations so this class cannot recur.
