---
title: "Warranty Admin"
description: "Back-office review queue for warranty registrations submitted by members through the storefront: approve one and it becomes a warranty certificate."
applet_code: "warrantyAdmin"
page_type: applet
applet_repo: "blg-applet-wavelet-warranty-admin-applet"
modules: [membership, ecommerce]
related_applets: [internal-rma-applet, doc-item-maintenance-applet, customer-maintenance-applet, entity-applet]
guides: []
sources:
  screens_and_menus:
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/app.routing.ts
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/components/settings-container/settings-container.component.ts
  configuration:
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/components/settings-container/custom-status/custom-status.component.ts
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/components/settings-container/custom-status/custom-status.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
  fields:
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/components/product-registration-container/product-registration-edit/main-details/main-details.component.ts
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/components/product-registration-container/product-registration-edit/main-details/main-details.component.html
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_wrty_product_registration_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_wrty_warranty_certificate_hdr.java
  lifecycle:
    - blg-applet-wavelet-warranty-admin-applet/micro-fe/projects/wavelet-erp/applets/warranty-admin-applet/src/app/state-controllers/product-registration-controller/store/effects/product-registration.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/WarrantyProductDataConsistencyObjects/WarrantyProductRegistrationDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/WarrantyProductDataConsistencyObjects/WarrantyCertificateDataConsistencyObject.java
    - wavelet-cp-commerce/src/app/state-controllers/warranty-store/effects/warranty.effects.ts
  troubleshooting:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/warranty/WarrantyProductRegistrationController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/warranty/WarrantyCertificateController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/WrntyErrorCodesConstants.java
tags:
  - warranty-management
  - product-registration
  - customer-service
  - post-sales-support
weight: 170
aliases:
- /applets/warranty-admin-applet/
---

## Overview

Warranty Admin is the **back-office review queue** for warranty registrations. A member registers a
product through the storefront — serial number, purchase date, a photo of the receipt — and the
registration lands here with an approval status of `PENDING`. Someone in support opens it, fills in
the warranty period and expiry date, checks the attachment, and clicks **APPROVE** or **DECLINE**.

Approving it writes a second record, a **warranty certificate**, which is the durable proof of
coverage and the thing you print for the customer.

{{< callout type="info" >}}
**The applet cannot create a registration.** There is no add button on the Product Registration
listing and the applet never POSTs a registration — it only PUTs existing ones. Registrations come
from the storefront's warranty registration form, or from any other client calling the
`login-entity-ep` endpoint. The applet reviews; it does not enrol.
{{< /callout >}}

## Where it fits

| Direction | What | Why |
|---|---|---|
| Upstream | The CP Commerce storefront's warranty registration widget | Submits the registration with `approval_status = PENDING`, the member's membership card, entity, serial number, purchase date and the chosen item |
| Prerequisite | A **membership card** for the customer | `membership_hdr_guid` is validated as non-null *and* looked up in the membership card table on every create and update — a registration cannot exist without one |
| Prerequisite | A customer/[entity](/applets/master-data/entity-applet/) record | `entity_hdr_guid` must be non-null and must exist; `entity_name` must be non-null |
| Prerequisite | [Items](/applets/master-data/doc-item-maintenance-applet/) | The storefront picks the product; `fi_item_guid`, `fi_item_code` and `fi_item_name` are copied onto the registration |
| Downstream | Warranty certificate | Created by the applet the moment a registration is approved |
| Downstream | Printable formats | The certificate is printed with a printable format chosen in the applet's own Printable Format Settings |
| Adjacent | [RMA (Internal)](/applets/rma/internal-rma-applet/) | Support staff read warranty cover here by eye when handling a return. There is **no code link**: no RMA or service-note code reads `bl_wrty_warranty_certificate_hdr` |

## Screens and menus

The sidebar has exactly two working entries, plus the standard settings and personalization gears.

| Menu | Route | What it does |
|---|---|---|
| **Product Registration** | `product-registration` | The review queue. Listing with advanced search and column toggles; no add button |
| **Warranty Certificate** | `warranty-certificate` | Listing of issued certificates. Read-only from this applet — the applet never PUTs or DELETEs a certificate |

Opening a registration gives three tabs:

