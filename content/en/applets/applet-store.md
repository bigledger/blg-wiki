---
title: "Applet Store"
description: "Centralized marketplace for BigLedger applets, enabling seamless discovery, installation, and management of business applications"
tags:
- core-module
- applet-marketplace
- application-management
- system-administration
- user-interface
weight: 125
---

## Executive Summary

The Applet Store serves as BigLedger's centralized marketplace and application management hub, providing users with seamless access to discover, install, and manage business applications (applets) within the BigLedger ecosystem. This essential Core Module component enables organizations to extend their BigLedger capabilities through a curated collection of both free and premium applets, while maintaining security, compliance, and organizational control.

**Key Business Benefits:**
- Streamlined application discovery and deployment process
- Centralized license and subscription management
- Integrated permission and security controls
- Simplified user onboarding and training
- Cost-effective expansion of business capabilities

**Strategic Importance:**
The Applet Store is fundamental to BigLedger's modular architecture, enabling organizations to scale their system capabilities based on evolving business needs. It provides the foundation for digital transformation by allowing businesses to add specialized functionality without complex technical implementations.

**Platform Statistics:**
- Support for unlimited applet installations per tenant
- Real-time marketplace updates and new applet notifications
- Comprehensive rating and review system for quality assurance
- Multi-catalog support for public and private applet distribution
- Advanced permission management with role-based access control

## Overview & Purpose

The Applet Store is BigLedger's comprehensive marketplace for application distribution, designed specifically for use with BigLedger products and services. It provides subscribers with an intuitive platform to browse, evaluate, and install applets that extend their system capabilities. The marketplace offers both free and premium applets, ensuring accessibility for organizations of all sizes while supporting a sustainable ecosystem for applet developers.

{{< callout type="info" >}}
**Core Module Component**: The Applet Store is an essential system component that provides the foundation for BigLedger's modular architecture and extensibility.
{{< /callout >}}

### Primary Functions
- **Application Discovery** - Browse and search available applets by category, function, or rating
- **License Management** - Handle both free and paid applet subscriptions
- **Installation Management** - Streamlined applet deployment and configuration
- **Permission Control** - Comprehensive user access and security management
- **Quality Assurance** - Rating and review system for applet evaluation

### Core Workflow Process
The applet lifecycle follows a structured approach:
1. **Access Control** - User authentication and authorization
2. **Terms Acceptance** - Review and accept marketplace terms of use
3. **Discovery & Evaluation** - Browse catalogs and review applet details
4. **Installation** - Deploy selected applets with proper configuration
5. **Permission Setup** - Configure access controls and user roles
6. **Activation** - Launch and begin using installed applets

### User Journey Framework

**Initial Setup Process:**
- **Access Control** - User authentication and authorization
- **Terms Acceptance** - Review and accept marketplace terms of use
- **Catalog Access** - Navigate public and private applet catalogs
- **Applet Selection** - Evaluate and select appropriate applets
- **Installation** - Deploy applets with proper configuration

**Permission Configuration Workflow:**
- **Permission Set Creation** - Define granular access controls
- **Role Assignment** - Map organizational roles to permission sets
- **User Mapping** - Assign users and teams to appropriate roles
- **Testing and Validation** - Verify permission configurations
- **Monitoring and Maintenance** - Ongoing permission management

**Personalization Options:**
- **Interface Customization** - Personalized dashboard and navigation
- **Notification Preferences** - Customized alert and update settings
- **Workflow Optimization** - Tailored business process configurations
- **Reporting Preferences** - Customized analytics and reporting views

## 1.0 Getting Started

# 2.0 Entering the Applet Store

![Applet Store Interface](/images/applet-store/interface/image-20241110-192150_placeholder.svg)
*Figure 1: BigLedger Applet Store - Main Interface Overview*

## 2.1 Applet Store icon in the Akaun Platform

When users first register and log in to the website, they will be directed to a page as shown in the interface above. Before installing any applet in the Applet Store, there is only one icon in the platform, which is the Applet Store icon. Then, users can proceed by clicking on the Applet Store to start browsing their desired applets.

