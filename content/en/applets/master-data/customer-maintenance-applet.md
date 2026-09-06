---
title: "Customer Maintenance"
description: "Reference for the Customer Maintenance applet — the customer master (profiles, addresses, tax and e-Invoice identity, credit terms and limits, categories, conglomerates) that sales, POS, receivables and e-Invoicing read from."
applet_code: "customer_applet_v1"
applet_repo: "blg-applet-akaun-platform-customer-applet"
modules: [core, crm-digital, financial-accounting, pos, e-invoice]
related_applets: [supplier-applet-1, employee-applet, entity-applet, merchant-applet, organisation-applet, tax-configuration-applet, chart-of-account-applet, doc-item-maintenance-applet, internal-sales-invoice-applet, internal-sales-order-applet, accounts-receivable-applet, statement-of-account-applet, my-e-invoice-portal-applet]
guides: [/guides/sales-guides/credit-sales-workflow/]
sources:
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/models/menu-items.ts
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/customer-container/customer-create/customer-create-main/customer-create-main.component.ts
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/customer-container/customer-create/customer-create-main/customer-create-main.component.html
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/customer-container/customer-edit/customer-edit.component.ts
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/customer-container/customer-edit/e-invoice-details/e-invoice-details.component.html
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/customer-container/customer-edit/customer-address/
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/credit-term-container/customer-term-create/customer-term-create.component.html
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/components/credit-limit-container/customer-limit-create/customer-limit-create.component.ts
  - blg-applet-akaun-platform-customer-applet/micro-fe/projects/akaun-platform/applets/customer-applet/src/app/models/customer-constants.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityDataConsistencyObject.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet customer_applet_v1)
tags:
- customer-management
- CRM
- master-data
- credit-control
- b2b-sales
aliases:
- /applets/customer-maintenance-applet/
---

## Overview

The Customer Maintenance applet is BigLedger's **customer master**. A customer must exist here before a sales quotation, sales order, invoice, POS receipt, delivery order or e-Invoice can name them. The record holds who the customer is (corporate or individual, registration and tax numbers), how to reach and deliver to them (addresses, contacts), how they are grouped (categories, category groups, conglomerates, business nature), and the credit term and credit limit that the sales and receivables applets read.

It is used by sales administrators who onboard customers, by finance or credit control who set terms and limits, and by operations teams who import customers in bulk or merge duplicates. It is *master* data only — invoices and orders are viewed in their own applets, although a Statement of Account tab is available on the customer record.

