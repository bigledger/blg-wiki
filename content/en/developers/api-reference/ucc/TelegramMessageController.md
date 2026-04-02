# TelegramMessageController APIs

## setWebhookUrl
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/telegram-api/{tenantCode}/{telegramId}/set-webhook`
- **Description:** Sets the webhook URL for a Telegram bot.
- **Request Body:** N/A
- **Request Parameters:** `tenantCode` (String): The tenant code., `telegramId` (String): The Telegram bot ID.
- **Response:** `String` (Webhook URL setup result)

## receiveMessage
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/telegram-api/{tenantCode}/{botId}/receive`
- **Description:** Receives messages from Telegram.
- **Request Body:** JSON payload (unknown structure)
- **Request Parameters:** `request` (HttpServletRequest): The raw HTTP request., `tenantCode` (String): The tenant code., `botId` (String): The bot ID.
- **Response:** `ResponseEntity<String>` (Returns "Received message from telegram" on success, processes asynchronously)

## sendMessage
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/telegram-api/send`
- **Description:** Sends a message to Telegram.
- **Request Body:** `MessageContainer` (JSON)
- **Request Parameters:** `request` (HttpServletRequest): The raw HTTP request.
- **Response:** Streaming response body, typically JSON with relevant data. Possible responses: 200 OK, 400 Bad Request, 401 Unauthorized, 404 Not Found.

## sendTelegramMedia
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/telegram-api/send/media`
- **Description:** Sends media messages to Telegram.
- **Request Body:** `data` (JSON payload as String), `media` (MultipartFile)
- **Request Parameters:** `tenantCode` (String): The tenant code from request header., `data` (String): JSON payload., `media` (MultipartFile): Optional media file., `request` (HttpServletRequest): The raw HTTP request.
- **Response:** `ResponseEntity<String>` (Returns "Media sent successfully" or "No Attachment File")

## sendExternalMessage
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/telegram-api/send-external`
- **Description:** Sends an external message to Telegram.
- **Request Body:** `body` (Map<String,Object> (JSON))
- **Request Parameters:** `request` (HttpServletRequest): The raw HTTP request.
- **Response:** `ResponseEntity<String>` (Returns "Message sent to telegram")