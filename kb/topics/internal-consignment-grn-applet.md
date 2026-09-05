---
topic: internal-consignment-grn-applet
aliases: [consignment GRN, consignment goods received note, supplier consignment GRN, CSGGRN, INTERNAL_PURCHASE_CONSIGNMENT_GRN]
applets: [internalconsignmentGRNApplet]
modules: [purchasing, inventory]
related: [internal-consignment-gin-applet, internal-consignment-return-applet, internal-consignment-purchase-order-applet, internal-consignment-billing-applet, internal-purchase-grn-applet, internal-purchase-grn-stock-in-applet, doc-item-maintenance, chart-of-accounts, stock-balance, stock-report, generic-document-posting-status, serial-number-tracking, moving-average-costing, knock-off, customer-consignment]
wiki:
  - content/en/applets/inventory-workflow/internal-consignment-grn-applet.md
  - content/en/guides/purchasing-guides/consignment-purchasing.md
status: growing
updated: 2026-09-05
---

# Consignment GRN (Internal)

The goods received note for supplier-owned consignment stock: it puts a quantity into one of your locations and, if the company posts journals, records Dr Consignment Stock / Cr Consignment Liability — no purchase, no creditor. Ownership changes later through the consignment billing documents. It can be knocked off from a consignment purchase order and it can be voided.

## Facts

