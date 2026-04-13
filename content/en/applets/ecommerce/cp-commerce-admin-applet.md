---
title: "CP Commerce Admin Applet"
description: "The complete administrative console for managing Customer Portal websites, mobile apps, dynamic forms, shipping, events, bookings, and B2B commerce controls."
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
---

{{< callout type="warning" >}}
**Work in Progress**: This documentation is currently being updated to include high-fidelity visual previews and role-specific workflows. Some sections may be subject to final verification against the latest applet build.
{{< /callout >}}

## Purpose and Overview

The **CP Commerce Admin Applet** is the central backend for your entire Customer Portal (CP) — the front-facing website and mobile app where your end-customers browse products, place orders, book events, and interact with your brand.

Instead of relying on developers to push website changes, this applet gives Marketing, E-Commerce, and Operations teams direct control over what customers see, how they interact, and what they can do — all from a single administrative console.

{{< callout type="info" >}}
**Core Concept**: This applet manages the *admin side* of the Customer Portal. It controls **Websites**, **Forms**, **Events**, **Shipping**, **Notifications**, and **Customer Access** — everything the customer experiences on the storefront is configured here.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**E-Commerce & Marketing Teams:**
- Build and manage website layouts, banners, and menus without developer support
- Create dynamic forms and surveys for customer feedback
- Set up events, activities, and bookable facilities
- Launch targeted newsletter campaigns and push notifications

**B2B Account Managers:**
- Enforce corporate spending limits on wholesale customer accounts
- Control which portal content is visible to specific customer groups
- Manage user registrations and block problematic accounts

**Operations & IT Admins:**
- Configure shipping providers and delivery fee logic
- Manage iOS and Android app version requirements
- Set up third-party integrations (Google Analytics, reCAPTCHA, social logins)
- Generate digital signature key pairs for API security

**Customer Support:**
- Moderate product reviews and ratings before they go public
- View and manage submitted customer forms
- Block abusive or defaulting users from the portal

### What Problems Does This Solve?

**The Fragmented Portal Management Problem:**

Managing an e-commerce customer portal traditionally requires:
- Developer involvement for every website layout change
- Separate tools for forms, surveys, and event bookings
- No centralized control over mobile app versioning
- Manual tracking of B2B spending limits
- Disconnected review moderation processes

**The CP Commerce Admin Solution:**

- **Visual website management** — Configure layouts, menus, and banners from one console
- **Built-in form builder** — Template and dynamic forms with submission tracking
- **Integrated event engine** — Calendar, facility, and activity booking all in one place
- **Automated B2B controls** — Spending limits auto-enforced at checkout
- **Review moderation** — Approve or reject customer reviews before they go live
- **Mobile app governance** — Force mandatory updates for outdated app versions
- **One applet, complete control** — No more switching between disconnected tools

## Key Features Overview

{{< cards >}}
  {{< card title="Website Management" subtitle="Configure layouts, menus, and website settings" link="#website-management-website-route" >}}

  {{< card title="Shipping Providers" subtitle="Set up 3PL delivery options for checkout" link="#shipping-providers-shipping-provider-route" >}}

  {{< card title="Dynamic & Template Forms" subtitle="Build surveys and manage submissions" link="#dynamic-forms-dynamic-form-route" >}}

  {{< card title="Event & Facility Booking" subtitle="Create events, manage calendars and bookable spaces" link="#events--facilities-booking-engine" >}}

  {{< card title="Spending Limits" subtitle="B2B corporate spending controls" link="#spending-limits-spending-limit-route" >}}

  {{< card title="Notifications" subtitle="Push notifications with scheduled delivery" link="#notifications-notification-route" >}}

  {{< card title="Ratings & Reviews" subtitle="Moderate customer feedback" link="#ratings--reviews" >}}

  {{< card title="Settings & Permissions" subtitle="Admin configuration and access control" link="#configuration--settings" >}}
{{< /cards >}}

## Key Concepts

### Understanding the CP Commerce Framework

The CP Commerce Admin controls the **admin-side configuration** that drives what customers see on the **Customer Portal** (the front-end).

| Concept | What It Is | Example |
|---------|-----------|---------|
| **Website** | A configured storefront entity tied to a branch, merchant, and pricing model. | "MY Online Store" linked to KL Branch |
| **Layout Instance** | A visual page template built in the Website Builder. | "Homepage Layout v2" with hero banner and product grid |
| **Dynamic Form** | A custom questionnaire built inside the applet. Has Questions and collects Responses. | "Customer Satisfaction Survey Q1 2026" |
| **Template Form** | A reusable form template with image management capabilities. | "Event Registration Form" |
| **Facility** | A bookable physical space or asset. | "Meeting Room A — Capacity 20" |
| **Activity** | A specific program or class offered within a facility. | "Saturday Yoga — 10:00 AM" |
| **Spending Limit** | A financial cap assigned to a B2B customer account. | "XYZ Corp — RM 5,000/month maximum" |

