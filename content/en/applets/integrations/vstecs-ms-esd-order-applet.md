---
title: "VSTECS MS ESD Order Applet"
description: "Microsoft ESD order management with API integration for price checking and order processing"
weight: 180
tags:
- applets
- microsoft
- esd-orders
- api-integration
---
Attached User guide for MS ESD Order and Work Breakdown for implementation.
This Applet required integration from BLG to EMP & BLG to Distributor's system to function correctly.
API to check MS ESD Product SKU updated price.
API to create an order to retrieve MS ESD product from distributors.
**Note
There is 2 workflow for this integration currently:
Shortcut method : EMP integration to BLG (without T2T Admin Applet)
Standard method : T2T admin applet to enable guest and host tenant connectivity , Doc-item-maintenance applet to do the item code mapping.