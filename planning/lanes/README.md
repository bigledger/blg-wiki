# Lanes — parallel applet-documentation work

Vincent (2026-09-05): study source code and GitHub issues, enhance every applet page with
configuration guidance, standardise, cross-link — ~4 lanes in parallel.

Each lane owns a disjoint set of `content/en/applets/<folders>/`. Standard:
`planning/specs/applet-page-standard.md`. A lane never commits; it writes:
- `planning/lanes/lane-<n>/state.json` — done / next / skipped, so the next run resumes
- `planning/lanes/lane-<n>/findings.md` — cross-lane link requests, registry mismatches,
  undocumented applets found, questions for Vincent (anonymised)
- `kb/sources/applet-repos/ledger.lane-<n>.jsonl` — one record per applet processed
- `kb/topics/<applet-slug>.md` — facts with `[src:…]` citations (create or extend)

The loop merges shards, runs the gate, commits per lane, ships, and re-launches lanes from
their `state.json` until every page meets the standard.
