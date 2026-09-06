---
topic: e-invoice-submission-errors
aliases: [submission report error, blank e-invoice number, client_doc_1 empty, IN_QUEUE stuck, failed IRB summary report, e-invoice throughput]
applets: [myIEnvoiceAdminApplet]
modules: [e-invoice]
related: [e-invoice, my-e-invoice-admin-applet, e-invoice-consolidation, e-invoice-reconciliation, e-invoice-tin-and-identity-validation, e-invoice-address-and-state-codes, e-invoice-throughput-and-limits, e-invoice-cancellation-and-credit-notes, customer-maintenance, emp-etl-sync, internal-sales-invoice-applet]
wiki:
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
  - content/en/guides/einvoice-guides/einvoice-validation.md
status: growing
updated: 2026-09-06
---

# E-invoice submission errors seen in operation

What actually goes wrong between "document finalised" and "Valid at LHDN", as reported by customers and support in Aug–Sep 2026 — as distinct from LHDN validation codes (those are in `e-invoice`). Most of these are report-reading and processor-health problems, not payload problems.

## Facts

- 2026-08-27 — A large tenant found the **E-Invoice Number column blank in the Submission History export** for every transaction from a date in early August onward; support patched the rows the next day and promised a permanent fix. [src:gmail:1a066c168bdcd3cb]
- 2026-09-03 — Permanent fix: the processing service now **syncs the running number for invoice submissions**, closing a timing gap between submission and the number being written back. [src:gmail:1a0663d23d98e303]
- 2026-08-04 — Related bug recorded earlier: the invoice running number stays null on the generated document header after a successful submission; investigation of why the value is not written back was a next step. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-09-03 — **Submission History's E_INVOICE_STATUS is a snapshot at submission time** (it should read Submitted); it is not the live LHDN status. To filter Invalid rows for resubmission, export from **Internal Submission → To IRB E-Invoice**. A customer preparing resubmission from the wrong export saw statuses that did not match the portal. [src:gmail:1a066c168bdcd3cb]
- 2026-09-03/04 — `client_doc_1` (the customer's own document number) was **empty on the export** for some rows, twice; support patched both times. Root cause given for the second occurrence and for a row stuck IN_QUEUE: a **database connection timeout on one processor**. [src:gmail:1a066c168bdcd3cb] [src:gmail:1a066f04bd810fff] [src:gmail:1a06b91ed1936aa9] [src:gmail:1a06ba1478ffadde]
- 2026-09-02 — **Throughput**: the same tenant measured roughly 2 hours per 100 e-invoices during the August cycle; support said an enhancement to speed up submission was pending code review and testing and pushed the cycle through manually. [src:gmail:1a05ff766425665d] [src:gmail:1a0609d7143fa9b7] [src:gmail:1a06100196eaa21b]
- 2026-09-03 — A document still showing **IN_QUEUE** the morning after submission was resolved by support (no self-service action given to the customer). [src:gmail:1a064ab8ca823fb0] [src:gmail:1a0656129c1a2fcc]
- 2026-09-04 — **Report totals differed** between two exports; the individual-side difference came down to one to-IRB `doc_reference`, the consolidated-side difference to two; both fixed by support. [src:gmail:1a06b2214ee5bfb6] [src:gmail:1a06b5ad4d3db72d] [src:gmail:1a06b63c96b0119c]
- 2026-09-03 — **Failed-IRB summary report workflow**: support sends a spreadsheet of Invalid rows; the customer looks up each correct TIN on the MyInvois portal, marks the sheet, and asks support to patch the TIN and resubmit, keeping the original document date. All Valid the same day. [src:gmail:1a066f3fb420ca81] [src:gmail:1a06729eff634fc2] [src:gmail:1a06784ec7d30524]
- 2026-08-04 — Processor outages come from **access-token expiry and server reboots**; a manual restart mechanism and a heartbeat (clock-signal) health check were proposed. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-11 — The **individual-pool failure e-mail** processor is to run daily rather than only at the end of the cycle, so customers learn of missing buyer details early; an **admin dashboard of reconciliation errors** (filters: invoice date, Invalid status code) is to replace manually distributed files. [src:gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8]
- 2026-09-03 — **TIN values are stripped of spaces on save** in customer maintenance (prevents a class of Invalid TIN results). [src:gmail:1a0663d23d98e303]
- 2026-08-04 — Task set: compile the common errors of the previous four months with a technical resolution for each, as input to automation. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]

### Queue-level failure modes from the internal knowledge repo (ingest 2026-09-06)

**The queue lies about what it will do next**

