---
title: "POS General"
description: "Reference for the POS General applet: the retail checkout counter that creates cash bills, settles them by cash, card, e-wallet, voucher, points or contra, posts stock and journal on FINAL, and gives supervisors Z Report, Cashier Collection, settlement adjustment and serial-number swap tools."
applet_code: "posGeneral"
applet_repo: "blg-applet-wavelet-pos-general-applet"
modules: [pos, inventory, financial-accounting, membership, e-invoice]
related_applets: [daily-cashier-report-applet, internal-sales-refund-note-applet, sales-commission-applet, internal-sales-return-applet, internal-sales-invoice-applet, non-stock-and-trade-in-applet, membership-admin-applet, membership-points-currency, voucher-management-applet, customer-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, pricebook-applet, cashbook-applet, chart-of-account-applet, tax-configuration-applet, organisation-applet, stock-balance-applet, my-e-invoice-portal-applet, bank-reconciliation-applet, sales-report-applet, internal-receipt-voucher-applet]
guides: [/user-guide/daily-tasks/]
sources:
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/app.routing.ts
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/app.component.ts
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settings-container/pos-settings-container/pos-settings/pos-settings.component.html
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settings-container/branch-settings/branch/ (branch-details, default-settlement-method, item-category-filter, menu-list, pricing-scheme, default-printable-format, printable-image)
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settings-container/settlement-method/
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/device-container/ (create, card-terminal-create, settlement-method-add)
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/drawer-container/
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/free-gift-container/create/
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/return-remarks-container/
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/personalization-container/ (personal-default-settings, offline-settings)
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/pos-container/ (pos-create, main-button, pos-item-view, cashbill-listing, session-open, session-close, float-count, cash-in-out, hdr-approval, others, e-invoice)
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/item-container/ (item-add-main, item-edit-main, item-listing, batch-number, bin-number)
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settlement-container/
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settlement-adjustment-container/listing/listing.component.ts
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/swap-serial-container/listing/listing.component.ts
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/sales-return-container/ (item-add-main, item-edit-main)
  - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/file-import-container/
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html (POS Settings, Auto UI, Cashier Collection Report and posGeneral-gated items)
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesCashbillDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseTradeInDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java (validateCashbillAmount, validateDefaultLocation, disallowBlacklistedCustomer, generateSettlementLineForZeroAmountCashbill, generateMissingRewardRedeemPoints, validateRedeemedPointsBalance)
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/EntitySpendingLimitLineService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/CouponService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceToIRBProcessorService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/consolidated/ConsolidatedEInvoiceProcessorByBranchService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/sales/ZReportUow.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/finance/internalSalesCashBillFileImport/InternalSalesCashBillImportFileHdrService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code posGeneral)
tags:
- pos-module
- point-of-sale
- retail
- store-management
- cashier-tools
- system-setup
weight: 200
---

## Overview

The **POS General** applet is the retail checkout counter. A cashier opens it on a terminal, scans or picks items, applies member points, vouchers, discounts or free gifts, takes payment by cash, card, e-wallet, voucher, cheque, bank transfer or contra, and the applet writes a **cash bill** that — on FINAL — takes the goods out of stock, posts the sale and the money to the ledger and cashbook, and queues the bill for e-Invoice. Supervisors use the same applet to open and close cashier sessions with float counts, review the Cash Bill Listing, run the Z Report and Cashier Collection, correct a wrong payment method after FINAL, swap a wrongly scanned serial number, and approve sell-below-price requests. It can run offline against a local database and sync when the network returns.

{{< callout type="info" >}}
Server document type `INTERNAL_SALES_CASHBILL`. Amount signum **+1**, quantity signum **−1** — a cash bill is a sales invoice that is settled on the spot: it posts revenue and stock-out like an invoice, and its settlement lines post straight to the cashbook.
{{< /callout >}}

## Video tutorial

