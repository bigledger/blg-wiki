---
title: "Purchase GRN Supplier Access (Internal)"
description: "Reference for the supplier-facing copy of the Purchase GRN applet: a login linked to a supplier entity reads the FINAL goods received notes the buyer has posted against it — header, lines, payments, contra, linked documents and attachments — and exports a PDF."
applet_code: "internal-purchase-grn-supplier-access-applet"
page_type: applet
applet_repo: "blg-applet-wavelet-internal-purchase-grn-supplier-access-applet"
modules: [purchasing, inventory]
related_applets:
  - internal-purchase-grn-applet
  - internal-purchase-order-supplier-access-applet
  - internal-purchase-invoice-supplier-access-applet
  - internal-purchase-return-supplier-access-applet
  - supplier-applet-1
  - organisation-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/line-items-container/line-item-view/line-item-view.component.html
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/line-items-container/line-item-view/item-details/main-details/main-details.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - planning/lanes/lane-3/perm-dfn (akaun_master.bl_applet_client_side_perm_dfn, 20 ACTIVE + 1 DELETED code)
  fields:
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/purchase-grn-container/purchase-grn-listing/purchase-grn-listing.component.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/purchase-grn-container/purchase-grn-view/purchase-grn-view.component.html
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/purchase-grn-container/purchase-grn-view/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/purchase-grn-container/purchase-grn-view/line-item/line-item-listing.component.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/purchase-grn-container/purchase-grn-view/payment/payment-listing.component.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/purchase-grn-container/purchase-grn-view/attachments/attachments-listing.component.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/models/advanced-search-models/internal-purchase-grn.model.ts
  lifecycle:
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-goods-received-notes-supplier-access.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-goods-received-notes.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGoodReceivedNoteDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  troubleshooting:
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/state-controllers/purchase-grn-controller/store/effects/purchase-grn.effects.ts
    - blg-applet-wavelet-internal-purchase-grn-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-supplier-access-applet/src/app/state-controllers/draft-controller/store/effects/attachment.effects.ts
    - gh:bigledger/blg-applet-wavelet-internal-purchase-grn-supplier-access-applet#1
tags:
  - internal-purchase
  - grn
  - supplier-access
  - goods-received-note
  - purchase-order
weight: 161
aliases:
  - /applets/internal-purchase-grn-supplier-access-applet/
---

## Overview

**Purchase GRN Supplier Access (Internal)** is the supplier-facing copy of the [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) applet. A login linked to a supplier entity opens it inside the buyer's tenant to confirm what the buyer says it received: the goods received notes raised against that supplier, their lines and quantities, any settlements and contra records, the documents they link to, and the attached files.

The applet is read-only — there is no create screen and no save or delete control anywhere — and its listing pins `posting_statuses = FINAL`, so a GRN appears only once the buyer has finalised it. A PDF export exists but calls the buyer-side print endpoint (see *Troubleshooting*).

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules/purchasing/), [Inventory](/modules/inventory/) | Confirms receipt of goods against a purchase order. |
| The document | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | Same rows; the buyer creates and finalises there. |
| Upstream (access) | [Supplier](/applets/master-data/supplier-applet-1/) | The login must be linked to the supplier entity (`bl_fi_mst_entity_login_subject_link`, status `ACTIVE`). |
| Upstream (document) | [Purchase Order Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/) | The order the GRN receives against; the Doc Link tab shows the pair. |
| Downstream | [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) | The invoice raised against the receipt. |
| Sibling | [Purchase Return Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-return-supplier-access-applet/), [Purchase Credit Note Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-supplier-access-applet/) | Same portal, the documents that follow a rejected receipt. |

{{< callout type="info" >}}
A plain GRN **does not move stock**: the backend document type `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` carries quantity signum 0 and amount signum 0. Stock arrives through the separate GRN Stock In document. Anything that says a GRN increases inventory is describing [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/), not this document.
{{< /callout >}}

## Screens and menus

| Menu | Route | What it is |
|---|---|---|
| **Purchase GRN** | `internal-purchase-grn-supplier-access` | The listing and the document view behind it. |
| **Line Items** | `line-items` | A flat listing of GRN lines across the supplier's GRNs. |
| **Settings** | `settings/…` | Field Settings, Default Selection, Printable Format Settings (menu), plus Webhook, Feature Visibility, Client Side Permission and the permission listings (routes). |
| **Personalization** | `personalization/…` | Personal Default Selection and sidebar order. |

### Listing

