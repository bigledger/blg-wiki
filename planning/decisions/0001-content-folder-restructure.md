---
status: accepted
date: 2026-09-05
discussion: ../discussions/2026-09-05-content-folder-restructure.md
reviews:
  - ../reviews/2026-09-05-gpt-5.5-content-folder-restructure.md
  - ../reviews/2026-09-05-gpt-5.6-sol-content-folder-restructure-rulings.md
---

# ADR-0001: One `user-guide/` umbrella; sections named by reader intent; processes named after the process, never the module

## Context

`guides/` and `user-guide/` were two umbrellas no reader could tell apart. Version suffixes
(`-v2`) had leaked into public URLs. `guides/sales-guides/` repeated itself. Workflow folders
in an early draft were named after modules, which hides the one thing that makes a workflow
a workflow. Vincent's brief: change every URL if needed; optimise for long-term usability.

## Decision

```
content/en/
  user-guide/            the ONE reader-facing umbrella (matches the top-nav label)
    getting-started/
    setup/               one-time go-live configuration
    how-to/              one outcome per page
    processes/           cross-module, end-to-end journeys
      order-to-cash/         title: "Sell, deliver and get paid (order to cash)"
      procure-to-pay/        title: "Buy, receive and pay suppliers (procure to pay)"
      record-to-report/      title: "Close the books (record to report)"
    roles/               hub pages by job function — link out, own nothing
    industries/          hub pages by industry — link out, own nothing
    training/            video libraries (today's *-v2 hubs) + demo platform
  modules/   applets/   developers/   support/
```

Rules:
1. A process folder is never named after a module. Slug = ERP term of art (Vincent's call —
   compact, searchable); the page **title** leads with plain English per CLAUDE.md.
2. "Workflow" is a BigLedger product term (`applets/*-workflow/`); it is not a folder name.
3. No version suffix ever appears in a URL.
4. Every moved page gets `aliases:` for every URL it ever had. Translations (`zh/`, `ms/`,
   `ar/`) move in the same commit as their English twin.
5. No structural move happens until the v1-vs-v2 content winner is chosen per section
   (Claude recommends, Vincent approves per section) and an approved spec exists.

## Consequences

- ~700 inbound links rewritten; `hugo.yaml` `menu:` rewritten (removes 5 dead pageRefs);
  the two JS-redirect pages removed; a section-weight pass.
- `reports/`, `administration/`, `demos/`, `business-operations/`, `tutorials/`,
  `applications/`, and the root marketing pages dissolve into the tree above.
- The rename fixes the shelf, not the voice. The guide rewrite is separate work.

## Alternatives rejected

- Two umbrellas (status quo) — the root cause.
- Flat siblings at root — 13 sidebar entries; blurs the top-bar split.
- `tasks/` + `workflows/` — unpredictable names; "workflows" collides with the product term.
- `views/` for roles/industries — IA-speak in a public URL.
- Plain-English process slugs (`customer-orders-to-payment`) — recommended by both
  reviewers and Claude; Vincent chose the ERP terms for the slug, plain English for the title.
