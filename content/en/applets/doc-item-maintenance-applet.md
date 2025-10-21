---
title: "Doc Item Maintenance Applet"
description: "Centralized hub for managing and maintaining essential item information in BigLedger"
tags:
- core-module
- item-management
- inventory
- master-data
- product-catalog
weight: 5
---

## Purpose and Overview

The Doc Item Maintenance Applet serves as a centralized hub for managing and maintaining essential item information. Designed to support efficient data handling, it enables users to create and update item records, which form the foundation for transaction creation across different modules. By organizing item data into a comprehensive master record, this applet enhances operational efficiency, data accuracy, and ease of access across departments.

{{< callout type="info" >}}
**Core Module Applet**: This is one of the 13 essential Core Module applets that manages all product and item information used throughout the system.
{{< /callout >}}

## Key Features

{{< cards >}}
  {{< card title="Item Management" subtitle="Users can create and regularly update item information, ensuring records remain current and accurate." >}}
  {{< card title="Item Grouping" subtitle="Categorize items into groups, with predefined categories or create a new category based on business needs." >}}
  {{< card title="Pricing Management" subtitle="Enables the configuration of multiple pricing schemes for individual items, accommodating diverse pricing strategies." >}}
  {{< card title="Marketplace Management" subtitle="Synchronize item listings across popular online marketplaces, ensuring data consistency between internal and external records." >}}
{{< /cards >}}

## Getting Started

To access the Doc Item Maintenance Applet, you need to log in with your credentials. Please refer to the User Guide Registration link for information on Akaun Login Onboarding.

## Items

### Item Listing

Under items, create and edit the items, or click the item listing to see the item information.

### Create Items

To create an item click on the plus button. It takes you to the Create tab.

#### Default Fields

Defaults have fields such as item code, item name, item type, sub-item type, base UOM, Product manager, remarks, item description, and currency.

- **Item Code** - Once Item Code is created it cannot be edited
- **Item Name** - Item Name can be edited at any time
- **Base UOM** - Quantities of warehouse materials (quants) are counted using the base unit of measure (UoM). Quantities in alternative units of measure are always converted to the base unit of measure for calculation purposes. For example: cm, kg, ml
- **Item Description** - Not compulsory
- **Remarks** - Write your comments
- **Currency** - Select the currency from the dropdown list
- **Product Manager** - Select the Product Manager from the dropdown list
- **Item Type** - Consists of many types as follows

#### Types of Items

Under the type of item, the user can select from the following sub-item types. Each item type will have different information:

{{< cards >}}
  {{< card title="Basic Item" subtitle="This is the default type that is relevant to most items" >}}
  {{< card title="Voucher" subtitle="An item that is part of a voucher. The voucher will have a 'Link Voucher' option as a subtype" >}}
  {{< card title="Grouped Item" subtitle="An item that is part of a group of related products that share common attributes like features, use, production processes, etc." >}}
  {{< card title="Bundle" subtitle="A package of two or more stand-alone products sold together for a single price. Stock is deducted from child items, not parent" >}}
  {{< card title="Coupon" subtitle="Used to record the Stock In and Stock Out of vouchers tied to this item. Reflected in the Voucher Management Applet" >}}
  {{< card title="Service" subtitle="A basic item without inventory tracking" >}}
  {{< card title="Warranty" subtitle="A written guarantee issued to the purchaser, promising to repair or replace if necessary within a specified period" >}}
  {{< card title="GL Code" subtitle="General ledger code used to record business transactions in the general ledger" >}}
{{< /cards >}}

{{< cards >}}
  {{< card title="Doc Header Adjustment" subtitle="Used to group discounts in the POS applet" >}}
  {{< card title="Membership" subtitle="Used to define member attributes, dues payment schedule, and expiration settings" >}}
  {{< card title="Made to Order (MTO)" subtitle="Manufacturing process where products are assembled according to customer requirements" >}}
  {{< card title="Account Code" subtitle="Accounting code for financial tracking" >}}
  {{< card title="Digital Goods" subtitle="Non-physical products delivered electronically" >}}
  {{< card title="Fixed Asset Register" subtitle="Items tracked as company assets" >}}
  {{< card title="Sales Contract" subtitle="Contract-based sales items" >}}
  {{< card title="Delivery Charger" subtitle="Shipping and delivery cost items" >}}
{{< /cards >}}

