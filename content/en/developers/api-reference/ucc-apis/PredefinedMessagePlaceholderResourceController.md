# PredefinedMessagePlaceholderResourceController APIs

## Create Predefined Message Placeholder
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/predefined-message-placeholder`
- **Description:** Creates a new predefined message placeholder.
- **Request Body:** `PredefinedMessagePlaceholderContainer` (JSON)
- **Request Parameters:** None
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessagePlaceholderContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update Predefined Message Placeholder
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/predefined-message-placeholder`
- **Description:** Updates an existing predefined message placeholder.
- **Request Body:** `PredefinedMessagePlaceholderContainer` (JSON)
- **Request Parameters:** None
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessagePlaceholderContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get Predefined Message Placeholder by UUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-message-placeholder/{uuid}`
- **Description:** Retrieves a predefined message placeholder by its UUID.
- **Request Body:** None
- **Request Parameters:** `uuid` (String): The unique identifier of the predefined message placeholder.
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessagePlaceholderContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete Predefined Message Placeholder by UUID
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/predefined-message-placeholder/{uuid}`
- **Description:** Deletes a predefined message placeholder by its UUID.
- **Request Body:** None
- **Request Parameters:** `uuid` (String): The unique identifier of the predefined message placeholder.
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessagePlaceholderContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get List of Predefined Message Placeholders
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-message-placeholders`
- **Description:** Retrieves a list of predefined message placeholders.
- **Request Body:** None
- **Request Parameters:** Query parameters for filtering, sorting, and pagination (e.g., `offset`, `limit`, `sort`, `filter`).
- **Response:** Streaming response body, typically JSON with `PagingResponse<PredefinedMessagePlaceholderContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get Paginated List of Predefined Message Placeholders
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-message-placeholders/pagination`
- **Description:** Retrieves a paginated list of predefined message placeholders.
- **Request Body:** None
- **Request Parameters:** Query parameters for filtering, sorting, and pagination (e.g., `offset`, `limit`, `sort`, `filter`).
- **Response:** Streaming response body, typically JSON with `PagingResponse<PredefinedMessagePlaceholderContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
