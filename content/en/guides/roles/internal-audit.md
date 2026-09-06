---
title: "Internal Auditor Guide"
description: "Audit procedures and compliance guide for internal auditors"
weight: 50
draft: true  # unpublished 2026-09-06 (Vincent): see planning/reviews/ guides audit — substantially invented, or unreachable from navigation
---

# Internal Auditor - BigLedger System Evaluation Questions

## Role Profile
As an Internal Auditor (CIA, ACCA, CISA certified), I'm responsible for evaluating internal controls, compliance, and risk management using BigLedger's audit trail and control features. I conduct operational, financial, and compliance reviews across all business processes to ensure regulatory adherence and operational efficiency.

## 1. Audit Trail and Documentation

### System Access and User Activity
- Can BigLedger provide comprehensive audit trails showing who accessed what data, when, and from which location/device?
- How detailed are the user activity logs - do they capture view-only access, data modifications, and system administration activities?
- Can I track user sessions including login/logout times, concurrent sessions, and session timeout events?
- Are there reports showing unusual access patterns, such as after-hours activity or access from unusual locations?

### Transaction Documentation and Workflow Tracking
- How can I trace the complete lifecycle of a financial transaction from initiation to final posting?
- Does the system maintain version history for documents that have been modified, showing all changes and approvers?
- Can I track document workflows to verify that all required approvals were obtained before processing?
- Are there controls to prevent backdating of transactions, and can I identify any exceptions where this occurred?

### Master Data Change Tracking
- How comprehensive is the audit trail for changes to master data (customers, suppliers, items, chart of accounts)?
- Can I identify who made specific changes to pricing, credit limits, payment terms, or vendor banking details?
- Are there reports showing bulk changes to master data that might indicate potential data manipulation?
- How does the system handle and track emergency changes made outside normal approval processes?

### Document Integrity and Storage
- What controls ensure that supporting documents cannot be altered or deleted after transactions are posted?
- Can I verify that all required supporting documentation is attached to transactions before approval?
- How does the system handle document retention requirements and prevent unauthorized deletion?
- Are there checksums or digital signatures to verify document integrity over time?

## 2. Financial Controls and Segregation of Duties

### Role-Based Access Controls
- How can I verify that segregation of duties is properly implemented across key financial processes?
- Can I generate reports showing users who have conflicting permissions (e.g., ability to both create and approve purchase orders)?
- How does the system prevent privilege escalation or unauthorized role modifications?
- Are there controls to ensure that temporary permission grants are properly revoked when no longer needed?

### Approval Workflow Controls
- What mechanisms prevent users from bypassing required approval workflows or self-approving transactions?
- Can I test that approval limits are properly enforced and that transactions above limits require additional authorization?
- How does the system handle situations where approvers are unavailable - are there proper delegation controls?
- Are there reports showing exceptions where normal approval processes were overridden, and who authorized these exceptions?

### Journal Entry Controls
- What controls exist to prevent unauthorized journal entries or ensure proper documentation for all manual entries?
- Can I verify that all journal entries above certain thresholds require supervisor approval?
- How does the system prevent posting entries to closed periods, and who has authority to reopen periods?
- Are there automated controls to detect unusual journal entries (e.g., round numbers, large amounts, unusual account combinations)?

### Three-Way Matching Controls
- How can I test the effectiveness of three-way matching between purchase orders, receipts, and invoices?
- What tolerance levels are configured for price and quantity variances, and who can approve exceptions?
- Can I identify instances where matching was bypassed or overridden, and verify proper authorization?
- Are there reports showing the aging of unmatched documents that might indicate control weaknesses?

## 3. Revenue Cycle Controls

### Sales Order Processing and Credit Management
- How can I verify that all sales orders go through proper credit approval processes before fulfillment?
- What controls prevent sales to customers who have exceeded credit limits or have overdue balances?
- Can I test that pricing is applied correctly according to approved price lists and discount matrices?
- How does the system handle special pricing arrangements, and are these properly authorized and documented?

### Revenue Recognition and Billing Controls
- What controls ensure that revenue is recognized in the correct period according to delivery terms?
- Can I verify that all shipments are properly invoiced and that no goods leave without proper documentation?
- How does the system prevent duplicate billing or billing for unshipped goods?
- Are there automated controls to detect unusual revenue patterns that might indicate manipulation?

