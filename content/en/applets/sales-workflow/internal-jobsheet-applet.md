---
title: "Job Sheet (Internal)"
applet_code: "Internal_job_sheet"
applet_repo: "blg-applet-wavelet-internal-jobsheet-applet"
description: "Reference for the Job Sheet (Internal) applet: the service record for a job — who, which unit, which technician, which parts and labour — with payment, contra and workflow status. It moves no stock and posts no journal."
page_type: applet
modules: [sales-crm, financial-accounting]
related_applets: [internal-sales-inquiry-applet, internal-sales-invoice-applet, internal-sales-invoice-no-stock-out-applet, internal-receipt-voucher-applet, car-workshop-applet, workflow-design-applet, customer-applet, employee-applet, inv-item-maintenance-applet, organisation-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/settings-container/branch-settings/
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/settings-container/workflow-settings-container/
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts (tabMappings, getTabValue)
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  fields:
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/internal-jobsheet-container/internal-jobsheet-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/internal-jobsheet-container/internal-jobsheet-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/internal-jobsheet-container/internal-jobsheet-create/search/
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/internal-jobsheet-container/internal-jobsheet-edit/internal-jobsheet-edit.component.ts
  lifecycle:
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/internal-jobsheet-container/internal-jobsheet-edit/internal-jobsheet-edit.component.ts
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/state-controllers/internal-jobsheet-controller/store/effects/internal-jobsheet.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalJobsheetDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  troubleshooting:
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/internal-jobsheet-container/internal-jobsheet-edit/internal-jobsheet-edit.component.ts
    - blg-applet-wavelet-internal-jobsheet-applet/micro-fe/projects/wavelet-erp/applets/internal-jobsheet-applet/src/app/components/internal-jobsheet-container/internal-jobsheet-edit/convert/convert.component.html
tags:
- jobsheet
- service
- workshop
- field-service
weight: 200
lastmod: 2026-09-06
draft: false
---

## Overview

**Job Sheet (Internal)** is the service record for a job: which customer, which unit is being worked
on, which technician has it, which parts and labour went into it, and what the customer paid. It is
the document a workshop or field-service team fills in while the work is happening, and the source
document a sales invoice is later raised from.

{{< callout type="warning" >}}
**A job sheet moves no stock and posts no journal.** `INTERNAL_JOBSHEET` carries quantity signum 0
and amount signum 0 (`ServerDocTypes.java:66` — `INTERNAL_JOBSHEET(0,0)` — and
`InternalJobsheetDataConsistencyObject.java:16-17`), and the type has no entry in
`JournalPostingTypeHandler`. Parts listed on the **Lines** tab are **not** deducted from inventory
when you click FINAL. Stock and revenue move on the downstream document —
[Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), which carries
quantity signum −1 and does post a journal.
{{< /callout >}}

## Where it fits

| | Document | What it does |
|---|---|---|
| Upstream | A customer walking in with a unit, or a [Car Workshop](/applets/sales-workflow/car-workshop-applet/) consultation | The job sheet's **Search** tab finds the unit by serial number or by an earlier service note |
| This applet | **Job Sheet (Internal)** | Records the job. No stock, no journal. |
| Payment taken on the job | Settlement lines written as `INTERNAL_RECEIPT_VOUCHER` on the **Payment** tab | See [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) |
| Downstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) | Bills the job; this is where stock and the journal move |

## Screens and menus

Three menu entries:

| Menu item | Route | What it shows |
|---|---|---|
| **Job Sheet** | `internal-jobsheet` | The listing, and the create/edit panel |
| **Line Items** | `line-items` | Cross-document listing of job-sheet lines |
| **JO Line with SI KO** | `jo-line-with-si-ko` | Job-order lines matched against sales-invoice knock-offs |

### The edit panel's twelve tabs

| Tab | Hidden by |
|---|---|
| Search | — (always present on edit; on create it is gated by `HIDE_SEARCH_TAB`) |
| Main Details | — |
| Account | — |
| Lines | — |
| Delivery Details | `HIDE_DELIVERY_DETAILS_TAB` |
| Payment | `HIDE_MAIN_PAYMENT_TAB` |
| Department Hdr | `HIDE_DEPARTMENT_HDR_TAB` |
| Contra | `HIDE_MAIN_CONTRA_TAB` |
| Doc Link | `HIDE_DOC_LINK_TAB` |
| Attachments | `HIDE_ATTACHMENT_TAB` |
| Export | `HIDE_EXPORT_TAB` |
| Convert | `HIDE_CONVERT_TAB` |

