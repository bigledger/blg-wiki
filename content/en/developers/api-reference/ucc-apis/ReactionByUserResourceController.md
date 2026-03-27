# ReactionByUserResourceController APIs

## Create Reaction By User
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/reaction-by-user-resource/reaction-by-user`
- **Description:** Creates a new Reaction By User resource.
- **Request Body:** `ReactionByUserContainer` (JSON)
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update Reaction By User
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/reaction-by-user-resource/reaction-by-user`
- **Description:** Updates an existing Reaction By User resource.
- **Request Body:** `ReactionByUserContainer` (JSON)
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Reaction By User By Id
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/reaction-by-user-resource/reaction-by-user/{uuid}`
- **Description:** Retrieves a specific Reaction By User resource by its identifier.
- **Request Body:** N/A
- **Request Parameters:**
    - `uuid` (String): The unique identifier.
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete Reaction By User By Id
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/reaction-by-user-resource/reaction-by-user/{uuid}`
- **Description:** Deletes a specific Reaction By User resource by its identifier.
- **Request Body:** N/A
- **Request Parameters:**
    - `uuid` (String): The unique identifier.
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Reaction By User List
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/reaction-by-user-resource/reaction-by-users`
- **Description:** Retrieves a list of Reaction By User resources.
- **Request Body:** N/A
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Retrieve Reaction By User Pagination
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/reaction-by-user-resource/reaction-by-users/pagination`
- **Description:** Retrieves a list of Reaction By User resources.
- **Request Body:** N/A
- **Request Parameters:**
    - `HttpServletRequest`: The HTTP request object (can contain query parameters or other request details).
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
