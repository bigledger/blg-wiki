---
title: "Troubleshooting Guide"
description: "Systematic approaches to diagnosing and resolving common membership program issues"
weight: 40
---

## Troubleshooting Framework

Effective troubleshooting follows a systematic approach: identify symptoms, diagnose root cause, implement fix, verify resolution, and prevent recurrence.

### Diagnostic Process

```yaml
Step 1: Gather Information
  - What is the exact problem?
  - When did it start occurring?
  - How frequently does it occur?
  - Which members are affected (all, specific tier, specific location)?
  - Which channel (POS, e-commerce, mobile app)?
  - Error messages or codes displayed?

Step 2: Reproduce the Issue
  - Attempt to recreate the problem
  - Document exact steps that trigger the issue
  - Test in different environments (if applicable)
  - Isolate variables (specific product, location, staff member, etc.)

Step 3: Check Recent Changes
  - System configuration changes in last 7 days
  - Software updates or deployments
  - New campaign or promotion activations
  - Staff training or process changes

Step 4: Review Logs and Data
  - Transaction logs for affected member
  - System error logs
  - Audit trail of account changes
  - Integration logs (POS, e-commerce sync)

Step 5: Form Hypothesis
  - What is the most likely cause?
  - What evidence supports this hypothesis?
  - Can you test this hypothesis?

Step 6: Implement Fix
  - Apply targeted solution
  - Document changes made
  - Communicate to affected members if needed

Step 7: Verify Resolution
  - Test that issue is resolved
  - Confirm with affected member if applicable
  - Monitor for recurrence

Step 8: Prevent Recurrence
  - Update documentation
  - Train staff if process issue
  - Fix system configuration if technical issue
  - Add monitoring/alerts to detect early
```

## Points Accrual Issues

### Symptom: Points Not Appearing After Purchase

**Possible Causes and Solutions**

**Cause 1: Member Not Identified During Transaction**

```yaml
Diagnosis:
  - Review transaction record in POS
  - Check if member ID associated with transaction
  - Ask: Did cashier scan member card or lookup phone?

Solution:
  - Locate transaction by receipt number and timestamp
  - Manually associate transaction with member account
  - Manually credit points using adjustment function
  - Enter reason: "Missed member identification at POS"
  - Notify member via SMS: "Your points have been added"

Prevention:
  - Retrain cashiers on member identification process
  - Add POS prompt: "Did customer provide membership?"
  - Implement receipt audit (random checks for member ID)
  - Consider mandatory member scan before completing transaction
```

**Cause 2: Points Posting Delay (Batch Processing)**

```yaml
Diagnosis:
  - Check if system uses batch posting vs. real-time
  - Review batch schedule (hourly, daily)
  - Verify batch process completed successfully
  - Check batch logs for errors

Solution:
  - If batch pending: Wait for next batch run
  - If batch failed: Manually trigger batch process
  - Check transaction queue for stuck transactions
  - Process queued transactions

Member Communication:
  "Your points are being processed and will appear within [timeframe].
  Current balance will update automatically."

Prevention:
  - Move to real-time points posting where possible
  - Add member notification: "Points will appear within 1 hour"
  - Implement monitoring for batch failures
  - Alert staff when batches don't complete on schedule
```

**Cause 3: Excluded Product Category**

```yaml
Diagnosis:
  - Review purchased items
  - Check if items belong to excluded categories
  - Common exclusions: Gift cards, delivery fees, services

Solution:
  - If exclusion is correct: Explain policy to member
  - If exclusion is error: Update category configuration
  - If policy unclear: Consider policy revision

Member Communication:
  "Some purchases don't earn points per program terms:
  - Gift cards
  - Delivery charges
  - [Other exclusions]
  Your purchase of [X] falls under this exclusion."

Prevention:
  - Clear signage about exclusions at POS and online
  - Staff training on exclusions
  - POS notification when scanning excluded item
  - Terms and conditions clearly state exclusions
```

**Cause 4: System Integration Failure**

