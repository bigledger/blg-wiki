---
title: "Sales Commission Applet"
description: "Reference for the Sales Commission applet: the cycle, the three-stage processor that turns finalised sales documents into commission reports, the payment voucher that pays them out, the exact documents and conditions the calculation uses, and the three settings that actually work."
applet_code: "salesCommissionApplet"
applet_repo: "blg-applet-wavelet-internal-sales-commission-applet"
page_type: applet
modules: [sales-crm, financial-accounting, membership]
related_applets:
  - commission-scheme-applet
  - internal-sales-invoice-applet
  - internal-sales-order-applet
  - pos-general-applet
  - internal-payment-voucher-applet
  - employee-applet
  - customer-applet
  - organisation-applet
  - chart-of-account-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  fields:
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/components/sales-commission-report-container/sales-commission-report-listing/sales-commission-report-listing.component.ts
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/components/sales-commission-report-container/sales-commission-report-edit/sales-commission-report-edit-line-items/sales-commission-report-edit-line-items.component.ts
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/components/sales-commission-cycle-container/sales-commission-cycle-listing/sales-commission-cycle-listing.component.ts
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/components/sales-commission-details-report-container/sales-commission-details-report-listing/sales-commission-details-report-listing.component.ts
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/assets/i18n/en.json
  lifecycle:
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/services/api-service.ts
    - blg-applet-wavelet-internal-sales-commission-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-commission-applet/src/app/models/constants/applet-constants.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/CommissionReportControllers/CommissionPostingBackofficeController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionReport/CommissionPostingServices.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntCommissionPermissions.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionReport/CommissionPostingServices.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialDocUow/GenericDocumentUow.java
tags:
- sales
- commission
- payout
- reporting
weight: 160
lastmod: 2026-09-06
draft: false
---

## Overview

**Sales Commission** calculates what each sales agent has earned over a period and turns the result
into a payment. It has four screens: a **Sales Commission Cycle** (the period), a **Sales Commission
Report** (the calculated result per agent per cycle), a **Sales Commission Details Report** (the
invoice-and-receipt lines behind one agent's figure), and **Payout Processing** (an Internal Payment
Voucher editor embedded in the applet).

The applet does not define commission rates. Those live in the
[Commission Scheme](/applets/membership/commission-scheme-applet/) applet, and the backend matches
each sales document against the active schemes when the cycle is processed.

{{< callout type="info" >}}
**Calculation and payment are separate.** Processing a cycle writes commission reports; no money
moves until a payment voucher is created under Payout Processing and posted. The commission report
itself is not a financial document — it posts no journal and carries no signums of its own.
{{< /callout >}}

## Where it fits

| | Applet | Relationship |
|---|---|---|
| Rates | [Commission Scheme](/applets/membership/commission-scheme-applet/) | Defines the schemes; the backend evaluates each against every candidate document |
| Source documents | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), internal sales cash bills from [POS General](/applets/sales-workflow/pos-general-applet/) | The only three document types the calculation looks at |
| This applet | **Sales Commission** | Cycle → processing → report → payout |
| Payment | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | Payout Processing edits exactly this document type (`INTERNAL_PAYMENT_VOUCHER`) |
| The agent | [Employee Maintenance](/applets/master-data/employee-applet/) / [Customer](/applets/master-data/customer-applet/) | Sales agents are entities; a report can also point at a member or an MLM member |

## Screens and menus

Four menu entries:

| Menu item | Route | What it shows |
|---|---|---|
| **Sales Commission Report** | `sales-commission-report` | Calculated commission per agent per cycle |
| **Payout Processing** | `payout-processing` | Internal payment vouchers that pay the commission |
| **Sales Commission Cycle** | `sales-commission-cycle` | The periods, and the processor that fills them |
| **Sales Commission Details Report** | `sales-commission-details-report` | The invoice-and-receipt detail behind one agent's figure in one cycle |

### Sales Commission Cycle

The listing shows **Cycle No, Company, Start Date, End Date, Created Date, Updated Date, Created By,
Updated By**. Creating a cycle asks only for a **Start Date** and an **End Date**.

Opening a cycle gives two tabs: **Main** (with a two-click DELETE) and **Processor**.

{{< figure src="/images/sales-commission-applet/sales-commission-cycle-ui.png" alt="Sales Commission Cycle listing with the Processor tab open, showing the three PROCESS buttons" caption="The Processor tab. Three stages, run in this order: Txn Lines Commission, Aggregate Commission, Commission Report." >}}

