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

---

## Purpose and Overview

The **PDG Applet** (Product Distribution Guide) and **OPDG Applet** (Outlet Product Distribution Guide) are designed to streamline and optimize product display planning and outlet-specific distribution management across all Senheng outlets.

{{< callout type="info" >}}
**Core Concept**: PDG defines the recommended display quantity for each item by outlet type and size. OPDG enables outlet managers to tailor and execute these plans for their specific location.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Outlet Managers & Staff:**
- Quickly configure outlet-specific product displays
- Ensure compliance with company display standards
- Easily adjust for outlet type and size

**Head Office & Planners:**
- Centralized control of display guidelines
- Efficient rollout of new display plans
- Data-driven planning by outlet segmentation

**IT & Admin Teams:**
- Streamlined applet installation and user management
- Role-based access and permissions

### What Problems Does This Solve?

**The Manual Display Planning Problem:**

Traditional product display planning is manual, error-prone, and inconsistent across outlets. Common issues include:
- Lack of standardization by outlet type/size
- Time-consuming updates for new products or promotions
- Difficult tracking of compliance and execution
- No easy way to tailor plans for unique outlet needs

**The PDG/OPDG Applet Solution:**
- **Centralized guidelines** – Define display rules once, apply everywhere
- **Outlet-specific planning** – Managers can adjust for local needs
- **Category-driven** – Plan by product group, type, or brand
- **Easy import/upload** – Bulk update plans via Excel
- **Full traceability** – Audit who changed what, when

## Key Features Overview

{{< cards >}}
	{{< card title="Outlet Type & Size Management" subtitle="Categorize outlets for tailored planning" link="#outlet-type-and-size" >}}
	{{< card title="Category Grouping" subtitle="Plan by product group, type, or brand" link="#items-category-groups" >}}
	{{< card title="PDG Creation & Editing" subtitle="Define and update display guidelines" link="#pdg-listing" >}}
	{{< card title="OPDG Creation & Customization" subtitle="Outlet-specific execution and adjustment" link="#opdg-creation" >}}
	{{< card title="Import/Upload" subtitle="Bulk update plans via Excel" link="#pdg-importupload" >}}
	{{< card title="Installation & Permissions" subtitle="Easy applet setup and user roles" link="#applet-installation-guide" >}}
{{< /cards >}}

{{< figure src="/screenshots/pdg-applet/location-listing.png" alt="Location Listing" caption="Organization Applet: Location listing for outlets." >}}

---

## Key Concepts

### Outlet Type and Size {#outlet-type-and-size}

Each outlet is categorized by type (e.g., Basic, Premium, Super Premium) and size (e.g., <5K, 5K–7K, etc.) to ensure appropriate product distribution.

{{< figure src="/screenshots/pdg-applet/applet-settings-outlet-type.png" alt="Outlet Type Listing" caption="Outlet Type listing in Applet Settings." >}}
{{< figure src="/screenshots/pdg-applet/applet-settings-outlet-size.png" alt="Outlet Size Listing" caption="Outlet Size listing in Applet Settings." >}}
{{< figure src="/screenshots/pdg-applet/location-edit.png" alt="Edit Location - Assign Type and Size" caption="Edit Location: Assign outlet type and size." >}}

### Items Category Groups {#items-category-groups}

Product categorization is structured using category groups, categories, and items. This enables granular planning and reporting.

{{< figure src="/screenshots/pdg-applet/doc-item-maintenance-items.png" alt="Items Listing" caption="Doc Item Maintenance Applet: Items listing." >}}
{{< figure src="/screenshots/pdg-applet/doc-item-maintenance-category-groups.png" alt="Category Group Listing" caption="Category Group listing in Doc Item Maintenance Applet." >}}
{{< figure src="/screenshots/pdg-applet/category-group-mapping.png" alt="Category Group Mapping" caption="Category group mapping in Settings page." >}}
{{< figure src="/screenshots/pdg-applet/item-edit-category.png" alt="Item Edit - Category Assignment" caption="Item Edit: View category assignments." >}}

