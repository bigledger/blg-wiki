# EndpointBotLinkResourceController APIs

## Create EndpointBotLinkResource
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/endpoint-bot-link`
- **Description:** Creates a new EndpointBotLinkResource.
- **Request Body:** `EndpointBotLinkContainer` (JSON)
- **Request Parameters:** `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update EndpointBotLinkResource
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/endpoint-bot-link`
- **Description:** Updates an existing EndpointBotLinkResource.
- **Request Body:** `EndpointBotLinkContainer` (JSON)
- **Request Parameters:** `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get EndpointBotLinkResource
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoint-bot-link/{uuid}`
- **Description:** Retrieves an EndpointBotLinkResource by UUID.
- **Request Body:**
- **Request Parameters:** `uuid` (String): The unique identifier., `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Delete EndpointBotLinkResource
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/endpoint-bot-link/{uuid}`
- **Description:** Deletes an EndpointBotLinkResource by UUID.
- **Request Body:**
- **Request Parameters:** `uuid` (String): The unique identifier., `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get List of EndpointBotLinkResources
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoint-bot-links`
- **Description:** Retrieves a list of EndpointBotLinkResources.
- **Request Body:**
- **Request Parameters:** `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get Paginated List of EndpointBotLinkResources
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoint-bot-links/pagination`
- **Description:** Retrieves a paginated list of EndpointBotLinkResources.
- **Request Body:**
- **Request Parameters:** `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
