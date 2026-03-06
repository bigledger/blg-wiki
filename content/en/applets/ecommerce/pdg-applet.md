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
weight: 161
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


## OPDG Report Listing

This report provides a detailed view of each outlet's OPDG quantity, the corresponding PDG quantity, brand, and brand quantity. It helps managers and planners track product distribution at a granular level for every outlet.

{{< figure src="/screenshots/pdg-applet/opdg-report-listing.png" alt="OPDG Report Listing" caption="OPDG Report Listing: See OPDG QTY, PDG QTY, Brand, and Brand QTY for each outlet." >}}

**Report Columns:**
- Outlet Name
- Outlet Code
- Description
- Outlet Size
- Outlet Type
- Product Department
- Product Type
- PDG QTY (Recommended display quantity from PDG)
- OPDG QTY (Actual quantity set for outlet)
- Brand
- Brand QTY (Quantity allocated per brand)

This listing allows you to:
- Compare OPDG QTY vs PDG QTY for compliance and adjustments
- See brand-level allocations for each outlet
- Filter and sort by outlet, product group, or brand
- Audit and review distribution plans across all outlets

Use this report to ensure each outlet is following the recommended guidelines and to quickly identify any discrepancies or customizations made at the outlet level.

---

## PDG Import/Upload {#pdg-importupload}

Bulk upload or update PDG templates using Excel for fast rollout.

{{< figure src="/screenshots/pdg-applet/file-import-listing.png" alt="File Import Listing" caption="File Import: Upload and monitor PDG templates." >}}
{{< figure src="/screenshots/pdg-applet/pdg-upload-template.png" alt="PDG Upload Template" caption="PDG upload template format (Excel)." >}}
{{< figure src="/screenshots/pdg-applet/file-import-errors.png" alt="File Import Errors" caption="File Import: View upload errors and results." >}}

---



