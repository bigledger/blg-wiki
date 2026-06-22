---
title: Troubleshooting
description: Common issues, solutions, and problem-solving techniques for BigLedger users
tags: [troubleshooting, support, problems, solutions]
weight: 90
bookCollapseSection: false
---

Quick solutions to common BigLedger issues and comprehensive problem-solving guides. This section helps you resolve problems quickly and get back to productive work.

## Quick Problem Resolution

### Most Common Issues

This comprehensive troubleshooting guide addresses the most common BigLedger issues with specific error codes, step-by-step solutions, and preventive measures.

#### Login & Access Problems
- **Cannot Login**: Password resets, account status, browser issues
- **Missing Features**: Permission problems, applet availability
- **Slow Performance**: Browser optimization, network issues
- **Session Timeouts**: Security settings, browser configuration

#### Data Entry Issues
- **Cannot Save Records**: Validation errors, required fields
- **Missing Dropdown Options**: Master data setup, permissions
- **Import Failures**: Data format, mapping errors
- **Duplicate Records**: Data validation, merge procedures

#### Transaction Problems
- **Order Processing Errors**: Workflow issues, approval chains
- **Pricing Problems**: Price scheme configuration, customer settings
- **Inventory Discrepancies**: Stock adjustments, location issues
- **Report Errors**: Data access, parameter settings

## Step-by-Step Troubleshooting

### 1. Identify the Problem
- **Document Symptoms** - What exactly is happening?
- **Reproduce the Issue** - Can you make it happen again?
- **Check Timing** - When did this start occurring?
- **Gather Context** - What were you trying to accomplish?

### 2. Gather Information
- **Error Messages** - Copy exact error text and codes
- **Screenshots** - Visual evidence of the problem
- **User Account Details** - Permissions and role information
- **System Environment** - Browser, device, network information

### 3. Try Basic Solutions
- **Refresh/Reload** - Simple browser refresh
- **Clear Cache** - Browser cache and cookies
- **Different Browser** - Test with another browser
- **Check Permissions** - Verify access rights

### 4. Advanced Diagnostics
- **Check System Status** - Is the system running normally?
- **Review Recent Changes** - What changed recently?
- **Test with Different Data** - Is it data-specific?
- **Consult Documentation** - Review relevant user guides

## BigLedger Error Codes and Solutions

### System Error Codes (ERR-SYS-XXXX)

**ERR-SYS-0001: Access Denied**
- **Cause**: User lacks necessary permissions for the requested operation
- **Technical Details**: Permission validation failed at module or feature level
- **Immediate Solution**:
  1. Contact system administrator
  2. Verify user role assignments in User Management
  3. Check module-specific permissions
- **Long-term Prevention**:
  - Implement regular permission audits (quarterly)
  - Use role-based access control (RBAC) consistently
  - Document permission requirements for each business function

**ERR-SYS-0002: Session Expired**
- **Cause**: Security timeout due to inactivity (default: 60 minutes)
- **Technical Details**: Session token has exceeded maximum lifetime
- **Immediate Solution**:
  1. Log out completely and log back in
  2. Clear browser cache and cookies
  3. Disable browser auto-save for sensitive data
- **Configuration Options**:
  ```
  Session Settings (Admin > Security):
  • Timeout Period: 30-480 minutes
  • Idle Warning: 5 minutes before expiry
  • Concurrent Sessions: Allow/Restrict
  • Remember Me: Enable/Disable
  ```

**ERR-SYS-0003: Database Connection Failed**
- **Cause**: Network interruption or database server unavailable
- **Technical Details**: Connection pool exhausted or database maintenance
- **Immediate Solution**:
  1. Wait 2-3 minutes and retry
  2. Check system status at status.bigledger.com
  3. Contact support if issue persists >5 minutes
- **Prevention**: Monitor database health and connection pool usage

### Data Validation Errors (ERR-VAL-XXXX)

**ERR-VAL-1001: Required Field Missing**
- **Cause**: Mandatory field left empty during data entry
- **Field Types**: Customer code, product name, transaction amount, etc.
- **Solution Steps**:
  1. Review form for red asterisk (*) marked fields
  2. Fill all required information
  3. Validate data format (dates, numbers, email)
  4. Save record again
- **Common Missing Fields**:
  ```
  Customer Records: Name, Tax ID, Contact Info
  Product Records: Code, Name, Unit of Measure
  Transactions: Date, Amount, Account Code
  ```

**ERR-VAL-1002: Invalid Data Format**
- **Cause**: Data doesn't match expected format or business rules
- **Common Scenarios**:
  - Invalid email format (missing @ symbol)
  - Incorrect date format (DD/MM/YYYY required)
  - Invalid phone number format (+60-XXX-XXXXXXX)
  - Tax ID format doesn't match Malaysian standards
- **Solution**:
  1. Check field format hints and examples
  2. Use format validators where available
  3. Copy-paste from verified sources

