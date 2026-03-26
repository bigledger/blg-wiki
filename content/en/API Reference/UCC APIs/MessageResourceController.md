# MessageResourceController APIs

## create
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/conversation/{uuid}/message`
- **Description:** Handles POST requests for create.
- **Request Body:** `MessageContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## update
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/conversation/{uuid}/message`
- **Description:** Handles PUT requests for update.
- **Request Body:** `MessageContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## get
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation/{convUuid}/message/{uuid}`
- **Description:** Handles GET requests for get.
- **Request Parameters:** `uuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## delete
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/conversation/{convUuid}/message/{uuid}`
- **Description:** Handles DELETE requests for delete.
- **Request Parameters:** `uuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getList
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/messages`
- **Description:** Handles GET requests for getList.
- **Request Parameters:** `conversation_uuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getList
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation/{conversation_uuid}/message/query`
- **Description:** Handles GET requests for getList.
- **Request Parameters:** `conversation_uuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/messages/pagination`
- **Description:** Handles GET requests for getListPagination.
- **Request Parameters:** `conversationUuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation/{conversationUuid}/messages/pagination`
- **Description:** Handles GET requests for getListPagination.
- **Request Parameters:** `conversationUuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getMessagesBetweenSnapshot
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/messages/between-snapshot`
- **Description:** Handles GET requests for getMessagesBetweenSnapshot.
- **Request Parameters:** `conversationUuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getMessagesBetweenSnapshot
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation/{uuid}/messages/between-snapshot`
- **Description:** Handles GET requests for getMessagesBetweenSnapshot.
- **Request Parameters:** `conversationUuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getMessageMedia
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation/{conversationUuid}/message/{messageUuid}/media`
- **Description:** Handles GET requests for getMessageMedia.
- **Request Parameters:** `conversationUuid` (String), `messageUuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
