---
title: "PDG Applet"
description: "Product Distribution Guide (PDG) and Outlet Product Distribution Guide (OPDG) applets for streamlined product display planning and outlet-specific distribution management."
tags:
- product-distribution
- outlet-management
- category-groups
- planning
- import-upload
- installation
weight: 61
---


---

---
## PDG Applet User Guide

### Version: 1.1
### Date: 24-09-2025
### Author: Martin
### Classification: Confidential

---

## 1.0 Introduction

The PDG (Product Distribution Guide) and OPDG (Outlet Product Distribution Guide) applets are designed to streamline the product display planning process across Senheng outlets.
PDG serves as a general guideline that defines how many units of each item should be displayed at various outlet types and sizes.

OPDG enables outlet-specific distribution planning based on the guidelines set in PDG, allowing store managers to quickly configure and execute distribution plans tailored to their individual outlet.

---

## 2.0 Setup (Optional)

### 2.1 Outlet Type and Size

Each outlet in the system is categorized by its type and size to ensure appropriate product distribution.

#### Step 1: Accessing the Organization Applet
Navigate to the Organization Applet.
Under the Location menu, you will find the outlet listings which represent individual Senheng outlets.

{{< figure src="/static/images/pdg-applet/location-listing.png" alt="Location Listing" caption="Organization Applet: Location listing for outlets." >}}

#### Step 2: Viewing Outlet Types
Go to Settings > Outlet Types.

Currently, the system supports the following outlet types:

- Basic (B)
- Premium (P)
- Super Premium (SP)

{{< figure src="/static/images/pdg-applet/applet-settings-outlet-type.png" alt="Outlet Type Listing" caption="Outlet Type listing in Applet Settings." >}}

#### Step 3: Viewing Outlet Sizes
Go to Settings > Outlet Sizes.

The currently configured sizes are:

- < 5K
- 5K–7K
- 7K–9K
- 9K–11K
- 15K–20K
- 20K

{{< figure src="/static/images/pdg-applet/applet-settings-outlet-size.png" alt="Outlet Size Listing" caption="Outlet Size listing in Applet Settings." >}}

#### Step 4: Linking Outlet Type and Size
Each outlet's type and size can be assigned within the Location Listing.

Alternatively, these attributes can also be defined during OPDG creation when selecting an outlet (covered in later sections).

{{< figure src="/static/images/pdg-applet/location-edit.png" alt="Edit Location - Assign Type and Size" caption="Edit Location: Assign outlet type and size." >}}

---

### 2.2 Items Category Groups

To support product distribution planning, item categorization is structured using category groups, categories, and items.

#### Step 1: Navigate to Doc Item Maintenance Applet
Open the Doc Item Maintenance Applet.
Under the Items Menu, you will see a listing of all synced items from MBS – SB Client (via Datalake Syncing).

{{< figure src="/static/images/pdg-applet/doc-item-maintenance-items.png" alt="Items Listing" caption="Doc Item Maintenance Applet: Items listing." >}}

#### Step 2: Understanding the Hierarchy
Category Groups > Categories > Items

This structure allows PDG/OPDG to assign display quantity recommendations based on item attributes.

#### Step 3: View Category Groups
Open the Category Groups Menu.
You will find examples like:

- PRODUCT_CATEGORY
- PRODUCT_SUB_GROUP
- PRODUCT_GROUP
- PRODUCT_TYPE
- PRODUCT_GRADE
- PRODUCT_DEPARTMENT
- PRODUCT_DIVISION
- PRODUCT_CLASS
- PRODUCT_BRAND

{{< figure src="/static/images/pdg-applet/doc-item-maintenance-category-groups.png" alt="Category Group Listing" caption="Category Group listing in Doc Item Maintenance Applet." >}}

#### Step 4: View Categories
Go to the Categories Menu to see specific categories linked to items.
Each item is associated with up to 20 category groups.
For example, category group 1 = PRODUCT_DIVISION, category group 5 = PRODUCT_TYPE, etc.
These mappings can be cross-referenced in the Settings page.

{{< figure src="/static/images/pdg-applet/category-group-mapping.png" alt="Category Group Mapping" caption="Category group mapping in Settings page." >}}

