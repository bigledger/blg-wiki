---
description: BigLedger APIs use API key authentication with OAuth 2.
tags:
- user-guide
title: Authentication & Authorization
weight: 10
draft: true  # unpublished 2026-09-06: mechanism is real, every documented detail is wrong; rewrite from source (F-0285/F-0286)
---

BigLedger APIs use API key authentication with OAuth 2.0 support for secure access to your business data.

## API Key Authentication

The simplest way to authenticate with BigLedger APIs is using API keys.

### Getting Your API Key

1. Log in to your BigLedger account
2. Navigate to **Settings** > **API Keys**
3. Click **Generate New API Key**
4. Copy and securely store your API key

{{< callout type="warning" >}}
**Keep Your API Key Secure**
- Never expose API keys in client-side code
- Store keys in environment variables
- Rotate keys regularly for security
- Use different keys for development and production
{{< /callout >}}

### Using API Keys

Include your API key in the `Authorization` header:

```http
GET /api/v1/accounts
Host: api.bigledger.com
Authorization: Bearer blg_live_sk_1234567890abcdef
Content-Type: application/json
X-Company-Id: company_abc123
```

### Code Examples

{{< tabs items="JavaScript,Python,PHP,cURL" >}}

{{< tab >}}
```javascript
// JavaScript/Node.js
const axios = require('axios');

const client = axios.create({
  baseURL: 'https://api.bigledger.com/v1',
  headers: {
    'Authorization': 'Bearer blg_live_sk_1234567890abcdef',
    'Content-Type': 'application/json',
    'X-Company-Id': 'company_abc123'
  }
});

// Make API calls
const accounts = await client.get('/accounts');
```
{{< /tab >}}

{{< tab >}}
```python
# Python
import requests

headers = {
    'Authorization': 'Bearer blg_live_sk_1234567890abcdef',
    'Content-Type': 'application/json',
    'X-Company-Id': 'company_abc123'
}

response = requests.get(
    'https://api.bigledger.com/v1/accounts',
    headers=headers
)

accounts = response.json()
```
{{< /tab >}}

{{< tab >}}
```php
<?php
// PHP
$ch = curl_init();

curl_setopt_array($ch, [
    CURLOPT_URL => 'https://api.bigledger.com/v1/accounts',
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTPHEADER => [
        'Authorization: Bearer blg_live_sk_1234567890abcdef',
        'Content-Type: application/json',
        'X-Company-Id: company_abc123'
    ],
]);

$response = curl_exec($ch);
$accounts = json_decode($response, true);
curl_close($ch);
?>
```
{{< /tab >}}

{{< tab >}}
```bash
# cURL
curl -X GET "https://api.bigledger.com/v1/accounts" \
  -H "Authorization: Bearer blg_live_sk_1234567890abcdef" \
  -H "Content-Type: application/json" \
  -H "X-Company-Id: company_abc123"
```
{{< /tab >}}

{{< /tabs >}}

## OAuth 2.0 Authentication

For applications that need to access multiple companies or require user consent, use OAuth 2.0.

### OAuth 2.0 Flow

BigLedger supports the Authorization Code flow with PKCE for security.

#### Step 1: Authorization Request

Redirect users to the BigLedger authorization server:

```http
GET https://auth.bigledger.com/oauth/authorize?
  response_type=code&
  client_id=YOUR_CLIENT_ID&
  redirect_uri=https://yourapp.com/callback&
  scope=read:accounts write:invoices&
  state=random_state_string&
  code_challenge=PKCE_CODE_CHALLENGE&
  code_challenge_method=S256
```

#### Step 2: Authorization Response

Users are redirected back to your app with an authorization code:

```http
GET https://yourapp.com/callback?
  code=AUTHORIZATION_CODE&
  state=random_state_string
```

#### Step 3: Token Exchange

Exchange the authorization code for an access token:

```http
POST https://auth.bigledger.com/oauth/token
Content-Type: application/json

{
  "grant_type": "authorization_code",
  "client_id": "YOUR_CLIENT_ID",
  "client_secret": "YOUR_CLIENT_SECRET",
  "code": "AUTHORIZATION_CODE",
  "redirect_uri": "https://yourapp.com/callback",
  "code_verifier": "PKCE_CODE_VERIFIER"
}
```

Response:

```json
{
  "access_token": "blg_oauth_at_1234567890abcdef",
  "refresh_token": "blg_oauth_rt_abcdef1234567890",
  "token_type": "Bearer",
  "expires_in": 3600,
  "scope": "read:accounts write:invoices"
}
```

#### Step 4: Use Access Token

Use the access token in API requests:

```http
GET /api/v1/accounts
Authorization: Bearer blg_oauth_at_1234567890abcdef
```

### Refreshing Tokens

Access tokens expire after 1 hour. Use the refresh token to get a new access token:

```http
POST https://auth.bigledger.com/oauth/token
Content-Type: application/json

{
  "grant_type": "refresh_token",
  "client_id": "YOUR_CLIENT_ID",
  "client_secret": "YOUR_CLIENT_SECRET",
  "refresh_token": "blg_oauth_rt_abcdef1234567890"
}
```

### OAuth Scopes

Control access with specific scopes:

