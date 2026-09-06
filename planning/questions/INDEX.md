# Open questions for Vincent

Ordered by what it costs to leave them open. One line each — the detail is in `open/` where there
is a file. Answer in any form; I will record it in `answered/` and act.

*Last updated 2026-09-06. Answered questions move to `answered/` and leave this list.*

## High — work is stopped

| id | question | blocks |
|---|---|---|
| Q-0001 | May we publish the **MyInvois intermediary permission set** a customer must grant BigLedger? Today the setup guide says "grant the full set, ask before you save the form". | The single biggest gap in the e-invoice setup guide (F-0219, F-0238) |
| Q-0002 | Is the **from-IRB inbound consumer** planned, abandoned, or forgotten? blg-intranet#5617 proposes exactly this work. | Whether the new incoming-supplier guide is correct or needs rewriting (F-0274) |
| Q-0003 | **Self-billed e-invoices**: which document types, where is the flag set, can they be consolidated, which LHDN scenarios do our customers use? | A written guide is blocked on it (F-0227) |
| Q-0004 | **Peppol participant-ID scheme** — our guide and our applet page disagree. Which is right? | The Peppol guide rewrite; the current page is the largest live defect in that section (F-0228) |
| Q-0005 | **By-document or by-branch consolidation** — which do we recommend? And by-branch is documented as producing separate foreign-counterparty e-invoices, which contradicts the rule that a consolidated e-invoice cannot carry a foreign buyer. | The month-end and pools guides both hedge (F-0226) |
| Q-0006 | Do we hold **SOC 2 Type II, ISO 27001 or GDPR** certification? The architecture page claimed all three; it is unpublished pending your answer. | Whether the claim returns sourced, or never — and whether sales material repeats it (F-0294) |
| Q-0007 | Is there an **MCP server**? `hugo.yaml` claims MCP in four languages; the only mention in any repo is a spec headed *"Why NOT an MCP Server?"*. | The canonical product description in CLAUDE.md (F-0287) |

## Medium — work continues, degraded

| id | question | blocks |
|---|---|---|
| Q-0008 | Should we **publish `blg-shared-utilities` to npm and give applet registration a self-service path**? Without both, an outside developer can build a bundle but cannot run it. | Whether the Android standard is reachable at all (F-0296) |
| Q-0009 | **ADR-0007**: accept, amend or reject — archive pages for built-but-unregistered applets, and ask the platform team once whether Group Maintenance, E-Mandate, Team Maintenance and Investment are meant to be registered? | Four applets, seven-plus pages (F-0272, F-0282) |
| Q-0010 | **ADR-0006 revisit**: should concept pages be written *after* a module's procedures are complete rather than before? The pilot's own test failed. | Whether the concepts layer rolls out beyond e-invoice (F-0261, F-0276) |
| Q-0011 | Is **four-field exact-equality matching** for incoming e-invoices intended to stay? Nothing has ever matched under it across 89 tenants. | Whether the guide teaches the current rule as permanent (F-0274) |
| Q-0012 | Should the **RM 10,000 individual-submission rule** also block credit notes, debit notes, refund notes and sales returns? Only sales invoices and cash bills are enforced today. | If yes, documents are already at LHDN in a shape LHDN forbids (F-0264) |
| Q-0013 | Is **`developers@bigledger.com`** monitored? The new applet pages use it as the hand-off contact throughout. | Every hand-off in the applet path (F-0297) |
| Q-0014 | What is the **data-hub** called in the product, and is it the same thing as the `etl-ep` surface (952 mappings)? How does an external system authenticate — and is any of it self-service? | The external integration path, the next unit (F-0292) |
| Q-0015 | **`my-einvoice-for-customer-and-supplier-applet.md`** is substantially invented and walks AP staff to a screen that is empty on every tenant. Rewrite, stub, or unpublish? | (F-0275) |
| Q-0016 | Merges awaiting your word: `mm-deposit-applet` → `deposit-applet`; `general-ledger-applet` (19 broken inbound links); the tax-page merge (F-0210); `customer-applet` → `customer-maintenance` (F-0050). | Several pages and their aliases |

## Low — tidy-up

| id | question | blocks |
|---|---|---|
| Q-0017 | Delete the two MS ESD pages and the three Team Maintenance stubs? All are customer-specific or empty; one page's entire body is the character `1`. | (F-0270) |
| Q-0018 | Does the small **top-bar avatar** disqualify a screenshot? 232 images are quarantined; 16 kept images show only that. | The recapture backlog (F-0271) |
| Q-0019 | What should happen long-term to the **archived UTM material** — rewrite generically for public sector, or leave archived? | (F-0277, now archived) |
| Q-0020 | Should **`bl_applet_hdr.name` be normalised**? `mySST` is stored upper-case, so "title = registry name exactly" yields a shouting page title. | A wiki exception, or a data fix (F-0281) |