Additionally, in the Akaun Platform page, a Search bar feature is implemented to enable the users to filter and search the installed applets in the Akaun Platform page.

## 2.2 Terms of Use of the Applets in the Applet Store﻿

![Marketplace Terms of Use](/images/applet-store/interface/image-20241110-192239_placeholder.svg)
*Figure 2: Akaun Platform - Marketplace Terms of Use*

After clicking on the Applet Store icon, a page will appear, listing the terms of use of the applets in the Applet Store. Some of the essential information that is shown in this page includes:
- Types of applets
- Details of placing order for applets
- Correct use of marketplace applets
- Data collection, Data usage, and Data sharing
- Users' responsibilities
- Term and Termination
- Important disclaimers and limitations of liability
- Third-party applets and third-party use of the applets
- Dispute Resolution; Governing Law

Users have to patiently peruse the terms of use of the applets in the Applet Store to understand the responsibilities of every party who accesses and uses the applets.

![Accept or Decline Terms](/images/applet-store/interface/image-20241110-192321_placeholder.svg)
*Figure 3: Akaun Platform - Accept or decline the terms and conditions*

At the end of the page, users have to tick the square box as shown above to indicate that they have read all the terms and conditions for using the marketplace applets. Then, the "Accept" button will turn blue and users can click on the "Accept" button to indicate that they agree to the terms of use of the marketplace applets. By doing that, users can successfully enter the Applet Store and start installing their desired applets.

# 3.0 Layout in Applet Store﻿

## 3.1 Desktop Layout﻿

![Desktop Layout](/images/applet-store/interface/image-20241110-192431_placeholder.svg)
*Figure 4: Desktop Layout of Applet Store - Light Theme*

## 3.2 Mobile Layout﻿

![Mobile Layout](/images/applet-store/interface/image-20241110-192920_placeholder.svg)
*Figure 5: Mobile Layout of Applet Store - Dark Theme*

The theme of the Applet Store in the mobile layout is a dark theme by default.

# 4.0 Catalog﻿

## 4.1 What is a catalog?﻿
Generally, a catalog in the Applet Store is a collection of applets that are suited for use by a tenant. Every tenant in the Akaun Platform requires different applets for their own operations. Thus, every tenant in the Akaun Platform will be given access to his own unique catalog of applets which are designed for his own use.

Next, the Applet Store consists of both public and private catalogs. The details of these catalogs are described below.

## 4.2 Public Catalog﻿

![Public Catalog Page](/images/applet-store/interface/image-20241110-193055_placeholder.svg)
*Figure 6: Public Catalog Page*

When the users enter the Applet Store after accepting the terms of use of applets, they will be directed to the Public page that shows all the public catalogs with their associated applets. Public catalogs are catalogs that can be accessed by all parties. These catalogs store applets that are commonly used by all parties to perform their operations.

For instance, the screenshot above shows that the MLM Admin applet is an applet under the Public Catalog.

![Applet Information](/images/applet-store/interface/image-20241110-193148_placeholder.svg)
*Figure 7: Applet Information Display*

Additionally, every individual applet in the Applet Store has its own specific icon, name and average user ratings.

Next, every individual applet has its tenant code. For example, staging_tenant. The tenant code identifies the tenant to which the applet belongs. This is because some applets are required by many different tenants. For instance, the Cashbook Applet is needed by many tenants to manage their cash book and settlement methods. However, every tenant needs their version of the Cashbook Applet because they would like to store their private data in the applet. Thus, we have Cashbook Applets with different tenant codes in which each tenant code identifies a specific tenant user. Every tenant user can only access the applet which is associated with his tenant code.

Apart from that, every individual applet has its rank. The rank type includes OWNER, ADMIN and MEMBER. This is because users with different ranks have different roles in managing and using the applets. For instance, users with the ADMIN and OWNER rank have the read and write access in assigning permissions to other users in using an applet whereas the users with MEMBER rank can only have read access to the permissions in an applet.

## 4.3 Private Catalog﻿