### The CP Commerce Hierarchy

```
CP Commerce Admin Applet
│
├── Website (Core entity)
│   ├── Details (branch, pricing, merchant, menus, shipping config)
│   ├── App Version (iOS / Android)
│   ├── Manage Image (website image library)
│   ├── Digital Signature (API key pairs)
│   ├── Post Registration Config
│   ├── 3rd Party Auth Config (Google, Facebook, Apple, etc.)
│   ├── Layout Instance (website page builder)
│   ├── Reviews (Review Settings + Review Votes)
│   ├── Menu List (navigation menu builder)
│   ├── Country Config (locale, language, settlement methods)
│   ├── Label List (content classification tags)
│   └── Content Category
│
├── Shipping Provider (3PL integration)
├── Rating (star ratings management)
├── Review (review moderation)
├── Users (portal user management)
├── Newsletter Topic (email campaign topics)
├── Notification (push notifications)
├── Template Form (reusable form templates)
├── Dynamic Form (survey/questionnaire builder)
├── Submitted Form (form response inbox)
├── Spending Limit (B2B budget controls)
├── Blocked Customers (blacklist management)
├── Facilities (bookable spaces)
├── Activity (programs/classes within facilities)
├── Activity Category (grouping for activities)
├── Calendar (admin calendar view)
├── Events (event management)
└── Schedule (scheduler view)
```

### The "Golden Chain" of Website Setup

Before a customer can use your portal, three things must be linked correctly:

1. **Website → Branch → Merchant** — The storefront must know which branch and merchant entity it belongs to.
2. **Website → Pricing → Pricebook** — The system must know *how to price* items (Pricing Scheme, Entity Pricing, or Ecomsync by Branch).
3. **Website → Layout → Menu** — The visual structure (which pages to show, which navigation menus to use) must be configured.

{{< callout type="tip" >}}
**Real-World Example**: You create a Website called "MY Store" → assign it to "KL HQ Branch" → set pricing to "Entity Pricing" with Pricing Scheme "Retail" → assign Top Menu "Main Nav" and Left-side Menu "Category Nav" → build a Layout Instance for the homepage → publish. Customers can now access the storefront.
{{< /callout >}}

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For E-Commerce Admins: Launch Your First Website

**Goal:** Create and publish a basic Customer Portal website.

1. **Navigate** to the **Website** section from the sidebar (default landing page)
2. **Create Website**: Click **"+"** → Enter Website Title (e.g., "My Brand Store") → Select Branch → Choose Pricing Model → Select Membership Class → Click **Create**
3. **Configure Details**: In the edit view, assign:
   - Top Menu, User Menu, Left-side Menu, Bottom Menu
   - Default Layout Routing (the homepage layout)
   - Default Authentication Portal
   - Content Category
   - Sales Order Printable Format
4. **Build Layout**: Go to the **Layout Instance** tab → Click **"+"** to create your first page layout → Use the **Website Builder** button to visually design the page
5. **Set Up App Versions** (if mobile): Go to **App Version** tab → Add iOS and Android version entries
6. **Publish**: Set Status to **Active** → Click **Save**

**What happens next?** Your Customer Portal is now live and accessible to customers. They can browse, register, and place orders based on your layout and pricing configuration.

**Pro Tip:** Enable "App Version Update Check" checkbox and set the App Store URLs to auto-prompt users with outdated mobile apps to update.

---

### For Marketing Teams: Create a Customer Survey

**Goal:** Build a dynamic form, publish it to the portal, and review submissions.

1. **Navigate** to **Dynamic Form** from the sidebar
2. **Create**: Click **"+"** → Enter form title (e.g., "Customer Satisfaction Q1")
3. **Add Questions**: Open the form → Go to the **Question** tab → Add questions (text, multiple choice, dropdown, file upload)
4. **Review Responses**: When customers submit, their answers appear in the **Response** tab
5. **Or use Template Forms**: Navigate to **Template Form** to create reusable form templates with managed images

**What happens next?** The form is available on the Customer Portal. As customers submit, you can view, filter, and export their responses from either the **Response** tab within the Dynamic Form or from the **Submitted Form** section in the sidebar.

---

### For Operations: Set Up a Shipping Provider

**Goal:** Connect a delivery service so customers see shipping options at checkout.

1. **Navigate** to **Shipping Provider** from the sidebar
2. **Create**: Click **"+"** → Enter provider name (e.g., "J&T Express")
3. **Configure Edit View**:
   - **Main Details** tab: Set provider type (Flat Rate or Table Rate)
   - **Table Rate** tab (if applicable): Define rates by weight, destination, or order value
   - **API Details** tab: Enter the provider's API credentials for real-time rate calculation
4. **Link to Website**: Go back to the Website Edit → Check **"Enable Shipping Fee Process"** → Select the Shipping Fee Option → Choose Shipping Price Book or set a delivery charges item code