**Search** is the tab that makes this applet a service tool rather than a generic document. It has two
sub-tabs — **Serial Number** and **Service Note** — so you can start from the unit in front of you:
find the serial number, and the applet jumps you to the Account tab with the owner already resolved,
or pick an earlier service note for the same unit.

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-main-details-tab.png" alt="The Main Details tab of a job sheet, showing Doc Short Code JOBSHT, Branch and Location marked required, Techniqian, Sales Lead, Workflow Status and Workflow Resolution" caption="Main Details. Branch and Location are the only two fields the form validates as required; Status defaults to ACTIVE. The technician picker is labelled *Techniqian* in the product." >}}

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why |
|---|---|---|
| A branch and a location | [Organisation](/applets/master-data/organisation-applet/) | The only two required fields on Main Details |
| Employees flagged as technicians | [Employee Maintenance](/applets/master-data/employee-applet/) | The **Techniqian** picker is a sales-agent picker in technician mode |
| Items for parts and labour | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | The Lines tab searches the item master |
| A workflow process, *only* if you want a status track | [Workflow Design](/applets/master-data/workflow-design-applet/) | Populates **Workflow Status** and **Workflow Resolution**. This is a status track filtered by role — **not** an approval flow. |

### Where settings live

`settings/field-settings` routes to the **shared** `FieldConfigurationComponent` from
`blg-shared-utilities`, and `Internal_job_sheet` **is** one of the codes in that screen's
`tabMappings` — so unlike some sibling applets, its optional sections do render. Nine sections are
turned on for this code: Search, Delivery Details, Payment, Department Hdr, Contra, Doc Link,
Attachments, Export and Convert.

The applet adds two settings screens of its own:

| Screen | Route | What it does |
|---|---|---|
| **Branch Settings** | `settings/branch-settings` | Per-branch overrides, chosen from a branch listing |
| **Workflow Settings** | `settings/workflow-settings` | Attaches a workflow process per company (`WORKFLOW_PROCESS_GUID`) |

**Default Selection** (`settings/default-selection`) has two controls only: Default Branch and Default
Location. **Personalization → Default Selection** offers the same per user, plus the shared Sidebar
editor. Printable Format Settings, Webhook, Feature Visibility, a permission wizard and the five
permission screens are also routed.

### Applet settings that actually render

The applet declares 127 keys; **72** of them have a control on the shared Application Settings screen
for this applet code. Grouped by what they do:

| Group | Keys |
|---|---|
| Buttons on the edit screen | `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON` |
| Tabs | `HIDE_SEARCH_TAB`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_CONVERT_TAB` |
| Main Details fields | `HIDE_CREDIT_TERMS`, `HIDE_CURRENCY`, `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID`, `HIDE_MEMBER_CARD`, `HIDE_SALES_AGENT`, `HIDE_MAIN_DETAILS_SALES_AGENT`, `HIDE_DOC_SHORT_CODE_PREFIX`, `HIDE_SERVER_DOC_TYPE`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT`, `DISABLE_LINES_FOLLOWING_HDR_SALES_AGENT` |
| Card payment fields on the Payment tab | `HIDE_CARD_NO`, `HIDE_CARD_TYPE`, `HIDE_CARD_ISSUER`, `HIDE_CARD_EXPIRY`, `HIDE_CVV`, `HIDE_APPROVAL_CODE`, `HIDE_NAME`, `HIDE_BATCH`, and a `MANDATORY_*` twin for each |
| Line-item columns | the `HIDE_UNIT_PRICE_*`, `HIDE_AMOUNT_*`, `HIDE_UNIT_DISCOUNT*`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_QTY_*`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LAST_PURCHASE_PRICE` family |
| Line-item sub-panels | `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_ISSUE_LINK`, `HIDE_DOC_LINK` |
| Editing rules | `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_EDIT_PAYMENT_DATE` |
| Workflow | `WORKFLOW_PROCESS_GUID` |