#### Sub Item Types

There are five sub-item types available:

- **Basic Quantity** - Standard quantity tracking
- **Batch Number** - Container Measure is set to 1 by default, Container Quantity can be changed by user
- **Serial Number** - Container Measure and Container Quantity are both set to 1 by default
- **Bin Number** - Both Container Measure and Container Quantity can be changed by user
- **Digital Goods** - For non-physical products

When a user selects any sub-item type, it will be reflected in the POS applet. The Base Quantity is calculated as the sum of Container Measure and Container Quantity.

{{< callout type="warning" >}}
**Important**: Once the item has been created more information can be added in the EDIT ITEM section. Only basic information is required to be filled in the CREATE section and afterwards, users can continue editing items in order to add more information at any time. We exclude adding more information in the CREATE section because if there is a lot of information to be added the user might forget to click save. Adding as little information as possible in the CREATE section prevents and/or reduces data being lost.
{{< /callout >}}

Once all required fields are filled up, the user can press CREATE, so the item will be saved into the database and can proceed to be edited.

{{< callout type="info" >}}
**Note**: Items can be created manually or synced from EMP (if the user is currently using Wavelet EMP)
{{< /callout >}}

### Edit Items

Once the user creates an Item, it will appear in the listing. When the user wants to update the item or add more information they can click on the Item itself, a 2nd container will pop up once clicked containing the following tabs:

- Main Tab
- E-invoice Tab
- Label Tab
- Item Category Tab
- Inv-item-linking Tab
- Add on
- Add on of
- Tax Tab
- Dimension Details Tab
- Multi UOM Tab
- Branch Linking Tab
- Company Linking Tab
- Pricing Scheme Tab
- Manage Image Tab
- Entity Pricing Tab
- T2T Item Mapping Tab
- Marketplace Tab
- Stock Availability Tab
- Stock Card Tab
- Attribute Set Tab
- Pages Tab
- Reviews Tab

{{< callout type="info" >}}
**Note**: The information provided can be used in transactional Applets. Additional tabs may appear if the user chooses Grouped or Bundle as Item type.
{{< /callout >}}

#### Main Tab

This Tab consists of general Item information such as:

- **Item Name** - can be updated at any time
- **Item Code** - cannot be updated
- **Item Type** - cannot be updated
- **Sub Item Type** - used when items are in a batch or have a serial number
- **GL Code** - The general ledger is an accounting document that provides a general overview of an organization's financial transactions. An account, or general ledger (GL) code, is a number used to record business transactions in the general ledger
- **Base UOM** - an amount in which the stock of a material is managed for example ml, kg, min
- **Abbreviation (Prefix)** - is used in the voucher applet, in order to make it easier to view a specific group of items
- **EAN Code** - The International Article Number is a standard describing a barcode symbology and numbering system used in global trade to identify a specific retail product type, in a specific packaging configuration, from a specific manufacturer.
- **Currency** - a system of money in general use in a particular country. For example, USD, MYR
- **Status** - to specify whether an item is active, inactive, or obsolete
- **Remarks** - Write your comments
- **Summary** - shows who created the item or who updated the item, also shows the date modified and created

#### E-invoice Tab

This tab is for MSIC, Tax type, and UOM. Here users can do e-invoice classification.

This can also be done under Classification in the applet menu.

#### Label Tab

Label the items.

#### Item Category

The item category tab is used to link a category to the item. Currently, have 0 - 20 categories but can add more for users upon request. Categories can be created in the "Category" module.

In order to add the category click "+". Once clicked the 3rd container with category listings will be shown. Users can select any category that applies to the Item.

#### Tax Tab

If tax is applicable the user can tick the checkbox. Once ticked the tax information will appear where the user can set the tax for:

- Tax Country
- Output Tax
- Input Tax
- Withholding tax

