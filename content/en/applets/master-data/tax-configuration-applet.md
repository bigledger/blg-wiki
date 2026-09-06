---
title: "Tax Configuration"
description: "Reference for the Tax Configuration applet — the tenant-wide list of tax codes (code, name, tax type, rate, country) that every sales, purchase and POS document reads when a line is taxed."
applet_code: "taxConfiguration"
page_type: applet
applet_repo: "blg-applet-wavelet-tax-config-applet"
modules: [core, financial-accounting, sales-crm, purchasing, e-commerce, pos, e-invoice]
related_applets: [chart-of-account-applet, organisation-applet, doc-item-maintenance-applet, inv-item-maintenance-applet, customer-maintenance-applet, supplier-applet-1, sst-applet, my-e-invoice-admin-applet, internal-sales-invoice-applet, internal-purchase-invoice-applet, financial-report-applet]
guides: [/guides/accounting-guides/chart-of-accounts-setup/, /guides/accounting-guides/journal-entries/]
sources:
  configuration:
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/app.routing.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/settings-container/applet-log/applet-log.component.html
    - blg-shared-utilities/modules/settings/settings.component.html
    - akaun_master.bl_applet_client_side_perm_dfn (applet taxConfiguration — no rows)
  fields:
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/tax-config-container/tax-config-create/tax-config-create.component.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/tax-config-container/tax-config-create/tax-config-create.component.html
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/tax-config-container/tax-config-edit/tax-config-edit.component.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/tax-config-container/tax-config-edit/tax-config-edit.component.html
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/components/tax-config-container/tax-config-listing/tax-config-listing.component.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/models/tax-config-constants.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/models/tax-config-models/tax-config.model.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/models/tax-config-models/tax-config.mappers.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/models/advanced-search-models/tax-config.model.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_cfg_tax_code.java
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/tax/TaxCodeCfgDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TaxCodeCfgService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/tax/TaxCodeCfgUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/ddd/DbTableDao.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceToIRBMappingService.java
    - blg-shared-utilities/utilities/sst/sst.component.ts
    - blg-shared-utilities/utilities/wht/wht.component.ts
  troubleshooting:
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/models/tax-config-models/tax-config.mappers.ts
    - blg-applet-wavelet-tax-config-applet/micro-fe/projects/wavelet-erp/applets/tax-config-applet/src/app/state-controllers/tax-config-controller/store/effects/tax-config.effects.ts
    - blg-applet-wavelet-my-sst-applet/micro-fe/projects/wavelet-erp/applets/my-sst-applet/src/app/components/tax-code-container/tax-code-create/tax-code-create.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/tax/TaxCodeCfgController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/ListingController.java
    - gh:bigledger/blg-applet-wavelet-tax-config-applet#3
tags:
- core-module
- tax-management
- compliance
- gst
- sst
- vat
- withholding-tax
weight: 100
aliases:
- /applets/tax-configuration-applet/
---

## Overview

Tax Configuration holds the tenant's list of **tax codes** — one row per code, each carrying a code string, a description, a tax type, a rate and a country. It is master data only: it moves no stock, posts no journal and calculates nothing. Its output is the drop-down that appears on a document line whenever tax is charged, and the rate that the backend stamps onto that line when the document is saved.

A finance administrator normally sets the codes up once at implementation and then touches them only when a statutory rate changes. Every taxable transaction in the tenant — sales, purchasing, POS, e-commerce, self-billed e-Invoicing — reads from this one list.

{{< callout type="warning" >}}
**This applet does not map tax codes to GL accounts.** A tax code has no GL field. The account a tax amount posts to comes from the company's default GL code links `OUTPUT_TAX` (sales-side documents) and `INPUT_TAX` (purchase-side documents), maintained in [Organization](/applets/master-data/organisation-applet/) and [Chart of Account](/applets/master-data/chart-of-account-applet/). See [Lifecycle and effects](#lifecycle-and-effects).
{{< /callout >}}

