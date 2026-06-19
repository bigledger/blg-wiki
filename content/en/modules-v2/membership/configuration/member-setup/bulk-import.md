---
title: "Bulk Import"
description: "Importing large volumes of member data efficiently using CSV files"
weight: 40
---

Bulk import enables you to create or update large numbers of member records efficiently by processing CSV files. This functionality is essential for launching membership programs with existing customer bases, migrating from legacy systems, or performing periodic updates to member data.

## When to Use Bulk Import

Bulk import is the right solution when:

**Launching a New Program** with thousands of existing customers who should become members. Manually creating each member record would be impractical and error-prone.

**Migrating from Another System** requires transferring member data, historical balances, and attributes from a legacy loyalty platform to BigLedger.

**Periodic Data Updates** need to be applied to many members simultaneously, such as updating member classes after a tier evaluation period or applying new labels to qualifying member segments.

**Partner Data Integration** involves receiving member lists from marketing partners, co-branded program partners, or acquisition campaigns that need to be imported as batch files.

**Fixing Data Quality Issues** discovered in member records often requires bulk updates. Rather than manually correcting thousands of records, export the data, make corrections in a spreadsheet, and reimport.

## Bulk Import vs. Manual Creation

Understanding when to use each approach:

**Use Bulk Import For:**
- Creating 50+ member records at once
- Systematic data migrations with consistent field mappings
- Periodic batch updates from external systems
- Large-scale corrections or updates
- Initial program launch with existing customer base

**Use Manual Creation For:**
- Creating a few member records individually
- One-off enrollments at customer touchpoints
- Test member records during configuration
- VIP members requiring special attention
- Situations where data is not available in structured format

## Preparing Data for Import

Successful bulk imports start with proper data preparation:

**Understand Required Fields.** Review BigLedger's member import template or documentation to identify which fields are mandatory. Typical required fields include:
- Customer identifier (code or ID linking to existing customer record)
- Membership number (if not auto-generated)
- Join date
- Status (Active, Inactive, etc.)

**Gather Optional Fields.** Collect data for optional fields that enhance member records:
- Member class assignment
- Member labels
- Effective dates
- Custom attributes specific to your implementation

**Validate Customer Records Exist.** Before importing members, verify that the customer records you're linking to already exist in BigLedger. The import will fail for any member referencing a non-existent customer. If needed, import or create customer records first through the Sales & CRM module.

**Clean the Data.** Review your source data for common issues:
- Remove duplicate membership numbers
- Standardize date formats (typically YYYY-MM-DD)
- Ensure status values match BigLedger's allowed values exactly
- Verify class codes exist in your member class configuration
- Check that label codes are valid

**Format as CSV.** Export or save your data as a CSV (Comma-Separated Values) file. CSV is the standard format for bulk imports in most enterprise systems. Ensure:
- First row contains column headers matching BigLedger's expected field names
- Data rows contain member records
- Text fields with commas are properly quoted
- Date fields use consistent format
- No trailing commas or blank columns

## CSV File Structure

A typical member import CSV file structure:

```
CustomerCode,MembershipNumber,JoinDate,Status,MemberClass,MemberLabels
CUST001,MBR00001,2024-01-15,Active,GOLD,"Electronics,EmailCampaign"
CUST002,MBR00002,2024-01-16,Active,SILVER,"HomeGoods,InStore"
CUST003,MBR00003,2024-01-17,Active,BRONZE,"Fashion"
```

**Column Header Guidelines:**
- Use exact field names as specified in BigLedger import documentation
- Headers are typically case-sensitive
- No spaces in header names unless specifically required
- Match system field names, not display labels

**Data Format Guidelines:**
- Dates: YYYY-MM-DD format (e.g., 2024-01-15)
- Status: Exact match to system values (Active, Inactive, Suspended, etc.)
- Class codes: Match existing member class codes exactly
- Labels: Multiple labels separated by commas within quotes
- Numbers: No formatting (e.g., 12345 not 12,345)
- Text: Quote strings that contain commas

## Performing the Import

To execute a bulk member import:

**Access Import Function.** Navigate to the Membership Module and locate the bulk import or data import function. This is typically under Membership > Import Members or Tools > Member Import.

**Select Import Type.** Choose whether you're performing:
- New member creation (adds new member records)
- Member updates (modifies existing member records)
- Upsert operation (creates new or updates existing based on match key)

