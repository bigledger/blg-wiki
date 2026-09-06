---
title: "Blanket Purchase Order Supplier Access"
description: "Reference for the supplier-facing copy of the Blanket Purchase Order applet: a login linked to a supplier entity lists the blanket agreements raised on that supplier, opens them read-only, exports a PDF and runs two supplier-scoped reports."
applet_code: "blanketPurchaseOrderAppletSupplierAccess"
page_type: applet
applet_repo: "blg-applet-wavelet-blanket-purchase-order-applet-supplier-access"
modules: [purchasing]
related_applets:
  - blanket-purchase-order-applet
  - internal-purchase-order-supplier-access-applet
  - internal-purchase-order-applet
  - supplier-delivery-order-applet
  - supplier-applet-1
  - organisation-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/app.routing.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/models/menu-items.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/settings-container/application-settings/application-settings.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/settings-container/application-settings/application-settings.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-shared-utilities/modules/session/session-controller/reducers/session.reducers.ts
  fields:
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-listing/blanket-purchase-order-listing.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-listing/blanket-purchase-order-listing.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-view/blanket-purchase-order-view.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-view/blanket-purchase-order-view.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-view/export/export.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create-main/blanket-purchase-order-create-main.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create-main/blanket-purchase-order-create-main.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create-account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create-line-items/blanket-purchase-order-create-line-items.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-report/blanket-purchase-order-report.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/components/blanket-purchase-order-container/blanket-purchase-order-detailed-report/blanket-purchase-order-detailed-report.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/services/blanket-purchase-order-pages.service.ts
  lifecycle:
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/blanket-supplier-access-services/blanket-purchase-order.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/blanket-purchase-order-supplier-access-dashboard-by-login.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/BlanketPurchaseOrderReportController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/BlanketPurchaseOrderReportUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/user/UserPermissionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalCustomInternalBlanketPurchaseOrderDataConsistencyObject.java
  troubleshooting:
    - blg-applet-wavelet-blanket-purchase-order-applet-supplier-access/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet-supplier-access/src/app/state-controllers/blanket-purchase-order-controller/store/effects/blanket-purchase-order.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/user/UserPermissionService.java
    - gh:bigledger/blg-applet-wavelet-blanket-purchase-order-applet-supplier-access#1
    - gh:bigledger/blg-applet-wavelet-blanket-purchase-order-applet-supplier-access#2
tags:
  - purchase-workflow
  - blanket-purchase-order
  - supplier-access
  - supplier-portal
  - procurement
  - reporting
weight: 205
date: 2026-04-08
lastmod: 2026-09-06
draft: false
---

## Overview

**Blanket Purchase Order Supplier Access** is the supplier-facing copy of the [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) applet. It is installed in the buying organisation's tenant and opened by a login that has been linked to a supplier entity; that login sees only the blanket agreements raised on *its own* entity, opens them read-only, exports a PDF, and runs two supplier-scoped reports that show how much of each agreement has already been drawn down by purchase orders.

The applet reads the same document as the buyer-side applet — server document type `INTERNAL_BLANKET_PURCHASE_ORDER` — through the *login-entity* endpoints, which filter rows by the entity behind the login instead of by tenant permissions. Nothing in this applet writes: the create screen has no reachable entry point, the Save buttons on the view and line-item screens are commented out of the templates, and DELETE is permanently disabled.

{{< callout type="warning" >}}
This applet does not create, edit, acknowledge or delete blanket agreements. Earlier versions of this page described a create flow and editable lines; neither exists in the shipped code (`blanket-purchase-order-listing.component.html` L10–L14, `blanket-purchase-order-view.component.html` L13–L17 and L47).
{{< /callout >}}

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules/purchasing/) | Supplier-facing end of the blanket-agreement chain. |
| The document | [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) | Same `bl_fi_generic_doc_hdr` rows, same document type. Buyers create and finalise there. |
| Upstream (access) | [Supplier](/applets/master-data/supplier-applet-1/) | The supplier's login must be linked to the supplier entity (`bl_fi_mst_entity_login_subject_link`) before anything appears here. |
| Drawn down by | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | The reports join each agreement line to the PO lines that knocked it off, and show PO quantity, balance quantity and PO amount. |
| Sibling supplier applets | [Purchase Order Supplier Access](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/), [Purchase GRN Supplier Access](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) | The same login-link filter, applied to the other purchase-side documents. |

