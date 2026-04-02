# ConversationController APIs

## Insert Into Campaign Sending Queue
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/conversations/insert/campaign-sending-queue`
- **Description:** `Inserts data into the campaign sending queue.`
- **Request Body:** `Map<String, Object>` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Create Conversation History Queue
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/conversations/insert/conversation-history-queue`
- **Description:** `Creates an entry in the conversation history queue.`
- **Request Body:** `Map<String, Object>` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
