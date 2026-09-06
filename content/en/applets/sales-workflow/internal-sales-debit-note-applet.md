---
title: "Sales Debit Note (Internal)"
description: "Reference for the Sales Debit Note (Internal) applet: charge a customer or an intercompany branch more after invoicing, settle by contra or receipt, and mirror the charge as a purchase debit note in the receiving company."
applet_code: "InternalSalesDebitNote"
applet_repo: "blg-applet-wavelet-internal-sales-debit-note-applet"
modules: [financial-accounting, e-invoice]
related_applets: [internal-sales-invoice-applet, internal-sales-credit-note-applet, internal-receipt-voucher-applet, internal-purchase-debit-note-applet, my-e-invoice-portal-applet, customer-applet, chart-of-account-applet, doc-item-maintenance-applet, cashbook-applet, tax-configuration-applet, workflow-design-applet]
guides: [/guides/sales-guides/credit-sales-workflow/]
sources:
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/app.component.ts
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/components/settings-container/knock-off-settings/
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/components/sales-debit-note-container/sales-debit-note-create/ (account validators, search tabs)
  - blg-applet-wavelet-internal-sales-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-debit-note-applet/src/app/components/line-items-container/line-items-edit/ (batch, bin, main-details validators)
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesDebitNoteDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code InternalSalesDebitNote)
tags:
- sales-management
- intercompany
- debit-note
- financial-control
- internal-billing
weight: 80
---

## Overview

The **Sales Debit Note (Internal)** applet raises an additional charge against a customer after the invoice has been finalised — an under-billing, a late-payment charge, freight or handling not on the original invoice — or, for a group of companies, a charge from one company to another. Accounts-receivable staff create it; the customer's balance goes up on FINAL; it is settled by receipt, by contra against credit notes or payments, or mirrored automatically as a Purchase Debit Note in the receiving company for intercompany charges. It is the opposite of the [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/).

