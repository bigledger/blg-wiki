---
title: "Authentication"
description: "API authentication methods, token management, and security best practices"
weight: 2
---

The Data Hub Membership API implements robust authentication mechanisms to ensure secure access to membership data and operations. All API requests must include valid credentials, and the system enforces strict authorization policies based on roles and permissions.

## Authentication Methods

The API supports two primary authentication methods designed for different integration scenarios:

### OAuth 2.0 Authentication

OAuth 2.0 provides delegated authorization, allowing applications to access API resources on behalf of authenticated users without exposing user credentials. This method is ideal for applications with interactive user interfaces where members or administrators log in and grant access permissions.

**Authorization Flow**

The API implements the OAuth 2.0 Authorization Code flow with PKCE (Proof Key for Code Exchange) for enhanced security:

1. **Authorization Request**: The application redirects the user to the BigLedger authorization endpoint with client ID, redirect URI, and PKCE challenge:

```
https://auth.bigledger.com/oauth/authorize?
  response_type=code&
  client_id=YOUR_CLIENT_ID&
  redirect_uri=https://yourapp.com/callback&
  scope=membership:read membership:write&
  state=random_state_string&
  code_challenge=BASE64URL(SHA256(code_verifier))&
  code_challenge_method=S256
```

2. **User Authentication**: The user authenticates with BigLedger credentials and grants requested permissions.

3. **Authorization Code**: Upon successful authentication, BigLedger redirects to the specified redirect URI with an authorization code:

```
https://yourapp.com/callback?code=AUTHORIZATION_CODE&state=random_state_string
```

4. **Token Exchange**: The application exchanges the authorization code for access and refresh tokens:

```http
POST https://auth.bigledger.com/oauth/token
Content-Type: application/x-www-form-urlencoded

grant_type=authorization_code&
code=AUTHORIZATION_CODE&
redirect_uri=https://yourapp.com/callback&
client_id=YOUR_CLIENT_ID&
client_secret=YOUR_CLIENT_SECRET&
code_verifier=ORIGINAL_CODE_VERIFIER
```

5. **Token Response**: The server returns access token, refresh token, and expiration information:

```json
{
  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refresh_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600,
  "scope": "membership:read membership:write"
}
```

**Using Access Tokens**

Include the access token in the Authorization header for all API requests:

```http
GET /api/v1/membership/members/MEM-789012
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
```

Access tokens are JWT (JSON Web Tokens) containing encoded claims about the authenticated user and granted permissions. Tokens are cryptographically signed, allowing the API to verify authenticity without database lookups.

**Token Expiration**

Access tokens expire after 1 hour to limit exposure if tokens are compromised. Applications should implement token refresh logic to obtain new access tokens without requiring user re-authentication.

### API Key Authentication

API keys provide straightforward authentication for server-to-server integrations where applications access resources using their own identity rather than acting on behalf of specific users.

**Generating API Keys**

API keys are generated through the BigLedger administrative console:

1. Navigate to Settings > API Access
2. Click "Generate New API Key"
3. Specify key name, permissions, and optional IP restrictions
4. Save the generated key securely (keys are shown only once)

**Using API Keys**

Include the API key in the `X-API-Key` header:

```http
GET /api/v1/membership/members/MEM-789012
X-API-Key: blg_live_abc123xyz789def456ghi012jkl345mno
```

API keys follow the format `blg_{environment}_{random_string}` where environment is either `live` for production or `test` for sandbox.

**API Key Security**

API keys grant full access to permitted operations and should be protected like passwords:

- Never commit API keys to version control systems
- Store keys securely using environment variables or secrets management systems
- Rotate keys periodically (recommended every 90 days)
- Use different keys for different applications or environments
- Immediately revoke keys if compromise is suspected

## Token Refresh

OAuth access tokens expire after a limited duration, requiring refresh to maintain continuous access without user intervention.

### Refresh Token Flow

When an access token expires, use the refresh token to obtain a new access token:

```http
POST https://auth.bigledger.com/oauth/token
Content-Type: application/x-www-form-urlencoded

grant_type=refresh_token&
refresh_token=REFRESH_TOKEN&
client_id=YOUR_CLIENT_ID&
client_secret=YOUR_CLIENT_SECRET
```

Response includes a new access token and potentially a new refresh token:

```json
{
  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refresh_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

### Proactive Token Refresh

Rather than waiting for token expiration, implement proactive refresh that obtains new tokens before expiration. This approach prevents request failures due to expired tokens.

Example implementation strategy:

```javascript
class TokenManager {
  constructor(clientId, clientSecret, refreshToken) {
    this.clientId = clientId;
    this.clientSecret = clientSecret;
    this.refreshToken = refreshToken;
    this.accessToken = null;
    this.expiresAt = null;
  }

  async getAccessToken() {
    // Refresh if token expires within 5 minutes
    const bufferTime = 5 * 60 * 1000;
    if (!this.accessToken || Date.now() + bufferTime >= this.expiresAt) {
      await this.refreshAccessToken();
    }
    return this.accessToken;
  }

