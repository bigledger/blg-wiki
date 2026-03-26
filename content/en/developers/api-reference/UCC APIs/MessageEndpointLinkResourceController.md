# MessageEndpointLinkResourceController APIs

## create
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/msg-endpoint-link`
- **Description:** Handles POST requests for create.
- **Request Body:** `MessageEndpointLinkContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## update
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/msg-endpoint-link`
- **Description:** Handles PUT requests for update.
- **Request Body:** `MessageEndpointLinkContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## get
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/msg-endpoint-link/{uuid}`
- **Description:** Handles GET requests for get.
- **Request Parameters:** `uuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## delete
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/msg-endpoint-link/{uuid}`
- **Description:** Handles DELETE requests for delete.
- **Request Parameters:** `uuid` (String), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getList
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/message-endpoint-link/query`
- **Description:** Handles GET requests for getList.
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/msg-endpoint-links/pagination`
- **Description:** Handles GET requests for getListPagination.
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
