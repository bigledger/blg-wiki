# Action Controller APIs

## Create Action
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/actions`
- **Description:** Creates a new action.
- **Request Body:** `ActionContainer` (JSON)
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Update Action
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/actions`
- **Description:** Updates an existing action.
- **Request Body:** `ActionContainer` (JSON)
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Delete Action by GUID
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/actions/{guid}`
- **Description:** Deletes an action by its GUID.
- **Path Variables:**
    - `guid` (UUID): The unique identifier of the action to delete.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<Boolean>` on success, error on failure)

## Get All Actions
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions`
- **Description:** Retrieves all actions.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `StreamingApiResponse` containing `ActionContainer` stream on success)

## Get Action by GUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/{guid}`
- **Description:** Retrieves an action by its GUID.
- **Path Variables:**
    - `guid` (UUID): The unique identifier of the action to retrieve.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Get Actions by Criteria
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/query`
- **Description:** Retrieves actions based on query criteria.
- **Request Parameters:**
    - `criteria` (ActionQueryCriteria): Object containing various filtering and paging criteria.
    - `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `StreamingPagingResponse` containing `ActionContainer` stream on success)

## Create Action (Backoffice Endpoint)
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/actions/backoffice-ep`
- **Description:** Creates a new action via the backoffice endpoint.
- **Request Body:** `ActionContainer` (JSON)
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Create Action (ETL Endpoint)
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/actions/etl-ep`
- **Description:** Creates a new action via the ETL endpoint.
- **Request Body:** `ActionContainer` (JSON)
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Create Action (Login Entity Endpoint)
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/actions/login-entity-ep`
- **Description:** Creates a new action via the login entity endpoint.
- **Request Body:** `ActionContainer` (JSON)
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Update Action (Backoffice Endpoint)
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/actions/backoffice-ep`
- **Description:** Updates an existing action via the backoffice endpoint.
- **Request Body:** `ActionContainer` (JSON)
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Update Action (ETL Endpoint)
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/actions/etl-ep`
- **Description:** Updates an existing action via the ETL endpoint.
- **Request Body:** `ActionContainer` (JSON)
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Update Action (Login Entity Endpoint)
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/actions/login-entity-ep`
- **Description:** Updates an existing action via the login entity endpoint.
- **Request Body:** `ActionContainer` (JSON)
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Delete Action by GUID (Backoffice Endpoint)
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/actions/backoffice-ep/{guid}`
- **Description:** Deletes an action by its GUID via the backoffice endpoint.
- **Path Variables:**
    - `guid` (UUID): The unique identifier of the action to delete.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<Boolean>` on success, error on failure)

## Delete Action by GUID (ETL Endpoint)
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/actions/etl-ep/{guid}`
- **Description:** Deletes an action by its GUID via the ETL endpoint.
- **Path Variables:**
    - `guid` (UUID): The unique identifier of the action to delete.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<Boolean>` on success, error on failure)

## Delete Action by GUID (Login Entity Endpoint)
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/actions/login-entity-ep/{guid}`
- **Description:** Deletes an action by its GUID via the login entity endpoint.
- **Path Variables:**
    - `guid` (UUID): The unique identifier of the action to delete.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<Boolean>` on success, error on failure)

## Get All Actions (Backoffice Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/backoffice-ep`
- **Description:** Retrieves all actions via the backoffice endpoint.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `StreamingApiResponse` containing `ActionContainer` stream on success)

## Get All Actions (ETL Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/etl-ep`
- **Description:** Retrieves all actions via the ETL endpoint.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `StreamingApiResponse` containing `ActionContainer` stream on success)

## Get All Actions (Login Entity Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/login-entity-ep`
- **Description:** Retrieves all actions via the login entity endpoint.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `StreamingApiResponse` containing `ActionContainer` stream on success)

## Get Action by GUID (Backoffice Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/backoffice-ep/{guid}`
- **Description:** Retrieves an action by its GUID via the backoffice endpoint.
- **Path Variables:**
    - `guid` (UUID): The unique identifier of the action to retrieve.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Get Action by GUID (ETL Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/etl-ep/{guid}`
- **Description:** Retrieves an action by its GUID via the ETL endpoint.
- **Path Variables:**
    - `guid` (UUID): The unique identifier of the action to retrieve.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Get Action by GUID (Login Entity Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/login-entity-ep/{guid}`
- **Description:** Retrieves an action by its GUID via the login entity endpoint.
- **Path Variables:**
    - `guid` (UUID): The unique identifier of the action to retrieve.
- **Request Parameters:** `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `ApiResponse<ActionContainer>` on success, error on failure)

## Get Actions by Criteria (Backoffice Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/backoffice-ep/query`
- **Description:** Retrieves actions based on query criteria via the backoffice endpoint.
- **Request Parameters:**
    - `criteria` (ActionQueryCriteria): Object containing various filtering and paging criteria.
    - `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `StreamingPagingResponse` containing `ActionContainer` stream on success)

## Get Actions by Criteria (ETL Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/etl-ep/query`
- **Description:** Retrieves actions based on query criteria via the ETL endpoint.
- **Request Parameters:**
    - `criteria` (ActionQueryCriteria): Object containing various filtering and paging criteria.
    - `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `StreamingPagingResponse` containing `ActionContainer` stream on success)

## Get Actions by Criteria (Login Entity Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/login-entity-ep/query`
- **Description:** Retrieves actions based on query criteria via the login entity endpoint.
- **Request Parameters:**
    - `criteria` (ActionQueryCriteria): Object containing various filtering and paging criteria.
    - `HttpServletRequest req`
- **Response:** `ResponseEntity<StreamingResponseBody>` (JSON with `StreamingPagingResponse` containing `ActionContainer` stream on success)

## Export Actions to CSV (Backoffice Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/backoffice-ep/export/csv`
- **Description:** Exports all actions to a CSV file via the backoffice endpoint.
- **Request Parameters:** `HttpServletRequest request`
- **Response:** `ResponseEntity<StreamingResponseBody>` (CSV data stream on success)

## Export Actions to CSV (ETL Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/etl-ep/export/csv`
- **Description:** Exports all actions to a CSV file via the ETL endpoint.
- **Request Parameters:** `HttpServletRequest request`
- **Response:** `ResponseEntity<StreamingResponseBody>` (CSV data stream on success)

## Export Actions to CSV (Login Entity Endpoint)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/actions/login-entity-ep/export/csv`
- **Description:** Exports all actions to a CSV file via the login entity endpoint.
- **Request Parameters:** `HttpServletRequest request`
- **Response:** `ResponseEntity<StreamingResponseBody>` (CSV data stream on success)
