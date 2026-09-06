---
title: "Purchase Refund Note Applet (Internal)"
description: "Reference for the Purchase Refund Note Applet (Internal): the purchase-side refund document with its own Revenue, Expense and Settlement lines, its screens, every configuration switch that actually works, fields, lifecycle and posting (quantity signum -1 / amount signum +1 since the April 2026 backend change), the applet/backend signum mismatch, and known failure modes."
applet_code: "internalPurchaseRefundNoteApplet"
applet_repo: "blg-applet-wavelet-internal-purchase-refund-note-applet"
modules: [purchasing, financial-accounting, e-invoice]
related_applets:
  - internal-purchase-return-applet
  - internal-purchase-credit-note-applet
  - internal-purchase-debit-note-applet
  - internal-purchase-invoice-applet
  - internal-payment-voucher-applet
  - internal-sales-refund-note-applet
  - supplier-applet-1
  - cashbook-applet
  - chart-of-account-applet
  - organisation-applet
  - tax-configuration-applet
  - doc-item-maintenance-applet
  - my-e-invoice-admin-applet
guides:
  - /guides/einvoice-guides/myinvois-setup/
  - /guides/einvoice-guides/einvoice-validation/
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-listing/internal-purchase-refund-note-listing.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-listing/internal-purchase-refund-note-listing.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/internal-purchase-refund-note-create.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/internal-purchase-refund-note-create.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/line-item/line-item-listing.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/expense/expense-listing.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/contra/add-contra/add-contra.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/export/export.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-edit/internal-purchase-refund-note-edit.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-edit/internal-purchase-refund-note-edit.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-edit/e-invoice/e-invoice.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-edit/e-invoice/submission/submission.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  fields:
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/account/account-entity-details/select-entity/select-entity.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/account/account-contact-person/account-contact-person.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/add-line-item/add-line-item.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/add-line-item/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/add-line-item/batch-number/batch-number.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/add-line-item/bin-number/bin-number.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/payment/add-payment/add-payment.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/contra/add-contra/add-contra.component.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/components/internal-purchase-refund-note-container/internal-purchase-refund-note-create/contra/select-document/contra-select-document.component.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseRefundNoteDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/BaseDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceToIRBProcessorService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceConstants.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/finance/internalPurchaseRefundNoteFileImport/InternalPurchaseRefundNoteImportFileService.java
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-refund-note.service.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/state-controllers/internal-purchase-refund-note-controller/store/effects/internal-purchase-refund-note.effects.ts
    - blg-applet-wavelet-internal-purchase-refund-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-refund-note-applet/src/app/state-controllers/draft-controller/store/states/hdr.states.ts
  troubleshooting:
    - gh:bigledger/blg-intranet#3720
    - gh:bigledger/blg-intranet#3640
    - gh:bigledger/blg-intranet#3705
    - gh:bigledger/blg-intranet#4492
    - gh:bigledger/blg-intranet#4114
    - gh:bigledger/blg-intranet#1096
    - gh:bigledger/blg-intranet#5315
    - gh:bigledger/blg-int-general-task#6518
    - gh:bigledger/blg-int-general-task#9345
    - gh:bigledger/blg-akaun-platform-java#1560
    - gh:bigledger/blg-applet-wavelet-internal-purchase-refund-note-applet#2
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
tags:
- purchase-management
- intercompany
- refund-note
- accounts-payable
- internal-procurement
weight: 110
lastmod: 2026-09-05
---

## Overview

The **Purchase Refund Note Applet (Internal)** records a refund on the purchase side — a supplier giving value back after an invoice — as a document of its own, with header, supplier, item lines (split into a **Revenue** and an **Expense** tab), **Settlement** lines for the money that changes hands, contra against other supplier documents, and an **E-Invoice** tab for self-billed submission to LHDN. Finance staff open it; procurement rarely does.

