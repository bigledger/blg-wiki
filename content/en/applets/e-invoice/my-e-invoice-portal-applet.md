---
title: "MY E-Invoice Portal Applet"
description: "Buyer-facing e-invoice portal: a customer account looks up its receipts, supplies its TIN and details to request an individual LHDN e-invoice, views validated e-invoices and raises rejection (cancellation) requests within the 72-hour window."
applet_code: "myEInvoicePortalApplet"
applet_repo: "blg-applet-wavelet-my-einvoice-portal-applet"
modules: [e-invoice]
related_applets: [my-e-invoice-admin-applet, customer-applet, internal-sales-invoice-applet, pos-general-applet, organisation-applet]
guides:
  - /guides/einvoice-guides/einvoice-pools-and-routing/
  - /guides/einvoice-guides/einvoice-validation/
sources:
  screens:
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/app.routing.ts
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/app.component.ts
  configuration:
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/models/einvoice_constants.ts
  fields:
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/components/internal-submission/internal-submission-to-irb-container/request-einvoice-edit/document-details/document-details.component.html
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/components/cancellation/rejection-requests/rejection-request-edit/rejection-request-details/rejection-request-details.component.html
  lifecycle:
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/components/internal-submission/internal-submission-to-irb-container/request-einvoice-edit/document-details/document-details.component.ts
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/components/internal-submission/internal-submission-to-irb-container/internal-submission-to-irb-edit/internal-submission-to-irb-edit.component.ts
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/components/cancellation/rejection-requests/rejection-request-edit/rejection-request-details/rejection-request-details.component.ts
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/components/cancellation/rejection-requests/rejection-request-listing/rejection-request-listing.component.ts
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/state-controllers/internal-submission-to-irb-controller/store/effects/internal-submission-to-irb.effects.ts
    - blg-applet-wavelet-my-einvoice-portal-applet/micro-fe/projects/wavelet-erp/applets/my-einvoice-portal-applet/src/app/state-controllers/customer-invitations-controller/store/effects/customer-invitations.effects.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/MyEInvoiceBatchPoolDocController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/MyEInvoiceRequestRejectionController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/MyEInvoiceToIrbController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/lhdn/MyEInvoiceLHDNIntegrationController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEInvoiceRequestPortalService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEinvoiceRequestQueueService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/MyEInvoiceRequestQueueController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEInvoiceGenDocToIrbCancellationQueueService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/model/erp/eInvoice/MyEInvoiceCancellationProcessingLogic.java
    - blg-intranet/content/1100-malaysia-einvoice/README.md
  troubleshooting:
    - blg-intranet/content/1100-malaysia-einvoice/README.md
    - gh:bigledger/blg-intranet#5427
    - gh:bigledger/blg-intranet#3953
    - gh:bigledger/blg-intranet#4222
    - gh:bigledger/blg-intranet#5567
tags:
- e-invoice
- compliance-system
- lhdn-integration
- digital-taxation
- business-automation
weight: 71
---

## Overview

The MY E-Invoice Portal Applet is the buyer's window into the e-invoice pipeline that the [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) runs. A customer who has been given portal access signs in, picks the customer account they act for, and can do three things: look up a receipt (by invoice number plus date and amount, or by the PIN printed on it) and supply their TIN and details so that an individual e-invoice is issued for it; see the e-invoices already issued to that account; and raise a rejection request against a validated e-invoice while LHDN's 72-hour cancellation window is still open. Everything it writes lands in the admin applet's pools and Rejection Requests for the seller's finance team to process — the portal never calls LHDN to submit a document itself.

{{< callout type="info" >}}
This applet was previously listed as *MY E-Invoice For Customer And Supplier Applet*; that registry code is retained for compatibility and the two are the same product.
{{< /callout >}}

## Where it fits

