# AGENTS.md — Instructions for AI agents working on this wiki

> This file applies to **every** AI agent (Claude Code, Codex, subagent in a workflow, or any other). Read it before you write a single line of markdown. If you skip it, you will write a reference card and we will have to throw it away.

For server-context, theme rules, deployment, navigation, and the full repo charter, read `CLAUDE.md`. This file focuses narrowly on **what to write and how to write it**.

---

## 🚨 THE ONE RULE THAT FAILS MOST OFTEN

**We write USER MANUALS, not reference cards.**

A user manual:
- Tells a story to a real reader
- Uses concrete examples from a fictional Malaysian SME
- Translates internal system identifiers (`DEBTOR`, `OUTPUT_TAX`, `STOCK_BALANCE_WIP`) into plain English
- Opens every step with the *outcome*, not the menu path
- Embeds screenshots from `/static/images/`
- Anticipates failure modes and tells the reader what success looks like

A reference card:
- Lists fields and types
- Has tables labelled `Required / Immutable / Max length`
- Reads like a database schema

**Reference content goes in `/content/en/applets/`. User-guide content goes in `/content/en/guides/`. Different artifact, different audience, different voice.**

If you find yourself listing 30 uppercase identifiers under bullet headings, stop. You have written a reference card. Restart.

---

## Voice and tone

**Brand reference: Xero / QuickBooks support docs.** Warm, hand-holding, second-person, plain English. Aimed at a Malaysian SME owner or accounts clerk who may not be a trained accountant.

| Do this | Not this |
|---|---|
| "You" | "The user" |
| "Customers who owe you money" | "Trade debtors" (use it as the secondary term, in parentheses, after the plain English) |
| "Don't worry, this only takes about 10 minutes." | "It is recommended that adequate time be allocated." |
| "RM 100 + 6% SST" | "an amount with applicable tax" |
| "BigLedger posts the journal" | "The journal will be posted by the system" |
| "GR/IR (Goods Received / Invoice Received)" first time | "GR/IR" with no explanation |

---

## The required structure for every guide

```
1. Front matter — title, description, tags, weight. NO duplicate H1 in the body.
2. Opening paragraph (2-3 sentences) — name the reader, name the outcome, set the time expectation.
3. "Meet [the running example business]" — one short paragraph.
4. Concepts (only if 2-5 BigLedger-specific terms are essential).
5. Prerequisites — concrete and checkable; no chicken-and-egg references.
6. Numbered "Step N: [outcome verb + object]" sections.
7. "What success looks like" — a 30-second test.
8. "Common mistakes" — top 5 ways this goes wrong + symptoms + fixes.
9. "Related documentation" — link to the applet doc (reference) and adjacent guides.
```

Every step opens with the outcome, shows the menu path *italic on its own line*, walks the reader through with the running example, translates any system identifiers, and embeds a screenshot if the screen is non-obvious.

---

## The running example

Every user guide in the `accounting-guides` set (and ideally every guide in the wiki) uses the **same fictional Malaysian SME** as its worked example. Continuity makes it stick — the reader meets the same business in every guide.

The canonical running example: **Restoran Kopi Pagi Sdn Bhd** — a small F&B + retail business, 8 staff, two outlets, takes credit-card payments through Maybank, holds some packaged-food stock, registered for SST. Adjust the parameters per guide if needed (the journal-entries guide might use them as a services company variant for a particular example), but keep the business name and core shape consistent.

The running example must reflect **patterns observed in real tenants** — see "Study real tenants" below.

---

## Study real tenants before you write

This server has read-only access to all 83 active production BigLedger tenants. **Use it before you write a guide. Do not invent business shapes from accounting textbooks.**

### Access mechanisms

- **Schema dumps** (DDL only, no data; world-readable via sudo):
  `sudo cat /home/vincent/projects/sysadmin/aws-akaun/tenant-schemas/pcimage/tables/bl_fi/<table>.sql`
