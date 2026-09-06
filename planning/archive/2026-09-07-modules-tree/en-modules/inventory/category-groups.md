---
title: "Category Groups Management"
description: "Organize and manage product categories with BigLedger's category groups system"
weight: 30
---

Category Groups provide a hierarchical structure for organizing your inventory categories in BigLedger. This system helps maintain consistency across your product catalog and simplifies inventory management.

## Overview

Under category groups, users can create and edit categories and specify relationships between category groups and individual categories. When creating items in the Item menu, you specify their category assignment.

{{< callout type="info" >}}
**Note**: Category groups and item categories can be managed from both Document Item Maintenance and Inventory Item Maintenance applets. Every category is linked to a Category Group for better organization.
{{< /callout >}}

## Creating Category Groups

### Step 1: Access Category Groups

1. Navigate to **Inventory** > **Category Groups**
2. Click the **"+"** button to create a new category group
3. A third container will open for category group creation

### Step 2: Fill in Category Group Details

Complete these required fields in the main tab:

| Field | Description | Example |
|-------|-------------|---------|
| **Category Group Code** | Unique identifier for the group | `ELEC`, `FURN`, `FOOD` |
| **Category Group Name** | Descriptive name for the group | `Electronics`, `Furniture`, `Food & Beverage` |
| **Type** | Classification type | `Product`, `Service`, `Raw Material` |
| **Param Code** | Parameter code for system integration | Optional |
| **Param Name** | Parameter description | Optional |
| **Status** | Active/Inactive status | `Active` |

### Step 3: Save Category Group

Click **Save** to create the category group. The system will validate for duplicate codes and required fields.

## Editing Category Groups

### Accessing Edit Mode

1. Click on any category group in the listing
2. A second container opens with category group details
3. Two tabs are available for editing

### Main Tab

The Main tab displays all information entered during category creation:

- Edit category group properties
- Update status (Active/Inactive)
- Delete category group (if no categories are linked)

{{< callout type="warning" >}}
**Caution**: Deleting a category group will affect all linked categories. Ensure no active items are using these categories before deletion.
{{< /callout >}}

### Categories Tab

The Categories tab shows all linked categories within the group:

- View all categories in the group
- Add new categories
- Edit existing categories
- Remove category associations

## Managing Categories

### Creating Categories

To add categories to a group:

1. Open the category group
2. Navigate to the **Categories** tab
3. Click the **"+"** button
4. Fill in category details:
   - Category Code
   - Category Name
   - Description
   - Sort Order
   - Status

### Editing/Deleting Categories

Access category details by clicking on any category in the list:

1. **Main Tab**: Edit category properties
   - Update category information
   - Change status
   - Delete category

2. **Manage Image Tab**: Handle category images
   - Upload category images
   - Replace existing images
   - Support for multiple image formats (JPG, PNG, GIF)
   - Recommended image size: 500x500 pixels

## Best Practices

### Naming Conventions

- Use consistent coding patterns (e.g., `ELEC-001`, `ELEC-002`)
- Keep names descriptive but concise
- Avoid special characters in codes

### Category Hierarchy

Example structure:
```
Electronics (ELEC)
├── Computers (ELEC-COMP)
│   ├── Laptops (ELEC-COMP-LAP)
│   ├── Desktops (ELEC-COMP-DSK)
│   └── Tablets (ELEC-COMP-TAB)
├── Mobile Devices (ELEC-MOB)
│   ├── Smartphones (ELEC-MOB-PHN)
│   └── Accessories (ELEC-MOB-ACC)
└── Audio/Video (ELEC-AV)
    ├── Televisions (ELEC-AV-TV)
    └── Sound Systems (ELEC-AV-SND)
```

### Maintenance Tips

1. **Regular Review**: Periodically review category structures
2. **Consolidation**: Merge similar categories to avoid duplication
3. **Documentation**: Maintain a category guide for staff reference
4. **Training**: Ensure staff understand category assignment rules

## Integration with Other Modules

Category Groups integrate with:

- **Inventory Management**: Product classification
- **Purchasing**: Vendor category preferences
- **Sales**: Category-based promotions
- **Reporting**: Category performance analysis
- **E-Commerce**: Online store navigation

## Common Use Cases

### Retail Operations
- Department-based categorization
- Seasonal product grouping
- Brand-based organization

### Manufacturing
- Raw material classification
- Finished goods categorization
- Component grouping

### Services
- Service type categorization
- Skill-based grouping
- Time-based service classification

## Troubleshooting

### Cannot Delete Category Group
- Check for linked categories
- Verify no active items use the categories
- Review any pending transactions

### Category Not Appearing in Item Creation
- Confirm category status is Active
- Check category group status
- Verify user permissions

### Image Upload Issues
- Check file format (JPG, PNG, GIF)
- Verify file size (< 5MB recommended)
- Clear browser cache

## Related Documentation

- [Item Maintenance](/user-guide/item-maintenance/)
- [Document Item Types](/user-guide/document-item-types/)
- [Inventory Management](/modules/inventory/)
- [Price Book Configuration](/user-guide/price-book/)