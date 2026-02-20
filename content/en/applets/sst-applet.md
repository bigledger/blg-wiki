# User Guide: SST (Service / Sales Tax) Applet

## Overview

This guide outlines the complete workflow of the **SST (Service / Sales Tax) Applet**, covering everything from initial configuration and tax year setup to generating the final SST-02 report.

---

## 1. Setting Up the Tax Year

The first step in configuring the SST Applet is to establish the filing period for your company.

### Create a Tax Year

1. Navigate to the **Tax Year** menu.
2. Click **Create**.

### Configuration

- **Company**: Select the applicable company.
- **Fiscal Year**: Choose the fiscal year.
- **Filing Cycle**: Select the appropriate cycle:
  - *Monthly*
  - *Quarterly*
  - *Custom Months* (e.g., every two months). This is useful for businesses with unique reporting requirements.
- **Custom Duration**: You may also specify a custom duration when performing the filing.

> **Best Practice:** When naming the record, use a consistent convention such as **"2025 – Company Name"**. This makes it significantly easier to identify the correct record and avoids filing errors.

---

## 2. Managing Tariff Codes

Tariff codes are essential for item maintenance and accurate tax code configuration.

### Creating a Tariff Code

1. Navigate to the **Tariff Code** menu.
2. Click **Create**.
3. Enter the following details:
   - **Tariff Code**
   - **Tariff Description**

### Usage & Benefits

Once created, Tariff Codes become available for:
- **Item Maintenance**: You can tag Tariff Codes directly to items.
- **Tax Code Linking**: Link them to specific Tax Codes to ensure correct tariff mapping per transaction. This automation reduces manual selection errors and ensures consistent tax classification.

---

## 3. Configuring Tax Codes

This section defines the specific tax rates applied to your transactions.

### Creating Tax Codes

1. Go to the **Tax Code** menu.
2. Click **Create**.
3. Define the applicable rate (e.g., 6%, 8%, 10%).

### Defining Tax Types

- **Output Tax**: Used for sales/invoices.
- **Input Tax**: Used for purchases.

> **Note:** When you select the **Type** (Sales or Purchase), the system automatically populates the corresponding **Tax Type Name**. This reduces manual entry errors.

### Linking to Tariff Codes

Tax Codes can be tagged to specific **Tariff Codes** for structured tax categorization.

### Updating Tax Rates

If tax regulations change, you do **not** need to create a new Tax Code. Instead:
1. Click the relevant **Tax Code**.
2. Update the rate directly in the existing record.
3. Save your changes.

This approach maintains data continuity while ensuring compliance.

---

## 4. Executing Tax Filing

After setup and transaction recording, you can proceed with the tax filing process.

### Initiating Filing

1. Navigate to the **Tax Filing** menu.
2. Click **Create**.
3. Select the **Company**, **Tax Year**, and the specific **Month/Filing Period**.

### Reviewing & Filing Transactions

Before filing, it is recommended to review your data:
1. Go to **Unfiled Transactions**.
2. Review the **Base Amount** and **Tax Amount** for accuracy.
3. Select the desired transactions.
4. Click **File**.

### Correcting Mistakes (Unfile Process)

If an incorrect transaction is filed, you can easily reverse it:
1. Go to the **Filed Transactions** list.
2. Select the relevant record.
3. Click **Unfile**.

The transaction will revert to **Unfiled** status, allowing you to correct and re-file it.

---

## 5. Generating the SST-02 Report

The applet supports the generation of the official SST-02 form for submission.

### Managing Penalties

If your filing is late or requires penalty adjustments:
- You can manually input the **Penalty Amount**, or
- Enter a **Penalty Percentage**.

**Important:** Always update these details **before** generating the report.

### Generating & Exporting the Report

1. Ensure all penalty details are updated (if applicable).
2. Click **Search** to refresh the data.
3. Review the report details.
4. Click **Export PDF** for record-keeping and official submission.

The applet supports multiple SST-02 versions (e.g., Version 2), which generally follow a standard compliant format.

---

## 6. Reviewing Tax Reports and Summaries

The applet provides comprehensive reporting tools to verify filing status and tax calculations.

### Service and Sales Tax Reports

Use these reports for internal audits to verify:
- Filing status
- Tax amounts
- Filing cycles (by company or date)

### SST Tax Code Summary Report

This report provides a consolidated financial overview, categorized by **Tax Code**. It includes:
- Branch and Company details.
- Total taxable amounts per Tax Code.
- **Output Tax** totals.
- **Purchase (Input) Tax** totals.
- Final **Net Tax** calculation.

This summary delivers a clear bottom-line tax position for the filing period.

---

## End-to-End Flow Summary

1. **Create Tax Year**: Set up the fiscal period and filing cycle.
2. **Create Tariff Codes**: Define codes for item categorization.
3. **Configure Tax Codes**: Set up rates and link them to Tariff Codes.
4. **Record Transactions**: Process sales and purchases in the system.
5. **Execute Filing**: Review and file transactions for the period.
6. **Generate SST-02 Report**: Handle penalties and export the official form.
7. **Review Reports**: Verify data with internal summaries and tax code breakdowns.
