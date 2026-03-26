# EmailThreadEventResourceController APIs

## Create
- **HTTP Method:** `POST`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread-event`
- **Description:** Generic description based on the method name and HTTP method: POST create.
- **Request Body:** `EmailThreadEventContainer` (JSON)
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `EmailThreadEventContainer` (JSON with `ApiResponse<EmailThreadEventContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update
- **HTTP Method:** `PUT`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread-event`
- **Description:** Generic description based on the method name and HTTP method: PUT update.
- **Request Body:** `EmailThreadEventContainer` (JSON)
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `EmailThreadEventContainer` (JSON with `ApiResponse<EmailThreadEventContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread-event/{uuid}`
- **Description:** Generic description based on the method name and HTTP method: GET get.
- **Request Parameters:** uuid (String): 
- **Response:** `EmailThreadEventContainer` (JSON with `ApiResponse<EmailThreadEventContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete
- **HTTP Method:** `DELETE`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread-event/{uuid}`
- **Description:** Generic description based on the method name and HTTP method: DELETE delete.
- **Request Parameters:** uuid (String): 
- **Response:** `EmailThreadEventContainer` (JSON with `ApiResponse<EmailThreadEventContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetList
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread-events`
- **Description:** Generic description based on the method name and HTTP method: GET getList.
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `PagingResponse<EmailThreadEventContainer>` (JSON with `ApiResponse<PagingResponse<EmailThreadEventContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread-events/pagination`
- **Description:** Generic description based on the method name and HTTP method: GET getListPagination.
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `PagingResponse<EmailThreadEventContainer>` (JSON with `ApiResponse<PagingResponse<EmailThreadEventContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
