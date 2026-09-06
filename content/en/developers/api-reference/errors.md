---
description: Comprehensive guide to BigLedger API error codes, troubleshooting steps,
  and best practices for robust error handling in your integrations.
tags:
- user-guide
title: Error Handling
weight: 90
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Comprehensive guide to BigLedger API error codes, troubleshooting steps, and best practices for robust error handling in your integrations.

## Error Response Format

All BigLedger API errors follow a consistent response format:

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "One or more validation errors occurred",
    "details": [
      {
        "field": "email",
        "message": "Email format is invalid",
        "code": "INVALID_EMAIL_FORMAT"
      },
      {
        "field": "phone",
        "message": "Phone number is required",
        "code": "REQUIRED_FIELD"
      }
    ],
    "requestId": "req_123456789",
    "timestamp": "2024-01-15T10:30:00Z",
    "documentation": "https://developers.bigledger.com/errors#validation-error"
  },
  "meta": {
    "requestId": "req_123456789",
    "timestamp": "2024-01-15T10:30:00Z"
  }
}
```

### Error Object Fields

| Field | Type | Description |
|-------|------|-------------|
| `code` | string | Machine-readable error code |
| `message` | string | Human-readable error description |
| `details` | array | Detailed error information (for validation errors) |
| `requestId` | string | Unique request identifier for support |
| `timestamp` | string | ISO 8601 timestamp when error occurred |
| `documentation` | string | Link to relevant documentation |

## HTTP Status Codes

BigLedger APIs use standard HTTP status codes:

### 2xx Success

| Code | Name | Description |
|------|------|-------------|
| 200 | OK | Request successful |
| 201 | Created | Resource created successfully |
| 202 | Accepted | Request accepted for processing |
| 204 | No Content | Request successful, no content returned |

### 4xx Client Errors

| Code | Name | Description | Action Required |
|------|------|-------------|-----------------|
| 400 | Bad Request | Invalid request syntax or data | Fix request format/data |
| 401 | Unauthorized | Authentication required or invalid | Check API key and headers |
| 403 | Forbidden | Access denied | Verify permissions and scopes |
| 404 | Not Found | Resource doesn't exist | Check resource ID and URL |
| 405 | Method Not Allowed | HTTP method not supported | Use correct HTTP method |
| 409 | Conflict | Resource conflict | Resolve conflicting state |
| 422 | Unprocessable Entity | Validation failed | Fix validation errors |
| 429 | Too Many Requests | Rate limit exceeded | Implement retry with backoff |

### 5xx Server Errors

| Code | Name | Description | Action Required |
|------|------|-------------|-----------------|
| 500 | Internal Server Error | Unexpected server error | Retry request |
| 502 | Bad Gateway | Gateway error | Retry request |
| 503 | Service Unavailable | Service temporarily unavailable | Retry with backoff |
| 504 | Gateway Timeout | Request timeout | Retry with longer timeout |

## Common Error Codes

### Authentication Errors

#### UNAUTHORIZED (401)

```json
{
  "success": false,
  "error": {
    "code": "UNAUTHORIZED",
    "message": "Authentication credentials were not provided or are invalid",
    "details": [
      {
        "field": "authorization",
        "message": "API key is missing or invalid",
        "code": "INVALID_API_KEY"
      }
    ]
  }
}
```

**Common Causes:**
- Missing `Authorization` header
- Invalid API key format
- Expired API key
- Revoked API key

**Solutions:**
```javascript
// Ensure proper header format
const headers = {
  'Authorization': 'Bearer blg_live_sk_1234567890abcdef',
  'Content-Type': 'application/json',
  'X-Company-Id': 'company_abc123'
};

