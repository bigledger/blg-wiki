---
title: "Budgetary Applet"
description: "Set up budget items, categories, profit centres and votebooks; open a fiscal year to create one budget register per item per month; move allocation with virements and adjustments; and read allocated versus utilised per register in the Budget Report."
applet_code: "budgetaryApplet"
applet_repo: "blg-applet-wavelet-budgetary-applet"
modules: [financial-accounting]
related_applets:
  - internal-purchase-invoice-applet
  - internal-sales-invoice-applet
  - internal-purchase-order-applet
  - developer-sysadmin-applet
  - organisation-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/app.routing.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/settings-container/general-settings/general-settings.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/shared/budget-item-category-slots/budget-item-category-slots.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/category-container/item-category-edit/items-listing/items-listing.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/resolver/permission.resolver.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-shared-utilities/utilities/budget-subline-editor/budget-subline-editor.component.ts
    - blg-shared-utilities/modules/gen-doc-simplified-ui/gen-doc-simplified-ui.component.html
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/BudgetGenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/BudgetRegisterController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/JobProcessorService.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet code budgetaryApplet — no rows)
  fields:
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/votebook-container/votebook-create/votebook-create.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/votebook-container/votebook-edit/votebook-edit.component.html
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/votebook-container/item-listing/add-item/add-item.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/votebook-container/fiscal-year-listing/fiscal-year-create/fiscal-year-create.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/items-container/item-edit/item-edit.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/items-container/item-edit/item-edit.component.html
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/category-container/item-category-create/item-cat-create.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/category-container/item-category-edit/item-cat-edit.component.html
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/group-category-container/group-category-create/item-cat-create.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/profit-center/profit-center-create/profit-center-create.component.html
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/virement/add-budget-conversion/add-budget-conversion.component.html
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/virement/add-budget-conversion/lines-listing/add-lines/add-lines.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/adjustment/budget-adjustment-add/budget-adjustment-add.component.html
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/adjustment/budget-adjustment-add/lines-listing/add-lines/add-lines.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/report-container/report-listing/report-listing.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/report-container/budget-txn-line-create/budget-txn-line-create.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/report-container/budget-txn-line-create/select-source-doc-dialog/select-source-doc-dialog.component.ts
  lifecycle:
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/state-controllers/votebook-controllers/store/effects/votebook.effects.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/state-controllers/virement-controller/effects/virement.effects.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/state-controllers/adjustment-controller/effects/adjustment.effects.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/virement/edit-budget-conversion/edit-budget-conversion.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/adjustment/budget-adjustment-edit/budget-adjustment-edit.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/BudgetGenericDocumentController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/budget/BudgetGenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/Budget/BudgetGenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/BudgetGenDocPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/BudgetGenDocRegisterTxnLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/BudgetTxnLineUpdateRegisterProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/FiGenDocBudgetRegisterTxnLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/BudgetFiscalYearRegisterProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/BudgetRegisterDeletionProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/budget/BudgetRegisterService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/budget/BudgetRegisterHelperMethods.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/budget/BudgetLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/BudgetFiscalYearPeriodService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/BudgetRegisterTxnLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/Budget/BudgetRegisterDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/GenericDocumentBudgetSubLineDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_budget_register.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_budget_register_txn_line.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_generic_doc_budget_sub_line.java
  troubleshooting:
    - gh:bigledger/blg-applet-wavelet-budgetary-applet#5
    - gh:bigledger/blg-applet-wavelet-budgetary-applet#6
    - gh:bigledger/blg-applet-wavelet-budgetary-applet#7
    - gh:bigledger/blg-applet-wavelet-budgetary-applet#8
    - gh:bigledger/blg-applet-wavelet-budgetary-applet#9
    - gh:bigledger/blg-applet-wavelet-budgetary-applet#10
    - gh:bigledger/blg-applet-wavelet-budgetary-applet#12
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/votebook-container/item-listing/add-item/add-item.component.ts
    - blg-applet-wavelet-budgetary-applet/micro-fe/projects/wavelet-erp/applets/budgetary-applet/src/app/components/report-container/report-listing/report-listing.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/BudgetTxnLineUpdateRegisterProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/FiGenDocBudgetRegisterTxnLineProcessor.java
