# Workflow Design Applet — documentation review (English)

**Source:** `content/en/applets/master-data/workflow-design-applet.md`  
**Audience:** BigLedger / akaun.com clients (public wiki)  
**Scope:** Review feedback only — author applies edits to the applet page.

---

## Optional GitHub issue opener

> **Doc review** — `content/en/applets/master-data/workflow-design-applet.md` (Workflow Design Applet). Client-facing read; feedback only—author owns edits. Findings below by pass (line refs = current file).

---

## Pass 1 — First-screen clarity

**Where reviewed:** `## Purpose and Overview` + Core Concept callout — **L13–19**

**GitHub comment (paste-ready)**

> **Pass 1 — First screen:** Reviewed `Purpose and Overview` + Core Concept callout (~L13–19). **Mostly OK:** “Administrative workspace” vs daily “Approve” is clear early (L15). **Minor:** Opening sentence is strong marketing (“central engine of organizational efficiency”); consider slightly neutral tone if public docs should avoid superlatives.

---

## Pass 2 — Role fit

**Where reviewed:** `### Who Benefits` L23–47 · `### What Problems Does This Solve?` L49–63 · Quick Start L156–218 (`### For Employees` / `### For Managers` / `### For Admins`)

**GitHub comment (paste-ready)**

> **Pass 2 — Roles:** Checked `Who Benefits` (~L23–47), `What Problems` (~L49–63), Quick Start (~L156–218). **Issue:** L43–47 lists employee benefits but doesn’t point requesters to L156–167—suggest one line under Employees (e.g. “Most day-to-day use: see **Quick Start → For Employees**”). **OK:** L167 Pro Tip correctly sets expectation that most staff need not open Workflow Design.

---

## Pass 3 — Confusion, vagueness, credibility

**Where reviewed:** L37–41 · L58–63 · L147–148 · L350–352 · jargon L60–63 vs later L192–215, L255–263, L306–312 · FAQ L343

**GitHub comment (paste-ready)**

> **Pass 3 — Claims & jargon:** Flag absolutes for PM/Legal: “100% transparent and immutable” (L38), “physically cannot” (L62), “absolute policy adherence” (L148), “iron-clad accountability” (L352). **Jargon:** “Real-Time Dashboard” (L60)—tie to actual screen/menu name or link; “webhooks” (L28) OK once readers reach L306–312. FAQ L343 (“complete compliance”)—align tone with what Support can defend.

---

## Pass 4 — Repetition and structure

**Where reviewed:** Duplicate `## Key Features Overview` L21 & L65 · cards L67–80 · concepts L17–19, L85–100, L102–132, L134–148

**GitHub comment (paste-ready)**

> **Pass 4 — Structure:** Duplicate `## Key Features Overview` (L21 vs L65) duplicates TOC/skimming—rename first block (e.g. “Audience & problems solved”) or merge. **Cards L67–80:** `link="#process"`, `#process-status`, `#process-resolution`, `#transition-action`, `#sidebar-menu-reference` don’t match default Hugo heading IDs (no `## Process`; sections are `## Process Architecture (For Admins)`, `### Advanced Status Management`, etc.). **Verify on built site**; fix `link=` or add explicit `{#id}` on target headings. **Concepts:** Process/Status/Transition repeated four ways (L17–148)—author decides trim vs intentional scaffolding.

---

## Pass 5 — Actionability (UI paths, visuals, FAQ)

**Where reviewed:** Admin paths L192–215 · Process Architecture + figures L227–272 · Configuration L275–314 · Personalization L318–327 · figure L83 · FAQ L331–347 · Summary L350–352

**GitHub comment (paste-ready)**

> **Pass 5 — Actionability:** Admin Quick Start (`Workflow > Process Status`, etc., L192–215) aligns narratively with **Process Architecture** (L227+); **author to verify strings against current product UI.** Figures (L83, L239–267, L287–327) support text—**OK**; captions match described screens. **FAQ:** Conditional routing (L339–340) consistent with L269–271; delegation (L345–346) consistent with L184. **Summary (L350–352):** marketing-heavy—optional plain-language close for parity with Pass 3 tone.

---

## Optional follow-ups (from plan)

- **Task test:** Follow `### For Admins` L188–218 on a test tenant; log any menu label mismatch with line number.
- **Anchor check:** On published page, click each card under second `Key Features Overview` (L67–80); list any dead fragment jumps.
- **Read-aloud:** Read `## Summary` L350–352 aloud; if it sounds like sales copy, soften for public docs.

---

## Checklist (author)

| Item | Pass |
|------|------|
| Tone / first screen | 1 |
| Employee pointer from Who Benefits | 2 |
| Absolute claims + “Real-Time Dashboard” | 3 |
| Duplicate H2 + card `link=` anchors | 4 |
| UI path verification + Summary tone | 5 |
