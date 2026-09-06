---
title: "Shopping Cart Customer Access (Internal)"
description: "Customer-facing internal shopping cart for browsing, cart management, and submitting internal purchase requests"
tags:
- ecommerce
- internal-shopping
- customer-access
- shopping-cart
weight: 200
date: 2026-05-16
---

## Purpose and Overview

The **Internal Shopping Cart (Customer Access) Applet** provides a simple, self-service interface for customers or internal users to browse catalog items, add them to a cart, and submit the cart as a sales order request for fulfilment.

{{< callout type="info" >}}
**Core concept**: Users build a cart, select billing and shipping details, optionally set payment/settlement info, attach supporting documents, then submit the cart for processing.
{{< /callout >}}

![Shopping Cart overview infographic](/images/internal-shopping-cart-customer-access-applet/internal-shopping-cart-customer-access-applet-infographc-overview.png)

*Figure: Shopping Cart — at-a-glance workflow overview.*

## Before You Start

- Ensure the customer or member account exists in master data when required.
- Confirm the item catalogue contains the products you intend to request.
- Know the default branch and location you will use for fulfillment (if applicable).
- Have billing and shipping addresses ready if you need non-default addresses.
- Confirm you have permission to create and submit shopping cart requests.

## Key Features Overview

{{< cards >}}
  {{< card title="Listing & Search" subtitle="Find previous carts and requests" link="#listing" >}}
  {{< card title="Create Cart" subtitle="Build and submit a new cart" link="#create" >}}
  {{< card title="Customer & Addresses" subtitle="Select or manage customer details" link="#customer-account" >}}
  {{< card title="Line Items" subtitle="Search items, add quantities, set pricing" link="#line-items" >}}
  {{< card title="Payment & Settlement" subtitle="Add payment details or settlement info" link="#payment" >}}
{{< /cards >}}

## Quick Start Guide

1. Open **Shopping Cart** from the sidebar.
2. Click **Create** to start a new cart.
3. Fill the **Main** header: company/branch, transaction date, and reference as needed.
4. Select a **Customer** or **Member** (optional) using the customer selector.
5. Add items: click **Select Line Item**, use **Search Item** and **Add Line Item** to populate the cart.
6. Choose shipping and billing addresses (use **Select Billing Address** / **Select Shipping Address** when required).
7. Add payment or settlement info under **Add Payment** if your process requires it.
8. Attach files as needed, then **CREATE** (save) or **FINAL** to submit your cart. If your tenant shows a button labelled **Submit** instead of **FINAL**, use that.

## Detailed Walkthrough

### Listing

The listing (first column) shows shopping cart documents. Common columns include:

- **Doc No** — internal document reference
- **Branch** — owning branch
- **Posting Status** — blank values typically display as **DRAFT**
- **Status** — ACTIVE / INACTIVE
- **Customer Name** — the selected customer
- **Creation Date** / **Updated Date**
- **Amount Txn** — transaction amount

Use the grid filters to find carts by document number, customer, branch, or dates. Select a row to open the cart in the view column.

![Listing and search view showing Doc No, Posting Status, Customer and Amount Txn](/images/internal-shopping-cart-customer-access-applet/sc-listing-search.png)

*Figure: Listing & Search — filters, selected row, and action bar (FINAL).* 

### Create / Edit a Cart

The create screen is tabbed. Main sections you will use:

- **Main** — enter company/branch, transaction date, reference, and remarks.
- **Account / Customer** — choose the customer or member for this cart.
- **Line Items** — search the catalogue and add items with quantity, UOM, unit price and optional discounts.
- **Billing Address** / **Shipping Address** — pick saved addresses or add a new one.
- **Payment** — provide payment or settlement information when required by your organisation.
- **Attachments** — upload supporting documents such as quotes or approvals.

Primary buttons:

- **CREATE** — save a new cart as a draft.
- **SAVE** — save changes to an existing draft.
- **FINAL** — submit the cart for processing (labelled **FINAL** in the UI; some tenants may show **Submit**).
- **RESET** — revert unsaved changes to the last saved state.

![Create cart main tab showing Company, Branch, Member Card and action buttons](/images/internal-shopping-cart-customer-access-applet/sc-create-main-account.png)

*Figure: Create Cart — Main tab with account selector and primary actions (CREATE / FINAL).* 

### Line Items

To add line items:

1. Open **Select Line Item** and search the catalogue by code, name, or keywords. Results show Item Code, Item Name, UOM and available stock.
2. Choose the item you want and enter the requested **Quantity**.
3. Confirm or choose the **UOM**, set **Unit Price** if editable, and apply any **Discount**.
4. Click **ADD** to insert the line into the cart. Repeat for additional items.

The line editor validates quantity and UOM. Tax and discount fields appear only if your company has those features enabled.

![Add line item flow showing search results and Add Line Item editor (Quantity, UOM, Unit Price)](/images/internal-shopping-cart-customer-access-applet/sc-add-line-item.png)

*Figure: Add Line Item — search results and the Add Line Item editor with Quantity, UOM, Unit Price and ADD button.*

### Customer & Addresses

Pick an existing customer or member account to attach to the cart, or create a new customer when permitted. Billing and shipping addresses can be selected from the customer's saved addresses or added on the fly.

Note: In some tenant setups the customer selector is optional (for anonymous or walk-in requests). If your organisation requires a customer account, the selector will be mandatory and marked accordingly.

### Payment & Settlement

If your organisation requires payment details at request time, provide them in the **Payment** section. Typical examples:

- Purchase order / reference number for invoicing
- Pre-authorised payment method identifier
- Settlement terms or internal billing code

If your company bills after fulfillment (post-invoice), you can usually leave payment details blank. When in doubt, check with your administrator.

### Main header fields (what you'll see)