### Transaction Errors (ERR-TXN-XXXX)

**ERR-TXN-2001: Insufficient Inventory**
- **Cause**: Attempting to sell/allocate more stock than available
- **Technical Details**: Real-time inventory check failed
- **Detailed Solution**:
  1. Check current stock levels: **Inventory > Stock Inquiry**
  2. Verify stock location and availability
  3. Consider these options:
     - Reduce quantity to available stock
     - Transfer stock from other locations
     - Create back-order for remaining quantity
     - Update inventory if stock count is incorrect
- **Stock Management Best Practices**:
  ```
  • Set reorder points for all active items
  • Monitor stock levels daily
  • Implement automatic reorder notifications
  • Regular cycle counting for accuracy
  ```

**ERR-TXN-2002: Price Not Found**
- **Cause**: No valid price configured for item/customer combination
- **Price Hierarchy Check**:
  1. Customer-specific pricing
  2. Customer group pricing
  3. Promotional pricing
  4. Standard price list
  5. Base cost price
- **Configuration Steps**:
  1. Navigate to **Sales > Price Management**
  2. Set up price schemes by customer type
  3. Configure promotional pricing periods
  4. Set default prices for new products
  5. Test pricing with sample transactions

### Malaysian Compliance Errors (ERR-MYS-XXXX)

**ERR-MYS-4001: SST Calculation Error**
- **Cause**: Sales and Service Tax calculation or configuration issue
- **SST Rules**:
  - Standard Rate: 6% (most goods and services)
  - Zero Rate: 0% (exports, exempt goods)
  - Exempt: No SST applicable
- **Configuration Check**:
  1. **Product Setup**: Verify SST code assignment
  2. **Customer Setup**: Check SST exemption status
  3. **Tax Settings**: Review SST calculation rules
  4. **Rate Updates**: Ensure current SST rates are loaded

**ERR-MYS-4002: e-Invoice Generation Failed**
- **Cause**: MyInvois integration error or validation failure
- **LHDN e-Invoice Requirements**:
  ```
  Mandatory Fields:
  • Supplier TIN (Tax Identification Number)
  • Buyer TIN (for B2B transactions)
  • Invoice date and time
  • Unique invoice number
  • Product/service description
  • SST details
  ```
- **Validation Errors**:
  1. **TIN Format**: Must be valid Malaysian TIN format
  2. **Date/Time**: Must be within MyInvois submission timeframe
  3. **Currency**: Only MYR and approved foreign currencies
  4. **Document Type**: Must match LHDN approved types

### Integration Errors (ERR-INT-XXXX)

**ERR-INT-3001: Sync Failed - Banking**
- **Cause**: Bank integration connection failed or authentication expired
- **Specific Banks Supported**: Maybank, CIMB, Public Bank, RHB, Hong Leong
- **Troubleshooting Steps**:
  1. **Check Credentials**: Verify bank login details in **Finance > Bank Integration**
  2. **Test Connection**: Use "Test Connection" button
  3. **Refresh Tokens**: Re-authenticate if using OAuth
  4. **Network Check**: Ensure firewall allows bank connections
  5. **Bank Status**: Check if bank system is down for maintenance

**ERR-INT-3002: E-commerce Sync Error**
- **Cause**: Connection issues with online store platforms
- **Supported Platforms**: Shopee, Lazada, WooCommerce, Magento, Shopify
- **Error Subtypes**:
  ```
  3002-A: Authentication failure
  3002-B: Product catalog sync failed
  3002-C: Order download error
  3002-D: Inventory update failed
  3002-E: Pricing sync error
  ```
- **Platform-Specific Solutions**:
  - **Shopee**: Check API key and secret in Seller Center
  - **Lazada**: Verify app authorization in Seller Center
  - **WooCommerce**: Test REST API credentials
  - **Shopify**: Refresh private app permissions

{{< callout type="warning" >}}
**Safety First**: Before making any system changes to resolve issues, ensure you have proper backups and understand the impact of your changes.
{{< /callout >}}

## Browser-Specific Issues

### Chrome Issues
- **Cache Problems**: Clear browsing data, reset Chrome settings
- **Extension Conflicts**: Disable extensions, test in incognito mode
- **Memory Issues**: Close unused tabs, restart browser

### Firefox Issues
- **Security Settings**: Adjust security preferences for BigLedger
- **Add-on Conflicts**: Test with add-ons disabled
- **Cookie Settings**: Ensure cookies are enabled for BigLedger

### Safari Issues
- **JavaScript Settings**: Enable JavaScript for BigLedger domain
- **Privacy Settings**: Adjust privacy settings for business applications
- **Cache Issues**: Clear website data for BigLedger

### Mobile Browser Issues
- **Responsive Design**: Use landscape mode for complex screens
- **Touch Interface**: Use appropriate gestures for navigation
- **Data Connection**: Ensure stable internet connection

## Performance Optimization

### System Performance

#### Detailed Performance Optimization

