---
title: "Purchase Invoice Supplier Access (Internal)"
description: "Reference for the supplier-facing copy of the Purchase Invoice applet: a login linked to a supplier entity reads the FINAL purchase invoices the buyer has posted against it — header, lines, payments, contra, linked documents and attachments — read-only."
applet_code: "internal-purchase-invoice-supplier-access-applet"
page_type: applet
applet_repo: "blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet"
modules: [purchasing, financial-accounting]
related_applets:
  - internal-purchase-invoice-applet
  - internal-purchase-order-supplier-access-applet
  - internal-purchase-grn-supplier-access-applet
  - internal-purchase-credit-note-supplier-access-applet
  - internal-purchase-return-supplier-access-applet
  - supplier-applet-1
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/components/line-items-container/line-item-view/line-item-view.component.html
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/components/line-items-container/line-item-view/item-details/main-details/main-details.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - planning/lanes/lane-3/perm-dfn (akaun_master.bl_applet_client_side_perm_dfn, 20 ACTIVE codes)
  fields:
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/components/purchase-invoice-container/purchase-invoice-listing/purchase-invoice-listing.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/components/purchase-invoice-container/purchase-invoice-view/purchase-invoice-view.component.html
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/components/purchase-invoice-container/purchase-invoice-view/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
  lifecycle:
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-invoice-supplier-access.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/shared/base-api-template-service.model.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseInvoiceDataConsistencyObject.java
  troubleshooting:
    - blg-applet-wavelet-internal-purchase-invoice-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-supplier-access-applet/src/app/state-controllers/purchase-invoice-controller/store/effects/purchase-invoice.effects.ts
tags:
  - supplier-portal
  - purchase-invoices
  - vendor-management
  - financial-transparency
  - payment-tracking
weight: 260
date: 2026-05-04
lastmod: 2026-09-06
---

## Overview

**Purchase Invoice Supplier Access (Internal)** is the supplier-facing copy of the [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) applet. A login linked to a supplier entity opens it inside the buyer's tenant and reads the invoices the buyer has posted against that supplier: header, lines, settlements recorded so far, contra records, the documents the invoice links to, and the attachment list.

It is read-only — no create screen, no save, no delete — and the listing pins `posting_statuses = FINAL`, so an invoice appears only after the buyer finalises it. This is the supplier's answer to "has my invoice been entered, and has anything been paid against it?"

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules-v2/purchasing/), [Financial Accounting](/modules-v2/financial-accounting/) | The payable the buyer owes the supplier. |
| The document | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | Same rows; creation, FINAL, payment, contra and VOID happen there. |
| Upstream (access) | [Supplier](/applets/master-data/supplier-applet-1/) | The login must be linked to the supplier entity (`bl_fi_mst_entity_login_subject_link`, `ACTIVE`). |
| Upstream (document) | [Purchase Order Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/), [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) | The order and receipt the invoice is knocked off against; both appear in Doc Link. |
| Downstream | [Purchase Credit Note Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-supplier-access-applet/), [Purchase Return Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-return-supplier-access-applet/) | What follows when the invoice is adjusted. |

## Screens and menus

| Menu | Route | What it is |
|---|---|---|
| **Internal Purchase Invoice** | `internal-purchase-invoice` | The listing and the document view behind it. |
| **Line Items** | `line-items` | A flat listing of invoice lines across the supplier's invoices. |
| **Settings** | `settings/…` | Field Settings, Default Selection, Printable Format Settings (menu), plus Webhook, Feature Visibility, Client Side Permission and the permission listings (routes). |
| **Personalization** | `personalization/…` | Personal Default Selection and sidebar order. |

### Listing

{{< figure src="/images/internal-purchase-invoice-supplier-access-applet/invoice-listing.png" alt="Internal Purchase Invoice Listing with columns for invoice number, branch, purchaser, supplier and amount" caption="The listing. Only FINAL invoices belonging to the supplier behind the login are returned." >}}

Columns: **Purchase Invoice No, Branch, Purchaser Name, Supplier ID, Supplier Name, Amount Txn, Updated Date, Created Date, Transaction Date, Status**. Sorted by `updated_date` descending, with `posting_statuses = FINAL` always applied.

Rows are completed with a branch lookup, a supplier lookup and a purchaser lookup; a failed lookup prints its error code into the cell rather than blanking the row.

### Document view

Nine read-only tabs: **Main Details** (Branch, Location, Transaction Date, Credit Terms, Due Date, Reference, Remarks, Permit No, Currency, Tracking ID), **Account** (supplier entity, billing and shipping address), **Line Items**, **Payment** (the settlements recorded against the invoice), **Department Hdr** (Segment, Dimension, Profit Center, Project), **Contra** (ARAP contra records), **Doc Link** (Copy From / Copy To), **Attachment** (file metadata) and **Export**.

