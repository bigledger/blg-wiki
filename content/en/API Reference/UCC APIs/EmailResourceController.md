# EmailResourceController APIs

## Create
- **HTTP Method:** `POST`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread/{uuid}/email`
- **Description:** Generic description based on the method name and HTTP method: POST create.
- **Request Body:** `EmailContainer` (JSON)
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `EmailContainer` (JSON with `ApiResponse<EmailContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update
- **HTTP Method:** `PUT`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread/{uuid}/email`
- **Description:** Generic description based on the method name and HTTP method: PUT update.
- **Request Body:** `EmailContainer` (JSON)
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `EmailContainer` (JSON with `ApiResponse<EmailContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread/{threadUuid}/email/{uuid}`
- **Description:** Generic description based on the method name and HTTP method: GET get.
- **Request Parameters:** uuid (String): 
- **Response:** `EmailContainer` (JSON with `ApiResponse<EmailContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete
- **HTTP Method:** `DELETE`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread/{threadUuid}/email/{uuid}`
- **Description:** Generic description based on the method name and HTTP method: DELETE delete.
- **Request Parameters:** uuid (String): 
- **Response:** `EmailContainer` (JSON with `ApiResponse<EmailContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetList
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/emails`
- **Description:** Generic description based on the method name and HTTP method: GET getList.
- **Request Parameters:** emailThreadUuid (String): , req (HttpServletRequest)
- **Response:** `PagingResponse<EmailContainer>` (JSON with `ApiResponse<PagingResponse<EmailContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/emails/pagination`
- **Description:** Generic description based on the method name and HTTP method: GET getListPagination.
- **Request Parameters:** emailThreadUuid (String): , req (HttpServletRequest)
- **Response:** `PagingResponse<EmailContainer>` (JSON with `ApiResponse<PagingResponse<EmailContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetEmailAttachment
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/email-thread/{emailThreadUuid}/email/{emailUuid}/attachment/{attachmentIndex}`
- **Description:** Generic description based on the method name and HTTP method: GET getEmailAttachment.
- **Request Parameters:** emailThreadUuid (String): , emailUuid (String): , attachmentIndex (int): , req (HttpServletRequest)
- **Response:** `ResponseEntity<StreamingResponseBody>`. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