## Screens and menus

The sidebar has three working menus plus **Settings** and **Personalization** (`menu-items.ts`):

| Menu | Route | What it is |
|---|---|---|
| **Blanket Purchase Order** | `blanket-purchase-order` | The listing, and the read-only document view behind it. |
| **Report** | `blanket-purchase-order-report` | A second grid over the same listing query, with a fixed seven-column layout. |
| **BPO Detailed Report** | `blanket-purchase-order-detailed-report` | Date-ranged agreement-versus-PO report (see below). |
| **Settings** | `settings/…` | Application Settings, Field Settings, Default Selection, Printable Format Settings, plus Webhook, Feature Visibility and the permission listings. |
| **Personalization** | `personalization/personal-default-selection`, `…/sidebar` | Per-user Default Selection and sidebar order. |

### Listing

Columns, in order: **BPO No, Company, Branch Code, Supplier Name, Amount, Updated Date, Created Date, Transaction Date, Purchaser, Created By, Status**. The grid is server-side, sorted by `updated_date` descending, and each of the eleven columns can be hidden by an Application Setting (see *Configuration*).

Only two things happen on this screen: **Advanced Search** (BPO No, Company, Supplier Name, Amount, Created Date from/to, Transaction Date from/to) and clicking a row, which opens the document view. The create (`+`) button that other document applets carry is commented out of the template.

Each row is enriched with five extra calls — company, branch, location, the creator's profile name, and the entity named in the `PURCHASE AGENT` extension row. Each call is individually caught: when one fails, the cell shows the returned error code instead of the value, which is why a supplier login that lacks company or branch read rights sees error codes in the **Company**, **Branch Code** or **Purchaser** columns while the rest of the row is correct.

{{< figure src="/images/blanket-purchase-order-supplier-access-applet/report-tab-search-by-filter.png" alt="Blanket Purchase Order Supplier Access Report Listing with the advanced search panel open" caption="The Report screen with its advanced search panel. The sidebar shows the applet's three menus." >}}

### Document view

Opening a row shows **View Blanket Purchase Order** with four tabs:

| Tab | Contents |
|---|---|
| **Main** | Branch, Company and Location drop-downs, Start Date (read-only), Status, Reference No., Validity, Purchase Agent, Remarks. |
| **Supplier Info** | Entity Id, Entity Name, Email, Phone Number, Supplier Type — all read-only except Entity Id, which has no save path. |
| **Line Items** | Item Code, Item Name, Valid Date, UOM, Unit Price, Qty, Txn Amount. Clicking a line opens a detail pane. |
| **Export** | **EXPORT AS PDF** works; **EXPORT AS CSV**, **EXPORT AS DOCX** and **EXPORT AS ZIP** are disabled in the template. |

The **DELETE** button under the tabs carries `disabled="true"` and can never be pressed. The **RESET**, **Print** and **Save** buttons that the buyer-side applet shows in the same header are commented out here, so edits made in the Main tab or through *Add Line Item* live in the browser only and are lost when you leave the screen.

### Reports

**Report** re-runs the listing query and shows a fixed seven columns: BPO No, Company, Supplier Name, Amount, Created Date, Created By, Status. It has no date filter of its own; use its advanced search.

**BPO Detailed Report** posts a start and end date to a dedicated backend report and groups the result by BPO Number, Date, Item and Qty. Its columns are **BPO Number, Date, Item, Qty, Category, Purchaser, Unit Price, Total Amount, PO Qty, Balance Qty, PO Amount**, where PO Qty is the quantity already knocked off by purchase orders (`bl_fi_generic_doc_link.quantity_contra`), Balance Qty is agreement quantity minus that, and Category is the label linked to the supplier login. The date range defaults to the start of the month two months ago through today, and the report is run once when the screen opens.