**Upload CSV File.** Click "Browse" or "Choose File" and select your prepared CSV file from your computer. Some systems allow you to paste CSV data directly instead of uploading a file.

**Configure Field Mapping.** The system will display a field mapping interface where you map CSV columns to BigLedger member fields:
- Review auto-detected mappings (often based on matching column names)
- Manually adjust any incorrect mappings
- Verify that required fields are mapped
- Leave optional fields unmapped if not present in your CSV

**Set Import Options.** Configure import behavior:
- **Validation Mode:** Run validation only without creating records to check for errors
- **Duplicate Handling:** Skip duplicates, update duplicates, or reject import if duplicates found
- **Error Handling:** Stop on first error or continue importing valid records
- **Welcome Points:** Optionally credit welcome points to new members during import

**Preview Records.** If available, use the preview function to see how the first few records will be imported. This helps catch mapping or formatting issues before processing the full file.

**Execute Import.** Click "Import" or "Process" to begin the import. The system will:
- Validate each record against business rules
- Check for required fields and data format
- Verify referenced records exist (customers, classes, labels)
- Create or update member records
- Generate an import log

**Review Results.** After import completes, review the results summary:
- Records successfully imported
- Records failed with errors
- Warning messages for partial issues
- Download detailed log file for error analysis

## Handling Import Errors

Common import errors and solutions:

**Customer Not Found.** The customer code in your CSV doesn't match any existing customer record.
- Solution: Verify customer codes are correct, create missing customer records, or update your CSV with valid codes.

**Duplicate Membership Number.** A membership number in your file already exists in the system.
- Solution: Use unique membership numbers, enable auto-numbering, or choose "update" mode if you intend to update existing members.

**Invalid Member Class.** The class code doesn't match any configured member class.
- Solution: Create the missing member class, or correct class codes in your CSV to match existing classes.

**Invalid Date Format.** Dates are not in the expected format.
- Solution: Reformat dates to YYYY-MM-DD or the format specified in your system documentation.

**Invalid Status Value.** The status field contains a value not recognized by the system.
- Solution: Use only valid status values: Active, Inactive, Suspended, Terminated (or as defined in your system).

**Required Field Missing.** A mandatory field has no value for one or more records.
- Solution: Fill in required fields for all records before importing.

**Data Type Mismatch.** A field expecting numeric data received text, or vice versa.
- Solution: Review field data types and ensure your CSV data matches expected types.

## Import Validation Best Practices

Minimize import errors with proper validation:

**Validate in Stages.** Process imports in stages when handling large volumes:
1. Import 10 test records to verify mapping and formatting
2. Import 100 records to test at moderate scale
3. Import remaining records after confirming no issues

**Use Validation Mode First.** If available, run the import in validation-only mode before executing the actual import. This identifies errors without creating any records.

**Check Reference Data.** Before importing, verify that all referenced data exists:
- Query customer codes to ensure they're in the system
- Verify member class codes match your configuration
- Confirm label codes are valid

**Review Logs Carefully.** Import logs contain valuable information. Even successful imports may have warnings about data quality issues that should be addressed.

**Keep Source Data.** Maintain a copy of your source CSV file and any cleaned/prepared versions. If you need to troubleshoot or re-import, having the original data is essential.

## Updating Existing Members

Bulk import can update existing member records:

**Identify Members by Key.** Specify which field uniquely identifies members for matching:
- Membership number is typically the primary key
- Some systems allow matching by customer code
- Ensure your CSV includes the match key for all records

**Include Only Fields to Update.** In update mode, you typically only need to include:
- The match key (e.g., membership number)
- Fields you want to update
- Unchanged fields can be omitted

**Update Scenarios:**
- Update member classes after tier evaluation
- Add new labels to qualifying member segments
- Correct data quality issues discovered in audits
- Update status for members who should be suspended or reactivated
- Modify effective dates for membership period renewals

**Example Update CSV:**
```
MembershipNumber,MemberClass,Status
MBR00001,PLATINUM,Active
MBR00002,GOLD,Active
MBR00003,SILVER,Inactive
```

This CSV would update only the class and status for the specified members, leaving all other fields unchanged.

## Importing Point Balances

Some implementations allow importing initial point balances:

**Historical Balance Imports.** When migrating from a legacy system, you may need to import members' existing point balances so they don't lose accumulated points.

**Separate Point Import.** Point balance imports often use a separate import process from member creation:
1. Import member records first
2. Import point balances second, referencing the newly created membership numbers

