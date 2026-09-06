---
title: "CP Commerce Admin"
description: "Reference for the CP Commerce Admin applet: the tenant-side console that configures Customer Portal websites and mobile apps — pricing, menus, layouts, sign-in providers, forms, notifications, spending limits, facilities and events — its menus, every configuration screen, fields and known failure modes."
applet_code: "cp_commerce_admin_console_v1"
applet_repo: "blg-applets-wavelet-cp-commerce"
modules: [ecommerce, membership]
related_applets:
  - shopping-cart-applet
  - internal-shopping-cart-customer-access-applet
  - ecommerce-catalog-applet
  - seller-admin-applet
  - pdg-applet
  - membership-admin-applet
  - voucher-management-applet
  - commission-scheme-applet
  - events-management-applet
  - customer-applet
  - organisation-applet
  - doc-item-maintenance-applet
  - pricebook-applet
  - shipping-pricebook-applet
  - cashbook-applet
guides: []
sources:
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/models/menu-items.ts
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/app.routing.ts
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/settings-container/default-settings/
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/website-edit.component.html
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/website-edit.component.ts
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/post-registration-config/
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/third-party-config/
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/app-version/
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/spending-limit-container/
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/shipping-provider-container/
  - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/dynamic-form-container/
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - akaun_master.bl_applet_client_side_perm_dfn (applet code cp_commerce_admin_console_v1 — no rows)
tags:
- ecommerce
- customer-portal
- website-builder
- b2b-commerce
- event-management
- dynamic-forms
- shipping-provider
- mobile-app-management
weight: 10
lastmod: 2026-09-05
---

## Overview

The **CP Commerce Admin** applet is the tenant-side console behind every Customer Portal (CP) storefront — the website and mobile app where customers browse, register, order, book activities and read your content. Marketing, e-commerce and operations staff open it to configure a **Website** (pricing model, menus, layouts, sign-in providers, shipping, legal agreements, linked accounts), and to run the surrounding services: rating configuration, newsletter topics, push notifications, template and dynamic forms, B2B spending limits, blocked customers, and the facilities / activities / events / calendar booking engine.

It is a configuration applet, not a document applet: nothing here posts to stock or the General Ledger. The orders that customers place arrive as sales documents through the [Shopping Cart](/applets/ecommerce/shopping-cart-applet/) and the portal's checkout, and the products they see come from the item master and the pricing scheme or price book you assign to the website.

{{< figure src="/images/cp-commerce/cp-commerce-overview-infographic.jpg" alt="CP Commerce Admin Applet Overview" caption="The admin console configures the Website Builder and the external Customer Portal front end." >}}

## Where it fits

| Position | Applet / system | Why |
|---|---|---|
| Module | [E-Commerce](/modules-v2/ecommerce/), [Membership](/modules-v2/membership/) | Storefront configuration; post-registration can create members and customers. |
| Front end | Customer Portal web and mobile app (the `wavelet-cp-commerce` cross-platform app); the **Website Builder** dashboard the applet opens | Reads the website's layouts, menus, images, agreements and auth configuration configured here. |
| Master data | [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Shipping Pricebook](/applets/master-data/shipping-pricebook-applet/), [Cashbook](/applets/master-data/cashbook-applet/) | Branch and merchant, items, pricing schemes / price books, shipping price books, settlement methods. |
| Customers and members | [Customer](/applets/master-data/customer-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) | Post Registration Config creates the customer and/or membership; the Account tab links entities to a gated website; Spending Limit applies per member class. |
| Promotions | [Voucher Management](/applets/membership/voucher-management-applet/), [Commission Scheme](/applets/membership/commission-scheme-applet/) | Linked to a website on their own tabs. |
| Orders | [Shopping Cart](/applets/ecommerce/shopping-cart-applet/), [Shopping Cart Customer Access](/applets/ecommerce/internal-shopping-cart-customer-access-applet/) | Checkout produces the sales order; the website's *Sales Order Printable Format* is used for the customer's order document. |
| Catalogue | [E-Commerce Catalog](/applets/ecommerce/ecommerce-catalog-applet/), [PDG](/applets/ecommerce/pdg-applet/), [Seller Admin](/applets/ecommerce/seller-admin-applet/) | Product data shown on the storefront. |
| Events | [Events Management](/applets/crm/events-management-applet/) | Fuller event workflow; this applet's Activities group covers facilities, activities, calendars and scheduling for the portal. |

## Screens and menus

Sidebar menus as defined in the applet (the *Review*, *Shipping Provider* and *Users* entries are commented out in the current build — their screens still exist and open from the routes `review`, `shipping-provider` and `users`, but they are not in the sidebar):

| Menu | Route | What it is |
|---|---|---|
| **Website** | `website` | Listing, create and the 21-tab edit screen for each storefront — the core of the applet. |
| **Rating Configuration** | `rating` | Star-rating records and their configuration. |
| **Topics** | `newsletter-topic` | Newsletter topics with subscribers and member-label links. |
| **Notification** | `notification` | Push notifications with scheduling and posts. |
| **Forms → Template Forms, Submitted Forms** | `template-form`, `submitted-form` | Reusable form templates and the inbox of submitted responses. |
| **Dynamic Forms** | `dynamic-form` | Questionnaire builder with Question and Response tabs. |
| **Spending Limit** | `spending-limit` | B2B spending caps per member class. |
| **Blocked Customers** | `blocked-customers` | Portal blacklist. |
| **Facilities** | `facilities` | Bookable spaces with activities, events and a media library. |
| **Audit Trail** | `audit-trail` | Change log (added August 2026). |
| **Activities → Activity, Activity Category, Calendars, Events, Scheduler** | `activity`, `activity-category`, `calendars`, `events`, `schedule` | The booking engine. |
| *(not in sidebar)* Review, Shipping Provider, Users | `review`, `shipping-provider`, `users` | Review moderation, 3PL shipping methods, portal user listing. |
| **Settings** | `settings/…` | Field Settings, Default Selection; also Webhook, Feature Visibility, Permission Set / User / Team / Role Permission listings. |
| **Personalization** | `personalization/…` | Field Settings, Default Selection, Sidebar. |

### The Webstore Management Dashboard (Website Builder button)

**Goal:** Provide Store Managers a unified, simplified front-end console to configure their website without needing to navigate the complex backend ERP menus.

When an administrator clicks the **Website Builder** button from the backend (or navigates to `https://[your-store-url]/page/website-builder/layout-menu/webstore`), they are greeted by the **Webstore Management Dashboard**.

This dashboard acts as an aggregated shortcut center, presenting the most critical e-commerce configuration tools as large, easy-to-click tiles.

![Webstore Dashboard Interface](/images/cp-commerce/webstore-dashboard.png)

#### The 10 Dashboard Tiles