Columns: **Purchase GRN No, Branch, Purchaser Name, Updated Date, Created Date, Transaction Date, Created by**. Sorted by `updated_date` descending; the criteria always include `posting_statuses = FINAL`.

Advanced search offers Supplier, Branch, Purchaser, Posting Status, Status, Transaction Date, Created Date, Updated Date, Doc Reference Date, Order By, GL Dimension, Segment, Profit Center and Project. Date ranges default to the last month. A search is executed in two steps: the criteria are first resolved to a list of document GUIDs through the shared sub-query endpoint, and the grid then pages over that list; the `posting_statuses = FINAL` criterion is still applied on top, so choosing DRAFT, VOID or DISCARDED under **Posting Status** returns nothing.

Rows are completed with a branch lookup through the applet-login endpoint (`branches/basic-info/applet-login-ep/{appletGuid}/{guid}`), a purchaser lookup through the entity applet-login endpoint and the creator's profile name.

### Document view

Nine read-only tabs:

| Tab | Contents |
|---|---|
| **Main Details** | Branch, Location, Transaction Date, Credit Terms, Due Date, Reference, Remarks, Permit No, Currency, Tracking ID. |
| **Account** | Supplier entity details, billing and shipping address. |
| **Lines** | Item Code, Item Name, UOM, Qty, Unit Price, SST/VAT/GST, Txn Amount. |
| **Payment** | Date, Amount, Details, Remarks. |
| **Department Hdr** | Segment, Dimension, Profit Center, Project. |
| **Contra** | ARAP contra records against the GRN. |
| **Doc Link** | Copy From / Copy To — the order the GRN came from and the invoice raised on it. |
| **Attachments** | File Name, Size, Uploaded Date, Uploaded By. Clicking a row opens the attachment viewer and can download the file — but through the buyer-side file endpoint (see *Troubleshooting*). |
| **Export** | A printable-format picker (loaded through the applet-login endpoint) and **EXPORT AS PDF**. The CSV, DOCX and ZIP buttons are commented out of the template. |

### Line Items

