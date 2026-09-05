---
topic: internal-goods-delivery-note-applet
aliases: [goods delivery note, internal goods delivery note, GDLYNT, goods dispatch note (former wiki name)]
applets: [InternalGoodsDeliveryNote]
modules: [inventory]
related: [internal-sales-order, internal-jobsheet, internal-outbound-delivery-order, internal-sales-gin-stock-out, knock-off-configuration, applet-settings-tab-map, journal-posting, customer-maintenance, membership]
wiki:
  - content/en/applets/inventory-workflow/internal-goods-delivery-note-applet.md
status: growing
updated: 2026-09-05
---

# Goods Delivery Note (Internal)

The delivery record handed to a customer against a sales order, jobsheet or outbound delivery order. It knocks off the upstream open lines and nothing else: both signums are 0, so FINAL neither moves stock nor posts a journal. The applet is a clone of the Sales Credit Note applet and still carries Settlement and Contra tabs.

## Facts

- 2026-09-05 — Registry: exactly one ACTIVE row, code `InternalGoodsDeliveryNote`, name "Goods Delivery Note (Internal)", created 2022-03-14; `property_json.es_module_url` points at the `internal-goods-delivery-note-applet` build; `documentation_url` still points at Confluence. [src:akaun_master.bl_applet_hdr]
- 2026-09-05 — A sibling *Goods Dispatch Note* exists in code (server doc type `INTERNAL_GOODS_DISPATCH_NOTE`, short code `GDSPNT`, own DCO, own repo `blg-applet-wavelet-internal-goods-dispatch-note-applet`, last commit 2026-07-28) but has no registry row at all, so it cannot be installed. The two repos are near-identical clones diverging since 2026-04 (dispatch copy got i18n and SubQueryService removal). [src:blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalGoodsDispatchNoteDataConsistencyObject.java]
- 2026-09-05 — Server doc type `INTERNAL_GOODS_DELIVERY_NOTE`, short code `GDLYNT`, amount signum 0, quantity signum 0 (DCO L17-18); `ServerDocTypes.INTERNAL_GOODS_DELIVERY_NOTE(0,0)`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalGoodsDeliveryNoteDataConsistencyObject.java]
- 2026-09-05 — No `JournalPostingTypeHandler` entry; the SALES/PURCHASE name fallback yields an empty handler list; lines with amount signum 0 are skipped (JournalPostingService L96) and the empty journal throws `NO_JOURNAL_CREATED` (L580). The journal subscriber of the generic-doc primary queue has no `serverDocTypes` constraint in akaun_master, so the job runs — and fails — for every FINAL note. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java] [src:akaun_master.bl_applet_trigger_template_processor_link]
- 2026-09-05 — Inventory transaction lines are created only for quantity signum != 0 (InventoryTransactionLineProcessorService L40, L75) — no stock movement. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java]
- 2026-09-05 — Applet exposes create/save, FINAL (edit button + listing bulk FINAL), DELETE (gated by setting `SHOW_DOCUMENT_DELETE_BUTTON`, hidden once FINAL, two-click confirm); no VOID control anywhere. Backend delete removes header/lines/exts/events and files; no FINAL guard server-side. [src:blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-edit/goods-delivery-note-edit.component.ts] [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java]
- 2026-09-05 — FINAL validation that applies: 403 "already been posted to FINAL" (GenericDocumentService L361-364); `FISCAL_PERIOD_LOCKED` for LOCK_ALL / LOCK_TXN (L1681-1695). Serial/batch checks skip signum-0 lines unless `validate_serial_signum_zero` is sent (the applet sends only `posting_status`); stock-balance check ignores signum-0 lines (L2088-2092); blacklist check not applied to this type (L1650-1655). [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java]
- 2026-09-05 — Settings: shared `FieldConfigurationComponent`; no entry for `InternalGoodsDeliveryNote` in `getTabValue()` so 10 tab-hide toggles never render; 138 controls render; only 22 line-level `HIDE_*` keys + `HIDE_COSTING_DETAILS` + `PRINTABLE` are consumed; `SHOW_DOCUMENT_DELETE_BUTTON` is read without a model declaration; ~116 rendered controls are dead for this applet. [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts] [src:blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/models/applet-settings.model.ts]
- 2026-09-05 — Default Selection (applet and personal) is non-functional: no load subscription, `save` output unhandled by the route, `DEFAULT_BRANCH`/`DEFAULT_LOCATION` read by nothing; changing a value throws on the undefined container. [src:blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/settings-container/default-settings/default-settings.component.ts]
- 2026-09-05 — 22 client-side permission codes seeded (`SHOW_*` line-field reopeners + `SHOW_COSTING_DETAILS` + `SHOW_LAST_PURCHASE_PRICE`); `SHOW_LAST_PURCHASE_PRICE` is checked by nothing. Backend: `TNT_API_DOC_INTERNAL_GOODS_DELIVERY_NOTE_{CREATE,UPDATE,READ,DELETE}_TGT_GUID`. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java]
- 2026-09-05 — Main tab declares Company, Branch, Location, Sales Agent, **Member Card**, Customer and Credit Terms as `Validators.required` (main-details.component.ts L54-61); CREATE is disabled while the Main or Account>Entity form is invalid; Credit Terms is disabled (hence not blocking) until a customer with terms is chosen. A mandatory member card on a delivery note is a clone leftover. [src:blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/components/goods-delivery-note-container/goods-delivery-note-create/main-details/main-details.component.ts]
- 2026-09-05 — Knock-off sources: Sales Order, Jobsheet, Outbound Delivery Order (KO By / KO For tabs), plus Copy Quotation. Line delivery instructions are stored as ext `REQUESTED_DELIVERY_DATE`. Export prints via Jasper service code `CP_COMMERCE_INTERNAL_SALES_ORDERS_JASPER_PRINT_SERVICE` with formats of txn_type `INTERNAL_GOODS_DELIVERY_NOTE`. [src:blg-applet-wavelet-internal-goods-delivery-note-applet/micro-fe/projects/wavelet-erp/applets/internal-goods-delivery-note-applet/src/app/state-controllers/internal-goods-delivery-note-controller/store/effects/internal-goods-delivery-note.effects.ts]
- 2026-09-05 — Repo issues #1/#3/#5/#7 are chores (split clean-up, import errors, Angular 14, a meeting invite); no functional issue exists. Wiki #69 (open) requested this page; #70 (closed) the dispatch-note page. [src:gh:bigledger/blg-applet-wavelet-internal-goods-delivery-note-applet#5] [src:gh:bigledger/blg-wiki#69]

