---
topic: my-e-invoice-portal-applet
aliases: [e-invoice customer portal, MY E-Invoice For Customer And Supplier Applet, request e-invoice portal]
applets: [myEInvoicePortalApplet, myEInvoiceForCustomerAndSupplierApplet]
modules: [e-invoice]
related: [my-e-invoice-admin-applet, e-invoice, customer-applet]
wiki:
  - content/en/applets/e-invoice/my-e-invoice-portal-applet.md
status: growing
updated: 2026-09-05
---

# MY E-Invoice Portal Applet

Buyer-facing portal: a login linked to customer entities looks up receipts held in the e-invoice pools, completes its TIN/ID/address so an individual e-invoice can be issued, views validated e-invoices and raises rejection requests within 72 hours.

## Facts

- 2026-09-05 — Registry code `myEInvoicePortalApplet`, name "MY E-Invoice Portal Applet" (capital MY); `myEInvoiceForCustomerAndSupplierApplet` is the superseded rename (exclusions list). Repo `blg-applet-wavelet-my-einvoice-portal-applet` @27683ae. [src:planning/private/registry-applets-2026-09-05.tsv] [src:planning/private/applet-exclusions.tsv]
- 2026-09-05 — Menu: Account → Select User (entities from `getEntitySubjectLoginLinkWithEntity`), Request E-Invoice (`internal-submission-to-irb`), Rejection Requests, Settings (Field Settings, Default Selection, Customer Invitations, Webhook, Feature Visibility, permissions), Personalization. Batch/individual/single-general pool menus are commented out. [src:.../models/menu-items.ts] [src:.../app.routing.ts]
- 2026-09-05 — No applet setting key is consumed; Field Settings toggles are unbound; Default Selection has no parent binding. [src:.../settings-container/field-configuration/field-configuration.component.html] [src:.../default-settings.component.ts L15–L17]
- 2026-09-05 — Search: `myEInvoiceBatchPoolDocHdrService.getByCriteriaLoginEntityWithEntityGuidParam`; backend `MyEInvoiceRequestPortalService.checkStatus` looks in batch → single-general → individual pool → to-IRB by invoice no + date + amount or PIN (`pin_code`). [src:.../request-einvoice-edit/document-details/document-details.component.ts L224–L240] [src:javasdk/.../MyEInvoiceRequestPortalService.java L40–L140]
- 2026-09-05 — Submit: `EntityLoginEpService.updateLoginEntity` (writes the buyer's identity onto its entity) then `myEInvoiceCpComRequestQueueService.processRequestLoginEntity` → `POST …/e-invoice/request-queues/process-request/login-entity-ep`; backend checks "request already made" per pool type before processing. Customer Invitations reuses the first call; its process step is commented out. [src:.../internal-submission-to-irb.effects.ts L66–L108] [src:.../customer-invitations.effects.ts L73–L81] [src:akaun-api/.../MyEInvoiceRequestQueueController.java] [src:javasdk/.../MyEinvoiceRequestQueueService.java L58–L130]
- 2026-09-05 — Verify TIN → `lhdnIntegrationService.tinValidation` (`MyEInvoiceLHDNIntegrationController` `/tin-validation/*`). [src:document-details.component.ts L251–L260]
- 2026-09-05 — Request for Rejection enabled by `haveAvailableTime` (< 72h since `validation_datetime`, client-side); create → `requestRejectionService.post` (`…/request-rejections/login-entity-ep`); duplicate → `requestForRejectionAlreadyExist`. Remaining hours = `72 - hoursDifference`; past 72h the logic list collapses to `NEW_REVERSAL_DOC`. Portal dropdown lacks `CANCEL_FOR_EDIT_AND_RESUBMIT`. [src:.../internal-submission-to-irb-edit.component.ts L90–L104] [src:.../rejection-request-details.component.ts L108–L121] [src:.../models/einvoice_constants.ts L19–L23]
- 2026-09-05 — Process Request selectable only when `APPROVED` + `IN-PROGRESS` + processing logic set. [src:.../rejection-request-listing.component.ts L192–L200]
- 2026-09-05 — Screenshots under static/images/my-e-invoice-portal-applet/ are clean (staging, avatar only); the overview infographic is unused. [src:this run's review]

## How it connects

- **my-e-invoice-admin-applet** — every portal action is completed there (pools, Save and Resubmit, Rejection Requests, Cancellation Queue).
- **customer-applet** — the entity record is what the portal updates.
- **e-invoice** — 72-hour rule and general TINs apply unchanged.

## Open questions

- Does the loop merge `my-einvoice-for-customer-and-supplier-applet.md` into this page and add its alias? (Skipped in state.json; alias not added to avoid collision.)

## Wiki impact

- Guides that say the portal "submits to LHDN" or "auto-switches Regenerate vs Credit Note" should be corrected: it edits entity + pool row and creates requests; the logic list only shrinks after 72h.