---

## PDG Listing {#pdg-listing}

### PDG Creation & Editing

Create a new Product Distribution Guide (PDG) to define display rules by outlet type, size, and product category.

{{< figure src="/screenshots/pdg-applet/pdg-listing-create.png" alt="PDG Listing - Create" caption="Create new PDG in PDG Listing." >}}
{{< figure src="/screenshots/pdg-applet/pdg-edit-details.png" alt="Edit PDG Details" caption="Edit PDG: Enter details for PDG." >}}
{{< figure src="/screenshots/pdg-applet/pdg-edit-guide.png" alt="Edit PDG Guide Tab" caption="Guide tab: Category combinations in PDG." >}}
{{< figure src="/screenshots/pdg-applet/pdg-edit-quantity.png" alt="Edit PDG Quantity" caption="Set recommended quantity in PDG." >}}

> ⚠️ **Tip:** The system only generates combinations of selected category groups that are actually used by at least one item, for performance and clarity.

---

## OPDG Creation & Customization {#opdg-creation}

Create an Outlet Product Distribution Guide (OPDG) based on a PDG, then tailor it for a specific outlet.

{{< figure src="/screenshots/pdg-applet/opdg-set-outlet-empty.png" alt="Set OPDG Outlet - Empty" caption="Set OPDG Outlet: Empty state example." >}}
{{< figure src="/screenshots/pdg-applet/opdg-set-outlet-filled.png" alt="Set OPDG Outlet - Filled" caption="Set OPDG Outlet: Filled example." >}}
{{< figure src="/screenshots/pdg-applet/opdg-chart.png" alt="OPDG Chart Tab" caption="OPDG Chart: Set OPDG quantities." >}}
{{< figure src="/screenshots/pdg-applet/opdg-by-brands.png" alt="OPDG By Brands" caption="OPDG By Brands: Allocate by brand." >}}

**Brand Corner Setup:**
- Set the OPDG quantity (e.g., 10)
- Set Brand Corner to Y (Yes) to allocate by brand
- Add rows for each brand and assign quantities (must total the OPDG quantity)
- If Brand Corner is N, just enter the total OPDG quantity

---

## OPDG Outlet Listing

View all OPDGs assigned to outlets, with type and size visible at a glance.

{{< figure src="/screenshots/pdg-applet/opdg-outlet-listing.png" alt="OPDG Outlet Listing" caption="OPDG Outlet Listing: All OPDGs by outlet." >}}
{{< figure src="/screenshots/pdg-applet/opdg-pdg-listing.png" alt="OPDG PDG Listing" caption="OPDG PDG Listing: Linked PDG view." >}}
{{< figure src="/screenshots/pdg-applet/opdg-pdg-chart.png" alt="OPDG PDG Chart" caption="OPDG PDG Chart: Chart tab for OPDG." >}}

---

## PDG Import/Upload {#pdg-importupload}

Bulk upload or update PDG templates using Excel for fast rollout.

{{< figure src="/screenshots/pdg-applet/file-import-listing.png" alt="File Import Listing" caption="File Import: Upload and monitor PDG templates." >}}
{{< figure src="/screenshots/pdg-applet/pdg-upload-template.png" alt="PDG Upload Template" caption="PDG upload template format (Excel)." >}}
{{< figure src="/screenshots/pdg-applet/file-import-errors.png" alt="File Import Errors" caption="File Import: View upload errors and results." >}}

---

## Applet Installation Guide {#applet-installation-guide}

Platform ADMIN users can install and assign the PDG/OPDG applets and permissions via the Platform Sysadmin Applet.