// Verify API key is active
const response = await fetch('/api/v1/auth/verify', { headers });
```

#### FORBIDDEN (403)

```json
{
  "success": false,
  "error": {
    "code": "FORBIDDEN",
    "message": "You don't have permission to access this resource",
    "details": [
      {
        "required_scope": "write:invoices",
        "current_scopes": ["read:invoices", "read:customers"]
      }
    ]
  }
}
```

**Common Causes:**
- Insufficient API key permissions
- Missing required OAuth scopes
- Company access restrictions

### Validation Errors

#### VALIDATION_ERROR (422)

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Request validation failed",
    "details": [
      {
        "field": "items[0].quantity",
        "message": "Quantity must be greater than 0",
        "code": "MIN_VALUE",
        "value": -5,
        "constraint": ">= 1"
      },
      {
        "field": "dueDate",
        "message": "Due date must be after invoice date",
        "code": "DATE_CONSTRAINT",
        "value": "2024-01-10",
        "constraint": "> 2024-01-15"
      }
    ]
  }
}
```

**Common Validation Codes:**

| Code | Description | Example |
|------|-------------|---------|
| `REQUIRED_FIELD` | Required field is missing | `name` field not provided |
| `INVALID_FORMAT` | Field format is invalid | Invalid email format |
| `MIN_VALUE` | Value below minimum | Quantity less than 1 |
| `MAX_VALUE` | Value above maximum | Credit limit exceeds maximum |
| `INVALID_CHOICE` | Invalid enum value | Unknown currency code |
| `DUPLICATE_VALUE` | Value must be unique | Duplicate customer email |
| `DATE_CONSTRAINT` | Date constraint violation | Due date before invoice date |

#### BUSINESS_RULE_VIOLATION (422)

```json
{
  "success": false,
  "error": {
    "code": "BUSINESS_RULE_VIOLATION",
    "message": "Invoice cannot be modified after it has been paid",
    "details": [
      {
        "rule": "PAID_INVOICE_IMMUTABLE",
        "invoiceId": "inv_123456789",
        "invoiceStatus": "paid",
        "paidAt": "2024-01-10T14:30:00Z"
      }
    ]
  }
}
```

### Resource Errors

#### NOT_FOUND (404)

```json
{
  "success": false,
  "error": {
    "code": "NOT_FOUND",
    "message": "The requested resource was not found",
    "details": [
      {
        "resource": "customer",
        "id": "cust_invalid123",
        "field": "customerId"
      }
    ]
  }
}
```

#### CONFLICT (409)

```json
{
  "success": false,
  "error": {
    "code": "CONFLICT",
    "message": "Resource already exists with the same identifier",
    "details": [
      {
        "resource": "customer",
        "field": "email",
        "value": "existing@company.com",
        "existingId": "cust_789012345"
      }
    ]
  }
}
```

### Rate Limiting Errors

#### RATE_LIMIT_EXCEEDED (429)

```json
{
  "success": false,
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Rate limit exceeded. Please retry after the specified time",
    "details": [
      {
        "limit": 1000,
        "remaining": 0,
        "resetTime": "2024-01-15T11:00:00Z",
        "retryAfter": 300
      }
    ]
  }
}
```

**Rate Limit Headers:**
```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 0
X-RateLimit-Reset: 1642248000
Retry-After: 300
```

### E-Invoice Errors

#### EINVOICE_VALIDATION_FAILED (422)

```json
{
  "success": false,
  "error": {
    "code": "EINVOICE_VALIDATION_FAILED",
    "message": "E-invoice validation failed against government schema",
    "details": [
      {
        "code": "BR-MY-01",
        "message": "Buyer tax identification number is required for B2B transactions",
        "field": "AccountingCustomerParty.Party.PartyTaxScheme.CompanyID",
        "severity": "error",
        "xpath": "/Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID"
      }
    ],
    "governmentResponse": {
      "portal": "myinvois",
      "validationId": "val_123456",
      "timestamp": "2024-01-15T10:30:00Z"
    }
  }
}
```

### Payment Errors

#### INSUFFICIENT_FUNDS (422)