| Dashboard Tile | Purpose & Benefit | Corresponding Backend Module |
|----------------|-------------------|------------------------------|
| **Menu Manager** | Allows store managers to visually build and link the site navigation (Top Menus, Footer Menus, Sidebars) directly within the frontend context. **Benefit:** Instant routing updates without backend catalog searches. | CP Commerce Admin -> Menu List |
| **Layout Manager** | The gateway to the visual drag-and-drop page editor. **Benefit:** Enables marketing teams to instantly redesign the homepage, landing pages, or product grids without writing code. | CP Commerce Admin -> Layout Instance |
| **Image Manager** | A centralized visual media library for the website. **Benefit:** Store managers can upload banners, logos, and product graphics in bulk, ensuring all media is organized before attaching them to layouts. | CP Commerce Admin -> Manage Image |
| **Product Management** | Instantly opens the active product catalog linked to this specific storefront. **Benefit:** Rapidly update pricing, names, or out-of-stock statuses without accessing the master ERP Inventory module. | Master Data -> Doc Item Maintenance |
| **Voucher Management** | Interface for configuring promotional codes, discounts, and expiration parameters. **Benefit:** Enables marketers to rapidly launch flash sales via promo codes. | CP Commerce Admin -> Voucher Management |
| **Event Manager** | Dashboard to configure bookable seminars, classes, or ticketed events. **Benefit:** Simplifies capacity and schedule management for experiential retail operations. | Event & Activity Management |
| **Notification** | Command center for constructing push-notifications, email blasts, and SMS campaigns to registered portal users. **Benefit:** Enhances customer engagement without third-party mailing tools. | CP Commerce Admin -> Notification |
| **Shipping** | Gateway to configure third-party logistics (3PL) flat rates and weight-based delivery fees. **Benefit:** Real-time adjustments to courier options and free-shipping thresholds. | CP Commerce Admin -> Shipping Provider |
| **QR Code Manager** | Generates dynamic QR codes linked directly to store landing pages, specific products, or checkout carts. **Benefit:** Bridges offline marketing (flyers/posters) to online conversions natively. | (Dependent on Applet Version) |
| **Activity Manager** | Configure recurring classes/activities happening within your physical corporate facilities. **Benefit:** Integrates physical store operations into the digital booking portal. | CP Commerce Admin -> Activity |

---

#### Dashboard Access Controls & Visibility

Not every store employee should have access to the entire Webstore Dashboard. 

To enforce **Role-Based Access Control (RBAC)** or to simply declutter the interface for smaller stores, super-administrators can hide specific tiles from the frontend dashboard. 

To hide a tile:
1. Navigate to the **Website Edit** > **Details** tab in the backend CP Commerce Applet.
2. Scroll down to the **Hide Website Builder Elements** section.
3. Check the respective boxes (e.g., `Hide Voucher Management` or `Hide Image Manager`).
4. **Save** the website configuration. The specified tiles will immediately vanish from the frontend Webstore Dashboard for all managers. 

---

### Website Management (`website` route)

#### Website Listing

The default landing page of the applet. Shows all configured website/storefront entities.

**Listing View:**
- Each row = one website entity
- Key columns: Website Code, Website Title, Status
- Click any row to open the edit view

#### Website Create

**Creating a new website — Field-by-Field Guide:**

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Website Title** | Display name for this storefront | Yes | "MY Online Store" |
| **Branch** | The physical branch this website is linked to | Yes | "KL HQ" |

After clicking **Create**, you are taken to the full edit view with many more fields and tabs.

#### Website Edit — Tabs Overview

{{< figure src="/images/cp-commerce/website-edit-tabs.png" alt="Website Edit Content Tabs" caption="The complete Website Edit configuration panel, displaying the multiple tabs (Details, App Version, Manage Image, etc.) used to govern different aspects of the Customer Portal." >}}

When you select a website to edit, you'll see the **full configuration panel** with the following tabs:

