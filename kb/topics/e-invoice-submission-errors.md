---
topic: e-invoice-submission-errors
aliases: [submission report error, blank e-invoice number, client_doc_1 empty, IN_QUEUE stuck, failed IRB summary report, e-invoice throughput]
applets: [myIEnvoiceAdminApplet]
modules: [e-invoice]
related: [e-invoice, my-e-invoice-admin-applet, e-invoice-consolidation, customer-maintenance, emp-etl-sync, internal-sales-invoice-applet]
wiki:
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
  - content/en/guides/einvoice-guides/einvoice-validation.md
status: growing
updated: 2026-09-05
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
