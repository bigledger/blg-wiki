---
topic: e-invoice-consolidation
aliases: [consolidated e-invoice, auto e-invoice consolidation, console processor, consolidated submission, monthly e-invoice cycle, SVDP pool]
applets: [myIEnvoiceAdminApplet]
modules: [e-invoice]
related: [e-invoice, my-e-invoice-admin-applet, e-invoice-submission-errors, emp-etl-sync, organisation-applet, customer-maintenance, internal-sales-invoice-applet, internal-sales-return-applet]
wiki:
  - content/en/guides/einvoice-guides/einvoice-pools-and-routing.md
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
status: growing
updated: 2026-09-05
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
