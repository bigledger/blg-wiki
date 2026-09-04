---
title: "Membership Admin"
description: "Reference for the Membership Admin applet: member records and cards, member classes, labels and label lists, point currencies and point-to-money / point-to-point conversion, manual point adjustments, points expiry, suspensions, referrals and MLM links, CSV uploads and the membership report."
applet_code: "MEMBERSHIPADMIN"
applet_repo: "blg-applet-wavelet-membership-admin-applet"
modules: [membership, pos, crm-digital]
related_applets: [membership-points-currency, membership-program, pos-general-applet, internal-sales-invoice-applet, customer-applet, voucher-management-applet, commission-scheme-applet, organisation-applet, doc-item-maintenance-applet, sales-report-applet]
guides: []
sources:
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/app.routing.ts
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/app.component.ts
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/models/membership-constants.ts
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/settings-container/field-configuration/ (applet-own Field Settings screen)
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/settings-container/default-settings/
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/settings-container/custom-status/
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/settings-container/card-type/
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/member-listing-container/ (member-listing, member-create, member-edit and its sub-tabs, add-point-adjustment, member-suspension, points-expiry, linked-label-create)
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/member-class-container/
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/member-label-container/, member-label-list-container/
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/membership-pointscurrency-container/, membership-points-to-money-container/, membership-points-to-points-container/
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/app/components/membership-report/, upload-member-master-data-container/, upload-member-point-transaction/, audit-trail-container/
  - blg-applet-wavelet-membership-admin-applet/micro-fe/projects/wavelet-erp/applets/membership-admin-applet/src/assets/templates/Membership_Template_Format.csv (header row only)
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/MembershipPointsTxnService.java (docTypeValid, processData, recalculatePoints)
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/MembershipCtrlAccAndCurrentBalanceService.java (voidMembershipPoints, expireMembershipPoints)
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/MembershipConfigService.java (generateCardNo)
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/MemberBirthdayPointService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/MembershipClassService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/membershipPointsTxnDataConsistencyObjects/, MembershipClassDataConsistencyObjects/, MembershipFileImportHelperDataConsistencyObjects/
  - akaun_master.bl_applet_client_side_perm_dfn (applet code MEMBERSHIPADMIN)
tags:
- membership-management
- loyalty-program
- points-system
- member-privileges
- customer-retention
weight: 10
aliases:
- /applets/membership-admin-applet/
---

## Overview

The **Membership Admin** applet is the back office of the loyalty programme. Marketing and customer-service staff use it to register members and issue cards, group them into member classes (tiers) and labels (segments), define the point currencies members collect and what a point is worth in money, correct balances with manual adjustments, look at each member's point transactions, expiry rows, suspensions, referrals and multi-level-marketing links, upload members and point transactions from CSV, and generate the membership report. Points themselves are earned and redeemed at the counter — in [POS General](/applets/sales-workflow/pos-general-applet/) and [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — and posted by the backend; this applet configures and audits them.

{{< callout type="info" >}}
Registry code `MEMBERSHIPADMIN`. Master-data applet: no document lifecycle, no journal posting. Point balances live in `bl_crm_membership_points_txn_line` rows and per-currency control-account rows maintained by the backend.
{{< /callout >}}