| Upstream | This applet | Downstream |
|---|---|---|
| Sales invoices and cash bills finalised in [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/) or [POS](/applets/sales-workflow/pos-general-applet/) and held in the Batch, Individual or Single General pool of the admin applet (with a PIN on the pool row) | Buyer finds the pool row and completes the buyer identity on it | Admin applet → Save and Resubmit / Submit as Individual → LHDN |
| Validated to-IRB headers for the buyer's entity | Buyer views them and can request a rejection | Admin applet → Cancellation → Rejection Requests → Cancellation Queue → LHDN |
| Customer master ([Customer Applet](/applets/master-data/customer-applet/)) linked to a login through the entity-subject login link | The **Account** menu lists the entities the login may act for | — |

## Screens and menus

| Menu | Route | What it shows | Actions |
|---|---|---|---|
| Account → Select User | (toggle in the menu) | The customer accounts (entities) linked to the signed-in login; the selected one scopes every other screen (`SessionActions.setSelectedSessionEntity`) | Switch account |
| Request E-Invoice | `internal-submission-to-irb` | Listing of the to-IRB headers for the selected account (e-invoice number, e-invoice date, document number, short code, status); the **Request E-Invoice** button opens the request form | Request E-Invoice; per row: Export (PDF), Request for Rejection, Submit (save details) |
| Rejection Requests | `rejection-request` | The account's rejection requests with requestor / processing / approval status | Update; Process Request |
| Settings | `settings/…` | Field Settings, Default Selection, Customer Invitations, Webhook, Feature Visibility, Permission Set / User / Team / Role | See Configuration |
| Personalization | `personalization/…` | Personal Default Selection, Sidebar | — |

{{< figure src="/images/my-e-invoice-portal-applet/my-e-invoice-portal-applet-request-invoice.png" alt="Request E-Invoice listing with the View Request E-Invoice panel open on the Search By Date Amount tab showing Invoice No, Amount and Transaction Date fields" caption="Request E-Invoice — search by invoice number, amount and transaction date." >}}

{{< figure src="/images/my-e-invoice-portal-applet/my-e-invoice-portal-applet-request-invoice-byPIN.png" alt="Request E-Invoice panel on the Search By Pin tab with Invoice No and Pin fields" caption="Request E-Invoice — search by invoice number and the PIN printed on the receipt." >}}

{{< figure src="/images/my-e-invoice-portal-applet/my-e-invoice-portal-applet-reject-e-invoice.png" alt="Rejection Requests listing with the View Rejection Request panel showing Server Doc No, E-Invoice Validation Date, Remained Hours For Cancellation, Amount, Currency, Reason, Cancellation Status, Request Submission Date, System Processing Status and Approval Status" caption="Rejection Requests — the detail panel shows the hours left in the 72-hour window." >}}

