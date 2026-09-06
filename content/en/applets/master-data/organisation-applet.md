---
title: "Organization"
description: "Reference for the Organization applet (shown as Organisation Applet in the UI): companies, branches and locations, the company-level settings other applets read at FINAL (Knock Off Configuration, e-Invoice and Peppol, tax defaults, timezone), branch defaults (main location, delivery location, marketplace), labels, groups, category groups, notification templates and the applet's own Field Settings."
applet_code: "Organization_Applet"
applet_repo: "blg-applet-core-akaun-platform-akaun-organisation-applet-v3"
modules: [core, financial-accounting, inventory, e-invoice, ecommerce, pos]
related_applets: [chart-of-account-applet, cashbook-applet, tax-configuration-applet, entity-applet, customer-maintenance-applet, supplier-applet-1, employee-applet, doc-item-maintenance-applet, inv-item-maintenance-applet, pricebook-applet, forex-applet, ledger-and-journal-applet, financial-report-applet, bank-reconciliation-applet, internal-payment-voucher-applet, internal-receipt-voucher-applet, internal-sales-quotation-applet, internal-sales-order-applet, internal-sales-invoice-applet, internal-purchase-invoice-applet, internal-purchase-debit-note-applet, internal-purchase-grn-applet, internal-purchase-grn-stock-in-applet, internal-purchase-gin-applet, blanket-purchase-order-applet, internal-consignment-purchase-order-applet, internal-consignment-gin-applet, internal-goods-delivery-note-applet, pos-general-applet, stock-availability-applet, stock-balance-applet, stock-take-applet, stock-adjustment-applet, stock-transfer-applet, stock-report-applet, consignee-stock-transfer-applet, customer-consignment-applet, delivery-installation-applet, warehouse-management-applet, my-e-invoice-admin-applet, mypeppol-admin-applet, cp-commerce-admin-applet, 90-ecomsync-related-applets, purchase-report-applet, membership-admin-applet, commission-scheme-applet, claim-applet, claim-cycle-applet, car-workshop-applet, custom-processor-applet, merchant-applet, non-stock-and-trade-in-applet, workflow-design-applet]
guides: [/guides/accounting-guides/chart-of-accounts-setup/, /guides/accounting-guides/bank-reconciliation-guide/]
sources:
  configuration:
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/app.routing.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/models/menu-items.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/models/organisation-constants.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/company-edit.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/knock-off-config/knock-off-config.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/knock-off-config/knock-off-by/knock-off-by.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/knock-off-config/knock-off-by/knock-off-by-add/knock-off-by-add.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-create/branch-create.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-edit/branch-edit.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/location-container/location-edit/location-edit.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/state-controllers/branch-controller/store/effects/branch.effects.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/state-controllers/company-controller/store/effects/company.effects.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/shared-utilities/modules/settings/settings.component.html
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_comp_gendoc_flow_config.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_mst_comp.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_mst_branch.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_mst_location.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/model/branchContainers/BranchContainer.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceCompanySetting.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/company/CompanyGenDocFlowConfigController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/company/CompanyGlcodeLinkController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/CompanyDataConsistencyObjects/CompanyGenDocFlowConfigDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/KnockOffWatchdogService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/genericDocumentConverter/GenericDocumentConverter.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/GenericDocEInvoicePostingQueueService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/lhdn/MyEInvoiceLHDNIntegrationHelperService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoicePostingQueueProcessingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceToIRBMappingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TimeZoneHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/BankReconciliationService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/EcomsyncDateWindowResolver.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/MembershipPointsTxnService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/InventoryTransactionLineFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - akaun_master.bl_applet_hdr (code Organization_Applet)
    - akaun_master.bl_applet_client_side_perm_dfn (applet Organization_Applet — no rows)
  fields:
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-create/company-create.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-create/company-create.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/company-edit.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/tax/tax.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/e-invoice-details/e-invoice-details.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/e-invoice-details/e-invoice-details.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/peppol-config/peppol-registration/peppol-registration-create/peppol-registration-details/peppol-registration-details.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/peppol-config/peppol-id-link/peppol-id-link-listing.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/peppol-config/notification-config/notification-config.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/company-edit/intercompany-configuration/intercompany-configuration-add/intercompany-configuration-add.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/company-container/chart-create/chart-create.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-create/branch-create.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-edit/branch-edit.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-edit/marketplace-stock-balance-config/marketplace-stock-balance-config.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-edit/intercompany-configuration/intercompany-configuration-add/intercompany-configuration-add.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-edit/extension-branch/extension-branch.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/location-container/location-create/location-create.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/location-container/location-create/location-create.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/location-container/location-edit/location-edit.component.html
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/location-container/location-edit/extension-location/extension-location-create/extension-location-create.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/notification-template-message-container/notification-template-message-create/notification-template-message-create.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/notification-template-message-container/notification-template-message-create/notification-template-message-language/add-message-language/add-message-language.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/notification-template-message-container/notification-template-message-create/notification-template-message-placeholders/create-placeholder/create-placeholder.component.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/models/notification-template-message-constants.ts
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/settings-container/outlet-type-container/outlet-type-create/outlet-type-create.component.html
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/CompanyService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/LocationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/CompanyDataConsistencyObjects/CompanyDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/CompanyUows/CompanyUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/ddd/DbTableDao.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/InventoryTransactionLineFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/GenericDocEInvoicePostingQueueService.java
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/state-controllers/company-controller/store/effects/company.effects.ts
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/CompanyDataConsistencyObjects/CompanyGenDocFlowConfigDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TimeZoneHandler.java
    - gh:bigledger/blg-intranet#4638
    - gh:bigledger/blg-intranet#5803
    - gh:bigledger/blg-intranet#5618
    - gh:bigledger/blg-intranet#5579
    - gh:bigledger/blg-intranet#5663
    - gh:bigledger/blg-intranet#4031
    - gh:bigledger/blg-intranet#4080
    - gh:bigledger/blg-intranet#4081
    - gh:bigledger/blg-intranet#3380
    - gh:bigledger/blg-intranet#3381
tags:
- core-platform
- organisation
- company-management
- branch-management
- location-management
weight: 30
aliases:
- /applets/organization-applet/
---

## Overview

The Organization applet (menu name **Organisation Applet**, registry code `Organization_Applet`, route `applet/tnt/wavelet/erp/entity/organisation`) is where a tenant administrator defines the legal **Company**, its operating **Branches** and the physical **Locations** that every document, stock movement and report is tagged with. It is also the home of a set of company- and branch-level switches that other applets never show but read at FINAL: the **Knock Off Configuration** that decides whether a finalised document opens a queue for the next document, the company **e-Invoice** and **Peppol** registration, the default **tax codes**, the **timezone**, the branch **main / delivery location** and the branch **marketplace** (EcomSync) rules. Around the core hierarchy it keeps reusable classification records (Company / Branch / Location Groups and Labels, Category Groups) and the **Notification Templates** used for WhatsApp, SMS and e-mail messages on document events.

Create the **Company** first, then a **Branch**, then a **Location** (or let the branch create its default location). Most company-level configuration only appears after the record is saved and reopened in edit mode.

## Where it fits