### Customer Master Data Integrity
- What controls prevent unauthorized changes to customer credit limits, payment terms, or pricing agreements?
- Can I identify who has authority to create new customers and verify that proper credit checks were performed?
- How does the system detect and prevent duplicate customer records that might enable fraud?
- Are there periodic reviews of customer master data to identify inactive or suspicious accounts?

### Returns and Credit Processing
- What approval processes are required for customer returns, refunds, and credit notes?
- Can I verify that all returns are properly authorized and that returned goods are received before credits are issued?
- How does the system prevent unauthorized credits or ensure that credit notes are supported by proper documentation?
- Are there controls to detect patterns of excessive returns that might indicate quality issues or fraud?

## 4. Procurement and Expenditure Controls

### Purchase Authorization and Approval
- How can I verify that all purchases are properly authorized according to established approval limits?
- What controls prevent splitting of purchase orders to circumvent approval requirements?
- Can I test that emergency purchases receive proper post-approval review and documentation?
- How does the system ensure that capital expenditures follow different approval processes than operational expenses?

### Vendor Master Data and Payment Controls
- What controls prevent unauthorized creation of vendors or changes to vendor banking information?
- Can I identify potential duplicate vendors that might be used for fraudulent payments?
- How does the system detect and prevent duplicate payments to the same vendor for the same invoice?
- Are there automated controls to flag payments to new vendors or changes in payment methods?

### Contract Compliance and Price Monitoring
- How can I verify that purchases comply with negotiated contract terms and pricing agreements?
- What tools help identify purchases made outside of approved vendor contracts?
- Can I monitor price variances to detect potential vendor fraud or contract violations?
- How does the system track contract expiration dates and ensure timely renewals or rebidding?

### Expense Management Controls
- What approval workflows are required for employee expense reports, and how are these enforced?
- Can I verify that expense reports include required supporting documentation before reimbursement?
- How does the system detect duplicate expense claims or potentially fraudulent expenses?
- Are there automated controls to flag expenses that exceed policy limits or appear unusual?

## 5. Inventory and Asset Management Controls

### Physical Inventory and Cycle Counting
- How can I verify that physical inventory counts are properly documented and reconciled to system records?
- What controls ensure that inventory adjustments are properly authorized and supported by documentation?
- Can I track the frequency and accuracy of cycle counts to assess inventory control effectiveness?
- How does the system handle and track inventory in transit or held by third parties?

### Inventory Valuation and Movement Controls
- What controls prevent unauthorized inventory movements or ensure proper documentation of transfers?
- Can I verify that inventory costing methods are consistently applied and properly configured?
- How does the system identify and track slow-moving, obsolete, or damaged inventory?
- Are there controls to ensure proper cutoff procedures for inventory transactions at period-end?

### Asset Management and Depreciation
- How can I verify that fixed asset additions are properly authorized and classified?
- What controls prevent unauthorized asset disposals or ensure proper approval and documentation?
- Can I test that depreciation calculations are accurate and consistently applied?
- How does the system track asset locations and ensure accountability for high-value items?

### Warehouse and Security Controls
- What controls restrict physical access to inventory storage areas and track personnel entry?
- Can I verify that inventory receipts and shipments are properly documented and authorized?
- How does the system handle and track consignment inventory or goods held for third parties?
- Are there controls to prevent unauthorized removal of inventory or detect theft?

## 6. Cash Management and Banking Controls

### Bank Reconciliation and Cash Controls
- How can I verify that bank reconciliations are performed timely and reviewed by independent personnel?
- What controls ensure that all bank accounts are properly recorded and reconciled in the system?
- Can I identify and investigate outstanding reconciling items that have been unresolved for extended periods?
- How does the system detect and prevent unauthorized electronic funds transfers or check issuance?

### Cash Receipt and Deposit Controls
- What controls ensure that all cash receipts are properly recorded and deposited intact and timely?
- Can I verify segregation of duties between cash collection, recording, and reconciliation functions?
- How does the system track and account for cash receipts from multiple sources (mail, electronic, counter)?
- Are there controls to prevent lapping or other cash manipulation schemes?

### Payment Authorization and Processing
- What approval levels are required for different types and amounts of cash disbursements?
- Can I verify that all payments are supported by proper documentation and authorization?
- How does the system prevent unauthorized payments or ensure that payments are made to legitimate vendors?
- Are there controls to detect and prevent check fraud or unauthorized electronic transfers?

