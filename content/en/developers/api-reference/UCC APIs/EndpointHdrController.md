# EndpointHdrController APIs

## Get EndpointHdr by Criteria
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoints/query`
- **Description:** Retrieves a list of EndpointHdr objects based on provided criteria.
- **Request Body:**
- **Request Parameters:** `criteria` (VirtualContactQueryCriteria): The query criteria., `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get EndpointHdr by ID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoints/id/{endpointId}`
- **Description:** Retrieves an EndpointHdr object by its ID.
- **Request Body:**
- **Request Parameters:** `endpointId` (String): The ID of the endpoint., `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Get EndpointHdr by GUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/endpoints/{guid}`
- **Description:** Retrieves an EndpointHdr object by its GUID.
- **Request Body:**
- **Request Parameters:** `guid` (UUID): The GUID of the endpoint., `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## Update EndpointHdr
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/endpoints`
- **Description:** Updates an existing EndpointHdr object.
- **Request Body:** `EndpointHdrContainer` (JSON)
- **Request Parameters:** `HttpServletRequest parameters`
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.
