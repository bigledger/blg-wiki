---
title: "Sales Inquiry (Internal)"
description: "Reference for the Sales Inquiry (Internal) applet: a pre-sales document with customer, line, collection and contra detail that moves no stock and posts no journal, plus its settings, fields, the Convert action that deletes the inquiry, and the parts of the screen that are mock-ups."
applet_code: "internal_sales_inquiry_applet"
applet_repo: "blg-applet-wavelet-internal-sales-inquiry-applet"
page_type: applet
modules: [sales-crm]
related_applets:
  - internal-sales-quotation-applet
  - internal-sales-order-applet
  - internal-sales-invoice-applet
  - internal-jobsheet-applet
  - customer-applet
  - employee-applet
  - organisation-applet
  - doc-item-maintenance-applet
  - tax-configuration-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  fields:
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/internal-sales-inquiry-container/internal-sales-inquiry-create/internal-sales-inquiry-create-main/internal-sales-inquiry-create-main.component.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/internal-sales-inquiry-container/internal-sales-inquiry-create/internal-sales-inquiry-create-main/internal-sales-inquiry-create-main.component.html
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/internal-sales-inquiry-container/internal-sales-inquiry-listing/internal-sales-inquiry-listing.component.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/assets/i18n/en.json
  lifecycle:
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/internal-sales-inquiry-container/internal-sales-inquiry-view/internal-sales-inquiry-view.component.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/state-controllers/internal-sales-inquiry-controller/store/effects/internal-sales-inquiry.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesInquiryDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  troubleshooting:
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/internal-sales-inquiry-container/internal-sales-inquiry-add-line-item/add-line-item-issue-link/add-line-item-issue-link.component.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/internal-sales-inquiry-container/internal-sales-inquiry-edit-issue/edit-issue-worklog/edit-issue-worklog.component.ts
    - blg-applet-wavelet-internal-sales-inquiry-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-inquiry-applet/src/app/components/internal-sales-inquiry-container/internal-sales-inquiry-view/internal-sales-inquiry-view-export/internal-sales-inquiry-view-export.component.html
tags:
- sales-workflow
- internal-sales
- sales-inquiry
- pre-sales
weight: 15
date: 2026-04-11
lastmod: 2026-09-06
draft: false
---

## Overview

**Sales Inquiry (Internal)** records what a customer has asked about before anything is committed:
the customer, the sales agent, line items with quantities and prices, delivery detail, optional
collection and contra lines, and attachments. It sits at the front of the sales chain, before a
quotation or a sales order.

Server document type `INTERNAL_SALES_INQUIRY`. The applet is fully localised — English, Chinese,
Malay, Arabic, Hindi and Indonesian bundles ship with it — and it renders either as a tab strip or
as a stack of expansion panels, depending on the tenant's orientation settings.

{{< callout type="warning" >}}
**A sales inquiry moves no stock and posts no journal.** Its quantity signum and amount signum are
both **0** (`ServerDocTypes` L47) and the type has no entry in the journal posting handler. Setting
one to **FINAL** locks the document and nothing else. There is **no VOID** on this document — the
only ways out of a draft are DELETE (before FINAL) or CONVERT.
{{< /callout >}}

## Where it fits

| | Document | What it does |
|---|---|---|
| Upstream | — | An inquiry is normally the first document; lines can be seeded from a jobsheet, a quotation or an earlier inquiry |
| Line sources | [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/), [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/), other sales inquiries | The **Select Line Item** panel has a tab for each |
| This applet | **Sales Inquiry (Internal)** | Records the inquiry. No stock, no journal |
| Downstream | Internal Receipt Voucher | The **Convert** tab creates one — and deletes the inquiry |
| Usual next step | [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) | Raised separately once the customer commits; there is no automated conversion into either |

## Screens and menus

The left menu has two entries:

| Menu item | Route | What it shows |
|---|---|---|
| **Sales Inquiry** | `internal-sales-inquiry` | The listing, the create panel and the view/edit panel |
| **Line Items** | `line-items` | A cross-document listing of inquiry lines with its own edit panel |

### Listing

Columns: **Sales Order No**, Posting Status, Branch, Customer Name, Sales Agent, Amount Txn, Status,
Updated Date, Created Date, Transaction Date. One button above the grid, **FINAL**, which posts every
selected row whose posting status is not already `FINAL`; rows already final are skipped silently.