![Private Catalog Page](/images/applet-store/catalogs/image-20241110-193437_placeholder.svg)
*Figure 8: Private Catalog Page - Install All*

Next, when users click on the "Private" tab, they will be directed to the page that shows all the private catalogs as shown in the screenshot above. Private Catalogs are catalogs that can only be accessed by users who are given specific permission by the admin.

The admin of the Platform Sysadmin Applet can use this applet to assign permission for users to access their catalog of applets in the Applet Store. As mentioned previously, different clients will gain access to their own catalogs in order to use the relevant applets to carry out their particular operations. Thus, the catalogs and applets shown in this page vary by users.

Apart from that, a search bar is implemented on every catalog page for users to filter and search their desired applets easily. Users can search for their desired applets by typing the name of the applets in the search bar. The search function will be executed automatically once the users start typing words on the bar.

Next, users can click on the "Install All" green button to install all the applets in the "Private" tab page at once. This can save their time from installing the applets individually.

## 4.4 My Applets﻿

![My Applets Tab](/images/applet-store/interface/image-20241110-193742_placeholder.svg)
*Figure 9: My Applets Tab - Installed Applications*

Next, when users click on the "My Applets" tab, they will be directed to a page that shows all the applets they have installed.

# 5.0 Installing Applets﻿

## 5.1 Applet Installation Page﻿

![Applet Installation Page](/images/applet-store/installation/image-20241110-194005_placeholder.svg)
*Figure 10: Applet Installation Page - Overview*

When users click on an applet icon in the catalog page, users will be able to read the details of the applet as shown in the screenshot above. The basic information of the applet that are displayed in this page includes:
- Name of the applet
- Icon of the applet
- Platform location where the applet is stored
- Rank of the users in using the applet
- Tenant Code of the applet
- Compatibility of the applet to the users' device
- Average ratings of the applet
- Number of users who rate the applet

In order to install the particular applet, users can click on the green "Install" button in the applet page to perform the installation.

![Applet Descriptions](/images/applet-store/installation/image-20241110-194026_placeholder.svg)
*Figure 11: Applet Installation Page - Applet Descriptions*

Apart from that, users can view the images and videos that illustrate the features and functionalities of the applet. They can also read the description of the applet from the applet page. By doing that, the users can understand the functions of the applet and the mechanism of using the applet.

Additionally, they are able to know the type of the applet and the ranking of the applet in the Applet Store. For instance, the Stock Transfer applet shown in the screenshot above is labeled as the Business type applet. It is also ranked as the second top grossing applet, meaning the second top applet that generates the highest profit among all the available applets.

![Ratings and Reviews](/images/applet-store/installation/image-20241110-194045_placeholder.svg)
*Figure 12: Applet Installation Page - Ratings and Reviews*

Moreover, users are able to see the rating and reviews of each applet in the installation page of the respective applet. Firstly, the platform will calculate and generate the average user ratings of the applet besides showing the statistics of rating in the form of a horizontal bar chart. It also shows the total number of users who have given the rating.

Next, users can also read the reviews of other users who comment on the applet. Additionally, users can also write their reviews under the reviews section and update their own reviews from time to time.

The applet installation page is still under development.

## 5.2 Open or Uninstall Applets﻿

![Open or Uninstall](/images/applet-store/installation/image-20241110-194139_placeholder.svg)
*Figure 13: Applet Installation Page - Open or Uninstall the Applet*

After that, users can open the applet by clicking on the green "Open" button.

On the other hand, users can choose to uninstall the applet by clicking on the "Uninstall" button in the applet page.

## 5.3 Access Installed Applets﻿

![My Applets Page](/images/applet-store/installation/image-20241110-194200_placeholder.svg)
*Figure 14: My Applets Page - Installed Applets*

As mentioned previously, users can check their installed applets in the "My Applets" page in the Applet Store as shown in the screenshot above. This helps users to find and manage their installed applets easily. Additionally, applets that are successfully installed by the users will show a small green tick label at the bottom right of its layout as shown in the screenshot above.