On the **Main** tab you will typically enter or confirm:

- **Company / Branch** — where the request will be processed.
- **Location** — optional warehouse or pickup location.
- **Transaction Date** — when the request applies.
- **Reference** — your internal reference or document number.
- **Sales Agent / Requester** — person on record for the request.
- **Currency** — transaction currency.
- **Credit Terms / Credit Limit** — billing terms if applicable.
- **Member Card** — optional loyalty/membership card (see below).
- **Contact** — CRM contact or customer contact person.
- **Tracking ID / Remarks** — optional notes or shipment tracking.

### Listing column names

Common listing headers you will see in the grid:

- **Doc No** — internal document reference
- **Branch**
- **Posting Status** — blank values typically display as **DRAFT**
- **Status** — ACTIVE / INACTIVE
- **Customer Name**
- **Creation Date**
- **Amount Txn**
- **Updated Date**

### Worked example

Create a cart for `ACME Supplies` to request 10 boxes of `A4 Paper`:

1. From **Shopping Cart**, click **Create**.
2. On **Main**, confirm `company` = HQ, `branch` = Office, set `transactionDate` = today, `reference` = SCart-0001.
3. Open **Account → Select Customer**, choose `ACME Supplies` and confirm billing address via **Select Billing Address**.
4. Click **Select Line Item** → **Search Item**, find `A4 PAPER BUNDLE`, click it and in **Add Line Item** set `Quantity` = 10, `UOM` = BOX, `Unit Price` = 12.50, then **ADD**.
5. (Optional) Open **Add Payment** and select settlement metadata if your tenant requires it.
6. Add any supporting files under **Attachments**.
7. Click **CREATE** to save the draft. When ready, click **FINAL** to submit the cart (some tenants may show **Submit** instead).


### Attachments

Attach documents such as approval forms, quotes, or specification sheets using the attachments area in the create or view screens.

## Configuration & Settings

Administrators can configure the applet via the **Settings** area (Settings → Default Selection, Field Settings, Printable Format Settings). Key admin controls include:

- Feature visibility (which tabs/components appear)
- Default company/branch/location
- Printable templates for export
- Permission sets controlling who can create, edit, or finalize

## Troubleshooting

| Symptom | Likely Cause | What to do |
|---|---|---|
| **FINAL button disabled** | Required serial/validation checks or missing payment/settlement rules | Complete required validations (serials, mandatory fields); contact admin if button should be enabled. |
| **Items show zero available stock** | Item not stocked at selected location or real-time stock not configured | Change branch/location, select alternate item, or contact inventory team. |
| **Payment section not visible** | Tenant does not require payment at request time or permission restricted | Check with admin; payment fields appear only when enabled for the tenant. |
| **Create / Save disabled** | Missing required header fields or missing create permission | Fill required fields (Company/Branch/Customer if mandatory) or request permission from admin. |
| **Search returns no items** | Filters too narrow or item inactive | Broaden search, remove filters, or check item master data. |
| **Cannot select billing/shipping address** | Customer lacks saved addresses | Add address in customer profile or ask admin to add address. |

## FAQ

Q: Can I submit a partial quantity for an item? — A: Yes; enter the actual quantity you require in the line editor.

Q: Can I cancel a submitted cart? — A: Cancellation depends on tenant rules. Draft carts can be discarded; submitted/final carts follow your organisation's cancellation or amendment process.

Q: Where do submitted carts go? — A: After you click **FINAL** the cart is posted and converted into a sales order request on the server. The UI shows a confirmation and returns you to the listing. Downstream processing (review, e-mail notifications, or fulfilment) depends on your tenant's configuration — contact your administrator for details about who receives notifications. Note that sales orders have no approval workflow in BigLedger.

## Document Status Reference

| Field | What it means | What you can do |
|---|---|---|
| **Posting Status** | Workflow state for the document. Blank displays as **DRAFT** until the cart is posted/finalised. | Drafts can be edited; posted carts are locked for most changes. |
| **Status** | Active or inactive record state. | Inactive carts are not processed — contact admin to reactivate if needed. |

## What happens after FINAL

When you click **FINAL** the app posts the cart and converts it to a sales-order request on the server. On success you'll see a confirmation toast message ("Posting Successfully") and the UI returns to the listing where the cart shows as posted. If the posting fails you will receive an error notification. Additional downstream actions (review, e-mails, fulfilment) are determined by tenant configuration.

## Role guidance: Customer vs Internal user

- **Customer users** (self-service): typically browse the catalogue, add items, set their own shipping/billing preferences, and submit carts for fulfilment. They generally cannot change pricing or internal account settings.
- **Internal/procurement users**: may create carts on behalf of customers, set internal fields (sales agent, internal references), and have permissions to finalise or discard carts depending on roles.

If you are unsure which role you have, check with your administrator.

## Member Card

**Member Card** links a loyalty or membership number to the cart. If your customer has a membership, enter the card number to associate points or discounts with this request. See the membership admin guide for details on membership setup: [Membership Admin Applet](../membership/membership-admin-applet.md).

## Glossary

- **Posting Status**: The processing state of the document (Draft → Final/Posted).
- **UOM**: Unit of Measure (e.g., BOX, PIECE).
- **Credit Terms**: Payment terms agreed with the customer (e.g., Net 30).
- **Settlement**: Payment or invoicing metadata required to process the order.
- **Tenant**: Your company's configuration of the software; controls which features you see.

## Related Applets

- [Item Catalogue / Search](../master-data/inv-item-maintenance-applet.md) — where items are maintained and priced.
- [Internal Sales Order](../sales-workflow/internal-sales-order-applet.md) — downstream order processing after carts are posted.
- [Membership Admin](../membership/membership-admin-applet.md) — manage member cards and loyalty settings.