{{< callout type="info" >}}
The first column is labelled *Sales Order No*, not *Sales Inquiry No* — the label is inherited from
the Sales Order applet this one was cloned from. It shows the inquiry's own document number.
{{< /callout >}}

{{< figure src="/images/internal-sales-inquiry-applet/sales-line-items-tab.png" alt="Create Internal Sales Inquiry on the Line Items tab, with the Select Line Item panel open showing its four tabs" caption="The Select Line Item panel: Search Item, Jobsheet Item, Quotation Item and Previous Sales Inquiry." >}}

### Create

Seven tabs: **Main Details**, **Account**, **Line Items**, **Delivery Details**, **Collection**,
**Department Hdr**, **Contra**. Buttons: RESET and CREATE. CREATE stays disabled while the Main
Details form is invalid.

### View / edit

The same seven tabs plus **Attachments**, **Export** and **Convert**. Buttons: RESET, FINAL and SAVE
(SAVE is hidden by `HIDE_GENDOC_SAVE_BUTTON`), with a DELETE button under the tab strip that appears
only when the document is not `FINAL` and the user holds the `SHOW_DOCUMENT_DELETE_BUTTON`
permission. Once posting status is `FINAL` the Main Details form is disabled except for **Remarks**.

**Export** offers four buttons; only **Export as PDF** works. Export as CSV, Export as DOCX and
Export as ZIP are hard-disabled in the template — they are not configuration-dependent.

**Convert** shows one button, *CONVERT TO INTERNAL RECEIPT VOUCHER*, under the warning *"This will
cancel the current sales inquiry"*. The warning is literal:

1. A new document is built from this inquiry's header, with `server_doc_type` and `client_doc_type`
   set to `INTERNAL_RECEIPT_VOUCHER`, `amount_signum` −1, all amount fields zeroed, and the document
   numbers, reference, remarks, member and contact links cleared. Every other header field — including
   `posting_status` — is copied across as-is.
2. Its lines are the inquiry's **Collection** (settlement) lines. The **item lines are not carried
   over**.
3. The receipt voucher is POSTed. If that succeeds, the inquiry is **DELETEd**.

If the POST succeeds and the delete fails you keep both documents; if the POST fails nothing is
deleted and a failure toast is shown.

### Panels instead of tabs

When the tenant has `VERTICAL_ORIENTATION` on and the user's personal **Default Tab Orientation** is
not `HORIZONTAL`, every screen renders as a stack of expansion panels instead of a tab strip. Which
panels start expanded is controlled by the `EXPAND_*` settings below.

### Side panels

The applet's panel stack, in the order the pages service declares it: Internal Sales Inquiry
Listing, View, Create, Select Line Item, Select Shipping Address, Select Customer, Select Billing
Address, Add Line Item, Add Collection, Edit Line Item, Add Related Documents, Add Contra, Add
Attachments, Edit Issue, Select Member, Create Customer, Select CRM Contact, Log Time.

**Add Line Item** has its own tabs: Item Details, Costing Details (when `HIDE_COSTING_DETAILS` is off
or the `SHOW_COSTING_DETAILS` permission is granted), Pricing Details and Issue Link. The Serial
Number, Batch Number and Bin Number tabs are commented out of the template.