{{< figure src="/images/blanket-purchase-order-supplier-access-applet/BPO detailed report tab.png" alt="BPO Detailed Report with Start Date, End Date and Generate Report" caption="BPO Detailed Report: set Start Date and End Date, then Generate Report. The grid is capped at 500 agreements per run." >}}

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters |
|---|---|---|
| The supplier's login is linked to the supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) → Login (`bl_fi_mst_entity_login_subject_link`, status `ACTIVE`) | Every query in this applet filters `hdr.doc_entity_hdr_guid` by the entities linked to the logged-in subject. No `ACTIVE` link, no rows — whatever permissions the login holds. |
| The applet is installed for that login | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | The applet exchanges its refresh token for an applet token at start-up; without an applet link the screens never load. |
| Blanket agreements exist and are not `TEMP`/`DELETED` | [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) | The supplier sees agreements at any other status, including DRAFT. |
| A printable format for the export | [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) → Printable Format Settings | See the warning under *Printable Format Settings* — the export ignores this applet's own printable-format list. |

### Applet settings

Settings for this applet are **applet-local**: `app.routing.ts` binds `field-settings` to a `FieldConfigurationComponent` inside the applet itself, not to the shared `FieldConfigurationComponent` in `blg-shared-utilities`. The shared Application Settings screen and its `HIDE_*` catalogue therefore do not apply here, and neither does the inline settings gear used by the larger document applets.

**Application Settings** (`settings/application-settings`) is the only screen that changes behaviour. It holds eleven toggles, one per listing column; each is declared in `AppletSettings`, rendered with a `[formControl]`, saved into the applet's `APPLET_SETTINGS` extension row (`bl_applet_ext`, merged with whatever is already stored) and read by the listing. They are tenant-wide for the applet install, so a tenant administrator sets them once for every supplier login. The toggles carry the raw identifier as their label in the UI.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_BPO_NO` | The **BPO No** column | Off (undefined ⇒ column shown) | Hides the agreement number from the listing grid. |
| `HIDE_COMPANY` | The **Company** column | Off | Hides the buying company code. |
| `HIDE_BRANCH_CODE` | The **Branch Code** column | Off | Hides the buying branch code. |
| `HIDE_SUPPLIER_NAME` | The **Supplier Name** column | Off | Hides the supplier entity name. |
| `HIDE_AMOUNT` | The **Amount** column | Off | Hides the transaction amount. |
| `HIDE_UPDATED_DATE` | The **Updated Date** column | Off | Hides the last-updated date. |
| `HIDE_CREATED_DATE` | The **Created Date** column | Off | Hides the creation date. |
| `HIDE_TRANSACTION_DATE` | The **Transaction Date** column | Off | Hides the document date. |
| `HIDE_PURCHASER` | The **Purchaser** column | Off | Hides the purchase-agent entity name. |
| `HIDE_CREATED_BY` | The **Created By** column | Off | Hides the buyer-side user who created the agreement. |
| `HIDE_STATUS` | The **Status** column | Off | Hides the document status. |

The column layout is applied once, in the listing's `ngOnInit`. A change made in Application Settings therefore shows up the next time the listing screen is opened, not while it is on screen.

{{< callout type="warning" >}}
**Field Settings does nothing.** The applet-local *Field Settings* screen renders eight slide toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) and a **SAVE** button. None of the toggles is bound to a form control and the button has no click handler — the screen is a mock-up that neither loads nor stores anything.
{{< /callout >}}

**Read at runtime with no control anywhere:** `salesManLabels` (passed to the Purchase Agent picker on the Main tab) and the `DEFAULT_BRANCH` / `DEFAULT_LOCATION` / `PRINTABLE` / `ENABLE_*` / custom-status keys declared in `AppletSettings`. They are part of the shared document-applet model that this applet was forked from; no screen in this applet renders or writes them.

**Default Selection** and **Personalization → Default Selection** exist as routes and screens, but only the create flow consumes their values, and the create flow is unreachable — see *Screens and menus*.

### Document behaviour settings