{{< figure src="/screenshots/pdg-applet/catalogue-listing.png" alt="Catalogue Listing" caption="Catalogue Listing: Find Senheng PDG Catalog." >}}
{{< figure src="/screenshots/pdg-applet/catalogue-add-user.png" alt="Add User to Catalogue" caption="Add users to the PDG catalogue." >}}
{{< figure src="/screenshots/pdg-applet/catalogue-install-applet.png" alt="Install Applet for Users" caption="Install PDG Applet for users." >}}
{{< figure src="/screenshots/pdg-applet/applet-settings-role-permission.png" alt="Applet Settings - Role Permission" caption="Assign user roles for PDG applet access." >}}
{{< figure src="/screenshots/pdg-applet/applet-details-installed-users.png" alt="Applet Details - Installed by User" caption="Applet Details: Users with applet installed." >}}

> **Alternative:** The BigLedger team can invite users by email for instant access and permissions.
## 5.0 PDG Import/Upload

📥 This section is intended for uploading PDG templates only.

#### Step 1: Navigate to File Import
In the PDG Applet, go to the third menu tab titled “File Import.”
Click to upload the PDG template file (in the prescribed Excel format).

{{< figure src="/screenshots/pdg-applet/file-import-listing.png" alt="File Import Listing" caption="File Import: Upload and monitor PDG templates." >}}

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

{{< figure src="/screenshots/pdg-applet/pdg-upload-template.png" alt="PDG Upload Template" caption="PDG upload template format (Excel)." >}}

📊 Tip: Make sure combinations are valid (i.e., they exist in the system and are assigned to at least one item), or the upload may fail.

#### Step 3: Monitor Upload Results
After uploading, each file will appear in the listing with a processing status.
Click into a listing to view:
- Detailed upload results
- Success or failure reasons for each row (e.g., missing fields, invalid combinations)
A successful upload will be indicated clearly with a processed status in the listing.

{{< figure src="/screenshots/pdg-applet/file-import-errors.png" alt="File Import Errors" caption="File Import: View upload errors and results." >}}

---

## 6.0 Applet Installation Guide

🛠️ This section is intended for Platform ADMIN users.
To access and use PDG-related functionalities, the required applets must be installed for relevant users via the Platform Sysadmin Applet.

#### Step-by-Step Guide:

**Step 1: Locate the PDG Catalog**
Go to Platform Sysadmin Applet > Catalogue Listing.
Search for “Senheng PDG Catalog” and click into it.

{{< figure src="/screenshots/pdg-applet/catalogue-listing.png" alt="Catalogue Listing" caption="Catalogue Listing: Find Senheng PDG Catalog." >}}

**Step 2: Add Users to the Catalogue**
Select the User Tab.
Click “Invite” or “Add” to assign users who need access to PDG applets.

{{< figure src="/screenshots/pdg-applet/catalogue-add-user.png" alt="Add User to Catalogue" caption="Add users to the PDG catalogue." >}}

**Step 3: Install Applets for Users**
Go to the Applet Tab within the catalog.
Click on the desired PDG Applet.
Under the Installed by User Tab, add users to trigger applet installation on their platform view.

{{< figure src="/screenshots/pdg-applet/catalogue-install-applet.png" alt="Install Applet for Users" caption="Install PDG Applet for users." >}}

**Step 4: Assign User Roles**
Link each user to the appropriate user role that includes PDG permissions.
This ensures they have sufficient access rights to view, edit, and manage the PDG applet functionalities.
✅ Once the above are complete, these users will be able to view and interact with PDG and OPDG applets on their platform.

{{< figure src="/screenshots/pdg-applet/applet-settings-role-permission.png" alt="Applet Settings - Role Permission" caption="Assign user roles for PDG applet access." >}}
{{< figure src="/screenshots/pdg-applet/applet-details-installed-users.png" alt="Applet Details - Installed by User" caption="Applet Details: Users with applet installed." >}}

**Alternative Installation Method:**
If you prefer to streamline the process, the BigLedger team can directly send email invitations:
Provide the user emails to the BigLedger team.
Invited users will receive registration links.
Upon logging in, the PDG applet will already be installed, and the necessary permissions will be automatically applied.

---