| Scope | Description |
|-------|-------------|
| `read:accounts` | Read chart of accounts |
| `write:accounts` | Create/update accounts |
| `read:invoices` | Read invoices |
| `write:invoices` | Create/update invoices |
| `read:customers` | Read customer data |
| `write:customers` | Create/update customers |
| `read:inventory` | Read inventory data |
| `write:inventory` | Update inventory |
| `read:reports` | Access financial reports |
| `admin` | Full administrative access |

## Required Headers

### X-Company-Id

For API key authentication, include the company ID header:

```http
X-Company-Id: company_abc123
```

You can find your company ID in the BigLedger dashboard under **Settings** > **Company Profile**.

### Content-Type

Always include the content type for JSON requests:

```http
Content-Type: application/json
```

### User-Agent

Include a descriptive User-Agent header:

```http
User-Agent: MyApp/1.0.0 (https://myapp.com)
```

## Security Best Practices

### API Key Security

{{< callout type="warning" >}}
**Never expose API keys in:**
- Client-side JavaScript
- Mobile app code
- Version control systems
- Log files
- URL parameters
{{< /callout >}}

### Environment Variables

Store credentials in environment variables:

```bash
# .env file
BIGLEDGER_API_KEY=blg_live_sk_1234567890abcdef
BIGLEDGER_COMPANY_ID=company_abc123
```

```javascript
// Use in your application
const apiKey = process.env.BIGLEDGER_API_KEY;
const companyId = process.env.BIGLEDGER_COMPANY_ID;
```

### HTTPS Only

Always use HTTPS for API requests. HTTP requests will be rejected:

```
✅ https://api.bigledger.com/v1/accounts
❌ http://api.bigledger.com/v1/accounts
```

### IP Whitelisting

For enhanced security, whitelist your server IPs in the BigLedger dashboard:

1. Go to **Settings** > **API Keys**
2. Click on your API key
3. Add your server IP addresses to the whitelist

## Authentication Errors

Common authentication errors and solutions:

### 401 Unauthorized

```json
{
  "success": false,
  "error": {
    "code": "UNAUTHORIZED",
    "message": "Invalid or missing API key"
  }
}
```

**Solutions:**
- Check your API key is correct
- Ensure the `Authorization` header is included
- Verify the API key hasn't expired

### 403 Forbidden

```json
{
  "success": false,
  "error": {
    "code": "FORBIDDEN",
    "message": "Insufficient permissions for this resource"
  }
}
```

**Solutions:**
- Check the required scopes for OAuth tokens
- Verify your API key has the necessary permissions
- Ensure you're accessing the correct company

### 422 Invalid Company

```json
{
  "success": false,
  "error": {
    "code": "INVALID_COMPANY",
    "message": "Company ID is required or invalid"
  }
}
```

**Solutions:**
- Include the `X-Company-Id` header
- Verify the company ID is correct
- Ensure you have access to the specified company

## Testing Authentication

### Verify API Key

Test your API key with this simple request:

```bash
curl -X GET "https://api.bigledger.com/v1/auth/verify" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

Successful response:

```json
{
  "success": true,
  "data": {
    "authenticated": true,
    "company": {
      "id": "company_abc123",
      "name": "Acme Corporation",
      "plan": "professional"
    },
    "permissions": [
      "read:accounts",
      "write:invoices",
      "read:customers"
    ]
  }
}
```

### Sandbox Environment

Test authentication in the sandbox environment:

```
https://api-sandbox.bigledger.com/v1
```

Sandbox API keys start with `blg_test_sk_` instead of `blg_live_sk_`.

## SDK Authentication

Our official SDKs handle authentication automatically:

{{< tabs items="JavaScript,Python,PHP" >}}

{{< tab >}}
```javascript
// JavaScript SDK
import { BigLedgerClient } from '@bigledger/sdk';

const client = new BigLedgerClient({
  apiKey: process.env.BIGLEDGER_API_KEY,
  companyId: process.env.BIGLEDGER_COMPANY_ID,
  environment: 'production' // or 'sandbox'
});

// SDK handles authentication headers automatically
const accounts = await client.accounts.list();
```
{{< /tab >}}

{{< tab >}}
```python
# Python SDK
from bigledger import BigLedgerClient

client = BigLedgerClient(
    api_key=os.environ['BIGLEDGER_API_KEY'],
    company_id=os.environ['BIGLEDGER_COMPANY_ID'],
    environment='production'  # or 'sandbox'
)

# SDK handles authentication automatically
accounts = client.accounts.list()
```
{{< /tab >}}

{{< tab >}}
```php
// PHP SDK
use BigLedger\BigLedgerClient;

$client = new BigLedgerClient([
    'api_key' => $_ENV['BIGLEDGER_API_KEY'],
    'company_id' => $_ENV['BIGLEDGER_COMPANY_ID'],
    'environment' => 'production' // or 'sandbox'
]);

// SDK handles authentication automatically
$accounts = $client->accounts->list();
```
{{< /tab >}}

{{< /tabs >}}

## Next Steps

Once authenticated, explore our API endpoints:

- [Getting Started Guide](/developers/getting-started/) - Make your first API call
- [API Reference](/developers/api-reference/) - Complete endpoint documentation
- [SDKs](/developers/sdks/) - Official libraries for popular languages