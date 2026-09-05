---
title: "Merchant Admin"
description: "Reference for the Merchant Admin applet — the merchant view of the shared entity master (payment-gateway merchant code and key, Peppol IDs, logins, return URLs, tax, bank details, addresses, contacts, company links, merchant branches, credit terms and limits, logo), merchant contracts with rate cards and charge rates, the monthly merchant transaction summary report, and the entity event audit trail."
applet_code: "MerchantAdminApplet"
applet_repo: "blg-applet-akaun-platform-merchant-applet"
modules: [core, ecommerce, e-invoice]
related_applets: [entity-applet, customer-maintenance-applet, supplier-applet-1, employee-applet, organisation-applet, tax-configuration-applet, cashbook-applet, chart-of-account-applet, mypeppol-admin-applet, my-e-invoice-admin-applet, seller-admin-applet, tenant-admin-applet]
guides: []
sources:
  configuration:
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/app.routing.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/models/menu-items.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/models/merchant-constant.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-create/merchant-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-create/merchant-create.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/shared-utilities/session-controller/effects/session.effects.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/shared-utilities/modules/settings/settings.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/resolver/permission.resolver.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entity/EntityController.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet MerchantAdminApplet — no rows)
  fields:
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-listing/merchant-listing.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-create/merchant-create.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-create/merchant-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-edit.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-edit.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/peppol-config/peppol-id-link/peppol-id-link-details/peppol-id-link-main-details/peppol-id-link-main-details.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/peppol-config/peppol-id-link/peppol-id-link-details/peppol-id-link-main-details/peppol-id-link-main-details.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/peppol-config/notification-config/notification-config.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-login/login-create/login-create.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-login/login-create/login-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-contract/create-contract/create-contract.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-returnURL/merchant-create-returnURL/merchant-create-returnURL.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-returnURL/merchant-create-returnURL/merchant-create-returnURL.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-tax-billing/merchant-create-tax/merchant-create-tax.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-tax-billing/merchant-create-tax/merchant-create-tax.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-payment-config/merchant-create-payment/merchant-create-payment.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-payment-config/merchant-create-payment/merchant-create-payment.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-address/merchant-add-address/merchant-add-address.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-contacts/merchant-contacts-add/merchant-contacts-add.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-company/entity-company-listing/merchant-company-create/merchant-company-create.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-company/entity-company-listing/merchant-company-create/merchant-company-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-intercompany-branch/intercompany-branch-create/intercompany-branch-create.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-intercompany-branch/intercompany-branch-create/intercompany-branch-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/credit-termslimits-main/credit-terms-edit/credit-terms-edit.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/credit-limits-main/credit-limits-edit/credit-limits-edit.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-logo/merchant-add-logo/merchant-add-logo.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-listing/contract-listing.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-create/contract-create.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-create/contract-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-edit/contract-edit.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-edit/contract-edit.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-edit/edit-rate-card/create-rate-card/create-rate-card.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-edit/edit-rate-card/create-charge-rate/create-charge-rate.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-edit/edit-rate-card/create-charge-rate/create-charge-rate.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-edit/edit-rate-card/payment-channel-listing/payment-channel-listing.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/report-container/report-listing/report-listing.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/report-container/report-view/report-view.component.html
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/audit-trail-container/contract-listing/audit-trail-listing.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/shared-utilities/models/entity-constant.model.ts
  lifecycle:
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/state-controllers/merchant-controller/effects/merchant.effects.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/facades/view-column.facade.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/entity-services/merchant.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/pgw/merchant-contract.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/pgw/ratecard.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/pgw/ratecharge.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/pgw/merchant-txn-report.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entity/EntityController.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_mst_entity_hdr.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/EntityUows/EntityUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/merchant/PgwMerchantContractHdrController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/pgw/PgwMerchantContractHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/MerchantContractDataConsistencyObjects/PgwMerchantContractHdrDataConsistencyObject.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/merchant/PgwMerchantRateCardController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/merchant/PgwMerchantRateHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/pgw/PgwMerchantMonthlyReportController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/pgw/PgwMerchantMonthlyReportProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/JobProcessorClassName.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/pgw/my/IPay88Controller.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/pgw/PgwBackendController.java
  troubleshooting:
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-create/merchant-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-edit.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/merchant-admin-container/merchant-edit/merchant-login/login-create/login-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-create/contract-create.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/contract-container/contract-edit/contract-edit.component.ts
    - blg-applet-akaun-platform-merchant-applet/micro-fe/projects/akaun-platform/applets/merchant-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/MerchantContractDataConsistencyObjects/PgwMerchantContractHdrDataConsistencyObject.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/pgw/PgwMerchantMonthlyReportProcessor.java
    - gh:bigledger/blg-applet-akaun-platform-merchant-applet#1
    - gh:bigledger/blg-applet-akaun-platform-merchant-applet#2
    - gh:bigledger/blg-int-marketing#710
    - gh:bigledger/blg-int-marketing#601
    - gh:bigledger/blg-wiki#168
