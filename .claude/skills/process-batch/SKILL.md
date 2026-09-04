---
name: process-batch
description: Process open items from planning/feedback/inbox.md as a batch — all items for one page (or one theme across pages) in a single pass, one commit, one batch log. Use when Vincent says "process the inbox", "fix the batch", "do the F-00xx items", or when a page has accumulated several open items.
argument-hint: "<page path | F-ids | theme>"
---

One page, all its open items, one read, one rewrite, one commit. That is the whole point.

## Steps

1. Read `planning/feedback/inbox.md`. Select the open (`- [ ]`) items for the page(s) or theme given. If none given, propose the page with the most open items and confirm.
2. Read the source file(s) ONCE. Analyse all selected items together — look for the pattern behind them (the same mistake elsewhere on the page, or on sibling pages).
3. Make every change in one pass. Respect CLAUDE.md: user-guide voice for guides, reference voice for applets; no invented features; Malay is Bahasa Melayu; translations move with their English twin.
4. Verify: `hugo --gc --minify` builds; if a URL changed, add `aliases:`; if links changed, check them.
5. Write `planning/feedback/batches/YYYY-MM-DD-<slug>.md` with frontmatter `status: done`, `items:`, `decision:` (ADR if any), then: Analysis (the pattern), Changes (file by file, terse), Found on the way (new inbox items you logged), Not done (and why).
6. Tick the items in the inbox (`- [x]`) and add `→ batch: batches/…` to each.
7. Commit content + the batch log + the inbox together, one commit, message in the imperative ("Fix …"), no attribution trailers. Do not push unless asked — pushing deploys.

## Rules

- Items that turn out to need a decision (structure, naming, policy) go to a discussion, not into the batch. Say so in "Not done".
- Never widen scope silently. If you find the same mistake on 20 other pages, log it as a new inbox item and mention it; do not fix 20 pages inside a batch for one.
