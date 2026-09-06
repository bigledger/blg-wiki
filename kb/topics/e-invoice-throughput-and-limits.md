---
topic: e-invoice-throughput-and-limits
aliases: [LHDN rate limits, submission throughput, 200 lines, document size limit, batching, 429, token limits, RM 10000 threshold]
applets: [myIEnvoiceAdminApplet]
modules: [e-invoice]
related: [e-invoice, e-invoice-submission-errors, e-invoice-consolidation, my-e-invoice-admin-applet]
wiki:
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
  - content/en/guides/einvoice-guides/einvoice-pools-and-routing.md
status: growing
updated: 2026-09-06
---

# How fast and how big — the hard limits on e-invoice submission

Two different sets of numbers govern e-invoicing: LHDN's published API limits, and BigLedger's own
per-run processor capacities. They matter to a user for exactly one reason — they decide how long a
month-end submission actually takes, and how big a single e-invoice may be. Everything below is
measured or published, not estimated.

## Facts

### LHDN's published limits

- 2026-06-12 — Rate limits are **per client ID, not per access token**: login (intermediary) 12 requests/minute, **submit documents 100 RPM**, get submission 300 RPM, get document details 125 RPM, cancel 12 RPM. Breaching returns 429 with `Retry-After`. [src:gh:bigledger/blg-intranet#5264]
- 2026-06-12 — One `documentsubmissions` call accepts **up to 100 documents**, **5 MB total**, **≤300 KB per document**. [src:gh:bigledger/blg-intranet#5264]
- 2026-06-12 — Access tokens are valid **60 minutes** and LHDN explicitly recommends reusing one; frequent token minting is itself rate-limited (12 RPM) and is called an anti-pattern. Rotating several tokens minted from the *same* client ID does **not** multiply the submit quota — only additional ERP registrations (each with its own client ID) do, and that is a portal/admin action, not a code change. [src:gh:bigledger/blg-intranet#5264]
- 2026-07-14 — Bulk submit from the Validation Queue was capped at **20 records** per action to stay inside an LHDN limit. [src:gh:bigledger/blg-intranet#5458]

### BigLedger's own per-run capacities (as measured 2026-06)

- 2026-06-12 — The chain and its defaults: feeder `E_INVOICE_TO_IRB_SUBMISSION_QUEUE_PROCESSOR` **10 records per run**; submitter `E_INVOICE_TO_IRB_SUBMISSION_PROCESSOR` **max 50 iterations per run, one document per iteration, serial**; status poller `E_INVOICE_TO_IRB_VALIDATION_STATUS_UPDATE_PROCESSOR` **20 records per run, one GET per document**. A pacemaker fans the processors out per tenant every minute. [src:gh:bigledger/blg-intranet#5264]
- 2026-06-12 — Each submission packs exactly **one document per LHDN call**, and the consolidated flow is equally serial. There is no parallelism anywhere in the submission path — no thread pool, no async HTTP. Measured ceiling: roughly **600–3,000 documents per hour**. [src:gh:bigledger/blg-intranet#5264]
- 2026-06-12 — Additional hardening gaps found at the same time: a new HTTP client is created per request with **no connection pooling and no timeouts** (a hung LHDN call blocks the processor indefinitely), and there is **no 429 back-off on the submission path** — retry/back-off exists only on the bulk-cancellation path. [src:gh:bigledger/blg-intranet#5264]
- 2026-06-12 — Recommended fixes, in order: batch up to 100 documents per call (turning 40,000/hour into ~400 calls/hour), poll status per **submission** rather than per document, run 4–8 concurrent workers (the dequeue is already `SKIP LOCKED` and safe), and as a config-only quick win raise the feeder limit and submitter iteration count in the schedule properties. [src:gh:bigledger/blg-intranet#5264]
- 2026-09-02 — What a customer actually experienced during a month-end cycle: roughly **100 e-invoices per 2 hours**; a speed-up enhancement was in code review at the time and support pushed the cycle through manually. [src:gmail:1a05ff766425665d] [src:gmail:1a0609d7143fa9b7]

### Size and line limits on a single e-invoice

- 2026-06-10 — Measured payload sizes for a sales invoice: 11 lines → 17.3 KB Valid; 55 lines → 58.2 KB Valid; 100 lines → 127 KB Valid; **200 lines → 245 KB Valid; 300 lines → fails**. The work item was to split a source document with more than 200 lines into multiple to-IRB documents. [src:gh:bigledger/blg-intranet#277]
- 2026-09-01 — Consolidated-by-branch construction caps a consolidated e-invoice at **200 lines**, each line being one consecutive document-number range. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#line-mapping]
- 2026-09-01 — Field-level truncations applied silently before submission: line description 300 characters, item remarks 250, address line 150, city 50, postal code 5, running number 50, trade tariff code 12. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#item_desc_no-construction] [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#line-field-mapping]
- 2026-08-26 — Header tax-exemption text is capped at 300 characters to match an LHDN limit. [src:git:blg-akaun-platform-java@9a9ab000a1]
- 2026-08-26 — Maximum lengths for amount and number fields are enforced in the SDK layers rather than by changing database columns, so that over-long values are caught at entry instead of by LHDN. [src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA]

### The one threshold users must know

- 2026-09-01 — RM 10,000 (**inclusive**) is the point at which a sale can no longer be consolidated. In the backend it is a literal in five places rather than a named constant, and the divert only fires for the enforced document types (sales invoice and cash bill), so a ≥RM 10,000 document of another consolidatable type can still fall through to consolidation — flagged as needing an explicit audit. [src:gh:bigledger/blg-intranet#5623] [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#einvoice-document-movement]

## How it connects

- **e-invoice-consolidation** — throughput is what decides whether a customer can still fix Invalid results before the 7th; this is why the pilot triggers consolidation days early.
- **e-invoice-submission-errors** — "rows still IN_QUEUE the next morning" is usually throughput plus a missing retry, not a data problem.
- **my-e-invoice-admin-applet** — the 20-record cap on bulk validation submit and the per-run processor limits are user-visible behaviours that look like bugs when undocumented.

## Open questions

- Has submission batching shipped? Until it has, any guide that promises "instant" submission is wrong for high-volume tenants. → kb/questions/2026-09-06-einvoice-submission-batching-status.md
- What throughput figure is safe to publish as a planning number for a month-end cycle?

## Wiki impact

- `einvoice-pools-and-routing.md` / a month-end guide — set an expectation: submission is a background queue, a large month-end batch takes hours, start early.
- `my-e-invoice-admin-applet.md` — say why the Validation Queue bulk action is limited to 20 rows.
- Anywhere that documents very large invoices — a source document above ~200 lines needs splitting.
