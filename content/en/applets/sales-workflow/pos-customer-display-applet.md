---
title: "POS Customer Display Applet"
description: "Enhanced customer-facing secondary display for Point-of-Sale terminals"
tags:
- pos
- customer-display
- retail
- checkout
- transactional-visibility
weight: 240
---

{{< callout type="warning" >}}
**POS Customer Display Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **POS Customer Display Applet** is a specialized retail tool designed to manage the content and layout of a secondary monitor facing the customer. It provides real-time transaction visibility, promotional messaging, and interactive elements during the checkout process.

{{< callout type="info" >}}
**Core Concept**: A **Customer Display** acts as a transparent window into the transaction, showing the items being scanned, calculations, and payment prompts.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Retail Customers:**
- Clear visibility of itemized prices and totals
- Review of discounts and promotions applied
- Interactive QR payment code display

**Cashiers & Retail Staff:**
- Reduced customer disputes regarding pricing
- Automated promotional displays (no manual switching)
- Enhanced checkout professionalism

**Marketing & Store Managers:**
- Display advertisements and cross-sell offers
- Branded logos and seasonal themes
- Real-time customer feedback collection (optional)

### What Problems Does This Solve?

**The Checkout Friction Problem:**
Without a dedicated customer display:
- Customers often feel "in the dark" about pricing
- Manual disputes at the end of the transaction take time
- Missed opportunities for last-minute promotions

**The Customer Display Solution:**
- **Dynamic Transaction List** - Items appear on screen as they are scanned
- **Branded Visuals** - Slideshows of promotions when the terminal is idle
- **Integrated Payment Prompts** - Display total amount and QR codes for easy scanning

## Key Features Overview

{{< cards >}}
  {{< card title="Live Invoice View" subtitle="Real-time transaction line items" link="#invoice-view" >}}

  {{< card title="Promotional Slideshow" subtitle="Display ads during idle time" link="#promotions" >}}

  {{< card title="Payment QR Display" subtitle="Integrated checkout and payment QR codes" link="#payment-display" >}}

  {{< card title="Layout Configuration" subtitle="Customize the look and feel for your brand" link="#settings" >}}
{{< /cards >}}

## Key Concepts

### Display States

| State | Content | Primary Goal |
|-----------|------------|-----------------|
| **Idle** | Promotional images/videos, Brand logo. | Marketing and branding. |
| **Active** | Itemized list, Price per item, Current Total. | Transactional transparency. |
| **Payment** | Final Total, QR codes (e.g., TNG, GrabPay). | Rapid checkout and payment. |

## Quick Start Guide

### For Store Staff: Connecting the Display

**Goal:** Ensure the customer-facing screen is active in 3 steps.

1. **Connect hardware**: Ensure the secondary monitor is connected via HDMI/USB
2. **Open Applet**: Open the **POS Customer Display** app on the terminal
3. **Launch**: Click **"Launch Display Window"** and drag it to the secondary monitor

---

### For Marketing: Updating Ads

**Goal:** Change the promotional images shown on the display.

1. **Upload Assets**: Go to **Settings > Display Assets**
2. **Set Sequence**: Arrange the images in the desired order
3. **Save**: Click **Update** to push the new slides to all terminals

---

## Configuration & Settings

Fine-tune your customer experience in **Settings**:
- **Logo Branding**: Upload your store's high-resolution logo.
- **Color Themes**: Match the display's colors to your brand palette.
- **Font Sizes**: Optimize text for readability across different screen sizes.

---

## FAQ

**Q: Can I show a video on the customer display?**
A: Yes, the applet supports MP4 and GIF formats for dynamic promotional content.

**Q: What happens if the display disconnects?**
A: The main POS terminal will continue to function, but a notification will appear to the cashier to reconnect the secondary screen.

**Q: Can the customer interact with the display (e.g., touchscreen)?**
A: If you have a touch-enabled customer screen, the applet supports basic interactions like selecting "Receipt Type" or "Rating the Experience."

**Q: Does it work on any screen size?**
A: The display is responsive and will automatically scale its content to fit standard monitor resolutions (720p, 1080p, etc.).