**What happens next?** Customers see delivery options and rates at checkout. The system calculates costs based on your configured rules.

---

## Website Management (`website` route)

### Website Listing

The default landing page of the applet. Shows all configured website/storefront entities.

**Listing View:**
- Each row = one website entity
- Key columns: Website Code, Website Title, Status
- Click any row to open the edit view

### Website Create

**Creating a new website — Field-by-Field Guide:**

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Website Title** | Display name for this storefront | Yes | "MY Online Store" |
| **Branch** | The physical branch this website is linked to | Yes | "KL HQ" |

After clicking **Create**, you are taken to the full edit view with many more fields and tabs.

### Website Edit — Tabs Overview

When you select a website to edit, you'll see the **full configuration panel** with the following tabs:

| Tab | Purpose |
|-----|---------|
| **Details** | Core configuration: pricing, menus, shipping, merchant, app store URLs, reseller settings, web-chat, and many checkboxes |
| **App Version** | Manage iOS and Android app version requirements (sub-tabs: iOS, Android) |
| **Manage Image** | Image library manager for the website — upload, search, and link images |
| **Digital Signature** | Generate RSA/ECDSA key pairs for secure API communication |
| **Post Registration Config** | Configure what happens after a customer registers on the portal |
| **3rd Party Auth Config** | Integration settings for external login and analytics providers |
| **Layout Instance** | Build and manage website page layouts using the visual Website Builder |
| **Reviews** | Configure review settings and manage review vote options (sub-tabs: Review Settings, Review Votes) |
| **Menu List** | Create and manage navigation menus (Top Menu, User Menu, Left-side Menu, Bottom Menu) |
| **Country Config** | Localization settings by country — languages, settlement methods, labels |
| **Label List** | Content classification labels and hierarchical child labels |
| **Content Category** | Categories for organizing website content |

---

#### Details Tab (Deep Dive)

This is the most field-heavy tab. Here's the full configuration:

| Field | Purpose | Required | Conditional |
|-------|---------|----------|-------------|
| **Website Code** | Auto-generated unique ID | Read-only | — |
| **Website Title** | Display name of the storefront | Yes | — |
| **Branch** | Linked branch entity | Yes | — |
| **Pricing** | How prices are determined for this store | Yes | — |
| **Pricing Scheme** | Select the pricing scheme | *Conditional* | Shows when Pricing = "Pricing Scheme" or "Entity Pricing" |
| **Pricing Scheme 2** | Optional secondary pricing scheme | *Conditional* | Shows when Pricing = "Pricing Scheme" or "Entity Pricing" |
| **Price Book** | Select price book directly | *Conditional* | Shows when Pricing = "Ecomsync by Branch" |
| **Merchant** | Which merchant entity this store represents | No | — |
| **Enable Shipping Fee Process** | Checkbox to activate shipping at checkout | No | — |
| **Shipping Fee Options** | Select how shipping fees are calculated | *Conditional* | Shows when "Enable Shipping Fee Process" is checked |
| **Item Code for Delivery Charges** | Doc item used for delivery charge line items | *Conditional* | Shows when shipping fee option = Delivery Charges |
| **Default Shipping Price Book Code** | Shipping pricebook for rate calculation | *Conditional* | Shows when shipping fee option = Shipping Price Book |
| **Item Code for Shipping Fee** | Doc item used for shipping fee line items | *Conditional* | Shows when shipping fee option = Shipping Price Book |
| **Enable Fixed Width** | Lock website to a fixed pixel width | No | — |
| **Fixed Width** | The pixel value for fixed width | *Conditional* | Shows when "Enable Fixed Width" is checked |
| **Default Discount Price Book** | Default pricebook for promotional discounts | No | — |
| **Top Menu** | Navigation menu shown at the top of the website | No | — |
| **User Menu** | Navigation menu for logged-in user options | No | — |
| **Left-side Menu** | Sidebar navigation menu | No | — |
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
| **Hide Website Builder Elements** | Checkboxes to hide: Banners, Menu Manager, Layout Manager, Image Manager, Product Management, Voucher Management, Event Manager, Notification, Shipping, QR Code Manager, Activity Manager | No | — |
| **Created By / Created Date / Modified By / Modified Date** | Audit fields | Read-only | — |

---

#### App Version Tab

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

#### 3rd Party Auth Config Tab

Integrations with external authentication and analytics providers. Contains **7 sub-tabs**:

| Sub-Tab | Purpose |
|---------|---------|
| **Google reCAPTCHA** | Configure site key and secret key for bot protection on forms |
| **Google Login** | Enable "Sign in with Google" for portal customers |
| **Facebook Login** | Enable "Sign in with Facebook" |
| **Mini-Orange Login** | SSO integration via Mini-Orange identity provider |
| **Apple Login** | Enable "Sign in with Apple" for iOS users |
| **Google Analytics** | Configure GA tracking ID to monitor website traffic |
| **Zendesk Live Chat** | Embed Zendesk chat widget on the Customer Portal |

