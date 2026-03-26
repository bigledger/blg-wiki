# AgentController APIs

## createAgent
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/agents`
- **Description:** Handles POST requests to create an agent.
- **Request Body:** `AgentContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## updateAgent
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/agents`
- **Description:** Handles PUT requests to update an agent.
- **Request Body:** `AgentContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## deleteAgent
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/agents/{guid}`
- **Description:** Handles DELETE requests to delete an agent by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAllAgent
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents`
- **Description:** Handles GET requests to retrieve all agents.
- **Request Body:** N/A
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAgentByGuid
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/{guid}`
- **Description:** Handles GET requests to retrieve an agent by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAgentByCriteria
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/query`
- **Description:** Handles GET requests to retrieve agents by criteria.
- **Request Body:** N/A
- **Request Parameters:** `criteria` (AgentQueryCriteria), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getExportCsv
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/export/csv`
- **Description:** Handles GET requests to export agent data to CSV.
- **Request Body:** N/A
- **Request Parameters:** `request` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## createAgentBackofficeEP
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/agents/backoffice-ep`
- **Description:** Handles POST requests to create an agent for backoffice.
- **Request Body:** `AgentContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## createAgentEtl
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/agents/etl-ep`
- **Description:** Handles POST requests to create an agent for ETL.
- **Request Body:** `AgentContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## createAgentLoginEntityEP
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/agents/login-entity-ep`
- **Description:** Handles POST requests to create an agent for login entity.
- **Request Body:** `AgentContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## updateAgentBackOfficeEp
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/agents/backoffice-ep`
- **Description:** Handles PUT requests to update an agent for backoffice.
- **Request Body:** `AgentContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## updateAgentEtlEp
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/agents/etl-ep`
- **Description:** Handles PUT requests to update an agent for ETL.
- **Request Body:** `AgentContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## updateAgentLoginEntity
- **HTTP Method:** `PUT`
- **Path:** `/core2/alg/cc/agents/login-entity-ep`
- **Description:** Handles PUT requests to update an agent for login entity.
- **Request Body:** `AgentContainer` (JSON)
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## deleteAgentBackoffice
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/agents/backoffice-ep/{guid}`
- **Description:** Handles DELETE requests to delete an agent for backoffice by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## deleteAgentEtl
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/agents/etl-ep/{guid}`
- **Description:** Handles DELETE requests to delete an agent for ETL by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## deleteAgentLoginEntity
- **HTTP Method:** `DELETE`
- **Path:** `/core2/alg/cc/agents/login-entity-ep/{guid}`
- **Description:** Handles DELETE requests to delete an agent for login entity by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAllAgentBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/backoffice-ep`
- **Description:** Handles GET requests to retrieve all agents for backoffice.
- **Request Body:** N/A
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAllAgentEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/etl-ep`
- **Description:** Handles GET requests to retrieve all agents for ETL.
- **Request Body:** N/A
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAllAgentLoginEntity
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/login-entity-ep`
- **Description:** Handles GET requests to retrieve all agents for login entity.
- **Request Body:** N/A
- **Request Parameters:** `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAgentByGuidBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/backoffice-ep/{guid}`
- **Description:** Handles GET requests to retrieve an agent for backoffice by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAgentByGuidEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/etl-ep/{guid}`
- **Description:** Handles GET requests to retrieve an agent for ETL by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAgentByGuidLoginEntity
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/login-entity-ep/{guid}`
- **Description:** Handles GET requests to retrieve an agent for login entity by GUID.
- **Request Body:** N/A
- **Request Parameters:** `guid` (UUID), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAgentByCriteriaBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/backoffice-ep/query`
- **Description:** Handles GET requests to retrieve agents by criteria for backoffice.
- **Request Body:** N/A
- **Request Parameters:** `criteria` (AgentQueryCriteria), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAgentByCriteriaEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/etl-ep/query`
- **Description:** Handles GET requests to retrieve agents by criteria for ETL.
- **Request Body:** N/A
- **Request Parameters:** `criteria` (AgentQueryCriteria), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getAgentByCriteriaLoginEntity
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/login-entity-ep/query`
- **Description:** Handles GET requests to retrieve agents by criteria for login entity.
- **Request Body:** N/A
- **Request Parameters:** `criteria` (AgentQueryCriteria), `req` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getExportCsvBackoffice
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/backoffice-ep/export/csv`
- **Description:** Handles GET requests to export agent data to CSV for backoffice.
- **Request Body:** N/A
- **Request Parameters:** `request` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getExportCsvEtl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/etl-ep/export/csv`
- **Description:** Handles GET requests to export agent data to CSV for ETL.
- **Request Body:** N/A
- **Request Parameters:** `request` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## getExportCsvLoginEntity
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/agents/login-entity-ep/export/csv`
- **Description:** Handles GET requests to export agent data to CSV for login entity.
- **Request Body:** N/A
- **Request Parameters:** `request` (HttpServletRequest)
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.