## Where it fits

| Direction | What | Why |
|---|---|---|
| Before | [Chart of Account](/applets/master-data/chart-of-account-applet/) + [Organization](/applets/master-data/organisation-applet/) | The company default GL code links `OUTPUT_TAX` and `INPUT_TAX` must exist before a taxed document can post. |
| Beside | [MY-SST Applet](/applets/finance/sst-applet/) | Maintains **the same** `bl_fi_cfg_tax_code` rows through its own Tax Code screens, and consumes them for SST-02 filing. |
| After | [Document Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Items can carry a default tax code that pre-fills the document line. |
| After | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) and every other taxable document | Read the list into the line-level SST and WHT drop-downs. |
| After | [MyInvois Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Sends the line's stamped tax **rate** and **amount** to LHDN (the e-Invoice tax *type* comes from a different field — see below). |
| After | [Financial Report](/applets/finance/financial-report-applet/) | Reports on the resulting `OUTPUT_TAX` / `INPUT_TAX` ledger balances. |

## Screens and menus

The applet has a single menu item, **Tax Configuration**, which opens a two-column listing / create / edit workspace.

{{< figure src="/images/tax-config-applet/tax-config-listing.png" alt="Tax Configuration listing" caption="The Tax Configuration listing. Columns: Country, Tax Code, Tax Name, Tax Type, Tax Type Name, Rate (%), Major Industry Code/Tariff Code, Status, Modified Date." >}}

**Listing.** An ag-Grid with floating filters, row grouping, a status bar (total / selected / aggregation) and CSV, Excel and print export. It loads 50 rows at a time from `tax-code-cfg/backoffice-ep`, newest-modified first, and **filters to `ACTIVE` rows by default** — inactive codes are invisible until you set the Status filter in advanced search. The free-text search box covers `tax_country`, `tax_code`, `tax_code_descr` and `tax_gst_type` and rejects keywords shorter than three characters ("Search keyword must more than 2 characters."). The Rate column is stored as a fraction and displayed multiplied by 100.

{{< figure src="/images/tax-config-applet/listing-search-filter.png" alt="Advanced search panel" caption="Advanced search: Country, Tax Type, an Updated Date range behind a checkbox, and Status. Country and Tax Type are multi-select." >}}

**Create.** One tab, *Details*. The **+** button opens it in the second column.

{{< figure src="/images/tax-config-applet/create-tax-type-dropdown.png" alt="Create Tax Configuration with the Tax Type drop-down open" caption="Create Tax Configuration. The Tax Type list is filtered by the Country you chose. Note that the validation hint under the empty Tax Code field reads 'Please insert tax name' — a mislabelled hint, not a different field." >}}

**Edit.** Clicking a listing row opens the same fields plus Status, the read-only audit block (Created By / Created Date / Modified By / Modified Date) and a **Delete** button. **UPDATE** stays disabled until the form is both valid and dirty.

{{< figure src="/images/tax-config-applet/edit-tax-code.png" alt="Tax Configuration Edit" caption="Tax Configuration Edit. Tax Type Name is derived from Tax Type and cannot be typed into; Delete acts immediately, with no confirmation dialog." >}}

**Settings and Personalization.** Reached from the gear at the bottom of the sidebar. The applet contributes two entries under *System Configuration* — **Field Settings** and **Default Selection** — and the shared settings shell adds *Server Side Permissions* (Permission Wizard, Permission Set, User Permission, Role Permission) and *Developer Tools* (Release Notes). Personalization offers *Field Settings* and *Default Selection*.

Three routes exist with no menu entry and are reachable only by typing the URL: `settings/webhook`, `settings/feature-visibility` and `settings/applet-log` (a placeholder card headed "Audit Trail" with no content).

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company default GL code link `OUTPUT_TAX` **with a subledger** | [Organization](/applets/master-data/organisation-applet/) → Company → Default GL Code | Without it the tax line of every sales-side journal is dropped silently and the document fails at FINAL with an out-of-balance error. |
| Company default GL code link `INPUT_TAX` **with a subledger** | [Organization](/applets/master-data/organisation-applet/) → Company → Default GL Code | Same, for purchase-side documents. |
| GL codes for the tax liability / recoverable accounts | [Chart of Account](/applets/master-data/chart-of-account-applet/) | The GL codes and subledgers the two links above point at. |
| Server permission `TNT_API_TAX_CODE_CFG_*` | Settings → Server Side Permissions | Every screen in this applet is gated on these. |

Nothing else is required. The Country list is served from the platform's country assets, and a tax code needs no company, branch, location or numbering configuration.

### Applet settings

Settings for this applet are **applet-local** — it does not use the shared `FieldConfigurationComponent` from `blg-shared-utilities`, and it embeds no inline settings gear on any screen.

**No working applet setting exists.** Both configuration screens are unfinished, and no code anywhere in the applet reads a setting value:

| Screen | What you see | What actually happens |
|---|---|---|
| Settings → **Field Settings** | Two panels, *Lines Settings* (Unit Discount, SST/VAT/GST, WHT, Blanket Order) and *Department Settings* (Segment, G/L Dimension, Profit Center, Project), plus a SAVE button | None of the eight toggles is bound to a form control or a model, and the SAVE button has no click handler. The panel is residue copied from the document-applet settings screen. Nothing is stored and nothing changes. |
| Settings → **Default Selection** | *Applet Default Settings* with Default Branch and Default Location | The component never receives the applet container it writes into, so choosing a branch or location raises a client-side error, and SAVE emits an event that nothing is listening for. Even if it saved, `DEFAULT_BRANCH` and `DEFAULT_LOCATION` are read by nothing in this applet — a tax code has no branch or location. |
| Personalization → **Default Selection** | *User Default Settings*, "This will override Applet Default Settings" | Same component, same two unwired controls; its load subscription is commented out in the source. |
| Personalization → **Field Settings** | — | The menu entry has no matching route; it redirects to the applet's 404 page. |

The behaviour that *is* configurable — which codes appear, at what rate, for which country — is the tax-code data itself, documented under [Fields](#fields).

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Company default GL code links `OUTPUT_TAX` / `INPUT_TAX` | [Organization](/applets/master-data/organisation-applet/) → Company → Default GL Code | Decides which account every tax amount lands in. Not visible or overridable per tax code. |
| Item default tax code | [Document Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) / [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Pre-selects one of these codes on a document line. |
| Entity tax records | [Customer](/applets/master-data/customer-maintenance-applet/) / [Supplier](/applets/master-data/supplier-applet-1/) tax tabs | Hold registration numbers per tax type; they do not restrict which codes a document may use. |

### Feature visibility / permissions

Access is **server-side only**. The controller for `core2/tnt/dm/erp/tax-code-cfg` checks the owner/admin pair plus one action code per operation:

| Operation | Permission code |
|---|---|
| Open the listing / read a code | `TNT_API_TAX_CODE_CFG_READ` |
| Create | `TNT_API_TAX_CODE_CFG_CREATE` |
| Update | `TNT_API_TAX_CODE_CFG_UPDATE` |
| Delete | `TNT_API_TAX_CODE_CFG_DELETE` |
| Any of the above | `TNT_API_TAX_CODE_CFG_OWNER`, `TNT_API_TAX_CODE_CFG_ADMIN` |

The same three read codes gate the listing endpoint `tax-code-cfg/backoffice-ep` and the `tax-code/backoffice-ep` drop-down feed used elsewhere.

There are **no client-side permission definitions** for this applet: `bl_applet_client_side_perm_dfn` has no rows for applet code `taxConfiguration`, and the applet contains no `hasPermission` call, no `HIDE_*`/`SHOW_*` handling and no menu filtering. Everything a user can reach in the applet, they can reach in full — buttons are never hidden by role, only refused by the API.

## Fields

One tab, *Details*. Create and Edit expose the same fields; Status and the audit block appear on Edit only.

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Country | The jurisdiction the code belongs to | Yes | Searchable drop-down, but only four countries are offered: **Malaysia, Singapore, Thailand, Indonesia**. The list is intersected against the applet's own tax-type map, so no other country can be selected. Stored as the country *name* (`Malaysia`), not a code. Changing it on Edit clears Tax Type. |
| Tax Code | The short code shown on documents | Yes | Max 255 characters. Forced to upper case on save. **Unique across the tenant** — enforced by a database constraint on `bl_fi_cfg_tax_code.tax_code`. The validation hint under this field mistakenly reads *"Please insert tax name"*. |
| Tax Name | Human description | Yes | Max 255 characters. Stored as `tax_code_descr`. |
| Tax Type | The behaviour class of the code | Yes | Drop-down filtered by Country (see the table below). |
| Tax Type Name | Friendly name of the selected type | Derived | Read-only; filled in from Tax Type. |
| Tax Rate (%) | Percentage, entered as `6.00` for 6% | No (defaults to `0.00`) | Only validator is *maximum 100*. Stored as a fraction (`0.06`) **rounded to two decimal places** — see Troubleshooting. |
| Major Industry Code / Tariff Code | Free-text classification | No | Max 255 characters. Stored inside `property_json`, not in the `tax_tariff_code` / `tax_industry_code` columns. |
| Status | `ACTIVE` or `INACTIVE` | Edit only | Defaults to `ACTIVE` on the server if not supplied. See the warning below about what INACTIVE does *not* do. |
| Created By / Created Date / Modified By / Modified Date | Audit | Read-only | The two "By" fields are resolved to the user's e-mail-style login and stay blank when no such login principal exists for that subject. |

**Tax types offered, by country**

| Country | Tax types |
|---|---|
| Malaysia | `GST-INPUT`, `GST-OUTPUT`, `SST-SLS-INPUT`, `SST-SLS-OUTPUT`, `SST-SVC-INPUT`, `SST-SVC-OUTPUT`, `WITH-INPUT`, `WITH-OUTPUT` |
| Singapore, Thailand, Indonesia | `VAT-SALES`, `VAT-PURCHASE` |

A type whose code contains `WITH` is stored in the withholding column (`tax_wht_type`); every other type is stored in `tax_gst_type`. That split is what separates the two document-side drop-downs — see [Lifecycle and effects](#lifecycle-and-effects).

{{< callout type="warning" >}}
**Setting a code to INACTIVE does not remove it from documents.** The listing hides it, because the listing filters to `ACTIVE`. The document-side tax drop-downs load every code that is not `DELETED`, so an inactive code is still selectable on a new invoice. To take a code out of circulation you must Delete it — and Delete is permanent for that code string (see Troubleshooting).
{{< /callout >}}

## Lifecycle and effects

**What this applet writes.** One row in `bl_fi_cfg_tax_code` per tax code. No document, no journal, no stock movement, no queue entry.

| Action | Effect |
|---|---|
| CREATE | `POST core2/tnt/dm/erp/tax-code-cfg`. The server fills the guid and revision, defaults blank text columns to `""` and `status` to `ACTIVE`, and stamps created/updated dates. Only two validations exist: `tax_rate_txn` and `tax_rate_filing` must not be null. A duplicate `tax_code` is refused by the database's unique constraint, not by a validator. Toast on success: *"The Tax Config has been created"*. |
| UPDATE | `PUT`. The applet re-fetches the stored row, overlays the form and sends the whole container back, so it also rewrites `tax_rate_txn`, `tax_rate_filing` and both type columns. The only update validation is that the guid exists and the two rate columns are non-null. |
| DELETE | `DELETE /{guid}`. A **soft** delete: the row's status is set to `DELETED` and it stays in the table. There is no confirmation dialog — the button acts on the first click. |

**Both rate columns are written together.** The applet always sets `tax_rate_txn` (used on transactions) and `tax_rate_filing` (used for filing/reporting) to the same value. There is no screen for making them differ.

**How a document picks the rate up.** When a generic document is saved with a line that carries a tax code but no tax type, `GenericDocumentDataConsistencyObject` looks the code up by its `tax_code` string (any row that is not `DELETED`), copies `tax_gst_type` onto the line and overwrites the line's `tax_gst_rate` with the tax code's `tax_rate_txn`. From then on the line holds its own snapshot: **changing a rate here does not restate documents that were already saved.**

**How the tax amount posts.** The tax journal line is built in `JournalPostingService` from the document line's `amount_tax_gst`, and its GL code and subledger come from the company default GL code link whose `txn_code` matches the document type's tax handler — `OUTPUT_TAX` for sales-side types (Sales Invoice, Cash Bill, Receipt Voucher …) and `INPUT_TAX` for purchase-side types. Signs follow the line: an outbound (negative-signum) line debits tax, an inbound line credits it. The tax code itself contributes nothing to this decision.

{{< callout type="warning" >}}
**A half-configured mapping fails silently.** The tax journal line is only added to the journal if a **subledger** guid was resolved from that company GL code link. If the link is missing, or exists with an empty subledger, the tax line is dropped without an error and the document then fails at FINAL with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES`.
{{< /callout >}}

**Where the codes are read.**

- **Line-level SST/GST drop-down** (shared `app-sst` component, used by the document applets' line editors). Loads every non-`DELETED` code, then filters on `tax_gst_type`: on a **SALES** document it keeps only types containing `SST-SLS-OUTPUT`, `SST-SVC-OUTPUT` or `GST-OUTPUT`; everywhere else it keeps types containing `INPUT` or `PURCHASE`. A blank entry is prepended so a line can be left untaxed.
- **Line-level WHT drop-down** (shared `app-wht` component). Keeps every code whose `tax_wht_type` is non-empty, with no sales/purchase split.
- **Advanced-search and listing feeds** — `tax-code-cfg/backoffice-ep` (this applet's listing) and `tax-code/backoffice-ep` (a generic guid/code/description drop-down).
- **MY-SST filing** — the SST-02 workings group transactions by tax code.
- **e-Invoice** — the outbound MyInvois line takes its `tax_rate` from the document line's stamped rate and its tax amount from the line. Its **tax type is not this applet's tax type**: `MyEInvoiceToIRBMappingService` assigns `tax_gst_type` and then immediately overwrites it with the line's e-Invoice taxable type code, so the LHDN classification comes from the e-Invoice taxable-type setup, not from Tax Configuration.

**Columns that look meaningful and are not.** `is_input` and `is_output` are written by this applet but are never read: nothing in the platform sets them as query criteria, and both document drop-downs filter on the tax-type strings instead. `tax_tariff_code` and `tax_industry_code` are never written by this applet. Treat all four as inert.

## Related applets

- **[Chart of Account](/applets/master-data/chart-of-account-applet/)** — owns the GL codes and subledgers that the tax mappings point at.
- **[Organization](/applets/master-data/organisation-applet/)** — owns the company default GL code links `OUTPUT_TAX` and `INPUT_TAX`, which are the real tax-to-account mapping.
- **[MY-SST Applet](/applets/finance/sst-applet/)** — a second maintenance surface over the same tax-code table, plus tax years, tariff codes and SST-02 filing.
- **[Document Item Maintenance](/applets/master-data/doc-item-maintenance-applet/)** and **[Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/)** — carry the default tax code that pre-fills a document line.
- **[Customer](/applets/master-data/customer-maintenance-applet/)** and **[Supplier](/applets/master-data/supplier-applet-1/)** — hold per-entity tax registration details.
- **[Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/)** and **[Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/)** — the two highest-volume consumers of the list.
- **[MyInvois Admin](/applets/e-invoice/my-e-invoice-admin-applet/)** — carries the rate and amount to LHDN.
- **[Financial Report](/applets/finance/financial-report-applet/)** — reports the resulting tax account balances.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A document with tax lines fails at FINAL with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` | The company default GL code link for `OUTPUT_TAX` (sales) or `INPUT_TAX` (purchase) is missing, or exists with an empty subledger. The tax journal line is dropped with no error. | Add or complete the link in Organization → Company → Default GL Code, including the subledger, then re-post. |
| A tax code you deactivated still appears on new invoices | The document drop-downs load every code that is not `DELETED`; only this applet's listing filters to `ACTIVE`. | Delete the code rather than deactivating it — but read the next row first. |
| You cannot re-create a tax code you deleted: create fails on the code | Delete only sets `status = 'DELETED'`; the row remains and the unique constraint on `tax_code` still covers it. | Choose a different code string, or have the row cleaned up at database level. |
| A rate saved as 8.5% comes back as a whole percent | Both create and edit compute `rate / 100` and then round to **two decimal places**, so any fractional percentage collapses to the nearest whole percent (8.5% → 0.09 or 0.08 depending on floating point). | Use whole-percent rates in this applet. Fractional rates can be entered from the MY-SST applet's Tax Code screen, which does not round. |
| Clicking a row opens a blank Edit column, or the applet errors | Edit resolves the stored country by matching `tax_country` against the four supported country **names**. A row whose `tax_country` is anything else — for example `MYS`, which the MY-SST applet writes — finds no match and the screen fails to render. | Edit those rows from the MY-SST applet, or normalise `tax_country` to the full country name. |
| Tax Type Name is blank in the listing for some rows | The listing translates the stored type through the applet's fixed type map. A type created by another tool or an older build (anything outside the ten known `GST-*`, `SST-*`, `WITH-*`, `VAT-*` values) has no entry and shows empty. | Cosmetic. Re-save the code with one of the supported types if the label matters. |
| Advanced search by **Tax Type** never finds withholding codes | The Tax Type filter offers all ten types but always filters the `tax_gst_type` column, and withholding types live in `tax_wht_type`. | Search withholding codes by keyword (the free-text box covers the code and description) instead. |
| Advanced search by **Country** returns nothing for some rows | The Country filter matches full country names against `tax_country`. Rows written with a three-letter code do not match. | Same cause and fix as the blank-Edit row above. |
| A VAT sales code never appears on a Singapore, Thai or Indonesian sales invoice | The shared sales-side drop-down keeps only `SST-SLS-OUTPUT`, `SST-SVC-OUTPUT` and `GST-OUTPUT`; `VAT-SALES` is not in that list. `VAT-PURCHASE` does appear on the purchase side because its name contains "PURCHASE". | Known gap in the shared line editor. Until it is fixed, use a Malaysian output type for the sales side or apply tax at header level. |
| After editing an **input** tax code, its `is_input` flag reads false | The edit mapper's two `if` blocks are not chained, so an input code falls through to the `else` and both flags are cleared. | Cosmetic in practice — nothing reads those columns (see [Lifecycle and effects](#lifecycle-and-effects)). Do not use them for reporting. |
| A user sees the applet but every action returns "not authorized" | The applet has no client-side permission gating, so buttons stay visible even without `TNT_API_TAX_CODE_CFG_*`. | Grant the correct server permission under Settings → Server Side Permissions. |
| The Permission Wizard link in Settings goes to a 404 page | The shared settings shell renders the link for every applet, but this applet has no `permission-wizard-listing` route. | Use Permission Set / User Permission / Role Permission instead. |

## Related documentation

- [Chart of Accounts Setup](/guides/accounting-guides/chart-of-accounts-setup/) — where the tax accounts and their default mappings come from.
- [Journal Entries](/guides/accounting-guides/journal-entries/) — how a posted tax amount reads in the ledger.
- [Financial Accounting module](/modules-v2/financial-accounting/)
- [Core module](/modules-v2/core/)