![Akaun Platform](/images/applet-store/installation/image-20241110-194216_placeholder.svg)
*Figure 15: Akaun Platform - Installed Applets*

Apart from that, users can directly access their installed applets when they log in to the http://akaun.com website as shown in the screenshot above. This helps the users to conveniently access their installed applets without entering the Applet Store.

# 6.0 Applet Permission Settings﻿

Generally, all applets in the Applet Store share some common features. One of the essential features is the permission setting for an applet. This is because a client who uses the applets may want to set specific permissions to regulate the access control of his employees in using the applets.

![Settings Tab](/images/applet-store/permissions/image-20241110-194553_placeholder.svg)
*Figure 16: Settings Tab*

Firstly, users can navigate to the "Settings" tab which is located at the bottom left of every opened applet as shown in the screenshot above to configure their applet settings.

## 6.1 Permission Set﻿

A permission template is a template that consists of one or multiple permission lines. Every permission line refers to a specific defined permission. For example, permission to create internal sales order invoices.

A permission set is a permission template in which the permission lines are configured to targets. The target can be a branch, company, or location, depending on the permission template. By doing that, the targets are permitted to perform certain operations.

Only users with the ADMIN or OWNER rank in the applet can have read and write access in assigning the permissions to the applet users. Users with MEMBER rank have only read access to the permissions settings in the applet.

![Permission Set Page](/images/applet-store/permissions/image-20241110-194612_placeholder.svg)
*Figure 17: Permission Set Page*

### 6.1.1 Create Permission Set﻿

![Create Permission Set](/images/applet-store/permissions/image-20241110-194627_placeholder.svg)
*Figure 18: Permission Set - Create a Permission Set*

Users click on the "+" button to start creating the permission set. After clicking on the button, the Add Permission Set page will appear from the right. Users then fill in the information of the permission set. The information to be filled includes:
- Perm Set Name*: The name of the permission set.
- Perm Set Code*: The code of the permission set. The code value should be unique and is immutable once it is saved.
- Perm Template*: The permission template. A permission template consists of many defined permission lines.
- Status*: Users should select the status "ACTIVE" to use the permission set.

The * symbol indicates information that is compulsory to be filled.

Next, the users have to click on the "Configure Permission Targets" box in order to start linking the permission lines in the selected permission template to the available targets.

![Configure Permission Set Lines](/images/applet-store/permissions/image-20241110-194646_placeholder.svg)
*Figure 19: Permission Set - Configure Permission Set Lines*

A permission template consists of many permission lines. Thus, in the Configure Permission Set Lines page, users can select the permission set lines and assign each of them to a target. The users can proceed by clicking on the permission set line record they want to configure.

![Edit Permission Set Line](/images/applet-store/permissions/image-20241110-194705_placeholder.svg)
*Figure 20: Permission Set - Edit Permission Set Line*

Then, users will be directed to the Edit Permission Set Line page as shown above.

Under this page, the Permission Code, Permission Targets and Default Target information of the selected permission line are already filled and cannot be modified. The value of the Default Target information varies between Company, Location and Branch, depending on the permission template that is selected.

Users can provide some description for the permission set line. Then, users have to click on the "Select Target" box in order to assign the permission set line to a target.

![Add Target](/images/applet-store/permissions/image-20241110-194722_placeholder.svg)
*Figure 21: Permission Set - Add Target*

Then, users are directed to the Add Target page. In this example, the default target is the company. Thus, the Add Target page shows the information of the available companies. The information includes the Company Code and Company Name. Users can tick only one of the available companies and click the "SAVE" button to link it to the permission set line.

![Save Edited Permission Set Line](/images/applet-store/permissions/image-20241110-194756_placeholder.svg)
*Figure 22: Permission Set - Save Edited Permission Set Line*

Then, the users will be directed back to the previous page, which is the Edit Permission Set Line page. The target is selected successfully. They can continue to click the "SAVE" button to save the changes.

![Save Configured Permission Set](/images/applet-store/permissions/image-20241110-194815_placeholder.svg)
*Figure 23: Permission Set - Save the Configured Permission Set*

