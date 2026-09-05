---
topic: consignee-stock-transfer
aliases: [consignment goods issued note, consignment goods received note, CCSG location, consignee location]
applets: [consignee-stock-transfer]
modules: [inventory]
related: [stock-transfer, customer-consignment, stock-balance, stock-report, location-master, serial-number-tracking]
wiki:
  - content/en/applets/inventory-workflow/consignee-stock-transfer-applet.md
status: growing
updated: 2026-09-05
---

# Consignee Stock Transfer

Single-document stock movement between your locations and consignee locations (location class `CCSG`): each note posts −qty at Location From and a cloned +qty ledger line at Location To; no queue, no journal.

## Facts

- 2026-09-05 — Registry: `consignee-stock-transfer` "Consignee Stock Transfer", TNT-USER, ACTIVE (2025-06-20), no documentation_url. Repo blg-applet-wavelet-consignee-stock-transfer-applet (mainPath `applets/akaun/dev/consignee-stock-transfer-applet`). No client-side permissions registered. [src:planning/private/registry-applets-2026-09-05.tsv] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Menus: Consignee Listing (location-container = bl_inv_mst_location create/edit with Location Class select, options CCSG), Consignment Goods Issued Note, Consignment Goods Received Note. Settings: Field Settings, Default Selection, Printable Format Settings. [src:.../models/menu-items.ts] [src:.../location-container/location-create/location-create.component.html L126-128]
- 2026-09-05 — Location filters: issued note Location To and received note Location From use `cst-select-location-drop-down-stock-to [filterLocationClass]="'CCSG'"`; a 2025 fix filters ACTIVE status. Header maps locationSending → guid_store, locationReceiving → guid_store_2. [src:.../goods-issued-note-create-main.component.html L190-194] [src:.../goods-received-note-create-main.component.html L97-100] [src:.../goods-issued-note-create-main.component.ts L213-214]
- 2026-09-05 — Both flows POST to endpoint `internal-customer-consignments-out` → handler INTERNAL_CUSTOMER_CONSIGNMENT_OUT (quantity_signum −1, amount_signum 0). Frontend still carries INTERNAL_CUSTOMER_CONSIGNMENT_IN in the issued-note hdr.states and add-line-item (signum +1) — dead/legacy references; the DCO would reject an IN header on the OUT endpoint. [src:.../services (endpoint grep)] [src:InternalCustomerConsignmentsOutDataConsistencyObject.java L16-17] [src:.../state-controllers/draft-controller/store/states/hdr.states.ts L7]
- 2026-09-05 — Backend `createConsignmentTxns`: for CUSTOMER_CONSIGNMENT_IN/OUT lines with guid_store_2, clone the ledger line to guid_store_2 with negated signum, txn_code_02 = "CSG", txn_date ±0.1 s, costs nulled (recomputed). Not in JournalPostingTypeHandler → no journal. [src:InventoryTransactionLineProcessorService.java L33-35, L165-235]
- 2026-09-05 — Settings read: ENABLE_AUTO_POPUP, DISABLE_EXPORT_PRINT_ON_DRAFT, VERTICAL_ORIENTATION (on shared screen); PRINTABLE, DEFAULT_BRANCH/LOCATION; listings check HIDE_GENDOC_FINAL/DISCARD/VOID_BUTTON with SHOW_GENDOC_* (not registered). Both listings have FINAL, DISCARD, VOID, PRINT — previous wiki text said the received-note listing had no VOID (wrong). [src:kb/tools/applet-scan.sh output] [src:.../goods-received-note-listing.component.html L67] [src:.../goods-received-note-listing.component.ts L645-647, L877-883]
- 2026-09-05 — Required fields: locationSending, locationReceiving, stockTransferServiceDate; line itemCode, quantity; batch batch_no/issue_date/expiry_date; bin bin_code/container_measure/container_qty; location code/name/company/branch/commencement date/address/city/postal/state/country. [src:kb/tools/applet-scan.sh VALIDATORS output]
- 2026-09-05 — Issues: repo has only migration/split issues (#1, #6); general-task items are sub-query removal (gt#6478, gt#6041) and a wiki review (gt#8053); a customer repo fix for an empty location dropdown (status filter). [src:gh:bigledger/blg-applet-wavelet-consignee-stock-transfer-applet#6] [src:gh:bigledger/blg-int-general-task#6478]

## How it connects

- **stock-transfer** — same location dropdown family; this applet has no queue because one document moves both sides.
- **customer-consignment** — sales/billing side of consignment (sales-workflow); this applet only moves quantity.
- **stock-report** — the notes fall into the *Others* column of Stock Summary by Location (not purchase/sold/adj).

## Open questions

- Whether the leftover INTERNAL_CUSTOMER_CONSIGNMENT_IN references in the issued-note state are reachable (they look dead; if ever posted they would be rejected by the OUT endpoint's DCO).
- Whether SHOW_GENDOC_* permissions should be seeded for this applet.

## Wiki impact

- customer-consignment-applet (sales lane): add back-link; state that stock is moved by Consignee Stock Transfer and billed there.
- organisation-applet (lane 4): document Location Class `CCSG` on the location record.
