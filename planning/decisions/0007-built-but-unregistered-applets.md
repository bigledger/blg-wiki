---
status: proposed — awaiting Vincent
date: 2026-09-06
discussion: ../discussions/2026-09-06-built-but-unregistered-applets.md
amends: 0002-applet-existence-and-naming.md
---

# ADR-0007: An applet that is built but not registered is archived, not published

## Context

ADR-0002 answers "the wiki documents something that does not exist". It does not answer the
inverse, which three lane runs have now hit: **a real, actively maintained applet repo with no
ACTIVE row in `bl_applet_hdr`** — Group Maintenance, E-Mandate and Team Maintenance. See the
discussion for the evidence and the seven pages currently affected.

The reader's position is what settles it. A customer cannot install or open an applet that is not
in the registry, so a page describing one as available is the same broken promise ADR-0002 exists
to prevent. "It is real, it is just not registered" is not a distinction a reader can act on.

## Decision

1. **Ask first, once, about the pattern.** Three maintained repos with no registry row is more
   likely a registry problem than three intentions. The platform team is asked whether these are
   meant to be registered; the answer applies to all three and to the next one.
2. **Until a row exists, the page is archived, not published.** It moves to `planning/archive/`
   with its sourcing intact. It is not deleted — the work is real and will be wanted.
3. **Archived-pending-registration pages are tracked, not forgotten.** Each is recorded in a
   machine-readable list keyed by its expected registry code, and
   `tests/applet-registry-parity.sh` reports when a matching ACTIVE row appears, so the page is
   restored deliberately rather than by memory.
4. **Inbound links are repointed or removed in the same commit as the archive** — the failure mode
   we keep meeting is a page moving without its links, and `team-maintenance-applet.md` has seven.
5. **"Introduction to X" and "Installation of X" companion pages are deleted outright**, whatever
   the registration answer. The pattern exists nowhere else under `applets/`, all four are stubs
   (9–14 lines, one with a body consisting of the character `1`), and none has an inbound link.
6. **This is not a licence to publish speculatively.** A page may be written from source ahead of
   registration — the lanes will keep producing them — but it stays archived until the registry
   agrees. Nothing reaches `content/en/` on the strength of a repo alone.

## Consequences

- Seven pages move or go: three Team Maintenance, three Group Maintenance, one E-Mandate. Only
  three of the seven carry inbound links (7, 3 and 2 respectively); those links are repointed to
  the nearest relevant page or removed.
- The parity check gains a second job: it currently fails when a page has no ACTIVE code, and it
  must now also *report* when an archived page's code becomes ACTIVE. Failing and reporting are
  different outcomes and the script needs to distinguish them.
- Their zh/ms/ar twins move in the same commit (the Hugo translation-pairing rule), and
  `applet-catalog.md` entries go with them.
- If the platform team says the omission was accidental and registers all three, the decision
  costs one restore commit and we keep the sourcing. That is the cheap branch, and it is the more
  likely one.

## Alternatives rejected

- **Publish with a "not yet available" banner** — honest, but it lists things a reader cannot use
  in the applet index, and the banner has no expiry: nothing makes anyone remove it later.
- **Delete** — cheapest now, guarantees a rewrite later, and throws away verified sourcing.
- **Treat a maintained repo as sufficient evidence of existence** — this is exactly what produced
  the twelve phantom applet pages ADR-0002 was written to clean up.

## Open, and deliberately not decided here

- Whether the registry has an intentional "built but not yet released" state that the parity check
  is flattening into "does not exist". If it does, this ADR should key on that state instead.
- The mirror image — roughly forty general-purpose ACTIVE applets with no page — remains ADR-0002's
  backlog and is untouched by this decision.
