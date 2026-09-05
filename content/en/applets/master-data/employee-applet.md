---
title: "Employee Maintenance"
description: "Reference for the Employee Maintenance applet — the employee master (one entity record per employee with login, branch, company, category, payment, tax, spending-limit, report-to and e-Invoice details), plus Employee Categories, Org Charts and CSV File Import."
applet_code: "employeeApplet"
applet_repo: "blg-applet-akaun-platform-employee-applet"
modules: [core, hr-payroll, claims, e-invoice]
related_applets: [customer-maintenance-applet, supplier-applet-1, merchant-applet, entity-applet, organisation-applet, tax-configuration-applet, claim-applet, claim-cycle-applet, my-e-invoice-portal-applet, mypeppol-admin-applet, tenant-admin-applet]
guides: []
sources:
  configuration:
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/app.routing.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/app.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/models/menu-items.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/models/applet-settings.model.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-listing/employee-listing.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-listing/employee-listing.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-listing-v2/employee-listing-v2.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-edit.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-edit.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-login/employee-login.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-login/login-create/login-create.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-login/login-create/login-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-payment-config/employee-payment-config.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/report-to/report-to.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/report-to/report-to-create/report-to-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-create/employee-create-main/employee-create-main.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-create/employee-create-main/employee-create-main.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/resolver/permission.resolver.ts
    - akaun_master.bl_applet_client_side_perm_dfn (applet employeeApplet — no rows)
  fields:
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-create/employee-create-main/employee-create-main.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-create/employee-create-main/employee-create-main.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-edit.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/e-invoice-details/e-invoice-details.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-address/address-create/employee-address-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-contact/contact-create/employee-contact-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-payment-config/payment-config-create/payment-config-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-tax/tax-create/employee-tax-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-tax/tax-create/employee-tax-create.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-spending-limit/create/create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/report-to/report-to-create/report-to-create.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/approved-leave/approved-leave-create/approved-leave-create.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/approved-leave/approved-leave.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-login/login-create/login-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/chart-container/org-chart-create/org-chart-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/chart-container/org-chart-edit/manage-structure/manage-structure-create/manage-structure-create.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/category-container/employee-category-create/employee-cat-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/file-import-container/file-import-create/file-import-create.component.html
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/file-import-container/file-import-listing/file-import-listing.component.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/models/employee-constants.ts
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/shared-utilities/models/entity-constant.model.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/entity/EmployeeImportFile/EmployeeImportFileColumnNames.java
  lifecycle:
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/state-controllers/employee-controller/store/effects/employee.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityPaymentMethodDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntitySpendingLimitLineDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/company/link/CompanyEmployeeLinkDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/entity/EmployeeImportFile/EmployeeImportFileHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/entity/EmployeeImportFile/EmployeeImportFileServiceHelper.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/employee/EmployeeImportFileHelperProcessor.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/entity/EmployeeImportFile/EmployeeImportFileHdrService.java
    - blg-applet-akaun-platform-employee-applet/micro-fe/projects/akaun-platform/applets/employee-applet/src/app/components/employee-container/employee-edit/employee-login/login-create/login-create.component.ts
    - gh:bigledger/blg-int-general-task#2275
    - gh:bigledger/blg-wiki#165
tags:
- employee-master
- hr-management
- org-chart
- payroll-setup
- access-control
weight: 61
aliases:
- /applets/employee-maintenance-applet/
---

## Overview

The Employee Maintenance applet is BigLedger's **employee master**. An employee is an entity record (the same `bl_fi_mst_entity_hdr` table that holds customers, suppliers and merchants) flagged with the `EMPLOYEE` entity type. The record carries who the person is (name, code, identity number, employment status, joined and cessation dates), where they sit (default company, branch, department, division, team, rank), how they log in (the link between the employee and a platform login), how they are paid (bank / payee details), their tax and spending-limit rules, their reporting line, and the identity fields that go on a self-billed e-Invoice.

It is used by HR or admin staff who onboard employees, by IT admins who link employees to logins and install applets for them, by finance who set payment and spending-limit rules, and by whoever maintains employee categories and org charts. It is master data only — claims, payroll runs and approvals live in their own applets, which resolve the employee from this record.

