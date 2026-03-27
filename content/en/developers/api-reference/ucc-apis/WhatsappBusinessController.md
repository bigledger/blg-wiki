# WhatsappBusinessController APIs

## verifyWhatsAppBusinessWebhook
- **HTTP Method:** `GET`
- **Path:** `/core2/alg/cc/whatsapp-api/{tenantCode}/receive`
- **Description:** Verifies the WhatsApp Business webhook.
- **Request Body:** N/A
- **Request Parameters:** `tenantCode` (String): The tenant code., `hub.verify_token` (String): The verification token., `hub.challenge` (String): The challenge string.
- **Response:** `String` (Returns the challenge string if `hub.verify_token` matches, otherwise "Incorrect Verification Token")

## receiveMessage
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/whatsapp-api/{tenantCode}/receive`
- **Description:** Receives messages from WhatsApp Business.
- **Request Body:** JSON payload (unknown structure)
- **Request Parameters:** `request` (HttpServletRequest): The raw HTTP request., `tenantCode` (String): The tenant code.
- **Response:** `ResponseEntity<String>` (Returns "Received message from whatsapp" on success, processes asynchronously)

## sendMessage
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/whatsapp-api/send`
- **Description:** Sends a message to WhatsApp Business.
- **Request Body:** `MessageContainer` (JSON)
- **Request Parameters:** `request` (HttpServletRequest): The raw HTTP request.
- **Response:** `ResponseEntity<String>` (Returns "Message sent to whatsapp" on success, or an error message)

## sendWhatsAppBusinessMedia
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/whatsapp-api/send/media`
- **Description:** Sends media messages to WhatsApp Business.
- **Request Body:** `data` (JSON payload as String), `media` (MultipartFile)
- **Request Parameters:** `tenantCode` (String): The tenant code from request header., `data` (String): JSON payload representing a MessageContainer., `media` (MultipartFile): Optional media file., `request` (HttpServletRequest): The raw HTTP request.
- **Response:** `ResponseEntity<String>` (Returns success message, "No Attachment File" if media is missing, or an error message)

## receiveStatusCallback
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/whatsapp-api/receive/status`
- **Description:** Receives status callbacks from WhatsApp Business.
- **Request Body:** JSON payload (unknown structure)
- **Request Parameters:** `request` (HttpServletRequest): The raw HTTP request., `tenantCode` (String): The tenant code from request header.
- **Response:** `ResponseEntity<String>` (Returns "Received status callback from whatsapp")

## sendExternalMessage
- **HTTP Method:** `POST`
- **Path:** `/core2/alg/cc/whatsapp-api/send-external`
- **Description:** Sends an external message to WhatsApp Business.
- **Request Body:** `body` (Map<String,Object> (JSON))
- **Request Parameters:** `request` (HttpServletRequest): The raw HTTP request.
- **Response:** `ResponseEntity<String>` (Returns "Message sent to whatsapp")