---
name: record-feedback
description: Use whenever Vincent reports a mistake, typo, wrong fact, ugly page, or missing thing on wiki.bigledger.com (or Claude finds one while doing something else). Records it in planning/feedback/inbox.md and STOPS — never fixes it on the spot. Also use when he says "note this", "add to the list", or points at a URL with a complaint.
argument-hint: "<url or page> — <what is wrong, in his words>"
---

Record the item; do not fix it. This is Vincent's rule (2026-09-05): "record them in the planning folder ... after analysis, process them in batches". Fixing one item at a time wastes tokens and hides patterns. The only override is an explicit "fix it now".

## Steps

1. Read the tail of `planning/feedback/inbox.md` to get the next `F-NNNN` id (sequential, never reused).
2. Find the source file for the URL: strip the domain, look under `content/en/` (or `content/<lang>/`); `_index.md` for section pages. If the report is site-wide (nav, theme, home, config), use the `### site-wide` heading.
3. Append under an `### <url-path>` heading (create it if absent, reuse if the page already has items):
   ```
   - [ ] F-NNNN (YYYY-MM-DD) "his words, near-verbatim — do not tidy the complaint"
         → source: content/en/…
         → note: anything you noticed while recording (optional, one line)
   ```
4. If the item is really a design or structure question (rename, redesign, policy), also open or update a discussion in `planning/discussions/` and point the note at it.
5. Reply in one or two lines: the id, the page, and that it is queued. Then stop.

## Do not

- Do not open the page to "just check". Do not edit content. Do not commit.
- Do not paraphrase his complaint into something politer or vaguer.
- Do not skip the id or the date.