```json
{
  "success": false,
  "error": {
    "code": "INSUFFICIENT_FUNDS",
    "message": "Payment amount exceeds available credit limit",
    "details": [
      {
        "customerId": "cust_123456789",
        "currentBalance": 15000.00,
        "creditLimit": 20000.00,
        "availableCredit": 5000.00,
        "requestedAmount": 7500.00
      }
    ]
  }
}
```

## Error Handling Best Practices

### 1. Implement Proper Exception Handling

{{< tabs items="JavaScript,Python,PHP,Java" >}}

{{< tab >}}
```javascript
// JavaScript/TypeScript
import { BigLedgerClient, BigLedgerError } from '@bigledger/sdk';

async function createInvoiceWithErrorHandling(invoiceData) {
  const client = new BigLedgerClient({ /* config */ });
  
  try {
    const invoice = await client.invoices.create(invoiceData);
    return { success: true, data: invoice };
    
  } catch (error) {
    if (error instanceof BigLedgerError) {
      switch (error.code) {
        case 'VALIDATION_ERROR':
          return {
            success: false,
            error: 'validation',
            message: 'Please fix the following errors:',
            details: error.validationErrors
          };
          
        case 'NOT_FOUND':
          return {
            success: false,
            error: 'not_found',
            message: 'Customer not found. Please verify the customer ID.'
          };
          
        case 'RATE_LIMIT_EXCEEDED':
          // Implement exponential backoff
          await new Promise(resolve => 
            setTimeout(resolve, error.retryAfter * 1000)
          );
          return createInvoiceWithErrorHandling(invoiceData); // Retry
          
        default:
          console.error('Unexpected API error:', error);
          return {
            success: false,
            error: 'api_error',
            message: 'An unexpected error occurred. Please try again.'
          };
      }
    } else {
      // Network or other errors
      console.error('Network error:', error);
      return {
        success: false,
        error: 'network',
        message: 'Unable to connect to BigLedger. Please check your internet connection.'
      };
    }
  }
}
```
{{< /tab >}}

{{< tab >}}
```python
# Python
from bigledger import BigLedgerClient
from bigledger.exceptions import (
    BigLedgerError, ValidationError, NotFoundError, 
    RateLimitError, AuthenticationError
)
import time
import logging

async def create_invoice_with_error_handling(invoice_data):
    client = BigLedgerClient(api_key="...", company_id="...")
    
    try:
        invoice = await client.invoices.create(invoice_data)
        return {'success': True, 'data': invoice}
        
    except ValidationError as e:
        logging.warning(f"Validation error: {e.validation_errors}")
        return {
            'success': False,
            'error': 'validation',
            'message': 'Please fix the following errors:',
            'details': e.validation_errors
        }
        
    except NotFoundError as e:
        logging.error(f"Resource not found: {e.message}")
        return {
            'success': False,
            'error': 'not_found', 
            'message': str(e)
        }
        
    except RateLimitError as e:
        logging.info(f"Rate limited, retrying after {e.retry_after} seconds")
        time.sleep(e.retry_after)
        return await create_invoice_with_error_handling(invoice_data)
        
    except AuthenticationError as e:
        logging.error(f"Authentication failed: {e.message}")
        return {
            'success': False,
            'error': 'authentication',
            'message': 'API authentication failed. Please check your credentials.'
        }
        
    except BigLedgerError as e:
        logging.error(f"BigLedger API error: {e.code} - {e.message}")
        return {
            'success': False,
            'error': 'api_error',
            'message': f"API error: {e.message}"
        }
        
    except Exception as e:
        logging.exception("Unexpected error occurred")
        return {
            'success': False,
            'error': 'unexpected',
            'message': 'An unexpected error occurred. Please try again.'
        }
```
{{< /tab >}}

