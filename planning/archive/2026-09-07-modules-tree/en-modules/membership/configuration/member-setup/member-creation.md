---
title: "Member Creation"
description: "Step-by-step guide to creating individual member records and linking them to customer accounts"
weight: 10
---

Creating member records is the process of enrolling customers into your membership program. Each member record links to a customer master record in BigLedger and tracks membership-specific attributes like join date, tier assignment, and point balances.

## Understanding Member-Customer Relationship

The relationship between members and customers is fundamental to how BigLedger manages membership programs:

**Customer Records** exist in the Sales & CRM module and contain master data like name, contact information, billing addresses, and transaction history. Customer records are the foundation for all customer interactions in BigLedger.

**Member Records** exist in the Membership Module and link to customer records. A member record adds loyalty program attributes to a customer—membership number, tier status, point balances, and reward eligibility.

The same customer record can have multiple member records, enabling scenarios like separate retail and wholesale memberships, corporate and personal programs, or regional loyalty programs that operate independently.

## Prerequisites for Member Creation

Before creating member records, ensure these prerequisites are met:

**Customer Records Must Exist.** You cannot create a member without a corresponding customer record. If you're enrolling a new customer who doesn't exist in BigLedger, create the customer record in Sales & CRM first, then create the member record.

**Member Classes Should Be Defined** if you're using tier-based membership. While you can create members without assigning them to classes, tier programs require that classes exist before member creation so you can assign the appropriate tier during enrollment.

**Point Currencies Should Be Configured** if you plan to issue welcome points during member creation. The point currency must exist before you can credit points to a new member.

**User Permissions Must Include Member Creation.** Ensure your user role has the necessary permissions to create member records in the Membership Module.

## Creating a Member Record

To create a new member record through the BigLedger interface:

**Access Member Creation.** Navigate to the Membership Module and locate the member maintenance function. This is typically found under Membership > Member Maintenance or a similar menu path depending on your BigLedger configuration.

**Initiate New Member.** Click the "New" or "Create Member" button to open the member creation form. The system will present a blank member record ready for data entry.

**Link to Customer.** In the customer selection field, search for and select the customer record this member will link to. You can search by customer code, customer name, or other identifying attributes. The system will populate customer-related fields automatically from the linked customer master data.

**Assign Membership Number.** Enter a unique membership number or let the system generate one automatically if auto-numbering is configured. The membership number is the primary identifier for this member record and will be used for point transactions, reward redemption, and reporting.

**Set Join Date.** Enter the membership join date. This defaults to today's date but can be backdated if you're enrolling a customer who joined previously. The join date determines membership tenure, which may affect tier progression or anniversary benefits.

**Assign Member Class.** If using tier-based membership, select the appropriate member class from the dropdown. This determines the member's tier level and associated benefits. For new members, this is typically your entry-level tier unless they qualify for immediate higher tier status.

**Apply Member Labels.** Add any relevant member labels for segmentation. You can apply multiple labels to a single member. Common labels for new members include "New Member," campaign source tags like "Spring2024Promo," or channel indicators like "OnlineSignup."

**Configure Points Settings.** If your program allows, configure point-related settings such as point earning multipliers specific to this member or opt-in/opt-out status for point accrual. Some organizations set custom earning rates for VIP customers.

**Set Status.** Ensure the member status is set to "Active" unless there's a specific reason to create an inactive member record. Only active members participate in point earning and reward redemption.

**Save the Record.** Click "Save" or "Submit" to create the member record. The system will validate the data, check for duplicate membership numbers, and create the record if all validations pass.

## Member Record Fields

Understanding the key fields in a member record helps ensure accurate data entry:

**Membership Number** uniquely identifies the member within the membership program. This number appears on member cards, in POS transactions, and in all membership reports. Choose a numbering scheme that supports your volume—numeric sequences work well for most programs, but you might use prefix codes to indicate membership type or enrollment location.

