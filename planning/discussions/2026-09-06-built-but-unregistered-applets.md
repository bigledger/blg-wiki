---
date: 2026-09-06
status: open — needs Vincent
feeds: ../decisions/0007-built-but-unregistered-applets.md
findings: F-0258 (e-mandate), F-0268 (the pattern), F-0270 (recommended deletions)
---

# Applets that are built and maintained but have no registry row

## What happened

ADR-0002 settled the case where the wiki documents something that does not exist: the registry
(`bl_applet_hdr`, ACTIVE, minus the customer-specific exclusions) is the source of truth, and a
page without a row gets archived.

Three lane runs have now hit the **inverse** case, which ADR-0002 does not cover:

| Applet | Found | Repo state | Registry |
|---|---|---|---|
| Group Maintenance | run 9 | real | no ACTIVE row |
| E-Mandate | run 30 | last commit 2026-08-12, `mainPath = 'eMandate'`, three menus | no row at all — searched code, name and `property_json` for mandate / ddebit / direct-debit / fpx across 236 rows |
| Team Maintenance | run 31 | V2 repo actively maintained, last commit 2026-08-21 | `newTeamMaintenanceApplet` is DELETED; checked three ways against the live DB |

Three instances is a pattern, not three curiosities. Either the registry is stale, or applets are
shipping outside it.

## What is on the wiki today

Seven pages, most of them stubs written before any of this was checked:

| Page | Lines | Inbound links |
|---|---|---|
| `crm/team-maintenance-applet.md` | 9 | 7 |
| `crm/introduction-to-team-maintenance-applet.md` | 12 | 0 |
| `crm/installation-of-team-maintenance-applet.md` | 14 | 0 |
| `finance/e-mandate-applet.md` | 197 | 2 |
| `master-data/group-maintenance-applet.md` | 10 | 3 |
| `master-data/group-maintenance-V2-applet.md` | 126 | — |
| `master-data/installation-of-group-maintenance-applet.md` | 14 | 0 |

Note the secondary mess: two of the three have an "Introduction to…" and an "Installation of…"
page as well as the applet page — a pattern that exists nowhere else in `applets/` and that
ADR-0002's title rule would not have produced. Those should go regardless of what we decide here.

## Why it matters

A customer cannot install or open an applet that is not in the registry. A page that documents one
as if it were available is the same broken promise as a page for an applet that does not exist —
the thing ADR-0002 exists to prevent — and the same class as the eleven phantom pages the
developers section promises (F-0243). "It's real, it's just not registered" is not a distinction a
reader can act on.

Against that: the repos are maintained. Deleting the pages throws away work that will need doing
again the moment a row appears.

## Options

**(a) Archive, and auto-restore when the registry catches up.** Move the pages to
`planning/archive/`, record each in a machine-readable list keyed by the expected registry code,
and have the existing parity check (`tests/applet-registry-parity.sh`) report when a row appears so
the page comes back deliberately. Report each case to the platform team, because a maintained repo
with no registry row is more likely a registry bug than an intent.

**(b) Publish with a "not yet available" banner.** Honest, and it preserves the work — but it puts
pages in the applet index for things a reader cannot use, and the banner has no expiry: nothing
makes anyone come back and remove it.

**(c) Register them.** Not our call, and it is the right fix only if the omission is accidental. It
is also the fastest way to find out which it is: ask, and the answer resolves all three.

**(d) Delete.** Cheapest, loses the sourcing work, and guarantees a rewrite later.

## Recommendation

**(c) then (a).** Ask the platform team whether the three are meant to be registered — that single
question resolves the pattern rather than the instances. Whatever the answer, apply (a) in the
meantime: archive rather than publish, keep the restore list, and let the parity check tell us when
the registry moves. Delete the four "Introduction to…" / "Installation of…" stubs outright; they are
not covered by this question and should not exist under any answer.

## Open

- Does the registry have an intentional "built but not yet released" state we are not reading? The
  parity check currently treats "no ACTIVE row" as "does not exist", which may be too blunt.
- The same question applies to the ~40 general-purpose ACTIVE applets with no page (ADR-0002's
  backlog) — that is the mirror image and is still unaddressed.