#### Step 5: View Item Details
Click on any item in the Item Menu to see its detailed category assignments.
Example: An item's product type might be W/BOT, as shown in the screenshot.

{{< figure src="/static/images/pdg-applet/item-edit-category.png" alt="Item Edit - Category Assignment" caption="Item Edit: View category assignments." >}}

---

## 3.0 PDG Listing

### 3.1 PDG Creation
To create a new Product Distribution Guide (PDG):
Click the “Create” button at the top-left corner of the PDG page.

{{< figure src="/static/images/pdg-applet/pdg-listing-create.png" alt="PDG Listing - Create" caption="Create new PDG in PDG Listing." >}}

Fill in the following details:
- PDG Name
- PDG Code
- Description (optional)
- Outlet Type
- Outlet Size
- Effective Date and End Date
- Select a Category Group Filter (e.g., PRODUCT_DEPARTMENT, PRODUCT_TYPE)

{{< figure src="/static/images/pdg-applet/pdg-edit-details.png" alt="Edit PDG Details" caption="Edit PDG: Enter details for PDG." >}}

⚠️ Note: The system will only generate combinations of the selected category groups that are actually used by at least one item. This is done to enhance performance and avoid displaying meaningless combinations.

#### Editing a PDG
After creation, go to Edit PDG to:
- Modify the PDG name or code.
- Add or remove category combinations.
Successfully added combinations will be displayed under the Guide Tab.

{{< figure src="/static/images/pdg-applet/pdg-edit-guide.png" alt="Edit PDG Guide Tab" caption="Guide tab: Category combinations in PDG." >}}

#### Setting Quantity
The category combinations (e.g., PRODUCT_DEPARTMENT + PRODUCT_TYPE) are displayed.
For each outlet size and type (e.g., <5K - Basic), you can double-click the quantity cell to update the recommended quantity for display.

{{< figure src="/static/images/pdg-applet/pdg-edit-quantity.png" alt="Edit PDG Quantity" caption="Set recommended quantity in PDG." >}}

---

### 3.2 OPDG Creation (Via PDG Selection)

To create an Outlet Product Distribution Guide (OPDG) based on an existing PDG:
Navigate to the Outlet Guide tab within the PDG.
Click “Create” to generate a new OPDG for the selected PDG.

Once created, open the OPDG for editing. You will find two tabs: Set Outlet and OPDG Chart.

#### Set Outlet Tab
Here you can view and update:
- OPDG Name
- OPDG Code
- Outlet Information (e.g., AEON SEREMBAN 2)

{{< figure src="/static/images/pdg-applet/opdg-set-outlet-empty.png" alt="Set OPDG Outlet - Empty" caption="Set OPDG Outlet: Empty state example." >}}
{{< figure src="/static/images/pdg-applet/opdg-set-outlet-filled.png" alt="Set OPDG Outlet - Filled" caption="Set OPDG Outlet: Filled example." >}}

#### OPDG Chart Tab
This section displays the category combinations inherited from the PDG.
You can view the recommended PDG quantities (read-only here).
You must set the OPDG quantity first before selecting whether the item requires a Brand Corner.

{{< figure src="/static/images/pdg-applet/opdg-chart.png" alt="OPDG Chart Tab" caption="OPDG Chart: Set OPDG quantities." >}}

#### Brand Corner Setup
Set the OPDG quantity (e.g., 10).
Set Brand Corner to Y (Yes).
Once you choose Y, the Brand Corner tab will automatically open.

{{< figure src="/static/images/pdg-applet/opdg-by-brands.png" alt="OPDG By Brands" caption="OPDG By Brands: Allocate by brand." >}}

In the Opdg By Brands tab:
- Add rows for each brand by clicking the ‘Add’ Button.
- Double-click on the Brand column in each row to open the dropdown list.
- Select the correct brand from the dropdown (manual typing is no longer allowed).
- Enter the quantity for each brand.
- The sum of brand quantities must exactly match the OPDG quantity.

Example: OPDG Quantity = 10
LG = 4
SAM = 6
Total = 10 ✅

