# PostResourceController APIs

## Create Post
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/post-resource/post`
- **Description:** Creates a new Post resource.
- **Request Body:** `PostContainer` (JSON)
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update Post
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/post-resource/post`
- **Description:** Updates an existing Post resource.
- **Request Body:** `PostContainer` (JSON)
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Post By Id
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/post-resource/post/{uuid}`
- **Description:** Retrieves a specific Post resource by its identifier.
- **Request Body:** N/A
- **Request Parameters:**
    - `uuid` (String): The unique identifier.
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete Post By Id
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/post-resource/post/{uuid}`
- **Description:** Deletes a specific Post resource by its identifier.
- **Request Body:** N/A
- **Request Parameters:**
    - `uuid` (String): The unique identifier.
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Post List
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/post-resource/posts`
- **Description:** Retrieves a list of Post resources.
- **Request Body:** N/A
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Post Pagination
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/post-resource/posts/pagination`
- **Description:** Retrieves a list of Post resources.
- **Request Body:** N/A
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
