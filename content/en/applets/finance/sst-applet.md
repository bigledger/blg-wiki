---
title: "MY-SST APPLET"
description: "Reference for the Malaysian SST applet: tax years, tariff codes, tax codes, filing cycles, what File and Unfile actually write, and how each box of the SST-02 is computed"
applet_code: "mySST"
page_type: applet
applet_repo: "blg-applet-wavelet-my-sst-applet"
modules: [financial-accounting]
related_applets:
  - tax-configuration-applet
  - organisation-applet
  - chart-of-account-applet
  - doc-item-maintenance-applet
  - internal-sales-invoice-applet
  - internal-purchase-invoice-applet
  - internal-sales-credit-note-applet
  - ledger-and-journal-applet
  - financial-report-applet
  - my-e-invoice-admin-applet
guides: []
sources:
  screens_and_menus:
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/app.routing.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/services/tax-filing-pages.service.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-filing-container/tax-filing-view/tax-filing-view.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-filing-container/tax-filing-view/tax-filing/tax-filing.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-filing-container/tax-filing-view/service/service.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-filing-container/tax-filing-view/sales/sales.component.html
  configuration:
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/app.module.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/models/applet-settings.model.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/financialFiling/SSTController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/financialFiling/TaxTxnController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/financialFiling/FinancialFilingController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/financialFiling/FinancialFilingYearController.java
  fields:
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-year-container/tax-year-create/tax-year-create.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-year-container/tax-year-create/tax-year-create.component.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/label-container/label-create/label-create.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/label-container/label-create/label-create.component.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-code-container/tax-code-create/tax-code-create.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-code-container/tax-code-create/tax-code-create.component.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-filing-container/tax-filing-cycle-create/tax-filing-cycle-create.component.html
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-filing-container/tax-filing-cycle-create/tax-filing-cycle-create.component.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/models/my-sst-constants.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TaxTxnService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/SSTService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/FinancialFilingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialFilingUows/SSTUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialFilingUows/FinancialFilingUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialFilingDataConsistencyObjects/FinancialFilingDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dto/erp/SST02OutputDto.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidTaxProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/resources/liquibase/changelogs/liquibase-changelog_V20221019.sql
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialFilingUows/SSTUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/SSTService.java
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/state-controllers/tax-filing-cycle-controller/store/effects/tax-filing-cycle.effects.ts
    - "gh:bigledger/customer-repo-e40ac3#16"
    - "gh:bigledger/customer-repo-e40ac3#17"
    - "gh:bigledger/customer-repo-e40ac3#7"
    - "gh:bigledger/customer-repo-d4fc8d#37"
    - "gh:bigledger/customer-repo-bb8ea1#272"
    - "gh:bigledger/customer-repo-bb8ea1#327"
    - "gh:bigledger/customer-repo-c0c34b#715"
tags:
- sst-compliance
- tax-management
- malaysia-tax
- sst-02-report
- financial-compliance
- tariff-code
- tax-filing
weight: 20
aliases:
- /applets/sst/mysst/
- /applets/sst-applet/
---

## Overview

The MY-SST applet is where a Malaysian SST-registered company defines its taxable periods, decides which posted documents belong in each period, and produces the SST-02 return for the Royal Malaysian Customs Department (RMCD).

It does four things and nothing else: it maintains **tax years** (`bl_fi_filing_year_hdr`) and **filing cycles** (`bl_fi_filing_hdr`); it maintains **tariff codes** (`bl_fi_mst_label_hdr` under the `TARIFF_CODES` label list) and **tax codes** (`bl_fi_cfg_tax_code`); it *files* posted generic documents, which copies their taxed lines into a frozen snapshot table (`bl_fi_tax_txn`); and it reports — three on-screen reports plus the SST-02 itself, which is computed entirely from that snapshot.

The applet does not calculate tax on a transaction. Tax is calculated on the sales, purchase and POS documents from the tax code attached to each line. The applet only decides which of those already-taxed lines land in which return.

## Where it fits

| Direction | What | Why |
|---|---|---|
| Upstream | [Organization](/applets/master-data/organisation-applet/) | The company's **SST registration number** (`bl_fi_mst_comp.sst_registration_id`) is printed in Part A of the SST-02. A company with a blank one prints a blank field. |
| Upstream | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Maintains the same `bl_fi_cfg_tax_code` rows through a second, differently-behaved screen. See [Settings in other applets](#settings-in-other-applets-that-control-this-applet). |
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Where a tax code is attached to an item so that documents pick it up automatically. |
| Upstream | Fiscal year configuration (Organization → Company) | A tax year is created against a fiscal year and inherits its start/end month and year. |
| Source of documents | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), credit and debit notes, POS documents | Any generic document with a line carrying one of the four SST tax types. |
| Downstream | RMCD | The SST-02 PDF, produced by a JasperReports template on the server. |
| Adjacent | [Ledger and Journal](/applets/finance/ledger-and-journal-applet/), [Financial Report](/applets/finance/financial-report-applet/) | The tax GL balances come from the documents' journals, not from this applet. Filing writes no journal. |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/my-sst`. Landing route is **Tax Year**.