{{< callout type="warning" >}}
**Issue Link, Edit Issue and Log Time are mock-ups.** The Issue Link grid pushes one hard-coded row
on init (`project: 'Dummy Project'`, `issueNumber: 'ABC-123'`, an assignee's initials) and no
service is injected. Clicking that row opens **Edit Issue**, a nine-screen Jira-style sub-application
— Main Details, Planning, Attachment, Comment, Subtasks, Linked Issues, Activity, Worklog, Log Time —
in which no component makes a single HTTP call and the Worklog grid carries a hard-coded row naming a
developer. Nothing typed there is stored. Recorded as **P-0132**.
{{< /callout >}}

## Configuration

### Before you can use it

| What | Where | Why |
|---|---|---|
| Branch and location | [Organisation](/applets/master-data/organisation-applet/) | `Validators.required` on Main Details; CREATE stays disabled without them |
| A sales agent (employee) | [Employee Maintenance](/applets/master-data/employee-applet/) | `Validators.required` on Main Details |
| A currency | [Organisation](/applets/master-data/organisation-applet/) | `Validators.required` on Main Details |
| A customer entity | [Customer](/applets/master-data/customer-applet/) | Entity Id is required on the Account tab, and Credit Terms stays disabled until one is chosen |
| Document numbering for the inquiry | [Organisation](/applets/master-data/organisation-applet/) | Supplies the number shown in the listing |
| Items | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | What Select Line Item → Search Item returns |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Line tax; the selector is hidden by `HIDE_TAX_CONFIG_SELECTION` |
| A default printable format | Settings → Printable Format Settings, or Branch Settings → Printable Format | Export as PDF needs one |

No GL code is needed: this document posts nothing.

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities`, routed as
`settings/field-settings`. The applet declares a local `field-configuration` component that no route
points at — dead code.

The settings menu has four entries: **Application Settings** (the shared screen), **Default
Selection**, **Printable Format Settings** and **Branch Settings**. Personalization has one,
**Default Selection**.

The applet's settings model declares **86** keys. **31** pass all four proofs — declared, rendered on
the shared screen for applet code `internal_sales_inquiry_applet`, persisted, and read by this
applet's code:

| Group | Keys | What they control |
|---|---|---|
| Layout | `VERTICAL_ORIENTATION` | Switches every screen from tabs to expansion panels (unless the user's personal orientation is `HORIZONTAL`) |
| Which panels open | `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT` | In panel mode, which sections start expanded |
| Buttons | `HIDE_GENDOC_SAVE_BUTTON`, `SHOW_DOCUMENT_DELETE_BUTTON` | Hide SAVE on the view screen; show the DELETE button (this one is opt-in — the control appears only when the setting or the matching permission is on) |
| Line grid and item form | `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_AMOUNT_TXN`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, and the eight `HIDE_UNIT_PRICE_*` keys | Hide individual quantity, price, discount and amount columns and fields |
| Line extras | `HIDE_COSTING_DETAILS`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` | Hide the Costing Details tab, the tax and withholding-tax selectors and the pricing-scheme picker |

Each `HIDE_*` key above is paired with a `SHOW_*` client-side permission, and for this applet those
permissions **are** seeded — see below — so a tenant-wide hide can genuinely be reopened per role.

**Read at runtime with no control on the shared screen:**

- `EXPAND_CONTRA` — the Contra panel asks for this key, but the shared screen only offers
  `EXPAND_MAIN_CONTRA`. The Contra panel can therefore never be made to start expanded.
- `HIDE_DEPARTMENT_HDR_TAB` — the panel list can hide the Department Hdr section with this key, but
  its toggle on the shared screen is gated behind `showDepartmentHdrTab`, which is only set for
  applet codes listed in the screen's `tabMappings`; `internal_sales_inquiry_applet` is not one of
  them.
- `PRINTABLE`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`, `DEFAULT_LANGUAGE_CODE`,
  `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN` — set on the other settings screens below.

**Default Selection** (applet-wide) renders two controls, **Default Branch** and **Default
Location**, and saves `DEFAULT_BRANCH`, `DEFAULT_LOCATION` and `DEFAULT_COMPANY` (the company is
derived from the branch). The component also builds a `DEFAULT_LANGUAGE_CODE` form group, but no
control for it exists in the template — the applet-wide default language cannot be set from here.

**Personalization → Default Selection** overrides those for one user and adds three more controls:
**Default Language** (`DEFAULT_LANGUAGE_CODE`), **Default Toggle Column** (`DEFAULT_TOGGLE_COLUMN`,
`SINGLE` or `DOUBLE`) and **Default Tab Orientation** (`DEFAULT_ORIENTATION`, `HORIZONTAL` or
`VERTICAL`).

**Branch Settings** opens a branch listing; picking a branch opens a read-titled *View Branch
Settings* screen with five tabs — **Branch Details**, **Item Category Filter**, **Pricing Scheme**,
**Printable Format** and **Default Settlement Method**. The container's own SAVE button is commented
out; Branch Details, Item Category Filter, Printable Format and Default Settlement Method each carry
their own SAVE, and Pricing Scheme is a listing with none. A **Menu List** tab exists in the
template but is commented out.

**Printable Format Settings** manages the formats offered to Export as PDF.

### Document behaviour settings

| Behaviour | Governed by | Effect |
|---|---|---|
| SAVE visible on the view screen | `HIDE_GENDOC_SAVE_BUTTON` | Hides SAVE; the button is also disabled while Main Details is invalid |
| DELETE visible | `SHOW_DOCUMENT_DELETE_BUTTON` setting or permission, and posting status not `FINAL` | Two-click confirm (*CLICK AGAIN TO CONFIRM*) |
| Fields locked after FINAL | not configurable | The Main Details form is disabled, with Remarks re-enabled |
| FINAL from the listing | not configurable | Acts on the selection, skipping rows already `FINAL` |

There is **no approval flow, no workflow designer and no VOID** on this document.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Branch pricing scheme, item category filter, default settlement method, default printable format | This applet's own **Branch Settings**, per branch | Override the applet-wide equivalents for documents raised at that branch |
| Item master flags | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | What Search Item returns |
| Credit terms on the customer | [Customer](/applets/master-data/customer-applet/) | Populates the Credit Terms list once an entity is selected |

### Feature visibility and permissions

Twenty-three client-side permission codes are seeded for this applet and twenty-three are checked in
code — they line up almost exactly:

- Twenty-two `SHOW_*` counterparts to the `HIDE_*` line and pricing settings, plus
  `SHOW_COSTING_DETAILS` and `SHOW_TRANSACTION_DATE` (which unlocks the Transaction Date field —
  without it the date is fixed).
- One code is checked but **not** seeded: `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH`, which
  filters account-code item types out of the item search. It cannot be granted.
- `SHOW_QTY_BASE` is seeded **twice**; the duplicate row is harmless but should be cleaned up.

Server-side, the applet uses the generic-document permissions
`TNT_API_DOC_INTERNAL_SALES_INQUIRY_CREATE_TGT_GUID`, `…_READ_…`, `…_UPDATE_…` and `…_DELETE_…`.

## Fields

### Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| **Branch** | The branch the inquiry belongs to | **Yes** | `Validators.required`; drives the location list |
| **Location** | Stock location | **Yes** | `Validators.required` |
| **Sales Agent** | The employee who owns the inquiry | **Yes** | `Validators.required` |
| **Currency** | Document currency | **Yes** | `Validators.required` |
| Transaction Date | The document date | — | Editable only with the `SHOW_TRANSACTION_DATE` permission |
| Due Date | Follow-up date | — | |
| Credit Terms | Payment terms | — | Disabled until an Entity Id is chosen on the Account tab |
| Reference | Free-text reference | — | |
| Remarks | Notes | — | The one field that stays editable after FINAL |
| Permit No | Permit reference | — | |
| Sales Lead | Corporate or non-corporate | — | |
| Tracking ID | Tracking reference | — | |
| MemberCard | Loyalty member linked to the inquiry | — | Opens the **Select Member** panel |
| CRM Contact | CRM contact linked to the inquiry | — | Opens the **Select CRM Contact** panel |

A **Credit Limit** entry exists in the field list but its template case is commented out, so no
Credit Limit control renders. Group Discount and Group Discount Amount are likewise commented out.

### Account

Three sub-tabs. **Entity Details** — Entity Id (required), Entity Name, Status, Entity Type,
Identity Type, ID Number, Currency, GL Code, Description, Email, Phone Number, filled from the
selected customer. **Bill To** and **Ship To** hold the two addresses, each with its own selection
panel. A **Create Customer** panel lets you add a customer without leaving the applet.

### Line items

Item Code, Item Name, UOM, UOM-to-base ratio, pricing scheme, the eight unit-price variants,
Quantity Base, unit and amount discounts, tax and withholding-tax codes and Remarks — each hideable
by its `HIDE_*` setting and re-showable by the matching permission. Costing Details and Pricing
Details are separate tabs on the add-line panel.

### Collection and Contra

**Collection** holds settlement lines against the inquiry — and these, not the item lines, are what
the Convert action copies onto the receipt voucher. **Contra** holds offset lines.

## Lifecycle and posting

| Status (`posting_status`) | Meaning | Allowed next |
|---|---|---|
| empty / `DRAFT` | Saved and editable | `FINAL`, DELETE, or CONVERT |
| `FINAL` | Locked; only Remarks stays editable | CONVERT (which deletes the inquiry) |

Posting proof:

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_SALES_INQUIRY` | `InternalSalesInquiryDataConsistencyObject`; the applet's `applet-constants.ts` |
| Amount signum | **0** | `ServerDocTypes` L47 `INTERNAL_SALES_INQUIRY(0,0)`; `applet-constants.ts` |
| Quantity signum | **0** — no stock movement | same |
| Dr/Cr equation | None. The type has no entry in `JournalPostingTypeHandler`, and the fallback in `JournalPostingService` keys on the name containing `SALES`, so even if the journal processor were run for it every line would be skipped: `JournalPostingService` only builds journal lines where the line's amount signum is non-zero | `JournalPostingTypeHandler`; `JournalPostingService` L95–L96 |
| GL precedence | Not applicable — no journal |  |
| Stock processor | None — quantity signum 0 writes no inventory transaction line |  |
| What VOID reverses | Nothing. There is no VOID button, no void action and no `'VOID'` string in the applet | applet source |
| Document type registration | `INTERNAL_SALES_INQUIRY` is a registered generic document type with create / read / update / delete target permissions and the REST path segment `internal-sales-inquiries` | `GenericDocumentTypeHandler` L607–L613, L918 |

**FINAL** sends `{ posting_status: 'FINAL' }` from the view screen or from the listing's bulk button.
It is one-way: nothing in the applet moves a document back to draft.

**CONVERT** is the only other exit, and it removes the inquiry — see
[View / edit](#view--edit) above.

## Related applets

- [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/) — the usual next document; also a line source for Select Line Item.
- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — where a committed inquiry usually ends up; raised separately.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the eventual revenue document.
- [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) — a line source for Select Line Item.
- [Customer](/applets/master-data/customer-applet/) — the entity on the Account tab, and the Create Customer panel writes here.
- [Employee Maintenance](/applets/master-data/employee-applet/) — the required Sales Agent.
- [Organisation](/applets/master-data/organisation-applet/) — branches, locations, currencies and document numbering.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the items in Search Item.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — line tax codes.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| CREATE stays greyed out | Main Details is invalid — Branch, Location, Sales Agent and Currency are all `Validators.required` | Fill all four |
| Credit Terms is greyed out with *Entity ID must be selected first* | No customer has been chosen on the Account tab | Choose the customer first |
| Transaction Date cannot be changed | The `SHOW_TRANSACTION_DATE` client-side permission is not granted | Grant it under Settings → Client-Side Permission |
| Export as CSV / DOCX / ZIP do nothing | Those three buttons are hard-disabled in the template; only PDF is implemented | Use Export as PDF |
| Export as PDF produces nothing | No default printable format is set for the applet or the branch | Set one under Settings → Printable Format Settings, or Branch Settings → Printable Format |
| The inquiry disappeared after Convert | Convert POSTs the receipt voucher and then **deletes** the inquiry — that is what the on-screen warning means | Export the PDF first if you need a record |
| The receipt voucher created by Convert has no item lines | Convert copies the **Collection** (settlement) lines, not the item lines | Add the items to the receipt voucher directly |
| Both an inquiry and a receipt voucher exist after Convert | The receipt voucher POST succeeded but the inquiry delete failed | Delete the inquiry manually |
| Everything on a line's Issue Link tab is the same dummy row | The grid is a mock with hard-coded data, and the Edit Issue screens behind it make no HTTP calls | Ignore them. **P-0132** |
| The Contra panel never starts expanded in panel mode | The panel reads `EXPAND_CONTRA`; the settings screen only offers `EXPAND_MAIN_CONTRA` | No workaround from the UI |
| No Department Hdr toggle on Application Settings | The tab-hide toggles render only for applet codes in the shared screen's `tabMappings`, and this one is absent | The key keeps whatever value the tenant already holds |
| An item you expect is missing from Search Item | Item search filtering, possibly `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH` — which is checked in code but has no permission definition row, so it can never be turned on | Check the item in Doc Item Maintenance |
| DELETE is not offered on a draft | `SHOW_DOCUMENT_DELETE_BUTTON` is off and the matching permission is not granted, or the document is already `FINAL` | Switch the setting on; a `FINAL` inquiry cannot be deleted from the applet |
| The screen is a stack of panels instead of tabs | `VERTICAL_ORIENTATION` is on for the tenant and the user's personal Default Tab Orientation is not `HORIZONTAL` | Set Personalization → Default Selection → Default Tab Orientation to Horizontal |

## Related documentation

- [Sales & CRM module](/modules/crm-digital/)
