# User Guide: Tax Configuration Applet

## Overview

The Tax Configuration Applet is a centralized tool designed to maintain all tax codes and their corresponding rates.

This applet allows users to define tax parameters that will be applied across various modules in the system.

---

## 1. Creating a New Tax Code

To set up a new tax code and rate, follow these steps:

### Step 1: Initiate Creation
Click the **Create** button within the applet.

### Step 2: Select Location
Choose the relevant **Country** from the selection menu.

### Step 3: Define Identifiers
- Enter a **unique Tax Code**.
- Enter a **Name** (it is recommended to use the full descriptive name).

### Step 4: Select Tax Type
Choose the appropriate category based on your usage requirements.

Available options include:

- **GST Input** or **GST Output**
- **SST**
- **SLS (Sales)**
- **SVC (Service Charge)**
- **Withholding Tax Input** or **Withholding Tax Output**

### Step 5: Enter Rate
After selecting the tax type:
- The rate field will auto-populate or become available.
- You must manually input the specific tax rate.

### Step 6: Save
Click **Create** to finalize the new tax entry.

---

## 2. Editing and Updating Tax Codes

If you need to modify an existing tax entry:

### Access the Record
Click into the specific tax code you wish to update.

### Modify Details
You may update:
- Tax Type
- Tax Rate
- Other relevant information

### Manage Status
Change the tax code status between:
- **Active**
- **Inactive**

---

## 3. System Application

Once a tax code is successfully created and saved:

- It will automatically appear in the **Tax Selection** or **Tax Tab**
- It will be available across all other applets within the system
- It will be selectable wherever tax application is required

This applet functions as the master tax configuration module.

---

# Best Practices and Additional Tips

## 1. Naming Conventions for Clarity

Although the system allows flexibility in Tax Code identifiers:

- Use a clear and descriptive **Name**
- Prefer full descriptive names over abbreviations
- Ensure consistency across departments

This improves usability and reduces selection errors in other applets.

---

## 2. Understanding Tax Types

Ensure you select the correct tax category based on transaction requirements:

| Tax Type | Purpose |
|----------|----------|
| **GST Input / Output** | Goods and Services Tax tracking |
| **SST** | Sales and Service Tax |
| **SLS** | Sales-specific tax |
| **SVC** | Service Charge |
| **Withholding Tax (Input/Output)** | Tax deductions at source |

Selecting the incorrect type may affect reporting and calculations.

---

## 3. Rate Entry Workflow

After selecting a Tax Type:

- Certain fields may auto-populate or dynamically appear.
- You must manually enter the correct numerical rate.
- Always verify the rate before clicking **Create**.

Failure to input the correct rate will impact financial calculations system-wide.

---

## 4. Lifecycle Management (Active vs. Inactive)

Do **not delete** tax codes that are no longer in use.

Instead:

1. Edit the record.
2. Change its status to **Inactive**.

### Why?

- Preserves historical transaction data
- Prevents selection in new transactions
- Maintains audit integrity

---

## 5. Cross-Applet Integration

This applet is the master configuration tool for taxation.

Any tax code:
- Created
- Updated
- Activated or deactivated

Will immediately reflect in:

- **Tax Tab**
- **Tax Selection dropdowns**
- All relevant modules across the system
