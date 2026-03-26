# LazadaMessageController APIs

## auth
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/lazada-api/auth`
- **Description:** Initiates Lazada authentication and redirects the user.
- **Request Body:** N/A
- **Request Parameters:** `endpoint` (String): The endpoint URL., `tenantCode` (String): The tenant code.
- **Response:** Redirects to Lazada for authentication.

## redirectUri
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/lazada-api/auth/callback`
- **Description:** Processes the Lazada authentication callback and redirects or handles errors.
- **Request Body:** N/A
- **Request Parameters:** `code` (String): The authorization code from Lazada., `payload` (String): The payload containing tenant information.
- **Response:** Handles the authentication callback, may redirect to a default URL on error.

## receive
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/lazada-api/{tenantCode}/receive`
- **Description:** Receives messages from Lazada.
- **Request Body:** JSON payload (unknown structure)
- **Request Parameters:** `tenantCode` (String): The tenant code., `request` (HttpServletRequest): The raw HTTP request.
- **Response:** Returns 200 OK after receiving and processing the message asynchronously.

## sendMessage
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/lazada-api/send`
- **Description:** Sends a message to Lazada.
- **Request Body:** `MessageContainer` (JSON)
- **Request Parameters:** `request` (HttpServletRequest): The raw HTTP request.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## sendLazadaMedia
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/lazada-api/send/media`
- **Description:** Sends media messages to Lazada.
- **Request Body:** `data` (JSON payload as String), `media` (MultipartFile)
- **Request Parameters:** `tenantCode` (String): The tenant code from request header., `data` (String): JSON payload., `media` (MultipartFile): Optional media file., `request` (HttpServletRequest): The raw HTTP request.
- **Response:** Returns success message if media is sent, or error if no attachment file (String).