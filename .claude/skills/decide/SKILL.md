---
name: decide
description: Drive a structural or policy question through planning/ — discussion → decision (ADR) → spec — before anything changes in content/en/. Use when a request would rename, move, merge, or delete sections; change site-wide config, navigation, voice, or translation policy; or when Vincent says "let's discuss", "write an ADR", "spec this", or asks for options with a recommendation.
argument-hint: "<topic> [discuss | adr | spec]"
---

Structural changes to `content/en/` require an approved spec that cites an ADR (CLAUDE.md, planning/README.md). Routine content fixes do not go through this.

## Discuss

1. Survey first — counts, inbound links, git activity, what the pages actually contain. Facts before opinions.
2. Write `planning/discussions/YYYY-MM-DD-<slug>.md` (`status: open`): why it came up (Vincent's words), what exists (table), diagnosis, proposals with trade-offs, open questions, next steps. One topic per file; link related ones.
3. If contestable, run the `second-opinion` skill and reconcile into a converged proposal.
4. Put the decisions to Vincent with AskUserQuestion — multiple choice, recommended option first and labelled "(Recommended)", one line on why. Never a wall of prose he has to parse into choices.

## ADR

Copy `planning/decisions/0000-template.md` to the next `NNNN-<slug>.md`: Context (2–4 sentences, link the discussion), Decision (present tense, active, numbered rules), Consequences, Alternatives rejected (one line each, with reason — including Claude's own recommendation if Vincent chose otherwise). Mark the discussion `status: decided` and add `decision:` to its frontmatter. ADRs are immutable once accepted; a change of mind is a new ADR that supersedes.

## Spec

`planning/specs/<slug>.md` (`status: draft`, `decision: NNNN`): the exact file moves (a table, including zh/ms/ar twins), link rewrites, aliases for every old URL, `hugo.yaml` changes, weight pass, verification steps (build, lychee, Playwright, live), and rollback. Approved by Vincent before implementation; implementation is one section per commit via the `ship` skill.