#### Dimension Details Tab

To fill in Product dimensions. Here user set the Height, Length, Width, Weight of the item.

#### Multi UOM Tab

This module allows stock items with multiple units of measurement, UOM auto conversion, and multiple UOM reports that can be later used in transactional applets. If your industry uses multi uom, you can specify here. sample of Multi UOM:

- 1 Box = 12 Packs
- 1 Packs = 10 Strips
- 1 Strips = 10 Tablets

The above UOM specifics the conversion of one type of UOM to another UOM, with a specific ratio.

To add Multi UOM click "+". Once clicked it will open a 3rd container for the user to add UOM details

- **UOM** - Unit of Measure. UOMs are used to quantify the inventory items and enable items to be tracked easily.
- **Ratio** - used to specify how many items. For example:
  - if base UOM is = "Bottle", then ratio = 20 bottles
  - The number 20 specifies the number of the items
- **Status** - to specify whether the item is active or inactive
- **Base UOM** - unable to edit. Users may edit it in the Main Details Tab
- **Sort-Code** - The sort code helps identify the hierarchy of the UOM from the smallest to largest starting from 001. For example, pill would be 001 followed by the carton which would be 002 and finally box which would be 003.

For example:
- a. pill = 001
- b. carton = 002
- c. box = 003

#### Branch Linking

Specify item by branch and company by linking it to them here. This tab is used to link specific branches. This function will be used in all transactional applets. for example, if a user links branches A and B then only these respective branches will be able to see the selected item in the POS applet. Branches can be created in the Organization applet.

To add a branch click "+". Once clicked it will open a 3rd container for users to view listings of all branches where the user can select the preferred branches:

#### Company Linking

Used to link companies. Specify item by branch and company by linking it to them here. Companies can be created in the Organization applet. When linking a company the item will be visible for all branches that are under the chosen Company.

In Order to add a company click "+". Once clicked it will open a 3rd container for users to view listings of all companies. Here the user can select the preferred company.

{{< callout type="warning" >}}
**Important**: if the user links company A and it has been linked to 5 BRANCHES but in Branch linking TAB the user only chooses 2 branches, then the item will be visible to ALL BRANCHES THAT IS LINKED UNDER THE COMPANY. If the user wants to link only specific branches then it needs to be chosen in the BRANCH LINKING TAB ONLY and COMPANY LINKING should remain empty.
{{< /callout >}}

#### PNS Settlement Method Tab

The PNS Settlement Method module is used to link the Product to the PNS (Products and Services) Settlement Method.

There is a dropdown list, where the user selects the Settlement Type:
- Payment Provider
- Membership Point Currency

In order to add a Settlement Method click "+". Once clicked it will open a 3rd container for users to choose settlement type. Here the user can select the preferred type.

#### Pricing Scheme

This tab is used to specify and set the prices of items. The Pricing Scheme template is added in the PRICING SCHEME module, in this tab users can add a unit price for existing pricing scheme templates. Once added this information can be used in transactional applets.

In Order to edit the price, click the item and it will open 3rd container for users to edit the Unit Price.

#### Manage Image Tab

This tab is used to add and categorize images based on their type for example main image, promotional image, or additional image. Users may update the period of the images they are going to be using as a reference, it has no functionality. Images may also be used in the Ecomsync applet, CP Commerce applet, and transactional applets such as POS and GRN. However, the date is only for user reference and is not meant to perform any actions.

Image type is based on ecommerce requirements. There are three image types such as:

**Main Image** - the image that is supposed to be displayed in the marketplace. Setting the Image type is only for the user's reference and a library. When syncing the item, the user has to manually select the image they wish to sync to the marketplace under attribute details.

**Promotional Image** - when there are certain promotions, some users might need to use special images related to the promotion, it will replace the main image. Setting the Image type is only for the user's reference and the library. When syncing the item, the user has to manually select the image they wish to sync to the marketplace under attribute details.

**Additional images** - images that end users can view when they view full item information.

