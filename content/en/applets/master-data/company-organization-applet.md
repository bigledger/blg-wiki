---
title: "Company Organization Applet"
description: "Create and configure companies with detailed settings, branches, and organizational structure"
weight: 165
tags:
- applets
- organization
- company-management
- administration
---
noneWhen logging into the Organization Applet, the first page displayed to the user is the Company Listing page in the first icon on the left sidebar.
In this section, we will cover two key topics:
How to Create a Company: A step-by-step guide on setting up company details and adding the address.
How to Edit a Company: An overview of each tab and its features to enhance company configuration
#  Create Company﻿
One company can have multiple sub-branches, and there's no limit to this configuration
To start creating a company, users can click on the '+' button located at the top left corner.
##  Company Tab﻿
### Create a Company﻿
Click the '+' button at the top left corner.
Fill in all required fields with the necessary information. Fields marked with a * are mandatory and cannot be modified later.
Once completed, click 'Save' in the top right corner.
Please refer to the screenshots below for guidance.
Step 1: Click the '+' button to create a company.
Step 2 and 3: Fill in all required fields and click 'Save'.
In the Company Creation form, you will need to fill in the following fields:
Company Code, Name, Registration No.: Enter these details
Company Incorporation Date: When the company was established
Tax ID, SST ID #: If applicable
Fax Number: If applicable
Phone Number: Mandatory
Currency: Select from the drop-down list.
Chart of Accounts: Create the chart of accounts before setting up the company. Follow the steps here. Once the chart of accounts is set up, select the appropriate one from the drop-down menu.
Rounding Five Cent: If necessary - Choose which item code the system auto-fills for transactions.
Group Discounts: You can apply a discount to the entire transaction, or the system can automatically select item codes.
Default Purchase and Sales Return Options: For both Purchase Returns and Sales Returns, you can choose similar pricing options:
Last Purchase Price: Select this option to use the price of the last purchase for returns.
Moving Average Cost: Choose this option if you prefer the pricing to be based on the moving average cost.
Invoice Price: The most commonly used option, applies the price from the relevant purchase or sales invoice for returns.
Company Logo: Users can upload a company logo immediately or choose to upload it later.
## Address Tab﻿
When creating a company, users are required to fill in the address details. This information is essential for accurate record-keeping and correspondence purposes.
### Fill in the Company Address﻿
Navigate to the Address Tab.
Fill in all required fields, including postal details and country information. Fields marked with a * are mandatory.
Once completed, click 'Save' in the top right corner to store the address information.
Please refer to the screenshot below for guidance.
Step 1, 2: Fill in the required address details and click 'Save'.
The fields required in the Address Tab are as follows:
Address Line 1: Primary address details
Address Line 2: Additional address details
Address Line 3: Optional additional line
Address Line 4: Optional additional line
Address Line 5: Optional additional line
Postal Code: ZIP or postal code
City: The city where the company is located
Country: Different countries can be selected from the drop-down list
Currency: Select the applicable currency from the drop-down list
State: Select the relevant state or region from the drop-down list
# Edit Company﻿
From the Company Listing page, click on your created company to view all the available tabs:
Details: This section displays the main company details created in section 1.1, where users can add or edit any information if needed.
E-invoice: Configure the company for E-invoicing to LHDN
Peppol Config: If using Peppol, this tab is for configuring the intermediary.
Tax: If the company has SSD, this tab is used for Tax Config.
Address: Displays the address created in section 1.2. Users can edit or add additional information if needed.
Branch: Lists all the branches created under the selected company.
Location: Shows all locations under each branch for the company.
Labels: Used for tagging the company, such as grouping by department.
Employee: Displays the list of employees under the company. This is linked to the Employee Applet.
## Knock Off Config:﻿
### What is KO (Knock Off)?
A Knock Off (KO) configuration is used when a company needs to manage document issuance tracking for transactions involving:
✅ Customer invoices (e.g., tracking whether an invoice has been fully paid).
✅ Supplier invoices (e.g., ensuring payments are properly recorded against supplier bills).
Essentially, KO helps automate reconciliation between issued invoices and received payments, preventing discrepancies in financial records.
### When Should You Configure a KO?
Configuring a KO is optional but may be necessary if:
The company wants to track payments against invoices in an automated manner.
The business requires document issuance verification before transactions are marked as completed.
There is a need to link invoice issuance to supplier/customer transactions for internal processing.
A critical setup for the company to configure the workflow. Click on the '+' button to begin setup.
Server Doc Type Options: Essential for setting up the company's workflow, such as configuring the process for purchase orders, converting them into purchase GRNs or invoices, or setting up the sales process (from sales orders to sales invoices). The configuration is based on document types.
The user needs to select the server type. Server Type 1 refers to the source document, while Server Type 2 refers to the target document
This is an example of a basic knock-off (KO) setup flow for the customer. For instance, when the user creates an invoice, there will be two knock-off options: Sales Order and Sales Quotation.
This means that in the Sales Invoice applet, under the KO (knock-off) tab, the user will see two options: Sales Order and Sales Quotation.
Users can enable or disable knock-off settings from the main tab page.
The KO (knock-off) options depend on the customer configuration and the user's needs. The user can add more options if needed by configuring them in the Organisation applet when creating or editing the company details.
## Advance Filter Search﻿
The advanced filter allows you to search by company, company name, registration number, or status. Each sub-module includes this advanced filtering option.