# The worklog — what was unpublished, why, and what a correct page would need

Implements ADR-0008. Nothing here is published (Hugo builds `content/` only).

Everything the wiki has taken down for being wrong or unconfirmable lands here, with the evidence
that proved it and whatever in it was salvageable. **Nothing is ever deleted.** A worklog entry is
the brief for the page that replaces it.

## One file per item

`planning/worklog/YYYY-MM-DD-<slug>.md`

```markdown
---
date: 2026-09-06
unpublished_from: /developers/api-reference/sales.md   # the live path it had
url: /developers/api-reference/sales/                  # the URL a reader had bookmarked
tier: 1            # 1 contradicted by source · 2 unverifiable and load-bearing
mechanism: draft   # draft (URL survives, page returns rewritten) | moved (URL aliased elsewhere)
reason: "Documents 38 endpoints under /api/v1/; the backend has zero such mappings."
evidence:
  - "akaun-api Core2Config.java:19-90 — every mapping is under /core2/"
  - "17,256 resolved mappings, 11,180 unique paths, none matching /api/v1"
salvage: "The response-envelope description is correct and worth keeping."
to_rewrite: "Regenerate from the live route table; keep the access-endpoint explanation."
---

<the page's content, verbatim, so nothing is lost>
```

## Rules

- **Evidence is mandatory.** A file:line, a query, or a command whose output proves it. "Looks
  wrong" means go and check, not unpublish.
- **Record the salvage.** The true fragments are the most expensive part to rediscover.
- **Repair inbound links in the same commit** as the unpublish.
- **Tier 3 never appears here.** Unverified-but-harmless pages are an audit backlog, not worklog
  material — see ADR-0008.

## Where things actually live

- `draft: true` pages stay in `content/` and are excluded from published-content lints. The worklog
  entry records the decision; the text stays in place.
- Moved pages live under `planning/archive/` with a worklog entry pointing at them.
