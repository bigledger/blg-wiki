# ConversationResourceController APIs

## Create Conversation Resource
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/conversations-resource`
- **Description:** `Creates a new conversation resource.`
- **Request Body:** `ConversationContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get All Conversation Resources
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversations-resource`
- **Description:** `Retrieves all conversation resources.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Resource by UUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversations-resource/{uuid}`
- **Description:** `Retrieves a conversation resource by UUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `uuid` (String): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Upsert Conversation
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/conversations-resource/upsert`
- **Description:** `Inserts or updates a conversation resource.`
- **Request Body:** `ConversationContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Update Conversation Resource
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/conversations-resource`
- **Description:** `Updates an existing conversation resource.`
- **Request Body:** `ConversationContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Resources by Criteria
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversations-resource/query`
- **Description:** `Retrieves conversation resources based on specified criteria.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters (for query parameters like pagination, filtering)
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