As an illustration:
- Item = Samsung Phone
- Main Image = the image of a Samsung phone
- Promotional Image = a themed image (based on the occasion) of a Samsung phone eg. Christmas sale
- Additional images = images of Samsung phone in different angles, the box, or additional items inside the box

#### Entity Pricing

Entity Pricing module is used to set the price for the Product depending on the Entity. If u have a specific price for a specific item that has multiple suppliers, u can set it here. For instance: A single product's price is individual for different Entities.

To add an Entity Price click "+". It will open 3rd container for users to create the Price. Then click "Entity Code" to choose the entity type.

Select the Entity type from the advanced search. There are three types of Entity to select:
- Customer
- Supplier
- Employee

After selecting the Entity, click on the Item and it will automatically leads the user to the previous page filled in with the Entity Code and Entity Name. In this page user set the price for selected Entity.

#### T2T Item Mapping Tab

The tenant to Tenant Item Mapping module is used to map Companies, Product Codes, and Names to sync transactions

The T2T Item Mapping tab includes three tabs as follows:

**Host Tenant** - Main tab where the Mapping of the items is processed

**Guest Tenant Item Mapping** - A list of Tenants that are already Mapped

**Guest Tenant Permission Listing** - A list of Tenants to which permission is given for mapping. All the Permissions are given from the T2T Admin applet

To do the mapping, click the "+" button, which will lead the user to the new page, where the user selects the Tenant from the dropdown list and add the item.

#### Marketplace Tab

The Marketplace Tab is used to list the products on multiple marketplaces. This tab is to link your doc items to your Lazada Shopee or any e-commerce site. It is mainly used for Marketplaces such as Lazada, Shopee, and CP-Commerce. So the user can sell one product in various stores.

Marketplace tab includes three more tabs to do all the configurations:

**Main** - Users select and add the Stores by clicking the "+" button in the Main Tab

**Other Resellers Tab** - This tab is used if there are resellers who are distributing your products and selling them in other different Marketplaces. Fill in the URL of the Marketplace they use.

**Checking** - The checking Tab is for the reports shown from the Ecomsync applet.

#### Add Item Images to Marketplace

#### Stock Availability Tab

This tab is to link your Marketplace stock balance. Stock availability tabs allow users to check whether the products are available in-store.

#### Attribute Set Tab

Attribute sets can be defined as a list of attributes where all the characteristics of a product are demonstrated.

#### Pages Tab

When the user clickss on the plus button, it will create a Post with a Draft status and an untitled post.

Users should click the created post to edit the status and the name of the post.

#### Reviews Tab

The review tab allows the User or an Admin to configure reviews, settings, and votes for an item

{{< callout type="info" >}}
**Note**: Attributes, Pages, and Reviews tab is mostly used in E-Commerce Modules.
{{< /callout >}}

#### Bundle Config

Applicable for the Bundle Item type

#### Child Item

Applicable for the Grouped Item type.

#### Voucher Details

This is Applicable for the voucher item type only.

#### Stock Card

This is for Stock balance for the Basic Item type.

## Category Groups

Under category group, user can create and edit the categories and specify the category group's category. When u create an item under the Item menu, You specify their category.

{{< callout type="info" >}}
**Note**: Category groups and categories of the item can be handled from both doc item maintenance and inventory item maintenance applet. Every category is linked to the Category Group. Category Group is used for organizing categories.
{{< /callout >}}

### Create

In Order to create a Category group, click the "+" button. It will open 3rd container for users to create category groups.

These are the fields in the main tab to fill in:
- Category Group Code
- Category Group Name
- Type
- Param Code
- Param Name
- Status

### Edit

To edit existing category groups users click on any of the specific category groups in the listing. Once clicked it will open a second container with Category Group details. There are two tabs when editing Category Group which are:

#### Main Tab

This tab shows the information on the category that was filled up when creating the category. Users edit or delete the Category Group in this tab.

#### Categories Tab

Categories Tab where the listing of linked categories is shown. Users can manage the categories in this tab.

### Create

To add the category to the group users click '+' and create the new item.

### Edit / Delete

Users edit or delete the categories linked to the group in this Item Category Edit tab.

#### Main