```yaml
Diagnosis:
  - Check integration status between POS and membership system
  - Review integration logs for errors
  - Test connection between systems
  - Check if other members affected (widespread vs. isolated)

Solution:
  - If connection down: Restore integration
  - If data sync failed: Manually sync transactions
  - If queue backed up: Process queued transactions
  - Credit affected members manually if urgent

System Check:
  - Test API endpoint connectivity
  - Verify authentication tokens valid
  - Check network connectivity
  - Review firewall rules

Prevention:
  - Implement integration health monitoring
  - Alert on integration failures within 5 minutes
  - Automated retry logic for failed transactions
  - Fallback to queuing if integration down
```

**Cause 5: Transaction Cancelled or Refunded**

```yaml
Diagnosis:
  - Check transaction status (completed, cancelled, refunded)
  - Verify payment actually processed
  - Review void or refund records

Solution:
  - If transaction voided: Points correctly not issued
  - If partially refunded: Adjust points proportionally
  - If member error: Credit appropriate points

Example:
  Original transaction: RM100, voided, re-rung as RM95
  Original points not issued: Correct
  New transaction points: 95 points
  Action: Ensure second transaction credited correctly
```

### Symptom: Incorrect Points Amount Credited

**Possible Causes and Solutions**

**Cause 1: Tier Multiplier Not Applied**

```yaml
Diagnosis:
  - Check member's tier at time of transaction
  - Review tier multiplier configuration
  - Calculate expected points: Base × Tier Multiplier × Campaign Multiplier
  - Compare expected vs. actual points credited

Solution:
  - Calculate correct point amount
  - Credit difference with reason code: "Tier multiplier correction"
  - Notify member of correction

Example:
  Transaction: RM200
  Member: Gold tier (1.5x multiplier)
  Expected: 200 × 1.5 = 300 points
  Actual credited: 200 points
  Correction needed: +100 points

Prevention:
  - Verify tier multiplier configuration
  - Test tier multipliers in QA environment
  - Add transaction-level validation
  - Daily audit report: Transactions vs. expected points
```

**Cause 2: Campaign Bonus Not Applied**

```yaml
Diagnosis:
  - Check active campaigns during transaction time
  - Verify transaction qualifies for campaign (dates, products, amount)
  - Review campaign configuration (multiplier, bonus points)

Solution:
  - Calculate campaign bonus points
  - Credit missing bonus with reason: "Campaign bonus correction"
  - Document campaign and transaction details

Example:
  Campaign: 2x points on weekends
  Transaction: Saturday, RM150
  Expected: 150 × 2 = 300 points
  Actual: 150 points (campaign not applied)
  Correction: +150 points

Prevention:
  - Test campaigns before activation
  - Verify campaign date ranges and eligibility
  - Add campaign validation during transaction
  - Receipt shows campaign applied: "Weekend 2x Bonus: +150 pts"
```

**Cause 3: Calculation Rounding Error**

```yaml
Diagnosis:
  - Check rounding rules (round up, down, nearest)
  - Calculate points manually
  - Identify pattern (always off by 1 point?)

Solution:
  - If systematic error: Fix rounding configuration
  - If isolated: Credit corrected amount
  - Document rounding policy

Example:
  Transaction: RM99.50
  Rounding down: 99 points
  Rounding up: 100 points
  Nearest: 100 points (if >X.50 rounds up)

Prevention:
  - Clearly define and document rounding policy
  - Consistent rounding across all systems
  - Member communication: "1 point per RM1 (rounded down)"
```

## Tier Progression Issues

### Symptom: Tier Not Upgrading Despite Meeting Threshold

**Diagnosis and Solutions**

**Cause 1: Qualification Calculation Period Mismatch**

```yaml
Diagnosis:
  - Verify qualification period (rolling 12 months vs. calendar year)
  - Check member's join date or last tier reset date
  - Review spending within correct period
  - Generate qualification report for member

Solution:
  - Explain qualification period to member
  - Show spending breakdown by month
  - If calculation correct but member expected upgrade: Educate on policy
  - If calculation error: Manually upgrade tier

Example:
  Member joined: June 15, 2023
  Tier qualification: RM3,000 in rolling 12 months
  Check period: June 15, 2023 - June 14, 2024
  NOT January 1 - December 31 (common misunderstanding)

Prevention:
  - Clear communication of qualification periods
  - Member dashboard shows progress with date range
  - Qualification period explained during enrollment
```

**Cause 2: Returns/Refunds Reduced Qualification Spending**