tags:
- applets
- budgetary-module
- budget-management
- financial-planning
- cost-control
weight: 110
---

## Overview

The Budgetary Applet is where a tenant administrator sets up budget control: **what** money is budgeted for (budget items, classified through category groups and categories), **who** owns the budget (a profit centre), and the **votebook** that groups a set of items for a fiscal year. Opening a fiscal year on a votebook creates one **budget register** per item per month. Virements move allocation between registers, adjustments raise or lower a register, and finalised purchase and sales invoices that carry budget details consume it. The Budget Report shows allocated, utilised and balance per register.

It is a tenant-admin applet (registry type `TNT-ADMIN`). The day-to-day consumers of budget are the document applets: Purchase Order, Purchase Invoice and Sales Invoice (Internal) show budget fields on their lines when their own `SHOW_BUDGET` setting is on. Only the two invoices actually consume a register when they go FINAL.

## Where it fits

| Direction | Applet / component | Relationship |
|---|---|---|
| Upstream (master data) | [Organisation](/applets/master-data/organisation-applet/) | Company, branch and user context; profit centres are a shared master (`bl_fi_mst_profit_center`) that this applet creates and other applets read |
| Upstream (platform) | [Developer SysAdmin Applet](/applets/integrations/developer-sysadmin-applet/) | Job-processor subscriptions: the budget processors run only when they are subscribed to the publishing processor (see Configuration) |
| Downstream (consumes budget) | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) | Line-level budget fields or budget sub-lines; at FINAL a register transaction line is written and `actual_used_amt` moves |
| Downstream (carries budget fields only) | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Shows the same budget fields and sub-line editor, but the backend processor ignores `INTERNAL_PURCHASE_ORDER` documents — a PO never moves a register |
| Reporting | this applet, **Report** menu | Budget Report (per register) and Budget Register Txn Line Report (per transaction) |

## Screens and menus

Menu (left sidebar, `models/menu-items.ts`): **Votebook · Virement · Adjustment · Profit Center · Categories · Category Groups · Items · Report**, plus **Settings** and **Personalization**.

| Menu | Screens |
|---|---|
| Votebook | Listing (Name, Code, Status, Creation Date, Modified Date) → Create (tab *Details*) → Edit (tabs *Details*, *Item*, *Fiscal Year*; a *Budget* tab exists in the template but is commented out). *Item* tab: listing with delete, and **Add** with two sub-tabs — *Details* (tick existing items) and *Create Item*. *Fiscal Year* tab: listing with delete, Create, Edit (*Main*, *Period*) |
| Virement | Listing → Create (tabs *Details*, *Lines*) → Edit (tabs *Details*, *Lines*, *Attachments*) with **UPDATE** and **FINAL** buttons |
| Adjustment | Same layout as Virement; lines carry an *Adjustment Type* (Adjust In / Adjust Out) |
| Profit Center | Listing → Create / Edit (tab *Details*) |
| Categories | Listing → Create (tab *Main*) → Edit (tabs *Main*, *Manage Image*, *Items Listing* — the items tab lets you create, edit and list budget items that use this category) |
| Category Groups | Listing → Create (tab *Main*) → Edit (tabs *Main*, *Categories*) |
| Items | Listing (Item Code, Item Name, Item Description, Status, Creation Date, Modified Date) → Create (tab *Details*) → Edit (tabs *Details*, *Category*, *Votebook*) |
| Report | Tab *Budget Report* (one row per register, with a **utilisation chart** button and export) and tab *Budget Register Txn Line Report* (one row per transaction line, with a **create** form for manual lines) |
| Settings | *System Configuration*: Field Settings, Default Selection. *Server Side Permissions*: Permission Wizard, Permission Set, User Permission, Role Permission (Team Permission is routed but not in the menu). *Developer Tools*: Release Notes, Audit Trail (applet log). Routes for `general-settings`, `webhook` and `feature-visibility` exist but have no menu entry |
| Personalization | Default Selection, Sidebar |

