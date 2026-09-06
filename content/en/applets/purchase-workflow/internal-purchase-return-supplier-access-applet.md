---
title: "Purchase Return Supplier Access (Internal)"
description: "Reference for the supplier-facing copy of the Purchase Return applet: a login linked to a supplier entity reads the purchase returns the buyer has raised against it — header, lines, payments, contra and attachments — read-only, at any posting status."
applet_code: "internal-purchase-return-supplier-access-applet"
page_type: applet
applet_repo: "blg-applet-wavelet-internal-purchase-return-supplier-access-applet"
modules: [purchasing, inventory]
related_applets:
  - internal-purchase-return-applet
  - internal-purchase-credit-note-supplier-access-applet
  - internal-purchase-invoice-supplier-access-applet
  - internal-purchase-grn-supplier-access-applet
  - supplier-applet-1
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/components/line-items-container/line-item-view/line-item-view.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - planning/lanes/lane-3/perm-dfn (akaun_master.bl_applet_client_side_perm_dfn, 20 ACTIVE codes)
  fields:
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/components/purchase-return-container/purchase-return-listing/purchase-return-listing.component.ts
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/components/purchase-return-container/purchase-return-view/purchase-return-view.component.html
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/components/purchase-return-container/purchase-return-view/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/models/listing-search-criteria.util.ts
  lifecycle:
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-return-supplier-access.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseReturnDataConsistencyObject.java
  troubleshooting:
    - blg-applet-wavelet-internal-purchase-return-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-supplier-access-applet/src/app/state-controllers/purchase-return-controller/store/effects/purchase-return.effects.ts
tags:
  - supplier-collaboration
  - purchase-returns
  - rma-management
  - transparency
  - financial-reconciliation
weight: 70
lastmod: 2026-09-06
---

## Overview

**Purchase Return Supplier Access (Internal)** is the supplier-facing copy of the [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) applet. A login linked to a supplier entity opens it inside the buyer's tenant and reads the returns the buyer has raised against that supplier: header, lines and quantities, refunds recorded, contra records and attachments.

It is read-only — no create screen, no save, no delete, no status action. Unlike the credit-note, GRN and invoice portals, its listing does **not** pin `posting_statuses = FINAL`: it filters on `status = ACTIVE` only, so a supplier also sees the buyer's DRAFT and DISCARDED returns.

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules/purchasing/), [Inventory](/modules/inventory/) | Goods going back to the supplier. |
| The document | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | Same rows; creation, FINAL and VOID happen there. |
| Upstream (access) | [Supplier](/applets/master-data/supplier-applet-1/) | The login must be linked to the supplier entity (`bl_fi_mst_entity_login_subject_link`, `ACTIVE`). |
| Upstream (document) | [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/), [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) | The invoice or receipt the return is raised against. |
| Downstream | [Purchase Credit Note Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-supplier-access-applet/) | The credit the buyer usually raises after the return. |

## Screens and menus

| Menu | Route | What it is |
|---|---|---|
| **Internal Purchase Return Supplier Access** | `internal-purchase-return-supplier-access` | The listing and the document view behind it. |
| **Line Items** | `line-items` | A flat listing of return lines across the supplier's returns. |
| **Settings** | `settings/…` | Field Settings, Default Selection, Printable Format Settings (menu), plus Webhook, Feature Visibility, Client Side Permission and the permission listings (routes). |
| **Personalization** | `personalization/…` | Personal Default Selection and sidebar order. |

### Listing

Columns: **Purchase Return No, Branch, Purchaser Name, Created Date, Transaction Date, Created by**. Sorted by `updated_date` descending. The criteria are `server_doc_type = INTERNAL_PURCHASE_RETURN` and `status = ACTIVE` — there is no posting-status filter, so DRAFT, FINAL, VOID and DISCARDED returns all appear; read the posting status in the document view.

Advanced search accepts a document number (`server_doc_1`), a free-text keyword (supplier name, branch name or creator all map to `search_word`), a created-date range and a transaction-date range.

### Document view

Eight read-only tabs: **Main Details** (Branch, Location, Transaction Date, Credit Terms, Due Date, Reference, Remarks, Permit No, Currency, Tracking ID), **Account** (supplier entity, billing and shipping address), **Lines**, **Payment** (refunds recorded against the return), **Department Hdr** (Segment, Dimension, Profit Center, Project), **Contra** (ARAP contra records), **Attachments**, and **Export**.

There is no Doc Link tab here — to see which invoice or receipt the return came from, open the linked document in its own portal.

On **Export**, only **EXPORT AS PDF** is enabled; CSV, DOCX and ZIP are disabled. See *Troubleshooting* — the request is built against an endpoint that does not exist.

### Line Items