tags:
- master-data
- merchant-management
- platform-administration
- onboarding-workflow
- contract-lifecycle
weight: 150
---

## Overview

Merchant Admin is the **merchant view of BigLedger's shared entity master**. A merchant is a row in the same `bl_fi_mst_entity_hdr` table that holds customers, suppliers and employees, with the `is_merchant` flag set and two payment-gateway credentials of its own — a **PGW Merchant Code** and a **Merchant Key**. This applet is where you create that row, attach everything the platform needs to deal with the merchant (Peppol participant IDs, portal logins, checkout return URLs, tax codes, bank accounts, addresses, contacts, company links, merchant branches, credit terms and limits, a logo) and then write the commercial side as **merchant contracts**, each with rate cards, payment channels and charge rates.

It is opened by the platform or finance administrator who onboards partner businesses that sell or collect payments through the tenant — an e-commerce arm running third-party sellers, or a group company that operates its own payment gateway. Upstream it needs companies, tax codes and settlement methods; downstream the payment-gateway callbacks, the Peppol / e-Invoice applets and the monthly merchant transaction report read what is saved here.

{{< callout type="info" >}}
**Merchant Admin is not the [Organisation applet](/applets/master-data/organisation-applet/).** Organisation maintains *your own* companies, branches and locations. Merchant Admin maintains *external* businesses that transact on your platform: they have their own gateway credentials, contracts and rate cards. A merchant can also be a customer, supplier or employee at the same time — it is the same entity row, just with more flags (see [Entity Maintenance](/applets/master-data/entity-applet/)).
{{< /callout >}}

A recorded walkthrough of the applet (merchant setup, contracts and rate cards, payment configuration, tax and billing, reports, audit trail):