![Item listing with the Create Item panel (Code and Name are mandatory)](/images/budgetary-module/budgetary-module-10.png)

![Edit Item — Category tab: one dropdown per category slot, filtered by the category group configured for that slot](/images/budgetary-module/budgetary-module-02.png)

![Category Group — Categories tab lists the categories that belong to the group](/images/budgetary-module/budgetary-module-08.png)

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Job-processor subscriptions for the budget processors | [Developer SysAdmin Applet](/applets/integrations/developer-sysadmin-applet/) (applet trigger templates and tenant trigger configuration, resolved by `JobProcessorService.getSubscriberJobProcessors`) | `BUDGET_GEN_DOC_TRANSACTION_LINE_PROCESSOR` must subscribe to `BUDGET_GEN_DOC_PRIMARY_PROCESSOR`, and `FI_GEN_DOC_BUDGET_REGISTER_TRANSACTION_LINE_PROCESSOR` to the generic-document primary processor. Without the subscription, FINAL changes the status but no register moves. No seed for these links was found in the backend repository |
| `SHOW_BUDGET` on each document applet that should carry budget | Application Settings of Purchase Order / Purchase Invoice / Sales Invoice (Internal) | Gates the Budget Votebook / Fiscal Period / Item / Register fields and the *Budget Sub Line* tab on the line form (`appletSettings.SHOW_BUDGET`) |
| Server-side permissions | this applet, Settings → Permission Wizard / Permission Set | Every endpoint checks `API_TNT_BUDGET_<object>_<action>` (see Feature visibility) |
| A profit centre per budget owner | this applet, Profit Center menu | Optional on the votebook; copied onto every register created for that votebook |

### Applet settings

**Where they live.** The applet has its own settings container (`settings-container/`), not the shared `FieldConfigurationComponent`. The one real settings screen is **Field Settings → Budget Item Settings**, an applet-local `FieldConfigurationComponent` that saves through the shared session store (`SessionActions.saveMasterSettingsInit`) into the applet's `bl_applet_ext` row `APPLET_SETTINGS`. Any user who can open the applet's Settings menu can change it; there is no client-side permission check in the applet.

![Settings → Field Settings → Budget Item Settings: eleven category-group slots, each with a Mandatory checkbox](/images/budgetary-module/budgetary-module-05.png)

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| **Category Group 0 … Category Group 10** (`ITEM_CATEGORY_CATEGORY_GROUP_SETTINGS_LIST[n].categoryGroupGuid`) | Which category group feeds the *Category n* dropdown on a budget item's Category tab (slot `n` is stored in `bl_fi_budget_item.category_hdr_n_guid` / `category_n_code`). A category's *Items Listing* tab also uses the list to find which slot a category belongs to | Empty. The form always shows 11 slots (`maxCategories = 11`); empty slots are dropped on SAVE | A slot with a group lists only that group's categories (`filterCategoriesBySlot`); a slot without a group lists **every** category. Existing items keep their stored category guids |
| **Mandatory** (`…[n].required`) | Intended to make the slot compulsory | `false` | No effect: nothing reads `required` (checked at commit `2bd6097`). Items save with empty slots regardless |

The settings model also declares the generic keys shared across applets (`INCLUDE_*`, `ENABLE_*`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `PRINTABLE`, custom-status lists). None of them is rendered or read by this applet.

**Screens that look like settings but store nothing** (checked at commit `2bd6097`):

- *Settings → Default Selection* (Default Branch, Default Location, and an unlabelled text box): the component's `appletSettings$` input is never bound, so choosing a value fails in the browser console and SAVE only logs. Nothing is written.
- *Personalization → Default Selection*: same component pattern; SAVE emits an event that no parent handles.
- *General Settings* (a `DEFAULT_GL_CODE` textarea that would save an applet ext): the route exists, the menu entry is commented out, and nothing reads the value. The applet posts no journals.

### Document behaviour settings

No exposed control found (routes and settings components checked at commit `2bd6097`). The virement and adjustment status flow, numbering (`server_doc_1` from the running-number generator), attachments and register posting are fixed in code; there are no printables, approval toggles or e-Invoice flags.

### Feature visibility / permissions

