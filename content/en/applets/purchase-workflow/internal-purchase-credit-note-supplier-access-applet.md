---
title: "Purchase Credit Note Supplier Access (Internal)"
description: "Reference for the supplier-facing copy of the Purchase Credit Note applet: a login linked to a supplier entity reads the FINAL credit notes the buyer has raised against it — header, lines, payments, contra, linked documents and attachment list — with no create, edit or export."
applet_code: "internal-purchase-credit-note-supplier-access-applet"
page_type: applet
applet_repo: "blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet"
modules: [purchasing, financial-accounting]
related_applets:
  - internal-purchase-credit-note-applet
  - internal-purchase-invoice-supplier-access-applet
  - internal-purchase-return-supplier-access-applet
  - internal-purchase-grn-supplier-access-applet
  - supplier-applet-1
  - organisation-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/line-items-container/line-item-view/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/line-items-container/line-item-view/line-item-view.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - planning/lanes/lane-3/perm-dfn (akaun_master.bl_applet_client_side_perm_dfn, 22 ACTIVE codes)
  fields:
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-listing/purchase-credit-note-listing.component.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-view/purchase-credit-note-view.component.html
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-view/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-view/payment/payment-listing.component.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-view/contra/contra-listing.component.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-view/attachment/attachment-listing.component.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-view/doc-link/copy-from/copy-from.component.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
  lifecycle:
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-credit-note-supplier-access.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/user/UserPermissionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseCreditNoteDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  troubleshooting:
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/state-controllers/purchase-credit-note-controller/store/effects/purchase-credit-note.effects.ts
    - blg-applet-wavelet-internal-purchase-credit-note-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-supplier-access-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-view/export/export.component.html
tags:
  - purchase-credit-note
  - supplier-access
  - accounts-payable
  - credit-adjustment
  - supplier-portal
  - purchase-workflow
weight: 55
---

## Overview

**Purchase Credit Note Supplier Access (Internal)** is the supplier-facing copy of the [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) applet. It is installed in the buying organisation's tenant; a login that has been linked to a supplier entity opens it to read the credit notes the buyer has posted against that supplier — header, lines, settlements, contra records, linked documents and the list of attachments.

The applet is read-only by construction. It has no create screen, no save or delete control anywhere, and all four Export buttons are disabled in the template. Its listing also pins `posting_statuses = FINAL`, so a supplier sees a credit note only after the buyer has finalised it — drafts and discarded notes never appear.

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules-v2/purchasing/), [Financial Accounting](/modules-v2/financial-accounting/) | Reduces what the buyer owes the supplier. |
| The document | [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) | Same rows. Creation, FINAL, VOID and contra all happen there. |
| Upstream (access) | [Supplier](/applets/master-data/supplier-applet-1/) | The supplier's login must be linked to the supplier entity (`bl_fi_mst_entity_login_subject_link`, status `ACTIVE`). |
| Usually raised from | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The Doc Link tab shows the documents the credit note was copied from and to. |
| Sibling supplier applets | [Purchase Invoice Supplier Access](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/), [Purchase Return Supplier Access](/applets/purchase-workflow/internal-purchase-return-supplier-access-applet/), [Purchase GRN Supplier Access](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) | Same shape, same login-link filter, other documents. |

## Screens and menus

Two menus, plus Settings and Personalization (`menu-items.ts`):

| Menu | Route | What it is |
|---|---|---|
| **Internal Purchase Credit Note** | `internal-purchase-credit-note` | The listing and the document view behind it. |
| **Line Items** | `line-items` | A flat listing of credit-note *lines* across all the supplier's credit notes. |
| **Settings** | `settings/…` | Field Settings, Default Selection, Printable Format Settings (menu), plus Webhook, Feature Visibility, Client Side Permission and the permission listings (routes). |
| **Personalization** | `personalization/…` | Personal Default Selection and sidebar order. |

### Listing

{{< figure src="/images/Purchase-Credit-Note-Supplier-Access-applet/credit-note-listing.png" alt="Internal Purchase Credit Note Listing with columns for credit note number, branch, purchase agent, supplier and dates" caption="The listing. Only FINAL credit notes for the supplier behind the login are returned." >}}