{{< callout type="info" >}}
**Master data vs. transactional data.** Here you manage the enduring rules — who the customer is, where they live, what they may owe. Their invoices and orders live in the sales and finance applets, which pull the customer from this single record.
{{< /callout >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies and branches for Branch Linking, Company Linking and Customer Branch |
| Upstream | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Tax category and codes on the Tax tab |
| Upstream | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | The customer's receivable GL code (`GLCODE_INFO`) |
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Items and pricing schemes used on the Item Pricing tab |
| Sibling | [Supplier](/applets/master-data/supplier-applet-1/), [Employee](/applets/master-data/employee-applet/), [Merchant](/applets/master-data/merchant-applet/), [Entity](/applets/master-data/entity-applet/) | One entity record (`bl_fi_mst_entity_hdr`) can carry several entity types; the Entity Types setting decides which of them this applet may assign |
| Downstream | [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), POS, delivery documents | Every sales document selects a customer and inherits addresses, tax and credit data |
| Downstream | [Accounts Receivable](/applets/finance/accounts-receivable-applet/), [Statement of Account](/applets/finance/statement-of-account-applet/) | Receivable balances by customer |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | Buyer TIN, registration number, SST number, address and contact from the E-Invoice tab go on every e-Invoice |

Modules: Core, CRM, Financial Accounting, POS, E-Invoice.

## Screens and menus

Left menu (any entry can be hidden in Application Settings):

| Menu | What it is for |
|---|---|
| **Customer Listing** | Search, create and edit customers |
| **Category Listing** / **Category Group** | Customer categories and the groups that organise them |
| **Conglomerate** | Corporate families — a code, name, description and status that several customers can be attached to |
| **Credit Term Listing** | Payment terms (year / month / day offsets) that customers are assigned |
| **Credit Limit Listing** | Credit limit amounts by currency |
| **File Import** | CSV import of customers (`DOC_CUSTOMER` template) |
| **Branch File Import**, **Company File Import**, **Employee File Import**, **Customer Category File Import** | CSV import of the corresponding links |
| **Upload Credit Terms**, **Upload Credit Limits** | CSV assignment of terms and limits to customers |
| **File Export** | Export the customer database |
| **Entity Merging** / **Entity Merge Processing** | Merge duplicate entities; the processing screen shows job status (`merge_status`) |
| **Audit Trail** | Change history |

Gear (Settings) menu: **Application Settings**, **Default Selection**, **Business Nature**, **Printable Format Settings**, **Entity Branch Group** and a **Webhook** configuration screen. Personalisation offers a per-user **Default Selection**.

### Customer listing

The listing shows code, name, type, e-mail, phone, incorporation date, fiscal year end, tax registration numbers, business nature, classification and the personal-detail columns for individuals; every column can be hidden tenant-wide (`HIDE_*` under *Customer Listing Settings Hidden*). A second listing implementation (`customer-listing-v2`) exists in the code base for tenants on the newer grid.

### Create customer

The create screen is a single **Main** form. It asks for name, code, nickname, entity type(s), customer type (Corporate or Individual), status, ID type / number / expiry, gender and date of birth (individuals), fiscal year end, tax ID and category, country, currency, description, AR/AP type, phone, e-mail, website, business nature, classification, SST / SST exemption / GST / WHT numbers, GL code, SIC code and business activity description, default sales agent, default label, default sales-return pricing option and an alert message. Defaults come from **Default Selection**: customer type (falls back to `CORPORATE`), country, currency, credit term and credit limit; AR/AP type defaults to `AR_TRADE`, entity type to `CUSTOMER`, status to `ACTIVE`.

### Edit customer

Tabs, in order (each has a `HIDE_*` setting and a matching `SHOW_*_TAB` permission):

Main · E-Invoice · Subsidiary · Peppol Config · Address · Remark · Customer Category · Category Group · Login · Vehicle · Payment Config · Tax · Branch Linking · Customer Branch · Intercompany Branch · Company Linking · Item Pricing · Credit Term and Limit · Membership · Employee · Attachments · Statement Of Account · Documents.

- **E-Invoice** — buyer's name, TIN, ID / registration number, SST number, tourism tax ID, business activity, contact number, e-mail and the full e-Invoice address; a *skip e-Invoice* flag for buyers who do not need one.
- **Subsidiary** — parent / child links between customer records.
- **Peppol Config** — Peppol participant details for cross-border e-Invoicing.
- **Address** — any number of addresses, each with an address type (main, billing, shipping), receiver name, five address lines, city, postcode, state, country, mobile, e-mail and a secondary contact. Default and default e-Invoice address selection is a setting.
- **Customer Category** / **Category Group** — up to 20 category slots, each bound to a category group in Application Settings.
- **Login** — invite the customer to a portal login (optionally installing all applets on invite).
- **Vehicle** — vehicles owned by the customer (workshop and automotive tenants).
- **Payment Config** — settlement methods available to this customer: bank transfer, cash, cheque, credit card, e-wallet, FPX e-mandate, payment gateway, membership point currency, open credit, voucher, others.
- **Tax** — tax category and tax codes.
- **Branch Linking** / **Company Linking** — which of your branches or companies may transact with the customer.
- **Customer Branch** / **Intercompany Branch** — the customer's own branches, and mapping to an intercompany branch when the customer is another company in the group.
- **Item Pricing** — customer-specific item prices (the same data as Entity Pricing in Doc Item Maintenance).
- **Credit Term and Limit** — assign a credit term and a credit limit, and set the customer's credit status to `OK` or `BLACKLISTED`.
- **Membership** — membership plan and points (editing points is permission-gated).
- **Employee** — staff records attached to the customer.
- **Attachments**, **Documents**, **Statement Of Account**, **Remark**.

### Credit terms and credit limits

A **credit term** is a code, name, status and an offset of *years / months / days* added to the document date to compute the due date. A **credit limit** is a code, name, status, currency and amount (two decimals). Both are reusable records assigned to customers on the Credit Term and Limit tab or by CSV upload.

### Conglomerates, categories, business nature

- **Conglomerate** — code, name, description, status; used to report across a corporate family.
- **Category Group** and **Category** — hierarchical classification; slots 0–19 on the customer are each tied to one group.
- **Business Nature** — code and title; a dropdown value on the customer.
- **Entity Branch Group** — code, name, description; groups the customer's branches.
- **Printable Format Settings** — format code and name for customer printables (statements, labels).

### Import, export, merge

- **File Import** uses the `DOC_CUSTOMER` template; the link imports (branch, company, employee, category) and credit term / limit uploads have their own templates and listings.
- **File Export** downloads the customer database for offline editing and re-import.
- **Entity Merging** lets you pick a surviving entity and the duplicates to fold into it; **Entity Merge Processing** shows each merge job's status. Use it instead of deleting duplicates that already have transactions.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Companies and branches | [Organisation](/applets/master-data/organisation-applet/) | Branch / Company Linking; the Customer Branch and Intercompany Branch tabs |
| Receivable GL code | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | The customer's GL code (stored as the `GLCODE_INFO` extension) drives AR posting on sales documents |
| Tax codes and categories | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Tax tab |
| Credit terms and credit limits | this applet | Must exist before they can be assigned; set the tenant defaults in Default Selection |
| Category groups | this applet | Bind a group to each customer category slot in Application Settings before categories can be picked |
| Sales agents | [Employee](/applets/master-data/employee-applet/) | Default sales agent on the customer (can be made mandatory) |
| Items and pricing schemes | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Item Pricing tab |
| Permissions | Applet permission assignment | See *Feature visibility / permissions* |

### Applet settings

**Settings > Application Settings** is one tenant-wide form. Panels and their switches:

**Menu visibility** (first panel)

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_CATEGORY_LISTING`, `HIDE_CONGLOMERATE`, `HIDE_CREDIT_TERM_LISTING`, `HIDE_CREDIT_LIMIT_LISTING`, `HIDE_FILE_IMPORT_MENU`, `HIDE_BRANCH_FILE_IMPORT`, `HIDE_COMPANY_FILE_IMPORT`, `HIDE_EMPLOYEE_FILE_IMPORT`, `HIDE_CUSTOMER_CATEGORY_FILE_IMPORT`, `HIDE_UPLOAD_CREDIT_TERMS`, `HIDE_UPLOAD_CREDIT_LIMITS`, `HIDE_FILE_EXPORT` | Each left-menu entry | off (shown) | Hidden for everyone except holders of the matching `SHOW_*` permission |

**Entity Types**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_CUSTOMER_TYPE`, `HIDE_SUPPLIER_TYPE`, `HIDE_EMPLOYEE_TYPE`, `HIDE_MERCHANT_TYPE` | Which entity types the *Entity Type* multi-select on the customer form offers | off | Prevents users from tagging a customer as, say, a supplier from this applet |

**Customer Listing Settings Hidden** — `HIDE_CUSTOMER_CODE`, `HIDE_CUSTOMER_NICKNAME`, `HIDE_E_TYPE`, `HIDE_EMAIL`, `HIDE_PHONE_NO`, `HIDE_DATE_OF_INCORPORATION`, `HIDE_FISCAL_YEAR_END`, `HIDE_COMPANY_TAX_REG_NUM`, `HIDE_TAX_CATEGORY`, `HIDE_BUSINESS_NATURE`, `HIDE_CLASSIFICATION`, `HIDE_SST_NUM`, `HIDE_SST_EXEMPTION_NUM`, `HIDE_NATIONALITY`, `HIDE_ETHNICITY`, `HIDE_LANGUAGE_CODE`, `HIDE_TITLE`, `HIDE_REGION_CODE`, `HIDE_MARITAL_STATUS`, `HIDE_OCCUPATION`, `HIDE_JOB_TITLE`, `HIDE_JOB_INDUSTRY`, `HIDE_JOB_ROLE`, `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION`, `SHOW_TIN`. Note that `HIDE_CUSTOMER_CODE`, `HIDE_CUSTOMER_NICKNAME` and `HIDE_E_TYPE` also *disable* those fields on the create form.

**Field Settings**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_CONGLOMERATE_FIELD` | Conglomerate dropdown on the customer | off | — |
| `HIDE_SSM_EXPIRY_DATE` | Registration expiry date | off | — |
| `HIDE_ID_REGISTRATION_NUMBER` | ID / registration number | off | — |
| `HIDE_DEFAULT_LABEL` | Default label | off | — |
| Sales-man labels | Custom captions for the sales agent field | — | Presentation |

**Mandatory Fields**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `MANDATORY_ID_REGISTRATION_NUMBER` | ID / registration number required | off | Save blocked without it — recommended for e-Invoice tenants |
| `MANDATORY_EXPIRY_DATE` | Registration expiry date required | off | — |
| `MANDATORY_SALES_AGENT` | Default sales agent required | off | — |
| `MANDATORY_CUSTOMER_CATEGORY` | At least the configured category required | off | — |
| `MANDATORY_CREDIT_TERMS_AND_LIMIT` | Credit term and limit required on the edit screen | off | — |
| `NOT_MANDATORY_PHONE_NO` | Makes the phone number optional | off (phone required) | See Troubleshooting — the create form currently applies this switch the other way round |

**Category Group Settings** — `ENTITY_CATEGORY_GROUP_0_GUID` … `ENTITY_CATEGORY_GROUP_19_GUID`: the category group bound to each customer category slot.

**Tabs and features**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_E_INVOICE_TAB`, `HIDE_SUBSIDIARY_TAB`, `HIDE_PEPPOL_TAB`, `HIDE_ADDRESS`, `HIDE_REMARK`, `HIDE_CUST_CATEGORY`, `HIDE_LOGIN`, `HIDE_VEHICLE`, `HIDE_PAY_CONFIG`, `HIDE_TAX`, `HIDE_BRANCH_LINKING`, `HIDE_INTERCOMP_BRANCH`, `HIDE_INTERCOMPANY_BRANCH_TAB`, `HIDE_COMP_LINKING`, `HIDE_ITEM_PRICING`, `HIDE_CREDIT_TERM_LIMIT`, `HIDE_MEMBERSHIP`, `HIDE_EMPLOYEE`, `HIDE_STAFF`, `HIDE_ATTACHMENT`, `HIDE_STATEMENT_OF_ACCOUNT`, `HIDE_DOCUMENTS`, `HIDE_FILE_IMPORT` | One switch per edit tab (and the file-import button) | off | Hidden for everyone except holders of the matching `SHOW_*_TAB` permission |
| `DEFAULT_ADDRESS_SELECTED`, `DEFAULT_EINVOICE_ADDRESS_SELECTED` | Pre-select the default / e-Invoice address | off | — |
| `INSTALL_ALL_APPLETS_ON_INVITE` | When a customer login is invited, install every applet for them | off | — |
| `DISALLOW_EDIT_MEMBERSHIP_POINTS` | Lock the points field on the Membership tab | off | Overridden per user by `ALLOW_EDIT_MEMBERSHIP_POINTS` |
| `ENABLE_TARGETED_PERMISSION` | Apply targeted (row-level) permissions to the listing | off | Users see only customers their targeted permission covers |
| `DEFAULT_CREDIT_TERM_GUID`, `DEFAULT_CREDIT_LIMIT_GUID` | Defaults applied to new customers (also on Default Selection) | empty | — |

**Default Selection** — `DEFAULT_CUST_TYPE` (Corporate / Individual), `DEFAULT_COUNTRY`, `DEFAULT_CURRENCY`, `DEFAULT_CREDIT_TERM_GUID`, `DEFAULT_CREDIT_LIMIT_GUID`. A per-user copy is available under Personalisation.

### Document behaviour settings

Not applicable — the applet maintains master records. Printable Format Settings only registers format codes and names for customer printables; there is no status flow, approval or e-Invoice submission here.

### Feature visibility / permissions

Client-side permissions registered for `customer_applet_v1`. Each `SHOW_*` permission re-enables, for its holder, a menu or tab the tenant has hidden with the matching `HIDE_*` setting:

| Permission | Unlocks |
|---|---|
| `SHOW_CATEGORY_LISTING`, `SHOW_CONGLOMERATE`, `SHOW_CREDIT_TERM_LISTING`, `SHOW_CREDIT_LIMIT_LISTING`, `SHOW_FILE_IMPORT`, `SHOW_BRANCH_FILE_IMPORT`, `SHOW_COMPANY_FILE_IMPORT`, `SHOW_EMPLOYEE_FILE_IMPORT`, `SHOW_CUSTOMER_CATEGORY_FILE_IMPORT`, `SHOW_UPLOAD_CREDIT_TERMS`, `SHOW_UPLOAD_CREDIT_LIMITS`, `SHOW_FILE_EXPORT` | The corresponding left-menu entry |
| `SHOW_E_INVOICE_TAB`, `SHOW_SUBSIDIARY_TAB`, `SHOW_PEPPOL_TAB`, `SHOW_ADDRESS_TAB`, `SHOW_REMARK_TAB`, `SHOW_CUST_CATEGORY_TAB`, `SHOW_LOGIN_TAB`, `SHOW_VEHICLE_TAB`, `SHOW_PAY_CONFIG_TAB`, `SHOW_TAX_TAB`, `SHOW_BRANCH_LINKING_TAB`, `SHOW_CUSTOMER_BRANCH_TAB`, `SHOW_INTERCOMPANY_BRANCH_TAB`, `SHOW_COMP_LINKING_TAB`, `SHOW_ITEM_PRICING_TAB`, `SHOW_CREDIT_TERM_LIMIT_TAB`, `SHOW_MEMBERSHIP_TAB`, `SHOW_EMPLOYEE_TAB`, `SHOW_STAFF_TAB`, `SHOW_ATTACHMENT_TAB`, `SHOW_STATEMENT_OF_ACCOUNT_TAB`, `SHOW_DOCUMENTS_TAB` | The corresponding edit tab |
| `ALLOW_EDIT_MEMBERSHIP_POINTS` | Edit membership points even when `DISALLOW_EDIT_MEMBERSHIP_POINTS` is on |

Typical pattern: hide the Credit Term and Limit tab for everyone (`HIDE_CREDIT_TERM_LIMIT`) and grant `SHOW_CREDIT_TERM_LIMIT_TAB` to the credit-control role only.

## Fields

### Create customer — Main

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Name | Legal or display name | Yes | — |
| Code | Customer code | No (generated if blank) | Backend rejects a code already used by another customer (`CUSTOMER_CODE_ALREADY_EXISTS`); disabled when `HIDE_CUSTOMER_CODE` |
| Nickname | Short name | No | Disabled when `HIDE_CUSTOMER_NICKNAME` |
| Entity Type | `CUSTOMER`, `SUPPLIER`, `EMPLOYEE`, `MERCHANT` (multi-select) | — | Defaults to `CUSTOMER`; offered types follow the Entity Types settings |
| Type | `CORPORATE` or `INDIVIDUAL` | Yes | Default from `DEFAULT_CUST_TYPE`, else Corporate; decides which identity fields show |
| Status | `ACTIVE`, `INACTIVE`, `TEMP` | — | Default `ACTIVE` |
| ID type / ID number / expiry | Registration (BRN / SSM) or personal ID | ID number when `MANDATORY_ID_REGISTRATION_NUMBER`; expiry when `MANDATORY_EXPIRY_DATE` | Stored in `id_no`; not checked for uniqueness by the backend |
| Gender, Date of birth | Individuals | No | — |
| Fiscal year end, Date of incorporation | Corporates | No | — |
| Tax ID, Tax category | Income-tax identity | No | TIN is shown when `SHOW_TIN` |
| SST number, SST exemption number, GST number, WHT number | Indirect-tax registrations | No | — |
| Country, Currency | Defaults from Default Selection | Currency: Yes | — |
| AR/AP type | Receivable control type | Yes | Default `AR_TRADE` (backend: `DEFAULT_ARAP_TYPE` must not be empty) |
| Phone | Contact number | Yes unless `NOT_MANDATORY_PHONE_NO` | International format picker |
| E-mail, Website | Contact | No | — |
| Business nature, Classification, SIC code, Business activity description | Grouping and e-Invoice business activity | No | — |
| GL code | Receivable control account | No | — |
| Default sales agent | Salesperson defaulted onto documents | When `MANDATORY_SALES_AGENT` | — |
| Default label, Default sales-return pricing option, Alert message | Behaviour defaults and a warning shown on documents | No | — |

### Edit customer — Address

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Address type | Main / billing / shipping | Yes | Documents pick billing and shipping addresses by type |
| Name, Receiver name | Addressee | — | — |
| Address line 1–5, City, Postal code, State, Country | Address | Line 1 in practice | — |
| Mobile no, E-mail | Contact at this address | — | — |
| Secondary contact, phone, e-mail | Alternate contact | — | — |

### Edit customer — E-Invoice

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Buyer's name | Name as registered with LHDN | For e-Invoice | — |
| e-Invoice TIN | Tax identification number | For e-Invoice | — |
| ID number | BRN / NRIC / passport | For e-Invoice | — |
| SST number, Tourism tax ID | Registrations | If applicable | — |
| Business activity description | LHDN business activity | — | — |
| Contact no, E-mail | Buyer contact | Contact no unless `NOT_MANDATORY_PHONE_NO` | — |
| Address name, lines 1–5, city, postcode, state, country | Buyer address | For e-Invoice | — |
| Skip e-Invoice | Do not issue e-Invoices to this buyer | — | — |

### Credit term / credit limit

| Record | Fields |
|---|---|
| Credit term | Code, Name, Status, Set Year, Set Month, Set Day (the offset added to the document date) |
| Credit limit | Code, Name, Status, Currency, Amount (numeric, up to two decimals) |

## Lifecycle and posting

A customer is a master record with a status of `ACTIVE`, `INACTIVE` or `TEMP`; it does not post to the General Ledger. Backend validation on save: customer code and customer ID (`customer_id`) must be unique among non-deleted customers, the AR/AP type must be set, and referenced GL code, default label and consolidated AR/AP entity must exist. Sales documents read the customer's GL code, credit term and credit limit at the time the document is created; enforcement of a credit limit is a property of the document applets, not of this one.

## Related applets

- [Supplier](/applets/master-data/supplier-applet-1/), [Employee](/applets/master-data/employee-applet/), [Merchant](/applets/master-data/merchant-applet/), [Entity](/applets/master-data/entity-applet/) — the same entity table seen through other entity types; a customer can also be a supplier or employee.
- [Organisation](/applets/master-data/organisation-applet/) — companies and branches for linking.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — tax categories and codes on the Tax tab.
- [Chart of Accounts](/applets/master-data/chart-of-account-applet/) — the receivable control account per customer.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — item prices per customer (Item Pricing / Entity Pricing).
- [Sales Order](/applets/sales-workflow/internal-sales-order-applet/) and [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/) — consume the customer, its addresses, tax and credit data.
- [Accounts Receivable](/applets/finance/accounts-receivable-applet/) and [Statement of Account](/applets/finance/statement-of-account-applet/) — balances and statements per customer.
- [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) — uses the E-Invoice tab data as the buyer block.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Save fails with a "customer code already exists" error | Another customer (including inactive ones) has that code | Search the listing with status *All*; reuse the existing record or change the code |
| Save fails with a "customer ID already exists" error | The `customer_id` value (set by imports and integrations, not by the create form) is already on another non-deleted customer | Find the existing record; use Entity Merging if it is a true duplicate |
| Phone number is demanded on create but optional on edit (or the reverse) | The create form binds the phone's *required* flag to `NOT_MANDATORY_PHONE_NO` directly, the edit form and E-Invoice tab to its negation | Set the switch to the value that gives the behaviour you need on the screen you use most, and report it; a code fix is required for consistency |
| A tab or menu is missing for some users only | The tenant hides it (`HIDE_*`) and those users lack the `SHOW_*` permission | Grant the permission or clear the setting |
| Customer not selectable at a branch | Branch Linking / Company Linking excludes that branch | Link the branch or company on the customer |
| e-Invoice rejected for buyer details | E-Invoice tab is empty or the TIN / ID number is wrong | Fill the E-Invoice tab; turn on `MANDATORY_ID_REGISTRATION_NUMBER` so new customers cannot be saved without it |
| Customer category dropdown empty | No category group bound to that slot | Bind `ENTITY_CATEGORY_GROUP_n_GUID` in Application Settings |
| Customer Import listing slow or fires repeated requests | Known defect in older builds of the import listing | Update to the current applet build |
| Sales to a customer are refused with a credit status message | Credit status on the Credit Term and Limit tab is `BLACKLISTED` | Set it back to `OK` once the account is settled |
| Duplicate customers with history | Records cannot be deleted once transacted | Mark one `INACTIVE`, or merge with Entity Merging |

## Related documentation

- [Credit sales workflow](/guides/sales-guides/credit-sales-workflow/) — the guide that sets up a customer with a credit term and limit and then sells on credit.
- [Core module](/modules/core/) and [CRM module use cases](/modules/crm-digital/use-cases/).
- [E-Invoice module configuration](/modules/e-invoice/configuration/) — buyer data requirements.