{{< youtube c-Yc6bo7_Jw >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies for the *Contract Company* picker and the Company Linking tab; branches for the Merchant Branch tab |
| Upstream | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Tax codes offered on the Tax & Billing tab and the Merchant Branch control-account section |
| Upstream | [Chart of Account](/applets/master-data/chart-of-account-applet/) | GL codes and subledgers for the Merchant Branch control account |
| Upstream | [Cashbook](/applets/master-data/cashbook-applet/) | Settlement methods read by the Payment Config tab |
| Upstream | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Confirmed tenant logins that the Login tab verifies and invites |
| Sibling | [Entity Maintenance](/applets/master-data/entity-applet/), [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Employee Maintenance](/applets/master-data/employee-applet/) | Same table, same rows; each sibling edits its own entity type |
| Downstream | Payment-gateway callbacks (`PgwBackendController`, `IPay88Controller`) | Verify callback signatures with the merchant key copied onto the payment transaction header |
| Downstream | [My Peppol Admin](/applets/e-invoice/mypeppol-admin-applet/), [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Peppol participant IDs and the e-Invoice notification methods saved on the merchant row |
| Downstream | Merchant monthly report job (`PGW_MERCHANT_MONTHLY_REPORT_PROCESSOR`) | Reads the merchant's rate cards and charge rates to price each payment channel per month; the result is the applet's **Report** menu |
| Downstream | [Seller Admin](/applets/ecommerce/seller-admin-applet/) | Uses the merchant entity as the seller identity for order and fulfilment work |

Modules: Core, E-Commerce, E-Invoice.

## Screens and menus

Left menu (route `applets/wavelet/erp/entity/merchant-applet/…`; the registry name is *Merchant Admin* and the UI banner still says *Merchant Applet*):

| Menu | What it is for |
|---|---|
| **Merchant** | Listing, create and edit of merchant entities — the main working area |
| **Contract** | Listing, create and edit of merchant contracts (`bl_pgw_merchant_contract_hdr`) with their rate cards and charge rates |
| **Report** | The monthly merchant transaction summary (`bl_pgw_monthly_merchant_txn_summary_report_line`) — read-only |
| **Audit Trail** | Entity events (`bl_fi_mst_entity_event`) written by this applet: Create Merchant, Edit Merchant, Create Charge Rate, Update Payment Channels… |

Gear (Settings) menu: *System Configuration* › **Field Settings**, **Default Selection**; the shared settings frame adds *Server Side Permissions* (Permission Wizard, Permission Set, User / Team / Role Permission), *Integration* › **Triggers** (webhooks) and *Developer Tools* › Audit Trail, Reset Applet State. Only Field Settings, Default Selection, Permission Set, User / Team / Role Permission and Triggers have a route in this applet; Permission Wizard, the developer Audit Trail and Reset Applet State are links without a route and land back on the merchant listing. **Feature Visibility** is routed (it is the default settings page) but has no menu link. **Personalization** lists *Field Settings* (no route under personalization) and *Default Selection*; a *Sidebar* route exists without a menu entry.

### Merchant listing

Columns: Merchant ID (the `ID_INFO` extension), Merchant Name, Merchant Company (the `COMPANY_INFO` extension), Status, Creation Date, Updated Date. Keyword search plus column filters. **+** opens the create form; clicking a row opens the edit form.

### Create form

A single panel. **CREATE** is enabled only when every starred field is filled (see [Fields](#fields)). Status defaults to ACTIVE, Merchant Type to CORPORATE and Entity Type to MERCHANT.

{{< figure src="/images/merchant-applet-applet/merchant-applet-create-form.png" alt="Create Merchant form with Merchant ID, Merchant Name, Merchant Company, Company Registration No, Merchant Type, AR/AP Type, PGW Merchant Code, Merchant Key, Status and Description" caption="Create Merchant. Entity Type is hidden here because the tenant has HIDE_ENTITY_TYPE switched on in Field Settings." >}}

### Edit form

Tabs, in order: **Details**, **Peppol Config** (inner tabs *Peppol Ids*, *Notification Config*), **Login**, **Contract**, **Return URL**, **Tax & Billing**, **Payment Config**, **Address**, **Contact**, **Company Linking**, **Merchant Branch**, **Credit Limit and Terms** (inner tabs *Credit Term*, *Credit Limit*), **Logo**.

How the tabs save differs:

- The header **Save** writes the Details tab, the Notification Config checkboxes and every row staged on **Return URL**, **Tax & Billing**, **Payment Config**, **Address**, **Contact**, **Credit Term** and **Credit Limit** in one `PUT` of the entity container (`merchant-edit.component.ts` `onSave()`, L520-780). Until you press Save those rows exist only in the browser.
- **Peppol Ids**, **Login**, **Contract**, **Company Linking**, **Merchant Branch** and **Logo** save immediately through their own services when you press Add / Save / Create inside the panel.
- **Remove** on the Details tab deletes the merchant at once — there is no confirmation dialog (`onRemove()`, L833-851; see [Lifecycle and effects](#lifecycle-and-effects)).

{{< figure src="/images/merchant-applet-applet/merchant-applet-peppol-config-tab.png" alt="Peppol Config tab, Peppol Ids listing with Peppol Participant ID and Is Default columns, and the Add Peppol Participant ID panel with Verify Participant ID button and Default toggle" caption="Peppol Config › Peppol Ids. Verify Participant ID calls the Peppol participant lookup before the ID can be added." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-notification-config-subtab.png" alt="Notification Config with four checkboxes: peppol (only applicable if valid peppol id), email, other UCC channels, through customer portals" caption="Peppol Config › Notification Config. The four checkboxes are saved as einvoice_notification_methods_json on the merchant row when you press the header Save." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-return-url-tab.png" alt="Return URL tab listing URL Code, URL Name, Success Return URL and Error Return URL, with the edit panel showing the two toggles" caption="Return URL. Each toggle reveals its URL field; the rows are stored as URL_INFO extensions." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-tax-billing-tab.png" alt="Tax & Billing tab listing Country, Tax Code, Tax Type, Tax Rate and Tax Option with the Add Tax panel" caption="Tax & Billing. Country is chosen first; Tax Type and Tax Code are filtered to that country's tax codes." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-payment-config-tab.png" alt="Payment Config tab with Payee Residential Status, Country, Bank, Swift Code, Bank Acc No., Bank Acc Holder Name, IBN Number and Account Expiry" caption="Payment Config. Bank details for paying the merchant out; Payee Residential Status and Country are mandatory." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-address-tab.png" alt="Address tab listing and the Add New Address panel with Address Name, Address Type, Address 1-5, Country, State, City, Postal Code and Set as default" caption="Address. Rows are written into the merchant's addresses_json on Save." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-contact-tab.png" alt="Contact tab listing Contact ID, Contact Name, Mobile Number, Email Address, Contact Tag and the Create Contact panel" caption="Contact. Contacts become CONTACT_INFO entity lines." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-company-linking-tab.png" alt="Company Linking tab with Company Code, Company Name and AR/AP Type columns and the Add Company Linking panel" caption="Company Linking. One link per company; the panel refuses a company that is already linked." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-credit-limit-subtab.png" alt="Credit Limit sub-tab listing and the Credit Limit Edit panel with Code, Name, Status, Currency, Credit Limit Amount and audit fields" caption="Credit Limit and Terms › Credit Limit. Existing or new limit profiles; the rows are CREDIT_LIMIT extensions saved with the header Save." >}}

{{< figure src="/images/merchant-applet-applet/merchant-applet-logo-tab.png" alt="Logo tab with an empty image listing and the Upload Logo drop zone" caption="Logo. The file is attached to the entity as a SYS_MERCHANT_LOGO extension." >}}

### Contract screens

**Contract listing** columns: Contract Code, Contract Name, Contract Company, Merchant Contract Key, Status, Creation Date, Updated Date. **Create** has Contract Name, Contract Code (computed, read-only), Merchant, Contract Company and Status. **Edit** has tabs **Details**, **Rate Card** and **Annex**; the contract opened from a merchant's own *Contract* tab shows **Details**, **Rate Card** and **Audit Trail** instead. Inside Rate Card: a rate-card listing (Rate Card Code, Rate Card Name, Rate Card Status) → payment-channel listing for the selected card → charge-rate listing per channel, each level with its own create / edit panel.

{{< figure src="/images/merchant-applet-applet/merchant-applet-contract-create-form.png" alt="Create Contract form with Contract Name, Contract Code C00010 (read-only), Merchant, Contract Company and Status" caption="Create Contract. The code is the highest existing C-number plus one, computed in the browser." >}}

### Report

Listing columns: Merchant ID, Merchant Name, Payment Channel, Currency, PC Charge Name 1-4 and PC Charge 1-4 (%/$), VAT %, Unrecoverable VAT %, network charges per transaction ($ and %), network Charge Name 1-4 and Charge 1-4, # of Txn, Total Amount, Download. Clicking a row opens a read-only view of the same charges. The column group labelled with the payment network's own name in the UI is described generically here.

### Audit Trail

Listing columns: Merchant Name, Action, Event Code, User (the subject guid), Date — the `bl_fi_mst_entity_event` rows this applet writes (`entity/events`). It is a log of *actions*, not a before/after field diff.

## Configuration

### Before you can use it

- **Companies** in the [Organisation applet](/applets/master-data/organisation-applet/) — every contract needs a *Contract Company* (`PgwMerchantContractHdrDataConsistencyObject` `COMP_GUID_IS_NULL` / `GUID_COMP_DOES_NOT_EXIST`, L54-66), and the Company Linking tab picks from the same list. Branches are needed for the Merchant Branch tab.
- **Tax codes** in [Tax Configuration](/applets/master-data/tax-configuration-applet/) — Tax & Billing filters by the chosen country (`merchant-create-tax.component.ts` L130); the Merchant Branch panel offers SST/GST and WHT codes and the MyInvois tax type codes.
- **GL codes and subledgers** in [Chart of Account](/applets/master-data/chart-of-account-applet/) for the Merchant Branch control account (`intercompany-branch-create.component.ts` L150-175).
- **Settlement methods** in the [Cashbook applet](/applets/master-data/cashbook-applet/) — read by Payment Config (`merchant-create-payment.component.ts` L275).
- **Banks and countries** — the Payment Config *Bank* and *Country* lists come from the shared bank and country services (L198-222).
- **Merchant code prefix / running number** — the create form never sends `merchant_code`, so the backend generates it from the `MERCHANT_ID` running number plus the tenant's merchant prefix (`EntityDataConsistencyObject` `getNextRunningNumbers` → `buildEntityCode`, L1396-1410). The *Merchant ID* you type is a different thing: an `ID_INFO` extension used for display only.
- **Server-side permissions** — creating a merchant needs `TNT_API_ERP_MERCHANT_ENTITY_CREATE` (or the merchant-entity owner / admin permission); update and delete need the matching `_UPDATE` / `_DELETE` codes (`EntityController` handler map, L131-139). Contract, rate-card and charge-rate writes need the tenant owner / admin role or the permission list checked in their controllers, with the contract's company as the permission target.

### Applet settings

Settings are **applet-local**: `settings/field-settings` renders this repo's own `FieldConfigurationComponent`, saved through the shared session effect into the applet's `APPLET_SETTINGS` extension (`session.effects.ts` L115-141). The shared document-applet Field Configuration screen is not used. Anyone with access to the Settings menu can change them; they apply tenant-wide.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_E_TYPE` (labelled **HIDE_ENTITY_TYPE**, panel *Main Details*) | Hides the **Entity Type** multi-select on the **create** form (`merchant-create.component.ts` L151, template `[hidden]="form.get('eType').disabled"`) | Off (the toggle is patched from the stored value; a never-saved tenant has no value, so the field shows) | On: the control is disabled and hidden, so the create request carries no entity-type flags; the backend still sets `is_merchant` because the request goes through the `merchants` entity-type handler (`EntityController.createSpecificEntity`, L237-243). CUSTOMER / SUPPLIER / EMPLOYEE cannot be added at creation. The **edit** form ignores this setting — Entity Type is always visible there |

That is the only key that passes the declared / rendered / persisted / consumed test. Also on the screen but **not saved** (checked at commit cd6ac3e1):

- *Lines Settings* — Unit Discount, SST/VAT/GST, WHT, Blanket Order — and *Department Settings* — Segment, G/L Dimension, Profit Center, Project: eight slide toggles with no form control (`field-configuration.component.html` L20-56). They are a copy of a document-applet panel.
- **Default Selection** (*Default Branch*, *Default Location*): the pickers write `DEFAULT_BRANCH` / `DEFAULT_LOCATION` into an applet container that is never loaded (`appletSettings$` is an input the route does not bind; `appletContainer` is undefined), so choosing a value fails, and **SAVE** emits an output nobody listens to (`default-settings.component.ts` L30-66). Nothing in the applet reads either key.
- **Personalization › Default Selection**: same code, same result (`personal-default-settings.component.ts` L31-75).

{{< figure src="/images/merchant-applet-applet/merchant-applet-settings-general.png" alt="Applet Settings with Field Settings selected showing the HIDE_ENTITY_TYPE toggle under Main Details, and collapsed Lines Settings and Department Settings panels" caption="Settings › Field Settings. Only HIDE_ENTITY_TYPE is bound; the two collapsed panels hold unbound toggles." >}}

### Document behaviour settings

Not applicable — master data; no statuses beyond the entity and contract status fields, no posting, no printables.

### Settings in other applets that control this applet

None found: the applet reads no company, branch or other-applet settings (every `selectMasterSettings`, `HIDE_*`, `SHOW_*` and `DEFAULT_*` read in the repo checked at commit cd6ac3e1).

### Feature visibility / permissions

- **Client-side permissions:** `bl_applet_client_side_perm_dfn` holds **no rows** for `MerchantAdminApplet`, and the applet checks no `SHOW_*` codes. Feature Visibility is the shared *Manage Team Access* screen only.
- **Server-side permissions:** the Permission Set / User / Team / Role routes are the shared containers; this applet's `PermissionResolver` maps permission targets to Company, Branch, Location, Applet, Tenant, Team, Hostname, PGW Merchant Contract Hdr, Merchant Rate Card, PGW Payment Channel, Merchant Rate, Entity Credit Limit, Entity Credit Term, GL Code, Tax Code, Country, Entity (merchant), AppLogin, Currency, PGW Contract Rate and MST Item Header (settlement method) lookups.

## Fields

### Create form

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Merchant ID | Display identifier | Yes | Stored as the `ID_INFO` extension (`value_json.id`), not in `merchant_code`; **no uniqueness check** |
| Merchant Name | `bl_fi_mst_entity_hdr.name` | Yes | |
| Merchant Company | Free text | Yes | `COMPANY_INFO` extension `company` |
| Company Registration No / ID Number | Registration or identity number | Yes | `COMPANY_INFO` extension `companyCode`; max 100; label follows Merchant Type (CORPORATE → *Company Registration No*, INDIVIDUAL → *ID Number*) |
| Entity Type | Multi-select CUSTOMER, SUPPLIER, EMPLOYEE, MERCHANT | Yes (when shown) | Default MERCHANT; hidden by `HIDE_ENTITY_TYPE`; choosing EMPLOYEE forces Merchant Type to INDIVIDUAL. Sets `is_customer` / `is_supplier` / `is_employee` / `is_merchant` |
| Merchant Type | CORPORATE / INDIVIDUAL | Yes | `txn_type`; default CORPORATE |
| AR / AP Type | AR_TRADE, AR_OTHER, AR_MERCHANT, AP_TRADE, AP_OTHER, AP_MERCHANT, AP_EMPLOYEE | Yes | `default_arap_type`; if blank the backend defaults to AP_TRADE for suppliers, else AR_TRADE (`EntityDataConsistencyObject` L1118-1122) |
| PGW Merchant Code | Merchant identifier at the payment gateway | Yes | `pgw_merchant_code`; max 100 on edit |
| Merchant Key | Gateway signing key | Yes | `merchant_key`; shown in clear text; copied onto each payment transaction header at transaction time |
| Status | ACTIVE / TEMP / INACTIVE | No | Default ACTIVE; a blank status is set to ACTIVE server-side (L1101-1103) |
| Description | `descr` | No | |

The **Details** tab of the edit form has the same fields (all of Merchant ID, Merchant Name, Merchant Company, registration number, Entity Type, Merchant Type, AR/AP Type, PGW Merchant Code and Merchant Key mandatory, each max 100) plus **Remove**.

### Peppol Config

- **Peppol Ids** — *Peppol Participant ID* (with **Verify Participant ID**, which calls the Peppol participant lookup by ISO 6523 scheme and ID), *Default* toggle, *Delete*. Saved immediately as `bl_fi_entity_peppol_id` rows.
- **Notification Config** — four checkboxes: *peppol (only applicable if valid peppol id)*, *email*, *other UCC channels (through telegram / facebook messengers etc)*, *through customer portals*. Saved by the header Save into `einvoice_notification_methods_json`.

### Login

| Field | Meaning | Required | Notes |
|---|---|---|---|
| User email | Tenant login to link | Yes | **Verify Email** tries to add the address as a tenant user: `OK` or *already exists* → the confirmed principal's subject guid is fetched (`principal_type = EMAIL_USERNAME`, `status = USER_CONFIRMED`); `USER_NOT_FOUND` → the **Send Invite** button appears (invitation with `create_entity: true`) |
| Rank | OWNER, ADMIN, MANAGER, MEMBER, GUEST, VISITOR, ANNONYMOUS | Yes | Default MEMBER |
| Status | ACTIVE / INACTIVE | Yes | Default ACTIVE |

**Add** posts a `bl_fi_mst_entity_login_subject_link` row immediately. Listing columns: User Email, Rank, Status, Modified Date.

### Return URL

Return URL Code, Return URL Name, *Success Return URL* toggle + URL, *Error Return URL* toggle + URL. Each row is a `URL_INFO` extension; saved with the header Save.

### Tax & Billing

Country (required), Tax Type, Tax Code, Tax Rate (%) (required), Tax Option (required). Tax types include SST service-tax input / output entries; codes are the tax codes of the chosen country. Rows are `TAX_INFO` extensions; saved with the header Save.

### Payment Config

Payee Residential Status (RESIDENT / NON-RESIDENT, required), Country (required), Bank, Swift Code, Bank Acc No., Bank Acc Holder Name, IBN Number, Account Expiry (date). Rows are `PAYMENT_CONFIG` extensions; saved with the header Save.

### Address, Contact

- **Address** — Address Name, Address Type (required), Address 1 (required), Address 2-5, Country / State / City / Postal Code (required), *Set as default*. Written into `addresses_json` on Save.
- **Contact** — Contact Name, Contact ID, Position, Mobile No (required), Office No, Extension No, Fax No, Phone Number, Email, Other No. `CONTACT_INFO` entity lines, saved on Save.

### Company Linking, Merchant Branch

- **Company Linking** — Company and AR/AP Type, both required; **Add** posts a `bl_fi_mst_comp_branch_location_entity_link` row at once and is refused if the company is already linked (`checkExistingLink`, `merchant-company-create.component.ts` L204). The edit panel shows Company Code, Company Name, Registration No. and AR/AP Type.
- **Merchant Branch** (panel title *Create Customer Branch*) — Selected Entity (read-only), Code, Name, Description, Mapping Value 01-05, Address Name, Email, Phone Number, Address Line 1-5, Country, State, City, Postal Code, Control Account Code, Account AR/AP Type, Account GL Code, Account Subledger, Output Tax Type + SST/GST/VAT, Output WHT Type + WHT, Input Tax Type + SST/GST/VAT, Input WHT Type + WHT, Einvoice Tax Type Code. Saved immediately through the intercompany-branch service; the edit panel adds **DELETE**.

### Credit Limit and Terms

- **Credit Term** — *Existing Credit Term* or *New Credit Term*: Credit Term Name, Credit Term Code (required), Status, Set Year / Month / Day, Add Year / Month / Day. `CREDIT_TERM` extension, saved with the header Save.
- **Credit Limit** — Credit Limit Code (required), Credit Limit Name, Status, Currency, Credit Limit Amount. `CREDIT_LIMIT` extension, saved with the header Save.

### Contract

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Contract Name | `bl_pgw_merchant_contract_hdr.name` | Yes | |
| Contract Code | `code` | Read-only | Browser computes the highest existing numeric part + 1, formatted `C00001`…; no backend uniqueness check on `code` |
| Merchant | `merchant_guid` | Yes | Backend rejects a missing or unknown merchant (`MERCHANT_GUID_IS_NULL`, `MERCHANT_GUID_DOES_NOT_EXIST`) |
| Contract Company | `comp_guid` | Yes | Backend rejects a missing or unknown company |
| Status | ACTIVE / DEACTIVATE | Yes | The only field editable after creation besides the name |
| Merchant Contract Key | `merchant_contract_key` | Generated | Ten random alphanumerics assigned by `PgwMerchantContractHdrService.generateMerchantContractKey()`; must be unique |
| Type | Derived | Read-only | *TEMPLATE* when the contract has no merchant, *PERSONAL* otherwise (`contract-edit.component.ts` L211-218) |

### Rate card, payment channel, charge rate

- **Rate Card** — Rate Card Code (generated `RC_nnnn`, read-only), Rate Card Name (required), Status, Description → `bl_pgw_merchant_rate_card`.
- **Payment channel** — a rate-card line (`bl_pgw_merchant_rate_card_line`) linking the card to a PGW payment channel and payment provider.
- **Charge Rate** — Charge Rate Name (required), Rate (required), rate logic → `bl_pgw_merchant_rate_hdr` (`rate`, `rate_logic`). Up to four named charge rates per channel are what the monthly report shows as *PC Charge Name 1-4*.

## Lifecycle and effects

This is a master-data applet: no server document type, no amount or quantity signum, no journal, no stock processor and no open-queue rows. It **writes**:

| What | Where | How |
|---|---|---|
| Merchant | `bl_fi_mst_entity_hdr` + `bl_fi_mst_entity_ext` (`ID_INFO`, `COMPANY_INFO`, `URL_INFO`, `TAX_INFO`, `PAYMENT_CONFIG`, `CREDIT_TERM`, `CREDIT_LIMIT`, `SYS_MERCHANT_LOGO`) + `bl_fi_mst_entity_line` (`CONTACT_INFO`) | `POST` / `PUT core2/tnt/dm/erp/entity/merchants/backoffice-ep`; validated by `EntityDataConsistencyObject` |
| Entity event | `bl_fi_mst_entity_event` (`CREATE_MERCHANT`, `EDIT_MERCHANT`, `CREATE_CHARGE_RATE`, `UPDATE_PAYMENT_CHANNELS`, …) | Posted by the applet after each save (`merchant.effects.ts` L340-379) |
| Peppol ID, login link, company link, merchant branch | `bl_fi_entity_peppol_id`, `bl_fi_mst_entity_login_subject_link`, `bl_fi_mst_comp_branch_location_entity_link`, intercompany branch tables | Immediate `POST` from the panel |
| Contract, rate card, charge rate | `bl_pgw_merchant_contract_hdr`, `bl_pgw_merchant_rate_card` (+ `_line`), `bl_pgw_merchant_rate_hdr` | `core2/tnt/dm/pgw/merchant-contract-hdr`, `…/pgw/merchant/rate-cards`, `…/pgw/merchant/rate-hdrs` |

It **reads** `bl_pgw_monthly_merchant_txn_summary_report_line` (`…/pgw/merchant-monthly-reports`) for the Report menu. Those rows are produced by the `PGW_MERCHANT_MONTHLY_REPORT_PROCESSOR` job (`PgwMerchantMonthlyReportProcessor`), which takes `months` / `years` properties, groups payment transactions per merchant and payment channel, copies the VAT rate from the merchant's tax extension and fills the charge columns from the merchant's rate headers (`setFixAmountAndPercentage`, L248-297). The applet has no button to run it.

**Backend validation that stops a save (the exact throws):**

- Merchant: status must be present (`ENTITY_HDR_OBJECT_STATUS_IS_NULL_OR_EMPTY`, `EntityDataConsistencyObject` L120-126 / L617-622); a `merchant_code` on a row without `is_merchant` is rejected (`API_TNT_DM_BL_FI_MST_ENTITY_HDR_OBJECT_MERCHANT_CODE_SHOULD_NOT_BE_SET`, L164-168); a duplicate `merchant_code` or `merchant_id` is rejected (`…MERCHANT_CODE_ALREADY_EXISTS` L190-195, `ENTITY_HDR_OBJECT_MERCHANT_ID_ALREADY_EXISTS` L91-97). Codes are upper-cased and stripped of spaces before the check (`sanitiseCode`, L1396).
- Contract: merchant guid, company guid, contract key, revision, status, dates and created / updated subject are all mandatory and must exist (`PgwMerchantContractHdrDataConsistencyObject` L37-145); a duplicate contract key is rejected (L94).
- Rate card and charge rate: their own `PgwMerchantRateCardDataConsistencyObject` / `PgwMerchantRateHdrDataConsistencyObject`.

**Status.** Merchant status is ACTIVE / TEMP / INACTIVE; the `merchants` listing and every downstream lookup by entity type filter on the flag, not on status, so an INACTIVE merchant still appears wherever merchants are listed. Contract status is ACTIVE / DEACTIVATE and is not read by the monthly report job.

**Delete.** Remove issues `DELETE …/entity/merchants/{guid}` at once. The backend deletes the header, its extensions, lines and login links physically (`EntityUow.delete`, L184-191) after deleting attached files, and fires the `MERCHANT_DELETED` webhook; it does not check for contracts, payment transactions or documents that reference the entity. Contracts are separate rows and survive with a dangling `merchant_guid`. Contract **Remove** deletes the contract header the same way (`PgwMerchantContractHdrService.deleteMerchantContractHdr`).

**What reads the credentials.** Payment-gateway callbacks verify their signature with `bl_pgw_payment_txn_hdr.merchant_key` — the key copied onto the transaction when it was created (`IPay88Controller` L154, L201; `PgwBackendController` L500-601) — so rotating the Merchant Key affects new transactions only.

## Related applets

- [Entity Maintenance](/applets/master-data/entity-applet/) — the type-agnostic view of the same rows; use it to see a merchant that is also a customer or supplier, or to maintain the category trees.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Employee Maintenance](/applets/master-data/employee-applet/) — the other entity-type views; a merchant with CUSTOMER in its Entity Type appears in Customer Maintenance with the credit terms and limits set here.
- [Organisation](/applets/master-data/organisation-applet/) — companies for contracts and company linking; branches for merchant branches.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — tax codes for Tax & Billing and the merchant branch control account.
- [Chart of Account](/applets/master-data/chart-of-account-applet/) — GL codes and subledgers for the merchant branch control account.
- [Cashbook](/applets/master-data/cashbook-applet/) — settlement methods read by Payment Config.
- [My Peppol Admin](/applets/e-invoice/mypeppol-admin-applet/), [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — consume the Peppol participant IDs and notification methods saved on the merchant.
- [Seller Admin](/applets/ecommerce/seller-admin-applet/) — operates orders and fulfilment for a merchant registered here.
- [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) — the tenant users that the Login tab verifies and invites.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| **CREATE** stays grey | One of the starred fields is empty — Merchant ID, Name, Company, registration number, Entity Type (when shown), Merchant Type, AR/AP Type, PGW Merchant Code, Merchant Key (`merchant-create.component.html`) | Fill every starred field; Description is the only optional one |
| Entity Type is missing on the create form but visible on edit | `HIDE_ENTITY_TYPE` is on in Field Settings; the edit form does not honour it | Expected. Turn the setting off to set CUSTOMER / SUPPLIER / EMPLOYEE at creation, or add them afterwards on the Details tab |
| Merchant saved without the CUSTOMER flag although CUSTOMER was expected | With `HIDE_ENTITY_TYPE` on, the disabled control is excluded from the request, so only `is_merchant` is set (by the backend handler) | Edit the merchant and add the type on the Details tab |
| Two merchants with the same Merchant ID | Merchant ID is the `ID_INFO` extension and is never checked for uniqueness; the unique key is the generated `merchant_code`, which this applet never displays | Search by name; use [Entity Maintenance](/applets/master-data/entity-applet/) (keyword search matches the merchant code) to tell them apart |
| `merchant_code already exists` on an import or API call | Another entity already carries that `merchant_code` (`…MERCHANT_CODE_ALREADY_EXISTS`); codes are compared after upper-casing and removing spaces | Leave the code blank so the running number generates it, or pick an unused one |
| Rows added on Return URL / Tax & Billing / Payment Config / Address / Contact / Credit Term / Credit Limit disappear | They are staged in the browser until the header **Save** is pressed | Press **Save** on the Merchant Edit header, not only the panel's Save / Add |
| Merchant vanished after clicking **Remove** | Remove deletes immediately, without confirmation, and physically | Recreate the merchant; contracts that pointed at it still exist in the Contract listing but show no merchant |
| Contract listing shows a contract with an empty Merchant Name / edit shows *Type = TEMPLATE* | `merchant_guid` is null — the merchant was deleted, or the contract was created as a template | Create a new contract for the merchant; templates cannot be re-pointed from the UI |
| Contract *Merchant Name* shows `[object Object]` | The edit panel patches the name from the merchant lookup response and, on the Contract-menu edit screen, the value it receives is the container, not the string (`contract-edit.component.ts` L153-154) | Cosmetic; the merchant link is intact. Open the same contract from the merchant's own Contract tab to see the name |
| Two contracts with the same Contract Code | The code is computed in the browser as max + 1; two users creating at the same time get the same number and the backend does not check `code` uniqueness | Rename one; the contract key, not the code, is the unique identifier |
| **Verify Email** says *User … not found* | The e-mail has no tenant login (`USER_NOT_FOUND`) | Press **Send Invite**; the invitation creates the login and, with `create_entity: true`, an entity for it. Link the login once the user has confirmed |
| **Verify Email** succeeded but the user now appears in Tenant Admin | Verify works by attempting to add the address as a tenant user; an `OK` response means it was added | Expected side effect (`login-create.component.ts` L117-145) |
| Report menu is empty | `bl_pgw_monthly_merchant_txn_summary_report_line` is filled only by the `PGW_MERCHANT_MONTHLY_REPORT_PROCESSOR` job with explicit `months` / `years` | Ask the platform team to schedule or run the job for the months needed |
| Report shows charges of 0 or blank charge names | The job copies charge rates from the merchant's rate headers grouped by name (up to four); the merchant's contract has no rate card lines for that channel | Add the rate card, the payment channel and the charge rates under Contract › Rate Card, then rerun the job |
| Payment-gateway callback fails with *signature mismatch* after the Merchant Key was changed | Callbacks are verified against the key copied onto the payment transaction header when it was created, not the current entity key (`IPay88Controller` L154) | Transactions started before the change keep the old key; only new transactions use the new one. Do not change the key while transactions are in flight |
| Default Selection does nothing / console error on choosing a branch | The screen is not wired (undefined container; unbound output) and nothing reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION` | Nothing to configure; see [Applet settings](#applet-settings) |
| Settings links *Permission Wizard*, *Audit Trail*, *Reset Applet State* return to the merchant listing | The shared settings frame lists them but this applet registers no route for them | Use Permission Set / User / Team / Role Permission; the applet's own Audit Trail is the left-menu item |
| Personalization › *Field Settings* does nothing | Listed in `personalizationItems` without a personalization route | Use Settings › Field Settings |

## Related documentation

- [Master Data applets](/applets/master-data/)
- [Entity Maintenance](/applets/master-data/entity-applet/) — the shared entity model this applet edits
- [E-Commerce module](/modules-v2/ecommerce/) and [E-Invoice module](/modules-v2/e-invoice/)
