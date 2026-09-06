---
topic: e-invoice-consolidation
aliases: [consolidated e-invoice, auto e-invoice consolidation, console processor, consolidated submission, monthly e-invoice cycle, SVDP pool]
applets: [myIEnvoiceAdminApplet]
modules: [e-invoice]
related: [e-invoice, my-e-invoice-admin-applet, e-invoice-submission-errors, e-invoice-reconciliation, e-invoice-cancellation-and-credit-notes, e-invoice-tin-and-identity-validation, e-invoice-throughput-and-limits, e-invoice-self-billed, emp-etl-sync, organisation-applet, customer-maintenance, internal-sales-invoice-applet, internal-sales-return-applet, pos-general-applet]
wiki:
  - content/en/guides/einvoice-guides/einvoice-pools-and-routing.md
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
status: growing
updated: 2026-09-06
---

# E-invoice consolidation and the monthly cycle

Receipts below RM 10,000 without buyer details are held in the Batch Pool and, after the month closes, grouped into consolidated e-invoices (buyer = General Public) that must reach LHDN by the 7th of the following month. Until August 2026 support ran most of this by hand (SQL, manual API calls); an automated "console" processor that builds the consolidated queue continuously and submits on a per-company schedule is being rolled out tenant by tenant in Aug–Sep 2026. The mechanics (gaps-and-islands ranges, by-document vs by-branch, 200-line cap) are in `e-invoice`; this note holds the automation, the rollout timeline and the month-end operating pattern.

## Facts