The **Processor** tab is the engine, and its three buttons must be pressed in the order shown:

| Stage | Button | What the backend does |
|---|---|---|
| 1 | **Txn Lines Commission** | Reads every candidate document in the cycle's company and date range, matches each against the active commission schemes, and writes intermediate commission transaction lines. Each document it produced lines for is then stamped `posting_sales_commission_queue = POSTED` |
| 2 | **Aggregate Commission** | Groups those transaction lines per agent for the cycle |
| 3 | **Commission Report** | Creates one commission report per agent from the transaction lines and the aggregates, with money status `ACTIVE` |

Each button is disabled while a stage is running. There is no single "run everything" button in the
UI — the backend has a combined endpoint, and a scheduled job processor exists for it, but the
applet exposes only the three stages.

**Which documents count.** The candidate query is narrow and worth knowing exactly:

- `server_doc_type` is one of `INTERNAL_SALES_ORDER`, `INTERNAL_SALES_INVOICE`,
  `INTERNAL_SALES_CASHBILL` — nothing else
- `posting_status = 'FINAL'`
- `status <> 'DELETED'`
- `posting_sales_commission_queue` is not `'POSTED'`
- `date_txn` falls between the cycle's start and end dates
- the company matches the cycle's company

That last condition is the double-payment guard: once a document has produced commission lines it is
marked POSTED and no later cycle picks it up again.

### Sales Commission Report

The listing shows **Sales Commission No., Company, Billing Cycle, Start Date, End Date, Sales Agent,
Member, MLM Member, Money, Point, Created Date, Updated Date, Created By, Updated By**.

{{< figure src="/images/sales-commission-applet/sales-commission-report-ui.png" alt="Sales Commission Report listing with a report open on the Details tab" caption="A commission report. Details is read-only; the only action is REGENERATE." >}}

Opening one gives two tabs, **Details** and **Line Item**, and one button, **REGENERATE**. The SAVE
and RESET buttons are commented out of the template: a commission report cannot be edited by hand,
only recalculated.

**Details** shows Company, Cycle, Start Date, End Date, **Money Status** and **Money**, **Point
Status** and **Point**, Sales Agent, Member and MLM Member. **Line Item** shows one row per source
document line: **Doc Type, Doc No, Commission Scheme, Money, Point, MLM Program, Item Code, Item
Name, UOM, Amount Txn** — which is where a disputed figure is traced back to the scheme that
produced it.

### Sales Commission Details Report

Two mandatory filters — **Sales Agent** and **Commission Cycle** — then **SEARCH**. The grid columns
are **Sales Agent Name, Entity Name, Receipt, EMP Rct, Rct Date, Settlement Amount, Invoice, EMP Inv,
Inv Date, Invoice Amount, Contra Date, Days, Commission Amount**: the receipt-against-invoice view,
including how many days elapsed, for commission schemes that pay on collection rather than on
invoicing.

{{< figure src="/images/sales-commission-applet/sales-commission-details-report-ui.png" alt="Sales Commission Details Report with the Sales Agent and Commission Cycle filters above an empty grid" caption="Both filters are mandatory; SEARCH stays disabled until an agent and a cycle are chosen." >}}

### Payout Processing

A listing — **Doc No, Branch, Entity Name, Currency, Payment Amount, Open Amount, Creation Date** —
over Internal Payment Vouchers, with a create and a view panel. The view has tabs **Details**,
**Account**, **Payment**, **Expenses**, **Payout For**, **Contra** and **Non GL Doc Contra**; the
create panel has Details, Account, Expenses, Payment and Non GL Doc Contra. A *Gl Doc Contra* tab is
commented out in both.

**Payout For** is the link between the two halves of the applet: it lists the commission reports this
voucher pays, with **Sales Commission Report No, Company, Cycle, Start Date, End Date, Payout (MYR),
Payout Status, Sales Agent Entity, Sales Agent Member, MLM Program, MLM Program Participant**, and an
add panel to attach more.

Because the document is a real `INTERNAL_PAYMENT_VOUCHER`, everything that applies to a payment
voucher applies here — the GL codes it needs, the journal it posts and what VOID reverses are
documented on [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/).

## Configuration

### Before you can use it

