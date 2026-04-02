# ConversationEventResourceController APIs

## Create Conversation Event Resource
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/alg-conversation-event`
- **Description:** `Creates a new conversation event resource.`
- **Request Body:** `ConversationEventContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Update Conversation Event Resource
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/alg-conversation-event`
- **Description:** `Updates an existing conversation event resource.`
- **Request Body:** `ConversationEventContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Event Resource by UUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/alg-conversation-event/{uuid}`
- **Description:** `Retrieves a conversation event resource by UUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `uuid` (String): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Delete Conversation Event Resource by UUID
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/alg-conversation-event/{uuid}`
- **Description:** `Deletes a conversation event resource by UUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `uuid` (String): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get List of Conversation Event Resources
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/alg-conversation-events`
- **Description:** `Retrieves a list of conversation event resources.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters (for query parameters like pagination, filtering)
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Paginated List of Conversation Event Resources
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/alg-conversation-events/pagination`
- **Description:** `Retrieves a paginated list of conversation event resources.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters (for query parameters like pagination, filtering)
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Paginated List of Conversation Event Resources by Date Range
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/alg-conversation-events/{uuid}/pagination/event_date`
- **Description:** `Retrieves a paginated list of conversation event resources by date range and conversation UUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `conversationUuid` (String): The unique identifier for the conversation. `HttpServletRequest` parameters (for date range, pagination, filtering)
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