{{< tab >}}
```php
<?php
// PHP
use BigLedger\BigLedgerClient;
use BigLedger\Exceptions\ValidationException;
use BigLedger\Exceptions\NotFoundException;
use BigLedger\Exceptions\RateLimitException;
use BigLedger\Exceptions\BigLedgerException;

function createInvoiceWithErrorHandling($invoiceData) {
    $client = new BigLedgerClient([
        'api_key' => 'your-api-key',
        'company_id' => 'your-company-id'
    ]);
    
    try {
        $invoice = $client->invoices->create($invoiceData);
        return ['success' => true, 'data' => $invoice];
        
    } catch (ValidationException $e) {
        error_log('Validation error: ' . json_encode($e->getValidationErrors()));
        return [
            'success' => false,
            'error' => 'validation',
            'message' => 'Please fix the following errors:',
            'details' => $e->getValidationErrors()
        ];
        
    } catch (NotFoundException $e) {
        error_log('Resource not found: ' . $e->getMessage());
        return [
            'success' => false,
            'error' => 'not_found',
            'message' => $e->getMessage()
        ];
        
    } catch (RateLimitException $e) {
        error_log("Rate limited, retrying after {$e->getRetryAfter()} seconds");
        sleep($e->getRetryAfter());
        return createInvoiceWithErrorHandling($invoiceData);
        
    } catch (BigLedgerException $e) {
        error_log("BigLedger API error: {$e->getCode()} - {$e->getMessage()}");
        return [
            'success' => false,
            'error' => 'api_error',
            'message' => $e->getMessage()
        ];
        
    } catch (Exception $e) {
        error_log('Unexpected error: ' . $e->getMessage());
        return [
            'success' => false,
            'error' => 'unexpected',
            'message' => 'An unexpected error occurred. Please try again.'
        ];
    }
}
?>
```
{{< /tab >}}

{{< tab >}}
```java
// Java
import com.bigledger.BigLedgerClient;
import com.bigledger.exceptions.*;
import com.bigledger.models.Invoice;

public class ErrorHandlingExample {
    
    public Result<Invoice> createInvoiceWithErrorHandling(Invoice invoiceData) {
        BigLedgerClient client = new BigLedgerClient(config);
        
        try {
            Invoice invoice = client.invoices().create(invoiceData);
            return Result.success(invoice);
            
        } catch (ValidationException e) {
            logger.warn("Validation error: {}", e.getValidationErrors());
            return Result.failure("validation", "Please fix validation errors", e.getValidationErrors());
            
        } catch (NotFoundException e) {
            logger.error("Resource not found: {}", e.getMessage());
            return Result.failure("not_found", e.getMessage());
            
        } catch (RateLimitException e) {
            logger.info("Rate limited, retrying after {} seconds", e.getRetryAfter());
            try {
                Thread.sleep(e.getRetryAfter() * 1000);
                return createInvoiceWithErrorHandling(invoiceData);
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                return Result.failure("interrupted", "Request was interrupted");
            }
            
        } catch (BigLedgerException e) {
            logger.error("BigLedger API error: {} - {}", e.getCode(), e.getMessage());
            return Result.failure("api_error", e.getMessage());
            
        } catch (Exception e) {
            logger.error("Unexpected error occurred", e);
            return Result.failure("unexpected", "An unexpected error occurred");
        }
    }
}
```
{{< /tab >}}

{{< /tabs >}}

### 2. Implement Retry Logic with Exponential Backoff

```javascript
class RetryHandler {
  constructor(maxRetries = 3, baseDelay = 1000) {
    this.maxRetries = maxRetries;
    this.baseDelay = baseDelay;
  }
  
  async executeWithRetry(operation, retryableErrors = ['RATE_LIMIT_EXCEEDED', 'SERVICE_UNAVAILABLE']) {
    let lastError;
    
    for (let attempt = 0; attempt <= this.maxRetries; attempt++) {
      try {
        return await operation();
      } catch (error) {
        lastError = error;
        
        // Don't retry client errors (except rate limiting)
        if (error.status < 500 && !retryableErrors.includes(error.code)) {
          throw error;
        }
        
        if (attempt === this.maxRetries) {
          throw error;
        }
        
        // Calculate delay with exponential backoff
        const delay = error.retryAfter 
          ? error.retryAfter * 1000 
          : this.baseDelay * Math.pow(2, attempt);
        
        console.log(`Attempt ${attempt + 1} failed, retrying in ${delay}ms`);
        await new Promise(resolve => setTimeout(resolve, delay));
      }
    }
    
    throw lastError;
  }
}

// Usage
const retryHandler = new RetryHandler();
const invoice = await retryHandler.executeWithRetry(
  () => client.invoices.create(invoiceData)
);
```

