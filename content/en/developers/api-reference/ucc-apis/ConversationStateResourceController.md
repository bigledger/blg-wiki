# ConversationStateResourceController APIs

## Create
- **HTTP Method:** `POST`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-state`
- **Description:** Generic description based on the method name and HTTP method: POST create.
- **Request Body:** `ConversationStateContainer` (JSON)
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `ConversationStateContainer` (JSON with `ApiResponse<ConversationStateContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update
- **HTTP Method:** `PUT`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-state`
- **Description:** Generic description based on the method name and HTTP method: PUT update.
- **Request Body:** `ConversationStateContainer` (JSON)
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `ConversationStateContainer` (JSON with `ApiResponse<ConversationStateContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-state/{uuid}`
- **Description:** Generic description based on the method name and HTTP method: GET get.
- **Request Parameters:** uuid (String): 
- **Response:** `ConversationStateContainer` (JSON with `ApiResponse<ConversationStateContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete
- **HTTP Method:** `DELETE`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-state/{uuid}`
- **Description:** Generic description based on the method name and HTTP method: DELETE delete.
- **Request Parameters:** uuid (String): 
- **Response:** `ConversationStateContainer` (JSON with `ApiResponse<ConversationStateContainer>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetList
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-states`
- **Description:** Generic description based on the method name and HTTP method: GET getList.
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `PagingResponse<ConversationStateContainer>` (JSON with `ApiResponse<PagingResponse<ConversationStateContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## GetListPagination
- **HTTP Method:** `GET`
- **Path:** `/core2/{tenantId}/dm/alg/cc/conversation-states/pagination`
- **Description:** Generic description based on the method name and HTTP method: GET getListPagination.
- **Request Parameters:** req (HttpServletRequest)
- **Response:** `PagingResponse<ConversationStateContainer>` (JSON with `ApiResponse<PagingResponse<ConversationStateContainer>>` on success, error on failure). Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