If Brand Corner is set to N:
- You only need to enter the total OPDG quantity.
- No brand-level breakdown is required.

---

## 4.0 OPDG Outlet Listing

The OPDG Outlet Listing displays all OPDGs assigned to various outlets.
As shown in the example (e.g., for L BEST POINT CLP TEST), you can view the outlet type and outlet size directly from the listing.

{{< figure src="/static/images/pdg-applet/opdg-outlet-listing.png" alt="OPDG Outlet Listing" caption="OPDG Outlet Listing: All OPDGs by outlet." >}}

To view or edit an OPDG:
Click on the desired OPDG from the outlet listing.
You will be redirected to the OPDG PDG Listing view, which shows the PDG linked to that outlet.
Clicking on the linked PDG opens two familiar tabs:
- Set Outlet
- OPDG Chart

{{< figure src="/static/images/pdg-applet/opdg-pdg-listing.png" alt="OPDG PDG Listing" caption="OPDG PDG Listing: Linked PDG view." >}}
{{< figure src="/static/images/pdg-applet/opdg-pdg-chart.png" alt="OPDG PDG Chart" caption="OPDG PDG Chart: Chart tab for OPDG." >}}

These tabs are functionally identical to those described in Section 3.2. Please refer back to that section for detailed guidance on modifying the OPDG.

### 4.2 OPDG Creation via Outlet Listing (Manual Size & Type Setting)

This method allows you to create an OPDG by setting the outlet type and outlet size directly at the time of creation.

#### Steps:
Navigate to the OPDG Outlet Listing.
Click “Create”.
Fill in the following details:
- OPDG Name
- OPDG Code
- Select Outlet
- Outlet Type (e.g., Basic, Premium)
- Outlet Size (e.g., <5K, 5–7K, etc.)

{{< figure src="/static/images/pdg-applet/opdg-add.png" alt="Add OPDG" caption="Add OPDG: Enter details." >}}

🔁 Note: If the outlet already has a previously assigned type and size, and you attempt to assign a different configuration, the system will prompt:

{{< figure src="/static/images/pdg-applet/opdg-confirmation.png" alt="OPDG Confirmation" caption="Confirmation prompt for changing outlet type/size." >}}

“Do you wish to change the outlet size and outlet type for this location? Please note that this will delete all OPDGs linked to the location due to the changes in outlet size and type.”

Selecting “No” cancels the process, allowing you to review or correct the outlet information.
Selecting “Yes” will delete all existing OPDGs linked to that outlet and proceed with the update.

After Successful Save:
The system will show a PDG listing that matches the newly selected outlet type and size.
Select the appropriate PDG to proceed.

{{< figure src="/static/images/pdg-applet/pdg-listing-matching.png" alt="PDG Listing Matching" caption="PDG listing matching outlet type/size." >}}

After selecting the PDG, you will gain access to:
- Set Location Tab
- OPDG Chart Tab
- Set Outlet Tab

Here you can view and update:
- OPDG Name
- OPDG Code
- Outlet Information 

{{< figure src="/images/pdg-applet/opdg-set-outlet-filled.png" alt="Set OPDG Outlet - Filled" caption="Set OPDG Outlet: Filled example." >}}

#### OPDG Chart Tab
This section displays the category combinations inherited from the PDG.
You can view the recommended PDG quantities (read-only here).
You must set the OPDG quantity first before selecting whether the item requires a Brand Corner.

{{< figure src="/images/pdg-applet/opdg-chart.png" alt="OPDG Chart Tab" caption="OPDG Chart: Set OPDG quantities." >}}

#### Brand Corner Setup
Set the OPDG quantity (e.g., 10).
Set Brand Corner to Y (Yes).
Once you choose Y, the Brand Corner tab will automatically open.

{{< figure src="/images/pdg-applet/opdg-by-brands.png" alt="OPDG By Brands" caption="OPDG By Brands: Allocate by brand." >}}

In the Opdg By Brands tab:
- Add rows for each brand by clicking the ‘Add’ Button.
- Double-click on the Brand column in each row to open the dropdown list.
- Select the correct brand from the dropdown (manual typing is no longer allowed).
- Enter the quantity for each brand.
- The sum of brand quantities must exactly match the OPDG quantity.

