# ChannelController APIs

## createChannel
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/channels`
- **Description:** Handles POST requests to create a channel.
- **Request Body:** `ChannelContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## updateChannel
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/channels`
- **Description:** Handles PUT requests to update a channel.
- **Request Body:** `ChannelContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## deleteChannelByGuid
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/channels/{guid}`
- **Description:** Handles DELETE requests to delete a channel by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID): The unique identifier of the channel., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAllChannel
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels`
- **Description:** Handles GET requests to retrieve all channels.
- **Request Body:** N/A
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getChannelByGuid
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/{guid}`
- **Description:** Handles GET requests to retrieve a channel by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID): The unique identifier of the channel., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getByCriteria
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/query`
- **Description:** Handles GET requests to retrieve channels by criteria.
- **Request Body:** N/A
- **Request Parameters:** `criteria` (ChannelQueryCriteria): Criteria for querying channels., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## createChannelBackofficeEP
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/channels/backoffice-ep` or `/core2/alg/cc-channels/backoffice-ep`
- **Description:** Handles POST requests to create a channel for backoffice.
- **Request Body:** `ChannelContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## createChannelEtl
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/channels/etl-ep` or `/core2/alg/cc-channels/etl-ep`
- **Description:** Handles POST requests to create a channel for ETL.
- **Request Body:** `ChannelContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## updateChannelBackOfficeEp
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/channels/backoffice-ep` or `/core2/alg/cc-channels/backoffice-ep`
- **Description:** Handles PUT requests to update a channel for backoffice.
- **Request Body:** `ChannelContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## updateChannelEtlEp
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/channels/etl-ep` or `/core2/alg/cc-channels/etl-ep`
- **Description:** Handles PUT requests to update a channel for ETL.
- **Request Body:** `ChannelContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## deleteChannelBackoffice
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/channels/backoffice-ep/{guid}` or `/core2/alg/cc-channels/backoffice-ep/{guid}`
- **Description:** Handles DELETE requests to delete a channel for backoffice by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID): The unique identifier of the channel., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## deleteChannelEtl
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/channels/etl-ep/{guid}` or `/core2/alg/cc-channels/etl-ep/{guid}`
- **Description:** Handles DELETE requests to delete a channel for ETL by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID): The unique identifier of the channel., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAllChannelBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/backoffice-ep` or `/core2/alg/cc-channels/backoffice-ep`
- **Description:** Handles GET requests to retrieve all channels for backoffice.
- **Request Body:** N/A
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAllChannelEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/etl-ep` or `/core2/alg/cc-channels/etl-ep`
- **Description:** Handles GET requests to retrieve all channels for ETL.
- **Request Body:** N/A
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getChannelByGuidBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/backoffice-ep/{guid}` or `/core2/alg/cc-channels/backoffice-ep/{guid}`
- **Description:** Handles GET requests to retrieve a channel for backoffice by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID): The unique identifier of the channel., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getChannelByGuidEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/etl-ep/{guid}` or `/core2/alg/cc-channels/etl-ep/{guid}`
- **Description:** Handles GET requests to retrieve a channel for ETL by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID): The unique identifier of the channel., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getChannelByCriteriaBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/backoffice-ep/query` or `/core2/alg/cc-channels/backoffice-ep/query`
- **Description:** Handles GET requests to retrieve channels by criteria for backoffice.
- **Request Body:** N/A
- **Request Parameters:** `criteria` (ChannelQueryCriteria): Criteria for querying channels., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getChannelByCriteriaEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/etl-ep/query` or `/core2/alg/cc-channels/etl-ep/query`
- **Description:** Handles GET requests to retrieve channels by criteria for ETL.
- **Request Body:** N/A
- **Request Parameters:** `criteria` (ChannelQueryCriteria): Criteria for querying channels., `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getExportCsvBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/backoffice-ep/export/csv` or `/core2/alg/cc-channels/backoffice-ep/export/csv`
- **Description:** Handles GET requests to export channel data to CSV for backoffice.
- **Request Body:** N/A
- **Request Parameters:** `request` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getExportCsvEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/channels/etl-ep/export/csv` or `/core2/alg/cc-channels/etl-ep/export/csv`
- **Description:** Handles GET requests to export channel data to CSV for ETL.
- **Request Body:** N/A
- **Request Parameters:** `request` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.