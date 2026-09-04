# kb/ — the knowledge base between the sources and the wiki

Long-running, resumable ingestion of everything that describes how BigLedger / Akaun
actually works — source code, git history, GitHub issues, Jira, email threads, Google
Drive — into **topic notes**, from which wiki pages are written. Hugo ignores this folder.

```
sources → kb/sources/<system>/ledger.jsonl   (what was seen, its hash, its state)
        → kb/topics/<concept>.md             (the facts, cited, anonymised, cross-linked)
        → kb/questions/                      (what no source has answered yet)
        → content/en/…                       (wiki pages written FROM topics)
```

**Never source → wiki directly.** A source adds facts to a topic; the topic's
`related:` links say which neighbouring topics to re-examine (that is where the lateral
thinking happens); wiki pages are updated from the topic when it has changed enough.

## Identity and change detection

| Question | Answered by | Example |
|---|---|---|
| Have I seen this item? | its **stable source ID** | `gh:bigledger/blg-wiki#149`, `jira:AKAUN-1234`, `mail:<msgid@domain>`, `gdrive:1AbC…`, `git:blg-akaun-platform-java@a1b2c3d` |
| Has it changed since I processed it? | **`content_hash`** = sha256 of the normalised text (body + comments/attachments list), stored next to the ID | same ID, new hash → re-triage |
| What is this file with no ID? | the hash **is** the ID: `sha256:…` | a downloaded attachment |
| Where do I resume? | per-source **`cursor.json`** | `{"last_issue": 412}`, `{"last_commit": "…"}`, `{"after": "2026-09-05T00:00:00Z"}` |

## Ledger record (`kb/sources/<system>/ledger.jsonl`, one JSON object per line, append-only)

```json
{"id":"gh:bigledger/wavelet-cp-commerce#355","kind":"issue","title":"…",
 "content_hash":"sha256:…","first_seen":"2026-09-05","last_seen":"2026-09-05",
 "state":"applied","topics":["sales-invoice","credit-limit"],
 "applied":["content/en/user-guide/how-to/create-sales-invoice.md"],"commit":"53bfcf79",
 "note":"credit-limit check is at invoice save, not at SO — contradicts old guide"}
```

`state` progression: `seen` → `triaged` (`relevance: high|low|none`) → `extracted`
(facts written to topics) → `applied` (wiki updated). A re-seen item with a new hash goes
back to `seen` with `supersedes` pointing at the previous line. Never edit old lines —
append. `tools/ledger.py` enforces the shape.

## Topic note (`kb/topics/<concept>.md`)

One per domain concept, named as a plain-English slug. Template in `topics/_template.md`.
Every fact carries a citation `[src:<id>]` and a date. Every topic lists `related:` topics —
**adding a fact means asking which related topics it touches, and checking them.**
Facts are anonymised at write time: no tenant, customer, or person names.

## Privacy — non-negotiable

- `kb/private/` is gitignored. Raw emails, ticket bodies, Drive exports, downloaded
  attachments live there or outside the repo. Never under `sources/` or `topics/`.
- Ledgers hold IDs, hashes, titles (sanitised), topics, states — not bodies.
- Topic facts are abstracted: "a multi-branch retailer hit X" not "<Customer> hit X".

## Running a pass

1. Pick a source. Read its `cursor.json`. Fetch items after the cursor.
2. For each item: compute hash; look up ID in the ledger. New or changed → append `seen`.
3. Triage. Extract facts into topics (cite!). Follow `related:` and note connections or
   open questions. Mark `extracted`.
4. When a topic has accumulated enough, update the wiki page(s) that cover it — through
   `planning/` if the change is structural, directly if it is content. Mark `applied`
   with the paths and commit.
5. Advance the cursor. Commit ledgers + topics + wiki together.

Sessions end; the ledgers and cursors do not. Any session can resume any source.
