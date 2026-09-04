---
topic: membership-admin-applet
aliases: [Membership Admin, member card, member class, member label, point currency, points expiry, point adjustment]
applets: [MEMBERSHIPADMIN]
modules: [membership, pos, crm-digital]
related: [pos-general-applet, internal-sales-invoice-applet, customer-maintenance, doc-item-maintenance, membership-points-currency, voucher-management-applet]
wiki:
  - content/en/applets/membership/membership-admin-applet.md
status: growing
updated: 2026-09-05
---

# Membership Admin applet

Back-office applet for members, cards, classes, labels, point currencies and conversions, manual point adjustments, expiry, suspensions, referrals / MLM, CSV uploads and the membership report. Points are earned and redeemed in POS / Sales Invoice and posted by the backend.

## Facts

- 2026-09-05 — Registry `MEMBERSHIPADMIN` "Membership Admin" (TNT-USER, ACTIVE); doc URL points at the alias `/applets/membership-admin-applet/`. Two DELETED console rows (`membershipadminconsole`, `MAC`) and four `do-not-use-membership-admin-console*` repos exist — ignore [src:planning/private/registry-applets-2026-09-05.tsv] [src:/home/marketing/repos/refs]
- 2026-09-05 — Application settings are an applet-own screen ("Field Settings"): `ENABLE_CUSTOM_CARD_RUNNING_NO`+`CARD_RUNNING_NUMBER`, `ASSIGN_IC_CARD_NO`, `ASSIGN_MOBILE_PHONE_CARD_NO` (mutually exclusive), `SHOW_BRANCH`, `SHOW_SALES_AGENT`, `SHOW_DOCUMENT_DELETE_BUTTON` (not read), `ENABLE_WEBSITE_SELECTION_ON_MEM_LABEL_LINK`, `DISALLOW_EDIT_MEMBERSHIP_POINTS`, `SUSPENSION_SETTINGS_BY_DATE_HIDE_TIME`, `ENABLE_CUSTOMER_DROPDOWN_IN_MEMBER_LIST_SEARCH`; the shared FieldConfigurationComponent has 0 toggles for this applet [src:…/components/settings-container/field-configuration/field-configuration.component.{html,ts}] [src:kb/tools/applet-scan.sh output]
- 2026-09-05 — `NOT_MANDATORY_PHONE_NO` is read (mobile optional) but has no toggle [src:…/member-create.component.ts]
- 2026-09-05 — Client-side perms registered: `ALLOW_EDIT_MEMBERSHIP_POINTS` (pairs with `DISALLOW_EDIT_MEMBERSHIP_POINTS`), `EDIT_MEMBERSHIP_END_DATE` (`*appPermission` on the end-date field) [src:akaun_master.bl_applet_client_side_perm_dfn] [src:…/member-edit.component.html#L231]
- 2026-09-05 — API perms requested by the app: `API_TNT_DM_CRM_MEMBERSHIP_CARD_HDR_{READ,CREATE,UPDATE}`; member search branches limited to permission targets [src:…/app.component.ts#L55-L62]
- 2026-09-05 — Points are awarded from a document only when the **company** member-point config matches: `member_point_award_doc_in` (doc type) and `member_point_in_doc_status` (posting status), the header has `member_guid`, and lines carry `point_amount` + `point_currency`; otherwise the document is left unposted for retry [src:javasdk/…/MembershipPointsTxnService.java#L640-L665]
- 2026-09-05 — Void reverses point lines and adds an adjustment for any shortfall; expiry processor expires ctrl-acc rows with `balance_amount > 0 AND date_end <= NOW()` writing an `EXPIRY` line; birthday gifts via crontab `MEMBER_BIRTHDAY_GIFT_PROCESSOR` [src:javasdk/…/MembershipCtrlAccAndCurrentBalanceService.java#L167,#L273] [src:javasdk/…/MemberBirthdayPointService.java]
- 2026-09-05 — Card number generation uses config type `RUNNING_NUMBER`, field `card_no`; failure message "Failed to generate card_no running number" [src:javasdk/…/MembershipConfigService.java#L54-L90]
- 2026-09-05 — Manual adjustment source constant `ADMIN_MANUAL_POINTS_ASSIGNMENT`; `DISPLAY`/`HIDDEN` display type [src:…/models/membership-constants.ts] [src:…/add-point-adjustment.component.ts]
- 2026-09-05 — Upload Membership template header: MEMBER NAME, GENDER, DATE OF BIRTH, COUNTRY CODE, MOBILE NO., IC/PASSPORT, EMAIL, MEMBER CLASS, JOIN DATE, START DATE, END DATE, MEMBERSHIP STATUS, REMARKS, LABEL 1–3. **The sample row in the repo contains what looks like a real person's name, IC and email** — flagged in findings; not copied [src:…/src/assets/templates/Membership_Template_Format.csv]
- 2026-09-05 — Previous wiki page invented settings (physical/virtual card types, date format, custom-status earn/redeem flags, currency symbol/decimals/transferability, "Default Member Class") that do not exist in the code; replaced [src:content/en/applets/membership/membership-admin-applet.md@HEAD]

## How it connects

- **pos-general-applet** — POS reads `SHOW_MEMBER`, redeems points as settlement, and the backend generates missing reward/redeem lines using the `posGeneral` applet settings; void reversal lands in the member's Point Transaction tab.
- **customer-maintenance** — member ↔ customer entity link (Customer Name on the member form).
- **doc-item-maintenance** — adjustment needs an item; POS needs a `MEMBER_POINT_DISCOUNT` item.
- **membership-points-currency** — the same point-currency and rate tables surfaced in a separate applet page.

## Open questions

- Where exactly is the company member-point config (`member_point_award_doc_in`, `member_point_in_doc_status`) edited in the UI — Organisation applet company settings? (Needs the Organisation page to say so.)
- `SHOW_DOCUMENT_DELETE_BUTTON` is on the settings screen four times but read nowhere — dead setting?

## Wiki impact

- `membership/membership-admin-applet` — rewritten (done 2026-09-05).
- `master-data/organisation-applet` — should document the company member-point configuration (which doc type / status awards points).
- `membership/membership-points-currency` (lane 1, queued) — align with PTS CCY / PTS to CCY facts here.
