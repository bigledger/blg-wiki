# PredefinedMessageLineResourceController APIs

## Create Predefined Message Line
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/predefined-message-line`
- **Description:** Creates a new predefined message line.
- **Request Body:** `PredefinedMessageLineContainer` (JSON)
- **Request Parameters:** None
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessageLineContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update Predefined Message Line
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/predefined-message-line`
- **Description:** Updates an existing predefined message line.
- **Request Body:** `PredefinedMessageLineContainer` (JSON)
- **Request Parameters:** None
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessageLineContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get Predefined Message Line by UUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-message-line/{uuid}`
- **Description:** Retrieves a predefined message line by its UUID.
- **Request Body:** None
- **Request Parameters:** `uuid` (String): The unique identifier of the predefined message line.
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessageLineContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete Predefined Message Line by UUID
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/predefined-message-line/{uuid}`
- **Description:** Deletes a predefined message line by its UUID.
- **Request Body:** None
- **Request Parameters:** `uuid` (String): The unique identifier of the predefined message line.
- **Response:** Streaming response body, typically JSON with `ApiResponse<PredefinedMessageLineContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get List of Predefined Message Lines
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-message-lines`
- **Description:** Retrieves a list of predefined message lines.
- **Request Body:** None
- **Request Parameters:** Query parameters for filtering, sorting, and pagination (e.g., `offset`, `limit`, `sort`, `filter`).
- **Response:** Streaming response body, typically JSON with `PagingResponse<PredefinedMessageLineContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get Paginated List of Predefined Message Lines
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/predefined-message-lines/pagination`
- **Description:** Retrieves a paginated list of predefined message lines.
- **Request Body:** None
- **Request Parameters:** Query parameters for filtering, sorting, and pagination (e.g., `offset`, `limit`, `sort`, `filter`).
- **Response:** Streaming response body, typically JSON with `PagingResponse<PredefinedMessageLineContainer>` on success, error on failure. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