| Tab | Contents |
|---|---|
| **Main Details** | The eleven fields listed under *Fields*, plus **APPROVE**, **DECLINE** and **SAVE** |
| **Attachments** | Files the member uploaded (typically a receipt photo); view and add |
| **Warranty Certificates** | The export/print pane — picks a printable format and renders the certificate |

**DECLINE** is a two-click button: the first click changes its label to *CLICK AGAIN TO CONFIRM*.

Settings (gear) contains five entries and nothing else: Application Settings, Default Selection,
Printable Format Settings, Email Template, Custom Status. Personalization contains one: Default
Selection.

{{< callout type="warning" >}}
The permission listings (Permission Wizard, Permission Set, User / Team / Role Permission,
Client-Side Permission, Role–Pricing-Scheme Link), Feature Visibility and the Webhook screen all
have routes in this applet but **no menu entry** — `settingItems` lists only the five System
Configuration items. They are reachable by URL only.
{{< /callout >}}

## Configuration

### Before you can use it

- **Membership.** Every registration must carry a membership card GUID that resolves. Without a
  membership programme in the tenant, no registration can be created at all, from any client.
- **A customer entity** for the member, with a name.
- **Items** for the products being registered.
- **A printable format** for the certificate — set it as the default in *Settings > Printable
  Format Settings*, which writes the `PRINTABLE` key.
- **A client that creates registrations.** The storefront's warranty widget is the shipped one.

### Applet settings

Settings live in two places here, and the split matters:

- **Application Settings** routes to the **shared** `FieldConfigurationComponent` from
  `blg-shared-utilities` (imported in `app.routing.ts` from
  `projects/shared-utilities/modules/permission/field-configuration/…`).
- **Default Selection** and **Custom Status** are the applet's own components.

The shared screen has **no `tabMappings` entry for `warrantyAdmin`**, so it renders its default set
— 237 controls at shared-utilities HEAD (`a8c38a2`), for a generic financial document: line-item
price columns, contra, expenses, e-Invoice and so on. **None of them is read anywhere in this
applet.** A grep of the applet for every key it declares finds consumers only for the seven listed
below. Treat Application Settings here as a screen that saves values nothing reads.

Only these keys pass all four proofs — declared in `applet-settings.model.ts`, rendered in a real
control, persisted by `saveMasterSettingsInit`, and read by code:

| Setting | Where it is set | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| `PRINTABLE` | Settings > Printable Format Settings (set as default) | The printable format the certificate export pane pre-selects | none | The export pane on both Product Registration and Warranty Certificate opens on the chosen format |
| `DEFAULT_COMPANY` | Settings > Default Selection (filled automatically from the branch you pick) | Resolved by the shared session effect into the applet shell's company | none | Changes the company shown in the shell header |
| `DEFAULT_BRANCH` | Settings > Default Selection | Resolved by the shared session effect into the applet shell's branch | none | Changes the branch shown in the shell header |

Saved by a real control but **read by nothing**:

