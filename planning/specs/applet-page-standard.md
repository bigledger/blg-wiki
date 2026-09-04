---
status: approved
date: 2026-09-05
decision: ../decisions/0002-applet-existence-and-naming.md
scope: every page under content/en/applets/ (reference docs — dense, precise; NOT the user-guide voice)
---

# Applet page standard — what every applet reference page must contain

The applet page is the **reference card** (CLAUDE.md). It may use tables and system identifiers.
It must be **derived from the applet's source code, the backend, and its GitHub issues** — never
from imagination. Every configuration claim is traceable to a file in `/home/marketing/repos/refs/`.

## Front matter (required keys)

```yaml
title: "<registry name exactly, e.g. Sales Invoice (Internal)>"   # bl_applet_hdr.name
description: "<one sentence: what it does, for whom>"
applet_code: "<bl_applet_hdr.code>"          # the machine-checkable link to the registry
applet_repo: "<refs/ repo dir name>"          # e.g. blg-applet-wavelet-internal-sales-invoice-applet
modules: [financial-accounting, sales-crm]    # module slugs under content/en/modules-v2/
related_applets: [<slug>, <slug>]             # wiki slugs of applets this one depends on / feeds
guides: [/guides/sales-guides/standard-sales-workflow/]   # user guides that use this applet
sources:                                      # repo-relative paths the Configuration section was read from
  - blg-applet-…/src/app/…/settings.component.ts
tags: [...]
weight: <keep existing>
aliases: [<keep existing>]
```

## Body — sections in this order (H2 exactly as written)

1. **Overview** — 2–4 sentences, plain English: what the applet is for, who opens it, where it sits
   in the process (which document comes before, which after). Keep existing good intros.
2. **Where it fits** — module(s), the documents/applets upstream and downstream, one short table
   or bullet list, every item a link.
3. **Screens and menus** — the listing, create/edit form, tabs (Main, Lines, Payment, Delivery…),
   and the applet's own menu items, as they appear in the UI. Existing screenshots stay here.
4. **Configuration** ← the section this programme adds or completes. **Every setting documented must
   pass four proofs — declared (model), rendered (a control exists in a template), persisted (saved
   by the settings service), consumed (read by component/service code). Model-only keys are NOT
   documented. Keys read at runtime without a model declaration go in their own sub-list.** Sub-sections:
   - **Before you can use it** — prerequisites in *other* applets: GL codes / default GL mapping,
     document numbering, tax codes, cashbook/settlement methods, company/branch/location, permissions.
     Each with a link to that applet's page.
   - **Applet settings** — first classify where settings live by reading `app.routing.ts` and the
     settings container: *shared* `FieldConfigurationComponent` (blg-shared-utilities), *applet-local*
     field-configuration component, *branch* settings, *default selection*, *personal*. Say which.
     Then a table with *Setting · What it controls · Default · Effect when changed*. "Default" needs the
     UI initial value or null-patch logic cited. One sentence above the table states who can change
     them (add a column only when authority varies by row).
   - **Document behaviour settings** (document applets only) — status flow options, posting
     behaviour, printables, workflow/approval toggles, e-Invoice submission flags.
   - **Feature visibility / permissions** — what the applet's permission definitions actually gate
     (`bl_applet_client_side_perm_dfn` names, or the repo's permission constants).
5. **Fields** — the create/edit form fields: *Field · Meaning · Required · Notes/validation*.
   One table per tab. Reference voice; this is where "Required / Immutable" belongs.
6. **Lifecycle and effects** (every page; "posting" for document applets) — statuses, allowed
   transitions, and a **posting proof block** taken from the backend, in this fixed form:
   *server document type · amount signum · quantity signum · Dr/Cr equation · GL precedence
   (line GL → header GL → item-company link → company default) · stock processor · what VOID
   reverses*. Cite the `*DataConsistencyObject`, `JournalPostingTypeHandler` and
   `JournalPostingService` lines. Master-data/report applets state what they write or only read.
   Any "must", "blocks", "hard stop", "rejects" claim needs the exact backend validator/throw cited;
   a client-side confirmation dialog is never described as a backend rejection.
7. **Related applets** — bidirectional links; a sentence each on why.
8. **Troubleshooting** — real failure modes from GitHub issues and code (validation messages,
   common misconfigurations), anonymised; symptom → cause → fix.
9. **Related documentation** — the user guides and the module page.

## Rules

- **Registry is truth** (ADR-0002). If the applet has no ACTIVE registry row, do not write the page — report it.
- **Cite in front matter (`sources:`), not in the body — but per section.** `sources:` is a map
  keyed by section (`configuration:`, `fields:`, `lifecycle:`, `troubleshooting:`), each listing
  exact existing files (never directories, never "the database"), plus issue ids where used.
- **Anonymise.** No customer, tenant, or person names — from issues, commit messages, or repo names
  (customer-specific repos are excluded from scope anyway).
- **Do not invent.** If a section cannot be filled from code/issues, write one line of the form
  "No exposed control found (routes and settings components checked at commit <sha>)" — with the
  evidence in `sources:` — never a plausible-sounding guess and never a bare "not configurable".
- **Keep what is good.** Existing accurate prose and screenshots stay; restructure around them.
- **Cross-link both ways.** When you add applet B to A's `related_applets`, add A to B's (B may be
  in another lane — record it in `findings.md` instead of editing outside your lane).
- **Hextra only.** No inline-styled HTML; `{{< figure >}}`, `{{< callout >}}`, tables, `{{< cards >}}`.
- **Never `git commit` or `git push`.** The loop merges, gates and ships.