| Menu item | Route | What it is |
|---|---|---|
| Tax Year | `tax-year` | Listing, create, edit of `bl_fi_filing_year_hdr` — one per company per fiscal year. |
| Tariff Code | `label` | Listing, create, edit of `bl_fi_mst_label_hdr` rows in the `TARIFF_CODES` label list. |
| Tax Code | `tax-code` | Listing, create, edit of `bl_fi_cfg_tax_code`. |
| Tax Filing | `tax-filing` | Listing and create of filing cycles, plus the Tax Filing & Submission workspace. |
| SST Service Tax Report | `tax-report` | Read-only grid over `fi/sst/service/taxable-generic-documents`. |
| SST Sales Tax Report | `tax-report-sales` | Read-only grid over `fi/sst/sales/taxable-generic-documents`. |
| SST Tax Code Summary | `tax-code-summary` | Read-only grid over `fi/sst/tax-code-summary/backoffice-ep`. |

{{< figure src="/images/sst-applet/tax-filing-listing.png" alt="Tax Filing Cycle Listing" caption="Tax Filing Cycle listing. The Locked column is the only lifecycle state a filing cycle has." >}}

### The Tax Filing & Submission workspace

Opening a filing cycle gives a three-level tab structure. The nesting matters, because Service and Sales behave differently at every level below it.

```
Tax Filing & Submission
├── Details            (cycle metadata + Lock + Delete)
└── Tax Filing
    ├── Service
    │   ├── Filed Transactions
    │   ├── Unfiled Transactions
    │   ├── SST-02
    │   ├── SST-02 Version 2
    │   └── SST-02 Version 3
    └── Sales
        ├── Filed Transactions
        ├── Unfiled Transactions
        └── SST-02
```

