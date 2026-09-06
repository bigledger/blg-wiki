---
status: open
raised_by: developers-section audit, 2026-09-06
topics: [positioning, developers, api]
who_can_answer: Vincent / product owner
---

# Does BigLedger have an MCP server, or is "MCP" in the positioning line aspirational?

`hugo.yaml` (all four language descriptions) and `content/en/_index.md:3,22,69` say BigLedger
is "the backbone for AI agents via API, MCP and SDK", and the home page's Developers card
reads "REST API, SDKs, webhooks and MCP".

Checked, 2026-09-06:
- `refs/blg-akaun-platform-java` — zero MCP mappings, classes or dependencies.
- All of `refs/` — four hits total: two transitive `@modelcontextprotocol/sdk` entries in
  `package-lock.json` files, one Koog study note, and
  `refs/blg-poc-mbf-group/specs/02-architecture.md:188` headed **"Why NOT an MCP Server?"**,
  which records the decision "Koog agent with Claude API integration, not MCP".
- `content/en/developers/` never mentions MCP in 21,265 lines.

So the claim is currently undocumented and unsupported by any code found. Needed:
is an MCP server built, in progress, or planned? CLAUDE.md's rule is "a docs site documents
what exists" — if it does not exist, the four `hugo.yaml` descriptions and `_index.md` need
the word removed or reframed as roadmap.