- **Client-side:** `bl_applet_client_side_perm_dfn` has no rows for `budgetaryApplet`, and the applet defines no permission constants or `HIDE_*` settings. Every menu item is visible to every user who can open the applet.
- **Server-side:** each endpoint checks a tenant permission of the form `API_TNT_BUDGET_<OBJECT>_<ACTION>` with `<OBJECT>` ∈ VOTEBOOK, LINE, VOTEBOOK_ITEM_LINK, FISCAL_YEAR, REGISTER, GENERIC_DOCUMENT (virement and adjustment), CATEGORY, CATEGORY_GRP and `<ACTION>` ∈ CREATE, READ, UPDATE, DELETE, ADMIN, OWNER. Posting a virement or adjustment to FINAL needs `API_TNT_BUDGET_GENERIC_DOCUMENT_UPDATE`; creating registers needs `API_TNT_BUDGET_REGISTER_CREATE`. Assign them through Settings → Permission Wizard / Permission Set; the permission target picker offers Company, Branch, Profit Center, Segment, Project, Dimension and Set of Books.

## Fields

### Votebook (Details)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Votebook Code | Short code | Yes | Max 255 |
| Votebook Name | Display name | Yes | Max 255 |
| Profit Center | Budget owner | No | Dropdown of `bl_fi_mst_profit_center`; copied to every register created for the votebook |
| Description | Free text | No | Max 255; saved as a single space when blank |
| Status | Always `ACTIVE` | — | Forced on create and on update (`votebook.effects.ts`); not editable |

### Votebook → Item (Add)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| *Details* tab — grid of existing items | Tick one or more items to link | — | Creates a `bl_fi_budget_line` per item **and** requests registers for every fiscal year already loaded on the votebook |
| *Create Item* tab — Code, Name, Description | Create a new item and link it | Code, Name | Creates the item and the budget line only; **no registers** are requested for existing fiscal years (see Troubleshooting) |

### Votebook → Fiscal Year (Create)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Name, Code | Fiscal year identity | Yes | Also become part of every register's name/code |
| Start, End | Month/year pickers | Yes | End must not be before Start (`endDateBeforeStartDate`). Periods are generated **monthly** — one `bl_fi_budget_fiscal_period` per calendar month, named and coded `MMMM YYYY` — there is no quarterly or custom frequency in the UI |

### Item (Items menu)

| Tab / field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Details — Code, Name | Identity | Yes | Max 255 each |
| Details — Description | Free text | No | |
| Category — Category 0 … Category 10 | One category per slot | No | Dropdown per slot, filtered by the slot's category group (Field Settings); the category code is copied into `category_n_code` |
| Votebook — Add | Link the item to votebooks | — | Same effect as adding the item from the votebook side |

### Category

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Category Group | Owning group | Yes | Saved to `budget_category_grp_guid` |
| Category Code, Category Name | Identity | Yes | |
| Description | Free text | No | |
| Search Filter, parent category | Shown on the form | No | **Not saved** — the assignments are commented out in `item-cat-create.component.ts` |
| Manage Image (edit only) | Attachments on the category | No | Upload, view, delete |

### Category Group

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Category Group Code, Category Group Name | Identity | Yes | |
| Type (`CP_COM`, `DOC_ITEM`) | Shown on the form | No | **Not saved** (`category_grp_type` assignment commented out) |
| Status | `ACTIVE` / `INACTIVE` | Yes | |

### Profit Center

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Profit Center Code, Profit Center Name | Identity | Yes | |
| Description | Free text | No | |
| Ref 1–5 Code / Name / Description | Free reference fields | No | Fifteen free-text fields; no lookup |

### Virement (header and lines)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Votebook, Fiscal Year, Fiscal Period, Budget Register | Header scope; the register chosen here becomes *Budget Register From* on every line | No client validator | Dropdowns cascade (votebook → year → period → register) |
| Issue Date, Reference #, Tracking ID, Remarks, Description | Header text | No | |
| Line — Item Code | Item on the line | Yes | Item Name fills in |
| Line — Fiscal Year, Fiscal Period, Budget Register From | Locked from the header | — | Disabled controls |
| Line — Budget Register To | Receiving register | No client validator | Any register of the selected period |
| Line — Balance | Current balance of the *from* register | read-only | Display only |
| Line — Amount To Transfer | Amount moved | No client validator | **May exceed Balance** — neither the UI nor the backend checks it |