**Point Import CSV Structure:**
```
MembershipNumber,PointCurrency,PointAmount,TransactionDate,Description
MBR00001,REWARDS,5000,2024-01-15,Migration-Opening Balance
MBR00002,REWARDS,12500,2024-01-15,Migration-Opening Balance
```

**Accounting Considerations.** Imported point balances create liability on your financial statements. Coordinate with your accounting team to ensure proper journal entries are made for the total point liability being imported.

## Import Performance Considerations

For large-scale imports:

**Batch Size.** If importing tens of thousands of records, consider breaking into smaller batches:
- Process 5,000-10,000 records per batch
- Allows progress monitoring and easier error recovery
- Reduces risk of timeout or memory issues

**Off-Peak Timing.** Schedule large imports during off-peak hours when system load is lower and fewer users are active. This improves import performance and minimizes impact on concurrent users.

**Disable Unnecessary Processes.** If possible, temporarily disable automated processes that trigger on member creation (like welcome emails) during bulk import. Enable them after import completes and send batch communications separately.

**Database Maintenance.** For very large imports (100,000+ records), consult with your database administrator about optimal import strategies and any database maintenance tasks to perform before and after import.

## Post-Import Activities

After completing a bulk import:

**Verify Record Counts.** Compare the number of records in your CSV to the number successfully imported. Investigate any discrepancies.

**Spot-Check Records.** Manually review a sample of imported member records to verify data was imported correctly, mappings worked as expected, and all fields contain appropriate values.

**Test Transactions.** For newly imported members, test key transactions:
- Look up members by membership number
- Process a test point earn transaction
- Attempt a test reward redemption
- Verify member-specific pricing applies correctly

**Address Errors.** Review the error log and address any failed records:
- Correct the issues in your source data
- Re-import failed records after correction
- Document common errors to prevent in future imports

**Communication.** If importing existing customers as new members, plan welcome communications. Consider staggered communication rather than emailing thousands of members simultaneously.

**Update Documentation.** Document the import process, including field mappings used, any special handling required, and lessons learned for future imports.

## Import Templates and Documentation

Most implementations provide import templates:

**Obtain Template File.** Request or download the member import CSV template from your system administrator or BigLedger documentation. This template will have:
- Correct column headers
- Sample data showing proper formatting
- Comments explaining field requirements

**Document Custom Fields.** If your implementation has custom member fields, document them in your import template:
- Field name
- Data type and format
- Required or optional
- Valid values or range
- Business purpose

**Maintain Version Control.** As your configuration evolves (new member classes, new labels, new custom fields), maintain updated import templates that reflect current system configuration.

## Integration with External Systems

Bulk import often supports ongoing integrations:

**CRM Integration.** Regular exports from your CRM system can be formatted and imported to keep member records synchronized with customer data updates.

**Marketing Platform Integration.** Marketing automation platforms may provide member segment exports that you import to apply labels or update member attributes based on marketing engagement.

**Partner Data Feeds.** Co-branded programs or partner networks may provide regular member data files that you import to maintain shared membership databases.

**Scheduled Imports.** Some organizations schedule automated imports:
- Daily imports of new member signups from website forms
- Weekly imports of tier status updates after recalculation
- Monthly imports of member updates from external systems

For automated imports, ensure robust error handling, logging, and alerting so import failures are detected and addressed quickly.

## Common Bulk Import Mistakes

Avoid these frequent errors:

**Not Validating Before Import.** Importing without validation testing leads to discovering errors only after records are created, requiring cleanup effort.

**Incorrect Date Formats.** Using formats like MM/DD/YYYY when the system expects YYYY-MM-DD causes all dates to import incorrectly or fail validation.

**Missing Required Fields.** Omitting mandatory fields causes entire import to fail. Review requirements before preparing data.

**Duplicate Keys.** Including duplicate membership numbers in a single import file causes conflicts. Ensure each record has a unique key.

**Not Checking Customer References.** Attempting to import members linked to non-existent customers fails. Verify customer existence first.

**Importing Too Much Too Fast.** Running a full import without testing on a subset risks large-scale errors that are difficult to clean up.

**No Backup Plan.** Not maintaining source data or having a rollback plan makes it difficult to recover from import issues.

Bulk import is a powerful tool for scaling your membership program efficiently. Proper preparation, validation, and execution ensure smooth imports that populate your member database accurately and completely.
