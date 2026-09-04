---
status: accepted
date: 2026-09-05
discussion: ../discussions/2026-09-05-applet-existence-audit.md
---

# ADR-0002: An applet page exists only if the registry says so; titles follow the registry

## Context

The wiki documented applets that do not exist (12 with no registry row under any name),
three pages for a DELETED applet, ~12 pages whose titles differ from the product's name for
the same applet, and one page — "MY E-Invoice for Customer & Supplier" — that Vincent
identified as a rename of My E-Invoice Portal. The product's own "Documentation" button
404s for 33 applets because pages moved without aliases.

## Decision

1. **Source of truth:** `bl_applet_hdr` rows with `status = ACTIVE`, **minus** a curated
   exclusion list at `planning/private/applet-exclusions.tsv` (gitignored — it names
   customer-specific applets). A wiki applet page may exist only for a code that passes.
2. **Titles follow the registry name exactly** — it is what users see in the Applet Store.
3. **Every applet page carries `applet_code:` in front matter**, matching the registry
   `code`. This is the machine-checkable link and the permanent fix for title drift.
4. **Customer-specific applets** are excluded from the public wiki. One generic page under
   `applets/` explains that bespoke integrations exist, without naming customers or listing them.
5. **Pages for non-existent applets are archived to `planning/archive/`**, never deleted,
   and removed from nav and inbound links. The E-Invoice Customer & Supplier page is merged
   into My E-Invoice Portal and its URL aliased there.
6. **A parity check** (`tests/applet-registry-parity.sh`, runs on the box with the DB
   tunnel) fails when a page has no ACTIVE code or a registry `documentation_url` does not
   resolve to a content file.

## Consequences

- First batch: `aliases:` for the 33 broken product→wiki URLs (approved, customer-visible).
- Second batch: archive the 12 + the DELETED-applet trio; merge the renamed page.
- Third batch: retitle ~12 pages; add `applet_code:` across all of `applets/`.
- Backlog: ~40 general-purpose ACTIVE applets have no page. Separate discussion.

## Alternatives rejected

- Registry ACTIVE alone — would have passed the renamed row.
- A hand-curated list — accurate but rots.
- Editorial titles mapped only via `applet_code:` — users search the store name.
- Documenting customer-specific applets anonymised — high effort, doubtful value.