| Tab | Purpose |
|-----|---------|
| **[Details](#details-tab-deep-dive)** | Core configuration: pricing, menus, shipping, merchant, app store URLs, reseller settings, and administrative controls |
| **[App Version](#app-version-tab-deep-dive)** | Manage iOS and Android app version requirements and mandatory update checks |
| **[Manage Image](#manage-image-tab-deep-dive)** | Image library manager — upload, search, and manage visual assets for the website |
| **[Digital Signature](#digital-signature-tab-deep-dive)** | Generate and manage RSA key pairs used for secure API request signing |
| **[Post Registration Config](#post-registration-config-tab-deep-dive)** | Configure workflows and settings triggered after a customer completes registration |
| **[3rd Party Auth Config](#third-party-auth-config-tab-deep-dive)** | Integration settings for external providers (Google Login/Analytics, Facebook, reCAPTCHA, Apple Login) |
| **[Layout Instance](#layout-instance-tab-deep-dive)** | Access the visual Website Builder to create and manage page layouts |
| **[Reviews](#reviews-tab-deep-dive)** | Moderate customer feedback and configure voting/rating settings |
| **[Menu List](#menu-list-tab-deep-dive)** | Design and manage navigation structures (Top, User, Side, and Footer menus) |
| **[Label List](#label-list-tab-deep-dive)** | Create hierarchical tags and classification labels for content organization |
| **[Content Category](#content-category-tab-deep-dive)** | Define logical categories to group storefront content and products |
| **[Posts](#posts-tab-deep-dive)** | Manage blog posts, news, announcements, and informational content |
| **[User Agreement](#user-agreement-tab-deep-dive)** | Manage legal documents like Privacy Policy and Terms & Conditions |
| **[Account](#account-tab-deep-dive)** | Detailed management of customer accounts and B2B spending entities |
| **[Commission Scheme](#commission-scheme-tab-deep-dive)** | Configure sales commission logic, rules, and calculation methods |
| **[Language](#language-tab-deep-dive)** | Enable and manage multi-language support for the storefront |
| **[Branch](#branch-tab-deep-dive)** | Link and configure multiple branches to the storefront for delivery and inventory |
| **[Region](#region-tab-deep-dive)** | Define regional zones for localized settings and shipping rules |
| **[Country](#country-tab-deep-dive)** | Configure country-specific localization, date formats, and locale defaults |
| **[Voucher Management](#voucher-management-tab-deep-dive)** | Create and manage discount codes, promo vouchers, and marketing campaigns |
| **[Settlement Method](#settlement-method-tab-deep-dive)** | Configure payment gateways and available settlement options for customers |

---

<a id="details-tab-deep-dive"></a>
##### Details Tab (Deep Dive)

This is the most field-heavy tab. Here's the full configuration:

| Field | Purpose | Required | Conditional |
|-------|---------|----------|-------------|
| **Website Code** | Auto-generated unique ID | Read-only | — |
| **Website Title** | Display name of the storefront | Yes | — |
| **Branch** | Linked branch entity | Yes | — |
| **Pricing** | How prices are determined for this store: `PRICING_SCHEME`, `ENTITY_PRICING` or `ECOMSYNC_BY_BRANCH` | Yes | — |
| **Pricing Scheme** | Select the pricing scheme | *Conditional* | Shows when Pricing = "Pricing Scheme" or "Entity Pricing" |
| **Pricing Scheme 2** | Optional secondary pricing scheme | *Conditional* | Shows when Pricing = "Pricing Scheme" or "Entity Pricing" |
| **Price Book** | Select price book directly | *Conditional* | Shows when Pricing = "Ecomsync by Branch" |
| **Merchant** | Which merchant entity this store represents | No | — |
| **Enable Shipping Fee Process** | Checkbox to activate shipping at checkout | No | — |
| **Shipping Fee Options** | How the fee is calculated: *Shipping Pricebook*, *Delivery Charges*, *Delivery Charges by Country* or *Delivery Charges by Region* | *Conditional* | Shows when "Enable Shipping Fee Process" is checked |
| **Item Code for Delivery Charges** | Doc item used for delivery charge line items | *Conditional* | Shows when shipping fee option = Delivery Charges |
| **Default Shipping Price Book Code** | Shipping pricebook for rate calculation | *Conditional* | Shows when shipping fee option = Shipping Price Book |
| **Item Code for Shipping Fee** | Doc item used for shipping fee line items | *Conditional* | Shows when shipping fee option = Shipping Price Book |
| **Enable Fixed Width** | Lock website to a fixed pixel width | No | — |
| **Fixed Width** | The pixel value for fixed width | *Conditional* | Shows when "Enable Fixed Width" is checked |
| **Default Discount Price Book** | Default pricebook for promotional discounts | No | — |
| **Top Menu** | Navigation menu shown at the top of the website | No | — |
| **User Menu** | Navigation menu for logged-in user options | No | — |
| **Left-side Menu** (labelled "Lift-side Menu" on screen) | Sidebar navigation menu | No | — |
| **Bottom Menu** | Footer navigation menu | No | — |
| **Content Category** | Label list used for categorizing content | No | — |
| **Sales Order Printable Format** | Printable format for customer order confirmations | No | — |
| **Description** | Admin description of this website | No | — |
| **Meta Description** | SEO meta description for the website | No | — |
| **Membership Class** | Default membership class for portal customers | Yes | — |
| **Status** | Active / Inactive | Yes | — |
| **Default Topic** | Default newsletter topic for this website | No | — |
| **Default Layout Routing** | The default homepage layout | No | — |
| **Default Authentication Portal** | The login/register page layout | No | — |
| **Privacy Agreement** | Link to agreement document for privacy policy | No | — |
| **Terms & Conditions Agreement** | Link to T&C agreement document | No | — |
| **Enable Web-Chat** | Activate live chat on the storefront | No | — |
| **Selected Webchat Endpoint** | The UCC endpoint for live chat | *Conditional* | Shows when "Enable Web-Chat" is checked |
| **Restrict View/Access by Entity** | Limit portal content visibility by corporate entity | No | — |
| **Restrict Notification by Member** | Only send notifications to active members | No | — |
| **Enable Public Cart** | Allow non-logged-in users to add items to cart | No | — |
| **Enable Website Preloader** | Show loading animation on page load | No | — |
| **Enable Reseller Website** | Activate reseller/affiliate mode | No | — |
| **Reseller Banner fields** | Free Delivery Text, Middle Text, Background Color, Color, Font | *Conditional* | Shows when "Enable Reseller Website" is checked |
| **Enable App Version Update Check** | Force mobile users to update outdated apps | No | — |
| **Google Store URL / Apple Store URL** | App store links for update prompts | *Conditional* | Shows when "Enable App Version Update Check" is checked |
| **Hide Website Builder Elements** | Checkboxes `hideBanners`, `hideMenuManager`, `hideLayoutManager`, `hideImageManager`, `hideProductManagement`, `hideVoucherManagement`, `hideEventManager`, `hideNotification`, `hideShipping`, `hideQrCodeManager`, `hideActivityManager` — each removes one tile from the Webstore dashboard | No | — |
| **Created By / Created Date / Modified By / Modified Date** | Audit fields | Read-only | — |

---

<a id="app-version-tab-deep-dive"></a>
##### App Version Tab (Deep Dive)

Manages iOS and Android mobile app version tracking with two sub-tabs:

| Sub-Tab | What You Do |
|---------|-------------|
| **iOS** | Create and manage iOS app version entries — set version number, mandatory update flag, release notes |
| **Android** | Create and manage Android app version entries — same fields as iOS |

**Creating an App Version Entry:**

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Version Number** | Semantic version of the app | Yes | "3.5.2" |
| **Is Mandatory Update** | Force users on older versions to update | No | Checked |
| **Release Notes** | Description of what changed in this version | No | "Critical security patch" |

{{< callout type="important" >}}
**Why This Matters**: If your development team pushes a critical security patch for the mobile app, you can create a new version entry here and check "Is Mandatory Update." All users on older versions will be locked out with a prompt redirecting them to the App Store or Play Store.
{{< /callout >}}

---

<a id="manage-image-tab-deep-dive"></a>
##### Manage Image Tab (Deep Dive)

The **Manage Image** tab serves as the central asset library for your storefront. Here, you upload and organize specifically formatted images that are later referenced in branding, layout banners, and product displays.

| Feature | Description |
|---------|-------------|
| **Image Asset** | High-resolution visual file (JPG/PNG) used on the storefront. |
| **Param_Code** | A unique internal identifier used by the Website Builder to hook images into specific layout positions. |
| **Image Type** | Categorization labels (e.g., `LOGO`, `BANNER`, `FAVICON`) used to filter assets by location. |
| **Search Function** | Quick-filter across your entire library by Parameter Code or Image Type. |

**Image Listing Grid:**

| Column | Purpose |
|--------|---------|
| **Param_Code** | The code reference for layouts |
| **Value** | A thumbnail preview of the asset |
| **Created Date** | Timestamp of the original upload |

---

<a id="digital-signature-tab-deep-dive"></a>
##### Digital Signature Tab

Generate and manage cryptographic key pairs (RSA/DSA) used to digitally sign API requests between the Customer Portal and external ERP systems. This ensures data integrity and authenticity.

| Field | Purpose | Required |
|-------|---------|----------|
| **Key Algorithm** | Select the encryption standard (RSA or DSA) | Yes |
| **Key Size** | Select the strength of the key (ranges from 512 to 4096 bits) | Yes |
| **Key Status** | Set the key to ACTIVE to begin using it for request signing | Yes |
| **Private Key** | The generated secret key. **Keep this confidential.** | Read-only |
| **Public Key** | The generated public key shared with external systems for verification. | Read-only |

<a id="post-registration-config-tab-deep-dive"></a>
##### Post Registration Config Tab

**What is Post Registration Config?**

This tab controls **what happens automatically** the moment a new customer completes their registration on the Customer Portal. Instead of manually creating records in multiple applets, you can configure the system to handle onboarding steps instantly — adding the user to your tenant, creating a customer record, or setting up their membership.

{{< callout type="important" >}}
**Why This Matters**: Without proper post-registration configuration, a newly registered portal user may not show up in your Customer Master, Membership Applet, or team assignment lists. This means your sales, support, and marketing teams won't see the new customer until someone manually creates these records — potentially losing engagement during the critical onboarding window.
{{< /callout >}}

**Post Registration Config — Fields:**

| Field | Purpose | Required | What Happens When Enabled |
|-------|---------|----------|---------------------------|
| **Team** | Select which internal Team(s) the new customer should be automatically assigned to | No | The registered user is linked to the selected team(s) for CRM workflow routing |
| **Add user to tenant** | Checkbox — Automatically add the registered user to the current tenant | No | The user appears in your tenant's user directory and can be managed centrally |
| **Create customer** | Checkbox — Automatically create a Customer record in the Customer Master | No | A new customer entity is auto-created in the **Customer Master Applet**, pre-populated with the user's registration details (name, email, phone) |
| **Create membership and customer** | Checkbox — Create both a Membership record AND a Customer record | No | A customer entity is created **and** a membership profile is created in the **Membership Admin Applet** — useful when your portal requires membership tiers |
| **Create membership without customer** | Checkbox — Create only a Membership record (no customer entity) | No | Only a membership profile is created — useful for loyalty-only programs where you don't need a full customer account |

{{< callout type="tip" >}}
**Common Setup**: Most B2C portals check "Create membership and customer" so that every new sign-up is immediately available in both your Customer Master (for orders/invoicing) and Membership Applet (for loyalty points/tiers). B2B portals typically only check "Add user to tenant" since corporate accounts are pre-created.
{{< /callout >}}

<a id="third-party-auth-config-tab-deep-dive"></a>
##### 3rd Party Auth Config Tab

Centralize all external API integrations for authentication, security (reCAPTCHA), and analytics. Each provider has its own sub-tab:

| Provider | Purpose | Key Fields |
|----------|---------|------------|
| **Google reCAPTCHA** | Protects forms (Login/Registration) from bot spam. | Site Key, Secret Key |
| **Google Login** | Enables "Sign in with Google" for social proof and ease of use. | Client ID, Secret |
| **Facebook Login** | Enables "Sign in with Facebook" portal access. | App ID, App Secret |
| **Apple Login** | Enables "Sign in with Apple" (required for most iOS apps). | Client ID, Team ID |
| **Mini-Orange** | Enterprise SSO integration via the Mini-Orange platform. | API Key, Customer Key |
| **Google Analytics** | Tracks portal traffic and customer conversion behavior. | Measurement ID (G-XXXX) |
| **Zendesk Live Chat** | Embeds a live chat bubble on the storefront for support. | Widget Snippet / Key |

---

<a id="layout-instance-tab-deep-dive"></a>
##### Layout Instance Tab

The **Layout Instance** tab is the control center for your site's pages. A "Layout Instance" represents a specific page (e.g., Homepage, About Us, Landing Page).

**Layout Instance Edit — Tabs:**

When you open a layout instance, you'll see **4 tabs**:

| Tab | Purpose | What You Can Do |
|-----|---------|-----------------|
| **Main** | Core layout identity | Set the code (used in URLs), name, and description |
| **Nodes** | Manage the page structure — the rows, columns, and widgets that make up the layout | Add, edit, reorder, and delete nodes. Each node has its own detailed config with **5 sub-tabs**: Main, Config, Json Params, Input Params, Preview |
| **Json** | View and edit the raw JSON structure of the page layout | For advanced users who prefer to work directly with the layout data |
| **Platform Config** | Set platform-specific rendering rules | Configure how this layout renders on different platforms (web, mobile app, tablet) |

**Create Form Fields:**

| Field | Purpose | Required |
|-------|---------|----------|
| **Code** | Unique identifier for this page layout (used in URLs) | Yes |
| **Name** | Friendly name for internal organization | Yes |
| **Description** | Admin notes about the page's purpose | No |

###### How the Visual Website Builder Works

Accessible via the **Website Builder** button in the header, this drag-and-drop environment allows you to design your pages using a hierarchical node system:

1. **Rows**: Horizontal containers that define the page flow.
2. **Columns**: Vertical dividers inside rows to control content width.
3. **Widgets**: Functional UI components (Product Sliders, Banners, Form Embeds).

**Configuration Palette:**
- **Elements Palette (Left)**: Drag Rows, Columns, and Widgets onto the canvas.
- **Interactive Canvas (Center)**: Rearrange elements visually.
- **Properties Panel (Right)**: Configure the specific settings for the selected element.

###### Widget Reference Guide

Below is the complete catalog of all available widgets, organized by category. When configuring a node as a **Widget**, select the appropriate Widget ID from the dropdown and configure its parameters.

---

**Structure & Header Widgets**

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `GENERIC_HEADER` | Generic Header | Standard website header with logo, search, and cart icon. | Sticky mode, image width, search route, search button color/text, hide cart, menu background/color |
| `MOBILE_HEADER` | Mobile Header | Header optimized for mobile app views. | Cart route, show logo, show menu, enable sidebar, show back button, search bar toggle |
| `FOOTER` | Footer | Website footer with contact info and links. | Mobile mode, header size, mobile footer field, email, Facebook URL, Instagram URL, display logo |
| `BIO_FOOTER` | Bio Footer | Footer with company bio, address, and social links. | Footer line 1/2/3, postal code, city, state, email, phone, social links (FB/IG/TikTok/YT) |

**Product Display Widgets**

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `PRODUCT_SLIDER` | Product Slider | Horizontal carousel of products, filterable by category. | Title, category group (label list), category (label hdr), add to cart toggle, favourite toggle |
| `PRODUCT_SLIDER_V2` | Product Slider V2 | Enhanced product slider with visibility and arrow controls. | All Product Slider params + visible items (desktop/mobile), hide arrows |
| `PRODUCT_LIST` | Product List | Grid/list view of all products. | Product details layout URL |
| `PRODUCT_DETAILS` | Product Details | Full product detail page with images, price, description. | Enable auth guarantee, show socials, show vouchers |
| `PRODUCT_CATEGORY` | Product Category | Display product categories as browsable sections. | Category group filter, label list, product listing layout URL |
| `CATEGORY_FILTER_PRODUCT_LIST` | Category Filter Product List | Product list with a category filter bar on top. | Background/text/active colors, infinite scrolling toggle, column count |
| `POWER_SEARCH_FILTER` | Power Search Filter | Advanced search with sorting and filtering controls. | Sorting functions (Latest/Popular/Top Sales/Price), display attribute icons |

**Navigation & Menu Widgets**

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `VERTICAL_MENU` | Vertical Menu | Sidebar-style vertical navigation menu. | Menu list selection |
| `HORIZONTAL_MENU` | Horizontal Menu | Top-bar horizontal navigation menu. | Menu list selection |
| `TAB_MENU` | Tab Menu | Tab-style navigation for sub-sections. | Menu list selection |
| `MOBILE_TAB_MENU` | Mobile Tab Menu | Bottom tab bar for mobile app navigation. | Menu list selection |

**E-Commerce Workflow Widgets**

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `SHOPPING_CART` | Shopping Cart | The customer's shopping cart view. | Checkout route URL |
| `CHECKOUT_STEP_V2` | Checkout Step (V2) | Multi-step checkout flow widget. | Enable shipping, membership points, cash voucher, payment gateway, style configuration for each step |
| `ORDER_LISTING` | Order Listing | List of customer's past orders. | Order details layout, tracking website URL, show received button |
| `MY_INVOICE` | My Invoice | List of customer's invoices. | Invoice detail layout URL |
| `REQUEST_REFUND` | Request Refund | Refund request form. | Reasons array, email recipient for notifications |

**User Account & Membership Widgets**

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `LOGIN_WIDGET` | Login Widget | Login and registration page. | Reset password route, sign-up route, privacy/T&C doc links, registration type |
| `MEMBERSHIP` | Membership | Display membership tier cards. | Membership class array, icon color, background color |
| `MEMBER_POINTS_COUNTER` | Membership Points Counter | Display member's loyalty points balance. | Point color, line color |

**Form & Interaction Widgets**

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `DYNAMIC_FORM_WIDGET` | Dynamic Form Widget | Embed a dynamic form/survey on the page. | Dynamic form selection |
| `TEMPLATE_FORM_WIDGET` | Template Form Widget | Embed a template form on the page. | Template form selection, custom field array |
| `BUTTON_SINGLE` | Button Single | A standalone CTA button with full styling. | Text, font, destination URL, link type, styling (colors/borders/radius) |

---

<a id="menu-list-tab-deep-dive"></a>
##### Menu List Tab

**What is the Menu List Tab?**

This tab manages the **navigation structures** used across your storefront — the top menu bar, user dropdown, sidebar, and footer links. Menus created here are referenced by the Generic Header, Vertical Menu, Horizontal Menu, and Footer widgets in Layout Instance.

**Creating a Menu:**

| Field | Purpose | Required |
|-------|---------|----------|
| **Menu Title** | The name of the navigation menu (e.g., "Footer Links", "Main Navigation") | Yes |
| **Status** | Toggle visibility on the storefront | Yes |

**Menu Item Edit — Tabs:**

Each individual menu item (link) within a menu has its own edit view with **2 tabs**:

| Tab | Purpose |
|-----|---------|
| **Main** | Set the link text, destination URL, display order, and parent menu item (for sub-menus) |
| **Manage Image** | Upload an icon or thumbnail image for this menu item |

<a id="posts-tab-deep-dive"></a>
##### Posts Tab

**What is the Posts Tab?**

Posts are your website's content entries — blog articles, news items, brand stories, FAQs, and announcements. These are the "static pages" that layout widgets reference to display non-product content on the storefront.

**Creating a Post:**

| Field | Purpose | Required |
|-------|---------|----------|
| **Title** | The display title of the post | Yes |
| **URL Key** | The search-engine-friendly URL slug (e.g., `brand-story`) | Yes |
| **Status** | Controls whether the post is visible | Yes |
| **Publish/Expiry Date** | Schedule content visibility for limited-time campaigns | No |
| **Content Category** | Group posts together for collective display in widgets | No |
| **Layout Instance** | Link this post to a specific layout design | Optional |

**Post Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main** | Edit the post title, URL key, content body, category, and layout assignment |
| **Manage Image** | Upload featured images, banners, or thumbnails for this post |

---

<a id="user-agreement-tab-deep-dive"></a>
##### User Agreement Tab

**What is the User Agreement Tab?**

This is your central repository for legally binding documents — Privacy Policies, Terms & Conditions, Data Protection Agreements — that customers must agree to when registering or making purchases on the portal. Beyond storage, this tab gives you a **full audit trail**: you can see exactly **who** agreed to **which version** of a document, **when** they agreed, and **how** (IP address, consent method).

{{< callout type="info" >}}
**Why This Matters**: Under regulations like PDPA (Personal Data Protection Act) and GDPR, businesses must prove that users gave informed consent to specific versions of legal documents. This tab provides that proof — every agreement is version-tracked with expiry dates, and every user's consent is recorded with timestamps and IP addresses.
{{< /callout >}}

**Creating an Agreement Document:**

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Title** | Display name shown to customers during registration/checkout | Yes | "Privacy Policy v2.1 — January 2026" |
| **Document Code** | Unique internal code used to reference this document in Login Widget configurations | No | "PP-2026-V2" |
| **Expiry Date** | When this version expires — after this date, customers will be prompted to agree to a newer version | No | 2027-01-01 |
| **Status** | Must be set to ACTIVE for the document to appear on the portal | Yes | ACTIVE |
| **PDF Upload** | Drag-and-drop or click to upload the legal document as a PDF file | Yes | privacy-policy-v2.pdf |

**Editing an Agreement — Tabs:**

When you open an existing agreement document, you'll see **2 tabs**:

| Tab | Purpose | What You Can Do |
|-----|---------|-----------------|
| **Main** | Edit the document details and replace the uploaded PDF | Update title, document code, expiry date, status, or upload a new PDF version. You can also delete the agreement from here. |
| **Agreed Users** | View a complete audit trail of every user who agreed to this document | Search and browse all users who consented — see their name, email, phone, member ID, IP address, consent method, and agreement date |

###### Agreed Users Tab

This tab provides the compliance proof you need. It shows a searchable grid of every portal user who has accepted this specific agreement document:

| Column | What It Shows |
|--------|---------------|
| **User Name** | The registered name of the user who agreed |
| **Email** | The email address used at time of consent |
| **Phone** | The phone number associated with their account |
| **Member ID** | Their membership ID (if applicable) |
| **IP Address** | The IP address from which consent was given — critical for legal audits |
| **Consent Method** | How the user agreed (e.g., checkbox during registration, pop-up prompt) |
| **Creation Date** | The exact date and time when consent was recorded |
| **Updated Date** | When the consent record was last updated |

{{< callout type="tip" >}}
**Version Control Workflow**: When you update your Privacy Policy, create a **new** agreement document (e.g., "Privacy Policy v3.0") with the updated PDF, and set the old document's expiry date. The Login Widget will automatically prompt returning users to agree to the new version on their next login.
{{< /callout >}}

<a id="reviews-tab-deep-dive"></a>
##### Reviews Tab

**What is the Reviews Tab?**

This tab configures the **rules and settings** for how the product review system works on your storefront — whether reviews need admin approval, minimum character counts, and how the "helpful" voting system operates.

| Sub-Tab | Purpose | What You Configure |
|---------|---------|-----------|
| **Review Settings** | Define rules for review submission | Min/max scores, auto-approval thresholds, minimum review length, required fields, and moderation rules |
| **Review Votes** | Configure the "Helpful/Not Helpful" voting buttons on customer reviews | Voting labels, display settings, and the raw JSON configuration (editable in the **JSON** sub-tab within the vote edit view) |

<a id="label-list-tab-deep-dive"></a>
##### Label List Tab

**What is the Label List Tab?**

Labels are **classification tags** used to organize and filter content across your website. They power the "Category Group" dropdowns in product widgets and the "Content Category" filters in post listings. Labels can also be **hierarchical** — a parent label can have child labels for multi-level categorization.

**Creating a Label List:**

| Field | Purpose | Required |
|-------|---------|----------|
| **Label Name** | Primary display name for the label | Yes |
| **Label Code** | Internal code used for layout configuration | Yes |
| **Status** | Toggle availability for widget filtering | Yes |

**Label List Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main** | Edit the label name, code, and status |
| **Child Label** | Create and manage sub-labels under this parent label — useful for multi-level categorization (e.g., Parent: "Apparel" → Children: "T-Shirts", "Jeans", "Accessories") |

<a id="content-category-tab-deep-dive"></a>
##### Content Category Tab

Define logical groupings for products and posts to enable organized browsing.

| Field | Purpose | Required |
|-------|---------|----------|
| **Category Name** | The display name of the category | Yes |
| **Category Code** | Unique ID for URL routing and layout links | Yes |
| **Category Type** | Classification for internal sorting | No |

---

<a id="account-tab-deep-dive"></a>
##### Account Tab

**What is the Account Tab?**

This tab controls **which customer accounts (entities) are linked** to your website. It works hand-in-hand with the **"Restrict View/Access by Entity"** setting in the Details tab — when that setting is enabled, only customers whose accounts are linked here can see and access the portal content.

{{< callout type="important" >}}
**Key Dependency — "Restrict View/Access by Entity"**: If you enable this checkbox in the **Details tab** (see [Details Tab](#details-tab-deep-dive)), the portal becomes a **gated storefront** — only the accounts you explicitly add in this Account tab can log in, browse products, and place orders. This is essential for **B2B portals** where you only want approved corporate clients to access your catalog and pricing.
{{< /callout >}}

**Account Listing:**

The listing shows all accounts currently linked to this website. Key columns:

| Column | What It Shows |
|--------|---------------|
| **Name** | The account holder's registered name |
| **Phone** | Contact phone number |
| **Email** | Contact email address |
| **Account Type** | Classification — Corporate, Retail, Supplier, etc. |
| **Customer Code** | Linked customer code from the ERP system |
| **Supplier Code** | Linked supplier code (if applicable) |
| **Employee Code** | Linked employee code (if applicable) |
| **Merchant Code** | Linked merchant code (if applicable) |

**Adding an Account ("Link to Website"):**

Clicking the **"+"** button opens a selection grid showing all available accounts from your ERP system. You are **selecting and linking** an existing account — not creating a new one. Select the account row and click **Add** to link it to this website.

**Viewing/Editing a Linked Account:**

Clicking any account row opens a read-only detail view. All fields are **view-only** — account details are managed in the source applet (e.g., Customer Master), not here.

| Field | What It Shows | Editable? |
|-------|---------------|-----------|
| **Name** | Account holder's name | Read-only |
| **Email** | Contact email | Read-only |
| **Phone** | Contact phone | Read-only |
| **Type** | Account classification | Read-only |
| **Customer Code** | ERP customer code | Read-only |
| **Supplier Code** | ERP supplier code | Read-only |
| **Employee Code** | ERP employee code | Read-only |
| **Merchant Code** | ERP merchant code | Read-only |
| **Credit Limit** | Visual progress bar showing available credit out of total credit limit with currency (e.g., "RM 3,200 MYR available out of RM 5,000 MYR"). If no credit limit is assigned, shows "No Credit Limit Information is available." | Read-only |

**Unlinking an Account:**

Click the **Delete** button in the account detail view to **unlink** (remove) the account from this website. This does not delete the account from the system — it only removes the website association.

{{< callout type="tip" >}}
**B2B Onboarding Workflow**: For B2B portals, the typical setup is: (1) Create the customer account in **Customer Master Applet** → (2) Go to **CP Commerce Admin > Website Edit > Account tab** → (3) Link the account → (4) Enable "Restrict View/Access by Entity" in Details tab. Now only approved clients can access the portal.
{{< /callout >}}

<a id="branch-tab-deep-dive"></a>
##### Branch Tab

Manage the physical branch locations or pickup points linked to this specific digital storefront. Branches are created and managed in the [Organisation Applet](/applets/master-data/organisation-applet/).

| Field | Purpose | Required |
|-------|---------|----------|
| **Branch Code** | Unique identifier for the physical location | Yes |
| **Branch Name** | Friendly name displayed to customers in pickup options | Yes |

<a id="region-tab-deep-dive"></a>
##### Region Tab

Define the geographical regions used for shipping calculation and content localization.

| Field | Purpose | Required |
|-------|---------|----------|
| **Region Name** | The name of the territory (e.g., "South East Asia") | Yes |
| **Region Code** | Unique ID for regional rule mapping | Yes |
| **Status** | Toggle availability for shipping rules | Yes |

<a id="country-tab-deep-dive"></a>
##### Country Tab

**What is the Country Tab?**

This tab allows you to configure **country-specific settings** for your storefront. If your portal supports customers from multiple countries, each country can have its own language options, payment methods, support contacts, and financial label configurations.

**Country Edit — Tabs:**

When you open a country record, you'll see **5 tabs**:

| Sub-Tab | Purpose | What You Can Do |
|---------|---------|-----------------|
| **Main** | Set the primary country name and ISO code | Define the country identity for localization rules |
| **Language Selection** | Assign which languages are enabled for this country's portal view | Add or remove language options that customers from this country can choose |
| **Support** | Configure country-specific customer support information | Set up support contact details, helpdesk URLs, or escalation paths for this region |
| **Fi Label List Link** | Link financial label lists to this country for accounting classification | Connect label lists used for financial categorization in invoices and reporting for this country. Each linked label has its own sub-view with **Details** and **Label Hdrs** tabs |
| **Settlement Method** | Configure which payment methods are available to customers in this country | Enable or disable specific payment gateways (Stripe, bank transfer, etc.) per country |

---

<a id="voucher-management-tab-deep-dive"></a>
##### Voucher Management Tab

Link and manage discount vouchers and promotional coupons that customers can use during checkout. For full voucher configuration details, see the [Voucher Management Applet](/applets/membership/voucher-management-applet/).

| Field | Purpose | Required |
|-------|---------|----------|
| **Voucher Code** | The code customers enter at checkout (e.g., "SAVE10") | Yes |
| **Voucher Name** | Internal description of the campaign | Yes |
| **Voucher Type** | Discount logic (Fixed Amount or Percentage) | Yes |
| **Status** | Toggle to activate/deactivate the coupon instantly | Yes |

<a id="commission-scheme-tab-deep-dive"></a>
##### Commission Scheme Tab

Define how sales commissions are calculated for agents or affiliates linked to this website. For full commission configuration details, see the [Commission Scheme Applet](/applets/membership/commission-scheme-applet/).

| Field | Purpose | Required |
|-------|---------|----------|
| **Commission Code** | Primary identifier for the commission ruleset | Yes |
| **Commission Name** | Descriptive name for the scheme | Yes |

<a id="language-tab-deep-dive"></a>
##### Language Tab

Configure the multi-language support settings for the storefront Frontend.

| Field | Purpose | Required |
|-------|---------|----------|
| **Language Name** | The display name (e.g., "Bahasa Malaysia") | Yes |
| **Language Code** | Standard ISO locale code (e.g., `ms-MY`) | Yes |
| **Status** | Enable/Disable the language option on the site | Yes |

<a id="settlement-method-tab-deep-dive"></a>
##### Settlement Method Tab

Link the payment settlement gateways (Stripe, Bank Transfer, Card, etc.) available for this website's checkout process. Settlement methods are configured in the [Cashbook Applet](/applets/master-data/cashbook-applet/).

| Field | Purpose | Required |
|-------|---------|----------|
| **Settlement Code** | Technical ID for the payment processor | Yes |
| **Settlement Name** | The name shown to customers (e.g., "Pay with Credit Card") | Yes |
| **Status** | Toggle to enable/disable the payment method | Yes |

### Shipping Providers (`shipping-provider` route — not in the sidebar)

**What are Shipping Providers?**

This section lets you configure all the **delivery options** your customers see at checkout. Whether you use a flat fee, weight-based rates, or a real-time API from a logistics partner, each shipping option is set up here as a "provider method."

{{< callout type="info" >}}
**How It Connects**: After creating a shipping provider here, you still need to **enable shipping** on your website. Go to **Website Edit > Details tab** → check "Enable Shipping Fee Process" → select your Shipping Fee Option → Save. Only then will customers see these delivery options at checkout.
{{< /callout >}}

**Shipping Provider Types:**

The edit view changes based on the provider type. There are **3 types**, each with different configuration fields:

**Type 1 — Flat Rate:**

A single fixed delivery fee regardless of order weight or destination.

| Field | Purpose | Required | Editable? |
|-------|---------|----------|-----------|
| **Shipping Provider Title** | The name shown to customers at checkout | Yes | Read-only (set on create) |
| **Type** | Provider type identifier | Yes | Read-only |
| **Handling Fee** | Additional processing fee per order | Yes | Yes |
| **Min Purchase** | Minimum cart value required to use this shipping option | No | Yes |
| **Duration** | Estimated delivery time shown to customers (e.g., "3-5 business days") | No | Yes |
| **Rate** | The flat delivery fee amount | No | Yes |
| **Currency** | Currency for the rate | No | Yes |
| **Active** | Checkbox to enable/disable this option at checkout | No | Yes |

**Type 2 — Table Rate:**

Variable delivery fees based on weight, destination zone, or order value. Has **2 tabs**:

| Tab | Purpose |
|-----|---------|
| **Main Details** | Provider title (read-only), type (read-only), duration, handling fee, currency, active toggle |
| **Table Rate** | Define rate rules — add rows for weight tiers (e.g., 0–1kg = RM 5, 1–5kg = RM 10), geographic zones, or order value ranges |

**Type 3 — Integration (API-driven):**

Real-time rate calculation via a third-party logistics API. Has **2 tabs**:

| Tab | Purpose |
|-----|---------|
| **Main Details** | Provider title (read-only), type (read-only), duration, handling fee, currency (dropdown with search), active toggle |
| **API Details** | Enter the provider's API credentials (key, secret, endpoint URL) for real-time rate queries |

---

### Dynamic Forms (`dynamic-form` route)

**What are Dynamic Forms?**

A built-in survey and questionnaire builder. You design questions, and customers fill in responses directly on the Customer Portal.

**Dynamic Form Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Form title, description, and configuration |
| **Question** | Add and manage individual questions (text, multiple choice, dropdown, file upload) |
| **Response** | View all customer submissions for this form |

---

### Template Forms (`template-form` route)

Reusable form templates with built-in image management. Useful for creating standardized registration or feedback forms.

**Template Form Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Template name, code, and description |
| **Manage Images** | Upload and manage images used within the form template |

---

### Submitted Forms (`submitted-form` route)

The central inbox for all customer form submissions across both Dynamic Forms and Template Forms. Admins can view, filter, export, and take action on submitted responses.

---

### Activities and Facilities (booking engine)

Manage events, facilities, activities, and calendar bookings directly within the CP Commerce Admin. For a dedicated events workflow with expenses, guest management, and advanced scheduling, see the [Events Management Applet](/applets/crm/events-management-applet/).

#### Facilities (`facilities` route)

Define bookable physical spaces or assets.

**Facilities Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Facility name, capacity, operating hours, location |
| **Activities** | Link specific activities offered in this facility (e.g., "Yoga Class") |
| **Event** | View events associated with this facility |
| **Media Library** | Upload images and media for this facility's portal listing |

#### Activities (`activity` route)

Programs, classes, or services offered within a facility.

**Activity Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Activity name, description, pricing, duration |
| **Manage Images** | Upload promotional images for this activity |
| **Events** | View events that include this activity |

#### Activity Categories (`activity-category` route)

Group activities into logical categories (e.g., "Fitness", "Workshops", "Consultation"). Helps customers filter and browse available programs.

#### Events (`events` route)

Create specific occurrences (e.g., "Summer Mega Sale Launch — July 15").

**Event Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Details** | Event name, date/time, capacity, location, description, and configuration fields |
| **Calendars** | Link this event to admin calendars |
| **Guests** | Manage guest list — view registered attendees |
| **Attachments** | Upload brochures, agendas, or promotional materials |
| **Linked Events** | Associate related events together |
| **Posts** | Create announcement posts tied to this event |

#### Calendars (`calendars` route)

Admin calendar view for managing scheduled events and bookings.

**Calendar Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main** | Calendar name, description, and settings |
| **Members** | Assign team members who manage this calendar |

#### Schedule (`schedule` route)

Scheduler view for visualizing bookings across facilities and time slots.

---

### Spending Limits (`spending-limit` route)

**What are Spending Limits?**

Spending Limits are **automated financial controls** designed for **B2B customer accounts**. When a corporate customer's purchasing manager tries to place an order that would exceed their company's approved spending limit, the checkout is automatically **blocked** — preventing unauthorized overruns without manual finance intervention.

{{< callout type="info" >}}
**Who Uses This**: Spending Limits are designed exclusively for B2B Corporate customer groups. Regular B2C retail customers are not affected — their purchases are limited only by their payment method.
{{< /callout >}}

**Real-World Scenario:**
```
Company: XYZ Corp
Purchasing manager: (B2B account user)
Spending Limit: RM 5,000 / 30 days

Scenario: the cart totals RM 6,200
Result: Checkout is BLOCKED — exceeds the 30-day spending limit
Action: Finance approves an exception, or the order is split

If the limit is exceeded repeatedly: the account is banned for the configured Ban Period
```

**Spending Limit Edit — Fields:**

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Name** | Descriptive name for this spending limit rule | Yes | "Corporate Standard Limit" |
| **Code** | Unique code identifier | Yes | "CORP-STD-5K" |
| **Spending Limit Amount** | Maximum total spending allowed within the period | Yes | 5000 |
| **Spending Limit Period (Days)** | The rolling window in days for tracking spending | Yes | 30 |
| **Ban Period (Days)** | How many days to suspend the account if the limit is repeatedly violated | Yes | 7 |
| **Status** | Active or Inactive | Yes | ACTIVE |
| **Currency** | The currency for the spending limit amount | Yes | MYR |
| **Member Class** | Which membership class this spending limit applies to | No | "Corporate Gold" |
| **Spending Limit Amount New Member** | A different (usually lower) limit for newly registered members | No | 1000 |
| **Email** | Notification email(s) to alert when a limit is approached or exceeded | No | finance@company.com |
| **Phone Number** | SMS notification number(s) for spending alerts | No | +60123456789 |
| **Created By / Created Date / Modified By / Modified Date** | Audit trail fields | Read-only | Auto-populated |

---

### Ratings and Reviews

#### Rating Configuration (`rating` route)

Manage product/service star ratings submitted by customers.

**Rating Edit — Tab:**

| Tab | Purpose |
|-----|---------|
| **Details** | View rating details — product, customer, score, date |

#### Reviews (`review` route — not in the sidebar)

**What is the Review section?**

This is the global moderation queue where admins can **create, view, and approve/reject** customer product reviews before they appear on the Customer Portal. Unlike the Review Settings inside Website Edit (which configure *rules*), this section manages the actual *review content*.

**Creating a Review (Admin-side):**

Admins can manually create reviews on behalf of customers — useful for importing testimonials or seeding initial reviews for new products.

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Product** | Select which product this review is for (opens a product picker) | Yes | "Organic Premium Coffee Beans" |
| **Product Rating** | Click stars (1–5) to set the rating score | Yes | ★★★★☆ (4 stars) |
| **Customer Name** | Select which customer authored this review (opens a customer picker) | Yes | the customer record |
| **Review Summary** | The review body text | No | "Great quality, fast delivery" |
| **Review Title** | Headline for the review | Yes | "Excellent product!" |
| **Status** | Approval status — controls whether the review appears on the portal | Yes | Approved / Pending / Rejected |

**Review Edit — Tab:**

| Tab | Purpose |
|-----|---------|
| **Details** | View and edit all review fields: product, customer, rating, title, summary, and approval status |

---

### Users (`users` route — not in the sidebar)

Portal user management — view all registered Customer Portal users.

**Users Edit — Tab:**

| Tab | Purpose |
|-----|---------|
| **Details** | User profile info, registration date, email, status |

---

### Blocked Customers (`blocked-customers` route)

Blacklist management — block abusive, fraudulent, or defaulting users from accessing the Customer Portal entirely.

---

### Topics (`newsletter-topic` route)

**What are Newsletter Topics?**

Newsletter Topics let you create **topic-based mailing lists** for your Customer Portal. Instead of sending every email to every customer, you define topics (e.g., "Weekly Deals", "New Arrivals", "Events") and customers choose which ones to subscribe to.

**Newsletter Topic Edit — Tabs:**

| Tab | Purpose | What You Can Do |
|-----|---------|-----------------|
| **Details** | Topic name, description, and configuration | Set the topic identity and status |
| **Manage Image** | Upload header/banner images for the newsletter | Add visual branding to your email campaigns |
| **Subscribers** | View and manage subscribed members | See who's subscribed, remove subscribers, or view individual subscriber details in a sub-edit view |
| **Member Label Link** | Link membership labels to auto-subscribe relevant customer segments | Automatically subscribe all members tagged with specific labels (e.g., all "VIP" members auto-subscribe to "Exclusive Deals" topic). This creates **targeted segments** without manual enrollment |

---

### Notifications (`notification` route)

**What is the Notification section?**

Send **push notifications** directly to Customer Portal mobile app users. Each notification can include a title, detailed content, images, and can be scheduled for future delivery — ideal for flash sale announcements, order status updates, or event reminders.

**Notification Edit — Tabs:**

| Tab | Purpose | What You Can Do |
|-----|---------|-----------------|
| **Details** | Notification title, body content, and targeting rules | Write the notification message and choose which customer segments receive it |
| **Scheduled** | Set date/time for scheduled delivery | Schedule the notification to be sent at a specific future time (e.g., "Send 'Flash Sale' notification at 9:00 AM Monday") |

Each notification can have **Posts** (sub-items) with their own tabs:

| Tab | Purpose |
|-----|---------|
| **Main** | Post title, content, and details |
| **Manage Image** | Upload images for the notification post |

---

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Branch (and merchant entity) | [Organisation](/applets/master-data/organisation-applet/) | *Branch* is required on Website create; *Merchant* on the Details tab. |
| Items with prices in a pricing scheme or price book | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/) | The website's *Pricing* model (`PRICING_SCHEME`, `ENTITY_PRICING`, `ECOMSYNC_BY_BRANCH`) decides which price the storefront shows; an item without a price in that scheme shows without a price or not at all. |
| Membership class | [Membership Admin](/applets/membership/membership-admin-applet/) | *Membership Class* is required on Website create; Spending Limit rules are per member class. |
| Shipping price book or a delivery-charge item | [Shipping Pricebook](/applets/master-data/shipping-pricebook-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Needed once *Enable Shipping Fee Process* is on, depending on the *Shipping Fee Option*. |
| Settlement methods | [Cashbook](/applets/master-data/cashbook-applet/) | Linked per website (Settlement Method tab) and per country. |
| Sales order printable format | Sales Order applet's Printable Format Settings | *Sales Order Printable Format* on the Details tab. |
| Third-party credentials | Google reCAPTCHA / Login / Analytics, Facebook, Apple, Mini-Orange, Zendesk consoles | Entered on the 3rd Party Auth Config tab. |
| Legal documents as PDF | — | Uploaded on the User Agreement tab and selected as *Privacy Agreement* / *Terms & Conditions Agreement*. |

Typical order for a new storefront: create the Website (title, branch, pricing, membership class) → Details tab (menus, default layout routing, authentication portal, content category, printable format) → Layout Instance (build pages in the Website Builder) → App Version (mobile) → set *Status* to Active.

### Applet settings

**Settings → Default Selection** (tenant-wide; *Personalization → Default Selection* overrides per user):

| Setting | What it controls | Default | Effect when changed | Who can change it |
|---|---|---|---|---|
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION` | Branch and location pre-selected on new records. | none | New websites and records open with them. | Tenant admin with the Settings menu |
| `DEFAULT_TIMEZONE` | Time zone used for scheduled notifications and event times. | none | Scheduled times are interpreted in this zone. | Same |

**Settings → Field Settings** opens the shared field-configuration screen, but this applet has no settings model and reads none of its keys — the toggles shown there have no effect on CP Commerce Admin. All behaviour is configured per website on the Website edit tabs.

### Document behaviour settings

Not applicable — CP Commerce Admin is not a document applet. Order posting is governed by the sales documents the checkout creates.

### Feature visibility / permissions

- *Settings → Feature Visibility* hides sidebar menus per team; *Personalization → Sidebar* hides them per user.
- *Settings → Permission Set / User / Team / Role Permission* assign server-side permissions on the CMS entities (websites, forms, notifications, events) with targets.
- **Client-side permissions:** none are seeded in the registry for `cp_commerce_admin_console_v1` and the applet code checks none. There is no per-user field or button gating inside the applet.
- Storefront-side access is configured per website: *Restrict View/Access by Entity* (with the Account tab), *Restrict Notification by Member*, *Enable Public Cart*, and the *Hide Website Builder Elements* checkboxes that remove dashboard tiles for store managers.

## Fields

The create and edit forms are documented tab by tab above under *Screens and menus*: the Website [Details tab](#details-tab-deep-dive) (the largest form), [App Version](#app-version-tab-deep-dive), [Post Registration Config](#post-registration-config-tab-deep-dive), [3rd Party Auth Config](#third-party-auth-config-tab-deep-dive), [Layout Instance](#layout-instance-tab-deep-dive), [Menu List](#menu-list-tab-deep-dive), [User Agreement](#user-agreement-tab-deep-dive), [Account](#account-tab-deep-dive), [Country](#country-tab-deep-dive), the Shipping Provider types, Dynamic Forms and Spending Limits. Required fields, from the form validators: Website *Title*, *Branch*, *Membership Class*, *Status*; Dynamic Form *name*, *status*, *website* (create) and *code* (edit); Question *name*, *type*, *required*, *status*; Activity and Activity Category *code*, *name*; Event *title*, *start date*; Calendar *name*; Calendar member *user email*; Facility event *end date*, *location*.

## Related applets

- [Shopping Cart](/applets/ecommerce/shopping-cart-applet/) and [Shopping Cart Customer Access](/applets/ecommerce/internal-shopping-cart-customer-access-applet/) — the checkout that the storefront drives.
- [E-Commerce Catalog](/applets/ecommerce/ecommerce-catalog-applet/), [PDG](/applets/ecommerce/pdg-applet/), [Seller Admin](/applets/ecommerce/seller-admin-applet/) — catalogue and seller data behind the products.
- [Membership Admin](/applets/membership/membership-admin-applet/) — membership classes, points and member labels used by Post Registration Config, Spending Limit and Topics.
- [Voucher Management](/applets/membership/voucher-management-applet/), [Commission Scheme](/applets/membership/commission-scheme-applet/) — linked on their website tabs.
- [Events Management](/applets/crm/events-management-applet/) — the fuller event workflow.
- [Customer](/applets/master-data/customer-applet/), [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Shipping Pricebook](/applets/master-data/shipping-pricebook-applet/), [Cashbook](/applets/master-data/cashbook-applet/) — master data the website references.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Website created but customers cannot see it | *Status* not Active, no *Default Layout Routing*, or branch / merchant not linked. | Set the three on the Details tab. |
| Need to take a storefront offline | — | Set the website *Status* to Inactive; the portal stops serving it. |
| An item appears on the storefront without a price (or with the wrong one) | The website's *Pricing* model points at a scheme or price book in which the item has no price, or the second pricing scheme wins. | Check *Pricing*, *Pricing Scheme* / *Pricing Scheme 2* / *Price Book* on the Details tab against the item's prices; for `ECOMSYNC_BY_BRANCH` check the branch price book. |
| Mobile app shows "Update Required" although users have the latest version | *Version Number* on App Version does not match the store version string exactly, or the update-check pop-up misfired in older builds (fixed 2025). | Enter the exact semantic version; update the app. |
| Customers cannot sign in with Google / Facebook / Apple | Wrong or expired client ID / secret on 3rd Party Auth Config, or a redirect URI that does not match the portal domain. | Re-enter the credentials; check the provider console. |
| Sidebar items missing that colleagues can see | Feature Visibility (team) or Personalization → Sidebar (user). | Adjust either. |
| Review, Shipping Provider or Users not in the sidebar | These menu entries are commented out in the current build. | Open the route directly (`…/review`, `…/shipping-provider`, `…/users`). |
| Account tab shows the wrong rows or does not page | Pagination bug fixed July 2026 (Account tab also moved next to Details). | Update the applet. |
| Listing search returns *NO MATCHING RECORD FOUND* for a name typed in capitals | Case-sensitive search in older builds (fixed 2025). | Update the applet. |
| A menu item's parent menu is not saved | Fixed 2025 (parent menu and menu level now shown and saved). | Update the applet. |
| Deep links from the app open the wrong page | Fixed September 2025. | Update the app and applet. |
| Email confirmation on the portal fails silently (wrong TAC) | Older portal builds did not surface the error; a toaster message was added in September 2026. | Update the portal app. |
| Shipping options do not appear at checkout | *Enable Shipping Fee Process* off, no *Shipping Fee Option*, or the shipping provider is not Active. | Tick the checkbox, choose the option and its price book / item, set the provider Active. |
| Spending limit not enforced | Rule Inactive, wrong *Member Class*, or the customer is B2C. | Check the rule; limits apply per member class. |

## Related documentation

- [E-Commerce module](/modules-v2/ecommerce/)
- [Push Notification Configuration](/applets/ecommerce/cp-commerce/push-notification-configuration/) — Firebase setup for the mobile app
- [Website Builder — User Manager](/applets/ecommerce/website-builder/user-manager/) — admin users and permissions for the webstore dashboard
