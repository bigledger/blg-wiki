---
topic: cp-commerce-admin-applet
aliases: [CP Commerce Admin, CP Commerce Admin Console, customer portal admin, cp_commerce_admin_console_v1, website builder admin]
applets: [cp_commerce_admin_console_v1]
modules: [ecommerce, membership]
related: [shopping-cart-applet, ecommerce-catalog-applet, seller-admin-applet, pdg-applet, membership-admin-applet, voucher-management-applet, commission-scheme-applet, events-management-applet, customer-applet, pricebook-applet, shipping-pricebook-applet, cashbook-applet, website-builder, push-notifications]
wiki:
  - content/en/applets/ecommerce/cp-commerce-admin-applet.md
  - content/en/applets/ecommerce/cp-commerce/push-notification-configuration.md
  - content/en/applets/ecommerce/website-builder/user-manager.md
status: growing
updated: 2026-09-05
---

# CP Commerce Admin

The tenant-side console for Customer Portal storefronts (web and mobile). One **Website** record per storefront carries pricing model, menus, layouts, sign-in providers, shipping configuration, legal agreements and linked accounts across 21 edit tabs; the sidebar adds rating configuration, newsletter topics, notifications, forms, spending limits, blocked customers and the facilities / activities / events booking engine. Not a document applet — nothing posts.

## Facts

- 2026-09-05 — Registry: code `cp_commerce_admin_console_v1`, name "CP Commerce Admin", TNT-ADMIN, ACTIVE; documentation_url points at Confluence. No rows in `bl_applet_client_side_perm_dfn` for this code. [src:planning/private/registry-applets-2026-09-05.tsv] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Source lives at `blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/` (the repo root `micro-fe/src/app` is only the shell; a `media-library-applet` sits beside it). The storefront itself is the separate `wavelet-cp-commerce` Ionic/Angular app. [src:blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/] [src:wavelet-cp-commerce/README.md]
- 2026-09-05 — Sidebar (`menu-items.ts`): Website, Rating Configuration, Topics (`newsletter-topic`), Notification, Forms → Template Forms / Submitted Forms, Dynamic Forms, Spending Limit, Blocked Customers, Facilities, Audit Trail (added 2026-08, gh:bigledger/blg-intranet#5340), Activities → Activity / Activity Category / Calendars / Events / Scheduler. **Commented out:** Review, Shipping Provider ("TO DO LATER"), Users — routes `review`, `shipping-provider`, `users` still exist. [src:…/cp-commerce-admin-applet/src/app/models/menu-items.ts] [src:…/src/app/app.routing.ts]
- 2026-09-05 — Settings menu: Field Settings, Default Selection; routes also webhook, feature-visibility, permission-set / user / team / role listings. Personalization: Field Settings, Default Selection, Sidebar. Default Selection stores `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_TIMEZONE`. No `applet-settings.model.ts`; the shared field-configuration screen matches 0 keys for this applet; the code reads no `appletSettings.*` and checks no `perm_code`. [src:…/src/app/components/settings-container/default-settings/] [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html]
- 2026-09-05 — Website create requires Title, Branch, Membership Class, Status; edit tabs (21): Details, App Version (Ios / Andriod), Manage Image, Digital Signature, Post Registration Config, 3rd Party Auth Config (Google reCaptcha, Google Login, Facebook Login, Apple Login, Mini-Orange Login, Google Analytics, Zendesk Live Chat), Layout Instance, Reviews (Review Settings / Review Votes), Menu List, Label List, Content Category, Posts, User Agreement, Account, Commission Scheme, Language, Branch, Region, Country, Voucher Management, Settlement Method. [src:…/src/app/components/website-container/website-edit/website-edit.component.html]
- 2026-09-05 — Details tab: Pricing = `PRICING_SCHEME` / `ENTITY_PRICING` / `ECOMSYNC_BY_BRANCH` with Pricing Scheme, Pricing Scheme 2 or Price Book; Enable Shipping Fee Process → Shipping Fee Option = Shipping Pricebook / Delivery Charges / Delivery Charges by Country / Delivery Charges by Region (+ item code for delivery charges / shipping fee, default shipping price book); checkboxes `enablePublicCart`, `entity` (Restrict View/Access by Entity), `restrictNotificationByMember`, `enableWebchat` (+ UCC endpoint), `enableFixedWidth`, `enableResellerWebsite` (+ banner text/colours/font), `enableAppVersionUpdateCheck` (+ Google / Apple store URLs), `enableWebsitePreLoading`, and the eleven `hide*` Website Builder tile switches; Privacy Agreement / Terms & Conditions Agreement document pickers; Sales Order Printable Format; sales agent label. [src:…/website-edit.component.html] [src:…/website-edit.component.ts]
- 2026-09-05 — Post Registration Config: Team, `add_user_to_tenant`, `create_entity`, `create_membership_with_entity`, `create_membership_without_entity`. Spending Limit: Name, Code, Amount, Period (days), Ban Period (days), Currency, Status, Member Class, Amount for New Member, Email(s), Phone Number(s). Shipping Provider types: Flat, Table (Table Rate tab), Integration (API Details tab). [src:…/website-edit/post-registration-config/] [src:…/spending-limit-container/] [src:…/shipping-provider-container/]
- 2026-09-05 — Required validators: Dynamic Form name/status/website (create), code (edit); Question name/type/required/status; Activity and Activity Category code/name; Event title/startDate; Calendar calendarName; calendar member user_email; facility event end_date/location. [src:…/src/app/components/*/]
- 2026-09-05 — Issues (anonymised): Account tab pagination broken, fixed and tab moved next to Details (2026-07, gh:bigledger/blg-int-general-task#8591); item shown on storefront without price although prices set — pricing-model mismatch investigation (#9733); wrong-TAC email confirmation now shows a toaster (portal app, #9804); "disable website" request = set Status Inactive (#7003); capital-letter search returned NO MATCHING RECORD FOUND (2025-05); parent menu not saving (2025-06); app version check pop-up (2025-07); deep-link fix (2025-09); website-builder menu configuration options (gh:bigledger/wavelet-cp-commerce#151); open requests: Copy Template (gh:bigledger/blg-applets-wavelet-cp-commerce#3), configurable Remove All at checkout (#6), user fingerprint backend (blg-intranet#1883).

## How it connects

- **website-builder** — the Website Builder button opens the storefront's dashboard (Menu / Layout / Image / Product / Voucher / Event / Notification / Shipping / QR Code / Activity Manager); each tile can be hidden per website from the Details tab.
- **membership-admin-applet** — membership class is mandatory on a website; Post Registration Config and Spending Limit hang off member classes and labels.
- **shopping-cart-applet** — checkout output; the website's Sales Order Printable Format applies to the customer's order document.
- **push-notifications** — the Notification menu schedules pushes; Firebase setup is on the push-notification-configuration page.

## Open questions

- Are Review, Shipping Provider and Users meant to return to the sidebar? Their screens are complete and routable.
- Where does `DEFAULT_TIMEZONE` apply exactly (notification scheduler, event times, both)? Not traced this run.
- The widget catalogue (GENERIC_HEADER … BUTTON_SINGLE) on the page comes from the front-end repo and was not re-verified.

## Wiki impact

- Pages for Shopping Cart, E-Commerce Catalog, Seller Admin, PDG (this lane) and the membership / master-data pages listed in findings should link back to `cp-commerce-admin-applet`.
- `static/images/cp-commerce/cp-commerce-features.jpg` and `cp-commerce-framework.png` are no longer referenced.