{{< figure src="/images/membership-admin-applet/membership-admin-applet-overview.png" alt="Membership Admin overview: scattered data, rigid rules and hidden liability versus centralised profiles, flexible logic and full visibility" caption="One place for members, classes, labels, point currencies and conversions." >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Company, branch, location; the **company member-point configuration** decides which document type and posting status award points |
| Upstream | [Customer](/applets/master-data/customer-applet/) | A member may be linked to a customer entity (Customer Name field; customer drop-down in member search) |
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Manual point adjustments are recorded against an item; POS needs a `MEMBER_POINT_DISCOUNT` item |
| Sibling | [Membership Points Currency](/applets/membership/membership-points-currency/), [Membership Program](/applets/membership/membership-program/) | Point currency rates and programmes used by the MLM tab |
| Downstream | [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) | Look up the member, earn points on the bill, redeem points as settlement; void reverses the points |
| Downstream | [Voucher Management](/applets/membership/voucher-management-applet/), [Commission Scheme](/applets/membership/commission-scheme-applet/) | Vouchers assigned to members; MLM / referral commissions |
| Downstream | [Sales Report](/applets/sales-workflow/sales-report-applet/) | Member reward redemption report route |

## Screens and menus

Route root: `applet/wavelet/erp/membership/membership-admin-applet/`.

| Menu item | Route | What it shows |
|---|---|---|
| **Member Listing** | `member-listing` | Grid: Card No, Member ID, Member Name, Email, Mobile No., Referral Code, Date of Birth, Member Class, Join / End Date, Card Type, Branch, Sales Agent; advanced search (branch limited to permission targets; optional customer drop-down); **+** opens Member Create |
| **Member Class** | `member-privilege` | Classes (tiers): code, name, status, number of members; Details / Labels / Members tabs, class images and aliases |
| **Member Label** | `member-label` | Labels (segments): code, name, parent label list |
| **Member Label List** | `member-label-list` | Groups of labels: code, name, and the labels under each list |
| **PTS CCY Module** | `membership-pointscurrency-listing` | Point currencies: code, name, conversion rate, point-to-point cross-over conversion, status |
| **PTS to CCY Config** | `membership-pointstomoneycurrencyconversion-listing` | Point currency → money currency conversion rate, status |
| **Membership Report** | `membership-report-listing` | Filter members by date of birth, start date, end date or lifetime; Generate CSV; report queue with status and error message |
| **Upload Membership** | `member-master-data-listing` | CSV import of members (Sample Format download; Main / Checking tabs) |
| **Upload Member Point Transaction** | `member-point-txn-data-listing` | CSV import of point transactions |
| **Audit Trail** | `audit-trail` | Applet code, table, action, user, device, dates |

A `PTS to PTS Config` route (`membership-pointstopointscurrencyconversion-listing`, point currency → point currency rate) exists but its menu entry is commented out.

{{< figure src="/images/membership-admin-applet/sidebar-overview.png" alt="Sidebar" caption="Sidebar menu." >}}

{{< figure src="/images/membership-admin-applet/Member-Listing-Page.png" alt="Member Listing" caption="Member Listing." >}}

### Member Create and Membership Edit

**Member Create** (from **+** on the listing): Member Name (required), Country Code + Mobile No. (required unless the tenant setting `NOT_MANDATORY_PHONE_NO` is on), IC / Passport, Email, Member ID, Membership End Date (or `LIFETIME`), Verification Status, Card Type (when Card Types are defined), Branch and Sales Agent (when `SHOW_BRANCH` / `SHOW_SALES_AGENT` are on).

{{< figure src="/images/membership-admin-applet/create-member.png" alt="Member Create" caption="Member Create." >}}

**Membership Edit** opens from a listing row. Tabs (order set under Default Selection): **Details**, **E-Invoice**, **Member Photos**, **Labels**, **Point Transaction**, **Points Expiry**, **Upload Attachments**, **Referrals**, **MLM**, **Member Suspension**.

| Tab | Content |
|---|---|
| Details | Member Name, Card No, Card Type, Customer Name, Member ID, Branch, Phone, Email, IC / Passport, Date of Birth, Gender, Referral Code, Member Class, Verification Status, Member Status (plus up to two custom header statuses), Membership Join / Start / End Date, Point Currency and Current Point Balance, Remarks, audit fields; **Add Point Adjustment** button |
| E-Invoice | Buyer name, ID type and number, TIN, SST registration, tourism tax ID, MSIC code, contact, email, address; *skip e-Invoice* toggle |
| Labels | Labels linked to the member (label list → label); link and unlink |
| Point Transaction | Branch, Transaction Date, Transaction Type, Point Currency, Points, Remark, Display Type, Source, Created By; editable with `ALLOW_EDIT_MEMBERSHIP_POINTS` |
| Points Expiry | Balance Amount, Start / End Date, Next Expiry Date Check, Point Currency; Point Expiry Edit |
| Referrals | Invited Members (who this member referred) and Invited By |
| MLM | Pick a Program, then Uplines and Downlines with level, invite method and status; add / edit links |
| Member Suspension | Start Date, End Date, Duration (days), Remarks; Create Suspension / Edit Suspension |

{{< figure src="/images/membership-admin-applet/Member-Profile-Transaction History.png" alt="Point Transaction tab" caption="Point Transaction tab." >}}

{{< figure src="/images/membership-admin-applet/member-suspension.png" alt="Member Suspension" caption="Member Suspension tab." >}}

**Add Point Adjustment**: Branch (required), Item Code & Name (required), Point Currency, Point Adjustment (required; positive adds, negative deducts), Transaction Date, Valid Date From / To, Reference Number, Remarks / Reason, Display Type (`DISPLAY` or `HIDDEN` from the member-facing history). The transaction is written with source `ADMIN_MANUAL_POINTS_ASSIGNMENT`.

{{< figure src="/images/membership-admin-applet/add-point-adjustment-form-1.png" alt="Add Point Adjustment" caption="Add Point Adjustment." >}}

### Classes, labels, currencies

{{< figure src="/images/membership-admin-applet/member-class-create-form.png" alt="Member Class create" caption="Member Class — code and name." >}}

{{< figure src="/images/membership-admin-applet/Member-Label-Create-Form.png" alt="Member Label create" caption="Member Label — code, name, label list." >}}

{{< figure src="/images/membership-admin-applet/member-class-vs-label.png" alt="Class versus label" caption="A member has one class and any number of labels." >}}

{{< figure src="/images/membership-admin-applet/PTS-CCY-Module-Create-Form.png" alt="Point currency create" caption="PTS CCY Module — point currency." >}}

{{< figure src="/images/membership-admin-applet/PTS-to-CCY-Config-Create-Form.png" alt="Points to money conversion" caption="PTS to CCY Config — point currency to money currency." >}}

### Uploads and report

{{< figure src="/images/membership-admin-applet/upload-membership.png" alt="Upload Membership" caption="Upload Membership — Sample Format, drag-and-drop, ADD." >}}

{{< figure src="/images/membership-admin-applet/upload-member-point-transaction.png" alt="Upload Member Point Transaction" caption="Upload Member Point Transaction." >}}

{{< figure src="/images/membership-admin-applet/Membership-Report-Generate-CSV.png" alt="Membership Report" caption="Membership Report — filters and Generate CSV." >}}

### Settings and Personalization menus

| Entry | Route | Purpose |
|---|---|---|
| Field Settings | `settings/field-settings` | The applet's **own** settings screen (card number, doc settings, member label link, points, suspension, member list search) |
| Default Selection | `settings/default-selection` | Default Branch, Default Location, Default Timezone, Website, order of the Membership Edit tabs |
| Custom Status | `settings/custom-status` | Enable custom statuses 1–5 at header and line level, with name and value list |
| Card Type | `settings/card-type` | Card types (code, name, description) offered on the member form |
| Webhook, Feature Visibility, permission listings | `settings/…` | Standard |
| **Personalization → Default Selection** | `personalization/personal-default-selection` | Per-user defaults |

{{< figure src="/images/membership-admin-applet/settings-field-settings.png" alt="Field Settings" caption="Settings → Field Settings." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Members and adjustments are branch-scoped; member search is limited to the branches in the user's permission targets |
| **Company member-point configuration**: which document type awards points (`member_point_award_doc_in`) and at which posting status (`member_point_in_doc_status`) | Company settings in [Organisation](/applets/master-data/organisation-applet/) | The backend awards points only when the document type and status match and the bill carries a member; otherwise nothing is posted |
| At least one point currency (PTS CCY Module) and a point-to-money rate (PTS to CCY Config) | This applet | Without a currency there is nothing to earn; without a rate points cannot be redeemed as money |
| Items for point adjustment and, for POS redemption, a `MEMBER_POINT_DISCOUNT` adjustment item | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Add Point Adjustment requires an item; POS Default Selection needs the points-discount item |
| Card-number rule: running number, IC or mobile number | Settings → Field Settings | A member cannot be saved without a card number source |
| Member classes, label lists and labels | This applet | Optional; class and labels are picked on the member form |
| API permissions `API_TNT_DM_CRM_MEMBERSHIP_CARD_HDR_{READ,CREATE,UPDATE}` (with branch targets) | Settings → permission listings | Listing, create and edit |

### Applet settings

**Field Settings** (`settings/field-settings`)

| Section | Setting | Effect when on |
|---|---|---|
| Card Number | `ENABLE_CUSTOM_CARD_RUNNING_NO` + Card Running Number (`CARD_RUNNING_NUMBER`) | Card numbers come from the applet's running-number configuration (`RUNNING_NUMBER` / `card_no`) starting at the value given |
| Card Number | `ASSIGN_IC_CARD_NO` | The IC / passport number becomes the card number (IC becomes required) |
| Card Number | `ASSIGN_MOBILE_PHONE_CARD_NO` | The mobile number becomes the card number |
| Card Number | `SHOW_BRANCH`, `SHOW_SALES_AGENT` | Branch and Sales Agent fields on the member form |
| Doc Settings | `SHOW_DOCUMENT_DELETE_BUTTON` | Shown on the screen in each section, but not read by the current listing code |
| Member Label Link | `ENABLE_WEBSITE_SELECTION_ON_MEM_LABEL_LINK` | Choose a website when linking a label to a member (default website from Default Selection) |
| Points Settings | `DISALLOW_EDIT_MEMBERSHIP_POINTS` | Point Transaction and Points Expiry rows are read-only unless the user holds `ALLOW_EDIT_MEMBERSHIP_POINTS` |
| Suspension Settings | `SUSPENSION_SETTINGS_BY_DATE_HIDE_TIME` | Suspension start / end are dates only (time hidden) |
| Member List Advanced Search | `ENABLE_CUSTOMER_DROPDOWN_IN_MEMBER_LIST_SEARCH` | Customer drop-down in the listing's advanced search |

The three card-number switches are mutually exclusive (turning one on clears the others).

**Default Selection** (`settings/default-selection`): `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_TIMEZONE` (used for join / transaction dates), `DEFAULT_WEBSITE_CODE` (Select Website), and drag-and-drop order of the Membership Edit tabs (`MEMBER_DETAILS_TAB_ORDER`). Personalization → Default Selection repeats branch and location per user.

**Custom Status** (`settings/custom-status`): `ENABLE_CUSTOM_STATUS_1…5`, each with **Header** (`ENABLE_CUSTOM_STATUS_HDR_n`) and **Line** (`ENABLE_CUSTOM_STATUS_LINE_n`) switches, a name (`NAME_CUSTOM_STATUS_HDR_n` / `_LINE_n`) and a value list (`LIST_CUSTOM_STATUS_HDR_n` / `_LINE_n`). Header statuses 1 and 2 appear as extra status fields on the member Details tab. Custom statuses are labels only — they do not change whether a member can earn or redeem.

**Card Type** (`settings/card-type`): Card Type Code, Card Type Name, Description. When at least one exists, Card Type becomes a drop-down on the member form.

Keys in the settings model with no UI: `NOT_MANDATORY_PHONE_NO` (read: makes mobile number optional), department / tax `ENABLE_*`, `PRINTABLE`.

### Document behaviour settings

Not applicable — no documents. Point behaviour that is fixed in the backend:

| Behaviour | How it works |
|---|---|
| Earning | When a document of the configured type reaches the configured status with a member on it, each line with a point amount and point currency becomes a point transaction line; missing point fields leave the document unposted so it can be retried |
| Redeeming | POS / invoice redeem lines are validated against the member's balance at FINAL |
| Void | Voiding the document reverses its point lines; if the balance is now insufficient an adjustment line is added for the shortfall |
| Expiry | A scheduled processor expires every control-account row whose balance is positive and whose end date has passed, writing an `EXPIRY` transaction; Points Expiry rows show the next check date |
| Birthday points | Optional `MEMBER_BIRTHDAY_GIFT_PROCESSOR` schedule |
| Recalculation | Balances can be recalculated per member or for all members through the recalculation queue |

### Feature visibility / permissions

API: `API_TNT_DM_CRM_MEMBERSHIP_CARD_HDR_{READ,CREATE,UPDATE}`; report: `API_TNT_DM_ERP_REPORT_MEMBERSHIP_POINTS_REWARD_REDEMPTION_READ`.

Client-side permissions registered for this applet (2): `ALLOW_EDIT_MEMBERSHIP_POINTS` (edit point transaction and expiry rows when `DISALLOW_EDIT_MEMBERSHIP_POINTS` is on) and `EDIT_MEMBERSHIP_END_DATE` (edit the Membership End Date field).

## Fields

**Member** — see Member Create / Membership Edit above. Required: Member Name; Country Code and Mobile No. (unless `NOT_MANDATORY_PHONE_NO`); IC / Passport when it is the card number; Card Type when card types exist; Membership End Date or `LIFETIME`.

**Member Class**: Membership Class Code, Membership Class Name (both required), Status; Labels and Members tabs; images and aliases.

**Member Label**: Label Code, Label Name (required), Label List. **Member Label List**: Label List Code, Label List Name (required); labels created inside a list carry the list code.

**Point currency** (PTS CCY Module): Membership Point Currency Code, Name, Conversion Rate, Point-to-point cross-over conversion, Status. **PTS to CCY Config**: Point Currency, Money Currency, Conversion Rate, Status. **PTS to PTS Config**: Point Currency (from / to), Conversion Rate, cross-over flag, Status.

**Upload Membership** CSV columns (Sample Format): `MEMBER NAME`, `GENDER`, `DATE OF BIRTH`, `COUNTRY CODE`, `MOBILE NO.`, `IC/PASSPORT`, `EMAIL`, `MEMBER CLASS`, `JOIN DATE`, `START DATE`, `END DATE`, `MEMBERSHIP STATUS`, `REMARKS`, `LABEL 1`, `LABEL 2`, `LABEL 3`. Member class and labels must already exist by code.

**Upload Member Point Transaction** CSV: download *Sample Format → Member Point Txn* on the screen for the exact header (member card number, company and branch code, point currency, points, transaction type and date, description, validity and document reference). Rows are validated on the Checking tab before import.

**Membership Report**: Date of Birth from / to, Start Date from / to, End Date from / to, Life Time; output is a CSV in the report queue.

## Lifecycle and posting

Not applicable. Records are ACTIVE / INACTIVE (members can additionally be suspended for a date range and carry a Verification Status). Point balances change only through the backend transaction lines described above and through Add Point Adjustment.

## Related applets

- [Membership Points Currency](/applets/membership/membership-points-currency/) and [Membership Program](/applets/membership/membership-program/) — currency rates and programmes.
- [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — where points are earned and redeemed.
- [Customer](/applets/master-data/customer-applet/), [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — linked customer, company point configuration, adjustment items.
- [Voucher Management](/applets/membership/voucher-management-applet/), [Commission Scheme](/applets/membership/commission-scheme-applet/), [Sales Report](/applets/sales-workflow/sales-report-applet/) — vouchers, MLM commissions, reward-redemption report.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Member cannot be saved — card number missing | No card-number rule | Field Settings → enable custom running number, or assign IC / mobile to card number |
| *Failed to generate card_no running number* | Running-number configuration missing or exhausted | Field Settings → Card Running Number |
| Mobile number demanded although not wanted | `NOT_MANDATORY_PHONE_NO` off | Set it in the applet settings record (no toggle on screen) |
| Bills for a member earn no points | Company member-point configuration does not match the document type / status, or lines have no point amount and currency (no pricebook point rule) | Organisation → company settings; Pricebook point rules |
| Points not visible in POS after a void | Void reversed them and, if the balance was short, added an adjustment | Check Point Transaction tab |
| Point Transaction rows cannot be edited | `DISALLOW_EDIT_MEMBERSHIP_POINTS` on and user lacks `ALLOW_EDIT_MEMBERSHIP_POINTS` | Grant the permission |
| Points expired unexpectedly | Control-account end date passed; the expiry processor ran | Points Expiry tab; extend the valid-to date on the adjustment |
| Member search shows only some branches | Branch targets on `API_TNT_DM_CRM_MEMBERSHIP_CARD_HDR_READ` | Add the branches |
| Join Date shifted by a day | Timezone | Default Selection → Default Timezone |
| Upload rejected on the Checking tab | Class or label code not found, date format, missing mandatory column | Fix the row; classes and labels must exist first |
| Created By blank in a grid | Name lookup failed for that user (older build failed the whole grid) | Cosmetic; fixed to leave the cell blank |

## Related documentation

- [Membership module](/modules-v2/membership/)
- [Membership applets](/applets/membership/)
