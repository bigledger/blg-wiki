---
name: second-opinion
description: Get an adversarial second opinion from GPT via `codex exec` on a plan, an IA decision, a draft page, or a review. Use when a decision is contestable, when Vincent asks to "discuss with codex / GPT", or before finalising an ADR or a rewritten guide. Files the result under planning/reviews/ and verifies every factual claim before relaying it.
argument-hint: "<what to review> [file or discussion path]"
---

Claude drafts and reconciles; GPT attacks. Never relay GPT's claims unverified.

## Steps

1. Write the prompt to the scratchpad. It MUST: state READ-ONLY — do not create/modify/delete files (the sandbox is bypassed on this box); list exactly which files to read; give the facts already established so it does not re-derive them; ask pointed, numbered questions; demand concrete file paths and config keys; ask where it disagrees with existing ADRs/CLAUDE.md; ask for a ranked verdict. Terse output.
2. Run in the background with a long timeout:
   `codex exec --skip-git-repo-check --dangerously-bypass-approvals-and-sandbox - < prompt.txt > out.txt 2>&1`
   (default model from `~/.codex/config.toml`, currently gpt-5.6-sol; `-m <model>` to override). Do useful independent work while it runs; do not poll.
3. Extract the final answer — the last `codex` block before the last `tokens used` line:
   `awk '/^codex$/{buf="";p=1;next} /^tokens used$/{if(p){last=buf};p=0} p{buf=buf $0 "\n"} END{printf "%s", last}' out.txt`
4. Verify every checkable factual claim about the repo (grep/find/build) before believing it. Note which held and which did not.
5. File under `planning/reviews/YYYY-MM-DD-<model>-<subject>.md` with frontmatter (`reviewer`, `subject`, `date`, `status: unreconciled|reconciled`), the answer, and the prompt appended in a code block.
6. Relay to Vincent: what it said, what you verified, where you agree, where you push back and why. Update the related discussion.

## Rules

- Privacy: never put tenant/customer names in the prompt. Registry codes with customer names stay in `planning/private/`.
- If it proposes something that contradicts an accepted ADR, say so explicitly; do not quietly adopt it.
