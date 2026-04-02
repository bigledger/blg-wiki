# EndpointResource APIs

## Create
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/endpoint`
- **Description:** Handles HTTP POST requests for create.
- **Request Body:** `EndpointContainer (JSON)`
- **Request Parameters:** `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/endpoint`
- **Description:** Handles HTTP PUT requests for update.
- **Request Body:** `EndpointContainer (JSON)`
- **Request Parameters:** `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoint/{uuid}`, `/core2/alg/cc/endpoint/{uuid}/all-status`
- **Description:** Handles HTTP GET requests for get.
- **Request Parameters:** `uuid` (String): The unique identifier.; `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/endpoint/{uuid}`
- **Description:** Handles HTTP DELETE requests for delete.
- **Request Parameters:** `uuid` (String): The unique identifier.; `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetList
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoint/query`
- **Description:** Handles HTTP GET requests for getList.
- **Request Parameters:** `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoints/pagination`
- **Description:** Handles HTTP GET requests for getListPagination.
- **Request Parameters:** `HttpServletRequest`: Standard servlet request object.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
