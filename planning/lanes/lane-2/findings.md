# Lane 2 findings

Folders: finance, crm, integrations, rma, human-resources

## Cross-lane link requests

- **Ledger And Journal ↔ master-data / sales pages**: add `ledger-and-journal-applet` to `related_applets` of chart-of-account-applet, organisation-applet, cashbook-applet, internal-sales-invoice-applet. Also `content/en/guides/accounting-guides/journal-entries.md` says (if it does) that Void creates a contra entry — in the applet the listing action is a soft delete of the manual journal; only document VOIDs create reversing journals.

- **Payment Voucher (Internal) ↔ purchase-workflow / master-data pages**: add `internal-payment-voucher-applet` to `related_applets` of internal-purchase-debit-note-applet, internal-purchase-credit-note-applet, supplier-applet-1, cashbook-applet, chart-of-account-applet, organisation-applet.

- **Receipt Voucher (Internal) ↔ sales-workflow / master-data pages**: add `internal-receipt-voucher-applet` to `related_applets` of internal-sales-invoice-applet, internal-sales-debit-note-applet, internal-sales-credit-note-applet, customer-maintenance-applet, cashbook-applet, chart-of-account-applet, organisation-applet.

- **Purchase Invoice (Internal) ↔ purchase-workflow pages** (Lane owning `purchase-workflow/`): add `internal-purchase-invoice-applet` to `related_applets` of internal-purchase-order-applet, internal-purchase-grn-applet, internal-purchase-requisition-applet, supplier-delivery-order-applet, internal-purchase-return-applet, internal-purchase-credit-note-applet, internal-purchase-debit-note-applet, internal-purchase-invoice-no-stock-in-applet, internal-purchase-invoice-supplier-access-applet.
- **Purchase Invoice (Internal) ↔ master-data / e-invoice pages**: add it to `related_applets` of supplier-applet-1, chart-of-account-applet, tax-configuration-applet, cashbook-applet, organisation-applet, my-e-invoice-portal-applet.
- **Stock-movement claim is inverted in several pages.** Code: Purchase Invoice (Internal) applet constants `quantity_signum = 1` (stock in); standard Purchase GRN (Internal) `quantity_signum = 0` (no stock); GRN Stock In = 1; Purchase Invoice No Stock In = 0. `content/en/applets/purchase-workflow/internal-purchase-grn-applet.md` ("automatic stock-in", "+95 laptops added to stock") and `content/en/guides/purchasing-guides/standard-procurement-workflow.md` should say the GRN records receipt and the invoice books stock, unless the tenant uses the GRN Stock In / Invoice No Stock In pair. (Sources: applet-constants.ts in each repo; GenericDocumentService.purchaseDocTypeSignumZero.)
- `content/en/modules-v2/purchasing/_index.md` lines 19 and 31 link "Purchase Invoice Applet" to `/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/`; should be `/applets/finance/internal-purchase-invoice-applet/`.
- Registry `documentation_url` for `internal-receipt-voucher-applet` is `/applets/internal-receipt-voucher-applet/` while the page lives under `finance/` — check the page has that alias (Lane 2 will add if missing).

## Registry / naming mismatches

- `internal-receipt-voucher-applet`: two repos exist — `blg-applet-wavelet-internal-receipt-voucher-applet` (stale, last commit 2025-11, its environment even points at another applet code) and `blg-applet-wavelet-internal-receipt-voucher-applet-v2` (active, 2026-08). The page cites v2. The wiki page title was "Receipt Voucher (Internal) Applet"; now the registry name "Receipt Voucher (Internal)".

- `internal_purchase_invoice_applet` appears twice in the registry: ACTIVE "Purchase Invoice (Internal)" (2021-12-22) and DELETED "Internal Purchase Invoice" (2021-12-20). Page uses the ACTIVE name. No action needed unless the parity check keys on code only.

## Undocumented applets encountered

- `internalReimbursementPaymentVoucherApplet` — "Reimbursement Payment Voucher Applet (Internal)", ACTIVE since 2025-04-24, repo `blg-applet-wavelet-internal-reimbursement-payment-voucher-applet`; no wiki page. Mentioned as a sibling on the Payment Voucher page without a link.

## Questions for Vincent

1. **Stock movement on the standard purchase pair.** Code says the standard Purchase GRN (Internal) applet posts lines with quantity signum 0 (no stock movement) and the Purchase Invoice (Internal) posts signum +1 (stock in); the GRN Stock In / Purchase Invoice No Stock In pair is the reverse. The old Purchase Invoice page, the GRN page and the standard-procurement guide all say the opposite. The PI page now states the code behaviour. Please confirm this is the intended product behaviour before the GRN page and guides (other lanes) are corrected.
2. **Reimbursement Payment Voucher Applet (Internal)** is ACTIVE in the registry with no wiki page. Should Lane 2 add it to its queue (finance folder)?
3. **Tax Configuration duplicates**: `content/en/applets/finance/tax-config-applet.md` and `content/en/applets/master-data/tax-configuration-applet.md` both exist with title "Tax Configuration Applet"; the registry `documentation_url` for `taxConfiguration` is `/applets/tax-config-applet/`. Which is canonical? (Lane 2 has the finance one in its queue; the pages should be merged with an alias rather than both enhanced.)
4. **Registry URL for `creditor_report_applet`** points at `/applets/debtor-and-creditor-report-applet/`, while `debtor_report_applet` points at its own page. Both the creditor report and the combined report pages are in Lane 2's queue — should the creditor page be merged into the combined one?

## Notes

- Run summary 2026-09-05: 4 pages completed (Purchase Invoice, Receipt Voucher, Payment Voucher, Ledger And Journal). Stopped after ~90 minutes of work so the next page (Financial Report) gets full care in the next run. content-lint passes.
- Method note for the next run: for wavelet-erp document applets the Application Settings screen is `blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html` (8,300 lines, gated by `appletCode`). The scratch script `extract_settings.py` (see this run's scratchpad) parses it against the applet's `applet-settings.model.ts` to list the visible switches; labels are translation fallbacks equal to the identifier.

- Ledger And Journal: the applet has exactly two Application Settings (`ALLOW_USER_TO_EDIT_AUTO_POSTED_JOURNAL`, `DISPLAY_JOURNAL_TRANSACTION_RUNNING_NUMBER`) and one client-side permission; it does not use the shared field-configuration screen. The old page's claim that Void "creates a contra-entry" was wrong for manual journals (JournalUow.delete is a soft delete).

- Purchase Invoice (Internal): the Application Settings screen is the shared `field-configuration` component in `blg-shared-utilities` (a git submodule, cloned separately under refs/). Labels for most switches are translation fallbacks equal to the identifier, so the wiki uses the identifiers with a plain-English "what it controls" column. The Knock Off Settings screen exists as a route but its menu entry is commented out.
- Purchase Invoice (Internal): VOID is hidden in the UI whenever the company's e-Invoice status is ENABLED (reducer `eInvoiceEnabled`), independent of permissions.