{{< callout type="info" >}}
**One entity, several types.** The *Entity Type* field on the record is multi-select (`CUSTOMER`, `SUPPLIER`, `EMPLOYEE`, `MERCHANT`). The same person can therefore be an employee and a customer; this applet sets `is_employee` and shows the employment fields only while `EMPLOYEE` is among the selected types.
{{< /callout >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies and branches for the default company, the Branch Linking and Company Linking tabs, and the org chart's company |
| Upstream | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Tax codes (by country) offered on the Tax tab |
| Upstream | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Logins, catalogs and ranks; the Login tab invites a user into the tenant and links the login to the employee |
| Sibling | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Merchant](/applets/master-data/merchant-applet/), [Entity](/applets/master-data/entity-applet/) | Same entity table; each applet edits the record through its own type lens |
| Downstream | [Claim](/applets/claims/claim-applet/), [Claim Cycle](/applets/claims/claim-cycle-applet/) | A claimant is resolved from the login e-mail to an employee record; job title, branch links and org chart drive approver lookup |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/), [MyPeppol Admin](/applets/e-invoice/mypeppol-admin-applet/) | The E-Invoice tab (TIN, ID type and number, SST / tourism-tax numbers, MSIC, address) and the Peppol Config tab supply the party details for self-billed e-Invoices |
| Downstream | Sales and purchase document applets | Employees appear as salesperson / account-manager pickers; the Account Manager tab links an employee to the customers they manage |

Modules: Core, HR & Payroll, Claims, E-Invoice.

## Screens and menus

Left menu (route `applets/wavelet/erp/entity/employee-applet`):

| Menu | What it is for |
|---|---|
| **Employee** | Search, create and edit employees |
| **Employee Category** | Tree of employee categories (code, name, description, parent) — `bl_fi_mst_entity_label_hdr` labels that employees are tagged with on the Category tab |
| **Org Chart** | Org chart headers (code, name, company, description, status) with a **Structure** tab where you add `DEPARTMENT` and `EMPLOYEE` nodes (hierarchical name, type, parent, rank 0–10, designation, description) |
| **File Import** | CSV upload of employees; a listing shows file name, size, format, status, process status and the user error message |