```yaml
Diagnosis:
  - Review member's return history
  - Check if returns deducted from qualification spending
  - Calculate net spending (purchases - returns)

Solution:
  - Explain that returns reduce qualification spending
  - Show net spending calculation
  - If member legitimately near threshold: Consider goodwill upgrade
  - If policy issue: Review whether returns should affect qualification

Example:
  Purchases: RM3,200
  Returns: RM400
  Net spending: RM2,800 (below RM3,000 threshold)
  Member doesn't qualify despite feeling they "spent RM3,200"

Prevention:
  - Communicate returns policy impact on tier qualification
  - Show net spending in member dashboard
  - Tier qualification tooltip: "Based on net spending after returns"
```

**Cause 3: Batch Processing Hasn't Run**

```yaml
Diagnosis:
  - Check when tier qualification batch last ran
  - Verify batch schedule (daily, weekly)
  - Review batch execution logs
  - Check for batch failures

Solution:
  - If batch pending: Wait for next scheduled run
  - If batch failed: Manually trigger tier qualification check
  - If urgent: Manually upgrade member after verification
  - Fix batch failure root cause

Member Communication:
  "Tier upgrades are processed daily at 2 AM. Your qualification was met
  yesterday and your upgrade will be reflected by tomorrow morning."

Prevention:
  - Implement batch monitoring with alerts
  - Automated alerts if batch doesn't complete on schedule
  - Add manual trigger option for support team
```

**Cause 4: Multi-Channel Spending Not Aggregated**

```yaml
Diagnosis:
  - Check spending across all channels (in-store, online, mobile)
  - Verify cross-channel data synchronization
  - Review channel-specific spending reports

Solution:
  - Force synchronization of all channel data
  - Calculate total spending across all channels
  - If qualification met: Manually trigger upgrade
  - Fix synchronization issue

Example:
  In-store spending: RM1,800
  Online spending: RM1,400
  Total: RM3,200 (qualifies for Gold at RM3,000)
  Issue: Systems not aggregating cross-channel spending

Prevention:
  - Real-time or frequent cross-channel synchronization
  - Unified member dashboard showing all channels
  - Nightly reconciliation of cross-channel data
```

### Symptom: Unwanted Tier Downgrade

**Diagnosis and Solutions**

**Cause 1: Grace Period Expired**

```yaml
Diagnosis:
  - Check grace period configuration for tier
  - Verify when member fell below threshold
  - Calculate grace period expiry date
  - Review communications sent during grace period

Solution:
  - If grace period properly expired: Explain to member
  - Show spending needed to re-qualify
  - Offer re-qualification path
  - Consider one-time courtesy extension if close

Member Communication:
  "Your Gold tier includes a 3-month grace period when spending falls
  below RM3,000 annually. Your grace period started March 1 and ended
  June 1. You can return to Gold by spending RM[amount] in the next 12 months."

Prevention:
  - Multi-stage grace period communications
  - Personal outreach for high tiers during grace period
  - Retention offers before grace period ends
```

**Cause 2: Spending Reset Error**

```yaml
Diagnosis:
  - Verify spending calculation is correct
  - Check for data loss or system errors
  - Review member transaction history completeness
  - Compare against receipts if member claims error

Solution:
  - If data error confirmed: Restore correct spending amount
  - Reinstate proper tier
  - Apologize and explain what happened
  - Credit goodwill points for inconvenience

Example:
  System migration caused loss of 6 months of transaction history
  Member appears to have RM800 spending but actually has RM3,400
  Restore missing transactions → Reinstate Gold tier

Prevention:
  - Regular data backups
  - Verification after system changes/migrations
  - Automated data integrity checks
  - Member transaction history display for self-verification
```

## Redemption Issues

### Symptom: Cannot Redeem Points at Checkout

**Diagnosis and Solutions**

**Cause 1: Insufficient Points Balance**

```yaml
Diagnosis:
  - Display current points balance to member
  - Compare to redemption amount requested
  - Check for pending transactions not yet posted

Solution:
  - Show available balance clearly
  - Suggest lower redemption amount
  - Explain points needed for desired redemption
  - Offer to complete transaction without redemption

Member Communication:
  "Your current balance is 850 points. You need 1,000 points for RM100
  off. You can redeem 800 points for RM80 off now, or complete this
  purchase to earn more points toward your next redemption."

Prevention:
  - Real-time balance display during checkout
  - Suggest redemption amounts within available balance
  - Visual indicator of redemption options affordable
```