| What | Where | Why |
|---|---|---|
| At least one active commission scheme | [Commission Scheme](/applets/membership/commission-scheme-applet/) | Without one, stage 1 produces no lines and every report is empty |
| A company | [Organisation](/applets/master-data/organisation-applet/) | The cycle is company-scoped; the backend rejects a cycle with no company (`COMPANY_GUID_EMPTY`) |
| Sales agents on the source documents | [Employee Maintenance](/applets/master-data/employee-applet/) | The aggregation is per agent |
| Finalised sales orders, invoices or cash bills in the period | The sales applets and [POS General](/applets/sales-workflow/pos-general-applet/) | Drafts are ignored — only `posting_status = FINAL` counts |
| The commission server permissions on the user's role | Settings → Permission Set / Role Permission | See below; without them the PROCESS buttons return *not authorized* |
| Everything a payment voucher needs (cashbook, settlement method, GL codes) | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | Only for the payout half |

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities`
(`settings/field-settings`). An applet-local `field-configuration` component exists and its import is
commented out in `app.routing.ts` — it is dead code, and its sixteen toggles have no form bindings
anyway.

The settings menu has three entries: **Field Settings** (the shared screen), **Default Selection**
and **Printable Format Settings**. A **Release Notes** route exists with no menu entry.
Personalization has one entry, **Default Selection**.

{{< callout type="warning" >}}
**Almost none of the shared settings screen applies to this applet.** The applet's settings model
declares 35 keys. Only **three** are both rendered on the shared screen for applet code
`salesCommissionApplet` and read by the applet's own code:

| Setting | What it controls |
|---|---|
| `VERTICAL_ORIENTATION` | Renders the screens as expansion panels instead of tab strips |
| `EXPAND_MAIN_DETAILS` | In panel mode, whether the Details panel starts expanded |
| `EXPAND_LINE_ITEMS` | In panel mode, whether the Line Item panel starts expanded |

The other model keys — `INCLUDE_DIMENSION`, `INCLUDE_PROFIT_CENTER`, `INCLUDE_PROJECT`,
`INCLUDE_SEGMENT`, `INCLUDE_SST`, `INCLUDE_WHT`, their `ENABLE_*` twins, the fifteen
`ENABLE_CUSTOM_STATUS_*` keys and `salesManLabels` — appear **only** in the model file. Nothing reads
them and no control writes them. Recorded as **P-0138**.
{{< /callout >}}

**Default Selection** sets the applet-wide **Default Branch** and **Default Location**.
**Personalization → Default Selection** overrides those per user and adds **Default Language**,
**Default Toggle Column** and **Default Tab Orientation** (`DEFAULT_LANGUAGE_CODE`,
`DEFAULT_TOGGLE_COLUMN`, `DEFAULT_ORIENTATION`).

**Printable Format Settings** manages the printable formats for the applet. It filters and tags them
by transaction type **`INTERNAL_SALES_COMMISION`** — a document type that does not exist anywhere in
the backend, and which is misspelled with one `S`. Because the applet both writes and reads the same
string the screen works, but formats saved here are invisible to every other applet and to any
backend print service. Recorded as **P-0139**.

### Feature visibility and permissions

This applet has **no client-side permissions**: none are seeded in
`bl_applet_client_side_perm_dfn`, and the applet checks none. Every screen and control is visible to
anyone who can open the applet.

The real gate is server-side, and it is enforced per endpoint:

| Action | Any one of these permissions |
|---|---|
| **Txn Lines Commission** and **Aggregate Commission** | `TNT_API_SALE_COMMISSION_INTERMEDIATE_PROCESSING_TXN_LINE_ADMIN`, `…_OWNER`, `…_CREATE` |
| **Commission Report** | `TNT_API_BACKOFFICE_COMMISSION_ADMIN`, `…_OWNER`, `…_CREATE` |
| **REGENERATE** | tenant owner or admin, or `TNT_API_BACKOFFICE_COMMISSION_ADMIN` / `…_OWNER` / `…_UPDATE` |
| Reading cycles and reports | The matching `…_READ` permissions; a cycle the user has no permission on is treated as not existing |

Without them the endpoint returns *not authorized* rather than an empty result.

## Fields

### Sales Commission Cycle

| Field | Meaning | Required |
|---|---|---|
| Start Date | First transaction date in the cycle | Yes |
| End Date | Last transaction date in the cycle | Yes |
| Cycle No | Running number | Assigned |
| Company | The company the cycle belongs to | Assigned from context; the processor fails with `COMPANY_GUID_EMPTY` if absent |

### Sales Commission Report (Details tab, read-only)

Company · Cycle · Start Date · End Date · **Money Status** · **Money** · **Point Status** ·
**Point** · Sales Agent · Member · MLM Member. Money status is set to `ACTIVE` when the report is
created.

## Lifecycle and effects

| Object | What it is | What it writes |
|---|---|---|
| Sales Commission Cycle | A dated period per company | Its own cycle row. Deletable from the Main tab |
| Intermediate commission transaction lines | Stage 1 output, one per matching document line | Their own table; and stamps `posting_sales_commission_queue = POSTED` on each source document |
| Aggregate agent rows | Stage 2 output, one per agent per cycle | Their own table |
| Sales Commission Report | Stage 3 output | Its own header and lines. **No journal, no stock, no signums** — the applet's `AppletConstants` carries quantity signum 0 and amount signum 1, but the string it names (`INTERNAL_SALES_COMMISION`) is not a server document type and is used only to tag printable formats |
| Payout | An `INTERNAL_PAYMENT_VOUCHER` | A real financial document with amount signum +1 and quantity signum 0 — see [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) |

**REGENERATE** recalculates one existing commission report in place.

## Related applets

- [Commission Scheme](/applets/membership/commission-scheme-applet/) — where the rates, treatments and pricing models are defined. Nothing is calculated without an active scheme.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) — the three document types the calculation reads.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — the document Payout Processing edits, and where its posting is documented.
- [Employee Maintenance](/applets/master-data/employee-applet/) and [Customer](/applets/master-data/customer-applet/) — sales agents, members and MLM members.
- [Organisation](/applets/master-data/organisation-applet/) — companies, branches, locations and numbering.
- [Chart of Accounts](/applets/master-data/chart-of-account-applet/) — the GL codes the payout voucher needs.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Txn Lines Commission runs and produces nothing | No candidate documents: the period has no `INTERNAL_SALES_ORDER`, `INTERNAL_SALES_INVOICE` or `INTERNAL_SALES_CASHBILL` at `posting_status = FINAL`, or every one of them is already `posting_sales_commission_queue = POSTED` | Check the documents are FINAL and dated inside the cycle; a document already processed by an earlier cycle will never be picked up again |
| A commission report is empty although the sales are there | No active commission scheme matched the documents | Check the scheme's conditions and treatment in [Commission Scheme](/applets/membership/commission-scheme-applet/) |
| A document type you expect to earn commission never does | Only sales orders, sales invoices and cash bills are considered. Credit notes, refund notes, jobsheets and receipt vouchers are not | There is no setting for this |
| A late-arriving invoice is missing from the cycle | It was finalised after the cycle was processed | Run the processor again — the queue flag means already-counted documents are not double-counted |
| *THE_GUID_OF_SALES_COMMISSION_CYCLE_NOT_EXIST* | Either the cycle really is gone, or your role has no read permission on it — the backend filters by permission before reporting existence | Grant the commission read permission |
| `COMPANY_GUID_EMPTY` on any processor stage | The cycle has no company | Recreate the cycle from a context that carries a company |
| `GEN_DOC_HAS_BEEN_POSTED` | A single document was pushed through commission processing twice | Expected; nothing to fix |
| The PROCESS buttons return *not authorized* | The role holds none of the required `TNT_API_SALE_COMMISSION_INTERMEDIATE_PROCESSING_TXN_LINE_*` or `TNT_API_BACKOFFICE_COMMISSION_*` permissions | Grant one of them |
| A commission figure is disputed | Open the report's **Line Item** tab: each row names the source document and the commission scheme that produced it. For collection-based schemes use the **Sales Commission Details Report** for the receipt-to-invoice detail and the Days column | |
| SAVE and RESET are missing on a commission report | They are commented out — the report is not hand-editable | Use REGENERATE |
| SEARCH is disabled on the Details Report | Both Sales Agent and Commission Cycle are mandatory | Choose both |
| A printable format saved here does not appear anywhere else | It is tagged with the transaction type `INTERNAL_SALES_COMMISION`, which is not a real document type | Nothing to fix inside the applet. **P-0139** |
| Settings changed on Field Settings have no effect | Only `VERTICAL_ORIENTATION`, `EXPAND_MAIN_DETAILS` and `EXPAND_LINE_ITEMS` are wired for this applet | **P-0138** |

## Related documentation

- [Sales & CRM module](/modules/crm-digital/) and [Membership module](/modules/membership/).