{{< callout type="info" >}}
Server document type `INTERNAL_SALES_DEBIT_NOTE`. Amount signum **+1**, quantity signum **0** — it posts like an invoice but never moves stock.
{{< /callout >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) | The invoice being topped up; referenced on the E-Invoice tab as the original document |
| Upstream | [Customer](/applets/master-data/customer-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Customer AR type; account-code items for charges; default GL codes; tax codes |
| Downstream | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), Contra tab | Settle the extra receivable |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | Debit notes are an e-Invoice document type |
| Sibling | [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) | Created automatically in the receiving company for intercompany debit notes |
| Sibling | [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) | The opposite adjustment |

## Screens and menus

Route root: `applets/tnt/wavelet/erp/internal-sales-debit-note-applet/`.

| Menu item | Route | What it shows |
|---|---|---|
| **Internal Sales Debit Note** | `internal-sales-debit-note` | Listing with advanced search, bulk FINAL / DISCARD / VOID / PRINT, email, clone |
| **Line Items** | `line-items` | One row per line, with customer code and phone columns |
| **File Import** | `file-import` | Bulk create from a delimited file, with a Checking section for row errors |
| **Intercompany** | `intercompany` | Intercompany dashboard and queue |
| **Settings** / **Personalization** | `settings/…`, `personalization/…` | Configuration |

![Listing bulk-action toolbar](/images/internal-sales-debit-note-applet/bulk-actions-toolbar.png)

![Send email toolbar](/images/internal-sales-debit-note-applet/send-email-toolbar.png)

![Intercompany dashboard](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_21c7678b2dd3810c82bbe3f3b68ca14881b930766766b4938dcbb1dd5f0a48f6.png)

### The create / edit form

Tabs, in the default order (re-orderable under Default Selection): **Main Details**, **E-Invoice**, **Account**, **Lines**, **ARAP**, **Settlement**, **Department Hdr**, **TraceDocument**, **Contra**, **Attachments**, **Export**. The form can run in horizontal (tabs) or vertical (stacked panels) orientation.

| Tab | Purpose |
|---|---|
| Main Details | Branch, location, transaction date, currency, sales agent, credit/debit terms, validity date, reference, remarks, tracking ID, client documents 1–5, workflow status |
| Account | Entity details, Bill To, Ship To, Intercompany (target company and sync status) |
| Lines | Charges being added; account-code items post straight to their GL account |
| ARAP, Settlement, Contra | Open amount; settlement lines; offsets against the customer's credit notes or payments |
| KO For | Knock off Sales Order, Delivery Order or Jobsheet lines (enabled per Knock-Off Settings) |
| Department Hdr | Header-level segment, dimension, profit centre, project |
| E-Invoice | Submission, progress and notification for LHDN |
| TraceDocument, Attachments, Export | Posting trace and the auto-generated purchase debit note; files; PDF |

![Account tab search](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_31bd232830790bfedd6dd14adf9d521ace0d6d45875c034034744fd21181c98a.png)

![Account tab create](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_6ff15c4c20dea5e78cf299aba5fbbae4e6b45758c170d7605825f07c3cc71186.png)

![Lines tab item selection](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_f0445bd93b9002f7a0d46fb920ca6cd70da21dd33bfc809e10c2ad6014f135ac.png)

![Contra tab summary](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_414411e36aba01c12afa5cb6dac652a018e8bc4a2160763955e5462135f56b55.png)

![ARAP tab](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_b6fc662f59214dc4315cb691d02a861605e82fb97e00d1046e81296d364c89eb.png)

![Horizontal tab mode](/images/internal-sales-debit-note-applet/horizontal-tab-mode.png)

![Vertical panel mode](/images/internal-sales-debit-note-applet/vertical-panel-mode.png)

![File import](/images/internal-sales-debit-note-applet/File_Import_-_Internal_Sales_Debit_Note.png)

### Settings menu

| Settings entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | Shared Field Configuration screen (163 toggles apply) |
| Default Selection | `settings/default-selection` | Default branch, default location, tab order |
| Knock-Off Settings | `settings/knock-off-settings` | Which documents can be knocked off *by* and *for* this debit note; auto-scan; serial validation |
| Printable Format Settings | `settings/printable-format-settings` | Printable formats for `INTERNAL_SALES_DEBIT_NOTE` |
| Branch Settings | `settings/branch-settings` | Per-branch header/footer, images, PIN |
| Workflow Settings | `settings/workflow-settings` | Company ↔ workflow process |
| Email Template | `settings/email-template` | Template used when emailing |
| Webhook, Feature Visibility | `settings/webhook`, `settings/feature-visibility` | Event subscriptions; team access |
| Permission listings, Client-Side Permission, Permission Wizard | `settings/*-listing` | Access control |
| Release Notes, Applet Log | `settings/release-notes`, `settings/applet-log` | History |

![Branch settings](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_Settings_&_Personalization_2c7bc853144ee26223616f3c3f6d45b8c74c44445cfd4fba1129d52cd61049f8.png)

![Default settings](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_Settings_&_Personalization_4905d09f800466e1a157dcdae2bae4b3d12b7ddc516cba88ba6a51ae29db0f8c.png)

![Permission management menu](/images/internal-sales-debit-note-applet/permission-management-menu.png)

![Email template settings](/images/internal-sales-debit-note-applet/email-template-settings.png)

![Personalization](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_Settings_&_Personalization_772f7bfa58516319b14b79973555f0323f29958c8e8a34477519ab98188da19a.png)

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Header requires branch and location |
| Company default GL codes `DEBTOR` / `DEBTOR_NON_TRADE`, `SALES`, `SALES_DISCOUNT`, `OUTPUT_TAX`, `FOREX_GAIN`, `FOREX_LOSS` | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Same `SALES` posting handler as the invoice; a missing code stops posting with `MISSING_DEFAULT_GL_CODE: <code>` |
| Account-code items for the charges you raise (late-payment fee, freight, handling), each linked to its GL account | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | The item's GL code overrides the company `SALES` default on the line |
| Customer (or intercompany entity) with AR type | [Customer](/applets/master-data/customer-applet/) | `DEBTOR` vs `DEBTOR_NON_TRADE` |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Tax on the charge posts to `OUTPUT_TAX` |
| Settlement methods with cashbook and GL (if settled on the Settlement tab) | [Cashbook](/applets/master-data/cashbook-applet/) | Otherwise `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` |
| Intercompany mapping between the two companies (for intercompany charges) | Branch intercompany configuration | Needed for the automatic Purchase Debit Note in the receiving company |
| API permissions `TNT_API_DOC_INTERNAL_SALES_DEBIT_NOTE_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` | Settings → permission listings | Branch targets scope the listing |

![Doc item account setup](/images/internal-sales-debit-note-applet/Related_Applets_-_Internal_Sales_Debit_Note_12ee5625ed31cafce4d4ac3ed3627c0fcf9d7baef6940effad2a4ed24366e381.png)

![Chart of account](/images/internal-sales-debit-note-applet/Related_Applets_-_Internal_Sales_Debit_Note_14a469ad615e4e412eba67b6267efad5b65a069ecc4280abca7904031f5ca296.png)

### Applet settings

**Default Selection** (`settings/default-selection`): Default Branch (`DEFAULT_BRANCH`), Default Location (`DEFAULT_LOCATION`) and the order of the 11 form tabs. Nothing else.

**Knock-Off Settings** (`settings/knock-off-settings`)

| Section | Setting | Effect when on |
|---|---|---|
| Knock Off BY Configuration | `KNOCK_OFF_BY_SALES_ORDER`, `KNOCK_OFF_BY_DELIVERY_ORDER`, `KNOCK_OFF_BY_JOBSHEET` | Those documents may knock off this debit note |
| Knock Off FOR Configuration | `KNOCK_OFF_FOR_SALES_ORDER`, `KNOCK_OFF_FOR_DELIVERY_ORDER`, `KNOCK_OFF_FOR_JOBSHEET` | This debit note may knock off those documents (KO For tab) |
| Copy From Configuration | `ENABLE_AUTO_SCAN` | Scanned items are added to the listing automatically |
| Copy From Configuration | `ENABLE_VALIDATE_SERIAL` | Serial numbers are validated when copying |

**Application Settings** (`settings/field-settings`) — behaviour toggles this applet reads (off unless stated):

| Section | Setting | Effect when on |
|---|---|---|
| Gen Doc Listing | `DISABLE_GEN_DOC_LISTING`, `DEFAULT_TRANSACTION_DATE`, `DEFAULT_POSTING_STATUS`, `SORT_ORDER` | Listing loads on search only; default date range, status filter and sort |
| Gen Doc Listing | `ENABLE_PRINT_FINAL_GEN_DOC_ONLY`, `SEND_EMAIL_TO_FINAL_GEN_DOCS_ONLY` | Print / email only FINAL documents |
| Gen Doc Listing | `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` | Serial and batch quantities validated at FINAL |
| Gen Doc Listing | `SHOW_DRAFT_BUTTON` | A FINAL document can be returned to DRAFT |
| Gen Doc Listing | `HIDE_CLONE_BUTTON` | Clone hidden (added with its own client-side permission check) |
| Create & Print | `ENABLE_AUTO_POPUP` | Opens the printable after save |
| Doc Settings | `ENABLE_DUPLICATE_REFERENCE_CHECK` | Rejects a second debit note with the same Reference |
| Doc Settings | `LOCK_PURCHASER_TO_CURRENT_USER` | Sales agent locked to the logged-in user |
| Doc Settings | `ENABLE_SALES_AGENT_AUTOFILL`, `ALLOW_EDIT_SALES_AGENT_FINAL`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `DISABLE_LINES_FOLLOWING_HDR_BUDGET`, `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE`, `SHOW_CUSTOM_DOC_NO` | As in the Sales Invoice applet |
| Workflow Selection | `ENABLE_IMPORT_EXPORT` | Import and Export tabs on the form |
| E-Invoice | `SHOW_EMP_REF_NO` | EMP reference field |
| Entity Details | `ENABLE_BRANCH_FILTER`, `ENABLE_SELECT_MODE` | Customer search scoped by branch; select-mode picker |
| Lines | `DISABLE_LINE_ITEM_NAME_EDIT`, `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT`, `SHOW_BUDGET` | Line editing rules |
| Line Permission | `DISALLOW_LINE_ITEM_EDIT`, `DISABLE_EDITING_AMOUNT_TXN` | Lines read-only after adding; transaction amount locked |
| KO For | `ENABLE_MULTIPLE_KO`, `ENABLE_EDIT_PAYMENT_DATE` | Several source documents; editable payment date |
| Contra / Settlement | `EDIT_CONTRA_TXN_DATE`, `ENABLE_EDIT_SETTLEMENT_DATE` | Editable dates |
| Credit Card | `MANDATORY_CARD_NO`, `MANDATORY_NAME`, `MANDATORY_CARD_ISSUER`, `MANDATORY_CARD_EXPIRY`, `MANDATORY_APPROVAL_CODE`, `MANDATORY_BATCH`, `MANDATORY_CARD_TYPE`, `MANDATORY_CVV` | Card fields required on a card settlement line |
| Menus | `HIDE_FILE_IMPORT_MENU`, `HIDE_INTERCOMPANY_MENU` | Remove the sidebar item unless the user holds `SHOW_FILE_IMPORT_MENU` / `SHOW_INTERCOMPANY_MENU` (the `HIDE_PURCHASE_ORDER_*` and `HIDE_FILE_EXPORT_MENU` toggles are shown but this applet has no such menus) |

*Hide / show and expand toggles* (cosmetic; `HIDE_…` unless stated):

| Section | Toggles |
|---|---|
| Gen Doc Listing | `SERIAL_NUMBER`, `GENDOC_FINAL_BUTTON`, `GENDOC_DISCARD_BUTTON`, `GENDOC_VOID_BUTTON`, `GENDOC_SAVE_BUTTON`, `CLOSE_BUTTON`, `PRINT_BUTTON`, `SEND_EMAIL_BUTTON`, `TRANSACTION_DATE`, `CREATED_DATE`, `UPDATED_DATE` |
| Gen Doc Fields | `SERVER_DOC_1/2/3`, `CLIENT_DOC_TYPE`, `CLIENT_DOC_1…5`, `DESCRIPTION`, `ARAP_PNS`, `ARAP_SETTLEMENT`, `ARAP_DOC_OPEN`, `ARAP_CONTRA`, `ARAP_BAL`, `AMOUNT_TXN_MAIN_LISTING`, `AMOUNT_MAIN_LISTING`, `QTY_MAIN_LISTING` |
| Vertical UI | `VERTICAL_ORIENTATION`, `EXPAND_*` per tab |
| Doc Settings | `TRACKING_ID`, `PERMIT_NO`, `VALIDITY_DATE`, `CREATED_BY_DETAILS`, `LOCATION`, `DELIVERY_BRANCH`, `DELIVERY_LOCATION`, `MAIN_DETAILS_SALES_AGENT`, `BASE_CURRENCY`, `CURRENCY`, `CREDIT_TERMS`, `DEBIT_TERMS`, `CREDIT_LIMIT`, `DUE_DATE`, `REMARKS`, `EXTERNAL_REMARKS`, `REFERENCE`, `MEMBER_CARD`, `WORKFLOW_STATUS`, `WORKFLOW_RESOLUTION` |
| External Documents | `QUOTATION`, `ORDER`, `DELIVERY_ORDER`, `INVOICE`, `OTHERS` |
| Account | `ACCOUNT_BILLING_CONTACT`, `ACCOUNT_SHIPPING_CONTACT` |
| Lines | `SALES_AGENT`, all `UNIT_PRICE_*` and `UNIT_DISCOUNT*` columns, `QTY_BASE`, `QTY_UOM`, `UOM_TO_BASE_RATIO`, `AMOUNT_STD_EXCL_TAX`, `DISCOUNT_AMOUNT_EXCL_TAX`, `AMOUNT_NET_EXCL_TAX`, `AMOUNT_TXN`, `TAX_CONFIG_SELECTION`, `WHT_CONFIG_SELECTION`, `LAST_PURCHASE_PRICE`, `GROUP_DISCOUNT_PERCENTAGE`, `TOTAL_DISCOUNT_AMOUNT`, `TOTAL_TXN_AMOUNT`, `TOTAL_SST_VAT_GST_AMOUNT`, `LINE_ITEMS_GL_CODE` |
| Department | `SEGMENT`, `DIMENSION`, `PROFIT_CENTER`, `PROJECT` |
| Line item tabs | `BIN_NUMBER`, `BATCH_NUMBER`, `COSTING_DETAILS`, `ISSUE_LINK`, `DELIVERY_INSTRUCTION`, `DEPARTMENT`, `DOC_LINK`, `DELIVERY_DETAILS`, `ATTACHMENT_TAB` |
| Header tabs | `KO_FOR_TAB`, `ARAP_TAB`, `PAYMENT_TAB`, `MAIN_PAYMENT_TAB`, `CONTRA_TAB`, `MAIN_CONTRA_TAB`, `SETTLEMENT_TAB`, `DELIVERY_DETAILS_TAB`, `DEPARTMENT_HDR_TAB`, `MAIN_ARAP_TAB`, `TRACE_DOCUMENT_TAB`, `DOC_LINK_TAB`, `EXPORT_TAB` |

Keys in the model with no UI: `DEFAULT_CURRENCY`, `DEFAULT_DECIMAL_PRECISION` / `_STEP`, `DEFAULT_PRICING_SCHEME`, `DEFAULT_ORIENTATION`, custom-status and department/tax `INCLUDE_*` / `ENABLE_*` flags, `WORKFLOW_PROCESS_GUID`, `PRINTABLE`.

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Status flow | DRAFT → FINAL → VOID (DRAFT ← FINAL with `SHOW_DRAFT_BUTTON`); Discard on a draft. |
| Posting at FINAL | Company `posting_final_json` include/exclude list via the Generic Document Primary Processor. |
| Knock-off | Settings → Knock-Off Settings decides which document types appear in KO For and which may knock this note off. |
| Workflow | Settings → Workflow Settings for `INTERNAL_SALES_DEBIT_NOTE`. |
| Printables | Settings → Printable Format Settings; `ENABLE_PRINT_FINAL_GEN_DOC_ONLY`. |
| Email | Settings → Email Template; `SEND_EMAIL_TO_FINAL_GEN_DOCS_ONLY`. |
| e-Invoice | `INTERNAL_SALES_DEBIT_NOTE` is an e-Invoice document type; `skip_einvoice` follows the customer entity at FINAL; submission via My E-Invoice Portal. |
| Intercompany | Intercompany menu; mapping `INTERNAL_SALES_DEBIT_NOTE` → `INTERNAL_PURCHASE_DEBIT_NOTE`; AUTO mode creates the mirror document and link, MANUAL mode queues it; failures go to an error queue. |

### Feature visibility / permissions

API: `TNT_API_DOC_INTERNAL_SALES_DEBIT_NOTE_{CREATE,READ,UPDATE,DELETE}_TGT_GUID`.

Client-side permissions registered for this applet (35):

| Group | Codes |
|---|---|
| Buttons | `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON` |
| Pricing and amounts | `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_COSTING_DETAILS`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` |
| Document numbers | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1…5`, `SHOW_TRANSACTION_DATE` |

The app also reads `SHOW_FILE_IMPORT_MENU`, `SHOW_INTERCOMPANY_MENU`, `SHOW_DRAFT_BUTTON` and the clone-button permission, none of which are registered for this applet (see Troubleshooting).

## Fields

**Main Details**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Location | Issuing branch and location | Yes | No stock effect; location is informational |
| Transaction Date, Validity Date | Accounting date; optional validity | Transaction date yes | Locked-period check at FINAL |
| Currency, Currency Rate | Document currency | Currency yes | Rate required when it differs from base; lockable |
| Sales Agent | Employee credited | No | Autofill from customer; lockable to the current user |
| Credit Terms, Debit Terms, Credit Limit, Due Date | Terms | No | |
| Reference, Remarks, External Remarks, Tracking ID, Permit No, Client Doc Type, Client Doc 1–5, Member Card | Header attributes | No | Reference can be forced unique; client documents carry external references (e.g. a courier's reference) |
| Workflow Status / Resolution | From the workflow process | No | |

**Account**: Entity ID (required); billing and shipping contacts and addresses; Intercompany sub-tab (target company).

**Lines** (`txn_type = PNS`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item | Charge being added; account-code (`GL_CODE`) items post to their own GL | Yes | |
| Quantity, UOM | Quantity | Yes | Quantity signum forced to 0 — no stock |
| Unit price, discount, net and transaction amounts, Net Amount, Net Amount with Tax | Value charged | Net and transaction amounts required | Prices auto-calculate from the tax-inclusive figure |
| Tax Code, Tax Amount, WHT | Tax | From item or scheme | Posts to `OUTPUT_TAX` |
| GL Code | Overrides the `SALES` default | No | |
| Batch / Bin sub-tabs | Present for parity | Batch: batch no, qty, issue and expiry date; Bin: bin code, container measure/qty, qty | No inventory effect |
| Segment, Dimension, Profit Center, Project | Department analysis | No | |

**Settlement**: date and amount always required; type-specific references; card fields per `MANDATORY_*`. **Contra**: offsets against the customer's open credit documents.

**File Import**: delimiter is mandatory; the Checking section lists row-level errors before the file is processed.

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable; no posting | FINAL, Discard |
| **FINAL** | Numbered; journal and AR posted; intercompany mirror queued | VOID; DRAFT with `SHOW_DRAFT_BUTTON` |
| **VOID** | Reversed with a void reason | none |

**FINAL validation** (backend): exchange rate when currencies differ; serial/bin/batch consistency (no-ops with quantity signum 0); transaction date and company present; date not in a locked fiscal period. Blacklist and stock checks do not apply.

**Journal** — `SALES` handler, amount signum +1:

| Dr | Cr | Amount | GL code source |
|---|---|---|---|
| Debtor (`DEBTOR` / `DEBTOR_NON_TRADE`) | | Total including tax | Company default GL by customer AR type |
| | Sales, or the line's own GL code (account-code item) | Net amount per line | Line `glcode_guid` → item-company GL link → company default `SALES` |
| | Output tax (`OUTPUT_TAX`) | Tax amount | Company default GL |
| Cashbook GL | Debtor | Each settlement line | Settlement method |

No inventory transaction and no COGS entry.

**Intercompany at FINAL**: with the branch intercompany setting in AUTO mode the processor creates `INTERNAL_PURCHASE_DEBIT_NOTE` in the receiving company and links the two documents (visible on TraceDocument); in MANUAL mode the note waits in the Intercompany queue.

**VOID** sets the status and reason, queues the void primary processor (reverses journal and AR) and removes the document from the e-Invoice queue.

## Related applets

- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the invoice being topped up.
- [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) — the opposite adjustment; often contra'd against a debit note.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — settles the extra receivable.
- [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — intercompany mirror.
- [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) — submission.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Customer](/applets/master-data/customer-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Workflow Design](/applets/master-data/workflow-design-applet/) — master data and workflow.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Final fails with `MISSING_DEFAULT_GL_CODE: DEBTOR` (or `SALES`, `OUTPUT_TAX`) | Company default GL codes missing | Set them in [Chart of Account](/applets/master-data/chart-of-account-applet/) |
| Charge posted to the generic Sales account | Ordinary item with no GL override | Use an account-code item linked to the right GL (Doc Item Maintenance) or set the line GL Code |
| "The selected date falls within a locked fiscal period." | Transaction date in a closed period | Change the date or reopen the period |
| Second debit note with the same Reference rejected | `ENABLE_DUPLICATE_REFERENCE_CHECK` | Use a unique reference or turn the check off |
| Grid reset after Save / Final | Older build bug | Fixed; upgrade |
| Child views changed the listing's column mode | Older build bug | Fixed |
| Sales agent not auto-filled after choosing the customer | `ENABLE_SALES_AGENT_AUTOFILL` off | Turn it on |
| File Import or Intercompany menu missing for one user | `HIDE_*_MENU` on and the `SHOW_*_MENU` codes are not registered for this applet | Turn the hide off or request the codes |
| Clone button or "back to Draft" missing although the setting is on | The clone permission and `SHOW_DRAFT_BUTTON` are not registered for this applet | Request the codes |
| Mirror Purchase Debit Note not created | Intercompany mapping missing or branch not in AUTO mode | Complete the branch intercompany setting; check the Intercompany error queue |
| Import rows rejected | Row fails validation (customer, item or GL not found) | Read the Checking section; fix master data and re-upload |

## Related documentation

- [Credit Sales Workflow](/guides/sales-guides/credit-sales-workflow/)
- [Financial Accounting module](/modules/financial-accounting/), [E-Invoice module](/modules/e-invoice/)
- [Sales Workflow applets](/applets/sales-workflow/)
