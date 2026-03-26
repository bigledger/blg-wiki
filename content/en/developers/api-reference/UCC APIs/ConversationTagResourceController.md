# ConversationTagResourceController APIs

## Create
- **HTTP Method:** `POST`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-tag`
- **Description:** Generic description based on the method name and HTTP method: POST create.
- **Request Body:** `ConversationTagContainer` (JSON)
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `ConversationTagContainer` (JSON with `ApiResponse<ConversationTagContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update
- **HTTP Method:** `PUT`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-tag`
- **Description:** Generic description based on the method name and HTTP method: PUT update.
- **Request Body:** `ConversationTagContainer` (JSON)
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `ConversationTagContainer` (JSON with `ApiResponse<ConversationTagContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-tag/{uuid}`
- **Description:** Generic description based on the method name and HTTP method: GET get.
- **Request Parameters:** uuid (String): 
- **Response:** `ConversationTagContainer` (JSON with `ApiResponse<ConversationTagContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete
- **HTTP Method:** `DELETE`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-tag/{uuid}`
- **Description:** Generic description based on the method name and HTTP method: DELETE delete.
- **Request Parameters:** uuid (String): 
- **Response:** `ConversationTagContainer` (JSON with `ApiResponse<ConversationTagContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetList
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-tags`
- **Description:** Generic description based on the method name and HTTP method: GET getList.
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `PagingResponse<ConversationTagContainer>` (JSON with `ApiResponse<PagingResponse<ConversationTagContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-tags/pagination`
- **Description:** Generic description based on the method name and HTTP method: GET getListPagination.
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `PagingResponse<ConversationTagContainer>` (JSON with `ApiResponse<PagingResponse<ConversationTagContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetListDistinctPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-tag/distinct/pagination`
- **Description:** Generic description based on the method name and HTTP method: GET getListDistinctPagination.
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `PagingResponse<ConversationTagContainer>` (JSON with `ApiResponse<PagingResponse<ConversationTagContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