{{< figure src="/images/my-e-invoice-portal-applet/my-e-invoice-portal-applet-customer-request.png" alt="Applet Settings page with Customer Invitations selected, showing a listing and a View Customer Invitations panel with the same search form" caption="Settings → Customer Invitations — the seller-side version of the request form." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Customer logins linked to their entity records | Customer / entity master and the tenant's user administration (entity-subject login link) | The **Account** menu is built from `getEntitySubjectLoginLinkWithEntity`; a login with no linked entity sees nothing. |
| Documents finalised with a PIN and sitting in a pool | Sales / POS applet, admin applet pools (`pin_code` on the pool rows) | The search matches invoice number + date + amount, or invoice number + PIN, against the batch, single-general and individual pools and then the to-IRB headers (`MyEInvoiceRequestPortalService.checkStatus`). A document that was already submitted as consolidated or skipped cannot be requested. |
| E-invoice enabled on the seller company and the admin applet pipeline running | [Organisation Applet](/applets/master-data/organisation-applet/); see the admin applet page | The portal only edits pool rows; the seller's processors and staff do the submission. |
| Seller staff process the requests | Admin applet → pools / Cancellation | Nothing in the portal submits to LHDN. |

### Applet settings

The applet has an applet-local **Field Settings** screen (`settings/field-settings`) whose eight toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) have no form control and are never saved — no exposed control found (routes and settings components checked at commit `27683ae`). **Default Selection** (`settings/default-selection`) renders branch and location pickers, but the component is routed directly with no binding for its `appletSettings$` input or `save` output, so its SAVE emits to nothing at the same commit. No applet setting key is read anywhere in the portal's components. **Webhook** and **Feature Visibility** are the shared blg-shared-utilities screens.

### Document behaviour settings

Not applicable — the portal has no documents of its own. The one behavioural constant is the rejection **Processing Logic** list offered to the buyer: `REGEN_NEW_EINVOICE`, `VOID_ORIGINAL_DOC`, `NEW_REVERSAL_DOC` (`einvoice_constants.ts`). `CANCEL_FOR_EDIT_AND_RESUBMIT` — the only logic that works for a consolidated e-invoice — is not offered here; it is available in the admin applet.

### Feature visibility / permissions

No client-side permission definitions are seeded for `myEInvoicePortalApplet` (0 rows in `bl_applet_client_side_perm_dfn` on 2026-09-05) and the applet checks none. Server-side, every call goes through the `login-entity-ep` variants of the e-invoice controllers, which scope reads and writes to the entity GUID of the selected account; the seller-side Customer Invitations screen uses the same endpoints.

## Fields

**Request E-Invoice form (Document Details)**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Invoice No | The receipt / invoice number to find | Yes | Both search tabs. |
| Amount, Transaction Date | Second and third search keys | Yes on *Search By Date Amount* | Must equal the document's `amount_txn` and `date_txn`. |
| Pin | PIN printed on the receipt | Yes on *Search By Pin* | Matched against `pin_code` on the pool row. |
| Name, TIN, ID No, SST Reg No, Email, Contact No | Buyer identity to put on the e-invoice | Name, TIN, ID No, Contact No | **Verify TIN** calls LHDN's TIN validation through `MyEInvoiceLHDNIntegrationController` (`/tin-validation/*`) for the TIN + ID pair before saving. |
| Address Line 1–5, City, Postcode, Country, Currency | Buyer address | Line 1 and City | State is derived on the seller side from the address text. |
| Validation Error | Read-only | — | The reason the document is still in a pool, copied from the pool row. |

**Rejection Request**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Reason | Why the buyer rejects the e-invoice | Yes | Sent to LHDN as the cancellation reason. |
| Remained Hours For Cancellation | 72 minus the hours since `validation_datetime` | Read-only | Computed client-side (`calculateRemainingHour`). |
| Processing Logic | What the seller should do after the cancel | Yes for processing | When the window has closed the list is reduced to `NEW_REVERSAL_DOC` only. |
| System Processing Status, Approval Status | `IN-PROGRESS` / `COMPLETED`; `APPROVED` / `REJECTED` / `ON-HOLD` | — | Normally set by the seller in the admin applet. |

## Lifecycle and effects

1. **Search.** `Search` queries the pool tables for the selected entity (`myEInvoiceBatchPoolDocHdrService.getByCriteriaLoginEntityWithEntityGuidParam`); the backend's `checkStatus` looks in the batch pool, then the single-general pool, then the individual pool, then the to-IRB headers. The form is pre-filled with the pool row's invoice number, date, amount, currency and validation error.
2. **Submit.** Two calls run in sequence (`updateRequestEInvoiceInit` → `postToProcessInit` in the internal-submission effects): the buyer's identity and address are saved onto the customer's own entity record through the entity login endpoint (`EntityLoginEpService.updateLoginEntity`), then the pool row is processed with `POST …/e-invoice/request-queues/process-request/login-entity-ep`. The backend first checks that no request was already made for that pool row and that the document is not already inside a submitted e-invoice (`MyEinvoiceRequestQueueService.checkInBatchPoolRequestAlreadyMade` and its single-general / individual variants), then re-runs the e-invoice construction for the row. The seller's team sees the outcome in the admin applet (a to-IRB header if the mandatory check now passes, otherwise the pool row with a validation error) and completes it with **Save and Resubmit** where needed. A public, reCAPTCHA-protected variant of the same step exists for websites (`POST …/to-irbs/anonymous-save-and-resubmit/verify-recaptcha/public-ep`).
3. **View.** The listing reads the to-IRB headers for the entity (`GET …/e-invoice/to-irbs/login-entity-ep/query/{entityHdrGuid}`); a validated one carries the LHDN UUID and QR link and can be exported as PDF.
4. **Request for Rejection.** Enabled only while `haveAvailableTime` is true — fewer than 72 hours since the header's `validation_datetime`, computed in the browser. Creating the request posts to `…/e-invoice/request-rejections/login-entity-ep`; if a request already exists for the header the applet shows *request already exists* instead. The request starts at `system_requestor_status = REQUESTED`, `system_processing_status = IN-PROGRESS` and appears in the admin applet's Cancellation → Rejection Requests.
5. **Process Request** (portal listing) is only selectable for requests that are already `APPROVED`, `IN-PROGRESS` and have a processing logic (`isCheckboxSelection`), i.e. after the seller has approved them. The backend re-validates before calling LHDN (`isCancellationRequestValid`: status must be `Valid`, an LHDN document UUID must exist, and fewer than 72 hours must have passed since `validation_datetime`) — the client-side countdown is a convenience, the backend check is the rule.
6. **Customer Invitations** (Settings) is the seller-side twin of the request form: staff search a pool row and update the customer's entity on their behalf through the same `updateLoginEntity` call; the *post to process* step is commented out in that component, so the row is then completed from the admin applet.

The portal writes the buyer's entity record, the pool row it processes and rejection-request headers; it never creates documents or journals, and the to-IRB header it may produce goes through the same submission and validation processors as any other.

## Related applets

- [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) — where every portal action is completed: pools, Save and Resubmit, Rejection Requests, Cancellation Queue.
- [Customer Applet](/applets/master-data/customer-applet/) — the entity record whose TIN, ID and address the buyer completes; corrections made in the portal land on the pool row and, on resubmission, on the entity.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) — where the receipts and their PINs originate.
- [Organisation Applet](/applets/master-data/organisation-applet/) — company e-invoice status and identity used when the seller resubmits.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Search finds nothing although the receipt exists | The document is not in any pool or to-IRB header for the selected account: it was consolidated already, skipped, still in the posting queue, or belongs to another entity; or the amount/date/PIN do not match exactly. | Check the account picker; confirm the document's pool status in the admin applet; use the PIN tab. A document already inside a consolidated e-invoice cannot be re-issued individually — it needs the seller to cancel the consolidated e-invoice within 72 hours (`CANCEL_FOR_EDIT_AND_RESUBMIT`) or issue a credit note. |
| Verify TIN fails | TIN and ID type/value do not match LHDN's record; foreign buyers must use `PASSPORT`; NRIC must be 12 digits without hyphens; the General Public TIN `EI00000000010` is accepted only with a real NRIC. | Correct the pair and verify again; a General Public TIN with a BRN or passport is rejected by LHDN (`CF324`, `CF358`). |
| Request submitted but no e-invoice appears | The portal only updates the pool row; the seller has not yet run Save and Resubmit, or the resubmission failed the mandatory check (address, phone 8–20 characters). | Seller: open the pool in the admin applet, read Validation Error, resubmit. |
| Request for Rejection button disabled | More than 72 hours since validation, the e-invoice is not `Valid`, or a request already exists. | Ask the seller for a credit note e-invoice; check Rejection Requests for the existing request. |
| Rejection request stays `IN-PROGRESS` | Nothing advances it until the seller sets Approval Status = `APPROVED` and a processing logic, then processes it. | Seller: admin applet → Cancellation → Rejection Requests. |
| Request processed but LHDN cancel fails with "Passed 72 hours from validation date time" | The backend clock runs from the header's `validation_datetime`; the portal countdown is client-side and can be later than the real cutoff. | Credit-note path. |
| Request for a consolidated e-invoice fails with "Can not void the generic document" | `VOID_ORIGINAL_DOC` or `REGEN_NEW_EINVOICE` chosen; a consolidated e-invoice has no single source document. | Seller re-processes with `CANCEL_EINVOICE` in the admin applet (not offered in the portal). |

## Related documentation

- [E-Invoice Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/)
- [E-Invoice Validation Rules & Troubleshooting](/guides/einvoice-guides/einvoice-validation/)
- [E-Invoice module](/modules-v2/e-invoice/)
