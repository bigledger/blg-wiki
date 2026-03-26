# ConversationEventController APIs

## Create Conversation Event
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/conversation-events`
- **Description:** `Creates a new conversation event.`
- **Request Body:** `ConversationEventContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Update Conversation Event
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/conversation-events`
- **Description:** `Updates an existing conversation event.`
- **Request Body:** `ConversationEventContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Delete Conversation Event by GUID
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/conversation-events/{guid}`
- **Description:** `Deletes a conversation event by GUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `guid` (UUID): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get All Conversation Events
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events`
- **Description:** `Retrieves all conversation events.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Event by GUID
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/{guid}`
- **Description:** `Retrieves a conversation event by GUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `guid` (UUID): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Events by Criteria
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/query`
- **Description:** `Retrieves conversation events based on specified criteria.`
- **Request Body:** `N/A`
- **Request Parameters:** `ConversationEventQueryCriteria` parameters, `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Create Conversation Event (Backoffice)
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/conversation-events/backoffice-ep`
- **Description:** `Creates a conversation event via backoffice endpoint.`
- **Request Body:** `ConversationEventContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Create Conversation Event (ETL)
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/conversation-events/etl-ep`
- **Description:** `Creates a conversation event via ETL endpoint.`
- **Request Body:** `ConversationEventContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Update Conversation Event (Backoffice)
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/conversation-events/backoffice-ep`
- **Description:** `Updates a conversation event via backoffice endpoint.`
- **Request Body:** `ConversationEventContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Update Conversation Event (ETL)
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/conversation-events/etl-ep`
- **Description:** `Updates a conversation event via ETL endpoint.`
- **Request Body:** `ConversationEventContainer` (JSON)
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Delete Conversation Event by GUID (Backoffice)
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/conversation-events/backoffice-ep/{guid}`
- **Description:** `Deletes a conversation event via backoffice endpoint by GUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `guid` (UUID): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Delete Conversation Event by GUID (ETL)
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/conversation-events/etl-ep/{guid}`
- **Description:** `Deletes a conversation event via ETL endpoint by GUID.`
- **Request Body:** `N/A`
- **Request Parameters:** `guid` (UUID): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get All Conversation Events (Backoffice)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/backoffice-ep`
- **Description:** `Retrieves all conversation events via backoffice endpoint.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get All Conversation Events (ETL)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/etl-ep`
- **Description:** `Retrieves all conversation events via ETL endpoint.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Event by GUID (Backoffice)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/backoffice-ep/{guid}`
- **Description:** `Retrieves a conversation event by GUID via backoffice endpoint.`
- **Request Body:** `N/A`
- **Request Parameters:** `guid` (UUID): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Event by GUID (ETL)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/etl-ep/{guid}`
- **Description:** `Retrieves a conversation event by GUID via ETL endpoint.`
- **Request Body:** `N/A`
- **Request Parameters:** `guid` (UUID): The unique identifier. `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Events by Criteria (Backoffice)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/backoffice-ep/query`
- **Description:** `Retrieves conversation events based on criteria via backoffice endpoint.`
- **Request Body:** `N/A`
- **Request Parameters:** `ConversationEventQueryCriteria` parameters, `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Get Conversation Events by Criteria (ETL)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/etl-ep/query`
- **Description:** `Retrieves conversation events based on criteria via ETL endpoint.`
- **Request Body:** `N/A`
- **Request Parameters:** `ConversationEventQueryCriteria` parameters, `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Export Conversation Event Data to CSV (Backoffice)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/backoffice-ep/export/csv`
- **Description:** `Exports conversation event data to CSV via backoffice endpoint.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`

## Export Conversation Event Data to CSV (ETL)
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/conversation-events/etl-ep/export/csv`
- **Description:** `Exports conversation event data to CSV via ETL endpoint.`
- **Request Body:** `N/A`
- **Request Parameters:** `HttpServletRequest` parameters
- **Response:** `Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.`