{{< youtube Gf6gXUfHebE >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Company, branch (with its default location), location |
| Upstream | [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Items, barcodes, serial/batch/bin control, bundles and made-to-order items, the rounding / group-discount / points-discount adjustment items |
| Upstream | [Pricebook](/applets/master-data/pricebook-applet/) | Pricing scheme, retail pricebooks, promotions; free-gift rules are stored as a pricebook of type `POS_FREE_GIFT` |
| Upstream | [Customer](/applets/master-data/customer-applet/), [Membership Admin](/applets/membership/membership-admin-applet/), [Membership Points Currency](/applets/membership/membership-points-currency/) | Default walk-in customer, members, points earned and redeemed, spending limits, blacklist |
| Upstream | [Cashbook](/applets/master-data/cashbook-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Settlement methods with cashbook + GL; company default GL codes; SST codes |
| Upstream | [Voucher Management](/applets/membership/voucher-management-applet/) | Vouchers and coupons redeemed as settlement or as lines |
| Downstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | FINAL bills reduce stock at the branch's location; trade-in lines bring stock in |
| Downstream | [Daily Cashier Report](/applets/sales-workflow/daily-cashier-report-applet/), [Sales Report](/applets/sales-workflow/sales-report-applet/) | Z Report, Cashier Collection and sales analysis read FINAL cash bills |
| Downstream | [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) | Card / transfer settlement lines appear in the cashbook for reconciliation; updating a bill whose line is reconciled returns an unreconcile error |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | Cash bills submit as e-Invoice type 01 (Invoice), individually or consolidated by branch |
| Sibling | [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) | A POS return is recorded as `INTERNAL_SALES_RETURN` lines inside the cash bill; larger returns go through the return applet |
| Sibling | [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/) | Trade-in lines carry doc type `INTERNAL_PURCHASE_TRADE_IN` and NSTI items |
| Sibling | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) | Same posting family; the invoice is the credit-terms equivalent |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/pos-general-applet/`.

| Menu item | Route | What it shows | Shown when |
|---|---|---|---|
| **Create Cash Bill** | `pos` | The counter screen (left-right or top-bottom theme) | always |
| **Cash Bill Listing** | `listing` | Advanced search, view/edit, reprint, email, export, void | always |
| **Cashier Collection** | `cashier-collection-report` | Collections grouped by settlement method per cashier | unless `HIDE_CASHIER_COLECTION_REPORT` (user with `POS_SHOW_CASHIER_COLECTION_REPORT` still sees it) |
| **Z Report** | `z-report` | End-of-day summary, export to PDF | unless `HIDE_Z_REPORT` (override `POS_SHOW_Z_REPORT`) |
| **Upload Cashbill** | `file-import` | Delimited-file import with a Checking step | unless `HIDE_FILE_UPLOAD_MENU` |
| **Settlement Adjustment** | `settlement-adjustment` | Change payment methods on FINAL bills; history | `ENABLE_EDIT_SETTLEMENT_FINAL` **and** user holds `POS_EDIT_SETTLEMENT_FINAL` |
| **Swap Serial Number** | `swap-serial` | Swap a sold serial for another available one; history | `POS_SWAP_SERIAL_FINAL` **and** user holds `POS_SWAP_SERIAL_NUMBER_FINAL` |
| **Audit Trail** | `audit-trail` | Who changed what on a bill | unless `HIDE_AUDIT_TRAIL_MENU` (override `POS_SHOW_AUDIT_TRAIL_REPORT`) |
| **Approval**, **Approval History** | `approval`, `approval-history` | Sell-below-price requests waiting for a supervisor; past decisions | `POS_SHOW_APPROVAL` **and** user holds `ALLOW_APPROVE_SELL_BELOW_PRICE` |
| **Session** | `pos-session` | Cashier sessions (code, name, device, start/end, status) | `SESSION_FLOAT_CONTROL` |

{{< figure src="/images/pos-general-applet/login pos general.png" alt="Opening the POS General applet" caption="The applet on the tenant dashboard." >}}

### The counter screen (Create Cash Bill)

Tabs: **Main**; **Hold Bill** (parked drafts, on a bill that is not FINAL); **Transaction Queue** (bills waiting to sync in offline mode); **Copy From** (with `POS_COPY_FROM` — pull lines from a jobsheet, sales order or sales invoice by document number). Panels reachable from the Main tab: customer / member (Account), sales agent, branch (with `POS_CHANGE_BRANCH`), others (reference, remarks, backdate), department, item discount, group discount, points discount, e-Invoice buyer details, spending limit, gross profit, previous cash bill, attach / detach drawer, session open / close, float count, cash in / out.

{{< figure src="/images/pos-general-applet/create cashbiil.png" alt="Create Cash Bill" caption="Start a new cash bill." >}}

{{< figure src="/images/pos-general-applet/change customer.png" alt="Change customer" caption="The default customer is pre-selected; click Entity ID to search." >}}

{{< figure src="/images/pos-general-applet/select customer.png" alt="Select customer" caption="Search and pick a customer or member." >}}

{{< figure src="/images/pos-general-applet/add item or scane code.png" alt="Add item or scan" caption="Scan a barcode into the search box or click Add." >}}

{{< figure src="/images/pos-general-applet/search item and select item.png" alt="Search item" caption="Manual item search." >}}

{{< figure src="/images/pos-general-applet/edit qty and edit price.png" alt="Edit quantity and price" caption="Quantity and price edits (price edits need the matching permission)." >}}

{{< figure src="/images/pos-general-applet/continue adding tje item.png" alt="Adding more items" caption="Keep adding lines until the order is complete." >}}

**Item dialog** tabs (shown per item type): Details, Item Details, Serial Number, Batch Number, Bin Number, Child Item (bundle), MTO (made-to-order), Grouped Item, Multi Level Discount, Membership Points, Department, Stock Details, Sales History, Swap Serial Number, Approval, Attachment.

**Settlement**: a button per settlement method configured for the branch; types `CASH` (with six quick-cash buttons), `CREDIT_CARD` (card no., name, issuer, expiry, approval code, batch, card type — each hideable or mandatory), `E_WALLET`, `VOUCHER`, `COUPON`, `CHEQUE`, `BANK_TRANSFER`, member points (points ↔ cash value with a maximum), and **Contra** against the customer's open documents when `CONTRA_DOCUMENT` is on. Rounding is added as a line using the rounding adjustment item.

{{< figure src="/images/pos-general-applet/payment method.png" alt="Payment method" caption="Settlement method buttons." >}}

{{< figure src="/images/pos-general-applet/key in relevant info.png" alt="Enter payment details" caption="Amount and method-specific references." >}}

{{< figure src="/images/pos-general-applet/ready for final.png" alt="Final" caption="FINAL posts stock, journal and cashbook." >}}

### Cash Bill Listing

Advanced search by date, branch, status, customer, cashier; open a bill to view, edit remarks, email, export as PDF, void, return, reprint (single / multiple print with `POS_PRINT_CASHBILL_LISTING`).

{{< figure src="/images/pos-general-applet/cashbill listing search.png" alt="Cash Bill Listing" caption="Advanced search." >}}

{{< figure src="/images/pos-general-applet/review it.png" alt="Review a cash bill" caption="View, edit remarks, email." >}}

{{< figure src="/images/pos-general-applet/reprint.png" alt="Reprint" caption="Single / multiple print from the listing." >}}

### Supervisor tools

{{< figure src="/images/pos-general-applet/click into item.png" alt="Open the item" caption="Swap Serial Number starts from the sold line." >}}

{{< figure src="/images/pos-general-applet/swap sn.png" alt="Swap Serial Number tab" caption="Pick the wrong serial and the correct available one." >}}

{{< figure src="/images/pos-general-applet/sawp sn 2.png" alt="Execute swap" caption="Both stock records are corrected." >}}

{{< figure src="/images/pos-general-applet/;ist of sawp sn.png" alt="Swap history" caption="Swap Serial Number menu — history." >}}

{{< figure src="/images/pos-general-applet/settlement tab.png" alt="Settlement tab" caption="Settlement Adjustment: open the bill's Settlement tab." >}}

{{< figure src="/images/pos-general-applet/remove wrong settlement method.png" alt="Select wrong settlement" caption="Adjustment sub-tab: select the wrong method." >}}

{{< figure src="/images/pos-general-applet/click delete to remove wrong settlement.png" alt="Delete" caption="Remove it." >}}

{{< figure src="/images/pos-general-applet/add correct settlement.png" alt="Add correct settlement" caption="Add the right method." >}}

{{< figure src="/images/pos-general-applet/add correct details.png" alt="Correct details" caption="Enter the details." >}}

{{< figure src="/images/pos-general-applet/adjust settlemetn.png" alt="Adjust Settlement" caption="Adjust Settlement re-posts the settlement lines." >}}

{{< figure src="/images/pos-general-applet/settlement adjustment menu.png" alt="Settlement Adjustment menu" caption="History of adjustments." >}}

### Reports

{{< figure src="/images/pos-general-applet/cashier collection report.png" alt="Cashier Collection" caption="Cashier Collection — advanced search." >}}

{{< figure src="/images/pos-general-applet/report desaign.png" alt="Collection totals" caption="Totals grouped by settlement method." >}}

{{< figure src="/images/pos-general-applet/Z REPORT.png" alt="Z Report" caption="Z Report search." >}}

{{< figure src="/images/pos-general-applet/EXPORT TO PDF.png" alt="Export to PDF" caption="Export the Z Report." >}}

{{< figure src="/images/pos-general-applet/PRINT Z REPORT.png" alt="Print Z Report" caption="Printed Z Report." >}}

### Settings and Personalization menus

| Entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | Shared Field Configuration screen — 155 toggles apply to this applet (see Configuration) |
| Printable Format Settings | `settings/printable-format-settings` | Receipt / bill formats for `INTERNAL_SALES_CASHBILL` |
| Default Selection Settings | `settings/default-selection` | Applet-wide defaults: customer, pricing scheme, pricebook, entity type, currency, adjustment items |
| Branch Settings | `settings/branch-settings` | Per-branch: details, default settlement method, item category filter, menu list, pricing scheme priority, printable header / footer and image |
| Settlement Method Settings | `settings/settlement-method` | Which settlement methods (code, name, cashbook, type) each company / branch offers |
| Device Settings | `settings/device-settings` | POS terminal devices (code, name, MAC address, branch), card terminals, settlement methods per device |
| Return Remarks Settings | `settings/remarks-settings` | The pick-list of return reasons |
| Drawer Settings | `settings/drawer-settings` | Cash drawers (code, name) and drawer transactions |
| Free Gift Settings | `settings/free-gift` | Free-gift promotions |
| Email Template | `settings/email-template` | Template used by Email To Customer |
| Webhook, Feature Visibility, Release Notes, Applet Log | `settings/…` | Standard |
| Client-Side Permission, Role ↔ Pricing Scheme Link, Permission Wizard / Set / User / Team / Role listings | `settings/*-listing` | Access control; the role–pricing-scheme link decides which pricing scheme a role sells at |
| **Personalization → Default Selection** | `personalization/personal-default-selection` | Per-user: default branch (and delivery branch / location), default customer, default sales agent — overrides the applet defaults |
| **Personalization → Offline Settings** | `personalization/offline-settings` | Offline mode, POS Agent and port, offline print, plain-text print with paper size, local running-number prefix, sync |

{{< figure src="/images/pos-general-applet/personalization-default setting.png" alt="Personal default selection" caption="Personalization → Default Selection." >}}

A legacy **Pos Settings** screen at `settings/pos-settings` is still routable but is not in the Settings menu; it edits a subset of the same keys plus `SHOW_WHT`, `SERIAL_OPEN_QUEUE` and the barcode fields (`REGEX`, `ITEMCODE_LENGTH`, `ITEMPRICE_LENGTH`).

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location — and the branch's **default location** set | [Organisation](/applets/master-data/organisation-applet/) | FINAL fails with *The location does not match the branch's default location* when the bill's location differs from the branch default |
| Company default GL codes `DEBTOR`, `SALES`, `SALES_DISCOUNT`, `SALES_RETURN`, `OUTPUT_TAX`, `COGS`, `FOREX_GAIN`, `FOREX_LOSS` | [Chart of Account](/applets/master-data/chart-of-account-applet/) | The `SALES` journal handler needs them; missing → `MISSING_DEFAULT_GL_CODE: <code>` |
| Settlement methods, each with a **cashbook and GL code**, linked to the branch | [Cashbook](/applets/master-data/cashbook-applet/) → then Settings → Settlement Method Settings and Branch Settings | Every payment line posts to that cashbook; missing → `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]`; no buttons appear on the counter until the branch has methods |
| A default (walk-in) customer, entity type and currency | [Customer](/applets/master-data/customer-applet/) → Settings → Default Selection | Every bill needs an entity; blacklisted customers are rejected at FINAL |
| Pricing scheme and (optionally) pricebook | [Pricebook](/applets/master-data/pricebook-applet/) → Default Selection; Branch Settings → Pricing Scheme; Role ↔ Pricing Scheme Link | Retail price per item; role link decides who sells at which scheme |
| Adjustment items for **rounding** (`DOC_HEADER_ADJUSTMENT`), **group discount** (`GROUP_DISCOUNT`) and **points discount** (`MEMBER_POINT_DISCOUNT`) | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) → Default Selection | Without them rounding, group discount and points redemption cannot add their lines |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Shown when `SHOW_TAX` is on; posts to `OUTPUT_TAX` |
| Items with barcodes, serial / batch / bin control, bundles, MTO | [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Scanning and sub-item tabs |
| Printable format for `INTERNAL_SALES_CASHBILL` and branch header / footer | Settings → Printable Format Settings, Branch Settings | Receipts; offline print needs it synced to the device |
| POS Agent installed on the terminal (for cash drawer, customer display, card terminal, device auto-detect) | Personalization → Offline Settings | `POS_AGENT` + `AGENT_PORT`; device MAC address is read through it |
| Members, points currency and rates (if `SHOW_MEMBER`) | [Membership Admin](/applets/membership/membership-admin-applet/), [Membership Points Currency](/applets/membership/membership-points-currency/) | Points earned are generated on save for a bill with a member; redemption is validated against balance |
| API permissions `TNT_API_DOC_INTERNAL_SALES_CASHBILL_{CREATE,READ,UPDATE,DELETE}_TGT_GUID`, `API_TNT_DM_ERP_REPORT_CASHIER_COLLECTION_READ`, `API_TNT_DM_ERP_Z_REPORT_READ` | Settings → permission listings | Bill access is scoped by branch target; the two report permissions unlock Cashier Collection and Z Report |

### Applet settings

**Default Selection** (`settings/default-selection`, applet-wide)

| Setting | Key | What it controls |
|---|---|---|
| Default Customer | `DEFAULT_CUSTOMER` | Walk-in customer pre-selected on every bill |
| Default Pricing Scheme | `PRICING_RETAIL_GUID` | Retail price source |
| Default Pricebook + Auto Apply Points From Pricebook | `DEFAULT_PRICEBOOK`, `PRICEBOOK_POINTS_AUTO_APPLY` | Promotion pricebook; whether its point rules apply automatically |
| Entity Type | `DEFAULT_ENTITY` | Customer type for new bills |
| Currency | `DEFAULT_CURRENCY` | Bill currency |
| Rounding Item Code | `POS_DEFAULT_ROUNDING_GUID` | Adjustment item used for cash rounding |
| Group Discount Item Code | `POS_DEFAULT_GROUP_DISCOUNT_GUID` | Item that carries a whole-bill discount |
| Points Discount Item Code | `POS_DEFAULT_POINTS_DISCOUNT_GUID` | Item that carries a points redemption |

**Personalization → Default Selection** (per user; overrides the above): Default Branch (`DEFAULT_BRANCH`), Default Delivery Branch / Location (with `POS_SHOW_DELIVERY_BRANCH_LOCATION`), Default Customer, Default Sales Agent.

**Personalization → Offline Settings** (per user / terminal)

| Setting | Key | Effect |
|---|---|---|
| Offline Mode | `OFFLINE_MODE` | Bills are written to the browser's local database and queued (Transaction Queue) until the network returns; master data is synced down |
| Enable POS Agent, POS Agent Port | `POS_AGENT`, `AGENT_PORT` | Talk to the locally installed agent for drawer, display pole, card terminal and device detection |
| Enable Offline Print, Print as Plain Text Format, Paper Size | `OFFLINE_PRINT_DEXIE`, `OFFLINE_PRINT_TEXT`, `PAPER_SIZE` (80mm / 58mm) | Print from the locally cached printable, optionally as plain text for thermal printers |
| Local Running Number Prefix | `LOCAL_DOCNO_PREFIX` | Pattern such as `{BRANCH_CODE}-{DEVICE_CODE}` for numbers issued offline |
| Sync All / Developer sync buttons | — | Re-sync printable, items, pricebook, device, pricing scheme, images; the sync panel needs `POS_OFFLINE_SYNC` |

**Branch Settings** (`settings/branch-settings`, per branch): Branch Details (code, name, company) · Default Settlement Method · Item Category Filter (which categories this branch may sell) · Menu List · Pricing Scheme (with priority) · Printable Format (header, footer) and printable image.

**Settlement Method Settings** (`settings/settlement-method`): per company / branch, the list of settlement methods offered at the counter — Settlement Method Code, Name, Cashbook, Settlement Type (`CASH`, `CREDIT_CARD`, `E_WALLET`, `VOUCHER`, `COUPON`, `CHEQUE`, `BANK_TRANSFER`).

**Device Settings** (`settings/device-settings`): Devices (Code, Name, MAC address detected through the POS Agent, Branch); Card Terminals (Code, Name, Integration Type *CardBiz* / *Revenue*, Transport Mode *ECR cable* / *WIFI*, IP Address, Port Name); settlement methods allowed per device. `DEVICE_COMPULSORY` refuses to sell from an unregistered device.

**Drawer Settings** (`settings/drawer-settings`): Drawers (Code, Name); drawer transactions listing (drawer, device, session, start / end). **Return Remarks Settings**: the reasons offered when `SALES_RETURN_REMARKS_LIST` is on. **Free Gift Settings**: Promotion Name, Start / End Date, Status; Qualifying Item Rule (Item Code, Item Code Regex, Item Category, None) with Min Quantity / Min Amount; Free Gift Rule (None, Repeat for Every Qualifying Amount); Branch Rule (Branch Code); Customer Rule (Customer Code, Customer Category); Free Gift Price Source; Auto Add Free Gift.

**Application Settings** (`settings/field-settings`) — behaviour toggles this applet reads (off unless stated). Section names are those on the shared screen.

*POS Settings*

| Setting | Effect when on |
|---|---|
| `DISABLE_AUTO_POSTING` | Taking payment does **not** finalise: the bill is saved as a DRAFT (Hold Bill) and finalised later from the listing. Default: payment posts FINAL immediately |
| `DISABLE_POSTING_JOURNAL_CASHBOOK` | Settlement Adjustment and Swap Serial Number record the change on the document without re-posting journal and cashbook (their listings track a pending re-post state) |
| `VOID_DOCUMENT` | Void button on FINAL bills, for users with `POS_VOID_CASHBILL` |
| `HIDE_RETURN`, `POS_ALLOW_SALES_RETURN_HIGHER_THAN_SALES`, `SALES_RETURN_REMARKS_LIST` | Hide the Return action (users with `POS_CAN_SALES_RETURN` still see it); allow a return larger than the sale; pick return reasons from the Return Remarks list |
| `CONTRA_DOCUMENT` | Contra settlement against the customer's open documents |
| `SHOW_TRADE_IN` | Trade-in lines (doc type `INTERNAL_PURCHASE_TRADE_IN`); with `TRADE_IN_BASIC_ITEM` (Lines) ordinary stock items may be traded in, not only NSTI items |
| `SHOW_MEMBER`, `COMBINE_CUSTOMER_MEMBER_LIST`, `POS_HIDE_DOB`, `POS_HIDE_MEMBER_PHONE_NO`, `POS_ALLOW_VERIFIED_MEMBER_REDEEM_POINTS`, `POS_DEFAULT_MEMBERSHIP_CLASS`, `POS_MEMBERSHIP_END_DATE`, `POS_WARRANTY_ITEM_FOR_MEMBERS_ONLY`, `POS_SHOW_MEMBER_POINT_DISCOUNT_POINT_LISTING`, `POS_SHOW_MEMBER_POINT_DISCOUNT_Z_REPORT` | Membership panel and its privacy / redemption rules; default class and end date for members created at the counter; warranty-item search only for members; points discount columns in the listing and Z Report |
| `READ_MYKAD` | Read the customer's identity card through the agent |
| `SHOW_TAX` | Tax code and amount columns (`SHOW_WHT` on the legacy screen adds WHT) |
| `HIDE_DISCOUNT`, `HIDE_MULTI_DISCOUNT`, `POS_APPLY_GROUP_ITEM_PRICEBOOK_DISCOUNT_LOGIC`, `POS_MANUAL_PROMOTION_SELECTION`, `POS_FOC_ITEM` | Disable item discount; hide the multi-level discount tab; group-item pricebook discount logic; choose the promotion manually instead of best-price; allow marking a line free of charge |
| `AUTO_APPLY_MTO`, `POS_MTO_USE_COMBINED_ITEMS`, `POS_COUNT_MTO_CHILD_QTY` | Made-to-order handling: auto-apply, combined listing, count child quantities in the total |
| `POS_GROUP_SAME_ITEM_CODE` | Scanning the same item again increases quantity instead of adding a line |
| `SHOW_ITEM_DETAIL_AFTER_SCAN`, `POS_SIMPLIFIED_ITEM_DETAILS_UI`, `QTY_DELIMITER` | Open the item dialog after each scan; simplified dialog; delimiter for `qty*barcode` scans |
| `SESSION_FLOAT_CONTROL`, `POS_AUTO_SESSION_CODE_NAME` | Adds the Session menu: open with an opening float, cash in / out, close with a count; auto-generate session code and name |
| `DEVICE_COMPULSORY`, `CUSTOMER_DISPLAY`, `DISPLAY_POLE_URL`, `POS_CARD_TERMINAL`, `POS_CASH_DRAWER_CASH` | Registered device required; customer-facing display; display pole; integrated card terminal payment; open the drawer on cash settlement |
| `ENABLE_EDIT_SETTLEMENT_FINAL`, `POS_SWAP_SERIAL_FINAL`, `POS_SHOW_APPROVAL` | Enable the Settlement Adjustment, Swap Serial Number and Approval menus (each still needs its permission) |
| `GROUP_SETTLEMENT_METHOD`, `HIDE_CC_DETAILS`, `POS_HIDE_CC_CHARGES`, `CASH_OPTION1…6` | Group settlement buttons by type; hide card details / card charges; the six quick-cash amounts |
| `EMAIL_CUSTOMER`, `EMAIL_SENDER`, `EMAIL_TITLE`, `EMAIL_BODY` | Email the receipt; sender, subject and body |
| `POS_ATTACHMENT`, `POS_COPY_FROM`, `POS_PRINT_CASHBILL_LISTING`, `POS_HIDE_REPRINT`, `POS_HIDE_EXPORT`, `ENABLE_AUTO_POPUP`, `ENABLE_AUTO_DOWNLOAD`, `ZREPORT_PAPER_SIZE` | Attachment tab; Copy From tab; single / multiple print from the listing; hide Reprint on the counter; hide Export; open / download the printable after FINAL; Z Report paper size |
| `POS_THEME` (`LEFT_RIGHT` default, or top-bottom), `POS_HIDE_KEYPAD`, `SHOW_LOCATION_MAIN`, `SHOW_GROSS_PROFIT`, `HIDE_ADD_CUSTOMER`, `POS_SHOW_DELIVERY_BRANCH_LOCATION`, `POS_RETAIN_ITEM_LIST_CHANGE_CUSTOMER`, `POS_VIEW_ALL_SALES_AGENT_FROM_PERM`, `POS_SHOW_ALL_PRICING_SCHEMES` | Layout and counter conveniences; gross profit panel (with `POS_GROSS_PROFIT`); delivery branch / location fields; keep lines when the customer changes; listing by all sales agents according to permission; show every linked pricing scheme |
| `POS_SHOW_RACE`, `MANDATORY_POS_SHOW_RACE`, `CUSTOMER_NAMING`, `COMPULSORY_WARRANTY_SERIAL`, `POS_VOUCHER_INVENTORY` | Race field in Others (optional / mandatory); naming pattern for customers created at the counter; serial numbers required on warranty items; vouchers treated as inventory when scanned |

*Auto UI, Gen Doc Listing, Fields, Create & Print*

| Setting | Effect when on |
|---|---|
| `HIDE_Z_REPORT`, `HIDE_CASHIER_COLECTION_REPORT`, `HIDE_FILE_UPLOAD_MENU`, `HIDE_AUDIT_TRAIL_MENU` | Remove the sidebar item (see Screens for the permission overrides) |
| `AUTO_UI`, `AUTO_UI_ENTITY_SORT`, `AUTO_UI_SALES_AGENT_SORT` | Auto-sort customer and sales-agent pickers by usage |
| `SORT_ORDER`, `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS`, `FUZZY_SEARCH_COLUMNS` | Listing defaults and fuzzy search |
| `VIEW_OWN_CREATED_TRANSACTIONS_ONLY` (Cashier Collection Report tab) | Cashier Collection shows only the bills the user created (`POS_VIEW_CASHBILL_ALL_USER_CREATE` lifts it; `POS_VIEW_ALL_SALES_AGENT_FROM_PERM` with `POS_VIEW_CASHBILL_ALL_SALES_AGENT` widens the listing by sales agent) |
| `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON` | Hide Save on edit (users with `POS_SHOW_SAVE_BUTTON` keep it) and Discard (`SHOW_GENDOC_DISCARD_BUTTON`) |
| `HIDE_SERVER_DOC_3` (branch doc no.), `HIDE_SERVER_DOC_4` (device doc no.), `HIDE_CLIENT_DOC_4`, `HIDE_STATUS_GEN_DOC` | Listing columns |

*Doc Settings, Entity Details, Lines, Department, Line item tabs*

| Setting | Effect when on |
|---|---|
| `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `SHOW_SALES_LEAD` | Sales agent from the logged-in employee; sales-lead field |
| `ENABLE_CUSTOMER_FILTER_FROM_ACCOUNT_TAB`, `ALLOW_EDIT_ALL_ENTITY_DATA` | Customer search filtered by branch; edit all customer fields from the counter |
| `SHOW_ITEM_STOCK_BALANCE` | *Disallow negative stock for basic items* — stock balance validated on FINAL (and synced for offline checks) |
| `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` | Serial numbers on a DRAFT are locked against other bills |
| `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_EDITING_UNIT_PRICE_TXN` | Which price the cashier may edit (paired with `POS_EDIT_UNIT_PRICE_STD` / `_TXN`) |
| `DISABLE_ITEM_LISTING`, `HIDE_SALES_AGENT`, `HIDE_TARIFF_CODE`, `HIDE_UOM`, `SHOW_MA_COST`, `HIDE_UNIT_PRICE_*`, `HIDE_UNIT_DISCOUNT*`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_AMOUNT_*`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Line columns |
| `HIDE_STOCK_DETAILS`, `HIDE_SALES_HISTORY` | Item dialog tabs (`POS_SHOW_STOCK_DETAILS` / `POS_SHOW_SALES_HISTORY` re-open them per role) |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`, `HIDE_DEPARTMENT_HDR_TAB` | Department fields and tab (`MANDATORY_SEGMENT` / `_DIMENSION` / `_PROFIT_CENTER` / `_PROJECT` are read from the settings record but have no toggle on this applet's screen) |

*Line Permission* — price floors and ceilings

| Setting | Effect when on | Per-role override |
|---|---|---|
| `DISALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX` | Block a price above the standard tax-inclusive price | `ALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX` |
| `DISALLOW_SELL_BELOW_MIN_PRICE` (+ `HIDE_PRICE_SELL_BELOW_MIN_PRICE`) | Block below the item's minimum price; optionally hide that price | `ALLOW_SELL_BELOW_MIN_PRICE` |
| `DISALLOW_SELL_BELOW_REPLACEMENT_PRICE` (+ hide) | Block below replacement price | `ALLOW_SELL_BELOW_REPLACEMENT_PRICE` |
| `DISALLOW_SELL_BELOW_MA_COST` (+ hide), `DISALLOW_SELL_BELOW_MA_COST_WHOLE_DOCUMENT` | Block below moving-average cost per line / for the whole bill | `ALLOW_SELL_BELOW_MA_COST`, `ALLOW_SELL_BELOW_MA_COST_WHOLE_DOCUMENT` |
| `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` | Price editing allowed only for item types whose `ALLOW_<TYPE>_ITEM_PRICE_EDIT` permission the user holds | `ALLOW_BASIC_ITEM_PRICE_EDIT`, `ALLOW_BUNDLE_…`, `ALLOW_ALL_ITEM_PRICE_EDIT`, … |

When a blocked price is entered, the cashier can raise an **approval request** (Approval tab: an approver's email or mobile number, or a password for immediate approval); a supervisor with `ALLOW_APPROVE_SELL_BELOW_PRICE` approves or rejects it in the Approval menu.

*Credit Card Settings*: `HIDE_` / `MANDATORY_` for `CARD_NO`, `NAME`, `CARD_ISSUER`, `CARD_EXPIRY`, `APPROVAL_CODE`, `BATCH`, `CARD_TYPE`.

Keys read by the code with no toggle on any screen: `ENABLE_HIGH_VALUE_SALES_VALIDATION` (e-Invoice buyer details enforced when the bill total is 10,000 or more), `ENABLE_FILTER_BY_TODAYS_TXN` (listing defaults to today), `STAFF_PURCHASE_BRANCH`, `EMPLOYEE_DISCOUNT`, `SERIAL_OPEN_QUEUE`, `SHOW_TABLE_NO`, `ROUNDING_OPTION`, `SALES_NAMING`, `SALES_RETURN_NAMING`.

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Posting on payment | FINAL immediately, unless `DISABLE_AUTO_POSTING` (DRAFT / Hold Bill, FINAL from the listing) |
| Backdating | Others panel → *allow backdate* toggle, limited to one week before today; editing the transaction date needs `POS_EDIT_TRANSACTION_DATE` |
| Void | `VOID_DOCUMENT` + `POS_VOID_CASHBILL`; voided bills are counted in the Z Report |
| Return | Return action on a FINAL bill adds `INTERNAL_SALES_RETURN` lines to the bill (reason from the remarks list); `HIDE_RETURN`, `POS_CAN_SALES_RETURN`, `POS_ALLOW_SALES_RETURN_HIGHER_THAN_SALES` |
| Settlement correction after FINAL | `ENABLE_EDIT_SETTLEMENT_FINAL` + `POS_EDIT_SETTLEMENT_FINAL`; unreconcile the line in Bank Reconciliation first if it has been reconciled |
| Serial swap after FINAL | `POS_SWAP_SERIAL_FINAL` + `POS_SWAP_SERIAL_NUMBER_FINAL` |
| Printables | Settings → Printable Format Settings; branch header / footer; `ENABLE_AUTO_POPUP` / `ENABLE_AUTO_DOWNLOAD`; offline print from the cached format |
| Email | `EMAIL_CUSTOMER` + Email Template |
| e-Invoice | Cash bills are e-Invoice type **01 Invoice**; buyer details on the e-Invoice panel; *skip e-Invoice* toggle per bill; consolidated submission by branch is supported; submission through My E-Invoice Portal |
| Offline | Personalization → Offline Settings; bills queue in Transaction Queue and post when synced |
| Sessions and floats | `SESSION_FLOAT_CONTROL`; opening amount, cash in / out, closing amount and float count (denomination count printable) feed the Z Report |

### Feature visibility / permissions

API: `TNT_API_DOC_INTERNAL_SALES_CASHBILL_{CREATE,READ,UPDATE,DELETE}_TGT_GUID`; `API_TNT_DM_ERP_REPORT_CASHIER_COLLECTION_{READ,ADMIN,OWNER}`; `API_TNT_DM_ERP_Z_REPORT_{READ,ADMIN,OWNER}`.

Client-side permissions registered for this applet (31 ACTIVE):

| Group | Codes | What they unlock |
|---|---|---|
| Counter actions | `POS_CHANGE_BRANCH`, `POS_CREATE_CUSTOMER`, `POS_EDIT_TRANSACTION_DATE`, `POS_EDIT_ITEM_NAME`, `POS_EDIT_UNIT_PRICE_STD`, `POS_EDIT_UNIT_PRICE_TXN`, `POS_EDIT_PRICING_STAFF_PURCHASE`, `POS_ITEM_DISCOUNT`, `POS_GROUP_DISCOUNT`, `POS_SHOW_SAVE_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON` | Branch switch, new customer, date, item name, price edits, staff-purchase pricing, item / group discount buttons, Save and Discard |
| After FINAL | `POS_VOID_CASHBILL`, `POS_CAN_SALES_RETURN`, `POS_EDIT_SETTLEMENT_FINAL`, `POS_SWAP_SERIAL_NUMBER_FINAL` | Void, return, settlement adjustment, serial swap |
| Sessions and cash | `POS_CLOSE_SESSION`, `POS_FLOAT_CASH_IN_OUT`, `POS_ATTACH_DRAWER` | Registered; the current UI code does not check them (session, cash in / out and drawer actions are gated by the settings above) |
| Visibility | `POS_GROSS_PROFIT`, `POS_SHOW_STOCK_DETAILS`, `POS_SHOW_SALES_HISTORY`, `POS_SHOW_AUDIT_TRAIL_REPORT`, `POS_VIEW_CASHBILL_ALL_USER_CREATE`, `POS_VIEW_CASHBILL_ALL_SALES_AGENT`, `POS_OFFLINE_SYNC` | Gross profit panel, item tabs, audit trail, Cashier Collection / listing scope, sync panel |
| Pricing | `ALLOW_APPROVE_SELL_BELOW_PRICE`, `ALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX`, `ALLOW_SELL_BELOW_MIN_PRICE`, `ALLOW_SELL_BELOW_REPLACEMENT_PRICE`, `ALLOW_SELL_BELOW_MA_COST`, `ALLOW_SELL_BELOW_MA_COST_WHOLE_DOCUMENT` | Approve requests; bypass each price floor / ceiling |

The app also reads `POS_SHOW_Z_REPORT`, `POS_SHOW_CASHIER_COLECTION_REPORT`, `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH` (hides account-code items from item search) and the `ALLOW_<TYPE>_ITEM_PRICE_EDIT` family, none of which are registered for this applet (see Troubleshooting).

## Fields

**Header (Main and Others panels)**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Branch, Location | Selling branch; location defaults to the branch's default location | Yes | FINAL rejects a location that differs from the branch default |
| Customer / Member | Entity on the bill | Yes (default customer pre-filled) | Blacklisted customers rejected at FINAL; spending-limit lines checked for cash bills |
| Sales Agent | Employee credited | No | Auto-detected from login with `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` |
| Transaction Date | Accounting date | Yes | Today; backdate up to one week with the toggle and permission |
| Reference, Remarks, Race, Delivery Branch / Location | Header attributes | No (Race can be made mandatory) | |
| Department (segment, dimension, profit centre, project) | Analysis | No unless `MANDATORY_*` | |
| e-Invoice buyer details | Name, ID type / no., tax ID, SST ID, contact, email, address; *skip e-Invoice* | Enforced for high-value bills when `ENABLE_HIGH_VALUE_SALES_VALIDATION` | |

**Lines** (`txn_type = PNS`, doc type `INTERNAL_SALES_CASHBILL`; return lines `INTERNAL_SALES_RETURN`; trade-in lines `INTERNAL_PURCHASE_TRADE_IN`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item (scan or search) | Stock item, bundle, MTO, grouped item, coupon, voucher, NSTI trade-in | Yes | Barcode may embed quantity (`QTY_DELIMITER`) or price (`REGEX`, `ITEMCODE_LENGTH`, `ITEMPRICE_LENGTH`) |
| Quantity, UOM | Sold quantity | Yes | Quantity signum −1; serial / batch / bin sub-tabs must add up to the quantity |
| Unit price (standard / transaction), discount, multi-level discount | Price and discounts | Price yes | Edits gated by settings and permissions above; FOC with `POS_FOC_ITEM` |
| Tax code, tax amount | SST | From item / scheme | Visible with `SHOW_TAX` |
| Serial Number, Batch Number (batch no., qty, issue / expiry date), Bin Number (bin code, container measure / qty, qty) | Sub-item tracking | Per item control | Duplicate serial rejected; warranty items may require a serial |
| Membership Points | Points earned / redeemed on the line | No | Redeemed points validated against balance at FINAL |
| Department | Line analysis | No | |

**Settlement lines** (`txn_type = STL_MTHD`): Settlement Method and Amount always required; card fields per `MANDATORY_*`; points lines carry points and cash value; contra lines reference the customer's open documents. The sum of settlement + contra must equal the bill total.

**Session**: Session Code, Session Name, Opening Amount (required), Remarks; Float Count by denomination; Cash In / Out (type, amount, remarks); Closing Amount (required).

**Upload Cashbill**: Delimiter is mandatory; the helper validates branch code, GL code, segment / dimension / profit-centre / project codes and tax codes per row and reports them in the Checking step; the listing shows File Name, Format, Process Status and Error Message.

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** (Hold Bill) | Parked; no posting; serials optionally locked | FINAL, Discard |
| **FINAL** | Numbered; stock out; journal and cashbook posted; points generated; e-Invoice queued | VOID; Return lines; Settlement Adjustment; Swap Serial |
| **VOID** | Reversed with a reason; counted on the Z Report | none |

**FINAL validation** (backend, in addition to the generic checks): total of sales lines must equal settlement lines plus contra — otherwise `GENERIC_DOC_PNS_AND_STL_MTHD_DOES_NOT_MATCH`; location must equal the branch's default location; customer must not be blacklisted for credit limit or credit term (`ENTITY_BLACKLISTED`); serial, bin and batch quantities must match; stock balance when `SHOW_ITEM_STOCK_BALANCE`; redeemed points within balance; forex rate when the currency differs. A zero-amount bill gets a zero settlement line generated automatically. When the bill has a member, missing reward and redeem point lines are generated on save using this applet's point settings. Spending-limit lines for the customer are checked for cash bills; coupon redemptions and commission-scheme rules that apply to sales invoices also apply to cash bills.

**Journal** — `SALES` handler, amount signum +1:

| Dr | Cr | Amount | Source |
|---|---|---|---|
| Cashbook GL of each settlement method | | Each settlement line | Settlement method → cashbook |
| Debtor (`DEBTOR`) | | Remaining open amount (normally nil) | Company default GL |
| | Sales (or the item's GL) | Net per line | Item-company GL link → company `SALES` |
| | Output tax (`OUTPUT_TAX`) | Tax | Company default GL |
| Sales return (`SALES_RETURN`) | Cashbook / debtor | Return lines | Return lines post with the `SALES_RETURN` code |
| COGS | Inventory | Cost of goods | Costing (MA / FIFO) |

**Stock**: each PNS line writes an inventory transaction of −quantity at the branch location; return lines +quantity; trade-in lines (`INTERNAL_PURCHASE_TRADE_IN`, quantity signum +1, amount signum −1) bring the traded-in unit in and reduce the amount due.

**Settlement Adjustment** deletes and re-adds settlement lines on a FINAL bill and re-posts the cashbook side (unless `DISABLE_POSTING_JOURNAL_CASHBOOK`). **Swap Serial Number** exchanges the sold serial for another available one and fixes both stock records.

**Z Report** (FINAL bills only): collections by settlement method per cashier, sales by item category, discounts and member-point discounts, tax, items sold, void and draft counts, session opening / closing / cash in / cash out, contra amount.

**e-Invoice**: `INTERNAL_SALES_CASHBILL` maps to e-Invoice type 01 (Invoice); VOID removes the bill from the submission queue; branch-level consolidated e-Invoices include cash bills.

## Related applets

- [Daily Cashier Report](/applets/sales-workflow/daily-cashier-report-applet/) — Z Report and Cashier Collection in a report-only applet.
- [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) — returns that need their own document; POS returns are lines on the bill.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the credit-terms sibling; same journal handler and point generation.
- [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/) — NSTI items received through trade-in lines.
- [Membership Admin](/applets/membership/membership-admin-applet/), [Membership Points Currency](/applets/membership/membership-points-currency/), [Voucher Management](/applets/membership/voucher-management-applet/) — members, points, vouchers and coupons used at the counter.
- [Customer](/applets/master-data/customer-applet/), [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Organisation](/applets/master-data/organisation-applet/) — master data.
- [Cashbook](/applets/master-data/cashbook-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) — posting setup.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/), [Sales Report](/applets/sales-workflow/sales-report-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) — downstream.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL rejected: *The location does not match the branch's default location* | Bill location differs from the branch default location | Set the branch default location in Organisation, or select that location on the bill |
| FINAL rejected with `GENERIC_DOC_PNS_AND_STL_MTHD_DOES_NOT_MATCH` | Settlement lines plus contra do not equal the bill total (rounding line missing, partial payment) | Add the remaining settlement or the rounding item; check the Rounding Item Code in Default Selection |
| `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` | Settlement method has no cashbook or GL | Fix it in Cashbook, then re-link under Settlement Method Settings |
| `MISSING_DEFAULT_GL_CODE: SALES` (or `DEBTOR`, `OUTPUT_TAX`, `COGS`) | Company default GL codes missing | Chart of Account → company default GL |
| No settlement buttons on the counter | Branch has no settlement methods linked | Settlement Method Settings and Branch Settings → Default Settlement Method |
| *Customer is blacklisted due to credit limit / credit term* | Customer flagged in credit control | Clear the flag in Customer, or sell to another entity |
| Cannot sell — *device not detected* / device compulsory | `DEVICE_COMPULSORY` with no registered device, or POS Agent not running on the port | Register the device under Device Settings; start the agent; check `AGENT_PORT` |
| Cash drawer, customer display or card terminal does not respond | `POS_AGENT` off, wrong port, or terminal integration type / transport mode wrong | Offline Settings → agent; Device Settings → card terminal |
| Card terminal payment accepted for the wrong amount | Older build lacked terminal amount validation | Fixed; upgrade |
| Bill finalised twice on a double click | Older build | Fixed (FINAL is now debounced); upgrade |
| Backdated bill refused | Backdate limited to one week before today | Post through Sales Invoice (Internal) for older dates |
| Bank-reconciliation error when updating or finalising a bill | A settlement line of the bill is already reconciled | Unreconcile in Bank Reconciliation first, or leave the settlement as is |
| Settlement Adjustment / Swap Serial Number / Approval menu missing | Setting off, or the user lacks `POS_EDIT_SETTLEMENT_FINAL` / `POS_SWAP_SERIAL_NUMBER_FINAL` / `ALLOW_APPROVE_SELL_BELOW_PRICE` | Turn on the setting **and** grant the permission |
| Z Report or Cashier Collection missing for one user although the hide setting is off | `API_TNT_DM_ERP_Z_REPORT_READ` / `API_TNT_DM_ERP_REPORT_CASHIER_COLLECTION_READ` not granted | Grant the API permission; note `POS_SHOW_Z_REPORT` / `POS_SHOW_CASHIER_COLECTION_REPORT` are read by the app but not registered for this applet |
| Price edit blocked even for a supervisor | `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` on; the `ALLOW_<TYPE>_ITEM_PRICE_EDIT` codes are not registered for this applet | Turn the restriction off, or request the codes |
| Reward points not applied / points discount missing | Points Discount Item Code not set, member not verified (`POS_ALLOW_VERIFIED_MEMBER_REDEEM_POINTS`), or points currency rate missing | Default Selection; Membership Points Currency |
| Free gift not added | Promotion inactive, outside date range, qualifying rule not met, or Auto Add Free Gift off | Free Gift Settings |
| Voucher / coupon rejected | Redemption limit or daily limit reached, or voucher rule header missing | Voucher Management |
| Bundle cannot be added | All child items out of stock with stock validation on | Older builds blocked this; newer builds allow it — or turn off `SHOW_ITEM_STOCK_BALANCE` |
| Duplicate serial number error | Same serial scanned twice or already sold | Swap Serial Number on the earlier bill, or scan the correct unit |
| Discount overwritten when re-selecting an item | Older build bug | Fixed; upgrade |
| Offline bills not syncing | Offline mode without `POS_OFFLINE_SYNC`, or device / printable not synced | Offline Settings → Sync All; check the Transaction Queue |
| Upload Cashbill rows rejected | Branch, GL, department or tax code not found | Read the Checking step; fix master data; re-upload |

## Related documentation

- [Sales & POS module](/modules-v2/pos/) and its [configuration page](/modules-v2/pos/configuration/)
- [Daily tasks video library](/user-guide/daily-tasks/) — cash bill creation, discounts, settlement and reports
- [Sales Workflow applets](/applets/sales-workflow/)