A flat grid of return lines (`line_txn_type = PNS`) with the item, quantities and amounts; its advanced search adds item code, item name and a transaction-amount range. Opening a line shows **Item Details**, **Serial Number**, **Costing Details** (hidden by `HIDE_COSTING_DETAILS` unless the role holds `SHOW_COSTING_DETAILS`), **Pricing Details** and **Issue Link**.

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters |
|---|---|---|
| The supplier's login is linked to the supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) → Login (`bl_fi_mst_entity_login_subject_link`, `ACTIVE`) | Every query is filtered by that link. |
| The applet is installed for that login | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Applet token at start-up. |
| The return is `ACTIVE` | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | Deleted returns are excluded; every posting status is shown. |

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities` (route `settings/field-settings`), gated by `sessionStorage.appletCode`. No inline gear; the applet's own `field-configuration` folder is not routed.

**19 keys pass all four proofs** at the shared-utilities commit this applet pins (`cf8379f`), re-checked at HEAD with no additions: the same eighteen line-field hides as the rest of the family plus `HIDE_COSTING_DETAILS`. Each is written `!appletSettings.HIDE_X || SHOW_X`, so a role holding the matching `SHOW_*` client-side permission sees the field even when the tenant-wide setting hides it.

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

**Read outside the shared screen:** `DEFAULT_BRANCH` and `DEFAULT_LOCATION` are rendered and saved by the applet-local **Default Selection** screen but read by nothing here; `PRINTABLE` is written and read only by Printable Format Settings and does not reach the export.

### Document behaviour settings

Not applicable — FINAL, VOID and refund handling are buyer-side.

### Feature visibility and permissions

The registry seeds **20 client-side permission codes** for this applet, all `ACTIVE` as of 2026-09-06: the eighteen field pairs above plus `SHOW_COSTING_DETAILS` and `SHOW_UNIT_PRICE_TXN`. Grant them per role in **Settings → Role Permission Listing**.

Server-side, the read path (`…/gen-doc/internal-purchase-returns/login-entity-ep[/query]`) is filtered by the supplier link and skips permission checks; the branch, supplier and purchaser lookups used to fill the grid are ordinary permission-checked endpoints.

## Fields

Every field is read-only; the tab list above describes them. There is no create or edit form.

## Lifecycle and effects

This applet writes nothing. The buyer-side document behaves as follows.

| Property | Value |
|---|---|
| Server document type | `INTERNAL_PURCHASE_RETURN` |
| Amount signum | +1 (`InternalPurchaseReturnDataConsistencyObject`) |
| Quantity signum | −1 — stock out; the purchase-side document that actually reduces inventory |
| Dr/Cr equation | Dr Creditor (net of all lines) · Cr Purchase return (line net) · Cr Input tax (line tax); refunds post to the cashbook GL of the settlement method. |
| GL precedence | Header GL → item-company `PURCHASE_RETURN` link → company default `PURCHASE_RETURN`; the creditor mapping is mandatory and throws `MISSING_DEFAULT_GL_CODE`. |
| Stock processor | `INVENTORY_TRANSACTION_LINE_PROCESSOR`, quantity × −1 at the return location. FINAL fails if there is not enough stock there. |
| What VOID reverses | Reverse journal and stock movement, removal from the e-Invoice queue and from aging; a return with contra or settlement links cannot be voided until those are removed. |

| Action in this applet | Call | Result |
|---|---|---|
| List / search / open | `GET …/gen-doc/internal-purchase-returns/login-entity-ep[/query]`, `…/login-entity-ep/{guid}` | Works with only the supplier link; every posting status is visible. |
| Export PDF | `GET …/internal-purchase-returns/login-entity-ep/print-jasper-pdf/{guid}` | No such endpoint — see *Troubleshooting*. |
| Create / save / delete | not wired | No control exists. |

## Related applets

- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — the buyer-side applet.
- [Purchase Credit Note Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-supplier-access-applet/) — the credit that usually follows the return.
- [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) — the invoice the return adjusts.
- [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) — the receipt the goods came in on.
- [Supplier](/applets/master-data/supplier-applet-1/) — where the login link is created.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The listing is empty | The login has no `ACTIVE` supplier link, or the returns were raised on a different supplier entity record | Check the link in the [Supplier](/applets/master-data/supplier-applet-1/) applet. |
| A return the buyer has not finalised is visible | Intentional here: this listing has no posting-status filter (only `status = ACTIVE`) | Read the posting status on the document before acting on it — a DRAFT return can still change. |
| **EXPORT AS PDF** shows a failure toast and no file | The service builds `…/internal-purchase-returns/login-entity-ep/print-jasper-pdf/{guid}`, which matches no mapping in the generic-document controller; the effect also passes a hard-coded printable-format GUID and the CP Commerce sales-order print service class | Ask the buyer to send the PDF from the [buyer-side applet](/applets/purchase-workflow/internal-purchase-return-applet/). No configuration makes this work. |
| The **Branch**, **Purchaser Name** or **Created by** cell shows a code | Those come from separate lookups; a failure is caught and the error code printed | Grant the login read access to that master data, or hide the column. |
| There is no Doc Link tab | This applet does not include one | Open the linked invoice or receipt in its own supplier portal. |
| A line field is missing for one role and present for another | A tenant-wide `HIDE_*` is on and only some roles hold the matching `SHOW_*` permission | Adjust in **Settings → Field Settings** or **Settings → Role Permission Listing**. |
| Changing Default Selection has no effect | No create form exists; the two keys are saved but never read | Expected. |

## Related documentation

- [Purchase Return (Internal) applet](/applets/purchase-workflow/internal-purchase-return-applet/)
- [Purchasing module](/modules/purchasing/)
- [Supplier applet](/applets/master-data/supplier-applet-1/)
