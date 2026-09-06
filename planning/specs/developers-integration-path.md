---
status: shipped, pending ratification
date: 2026-09-06
decision: ../decisions/0008-verify-or-unpublish.md
direction: planning/feedback/inbox.md F-0291, F-0292, F-0293 (Vincent, 2026-09-06)
scope: content/en/developers/ — the external-integration path (developer-reference voice, not the user-guide voice)
notes: planning/drafts/2026-09-06-datahub-integration-path.md
---

# Spec — the external-integration path under `content/en/developers/`

## Why

F-0291: *"For external developers, they might want to do integrations with our data-hub."*
F-0293: *"external developers only make use of blg-wiki"* — so this path must be complete, or name
its hand-offs explicitly.

`developers/_index.md` carried an explicit placeholder for this path. This spec replaces it.

Structural precedent: `developers/applets/` shipped the same way on 2026-09-06 (F-0295), as a
sibling subsection with its own `_index.md`, under the same direction. This is the second half of
the same two-path structure Vincent named.

## The change

**New subsection**, mirroring `developers/applets/`:

| Path | URL | Purpose |
|---|---|---|
| `content/en/developers/integration/_index.md` | `/developers/integration/` | Orientation: what the surface is, the three prerequisites, the four things BigLedger does not provide |
| `content/en/developers/integration/getting-started.md` | `/developers/integration/getting-started/` | Nothing → moving real data, in seven steps, on one worked example |
| `content/en/developers/integration/data-api.md` | `/developers/integration/data-api/` | Reference: path grammar, resources, paging, envelopes, limits, error codes |

**Rewritten and un-drafted in place** (URLs preserved, per ADR-0008's "the URL is reserved for the
rewrite"):

| Path | URL | Was |
|---|---|---|
| `content/en/developers/authentication.md` | `/developers/authentication/` | `draft: true` since 2026-09-06 — mechanism real, every detail invented (F-0285/F-0286) |
| `content/en/developers/webhooks.md` | `/developers/webhooks/` | `draft: true` since 2026-09-06 — promised HMAC and retries, neither exists (F-0286) |

**Edited:** `content/en/developers/_index.md` — the placeholder card and the "what is not written
yet" paragraph are replaced by the four cards above.

Authentication and webhooks stay at the top level of `developers/` rather than moving under
`integration/`. Both are also relevant to applet developers, both already have live inbound links
(`content/en/api-reference/_index.md` links to `/developers/webhooks/`), and moving them would buy
tidiness at the cost of URL churn. They are linked from `integration/_index.md` as part of the
path.

## Rules the pages hold to

1. **Never name a surface the product does not name.** There is no "Data Hub" in the platform,
   the applet registry or the API. The pages call it the `etl-ep` server-to-server surface.
   (The marketing site's "Operational Data Hub" is a separate question — Q-0022.)
2. **Never document the legacy surface**, per ADR-0008 and F-0288. `tests/content-lint.sh`
   enforces it.
3. **Publish what an integrator needs, not what is interesting.** Platform internals were read to
   establish truth and are not published. Where an internal detail is an attack recipe, it is
   filed as a product defect instead (P-0031).
4. **Every path and slug published is verified** against a resolved route table generated from the
   controllers, and the auth behaviour is confirmed against the live API. Anything that could not
   be established is named as a hand-off with a contact and a specific ask, rather than guessed.
5. **Absences are published.** No retry, no signature, no rate limit, no schema, no client
   library, no sandbox. A reader who plans around them is better served than one told nothing.

## What this spec does not do

- It does not rewrite the eight unpublished module references under
  `content/en/developers/api-reference/`. They stay drafted (F-0297 backlog).
- It does not touch `getting-started.md`, `sdks.md`, `tutorials.md` or `applet-development.md` at
  the top level of `developers/`, which remain drafted from the 2026-09-06 audit.
