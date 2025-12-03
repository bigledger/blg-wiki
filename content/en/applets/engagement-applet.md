---
title: "Engagement Applet"
date: 2023-10-01T00:00:00+08:00
draft: false
description: "Documentation for the Engagement Applet in Wavelet ERP."
weight: 10
---

## Engagement Applet

The Engagement Applet is a module within the Wavelet ERP system designed to manage client engagements, project tracking, sales processes, and related reporting. It facilitates the creation and management of engagements, employee assignments, sales quotations, proforma invoices, and various financial reports such as debtor and creditor reports.

### Purpose

The primary purpose of the Engagement Applet is to streamline the management of client projects and engagements. It provides tools for tracking project details, assigning resources, generating sales documents, and producing financial reports to ensure efficient project execution and financial oversight.

### Features

- **Engagement Management**: Create, edit, and track client engagements with details on project scope, timelines, and assigned employees.
- **Employee Assignment**: Advanced search and assignment of employees to engagements using filters like name, role, and availability.
- **Sales Quotation and Invoicing**: Generate internal sales quotations and proforma invoices, including line item details for items, quantities, and pricing.
- **Reporting**: Generate reports on debtors and creditors, including deployment logs and backups for staging environments.
- **Advanced Search**: Comprehensive search capabilities for engagements and employees with options for string, number, select, and date-based filters.
- **UI Components**: Responsive layout with sidebar navigation, perfect scrollbar, and integration with Angular Material for a modern user interface.

### Key Concepts

- **Engagement**: Represents a client project or contract, including details like start and end dates, assigned team members, and associated financial documents.
- **Employee Search**: Utilizes advanced form fields for precise searching and filtering of employees to assign to engagements.
- **Sales Documents**: Includes quotations and proforma invoices with detailed line items, supporting calculations for totals and taxes.
- **Reports**: Debtor and creditor reports provide insights into financial standings, with scripts for publishing and backing up report data in staging environments.
- **Layout and Navigation**: The applet uses a responsive layout with media queries for optimal viewing on different devices, including mobile.

For more technical details, refer to the source code in the `blg-applet-wavelet-engagement-applet` directory.