The Service tab carries **three** SST-02 variants and the Sales tab carries one. The variants are not drafts of each other — each calls a different endpoint with a different hard-coded set of service tax codes (see [How each SST-02 box is computed](#how-each-sst-02-box-is-computed)).

{{< figure src="/images/sst-applet/tax-filing-cycle-details.png" alt="Tax Filing Cycle Details tab" caption="Details tab. Lock and Delete are the only actions on a filing cycle." >}}

{{< figure src="/images/sst-applet/tax-filing-sst02-tab.png" alt="SST-02 tab" caption="The SST-02 tab: Penalty Amount and Penalty %, SEARCH to compute, EXPORT TO PDF to render the JasperReports form." >}}

### Tariff Code screens

{{< figure src="/images/sst-applet/tariff-code-listing.png" alt="Tariff Code listing" caption="Tariff Code listing and edit. The edit panel is headed \"Edit Tax Code\" — a mislabelled heading on the Tariff Code screen, not a different screen." >}}

{{< figure src="/images/sst-applet/tariff-code-create.png" alt="Create Tariff Code" caption="Create Tariff Code. Two fields only: Tariff Code and Tariff Name. The panel heading reads \"Create Tax Code\"." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why it blocks you |
|---|---|---|
| Company with an SST registration number | [Organization](/applets/master-data/organisation-applet/) → Company | Part A of the SST-02 reads `bl_fi_mst_comp.sst_registration_id`. Blank here means blank on the return. |
| Fiscal year on that company | [Organization](/applets/master-data/organisation-applet/) → Company → Fiscal Year | The Tax Year form takes its start/end year and month from the selected fiscal year. Without one the tax year is created with null period bounds. |
| The `TARIFF_CODES` label list | Seeded by the platform | The applet **looks the list up by code and never creates it** (`label.effects.ts`, criteria `code = 'TARIFF_CODES'`). The list is seeded as a system default with a fixed GUID by the `V20221019` Liquibase changelog, so it exists in any tenant provisioned since. If the lookup returns nothing, every tariff code you create is saved with a null label list and Part B1 of the SST-02 comes back empty. |
| Tax codes named exactly as the SST-02 expects | This applet, or [Tax Configuration](/applets/master-data/tax-configuration-applet/) | The SST-02 sums by **hard-coded tax code literals**. A correctly-taxed document whose tax code is not on the list is filed, appears in Part B1, and contributes nothing to Part B2. See the table in [How each SST-02 box is computed](#how-each-sst-02-box-is-computed). |
| Tax codes attached to items or entered on lines | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | A line with no `tax_gst_type` is invisible to this applet at every stage. |
| Documents at the right posting status | Sales / purchase applets | Service tax only sees documents at `posting_status = FINAL` **and** with a settlement or contra. Sales tax sees anything not `VOID`. |

### Applet settings

**Applet-local, and none of it works.** `app.routing.ts` imports the applet's own `FieldConfigurationComponent` and `DefaultSettingsComponent` from `components/settings-container/`, not the shared `blg-shared-utilities` screen. The submodule is present and pinned at `7f59480`, but it is not what the settings routes render (METHOD §29). `AppletSettingsModule` and `AppletPersonalizationModule` are both in `AppModule.imports`, so the screens do render — they simply do not save.

| Screen | Menu entry | Verdict |
|---|---|---|
| Settings → Default Tax Settings (`settings/default-selection`) | Yes | Two controls, Default Branch and Default Location. Both value-change handlers dereference `this.appletContainer`, which is **never assigned** — the component declares `@Input() appletSettings$` and `@Output() save` but is routed directly, so neither is bound. The first branch or location you pick throws. SAVE emits to a listener that does not exist. |
| Settings → Field Settings (`settings/field-settings`) | No | The unbound eight-toggle stub (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project). Empty component class, no `formControlName`, SAVE has no `(click)`. Identical artefact to Tax Configuration, Fixed Asset, Merchant Admin, Shipping Pricebook and Supplier. Reachable only by typing the URL. |
| Settings → Webhook, Client-Side Permission, Permission Set / User / Team / Role listings | Not in the menu | Shared-utilities screens, routed but not linked. `settings` with no child redirects to `client-side-permission-listing`, so that is the first screen a user who clicks the gear sees. |
| Personalization → Default Selection (`personalization/personal-default-selection`) | Yes | Same two controls, same defect, plus the subscription that would load and patch the stored values is commented out. |
| Personalization → Sidebar | No | Shared-utilities screen, routed but not linked. |

Four-proof result: **no setting in this applet passes all four proofs through its own screens.**

`models/applet-settings.model.ts` declares 25 keys (`INCLUDE_*` ×6, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `ENABLE_*` ×6, `PRINTABLE`, 15 `ENABLE_CUSTOM_STATUS_*`). A plain grep of the whole `src/` tree finds a reader for exactly one of them.

| Key | Declared | Rendered | Persisted | Consumed |
|---|---|---|---|---|
| `DEFAULT_BRANCH` | Yes | Yes (both Default Selection screens) | No — the save path throws before it can build the payload | **Yes** — the three Service SST-02 components read it to pre-fill their Branch field |
| `DEFAULT_LOCATION` | Yes | Yes | No | No reader anywhere |
| Everything else in the model | Yes | No | No | No |

`DEFAULT_BRANCH` is the interesting row. The SST-02 components read it from `SessionSelectors.selectPersonalSettings`, which the shared session effect populates from the **per-user** `USER_SETTINGS` row on `bl_applet_login_subject_link_ext` — not from the applet-level `APPLET_SETTINGS` row that this applet's Default Selection screens try to write. So the one consumed setting is a personal setting that this applet's personalization screen cannot save. In practice the Branch field on the SST-02 tabs starts empty.

There is no inline `app-applet-settings-toggle` gear anywhere in the applet (METHOD §8 checked, zero hits).

### Document behaviour settings

Not applicable in the usual sense: this applet creates no generic document, so there is no status flow, no posting toggle, no printable selection and no e-Invoice flag on its own records. The two behaviours that would normally be settings are fixed in the backend:

- **Which documents are eligible** is fixed by the SQL in `SSTUow` (tax type, posting status, settlement) — see [Lifecycle and effects](#lifecycle-and-effects).
- **Which tax codes each SST-02 box sums** is fixed by literals in `SSTController` — see the table below.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| `sst_registration_id` on the company | [Organization](/applets/master-data/organisation-applet/) → Company | Printed in Part A of the SST-02. |
| Fiscal year start/end month and year | [Organization](/applets/master-data/organisation-applet/) → Company → Fiscal Year | Copied onto the tax year at creation and used to seed the first filing cycle's start date. |
| Tax code rows (`bl_fi_cfg_tax_code`) | This applet **and** [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Both applets write the same table with different conventions. MY-SST writes `tax_country` as the **alpha-3 code** (`MYS`), stores the rate unrounded as a fraction (`rate / 100`), and puts the tariff code in the `tax_tariff_code` column. Tax Configuration writes the **country name**, rounds the rate to two decimals of the fraction (so 8.5% collapses to a whole percent), and puts the tariff code in `property_json`. A row created here cannot be opened in Tax Configuration's edit screen. |
| Item-level tax code | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Determines `tax_gst_type`, `tax_gst_code`, `tax_gst_rate` and `tax_tariff_code` on the document line, which are the only things this applet ever looks at. |
| Company default `OUTPUT_TAX` / `INPUT_TAX` GL links | [Organization](/applets/master-data/organisation-applet/) → Company → default GL codes | Used only by the filing-cycle **carry-forward** branch of the lock endpoint, which the applet never triggers. See [Lock](#lock). |

### Feature visibility and permissions

Permission families are not what the menu names suggest, and no single "SST" family covers the applet.

| Action | Permission checked | Notes |
|---|---|---|
| SST Service / Sales Tax Report, all SST-02 variants | `API_TNT_DM_ERP_SST02_OWNER` / `_ADMIN` / `_READ` (`TntErpPermissions`) | The report endpoints additionally build a targeted permission over `bl_fi_mst_branch` and `bl_fi_mst_comp`; an unauthorised target yields an empty grid rather than an error. |
| SST Tax Code Summary | `API_TNT_DM_ERP_TAX_CODE_SUMMARY_OWNER` / `_ADMIN` / `_READ` (`TntErpPermissionsV2`) | Its own family, separate from SST02. |
| File / File All / Unfile | `API_TNT_DM_ERP_GEN_DOC_ADMIN` / `_OWNER` / `_READ` | **Generic-document read permission, not a tax permission.** Anyone who can read sales and purchase documents can file and unfile them. Unfile additionally needs `API_TNT_DM_ERP_FI_TAX_TXN_OWNER` / `_ADMIN` / `_READ`. |
| Tax year create / read / update / delete | `API_TNT_DM_ERP_FI_FILING_YEAR_*` | Full CRUD family. |
| Filing cycle create | `TNT_API_FINANCIAL_FILING_CREATE`, or `TNT_LOG_FINANCIAL_FILING_OWNER` / `_ADMIN` | |
| Filing cycle update | `TNT_API_FINANCIAL_FILING_UPDATE`, or the two LOG families | |
| Filing cycle delete | `TNT_API_FINANCIAL_FILING_**READ**`, or the two LOG families | There is no delete permission. Read permission is enough to delete a filing cycle. |
| Filing cycle **lock** | None | `FinancialFilingController.lock` fetches the filing with the two-argument `getByGuid(guid, dbConn)` and never calls `doesUserHaveAnyPermission`. The permission list it builds is passed only to the previous-cycle check, where it decides a display flag. Any authenticated tenant user can lock a cycle. |

Tariff codes and tax codes are written through the generic label and tax-code endpoints and carry those endpoints' permission families, not an SST family.

No `bl_applet_client_side_perm_dfn` rows are seeded for this applet, so the Client-Side Permission listing — the screen the settings route redirects to — opens empty.

## Fields

### Tax Year (`bl_fi_filing_year_hdr`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company | Company the tax year belongs to | Yes in practice | No `Validators.required`; the create button does not check. |
| Fiscal Year | Fiscal year to inherit the period bounds from | Yes in practice | Selecting it copies `start_year`, `end_year`, `start_month`, `end_month` onto the record. Leaving it empty saves nulls. |
| Name | Free-text label shown in the listing and the filing-cycle drop-down | No | |
| Filing Cycle Duration | `1` Monthly, `3` Quarterly, `-1` Custom Month, `0` Custom Duration | No | Stored in `duration_filing_cycle`. For Custom Month the value saved is the number typed into Specify Month, not `-1`. |
| Specify Month | Number of months per cycle | No | Shown only for Custom Month. |
| Approval No | RMCD approval reference for a non-standard period | No | Shown for Custom Month and Custom Duration. **Never sent** — `onAdd` reads `this.form.value.approval` while the control is named `approval_no`, so the field is always saved as undefined. |

### Tariff Code (`bl_fi_mst_label_hdr`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Tariff Code | The RMCD tariff code | No validator | Saved to `code`. |
| Tariff Name | Description | No validator | Saved to `name`. |

`txn_type` is set to the literal `TARIFF_CODES` and `label_list_guid` to the GUID of the `TARIFF_CODES` label list looked up at screen load.

### Tax Code (`bl_fi_cfg_tax_code`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Tax Code | The code the document line will carry | No validator | Saved to `tax_code`. This is the value the SST-02 matches against its hard-coded lists. |
| Tax Code Description | Free text | No validator | `tax_code_descr`. |
| Tax Type | One of `SST-SLS-INPUT`, `SST-SLS-OUTPUT`, `SST-SVC-INPUT`, `SST-SVC-OUTPUT` | Has a `required` hint | Saved to `tax_gst_type`. A code whose type is outside these four is invisible to every query in this applet. |
| Tax Type Name | Read-only echo of the type's label | Marked `required` on a read-only input | Not persisted as a separate column. |
| Tax Rate (%) | Percentage, e.g. `6.00` | `Validators.max(100)` only | Stored **unrounded** as a fraction in both `tax_rate_txn` and `tax_rate_filing`. |
| Tariff Codes | Link to a tariff code | No validator | Saved to the `tax_tariff_code` column. This is what Part B1 of the SST-02 groups by. |

`tax_country` is set to `MYS` — the alpha-3 code of the single country the form filters the country list down to. `is_input` / `is_output` are derived from whether the type string contains `INPUT`.

### Filing Cycle (`bl_fi_filing_hdr`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company | Company being filed for | Yes in practice | FK existence is checked by the DCO; nothing checks it is present. |
| Tax Year | Tax year the cycle belongs to | Yes in practice | Saved to `filing_year_guid`. Selecting it fills Filing Duration and seeds Start Date from the fiscal year's start month. |
| Name | Free-text label | No | |
| Filing Duration | Read-only echo of the tax year's duration | — | Display only. |
| Start Date | First day of the taxable period | No validator | |
| End Date | Last day of the taxable period | No validator | Seeded from the tax year's duration. **Changing Start Date afterwards always recomputes End Date as start + 3 months** — `onDateChange` hard-codes `add(3, 'months')` regardless of whether the tax year is Monthly, Quarterly or Custom. |

`fiscal_year_guid` is assigned from a form control named `fiscal` that does not exist on this form, so a filing cycle is always created with a null fiscal year.

The `FinancialFilingDataConsistencyObject` validates FK existence for company, branch, fiscal year and fiscal period, and the presence of the platform housekeeping columns. **It does not validate that the end date is after the start date, and it does not check for overlapping cycles.** Two cycles covering the same month are accepted, and the same document can be filed into both.

## Lifecycle and effects

This applet writes no journal, creates no generic document, and moves no stock. Its effect on the ledger is nil; its effect on the tax record is `bl_fi_tax_txn`.

### What "Unfiled" means, and why Service and Sales differ

The Unfiled Transactions grid is a live query over `bl_fi_generic_doc_hdr`. The two tabs use different SQL.

| | Service (`fi/sst/service/taxable-generic-documents`) | Sales (`fi/sst/sales/taxable-generic-documents`) |
|---|---|---|
| Document status | `posting_status = 'FINAL'` | `posting_status <> 'VOID'` — a **DRAFT** document qualifies |
| Settlement | `(arap_stlm_amount + arap_contra) <> 0`, plus an INNER JOIN LATERAL onto the AR/AP contra documents | Not considered |
| Line qualifies when | `tax_gst_type = 'SST-SVC-OUTPUT'` and (`tax_gst_rate > 0` or `tax_gst_code = 'ESS0'`) | `tax_gst_type IN ('SST-SLS-OUTPUT','SST-SLS-INPUT')` and `tax_gst_rate > 0` |
| Date range applies to | the **contra (settlement) date** | the document date |
| "Taxable Amount" column is | `SUM(amount_txn)` — gross, tax-inclusive | `SUM(amount_tax_gst)` — the tax itself |
| Deleted lines | excluded (`status <> 'DELETED'`) | **not excluded** |

The Service side is therefore a **payment-basis** view: an unpaid service invoice never appears, however final it is, and a service invoice paid in April appears in the April period even if it was raised in February. That is the Malaysian service-tax rule, and it is implemented in SQL rather than as a setting. The Sales side is accrual-basis and does not even require the document to be final.

### File and File All

`FILE IT` posts the selected document GUIDs to `fi/tax-txns/file/backoffice-ep/`. `FILE ALL` posts the current filter to `fi/tax-txns/service|sales/file-all/backoffice-ep/`, which re-runs the eligibility query server-side and files everything it returns.

For each document, `TaxTxnService.fileTaxTxn` walks `bl_fi_generic_doc_line`, keeps **only lines whose `txn_type` is `PNS`** (the item / product-and-service line type), and writes one `bl_fi_tax_txn` row per kept line. Each row is a snapshot: document type, both document numbers, transaction date, header net / tax / txn / withholding amounts, the line's net, tax and txn amounts multiplied by the line signum, tax code, tax rate, tariff code, currency, item code, description, quantity, and the entity's name, GUID, customer-or-supplier flag and tax registration number.

Consequences worth knowing:

- **Non-`PNS` lines never reach the return.** A taxed charge or freight line that the document carries as a different line type is taxed on the invoice and absent from the SST-02.
- On success the header's `posting_tax_gst` is set to `POSTED`; that is the only thing that moves a document from Unfiled to Filed.
- `FILE IT` skips documents already at `posting_tax_gst = 'POSTED'`. **`FILE ALL` does not** — it files whatever the eligibility query returns.
- If the write fails, the controller returns HTTP 200 with an empty list for that document and leaves `posting_tax_gst` unset. Nothing is raised to the user.

### Unfile

`UNFILE IT` posts to `fi/tax-txns/unfile/backoffice-ep/`. For each document the controller builds a criteria of company plus document header GUID, and `TaxTxnService.unfileTaxTxn` calls `deleteTaxTxn` on `container.stream().findFirst().get()` — **the first matching row only**. It then clears `posting_tax_gst` to null on the header.

So on a document with more than one taxed line, Unfile hard-deletes one `bl_fi_tax_txn` row, leaves the rest attached to the filing cycle, and marks the document unfiled. Filing it again adds a second full set of rows. This is the mechanism behind the recurring duplicate-filing reports. Unfile is a delete, not a status change; there is no audit row left behind.

If no matching row exists, `.get()` on the empty result throws.

### Lock

Lock is `PUT fi/filings/backoffice-ep/lock/{guid}`.

1. It calls `checkPreviousCycleIsLocked`: any filing cycle for the same company with an **earlier** `date_start` and `locked_status IS NULL` blocks the lock. The query does not exclude deleted cycles. The response is HTTP 200 with the body `PREVIOUS FILING CYCLE IS NOT LOCKED`; the applet's effect recognises this string and shows it as an error toast.
2. Otherwise it sets `locked_status = 'LOCKED'`, `locked_time`, `locked_by_subject_guid` and saves.
3. If — and only if — the request body carries a `glcode` key, it then runs `FinancialFilingService.carryForward`, which posts a journal named *SST-02 Auto Transfer*, described *AUTO CREATED DURING LOCKING OF FILING CYCLE*. **The applet never sends `glcode`**: `confirmDialog` dispatches the lock with `{}` and the carry-forward dialog is commented out with the note that carry-forward is a GST concept, not an SST one. The branch is reachable only by calling the endpoint directly.

What Lock does **not** do: it does not stop filing or unfiling. Neither `fileTaxTxn`, `file-all` nor `unfileTaxTxn` reads `locked_status`. Documents can still be filed into and unfiled from a locked cycle.

What Lock **does** do, unintentionally: Part A of the SST-02 is queried with `locked_status <> 'LOCKED'`. Locking a cycle makes its own Part A — company name, SST number, period start and end, due date — come back empty on every subsequent SST-02 render.

There is no unlock action in the applet.

### Delete

Deleting a filing cycle first looks for any `bl_fi_tax_txn` row against it. If one exists the endpoint returns HTTP 200 with `FILED_GENERIC_DOC_FOUND` and the message *Cannot delete this filing cycle: filed documents found. Please unfile all documents first.*, which the applet surfaces as an error toast. Otherwise the cycle is soft-deleted without firing a webhook.

### VOID of a filed document

`VoidTaxProcessor` is a generic-document queue subscriber (`getQueueCode() = "VOID_TAX_PROCESSOR"`). When it runs against a document whose `posting_journal` is `POSTED` and whose `posting_tax_gst` is not already `VOID`, it calls `TaxTxnService.reverseTaxTxn`, which writes a **new** `bl_fi_tax_txn` row with every amount negated and `filing_status = VOID`, and sets the document's `posting_tax_gst` to `VOID`. It does not delete the original row; the SST-02 nets the two.

Two caveats:

- Nothing in the Java tree enqueues this processor directly. It runs where a tenant's job template subscribes it to the generic-document queue. Where it is not subscribed, voiding a document leaves its tax transaction in the return.
- If the document was never filed, `reverseTaxTxn` throws *No tax transaction found for this generic document!*.

### How each SST-02 box is computed

Everything below reads `bl_fi_tax_txn` filtered by `status <> 'DELETED'`, the company, and the filing cycle. Nothing reads the live documents.

| Box | Source | Filter |
|---|---|---|
| Part A (company, SST no., period, due date) | `bl_fi_filing_hdr` joined to `bl_fi_mst_comp` | `locked_status <> 'LOCKED'`. Due date is computed as the last day of the month **after** `date_end`. |
| Part B1, item 10 | `SUM(doc_line_amount_net)` grouped by `tax_tariff_code`, INNER JOIN to the tariff-code labels | `tax_tariff_code IS NOT NULL`. A tariff-code GUID with no matching label row drops out of the total. |
| Part B2 §11a / §11a tax (5%, Sales) | `SUM(doc_line_amount_net)` / `SUM(doc_line_amount_tax)` | `doc_line_tax_code IN ('SRG5','SW-5','SU-5')` |
| Part B2 §11b / §11b tax (10%, Sales) | same | `doc_line_tax_code IN ('SRG10','SW-10','SU-10')` |
| Part B2 §11c / §11c tax (Service) | same | SST-02: `('SRS6','SVU-6','IMS6')` · SST-02 Version 2: `('SRS8','SVU-6','IMS6')` · SST-02 Version 3: `('SRS6','SRS8','SVU-6','IMS6')` |
| Part B2 §12 | Service: the §11c **tax**. Sales: §11a **net** + §11b **net** | The Sales branch adds the taxable amounts, not the tax amounts. |
| Part B2 §13 (all sub-items) | Never assigned — always zero | Credit-note and bad-debt deductions do not reach the form. |
| Part B2 §14 | `= §12` | §13 is not subtracted. |
| Part B2 §15 | Penalty Amount and Penalty % as typed on the tab | The percentage is carried to the form but not used in any arithmetic. |
| Part B2 §16 | `§14 + Penalty Amount` | |
| Part D §18a (Sales) | `('ZREG0','ZRLG0')` | |
| Part D §18b1 / b2 / b3 (Sales) | `('ESA')` / `('ESB')` / `('ESC-A')`, `('ESC-B')`, `('ESC-C')` | |
| Part D §18c (Service) | `('ESS0')` | |
| Part E §19 / §20 / §21 (Sales) | `('EPC-A')` / `('EPC-B')` / `('EPC-C')` | |

The three Service variants exist because the Malaysian service tax rate changed. Pick the variant whose tax codes match the rate in force for the period you are filing: the original for a 6%-only period, Version 2 for an 8%-only period, Version 3 for a period that straddles the change.

Because the codes are literals in the backend, **a tenant whose SST tax codes are not named exactly `SRS6`, `SRS8`, `SVU-6`, `IMS6`, `SRG5`, `SRG10`, `SW-5`, `SW-10`, `SU-5`, `SU-10`, `ESS0`, `ESA`, `ESB`, `ESC-A/B/C`, `EPC-A/B/C`, `ZREG0` or `ZRLG0` will get a Part B1 that adds up and a Part B2 that is zero.** There is no setting to change the mapping.

### The three on-screen reports

| Report | Reads | Scope |
|---|---|---|
| SST Service Tax Report | `fi/sst/service/taxable-generic-documents` — live documents | Company, filing status, period, tax codes. Shows the contra documents and the latest contra date per row. |
| SST Sales Tax Report | `fi/sst/sales/taxable-generic-documents` — live documents | Same shape, sales rules. |
| SST Tax Code Summary | `fi/sst/tax-code-summary/backoffice-ep` — live `bl_fi_generic_doc_line` INNER JOINed to `bl_fi_tax_txn` on `doc_line_guid` | Requires Company, Branch **and** Filing Cycle. Returns two blocks — by branch and by tax code — with output net, output tax, input net, input tax and net tax; the client appends a Total row computed from the by-branch block only. |

The first two read live documents. The SST-02 reads the frozen snapshot. **They are different numbers by design**, and they diverge permanently as soon as a filed document is edited.

## Related applets

- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — the other maintenance surface over `bl_fi_cfg_tax_code`, with different write conventions.
- [Organization](/applets/master-data/organisation-applet/) — company SST registration number and fiscal years.
- [Chart of Account](/applets/master-data/chart-of-account-applet/) — the GL codes the tax journals hit; not written by this applet.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — where a tax code reaches a document line.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) — the documents that get filed.
- [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) — where the tax GL balance actually lives.
- [Financial Report](/applets/finance/financial-report-applet/) — for reconciling the return against the tax GL accounts.
- [MY E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — a separate LHDN obligation on the same documents; it shares no tables with SST filing.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| SST-02 item **10 and item 11c do not tally** | Item 10 sums every filed line that has a tariff code. Item 11c sums only filed lines whose tax code is one of the three or four literals for the chosen variant. Any line with a tariff code but a different tax code lands in 10 and not in 11c; any line with the right tax code but no tariff code lands in 11c and not in 10. | Align tax codes to the literals in the table above, and make sure every tax code used carries a tariff code. Reported repeatedly across unrelated tenants (`customer-repo-e40ac3#7`, `#16`, `#17`). |
| The **SST Report and the SST-02 do not tally** | The reports read live document lines; the SST-02 reads the `bl_fi_tax_txn` snapshot written at filing time. Editing, voiding or re-filing a document after it was filed changes one and not the other. | Unfile and re-file the affected documents, then re-run the SST-02. Reported at `customer-repo-d4fc8d#37` and `customer-repo-c0c34b#715`. |
| **Duplicate rows** for credit notes and sales returns in the SST-02 | Unfile deletes only the first `bl_fi_tax_txn` row for a document and then marks the document unfiled, so re-filing adds a second full set of rows. A document with rows against two filing cycles also appears twice in the eligibility grid, because the tax-transaction sub-query groups by document *and* filing cycle. | Check `bl_fi_tax_txn` for more than one `filing_hdr_guid` per document before re-filing. Reported at `customer-repo-bb8ea1#244` and `#327`. |
| A **credit note shows as not filed and cannot be filed** | Either its lines are not `PNS` type, or its tax rate is zero (the Sales eligibility query requires `tax_gst_rate > 0`), or the file call failed and returned 200 with an empty result. | Confirm the credit note's lines carry an SST tax type with a non-zero rate. Reported at `customer-repo-bb8ea1#272`. |
| **Credit notes never reduce the tax payable on the SST-02** | Part B2 item 13 is never assigned by the report builder — all four sub-items are hard zero — and item 14 is set equal to item 12, so deductions are not subtracted. | Adjust outside the applet. This is a backend gap, not a configuration error. |
| **Part B1 is empty** although documents are filed | Either the filed lines carry no tariff code, or the tariff-code rows have no `label_list_guid` because the `TARIFF_CODES` label list was missing when they were created. | Check that the `TARIFF_CODES` label list exists, then recreate the tariff codes and re-file. |
| **Part A of the SST-02 is blank** after locking | Part A excludes filings with `locked_status = 'LOCKED'`. | Export the PDF before locking. There is no unlock action. |
| **Lock is refused** with *PREVIOUS FILING CYCLE IS NOT LOCKED* | An earlier-starting cycle for the same company is still unlocked. Deleted cycles are not excluded from that check. | Lock the earlier cycles first, in date order. |
| **A filing cycle cannot be deleted** — *Cannot delete this filing cycle: filed documents found* | At least one `bl_fi_tax_txn` row still points at the cycle. | Unfile every document first — remembering that Unfile removes one row per call. |
| **A service invoice never appears in Unfiled Transactions** | Service eligibility requires `posting_status = 'FINAL'` **and** a non-zero settlement or contra amount, and the date filter is applied to the settlement date, not the invoice date. | File it in the period in which it was paid. An unpaid service invoice is correctly excluded. |
| **A draft sales invoice appears in Unfiled Transactions** | The Sales eligibility query only excludes `VOID`; it does not require `FINAL`. | Finalise or void the draft before running File All. |
| **Taxed freight or charge lines are missing from the return** | `fileTaxTxn` keeps only lines whose `txn_type` is `PNS`. | Carry the taxed amount on a `PNS` line. |
| **Default Branch on the SST-02 tab is always empty**, and setting it in Settings throws | Both Default Selection screens dereference an unassigned container, and the value the SST-02 reads comes from the per-user `USER_SETTINGS` row that neither screen writes. | Pick the branch on the tab each time. |
| **End Date jumps to three months** after you change Start Date on a monthly cycle | The date handler hard-codes a three-month offset. | Set End Date manually after changing Start Date. |
| **Approval No is not saved** on a custom-duration tax year | The create handler reads a property name that does not match the form control. | Record the RMCD approval reference elsewhere. |

## Related documentation

- [Financial Accounting module](/modules-v2/financial-accounting/) — where SST filing sits in the period-end close.
- [Tax Configuration applet](/applets/master-data/tax-configuration-applet/) — the tax-code reference, including the divergence between the two maintenance screens.
- [Organization applet](/applets/master-data/organisation-applet/) — company SST registration and fiscal-year setup.
</content>
</invoke>