**Customer Link** connects the member to their customer master record. This relationship is mandatory and cannot be changed after creation in most BigLedger implementations. Ensure you link to the correct customer during creation.

**Member Class** determines the tier level and associated benefits. This field can be updated as members progress through tiers based on spending, tenure, or other criteria. Not all programs use classes—flat membership structures leave this field empty.

**Member Labels** provide flexible categorization. Unlike class (which is singular), a member can have multiple labels simultaneously. Labels can be added or removed freely as member attributes change.

**Join Date** records when the member enrolled. This date feeds tenure calculations and may trigger anniversary benefits or tier review processes. Join date typically cannot be changed after creation to maintain audit integrity.

**Status** indicates whether the member is Active, Inactive, Suspended, or Terminated. Only active members participate in the program. Status changes are common during member lifecycle management.

**Effective Dates** define when the membership is valid. Some programs use membership periods (e.g., annual memberships that expire and require renewal). Effective date ranges control when the member can accrue and redeem points.

**Point Balances** display current balances across all point currencies configured in your program. These are calculated fields showing total points earned minus points redeemed and expired. You cannot edit point balances directly—they update through point transactions.

## Creating Multiple Memberships for One Customer

BigLedger's support for multiple memberships per customer enables sophisticated program designs. Here's how to implement this practically:

**Scenario Understanding.** First, determine why a customer needs multiple memberships. Common scenarios include separate business and personal memberships, participation in both a regional and national program, or membership in different brand programs owned by the same parent company.

**Creating the First Membership.** Create the first membership normally using the process described above. Link it to the customer record and configure it for its specific program context (e.g., the retail loyalty program).

**Creating the Second Membership.** To create a second membership for the same customer:
1. Access member creation again
2. Search for and select the same customer record
3. Assign a different membership number (the system may require this to be from a different number series to avoid confusion)
4. Configure this membership for its distinct context (e.g., the wholesale program)
5. Save the record

**Differentiating Memberships.** Use member classes or labels to clearly differentiate which program each membership belongs to. For example, you might have classes named "Retail-Gold" and "Wholesale-Platinum" to make the program context obvious in reports and transactions.

**Transaction Context.** When processing transactions for a customer with multiple memberships, the system or user must specify which membership to apply points to or redeem from. POS systems typically prompt staff to select the relevant membership. Design workflows that make this selection unambiguous.

**Reporting Considerations.** Reports may aggregate all memberships or filter by specific programs. When analyzing program performance, ensure you're filtering to the relevant membership context. A customer's total lifetime value might span multiple memberships, but program-specific metrics should isolate individual membership performance.

**Communication Strategy.** Communicate clearly with customers who have multiple memberships about which program applies in which situation. Membership cards, emails, and statements should indicate the specific membership to avoid confusion during redemption.

## Welcome Points and Initial Balances

Many programs issue welcome points to new members as an enrollment incentive:

**Configuring Welcome Points.** If your program offers welcome points, you can issue them at the time of member creation or through a batch process after creation. To issue welcome points during creation, some BigLedger implementations provide a "welcome points" field where you enter the point amount to credit.

**Manual Point Issuance.** If welcome points aren't available during member creation, create a manual point transaction immediately after saving the new member record. Navigate to the point transaction function, select the member, choose the appropriate point currency, and enter the welcome point amount with a transaction type like "Welcome Bonus" or "Enrollment Credit."

**Batch Welcome Points.** For bulk member creation, you might issue welcome points in a batch after all members are created. Create a point transaction batch file that includes all new member numbers and the standard welcome point amount, then import this batch to credit all new members simultaneously.

**Accounting for Welcome Points.** Welcome points create a liability on your balance sheet. Ensure your accounting team is aware of welcome point issuance so they can record the appropriate liability in Financial Accounting. The point value will be determined by your points-to-cash conversion rate.

## Member Creation for Different Program Types