---

#### Digital Signature Tab

Generate cryptographic key pairs used for secure API communication between the Customer Portal and external systems.

| Field | Purpose | Required |
|-------|---------|----------|
| **Key Algorithm** | Select the encryption algorithm (RSA, ECDSA, etc.) | Yes |
| **Key Size** | Select key length (2048, 4096, etc.) | Yes |
| **Key Status** | Active/Inactive status of the key pair | Yes |
| **Generate Key Pair** | Button to generate the public/private keys | — |
| **Private Key** | The generated private key (keep confidential) | Read-only |
| **Public Key** | The generated public key (share with integrators) | Read-only |

---

#### Layout Instance Tab

Lists all page layouts configured for this website. Each layout represents a visual page (homepage, product listing page, etc.) that you build using the **Website Builder**.

**Creating a Layout Instance:**
- Click **"+"** to create a new layout
- Set a layout code and enter basic details
- Use the **Website Builder** (accessible from the Website Edit header button) to visually design the page

**Editing a Layout Instance — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main** | Layout code, name, and basic configuration |
| **Node Configuration** | Add and configure content nodes (widgets, sections, product grids) within the layout |

##### How the Visual Website Builder Works

The Website Builder provides a visual, drag-and-drop workspace similar to platforms like Wix or Shopify, allowing you to design pages interactively.

The workspace is divided into three main columns:

1. **Elements Palette (Left)**: Contains structural and functional elements (Rows, Columns, Widgets) that you can drag into your page.
2. **Interactive Canvas (Center)**: The drag-and-drop layout area. Drop elements here, rearrange them, or select them to edit their properties.
3. **Properties Panel (Right)**: Contains tabs to configure whatever is selected:
   - **Selected Node**: Adjust settings, choose a **Widget ID** (from 65+ options), and set basic styles.
   - **Layout**: Configure global layout settings.
   - **JSON**: A technical view to directly inspect or edit the raw layout configuration schema.

**Building a page works like this:**

Every layout is built using a node-based architecture using three fundamental blocks:

| Element Type | What It Does | Example |
|-----------|-------------|---------|
| **Row** | A horizontal container that holds columns side by side | A full-width banner section |
| **Column** | A vertical container within a row to control width | A 25% sidebar next to a 75% main content area |
| **Widget** | A functional UI component that renders content | Product Slider, Checkout Step, Image Gallery |

**Workflow:**
1. **Drag a Row element** from the palette onto the canvas.
2. **Set the Number of Children** inside the Row's properties to divide it into Columns.
3. **Drag Widgets** into the columns to add functionality.
4. **Configure each widget** in the Properties Panel by selecting its **Widget ID** and filling in specific parameters.

{{< callout type="tip" >}}
**Pro Tip**: Think of it like building a bookshelf. Rows are the shelves, Columns are the dividers, and Widgets are the books, decorations, and items you place on the shelves to bring it to life!
{{< /callout >}}

---

##### Widget Reference Guide

Below is the complete catalog of all available widgets, organized by category. When configuring a node as a **Widget**, select the appropriate Widget ID from the dropdown and configure its parameters.

---

###### 🏗️ Structure & Header Widgets

These widgets control the overall page structure — headers, footers, and navigation shells.

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `GENERIC_HEADER` | Generic Header | Standard website header with logo, search, and cart icon. | Sticky mode, image width, search route, search button color/text, hide cart, menu background/color, disable parent route |
| `CLICKNET_HEADER` | Clicknet Header | Themed header for Clicknet-style websites. | Sticky mode, image width, search route, show search button |
| `FUSION_HEADER` | Fusion Header | Themed header for FusionTech-style websites. | Sticky mode, image width, search route, show search button |
| `MOBILE_HEADER` | Mobile Header | Header optimized for mobile app views. | Cart route, show logo, show menu, enable sidebar, show back button, search bar toggle, sticky mode, badge background/color, search background/shadow, category GUID, cart/back/menu position, sub-menu toggle, menu list GUID, display entity, full display, line length |
| `FOOTER` | Footer | Website footer with contact info and links. | Mobile mode, header size, mobile footer field, email, Facebook URL, Instagram URL, capitalize text, display description, display logo, description color, footer headers and text blocks (1 & 2) |
| `BIO_FOOTER` | Bio Footer | Footer with company bio, address, and social links. | Footer line 1/2/3, postal code, city, state, email, phone, social title, social icon color, Facebook URL, Instagram URL, TikTok URL, YouTube URL |

---

###### 🛍️ Product Display Widgets

