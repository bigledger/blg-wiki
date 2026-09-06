---
title: "Consignment Billing Applet (Internal)"
description: "Reference for the Consignment Billing Applet (Internal): the purchase invoice you raise to the consignor once consignment stock has been sold — its screens, the settings that actually render, its fields, the journal it posts (and the stock it does not move), and the failure modes that are in the code."
applet_code: "internalConsignmentBillingApplet"
applet_repo: "blg-applet-wavelet-internal-consignment-billing-applet"
page_type: applet
modules: [purchasing, financial-accounting, inventory]
related_applets:
  - internal-consignment-grn-applet
  - internal-consignment-gin-applet
  - internal-consignment-purchase-order-applet
  - internal-consignment-return-applet
  - internal-consignor-purchase-billing-applet
  - customer-consignment-applet
  - internal-purchase-invoice-applet
  - internal-purchase-return-applet
  - supplier-applet-1
  - organisation-applet
  - chart-of-account-applet
  - tax-configuration-applet
  - doc-item-maintenance-applet
guides: [/guides/purchasing-guides/consignment-purchasing/]
sources:
  configuration:
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/settings-container/applet-settings.module.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  fields:
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-create/consignment-billing-create.component.html
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-edit/consignment-billing-edit.component.html
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-listing/consignment-billing-listing.component.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-edit/line-item-edit/line-item-edit.component.html
  lifecycle:
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-create/line-item-add/line-item-add.component.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-edit/consignment-billing-edit.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseConsignmentInvoiceDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  troubleshooting:
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-create/import-knock-off/knock-off-grn/knock-off-grn.component.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-edit/line-item-edit/line-item-edit.component.ts
    - blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/components/consignment-billing-container/consignment-billing-create/line-item-add/issue-link/issue-link-listing/issue-link-listing.component.ts
tags:
- consignment
- consignment-billing
- purchase-invoice
- accounts-payable
weight: 50
date: 2026-05-28
lastmod: 2026-09-06
draft: false
---

## Overview

The Consignment Billing Applet (Internal) raises the **purchase invoice you owe the consignor** once
consignment stock has been sold. Consignment stock arrives on a
[Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/): it sits in your
location but the consignor still owns it, recorded as consignment stock against a consignment
liability. When it sells, ownership passes to you and the consignor bills you. This applet is where
that bill is entered — it turns the consignment liability into a real amount owed to a supplier and
turns the consignment stock into a purchase.

