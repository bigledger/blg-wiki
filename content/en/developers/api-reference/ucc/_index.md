---
description: Unified Contact Center (UCC) APIs for omnichannel messaging, session management, and integrated customer communication.
tags:
- user-guide
title: UCC API Reference
weight: 30
---

Unified Contact Center (UCC) APIs allow seamless integration of omnichannel messaging experiences. Automate messaging workflows, interact with user sessions, and manage customer communications through a unified interface.

## Base URL

```
https://api.bigledger.com/v1
```

## Authentication

All requests require authentication:

```http
Authorization: Bearer YOUR_API_KEY
X-Company-Id: YOUR_COMPANY_ID
```

## UCC Overview

BigLedger's UCC APIs handle:

- **Omnichannel Support** across WhatsApp, Email, WeChat, and internal chats
- **Session Management** for managing customer interaction states
- **Real-time Webhooks** for receiving incoming messages
- **Agent Allocation** and assignment routing
- **Media and Attachments** handling

## UCC Session Object

```json
{
  "id": "ucc_sess_123456789",
  "channel": "whatsapp",
  "status": "active",
  "customerId": "cust_888999000",
  "agentId": "usr_777666555",
  "topic": "Support Inquiry",
  "unreadCount": 0,
  "metrics": {
    "firstResponseTimeSec": 120,
    "resolutionTimeSec": null
  },
  "participant": {
    "name": "John Doe",
    "phoneNumber": "+60123456789",
    "email": "john.doe@example.com"
  },
  "timeline": [
    {
      "event": "session_created",
      "timestamp": "2024-01-15T10:30:00Z"
    },
    {
      "event": "agent_assigned",
      "timestamp": "2024-01-15T10:31:00Z",
      "agentId": "usr_777666555"
    }
  ],
  "createdAt": "2024-01-15T10:30:00Z",
  "updatedAt": "2024-01-15T10:35:00Z"
}
```

## Send a Message

Send a unified message to a customer across any supported channel.

```http
POST /api/v1/ucc/messages/send
```

**Request Body:**

```json
{
  "sessionId": "ucc_sess_123456789",
  "channel": "whatsapp",
  "messageType": "text",
  "content": {
    "text": "Hello John, how can I help you today?"
  },
  "attachments": []
}
```

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/ucc/messages/send" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "sessionId": "ucc_sess_123456789",
    "messageType": "text",
    "content": {
      "text": "Hello John, how can I help you today?"
    }
  }'
```

**Response:**

```json
{
  "success": true,
  "data": {
    "messageId": "msg_987654321",
    "status": "sent",
    "timestamp": "2024-01-15T10:36:00Z"
  }
}
```

## Retrieve Session Details

Fetch details and metrics of a specific UCC Session.

```http
GET /api/v1/ucc/sessions/{sessionId}
```

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/ucc/sessions/ucc_sess_123456789" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

**Response:**

```json
{
  "success": true,
  "data": {
    "id": "ucc_sess_123456789",
    "channel": "whatsapp",
    "status": "active",
    "customerId": "cust_888999000",
    "agentId": "usr_777666555",
    "createdAt": "2024-01-15T10:30:00Z"
  }
}
```

## Update Session Status

Close or resolve a session.

```http
PATCH /api/v1/ucc/sessions/{sessionId}
```

**Request Body:**

```json
{
  "status": "resolved",
  "resolutionNote": "Customer issue regarding billing has been resolved."
}
```

**Example Request:**

```bash
curl -X PATCH "https://api.bigledger.com/v1/ucc/sessions/ucc_sess_123456789" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "status": "resolved"
  }'
```

**Response:**

```json
{
  "success": true,
  "data": {
    "id": "ucc_sess_123456789",
    "status": "resolved",
    "updatedAt": "2024-01-15T11:00:00Z"
  }
}
```

## List Sessions

Retrieve a list of sessions with filtering.

```http
GET /api/v1/ucc/sessions
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `status` | string | Filter by status (`active`, `pending`, `resolved`, `closed`) |
| `channel` | string | Filter by channel (`whatsapp`, `wechat`, `email`) |
| `agentId` | string | Filter by assigned agent |
| `dateFrom` | string | Created from date (YYYY-MM-DD) |
| `dateTo` | string | Created to date (YYYY-MM-DD) |
| `limit` | integer | Number of records per page |
| `cursor` | string | Pagination cursor |

## Webhooks for UCC Events

Subscribe to incoming messages and session events:

```http
POST /api/v1/webhooks/subscribe
```

**Request Body:**

```json
{
  "url": "https://your-app.com/webhooks/ucc",
  "events": [
    "ucc.message_received",
    "ucc.session_created",
    "ucc.session_assigned",
    "ucc.session_resolved"
  ],
  "secret": "your-webhook-secret"
}
```

**Webhook Payload Example - Message Received:**

```json
{
  "event": "ucc.message_received",
  "timestamp": "2024-01-15T10:45:00Z",
  "data": {
    "messageId": "msg_123123123",
    "sessionId": "ucc_sess_123456789",
    "channel": "whatsapp",
    "sender": {
      "name": "John Doe",
      "phoneNumber": "+60123456789"
    },
    "content": {
      "text": "Thank you, that solved my issue!"
    }
  }
}
```

## Error Handling

### 400 Bad Request - Invalid Message

```json
{
  "success": false,
  "error": {
    "code": "INVALID_MESSAGE_DATA",
    "message": "Message content is invalid or missing.",
    "details": [
      {
        "field": "content.text",
        "message": "Text content is required for a text message type."
      }
    ]
  }
}
```

### 404 Not Found - Session Not Found

```json
{
  "success": false,
  "error": {
    "code": "SESSION_NOT_FOUND",
    "message": "The specified UCC session could not be found or is inactive."
  }
}
```

## Code Examples

### Complete Message Workflow

```javascript
// Example workflow to process an incoming webhook and reply to a message
async function processIncomingUccMessage(webhookPayload) {
  const client = new BigLedgerClient({ /* config */ });
  
  if (webhookPayload.event === 'ucc.message_received') {
    const { sessionId, content } = webhookPayload.data;
    
    console.log(`Received message on session ${sessionId}: ${content.text}`);
    
    // Auto-reply to customer
    try {
      const response = await client.ucc.sendMessage({
        sessionId: sessionId,
        messageType: 'text',
        content: {
          text: 'We have received your message and an agent will be right with you.'
        }
      });
      console.log('Auto-reply sent successfully:', response.messageId);
    } catch (error) {
      console.error('Failed to send auto-reply:', error);
    }
  }
}
```

### Fetch Active Agent Sessions

```python
# Fetch and list all active sessions for a specific agent
async def get_active_sessions(agent_id):
    client = BigLedgerClient(api_key="...", company_id="...")
    
    try:
        response = await client.get('/ucc/sessions', {
            'status': 'active',
            'agentId': agent_id,
            'limit': 50
        })
        
        sessions = response['data']
        for session in sessions:
            print(f"Session {session['id']} on {session['channel']} - Customer: {session['customerId']}")
            
        return sessions
    except Exception as e:
        print(f"Error fetching sessions: {e}")
        return []
```