These widgets showcase products on the storefront.

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `PRODUCT_SLIDER` | Product Slider | Horizontal carousel of products, filterable by category. | Title, category group (label list), category (label hdr), product list display layout, product details layout, line count for name, hide add to cart, hide favourite, display attribute icons, multiple pricing scheme design |
| `PRODUCT_SLIDER_V2` | Product Slider V2 | Enhanced product slider with visibility and arrow controls. | All Product Slider params + visible items (desktop), visible items (mobile), hide arrows, hide add to cart, hide favourite |
| `PRODUCT_LIST` | Product List | Grid/list view of all products. | Product details layout URL |
| `PRODUCT_DETAILS` | Product Details | Full product detail page with images, price, description. | Enable auth guarantee, auth color, show socials (share buttons), show vouchers |
| `EXTERNAL_PRODUCT_DETAILS` | External Product Details | Product detail page with WhatsApp inquiry button. | WhatsApp number |
| `PRODUCT_CATEGORY` | Product Category | Display product categories as browsable sections. | Category group filter, label list, product listing layout URL |
| `PRODUCT_POSTS` | Product Posts | Display product-related posts (specification, description, pages). | Drag-and-drop ordering of: Product Specification, Product Description, Product E-Com Description, Product Pages |
| `CATEGORY_FILTER_PRODUCT_LIST` | Category Filter Product List | Product list with a category filter bar on top. | All Product Slider params + background/text/active/scroll colors, enable filter bar, display title, infinite scrolling toggle, web/mobile column count, product limit, show all products |
| `CATEGORY_SLIDER` | Category Slider | Horizontal slider of product categories. | Label, category title, category card style, category padding, category group GUID |
| `CATEGORY_TILES_LISTING` | Category Tiles Listing | Visual grid of category tiles with images. | Title, label list, choose specific categories to display, display card mode, button position |
| `POWER_SEARCH_FILTER` | Power Search Filter | Advanced search with sorting and filtering controls. | Line count, hide add-to-cart, hide favourite, disable square image, custom image height, sorting functions (Latest/Popular/Top Sales/Price via drag-and-drop), show search result message, display attribute icons |
| `CARD_LAYOUT_WIDGET` | Card Layout Widget | Display items in a card-based layout. | Card title, post GUIDs |
| `CARD_SLIDER_WIDGET` | Card Slider Widget | Horizontal card slider with image management. | Card images array |
| `IMAGE_CARD_WIDGET` | Image Card Widget | Display images in card format with links. | Card image array |

---

###### 🧭 Navigation & Menu Widgets

These widgets control how customers navigate the website.

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `VERTICAL_MENU` | Vertical Menu | Sidebar-style vertical navigation menu. | Menu list selection |
| `HORIZONTAL_MENU` | Horizontal Menu | Top-bar horizontal navigation menu. | Menu list selection |
| `TAB_MENU` | Tab Menu | Tab-style navigation for sub-sections. | Menu list selection |
| `SCROLLABLE_MENU_WIDGET` | Scrollable Menu | Horizontally scrollable menu for mobile views. | Menu list selection |
| `BORDERED_TAB_MENU` | Bordered Tab Menu | Tab menu with bordered styling. | Menu list selection |
| `MOBILE_TAB_MENU` | Mobile Tab Menu | Bottom tab bar for mobile app navigation. | Menu list selection |
| `MENU_BTN` | Menu Button | A standalone menu button widget. | Menu list selection |

---

###### 🛒 E-Commerce Workflow Widgets

These widgets handle the shopping and purchasing journey.

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `SHOPPING_CART` | Shopping Cart | The customer's shopping cart view. | Checkout route URL |
| `CHECKOUT_STEP_V2` | Checkout Step (V2) | Multi-step checkout flow widget. | Enable shipping, enable membership points conversion, enable cash voucher, enable payment gateway, allow self pick-up, shipping/billing address layout URLs, product listing layout URL, + full style configuration for each step (Shopping Cart, Shipping, Voucher, Membership Points, PGW) including: title, back/next button text, colors, backgrounds, and borders |
| `ORDER_LISTING` | Order Listing | List of customer's past orders. | Order details layout, order item details layout, enable status icons, tracking website URL, product category listing route, sales order status, sales order cancel status, show received button |
| `SALES_ORDER_DETAILS` | Sales Order Details | Individual order detail page. | Background color, border, confirmation message |
| `MY_INVOICE` | My Invoice | List of customer's invoices. | Invoice detail layout URL |
| `MY_INVOICE_DETAIL` | My Invoice Detail | Individual invoice detail view with refund option. | Invoice item detail layout, enable refund request, request refund layout URL, max number of days for refund |
| `REQUEST_REFUND` | Request Refund | Refund request form. | Reasons array (add/remove refund reasons), email recipient for refund notifications |
| `MY_SHIPPING_ADDRESS` | My Shipping Address | List of saved shipping addresses. | Add address route, edit address route |
| `MY_SHIPPING_ADDRESS_ADD` | Add Shipping Address | Form to add a new shipping address. | On-save redirect route |
| `MY_SHIPPING_ADDRESS_DETAILS` | Shipping Address Details | View/edit an existing shipping address. | On-save redirect route |
| `PROMOTIONAL_WIDGET` | Promotional Widget | Display promotions and special offers. | *(Minimal configuration)* |