- 2026-09-05 — Server document type `INTERNAL_PURCHASE_CONSIGNMENT_GRN`, short code `CSGGRN`; quantity signum +1, amount signum −1 [src:blg-akaun-platform-java/javasdk/.../InternalPurchaseConsignmentGrnDataConsistencyObject.java L15–L17] [src:.../ServerDocTypes.java L41] [src:.../GenericDocServerDocTypeEnum.java L58]
- 2026-09-05 — In the backend's consignment list (`isConsignmentStockIn` = CSGGRN, CSG Return, GRN stock-in) → `PURCHASE_CONSIGNMENT` handler: entity → `CONSIGNMENT_LIABILITY`, PNS → `CONSIGNMENT_STOCK`, discount → `PURCHASE_DISCOUNT`, return → `CONSIGNMENT_STOCK`, tax → `INPUT_TAX` [src:.../JournalPostingService.java L64–L81] [src:.../JournalPostingTypeHandler.java L95–L104]
- 2026-09-05 — Direction: amount signum −1 × positive amount → debit the item line (Consignment Stock); Σ(debit−credit) > 0 → entity line is a credit (Consignment Liability). `resolveArap()` is skipped for consignment stock-in, so the supplier's AR/AP type is irrelevant [src:.../JournalPostingService.java L119–L128, L326–L354, L1561–L1570]
- 2026-09-05 — GL precedence differs from ordinary purchases: the line's own GL code is ignored (`guid_glcode != null && !isConsignmentStockIn`), then header GL → item-company link (txn code CONSIGNMENT_STOCK) → company default; unresolved line silently dropped (L236) → `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` (L575); missing CONSIGNMENT_LIABILITY → `MISSING_DEFAULT_GL_CODE` (L338–L340) [src:.../JournalPostingService.java L139, L163–L191, L236, L338–L340, L575]
- 2026-09-05 — Stock: +qty at the header location; in `MA_WA_SERVER_DOC_TYPES`, so the Txn Amount enters the moving-average pool (a RM 0 consignment GRN dilutes the MA cost); does not update last purchase cost (only INTERNAL_PURCHASE_INVOICE does) [src:.../StockBalanceHelper.java L40–L42, L166–L170, L286–L302]
- 2026-09-05 — FINAL: `{posting_status:'FINAL'}` + `validate_serial_signum_zero` when `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL`; client pre-validates serials via the inventory serial service (txn type PURCHASE, optional draft-lock check) — a client-side stop, not a backend rejection. Backend: serial count = qty; inbound serials must not already exist in the company (`..._ALREADY_EXISTS_FOR_COMPANY`); stock-balance check cannot fail for +1; fiscal lock applies [src:.../consignment-grn.effects.ts L1263–L1345] [src:.../GenericDocumentService.java L390–L392, L1658–L1662, L1681–L1695, L1853–L1888, L2205–L2216]
- 2026-09-05 — VOID: listing only (edit-form VOID commented out); controller rejects `GENERIC_DOCUMENT_HAS_TARGET_LINKS` when an ACTIVE doc link has the GRN as source (already billed / issued); then `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR` fans out to VOID_INVENTORY_TRANSACTION_LINE / VOID_JOURNAL_POSTING (reverse journal) / VOID_KNOCK_OFF (reopens CSGPO lines) / VOID_ARAP_CONTRA [src:.../GenericDocumentController.java L2925–L2950] [src:.../GenericDocumentService.java L663–L710] [src:.../JobProcessorClassName.java L334–L387]
- 2026-09-05 — Settings: shared `FieldConfigurationComponent`; the shared tab map HAS an entry for the live code `internalconsignmentGRNApplet` (Payment, KO For, Department Hdr, Contra, Doc Link, Attachments, Export, Status, Delivery Details, Trace Document), so all tab-hide toggles render — unlike the GIN. Applet-local Default Selection saves DEFAULT_BRANCH/LOCATION/COMPANY + `CONSIGNMENT_GRN_DETAILS_TAB_ORDER` (drag order of edit tabs); personal defaults override tenant defaults; Custom Status screen saves 5 header statuses (LINE keys saved but unread) [src:blg-shared-utilities/.../field-configuration.component.ts L2425] [src:.../default-settings.component.ts L61–L96] [src:.../consignment-grn-create.component.ts L75]
- 2026-09-05 — Knock-off: header KO For tab lists CSGPO with open lines for CSGGRN (`line_open_queue_server_doc_type_1/2`); line-level KO For PO / PR / PI tabs appear only when `bl_fi_comp_gendoc_flow_config` has an enabled LINE flow from that type into CSGGRN; `ENABLE_MULTIPLE_KO` allows mixing source documents; `DISABLE_ADD_WHEN_KO` locks the add button once KO lines exist [src:.../knock-off-purchase-order.component.ts L265–L292, L361] [src:.../line-item-create.component.ts L106–L122] [src:.../line-item-listing.component.ts L142, L156]
- 2026-09-05 — Permissions: 2 seeded rows — `SHOW_TRANSACTION_DATE` (Transaction Date input disabled without it) and `HIDE_RETIRE_APPLET`; ~40 other SHOW_* codes checked in code but unseeded (F-0044 pattern) [src:akaun_master.bl_applet_client_side_perm_dfn 2026-09-05] [src:.../main-details.component.html L145]
- 2026-09-05 — Item search: `consignment_flg = true` and `status = ACTIVE` [src:.../line-search-item-listing.component.ts L87–L88]
- 2026-09-05 — Auto-print after FINAL (`ENABLE_AUTO_POPUP`) calls `INTERNAL_PURCHASE_ORDER_PRINT_SERVICE` with the GRN's PRINTABLE [src:.../consignment-grn-edit.component.ts L314–L326]
- 2026-09-05 — Customer UAT (anonymised): hides for Delivery Details / Payment / Department Hdr / Currency / Tracking ID were missing at UAT time and were added (commits 'add hide currency settings', 'fix the hide/show settings'); Credit Terms / Credit Limit still have no hide. 'Add item does nothing' with a serialised item was fixed ('fix adding line item issue'). A retail customer keyed owned stock as a consignment GRN — VOID and re-key [src:gh:bigledger/blg-int-general-task#2016] [src:gh:bigledger/blg-int-general-task#2554] [src:gh:bigledger/blg-int-general-task#9168]

## How it connects

- **internal-consignment-gin-applet** — the outbound mirror; note the asymmetry: the GRN posts to consignment accounts, the GIN to purchase/creditor.
- **internal-consignment-purchase-order-applet** — KO source; VOID of the GRN reopens its lines.
- **internal-consignment-billing-applet** — the document that usually knocks the GRN off and thereby blocks VOID.
- **internal-purchase-grn-stock-in-applet** — shares the `isConsignmentStockIn` journal branch (line GL ignored, AR/AP ignored).
- **chart-of-accounts** — CONSIGNMENT_STOCK and CONSIGNMENT_LIABILITY default GL codes must exist for a posting company.
- **moving-average-costing** — the GRN's Txn Amount enters the pool; zero-priced receipts dilute MA cost.
- **knock-off** — the company document-flow configuration (Organisation) decides which line-level KO tabs exist.

## Open questions

- Should a consignment GRN keyed at RM 0 be allowed to move the moving-average cost? (It does today.) Product decision.
- Where exactly in the Organisation applet is `bl_fi_comp_gendoc_flow_config` maintained — confirm the screen name when that page is written (lane 4 queue).

## Wiki impact

- content/en/guides/purchasing-guides/consignment-purchasing.md — the GRN's journal is Dr Consignment Stock / Cr Consignment Liability (not creditor); VOID is blocked once billed; the KO tabs depend on the company document-flow configuration.
- content/en/applets/master-data/chart-of-account-applet.md — list CONSIGNMENT_STOCK / CONSIGNMENT_LIABILITY among default GL codes.
- content/en/applets/master-data/organisation-applet.md — document the document-flow configuration screen and the branch MAIN_LOCATION extension.