Example: OPDG Quantity = 10
LG = 4
SAM = 6
Total = 10 ✅

If Brand Corner is set to N:
- You only need to enter the total OPDG quantity.
- No brand-level breakdown is required.

---

## 5.0 PDG Import/Upload

📥 This section is intended for uploading PDG templates only.

#### Step 1: Navigate to File Import
In the PDG Applet, go to the third menu tab titled “File Import.”
Click to upload the PDG template file (in the prescribed Excel format).

{{< figure src="/static/images/pdg-applet/file-import-listing.png" alt="File Import Listing" caption="File Import: Upload and monitor PDG templates." >}}

#### Step 2: Understand the PDG Template Format
The PDG upload template contains two major sections:
Header Fields:
- PDG Name
- PDG Code
- Create Date
- Modified Date
- Effective Date
- End Date
- Status

Line Item Fields (PDG Line Items):
- No – Row number (for reference only)
- GROUP – Category Group (e.g., S9 for Product Department)
- S5 – Product Group
- Product Category
- Outlet Type (e.g., B, P, SP)
- Outlet Size (e.g., <5K, 5–7K, etc.)
- Quantity – Recommended display quantity

{{< figure src="/static/images/pdg-applet/pdg-upload-template.png" alt="PDG Upload Template" caption="PDG upload template format (Excel)." >}}

📊 Tip: Make sure combinations are valid (i.e., they exist in the system and are assigned to at least one item), or the upload may fail.

#### Step 3: Monitor Upload Results
After uploading, each file will appear in the listing with a processing status.
Click into a listing to view:
- Detailed upload results
- Success or failure reasons for each row (e.g., missing fields, invalid combinations)
A successful upload will be indicated clearly with a processed status in the listing.

{{< figure src="/static/images/pdg-applet/file-import-errors.png" alt="File Import Errors" caption="File Import: View upload errors and results." >}}

---

## 6.0 Applet Installation Guide

🛠️ This section is intended for Platform ADMIN users.
To access and use PDG-related functionalities, the required applets must be installed for relevant users via the Platform Sysadmin Applet.

#### Step-by-Step Guide:

**Step 1: Locate the PDG Catalog**
Go to Platform Sysadmin Applet > Catalogue Listing.
Search for “Senheng PDG Catalog” and click into it.

{{< figure src="/static/images/pdg-applet/catalogue-listing.png" alt="Catalogue Listing" caption="Catalogue Listing: Find Senheng PDG Catalog." >}}

**Step 2: Add Users to the Catalogue**
Select the User Tab.
Click “Invite” or “Add” to assign users who need access to PDG applets.

{{< figure src="/static/images/pdg-applet/catalogue-add-user.png" alt="Add User to Catalogue" caption="Add users to the PDG catalogue." >}}

**Step 3: Install Applets for Users**
Go to the Applet Tab within the catalog.
Click on the desired PDG Applet.
Under the Installed by User Tab, add users to trigger applet installation on their platform view.

{{< figure src="/static/images/pdg-applet/catalogue-install-applet.png" alt="Install Applet for Users" caption="Install PDG Applet for users." >}}

**Step 4: Assign User Roles**
Link each user to the appropriate user role that includes PDG permissions.
This ensures they have sufficient access rights to view, edit, and manage the PDG applet functionalities.
✅ Once the above are complete, these users will be able to view and interact with PDG and OPDG applets on their platform.

{{< figure src="/static/images/pdg-applet/applet-settings-role-permission.png" alt="Applet Settings - Role Permission" caption="Assign user roles for PDG applet access." >}}
{{< figure src="/static/images/pdg-applet/applet-details-installed-users.png" alt="Applet Details - Installed by User" caption="Applet Details: Users with applet installed." >}}

**Alternative Installation Method:**
If you prefer to streamline the process, the BigLedger team can directly send email invitations:
Provide the user emails to the BigLedger team.
Invited users will receive registration links.
Upon logging in, the PDG applet will already be installed, and the necessary permissions will be automatically applied.

---