Then, the users will be directed back to the previous page, which is the Configure Permission Set Lines page. Users can repeat the process for the other permission set lines to assign the target to the permission lines respectively.

When all the permissions targets are configured as desired, users can click on the "SAVE" button in the Add Permission Set page to save the changes.

![Successfully Created](/images/applet-store/permissions/image-20241110-194836_placeholder.svg)
*Figure 24: Permission Set - Successfully Created*

The permission set that is successfully created will appear in the Permission Set page as shown in the screenshot above.

In order to assign the same permission set to multiple targets, the users have to create multiple permission sets. Every permissions set consists of the same permission lines but different naming. Then, users assign each permission set to the respective target.

For example:
- Permission_Set_Target_A to Target A.
- Permission_Set_Target_B to Target B.

### 6.1.2 Edit and Delete Permission Set﻿

If the users want to edit or delete a created permission set, users have to click on that permission set record in the Permission Set page. Then, the Edit Permission Set page will appear from the right as shown in the screenshot below, showing the details of the permission set.

![Edit/Delete Permission Set](/images/applet-store/permissions/image-20241110-195035_placeholder.svg)
*Figure 25: Permission Set - Edit / Delete Permission Set*

**Edit the Permission Set:**
The process flow of editing a permission set is similar to the process flow of creating the permission set. Users have to click the "SAVE" button in order to save the changes.

**Delete the Permission Set:**
Users click on the permission set row in the Permission Set page and then click on the "DELETE" button in the Edit Permission Set page to delete the permission set.

## 6.2 User Permission﻿

![User Permission Page](/images/applet-store/permissions/image-20241110-195050_placeholder.svg)
*Figure 26: User Permission Page*

The User Permission page stores the information of the users who can access and use the particular applet. These information include the email address, mobile phone number and the rank of the user in using the applet.

Once the users have successfully installed an applet, their information will appear as a new record under the User Permission page of that applet.

## 6.3 Team Permission﻿

![Team Permission Page](/images/applet-store/permissions/image-20241110-195116_placeholder.svg)
*Figure 27: Team Permission Page*

The Team Permission page stores the information of the teams who can access and use the particular applet. This information includes the team name, team code and number of members in the team.

### 6.3.1 Read the Details of the Team﻿

![Edit Team Details](/images/applet-store/permissions/image-20241110-195144_placeholder.svg)
*Figure 28: Team Permission - Edit Team (Details)*

Users can read the details of the team by clicking on the row that represents the team in the Team Permission page. Then, the Edit Team page will appear from the right. Users can read the details of the team from the Edit Team page. However, users cannot edit the information of the team in this page.

### 6.3.2 Read the Members of the Team﻿

![Edit Team Members](/images/applet-store/permissions/image-20241110-195201_placeholder.svg)
*Figure 29: Permission Set - Edit Team (Members)*

Next, under the Members tab in the Edit Team page, users can see the information of the members that belong to the team. The information of the members include the email address, mobile phone number and the rank of the members in using the applet.

However, users cannot create new members or edit the information of current members for the team in this page.

### 6.3.3 Read and Edit the Role for the Team﻿

![Edit Team Role](/images/applet-store/permissions/image-20241110-195225_placeholder.svg)
*Figure 30: Permission Set - Edit Team (Role)*

Next, under the Role tab in the Edit Team page, users can see the roles that are assigned to the team. The information of the role includes role code, role name and number of permission sets that are assigned to the role.

![Edit Role for Team](/images/applet-store/permissions/image-20241110-195241_placeholder.svg)
*Figure 31: Team Permission - Edit Role (For Team)*

Users are allowed to edit some basic information of the role that is assigned to the team. Firstly, users click onto the role record that they want to edit under the Role tab in the Edit Team page. Then, the Edit Role page will appear from the right as shown in the screenshot above.

Users can edit the role of the team by changing the name and status of the role in the Edit Role page. Users cannot change the role code because the code value is fixed and immutable once it is set. Then, users have to click on the "SAVE" button to save the changes.