| Position | Applet / record | Why |
|---|---|---|
| Upstream | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Installs the applet and grants the server-side permissions it uses |
| Upstream | [Chart of Account](/applets/master-data/chart-of-account-applet/) | A chart of accounts must exist to assign to the company; the company's **Default GL Codes** are mapped there, not here |
| Upstream | [Entity](/applets/master-data/entity-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Supply the entity, rounding / group-discount items, pricing schemes, settlement methods and tax codes the company and branch forms pick from |
| Downstream | Every document applet (sales, purchase, stock, POS, vouchers, consignment) | Reads company, branch and location on the document header; at FINAL reads the company Knock Off Configuration, e-Invoice status, skip-e-Invoice flags, branch default location and timezone |
| Downstream | [Chart of Account](/applets/master-data/chart-of-account-applet/), [Financial Report](/applets/finance/financial-report-applet/), [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Companies, branches and locations are the dimensions every ledger, report and stock query is filtered by |
| Downstream | [My e-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/), [MyPeppol Admin](/applets/e-invoice/mypeppol-admin-applet/), [EcomSync](/applets/integrations/90-ecomsync-related-applets/), [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) | Consume the company e-Invoice / Peppol settings, the branch marketplace configuration and the company member-point columns set here |

## Screens and menus

Main menu (left sidebar, `models/menu-items.ts`): **Company**, **Branch**, **Location**, **Category Group**, **Company Group**, **Company Label**, **Branch Group**, **Branch Label**, **Location Group**, **Location Label**, **Notification Template**, **Audit Trail**, plus **Settings** and **Personalization**. All screens use the two-column pattern: a listing on the left, the create or edit panel on the right.

### Company

- **Company Listing** — search by Company Name and Company Registration Number (keywords shorter than 3 characters are rejected); loads ACTIVE companies by default. Columns: Company Code, Company Name, Co. Registration Number, Company Inc. Date, Status, Created Date, Modified Date.
- **Create Company** — two tabs, **Details** and **Address**. The chart of accounts must be chosen (a **+** button creates a chart named `DEFAULT` when none exists yet).
- **Company Edit** — twelve tabs in this default order: **Details**, **E-Invoice**, **Peppol Config** (sub-tabs Peppol Registration, Peppol Ids, Notification Config), **Tax** (Sales / Purchase), **Branch**, **Location**, **Labels**, **Knock Off Config**, **Employee**, **Engagement Access**, **Address**, **Intercompany Configuration**. The order can be changed per tenant in *Settings › Default Selection › Details Tab Ordering*; the E-Invoice tab is hidden when the `HIDE_E_INVOICE_TAB` key is set (see Configuration).

{{< figure src="/images/organisation-applet/edit-company.png" alt="Company Edit showing the Details tab with Company Code, Registration No., Incorporation Date, Tax and SST IDs, Phone Number, Timezone, Currency and Main Branch, and the tab strip Details, E-Invoice, Peppol Config, Tax, Branch, Location, Labels." caption="Company Edit — Details tab. The Timezone and Main Branch fields exist only on the edit screen, not on create." >}}

### Branch

- **Branch Listing** — search by Company and Branch Name; ACTIVE by default. Columns: Branch Code, Branch Name, Company Name, Description, Status, Creation Date, Modified Date.
- **Create Branch** — tabs **Details**, **Address**, **Marketplace**. The first control is the radio **Create default location / Choose from existing location**: with the default, saving the branch also creates a location and records it as the branch main location.
- **Branch Edit** — tabs **Details**, **Address**, **Pick Pack**, **Marketplace** (nested Details, Settlement, Stock Configuration, Stock Availability, Pricing Scheme with No Pricing / Syncing / Synced, Publish Item), **Location**, **Settlement**, **Labels**, **Extension**, **Customer**, **Employee**, **Supplier**, **Intercompany Configuration**. No tab is conditional; the Marketplace tab is always present and its fields change with the selected Marketplace Type.

{{< figure src="/images/organisation-applet/edit-branch.png" alt="Branch Edit showing the Details tab with Branch Code, Branch Name, Company Name, Default Entity Branch, Branch Commencement Date, Timezone and contact numbers, and the tab strip Details, Address, Pick Pack, Marketplace, Location, Settlement, Labels." caption="Branch Edit — Details tab. Default Entity Branch, Main Location, Delivery Location and Timezone are the fields other applets read." >}}

### Location

- **Location Listing** — search by Company Name, Location Name and Status; ACTIVE and INACTIVE rows are both shown unless a status filter is applied. Columns: Location Code, Location Name, Company Name, Description, Status, Creation Date, Modified Date.
- **Create Location** — Details (code, name, company, branch, commencement date, phone, description, **Location Class**) and Address.
- **Location Edit** — tabs **Details** (adds Currency, Status, Outlet Size, Outlet Type), **Address**, **Branch**, **Labels**, **Extension**, **Intercompany Configuration** (target-location stock configuration links).

### Classification records

- **Category Group** — code, name, type (`CP_COM` or `DOC_ITEM`), param code / name, status; the edit view adds a **Categories** tab with image management per category.
- **Company Group / Branch Group / Location Group** — code, name, description.
- **Company Label / Branch Label / Location Label** — code, name, optional group, description. Labels are what gets linked to a company, branch or location (the Labels tab on each edit screen); groups only organise labels.

### Notification Template

Listing (Code, Name, Notification Type, Document Type, Action, Creation Date, Modified Date, Status; ACTIVE by default) and a create/edit panel with tabs **Template**, **Placeholders**, **Languages**, **Endpoints**, **Company**, **Branch**.

{{< figure src="/images/organisation-applet/notification-template.png" alt="Notification Template listing on the left and the Create/Edit panel on the right with Template, Placeholders and Languages tabs; Notification Type WHATSAPP and Document Type INTERNAL_SALES_ORDER selected." caption="Notification Template — the Template tab; Notification Type must be chosen before the Languages tab is usable." >}}

### Audit Trail

Listing of back-office audit events (`audit-trails/backoffice-ep`) with a detail panel; user names are resolved from the tenant user profile.

### Settings and Personalization

*Settings* shows **System Configuration** (Field Settings, Default Selection), **Outlet Settings** (Outlet Type, Outlet Size), **Server Side Permissions** (Permission Wizard, Permission Set, User Permission, Role Permission), **Integration** (Triggers — the shared webhook screen) and **Developer Tools** (Release Notes, Audit Trail). *Personalization* shows Field Settings, Default Selection and Sidebar.

{{< figure src="/images/organisation-applet/field-settings.png" alt="Applet Settings screen with the settings menu (Field Settings, Default Selection, Outlet Type, Outlet Size, Permission Wizard, Permission Set, User Permission, Role Permission, Triggers, Release Notes, Audit Trail) and the Branch › Main Details toggles XTN_MAPPING_01 to 05 and SHOW PARENT BRANCH." caption="Settings › Field Settings — the applet-local toggle screen." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Applet installed and server-side permissions granted | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/), then *Settings › Server Side Permissions* here | Company, branch, location, knock-off and e-Invoice writes are gated by `API_TNT_DM_*` permissions (for example `API_TNT_DM_COMPANY_GEN_DOC_FLOW_CONFIG_CREATE`) |
| A chart of accounts | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Create Company requires one; the **+** next to the field creates a chart coded `DEFAULT` |
| Default GL codes mapped for the company | [Chart of Account](/applets/master-data/chart-of-account-applet/) › Companies › Default GL Codes | This applet never sets them. Posting throws `MISSING_DEFAULT_GL_CODE: <type>` (`JournalPostingService` L339, L412, L448, L490, L526) when a document needs a type that is not mapped. Types read by the posting code: `DEBTOR`, `CREDITOR`, `SALES`, `PURCHASE`, `SALES_RETURN`, `PURCHASE_RETURN`, `SALES_DISCOUNT`, `PURCHASE_DISCOUNT`, `OUTPUT_TAX`, `INPUT_TAX`, `FOREX_GAIN`, `FOREX_LOSS`, `CREDITOR_NOT_INVOICED`, `INVENTORY_NOT_INVOICED`, `CONSIGNMENT_LIABILITY`, `CONSIGNMENT_STOCK`, `STOCK_ADJUSTMENT`, `COGS`, `NSTI` (`JournalPostingTypeHandler` L45–L108) |
| An entity for the company | [Entity](/applets/master-data/entity-applet/) | Optional on create — the backend creates a `CORPORATE` entity when none is given (`CompanyService.createCompany` L78–L81) |
| Rounding and group-discount items | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | The Rounding Item picker lists items of transaction type `DOC_HEADER_ADJUSTMENT`, the Group Discount Item picker `GROUP_DISCOUNT` |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | The company Tax tab picks the default sales / purchase tax code |
| Settlement methods (cashbooks) | [Cashbook](/applets/master-data/cashbook-applet/) | Branch › Settlement and Marketplace › Settlement link settlement methods to the branch |
| Pricing schemes | [Pricebook](/applets/master-data/pricebook-applet/) | Branch Default Pricing, Marketplace › Pricing Scheme and intercompany source-document pricing |

### Applet settings

Settings live in an **applet-local** Field Settings component (`settings/field-settings` routes to the applet's own `FieldConfigurationComponent`, not the shared one in blg-shared-utilities), an applet-local **Default Selection**, and a **Personalization › Default Selection**. All three save through the session store into the applet's `bl_applet_ext` row `APPLET_SETTINGS` (`session.effects.ts` L116–L141); personal defaults go to the personal-settings store. Anyone who can open the applet's Settings menu can change them — no permission check exists in the code.

**Field Settings** (Settings › Field Settings). Every toggle below is declared, rendered, persisted and — except where stated — consumed.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `XTN_MAPPING_01` … `XTN_MAPPING_05` (Branch › Main Details) | Shows the three fields **Xtn Mapping Source NN / Table NN / Value NN** on Create Branch and Branch Edit (`branch-create.component.html` L95–L198, `branch-edit.component.html` L73–L176) | Off (no stored value; the toggle patches whatever is saved) | Enables up to 15 free-text mapping fields stored in `bl_fi_mst_branch.xtn_mapping_source_NN / _table_NN / _value_NN`. The backend only offers them as branch query filters (`BranchUow` L295–L310); no posting logic reads them |
| `SHOW PARENT BRANCH` (`SHOW_PARENT_BRANCH`) | Shows the **Parent branch** picker on Create Branch and Branch Edit (`branch-create.component.html` L84, `branch-edit.component.html` L61) | Off | Writes `bl_fi_mst_branch.parent_branch_guid` |
| `ENABLE_SAVE_WITHOUT_REQUIRED_FIELDS` (Location › Main Details) | On **Location Edit** only: the Save button ignores form validity, the required-field hints are hidden and a blank Status is sent as `ACTIVE` (`location-edit.component.ts` L252, L447–L461) | `false` (explicit initial value) | Lets an incomplete legacy location be saved. Create Location does not read the key — its Save stays disabled until the required fields are filled |
| `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION` (Company › Main Details) | Nothing. The toggle is saved but no component reads the key (repository-wide search, commit 54c1086) | Off | No effect |

**Default Selection** (Settings › Default Selection).

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| **Default Branch** (`DEFAULT_BRANCH`), **Default Location** (`DEFAULT_LOCATION`) | Saved to `APPLET_SETTINGS`, but nothing in this applet reads them — no screen pre-selects a branch or location. Picking a branch pre-fills Default Location from the branch's `MAIN_LOCATION` extension (`default-settings.component.ts` L88–L93) | Empty | None inside this applet |
| **Details Tab Ordering** (`ORGANISATION_DETAILS_TAB_ORDER`) | Drag-and-drop order of the Company Edit tabs; Save stores the list, Company Edit sorts its tabs by it and appends any new tab at the end (`company-edit.component.ts` L293–L309) | Code order (Details, E-Invoice, Peppol Config, Tax, Branch, Location, Labels, Knock Off Config, Employee, Engagement Access, Address, Intercompany Configuration) | Re-orders the tabs for every user of the tenant |

**Keys read without a control.**

| Key | Read by | Effect |
|---|---|---|
| `HIDE_E_INVOICE_TAB` | `company-edit.component.ts` L255 and `getFilteredPanels()` L1232–L1236 | When `true` in `APPLET_SETTINGS`, the company **E-Invoice** tab is not rendered. No toggle exists — the key can only be set by editing the applet's `APPLET_SETTINGS` extension directly |

**Personalization › Default Selection.** Only **Default Language** works: it saves `DEFAULT_LANGUAGE_GUID` / `DEFAULT_LANGUAGE_CODE` through the personal-settings store (`personal-default-settings.component.ts` L91–L106). **Default Branch** and **Default Location** write into an `appletContainer` object that is never initialised (the load subscription is commented out, L41–L49), so changing them raises a console error and saves nothing. The Personalization sidebar also lists **Field Settings**, but no `personalization/field-settings` route is defined (`app.routing.ts` L158–L169), so that link lands on the 404 page.

**Outlet Type / Outlet Size** (Settings › Outlet Settings). Two small master lists — Outlet Type Code / Name / Description and Outlet Size Code / Name / Description (code and name required) — that populate the **Outlet Type** and **Outlet Size** pickers on Location Edit.

The shared-screen tools do not apply to this applet: `kb/tools/applet-scan.sh` and `kb/tools/gates.py` inspect the shared `FieldConfigurationComponent`, which is not routed here.

### Document behaviour settings

Not applicable — this is a master-data applet and creates no documents. The company and branch records it maintains do, however, change how *other* applets' documents behave at FINAL; those are listed in the next two sub-sections.

### Company, branch and location settings that other applets and the backend read

#### Knock Off Configuration (Company › Knock Off Config › Knock Off)

This tab owns table `bl_fi_comp_gendoc_flow_config` — one row per company per source document type → target document type pair. It decides, for **every** document type, whether FINAL leaves anything for the next document to pick up.

| Control | Column | Values | Notes |
|---|---|---|---|
| **Flow Type** | `flow_type` | `LINE` (the only option offered; the backend enum also has `HDR`) | |
| **Server Doc Type 1** (source) | `server_doc_type_1` | Server document types from `GenericDocServerDocTypeService` (backend list) | Required. A preview panel lists the pairs already configured for the chosen source |
| **Server Doc Type 2** (target) | `server_doc_type_2` | Same list | Required; a client-side validator refuses the same type as source ("A document type cannot knock off itself") |
| **Apply to pre-order item only** | `apply_to_preorder_only` | checkbox | Only lines whose item is flagged pre-order are queued |
| **Knock Off** toggle in the grid | `is_enabled` | on / off | Saved immediately from the grid |
| (hidden) | `config_type` | always `KO` on this tab | The **Copy From** tab (`config_type = CP`, flow types `HDR` / `LINE`) is commented out of `knock-off-config.component.html` L6–L8 and does not render |
| (hidden) | `config_mode` | `AUTO` / `MANUAL` | No control on either tab; the backend uses it only in the cyclic-chain check |
| (hidden) | `property_json.doc_2_posting_status` | posting status | Read by the GRN → Purchase Invoice and Delivery Order → Sales Invoice converters to decide the status of the converted document (`GenericDocumentConverter` L142–L151); no control |

What it does at FINAL: the document's primary processor fans out to the secondary job `GENERIC_DOC_LINE_OPEN_QUEUE_PROCESSOR`. `GenericDocLineOpenQueueProcessor.getConfigContainer()` (L80–L97) loads the enabled `KO` rows for the document's company and `server_doc_type_1 = <document type>`. **If the list is empty, no `bl_fi_generic_doc_line_open_queue` rows are created and nothing is logged** (L66–L75). Otherwise every `PNS` line with an open quantity (`quantity_base` minus quantity already knocked off, L123–L133) gets one open-queue row per configured target type. Forex documents are processed through their local-currency shadow document (L60–L63). `KnockOffWatchdogService` (L22–L57) re-queues the job for FINAL documents whose `posting_ko` is still null after 20 minutes. The downstream applet's *Search Document* tab reads these open-queue rows — so a missing or disabled row here is the first thing to check when "the invoice cannot find the order".

Backend validation (`CompanyGenDocFlowConfigDataConsistencyObject`, commit 16e0417b, 2026-08-18): an exact duplicate of company + flow type + source + target is rejected with `API_TNT_DM_ERP_COMPANY_GEN_DOC_FLOW_CONFIG_OBJECT_VIOLATE_UNIQUE_CONSTRAINTS` (L128–L150 create, L255–L278 update); a chain of `AUTO` rows that loops back to its own source is rejected with `..._RECURSIVE_OCCUR` (L120–L127, L323–L350). The backend does **not** reject source = target — only the applet's validator does. Intranet issue #4638 (open) reported both cases being accepted; the duplicate check now exists in the code, the self-pair check is client-side only.

The grid also refuses, client-side, to enable a second target in the GRN family (`INTERNAL_PURCHASE_GRN_STOCK_IN`, `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`, `INTERNAL_SALES_GOODS_RECEIVED_NOTE`, `INTERNAL_SALES_GRN_STOCK_IN`) for the same source while another is enabled — toast *KO Conflict Detected* (`knock-off-by.component.ts` L316–L357). This is a UI guard, not a backend rule.

Pairs the other applet pages depend on (each page names its own): sales order → sales invoice / delivery order, purchase order → GRN / GRN Stock In, GRN → purchase invoice, blanket purchase order → purchase order, stock requisition → outbound stock transfer, consignment purchase order → consignment GRN, and the goods delivery note flows. A stock requisition's own **CREATE ST** button copies lines directly and does not need a row; only the transfer applet's *Search Document › Stock Requisition* path does.

#### Company Details tab

| Setting | Column | Read by |
|---|---|---|
| **Currency** | `bl_fi_mst_comp.ccy_code` | Base currency of the company's `PRIMARY` ledger (`CompanyService.createLedger` L60–L73); the Forex applet filters its document drop-down by it |
| **Timezone** (edit only) | `bl_fi_mst_comp.default_timezone` | `BankReconciliationService` (L429, L954, L1093, L1813 — statement date windows are cast to this zone, `COALESCE(..., 'Asia/Kuala_Lumpur')`), `EcomsyncDateWindowResolver` (L63–L89), `SalesReportMallService`, and `TimeZoneHandler.getTimeZone()` (L21–L50) used by the report row generators. `TimeZoneHandler` is meant to prefer the branch timezone, but its branch lookup runs only when the branch guid is blank (L28), so in practice the company value is used, then the tenant `DEFAULT_TIMEZONE` config, then `Asia/Kuala_Lumpur` |
| **Chart of Account** | `bl_fi_mst_comp.chart_of_acc_guid` | The company appears under *Companies* in the Chart of Account applet, and its Default GL Codes tab renders, only once this is set |
| **Main Branch** | company extension `MAIN_BRANCH` (`value_string`) | Read by the applet's own screens only |
| **Rounding Five Cent / Rounding Item**, **Group Discount Item** | `rounding_five_cent`, `rounding_item_guid`, `group_discount_item_guid` | Company-level fallback for the same branch fields (POS and sales documents) |
| **Default Purchase / Sales Return Pricing Option** | `default_purchase_return_pricing_option` (`LAST_PURCHASE_PRICE`, `MA_COST`, `PURCHASE_INVOICE_PRICE`), `default_sales_return_pricing_option` (`LAST_PURCHASE_PRICE`, `MA_COST`, `SALES_INVOICE_PRICE`) | Return documents' line pricing |
| **Status** ACTIVE / CLOSED with **Company Closed Date** | company extension `CONTACT_INFO.status` / `closingDate` and `ENTITY_STATUS` | Choosing CLOSED asks *Are you sure you want to close?* and the update effect then sets every branch and location of the company to `CLOSED` as well (`company.effects.ts` L740–L800) |

#### Company Tax tab

`default_tax_code_output` + `tax_inclusive_output` (Sales sub-tab) and `default_tax_code_input` + `tax_inclusive_input` (Purchase sub-tab) on `bl_fi_mst_comp` — the tax code and inclusive flag pre-filled on new sales and purchase documents of the company; each document can override them.

#### Company E-Invoice tab

The tab owns the company columns the MyInvois pipeline reads. **E-Invoice Status** is forced to `DISABLED` when a company is created (`company-create.component.ts` L415–L507; the create-form controls are commented out) and is switched on here.

| Setting | Column | Read by |
|---|---|---|
| **E-Invoice Status** `ENABLED` / `DISABLED` | `einvoice_status` | `GenericDocEInvoicePostingQueueService.processGendocForPostingQueue()` L95–L98 queues a document only if it is FINAL **and** the company is `ENABLED` (and the type is valid and not a duplicate). Documents finalised while the company was `DISABLED` are never queued retrospectively |
| **E-Invoice Mechanism** `PEPPOL` / `DIRECT LHDN`, **Batch Line Logic** `BY_BRANCH` / `BY_DOC` / `BY_LINE`, **LHDN Environment** `SANDBOX` / `PRODUCTION` | `einvoice_mechanism`, `einvoice_batch_line_logic`, `lhdn_env_type` | Consolidation and submission services |
| **Send Email To Buyer**, **Disable Consolidated Self Billed Submission**, **Disable Consolidated Submission**, **Disable Single-General Submission**, **Enable high sales value validation** | `einvoice_send_email`, `disable_consolidated_self_billed_submission`, `disable_consolidated_submission`, `disable_single_general_submission`, `enable_high_value_sales_validation` | Consolidation pools and validation |
| **Supplier's TIN** (with *Verify TIN*), **ID Type** (`BRN` only), **Reg./BRN Number**, **SST Reg. Number**, **Tourism Tax Registration Number**, **MSIC / Business Activity Description**, **ATIGA Number**, **FTA Information**, address, contact, e-mail | `einvoice_tax_id_no`, `einvoice_id_type`, `einvoice_id_value`, `sst_registration_id`, `tourism_tax_id`, `sic_code`, `business_activity_desc`, `atiga_number`, `fta_info`, address columns | Supplier block of every submitted e-Invoice. *Verify TIN* calls the LHDN TIN validation and stores `property_json.tinValidated`; a TIN already used by another company is refused client-side |
| **Default E-Invoice Payment Method** | `einvoice_default_payment_method_guid` / `_json` | Payment means on submitted documents |
| **E-Invoice Request Extension Period** | `einvoice_settings_json.einvoice_request_ext_period` | Declared on `EInvoiceCompanySetting`; no backend reader found |
| **Printable** sub-tab | `bl_fi_mst_comp_einvoice_printable_format_hdr` (one printable per document type and priority) | Printable formats of type `E-INVOICE` for the company |

Saving with Status `ENABLED`, an LHDN environment and a TIN also calls `configureIntermediary` for the company (toast *Intermediary System Configured Successfully*).

Four more keys of `einvoice_settings_json` are read by the backend but have **no control in this applet** (set through the API or by support): `einvoice_issuer_type` (`ERP` / `INTERMEDIARY`, default `INTERMEDIARY` — chooses the LHDN token, `MyEInvoiceLHDNIntegrationHelperService` L43–L53), `einvoice_forex_gendoc_posting_logic` (`POST_FOREX_DOC` default / `POST_LOCAL_CCY_DOC` — which of a forex pair is submitted, `MyEInvoicePostingQueueProcessingService` L378–L390; intranet #5803 is the open request for a control), `einvoice_running_no_config` and `einvoice_line_item_desc_config` (running-number and line-description templates, `MyEInvoiceToIRBMappingService` L226–L243, L461–L480; an entity-level override wins).

#### Company Peppol Config tab

- **Peppol Registration** — the participant registration (special identifier `0230:<scheme><business id>`, business card contacts, additional identifier scheme and value, supported document profiles) posted to the Peppol access point; *Post* sets the registration to FINAL, *Sign* uploads the signed KYC PDF.
- **Peppol Ids** — company Peppol participant IDs (`bl_fi_comp_peppol_id`, one flagged default; *Verify Participant ID* checks the directory) and the **Peppol Status** select (`bl_fi_mst_comp.peppol_status`, `ENABLED` / `DISABLED`). The status and IDs are read by the Peppol posting and waiting queue processors (`GenericDocumentPeppolPostingQueueProcessor`, `PeppolPostingQueueToWaitingQueueProcessor`).
- **Notification Config** — checkboxes *peppol*, *email*, *other UCC channels*, *through customer portals* stored in `bl_fi_mst_comp.einvoice_notification_methods_json`.

#### Company Intercompany Configuration and Engagement Access

- **Intercompany Configuration** (`bl_fi_mst_comp_intercompany_setting`) — config name / code, mode `AUTO` (execute upon FINAL) or `MANUAL`, and exactly one document pair per row (Sales Invoice → Purchase Invoice, Sales Invoice → Purchase GRN, Purchase Order → Sales Order, Sales Order → Purchase Order, Sales Return → Purchase Return, Purchase Return → Sales Return, Payment Voucher → Receipt Voucher, Sales Credit Note → Purchase Credit Note, Purchase Invoice → Sales Invoice, Sales Debit Note → Purchase Debit Note, Delivery Order → Purchase GRN). *Copy configs to branches* pushes the company rows to every branch (`intercompany-comp-settings/copy-comp-settings-to-branch`). The branch-level screen (below) is what the intercompany processors read for a document's branch.
- **Engagement Access** (`company-to-company-access-links`) — which other companies this company may reach in the Engagement applet.

#### Company columns with no control in this applet

`member_point_award_doc_in` and `member_point_in_doc_status` (`bl_fi_mst_comp`) decide which document type and posting status award membership points: `MembershipPointsTxnService.docTypeValid()` L639–L645 compares both, and a null value simply means points are never awarded. `posting_final_json` (`includeJobProcessorCode` / `excludeJobProcessorCode`) lets a company include or exclude secondary processors at FINAL (`GenericDocumentPrimaryProcessor.setPostingFinalValues` L103–L115). Neither has a screen here or in the Membership Admin applet; they are set through the company API.

#### Branch Details, Pick Pack, Extension and Marketplace

| Setting | Column / extension | Read by |
|---|---|---|
| **Create default location** (create) / **Main Location** (edit) | `bl_fi_mst_branch.location_guid`, mirrored in branch extension `MAIN_LOCATION` (`branch-create.component.ts` L472, L557; `branch.effects.ts` L244, L516) | `BranchContainer.getDefaultLocation()` L66–L75 (column first, then the extension) → `BranchService.getBranchDefaultLocationGuid()` → `InventoryTransactionLineFactory` L49–L52: stock location precedence is line `delivery_location_guid` → line `guid_store` → header `guid_store` → **branch default location**. At cash-bill FINAL `GenericDocumentService.validateDefaultLocation()` L3339–L3359 (called only for `INTERNAL_SALES_CASHBILL`, L1639–L1643) rejects the document with `GENERIC_DOC_BRANCH_DEFAULT_LOCATION_DOES_NOT_MATCH` when the header location differs from the branch's `location_guid` column |
| **Delivery Location** | `bl_fi_mst_branch.warehouse_location_guid` (`branch.effects.ts` L518) | Delivery and packing documents' default store |
| **Default Entity Branch** | `bl_fi_mst_branch.entity_branch_hdr_guid` | Entity branch used when the branch acts as the trading party (intercompany, consignment) |
| **Timezone** | `bl_fi_mst_branch.default_timezone` | `EcomsyncDateWindowResolver` (branch first, then company); see the `TimeZoneHandler` note above |
| **Skip E-Invoice** | `bl_fi_mst_branch.skip_einvoice` | `GenericDocumentService.isSkipEInvoice()` L3239–L3244 at FINAL: a document is excluded from e-Invoicing if its own flag, **its branch's flag**, or its entity's flag is true |
| **Default Pricing** | `bl_fi_mst_branch.default_pricing_scheme` | Default pricing scheme on documents of the branch |
| **Currency**, **Rounding Five Cent / Rounding Item**, **Group Discount Item** | `ccy_code`, `rounding_five_cent`, `rounding_item_guid`, `group_discount_item_guid` | Branch overrides of the company values (POS) |
| **Tax Applicable** | `bl_fi_mst_branch.tax_applicable` | Stored; no backend or applet reader found (repository search, backend commit 871dbf5c) |
| **Pick Pack** — *Require Delivery Qty Balance On* Internal Sales Order / Internal Sales Invoice / Internal Delivery Order | branch extension `PICK_PACK_QUEUE` (`value_json` keys `INTERNAL_SALES_ORDER`, `INTERNAL_SALES_INVOICE`, `INTERNAL_OUTBOUND_DELIVERY_ORDER`; `branch.effects.ts` L763–L800) | Stored; no reader found in the backend or in the sales order, sales invoice and outbound delivery order applets (the `PICK_PACK_QUEUE` strings there are the `HIDE_PICK_PACK_QUEUE_MENU` settings) |
| **Extension** tab | `bl_fi_mst_branch_ext` rows (Param Code, Value String, Param Type `STRING`); JSON rows such as `PICK_PACK_QUEUE`, `ADDRESS`, `CONTACT_INFO` are hidden from the listing (`extension-branch.component.ts` L76) | Implementation-specific keys; `MAIN_LOCATION` is the one the backend reads |
| **Settlement** tab | branch ↔ settlement-method links | Settlement methods offered on the branch's documents and POS |
| **Marketplace › Details** | branch extensions `MARKETPLACE_TYPE`, `ECOMSYNC_DEFAULT_ENTITY`, `ECOMSYNC_DEFAULT_ENTITY_GUID`, token / generic-resource extensions per platform | EcomSync jobs; one marketplace channel per branch (nothing prevents authorising the same channel on two branches — intranet #4080, open) |
| **Marketplace › Stock Configuration** | `bl_fi_mst_ecomsync_branch.mode_config` (`AUTO`, `MANUAL`, `MKP_SELLER_STOCK_BALANCE`), `stock_balance`, `buffer_config` (`BUFFER` / `PERCENTAGE`), `qty_buffer`, `percentage`, `override_item_stock_config`, `stock_mode` (always sent as `CURRENT`; the Stock Mode control is commented out), `sales_order_config` (`ACTIVE`, `INACTIVE`, `SELECTIVE_ACTIVE`) with the selected branches | Marketplace stock-availability sync (see [EcomSync](/applets/integrations/90-ecomsync-related-applets/)) |
| **Marketplace › Pricing Scheme / Publish Item** | Branch default marketplace pricing scheme; item category and category-group labels queued for publishing | EcomSync price and listing sync |
| **Intercompany Configuration** (branch) | `bl_fi_mst_branch_intercompany_setting` — the eleven company pairs plus *Internal Outbound Stock Transfer → Internal Inbound Stock Transfer*, mode `AUTO` / `MANUAL`, *Auto Final Target Doc*, *Auto Purchase Stock* (forces Purchase Invoice → Sales Invoice and reveals the counterpart entity, source-document pricing scheme and stock-comparison location), *Default APS Config*; *Copy configs from company* pulls the company rows | Intercompany document creation at FINAL |

#### Location

| Setting | Column | Read by |
|---|---|---|
| **Location Class** | `bl_inv_mst_location.location_class`, enum `BASIC` / `CCSG` (`bl_inv_mst_location.java` L294–L297) | The consignment applets treat `CCSG` as a consignee location and filter their location pickers by it; the backend itself only stores and filters the value (no posting logic keys off it). Location Edit shows a third option labelled `TESTTTT` whose value is also `CCSG` (`location-edit.component.html` L173–L177) — leftover test markup, harmless |
| **Company**, **Branch** | `guid_bl_fi_mst_comp`, `guid_bl_fi_mst_branch` | Every stock query and the Location tabs of Company and Branch |
| **Status** ACTIVE / CLOSED (stored `INACTIVE`) | `status` | Listings and pickers |
| **Outlet Type / Outlet Size** | `outlet_type_guid` / `outlet_size_guid` pickers from the Settings master lists | Reporting dimensions |
| **Extension** tab | `bl_inv_mst_location_ext` (Param Code free text, type fixed to `STRING`) | No location extension key is read by the backend |
| **Intercompany Configuration** tab | target-location stock configuration links | Intercompany stock transfers |

The stock-in-transit location every company gets automatically (`L-SIT-<company code>` / `L-STOCK-IN-TRANSIT-<company code>`, `bl_fi_mst_comp.stock_in_transit_location_guid`) is an ordinary `BASIC` location created by `LocationService.createStockInTransitLocation()` L89–L115; the Stock Transfer applet excludes it from *Location To*.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Default GL Codes per company | [Chart of Account](/applets/master-data/chart-of-account-applet/) › Companies › Default GL Codes (`bl_fi_mst_company_glcode_link`, endpoint `company-glcode-links`) | None on this applet's screens; a company created here only becomes postable once mapped there |
| Applet-level `DEFAULT_GL_CODE` extension | `bl_applet_ext` of this applet (no screen) | The Chart Create screen copies its `financialReportSections` onto a newly created chart (`chart-create.component.ts`) |
| Entity-level `einvoice_settings_json` | [Entity](/applets/master-data/entity-applet/) / customer and supplier records | Overrides the company running-number and line-description templates for that entity |
| `SHOW_PICK_PACK_QUEUE_MENU`, `HIDE_PICK_PACK_QUEUE_MENU` | Sales Order, Sales Invoice and Outbound Delivery Order applets | Show or hide their Pick Pack Queue menus; unrelated to the branch Pick Pack tab |

### Feature visibility / permissions

`bl_applet_client_side_perm_dfn` has no rows for `Organization_Applet`, and the applet's code checks no client-side permission codes. Access is controlled entirely by the server-side permission screens under *Settings* (Permission Wizard, Permission Set, User Permission, Role Permission), which map users, roles and teams to the `API_TNT_DM_*` permissions of the Company, Branch, Location, Tenant, Applet, Team, Customer, Label, Currency, Pricing Scheme, Country and Chart of Account services (`resolver/permission.resolver.ts`). One code-level rank check exists: the **Company Code** on Company Edit is read-only unless the logged-in user's rank is `OWNER` or `ADMIN` (`company-edit.component.html`).

## Fields

### Company — Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Company Code | `bl_fi_mst_comp.code` | Yes | Unique — client check against the loaded list (*Company code already exists!*) and backend `COMPANY_HDR_OBJECT_CODE_ALREADY_EXIST` (`CompanyDataConsistencyObject` L52–L60). Read-only after creation except for OWNER / ADMIN ranks |
| Company Name | `name` | Yes | |
| Company Registration No. | `comp_registration_num`; also seeds `einvoice_id_value` | Yes | BRN used on e-Invoices |
| Company Incorporation Date | extension `CONTACT_INFO.companyIncoDate` | Yes | Date picker |
| Tax ID#, SST ID# | `tax_registration_id`, `sst_registration_id` | No | SST ID max 255 characters |
| Phone Number, Fax Number | `phone`; extension `CONTACT_INFO.faxNum` | Phone yes | International telephone input |
| Timezone | `default_timezone` | No | Edit only; IANA zone list from moment-timezone |
| Currency | `ccy_code` | Yes | Backend currency list, MYR first; max 3 characters (`COMPANY_HDR_OBJECT_CCY_CODE_IS_TOO_LONG`) |
| Main Branch | extension `MAIN_BRANCH` | No | Edit only; branches of this company |
| Website, Email, Description, Abbreviation | `website_url` / extension `CONTACT_INFO.website`, `email`, `descr`, `abbreviation` | No | E-mail pattern-validated; blank abbreviation is stored as a single space |
| Entity | `entity_hdr_guid` | No | Edit only; click-through to the Select Entity screen |
| Chart of Account | `chart_of_acc_guid` | Yes on create | **+** creates a chart `DEFAULT` |
| Status, Company Closed Date | extension `CONTACT_INFO.status` / `closingDate`, `ENTITY_STATUS` | Closed date when CLOSED | Closing cascades to branches and locations |
| Rounding Five Cent, Rounding Item, Group Discount Item | `rounding_five_cent`, `rounding_item_guid`, `group_discount_item_guid` | No | Item pickers filtered by transaction type |
| Default Purchase / Sales Return Pricing Option | see Configuration | No | |
| Upload Logo | extension `COMPANY_ATTACHMENT` | No | Image files only (*Please upload a valid image file!*) |
| Created By / Creation Date / Modified By / Modified Date | audit columns | — | Read-only |

### Company — Address

Address Line 1 (required), Address Line 2–5, Postal Code (required), City (required), Country (required, backend list, Malaysia first), State (required, from the country's state list). Stored on `bl_fi_mst_comp.address_line_1..5 / postal_code / city / state / state_code / country` and mirrored into extension `ADDRESS`. Country changes on this tab are pushed into the E-Invoice draft.

### Company — Tax, E-Invoice, Peppol Config, Knock Off Config, Intercompany Configuration, Engagement Access, Employee

Field-by-field lists for these tabs are in *Configuration* above. The remaining link tabs are pickers: **Employee** links employees to the company (`bl_fi_mst_company_employee_link`), **Labels** links an existing or new company label, **Branch** / **Location** open the company-scoped create forms (same fields as the main Branch and Location screens).

### Branch — Details (create and edit)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Create default location / Choose from existing location | radio; existing requires a **Location Code** pick | — | Default *Create default location*; the created location becomes the branch main location |
| Branch Code, Branch Name | `bl_fi_mst_branch.code`, `name` | Yes | Upper-cased; code immutable after creation; duplicate → *Branch code already exists!* |
| Company Name, Company Registration No. | `comp_guid`; registration read-only | Company yes | |
| Parent branch | `parent_branch_guid` | No | Shown only with `SHOW PARENT BRANCH` |
| Default Entity Branch | `entity_branch_hdr_guid` | No | Edit only; entity-branch picker |
| Main Location, Delivery Location | `location_guid`, `warehouse_location_guid` | No | Edit only |
| Branch Commencement Date | extension `CONTACT_INFO.branchCommencementDate` | Yes | |
| Timezone | `default_timezone` | No | Edit only |
| Branch Mobile / Phone / Phone 2 / Fax Number, Branch Email | extension `CONTACT_INFO`, `phone2`, `email` | No | E-mail pattern-validated |
| Currency | `ccy_code` | Yes | Pre-filled from the company |
| Description, Branch Ref 1 / 2 / 3, Abbreviation, Tax Registration Number | `descr`, `branch_ref1..3` (max 255), `abbreviation`, `tax_registration_id` (also extension `BUSINESS_REGISTRATION_NUMBER`) | No | |
| Xtn Mapping Source / Table / Value 01–05 | `xtn_mapping_*` | No | Shown only with the matching `XTN_MAPPING_NN` toggle |
| Default Pricing | `default_pricing_scheme` | No | Edit only |
| GPS in Decimal Degrees, Opening Hours, Show in CP Commerce Store Locator | extensions `GPS_DD`, `OPENING_HOURS`, store-locator flag | No | Edit only |
| Tax Applicable, Skip E-Invoice | `tax_applicable`, `skip_einvoice` | No | Checkbox / slide toggle, default off |
| Rounding Five Cent, Rounding Item, Group Discount Item | `rounding_five_cent`, `rounding_item_guid`, `group_discount_item_guid` | No | |
| Status, Branch Closed Date | `status`, extension `CONTACT_INFO.closingDate` | — | |
| Upload Logo | branch file | No | |

**Address** tab: as for Company (Address Line 1, Postal Code, City, Country, State required), stored in extension `ADDRESS`.

**Pick Pack** tab: three checkboxes, default off (see Configuration). **Settlement**, **Labels**, **Customer**, **Employee**, **Supplier**, **Location** tabs: link pickers with remove actions. **Extension** tab: Param Code, Value String, Param Type.

### Branch — Marketplace

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Marketplace Type | extension `MARKETPLACE_TYPE` | No | `None` (default), Lazada, Shopee, CP Commerce, Magento, Selluseller, Anchanto OMS, Shopify, Tiktok, plus one customer-specific value; the chosen type reveals its own authorisation or token fields (Shopify: access token, store name, API version) |
| Default Entity + Entity | extensions `ECOMSYNC_DEFAULT_ENTITY`, `ECOMSYNC_DEFAULT_ENTITY_GUID` | No | Entity used for marketplace orders |
| Seller Order Allocation Queue (CP Commerce) | branch flag | No | |
| Settlement (marketplace) | branch settlement method for marketplace orders | No | Distinct from the outer Settlement tab |
| Stock Configuration: Stock Config Type, Stock Balance, Buffer Numbers / Stock Balance Percentage, Overwrite Item Config, Location tree (AUTO), Sales Order Config Type + branches | `bl_fi_mst_ecomsync_branch` columns listed in Configuration | Type yes | Buffer and percentage are mutually exclusive |
| Pricing Scheme, Publish Item | default marketplace pricing scheme; category / category-group labels + *run insert queue* | No | Publish Item only queues; it does not push listings immediately |

### Location — Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Location Code, Location Name | `bl_inv_mst_location.code`, `name` | Yes | Upper-cased; code immutable; duplicate → *Location code already exists!* |
| Company, Branch | `guid_bl_fi_mst_comp`, `guid_bl_fi_mst_branch` | Yes | Branch list filtered by company |
| Location Commencement Date | extension `CONTACT_INFO.locationCommencementDate` | Yes | |
| Location Mobile / Phone / Fax Number, Location Email | extension `CONTACT_INFO` | No | Edit shows all four; create shows phone only |
| Currency | `ccy_code` | Yes (edit) | |
| Description | `descr` | No | |
| Select Location Class | `location_class` | No | `BASIC` (default on create) or `CCSG` |
| Outlet Size, Outlet Type | pickers from Settings › Outlet Settings | No | Edit only |
| Status | `status` — `ACTIVE` or `CLOSED` (stored `INACTIVE`) | Yes (edit) | Suppressed by `ENABLE_SAVE_WITHOUT_REQUIRED_FIELDS` |
| Address Line 1–5, Postal Code, City, Country, State | extension `ADDRESS` | Line 1, postal code, city, country, state | |

Save failures on Location Edit show *Failed to save location. Please try again.* or *Request timed out. Please try again.* (30-second race in `location-edit.component.ts` L463–L484).

### Groups, Labels and Category Group

| Screen | Fields | Required | Notes |
|---|---|---|---|
| Company / Branch / Location Group | Group Code, Group Name, Description | Code, name | |
| Company / Branch / Location Label | Label Code, Label Name, Group (optional), Description | Code, name | Duplicate code → *Label code already exists!* |
| Category Group | Category Group Code, Category Group Name, Type (`CP_COM`, `DOC_ITEM`), Param Code, Param Name, Status (`ACTIVE`, `INACTIVE`) | Code, name | Edit adds a **Categories** tab with per-category image management |

### Notification Template

| Tab | Fields | Notes |
|---|---|---|
| Template | Code, Name (required); Notification Type `WHATSAPP` / `SMS` / `EMAIL` (required); Document Type (required, autocomplete over the `INTERNAL_*` document types); Action; Start Date; End Date | Stored in `bl_fi_generic_doc_message_template_hdr` (`msg_type`, `server_doc_type`, `action`, `start_date`, `expiry_date`); a draft is saved with status `TEMP` and becomes `ACTIVE` on the final Save |
| Languages | Language Code (required), Header Title `NONE` / `TEXT` / `MEDIA`, Header Type `IMAGE` / `VIDEO` / `DOCUMENT` / `LOCATION`, Header value or media, Body (required, max 1024 characters, rich text), Footer (max 60) | One `bl_fi_generic_doc_message_template_line` per component (`HEADER`, `BODY`, `FOOTER`, `ATTACHMENT`) and language. For `EMAIL` templates only Language and Body remain |
| Placeholders | Txn Type, Printable Format, Component / Language, Name, Positioning Number (required), Placeholder Type `MANUAL` / `AUTOFILL` (required), Placeholder Source `NAME_CARD_URL` / `QR_CODE_URL` / `AGENT_NAME` / `CUSTOMER_NAME` (required for AUTOFILL), Data Type `TEXT` / `CURRENCY` / `DATE_TIME` / `PHONE` / `URL`, Default Value, Description | `bl_fi_generic_doc_message_template_placeholder_hdr` |
| Endpoints | Channel (required), Endpoint (enabled after a channel is chosen) | `bl_fi_generic_doc_message_template_endpoint_link` |
| Company, Branch | Multi-select of companies / branches the template applies to | `..._company_link`, `..._branch_link` |

### Outlet Type / Outlet Size

Code (required), Name (required), Description.

## Lifecycle and effects

This applet creates no documents, journals, stock transactions or queue rows of its own. It writes master data:

- **Statuses.** Company and branch status is edited as `ACTIVE` / `CLOSED` (the applet stores the choice in the `CONTACT_INFO` and `ENTITY_STATUS` extensions and, for a company, sets its branches' and locations' `status = CLOSED`); location status is `ACTIVE` / `INACTIVE` shown as CLOSED. Listings load ACTIVE rows by default. There is no backend state machine — status is overwritten on update (`CompanyDataConsistencyObject` L90–L96 only requires a value and fills `ACTIVE` on create, L351–L353).
- **Delete** is a soft delete: `CompanyUow.delete()` L113–L128 runs `UPDATE … SET status = 'DELETED'` (`DbTableDao` L415–L419). No validator checks whether documents reference the company, branch or location, so a deleted record simply disappears from pickers while its documents keep the guid. The delete button on Company Edit is commented out; branches and locations have a *Are you sure you want to delete?* confirmation.
- **Creating a company** (`CompanyService.createCompany` L74–L106, one transaction) also creates a `CORPORATE` entity when none is supplied, the company's `PRIMARY` ledger in the company currency, the stock-in-transit location `L-SIT-<code>` (only if `stock_in_transit_location_guid` is null), and fires the `COMPANY_CREATED` webhook. It does **not** create default GL codes, a branch, knock-off rows or a cashbook.
- **Creating a branch** with *Create default location* posts the branch, then the location, then updates the branch's `location_guid` and `MAIN_LOCATION` extension (`branch.effects.ts` L230–L250).

What other documents read from here at FINAL (details and citations in *Configuration*):

| Moment | Reads | Consequence |
|---|---|---|
| Any document FINAL → `GENERIC_DOC_LINE_OPEN_QUEUE_PROCESSOR` | enabled `KO` rows for company + source type | Open-queue rows for the downstream document, or none |
| Any document FINAL | branch and entity `skip_einvoice`; company `einvoice_status` | Whether the document reaches the e-Invoice posting queue |
| Cash bill FINAL | branch `location_guid` | `GENERIC_DOC_BRANCH_DEFAULT_LOCATION_DOES_NOT_MATCH` when the bill's location differs |
| Stock posting | branch default location (fallback of the location precedence) | Where stock moves when neither line nor header names a store |
| Intercompany processors | branch intercompany settings | Mirror document created in the counterpart company |
| Membership points run | company `member_point_award_doc_in` / `member_point_in_doc_status` | Points awarded or not |
| Reports, bank reconciliation, EcomSync windows | company / branch `default_timezone` | Date boundaries |

## Related applets

- [Chart of Account](/applets/master-data/chart-of-account-applet/) — assign the chart here; map the company's Default GL Codes, ledgers, fiscal years and sets of books there. Also the home of the [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) and [Financial Report](/applets/finance/financial-report-applet/) dimensions (company, branch, location).
- [Cashbook](/applets/master-data/cashbook-applet/) and [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) — settlement methods linked on the branch; reconciliation windows use the company timezone.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — tax codes picked on the company Tax tab.
- [Entity](/applets/master-data/entity-applet/), [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Employee](/applets/master-data/employee-applet/), [Merchant Admin](/applets/master-data/merchant-applet/) — the parties linked to branches (Customer / Supplier / Employee tabs) and companies (Employee, Engagement Access); merchants and employees carry company / branch links of their own.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Forex](/applets/master-data/forex-applet/) — rounding / group-discount items, item categories for marketplace publishing, pricing schemes and the company base currency.
- [Sales Quotation](/applets/sales-workflow/internal-sales-quotation-applet/), [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) — sales-side documents that carry the company / branch / location, obey the Knock Off Configuration and (POS) the branch default location.
- [Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/), [Purchase Debit Note](/applets/purchase-workflow/internal-purchase-debit-note-applet/), [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/), [Purchase GIN](/applets/purchase-workflow/internal-purchase-gin-applet/), [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/), [Payment Voucher](/applets/finance/internal-payment-voucher-applet/), [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) — purchase-side documents whose knock-off pairs and default GL types (`CREDITOR_NOT_INVOICED`, `INVENTORY_NOT_INVOICED`, `INPUT_TAX`, …) depend on the company set up here.
- [Consignment Purchase Order](/applets/purchase-workflow/internal-consignment-purchase-order-applet/), [Consignment GIN](/applets/inventory-workflow/internal-consignment-gin-applet/), [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/), [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/) — use the `CCSG` location class and the consignment knock-off pairs.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/), [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/), [Stock Take](/applets/inventory-workflow/stock-take-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/), [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/), [Goods Delivery Note](/applets/inventory-workflow/internal-goods-delivery-note-applet/), [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/) — every stock-moving or stock-reporting applet is keyed by the locations defined here; stock transfers exclude the auto-created stock-in-transit location.
- [Delivery Installation](/applets/delivery-installation/delivery-installation-applet/) — branch and location on shipments and jobs.
- [My e-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/), [MyPeppol Admin](/applets/e-invoice/mypeppol-admin-applet/) — operate on the company e-Invoice and Peppol settings owned by this applet.
- [EcomSync](/applets/integrations/90-ecomsync-related-applets/), [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — the branch Marketplace tab is the EcomSync branch record; CP Commerce website tabs link companies, branches and labels.
- [Membership Admin](/applets/membership/membership-admin-applet/), [Commission Scheme](/applets/membership/commission-scheme-applet/), [Claim](/applets/claims/claim-applet/), [Claim Cycle](/applets/claims/claim-cycle-applet/), [Car Workshop](/applets/sales-workflow/car-workshop-applet/), [Custom Processor](/applets/sales-workflow/custom-processor-applet/) — rules, cycles, filters and rankings are scoped per company or branch defined here (claims: one cycle per company per month; membership: the company member-point columns).
- [Workflow Design](/applets/master-data/workflow-design-applet/) — processes are assigned per company.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The downstream document's *Search Document* tab (invoice from order, GRN from PO, PI from GRN, transfer from requisition…) finds nothing, although the source is FINAL | No enabled Knock Off row for that company and source type existed when the source was finalised, so `GenericDocLineOpenQueueProcessor` created no open-queue rows (L66–L75) | Add or enable the source → target row under *Company › Knock Off Config*; for documents finalised earlier, wait for the knock-off watchdog (documents with `posting_ko` null, older than 20 minutes) or run the queue repair |
| Posting fails with `MISSING_DEFAULT_GL_CODE: <TYPE>` | The company has no default GL code for that transaction type | Map it in *Chart of Account › Companies › Default GL Codes*; the company must have a chart assigned here first |
| Cash bill FINAL fails with `GENERIC_DOC_BRANCH_DEFAULT_LOCATION_DOES_NOT_MATCH` | The POS location is not the branch's **Main Location** (`bl_fi_mst_branch.location_guid`), `GenericDocumentService` L3339–L3359 | Set the branch Main Location to the POS location, or open POS on the branch's main location. The check reads the column, not the `MAIN_LOCATION` extension — branches migrated with only the extension (intranet #3380 / #3381) fail until Main Location is saved once |
| Documents never appear in the e-Invoice queue, with no error | Company **E-Invoice Status** is `DISABLED` (the default on create), or the branch or entity has **Skip E-Invoice** on (`isSkipEInvoice` L3239–L3244). Enabling later does not queue documents finalised before (intranet #5618) | Enable the company, clear the branch / entity flag, then resubmit the affected documents through the e-Invoice applet |
| Both the foreign-currency document and its local-currency shadow were submitted to LHDN | `einvoice_settings_json.einvoice_forex_gendoc_posting_logic` is unset (defaults to `POST_FOREX_DOC`) and no control exists to choose (intranet #5803, open) | Have support set the key; cancel the duplicate submission in the e-Invoice applet |
| *KO Conflict Detected* toast when enabling a knock-off row | Another GRN-family target is already enabled for the same source (client-side guard in `knock-off-by.component.ts` L316–L357) | Disable the other row first |
| Saving a knock-off row returns `..._VIOLATE_UNIQUE_CONSTRAINTS` or `..._RECURSIVE_OCCUR` | An identical company + flow type + source + target row exists, or the new `AUTO` row closes a loop back to its own source (`CompanyGenDocFlowConfigDataConsistencyObject` L120–L150) | Edit the existing row instead; break the cycle |
| Bank reconciliation windows or report rows are a day off | Company **Timezone** is empty, so `Asia/Kuala_Lumpur` is assumed (`BankReconciliationService` L429); the e-Invoice consolidation-by-branch window had a separate timezone bug (intranet #5663, fixed) | Set the company timezone on Company Edit › Details and re-run |
| Stock lands in the branch default location instead of the line's location | Location precedence falls back to the branch default when the line and header carry no store; a return-document path was reported to override the line store intermittently (intranet #5579, open) | Give the line a delivery location or store; for returns, check the stock ledger and correct with a stock transfer |
| *Company code already exists!* / *Branch code already exists!* / *Location code already exists!* | Codes are unique per tenant (client check; backend `COMPANY_HDR_OBJECT_CODE_ALREADY_EXIST` for companies) | Pick another code; codes cannot be changed after creation |
| Personalization › Default Selection branch or location does not stick | Dead code — the container it writes to is never loaded (`personal-default-settings.component.ts` L41–L49) | Nothing to fix here; the applet does not use a default branch or location |
| The company **E-Invoice** tab is missing | `HIDE_E_INVOICE_TAB` is `true` in the applet's `APPLET_SETTINGS` extension | Remove the key (no toggle exists) |
| Location Edit lets an incomplete record be saved / Create Location does not | `ENABLE_SAVE_WITHOUT_REQUIRED_FIELDS` is read by Location Edit only | Expected; fill the required fields on create |
| Notification Template › Placeholders: Txn Type cannot be selected | Reported and closed (intranet #4031) | Update the applet build |
| Marketplace: the same channel is authorised on two branches; the Stock Configuration search box does nothing | No uniqueness check (intranet #4080, open); search not wired (intranet #4081, open) | De-authorise one branch manually; filter the grid by column instead |
| Membership points are never awarded for a company | `member_point_award_doc_in` / `member_point_in_doc_status` are null (`MembershipPointsTxnService` L639–L645) | Set both columns through the company API — there is no screen |

## Related documentation

- [Chart of Accounts setup guide](/guides/accounting-guides/chart-of-accounts-setup/) — creating the company and mapping its default GL codes
- [Bank reconciliation guide](/guides/accounting-guides/bank-reconciliation-guide/) — why the company timezone matters for statement windows
- [Core module](/modules/core/) — where the Organization applet sits in the platform
- [e-Invoice module configuration](/modules/e-invoice/configuration/) — the company e-Invoice and Peppol settings in context