---

###### 📝 Content & Media Widgets

These widgets display content, images, videos, and text.

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `TEXT_WIDGET` | Text Widget | Rich-text content block using Froala editor. | Content (WYSIWYG HTML editor) |
| `IMAGE_DISPLAY` | Image Display | Display a single image with optional link. | Image URL (from media library), image link route, query parameters |
| `IMAGE_GALLERY` | Image Gallery | Gallery grid of images from a Drive folder. | Drive folder selection, media display layout URL |
| `VIDEO_GALLERY` | Video Gallery | Gallery grid of videos from a Drive folder. | Drive folder selection, media display layout URL |
| `AUDIO_GALLERY` | Audio Gallery | Gallery grid of audio files from a Drive folder. | Drive folder selection, media display layout URL |
| `MEDIA_PLAY_LIST` | Media Playlist | Playlist-style media player. | Drive folder selection, media display layout URL, thumbnail driver |
| `VIDEO_SLIDER_WIDGET` | Video Slider | Horizontal video carousel. | Media array with video entries |
| `SLIDER_V2` | Image Slider V2 | Advanced image carousel with button overlays. | Images array with: image URL, link route, query params + button overlays with text, font, color, background, border, icon, time |
| `SLIDER_BUTTON_WIDGET` | Slider Button Widget | Slider with configurable CTA buttons. | Button array with: text, font, text color, background, border color, time, icon |
| `STATIC_PAGE_DISPLAY` | Static Page Display | Render a static content page by its post GUID. | Post selection dropdown |
| `POST_CATEGORY_TAB` | Post Category Tab | Display posts grouped by category in tabs. | Post/Content category selection |
| `POST_CATEGORY_CARD` | Post Category Card | Display posts as cards with image and content columns. | Image column width, content column width, header font, content category |
| `IFRAME_DISPLAY` | Iframe Display | Embed an external page in an iframe. | Target URL |
| `COUNTDOWN_TIMER` | Countdown Timer | Display a countdown to a specific date/time. | Target date/time |

---

###### 👤 User Account & Membership Widgets

These widgets handle user authentication, registration, and membership features.

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `LOGIN_WIDGET` | Login Widget | Login and registration page. | Reset password page route, sign-up page route, privacy agreement doc, T&C agreement doc, disable privacy/terms during sign-up, require date of birth, require name, enable privacy policy, enable T&C, registration type, privacy policy layout, button font |
| `LOGIN_V2_WIDGET` | Login V2 Widget | Enhanced login widget with updated design. | Same as Login Widget with improved layout |
| `WELCOME_HEADER` | Welcome Header | Personalized welcome message for logged-in users. | Welcome message text, email, phone number |
| `MEMBERSHIP` | Membership | Display membership tier cards. | Membership class array, primary/secondary font color, default background color, icon color |
| `MEMBER_POINTS_COUNTER` | Membership Points Counter | Display member's loyalty points balance. | Point color, line color, desktop margin |
| `WARRANTY_REGISTRATION_WIDGET` | Warranty Registration | Warranty registration form for products. | *(Minimal configuration)* |

---

###### 📋 Form & Interaction Widgets

These widgets embed forms, surveys, and interactive elements.

| Widget ID | Widget Name | What It Does | Key Configurable Parameters |
|-----------|------------|-------------|----------------------------|
| `DYNAMIC_FORM_WIDGET` | Dynamic Form Widget | Embed a dynamic form/survey on the page. | Dynamic form selection |
| `TEMPLATE_FORM_WIDGET` | Template Form Widget | Embed a template form on the page. | Template form selection, string array for custom fields |
| `ACTIVITY_SCHEDULE` | Activity Schedule | Display bookable activity schedules. | Activity GUID |
| `CALENDAR_WIDGET` | Calendar Widget | Interactive calendar for viewing events/bookings. | Activity category array |
| `BUTTON_SINGLE` | Button Single | A standalone CTA button with full styling. | Text, font, text color, background color, border (radius, width, style, color), size, height, destination URL, link type (Component / Page / Content Category / External Link / Layout Instance), position |
| `STICKY_TEXT_BUTTON` | Sticky Text Button | A floating button fixed to the screen. | Button text, color, background, route |

---

###### 🎨 Theme-Specific Widgets

These are special-purpose widgets designed for specific platform themes or client implementations.

| Widget ID | Widget Name | What It Does |
|-----------|------------|-------------|
| `MONALIZA_HOME` | Monaliza Homepage | Custom homepage widget for Monaliza theme — includes activity categories configuration |

---

##### Widget Configuration Quick Reference

When you click on any placed widget on the interactive canvas, the **Properties Panel** on the right side updates to show the **Selected Node** form. This form allows you to:

- **Set the Node Name & Type**
- **Select the Widget ID** via the dropdown
- **Input Widget Config (JSON)** for advanced configurations 
- **Declare basic CSS Styles**

**Common patterns across widget configuration:**

- **Layout Route Fields** — Many widgets ask you to specify "layout URLs" (e.g., Product Details Layout, Invoice Detail Layout). These are the **layout instance codes** of other pages in your website. For example, if your Product Details page has layout code `product-detail-page`, you enter that code here so the widget knows where to navigate when a customer clicks.

- **Category Group / Category Fields** — Product-related widgets let you filter by category using Label List (category group) and Label Hdr (specific category). This controls which products appear in the widget.

- **Button Style Fields** — Many widgets (Checkout Step, Slider Button, Sticky Button) expose granular style controls: text, font, text color, background color, border color, border radius, and size. Use these to match your brand guidelines.

- **Drag-and-Drop Sorting** — Some widgets (Power Search Filter, Product Posts) let you drag items between "Available" and "Selected" lists to control which features appear and in what order.

{{< callout type="important" >}}
**Key Concept — Layout Routes**: When a widget parameter asks for a "Layout URL" or "Layout Route", it expects the **code** of another Layout Instance within the same website. This is how widgets link pages together — for example, the Product Slider widget needs to know which layout to open when a customer clicks a product. If this is left blank, customers will see a broken navigation.
{{< /callout >}}

---

#### Country Config Tab

Manage locale-specific settings per country.

**Country Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main** | Country name and basic settings |
| **Language Selection** | Assign which languages are available for this country |
| **Settlement Methods** | Configure payment/settlement options per country |
| **FI Label List Link** | Link financial instrument labels for this country (Details + Label Hdrs sub-tabs) |

---

#### Reviews Tab

Contains two sub-tabs for managing the review system:

| Sub-Tab | Purpose |
|---------|---------|
| **Review Settings** | Configure review rules: min/max rating, auto-approve thresholds, review fields |
| **Review Votes** | Manage voting options (e.g., "Was this review helpful?") |

---

## Shipping Providers (`shipping-provider` route)

**What is the Shipping Provider section?**

Configure third-party logistics (3PL) providers that appear as delivery options during customer checkout.

**Shipping Provider Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Provider name, code, type (Flat Rate, Table Rate, API-driven), base rate |
| **Table Rate** | Define rate rules based on weight tiers, geographic zones, or order value ranges |
| **API Details** | Enter API credentials (key, secret, endpoint) for real-time shipping rate queries |

---

## Dynamic Forms (`dynamic-form` route)

**What are Dynamic Forms?**

A built-in survey and questionnaire builder. You design questions, and customers fill in responses directly on the Customer Portal.

**Dynamic Form Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Form title, description, and configuration |
| **Question** | Add and manage individual questions (text, multiple choice, dropdown, file upload) |
| **Response** | View all customer submissions for this form |

---

## Template Forms (`template-form` route)

Reusable form templates with built-in image management. Useful for creating standardized registration or feedback forms.

**Template Form Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Template name, code, and description |
| **Manage Images** | Upload and manage images used within the form template |

---

## Submitted Forms (`submitted-form` route)

The central inbox for all customer form submissions across both Dynamic Forms and Template Forms. Admins can view, filter, export, and take action on submitted responses.

---

## Events & Facilities Booking Engine

### Facilities (`facilities` route)

Define bookable physical spaces or assets.

**Facilities Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Facility name, capacity, operating hours, location |
| **Activities** | Link specific activities offered in this facility (e.g., "Yoga Class") |
| **Event** | View events associated with this facility |
| **Media Library** | Upload images and media for this facility's portal listing |

### Activities (`activity` route)

Programs, classes, or services offered within a facility.

**Activity Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main Details** | Activity name, description, pricing, duration |
| **Manage Images** | Upload promotional images for this activity |
| **Events** | View events that include this activity |

### Activity Categories (`activity-category` route)

Group activities into logical categories (e.g., "Fitness", "Workshops", "Consultation"). Helps customers filter and browse available programs.

### Events (`events` route)

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

### Calendars (`calendars` route)

Admin calendar view for managing scheduled events and bookings.

**Calendar Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Main** | Calendar name, description, and settings |
| **Members** | Assign team members who manage this calendar |

### Schedule (`schedule` route)

Scheduler view for visualizing bookings across facilities and time slots.

---

## Spending Limits (`spending-limit` route)

**What are Spending Limits?**

Automated financial controls for B2B customer accounts. Set maximum purchasing amounts per period (daily, monthly, yearly).

**Real-World Scenario:**
```
Company: XYZ Corp
Purchasing Manager: Ahmad
Spending Limit: RM 5,000 / month

Scenario: Ahmad's cart totals RM 6,200
Result: Checkout is BLOCKED — exceeds monthly limit
Action: Finance approves an exception, or Ahmad splits the order
```

---

## Ratings & Reviews

### Ratings (`rating` route)

