# applet-repos — source: the applet UI repositories + blg-akaun-platform-java, read per applet

Ledger shards: `ledger.lane-<n>.jsonl` are written by parallel lanes and merged into `ledger.jsonl`
by the loop after each lane run (append-only; merge = concatenate + dedupe by id+hash).
Record kind: `applet-read` — one per applet processed, id `applet:<applet_code>`, with
`repo`, `sources` (files read), `issues` (gh ids consulted), `page` (wiki path), `state`.