### Adjustment (header and lines)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Votebook, Fiscal Year, Budget Register | Header scope | No client validator | The header has no Fiscal Period control (commented out) |
| Issue Date, Reference #, Tracking ID, Remarks, Description | Header text | No | |
| Line — Item Code | Item on the line | Yes | |
| Line — Fiscal Year, Fiscal Period, Budget Register | Register being adjusted | — | Stored as `budget_register_from_guid` |
| Line — Amount Allocated | Current allocation of the register | read-only | Recalculated live as you type |
| Line — Adjustment Type | *Adjust In* (increase) or *Adjust Out* (decrease) | Yes | Default *Adjust In*; stored in `adjustment` = `IN` / `OUT` |
| Line — Amount To Adjust | Amount | No client validator | Positive number; the sign is derived from the type |

### Manual budget register transaction line (Report → Budget Register Txn Line Report → create)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Budget Votebook, Budget Fiscal Year, Budget Fiscal Period, Budget Item | Scope of the line | Yes | Fiscal Period is enabled only after a Fiscal Year is chosen |
| Amount | Amount | Yes | Pattern `^\d+(\.\d{1,2})?$` — positive, at most two decimals |
| Transaction Date | Optional date | No | Sent as an ISO timestamp |
| Source Document | Optional link to a financial document | No | Dialog searches `bl_fi_generic_doc_hdr` by document number; stores `generic_doc_hdr_guid` |

The saved line has `txn_type = MANUAL` and **no `budget_register_guid`** — see Lifecycle for what that means.

## Lifecycle and effects

### Master data

Votebooks, items, categories, category groups and profit centres are plain `ACTIVE` / `INACTIVE` masters. The backend validators (`Budget*DataConsistencyObject`) check required columns and foreign keys only; there are no status transitions.

### Registers are created by jobs, not by a form

- **Creating a fiscal year** (`POST …/budget-fiscal-year-periods/backoffice-ep`) queues `BUDGET_FISCAL_YEAR_REGISTER_PROCESSOR`. For every item linked to the votebook (`bl_fi_budget_line`) it builds one register template — code `"<item code> <fiscal year code>"`, currency **MYR (hard-coded)**, all six amounts 0, `budget_account_type` and `profit_center_guid` copied from the votebook — and `BudgetRegisterService.createMultipleFromSingleWithCustomLogic` expands it into **one register per fiscal period** (code and name get the period code/name appended). A register that already exists for the same year, period, item and votebook is skipped.
- **Linking an existing item to a votebook** posts a budget line and then calls `POST …/budget/registers/custom/backoffice-ep` once per fiscal year already on the votebook — the same expansion. The *Create Item* path posts the item and the line only.
- **Removing an item from a votebook** deletes the budget line and queues `BUDGET_REGISTER_DELETION_PROCESSOR`, which deletes that votebook/item's registers (`deleteRegistersBasedOnVotebookAndItemGuid`). A failure is only logged.

### Virement and adjustment

Both are `bl_fi_budget_generic_doc_hdr` documents (`txn_type` and line `server_doc_type` = `VIREMENT` or `ADJUSTMENT`). On create the header's `posting_status` is `null` (shown as draft), `status` defaults to `ACTIVE`, and `server_doc_1` is taken from the running-number generator (`generateRunningNumbersForServerDoc`). The document can be updated until it is FINAL; the edit screen then disables the header selectors and the line list stops offering add/edit (`posting()` returns `false` when `postingStatus === "FINAL"`).

**FINAL** calls `PUT …/budget/gen-docs/backoffice-ep/update-posting-status/{guid}` with `{"posting_status":"FINAL"}`. The controller rejects three cases with HTTP 403 (`BudgetGenericDocumentController.java`): FINAL when already FINAL (*Budget Document has already been posted to FINAL*), VOID when already VOID, and VOID from a draft (*Draft Budget Document cannot be posted to VOID*). Anything else is saved, and **only FINAL** queues `BUDGET_GEN_DOC_PRIMARY_PROCESSOR` (`BudgetGenericDocumentService.updatePostingStatus`). There is no VOID button in the applet; a VOID sent by API changes the status and nothing else.