| Setting | Where it is set | Status |
|---|---|---|
| `DEFAULT_LOCATION` | Settings > Default Selection (auto-filled from the branch's `MAIN_LOCATION`) | Written; no reader in the applet |
| `DEFAULT_SENDER_EMAIL` | Settings > Default Selection | Written; no reader — the applet sends no e-mail (see *Lifecycle*) |
| `DEFAULT_APPROVED_EMAIL_TEMPLATE` | Settings > Default Selection | Written; no reader |
| `DEFAULT_DECLINED_EMAIL_TEMPLATE` | Settings > Default Selection | Written; no reader |
| `ENABLE_CUSTOM_STATUS_1..5`, `ENABLE_CUSTOM_STATUS_HDR_1..5`, `ENABLE_CUSTOM_STATUS_LINE_1..5`, `NAME_CUSTOM_STATUS_HDR/LINE_1..5`, `LIST_CUSTOM_STATUS_HDR/LINE_1..5` | Settings > Custom Status | Written; no reader. The Main Details form has no custom-status control, and neither registration nor certificate has a column for one |

The remaining keys in `applet-settings.model.ts` — the `INCLUDE_*` / `ENABLE_*` dimension, profit
centre, project, segment, SST and WHT flags, and the twenty-odd `HIDE_*` price and quantity column
flags — are **model-only**: declared in the interface, never rendered by a control this applet
routes to, never read.

Both Default Selection screens (applet and personal) write through the shared
`saveMasterSettingsInit` effect, which merges into the existing `APPLET_SETTINGS` JSON rather than
replacing it, so saving one screen does not wipe another's keys.

### Feature visibility / permissions

The applet declares no client-side permission codes of its own and its Client-Side Permission
screen has no menu entry. Access is enforced server-side, by two permission families:

| Family | Gates |
|---|---|
| `API_TNT_DM_ERP_WRTY_PRODUCT_REGISTRATION_*` (`OWNER`, `ADMIN`, `MEMBER`, `CREATE`, `READ`, `UPDATE`, `DELETE`, `SEND_EMAIL`) | Every back-office registration endpoint — **and every attachment endpoint**, which reuses the registration family rather than having one of its own |
| `API_TNT_DM_ERP_WRTY_WARRANTY_CERTIFICATE_*` (`OWNER`, `ADMIN`, `MEMBER`, `CREATE`, `READ`, `UPDATE`, `DELETE`) | The certificate endpoints |

`API_TNT_DM_ERP_WRTY_PRODUCT_REGISTRATION_SEND_EMAIL` gates a rejection-e-mail endpoint that the
applet never calls.

A read the caller is not entitled to does not fail — the container comes back with `status`
replaced by `PERMISSION_DENIED` and every other field blank
(`WarrantyProductRegistrationController.replaceWarrantyProductWithoutPermission`).

The `login-entity-ep` variants of the same endpoints are gated differently: they check only
`UserPermissionService.isUserLoginEntity(caller, entity_hdr_guid)` — "is the caller the customer
named in this record". See *Troubleshooting*.

## Fields

### Product Registration — Main Details

Every control on this form is an unvalidated `UntypedFormControl`; the applet enforces nothing.
The "Required" column below is the **backend** validator.

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Created Date | When the registration was created | — | Date picker; maps to `created_date` |
| Customer Name | The registered owner | Yes (`entity_name`) | Free text |
| Customer Email | Owner's e-mail | No | Not used to send anything (see *Lifecycle*) |
| Customer Mobile | Owner's phone | No | |
| Product Name | The item | No on the form; `fi_item_name` is copied from the storefront's selection | |
| Serial No. | The unit's serial number(s) | No | Stored as JSON: `{ "serialNumbers": [ … ] }`. The storefront submits exactly one |
| Purchase Date | Date of purchase | No | |
| Purchased From | Dealer or channel | No | **Not set by the storefront** — someone in the back office types it |
| Warranty Period | Coverage duration | No | **Free text.** Nothing parses it and nothing computes anything from it |
| Warranty Expiry Date | Last day of coverage | No | **A date you type.** No code anywhere derives it from the purchase date, the warranty period or the item |
| Remarks | Notes | No | |

Not on the form but on the record: `membership_hdr_guid` (required, must exist),
`entity_hdr_guid` (required, must exist), `fi_item_guid`, `fi_item_code`, `qty`, `approval_status`,
`property_json`.

### Warranty Certificate

The certificate has the same columns as the registration, minus `approval_status` and plus
`prod_registration_guid` (required, must exist). The applet has no edit form for it — the record is
composed entirely by the approve action.

## Lifecycle and effects

Warranty Admin writes **no journal, no stock movement and no generic document**. It maintains two
tables, `bl_wrty_product_registration_hdr` and `bl_wrty_warranty_certificate_hdr`, plus
`bl_wrty_product_registration_attachment`.

### Approval status

`approval_status` is a plain string column on the registration. The values the shipped clients use
are `PENDING` (set by the storefront on submit), `APPROVED` and `DECLINED` (set by this applet's
buttons). **No validator constrains it** — the column is only ever used as a query filter, so any
string a client sends is stored.

### What SAVE, APPROVE and DECLINE actually do

| Action | Effect |
|---|---|
| **SAVE** | One `PUT` of the registration. Nothing else |
| **APPROVE** | Sets `approval_status = APPROVED`, `PUT`s the registration, then `POST`s a new warranty certificate built by copying membership, entity, item, quantity, serial numbers, purchase date, purchased-from, warranty period, expiry date, remarks and `property_json` across, setting `prod_registration_guid` to the registration and `status` to `ACTIVE`. Then a success toast |
| **DECLINE** | Sets `approval_status = DECLINED` and `PUT`s the registration. Nothing else |

**No e-mail is sent by either action.** Both effects carry the literal comment
`// TODO: exhaustMap to send email` where the send would go. The backend has a working sender
(`WarrantyProductEmailService`, exposed at
`…/product-registration/backoffice-ep/email-notification/reject`), the applet has an Email Template
screen and three e-mail settings — and no call site. If your process depends on customers receiving
their certificate automatically, it does not happen; print or export it instead.

**Nothing expires a certificate, either.** A certificate's `status` is the platform's standard
status column, whose values are `ACTIVE`, `INACTIVE`, `DELETED`, `DRAFT`, `PENDING` and so on —
there is no `EXPIRED` value, and no job compares `warranty_expiry_date` to today. A certificate
stays `ACTIVE` for ever unless somebody changes it through the API.

Approving the same registration twice creates a **second** certificate: nothing checks whether one
already exists for that `prod_registration_guid`.

### Attachments

Attachments are separate rows with their own multipart endpoints. The back office can add and
replace files; so can the member through `login-ep` and `login-entity-ep`. Deleting an attachment
is gated by the registration `DELETE` permission.

## Related applets

- [RMA (Internal)](/applets/rma/internal-rma-applet/) — where a warranty claim is actually
  processed. The link is human, not automated: nothing in RMA reads a warranty certificate.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the items being
  registered, and where serial-number tracking is configured.
- [Entity](/applets/master-data/entity-applet/) and
  [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — the owner record every
  registration must point at.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| `WRTY_PRODUCT_REGISTRATION_MEMBERSHIP_HDR_GUID_IS_NULL` or `…_DOES_NOT_EXISTS` on save | Every registration must carry a membership card that resolves in the membership card table. The back-office form has no control for it, so a record that arrived without one can never be saved again | Fix the membership link through the API, or resubmit from the storefront while signed in as a member |
| `WRTY_PRODUCT_REGISTRATION_ENTITY_HDR_GUID_DOES_NOT_EXISTS` | The customer entity was deleted after the registration was submitted | Restore or repoint the entity |
| Warranty Expiry Date is blank on everything from the storefront | The storefront submits only membership, entity, item, quantity, serial number, purchase date and `PENDING`. Warranty period, expiry date and purchased-from are back-office fields, and nothing calculates them | Type them during review, before approving — the certificate copies whatever is there at that moment |
| The customer says they never got the certificate e-mail | The applet sends no e-mail on approve or decline (`// TODO` in both effects) | Open the registration's **Warranty Certificates** tab, print or export the PDF, and send it yourself |
| Two certificates for one registration | Approve was clicked twice; there is no uniqueness check on `prod_registration_guid` | Delete the duplicate through the certificate API — the applet has no delete |
| An expired warranty still shows as `ACTIVE` | There is no expiry job and no `EXPIRED` status | Compare `warranty_expiry_date` yourself; do not rely on the status column |
| Application Settings changes have no effect | The shared settings screen renders the generic document set because there is no `tabMappings` entry for `warrantyAdmin`; the applet reads none of those keys | Only Default Selection, Printable Format Settings and Email Template hold keys this applet reads |
| A settings entry you remember (Permission Wizard, Audit Trail, Release Notes) is missing from the gear | `settingItems` lists only the five System Configuration entries; the permission screens still have routes but no link | Reach them by URL, or use tenant-level permission administration |
| A record shows `PERMISSION_DENIED` and nothing else | The caller lacks `API_TNT_DM_ERP_WRTY_*` and the controller strips the container instead of failing | Grant the relevant `READ`/`ADMIN`/`OWNER` code |
| A registration appears already `APPROVED` that nobody approved | `approval_status` is never validated, and the `login-entity-ep` create endpoint checks only that the caller is the customer named in the body. A member's own session can therefore submit a registration in any status — and post a certificate for it | Treat `approval_status` as unverified for records not approved through this applet; reported as a product defect |

## Related documentation

- [RMA (Internal) applet](/applets/rma/internal-rma-applet/)
- [Doc Item Maintenance applet](/applets/master-data/doc-item-maintenance-applet/)