## 6.4 Role Permission﻿

An organization consists of employees with different roles. For example, cashiers, managers, operators, officers and many others. Every role requires specific permissions in using an applet.

Under the Role Permission tab, the admin users can include multiple permissions to a role. Then, the users can assign the role to specific users or teams. By doing that, the admins do not have to manually assign permission to every individual.

![Role Permission Page](/images/applet-store/permissions/image-20241110-195354_placeholder.svg)
*Figure 32: Role Permission Page*

### 6.4.1 Create a Role﻿

![Create a Role](/images/applet-store/permissions/image-20241110-195428_placeholder.svg)
*Figure 33: Role Permission - Create a Role*

Firstly, users can click on the "+" button to create a role. Then, the users must input the following information:
- Name of the role.
- Code of the role. The code of the role must be unique.
- Status of the role. Users have to set the status to "ACTIVE" in order to use the role.

Lastly, the users have to click on the "SAVE" button to save the input information for the role. The role will then appear as a new record in the Role Permission tab.

### 6.4.2 Edit Role Permissions﻿

**Details Tab: Edit and Delete Role Information﻿**

![Edit Role Details](/images/applet-store/permissions/image-20241110-195446_placeholder.svg)
*Figure 34: Role Permission - Edit Role (Details)*

In order to edit the details of the role that is created, users have to click on that particular role record that appears in the Role Permission page. Then, the Edit Role Permissions page will pop out from the right as shown in the screenshot above. The users can then edit the role information under the Details tab of the page. However, the users cannot edit the role code because the code information is fixed and immutable.

![Delete Role](/images/applet-store/permissions/image-20241110-195513_placeholder.svg)
*Figure 35: Role Permission - Delete Role (Details)*

To delete a role, the users can click on the "DELETE" button under the Details tab to remove the row.

**Add or Remove Role to User﻿**

![Load Users](/images/applet-store/permissions/image-20241110-195605_placeholder.svg)
*Figure 36: Role Permission - Load Users*

Firstly, users have to navigate to the User tab under the Edit Role Permissions page. Under the User tab, the users can see the list of users that are assigned with the selected role. In order to add new users to the role, users can click on the "+" button to load the list of available users and proceed to assign the users to the particular role.

If users want to remove the existing users from the role, users can tick on the existing users that they want to remove in the Edit Role Permissions page and click the "REMOVE" button to remove the ticked users from the role.

![Add/Remove Users to Role](/images/applet-store/permissions/image-20241110-195629_placeholder.svg)
*Figure 37: Role Permission - Add / Remove Users To Role*

Then, they will be directed to the Add User page which shows the information of all the available users. They then tick on the users that they want to assign the role to in the Add User page. After selecting all the users, they can click on the "ADD" button to add the users to the particular role.

The users that are added successfully to the role will appear under the User Tab in the Edit Role Permissions page. If the admins want to remove the selected users from the role, they can tick on the users in the Edit Role Permissions page and click the "REMOVE" button to remove the ticked users from the role. Users can tick and remove only one user at a time.

**Add or Remove Team to Role﻿**

![Load Teams](/images/applet-store/permissions/image-20241110-195650_placeholder.svg)
*Figure 38: Role Permission - Load Teams*

Firstly, users have to navigate to the Team tab under the Edit Role Permissions page. Under the team tab, the users can see the list of teams that are assigned with the role. In order to add new teams to the role, users can click on the "+" button to load the list of available teams and proceed to assign the teams to the particular role.

If users want to remove the existing teams from the role, users can tick on the existing teams that they want to remove in the Edit Role Permissions page and click the "REMOVE" button to remove the ticked teams from the role. Users can tick and remove only one team at a time.

![Add/Remove Teams to Role](/images/applet-store/permissions/image-20241110-195708_placeholder.svg)
*Figure 39: Role Permission - Add / Remove Teams To Role*

After clicking on the "+" button, users can tick on the teams that they want to assign the role in the Add Team page. After selecting the teams, they can click on the "ADD" button to add the teams to the particular role.