Read the [Lifecycle](#lifecycle-and-effects) section before relying on the accounting direction. The backend changed the document's signums on 2026-04-23 (from quantity 0 / amount −1 to quantity **−1** / amount **+1**), so a FINAL refund note now behaves like a [Purchase Return](/applets/purchase-workflow/internal-purchase-return-applet/): item lines on the Revenue tab move stock **out** and credit the purchase account, the supplier's balance falls, and settlement lines credit the cashbook. The applet itself still sends the old header signum (−1) — see [Troubleshooting](#troubleshooting). The previous version of this page described the applet as an "intercompany" refund tool; there is no intercompany pairing for this document type in the backend (`IntercompanyProcessingService` does not list it), and that description has been removed.

## Where it fits

Modules: [Purchasing](/modules/purchasing/), [Financial Accounting](/modules/financial-accounting/), [E-Invoice](/modules/e-invoice/).

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The invoice the refund relates to. Not linked automatically; the line editor's Related Documents tab and the header **Doc Link** tab record the link by hand. The line editor still shows Purchase Order / Purchase Invoice / Delivery Order reference fields inherited from the sibling applets. |
| Siblings | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/), [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) | The other purchase-side adjustment documents. Since April 2026 the refund note carries the same signums as the Purchase Return. |
| Settlement | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | A **CASH_BACK** settlement line is stored with document type `INTERNAL_PAYMENT_VOUCHER`. The refund note's own ARAP balance can be contra'd in the Contra tab against FINAL documents of the same supplier. |
| Sales-side twin | [Sales Refund Note (Internal)](/applets/sales-workflow/internal-sales-refund-note-applet/) | Same screen layout (Revenue / Expense / Settlement / ARAP tabs). The two applets are copies of the receipt-voucher family; several internal names in this applet still say "receipt voucher". |
| e-Invoice | [MY e-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | `INTERNAL_PURCHASE_REFUND_NOTE` is in the backend's purchase document-type allow-list; with the header flag `einvoice_self_billed = TRUE` it is submitted as LHDN document type **14 — Self-billed Refund Note**. |

## Screens and menus

Menu items: **Purchase Refund Note** (listing) and **Import PRN** (CSV import). A **Line Items** route exists in `app.routing.ts` but its menu entry is commented out, so it is reachable only by URL.

**Listing.** Columns: Doc No (Tenant), Doc No (Company), Doc No (Branch) — each hidden by `HIDE_SERVER_DOC_1/2/3` unless the role holds the matching `SHOW_DOC_NO_*` code — Reference, Posting Status, Status, Branch Code, **Customer Name** (the column is labelled "Customer" but shows the supplier — a leftover of the receipt-voucher copy), Item Remarks, Amount Txn, Settlement Amount, the five ARAP figures (PNS, Settlement, Doc Open, Contra, Bal — each `HIDE_ARAP_*` / `SHOW_ARAP_*`) and Self Billed (`einvoice_self_billed`). Toolbar: **Create (+)** (disabled without the server-side create permission), **FINAL**, **DISCARD**, **VOID** (each hidden by `HIDE_GENDOC_*_BUTTON` unless the role holds `SHOW_GENDOC_*_BUTTON`) and **SELF-BILLED** (no setting and no permission; it calls the shared `doc-self-billed` endpoint for the selected rows). The listing loads the last month by default (`subtract(1, "months")`, listing component L168) unless `ENABLE_FILTER_BY_TODAYS_TXN` is on; results are paged at the pagination component's rows-per-page and sorted by `SORT_ORDER` when set.

{{< figure src="/images/internal-purchase-refund-note-applet/Main_Listing_Main_Tab.png" alt="Purchase Refund Note listing with FINAL, DISCARD, VOID and SELF-BILLED buttons, and the edit form's Main Details tab on the right" caption="Listing (staging tenant) with the edit form open on Main Details. FINAL, DISCARD and VOID exist only on the listing; the edit form has SAVE." >}}

**Create form** tabs: Main Details, Account, **Revenue** (`HIDE_REVENUE_TAB`), **Expense** (`HIDE_EXPENSES_TAB`), **Settlement** (`HIDE_SETTLEMENT_TAB`), Department Hdr (`HIDE_DEPARTMENT_HDR_TAB`). Delivery Details, Contra and Posting tabs are commented out of the template. **CREATE** is enabled once branch, location and currency are set, a supplier is selected and the draft is still `TEMP` (`main-details.component.ts` L347); it converts the TEMP document to ACTIVE with a PUT (see Lifecycle). **RESET** clears the draft.

**Edit form.** Buttons: **SAVE** (disabled when the document is FINAL / VOID / not ACTIVE, or the user lacks the server-side update permission) and, on a FINAL foreign-currency document, a currency toggle that switches the view between the document and its base-currency shadow. The FINAL / DISCARD / VOID buttons and the DELETE button are commented out of this template — those actions are listing-only. Tabs, in the order saved by Default Selection → Details Tab Ordering: Main Details, E-invoice, Account, Revenue, Expenses, Settlement, ARAP, Department Hdr, TraceDocument, Contra, Doc Link, Export, Attachments. Each tab is dropped from the tab strip when its hide key is on (`getFilteredPanels()`); with `VERTICAL_ORIENTATION` (or `DEFAULT_ORIENTATION = VERTICAL`) the same tabs render as expansion panels whose initial state follows the `EXPAND_*` keys.

{{< figure src="/images/internal-purchase-refund-note-applet/Account_tab.png" alt="Account tab of the edit form showing Entity Details with Entity Id, Entity Name, Status, Entity Type, Identity Type, ID Number, Currency, GL Code, Description, Email and Phone Number" caption="Account → Entity Details (staging tenant, test supplier). All fields except Entity Id are read from the supplier record." >}}

{{< figure src="/images/internal-purchase-refund-note-applet/supplier_selecting.png" alt="Select Supplier picker beside the Account tab, listing supplier code, name, type and currency" caption="Select Supplier picker (staging tenant, test suppliers). The picker is built on the customer search model of the receipt-voucher family but queries supplier codes." >}}

**Revenue and Expense tabs.** Both are line grids with their own **+** button; the difference is what the line editor writes. A line added from the **Revenue** tab is stored with document type `INTERNAL_SALES_INVOICE`; a line added from the **Expense** tab with `INTERNAL_PURCHASE_INVOICE` (`add-line-item.component.ts` L180–L203). Each grid shows only its own type (`line-item-listing.component.ts` L100, `expense-listing.component.ts` L96) and hides the three price columns unless the role holds `INTERNAL_PURCHASE_REFUND_NOTE_DISPLAY_PRICING`. Totals ("Total Revenue" / "Total Expense" and Tax) sit above each grid.

{{< figure src="/images/internal-purchase-refund-note-applet/expenses.png" alt="Expenses tab of the edit form with a line grid (Item Code, Item Name, UOM, Qty) and Total Expense and Tax figures" caption="Expenses tab (staging tenant, a test bundle item). The Revenue tab is the same grid for the other line type." >}}

**Line editor** (Add / Edit Line Item): Item Details (Main Details, Delivery Instructions, Department, Related Documents copy-from / copy-to), Pricing Details, Costing Details (`HIDE_COSTING_DETAILS`), Serial Number / Batch Number / Bin Number (by the item's `sub_item_type`) and Issue Link.

**Settlement tab.** A grid of settlement lines (Date, Amount, Details, Remarks) with Total Settlement, Doc Open Amount and Doc ARAP Balance above it. The Add Settlement form takes a settlement method (from Branch Settings → Default Settlement Method), a settlement type — CASH, CASH_BACK, CREDIT_CARD, VOUCHER, TT_PAYMENT, BANK_TRANSFER, MEMBERSHIP_POINT_CURRENCY, CHEQUE, POST_DATED_CHEQUE — a date, an amount and the type's own fields (card details, cheque number and date, transaction number, voucher number, points).

**ARAP tab.** Read-only figures: Product & Services, Settlement, Doc Open Amount, Contra, Outstanding.

{{< figure src="/images/internal-purchase-refund-note-applet/arap.png" alt="ARAP tab showing Product & Services, Settlement, Doc Open Amount, Contra and Outstanding figures" caption="ARAP tab (staging tenant). A document with one settlement line and no item lines shows the settlement as its whole open balance." >}}

**Contra tab.** Lists `bl_fi_generic_doc_arap_contra` rows; **Add Contra** opens a Select Document picker of the same supplier's FINAL documents filtered by `arap_bal_range` (POSITIVE or NEGATIVE, opposite to this document's balance) with DISCARDED and VOID rows removed, then asks for a contra amount.

**E-invoice tab** (edit only): Submission (submission type, document number and type, e-Invoice number and UUID, **Original E-invoice Ref No** picker that fills `einvoice_main_document_ref_irb_guid` and `einvoice_main_document_ref_to_irb_lhdn_document_guid`, document date, billing frequency and period, skip flag), Progress (pending posting, pending batch, pending submission, submitted), Notification, Cancellation and Matched History.

{{< figure src="/images/internal-purchase-refund-note-applet/e-invoice.png" alt="E-invoice tab Submission panel with Submission Type, Document No, Document Type, E-invoice Number, E-invoice UUID, Original E-invoice Ref No and Document Date" caption="E-invoice → Submission (staging tenant). The Original E-invoice Ref No picker records the invoice the refund note refers to." >}}

**Other tabs.** Department Hdr (dimension, profit centre, project, segment on the header), TraceDocument (the shared posting-trace component), Doc Link (copy-from / copy-to document links), Export (printable-format picker defaulting to the branch's default printable format, then `PRINTABLE`), Attachments.

**Import PRN.** A file-import listing, create and edit screen (the component is the receipt-voucher import container reused). The CSV header row is checked against the expected column set; missing or unknown columns are written to the import header's error message (see Troubleshooting).

**Settings** menu (System Configuration): Application Settings (the shared field-configuration screen), Default Selection, Branch Settings (Branch Details, Item Category Filter, Pricing Scheme, Printable Format, Default Settlement Method), Printable Format Settings; the routes also expose Webhook, Feature Visibility and the shared permission listings. **Personalization**: Default Selection (per-user branch and location) and Sidebar. The applet's own `field-configuration` component (four Lines toggles, four Department toggles) has no bindings and no route — it is dead code.

{{< figure src="/images/internal-purchase-refund-note-applet/Settings.png" alt="Applet Settings screen with Gen Doc Listing tab open, showing the Gen Doc Fields Settings toggles" caption="Settings → Application Settings (staging tenant): the shared field-configuration screen, Gen Doc Listing tab." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company default GL codes `CREDITOR` (and `CREDITOR_NON_TRADE`), `PURCHASE`, `INPUT_TAX`, `SETTLEMENT_CHARGES` | [Organisation](/applets/master-data/organisation-applet/) → Company → Default GL Codes; [Chart of Account](/applets/master-data/chart-of-account-applet/) | The creditor mapping is a hard stop at FINAL (`MISSING_DEFAULT_GL_CODE: CREDITOR`). A missing `PURCHASE` or `INPUT_TAX` default silently drops the line from the journal and FINAL then fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES`. `SETTLEMENT_CHARGES` is used only when the settlement item carries charges. |
| Supplier with AR/AP type | [Supplier](/applets/master-data/supplier-applet-1/) | `resolveArap` picks `CREDITOR` for AP_TRADE and `CREDITOR_NON_TRADE` for AP_OTHER (`JournalPostingService.java` L1561–L1577). |
| Cashbook behind every settlement method | [Cashbook](/applets/master-data/cashbook-applet/); Branch Settings → Default Settlement Method | A settlement item without a cashbook fails FINAL with `MISSING_CASHBOOK: STL_MTHD [code]`; a cashbook without a GL code with `MISSING_GL_CODE: STL_MTHD [code]` (L191–L213). |
| Branch and location | [Organisation](/applets/master-data/organisation-applet/) | Both are required on the header. Revenue-tab item lines are stock movements; location precedence is line `delivery_location_guid` → line `guid_store` → header `guid_store`. |
| Items and tax codes | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Stock items on the Revenue tab move stock at FINAL; the tax code on a line drives the `INPUT_TAX` journal line and the e-Invoice tax type code. |
| Fiscal periods | [Organisation](/applets/master-data/organisation-applet/) | A transaction date in a locked period fails FINAL with `FISCAL_PERIOD_LOCKED`. |
| Permissions | Settings → Permission Wizard / Set / User / Role | Server-side codes `TNT_API_DOC_INTERNAL_PURCHASE_REFUND_NOTE_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` gate the Create button and SAVE; `API_TNT_INTERNAL_PURCHASE_REFUND_NOTE_IMPORT_FILE_HDR_*` / `_HELPER_*` gate the import. |
| e-Invoice (self-billed only) | [MY e-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Company `einvoice_status = ENABLED`; the SELF-BILLED bulk action sets `einvoice_self_billed`. |

### Applet settings

Settings live in three places. **Tenant-wide** keys are edited on the **shared** `FieldConfigurationComponent` (blg-shared-utilities, submodule pinned at `f1ded04`; the same set renders at `af523eb`), which shows a control only when the applet's registry code matches its gates. **Default Selection** (applet-local) holds the default branch and location and the Details Tab Ordering. **Personalization → Default Selection** lets a user override branch and location for themselves (`personalSettings.DEFAULT_BRANCH ?? masterSettings.DEFAULT_BRANCH`). There is no inline settings gear in this applet. Anyone with access to the Settings menu can change tenant-wide keys; personal defaults are per user.

Of the 107 keys in `applet-settings.model.ts`, **45** are declared, rendered, persisted and read by the applet. All toggles start **off** (the shared form control is empty until the first Save of Application Settings; the document form reads stored values, so a fresh tenant sees every field and button until that first save).

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DISABLE_GEN_DOC_LISTING` | Whether the listing loads on open | off | On: the listing stays empty until a search is run. |
| `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON` | The three listing bulk actions | off | On: the button disappears for everyone unless the role holds `SHOW_GENDOC_FINAL/DISCARD/VOID_BUTTON` (checked in code, not seeded — see Permissions). |
| `SORT_ORDER` | Listing sort order sent with every search | unset | Overrides the listing's built-in order. |
| `VERTICAL_ORIENTATION` | Edit form as expansion panels instead of tabs | off | On: panels; `DEFAULT_ORIENTATION` (read, no control) can still force HORIZONTAL. |
| `HIDE_SERVER_DOC_1`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3` | Doc No (Tenant / Company / Branch) on Main Details and the listing | off | On: hidden unless `SHOW_DOC_NO_TENANT/COMPANY/BRANCH` is granted. |
| `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1` … `HIDE_CLIENT_DOC_5` | Client document type and the five client document numbers | off | On: hidden unless the matching `SHOW_CLIENT_DOC_*` is granted. |
| `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | The five ARAP columns on the listing | off | On: column hidden unless the matching `SHOW_ARAP_*` is granted. |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_TXN` | Unit-price fields in the line editor | off | On: the field is removed from the line editor's Main Details. |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX` | Discount fields in the line editor | off | On: hidden. |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | Quantity fields in the line editor | off | On: hidden. Quantity Base stays required. |
| `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN` | Amount fields in the line editor | off | On: hidden. |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | SST/GST/VAT and WHT pickers on a line | off | On: hidden; lines are then untaxed unless the item carries a default. |
| `HIDE_COSTING_DETAILS` | Costing Details tab of the line editor | off | On: tab removed. |
| `HIDE_ATTACHMENT_TAB` | Attachments tab of the edit form | off | On: tab removed (also read through the panel list). |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION` (Default Selection) | Pre-selected branch and location on a new document | null | Personal Default Selection overrides them per user; Reset writes null. |
| `INTERNAL_PURCHASE_REFUND_NOTE_DETAILS_TAB_ORDER` (Default Selection → Details Tab Ordering) | Order of the edit form's tabs / panels | the built-in order listed above | Drag to reorder; tabs added by a later release are appended after the saved ones. |

**Rendered on the shared screen but never read by this applet** (saving them changes nothing): `HIDE_LAST_PURCHASE_PRICE`, `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_VALIDITY_DATE`, `HIDE_FINAL_BUTTON`, `HIDE_DESCRIPTION`, `ENABLE_BRANCH_FILTER`.

**Read by the applet with no control on any screen** (they can be set only by writing `bl_applet_ext` directly): `HIDE_REVENUE_TAB`, `HIDE_EXPENSES_TAB`, `HIDE_SETTLEMENT_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_EXPORT_TAB` — the shared screen's tab-hide section is keyed by registry code and `internalPurchaseRefundNoteApplet` is not in its map — plus `ENABLE_FILTER_BY_TODAYS_TXN`, `DEFAULT_TOGGLE_COLUMN`, `DEFAULT_ORIENTATION` and `PRINTABLE` (the Export tab's fallback when the branch has no default printable format).

**Read at runtime without a model declaration.** With a control on the shared screen: `ALLOW_TO_CONTRA_MORE_THAN_DOC_OPEN_AMOUNT` (Contra section; off → Add Contra rejects an amount above the document's open balance), `HIDE_MAIN_CONTRA_TAB`, and the panel-expansion keys `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_SETTLEMENT`, `EXPAND_MAIN_ARAP`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_MAIN_CONTRA`, `EXPAND_DOC_LINK`, `EXPAND_EXPORT`, `EXPAND_ATTACHMENT` (vertical mode only). Without any control: `HIDE_MAIN_ARAP_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `EXPAND_E_INVOICE`, `EXPAND_REVENUE`, `EXPAND_EXPENSES`.

The remaining 45 declared keys (`ENABLE_SST`, `ENABLE_WHT`, `ENABLE_DIMENSION`, `ENABLE_PROFIT_CENTER`, `ENABLE_PROJECT`, `ENABLE_SEGMENT`, `VALIDITY_DATE_REQUIRED`, `HIDE_DELIVERY_DETAILS_TAB`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_REFERENCE_MAIN_LISTING` and the 35 custom-status keys) have neither a control for this applet code nor a reader in the applet.

### Document behaviour settings

There are none in the applet. FINAL, VOID and DISCARD behaviour is fixed by the backend (next section); the applet sends `{ posting_status: "FINAL" }` with no validation flags, so the backend defaults apply (`validate_stock_balance = true`, `validate_serial_signum_zero = false`, `disallow_sell_below_cost = false`). Printables: Branch Settings → Printable Format sets the branch default that the Export tab pre-selects; Printable Format Settings maintains the formats. The e-Invoice tab's Skip switch writes the header's `skip_einvoice`.

### Feature visibility / permissions

**No client-side permission definition is seeded for this applet** (`bl_applet_client_side_perm_dfn` has zero rows for `internalPurchaseRefundNoteApplet`; intranet #4492 was closed on the strength of the permission listing route existing). The code nevertheless checks these codes, so seeding them would make them work:

| Code checked in code | Effect when granted |
|---|---|
| `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON` | Re-show a listing button hidden by `HIDE_GENDOC_*_BUTTON` for the role. |
| `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1` … `SHOW_CLIENT_DOC_5`, `SHOW_DESCRIPTION`, `SHOW_ARAP_PNS`, `SHOW_ARAP_SETTLEMENT`, `SHOW_ARAP_DOC_OPEN`, `SHOW_ARAP_CONTRA`, `SHOW_ARAP_BAL` | Re-show the field or column hidden by the matching `HIDE_*` setting. |
| `SHOW_TRANSACTION_DATE` | Unlocks the Transaction Date picker on Main Details (`[disabled]="!SHOW_TRANSACTION_DATE"`). Not seeded, so on a live tenant the date stays at the value set when the document was created. |
| `INTERNAL_PURCHASE_REFUND_NOTE_DISPLAY_PRICING` | Shows the unit-price and amount columns on the Revenue and Expense grids (`hidePriceFlag = !checkPermission(...)`). Not seeded, so the columns are hidden for every role today. |

Server-side (`TntErpPermissions`): `TNT_API_DOC_INTERNAL_PURCHASE_REFUND_NOTE_CREATE_TGT_GUID` enables the listing's Create button; `_UPDATE_TGT_GUID` (or the admin / owner variants) enables SAVE; `_READ_TGT_GUID` and `_DELETE_TGT_GUID` are enforced by the API. `SHOW_DOCUMENT_DELETE_BUTTON` is read from the applet record but the DELETE button it would reveal is commented out.

## Fields

**Main Details**

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Document type, Client Document type | `INTERNAL_PURCHASE_REFUND_NOTE` | — | Read-only; shown on the edit form only. |
| Doc No (Tenant / Company / Branch) | `server_doc_1/2/3` | — | Read-only; assigned at FINAL. Hidden by `HIDE_SERVER_DOC_1/2/3`. |
| Client Doc 1–5 No | `client_doc_1` … `client_doc_5` | — | Read-only on this form. Hidden by `HIDE_CLIENT_DOC_*`. |
| Branch | `guid_branch` | Yes | Drop-down limited to the user's permitted branches; defaults from Default Selection / Personalization. |
| Location | `guid_store` | Yes | Drop-down filtered by the selected branch. |
| Transaction Date | `date_txn` | Yes | Picker locked unless the role holds `SHOW_TRANSACTION_DATE`; `date_txn_logic` on FINAL can overwrite it. |
| Currency | `doc_ccy` | marked with an asterisk, not validated | Defaults to MYR. Foreign currency creates a base-currency shadow document at FINAL. |
| Base rate | `base_doc_xrate` | — | Numeric. Checked by `validateForexExchangeRate` at FINAL. |
| Checked By, Approved By | employee references | — | Employee pickers. |
| Reference, Remarks | `doc_reference`, `doc_remarks` | — | Free text; Reference is a listing column. |

All header controls lock once the document is FINAL / VOID or no longer ACTIVE (`main-details.component.ts` L240–L258).

**Account**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Entity Id | supplier code | Yes | Select Supplier picker; the only editable control on Entity Details. |
| Entity Name, Status, Entity Type, Identity Type, ID Number, Currency, GL Code, Description, Email, Phone Number | supplier master data | — | Read-only copies of the supplier record. |
| Billing / Shipping address | address JSON | — | Address tab, picked from the supplier's addresses. |
| Contact Person | contact JSON | name required when adding | Contact Person tab. |

**Line editor** (Revenue and Expense tabs share it)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item Code / Item Name | `item_guid` | Yes (via the item picker) | Search Item panel; the tab the line was started from decides the stored document type. |
| Quantity Base | `quantity_base` | Yes, minimum 1 | Quantity by UOM and UOM to Base Ratio derive from it. |
| Unit Price STD (excl. / incl. tax), Unit Price Net, Unit Price Transaction, by-UOM variants | pricing | Yes, minimum 0 | Each hidden by its `HIDE_UNIT_PRICE_*` key. |
| Unit Discount, Discount Amount | discounts | — | `HIDE_UNIT_DISCOUNT*`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`. |
| SST/GST/VAT, Tax Amount, WHT, WHT Amount | tax | — | Pickers hidden by `HIDE_TAX_CONFIG_SELECTION` / `HIDE_WHT_CONFIG_SELECTION`. |
| STD Amount, Amount Net, Txn Amount | totals | — | Calculated. |
| E-Invoice Tax Type Code, classification | e-Invoice line attributes | — | Written to `einvoice_taxable_type_code`, `einvoice_item_classification_code`. |
| Sales Order / Purchase Quotation / Purchase Requisition / Jobsheet / Purchase Order / Delivery Order / Purchase Invoice No. | reference numbers | — | Inherited reference fields; no knock-off behind them. |
| Remarks | `item_remarks` | — | Becomes the journal line description. |
| Batch: batch no, expiry date, issue date, qty; Bin: bin code, container measure, container qty, qty | sub-item data | Yes when the item uses batches / bins | Serial numbers by scan, import or list. |

**Settlement**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Settlement Method | settlement item (cashbook) | Yes (picker) | From Branch Settings → Default Settlement Method. |
| Settlement Type | CASH, CASH_BACK, CREDIT_CARD, VOUCHER, TT_PAYMENT, BANK_TRANSFER, MEMBERSHIP_POINT_CURRENCY, CHEQUE, POST_DATED_CHEQUE | Yes | Decides the extra fields and the stored line document type (see Lifecycle). |
| Date | `date_txn` of the line | Yes | Defaults to today. |
| Amount | `amount_txn` | Yes, minimum 0.01 | |
| Card No / Name on Card / Issuer / Type / Expiry / CVV; Cheque No (and Cheque Date); Transaction No; Voucher No; Points; Cash back amount | type-specific | required per type | Stored in `line_property_json`. |

**Contra**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Document | the FINAL supplier document to offset | Yes | Select Document picker (opposite-sign ARAP balance, not DISCARDED / VOID). |
| Contra amount | amount to offset | Yes | Capped at the document's open amount unless `ALLOW_TO_CONTRA_MORE_THAN_DOC_OPEN_AMOUNT` is on; the error text reads "Should not contra more that the receipt amount". |

## Lifecycle and effects

| Status | Meaning | Allowed next |
|---|---|---|
| **TEMP** | Draft header created when the Create screen opens (`/temp/backoffice-ep`, no validation). | ACTIVE (CREATE) |
| **ACTIVE**, no posting status | Editable document. | FINAL, DISCARDED (listing) |
| **FINAL** | Posted. Header and lines locked. | VOID (listing) |
| **VOID** | Reversed. | none |
| **DISCARDED** | Abandoned draft. | none |

**CREATE and SAVE** both PUT the whole container to `/internal-purchase-refund-notes` (`convertToActive$`, effects L345–L457; `editInternalPurchaseRefundNote$`, L483–L632). The controller (L272, L410) runs `GenericDocumentService.updateGenericDoc` → `basicUpdateGenericDoc` → `fillAndValidateForUpdate`, which fills each line's signums from the DCO of **the line's own** `server_doc_type` (`GenericDocumentDataConsistencyObject.java` L1102–L1107) and then checks the **header** `amount_signum` against the refund note's DCO (`checkAmountSignum`, L1207–L1213). The applet sets the header to **−1** (effects L367; `hdr.states.ts` L45), the DCO since 2026-04-23 requires **+1** — see Troubleshooting.

**Backend checks on FINAL** (`GenericDocumentService.java`, from the listing's FINAL button → `update-posting-status`):

| Check | Result when it fails | Where |
|---|---|---|
| Not already FINAL | *Generic Document has already been posted to FINAL* | L361–L364 |
| Stock available for outbound lines (`validate_stock_balance` defaults to true) | `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION` for Revenue-tab item lines (quantity signum −1) | L390–L392, L2062–L2160 |
| Forex rate consistent | `validateForexExchangeRate` errors | L1636, L1702 |
| Transaction date not in a locked fiscal period | `FISCAL_PERIOD_LOCKED` | L1695 |

What FINAL does once the checks pass: applies `date_txn_logic` (L372–L382), sets `skip_einvoice` (L568, L630), generates running numbers, creates and posts the base-currency shadow for a forex document (L402–L437), and queues the Generic Document Primary Processor, which fans out to the tenant's subscribed processors subject to the company's `posting_final_json` include / exclude lists (`GenericDocumentPrimaryProcessor.java` L70–L112).

**Posting proof block**

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_PURCHASE_REFUND_NOTE` (enum short code `IPRN`; no entry in `ServerDocShortCodes`) | `InternalPurchaseRefundNoteDataConsistencyObject.java` L15; `GenericDocServerDocTypeEnum.java` L64 |
| Header amount signum | **+1** (checked on create and update; was −1 until commit `68f9eaa3ad`, 2026-04-23) | DCO L16, L21–L34; `ServerDocTypes.java` L83 `(-1, 1)` |
| Line signums | Filled per line from the DCO matching the line's `server_doc_type`: refund-note lines **quantity −1 / amount +1**; Revenue-tab lines (`INTERNAL_SALES_INVOICE`) **−1 / +1**; Expense-tab lines (`INTERNAL_PURCHASE_INVOICE`) **+1 / −1**; CASH_BACK settlement lines (`INTERNAL_PAYMENT_VOUCHER`) **0 / +1**; a CHEQUE settlement line carries no document type and keeps the applet's −1. | `GenericDocumentDataConsistencyObject.java` L802–L808, L1102–L1107; `add-line-item.component.ts` L180–L208; `add-payment.component.ts` L430–L520 |
| Handler | No entry for this type, so the generic `PURCHASE` handler applies (`serverDocType.contains("PURCHASE")`, `JournalPostingService.java` L76–L84): `PNS_ENTITY = CREDITOR`, `PNS = PURCHASE`, `PNS_TAX = INPUT_TAX`. | `JournalPostingTypeHandler.java` L53–L60 |
| Dr/Cr equation | Each line: `amount_signum × sign(amount)` positive → **credit**, negative → **debit** (L123–L131). Refund-note and Revenue lines therefore **credit** the purchase account and their tax **credits** `INPUT_TAX` (L257–L263); Expense lines **debit** it; settlement lines other than CHEQUE **credit** the settlement method's cashbook GL; the balancing entity line takes `Σ(debit − credit)` and **debits** `CREDITOR` / `CREDITOR_NON_TRADE` when that sum is negative (L322–L353). Net effect for a document with Revenue lines and a settlement: **Dr Creditor / Cr Purchase, Cr Input Tax, Cr Cashbook** — the supplier balance falls and the cashbook is credited. | `JournalPostingService.java` |
| GL precedence for an item line | line GL code (L139–L149) → header GL code → item-company GL link with txn code `PURCHASE` → company default `PURCHASE` (L151–L190). An unresolvable purchase line or tax line is silently omitted (L236, L271). | `JournalPostingService.java` |
| Hard stops in posting | `MISSING_DEFAULT_GL_CODE: CREDITOR` / `CREDITOR_NON_TRADE` (L335–L341); `MISSING_CASHBOOK: STL_MTHD [code]`, `MISSING_GL_CODE: STL_MTHD [code]` (L191–L213); `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` (L574–L577). | `JournalPostingService.java` |
| Stock processor | `InventoryTransactionLineProcessorService.createInventoryTxnFromGenericDoc` writes an inventory transaction for every `PNS` line whose quantity signum is non-zero (L39–L40): Revenue-tab and refund-note item lines move stock **out** (−1 × quantity), Expense-tab lines move it **in** (+1). Settlement lines are skipped. | `InventoryTransactionLineProcessorService.java` |
| What VOID reverses | `updatePostingStatusToNonFinal` (L663–L710) sets VOID, voids the forex shadow if one exists, and queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`; the subscribed processors post the mirror-image journal and reverse the inventory transactions. | `GenericDocumentService.java` |
| Back to DRAFT | Not offered by this applet; the backend `BLG_ERP_UNDO_GENERIC_DOCUMENT_PRIMARY_PROCESSOR` path (L702–L704) exists for other callers. | `GenericDocumentService.java` |

**VOID** (listing only, `voidGenericDocument` → the controller's void path) is refused with `GENERIC_DOCUMENT_HAS_TARGET_LINKS` when another document links from this one (`GenericDocumentController.java` L2938–L2950) and with `GENERIC_DOCUMENT_EINVOICE_ENABLED` — *Generic Document cannot be changed to VOID because e-invoice is enabled* — when the header's `einvoice_self_billed` is `TRUE` (L2966, L2981–L2985). The listing's VOID and DISCARD confirmations are client-side prompts.

**DISCARD** (listing only) calls `/discard/backoffice-ep/{guid}` (controller L647) for selected ACTIVE rows that have no posting status.

**e-Invoice.** `INTERNAL_PURCHASE_REFUND_NOTE` is in both purchase allow-lists (`MyEInvoiceToIRBProcessorService.PURCHASE_DOC_TYPES` L56–L63; `EInvoiceConstants.java` L12–L19). A document with `einvoice_self_billed = TRUE` is mapped to LHDN type **14, Self-billed Refund Note** (L1002–L1008); without the flag it is not queued at all. The Original E-invoice Ref No picker fills the `einvoice_main_document_ref_*` columns that LHDN requires on a refund note (intranet #3640).

**Import PRN** creates documents through `GenericDocumentService.createGenericDoc` with the same DCO (`InternalPurchaseRefundNoteImportFileService.java` L303) and updates them through `basicUpdateGenericDoc` (L307), so imported rows are subject to the same header-signum check.

## Related applets

- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — the same signums (quantity −1 / amount +1) with a working applet; the document to use for goods going back to a supplier.
- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) and [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — the non-stock purchase adjustments; the debit note shares this document's amount signum.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the invoice a refund refers to; link it in Doc Link or the line's Related Documents.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — settles or contras the supplier balance; a CASH_BACK settlement line is stored as a payment-voucher line.
- [Sales Refund Note (Internal)](/applets/sales-workflow/internal-sales-refund-note-applet/) — the sales-side twin with the same screens.
- [Supplier](/applets/master-data/supplier-applet-1/), [Cashbook](/applets/master-data/cashbook-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Organisation](/applets/master-data/organisation-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the master data the document and its journal depend on.
- [MY e-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — where a self-billed refund note is validated, submitted and cancelled.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| CREATE (or SAVE) fails with `GENERIC_DOC_INVALID_SIGNUM` on every document. | The applet sends header `amount_signum = −1` (effects L367; `hdr.states.ts` L45); since backend commit `68f9eaa3ad` (2026-04-23) the DCO requires +1 and the PUT path validates it. The TEMP create passes because `createTempGenericDoc` skips validation. | Backend or applet change required (align `AppletConstants.amount_signum` and the two header assignments with the DCO, or restore the DCO). Until then no new refund note can be created from this applet on a backend that carries the change; use a Purchase Return or Purchase Debit Note. |
| Stock fell after FINAL although "nothing was returned". | Revenue-tab item lines are stored with quantity signum −1 and are outbound stock movements since the April 2026 change. | Record non-stock adjustments on the Expense tab with a service item, or use a Purchase Debit Note (quantity 0). |
| FINAL fails with `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION`. | Same cause: a Revenue-tab stock item with insufficient balance at the line's location; `validate_stock_balance` defaults to true and the applet sends no flag. | Correct the location or quantity, or use a non-stock item. |
| FINAL fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` (or `CREDITOR_NON_TRADE`). | The company has no default GL code for the supplier's AR/AP type. | Map it in Organisation → Company → Default GL Codes. |
| FINAL fails with `MISSING_CASHBOOK: STL_MTHD [code]` or `MISSING_GL_CODE: STL_MTHD [code]`. | The settlement item has no cashbook, or the cashbook has no GL code. | Fix the cashbook; re-FINAL. |
| FINAL fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES`. | A line's purchase GL or the `INPUT_TAX` default could not be resolved and the line was dropped from the journal. | Set the line GL, the item-company GL link or the company defaults. |
| The cashbook is credited, not debited, by the settlement line. | Settlement lines carry the refund note's own document type and receive amount signum +1 from the DCO; there is no repair-map entry for this type (the sales refund note maps its settlement lines to the payment voucher). A CHEQUE line, which carries no document type, keeps −1 and posts the other way. | Product decision pending (see the questions in the lane findings). Check the journal before relying on the cash direction. |
| VOID refused: *cannot be changed to VOID because e-invoice is enabled*. | `einvoice_self_billed = TRUE` on the header (set by the SELF-BILLED bulk action). | Cancel the e-Invoice first (E-invoice → Cancellation), then void; or clear the flag through the e-Invoice admin path. |
| VOID refused: `GENERIC_DOCUMENT_HAS_TARGET_LINKS`. | Another document has knocked off or linked to this refund note. | Void or unlink the target document first. |
| FINAL fails with `FISCAL_PERIOD_LOCKED`. | Transaction date inside a locked period. | Change the date (needs `SHOW_TRANSACTION_DATE`) or unlock the period. |
| Transaction Date cannot be changed. | The picker is disabled unless the role holds `SHOW_TRANSACTION_DATE`, which is not seeded for this applet. | Seed the permission (registry) or accept the creation date. |
| Unit price and amount columns are missing on the Revenue / Expense grids. | `INTERNAL_PURCHASE_REFUND_NOTE_DISPLAY_PRICING` is checked but not seeded; the columns are hidden for every role. | Seed the permission for the applet. |
| FINAL / VOID / DISCARD buttons are missing on the edit form. | They are commented out of the edit template; the actions exist on the listing only. | Select the row in the listing and use the toolbar. |
| The listing shows "Customer Name" on a purchase document. | Copy of the receipt-voucher listing; the column shows the supplier. | Cosmetic; no fix available in settings. |
| "Should not contra more that the receipt amount" when adding a contra. | Contra amount above the document's open balance while `ALLOW_TO_CONTRA_MORE_THAN_DOC_OPEN_AMOUNT` is off. | Reduce the amount or switch the setting on (Contra section of Application Settings). |
| Import PRN stays FAILED with *Mandatory Columns Missing* or *Wrong Columns*. | The CSV header row does not match the expected column set (`getMissingHeaderColumns` / `getWrongHeaderColumns`, import service L121–L145). | Export a fresh template from the import screen and re-upload; the message lists the offending columns. |
| Import rows fail with the same `GENERIC_DOC_INVALID_SIGNUM`. | The importer builds the header with the applet's signum and creates through the validated `createGenericDoc`. | Same as the first row. |
| A fresh tenant shows every field and button although the shared screen shows defaults switched on. | The document form reads stored values; nothing is stored until Application Settings is saved once. | Open Application Settings and Save. |
| Listing search lost columns or returned stale rows after mid-2026. | The listing query moved from sub-queries to the snapshot endpoint (general-task #6518, #9345). | Refresh the applet; report remaining gaps with the search criteria used. |

## Related documentation

- [MyInvois setup](/guides/einvoice-guides/myinvois-setup/) and [e-Invoice validation](/guides/einvoice-guides/einvoice-validation/) — the refund-note rules LHDN applies (original document reference, self-billed types).
- [Purchasing module](/modules/purchasing/), [Financial Accounting module](/modules/financial-accounting/), [E-Invoice module](/modules/e-invoice/).
