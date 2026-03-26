# PredefinedMessageResourceController APIs

## Create Predefined Message
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/predefined-message`
- **Description:** Creates a new predefined message.
- **Request Body:** `PredefinedMessageContainer` (JSON)
- **Request Parameters:** None
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessageContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update Predefined Message
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/predefined-message`
- **Description:** Updates an existing predefined message.
- **Request Body:** `PredefinedMessageContainer` (JSON)
- **Request Parameters:** None
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessageContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get Predefined Message by UUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-message/{uuid}`
- **Description:** Retrieves a predefined message by its UUID.
- **Request Body:** None
- **Request Parameters:** `uuid` (String): The unique identifier of the predefined message.
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessageContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete Predefined Message by UUID
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/predefined-message/{uuid}`
- **Description:** Deletes a predefined message by its UUID.
- **Request Body:** None
- **Request Parameters:** `uuid` (String): The unique identifier of the predefined message.
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessageContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get List of Predefined Messages
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-message/query`
- **Description:** Retrieves a list of predefined messages.
- **Request Body:** None
- **Request Parameters:** Query parameters for filtering, sorting, and pagination (e.g., `offset`, `limit`, `sort`, `filter`).
- **Response:** Streaming response body, typically JSON with `PagingResponse<PredefinedMessageContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get Paginated List of Predefined Messages
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-messages/pagination`
- **Description:** Retrieves a paginated list of predefined messages.
- **Request Body:** None
- **Request Parameters:** Query parameters for filtering, sorting, and pagination (e.g., `offset`, `limit`, `sort`, `filter`).
- **Response:** Streaming response body, typically JSON with `PagingResponse<PredefinedMessageContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