The teams that are added successfully to the role will appear under the Team tab in the Edit Role Permissions page. If the admins want to remove the selected teams from the role, they can tick on the teams and click the "REMOVE" button to remove the ticked teams from the role.

**Add or Remove Permission Set to Role﻿**

![Load Permission Sets](/images/applet-store/permissions/image-20241110-195723_placeholder.svg)
*Figure 40: Role Permission - Load the Permission Sets*

Most importantly, every role has its own list of permissions. In order to assign the permission set to the created Role, users have to navigate to the Permission Set tab under the Edit Role Permissions page.

Under the Permission Set tab, the users can see the list of permission sets that are assigned with the role. In order to add new permission sets to the role, users can click on the "+" button to load the list of available permission sets and proceed to assign them to the particular role.

If users want to remove the existing permission sets from the role, users can tick on the existing permission sets that they want to remove in the Edit Role Permissions page and click the "REMOVE" button to remove the ticked permission sets from the role. Users can tick and remove only one permission set at a time.

![Add/Remove Permission Sets to Role](/images/applet-store/permissions/image-20241110-195739_placeholder.svg)
*Figure 41: Role Permission - Add / Remove The Permission Sets To Role*

Then, they can tick on the permission sets that they want to assign to the role in the Add Permission Set page. After selecting all the permission sets, they can click on the "ADD" button to add the permission sets to the particular role.

The permission sets that are successfully added to the role will appear under the Permission Set tab in the Edit Role Permissions page. If the admins want to remove the selected permission sets from the role, they can tick on the permission sets and click the "REMOVE" button to remove the ticked permission sets from the role.

# 7.0 Leaving the Applet Store﻿

![Leaving the Applet Store](/images/applet-store/interface/image-20241110-195843_placeholder.svg)
*Figure 42: Leaving the Applet Store*

Users can navigate away from the Applet Store by clicking on the "akaun" tab as indicated in the interface. This provides a seamless back function to return to the main BigLedger platform from any Applet Store page, maintaining context and user workflow continuity.

## Target Users and Roles

### Primary Users

**System Administrators**
- Complete applet store management and configuration
- User access control and permission management
- Security policy enforcement and compliance monitoring
- Integration with organizational IT infrastructure

**Business Process Owners**
- Applet evaluation and business justification
- Workflow integration and process optimization
- User training coordination and change management
- Performance monitoring and business impact assessment

**End Users**
- Applet discovery and self-service installation
- Personal productivity tool management
- Basic permission and notification configuration
- User experience feedback and rating submission

### Secondary Users

**IT Support Staff**
- Technical troubleshooting and user support
- Applet performance monitoring and optimization
- Integration support and configuration assistance
- Security incident response and resolution

**Finance Controllers**
- Cost management and budget approval for paid applets
- Usage analytics and ROI assessment
- Vendor relationship management for applet subscriptions
- Compliance monitoring for financial regulations

**Compliance Officers**
- Regulatory compliance monitoring and reporting
- Risk assessment for new applet installations
- Audit trail review and documentation
- Policy enforcement and violation remediation

## Key Features

### Advanced Application Discovery

**Intelligent Search and Filtering**
- Real-time search with autocomplete functionality
- Advanced filtering by category, rating, price, and compatibility
- Personalized recommendations based on usage patterns
- Integration with organizational approved applet lists

**Comprehensive Applet Information**
- Detailed applet descriptions with screenshots and videos
- User ratings and reviews from verified installations
- Compatibility information and system requirements
- Pricing models and subscription options
- Developer information and support contacts

**Catalog Management**
- Public catalogs with community-driven applets
- Private catalogs for organization-specific applications
- Curated collections for industry-specific solutions
- Version control and update notifications

### Enterprise-Grade Security

**Permission Management System**
- Granular permission sets with configurable access levels
- Role-based access control with inheritance capabilities
- Dynamic permission assignment based on organizational structure
- Automated permission auditing and compliance reporting