On the **Export** tab, **EXPORT AS PDF** is enabled; CSV, DOCX and ZIP are disabled. See *Troubleshooting* — the PDF request is built against an endpoint that does not exist.

### Line Items

{{< figure src="/images/internal-purchase-invoice-supplier-access-applet/line-items-view.png" alt="Line Items Listing across invoices" caption="The Line Items menu: one row per invoice line across all the supplier's FINAL invoices." >}}

Columns: **Purchase Invoice No, Branch, Supplier Name, Project, Shipping Address, Item Code, Item Name, Ordered Qty, Open Qty, Amount TXN, Creation Date, Requested Delivery Date, Delivery Status, Remarks**. Opening a line shows **Item Details**, **Serial Number**, **Costing Details** (hidden by `HIDE_COSTING_DETAILS` unless the role holds `SHOW_COSTING_DETAILS`), **Pricing Details** and **Issue Link**.

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters |
|---|---|---|
| The supplier's login is linked to the supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) → Login (`bl_fi_mst_entity_login_subject_link`, `ACTIVE`) | Every query filters on that link. |
| The applet is installed for that login | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Provides the applet token at start-up. |
| The invoice is FINAL | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The listing pins `posting_statuses = FINAL`. |

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities` (route `settings/field-settings`), gated by `sessionStorage.appletCode`. No inline gear, no applet-local field-configuration screen.

This applet declares a trimmed settings model — 50 keys, against 250-plus in its buyer-side counterpart — and **19 of them pass all four proofs**: declared, rendered on the shared screen for this applet code, persisted into `bl_applet_ext.APPLET_SETTINGS`, and consumed by the line-detail template. Each hides one line field and is paired with a `SHOW_*` client-side permission (`*ngIf="!appletSettings.HIDE_X || SHOW_X"`). Computed with `kb/tools/gates.py` at the pinned shared-utilities commit (`5f74f2d`) and re-checked at HEAD, which adds nothing this applet consumes.

| Setting | What it hides on the line detail | Default | Re-opened per role by |
|---|---|---|---|
| `HIDE_QTY_BASE` | Base quantity | Off | `SHOW_QTY_BASE` |
| `HIDE_QTY_UOM` | Quantity in the line UOM | Off | `SHOW_QTY_UOM` |
| `HIDE_UOM_TO_BASE_RATIO` | UOM-to-base ratio | Off | `SHOW_UOM_TO_BASE_RATIO` |
| `HIDE_UNIT_PRICE_STD_EXCL_TAX` | Standard unit price, excluding tax | Off | `SHOW_UNIT_PRICE_STD_EXCL_TAX` |
| `HIDE_UNIT_PRICE_STD_INCL_TAX` | Standard unit price, including tax | Off | `SHOW_UNIT_PRICE_STD_INCL_TAX` |
| `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX` | Standard unit price per UOM, excluding tax | Off | `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX` |
| `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX` | Standard unit price per UOM, including tax | Off | `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX` |
| `HIDE_UNIT_PRICE_NET_EXCL_TAX` | Net unit price, excluding tax | Off | `SHOW_UNIT_PRICE_NET_EXCL_TAX` |
| `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX` | Net unit price per UOM, excluding tax | Off | `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX` |
| `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX` | Transaction unit price per UOM, including tax | Off | `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX` |
| `HIDE_UNIT_DISCOUNT` | Unit discount | Off | `SHOW_UNIT_DISCOUNT` |
| `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX` | Unit discount per UOM, excluding tax | Off | `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX` |
| `HIDE_DISCOUNT_AMOUNT_EXCL_TAX` | Discount amount, excluding tax | Off | `SHOW_DISCOUNT_AMOUNT_EXCL_TAX` |
| `HIDE_AMOUNT_STD_EXCL_TAX` | Standard amount, excluding tax | Off | `SHOW_AMOUNT_STD_EXCL_TAX` |
| `HIDE_AMOUNT_NET_EXCL_TAX` | Net amount, excluding tax | Off | `SHOW_AMOUNT_NET_EXCL_TAX` |
| `HIDE_AMOUNT_TXN` | Transaction amount | Off | `SHOW_AMOUNT_TXN` |
| `HIDE_TAX_CONFIG_SELECTION` | The three tax-configuration fields | Off | `SHOW_TAX_CONFIG_SELECTION` |
| `HIDE_WHT_CONFIG_SELECTION` | The three withholding-tax fields | Off | `SHOW_WHT_CONFIG_SELECTION` |
| `HIDE_COSTING_DETAILS` | The **Costing Details** tab on a line | Off | `SHOW_COSTING_DETAILS` |

**Read outside the shared screen:** `DEFAULT_BRANCH` and `DEFAULT_LOCATION` are rendered and saved by the applet-local **Default Selection** screen but read by nothing here (there is no create form); `PRINTABLE` is written and read only by Printable Format Settings — the export ignores it.

### Document behaviour settings

Not applicable. FINAL, VOID, payment, contra and e-Invoice submission all belong to the buyer-side applet.

### Feature visibility and permissions

The registry seeds **20 client-side permission codes** for this applet, all `ACTIVE` as of 2026-09-06 — the `SHOW_*` half of the pairs above plus `SHOW_COSTING_DETAILS` and `SHOW_UNIT_PRICE_TXN`. Grant them per role in **Settings → Role Permission Listing**.

Server-side, the read path is filtered by the supplier link and skips permission checks; the supplier, branch and purchaser lookups that fill the grid are ordinary permission-checked endpoints.

## Fields

Every field is read-only; the tab tables above list them. No create or edit form exists, so there are no validators.

## Lifecycle and effects

This applet writes nothing. The buyer-side document behaves as follows.

| Property | Value |
|---|---|
| Server document type | `INTERNAL_PURCHASE_INVOICE` |
| Amount signum | −1 (`InternalPurchaseInvoiceDataConsistencyObject`) |
| Quantity signum | +1 — stock in |
| Dr/Cr equation | Dr Purchase (line net) · Dr Input tax · Cr Creditor (invoice total); discounts to `PURCHASE_DISCOUNT`, settlement forex differences to `FOREX_GAIN`/`FOREX_LOSS`. |
| GL precedence | Line GL → header GL → item-company `PURCHASE` link → company default `PURCHASE`; the creditor mapping is mandatory and throws `MISSING_DEFAULT_GL_CODE`. |
| Stock processor | `INVENTORY_TRANSACTION_LINE_PROCESSOR` — the invoice is the purchase-side stock-in document. |
| What VOID reverses | Reverse journal, negated inventory lines, knock-off links released, contra and tax reversed, removal from the e-Invoice queue and aging. |

| Action in this applet | Call | Result |
|---|---|---|
| List / search / open | `GET …/gen-doc/internal-purchase-invoices/login-entity-ep[/query]`, `…/login-entity-ep/{guid}` | Works with only the supplier link. |
| Export PDF | `GET …/internal-purchase-invoices/login-entity-ep/print-jasper-pdf/{guid}` | No such endpoint — see *Troubleshooting*. |
| Create / save / delete | not wired | No control exists. |

## Related applets

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the buyer-side applet.
- [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) — the receipt behind the invoice.
- [Purchase Order Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/) — the order behind the receipt.
- [Purchase Credit Note Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-supplier-access-applet/) — adjustments to the invoice.
- [Supplier](/applets/master-data/supplier-applet-1/) — where the login link is created.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The listing is empty | No `ACTIVE` supplier link for the login, or every invoice is still DRAFT (the listing pins `posting_statuses = FINAL`) | Check the link in the [Supplier](/applets/master-data/supplier-applet-1/) applet; ask the buyer to finalise. |
| **EXPORT AS PDF** shows a failure toast and no file | The service builds `…/internal-purchase-invoices/login-entity-ep/print-jasper-pdf/{guid}`, which matches no mapping in the generic-document controller (the two that exist are `/{docType}/print-jasper-pdf/{guid}` and `/{docType}/print-jasper-pdf/login-entity-ep/{guid}`). The effect also passes a hard-coded printable-format GUID and the CP Commerce sales-order print service class. | Ask the buyer to send the PDF from the [buyer-side applet](/applets/finance/internal-purchase-invoice-applet/). The client needs a fix; there is no configuration that makes this work. |
| **Supplier Name** / **Supplier ID** show an error code | Those cells come from the permission-checked supplier endpoint | Grant the login read access to supplier master data, or hide the columns. |
| The Payment tab is empty on an invoice the supplier has been paid for | Settlements are recorded against the invoice only when the buyer enters them there; a payment made from a payment voucher or a contra appears under **Contra** instead | Check the Contra tab, then ask the buyer's finance team. |
| An attachment cannot be opened | The Attachment tab lists metadata only | Ask the buyer for the file. |
| A line field is missing for one role and present for another | A tenant-wide `HIDE_*` is on and only some roles hold the matching `SHOW_*` permission | Adjust in **Settings → Field Settings** or **Settings → Role Permission Listing**. |
| Changing Default Selection has no effect | No create form exists; the two keys are saved but never read | Expected. |

## Related documentation

- [Purchase Invoice (Internal) applet](/applets/finance/internal-purchase-invoice-applet/)
- [Purchasing module](/modules-v2/purchasing/)
- [Supplier applet](/applets/master-data/supplier-applet-1/)