Columns: **Purchase Credit Note No, Branch, Purchase Agent, Supplier ID, Supplier Name, Creation Date, Transaction Date, Status**. Sorted by `updated_date` descending, page size from the pagination control, and the criteria always include `posting_statuses = FINAL`.

Each row is completed with three extra calls: the branch through the applet-login endpoint (`branches/basic-info/applet-login-ep/{appletGuid}/{guid}`), the supplier through the ordinary supplier endpoint, and the purchase agent through the entity applet-login endpoint. The branch and supplier calls write their error **code** into the cell when they fail, so a login without supplier read rights sees an error code under **Supplier Name** and **Supplier ID**; the purchase agent falls back to an empty cell.

{{< figure src="/images/Purchase-Credit-Note-Supplier-Access-applet/credit-note-search-filter.png" alt="Search and filter panel with credit note number, branch name, supplier name, date ranges and status" caption="Advanced search: credit note number, branch name, supplier name, created-date range, transaction-date range and status." >}}

### Document view

Clicking a row opens the credit note with nine tabs, all read-only:

| Tab | Contents |
|---|---|
| **Main Details** | Branch, Location, Purchaser, Transaction Date, Credit Terms, Due Date, Reference, Remarks, Permit No, Currency, Tracking Id — every control marked read-only. Branch and Location are resolved through the applet-login endpoints. |
| **Account** | Supplier entity details, billing address, shipping address. |
| **Line Items** | The credit note's lines; clicking one opens the line detail (see *Line Items* below). |
| **Payment** | Settlements against the note: Payment Method, Date, Paid Amount, Remarks. |
| **Department Hdr** | Segment, Dimension, Profit Center, Project on the header. |
| **Contra** | ARAP contra records: Server Doc Type, Status, Date, Amount Contra. |
| **Doc Link** | **Copy From** and **Copy To** grids — the documents linked to this credit note (Doc No, Branch, Server Doc Type, Status, Date). |
| **Attachment** | File Name, Doc Type, Size, Status, Date. Metadata only — the row-click handler is empty, so there is no download. |
| **Export** | All four buttons (PDF, CSV, DOCX, ZIP) are disabled in the template. |

### Line Items

{{< figure src="/images/Purchase-Credit-Note-Supplier-Access-applet/line-items-listing.png" alt="Line Items Listing across credit notes" caption="The Line Items menu: one row per credit-note line across all the supplier's FINAL credit notes." >}}

Columns: **Purchase Credit Note No, Branch, Supplier Name, Project, Shipping Address, Item Code, Item Name, Ordered Qty, Open Qty, Amount TXN, Creation Date, Requested Delivery Date, Delivery Status, Remarks**. The query filters `line_txn_type = PNS` and, again, `posting_statuses = FINAL`.

Opening a line shows **Item Details** (with Main Details, Delivery Instruction, Department, Doc Link and Delivery Details), **Serial Number**, **Costing Details**, **Pricing Details** and **Issue Link** tabs.