Server document type `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`, short code `CSGINV`. The counterparty
is a **supplier** (the applet's own entity picker is titled *Select Supplier*), the internal route
is `internal-purchase-invoice`, and the file-import screen posts to the internal purchase invoice
import endpoint. It is a purchase-side document in every respect.

{{< callout type="warning" >}}
**This document moves no stock, and it does not create a sale, revenue or a receivable.** Its
quantity signum is forced to **0** by the backend and its amount signum is **−1** — the purchase
direction. The journal it posts debits purchase and input-tax accounts, credits the supplier, and
then debits Consignment Liability against a credit to Consignment Stock. Nothing is posted to a
debtor, to sales, or to output tax, and no inventory transaction line is written. See
[Lifecycle and posting](#lifecycle-and-posting).
{{< /callout >}}

## Where it fits

| | Document | What it does |
|---|---|---|
| Upstream | [Consignment GRN (Internal)](/applets/inventory-workflow/internal-consignment-grn-applet/) | Brings the consignor's stock into your location (quantity +1) and records Consignment Stock / Consignment Liability. Its open lines are what this applet knocks off. |
| Upstream (optional, per line) | [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Requisition](/applets/purchase-workflow/internal-purchase-requisition-applet/), Purchase GRN, [Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/) | Line-level knock-off tabs, each shown only when the company has enabled that document flow. |
| This applet | **Consignment Billing (Internal)** | The consignor's invoice. Converts consignment liability into a payable and consignment stock into a purchase. No stock movement. |
| Sibling | [Consignor Purchase Billing (Internal)](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) | The *period* record of what you owe a consignor. It writes its own billing tables and posts no journal at all — a different artefact from this one. |
| Downstream | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | A consignment billing document that has been linked to a purchase return can no longer be voided. |
| Reverse direction | [Consignment Return (Internal)](/applets/purchase-workflow/internal-consignment-return-applet/) | Sends unsold consignment stock back to the consignor instead of buying it. |

{{< callout type="info" >}}
**This is not the document that bills a customer.** If you place *your* stock at someone else's
location and want to invoice them for what they consumed, that is the sales side — see
[Customer Consignment](/applets/sales-workflow/customer-consignment-applet/) and
[Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/).
{{< /callout >}}

## Screens and menus

The left menu has three entries and no others:

| Menu item | Route | What it shows |
|---|---|---|
| **Consignment Billing** | `internal-purchase-invoice` | The listing, plus the create and edit panels |
| **Line Items** | `line-items` | A cross-document listing of billing lines, with its own edit panel |
| **File Import** | `file-import` | CSV upload of billing data, and the listing of past import batches |

{{< figure src="/images/internal-consignment-billing-applet-applet/consignment-billing-main-details-tab.png" alt="Internal Consignment Billing listing on the left with the Create panel open on the Main Details tab" caption="The listing (left) with the FINAL, DISCARD, VOID and SINGLE/MULTIPLE PRINT buttons above the grid, and the create panel (right) on Main Details. Branch and Location are required and show their validation messages until filled." >}}

### Listing

One grid with 25 columns: Doc Short Code, Doc No, Doc No (Company), Doc No (Branch), Reference,
Posting Status, Status, Branch Code, Currency, Supplier Name, Purchaser, Amount Txn, the five ARAP
columns (PNS, Settlement, Doc Open, Contra, Balance), Created Date, Transaction Date, Client Doc
Short Code and Client Doc 1–5. Above the grid: **FINAL**, **DISCARD**, **VOID** and
**SINGLE/MULTIPLE PRINT** — the print button is disabled until a default printable format is set.
Rows are multi-select; the buttons act on the selection.

### Create

Six tabs, three of them always present:

| Tab | Shown when | Contents |
|---|---|---|
| **Main Details** | always | Document numbering, supplier, dates, terms, currency — see [Fields](#fields) |
| **Account** | always | Entity Details, Bill To and Ship To sub-tabs; the entity picker opens as *Select Supplier* |
| **Line Items** | always | The item grid and the add-line panel |
| **Delivery Details** | `HIDE_DELIVERY_DETAILS_TAB` off | Delivery branch, location, permit and tracking references |
| **Payment** | `HIDE_MAIN_PAYMENT_TAB` off | Settlement lines captured at the point of billing |
| **KO For** | `HIDE_KO_FOR_TAB` off | A single sub-tab, **Consignment Purchase GRN** |
| **Department Hdr** | `HIDE_DEPARTMENT_HDR_TAB` off | Dimension, profit centre, project and segment for the header |

{{< figure src="/images/internal-consignment-billing-applet-applet/consignment-billing-account-tab.png" alt="Account tab with Entity Details, Bill To and Ship To sub-tabs, and the Select Supplier picker open on the right" caption="The Account tab. The picker is titled Select Supplier and lists supplier entities — the counterparty on a consignment billing document is the consignor, not a customer." >}}

**KO For → Consignment Purchase GRN** is the intended way to build the document. The grid lists
consignment GRN lines still waiting to be billed — read from the line open queue where
`server_doc_type_1 = INTERNAL_PURCHASE_CONSIGNMENT_GRN` and
`server_doc_type_2 = INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`. Selecting rows and pressing **KNOCK
OFF** copies the GRN header onto the draft and creates one billing line per GRN line, each with a
document link back to the GRN. All rows picked in one document must share the same supplier and the
same branch.

{{< figure src="/images/internal-consignment-billing-applet-applet/consignment-billing-ko-for-tab.png" alt="KO For tab showing the Consignment Purchase GRN grid with KNOCK OFF and DELETE buttons" caption="KO For → Consignment Purchase GRN. Short code CSGGRN identifies the source documents; the column is headed Supplier." >}}

### Edit

The edit panel adds six tabs to the create set and drops **KO For** (knock-off from that point on is
per line): **ARAP**, **Posting**, **TraceDocument**, **Contra**, **Doc Link** and **Attachment**.
Its buttons are RESET, FINAL, DISCARD, VOID and SAVE, each shown according to the document's status
and the settings in [Document behaviour](#document-behaviour-settings).

{{< figure src="/images/internal-consignment-billing-applet-applet/consignment-billing-item-details-subtab.png" alt="Line Items tab with a line selected and the Edit Item panel open on Item Details" caption="Editing a line. The Edit Item panel carries Item Details (with Main Details, Department, Doc Link and Delivery Details sub-tabs) and the Issue Link tab." >}}

Line editing has its own tab set: **Item Details**, a sub-item tab (**Serial Number**, **Batch
Number** or **Bin Number**, depending on the item), **Costing Details** when
`HIDE_COSTING_DETAILS` is off, **Issue Link**, and a pair of **KO By** / **KO For** tabs for each of
Purchase GRN, Purchase Order, Purchase Requisition and Supplier Delivery Order — each pair rendered
only when the company has enabled that document flow into `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`.

{{< callout type="warning" >}}
**The Issue Link tab is a mock and shows fixed sample data.** Its grid is fed by a hard-coded
one-row array (`project: "Test"`, an issue number and an assignee); no service is injected and the
data-source call is commented out. It renders the same row on every line of every document in every
tenant. It has nothing to do with Goods Issue Notes — the columns are Project, Issue Number, Issue
Summary, Issue Description, Assignee, Created Date, Resolved Date and Status. Recorded as **P-0132**.
{{< /callout >}}

### File Import

Upload a `.csv` with a comma or pipe delimiter and press **SUBMIT**. **Sample Format** downloads a
template from the backend. The screen is the internal purchase invoice importer — the endpoint is
`…/erp/internal-purchase-invoice/import-file-hdr/backoffice-ep` and the downloaded template is named
`Sales_Invoice_Master_Data_Template.csv` regardless of the delimiter chosen.

{{< figure src="/images/internal-consignment-billing-applet-applet/consignment-billing-upload-form.png" alt="File Import upload screen with the delimiter selector and the drag-and-drop area" caption="File Import. Choose the delimiter first — it decides which sample template you get." >}}

Past batches and their per-row results are on the File Import listing.

{{< figure src="/images/internal-consignment-billing-applet-applet/consignment-billing-import-detail-view.png" alt="File import detail view listing the rows of an uploaded batch" caption="Import detail: the rows of one uploaded batch and their outcome." >}}

## Configuration

### Before you can use it

| What | Where | Why |
|---|---|---|
| Branch and location | [Organisation](/applets/master-data/organisation-applet/) | Both are `Validators.required` on the create form; the document cannot be created without them |
| Document numbering for `CSGINV` | [Organisation](/applets/master-data/organisation-applet/) | Supplies Doc No (Tenant / Company / Branch) |
| Supplier entity with an AR/AP type | [Supplier](/applets/master-data/supplier-applet-1/) | The journal's entity line is resolved from the entity's AR/AP setting |
| Default GL codes for `CONSIGNMENT_LIABILITY` and `CONSIGNMENT_STOCK` | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | Both are looked up as **company default** GL codes and both **throw** `MISSING_DEFAULT_GL_CODE` if absent |
| Default GL code for the creditor mapping (`CREDITOR`, or whatever the entity's AR/AP type resolves to) | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | Also throws `MISSING_DEFAULT_GL_CODE` when unmapped |
| Purchase and input-tax GL codes | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | Resolvable per line, per header, per item-company link or as a company default; an unresolvable line is dropped and FINAL then fails on an unbalanced journal |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Line tax; the tax-code selector is hidden by `HIDE_TAX_CONFIG_SELECTION` |
| Knock-off configuration: `INTERNAL_PURCHASE_CONSIGNMENT_GRN` → `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`, enabled | [Organisation](/applets/master-data/organisation-applet/) → Company → Knock Off Configuration | Without an **enabled** flow row the GRN's finalised lines never enter the open queue and the KO For grid stays empty |
| A default printable format | Settings → Printable Format Settings | SINGLE/MULTIPLE PRINT is disabled and the after-FINAL pop-up fails without it |

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities` (imported
directly in `app.routing.ts` as the `field-settings` route). The applet also *declares* a local
`FieldConfigurationComponent` in its settings module, but no route points at it — it is dead code.
Any tenant administrator with access to the applet's Settings menu can change these; there is no
per-row authority difference.

The settings menu has exactly three entries: **Application Settings** (the shared screen),
**Default Selection**, and **Printable Format Settings**. A **Knock Off Settings** screen exists as
a route and a component but its menu entry is commented out, so it is unreachable. The
**Personalization** menu has one entry, **Default Selection**.

The applet's settings model declares **103** keys. Of those, **52** pass all four proofs — declared,
rendered on the shared screen for applet code `internalConsignmentBillingApplet`, persisted by the
settings service, and read by this applet's own code. Grouped by what they do:

| Group | Keys | What they control |
|---|---|---|
| Document buttons | `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON` | Hide FINAL / VOID / DISCARD on both the listing and the edit form |
| Listing | `DISABLE_GEN_DOC_LISTING`, `SORT_ORDER`, `HIDE_SERVER_DOC_1`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3` | Suppress the listing entirely; the column the grid is ordered by (defaults to `updated_date` when unset); hide the three document-number columns |
| Header fields | `CANNOT_EDIT_CURRENCY_RATE`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1`…`HIDE_CLIENT_DOC_5`, `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID` | Lock the currency rate; hide the client-document reference fields, permit number and tracking id |
| Tabs | `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_MAIN_CONTRA_TAB` | Hide those three tabs on the edit form |
| ARAP columns | `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Hide the five ARAP columns on the listing |
| Line grid and item form | `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_AMOUNT_TXN`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, and the eight `HIDE_UNIT_PRICE_*` keys | Hide individual quantity, price, discount and amount columns and fields |
| Line extras | `HIDE_COSTING_DETAILS`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` | Hide the Costing Details tab, the last-purchase-price hint, the location and delivery selectors, the tax and withholding-tax selectors and the pricing-scheme picker |
| Serial numbers | `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` | Checks, while a line is being saved, whether another draft already holds the serial number |
| After FINAL | `ENABLE_AUTO_POPUP` | Opens the printable PDF automatically after a successful FINAL; without a default printable it shows *No Default Printable Selected* instead |

Each `HIDE_*` key is paired in code with a `SHOW_*` client-side permission — the control is hidden
only when the setting is on **and** the permission is absent. For this applet that per-role escape
hatch does not exist: see [Feature visibility and permissions](#feature-visibility-and-permissions).

**Keys read at runtime with no control on the shared screen.** Nineteen keys are read by the applet
but have nowhere to be set from the Application Settings screen for this applet code:

- Seven **tab-hide** keys — `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_MAIN_ARAP_TAB`,
  `HIDE_POSTING_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_DEPARTMENT_HDR_TAB` —
  plus `HIDE_KO_FOR_TAB`. The shared screen renders tab toggles only for applet codes listed in its
  `tabMappings`, and `internalConsignmentBillingApplet` is not one of them. Recorded as **P-0133**.
- `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY`, `ENABLE_MULTIPLE_KO`, `DEFAULT_COUNTRY`, `DEFAULT_CUST_TYPE`.
- `PRINTABLE`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`, `DEFAULT_CURRENCY` and
  `DEFAULT_ITEM_SEARCH_ITEM_TYPE`, which are set on the other settings screens below rather than on
  Application Settings.

They keep whatever value the tenant already holds. On a tenant that has never saved Application
Settings they are simply absent, so every gated tab renders.

**Default Selection** (applet-wide) has two controls, **Default Branch** and **Default Location**,
and writes three keys: `DEFAULT_BRANCH`, `DEFAULT_LOCATION` and `DEFAULT_COMPANY` — the company is
derived from the branch you pick, and picking a branch also pre-fills the location from that
branch's `MAIN_LOCATION`. The branch list is restricted to the branches your
`TNT_API_DOC_INTERNAL_PURCHASE_CONSIGNMENT_INVOICE_READ_TGT_GUID` target allows, unless you are a
tenant admin or owner, in which case it is unrestricted. **RESET** clears all three to null.

**Personalization → Default Selection** overrides the applet-wide values for one user and adds a
third control, **Default Item Search Item Type** (`DEFAULT_ITEM_SEARCH_ITEM_TYPE`), which filters the
item search on the add-line panel.

**Printable Format Settings** manages the printable formats offered to SINGLE/MULTIPLE PRINT and to
the after-FINAL pop-up. Printing runs through the `INTERNAL_PURCHASE_ORDER_PRINT_SERVICE` Jasper
service, so the format must be one that service can render.

### Document behaviour settings

| Behaviour | Governed by | Effect |
|---|---|---|
| FINAL button visible | `HIDE_GENDOC_FINAL_BUTTON` off, document `ACTIVE`, posting status empty or `DRAFT`, and no line failed serial validation | Sends `{ posting_status: 'FINAL' }` |
| DISCARD button visible | `HIDE_GENDOC_DISCARD_BUTTON` off, document `ACTIVE`, posting status empty or `DRAFT` | Sets the document to `DISCARDED` |
| VOID button visible | `HIDE_GENDOC_VOID_BUTTON` off and posting status `FINAL` | Sends `{ posting_status: 'VOID' }` |
| Print after FINAL | `ENABLE_AUTO_POPUP` on and `PRINTABLE` set | Opens the PDF in a new window |
| Fields locked after FINAL | not configurable | Once posting status is `FINAL`, or status is anything but `ACTIVE`, SAVE and the line editors are disabled |

There is **no approval flow** on this document: the applet has no approval tab, no approval settings
and no workflow designer, and the shared screen renders no approval controls for this applet code.
See [document approval](/applets/master-data/organisation-applet/) for what "approval" means
elsewhere in the product.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Knock Off Configuration rows (`bl_fi_comp_gendoc_flow_config`) | Organisation → Company → Knock Off Configuration | Decides whether the KO For grid finds anything, and which of the four per-line KO By / KO For tab pairs render |
| Default GL codes per transaction code | Chart of Accounts | Every GL code the journal resolves; two of them throw when missing |
| Item consignment and item-type flags | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | What the add-line item search returns, together with `DEFAULT_ITEM_SEARCH_ITEM_TYPE` |
| Company posting configuration (`posting_final_json`) | Organisation → Company | Whether the journal processor runs for this document type at all |

### Feature visibility and permissions

The applet checks **43** client-side permission codes — `SHOW_GENDOC_FINAL_BUTTON`,
`SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_DOCUMENT_DELETE_BUTTON`,
`SHOW_TRANSACTION_DATE`, `SHOW_DOC_NO_TENANT` / `_COMPANY` / `_BRANCH`, `SHOW_INTERCOMPANY_PI_SCREEN`
and one `SHOW_*` counterpart for each hideable line and ARAP column.

**None of them is seeded.** `bl_applet_client_side_perm_dfn` holds zero rows for
`internalConsignmentBillingApplet`, so no role, team or user can be granted any of them and every
`SHOW_*` check evaluates false. In practice that means each `HIDE_*` setting is absolute: switch it
on and the control is gone for everyone, with no per-role exception. Recorded as **P-0134**.

Server-side permissions are unaffected. The applet requests
`TNT_API_DOC_INTERNAL_PURCHASE_CONSIGNMENT_INVOICE_READ_TGT_GUID`, `…_CREATE_TGT_GUID`,
`…_UPDATE_TGT_GUID`, `TNT_TENANT_ADMIN` and `TNT_TENANT_OWNER` at start-up; the create button and
the SAVE button are disabled without create and update permission respectively, and the branch
lists on Default Selection and the KO For grid are filtered by the read permission's branch targets.
A `…_DELETE_TGT_GUID` definition exists on the backend but the applet never asks for it.

## Fields

### Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Doc Short Code | `CSGINV` | — | Read-only |
| Doc No (Tenant) / (Company) / (Branch) | The three running numbers | — | Read-only; each hidden by its `HIDE_SERVER_DOC_n` setting and shown per role by `SHOW_DOC_NO_*` — which cannot be granted, see above |
| Client Doc Short Code, Client Doc 1–5 No | Your own reference codes | — | Hidden by `HIDE_CLIENT_DOC_TYPE` and `HIDE_CLIENT_DOC_1`…`_5` |
| **Branch** | The branch the document belongs to | **Yes** | `Validators.required`; also drives the location list |
| **Location** | The stock location | **Yes** | `Validators.required` |
| Purchaser | The employee raising the bill | Yes (marked `*` in the UI) | |
| Transaction Date | The document date | — | Defaults to today; editable only with `SHOW_TRANSACTION_DATE` |
| Credit Terms | Payment terms from the supplier | — | Disabled until an Entity ID is selected |
| Credit Limit | The supplier's limit | — | Disabled until an Entity ID is selected |
| Due Date | Derived from the terms | — | |
| Reference | Free-text reference | — | |
| Remarks / External Remarks | Internal and printable notes | — | Character counters shown |
| Permit No | Import/export permit reference | — | Hidden by `HIDE_PERMIT_NO` |
| Base Currency | The company's currency | — | Read-only |
| Currency | The document currency | Yes | |
| Currency Rate | Rate to base currency | — | Locked by `CANNOT_EDIT_CURRENCY_RATE`; SAVE refuses a rate of zero when the document currency differs from base |
| Tracking ID | Logistics tracking reference | — | Hidden by `HIDE_TRACKING_ID` |

### Account

Three sub-tabs. **Entity Details** shows Entity Id (required), Entity Name, Status, Entity Type,
Identity Type, ID Number, Currency, Email, Description and Phone Number, all populated from the
selected supplier. **Bill To** and **Ship To** hold the two addresses.

### Line items

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item Code / Item Name | The item | Yes | Chosen from the item search |
| UOM | Unit of measure | Yes | |
| UOM to base ratio | Conversion factor | — | Hidden by `HIDE_UOM_TO_BASE_RATIO` |
| Pricing Scheme | Price list to apply | — | Hidden by `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` |
| Unit Price STD (inclusive of tax) and the other seven unit-price variants | Line pricing | Yes (at least one) | Each hidden by its own `HIDE_UNIT_PRICE_*` key |
| Quantity Base | Quantity billed | Yes | Hidden by `HIDE_QTY_BASE` |
| Unit Discount / Discount Amount | Line discounts | — | Hidden by `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX` |
| Tax code | Line tax | — | Hidden by `HIDE_TAX_CONFIG_SELECTION` |
| Withholding tax | Line WHT | — | Hidden by `HIDE_WHT_CONFIG_SELECTION` |
| Location / Delivery Branch / Delivery Location | Line-level overrides | — | Hidden by `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION` |
| Remarks | Line note | — | |

The line grid totals **Total Txn Amount** and **Total SST/VAT/GST Amount** above it.

## Lifecycle and posting

| Status (`posting_status`) | Meaning | Allowed next |
|---|---|---|
| empty / `DRAFT` | Saved and editable | `FINAL`, or `DISCARDED` |
| `FINAL` | Posted; header and lines locked | `VOID` |
| `VOID` | Reversed by the void processors | — |
| `DISCARDED` (document `status`) | Abandoned draft | — |

**FINAL** is sent from the edit form or from the listing's bulk FINAL as a posting-status update
`{ posting_status: 'FINAL' }`. Pressing FINAL on a document that is already `FINAL` shows *This
document has been posted*. **VOID** first checks the document's own links: if any `ACTIVE` link
joins this document to an `INTERNAL_PURCHASE_RETURN`, the applet refuses with *The invoice has
already been linked with a purchase return*; pressing VOID on a document that is not `FINAL` shows
*This document has not been finalized yet*. Both are client-side guards.

Posting proof:

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`, short code `CSGINV` | `InternalPurchaseConsignmentInvoiceDataConsistencyObject` L15; `GenericDocServerDocTypeEnum` L60 |
| Amount signum | **−1** (purchase direction) | DCO L17; validated on create and update by `checkAmountSignum` (DCO L20–L33) |
| Quantity signum | **0** — no stock movement | DCO L16 and L35–L42; `fillQuantitySignumAndAmountSignumForLine` sets the line's quantity signum unconditionally (`GenericDocumentDataConsistencyObject` L1215–L1219). The applet sends `1` from its own `AppletConstants` (`line-item-add.component.ts` L183); the server overwrites it. The document type does not appear in `ServerDocTypes` at all |
| Dr/Cr equation | Item and tax lines: amount × amount signum (−1) → **debit** `PURCHASE` / `INPUT_TAX` (discounts → `PURCHASE_DISCOUNT`, returns → `PURCHASE_RETURN`). Balancing entity line → **credit** the supplier's resolved AR/AP account (`CREDITOR` by default). Then a second, self-balancing pair: **debit** `CONSIGNMENT_LIABILITY`, **credit** `CONSIGNMENT_STOCK`, both for the document total | `JournalPostingService` L95–L128, L322–L361, L397–L471; `JournalPostingTypeHandler` L53–L63 |
| Which handler | The type has no entry of its own in `JournalPostingTypeHandler`, so the fallback applies: the name contains `PURCHASE`, so the `PURCHASE` handler is used | `JournalPostingService` L68–L82 |
| GL precedence | Line GL → header GL → item-company link → company default, for the purchase and tax lines. `CONSIGNMENT_LIABILITY` and `CONSIGNMENT_STOCK` are taken **only** from the company default GL code link and each **throws** `MISSING_DEFAULT_GL_CODE: <code>` when unmapped. The creditor mapping throws the same way | `JournalPostingService` L326–L346, L400–L414, L436–L450 |
| Stock processor | None. Quantity signum 0 writes no inventory transaction line and changes no balance | `StockBalanceHelper` treats the balance as quantity × quantity signum |
| What VOID reverses | `updatePostingStatusToNonFinal` queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, which fans out to the subscribed void processors — the journal is reversed, knocked-off GRN lines are reopened, contra is reversed, and the document is removed from the e-invoice queue and from historical aging. There are no stock lines to reverse | `GenericDocumentService` L663–L706 |

Two consequences worth knowing. First, a Consignment GRN posts **credit** `CONSIGNMENT_LIABILITY` /
**debit** `CONSIGNMENT_STOCK`; this document posts exactly the opposite pair, which is how the
consignment holding is cleared as stock is bought. If a company is missing either default GL code
the GRN and the billing document both fail at FINAL with the same message. Second, because the
document total drives that pair, billing a *part* of a GRN clears only that part of the holding —
the rest stays as consignment stock against consignment liability until it is billed or returned.

## Related applets

- [Consignment GRN (Internal)](/applets/inventory-workflow/internal-consignment-grn-applet/) — the source of the lines this document bills; its open lines are what the KO For grid reads, and it cannot be voided once billed.
- [Consignment GIN (Internal)](/applets/inventory-workflow/internal-consignment-gin-applet/) — the outbound half of the consignment stock pair.
- [Consignment Return (Internal)](/applets/purchase-workflow/internal-consignment-return-applet/) — the alternative to billing: send the stock back instead of buying it.
- [Consignment Purchase Order](/applets/purchase-workflow/internal-consignment-purchase-order-applet/) — orders consignment stock from the consignor.
- [Consignor Purchase Billing (Internal)](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) — the period-level record of what is owed to a consignor; writes its own tables and posts nothing.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the applet this one is cloned from; the file-import endpoint is shared with it.
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — a link to one of these blocks VOID.
- [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/) — the sales-side consignment record, for stock you own that sits at someone else's location.
- [Supplier](/applets/master-data/supplier-applet-1/) — the consignor.
- [Organisation](/applets/master-data/organisation-applet/) — branches, locations, document numbering, knock-off configuration and the company posting configuration.
- [Chart of Accounts](/applets/master-data/chart-of-account-applet/) — the `CONSIGNMENT_LIABILITY`, `CONSIGNMENT_STOCK`, `PURCHASE`, `INPUT_TAX` and creditor default GL codes.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — line tax codes.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the items the add-line search returns.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| KO For → Consignment Purchase GRN grid is empty although finalised consignment GRNs exist | The company has no **enabled** knock-off flow from `INTERNAL_PURCHASE_CONSIGNMENT_GRN` to `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`, so nothing was written to the line open queue | Enable the flow in Organisation → Company → Knock Off Configuration, then re-finalise or repair the queue |
| KO For grid goes empty as soon as you use its advanced search | The search sub-query filters on `server_doc_type_1 = 'INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE'` while the grid itself loads `INTERNAL_PURCHASE_CONSIGNMENT_GRN`; the two sets never intersect (`knock-off-grn.component.ts` L555) | Clear the search and filter with the grid's own column filters instead. Recorded as **P-0131** |
| *The selected document contains a different entity/branch compared to the previous document* | A second KO row was picked whose supplier or branch differs from the first (`knock-off-grn.component.ts` L360–L380) | Raise one billing document per supplier and branch |
| FINAL fails with `MISSING_DEFAULT_GL_CODE: CONSIGNMENT_LIABILITY` or `: CONSIGNMENT_STOCK` | Neither code falls back to a line or header GL code — both are read only from the company default GL code links, and both throw when absent | Map both in [Chart of Accounts](/applets/master-data/chart-of-account-applet/) |
| FINAL fails with `MISSING_DEFAULT_GL_CODE` naming a creditor code | The supplier's AR/AP type resolves to a transaction code that has no company default GL code | Map it, or correct the supplier's AR/AP type |
| FINAL fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` | A purchase or tax line could not resolve any GL code (line, header, item-company link and company default all empty) and was silently dropped from the journal | Set the GL code on the line, on the item-company link, or as a company default |
| *This document has been posted* on pressing FINAL | The document is already `FINAL` | Refresh the listing |
| *This document has not been finalized yet* on pressing VOID | The posting status is not `FINAL` | Use DISCARD for a draft |
| *The invoice has already been linked with a purchase return* on pressing VOID | An `ACTIVE` document link joins this document to an `INTERNAL_PURCHASE_RETURN` | Void the purchase return first |
| *The currency rate cannot be ZERO.* on SAVE | The document currency differs from the base currency and the rate is 0 | Enter a rate, or clear `CANNOT_EDIT_CURRENCY_RATE` if the field is locked |
| *No Default Printable Selected* after a successful FINAL | `ENABLE_AUTO_POPUP` is on but no `PRINTABLE` default is set | Set one under Settings → Printable Format Settings |
| SINGLE/MULTIPLE PRINT is greyed out | Same cause — the button is disabled while `PRINTABLE` is unset | As above |
| The Issue Link tab always shows one row of sample data | The grid is a mock with hard-coded data | Ignore the tab; it does nothing. **P-0132** |
| A `HIDE_*` setting hides a field for everyone including administrators | The paired `SHOW_*` client-side permission has no definition row for this applet, so it can never be granted | Switch the setting back off; there is no per-role exception. **P-0134** |
| No tab-hide toggles on Application Settings | The shared screen renders tab toggles only for applet codes in its `tabMappings`, and this one is absent | The keys keep whatever value the tenant already holds; there is no supported way to set them from the UI. **P-0133** |
| Knock Off Settings cannot be found in the settings menu | Its menu entry is commented out although the route exists | Use Organisation → Company → Knock Off Configuration, which is what the tabs actually read |

## Related documentation

- [Consignment purchasing guide](/guides/purchasing-guides/consignment-purchasing/) — the end-to-end consignment process in user-guide voice.
- [Purchasing module](/modules/purchasing/) and [Financial Accounting module](/modules/financial-accounting/).