{{< callout type="info" >}}
**`APPROVAL_CODE` here is a card authorisation code, not a document approval.** `HIDE_APPROVAL_CODE`
and `MANDATORY_APPROVAL_CODE` sit alongside `HIDE_CARD_NO`, `HIDE_CARD_TYPE`, `HIDE_CVV` and
`HIDE_CARD_EXPIRY` on the Payment tab: they govern the authorisation code your card terminal returns.
Nothing in this applet asks anyone to approve a job sheet.
{{< /callout >}}

**Declared but with no control for this applet** (55 keys) — do not plan around them: the
`ENABLE_CUSTOM_STATUS_*` family, the `INCLUDE_*`/`ENABLE_*` dimension-and-tax family,
`DEFAULT_BRANCH`/`DEFAULT_LOCATION`/`DEFAULT_COMPANY` (set on Default Selection instead),
`DEFAULT_DECIMAL_PRECISION`, `DEFAULT_DECIMAL_STEP`, `PRINTABLE`, `JOBSHEET_DETAILS_TAB_ORDER`,
`HIDE_ACCOUNT_TAB`, `HIDE_SETTLEMENT_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_PAYMENT_TAB`,
`HIDE_KO_*`, `HIDE_SALES_LEAD`, `HIDE_CRM_CONTACT` and the `*_TAB` twins of the line sub-panels.

### Feature visibility / permissions

Twenty-four client-side permission codes are seeded for `Internal_job_sheet` in
`bl_applet_client_side_perm_dfn`; the applet checks twenty-seven. The two sets do not match:

**Checked in code but never seeded** — no role can ever be granted these, so they are permanently
false: `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`,
`SHOW_SALES_AGENT`, `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH`.

The practical consequence: the FINAL, VOID and DISCARD buttons are visible only when the
corresponding `HIDE_GENDOC_*_BUTTON` setting is off. The per-role escape hatch the code offers does
not work, because the permission it looks for does not exist.

**Seeded but never checked** — they do nothing: `INTERNAL_JOBSHEET_DISPLAY_PRICING`,
`SHOW_LAST_PURCHASE_PRICE`.