Not applicable. No status flow, posting, workflow or e-Invoice option is exposed by this applet: it has no Workflow Settings route (unlike its buyer-side counterpart), and no screen sends a status change.

### Printable Format Settings

{{< callout type="warning" >}}
The **EXPORT AS PDF** button does not use the printable format list on this screen. The print effect passes a hard-coded printable-format GUID and the print service class `BLANKET_PURCHASE_ORDER_JASPER_PRINT_SERVICE`, with a `TODO: Remove hardcoded value after UAT` note beside it (`blanket-purchase-order.effects.ts`, `printJasperPdf$`). On a tenant where that GUID does not exist the export fails with a toast and no PDF; adding or editing formats in this applet's Printable Format Settings has no effect on the output.
{{< /callout >}}

### Feature visibility and permissions

The registry holds **no client-side permission definitions** for `blanketPurchaseOrderAppletSupplierAccess` (`bl_applet_client_side_perm_dfn`, queried 2026-09-06), so the Client Side Permission and Feature Visibility screens have nothing to grant. The `SHOW_*` line-column permissions that the other supplier-access applets carry do not exist for this one.

What actually gates data is the backend:

| Path used by | Endpoint | Check |
|---|---|---|
| Listing, Report | `GET …/internal-custom-internal-blanket-purchase-orders/login-entity-ep/query` | Rows are filtered to entities linked to the login (`ACTIVE` link). No permission check runs — the row filter replaces it. |
| BPO Detailed Report | `POST …/gen-doc/blanket-purchase-report/bpo/login-entity-ep` | Same entity filter, applied in the report SQL. Capped at 500 rows. |
| EXPORT AS PDF | `GET …/print-jasper-pdf/login-entity-ep/{guid}` | Same family of endpoints. |

Two server-side permissions still matter indirectly: the listing's per-row enrichment calls the Company, Branch, Location and Entity read endpoints, which *are* permission-checked, and the applet-token exchange requires the applet to be installed for the login.

## Fields

The document view reuses the create screens in read-only mode; the tables below are the controls that render.

### Main tab

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Branch | Buying branch | Yes (validator) | Drop-down; the value comes from the stored document. |
| Company | Buying company | Yes (validator) | Drop-down. |
| Location | Stock location on the agreement | Yes (validator) | Drop-down, filtered by the selected branch. |
| Start Date | Agreement start | No | Rendered read-only; defaults to today in an unsaved form. |
| Status | Document status | Yes (validator) | Status widget. Editable in the form but nothing saves it. |
| Reference No. | Buyer's reference | No | Free text. |
| Validity | Validity of the agreement | Yes (validator) | Free text. |
| Purchase Agent | Buyer's purchasing agent | Yes (validator) | Entity picker; labels come from `salesManLabels`. |
| Remarks | Free-text note | No | Text area. |

### Supplier Info tab

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Entity Id | Supplier entity code | No | The only control not marked read-only, with no save path. |
| Entity Name | Supplier name | No | Read-only. |
| Email | Supplier e-mail | No | Read-only. |
| Phone Number | Supplier phone | No | Read-only. |
| Supplier Type | Supplier classification | No | Read-only. |

### Line Items grid

| Column | Source | Notes |
|---|---|---|
| Item Code / Item Name | `item_code`, `item_name` | |
| Valid Date | `category` | The column header and the underlying field disagree; the grid shows the line's category value. |
| UOM | `item_property_json.uom` | |
| Unit Price | computed | Displays `(amount_net + amount_discount) / quantity_base`; the column is bound to `quantity_base`, so a line with zero quantity renders `Infinity` or `NaN`. |
| Qty | `quantity_base` | |
| Txn Amount | `amount_txn` | |

## Lifecycle and effects

A Blanket Purchase Order carries no money and no stock, and this applet writes nothing at all. The posting proof block below is the buyer-side document's, repeated here because the supplier sees the same rows.