### 3. Validate Data Before API Calls

```javascript
// Client-side validation to reduce API errors
function validateInvoiceData(invoiceData) {
  const errors = [];
  
  // Required fields
  if (!invoiceData.customerId) {
    errors.push({ field: 'customerId', message: 'Customer ID is required' });
  }
  
  if (!invoiceData.items || invoiceData.items.length === 0) {
    errors.push({ field: 'items', message: 'At least one item is required' });
  }
  
  // Date validation
  if (invoiceData.dueDate && invoiceData.invoiceDate) {
    const invoiceDate = new Date(invoiceData.invoiceDate);
    const dueDate = new Date(invoiceData.dueDate);
    
    if (dueDate <= invoiceDate) {
      errors.push({ 
        field: 'dueDate', 
        message: 'Due date must be after invoice date' 
      });
    }
  }
  
  // Item validation
  invoiceData.items?.forEach((item, index) => {
    if (!item.description) {
      errors.push({ 
        field: `items[${index}].description`, 
        message: 'Item description is required' 
      });
    }
    
    if (!item.quantity || item.quantity <= 0) {
      errors.push({ 
        field: `items[${index}].quantity`, 
        message: 'Item quantity must be greater than 0' 
      });
    }
    
    if (!item.unitPrice || item.unitPrice < 0) {
      errors.push({ 
        field: `items[${index}].unitPrice`, 
        message: 'Item unit price must be greater than or equal to 0' 
      });
    }
  });
  
  return errors;
}

// Use validation before API call
async function createInvoice(invoiceData) {
  const validationErrors = validateInvoiceData(invoiceData);
  if (validationErrors.length > 0) {
    return {
      success: false,
      error: 'validation',
      details: validationErrors
    };
  }
  
  // Proceed with API call
  return await createInvoiceWithErrorHandling(invoiceData);
}
```

### 4. Monitor and Log Errors

```javascript
class APIErrorLogger {
  constructor(client) {
    this.client = client;
    this.errorCounts = new Map();
    this.lastErrors = [];
  }
  
  logError(error, context = {}) {
    const errorData = {
      timestamp: new Date().toISOString(),
      code: error.code,
      message: error.message,
      requestId: error.requestId,
      context: context,
      stackTrace: error.stack
    };
    
    // Store for analysis
    this.lastErrors.push(errorData);
    if (this.lastErrors.length > 100) {
      this.lastErrors.shift(); // Keep only last 100 errors
    }
    
    // Count error types
    const count = this.errorCounts.get(error.code) || 0;
    this.errorCounts.set(error.code, count + 1);
    
    // Log to external service (e.g., Sentry, LogRocket)
    this.sendToLoggingService(errorData);
    
    // Alert on critical errors
    if (this.isCriticalError(error)) {
      this.sendAlert(errorData);
    }
  }
  
  isCriticalError(error) {
    const criticalErrors = [
      'AUTHENTICATION_FAILED',
      'SERVICE_UNAVAILABLE',
      'INTERNAL_SERVER_ERROR'
    ];
    return criticalErrors.includes(error.code);
  }
  
  getErrorStats() {
    return {
      totalErrors: this.lastErrors.length,
      errorsByType: Object.fromEntries(this.errorCounts),
      recentErrors: this.lastErrors.slice(-10)
    };
  }
}
```

## Troubleshooting Common Issues

### Authentication Issues

**Problem**: 401 Unauthorized errors