The member creation process adapts to different program structures:

**Flat Programs** without tiers simply create all members without assigning a member class. All members have equal status and access to the same benefits. Creation is straightforward—link to customer, assign membership number, set join date, save.

**Tier Programs** require assigning each member to a class during creation. New members typically start in the entry-level tier unless they qualify for immediate higher tier placement through sign-up criteria like joining through a premium channel or making a qualifying purchase.

**Paid Membership Programs** may require linking the member creation to a payment transaction. After collecting the membership fee through a sales transaction, create the member record and set the effective date to reflect the membership period purchased (e.g., one year from join date).

**Corporate Programs** where employers enroll employees in bulk may involve creating members without individual customer consent. Ensure your member creation process captures any required flags for corporate-sponsored memberships to differentiate them from self-enrolled members in communications and terms.

**Invitation-Only Programs** might require verification of invitation eligibility before allowing member creation. Implement workflow steps that check invitation codes or approval status before the member record can be saved.

## Data Validation and Error Handling

BigLedger performs several validations during member creation:

**Duplicate Membership Number** checks prevent two members from having the same membership number. If you manually enter a number that already exists, the system will reject the creation and prompt for a unique number.

**Customer Link Validation** ensures the selected customer record exists and is active. You cannot link to deleted or inactive customers in most configurations.

**Class Assignment Validation** checks that the selected member class exists and is valid for assignment. If you try to assign a discontinued class, the system may warn or prevent the assignment.

**Date Logic Validation** ensures that effective dates make sense—the end date must be after the start date, and join date cannot be in the future in most configurations.

**Required Field Validation** prevents saving if mandatory fields are empty. The system will highlight missing fields and prevent submission until they're completed.

If validation errors occur, correct the indicated issues and attempt to save again. Most validation messages provide clear guidance on what needs to be fixed.

## Post-Creation Activities

After successfully creating a member record, several follow-up activities may be necessary:

**Issue Membership Card.** If your program uses physical or digital membership cards, generate the card with the membership number, member name, and tier level. Cards may include barcodes or QR codes for easy scanning during transactions.

**Send Welcome Communication.** Trigger a welcome email or SMS to the new member. Include their membership number, explain how to earn and redeem points, highlight current rewards, and provide links to member portal login information.

**Credit Welcome Points.** If welcome points weren't credited during creation, process the manual point transaction or include the member in the next welcome points batch.

**Update Marketing Lists.** Add the new member to appropriate marketing lists, CRM campaigns, or email nurture sequences designed for new members.

**Train Staff.** If this is one of your first members, ensure POS staff and customer service representatives know how to look up member information, process point transactions, and assist with reward redemption.

## Best Practices for Member Creation

**Verify Customer Data First.** Before creating the member record, confirm that the customer master data is accurate and current. Creating a member links to this data, so errors in the customer record will propagate to the member profile.

**Use Consistent Numbering.** Establish a clear membership numbering scheme and follow it consistently. Whether you use sequential numbers, include date prefixes, or embed location codes, consistency makes member lookup and troubleshooting easier.

**Document Join Source.** Use labels or custom fields to track where members enrolled—online signup, in-store enrollment, promotional campaign, etc. This source attribution is valuable for measuring enrollment channel effectiveness.

**Set Proper Permissions.** Not all users should be able to create members. Limit member creation permissions to roles that need them, such as customer service managers or marketing staff, to maintain data quality and audit trails.

**Test Before Volume Creation.** Create several test members and process test transactions before launching large-scale enrollment. Verify that point accrual, reward eligibility, and reporting work correctly with real member records.

**Plan for Scale.** Even if starting small, configure member creation processes that will scale to your growth plans. Auto-numbering, integration with signup forms, and bulk import capabilities become essential as membership volume grows.

Member creation is the gateway to your loyalty program. Taking care during this process ensures clean data, happy members, and smooth operations as your program grows.