Posting proof block (from the backend):

| Item | Value |
|---|---|
| Server document type | `VIREMENT` / `ADJUSTMENT` on `bl_fi_budget_generic_doc_hdr.txn_type` and each line's `server_doc_type` |
| Amount signum | Per line, `BudgetGenDocRegisterTxnLineProcessor.mapTxnLine`: the **from** register gets `−amount_txn` — except an adjustment with `adjustment = IN`, which gets `+amount_txn`; the **to** register (virement only) gets `+amount_txn` |
| Quantity signum | None — budget lines carry amounts only |
| Dr/Cr equation | None — no journal is posted; the applet never touches `bl_fi_journal_*` |
| GL precedence | Not applicable (the `DEFAULT_GL_CODE` setting is unused) |
| Stock processor | None |
| Register update | `BUDGET_TXN_LINE_UPDATE_REGISTER_PROCESSOR`: for `txn_type` `VIREMENT`, `ADJUSTMENT` or `TRANSFER`, `latest_allocated_amt += amount` and `balance_amt = latest_allocated_amt − actual_used_amt`; for `OPENING`, `initial_allocated_amt = latest_allocated_amt = balance_amt = amount`; for **any other** type (`MANUAL`, invoice line types) `actual_used_amt += amount`, `latest_used_amt = amount`, `balance_amt = latest_allocated_amt − actual_used_amt`. The document header then gets `posting_budget = POSTED` |
| What VOID reverses | Nothing. `updatePostingStatus` queues a processor only for FINAL; the register transaction lines and register amounts written at FINAL stay as they are |

No code creates an `OPENING` transaction, so the **initial allocation of a register is an Adjust In** on a fresh register (all amounts 0). The old "Budget" tab that would have entered an initial amount directly is commented out of the votebook screen.

### Consumption by invoices

