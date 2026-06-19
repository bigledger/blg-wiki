---
title: "CP-Commerce Menu & Pages Configuration"
description: "Configure website menus and static pages in CP-Commerce for your e-commerce storefront"
weight: 25
---

CP-Commerce provides flexible tools for managing your e-commerce website's navigation menus and static content pages. This guide covers the Menu Module and Pages Module configuration.

## Menu Module

The Menu Module controls the navigation structure of your CP-Commerce website, allowing you to create hierarchical menus with various link types.

### Understanding Menu Structure

Menu items in CP-Commerce support:
- **Multi-level hierarchy** - Create parent and child menu items
- **Multiple link types** - Link to pages, products, categories, or external URLs
- **Flexible positioning** - Control menu order and nesting
- **Conditional display** - Active/inactive status control

### Menu Listing View

The menu listing displays:

| Column | Description |
|--------|-------------|
| **Title** | Name of the menu item displayed to users |
| **Menu Level** | Hierarchy level (1 = top level, 2 = sub-menu, etc.) |
| **Linked** | Type of link and destination |
| **Status** | Active or Inactive |
| **Actions** | Edit, Delete, Reorder |

### Creating Menu Items

#### Step 1: Basic Information

1. Navigate to **CP-Commerce** > **Menu Module**
2. Click **"Create New Menu Item"**
3. Fill in the required fields:

**Title**: The display name for the menu item
- Keep it concise and descriptive
- Use action words for better UX (e.g., "Shop Now", "View Categories")

#### Step 2: Configure Link Type

**Link Type** determines the menu item's behavior:

| Type | Description | Use Case |
|------|-------------|----------|
| **Page** | Links to static page created in Pages Module | About Us, Terms, Privacy |
| **Product** | Direct link to specific product | Featured items, Bestsellers |
| **Product Category** | Links to category listing | Shop by Department |
| **Content Category** | Links to content collections | Blog, News, Resources |
| **External Link** | Links to external URL or custom page | Social media, Partner sites |

#### Step 3: Link Configuration

Based on the selected Link Type:

- **For Page**: Select from dropdown of created pages
- **For Product**: Search and select specific product
- **For Product Category**: Choose from category tree
- **For Content Category**: Select content category
- **For External Link**: Enter full URL (https://...)

#### Step 4: Display Settings

**Status**: 
- Active - Menu item is visible
- Inactive - Hidden from website

**Redirect Type**:
- Same Window - Opens in current tab (default)
- New Window - Opens in new tab (for external links)

#### Step 5: Menu Hierarchy

**Nest Menu Item**: Check to make this a sub-menu item

If nesting is enabled:
- **Parent Menu**: Select the parent menu item
- The item will appear as a dropdown under the parent

### Menu Hierarchy Example

```
Home (Level 1)
Shop (Level 1)
├── Electronics (Level 2)
│   ├── Computers (Level 3)
│   ├── Mobile Phones (Level 3)
│   └── Accessories (Level 3)
├── Fashion (Level 2)
│   ├── Men's Clothing (Level 3)
│   └── Women's Clothing (Level 3)
└── Clearance (Level 2)
About Us (Level 1)
Contact (Level 1)
```

## Pages Module

The Pages Module allows creation of static content pages for your CP-Commerce website, perfect for information pages, policies, and custom content.

### Creating Static Pages

#### Step 1: Page Setup

1. Navigate to **CP-Commerce** > **Pages Module**
2. Click **"Create New Page"**

#### Step 2: Page Configuration

**Title**: The page title
- Displayed in browser tab
- Used in page headers
- Important for SEO

**URL Key**: The page's web address
- Must be unique
- Use lowercase letters and hyphens
- Example: `about-us`, `return-policy`, `shipping-info`

**Status**:
- Active - Page is accessible
- Inactive - Page is hidden (useful for drafts)

**Content Category**: (Optional)
- Group related pages
- Helps with organization
- Can be used for automated menus

#### Step 3: Page Content

**Content Editor**:
- Supports HTML and plain text
- Rich text formatting available
- Can include:
  - Text and headings
  - Images and media
  - Tables and lists
  - Custom HTML/CSS

### Common Static Pages

#### Essential Pages

1. **About Us**
   - Company history
   - Mission and values
   - Team information

2. **Terms & Conditions**
   - Service terms
   - User agreements
   - Legal disclaimers

3. **Privacy Policy**
   - Data collection practices
   - User rights
   - Cookie policy

4. **Shipping Information**
   - Delivery zones
   - Shipping rates
   - Estimated times

5. **Return Policy**
   - Return conditions
   - Process steps
   - Refund timeline

#### Marketing Pages

1. **Landing Pages**
   - Campaign-specific content
   - Product launches
   - Seasonal promotions

2. **FAQ Pages**
   - Common questions
   - Product guides
   - Support information

### Content Best Practices

#### SEO Optimization

- Use descriptive titles with keywords
- Create unique URL keys
- Include meta descriptions
- Use proper heading hierarchy (H1, H2, H3)

#### Content Structure

```html
<h1>Page Title</h1>
<p>Introduction paragraph...</p>

<h2>Section Heading</h2>
<p>Section content...</p>

<h3>Subsection</h3>
<ul>
  <li>Point 1</li>
  <li>Point 2</li>
</ul>
```

#### Mobile Responsiveness

- Test content on mobile devices
- Use responsive images
- Avoid complex tables
- Keep paragraphs short

## Integration Tips

### Linking Menus to Pages

1. Create the page first in Pages Module
2. Set page status to Active
3. Create menu item with Link Type = Page
4. Select the created page from dropdown

### Dynamic Content Integration

While Pages Module creates static content, you can enhance with:
- Product widgets
- Category listings
- Newsletter signup forms
- Contact forms

### Multi-language Support

For multi-language sites:
1. Create separate pages for each language
2. Use language-specific URL keys
3. Organize with content categories by language

## Troubleshooting

### Menu Not Appearing

- Check menu status is Active
- Verify parent menu (if nested) is Active
- Clear website cache
- Check user permissions

### Page Not Found (404)

- Verify URL key is correct
- Ensure page status is Active
- Check for duplicate URL keys
- Clear browser cache

### Content Not Updating

- Clear CP-Commerce cache
- Check if changes were saved
- Verify you're editing the correct page
- Try hard refresh (Ctrl+F5)

## Related Documentation

- [CP-Commerce Overview](/modules/ecommerce/cp-commerce/)
- [Website Configuration](/modules/ecommerce/website-configuration/)
- [E-Commerce Integration](/modules/ecommerce/)
- [Content Management Best Practices](/user-guide/)