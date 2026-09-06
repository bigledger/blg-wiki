---
topic: warranty-registration
aliases: [warranty, product registration, warranty certificate, warranty admin]
applets: [warrantyAdmin]
modules: [membership, ecommerce]
related: [rma-and-service-notes, item-master-data, membership, cp-commerce-storefront]
wiki:
  - content/en/applets/rma/warranty-admin-applet.md
status: seed
updated: 2026-09-06
---

# Warranty registration and certificates

A member registers a bought product through the storefront — item, serial number, purchase date, a
photo of the receipt. The registration arrives in the Warranty Admin applet with an approval status
of `PENDING`. Someone in the back office fills in the warranty period and expiry date, checks the
attachment and approves it; approving writes a warranty certificate, which is the record of cover
and the thing that gets printed.

## Facts

- 2026-09-06 — The Warranty Admin applet **cannot create a registration**. The listing has no add
  button and the applet's effects only `PUT` registrations; the sole `POST` it makes is the
  warranty certificate on approve.
  [src:blg-applet-wavelet-warranty-admin-applet/.../product-registration.effects.ts:29,56,60,92]
- 2026-09-06 — Registrations are created by the CP Commerce storefront's warranty widget through
  `product-registration/login-entity-ep`, with `approval_status = PENDING`, the member's membership
  card GUID, entity GUID and name, `qty = 1`, one serial number, the purchase date and the chosen
  item. Purchased-from, warranty period, expiry date and remarks are **not** sent — they are
  back-office fields. [src:wavelet-cp-commerce/.../warranty-store/effects/warranty.effects.ts:55-90]
- 2026-09-06 — `membership_hdr_guid` is a **hard backend prerequisite**: the DCO rejects a null and
  looks the GUID up in the membership card table on both create and update. Warranty registration is
  therefore members-only, and the storefront blocks submission until a membership card GUID resolves.
  [src:blg-akaun-platform-java/.../WarrantyProductRegistrationDataConsistencyObject.java:40-52]
- 2026-09-06 — **No e-mail is ever sent by the applet.** Both the approve and the decline effect
  carry the literal comment `// TODO: exhaustMap to send email` where the send would go, even though
  the backend has a working sender (`WarrantyProductEmailService`, exposed at
  `product-registration/backoffice-ep/email-notification/reject` behind
  `API_TNT_DM_ERP_WRTY_PRODUCT_REGISTRATION_SEND_EMAIL`) and the applet has an Email Template screen
  plus `DEFAULT_SENDER_EMAIL` / `DEFAULT_APPROVED_EMAIL_TEMPLATE` / `DEFAULT_DECLINED_EMAIL_TEMPLATE`
  settings. [src:blg-applet-wavelet-warranty-admin-applet/.../product-registration.effects.ts:57,107]
- 2026-09-06 — **Nothing calculates a warranty expiry date.** `warranty_period` is free text and
  `warranty_expiry_date` is a date the reviewer types; no code in the applet or the backend derives
  either from the purchase date or from the item.
  [src:.../main-details.component.ts:21-31] [src:.../main-details.component.html:55-62]
- 2026-09-06 — **Nothing expires a certificate.** The platform `StatusColumn` enum has no `EXPIRED`
  value and no job compares `warranty_expiry_date` to the current date; a certificate stays `ACTIVE`
  indefinitely. [src:blg-akaun-platform-java/.../dal/table/StatusColumn.java]
- 2026-09-06 — Approving twice creates **two** certificates: nothing checks for an existing
  certificate with the same `prod_registration_guid`.
  [src:.../product-registration.effects.ts:52-80]
- 2026-09-06 — `approval_status` is never validated anywhere; it appears in the codebase only as a
  query filter, so a client may set any string.
  [src:blg-akaun-platform-java/.../WarrantyProductRegistrationUow.java:240]
- 2026-09-06 — The `login-entity-ep` create endpoints for both the registration and the certificate
  check only `UserPermissionService.isUserLoginEntity(caller, entity_hdr_guid)` — a member's own
  session can post a registration in any approval status and then post a certificate for it,
  bypassing back-office approval entirely. Delete on `login-entity-ep` is likewise scoped only to
  ownership. [src:.../WarrantyProductRegistrationController.java:99-105]
  [src:.../WarrantyCertificateController.java:87-105,205-222]
- 2026-09-06 — Attachment endpoints reuse the **registration** permission family
  (`API_TNT_DM_ERP_WRTY_PRODUCT_REGISTRATION_*`); there is no attachment-specific family.
  [src:.../WarrantyProductRegistrationAttachmentController.java]
- 2026-09-06 — Settings: the applet routes Application Settings to the **shared**
  `FieldConfigurationComponent`, and shared-utilities has no `tabMappings` entry for `warrantyAdmin`,
  so it renders the default 237-control generic-document set at HEAD `a8c38a2` — none of which the
  applet reads. Only `PRINTABLE`, `DEFAULT_COMPANY` and `DEFAULT_BRANCH` pass all four proofs; the
  30 custom-status keys and the three e-mail keys are saved and never read.
  [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts]
  [src:kb/tools/gates.py warrantyAdmin]
- 2026-09-06 — Nothing in the RMA / service-note code reads `bl_wrty_warranty_certificate_hdr`; the
  link between a warranty and a return is made by a human reading two screens.
  [src:grep of blg-akaun-platform-java and refs/ for WarrantyCertificateService outside the warranty applet]

## How it connects

- **membership** — no membership card, no warranty registration; this is the strongest coupling in
  the feature and it is invisible on the back-office form.
- **cp-commerce-storefront** — the only shipped creator of registrations.
- **rma-and-service-notes** — the intended consumer of warranty cover, but the connection is manual.
- **item-master-data** — supplies the product; serial-number tracking lives there, not here.

## Open questions

- Was the approve/decline e-mail intended to ship? The backend sender, the permission code and the
  template screen all exist; only the call site is missing.
- Should `warranty_period` be a structured duration so expiry can be computed?

## Wiki impact

- `content/en/applets/rma/warranty-admin-applet.md` — rewritten from this topic (run 33).
- `content/en/applets/rma/internal-rma-applet.md` — its "Warranty and expiry dates on the service
  note" line should say the link is manual, not automated.