{{< figure src="/images/Purchase-Credit-Note-Supplier-Access-applet/line-items-search-filter.png" alt="Line Items search and filter panel" caption="Line Items advanced search: credit note number, item code, item name and transaction-amount range." >}}

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters |
|---|---|---|
| The supplier's login is linked to the supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) → Login (`bl_fi_mst_entity_login_subject_link`, status `ACTIVE`) | Every query is filtered by `hdr.doc_entity_hdr_guid IN (entities linked to this login)`. No link, no rows. |
| The applet is installed for that login | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Supplies the applet token and the `appletGuid` used by the branch and entity applet-login lookups. |
| The credit note is FINAL | [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) | The listing hard-codes `posting_statuses = FINAL`. |

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities` (route `settings/field-settings`), gated by `sessionStorage.appletCode`. There is no inline settings gear in this applet, and no applet-local field-configuration screen.

Of the 251 keys the applet declares, **18 pass all four proofs** — declared in `AppletSettings`, rendered on the shared screen for this applet code, persisted by the shared settings service into `bl_applet_ext.APPLET_SETTINGS`, and consumed by this applet's line-detail template. All 18 hide one line field, and each is paired with a `SHOW_*` client-side permission that can re-open it for a role (`*ngIf="!appletSettings.HIDE_X || SHOW_X"`).

The list was produced with `kb/tools/gates.py` against the shared-utilities commit this applet pins (`e2f57c4`, the code that is actually built into the deployed bundle) and re-checked against shared-utilities HEAD; HEAD renders many more keys, but none of them is consumed here.

| Setting | What it controls (line detail → Main Details) | Default | Effect when changed |
|---|---|---|---|
| `HIDE_QTY_BASE` | Base quantity | Off | Hides the field unless the role holds `SHOW_QTY_BASE`. |
| `HIDE_QTY_UOM` | Quantity in the line's UOM | Off | As above with `SHOW_QTY_UOM`. |
| `HIDE_UOM_TO_BASE_RATIO` | UOM-to-base ratio | Off | As above. |
| `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX` | Standard unit price per UOM, excluding tax | Off | As above. |
| `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX` | Standard unit price per UOM, including tax | Off | As above. |
| `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX` | Net unit price per UOM, excluding tax | Off | As above. |
| `HIDE_UNIT_PRICE_NET_EXCL_TAX` | Net unit price, excluding tax | Off | As above. |
| `HIDE_UNIT_PRICE_TXN` | Transaction unit price | Off | As above. |
| `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX` | Transaction unit price per UOM, including tax | Off | As above. |
| `HIDE_UNIT_DISCOUNT` | Unit discount | Off | As above. |
| `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX` | Unit discount per UOM, excluding tax | Off | As above. |
| `HIDE_DISCOUNT_AMOUNT_EXCL_TAX` | Discount amount, excluding tax | Off | As above. |
| `HIDE_AMOUNT_STD_EXCL_TAX` | Standard amount, excluding tax | Off | As above. |
| `HIDE_AMOUNT_NET_EXCL_TAX` | Net amount, excluding tax | Off | As above. |
| `HIDE_AMOUNT_TXN` | Transaction amount | Off | As above. |
| `HIDE_TAX_CONFIG_SELECTION` | The three tax-configuration fields | Off | Hides all three together. |
| `HIDE_WHT_CONFIG_SELECTION` | The three withholding-tax fields | Off | Hides all three together. |
| `HIDE_COSTING_DETAILS` | The **Costing Details** tab on a line | Off | Hides the tab unless the role holds `SHOW_COSTING_DETAILS`. |

Everything else the shared screen shows for this applet code is stored but never read by this applet — including every `HIDE_*_BUTTON`, status-flow and posting key, because the applet has no buttons and no write path.

**Read outside the shared screen:**

- `DEFAULT_BRANCH` and `DEFAULT_LOCATION` — rendered and saved by the applet-local **Default Selection** screen, but no screen in this applet reads them back (there is no create form to default).
- `PRINTABLE` — written by Printable Format Settings when you mark a format as default, and read back by that same listing to show the tick. It does not reach the export, which is disabled.

### Document behaviour settings

Not applicable. This applet exposes no status, posting, workflow or e-Invoice control; FINAL, VOID and contra all happen in the buyer-side applet.

### Feature visibility and permissions

The registry seeds **22 client-side permission codes** for this applet (`bl_applet_client_side_perm_dfn`, all `ACTIVE` as of 2026-09-06): `SHOW_COSTING_DETAILS`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`, and 20 `SHOW_*` codes matching the line fields above (including `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_INCL_TAX` and `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, whose matching `HIDE_*` keys this applet's templates do not use). Grant them per role in **Settings → Role Permission Listing** to re-open a field the tenant-wide `HIDE_*` setting has closed.

Server-side, the read path is not permission-checked at all: the login-entity endpoints filter rows by the supplier link and map them with the "without permission checking" row mapper. What *is* permission-checked is the supplier lookup used to fill the Supplier Name and Supplier ID columns.

## Fields

Every field on every tab is read-only; the tables under *Screens and menus* list them. There is no create or edit form in this applet, so there are no validators to document.

## Lifecycle and effects

This applet writes nothing to the document. The posting behaviour below belongs to the buyer-side document and is repeated here because it explains what the supplier is looking at.

| Property | Value |
|---|---|
| Server document type | `INTERNAL_PURCHASE_CREDIT_NOTE` |
| Amount signum | −1 (`InternalPurchaseCreditNoteDataConsistencyObject`) |
| Quantity signum | 0 — no stock movement |
| Dr/Cr equation | Dr Purchase/expense (line net) · Dr Input tax · Cr Creditor (net of all lines); settlements post to the cashbook GL of the settlement method. |
| GL precedence | Line GL → header GL → item-company `PURCHASE` link → company default `PURCHASE`; the creditor mapping is mandatory and throws `MISSING_DEFAULT_GL_CODE` when absent. |
| Stock processor | None. |
| What VOID reverses | The buyer-side void processor posts the reverse journal, removes the note from the e-Invoice queue and from aging. A voided note disappears from this listing only if its posting status stops being FINAL. |

Endpoints this applet uses, all under `…/gen-doc/internal-purchase-credit-notes/login-entity-ep`:

| Action | Call | Result |
|---|---|---|
| Listing, Line Items | `GET …/login-entity-ep/query` | Entity-filtered, no permission check. |
| Open a document | `GET …/login-entity-ep/{guid}` | Entity-filtered. |
| Export | not called | The buttons are disabled; the effect behind them still names a sales-order print service and a hard-coded printable-format GUID, with a `Replace with printable once mockup received` comment. |

The backend does expose a supplier write path for generic documents (`PUT …/{docType}/login-entity-ep`, authorised by `UserPermissionService.isUserLoginEntity`), and this applet's service would reach it, but no screen dispatches it.

## Related applets

- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — the buyer-side applet that creates, finalises, voids and contras these notes.
- [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) — the invoice this credit note usually adjusts, in the same portal.
- [Purchase Return Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-return-supplier-access-applet/) — the return that usually triggers the credit note.
- [Supplier](/applets/master-data/supplier-applet-1/) — where the login link is created.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The listing is empty | Either the login has no `ACTIVE` supplier link, or the buyer's credit notes are still DRAFT — the listing pins `posting_statuses = FINAL` | Check the link in the [Supplier](/applets/master-data/supplier-applet-1/) applet; ask the buyer to finalise the note. |
| A credit note the buyer says exists is missing, and others show | It is DRAFT, DISCARDED, or was raised on a different supplier entity record | Confirm the status and the entity on the buyer side. |
| **Supplier Name** / **Supplier ID** show an error code | Those cells come from the ordinary supplier endpoint, which is permission-checked; the failure code is printed into the cell | Grant the login read access to supplier master data, or hide the columns from the grid's column tool panel. |
| **Purchase Agent** is blank | The purchase-agent entity lookup failed, or the header carries no `pic_entity_01` / purchaser reference | Expected when the buyer left the purchase agent empty. |
| Export buttons do nothing | All four are `disabled` in the template | Ask the buyer to send the PDF from the [buyer-side applet](/applets/purchase-workflow/internal-purchase-credit-note-applet/). |
| An attachment cannot be opened | The Attachment tab lists file metadata only; its row-click handler is empty | Ask the buyer for the file. |
| A line field is missing for one role and present for another | The tenant-wide `HIDE_*` setting is on and only some roles hold the matching `SHOW_*` client-side permission | Adjust either in **Settings → Field Settings** (tenant-wide) or **Settings → Role Permission Listing** (per role). |
| Changing Default Selection has no effect | This applet has no create form; `DEFAULT_BRANCH` and `DEFAULT_LOCATION` are saved but never read | Expected. |

## Related documentation

- [Purchase Credit Note (Internal) applet](/applets/purchase-workflow/internal-purchase-credit-note-applet/)
- [Purchasing module](/modules-v2/purchasing/)
- [Supplier applet](/applets/master-data/supplier-applet-1/)