Manage product/service star ratings submitted by customers.

**Rating Edit — Tab:**

| Tab | Purpose |
|-----|---------|
| **Details** | View rating details — product, customer, score, date |

### Reviews (`review` route)

Moderate written product/service reviews before they appear publicly on the portal.

**Review Edit — Tab:**

| Tab | Purpose |
|-----|---------|
| **Details** | Review text, author, rating score, approval status |

---

## Users (`users` route)

Portal user management — view all registered Customer Portal users.

**Users Edit — Tab:**

| Tab | Purpose |
|-----|---------|
| **Details** | User profile info, registration date, email, status |

---

## Blocked Customers (`blocked-customers` route)

Blacklist management — block abusive, fraudulent, or defaulting users from accessing the Customer Portal entirely.

---

## Newsletter Topics (`newsletter-topic` route)

Create topic-based mailing lists. Customers subscribe to topics they care about.

**Newsletter Topic Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Details** | Topic name, description, and configuration |
| **Manage Image** | Upload header/banner images for the newsletter |
| **Subscribers** | View and manage subscribed members |
| **Member Label Link** | Link membership labels to auto-subscribe relevant customer segments |

---

## Notifications (`notification` route)

Send push notifications to Customer Portal mobile app users.

**Notification Edit — Tabs:**

| Tab | Purpose |
|-----|---------|
| **Details** | Notification title, body content, and targeting rules |
| **Scheduled** | Set date/time for scheduled delivery |

Each notification can have **Posts** (sub-items) with their own tabs:

| Tab | Purpose |
|-----|---------|
| **Main** | Post title, content, and details |
| **Manage Image** | Upload images for the notification post |

---

## Configuration & Settings

Access via the **Settings** sidebar menu item.

### Feature Visibility (`Settings > Feature Visibility`)

Toggle which features are visible/accessible in the applet. This is the default settings landing page.

### Default Settings (`Settings > Default Selection`)

Set system-wide default values that auto-populate when creating new records.

### Field Configuration (`Settings > Field Settings`)

Configure which fields are visible, required, or hidden across different forms in the applet.

### Webhook (`Settings > Webhook`)

Configure outbound webhooks to notify external systems when events occur (e.g., new form submission, new review, new user registration).

### Permission Management

| Setting | Purpose |
|---------|---------|
| **Permission Set Listing** | Define named permission sets (e.g., "Marketing Admin", "Event Manager") |
| **User Permission Listing** | Assign permission sets to individual users |
| **Team Permission Listing** | Assign permission sets to teams |
| **Role Permission Listing** | Assign permission sets to roles |

---

## Personalization

Access via the **Personalization** sidebar menu item.

### Personal Default Settings (`Personalization > Personal Default Selection`)

Set your own personal default values. These only affect your account and override system defaults where applicable.

### Sidebar (`Personalization > Sidebar`)

Customize which sidebar menu items you see. Hide sections you don't use to declutter your workspace.

---

## FAQ

**Q: I created a website but customers can't see it. What's wrong?**
A: Check three things: (1) Status must be set to **Active**. (2) A **Default Layout Routing** must be assigned so the homepage has content. (3) The **Branch** and **Merchant** must be correctly linked.

**Q: Can I have multiple websites for different countries or brands?**
A: Yes. Each website entity can be linked to a different branch, pricing scheme, and country configuration. Use the **Country Config** tab within each website to manage locale-specific settings.

**Q: The mobile app is showing "Update Required" but my users already have the latest version.**
A: Go to `Website Edit > App Version > iOS/Android`. Ensure the **Version Number** exactly matches the semantic version submitted to the App Store / Play Store (e.g., "3.5.2" not "v3.5.2"). A mismatch triggers a false mandatory update prompt.

**Q: How do Spending Limits affect regular B2C customers?**
A: They don't. Spending Limits are designed for B2B Corporate customer groups only. B2C retail customers have no spending cap — their purchases are limited only by their payment method at checkout.

**Q: I can't see some sidebar menu items that other team members can see.**
A: Check two things: (1) Your **Permission Set** in Settings may not include access to those features. Ask your admin to verify. (2) Your **Personalization > Sidebar** settings may have those items hidden.

**Q: How do I make a form available on the Customer Portal?**
A: Create the form in **Dynamic Form** or **Template Form**, add your questions, and the form automatically becomes accessible on the portal. The **Submitted Form** section in the sidebar collects all responses.

**Q: What's the difference between "Review" in the sidebar and "Reviews" tab inside website edit?**
A: The **Review** sidebar item is a global moderation queue for all product reviews across all websites. The **Reviews** tab inside Website Edit is for configuring review *settings* (rules, vote options) specific to that website.

**Q: Customers report they can't log in with Google on the portal.**
A: Go to `Website Edit > 3rd Party Auth Config > Google Login` and verify the OAuth Client ID and Secret are correctly configured and not expired. Also check that the redirect URI matches your portal domain.