**Cause 2: Redemption Limit Exceeded**

```yaml
Diagnosis:
  - Check redemption maximum rules (50% of transaction, etc.)
  - Calculate maximum redeemable for current transaction
  - Verify member understands the limit

Solution:
  - Explain redemption limit policy
  - Calculate maximum redemption for this transaction
  - Offer to redeem maximum allowed amount

Example:
  Transaction: RM150
  Maximum redemption: 50% = RM75
  Member wants to redeem 1,000 points (RM100)
  Only 750 points (RM75) can be redeemed for this transaction

Member Communication:
  "Our program allows redemption up to 50% of purchase value to ensure
  everyone can enjoy rewards. For your RM150 purchase, you can redeem
  up to RM75 (750 points). The remaining 250 points stay in your account."

Prevention:
  - Clear communication of redemption limits
  - POS/app shows maximum redeemable for current transaction
  - Terms and conditions clearly state limits
```

**Cause 3: System Offline or Integration Down**

```yaml
Diagnosis:
  - Check membership system connectivity
  - Verify API integration status
  - Test connection from POS/e-commerce
  - Determine if widespread or isolated

Solution:
  - If temporary: Queue redemption request for later processing
  - If extended outage: Generate manual voucher (manager approval)
  - Credit member account immediately when system restored
  - Provide estimated restoration time to member

Member Communication:
  "Our rewards system is temporarily unavailable. We've noted your
  redemption request for 500 points. We'll process it manually and
  email you confirmation within 2 hours. You can also return to redeem
  once the system is back online."

Prevention:
  - System uptime monitoring with alerts
  - Automated failover to backup systems
  - Offline redemption queue capability
  - Staff training on manual redemption procedures
```

**Cause 4: Expired Points Excluded from Balance**

```yaml
Diagnosis:
  - Review member point balance details
  - Check for recently expired points
  - Verify expiry policy (12 months, 24 months, etc.)
  - Check if member received expiry warnings

Solution:
  - Explain point expiry policy
  - Show expiry history for transparency
  - If member wasn't warned: Consider one-time reinstatement
  - Educate on future expiry prevention

Example:
  Member sees "I had 1,500 points last month!"
  Review shows: 700 points expired on June 30
  Current balance: 800 points (correctly excluding expired)
  Expiry warnings sent: May 30 (30 days) and June 15 (15 days)

Member Communication:
  "Points expire 12 months from earning date. Your 700 points earned
  in June 2023 expired on June 30, 2024. You received reminder emails
  on May 30 and June 15. Your current 800 points will expire between
  July 2024 and June 2025 (based on earning dates)."

Prevention:
  - Clear expiry policy communication
  - Multiple expiry warnings (60, 30, 7 days)
  - Member dashboard shows expiry dates
  - Push notifications for mobile app users
```

### Symptom: Voucher Not Accepted at POS

**Diagnosis and Solutions**

**Cause 1: Voucher Expired**

```yaml
Diagnosis:
  - Check voucher expiry date
  - Verify voucher was used before expiration
  - Review voucher generation and validity period

Solution:
  - If expired: Explain policy and show expiry date
  - If recently expired: Consider one-time courtesy acceptance
  - Generate replacement voucher with management approval (if appropriate)

Member Communication:
  "This voucher expired on [date]. Our vouchers are valid for 90 days
  from generation to ensure timely use. As a courtesy this one time,
  I can request a manager override to accept it."

Prevention:
  - Expiry warnings before voucher expires
  - Clear expiry date display on voucher
  - Email reminder 7 days before expiry
  - Extended validity for higher tiers (consideration)
```

**Cause 2: Voucher Already Redeemed**

```yaml
Diagnosis:
  - Check voucher status in system
  - Review redemption history for voucher code
  - Verify if member previously used this voucher

Solution:
  - Show redemption history to member
  - If member insists: Check for duplicate voucher fraud
  - If system error: Investigate and resolve
  - If fraud suspected: Escalate to fraud team

Member Communication:
  "Our system shows this voucher was redeemed on [date] at [location].
  Do you recall using it then? Would you like to check if you have
  other unredeemed vouchers in your account?"

Prevention:
  - One-time use voucher codes
  - Voucher marked redeemed immediately upon scan
  - Receipt shows voucher redeemed
  - Member account shows redeemed voucher history
```

