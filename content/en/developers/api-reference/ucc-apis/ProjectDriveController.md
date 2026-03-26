# ProjectDriveController APIs

## createProjectDrive
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/project-drive-links`
- **Description:** Handles POST requests for createProjectDrive.
- **Request Body:** `ProjectDriveContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## updateProjectDrive
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/project-drive-links`
- **Description:** Handles PUT requests for updateProjectDrive.
- **Request Body:** `ProjectDriveContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## deleteProjectDrive
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/project-drive-links/{guid}`
- **Description:** Handles DELETE requests for deleteProjectDrive.
- **Request Parameters:** `guid` (UUID), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getAllProjectDrive
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links`
- **Description:** Handles GET requests for getAllProjectDrive.
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getProjectDriveByGuid
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/{guid}`
- **Description:** Handles GET requests for getProjectDriveByGuid.
- **Request Parameters:** `guid` (UUID), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getProjectDriveByCriteria
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/query`
- **Description:** Handles GET requests for getProjectDriveByCriteria.
- **Request Parameters:** `criteria` (ProjectDriveQueryCriteria), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## createProjectDriveBackofficeEP
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/project-drive-links/backoffice-ep`
- **Description:** Handles POST requests for createProjectDriveBackofficeEP.
- **Request Body:** `ProjectDriveContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## createProjectDriveEtl
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/project-drive-links/etl-ep`
- **Description:** Handles POST requests for createProjectDriveEtl.
- **Request Body:** `ProjectDriveContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## updateProjectDriveBackOfficeEp
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/project-drive-links/backoffice-ep`
- **Description:** Handles PUT requests for updateProjectDriveBackOfficeEp.
- **Request Body:** `ProjectDriveContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## updateProjectDriveEtlEp
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/project-drive-links/etl-ep`
- **Description:** Handles PUT requests for updateProjectDriveEtlEp.
- **Request Body:** `ProjectDriveContainer` (JSON)
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## deleteProjectDriveBackoffice
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/project-drive-links/backoffice-ep/{guid}`
- **Description:** Handles DELETE requests for deleteProjectDriveBackoffice.
- **Request Parameters:** `guid` (UUID), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## deleteProjectDriveEtl
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/project-drive-links/etl-ep/{guid}`
- **Description:** Handles DELETE requests for deleteProjectDriveEtl.
- **Request Parameters:** `guid` (UUID), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getAllProjectDriveBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/backoffice-ep`
- **Description:** Handles GET requests for getAllProjectDriveBackoffice.
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getAllProjectDriveEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/etl-ep`
- **Description:** Handles GET requests for getAllProjectDriveEtl.
- **Request Parameters:** `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getProjectDriveByGuidBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/backoffice-ep/{guid}`
- **Description:** Handles GET requests for getProjectDriveByGuidBackoffice.
- **Request Parameters:** `guid` (UUID), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getProjectDriveByGuidEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/etl-ep/{guid}`
- **Description:** Handles GET requests for getProjectDriveByGuidEtl.
- **Request Parameters:** `guid` (UUID), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getProjectDriveByCriteriaBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/backoffice-ep/query`
- **Description:** Handles GET requests for getProjectDriveByCriteriaBackoffice.
- **Request Parameters:** `criteria` (ProjectDriveQueryCriteria), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getProjectDriveByCriteriaEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/etl-ep/query`
- **Description:** Handles GET requests for getProjectDriveByCriteriaEtl.
- **Request Parameters:** `criteria` (ProjectDriveQueryCriteria), `HttpServletRequest`
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getExportCsvBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/backoffice-ep/export/csv`
- **Description:** Handles GET requests for getExportCsvBackoffice.
- **Request Parameters:** `request` (HttpServletRequest)
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## getExportCsvEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/project-drive-links/etl-ep/export/csv`
- **Description:** Handles GET requests for getExportCsvEtl.
- **Request Parameters:** `request` (HttpServletRequest)
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