- **Live tenant queries** (read-only, via SSH tunnel to the bastion):
  `sudo -u vincent /home/vincent/projects/sysadmin/bin/psql-akaun-master -c "SELECT ..."`
  - Connect to a tenant's own DB: list `app_tenant_hdr` + `app_generic_resources_hdr` in `akaun_master` to find each tenant's DB connection JSON (`hostname`, `database_name`, `username`, `password`), then tunnel to that host.
- **Source code (Angular UI + Java backend)**: `/home/marketing/repos/refs/`. Always `git -C <repo> pull --ff-only` before reading.

### What to learn from real tenants

| Writing... | Query / observe... |
|---|---|
| Chart of Accounts setup | Section, Category, Code distribution. Common code-numbering schemes. Which Default GL Code roles are actually mapped vs left blank. |
| Journal Entries | What real `bl_fi_jrnl_hdr.descr` and `reference_num_1` patterns look like. Distribution of `auto_flag` MANUAL vs AUTO. Void/reversal frequency. |
| Bank Reconciliation | Real `bl_fi_cashbook_txn_stmt_recon_link` match rates. Distribution of `bl_fi_mst_cashbook_recon_config.config_json` weights. Which bank parsers are actually used. |
| Financial Reporting | Set of Books / Ledger structures. Month-End Processing run cadence. Typical period boundaries. |
| Any module workflow | What's actually being created and at what scale. |

### Privacy rules — NON-NEGOTIABLE

- ✅ **DO** observe and abstract shapes and patterns ("most F&B tenants number current assets in the 1000-range").
- ✅ **DO** anonymise everything ("an F&B chain with 12 outlets" — never a real name).
- ❌ **DO NOT** copy any real tenant name, real account name, real reference number, real amount, real customer name, real entity name, real GL Code description, real branch name, or real anything-identifying.
- ❌ **DO NOT** put real tenant data in any markdown file, screenshot, commit message, code comment, or PR description.
- ❌ **DO NOT** dump tenant data to disk where it could be committed accidentally.

**The fictional running example is synthetic, inspired by real shapes.** Never the other way around.

---

## Self-check before you commit

Run this checklist on every guide before you commit. If any answer is wrong, rewrite.

1. **Could a Malaysian SME owner with no ERP background follow this?** If they'd stall at any step, rewrite that step.
2. **Did I translate every internal system identifier into plain English on first mention?** `DEBTOR` → "customers who owe you money (Trade Debtors)".
3. **Does the running example actually appear in steps**, not just in the intro?
4. **Is there a "what success looks like" section** with a 30-second concrete check?
5. **Are there screenshots at the high-friction steps?** Reuse the ones in `/static/images/<applet-name>/`.
6. **Are tables limited to ≤3 in the body?** More than that = reference card.
7. **Did I expand every acronym on first use?** GR/IR, MA, WIP, FG, NSTI.
8. **Did I open the guide with the outcome and the time expectation, not the menu path?**

If all 8 are green, you have written a user guide. If any are red, you have written a reference card. Restart.

---

## Test and ship

Every change to the guides must pass before push:

1. `hugo --gc --minify` — site builds.
2. `cd tests/playwright && BASE_URL=http://127.0.0.1:1313 npx playwright test` — against `hugo server` running locally with `--baseURL http://127.0.0.1:1313/ --appendPort=false`.
3. After deploy: `BASE_URL=https://wiki.bigledger.com npx playwright test` — against the live site.

For an adversarial second opinion on the writing (not just the technical accuracy), spin up codex:

```bash
codex exec --skip-git-repo-check --dangerously-bypass-approvals-and-sandbox - < /tmp/codex-prompt.txt
```

(The `--dangerously-bypass-approvals-and-sandbox` flag is needed because Ubuntu 24.04's `kernel.apparmor_restrict_unprivileged_userns=1` breaks codex's bubblewrap sandbox. Acceptable for read-only review work.)

---

## What good looks like

A good guide reads like the writer was sitting next to the reader. Not the writer's database schema talking back.

If the first 30 seconds of your draft reads like SAP module documentation, throw it away. Open with a sentence that names the reader, names the outcome, and tells them how long this will take. Then meet the running example. Then walk through it.

**That's the bar. Hit it.**