### Petty Cash and Cash Handling
- What controls govern petty cash funds, including authorization, documentation, and reconciliation?
- Can I verify that cash handling procedures are properly documented and followed?
- How does the system track and limit petty cash transactions to prevent abuse?
- Are there periodic surprise counts and reconciliations of all cash funds?

## 7. Data Security and Access Controls

### User Access Management
- How can I audit user access rights to ensure they align with job responsibilities and segregation of duties requirements?
- What controls govern the provisioning and deprovisioning of user accounts when employees join, change roles, or leave?
- Can I identify dormant accounts or users with excessive permissions that pose security risks?
- How does the system handle and track shared accounts or service accounts used by multiple users?

### Authentication and Password Controls
- What password policies are enforced, and how can I verify their effectiveness?
- Can I test multi-factor authentication requirements for privileged users or sensitive transactions?
- How does the system handle account lockouts after failed login attempts, and who can unlock accounts?
- Are there controls to prevent password sharing or detect compromised credentials?

### Data Protection and Privacy Controls
- What controls prevent unauthorized export or downloading of sensitive financial data?
- Can I verify that data encryption is properly implemented for data at rest and in transit?
- How does the system handle and track access to personally identifiable information (PII)?
- Are there controls to ensure compliance with data protection regulations like PDPA?

### System Monitoring and Incident Response
- What monitoring tools detect and alert on security incidents or suspicious activities?
- Can I review logs of failed access attempts, privilege escalations, or unusual system behavior?
- How does the system handle and track security incidents, including investigation and remediation?
- Are there automated controls to detect and respond to potential data breaches?

## 8. Compliance and Regulatory Adherence

### Tax Compliance and Reporting
- How can I verify that SST calculations are accurate and comply with Malaysian tax regulations?
- What controls ensure that tax returns are filed timely and include all required information?
- Can I test compliance with e-invoicing requirements under the MyInvois system?
- How does the system handle and track tax exemptions or special tax treatments?

### Financial Reporting and Standards Compliance
- What controls ensure compliance with Malaysian Financial Reporting Standards (MFRS)?
- Can I verify that financial statements are prepared accurately and include all required disclosures?
- How does the system handle and track related party transactions and other special disclosures?
- Are there controls to ensure consistency in accounting policies and estimates across periods?

### Regulatory Reporting and Documentation
- What tools help prepare regulatory reports required by various authorities?
- Can I verify that all required regulatory filings are submitted timely and accurately?
- How does the system maintain documentation to support regulatory compliance?
- Are there controls to ensure proper record retention according to regulatory requirements?

### Policy Compliance and Ethics
- How can I monitor compliance with company policies and procedures?
- What tools help detect and investigate potential violations of ethics policies?
- Can I verify that employees receive required training and acknowledge policy updates?
- How does the system handle and track whistleblower reports and their investigation?

## 9. System Configuration and Change Management

### System Parameter and Configuration Controls
- What controls govern changes to system parameters, configuration settings, and user roles?
- Can I track who made configuration changes and verify that these were properly authorized?
- How does the system handle emergency changes, and are these subject to post-implementation review?
- Are there controls to ensure that configuration changes are tested before implementation?

### Software Updates and Patch Management
- What processes govern the installation of software updates, patches, and new features?
- Can I verify that all changes are properly tested and approved before deployment to production?
- How does the system handle rollback procedures if changes cause issues?
- Are there controls to ensure that security patches are installed timely?

### Data Migration and Integration Controls
- What controls govern data migrations during system upgrades or integrations?
- Can I verify the accuracy and completeness of migrated data?
- How does the system handle and track data integration with third-party systems?
- Are there controls to ensure data integrity during export and import processes?

### Backup and Disaster Recovery
- What controls ensure that regular backups are performed and can be successfully restored?
- Can I verify that disaster recovery procedures are tested periodically and documented?
- How does the system handle business continuity during system outages or disasters?
- Are there controls to ensure that backup data is protected and stored securely?

## 10. Management Reporting and Decision Support

### Report Accuracy and Completeness
- How can I verify that management reports accurately reflect underlying transaction data?
- What controls ensure that automated calculations in reports are correct and consistently applied?
- Can I test that all relevant data is included in reports and that nothing is omitted?
- How does the system handle and track manual adjustments to report data?