The Employee Category, Org Chart and File Import entries can be hidden tenant-wide (see [Applet settings](#applet-settings)).

Gear (Settings) menu: **Application Settings** and **Default Selection** (System Configuration); **Permission Wizard**, **Permission Set**, **User / Team / Role Permission** (server-side permissions); **Triggers** (webhook configuration); **Audit Trail** (entity audit trail) and **Reset Applet State** (developer tools). **Feature Visibility** is the settings landing page. Personalisation offers a per-user **Default Selection**.

### Employee listing

Columns shown by default: Employee Code, Employee Name, Employee Type (`INDIVIDUAL` / `CORPORATE`), Created By, Modified By, Status. ID Type, ID Number, Gender, Date of Birth, Country, Currency, Description, AR/AP Type, Phone, Email, Nationality, Ethnicity, Language Code, Title, Region Code, Marital Status, Job Title, Job Industry, Job Role, Creation Date and Modified Date exist as hidden columns the user can switch on from the Columns panel. The **+** button opens the create form; clicking a row opens the edit form.

### Create form

A single **Main** tab. The lower half of the form (screenshot) holds the employment fields; the *Branch* picker is mandatory on create.

{{< figure src="/images/employee-applet/employee-create-branch.png" alt="Lower half of the Create Employee form showing Title, Marital Status, Job Title, Job Industry, Joined Date, Cessation Date, Employment Status, Branch and Default Rank" caption="Create Employee, lower half of the Main tab: Employment Status and Branch are mandatory." >}}

### Edit form tabs

In default order: **Main**, **E-Invoice**, **Peppol Config** (Peppol Ids, Notification Config), **Address**, **Contact**, **Remark**, **Category**, **Login**, **Payment Config**, **Tax**, **Org Chart** (read-only view of the org charts, company, designation and rank the employee is placed in), **Branch Linking**, **Company Linking**, **Account Manager** (customers this employee manages), **Spending Limit**, **Report To**, **Approved Leave**, **Engagement Company Access**. Most tabs are a listing on the left and a create/edit panel on the right, each with its own **Add** button; the header **Save** button saves the employee header (Main and E-Invoice tabs) only.

{{< callout type="warning" >}}
**Approved Leave does not save anything.** The tab shows a *Leave Date From / To* form and an **Add** button, but the component's add handler is empty and its save call is commented out; the listing columns are bound to the Report To level-1 name and e-mail fields, not to leave dates (`approved-leave-create.component.ts` L124-147, `approved-leave.component.ts` L76-77). Do not use it to record leave. A Claims tab is likewise present in the template but commented out.
{{< /callout >}}

{{< figure src="/images/employee-applet/employee-report.png" alt="Report To tab with the level 1-3 name, e-mail and employee-code fields" caption="Report To: up to three levels of manager, each chosen from the employee list; e-mail and employee code fill in from the chosen record." >}}

{{< figure src="/images/employee-applet/employee-payment.png" alt="Payment Config tab with the create panel open" caption="Payment Config: payee residential status and country are mandatory; bank, SWIFT, account number, holder name, IBN number and account expiry are optional." >}}

{{< figure src="/images/employee-applet/employee-tax.png" alt="Tax tab with the create panel open" caption="Tax: country, tax type, tax code, rate and tax option are all mandatory." >}}

{{< figure src="/images/employee-applet/employee-speending.png" alt="Spending Limit tab with the Add Spending Limit panel" caption="Spending Limit: an Enable switch, quantity and amount quotas, rolling duration in days, max quantity per item, company and branch label." >}}

{{< figure src="/images/employee-applet/employee-login-create.png" alt="Login Create panel with the user e-mail or phone field, Verify button, Rank, Status and catalog selection" caption="Login Create: verify the e-mail or phone first; the catalog picker appears only when INSTALL ALL APPLETS ON INVITE is on." >}}

## Configuration

### Before you can use it

- **Companies and branches** in the [Organisation applet](/applets/master-data/organisation-applet/) — the create form requires a branch; Branch Linking, Company Linking, the spending-limit company and the org chart company all pick from there.
- **Tax codes** in [Tax Configuration](/applets/master-data/tax-configuration-applet/) if you will use the Tax tab; the tab filters codes by the chosen country.
- **Logins** — a person must already have accepted an invitation into the tenant (or be verified by e-mail / phone on the Login tab) before a login link can be added; ranks and catalogs come from [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/).
- **Employee code prefix and running number** — if you leave *Employee Code* blank the backend generates one from the `EMPLOYEE_ID` sequence with the tenant's employee prefix (`EntityDataConsistencyObject` L1378, `buildEntityCode` L1400-1410).

### Applet settings

Settings live in an **applet-local** Application Settings screen (`settings/field-settings`, `FieldConfigurationComponent` inside this repo — not the shared blg-shared-utilities screen) plus a one-field **Default Selection** screen. Values are stored as the applet's master settings; any user who can open the Settings menu can change them, and a change takes effect for everyone after **Save**. Every toggle is patched straight from the stored value (`resolve?.KEY`, no default) except `INSTALL_ALL_APPLETS_ON_INVITE`, which is patched to `false` when unset — so on a fresh tenant every toggle is off and nothing is hidden.

{{< figure src="/images/employee-applet/employee-app-setting.png" alt="Application Settings screen with its seven collapsed sections" caption="Application Settings: Employee Listing, Main Details Hidden, Login Hidden, Payment Config Hidden, Edit Tabs Hidden, Menu Items Hidden, Report To Hidden." >}}

{{< figure src="/images/employee-applet/employee-hide-unhide.png" alt="Employee Listing section expanded showing the Hide Employee Create Button and column toggles" caption="Employee Listing section: each switch hides one listing column; Currency, Creation Date and Modified Date are on here." >}}

**Employee Listing**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| Hide Employee Create Button (`HIDE_EMPLOYEE_CREATE_BUTTON`) | The **+** button on the employee listing (both listing implementations) | off | On: nobody can create employees from the UI; File Import still works |
| Employee Name (`HIDE_EMPLOYEE_NAME`) | Listing column **and** the Employee Name field on the edit Main tab | off | On: column and field hidden |
| Employee Type (`HIDE_EMPLOYEE_TYPE`) | Listing column and the Employee Type field on the edit Main tab | off | As above |
| Currency (`HIDE_CURRENCY`) | Listing column and the Currency field on the edit Main tab | off | As above |
| Status (`HIDE_STATUS`) | Listing column, the Status field on the edit Main tab, and the Status column of the Login tab (same key bound in the Login Hidden section) | off | As above |
| Creation Date (`HIDE_CREATION_DATE`) | Listing column only | off | The Main-tab *Creation Date* field reads a different key (`HIDE_CREATED_DATE`) that no control sets, so the field stays visible |
| Modified Date (`HIDE_MODIFIED_DATE`) | Listing column and the Login tab's Modified Date column | off | The Main-tab *Modified Date* field is bound to `HIDE_MODIFIED_BY` instead (see below) |

**Main Details Hidden** — one switch per field of the edit form's Main tab, each applying `[hidden]` to that field: Employee Name, Employee Code, Employee Nickname, Status, Entity Type (`HIDE_E_TYPE`), Employee Type, Identity Type, ID Number, Gender, Date of Birth, Country, Currency, Description, Ref 1, Ref 2, AR/AP Type, Phone Number, Email, Nationality, Ethnicity, Language Code, Title, Region Code, Marital Status (`HIDE_MARTIAL_STATUS`), Job Title, Job Industry, Job Role, Joined Date, Cessation Date, Employment Lifecycle Status (`HIDE_EMPLOYEE_STATUS`), Bank Name, Bank Account No., Default Branch (`HIDE_BRANCH_DETAIL`), Default Company (`HIDE_DEFAULT_COMPANY`), Location, Team, Division, Department, Default Rank, Created By, Creation Date, Modified By, Modified Date. Defaults are all off. Three things to know:

- Hiding a field on the edit tab does **not** hide it on the **create** form. The create form reads only nine of these keys (`HIDE_BANK_ACCOUNT_NO`, `HIDE_BANK_NAME`, `HIDE_COUNTRY`, `HIDE_DEPARTMENT`, `HIDE_DIVISION`, `HIDE_JOB_ROLE`, `HIDE_LANGUAGE_CODE`, `HIDE_REGION_CODE`, `HIDE_TEAM`) and disables (rather than hides) Entity Type and Identity Type when `HIDE_E_TYPE` / `HIDE_IDENTITY_TYPE` are on.
- `HIDE_EMPLOYEE_CODE`, `HIDE_EMPLOYEE_NICKNAME`, `HIDE_IDENTITY_TYPE`, `HIDE_ID_NUMBER` and `HIDE_DEFAULT_COMPANY` also **disable** the matching edit-form control, so a hidden value cannot be changed by un-hiding the DOM.
- The *Modified Date* field on the Main tab is bound to `HIDE_MODIFIED_BY`, so switching *Modified By* on hides both, and the *Creation Date* field cannot be hidden from this screen (key mismatch noted above).

**Login Hidden** (`HIDE_USER_EMAIL`, `HIDE_RANK`, `HIDE_STATUS`, `HIDE_MODIFIED_DATE`) hide the corresponding columns of the Login tab's listing; defaults off. The section also holds:

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| INSTALL ALL APPLETS ON INVITE (`INSTALL_ALL_APPLETS_ON_INVITE`) | Whether the Login Create panel shows a mandatory *Select catalogs for the applets installation* picker and sends `catalog_config: [{catalog_guid, install_all_applets: true}]` with the invitation | off (`?? false`) | On: **Send Invite** / **Send Tac** refuse to send until at least one catalog is chosen ("Please select at least one catalog…"), and the invited user gets every applet of the chosen catalogs installed on registration |

**Payment Config Hidden** (`HIDE_COUNTRY`, `HIDE_PAYEE_RESIDENT_STATUS`, `HIDE_BANK`, `HIDE_SWIFT_CODE`, `HIDE_BANK_ACC_NO`, `HIDE_BANK_ACC_HOLDER_NAME`, `HIDE_IBN_NO`) hide columns of the Payment Config listing; defaults off. `HIDE_COUNTRY` is the same key as the Main-tab Country switch.

**Edit Tabs Hidden** — removes whole tabs from the edit form (`getFilteredPanels()`); defaults off:

| Switch | Key | Hides |
|---|---|---|
| Account Manager | `HIDE_ACC_MANAGER` | Account Manager tab |
| Address | `HIDE_ADDRESS` | Address tab |
| Branch | `HIDE_BRANCH` | Branch Linking tab |
| Category | `HIDE_CATEGORY` | Category tab **and** the Employee Category left-menu entry |
| Claims | `HIDE_CLAIMS` | The **Org Chart** left-menu entry (`app.component.ts` L60) — there is no Claims tab to hide; the label is wrong |
| Company Linking | `HIDE_COMP_LINKING` | Company Linking tab |
| Contact | `HIDE_CONTACT` | Contact tab |
| Login | `HIDE_LOGIN` | Login tab |
| Payment Config | `HIDE_PAY_CONFIG` | Payment Config tab |
| Remark | `HIDE_REMARK` | Remark tab |
| Spending Limit | `HIDE_SPEND_LIMIT` | Spending Limit tab |
| Tax | `HIDE_TAX` | Tax tab |
| Report To | `REPORT_TO` | Report To tab (note: on = hidden, despite the key name) |
| Approved Leave | `APPROVED_LEAVE` | Approved Leave tab (on = hidden) |

The Main, E-Invoice, Peppol Config, Org Chart and Engagement Company Access tabs have no switch.

**Menu Items Hidden** — File Import (`HIDE_FILE_IMPORT`) removes the File Import menu entry; default off.

**Report To Hidden** — `LEVEL_1_NAME`, `LEVEL_1_EMAIL`, `LEVEL_1_EMP_CODE`, `LEVEL_2_*`, `LEVEL_3_*` hide the matching field on the Report To create/edit panel and the matching listing column; defaults off.

**Default Selection** (`settings/default-selection`)

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| Currency (`DEFAULT_CURRENCY`) | The currency pre-selected on the create form (`employee-create-main.component.ts` L172) | none — the form's Currency field starts blank and is mandatory | Set it to your home currency so every new employee defaults to it |

The branch picker on this screen is commented out in the template.

**Keys read at runtime without a control on any settings screen**

- `HIDE_E_INVOICE_TAB` — hides the E-Invoice tab if present in the stored settings (`employee-edit.component.ts` L112).
- `EMPLOYEE_CONTAINER_DETAILS_TAB_ORDER` — an ordered list of `{title, content}` that re-orders the edit tabs; saved tabs keep their order, new tabs are appended (`employee-edit.component.ts` L150-166). Nothing in this applet writes it.

**Rendered but not consumed**

- Personalisation › Default Selection shows *Default Branch* and *Default Location* pickers ("This will override Applet Default Settings") and saves them, but no component in this applet reads `DEFAULT_BRANCH` or `DEFAULT_LOCATION`.
- The settings model also declares the document-applet keys (`HIDE_UNIT_PRICE_*`, custom-status flags, `HIDE_*_TAB`) and `MAX_QTY`; none has a control or a consumer here.

### Document behaviour settings

Not applicable — this is a master-data applet with no document statuses, posting or printables.

### Feature visibility / permissions

{{< figure src="/images/employee-applet/settings.png" alt="Feature Visibility settings page showing the Teams › Manage Team Access panel" caption="Feature Visibility is the shared team-access screen; it does not gate individual buttons in this applet." >}}

- **Client-side permissions:** `bl_applet_client_side_perm_dfn` holds **no rows** for `employeeApplet`, and the applet code checks no `SHOW_*` permission codes. Feature Visibility therefore offers only the shared *Manage Team Access* panel; the `HIDE_*` settings above are the only way to remove controls, and they apply to everyone.
- **Server-side permissions:** Permission Wizard / Set / User / Team / Role are the shared containers, with the `PermissionResolver` mapping permission targets to Company, Branch, Location, Entity, Applet, Team, Tenant and Hostname lookups.

## Fields

### Create — Main tab

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Employee Name | `name` | Yes | Max 255 |
| Employee Code | `employee_code` | No | Left blank, the backend assigns prefix + running number; must be unique among non-deleted entities (`…EMPLOYEE_CODE_ALREADY_EXISTS`) |
| Employee Nickname | `nickname` | No | Max 255 |
| Status | Entity status | Yes | `ACTIVE`, `TEMP`, `INACTIVE`; defaults to `ACTIVE` |
| Entity Type | `eType`, multi-select | Yes | `CUSTOMER`, `SUPPLIER`, `EMPLOYEE`, `MERCHANT`; defaults to `EMPLOYEE`. Employment fields appear only while `EMPLOYEE` is selected |
| Employee Type | `txn_type` | Yes | `INDIVIDUAL` only while `EMPLOYEE` is selected; `CORPORATE` becomes available if you deselect it. Backend rejects anything else (`ENTITY_HDR_OBJECT_TXNTYPE_DOES_NOT_EXISTS`) |
| Identity Type / ID Number | `id_type`, `id_no` | No | Label changes to *Company Registration Number* for `CORPORATE` |
| Company Tax Registration ID | `tax_reg_number` | Yes for `CORPORATE` | Shown only for `CORPORATE` |
| Gender, Date of Birth, Nationality, Ethnicity, Language Code, Title, Region Code, Marital Status, Job Title, Job Industry, Job Role | Personal details | No | Individual only; Marital Status `M` / `S` / `O`; Gender `MALE` / `FEMALE` |
| Country, Currency | `country_alpha3_code`, `ccy_code` | Currency yes | Currency defaults from `DEFAULT_CURRENCY` |
| Description, Ref 1, Ref 2 | Free text | No | Max 255 |
| AR / AP Type | `default_arap_type` | Yes | Defaults to `AP_EMPLOYEE` |
| Phone Number, Email | Contact | No | Phone is validated by the phone-number component |
| Joined Date, Cessation Date | Employment dates | No | Employee only |
| Employment Status | Employment lifecycle | Yes (UI) | `ACTIVE`, `RESIGNED`, `TERMINATED`, `ABSCONDED`, `VOLUNTARY SEPARATION` |
| Bank Name, Bank Account No | Quick bank details on the header | No | Distinct from the Payment Config tab |
| Branch | Default branch | Yes | Single-select branch picker; sets the default company from the branch |
| Team, Department, Division | Free text | No | |
| Default Rank | Rank label | No | |

### Edit — other tabs

| Tab | Fields (mandatory in bold) | Writes |
|---|---|---|
| E-Invoice | Self-billed switch, **Employee's Name**, **ID Type**, **Reg./ID/Passport Number**, **TIN**, **Contact Number**, **Email**, default e-Invoice payment config, tourism-tax and SST numbers, **MSIC / business activity description**, **SIC code**, ATIGA number, FTA information, **Address Name**, **Address Line 1**, lines 2-5, **Country**, **State**, **City**, **Postcode** | Header e-Invoice fields, saved with the Main-tab **Save** |
| Address | **Address Name**, **Address Type**, **Address Line 1**, lines 2-5, **Country**, **State**, **City**, **Postcode** | Entity address lines |
| Contact | **Contact Name**, **Contact ID**, **Designation/Position**, office / extension / **mobile** / fax / other numbers, phone, e-mail | Entity contact lines |
| Category | Pick from the Employee Category tree | `bl_fi_mst_entity_label_link` |
| Login | **User email or phone number** → Verify / Send Invite / Invitation Accepted / Send Tac / Verify Tac; **Rank** (`OWNER`, `ADMIN`, `MANAGER`, `MEMBER`, `GUEST`, `VISITOR`, `ANNONYMOUS`); **Status** (`ACTIVE` / `INACTIVE`); catalogs (when the invite setting is on) | `bl_fi_mst_entity_login_subject_link` |
| Payment Config | **Payee Residential Status**, **Country**, Bank, SWIFT code, bank account no., holder name, IBN number, account expiry | `bl_fi_mst_entity_payment_method` |
| Tax | **Country**, **Tax Type**, **Tax Code**, **Tax Rate (%)**, **Tax Option** | An entity extension row `TAX_DETAILS` (JSON) in `bl_fi_mst_entity_ext` |
| Branch Linking / Company Linking | Pick branches / companies | `bl_fi_mst_branch_employee_link`, `bl_fi_mst_company_employee_link` |
| Account Manager | Pick customers (code, name, status) | `bl_fi_mst_entity_account_manager_link` |
| Spending Limit | Enable, Quantity Quota, Amount Quota, Rolling Duration (days), Max Quantity Per Item, **Company**, Branch Label | `bl_fi_mst_entity_spending_limit_line` |
| Report To | Level 1-3 Name (pick an employee), Email, Employee Code | `xtn_report_to_01..03_name / _email / _guid / _employee_code` on the employee header, via a header PUT |
| Engagement Company Access | Pick companies (entity code / name) | Employee-to-engagement-company access links |
| Peppol Config | Peppol Participant ID links; notification configuration | Entity Peppol ID records |

### File Import

The CSV is uploaded on the File Import screen (choose a file, pick the delimiter, **ADD**). Column headers, from `EmployeeImportFileColumnNames`:

`EMPLOYEE_CODE, EMPLOYEE_NAME, EMPLOYEE_TYPE, IDENTITY_TYPE, ID_NUMBER, COMP_TAX_REG_NUMBER, DOC_CURRENCY, DESC, PHONE_NUMBER, EMAIL, CATALOG_CODE, RANK, BILLING_NAME, BILLING_EMAIL, BILLING_PHONE, BILLING_ADDRESS_LINE1…5, BILLING_COUNTRY, BILLING_STATE, BILLING_CITY, BILLING_POSTCODE, SHIPPING_NAME, SHIPPING_EMAIL, SHIPPING_PHONE, SHIPPING_ADDRESS_LINE1…5, SHIPPING_COUNTRY, SHIPPING_STATE, SHIPPING_CITY, SHIPPING_POSTCODE`

Only **EMPLOYEE_NAME** and **DOC_CURRENCY** are validated as mandatory (`validateColumns`); the ID-number and identity-type checks are commented out. There is no branch, department, report-to, join-date or status column — those are set in the UI afterwards.

{{< figure src="/images/employee-applet/employee-file-import.png" alt="Employee Import Listing showing uploaded CSV files with status and process status columns" caption="File Import listing: Process Status moves VALIDATING_DATA → DONE or FAILED; the User Error Message column carries the row-level reason." >}}

## Lifecycle and effects

This applet writes master data; nothing here posts to the ledger or moves stock.

- **Entity status** is `ACTIVE`, `TEMP` or `INACTIVE` (`StatusOptions`). There is no `DRAFT`. Employment lifecycle (`ACTIVE` … `VOLUNTARY SEPARATION`) is a separate field and does not change the entity status.
- **Create / edit** go through `EmployeeService` POST / PUT to the entity API. The backend `EntityDataConsistencyObject` enforces: status not null; `txn_type` is `INDIVIDUAL` or `CORPORATE`; an `employee_code` may only be set when `is_employee` is true (`…EMPLOYEE_CODE_SHOULD_NOT_BE_SET`, L163 / L707); `employee_code` unique among non-deleted entities (`…EMPLOYEE_CODE_ALREADY_EXISTS`, L189 / L733); `employee_id` unique (`ENTITY_HDR_OBJECT_EMPLOYEE_ID_ALREADY_EXISTS`, L106 / L660). A blank `employee_code` on an employee is generated from the `EMPLOYEE_ID` running number plus the tenant's employee prefix (L1378, L1400-1410).
- **Sub-records** are saved by their own services with their own validators: payment methods (`EntityPaymentMethodDataConsistencyObject` — country code required and must exist, bank header must exist), spending limits (`EntitySpendingLimitLineDataConsistencyObject` — company must exist, status required), company links (`CompanyEmployeeLinkDataConsistencyObject` — one link per company + employee, `…COMPOSITE_CONSTRAINT_COMPANY_GUID_AND_EMPLOYEE_HDR_GUID_ALREADY_EXISTS`). No backend data-consistency object was found for the login-subject link table.
- **Login invitation** calls the back-office invitation endpoint with `add_user_to_tenant: true`; after the person accepts, **Invitation Accepted** looks up the login principal (`EMAIL_USERNAME` or `MOBILE_USERNAME`) and stores its subject guid on the link.
- **File Import** is processed by the `EMPLOYEE_IMPORT_FILE_HELPER_PROCESSOR` queue: status `VALIDATING_DATA` → mandatory-column check → for each row, an existing entity is looked up by **employee code** (if given) or, failing that, by ID number, company tax registration number, e-mail, then phone; a match is **updated** (name, type, ID, currency, e-mail, phone, tax number, description, addresses) and `is_employee` is set, otherwise a new entity is created. Any row failure marks the file `FAILED` with the message in *User Error Message*; a clean run ends `DONE`.
- **Webhooks** (Triggers) fire the entity webhook queue on create / update, including rows created by File Import.

## Related applets

- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — the same entity table seen through the customer lens; an employee who is also a customer is one record. The Account Manager tab here is the inverse of the customer's account-manager link.
- [Supplier](/applets/master-data/supplier-applet-1/), [Merchant](/applets/master-data/merchant-applet/), [Entity](/applets/master-data/entity-applet/) — sibling entity applets; the Entity applet edits any type.
- [Organisation](/applets/master-data/organisation-applet/) — companies and branches for the default branch, linking tabs and org charts.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — tax codes offered on the Tax tab.
- [Claim](/applets/claims/claim-applet/) and [Claim Cycle](/applets/claims/claim-cycle-applet/) — resolve the claimant from the login e-mail to this record; approvers come from job title, branch links and org chart.
- [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) and [MyPeppol Admin](/applets/e-invoice/mypeppol-admin-applet/) — consume the E-Invoice and Peppol Config tabs for self-billed e-Invoices.
- [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) — the logins, ranks and catalogs that the Login tab links to and installs.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Save fails with `…EMPLOYEE_CODE_ALREADY_EXISTS` | Another non-deleted entity already has that employee code (uniqueness is checked across the whole entity table) | Change the code, or leave it blank and let the backend generate one |
| Save fails with `…EMPLOYEE_CODE_SHOULD_NOT_BE_SET` | An employee code was supplied but `EMPLOYEE` is not among the entity types | Add `EMPLOYEE` to Entity Type or clear the code |
| Login tab: "User has not accepted invitation link in email" | **Invitation Accepted** was clicked before the invitee registered; the login principal does not exist yet | Wait for the person to accept, then click again; or use **Verify** for an existing user |
| Login tab: "Please select at least one catalog to install applets…" | `INSTALL_ALL_APPLETS_ON_INVITE` is on and no catalog was chosen | Pick a catalog, or switch the setting off if you do not want automatic installation |
| Login tab: the e-mail already belongs to a user but Verify says nothing is found | Verification matches the principal type exactly (`EMAIL_USERNAME` vs `MOBILE_USERNAME`); phone numbers must be entered in the stored format | Enter the identifier exactly as registered; the auto-detect improvement was tracked internally (gt#2275) |
| File Import ends `FAILED` with "EMPLOYEE NAME is Invalid" / "DOC CURRENCY is Invalid" | Mandatory column empty on at least one row | Fill every row's `EMPLOYEE_NAME` and `DOC_CURRENCY` and re-upload |
| File Import silently updated an existing customer instead of creating an employee | Without an `EMPLOYEE_CODE` the row is matched by ID number, tax number, e-mail or phone against **all** entities, and the match is updated with `is_employee = true` | Supply `EMPLOYEE_CODE` for new staff, or accept that the person is now both customer and employee |
| Employee Category or Org Chart menu is missing | `HIDE_CATEGORY` or the mislabelled `HIDE_CLAIMS` switch is on in Application Settings › Edit Tabs Hidden | Switch them off and Save |
| A field hidden on the edit form still shows on the create form | Most Main-Details switches are read by the edit template only | Expected behaviour; see Applet settings |
| Approved leave entries never appear | The Approved Leave tab has no save path | Record leave in the HR / claims process instead; report the tab to the applet team |
| Claim applet says it cannot find the user's e-mail in the Employee applet | No employee record carries that e-mail, or the login is not linked | Set the e-mail on the Main tab and add the login on the Login tab |

## Related documentation

- [Core module](/modules-v2/core/) · [HR & Payroll module](/modules-v2/hr-payroll/) · [Claims module](/modules-v2/claims/)
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — the sibling entity applet with the fullest description of the shared entity model
