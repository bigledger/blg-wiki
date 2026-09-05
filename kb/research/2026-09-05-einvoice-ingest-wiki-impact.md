---
source: kb/sources/gdrive/ledger.jsonl (6 docs) + kb/sources/email/ledger.jsonl (33 messages, 8 threads), ingested 2026-09-05
privacy: anonymised — no tenant, customer or person names; facts cited by source id
purpose: wiki-impact candidates for the batch loop (inbox F-0119 … F-0131)
---

# E-invoice ingest (Drive + Gmail, 2026-08-04 → 2026-09-04) — what should change on the wiki

Topics touched: `e-invoice` (extended), `e-invoice-consolidation`, `e-invoice-submission-errors`, `emp-etl-sync`, `e-invoice-ocr-intake` (new); lateral facts on `my-e-invoice-admin-applet`, `customer-maintenance`, `internal-sales-invoice-applet`, `internal-sales-return-applet`, `internal-sales-credit-note-applet`, `doc-item-maintenance`, `stock-availability`, `internal-purchase-grn-applet`, `internal-purchase-credit-note-applet`, `entity-applet`, `stock-adjustment`, `sales-report-applet`.

| Id | Page | Change | Facts |
|---|---|---|---|
| F-0119 | content/en/applets/e-invoice/my-e-invoice-admin-applet.md — Screens table, Submission History row | State that the export's E_INVOICE_STATUS is the status at submission time (normally Submitted), and that the live LHDN status — and the Invalid filter for resubmission — comes from Internal Submission → To IRB E-Invoice → Export. | gmail:1a066c168bdcd3cb |
| F-0120 | same page — Troubleshooting | Add rows: (a) E-Invoice Number blank on Submission History export → running-number write-back gap, fixed in the processing service 2026-09-03, older rows patched by support; (b) client_doc_1 blank on export / a row stuck IN_QUEUE after submission → processor database-connection timeout, support re-runs; (c) totals differ between individual and consolidated exports → reconcile per to-IRB doc_reference. | gmail:1a066c168bdcd3cb, gmail:1a0663d23d98e303, gmail:1a06ba1478ffadde, gmail:1a06b5ad4d3db72d, gmail:1a06b63c96b0119c |
| F-0121 | content/en/guides/einvoice-guides/einvoice-pools-and-routing.md — "The monthly consolidation cycle" | Consolidation and consolidated submission are now run by a scheduled processor per company (rolled out Aug–Sep 2026; manual Submit remains the fallback); it is triggered a few days before the 7th to leave time to fix Invalid results; a document is either individual or consolidated, never both. | gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA, gdrive:1hMhWYLFK2em4cqdU-P4oNt-jTpklJBEGdtO6V02YlG4, gdrive:1ZouyeoW0cu0-7tl8l3vADWrZpuA9e0qyCXDQwSm6xdg |
| F-0122 | content/en/guides/einvoice-guides/einvoice-validation.md — General TINs / foreign buyers | Foreign buyers cannot be consolidated: key ID type Passport and submit individually (general TIN EI00000000020 if no TIN). Government buyers: pending (kb/questions/…foreign-and-government-buyers). | gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8 |
| F-0123 | NEW content/en/guides/einvoice-guides/month-end-submission-checklist.md | A user guide for the 1st–7th: what the processor does, what to export (To IRB E-Invoice, Discrepancies Report), how to work the Invalid list (look up TIN on MyInvois, fix the customer, Save and Resubmit or Bulk TIN Validation — the document date is kept), what IN_QUEUE means the next morning, and realistic throughput (plan for ~50 e-invoices/hour today; enhancement pending). Blocked on kb/questions/…month-end-report-pack for the exact report names. | gmail:1a05ff766425665d, gmail:1a0612e48b7c173d, gmail:1a064ab8ca823fb0, gmail:1a066f3fb420ca81, gmail:1a06784ec7d30524, gmail:1a0609d7143fa9b7 |
| F-0124 | content/en/guides/einvoice-guides/myinvois-setup.md (Step 2) and the Organization applet page | When shipped: the per-company e-invoice enable/disable switch and processor schedule live in Organization Applet settings instead of a support request. Hold until the setting is visible in the applet. | gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0 |
| F-0125 | content/en/guides/einvoice-guides/einvoice-pools-and-routing.md — Submission types; sales invoice applet page | SVDP submission type (payload version 1.3, own pool, FINAL required, auto-submit). Designed 2026-08-26, not shipped — Vincent to say whether the wiki pre-announces or waits. | gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA |
| F-0126 | content/en/guides/einvoice-guides/_index.md — "frequent issues" table, Duplicate submission row | "System prevents duplicates; check submission history" is wrong on both counts: the duplicate guard (2026-08-20) covers batch-pool pushes only, and Submission History is a snapshot. Point to the admin page's duplicate row and To IRB export instead. | gmail:1a066c168bdcd3cb, gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA |
| F-0127 | NEW (decision needed) content/en/guides/einvoice-guides/documents-synced-from-emp.md | For tenants on the legacy platform: what must be complete at the source (items, customer state, classification codes), how voided credit memos are negated, what the unsynced-document notification means, and why their consolidation runs later. Blocked on kb/questions/…emp-etl-sync-on-wiki. | gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0, gdrive:1ZouyeoW0cu0-7tl8l3vADWrZpuA9e0qyCXDQwSm6xdg, gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA, gmail:1a0663d23d98e303 |
| F-0128 | content/en/applets/e-invoice/my-e-invoice-admin-applet.md — §4 processors table, failure e-mail row | Individual-pool failure e-mail now daily (decision 2026-08-11); mention the planned reconciliation-error dashboard and per-branch consolidation monitor only when they appear in the menu. | gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8, gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0 |
| F-0129 | content/en/applets/… customer maintenance page — e-invoice fields | TIN is saved without spaces (2026-09-03); foreign buyers need ID type Passport; a customer with no state fails address construction. | gmail:1a0663d23d98e303, gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8 |
| F-0130 | NEW (scope unknown) OCR e-mail intake | An SES e-mail-receiving channel for OCR was deployed to production around 2026-09-05; no wiki mention. Blocked on kb/questions/…ocr-email-intake-scope. | gmail:1a069e68f3133a81 |
| F-0131 | Lateral, non-e-invoice, from the 2026-09-03 technical meeting: stock-availability page (draft GRN balance shown), internal-purchase-credit-note page (auto currency rate for foreign suppliers), purchase invoice / GRN pages (batch number + batch date fields), stock adjustment page (repost on failed status), sales report page (load time), entity listing (status filter proposed, not built) | One-line "what changed" notes; verify each against the applet repo before writing. | gmail:1a0663d23d98e303 |

## Not for the wiki

- Personnel, leave, HR escalation and performance content in the project notes — skipped entirely.
- Tenant lists for the pilot, customer names, TINs, document numbers, doc_reference values — in kb/private only.
- The third-party e-invoice application approval (certificate download) — company admin, not product; ledgered as triaged/low.
- The 2025 marketing BRD — one positioning fact kept in `e-invoice`, nothing else.

## Needs Vincent

1. F-0125 — pre-announce SVDP or wait for the release?
2. F-0127 — does EMP→BigLedger sync belong on the public wiki?
3. F-0130 — scope of the OCR e-mail intake.
4. kb/questions/2026-09-05-consolidated-sales-returns.md — the truncated advice on consolidated sales returns.
5. Whether the Submission History export should be relabelled (product) or merely documented (wiki) — F-0119 assumes documented.
