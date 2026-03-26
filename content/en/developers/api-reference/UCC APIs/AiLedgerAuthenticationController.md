# AiLedger Authentication Controller APIs

## Get AI Ledger Token

- **HTTP Method:** `GET`
- **Path:** `/core2/alg/authentication`
- **Description:** Retrieves an AI Ledger token for authentication.
- **Request Parameters:**
    - `HttpServletRequest req`: Standard servlet request object, likely containing authentication headers or session information.
- **Response:**
    - `ResponseEntity<StreamingResponseBody>`: Returns a streaming response body, typically containing the authentication token or relevant data.
        - **Success (200 OK):** `application/json` with the token data.
        - **Failure (400 Bad Request):** `application/json` with an error message and status code.
