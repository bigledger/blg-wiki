# planning/ — where we think before we edit

Nothing in this folder is published. Hugo only builds `content/`. This is the workbench:
discussions, decisions, specs, drafts and reviews live here **before** anything changes
under `content/en/`.

## The lifecycle

```
ideas/  →  discussions/  →  decisions/ (ADR)  →  specs/  →  content/en/  →  archive/

feedback/inbox.md  →  (analyse, group by page)  →  feedback/batches/  →  content/en/
```

- An **idea** is a note. No structure required. Might go nowhere.
- A **discussion** is an open conversation on one topic. Captures the back-and-forth,
  options considered, and what is still unresolved. Lives until a decision is made.
- A **decision** (ADR — Architecture Decision Record) is the outcome. Numbered, short,
  and immutable once accepted — if we change our minds, we write a new ADR that
  supersedes it, we don't edit the old one.
- A **spec** is the concrete, actionable plan for a change: exact file moves, link
  rewrites, acceptance criteria. Written before editing content, checked against after.
- A **draft** is a page or guide being written here, in full, before it moves into
  `content/en/`. Drafts follow the CLAUDE.md user-guide structure from day one.
- A **review** is feedback on something — a GPT/codex adversarial pass, a panel review,
  a reader's comments on a live page.
- **research** holds findings that inform writing: patterns observed in tenant data,
  competitor analysis, source-code notes.
- **archive** holds anything completed or superseded. Move, don't delete.
- **feedback** is the proofreading inbox. Vincent reads the live site and reports
  mistakes; every report is **recorded first, fixed later**, in batches grouped by page.
  See `feedback/inbox.md` for the item format and `feedback/batches/` for processed sets.

## Folder guide

| Folder | Filename convention | Frontmatter |
|---|---|---|
| `ideas/` | `YYYY-MM-DD-slug.md` | none required |
| `discussions/` | `YYYY-MM-DD-slug.md` | `status: open \| decided \| parked` |
| `decisions/` | `NNNN-slug.md` (four-digit, sequential) | `status: proposed \| accepted \| superseded-by-NNNN` |
| `specs/` | `slug.md` | `status: draft \| approved \| implemented`, `decision: NNNN` |
| `drafts/` | mirrors the target path, e.g. `drafts/workflows/order-to-cash/cash-sales.md` | the real Hugo frontmatter |
| `reviews/` | `YYYY-MM-DD-<reviewer>-<subject>.md` | `reviewer:`, `subject:` (path or discussion) |
| `research/` | `YYYY-MM-DD-slug.md` | `source:` |
| `archive/` | keep the original filename, prefix with the folder it came from | unchanged |
| `feedback/inbox.md` | single running file, items `F-NNNN`, grouped by page URL | — |
| `feedback/batches/` | `YYYY-MM-DD-slug.md` — the items, the analysis, the changes, the commit | `status: done`, `commit:` |

## Rules

1. **Privacy.** `research/` holds anonymised patterns only. Real tenant names, account
   names, amounts, reference numbers, and anything identifying stay in the gitignored
   scratchpad — never in this folder. See the privacy rules in `CLAUDE.md` and `AGENTS.md`.
2. **One topic per discussion file.** If a discussion forks, start a new file and link back.
3. **ADRs are the source of truth for "why".** If someone asks why the folders are named
   the way they are, the answer is an ADR number, not a memory.
4. **Specs gate implementation.** No structural change to `content/en/` without an
   approved spec that names the ADR it implements.
5. **Feedback is recorded, not actioned, on arrival.** When Vincent reports a mistake,
   append it to `feedback/inbox.md` and stop. Do not open the page and edit it. Fixes
   happen when a batch is processed — one page, all its items, one pass, one commit.
   This saves tokens (a page is read and rewritten once, not once per item) and lets
   patterns across items surface before anything changes.
6. **Link across.** Discussions cite reviews, ADRs cite discussions, specs cite ADRs.
   Relative links, e.g. `[ADR-0001](../decisions/0001-content-folder-restructure.md)`.
