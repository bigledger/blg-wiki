---
name: ingest
description: Run one pass of the kb/ ingestion pipeline for a source — GitHub issues, a source repo's git history, Jira, email, Google Drive — resuming from its cursor, recording each item in the ledger by stable ID + content hash, extracting facts into kb/topics/ with citations, thinking laterally across related topics, and updating the wiki from topics. Use when Vincent points at a source ("read the issues in repo X", "go through these emails", "what changed in the Java backend since …") or asks to continue the ingestion.
argument-hint: "<source> [scope, e.g. repo name, label, mailbox, folder]"
---

Read `kb/README.md` first. The contract: source → topic → wiki, never source → wiki. Identity = stable ID; change = sha256 content hash; resume = cursor. Raw material never enters git.

## Steps

1. `kb/sources/<source>/cursor.json` — read the cursor for this scope. Fetch items after it (`gh issue list --state all --json …`, `git -C /home/marketing/repos/refs/<repo> log <cursor>..HEAD`, etc.). Cache raw bodies under `kb/private/` if needed.
2. For each item: id (`gh:owner/repo#n`, `git:repo@sha`, `jira:KEY-n`, `mail:<msgid>`, `gdrive:<id>`), `content_hash` via `kb/tools/ledger.py hash`; `ledger.py seen <source> <id>` — skip if same hash and state ≥ triaged.
3. Triage: relevance high/low/none for the wiki. Append `seen`/`triaged` records with `ledger.py add`.
4. Extract: for relevant items, write facts into `kb/topics/<concept>.md` (create from `_template.md`), each fact dated and cited `[src:<id>]`, anonymised at write time (no tenant/customer/person names). Mark `extracted` with `topics: [...]`.
5. **Lateral pass — the part that matters:** for every topic touched, walk its `related:` edges. Ask what this fact changes for each neighbour (an invoice fact → e-invoice submission? sales return? credit-limit check? GL posting?). Record connections in "How it connects", add or strengthen `related:` edges, and put unanswerable questions in `kb/questions/`.
6. Apply: when a topic's "Wiki impact" is concrete, update the wiki page(s) — directly for content, via `planning/` if structural. Mark `applied` with paths and commit hash.
7. Advance the cursor. Commit ledgers + topics + wiki together. Report: items seen/triaged/extracted/applied, topics touched, questions raised, and the new cursor.

## Rules

- Append-only ledgers; never rewrite history. A changed item gets a new line with `supersedes`.
- Privacy as in CLAUDE.md. If in doubt, abstract harder.
- Do not "finish" a source; there is no finish. Stop at a clean cursor.
