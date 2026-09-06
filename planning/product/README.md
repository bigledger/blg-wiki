# Product findings — for the engineers, not for the wiki

Defects and enhancements discovered while documenting the platform. **We do not fix these.** They
are written to be filed as issues for programmers or for a different AI agent to work on.

Vincent, 2026-09-06: *"as you are doing this, we will discover new enhancements / developments that
are required, to perfect our platform / apis, applets etc… we will then create issues for these
separately, for the programmers or ai-agents (different ai agent, not you) to work on them."*

Documenting a system closely is an unusually good way to find its bugs — 32 lane runs have turned
up authorisation holes, dead processors and journals that post nothing, all from reading code with
a reader's question in mind. That stream is valuable and it needs somewhere to go that is not the
wiki backlog.

## How to use it

- **`INDEX.md`** is the review surface, ordered by severity.
- **`open/`** — one file per finding, written **issue-shaped** so it can be filed with no rewriting:
  a title an engineer can triage from, severity, what happens, the evidence with file:line, how to
  reproduce, blast radius, and a suggested fix where we have one.
- **`filed/`** — moved here once an issue exists elsewhere, with the issue reference in the front
  matter so we never file the same thing twice.

## Severity

| | |
|---|---|
| **security** | Authorisation, authentication, credential exposure, data reachable by the wrong party |
| **data-loss** | Silent corruption, deletion, or a posting that is wrong in the ledger |
| **broken** | A shipped feature that cannot work at all |
| **degraded** | Works, but wrongly or partially, in a way users hit |
| **enhancement** | Works as designed; the design is the problem |

## Writing one

```markdown
---
id: P-0001
found: 2026-09-06
severity: data-loss
area: fixed-asset / depreciation
found_by: "lane 4 run 31, while documenting the Fixed Asset applet"
wiki_ref: F-0265
---

# One line an engineer can triage from

**What happens** · **Evidence** (file:line) · **How to reproduce** · **Blast radius** ·
**Suggested fix** · **What we did in the wiki** (usually: documented the real behaviour, or
unpublished the page that claimed otherwise).
```

## The rule

A product finding is **recorded here and documented honestly in the wiki** — the wiki describes
what the system does today, not what it should do. When the fix ships, the page changes with it.

## Allocating ids — read this before adding a row

Two agents added rows to `INDEX.md` concurrently on 2026-09-06 and both took the same id. If you
are working while another unit might be, **claim your ids from the top of the file, not by reading
the last row**: take the highest `P-NNNN` that appears anywhere in the file, add a comfortable gap
(ten is plenty), and use that block. A duplicate id is worse than a gap — a gap costs nothing, a
duplicate makes the register untrustworthy the moment someone cites one.
