# ContextMsgLinkResourceController APIs

## Create Context Message Link
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/context-msg-link`
- **Description:** `Creates a new context message link.`
- **Request Body:** `ContextMsgLinkContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Update Context Message Link
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/context-msg-link`
- **Description:** `Updates an existing context message link.`
- **Request Body:** `ContextMsgLinkContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Context Message Link by UUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/context-msg-link/{uuid}`
- **Description:** `Retrieves a context message link by UUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `uuid` (String): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Delete Context Message Link by UUID
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/context-msg-link/{uuid}`
- **Description:** `Deletes a context message link by UUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `uuid` (String): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get List of Context Message Links
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/context-msg-links`
- **Description:** `Retrieves a list of context message links.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters (for query parameters like pagination, filtering)
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Paginated List of Context Message Links
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/context-msg-links/pagination`
- **Description:** `Retrieves a paginated list of context message links.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters (for query parameters like pagination, filtering)
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