Columns: **Purchase GRN No, Item Code, Item Name, Qty, Unit Price, SST/VAT/GST, Txn Amount**. Opening a line shows **Item Details**, **Serial Number**, **Costing Details** (hidden by `HIDE_COSTING_DETAILS` unless the role holds `SHOW_COSTING_DETAILS`), **Pricing Details** and **Issue Link**.

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters |
|---|---|---|
| The supplier's login is linked to the supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) → Login (`bl_fi_mst_entity_login_subject_link`, `ACTIVE`) | Every query is filtered by that link; without it the screens are empty. |
| The applet is installed for that login | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Supplies the applet token and the `appletGuid` the branch, entity and printable-format applet-login lookups need. |
| The GRN is FINAL | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | The listing pins `posting_statuses = FINAL`. |
| A printable format for this document type | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) → Printable Format Settings, or this applet's own | The Export tab lists formats for `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`. |

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities` (route `settings/field-settings`), gated by `sessionStorage.appletCode`. There is no inline settings gear and no applet-local field-configuration screen.

**19 keys pass all four proofs** — declared in `AppletSettings`, rendered on the shared screen for this applet code, persisted into `bl_applet_ext.APPLET_SETTINGS`, and consumed by this applet's line-detail template. Each hides one line field and each is paired with a `SHOW_*` client-side permission (`*ngIf="!appletSettings.HIDE_X || SHOW_X"`). The set was computed with `kb/tools/gates.py` at the shared-utilities commit this applet pins (`637553b`) and re-checked at HEAD; HEAD renders 297 keys instead of 208, but adds nothing this applet consumes.

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

Everything else the shared screen offers for this applet code is saved but never read here — the applet has no buttons, no status flow and no write path for those keys to affect.

**Read outside the shared screen:**

- `DEFAULT_BRANCH`, `DEFAULT_LOCATION` — rendered and saved by the applet-local **Default Selection** screen; nothing in this applet reads them back (there is no create form).
- `PRINTABLE` — written by Printable Format Settings when a format is marked default, and read by the Export tab as the pre-selected format. This is the one setting that changes what the export produces.

### Document behaviour settings

Not applicable — no status, posting, workflow or e-Invoice control is exposed. FINAL and VOID happen in the buyer-side applet.

### Feature visibility and permissions

The registry seeds **21 client-side permission codes** for this applet (20 `ACTIVE`, `SHOW_UNIT_PRICE_STD_PRICING_SCHEME` `DELETED`, as of 2026-09-06) — the `SHOW_*` half of the pairs in the table above plus `SHOW_COSTING_DETAILS`. Grant them per role in **Settings → Role Permission Listing**.

Server-side:

| Path | Endpoint | Check |
|---|---|---|
| Listing, Line Items, open a document | `…/internal-purchase-goods-received-notes/login-entity-ep[/query]` | Entity-filtered by the supplier link; no permission check. |
| Printable-format list | `…/printable-formats/applet-login-ep` | Any login with the applet installed. |
| **Export as PDF** | `…/internal-purchase-goods-received-notes/print-jasper-pdf/{guid}` | **Back-office** endpoint: requires the targeted permission `TNT_API_DOC_INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE_READ_TGT_GUID` on that document. |
| **Attachment download** | `…/internal-purchase-goods-received-notes/file/{extGuid}` | **Back-office** endpoint: same targeted read permission. |

## Fields

Every field is read-only; the tables under *Screens and menus* list them per tab. There is no create or edit form, so no validators apply.

## Lifecycle and effects

This applet writes nothing. The behaviour below is the buyer-side document's.

| Property | Value |
|---|---|
| Server document type | `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` |
| Amount signum | 0 (`InternalPurchaseGoodReceivedNoteDataConsistencyObject`) |
| Quantity signum | 0 — no inventory transaction line |
| Dr/Cr equation | None; FINAL posts no journal for a plain GRN. The GR/IR (Goods Received / Invoice Received) accrual belongs to GRN Stock In. |
| GL precedence | Not applicable — no journal line. |
| Stock processor | None. |
| What VOID reverses | Nothing to reverse; the GRN's role is to satisfy the purchase order's open queue so the invoice can be raised. |

| Action in this applet | Call | Result |
|---|---|---|
| List / search / open | `GET …/login-entity-ep[/query]` | Works with only the supplier link. |
| Export PDF | `GET …/print-jasper-pdf/{guid}` (back-office) | 403 unless the login also holds the document read permission. |
| Download an attachment | `GET …/file/{extGuid}` (back-office) | Same. |
| Create / save / delete | not wired | No control exists. |

The backend has login-entity variants of both the print and the file endpoints (`…/print-jasper-pdf/login-entity-ep/{guid}`, `…/file/login-entity-ep/{extGuid}`); the applet's service carries a comment saying to switch to them "once api endpoint is enhanced" and still calls the back-office pair.

## Related applets

- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the buyer-side applet.
- [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) — the document that actually moves the stock.
- [Purchase Order Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/) — the order behind the receipt, in the same portal.
- [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) — the invoice that follows.
- [Supplier](/applets/master-data/supplier-applet-1/) — where the login link is created.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The listing is empty | No `ACTIVE` supplier link for the login, or every GRN is still DRAFT (the listing pins `posting_statuses = FINAL`) | Check the link in the [Supplier](/applets/master-data/supplier-applet-1/) applet; ask the buyer to finalise. |
| Searching for **Posting Status** DRAFT / VOID / DISCARDED returns nothing | The search is intersected with the hard-coded `posting_statuses = FINAL` criterion | Expected; only FINAL GRNs are visible in this applet. |
| **EXPORT AS PDF** returns *not authorised* | The export calls the buyer-side print endpoint, which requires the targeted GRN read permission — the supplier link alone is not enough | Grant the login `TNT_API_DOC_INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE_READ_TGT_GUID` for the relevant companies/branches, or ask the buyer to send the PDF. |
| The exported PDF looks wrong or fails to render | The print effect names the CP Commerce sales-order print service class for a purchase GRN; only a printable format built for that service will render | Report it; choose a format that renders, or export from the buyer-side applet. |
| An attachment will not download | Same cause as the export — the file call goes to the buyer-side endpoint | Grant the same read permission, or ask the buyer for the file. |
| **Branch** or **Purchaser Name** is blank or shows a code | Those cells come from separate applet-login lookups; a failure is caught and its code printed | Confirm the applet is installed for the login (the lookups need the `appletGuid`). |
| A line field is missing for one role and present for another | A tenant-wide `HIDE_*` setting is on and only some roles hold the matching `SHOW_*` permission | Adjust in **Settings → Field Settings** or **Settings → Role Permission Listing**. |
| Changing Default Selection has no effect | No create form exists; `DEFAULT_BRANCH` and `DEFAULT_LOCATION` are saved but never read | Expected. |

## Related documentation

- [Purchase GRN (Internal) applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
- [Purchasing module](/modules/purchasing/)
- [Supplier applet](/applets/master-data/supplier-applet-1/)