#### Manage Image

Category Images can be uploaded or edited in the Manage Image tab.

## Categories

The category module is used to create categories, as well as nest categories that can be linked to an Item in the Item Maintenance Module.

When user land in Category Listing, they will see the AG-Grid listing of all categories that have been created

The screenshot above shows the listing of all categories. Users may customize the columns by removing them or relocating them. Users may search categories through fuzzy search in the listing itself or may search through a general search bar. In addition, they may search by status and modified date in advanced search as shown in the picture below:

Pagination Row can be customized based on user's preference as shown in screenshot below:

### Create Category

When user wants to create a new category for an item they can go to "Category Module". then the user must click on "+" It will redirect to the 2nd container where the user must fill up the required fields. Category will make it easier for users to search specific groups of items either in Doc Item Maintenance or in transactional applets.

There are two mandatory fields when creating a category which are:
- Category Name
- Category Code
- Description - is not compulsory
- Nesting category - it is when a single category can be associated with multiple categories. for example:
  - Main category = Smartphones
  - Nested Category = iPhone

### Edit Category

When a user wants to edit existing categories they may click on any of the specific categories in the listing. Once clicked it will open a second container with Category details. There are two tabs when editing Category which are:

#### Main Tab

This tab shows basic information on the category that was filled up when creating the category.

These are the fields in the main tab:
- **Category Name** - can be adjusted, compulsory to fill up
- **Category Code** - can be adjusted, compulsory to fill up
- **Description** - can be adjusted, not compulsory
- **Status** - to specify whether the category is Active or Inactive
- **Nesting the category** - it is when a single category can be associated with multiple categories. Can be adjusted. Example of nested category:
  - Main category = Smartphones
  - Nested Category = iPhone
- **Summary** - cannot be adjusted, as it is used as a reference for the user to show details such as:
  - Created by who
  - Modified by who
  - Creation date
  - Modified Date

#### Manage Image Tab

CP Commerce displays product categories for easy referral for customers. Users can use the Manage Image Tab in the Doc Item Maintenance applet to upload relevant category images. Upon clicking on categories, the user will be shown all relevant products under said categories.

When users want to an image, they click on the "+" button, once clicked the second container will appear, where the user can select the image and specify the image name as shown below.

These are the fields in the main tab:

#### Manage Item Tab

Users can use the Manage Item Tab in the Doc Item Maintenance applet to upload relevant category items. Upon clicking on categories, the user will be shown all relevant products under said categories.

When users want to add an item, they click on the "+" button, once clicked the second container will appear, where the user can select the item and add it.

#### Login Tab

Please click the "Add" button to create a new login.

Enter a valid email address and verify it. Then set the status of the email address to be active.

Users can update their mail status or delete it.

## Pricing Scheme

Once a user clicks on the pricing scheme module it will land on the pricing scheme listing page. The module is used to create the template for pricing that can be also used in transactional applets such as POS, GRN, etc. In this module you can only create the template/scheme, the price can be added later for each specific item in the "Item Maintenance" module

For example, in the POS applet, users can go to the settings and choose which Pricing Scheme they want to use for a minimum price, maximum price or the retail price as shown in the screenshot below

Users also may search pricing schemes in the listing itself using fuzzy search in the AG-Grid listing. Pricing schemes can be searched in general search or advanced search:

### Pricing Scheme Create

To create a Pricing Scheme, the user should click on the "+" button, once clicked it will open a second container where the user can fill up general details on the pricing scheme such as:
- Pricing scheme Code - code is created by the system.
- Pricing Scheme Name - compulsory to fill up
- Description - not compulsory

### Pricing Scheme Edit

If the user wishes to edit the Pricing Scheme they can click on a specific pricing scheme in the listing, once clicked it will redirect to the second container where the user can edit the remaining information.

There are three tabs included In the Pricing Scheme Edit

#### Main Tab

- **Pricing Code** - cannot be edited
- **Pricing name** - The user able to edit the name
- **Description** - The user can edit the description. the description is not compulsory
- **Status** - The user can specify whether the pricing scheme is active or inactive