### Key Performance Indicators and Dashboards
- What controls ensure that KPIs are calculated correctly and based on reliable data?
- Can I verify that dashboard metrics are updated timely and accurately reflect current performance?
- How does the system handle and track threshold alerts and exception reporting?
- Are there controls to prevent manipulation of performance metrics?

### Budget and Variance Analysis
- What controls govern the budget preparation process and ensure accuracy of budget data?
- Can I verify that variance analysis is performed correctly and investigates significant differences?
- How does the system handle budget revisions and ensure proper authorization?
- Are there controls to ensure that budget vs. actual comparisons are meaningful and accurate?

### Financial Statement Preparation
- What automated controls support the financial statement preparation process?
- Can I verify that all necessary adjusting entries are made before financial statement generation?
- How does the system ensure that financial statements are mathematically accurate and balanced?
- Are there controls to ensure proper review and approval of financial statements before release?

## 11. Fraud Detection and Prevention

### Automated Fraud Detection
- What automated controls help identify potentially fraudulent transactions or patterns?
- Can the system detect unusual vendor relationships, duplicate payments, or suspicious transactions?
- How does the system identify transactions that bypass normal controls or approval processes?
- Are there algorithms to detect anomalies in financial data that might indicate fraud?

### Vendor and Customer Fraud Prevention
- What controls prevent the creation of fictitious vendors or customers for fraudulent purposes?
- Can I identify potential conflicts of interest between employees and vendors/customers?
- How does the system detect and prevent vendor master data manipulation?
- Are there controls to identify unusual patterns in vendor payments or customer receipts?

### Employee Fraud Detection
- What tools help identify potential employee fraud, such as expense account abuse or payroll manipulation?
- Can I monitor for unusual access patterns or transactions performed by employees?
- How does the system detect potential conflicts of interest or related party transactions?
- Are there controls to identify employees who consistently override system controls?

### Investigation and Reporting
- What tools support fraud investigation and evidence gathering?
- Can I preserve audit trails and system data for forensic analysis?
- How does the system handle and track whistleblower reports and their investigation?
- Are there controls to ensure proper escalation and reporting of suspected fraud?

## 12. Continuous Monitoring and Data Analytics

### Risk-Based Continuous Monitoring
- What tools support continuous monitoring of key risk areas and control processes?
- Can I set up automated monitoring rules to detect control failures or exceptions?
- How does the system prioritize monitoring activities based on risk assessment?
- Are there dashboards that provide real-time visibility into control effectiveness?

### Data Analytics and Anomaly Detection
- What data analytics capabilities help identify unusual patterns or outliers in financial data?
- Can I perform trend analysis to identify changes in business patterns that might indicate issues?
- How does the system support statistical sampling and testing of large populations?
- Are there machine learning capabilities to improve fraud detection over time?

### Exception Reporting and Alerting
- What exception reports are available to identify transactions that require further investigation?
- Can I configure automated alerts for specific risk scenarios or control failures?
- How does the system handle and track the resolution of exceptions and alerts?
- Are there escalation procedures for unresolved exceptions or repeated control failures?

### Audit Planning and Execution Support
- What tools help plan audit activities based on risk assessment and prior audit results?
- Can I track audit findings and their resolution status over time?
- How does the system support audit sampling and testing procedures?
- Are there templates and workflows to standardize audit procedures and documentation?

## Key Evaluation Criteria

When evaluating BigLedger's audit and control capabilities, I will focus on:

### System-Generated Evidence
- Completeness and reliability of audit trails
- Automated documentation of control processes
- Real-time monitoring and alerting capabilities
- Integration between different system modules

### Control Effectiveness
- Preventive vs. detective control mechanisms
- Exception handling and override procedures
- Segregation of duties enforcement
- Authorization and approval workflows

### Risk Management
- Risk assessment and monitoring tools
- Fraud detection and prevention capabilities
- Compliance monitoring and reporting
- Business continuity and disaster recovery

### Regulatory Compliance
- Malaysian regulatory requirement adherence
- Financial reporting standard compliance
- Tax and e-invoicing compliance
- Data protection and privacy controls

### Audit Efficiency
- Data analytics and continuous monitoring
- Automated testing and sampling capabilities
- Standardized audit procedures and documentation
- Management reporting and dashboard capabilities

This comprehensive evaluation will help determine BigLedger's suitability for supporting modern internal audit functions in Malaysian businesses, ensuring robust control environments and regulatory compliance.