**Solutions**:
1. Verify API key format: `blg_live_sk_` or `blg_test_sk_`
2. Check `X-Company-Id` header is included
3. Ensure API key has required permissions
4. Verify API key hasn't expired or been revoked

```bash
# Test authentication
curl -X GET "https://api.bigledger.com/v1/auth/verify" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

### Rate Limiting Issues

**Problem**: 429 Too Many Requests

**Solutions**:
1. Implement exponential backoff retry logic
2. Respect the `Retry-After` header
3. Use bulk operations where available
4. Consider upgrading to higher rate limits

```javascript
// Rate limiting handler
class RateLimitHandler {
  constructor() {
    this.queue = [];
    this.processing = false;
    this.requestsPerSecond = 10; // Adjust based on your limit
  }
  
  async makeRequest(requestFn) {
    return new Promise((resolve, reject) => {
      this.queue.push({ requestFn, resolve, reject });
      this.processQueue();
    });
  }
  
  async processQueue() {
    if (this.processing || this.queue.length === 0) return;
    
    this.processing = true;
    
    while (this.queue.length > 0) {
      const { requestFn, resolve, reject } = this.queue.shift();
      
      try {
        const result = await requestFn();
        resolve(result);
      } catch (error) {
        if (error.code === 'RATE_LIMIT_EXCEEDED') {
          // Re-queue the request
          this.queue.unshift({ requestFn, resolve, reject });
          await new Promise(r => setTimeout(r, error.retryAfter * 1000));
          continue;
        }
        reject(error);
      }
      
      // Delay between requests
      await new Promise(r => setTimeout(r, 1000 / this.requestsPerSecond));
    }
    
    this.processing = false;
  }
}
```

### Data Integrity Issues

**Problem**: Validation errors and business rule violations

**Solutions**:
1. Implement client-side validation
2. Use proper data types and formats
3. Check business rules before API calls
4. Handle validation errors gracefully

### Network and Connectivity Issues

**Problem**: Connection timeouts and network errors

**Solutions**:
1. Implement retry logic with exponential backoff
2. Use appropriate timeout values
3. Handle network failures gracefully
4. Monitor API status page

```javascript
// Network error handler
async function makeRequestWithNetworkRetry(requestFn, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      return await requestFn();
    } catch (error) {
      if (error.code === 'NETWORK_ERROR' && i < maxRetries - 1) {
        const delay = Math.pow(2, i) * 1000; // Exponential backoff
        await new Promise(resolve => setTimeout(resolve, delay));
        continue;
      }
      throw error;
    }
  }
}
```

## Getting Help

When you encounter an error that you can't resolve:

### 1. Check the Documentation
- Review the API reference for the specific endpoint
- Check the error code in this troubleshooting guide
- Look for similar issues in the FAQ

### 2. Contact Support
Include the following information:

- **Request ID**: Found in error response or `X-Request-ID` header
- **Timestamp**: When the error occurred
- **Endpoint**: Which API endpoint was called
- **Request Data**: Sanitized request payload (remove sensitive data)
- **Error Response**: Complete error response
- **SDK Version**: If using an official SDK

**Support Channels**:
- Email: [developers@bigledger.com](mailto:developers@bigledger.com)

### 3. Report Bugs
For potential bugs in the API:

1. Check if the issue is already reported
2. Provide minimal reproduction steps
3. Include environment details (SDK version, language, etc.)
4. Submit via GitHub issues or support email

## Error Prevention Best Practices

1. **Validate Early**: Validate data client-side before API calls
2. **Handle Gracefully**: Always implement proper error handling
3. **Retry Intelligently**: Use exponential backoff for retryable errors
4. **Monitor Actively**: Track error rates and patterns
5. **Log Comprehensively**: Log errors with context for debugging
6. **Test Thoroughly**: Test error scenarios in your integration
7. **Stay Updated**: Monitor API changelog for breaking changes

By following these error handling best practices, you'll build robust integrations that gracefully handle various error conditions and provide excellent user experiences.