The remaining twenty-two are the usual line-column pairs (`SHOW_COSTING_DETAILS`, `SHOW_QTY_BASE`,
`SHOW_UNIT_PRICE_*`, `SHOW_AMOUNT_*`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_TRANSACTION_DATE` and so on),
each of which reopens the matching `HIDE_*` setting for a role.

## Fields

### Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Doc Short Code | Document prefix, e.g. `JOBSHT` | No | Hidden by `HIDE_DOC_SHORT_CODE_PREFIX` |
| Doc No (Tenant / Company / Branch) | The three numbering levels | No | Assigned by document numbering |
| Branch | Branch owning the job | **Yes** | `Validators.required` |
| Location | Location within the branch | **Yes** | `Validators.required` |
| Reference | Free-text reference | No | |
| Sales Agent | Agent credited with the job | No | |
| Credit Terms | Terms from the customer | No | |
| Job Sheet Date | Document date | No | |
| Techniqian | Technician assigned | No | A sales-agent picker in technician mode. The label is spelled *Techniqian* in the product. |
| Currency | Document currency | No | Marked `*` on screen but carries no `Validators.required` |
| Permit No | Permit reference | No | |
| CRM Contact | Linked CRM contact | No | |
| Sales Lead | Linked sales lead | No | |
| Member Card | Loyalty card | No | Unlike Sales GRN, this is optional here |
| Tracking ID | External tracking reference | No | |
| Status | Record status | **Yes** | Values `ACTIVE` / `INACTIVE`; defaults to `ACTIVE` |
| Remarks | Free-text note | No | |
| Workflow Status | Current step of the attached workflow | No | Empty unless a workflow process is attached in Workflow Settings |
| Workflow Resolution | Resolution code of the attached workflow | No | |

A **Related Service Notes** panel sits inside Main Details, showing Item Code and Serial Number
read-only for earlier service notes on the same unit.

### Lines

The Lines tab searches the item master and gives each line the usual sub-panels — Item Details,
Serial Number, Batch Number, Bin Number, Costing Details, Pricing Details, Issue Link. Parts and
labour are both recorded here; neither affects stock.

## Lifecycle and effects

### Statuses

Posting status runs `DRAFT` → `FINAL` → `VOID`, with `DISCARDED` as an alternative terminal state.
The record status is separately `TEMP` → `ACTIVE`.

- **SAVE** persists the document. If the record status is still `TEMP`, SAVE promotes it to `ACTIVE`
  (`internal-jobsheet-edit.component.ts:250-256`).
- **FINAL** sets posting status to `FINAL`; the form becomes read-only and RESET reports
  *This document has been posted*.
- **VOID** appears only when posting status is already `FINAL`, and only when
  `HIDE_GENDOC_VOID_BUTTON` is off (the permission escape hatch is dead — see above).
- **DISCARD** and **DELETE** are the pre-FINAL exits; DELETE takes a second confirming click.

{{< callout type="warning" >}}
**The Convert tab does not do what its button says.** The tab renders one button labelled
*CONVERT TO INTERNAL RECEIPT VOUCHER* under the hint *"This will cancel the current job sheet"*.
It emits `convertToActiveInit`, and that effect
(`internal-jobsheet.effects.ts:112-232`) rebuilds the current document with
`status = 'ACTIVE'` and `client_doc_type = INTERNAL_JOBSHEET` and PUTs it back. It creates no receipt
voucher and cancels nothing — it is the same TEMP-to-ACTIVE promotion that SAVE performs. Recorded as
a product defect; do not use the button expecting a conversion.
{{< /callout >}}

Where a receipt voucher *is* genuinely involved: the **Payment** tab writes its settlement lines with
`server_doc_type` and `client_doc_type` set to `INTERNAL_RECEIPT_VOUCHER`
(`edit-payment.component.ts:586-640`). That is how money taken at the counter against a job is
recorded.

### Posting proof

| | |
|---|---|
| Server document type | `INTERNAL_JOBSHEET` |
| Amount signum | **0** |
| Quantity signum | **0** |
| Dr/Cr equation | None — no `JournalPostingTypeHandler` entry |
| GL precedence | Not applicable; no journal is produced |
| Stock processor | None — quantity signum 0, so no `bl_inv_txn_line` is written |
| What VOID reverses | The posting status only. There is nothing posted to reverse. |

Evidence: `ServerDocTypes.java:66` (`INTERNAL_JOBSHEET(0,0)`),
`InternalJobsheetDataConsistencyObject.java:16-17`, the applet's own
`models/constants/applet-constants.ts`, and the absence of `INTERNAL_JOBSHEET` from
`JournalPostingTypeHandler.java`.

## Related applets

- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — bills the job; this is where stock leaves and the journal posts.
- [Sales Invoice No Stock-Out (Internal)](/applets/sales-workflow/internal-sales-invoice-no-stock-out-applet/) — for labour-only jobs.
- [Car Workshop](/applets/sales-workflow/car-workshop-applet/) — the consultation record that can spawn a job sheet.
- [Workflow Design](/applets/master-data/workflow-design-applet/) — supplies the Workflow Status track.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — the document type the Payment tab's settlement lines carry.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| SAVE is disabled | Branch or Location is empty, or the Account tab's entity form is invalid | `disableSave()` checks exactly those two forms |
| Stock did not change after FINAL | Expected — `INTERNAL_JOBSHEET` is quantity signum 0 | Stock moves on the sales invoice raised from the job sheet |
| No journal after FINAL | Expected — the type has no journal posting handler | The invoice posts the journal |
| Workflow Status is empty | No workflow process is attached for this company | Settings → Workflow Settings, pick the company, attach a process |
| No VOID button on a FINAL document | `HIDE_GENDOC_VOID_BUTTON` is on. Granting `SHOW_GENDOC_VOID_BUTTON` will not help — that code has no definition row | Turn the setting off in Application Settings |
| *This document has been posted* on RESET | Posting status is FINAL | Use VOID if it is enabled |
| The Convert button appears to do nothing useful | It performs a TEMP→ACTIVE save, not a conversion | See the callout above |

## Related documentation

- [Sales Workflow applets](/applets/sales-workflow/)
