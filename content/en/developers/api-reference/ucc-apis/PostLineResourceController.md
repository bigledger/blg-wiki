# PostLineResourceController APIs

## Create Post Line
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/post-line-resource/post-line`
- **Description:** Creates a new Post Line resource.
- **Request Body:** `PostLineContainer` (JSON)
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update Post Line
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/post-line-resource/post-line`
- **Description:** Updates an existing Post Line resource.
- **Request Body:** `PostLineContainer` (JSON)
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Post Line By Id
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/post-line-resource/post-line/{uuid}`
- **Description:** Retrieves a specific Post Line resource by its identifier.
- **Request Body:** N/A
- **Request Parameters:**
    - `uuid` (String): The unique identifier.
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete Post Line By Id
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/post-line-resource/post-line/{uuid}`
- **Description:** Deletes a specific Post Line resource by its identifier.
- **Request Body:** N/A
- **Request Parameters:**
    - `uuid` (String): The unique identifier.
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Post Line List
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/post-line-resource/post-lines`
- **Description:** Retrieves a list of Post Line resources.
- **Request Body:** N/A
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Post Line Pagination
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/post-line-resource/post-lines/pagination`
- **Description:** Retrieves a list of Post Line resources.
- **Request Body:** N/A
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
