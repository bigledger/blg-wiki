---
topic: internal-sales-invoice-applet
aliases: [sales invoice, INTERNAL_SALES_INVOICE, salesInvoiceApplet, tax invoice]
applets: [salesInvoiceApplet]
modules: [financial-accounting, inventory, e-invoice, crm-digital]
related: [internal-sales-order-applet, internal-sales-return-applet, internal-sales-credit-note-applet, internal-sales-invoice-no-stock-out-applet, internal-receipt-voucher-applet, my-e-invoice-portal-applet, company-default-gl-codes, credit-limit, intercompany, pos-general-applet, pick-pack-queue]
wiki:
  - content/en/applets/sales-workflow/internal-sales-invoice-applet.md
status: growing
updated: 2026-09-05
---

# Sales Invoice (Internal)

The document that bills a customer and moves stock out. FINAL posts stock (−1 quantity signum), the journal (Debtor / Sales / Output tax / COGS) and the receivable, and fans out to e-Invoice, webhooks, commission, contract and membership processors.

## Facts

- 2026-09-05 — Registry name is "Sales Invoice (Internal)", code `salesInvoiceApplet`; the repo's own display name is "Internal Sales Invoice Applet". [src:planning/private/registry-applets-2026-09-05.tsv] [src:blg-applet-wavelet-internal-sales-invoice-applet/…/app.component.ts]
- 2026-09-05 — Server doc type `INTERNAL_SALES_INVOICE`, amount signum +1, quantity signum −1; the backend validator only checks doc type and amount signum and fills line signums. [src:…/models/constants/applet-constants.ts] [src:javasdk/…/InternalSalesInvoiceDataConsistencyObject.java]
- 2026-09-05 — The applet's own settings UI is tiny (Default Selection: branch, location, pricing scheme, pricebook, decimal precision 2–4, `DATE_TXN_LOGIC`, tab order). Everything else lives in the shared Field Configuration screen from blg-shared-utilities, which reads `sessionStorage.appletCode` to decide which toggles apply. [src:…/default-settings.component.ts] [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts]
- 2026-09-05 — 255 keys of the applet's `AppletSettings` interface are exposed on the shared screen; 54 keys (custom statuses, INCLUDE_*/ENABLE_* department flags, MANDATORY_* department flags, `ALLOW_NEGATIVE_STOCK_WITH_CONFIRMATION`, `WORKFLOW_PROCESS_GUID`, `PRINTABLE`) have no UI. [src:…/models/applet-settings.model.ts] [src:field-configuration.component.html]
- 2026-09-05 — For `salesInvoiceApplet` the shared screen defaults detailed pricing columns, tax/WHT code selection, line GL code and the four department fields to hidden (`shouldHideSetting`, `hideDepartmentSetting`). [src:field-configuration.component.ts#L2333-L2374]
- 2026-09-05 — Sidebar items are removed by `HIDE_*_MENU` settings unless the user holds the matching `SHOW_*` client-side permission (`updateMenuItem(state, !SHOW && HIDE)`). [src:…/app.component.ts#L143-L150]
- 2026-09-05 — 78 ACTIVE client-side permission definitions exist for this applet in `bl_applet_client_side_perm_dfn`, including 17 per-item-type `ALLOW_<TYPE>_ITEM_PRICE_EDIT` codes used only when `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` is on, and `ALLOW_APPROVE_SELL_BELOW_PRICE` for line approvals. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:…/models/item-txn-client-side-permissions.ts] [src:…/line-approval/line-approval.component.ts]
- 2026-09-05 — FINAL validation order: forex rate, blacklisted customer (SALES_CASHBILL / SALES_INVOICE / SALES_ORDER / OUTBOUND_DO only), serial qty, bin qty, batch qty, stock balance (flag), sell below cost (flag), redeemed points, date+company present, fiscal period lock. [src:javasdk/…/GenericDocumentService.java#L1623-L1700]
- 2026-09-05 — At FINAL the backend copies `skip_einvoice` from the entity, generates running numbers in one transaction, queues the primary processor (company `posting_final_json` include/exclude list decides sub-processors), emits `INTERNAL_SALES_INVOICE_CREATED` webhook (full + minimal), and queues sales-contract, message-template, member-point and ecomsync processors. [src:javasdk/…/GenericDocumentService.java#L566-L660] [src:akaun-api/…/GenericDocumentPrimaryProcessor.java]
- 2026-09-05 — Journal uses the `SALES` handler: PNS_ENTITY→DEBTOR (or DEBTOR_NON_TRADE for AR_OTHER), PNS→SALES, PNS_DISCOUNT→SALES_DISCOUNT, PNS_RETURN→SALES_RETURN, PNS_TAX→OUTPUT_TAX, FOREX_GAIN/LOSS; COGS from company default `COGS`; missing codes throw `MISSING_DEFAULT_GL_CODE: <code>`; settlement lines need cashbook + GL (`MISSING_CASHBOOK`, `MISSING_GL_CODE: STL_MTHD [code]`). [src:javasdk/…/JournalPostingTypeHandler.java#L42-L52] [src:javasdk/…/JournalPostingService.java#L191-L340,L1218-L1240]
- 2026-09-05 — VOID: sets status + void reason, queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, removes the doc from the e-Invoice queue, voids the forex shadow doc. [src:javasdk/…/GenericDocumentService.java#L662-L700,L3172-L3190]
- 2026-09-05 — Settlement on a FINAL doc can be edited only if the total is unchanged; journal and cashbook lines are reversed and re-created. [src:javasdk/…/GenericDocumentService.java#L1980-L2030]
- 2026-09-05 — Credit availability = credit limit (`CREDIT_LIMITS` entity ext) − AR balance − open amounts; consumed by `ENABLE_CREDIT_LIMIT_FILTER`. [src:javasdk/…/EntityCreditAvailabilityService.java]
- 2026-09-05 — Intercompany: SALES_INVOICE → PURCHASE_INVOICE or PURCHASE_GOODS_RECEIVED_NOTE in the target company; AUTO mode creates the doc + link, MANUAL mode queues; failures go to an error queue. [src:javasdk/…/IntercompanyProcessingService.java#L60-L120,L228-L295]
- 2026-09-05 — KO For tabs: Sales Order, Delivery Order, Jobsheet, Sales Quotation, Stock Transfer, Sales Invoice. [src:…/search-documents/search-documents.component.html]
- 2026-09-05 — Real fixes seen in the commit log (anonymised): batch Issue/Expiry wrongly required; "not enough stock" message now names the item code; zero-price warning; swap-serial grid resync; edit-mode qty falling to 1 for basic-quantity items; contra date; blacklist warning; stock validation alert at FINAL. [src:git-log:blg-applet-wavelet-internal-sales-invoice-applet]

## How it connects

- **internal-sales-order-applet** — the most common KO source; `SalesOrderToSalesInvoiceConverterMapping` in the backend.
- **internal-sales-return-applet** — `docTypeConnectorMap` lists INTERNAL_SALES_INVOICE and INTERNAL_SALES_CASHBILL as the previous documents of a Sales Return.
- **internal-receipt-voucher-applet** — settles the DEBTOR balance; Payment tab on the invoice is the alternative for immediate settlement.
- **company-default-gl-codes** — DEBTOR, DEBTOR_NON_TRADE, SALES, SALES_DISCOUNT, OUTPUT_TAX, COGS, FOREX_GAIN, FOREX_LOSS must exist per company.
- **my-e-invoice-portal-applet** — `skip_einvoice` comes from the entity; VOID removes from the queue.
- **pos-general-applet** — cash bills share the SALES journal handler and reward-point processor (`appletCode` switch in GenericDocumentService).
- **intercompany** — mirror purchase invoice in the buying company.

## Open questions

- Does the front end also block FINAL on credit limit, or only display availability? Only `ENABLE_CREDIT_LIMIT_FILTER` and the backend availability DTO were found; no hard block in the backend FINAL validation.
- Which sub-processors a default tenant enables in `posting_final_json` (inventory, journal, ARAP, cashbook) — needs a look at a tenant's company row.

## Wiki impact

- Neighbour pages should list `internal-sales-invoice-applet` in `related_applets` (see lane-1 findings).
- Sales guides should link the Troubleshooting table for "not enough stock" and "MISSING_DEFAULT_GL_CODE".