**Identifying Performance Bottlenecks**

1. **System Performance Dashboard**
   - Navigate to **Admin > System Health**
   - Monitor CPU, memory, and database performance
   - Check active user sessions and concurrent processes
   - Review system logs for error patterns

2. **User Experience Monitoring**
   - Track page load times across different modules
   - Monitor report generation speeds
   - Analyze user session durations and timeouts
   - Identify frequently accessed slow-performing features

**Browser-Side Performance Optimization**

```
Recommended Browser Settings:
✓ Enable JavaScript and cookies
✓ Disable unnecessary browser extensions
✓ Clear cache weekly
✓ Update to latest browser version
✓ Allow pop-ups for BigLedger domain
✓ Set sufficient memory allocation
```

**Network Optimization**
- **Bandwidth Requirements**: Minimum 10 Mbps for optimal performance
- **Latency Considerations**: <100ms latency to BigLedger servers
- **Connection Stability**: Wired connections preferred over WiFi
- **VPN Impact**: Test performance with/without VPN
- **Firewall Configuration**: Whitelist BigLedger domains and ports

**Database Performance Tuning**
- **Query Optimization**: Use appropriate filters and date ranges
- **Index Management**: Ensure proper indexing on frequently queried fields
- **Data Archiving**: Archive old data to improve query performance
- **Concurrent Users**: Monitor database connection limits
- **Maintenance Windows**: Schedule regular database maintenance

#### Client-Side Optimization
- **Browser Maintenance**: Regular cache clearing, update browser
- **Network Optimization**: Stable internet connection, avoid peak hours
- **Device Performance**: Sufficient RAM, close unnecessary applications
- **Screen Resolution**: Optimize display settings for BigLedger

#### Server-Side Factors
- **Peak Usage Times**: Understand system load patterns
- **Data Volume**: Large reports and queries impact performance
- **Integration Load**: Multiple simultaneous integrations affect speed
- **Maintenance Windows**: Scheduled maintenance affects availability

### Data Performance
- **Query Optimization**: Use appropriate filters and date ranges
- **Report Efficiency**: Limit data scope for large reports
- **Batch Processing**: Group similar operations together
- **Archive Strategy**: Archive old data to improve performance

## Escalation Procedures

### When to Escalate
- **Security Incidents**: Immediate escalation for security breaches
- **System Outages**: When system is completely unavailable
- **Data Corruption**: Any suspected data integrity issues
- **Critical Business Impact**: Issues affecting core business operations

### How to Escalate
1. **Document the Issue**: Comprehensive problem description
2. **Gather Evidence**: Screenshots, error messages, logs
3. **Assess Impact**: Business impact and urgency level
4. **Contact Appropriate Support**: Use correct support channel
5. **Follow Up**: Monitor resolution and communicate status

## Self-Service Resources

### Knowledge Base
- **FAQ Section** - Answers to frequently asked questions
- **Video Tutorials** - Step-by-step visual guides
- **User Forums** - Community-driven support
- **Documentation** - Comprehensive user guides

### Diagnostic Tools
- **System Health Check** - Built-in system diagnostics
- **Connection Test** - Network and integration testing
- **Permission Checker** - Verify user access rights
- **Performance Monitor** - System performance metrics

{{< callout type="tip" >}}
**Efficiency Tip**: Keep a troubleshooting log to track recurring issues and their solutions. This builds your expertise and helps identify system improvement opportunities.
{{< /callout >}}

## Prevention Strategies

### Proactive Maintenance
- **Regular Updates**: Keep browser and system updated
- **Training Programs**: Ongoing user education and training
- **System Monitoring**: Regular health checks and performance monitoring
- **Data Backup**: Maintain current backups and recovery procedures

### Best Practices
- **Documentation**: Keep procedures documented and current
- **Testing**: Test changes in staging before production
- **Communication**: Inform users of system changes and updates
- **Monitoring**: Set up alerts for critical system metrics

## Getting Help

### Support Channels
- **📧 Email Support**: vincent@bigledger.com for technical issues
- **💬 Quick Chat**: Telegram @leehongfay for immediate questions
- **📞 Phone Support**: Available during business hours
- **🌐 Support Portal**: Online ticket system and knowledge base

### Support Information to Provide
- **Problem Description**: Clear explanation of the issue
- **Steps to Reproduce**: How to recreate the problem
- **Error Messages**: Exact text of any error messages
- **User Information**: Account details and permissions
- **System Details**: Browser, device, and network information
- **Business Impact**: How the issue affects your operations

### Response Time Expectations
- **Critical Issues**: 1-2 hours response time
- **High Priority**: 4-8 hours response time
- **Normal Issues**: 1-2 business days response time
- **Enhancement Requests**: Reviewed in monthly planning cycles

{{< callout type="success" >}}
**Resolution Success**: Most user issues can be resolved quickly with proper problem identification and using the appropriate resources and support channels.
{{< /callout >}}