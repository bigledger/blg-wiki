---
topic: customer-maintenance
aliases: [customer master, customer applet, debtor master]
applets: [customer_applet_v1]
modules: [core, crm-digital, financial-accounting, pos, e-invoice]
related: [supplier-maintenance, employee, entity, organisation, tax-configuration, chart-of-accounts, credit-limit, e-invoice, doc-item-maintenance, entity-merge]
wiki:
  - content/en/applets/master-data/customer-maintenance-applet.md
  - content/en/applets/master-data/customer-applet.md
status: growing
updated: 2026-09-05
---

# Customer Maintenance (customer master)

The customer record every sales, POS, receivables and e-Invoice document reads: identity, addresses, tax numbers, categories, conglomerate, credit term and limit.

## Facts

- 2026-09-05 — Registry: one ACTIVE row `customer_applet_v1` "Customer Maintenance" (TNT-USER), documentation_url → /applets/customer-maintenance-applet/. The wiki has TWO pages for it (customer-maintenance-applet.md and customer-applet.md); the latter invents a "front desk vs back office" distinction that does not exist. A separate newer registry row `customerprofileapplet` "Customer Profile" (2025-09-25) exists with no page. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo blg-applet-akaun-platform-customer-applet; menus: Customer Listing, Category Listing, Category Group, Conglomerate, Credit Term Listing, Credit Limit Listing, File Import, Branch/Company/Employee/Customer Category File Import, Upload Credit Terms, Upload Credit Limits, File Export, Entity Merging, Entity Merge Processing, Audit Trail. Settings: Application Settings, Default Selection, Business Nature, Printable Format Settings, Entity Branch Group, Webhook. [src:blg-applet-akaun-platform-customer-applet/.../models/menu-items.ts] [src:.../app.routing.ts]
- 2026-09-05 — Application Settings panels: menu hiding (HIDE_*_LISTING / _FILE_IMPORT / _FILE_EXPORT), Entity Types (HIDE_CUSTOMER/SUPPLIER/EMPLOYEE/MERCHANT_TYPE), Customer Listing Settings Hidden (columns), Field Settings, Mandatory Fields (MANDATORY_ID_REGISTRATION_NUMBER, MANDATORY_EXPIRY_DATE, MANDATORY_SALES_AGENT, MANDATORY_CUSTOMER_CATEGORY, MANDATORY_CREDIT_TERMS_AND_LIMIT, NOT_MANDATORY_PHONE_NO), Category Group Settings (ENTITY_CATEGORY_GROUP_0..19_GUID), tab hiding (HIDE_*_TAB etc.), DEFAULT_ADDRESS_SELECTED, DEFAULT_EINVOICE_ADDRESS_SELECTED, INSTALL_ALL_APPLETS_ON_INVITE, DISALLOW_EDIT_MEMBERSHIP_POINTS, ENABLE_TARGETED_PERMISSION. [src:.../field-configuration.component.html]
- 2026-09-05 — Default Selection: DEFAULT_CUST_TYPE, DEFAULT_COUNTRY, DEFAULT_CURRENCY, DEFAULT_CREDIT_TERM_GUID, DEFAULT_CREDIT_LIMIT_GUID. Create defaults: type CORPORATE, arap_type AR_TRADE, eType [CUSTOMER], status ACTIVE. Required on create: name, type, currency, arap_type. [src:.../customer-create-main.component.ts]
- 2026-09-05 — BUG candidate: create form binds phone `[required]="appletSettings.NOT_MANDATORY_PHONE_NO"` while edit form and e-invoice tab use `!NOT_MANDATORY_PHONE_NO` — the switch is inverted on create. [src:.../customer-create-main.component.html L196] [src:.../customer-edit.component.html L233]
- 2026-09-05 — 35 registered client-side permissions, all SHOW_*_TAB / SHOW_<menu> plus ALLOW_EDIT_MEMBERSHIP_POINTS; pattern: SHOW_ permission overrides HIDE_ setting per user. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Edit tabs: Main, E-Invoice, Subsidiary, Peppol Config, Address, Remark, Customer Category, Category Group, Login, Vehicle, Payment Config, Tax, Branch Linking, Customer Branch, Intercompany Branch, Company Linking, Item Pricing, Credit Term and Limit, Membership, Employee, Attachments, Statement Of Account, Documents. Credit status on customer: OK | BLACKLISTED. [src:.../customer-edit.component.ts L259-287]
- 2026-09-05 — Credit term = code, name, status, year/month/day offset; credit limit = code, name, status, currency, amount (2 dp). [src:.../customer-term-create.component.html] [src:.../customer-limit-create.component.ts]
- 2026-09-05 — Backend EntityDataConsistencyObject: CUSTOMER_CODE_ALREADY_EXISTS, CUSTOMER_ID_ALREADY_EXISTS, DEFAULT_ARAP_TYPE_IS_NULL_OR_EMPTY, DEFAULT_LABEL_GUID_DOES_NOT_EXIST, CONSOLIDATED_ARAP_GUID_DOES_NOT_EXIST. [src:blg-akaun-platform-java/javasdk/.../EntityDataConsistencyObject.java]
- 2026-09-05 — Customer statuses: ACTIVE, INACTIVE, TEMP. Settlement types for Payment Config: BANK_TRANSFER, CASH, CHEQUE, CREDIT_CARD, E_WALLET, FPX_EMANDATE, PAYMENT_GATEWAY, MEMBERSHIP_POINT_CURRENCY, OPEN_CREDIT, OTHERS, VOUCHER. [src:.../models/customer-constants.ts]
- 2026-09-05 — Issue: "Manage Customer" tab on Credit Term edit requested (gt#2006, closed 2026-08) but not present in the customer-applet repo's credit-term-edit component as of 2026-09-05. [src:gh:bigledger/blg-int-general-task#2006]

- 2026-09-03 — TIN values are stripped of spaces when the customer is saved; the previous rich-text editor was replaced by an internal WYSIWYG editor. [src:gmail:1a0663d23d98e303]
- 2026-08-11 — A foreign buyer must be keyed with ID type Passport so the document can be submitted as an individual e-invoice; foreign buyers cannot go into a consolidated e-invoice. [src:gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8]
- 2026-09-03 — Customers with no state configured break the legacy-platform sync and e-invoice address construction. [src:gmail:1a0663d23d98e303]

## How it connects
- **e-invoice-submission-errors** — wrong or space-padded TINs are the bulk of Invalid results at month-end; corrections are made here and resubmitted.
- **e-invoice-consolidation** — ID type Passport is the switch that keeps a foreign buyer out of consolidation.

- **credit-limit** — the limit and term are stored here; WHERE a sale is blocked when the limit is exceeded was not found in javasdk domain code for sales documents (only in file-import helpers). Needs the sales-document lane to confirm.
- **e-invoice** — the customer E-Invoice tab is the buyer block (TIN, ID, SST, address, contact, skipEInvoice).
- **entity** — customer/supplier/employee/merchant share bl_fi_mst_entity_hdr; Entity Types setting controls what this applet can assign.
- **doc-item-maintenance** — Item Pricing tab = entity pricing.

## Open questions

- Where is the credit limit enforced (sales order/invoice applet UI vs backend)? Existing wiki text claims a hard block; not verified.
- Should customer-applet.md be merged into customer-maintenance-applet.md (same registry row)? — for Vincent.
- What is `customerprofileapplet` (Customer Profile, 2025-09)? No repo found under that slug; no wiki page.

## Wiki impact

- customer-applet.md: duplicate of the same applet; merge or redirect (alias) to customer-maintenance-applet.
- internal-sales-order / internal-sales-invoice pages (lane for sales-workflow): state how credit term/limit and BLACKLISTED status are applied when a customer is selected.
