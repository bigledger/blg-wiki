# LoginSubjectLinkController APIs

## createLoginSubjectLink
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/login-subject-link`
- **Description:** Handles POST requests for createLoginSubjectLink.
- **Request Body:** `LoginSubjectLinkContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## updateLoginSubjectLink
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/login-subject-link`
- **Description:** Handles PUT requests for updateLoginSubjectLink.
- **Request Body:** `LoginSubjectLinkContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## deleteLoginSubjectLink
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/login-subject-link/{guid}`
- **Description:** Handles DELETE requests for deleteLoginSubjectLink.
- **Request Parameters:** `guid` (UUID), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getAllLoginSubjectLink
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/login-subject-link`
- **Description:** Handles GET requests for getAllLoginSubjectLink.
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getLoginSubjectLinkByGuid
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/login-subject-link/{guid}`
- **Description:** Handles GET requests for getLoginSubjectLinkByGuid.
- **Request Parameters:** `guid` (UUID), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getLoginSubjectLinkByCriteria
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/login-subject-link/query`
- **Description:** Handles GET requests for getLoginSubjectLinkByCriteria.
- **Request Parameters:** `criteria` (LoginSubjectLinkQueryCriteria), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