`FI_GEN_DOC_BUDGET_REGISTER_TRANSACTION_LINE_PROCESSOR` runs after a financial document's primary processor when it is subscribed. It acts only on `INTERNAL_SALES_INVOICE` and `INTERNAL_PURCHASE_INVOICE` headers. For each line that has a `budget_register_guid`, or that has rows in `bl_fi_generic_doc_budget_sub_line`, it writes one register transaction line per line (amount = the line's `amount_txn`) or per sub-line (amount = `budget_amount`, register = the sub-line's register), with `txn_type` copied from the document line — so the register-update job treats it as **usage** (`actual_used_amt`). On success the invoice header gets `posting_budget = POSTED`; on failure the job throws *Failed to create budget txn lines*.

**There is no budget check on the server.** `GenericDocumentBudgetSubLineDataConsistencyObject` validates keys and nulls only; the shared *Budget Sub Line* editor colours the amount cell and shows the tooltip *Amount exceeds register balance by …* when `budget_amount > budget_register_balance_amt`, but still saves. A register's `balance_amt` can go negative. `reserved_amt` (the "Amount Reserved" column) is created as 0 and nothing in the applets or the backend writes to it.

### Manual transaction lines

The Report screen's create form posts a `bl_fi_budget_register_txn_line` with `txn_type = MANUAL` and no `budget_register_guid`. `BudgetRegisterTxnLineService.create` stores the line and queues the register-update job, which looks the register up by that (null) guid and throws *Budget Register Does not exist*. The line therefore appears in the Txn Line Report, but no register figure moves.

### Budget Report

Reads `bl_fi_budget_register` grouped by votebook, profit centre, register and item, with the eleven category codes. Columns: Initial Amount Allocated, Latest Amount Allocated, Amount Reserved, Amount Utilized (`actual_used_amt`), Utilization % (= utilised ÷ latest allocated), and a pinned totals row. Both "Initial" and "Latest" columns are bound to `latest_allocated_amt` (`report-listing.component.ts` lines 242 and 250), so they always show the same figure.

## Related applets

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — with `SHOW_BUDGET` on, each line can name a votebook / period / item / register or split across registers in the *Budget Sub Line* tab; FINAL consumes the register(s).
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — same mechanism on the revenue side.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — carries the same budget fields for information; the backend processor skips purchase orders, so commitment is not recorded here.
- [Developer SysAdmin Applet](/applets/integrations/developer-sysadmin-applet/) — where the job-processor subscriptions that make FINAL move the registers are configured and where failed budget jobs can be inspected.
- [Organisation](/applets/master-data/organisation-applet/) — company, branch and user context shared by every applet.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL on a virement or adjustment succeeds, but the Budget Report does not change | The budget processors are not subscribed in the tenant's job-processor configuration, or the register-update job failed (*Budget Register Does not exist*) because the line's register was deleted | Check the job queue in the Developer SysAdmin applet; confirm `BUDGET_GEN_DOC_TRANSACTION_LINE_PROCESSOR` subscribes to `BUDGET_GEN_DOC_PRIMARY_PROCESSOR`; confirm registers exist for the votebook / year / period / item |
| A purchase invoice went FINAL but the register's *Amount Utilized* did not move | `SHOW_BUDGET` was off when the line was entered (no register on the line), or `FI_GEN_DOC_BUDGET_REGISTER_TRANSACTION_LINE_PROCESSOR` is not subscribed, or the document is a purchase order (never consumed) | Turn on `SHOW_BUDGET` in the invoice applet, re-enter the budget fields, check the subscription |
| A new item created from the votebook's *Create Item* tab has no registers, and the register dropdowns stay empty for it | The create path posts the item and the line only; registers are requested only when an **existing** item is ticked on the *Details* tab | Remove the item from the votebook and add it again from the *Details* tab, or create fiscal years after linking items |
| Virement lines could not be updated after items were added: `EXCEPTION_INCONSISTENT_DATA` … `BUDGET_GENERIC_DOCUMENT_LINE_OBJECT_CREATED_DATE_IS_NULL` | Lines were created without `status`, `revision` and `created_date` (fixed July 2026) | Deploy the current build; re-create the affected virement |
| Category *Add* / *Create* button does nothing after uploading an image; *Create* button inert on the Category screen; *Add* on Item → Votebook crashes | UI bugs fixed July 2026 (issues 5, 7, 9) | Deploy the current build |
| Permission Wizard / Permission Set menus show an error | Missing route and an empty `forkJoin` that never resolved (fixed July 2026, issue 8) | Deploy the current build |
| *Budget Document has already been posted to FINAL* (HTTP 403) | FINAL clicked twice, or the document was finalised in another session | Refresh the listing |
| *Draft Budget Document cannot be posted to VOID* | A VOID was sent by API against a draft | Delete the draft instead |
| A virement moved more than the source register had; balance is negative | Neither *Amount To Transfer* nor the backend checks the balance | Post an Adjust In on the source register, or a reverse virement |
| *Initial Amount Allocated* and *Latest Amount Allocated* are always identical | Both columns read `latest_allocated_amt` | Use the Txn Line Report to see the history; no fix in the UI |
| Manual transaction line shows in the Txn Line Report but the register did not change | `txn_type = MANUAL` with no `budget_register_guid`; the register-update job fails | Use an Adjust In / Adjust Out instead |
| Category *Type*, *Search Filter* or parent category is not kept | The form shows the controls but the save mapping is commented out | None; these are informational only |
| Default Selection (Settings or Personalization) does not save | The screen is not wired to the applet's settings | None; the applet has no default branch or location |
| Unsure how categories relate to items | An item has **eleven fixed slots** (`category_hdr_0_guid` … `category_hdr_10_guid`), one category per slot, each slot bound to a category group in Field Settings — not a many-to-many link (issue 12) | Design category groups so that each reporting dimension is one slot |

## Related documentation

- [Budgetary Management Module](/modules/budgetary/) — module-level narrative and workflow diagram.
- [Financial Accounting module](/modules-v2/financial-accounting/).
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) and [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the documents that consume budget.