In addition, users may delete the pricing scheme if they wish to. Users may click on the "Remove" button at the bottom.

#### Copy Tab

The user selects one item from the Pricing list in the dropdown list and makes some amendments to the pricing.

## Import Item

Import the item to the applet by clicking on the plus and selecting Upload. Choose from the doc item to upload. Additionally, select the source fields and target fields for the doc item, then click export to set the fields. Finally, upload the item.

### Import Item Templates

There are several upload templates to choose from under the import item menu, which include:
- Doc Item (for 1 invoice creation for an item)
- Doc Item Category Link (if you want to import for category item)
- Doc Item Relationship (for group/bundle items)
- Doc Item Pricing (for pricing upload)
- Doc Item With GL Code (for item with account code type)
- Doc Item Label Link
- Doc Item Company Link
- Doc Item Branch Link
- Doc Item Category

Import Item Module is used to mass upload the products using CSV files. This function is especially useful for the user if they have a wide range of products. It could tremendously save your time and be accurate.

To upload products in bulk, click "+", and it will direct you File Import page. First, you need to choose the file type and download the upload file template by clicking the chosen file type.

Open the CSV file, insert your product details into the file accordingly.

Once done, save the file in .csv format.

Upload the file by just clicking the Upload File button or by dragging and dropping a file in the box.

The user will see the uploaded file at the bottom of the page.

Users can delete the uploaded file in the File Import Edit page

---

## Related Applets - Doc Item Maintenance

The Doc Item Maintenance applet can import Lines from the following Applets:
- Tax Configuration Applet
- Chart of Accounts Applet
- Organisation Applet
- Stock Availability Applet

The information in Doc Item Maintenance applet, is used by which applets:
- Ecomsync Applet
- Internal Sales Order Applet
- Delivery Order Applet
- Internal Purchase Order Applet
- Process Maintenance Applet
- Beauty POS Applet
- POS General Applet
- Internal Job Order Applet
- CellLabs- QR Code Management Applet
- Internal Packing Order Applet
- UCC - Unified Contact Centre Applet

---

## Export Item

If the user wants to export the item, several templates are available to choose from, which include:
- Doc Item Pricing
- Doc Item With GL Code
- Doc Item Company Link
- Doc Item Branch Link
- Doc Item Label Link

---

## Scheduler

### Create

To create a Scheduler, the user clicks +, and will go to the second page. In the details tab - user fills in:
- Scheduler Code
- Scheduler Name
- Time Interval
- Interval
- Branch List

#### Cron Expression tab

It enables users to schedule tasks to run periodically at a specified date and time.

To edit or remove Scheduler, select the specific scheduler you want and it will lead you to the second page where u can implement your changes.

---

## Search Filter

To create a Search Filter, the user clicks +, and will go to the second page. In the main tab - the user fills in:
- Search Filter Code
- Search Filter Name
- Status

Each created search filter would have section, and the sections will be displayed in the CP-Commerce.

These sections are linked to the attributes where we show the options

---

## Best Practices

### Item Creation
- Fill only essential information in CREATE section to prevent data loss
- Use EDIT section to add detailed information after initial creation
- Maintain consistent naming conventions for item codes
- Regularly update item information to ensure accuracy

### Category Management
- Organize items using appropriate categories
- Use nested categories for better organization
- Keep category structure simple and logical
- Update category images for better visual reference

### Pricing Management
- Create pricing scheme templates before adding prices
- Use entity pricing for customer/supplier-specific pricing
- Regularly review and update pricing
- Test pricing in POS before going live

### Marketplace Integration
- Ensure accurate item information before syncing
- Use appropriate main and promotional images
- Keep stock availability updated
- Monitor marketplace listings regularly

{{< callout type="tip" >}}
**Pro Tip**: Items can be created manually or synced from EMP (if currently using Wavelet EMP). Use bulk import for large quantities of items to save time and ensure data accuracy.
{{< /callout >}}

## Support Resources

For additional assistance:
- Item setup guide
- Category configuration documentation
- Pricing scheme tutorials
- Import/export templates
- Best practices documentation