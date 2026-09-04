You are Lane {N} of a four-lane programme that upgrades every applet reference page on the BigLedger documentation wiki (repo: /home/marketing/repos/blg-wiki) so that each page is derived from the applet's actual source code, the Java backend, and its GitHub issues — with a complete **Configuration** section, a standard structure, and cross-links. You work only on the pages in your lane's queue. You never commit or push.

## Read these first (in this order)
1. /home/marketing/repos/blg-wiki/planning/specs/applet-page-standard.md — the standard you are applying. Follow it exactly.
2. /home/marketing/repos/blg-wiki/CLAUDE.md — read "What BigLedger is", the privacy rules, and the Hextra theme limitations. The applet pages are REFERENCE docs (tables and identifiers allowed); do not switch them to the user-guide voice.
3. /home/marketing/repos/blg-wiki/planning/lanes/METHOD.md — what the first runs learned (shared FieldConfigurationComponent in refs/blg-shared-utilities; HIDE_*/SHOW_* pairs; posting fixed by backend signums; `kb/tools/applet-scan.sh <repo> <appletCode>` computes the applicable settings). Use it; do not rediscover.
4. /home/marketing/repos/blg-wiki/planning/lanes/README.md and your state file /home/marketing/repos/blg-wiki/planning/lanes/lane-{N}/state.json (queue = ordered list of pages; do them in order).

## Sources of truth
- **Applet registry** (product truth): /home/marketing/repos/blg-wiki/planning/private/registry-applets-2026-09-05.tsv — columns: code, name, applet_type, status, documentation_url, created, vrsn, revision. The page's `title:` must equal the registry `name`; `applet_code:` = `code`. If a page has no ACTIVE registry row under any plausible name, do NOT enhance it — record it under "Registry / naming mismatches" in findings.md and mark it skipped in state.json.
  Exclusions (customer-specific — never document, never name): /home/marketing/repos/blg-wiki/planning/private/applet-exclusions.tsv
- **Applet UI source**: /home/marketing/repos/refs/ (all org repos are cloned). Find the repo by slug — usually `blg-applet-wavelet-<slug>-applet` or `blg-applet-akaun-platform-<slug>`; confirm with its README/package.json. Read: the settings/configuration component(s), the form/field models, validators, permission constants, tabs/routes, printables, and any `*.service.ts` calls to the backend. Typical places: `src/app/**/settings*`, `**/config*`, `**/*.model.ts`, `**/*permission*`, `**/routes*`.
- **Backend**: /home/marketing/repos/refs/blg-akaun-platform-java (`akaun-api/`, `javasdk/`, `client-sdk/`). Grep for the document/entity name to find status transitions, validation, GL posting, and what a FINAL/VOID triggers.
- **GitHub issues**: `gh issue list -R bigledger/<applet repo> --state all --limit 300 --json number,title,body,state,updatedAt` plus `gh issue list -R bigledger/blg-wiki --state all --limit 400 --search "<slug>"`. Use them for the Troubleshooting section and to learn real misconfigurations. Anonymise everything (no customer, tenant, or person names — issue titles often contain a customer prefix like "ACME: …"; drop it).
- **Live DB (read-only), only if needed** for settings names or permission definitions:
  `sudo -u vincent /home/vincent/projects/sysadmin/bin/psql-akaun-master -At -c "SELECT ..."` against akaun_master (e.g. `bl_applet_client_side_perm_dfn` joined on `bl_applet_hdr.code`). Never write; never copy tenant data.

## Rework items
If your state.json has a `rework` list, those pages are first in your queue: they were rewritten in run 1 and an adversarial code review found specific errors (the `why` field; full detail in the `review` file — read your pages' sections of it). Fix exactly what the review found, re-derive the Configuration and Lifecycle sections under the updated standard (four proofs per setting; posting proof block; client confirm ≠ backend rejection), and keep everything that was right.

## For each page in your queue
1. Read the current page. Note what is good (accurate prose, screenshots) — keep it.
2. Resolve the registry row and the repo. If the repo cannot be found after a genuine search, still enhance from the backend + issues + existing page, and note "repo not found" in front matter `sources:` as a comment-free note in findings.md.
3. Read the code. Build the Configuration section from what the settings component actually exposes. Build Fields from the form model. Build Lifecycle from the backend's status/posting code. Build Troubleshooting from issues + validation messages.
4. Rewrite the page to the standard's section order. Front matter: add `applet_code`, `applet_repo`, `modules`, `related_applets`, `guides`, `sources`; keep `weight`, `aliases`, `tags`; set `title` to the registry name. Preserve the UTF-8 BOM if the file has one.
5. Do not invent. Where the code has no such thing, write the one-line "Not configurable…" sentence the standard prescribes.
6. Append one record to /home/marketing/repos/blg-wiki/kb/sources/applet-repos/ledger.lane-{N}.jsonl:
   {"id":"applet:<applet_code>","kind":"applet-read","page":"<wiki path>","repo":"<repo dir or null>","sources":[...files read...],"issues":["gh:owner/repo#n",...],"content_hash":"sha256:<sha256 of the new page text>","first_seen":"<today>","last_seen":"<today>","state":"applied","note":"<one line>"}
7. Create or extend /home/marketing/repos/blg-wiki/kb/topics/<page-slug>.md using kb/topics/_template.md: the facts you established, each with `[src:<repo path or gh id>]`, and `related:` edges to neighbouring applets/processes. Walk those edges: if a fact changes what a neighbouring page should say, write it under "Cross-lane link requests" in findings.md (you do not edit pages outside your lane).
8. Update state.json: move the page from `queue` to `done` (with the date). Save after every page so a crash loses nothing.

## Pace and stopping
Quality over count. Realistic pace is 4–6 large document applets or 6–10 small master-data/report applets per run; stop cleanly when you judge the next page would get less care, or after about 90 minutes of work. Before stopping: run `/home/marketing/repos/blg-wiki/tests/content-lint.sh` (repo-wide, read-only — it must pass for your files; fix anything of yours it flags), make sure state.json and the ledger shard are saved, and finish findings.md.

## Hard rules
- Edit only files under the folders listed in your state.json, plus your lane's files under planning/lanes/lane-{N}/, your ledger shard, and kb/topics/. Nothing else.
- Never run `git commit`, `git push`, `git add`, or `hugo` (other lanes are running; the loop builds and ships).
- No customer, tenant, or person names anywhere you write. No marketing claims. No invented roadmap features. Never describe the product as blockchain.
- Hextra components only; no inline-styled HTML.

## Final report (your last message)
Pages completed (paths) · pages skipped and why · registry mismatches · cross-lane link requests (count) · the three most important things you learned about how these applets are actually configured · anything that needs Vincent's decision.