**Cause 3: Wrong Product/Category for Voucher**

```yaml
Diagnosis:
  - Check voucher restrictions (category-specific, minimum purchase)
  - Review items in current transaction
  - Verify transaction meets voucher requirements

Solution:
  - Explain voucher restrictions
  - Show which items qualify
  - Suggest adding qualifying items or using different voucher

Example:
  Voucher: "RM50 off smartphone purchases"
  Current transaction: Laptop and accessories (no smartphone)
  Voucher doesn't apply to this transaction

Member Communication:
  "This voucher is valid for smartphone purchases only. Your current
  items (laptop and accessories) don't qualify. Would you like to check
  if you have other vouchers that apply to this purchase?"

Prevention:
  - Clear voucher restrictions on voucher itself
  - POS prompts with eligible items when scanning voucher
  - Member app shows voucher eligibility before redemption
```

## Multiple Membership Issues

### Symptom: Member Has Multiple Accounts

**Diagnosis and Solutions**

```yaml
Diagnosis:
  - Search for duplicate records by phone, email, name
  - Compare transaction histories
  - Determine which account is primary (more activity, correct info)
  - Identify how duplicates were created

Solution:
  1. Verify accounts belong to same person (data comparison)
  2. Merge accounts (combine points balances)
  3. Keep most complete/active account as primary
  4. Transfer points and transaction history
  5. Deactivate duplicate account
  6. Notify member of consolidation

Merge Process:
  - Add points balances together
  - Combine transaction history
  - Keep higher tier if different
  - Preserve all vouchers
  - Update member with consolidation confirmation

Prevention:
  - Duplicate detection at enrollment
  - Phone/email uniqueness validation
  - "Looks like you already have an account" prompt
  - Periodic duplicate detection runs
```

## API Integration Errors

### Symptom: Third-Party Integration Failing

**Diagnosis and Solutions**

**Cause: API Authentication Failure**

```yaml
Diagnosis:
  - Check API authentication tokens/keys
  - Verify token expiry dates
  - Test authentication endpoint
  - Review API credentials configuration

Solution:
  - Regenerate expired tokens
  - Update credentials in configuration
  - Re-authenticate API connection
  - Test integration after credential update

Prevention:
  - Monitor token expiry dates
  - Automated token refresh before expiry
  - Alert 30 days before token expiration
  - Document token renewal process
```

**Cause: API Rate Limiting**

```yaml
Diagnosis:
  - Check API call volume
  - Review rate limit configuration
  - Identify spike in API calls
  - Analyze call patterns

Solution:
  - Implement call throttling
  - Add queue for API calls
  - Request rate limit increase from provider
  - Optimize to reduce unnecessary calls

Prevention:
  - Monitor API usage against limits
  - Implement request caching
  - Batch API calls where possible
  - Alert at 80% of rate limit
```

## Escalation Guidelines

```yaml
Level 1 - Frontline Staff (Cashiers, Customer Service):
  - Handle common issues with documented procedures
  - Points not appearing: Manually credit up to 500 points
  - Tier questions: Explain qualification and show progress
  - Voucher issues: Verify and honor if valid
  - Escalate if: Cannot resolve in 10 minutes

Level 2 - Store/Department Manager:
  - Handle complex member issues
  - Manual adjustments up to 2,000 points (with justification)
  - Account merges (with verification)
  - Goodwill gestures (within guidelines)
  - Escalate if: Technical system issue or fraud suspected

Level 3 - Program Administrator:
  - System configuration issues
  - Bulk data corrections
  - Campaign troubleshooting
  - Reporting discrepancies
  - Escalate if: Requires development or architecture change

Level 4 - Technical Support:
  - System integration issues
  - API failures
  - Database problems
  - Performance issues
  - Escalate if: Requires vendor support or critical outage

Level 5 - Vendor/Development:
  - Software bugs
  - Architecture changes
  - Major system enhancements
  - Critical outages beyond internal capability
```

This comprehensive troubleshooting guide provides systematic approaches to diagnosing and resolving the most common membership program issues, enabling rapid resolution and maintaining member satisfaction while identifying opportunities for process and system improvements.
