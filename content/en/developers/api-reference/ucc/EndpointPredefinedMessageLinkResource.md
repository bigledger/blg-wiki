# EndpointPredefinedMessageLinkResource APIs

## Create
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/endpoint-predefined-message-link`
- **Description:** Handles HTTP POST requests for create.
- **Request Body:** `EndpointPredefinedMessageLinkContainer (JSON)`
- **Request Parameters:** `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/endpoint-predefined-message-link`
- **Description:** Handles HTTP PUT requests for update.
- **Request Body:** `EndpointPredefinedMessageLinkContainer (JSON)`
- **Request Parameters:** `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoint-predefined-message-link/{uuid}`
- **Description:** Handles HTTP GET requests for get.
- **Request Parameters:** `uuid` (String): The unique identifier.; `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/endpoint-predefined-message-link/{uuid}`
- **Description:** Handles HTTP DELETE requests for delete.
- **Request Parameters:** `uuid` (String): The unique identifier.; `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetList
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoint-predefined-message-links`
- **Description:** Handles HTTP GET requests for getList.
- **Request Parameters:** `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoint-predefined-message-links/pagination`
- **Description:** Handles HTTP GET requests for getListPagination.
- **Request Parameters:** `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