- 2026-07-28 — On one large tenant **1,023 documents sat in the in-queue state**, the oldest dated January 2025 — the class had been recurring silently for 19 months. **564 queue rows were in a failed state**, none of which would ever be retried and none of which raised an alert. [src:gh:bigledger/blg-intranet#5567]
- 2026-07-28 — **116 of those 564 failures carry no diagnostic at all** — no request URL, no request body, no response, no error text. The failure happened before or during request construction and nothing was written down, so the cause cannot be established from the data at all. The ask: any transition into a failed state must persist a reason, even if the HTTP call never happened. [src:gh:bigledger/blg-intranet#5567]
- 2026-07-28 — **The retry counter is decorative.** All 564 failed rows showed "5 retries remaining"; the counter is never decremented because nothing ever retries them. Operations staff saw retries pending and reasonably waited for something that was never going to happen. [src:gh:bigledger/blg-intranet#5567]
- 2026-07-28 — **461 headers were in-queue with no submission-queue row at all**, i.e. unreachable by any processor — not failed, not retrying, not terminal. Asked for: a reconciliation job that re-enqueues or flags them, plus alerting on queue depth and queue age. [src:gh:bigledger/blg-intranet#5567]
- 2026-08-04 — The posting queue has the mirror defect: after more than five attempts a row is marked **processed**, so an abandoned document becomes invisible to every "unprocessed" query. On the submission side the remaining-retries column is initialised and reset but never read, a failed submission moves to a state the main drain never selects, and the recovery processor works **newest-first** with a small limit — so once the failure backlog exceeds that limit the oldest failures starve forever. [src:gh:bigledger/blg-intranet#5626]
- 2026-08-04 — There is **no age detection anywhere** in the e-invoice domain: no query asks how long anything has been sitting. Requested: detect any queue row older than a configurable threshold (default 24 hours) in a non-terminal state, retry a bounded number of times, then alert. [src:gh:bigledger/blg-intranet#5626]

**Documents that vanish**

- 2026-08-26 — Finalised, eligible documents can end up in no pool, no queue and no e-invoice record, silently — see `e-invoice-reconciliation` for the mechanism. The user-visible symptom is always the same: a customer notices a missing e-invoice weeks later. [src:gh:bigledger/blg-intranet#5618]
- 2026-06-22 — Infrastructure outages produce the same symptom in bulk: after a server outage, finalised documents did not reach the e-invoice applet at all and had to be pushed by hand. Two LHDN-side service updates produced the same result. [src:gh:bigledger/blg-intranet#1638] [src:gh:bigledger/blg-intranet#1746] [src:gh:bigledger/blg-intranet#645]

**Guards that were missing and have since been added**

- 2026-07-03 — Save-and-Resubmit could be pressed on an e-invoice that was already Valid or already Submitted. A guard was added: re-fetch the record, refuse if the status is Valid ("already Valid at LHDN, cannot resubmit") or Submitted ("LHDN is still processing it, wait for the status"), and allow only when the status is Invalid. [src:gh:bigledger/blg-intranet#5415]
- 2026-08-20 — No duplicate guard existed on the batch-pool push or in consolidation; both were added after a production double-submission. [src:gh:bigledger/blg-intranet#5427]
- 2026-04-02 — Two long-standing resubmission defects remain open: "resubmit as new e-invoice" misbehaving, and a single-general-pool Save-and-Resubmit / Save-and-Resubmit-as-new bug. [src:gh:bigledger/blg-intranet#4133] [src:gh:bigledger/blg-intranet#4389]
- 2026-02-05 — A front-end defect made the individual-pool submit screen loop until the browser stack overflowed; reproducible by cloning a document, finalising it, processing it out of the posting queue and submitting it from Individual Submission. [src:gh:bigledger/blg-intranet#1987]

**Data-shaped failures customers actually report**

- 2026-06-22 — Submission failed because the document had **no line items**. [src:gh:bigledger/blg-intranet#1750]
- 2026-06-22 — Invalid because the line unit of measure and UOM description were wrong; a data fix followed. [src:gh:bigledger/blg-intranet#2051] [src:gh:bigledger/blg-intranet#1826]
- 2026-06-22 — Invalid because the **customer name** on the document was wrong and had to be corrected before resubmission. [src:gh:bigledger/blg-intranet#1856]
- 2026-06-22 — A customer record with incomplete e-invoice data holds every one of that customer's documents in the batch pool, which reads to the customer as "the batch pool is broken". [src:gh:bigledger/blg-intranet#1942]
- 2026-06-22 — When a document is fixed from the batch pool and submitted individually, the currency has to be carried across from the pool row to the document if it is not already set. [src:gh:bigledger/blg-intranet#1924]

**Failures that are not the platform's**

- 2026-06-22 — Insufficient permissions granted to BigLedger as intermediary on the MyInvois portal, and expired intermediary configurations, together account for a recurring share of "all submissions failing" reports. [src:gh:bigledger/blg-intranet#2048] [src:gh:bigledger/blg-intranet#1778]
- 2026-08-01 — And one report of "duplicated e-invoices at LHDN" turned out to be two independent document-number sequences colliding — no duplicate existed, and acting on the report would have destroyed valid e-invoices. Always check the document type before cancelling. [src:gh:bigledger/blg-intranet#5588]

### Verified against the current backend and applet source (2026-09-06)

Read directly from the checked-out repos, which corroborate and sharpen the 2026-07/08 internal reports.

- The submission queue **does** carry a `remaining_retries` column. It is written as `5` when the queue row is created (`EInvoiceToIRBSubmissionQueueProcessorService`) and reset to `5` on resubmission (`MyEInvoiceToIrbResubmissionService`). **Nothing anywhere calls `getRemaining_retries()`**, and nothing decrements it. The "5 retries remaining" that operations staff read on 564 failed rows is a literal that was never going to change. [src:git:blg-akaun-platform-java@1ff620ef0e]
- `E_INVOICE_TO_IRB_SUBMISSION_PROCESSOR` deletes and processes **one** `NOT_SUBMITTED` row per iteration (`DELETE … LIMIT 1 FOR UPDATE SKIP LOCKED`), up to a default 50 iterations per run — i.e. submission is strictly serial, one document per LHDN call. A row that throws is stamped `FAILED` / `SUBMISSION_FAILED` with the reason in `request_error`. [src:git:blg-akaun-platform-java@1ff620ef0e]
- `E_INVOICE_FAILED_SUBMISSION_PROCESSOR` re-drives failed rows **newest-first** (`orderBy created_date`, `order DESC`) with a default `limit` of 10. The starvation of the oldest failures reported in July is **still present** in this checkout. [src:git:blg-akaun-platform-java@1ff620ef0e]
- The **Validation Queue** is the one place with a working retry counter: `doc_status_update_retries` increments on each status poll and the queue row is permanently deleted at 10 attempts, or once LHDN's `dateTimeReceived` is 3 days old. [src:git:blg-akaun-platform-java@1ff620ef0e]
- **Validation Queue → Submit is capped at 20 rows** (`maxSelection = 20`): the grid trims any selection above 20, select-all included, with the toaster *"You can only select up to 20 records per submission."* The cap is a UI guard on a synchronous endpoint — `processValidationQueueGuids` loops the selected GUIDs and makes one `getDocumentDetailByDocumentId` call to LHDN per row inside the single request. Added 2026-07-14 with the bulk checkboxes. [src:git:blg-applet-wavelet-my-invoice-admin-applet@d7841e7] [src:git:blg-akaun-platform-java@1ff620ef0e] [src:gh:bigledger/blg-intranet#5458]

## How it connects

- **my-e-invoice-admin-applet** — the Submission History vs To IRB E-Invoice distinction, the IN_QUEUE row, and the Bulk TIN Validation tool all live on that page; the troubleshooting table needs rows for blank number / blank client_doc_1 / report mismatch.
- **e-invoice-consolidation** — every symptom above appears in the first days of the month and delays the 7th-day deadline.
- **customer-maintenance** — TIN correction is a master-data edit; space-stripping on save shipped 2026-09-03.
- **emp-etl-sync** — for synced tenants the upstream cause is often a document that never arrived or arrived incomplete.
- **e-invoice** — LHDN error codes (CF324, CF358, DC511, DR303/308, CV317) are catalogued there; nothing here contradicts them.

## Open questions

- Which two reports make up the month-end pack? → kb/questions/2026-09-05-einvoice-month-end-report-pack.md
- Will the Submission History export be relabelled or given the live status? (product decision; noted in research file)

## Wiki impact

- `my-e-invoice-admin-applet.md`: Submission History row + troubleshooting rows (blank E-Invoice Number, blank client_doc_1, status mismatch, throughput expectation).
- A month-end checklist guide would answer most of this thread's questions before they are asked.

## How it connects (added 2026-09-06)

- **e-invoice-reconciliation** — an in-queue row and a ghost document look identical to the customer ("my e-invoice isn't at LHDN") but have different causes and different fixes.
- **e-invoice-throughput-and-limits** — "still in queue the next morning" after a big month-end is usually rate, not failure.
- **e-invoice-tin-and-identity-validation** / **e-invoice-address-and-state-codes** — the two master-data classes behind most pool reasons and most Invalid results.
- **e-invoice-cancellation-and-credit-notes** — the guard that refuses Save-and-Resubmit on a Valid e-invoice is what forces the cancellation route.

## Open questions (added 2026-09-06)

- Are the retry semantics fixed? Until they are, no wiki page should tell a reader "it will retry automatically". → kb/questions/2026-09-06-einvoice-queue-retry-semantics.md