**Security Controls**
- Multi-factor authentication for sensitive operations
- IP-based access restrictions and geographic controls
- Encryption of all data in transit and at rest
- Regular security assessments and vulnerability scanning

**Audit and Compliance**
- Complete audit trail for all applet-related activities
- Compliance reporting for regulatory requirements
- Data retention policies and automated archival
- Integration with enterprise security information systems

### Installation and Lifecycle Management

**Streamlined Installation Process**
- One-click installation for compatible applets
- Bulk installation capabilities for multiple applets
- Automated dependency resolution and conflict detection
- Rollback capabilities for problematic installations

**Update Management**
- Automated update notifications and scheduling
- Version control with rollback capabilities
- Impact assessment for updates and patches
- Maintenance window coordination and user communication

**Performance Monitoring**
- Real-time performance metrics and resource utilization
- User adoption analytics and engagement tracking
- Cost analysis and ROI measurement for paid applets
- Predictive analytics for capacity planning

## Integration Points with BigLedger Modules

### Core Module Dependencies

**Tenant Admin Applet Integration**
- User management and authentication services
- Security policy enforcement and compliance monitoring
- System configuration and tenant isolation
- Audit trail integration and reporting

**Organization Applet Integration**
- Multi-location applet deployment and management
- Organizational hierarchy-based access controls
- Branch-specific applet catalogs and restrictions
- Regional compliance and localization support

**Employee Maintenance Applet Integration**
- User-role mapping and permission inheritance
- Employee lifecycle integration for access provisioning
- Team-based applet assignments and collaboration
- Performance tracking and productivity analytics

### Business Module Support

| Business Module | Applet Store Integration |
|-----------------|-------------------------|
| **Financial Accounting** | Financial management applets, reporting tools, compliance solutions |
| **Manufacturing** | Production planning applets, quality control tools, supply chain solutions |
| **E-Commerce** | Online store management, customer service tools, marketing automation |
| **HR & Payroll** | Human resource management, payroll processing, employee engagement tools |
| **Project Management** | Project tracking tools, resource management, collaboration platforms |
| **Sales & CRM** | Customer relationship management, sales automation, lead tracking |
| **Inventory Management** | Warehouse management, stock tracking, demand forecasting |

### External System Integration

**Identity Management Systems**
- LDAP and Active Directory integration
- SAML and OAuth authentication providers
- Multi-factor authentication services
- Identity federation and single sign-on

**Enterprise Software Integration**
- ERP system connectors and data synchronization
- Business intelligence and analytics platforms
- Document management and collaboration tools
- Communication and messaging systems

**Cloud Platform Integration**
- Public cloud marketplace integration
- Container orchestration and deployment
- Serverless computing platform support
- API gateway and microservices architecture

## Best Practices for Implementation

### Organizational Readiness

**Governance Framework**
- Establish clear applet approval and procurement processes
- Define roles and responsibilities for applet management
- Create security and compliance policies for applet usage
- Implement change management procedures for new applets

**Training and Support**
- Develop comprehensive user training programs
- Create self-service documentation and tutorials
- Establish technical support escalation procedures
- Implement user feedback and improvement processes

**Performance Optimization**
- Regular assessment of applet utilization and value
- Optimization of permission structures and access controls
- Monitoring of system performance and resource usage
- Continuous improvement of user experience and workflows

### Security Best Practices

**Access Control Management**
- Implement principle of least privilege for all applet access
- Regular review and audit of user permissions and roles
- Automated deprovisioning for employee lifecycle changes
- Multi-layered security controls for sensitive applets

**Risk Management**
- Comprehensive risk assessment for new applet installations
- Regular security audits and vulnerability assessments
- Incident response procedures for security breaches
- Business continuity planning for critical applets

**Compliance Management**
- Regular compliance assessments and gap analysis
- Documentation and evidence collection for audits
- Policy enforcement and violation remediation
- Integration with enterprise compliance management systems

{{< callout type="info" >}}
**Platform Integration**: The Applet Store is fully integrated with the BigLedger platform, providing seamless navigation and consistent user experience across all modules.
{{< /callout >}}