  async refreshAccessToken() {
    const response = await fetch('https://auth.bigledger.com/oauth/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({
        grant_type: 'refresh_token',
        refresh_token: this.refreshToken,
        client_id: this.clientId,
        client_secret: this.clientSecret
      })
    });

    const data = await response.json();
    this.accessToken = data.access_token;
    this.expiresAt = Date.now() + (data.expires_in * 1000);

    if (data.refresh_token) {
      this.refreshToken = data.refresh_token;
    }
  }
}
```

## Permission Scopes

OAuth authentication uses scopes to define the specific permissions granted to applications. Scopes follow hierarchical naming with resource and access level:

**membership:read** - Read access to member profiles, points balances, and transaction history

**membership:write** - Create and update member profiles, award points, process redemptions

**membership:admin** - Full administrative access including tier configuration and system settings

**tier:read** - Read access to tier definitions and member tier assignments

**tier:write** - Create and modify tier configurations

**points:read** - Query points balances and transaction history

**points:write** - Award points, process redemptions, and make adjustments

**rewards:read** - View reward catalog and redemption history

**rewards:write** - Manage reward catalog and process redemptions

**transactions:read** - Access transaction records for reporting and auditing

Applications should request only the minimum scopes necessary for their functionality. Users review and approve requested scopes during the authorization flow, promoting transparency and trust.

## Authorization and Permissions

Beyond authentication which verifies identity, authorization determines what actions authenticated identities can perform.

### Role-Based Access Control

The API implements role-based access control (RBAC) where permissions are assigned to roles, and roles are assigned to users or API keys:

**Member Role** - Limited access to personal membership data including profile, points balance, and transaction history. Members cannot access other member data or administrative functions.

**Store Manager Role** - Access to member lookup, points transactions, and redemptions for members visiting specific stores. Store managers can process in-store membership activities but cannot modify tier configurations or access financial reports.

**Marketing Manager Role** - Read access to aggregated member data, segment definitions, and campaign results. Marketing managers can view member analytics but cannot process transactions or modify member data.

**System Administrator Role** - Full access to all API operations including tier configuration, system settings, bulk operations, and administrative reports.

**Integration Service Role** - Programmatic access for automated systems with permissions configured based on integration requirements.

### Resource-Level Permissions

In addition to role-based permissions, resource-level authorization restricts access to specific data:

**Member Isolation** - Users with Member role can only access their own data, prevented from viewing other member information.

**Location-Based Access** - Store managers can only access transactions and operations for their assigned store locations.

**Data Segregation** - Multi-tenant environments maintain strict data isolation preventing cross-tenant access regardless of authentication.

## Security Best Practices

### Credential Storage

Never hard-code credentials in application source code. Use environment variables, configuration files excluded from version control, or dedicated secrets management services:

```javascript
// Good - credentials from environment
const apiKey = process.env.BIGLEDGER_API_KEY;

// Bad - hard-coded credentials
const apiKey = 'blg_live_abc123xyz789';
```

### Secure Communication

Always use HTTPS for API communication. The API rejects requests over unencrypted HTTP connections. Ensure TLS certificate validation is enabled to prevent man-in-the-middle attacks.

### Token Handling

Store tokens securely in memory or encrypted storage. Avoid persisting tokens to disk or logging them in plain text. When tokens are no longer needed, explicitly revoke them rather than relying solely on expiration.

### API Key Rotation

Implement periodic API key rotation to limit exposure from potential compromises. The rotation process should:

1. Generate a new API key
2. Update application configuration with new key
3. Verify new key works correctly
4. Revoke old key
5. Monitor for errors indicating incomplete migration

### Rate Limit Management

Respect rate limits to avoid service disruption. Implement exponential backoff when rate limits are encountered:

```javascript
async function apiRequestWithRetry(url, options, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    const response = await fetch(url, options);

    if (response.status === 429) {
      const retryAfter = response.headers.get('Retry-After') || (2 ** i);
      await new Promise(resolve => setTimeout(resolve, retryAfter * 1000));
      continue;
    }

    return response;
  }

  throw new Error('Max retries exceeded');
}
```

### IP Whitelisting

For sensitive integrations, configure IP whitelisting to restrict API access to requests from known addresses. This adds an additional security layer beyond credential-based authentication.

### Audit Logging

Maintain audit logs of authentication attempts, token generation, and API key usage. Regular review of audit logs helps detect unauthorized access attempts and unusual usage patterns.

## Troubleshooting Authentication Issues

### Invalid Credentials

HTTP 401 responses indicate authentication failure. Verify:

- API key or access token is correctly copied without truncation
- Credentials are for the correct environment (production vs sandbox)
- API key has not been revoked
- Access token has not expired

### Insufficient Permissions

HTTP 403 responses indicate valid authentication but insufficient permissions. Check:

- OAuth scope includes required permissions for the operation
- API key role includes necessary permissions
- User or service account has appropriate role assignments
- Resource-level permissions allow access to specific data

### Token Expiration

HTTP 401 responses with error code `TOKEN_EXPIRED` indicate access token expiration. Implement token refresh logic to obtain new tokens before making additional requests.

### Rate Limiting

HTTP 429 responses indicate rate limit exceeded. Implement retry logic with exponential backoff and respect `Retry-After` headers. Consider requesting higher rate limits if legitimate usage consistently exceeds current limits.

## Testing Authentication

The sandbox environment allows thorough authentication testing without affecting production systems. Test credentials are available through the developer portal and provide full API access within the sandbox environment.

When testing OAuth flows, use the sandbox authorization endpoint:

```
https://sandbox-auth.bigledger.com/oauth/authorize
```

Sandbox tokens are clearly marked and automatically rejected if used against production endpoints, preventing accidental data access across environments.
