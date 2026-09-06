---
date: 2026-09-06
unpublished_from: content/en/api-reference/_index.md, content/en/developer-docs/_index.md, content/en/tutorials/_index.md
url: /api-reference/, /developer-docs/, /tutorials/
tier: 1
mechanism: rewritten-in-place
reason: "Three top-level sections still described a blockchain product — 'Wallet API', 'Smart Contract API', 'Smart Contract Development', 'Building a Simple DApp', 'Setting Up Your Wallet'. CLAUDE.md records blockchain wording as removed on 2026-09-05; this vocabulary survived because the lint grepped only the literal word 'blockchain'."
evidence:
  - "content/en/api-reference/_index.md:18,21 — Wallet API, Smart Contract API"
  - "content/en/tutorials/_index.md:26 — Smart Contract Development"
  - "content/en/developer-docs/_index.md:21 — Smart Contract Development"
salvage: "Nothing. All three were content-free lists with no pages behind them."
to_rewrite: "Done in place — each is now a signpost to the real section. The structural question of whether these three top-level sections should exist at all is separate and needs a spec."
---

Replaced with signposts rather than removed, so the URLs and any inbound links survive.
`tests/content-lint.sh` gained a blockchain-era vocabulary check (`smart contract`, `wallet api`,
`crypto wallet`) so this class cannot recur.