## How it connects

- **internal-sales-order / internal-jobsheet / internal-outbound-delivery-order** — their FINAL must create open-queue rows toward `INTERNAL_GOODS_DELIVERY_NOTE` (company Knock Off Configuration) for the KO For tabs to list anything; the note consumes the open quantity.
- **internal-sales-gin-stock-out** — the stock actually leaves through a stock-out document; the delivery note is paper only.
- **applet-settings-tab-map** — third lane-4 applet (after consignment GIN) whose registry code is missing from `getTabValue()`; pattern for a platform bug report.
- **journal-posting** — unconstrained journal subscriber + signum-0 document = a failed job per FINAL; same must hold for Sales Order, Sales Quotation, Jobsheet, Outbound DO — worth confirming on those pages.
- **membership** — member card mandatory on the form; guides should tell readers to pick one even for non-member customers, or the product should relax the validator.

## Open questions

- Does the journal job's per-FINAL failure for signum-0 documents (`NO_JOURNAL_CREATED`) show up anywhere users see it (job-queue screen), or is it silently logged? Not answerable from code alone.
- Is the dispatch-note sibling meant to be registered (it received work in 2026-07)? Decision for Vincent / product.
- Does the DELETE endpoint's lack of a FINAL guard matter in practice (the UI hides the button)?

## Wiki impact

- Sales Order / Jobsheet / Outbound DO pages: add the Goods Delivery Note as a knock-off target and note the company flow-config prerequisite.
- Organisation page (lane 4, queued): document Knock Off Configuration rows for `INTERNAL_GOODS_DELIVERY_NOTE`.
- Membership Admin page: note that the delivery note form requires a member card.
- Standard sales / partial delivery guides: mention the note as the customer-facing delivery record that does not move stock.