- 2026-08-04 — Consolidated submissions for the July cycle were done manually because of timeline constraints; the team found documents marked processed in BigLedger that never completed at the LHDN portal, and asked for an automatic retry or notification for documents stuck in the posting queue. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-04 — Decisions for the self-service design: processor configuration moves from direct database edits to Organization Applet settings with a per-company e-invoice on/off switch; a monitoring screen is to show which branches have completed consolidation, with a manual trigger per branch; duplicate checks are to be built into both the legacy-platform sync and the submission path and raise alerts. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-04 — Existing skip logic can exclude a specific customer or a specific document from e-invoicing; the team discussed blocking users who finalise documents of RM 10,000 and above without buyer details (no decision recorded). [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-11 — Confirmed limitation: a consolidated e-invoice cannot carry foreign buyers (foreign TIN); the workaround for a foreign recipient is to set the buyer's ID type to Passport and submit individually. Government-entity buyers: requirements still pending a review of LHDN guidance. [src:gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8]
- 2026-08-11 — Two faults blocking automation named: missing server document numbers on pool rows make the posting queue fail, and the "consolidated by branch" endpoint used the wrong timezone so it swept transactions into the wrong month. [src:gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8]
- 2026-08-18 — The automated consolidated-submission processor ("auto console submission processor") was still deactivated, with eight priority issues open against it. Rollout decision: switch it on first for tenants whose documents are native to BigLedger (previously submitted by support with manual API calls); tenants fed by the legacy-platform ETL wait until the sync gaps are fixed. [src:gdrive:1ZouyeoW0cu0-7tl8l3vADWrZpuA9e0qyCXDQwSm6xdg]
- 2026-08-26 — The three blocking issues were closed (batch-pool duplicate push guard, by-branch timezone, missing server document), and the processor was scheduled to go live for a first group of six companies for the August submission period, with the team watching that cycle. [src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA]
- 2026-08-26 — SVDP (LHDN Special Voluntary Disclosure Programme) support designed: no new upload menu; the existing Submission Type field on the document flags an SVDP document, the payload version is set to 1.3 automatically, the document goes through its own SVDP pool modelled on the single-general pool, requires FINAL posting status, and auto-submits when buyer information is complete. Not shipped as of the note. [src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA]
- 2026-08-26 — SDK validation for maximum lengths of amount and number fields is enforced in the Java and TypeScript layers, not by changing database columns (to stop LHDN length rejections at entry). [src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA]
- 2026-09-01 — The processor runs continuously to build the submission queue and transmits on each company's configured schedule; for the pilot the team triggers submission before the 7th so there are days left for manual correction of Invalid results. Pilot widened to several high-volume tenants that sync from the legacy platform; stated aim: full automation for all clients from September 2026. [src:gdrive:1hMhWYLFK2em4cqdU-P4oNt-jTpklJBEGdtO6V02YlG4]
- 2026-09-03 — Weekly technical meeting: processors for automated e-invoice submission configured and monitoring begun. [src:gmail:1a0663d23d98e303]
- 2026-09-02..04 — Observed month-end pattern at one large financial-services tenant (managed by support): submission on the 2nd; statuses go Submitted with validation in progress; after validation support sends two standard reports; the customer flags rows still IN_QUEUE and works the Invalid list; totals are reconciled separately for individual and consolidated e-invoices per to-IRB `doc_reference`; refreshed reports after each resubmission. The same tenant uses both individual and consolidated e-invoices in one cycle. [src:gmail:1a05ff766425665d] [src:gmail:1a0612e48b7c173d] [src:gmail:1a061d2198e14c0e] [src:gmail:1a064ab8ca823fb0] [src:gmail:1a06b5ad4d3db72d] [src:gmail:1a06b63c96b0119c]
- 2026-09-03 — Resubmission of Invalid August e-invoices with corrected TINs must keep the e-invoice (document) date at 31 August; the corrected TINs were found by the customer on the MyInvois portal and patched by support the same day, after which all were Valid. [src:gmail:1a066f3fb420ca81] [src:gmail:1a06784ec7d30524]

### Mechanics and operating pattern from the internal knowledge repo (ingest 2026-09-06)

**Two consolidation methods, and they are not interchangeable**

- 2026-09-01 — **By document**: batch-pool rows are grouped per company and per document type, split into a current-month and a not-current-month bucket, and one consolidated e-invoice is built per group. **One line per source document**, the line description is that document's number, unit of measure "piece". Header totals are summed from the source documents. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#consolidated-by-document]
- 2026-09-01 — **By branch**: rows are grouped per branch, per document type, per month bucket and per general TIN, and within each group a gaps-and-islands query collapses **consecutive branch document numbers into ranges**. **One line per range** (e.g. `1001-1005`), unit of measure "unit", capped at **200 lines**. Header totals are summed from the constructed lines, not from the source documents. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#consolidated-by-branch]
- 2026-09-01 — By-branch grouping is what makes separate consolidated e-invoices for general public, foreign and government counterparties possible; by-document always uses the single general-public TIN. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#key-differences-by-document-vs-by-branch]
- 2026-09-01 — Both methods write a link row per contributing document, so a consolidated e-invoice can always be traced back to the receipts inside it. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#bl_fi_my_einvoice_batch_pool_to_irb_link-table]
- 2026-09-01 — The consolidated buyer is fixed: name "General Public", TIN `EI00000000010`, ID value "NA", ID type passport, contact and e-mail "NA", every address field "NA"; currency MYR, billing frequency Monthly, classification `004` "Consolidated e-Invoice", trade fields "NA". [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#supplier-and-buyer-for-consolidated]
- 2026-09-01 — Date handling: a current-month group is dated the **last day of the current month** with billing period first-to-last day of that month; an earlier-month group is dated the last day of **its** month. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#date-handling]
- 2026-09-01 — The cycle-run processor takes an advisory lock (6-hour expiry) so two instances cannot consolidate the same rows; expired locks are cleaned up after a crash. It pulls up to 100 unprocessed rows per pass. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#advisory-locking]

**Why a consolidation fails**

- 2026-09-01 — The commonest hard failure is a **missing document number on the pool row**: by-document consolidation needs the company document number, by-branch needs the branch document number, because that value becomes the line description. If it is null the consolidation fails outright and the column has to be back-filled from the source document before re-running. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#consolidated-e-invoice-fails-due-to-missing-server_doc_1-or-server_doc_3]
- 2026-06-22 — Live instance of exactly that: a tenant's by-branch run had to be re-executed after the missing branch running number was fixed, because the consolidated queues had never been created. [src:gh:bigledger/blg-intranet#4214]
- 2026-08-20 — The by-branch endpoint had a **timezone defect** that swept the first days of the following month into the previous month's consolidation; the pool rows, to-IRB records and queues all had to be reverted. Fixed 2026-08-20. [src:gh:bigledger/blg-intranet#5663]
- 2026-06-22 — Batch-pool rows can point at **deleted** generic documents; the clean-up is to remove the unprocessed rows, remove the processed ones from the consolidated queue, and recalculate the consolidated e-invoice. [src:gh:bigledger/blg-intranet#2030]
- 2026-06-22 — Whole-tenant failures have been traced to a stale intermediary configuration rather than to the consolidation itself ("all consolidated e-invoices failing"). [src:gh:bigledger/blg-intranet#1523] [src:gh:bigledger/blg-intranet#1226]

**Backdated consolidation**

- 2026-09-01 — The standard monthly run only sweeps the current month. Batch-pool rows dated earlier need a dedicated pass: either run consolidate-by-document naming the month, once per sales document type, or pass an explicit list of pool-row identifiers when the backlog spans several months. Backdated consolidated submissions then go out through a dedicated submit path. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#backdated-consolidated-einvoice]
- 2025-11 → 2026-06 — "Backdated" is a standing line item in the monthly per-tenant submission records, alongside "individual pool" and "invalid above 10k" — i.e. it is normal, not exceptional. [src:gh:bigledger/blg-intranet#4678] [src:gh:bigledger/blg-intranet#4650]

**The month-end runbook as actually executed, per tenant**

- 2025-08 → 2026-06 — The recurring per-tenant checklist, repeated near-verbatim across dozens of monthly issues: trigger the consolidated submission; data-fix consolidated line chaining where the sync did not populate the document running number; push ETL-synced documents that are still draft into the posting queue; resubmit failed and invalid submissions as consolidated; and produce the list of customers whose data is causing failures. [src:gh:bigledger/blg-intranet#4677] [src:gh:bigledger/blg-intranet#4979] [src:gh:bigledger/blg-intranet#4976]
- 2026-09-01 — The settle-and-resubmit procedure runs on the **1st to 7th** for the previous month and is deliberately ordered: first settle the existing unprocessed batch pool as consolidated e-invoices, **then confirm with the client** whether they want failed and invalid documents resubmitted as consolidated, and only then push those documents into the batch pool and consolidate them. Scope: sales document types only, non-consolidated, below RM 10,000, previous-month date range, status in-queue or invalid. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#settle-consolidated-einvoice-submission]
- 2026-09-01 — Final step of that procedure: the superseded in-queue individual submissions must be removed from the to-IRB tables **after** the consolidated submission succeeds, or they will be picked up and submitted again later — the deliberate manual guard against exactly the duplicate pattern described in `e-invoice-cancellation-and-credit-notes`. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#step-8-remove-failed-submissions-from-queue]
- 2026-09-01 — Consolidation is scheduled **per tenant**, on a day between the 2nd and the 7th, with a few on the 1st or the last day of the month and a few handled entirely manually. The choice of by-document vs by-branch is also per tenant. (The schedule table itself is tenant-identifying and stays in kb/private.) [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#consolidated-einvoice-by-tenant]

**What is missing from the automation**

- 2026-08-04 — The consolidation processor can only run **all branches at once**; there is no per-branch or per-period run log, no screen showing which branch has been consolidated for which month, and no user-facing RUN button. The table intended to hold a cycle-run record exists but has no branch column and no caller. [src:gh:bigledger/blg-intranet#5624]
- 2026-08-04 — Marketplace nuance raised in the same issue: eligibility is not really "branch". A sales invoice created manually on a marketplace branch for a normal named customer must not be silently swallowed into the consolidated e-invoice — but with a consolidated submission type it is, under the general-public TIN. There is no marketplace or branch predicate anywhere in the e-invoice path. [src:gh:bigledger/blg-intranet#5624]
- 2026-08-04 — Documents of RM 10,000 and above are parked in the individual pool **indefinitely and silently** if nobody completes the buyer details; there is no ageing detection anywhere in the e-invoice domain. Every parked document is by definition a high-value invoice not reported to LHDN. [src:gh:bigledger/blg-intranet#5623]
- 2026-08-04 — And the threshold gate only fires for the enforced document types (sales invoice and cash bill); a ≥RM 10,000 document of another consolidatable type falls through into consolidation, which is what LHDN forbids. The completeness of that type list needs an explicit audit. [src:gh:bigledger/blg-intranet#5623]
- 2026-04-02 — Long-standing request: one endpoint that processes failed **and** invalid e-invoices as consolidated in a single action, instead of the multi-step procedure above. [src:gh:bigledger/blg-intranet#4393]

## How it connects

- **e-invoice** — the routing, pool and consolidation mechanics; this note adds who presses the button and when.
- **my-e-invoice-admin-applet** — Batch Pool → Consolidate / Consolidate By Branch → Consolidated Submission → Submit is the manual path the processor now automates; the planned per-branch monitoring screen and reconciliation-error dashboard belong on this page when they ship.
- **e-invoice-submission-errors** — the month-end cycle stalls on stuck IN_QUEUE rows, blank report columns and wrong-report status filtering; those symptoms are catalogued there.
- **emp-etl-sync** — for tenants whose documents come from the legacy platform, consolidation fails first on sync gaps (missing items, drafts, missing state); that is why they were last in the rollout.
- **organisation-applet** — the per-company e-invoice switch and processor schedule are moving into the Organization Applet.
- **customer-maintenance** — foreign buyers must be keyed with ID type Passport and go individual; wrong TINs are what Invalid lists are made of.
- **internal-sales-invoice-applet** — the Submission Type field is the hook for SVDP (new value, version 1.3).
- **internal-sales-return-applet** — advice to submit consolidated sales returns in some cases (sentence truncated in the source; see questions).

## Open questions

- What exactly are "the usual 2 reports" support sends after validation, and can the customer export them from the applet? → kb/questions/2026-09-05-einvoice-month-end-report-pack.md
- SVDP: what is the Submission Type value, and when does it ship? → kb/questions/2026-09-05-svdp-submission-type.md
- Is the foreign-TIN consolidation limit an LHDN rule or a BigLedger one, and what applies to government buyers? → kb/questions/2026-09-05-consolidation-foreign-and-government-buyers.md
- What was the truncated advice on consolidated sales returns? → kb/questions/2026-09-05-consolidated-sales-returns.md

## Wiki impact

- `einvoice-pools-and-routing.md` "monthly consolidation cycle": say the consolidation + submission is now processor-driven on a per-company schedule (pilot Aug–Sep 2026), that support triggers early to leave correction time, and add the foreign-buyer rule.
- `my-e-invoice-admin-applet.md`: mark the Consolidated Submission → Submit button as the manual fallback; add SVDP pool and per-branch monitoring only when shipped.

## How it connects (added 2026-09-06)

- **e-invoice-cancellation-and-credit-notes** — a consolidated e-invoice can only be cancelled with one of the four processing-logic options, and the remaining documents must then be re-consolidated from an explicit list.
- **e-invoice-reconciliation** — the tally is what tells you the consolidation actually swept everything; the "processed but failed" batch-pool row is the classic silent gap.
- **e-invoice-tin-and-identity-validation** — by-branch consolidation splits by general TIN, so the counterparty class (local / foreign / government) decides which consolidated e-invoice a receipt lands in.
- **e-invoice-throughput-and-limits** — the 200-line cap and the serial submission rate together set how long a branch consolidation takes.
- **pos-general-applet** — the consolidated stream is overwhelmingly counter sales; the marketplace-branch nuance in #5624 is a POS/branch modelling question, not an e-invoice one.

## Open questions (added 2026-09-06)

- Is by-document or by-branch the recommended default for a multi-branch retailer, and on what grounds? Both are in production; the wiki currently implies one behaviour. → kb/questions/2026-09-06-consolidation-by-document-vs-by-branch.md
- Can a customer run a consolidation for a chosen branch or period themselves today, or is it support-only? #5624 says all-branches-only with no screen.