| Property | Value |
|---|---|
| Server document type | `INTERNAL_BLANKET_PURCHASE_ORDER` (client document type identical) |
| Amount signum | 0 (`InternalCustomInternalBlanketPurchaseOrderDataConsistencyObject`) |
| Quantity signum | 0 |
| Dr/Cr equation | None. FINAL posts no journal. |
| GL precedence | Not applicable — no journal line is produced. |
| Stock processor | None. No inventory transaction line is written. |
| What VOID reverses | Nothing to reverse; VOID only releases the knock-off queue rows on the buyer side. |

What the supplier login can and cannot reach:

| Action | Endpoint the applet calls | Result |
|---|---|---|
| List / search / report | `login-entity-ep/query` | Works. Filtered to the login's entities; documents at status `TEMP` or `DELETED` are excluded unless a status is named in the search criteria. |
| Open a document | none — the view is rendered from the row already in the grid | Works without any read permission. |
| Export PDF | `print-jasper-pdf/login-entity-ep/{guid}` | Works when the hard-coded printable format exists. |
| Create, Save, Delete | `POST`/`PUT`/`DELETE` on the plain back-office path | Unreachable in the UI. The effects exist and would call the permission-checked back-office endpoints, not the login-entity ones, so even a re-enabled button would need full tenant document permissions. |

The backend does offer a supplier-side write path for generic documents — `PUT …/{docType}/login-entity-ep`, which authorises by checking that the login is linked to the document's entity (`UserPermissionService.isUserLoginEntity`) — but this applet never calls it.

## Related applets

- [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) — where the agreement is created, finalised and voided.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — draws down the agreement; its knock-off quantities are what the detailed report's PO Qty and Balance Qty columns show.
- [Purchase Order Supplier Access](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/) — the same supplier login, for the orders raised against the agreement.
- [Supplier](/applets/master-data/supplier-applet-1/) — where the supplier entity and its login link are maintained.
- [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) — the write-capable supplier applet, for comparison.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The listing is empty although the buyer says agreements exist | The login has no `ACTIVE` row in `bl_fi_mst_entity_login_subject_link` for the supplier entity, or the agreements were raised on a different entity record for the same supplier | Link the login to the supplier in the [Supplier](/applets/master-data/supplier-applet-1/) applet; confirm the agreements' supplier is that same entity. |
| **Company**, **Branch Code**, **Purchaser** or **Created By** show a code such as `CLIENT_AUTH_USER_NOT_AUTHORIZED` | Those cells come from separate Company / Branch / Location / Entity / profile calls, which *are* permission-checked; each failure is caught and the error code is printed in the cell | Grant the supplier login read access to those master-data endpoints, or hide the columns with `HIDE_COMPANY` / `HIDE_BRANCH_CODE` / `HIDE_PURCHASER` / `HIDE_CREATED_BY`. |
| **EXPORT AS PDF** shows a failure toast and downloads nothing | The export sends a hard-coded printable-format GUID, not the format configured for the tenant | Report it; there is no supported workaround from the applet. Add the printable format the code expects, or export from the buyer side. |
| Hiding a column in Application Settings changes nothing | The column layout is applied once in the listing's `ngOnInit` | Leave the listing and come back, or reload the applet. |
| An edit in the Main tab or an added line disappears | No Save path exists — the header Save button and the line-item SAVE button are commented out, so changes stay in the browser store | Ask the buyer to make the change in the [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) applet. |
| The **DELETE** button never responds | It is hard-disabled in the template | Expected. Deletion is a buyer-side action. |
| BPO Detailed Report is empty for a period you know has activity | The date range filters `date_txn`, not the created date, and the result is capped at 500 agreements | Narrow the range, and check the transaction dates on the agreements rather than when they were entered. |
| A line shows `Infinity` or `NaN` under **Unit Price** | The Unit Price column divides by `quantity_base`; a zero-quantity line divides by zero | Ask the buyer to correct the line quantity. |

## Related documentation

- [Blanket Purchase Order applet](/applets/purchase-workflow/blanket-purchase-order-applet/) — the buyer-side reference for the same document.
- [Purchasing module](/modules/purchasing/)
- [Supplier applet](/applets/master-data/supplier-applet-1/) — the login link that switches this applet on.
