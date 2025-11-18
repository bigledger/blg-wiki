---
title: "Code Examples"
description: "Implementation examples in JavaScript, Python, PHP, C#, and Java for common membership operations"
weight: 4
---

This section provides practical code examples demonstrating how to integrate with the Membership API across popular programming languages. Examples cover common scenarios including member creation, points operations, and error handling.

## JavaScript / Node.js Examples

### Setup and Authentication

```javascript
// Install axios: npm install axios
const axios = require('axios');

class MembershipAPI {
  constructor(apiKey, baseURL = 'https://datahub.bigledger.com/api/v1/membership') {
    this.apiKey = apiKey;
    this.baseURL = baseURL;
    this.client = axios.create({
      baseURL: this.baseURL,
      headers: {
        'X-API-Key': this.apiKey,
        'Content-Type': 'application/json'
      }
    });
  }

  // Error handling wrapper
  async request(method, endpoint, data = null) {
    try {
      const config = { method, url: endpoint };
      if (data) config.data = data;

      const response = await this.client(config);
      return response.data;
    } catch (error) {
      if (error.response) {
        throw new Error(`API Error: ${error.response.data.error.message}`);
      }
      throw error;
    }
  }
}

// Initialize API client
const api = new MembershipAPI(process.env.BIGLEDGER_API_KEY);
```

### Create New Member

```javascript
async function createMember() {
  const memberData = {
    firstName: 'Jennifer',
    lastName: 'Wong',
    email: 'jennifer.wong@example.com',
    phone: '+60187654321',
    birthDate: '1992-07-14',
    address: {
      street: '45 Jalan Ampang',
      city: 'Kuala Lumpur',
      state: 'Wilayah Persekutuan',
      postalCode: '50450',
      country: 'Malaysia'
    },
    preferences: {
      language: 'en',
      emailOptIn: true,
      smsOptIn: true
    }
  };

  try {
    const result = await api.request('POST', '/members', memberData);
    console.log('Member created:', result.data.memberId);
    return result.data;
  } catch (error) {
    console.error('Failed to create member:', error.message);
    throw error;
  }
}
```

### Get Member Details

```javascript
async function getMemberDetails(memberId) {
  try {
    const result = await api.request('GET', `/members/${memberId}`);
    return result.data;
  } catch (error) {
    console.error(`Failed to retrieve member ${memberId}:`, error.message);
    throw error;
  }
}
```

### Award Points

```javascript
async function awardPoints(memberId, points, transactionId) {
  const pointsData = {
    memberId: memberId,
    points: points,
    reason: 'Purchase transaction',
    referenceId: transactionId,
    metadata: {
      transactionAmount: points * 2, // Assuming 1 point per 2 MYR
      location: 'Store-KL-Central',
      earnRate: 0.5
    }
  };

  try {
    const result = await api.request('POST', '/points/earn', pointsData);
    console.log(`Awarded ${points} points to ${memberId}`);
    console.log(`New balance: ${result.data.newBalance}`);
    return result.data;
  } catch (error) {
    console.error('Failed to award points:', error.message);
    throw error;
  }
}
```

### Check Points Balance

```javascript
async function checkBalance(memberId) {
  try {
    const result = await api.request('GET', `/points/balance/${memberId}`);
    console.log(`Member ${memberId} has ${result.data.currentPoints} points`);

    if (result.data.expiringPoints > 0) {
      console.log(`Warning: ${result.data.expiringPoints} points expiring on ${result.data.nextExpirationDate}`);
    }

    return result.data;
  } catch (error) {
    console.error('Failed to check balance:', error.message);
    throw error;
  }
}
```

### Redeem Points

```javascript
async function redeemPoints(memberId, points, rewardId) {
  const redemptionData = {
    memberId: memberId,
    points: points,
    rewardId: rewardId,
    reason: 'Reward redemption',
    referenceId: `RED-${Date.now()}`
  };

  try {
    const result = await api.request('POST', '/points/redeem', redemptionData);
    console.log('Redemption successful');
    console.log(`Voucher code: ${result.data.voucherCode}`);
    return result.data;
  } catch (error) {
    if (error.message.includes('INSUFFICIENT_POINTS')) {
      console.error('Member does not have enough points');
    }
    throw error;
  }
}
```

### Complete Checkout Flow

```javascript
async function processCheckout(memberId, purchaseAmount, transactionId) {
  try {
    // 1. Get member details to verify status
    const member = await getMemberDetails(memberId);

    if (member.status !== 'active') {
      throw new Error('Member account is not active');
    }

    // 2. Calculate points to award
    const earnRate = 0.5; // 1 point per 2 MYR
    const tierMultiplier = member.tier === 'GOLD' ? 1.5 : 1.0;
    const pointsToAward = Math.floor(purchaseAmount * earnRate * tierMultiplier);

    // 3. Award points
    const pointsResult = await awardPoints(memberId, pointsToAward, transactionId);

    console.log('Checkout completed successfully');
    console.log(`Purchase: RM${purchaseAmount}`);
    console.log(`Points earned: ${pointsToAward}`);
    console.log(`New balance: ${pointsResult.newBalance}`);

    return {
      success: true,
      pointsEarned: pointsToAward,
      newBalance: pointsResult.newBalance
    };
  } catch (error) {
    console.error('Checkout failed:', error.message);
    return {
      success: false,
      error: error.message
    };
  }
}
```

## Python Examples

### Setup and Authentication

```python
import requests
import os
from typing import Dict, Any, Optional

class MembershipAPI:
    def __init__(self, api_key: str, base_url: str = 'https://datahub.bigledger.com/api/v1/membership'):
        self.api_key = api_key
        self.base_url = base_url
        self.headers = {
            'X-API-Key': api_key,
            'Content-Type': 'application/json'
        }

    def request(self, method: str, endpoint: str, data: Optional[Dict] = None) -> Dict[str, Any]:
        url = f"{self.base_url}{endpoint}"

        try:
            response = requests.request(method, url, headers=self.headers, json=data)
            response.raise_for_status()
            return response.json()
        except requests.exceptions.HTTPError as e:
            error_data = e.response.json()
            raise Exception(f"API Error: {error_data['error']['message']}")
        except requests.exceptions.RequestException as e:
            raise Exception(f"Request failed: {str(e)}")

# Initialize API client
api = MembershipAPI(os.environ.get('BIGLEDGER_API_KEY'))
```

### Create New Member

```python
def create_member(first_name: str, last_name: str, email: str, phone: str) -> Dict[str, Any]:
    member_data = {
        'firstName': first_name,
        'lastName': last_name,
        'email': email,
        'phone': phone,
        'preferences': {
            'language': 'en',
            'emailOptIn': True,
            'smsOptIn': True
        }
    }

    try:
        result = api.request('POST', '/members', member_data)
        print(f"Member created: {result['data']['memberId']}")
        return result['data']
    except Exception as e:
        print(f"Failed to create member: {str(e)}")
        raise
```

### Award Points with Validation

```python
def award_points_safe(member_id: str, points: int, transaction_id: str) -> Dict[str, Any]:
    # Validate inputs
    if points <= 0:
        raise ValueError("Points must be positive")

    if points > 10000:
        raise ValueError("Points exceed maximum allowed per transaction")

    points_data = {
        'memberId': member_id,
        'points': points,
        'reason': 'Purchase transaction',
        'referenceId': transaction_id,
        'metadata': {
            'transactionAmount': points * 2,
            'earnRate': 0.5
        }
    }

    try:
        result = api.request('POST', '/points/earn', points_data)
        print(f"Awarded {points} points to {member_id}")
        print(f"New balance: {result['data']['newBalance']}")
        return result['data']
    except Exception as e:
        print(f"Failed to award points: {str(e)}")
        raise
```

### Get Transaction History

```python
def get_transaction_history(member_id: str, limit: int = 50) -> list:
    try:
        result = api.request('GET', f'/points/transactions/{member_id}?limit={limit}')
        transactions = result['data']

        print(f"Retrieved {len(transactions)} transactions for {member_id}")

        for txn in transactions:
            print(f"{txn['processedAt']}: {txn['type']} {txn['points']} points - {txn['reason']}")

        return transactions
    except Exception as e:
        print(f"Failed to retrieve transactions: {str(e)}")
        raise
```

### Batch Operations

```python
def process_batch_points(transactions: list) -> Dict[str, Any]:
    """Process multiple points transactions in batch"""
    results = {
        'successful': [],
        'failed': []
    }

    for txn in transactions:
        try:
            result = award_points_safe(
                txn['memberId'],
                txn['points'],
                txn['transactionId']
            )
            results['successful'].append({
                'memberId': txn['memberId'],
                'transactionId': txn['transactionId'],
                'newBalance': result['newBalance']
            })
        except Exception as e:
            results['failed'].append({
                'memberId': txn['memberId'],
                'transactionId': txn['transactionId'],
                'error': str(e)
            })

    print(f"Batch processing completed: {len(results['successful'])} successful, {len(results['failed'])} failed")
    return results
```

## PHP Examples

### Setup and Authentication

```php
<?php

class MembershipAPI {
    private $apiKey;
    private $baseURL;

    public function __construct($apiKey, $baseURL = 'https://datahub.bigledger.com/api/v1/membership') {
        $this->apiKey = $apiKey;
        $this->baseURL = $baseURL;
    }

    public function request($method, $endpoint, $data = null) {
        $url = $this->baseURL . $endpoint;

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'X-API-Key: ' . $this->apiKey,
            'Content-Type: application/json'
        ]);

        if ($data !== null) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        }

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        $result = json_decode($response, true);

        if ($httpCode >= 400) {
            throw new Exception('API Error: ' . $result['error']['message']);
        }

        return $result;
    }
}

// Initialize API client
$api = new MembershipAPI(getenv('BIGLEDGER_API_KEY'));
?>
```

### Create Member and Award Welcome Points

```php
<?php

function createMemberWithWelcomeBonus($firstName, $lastName, $email, $phone) {
    global $api;

    $memberData = [
        'firstName' => $firstName,
        'lastName' => $lastName,
        'email' => $email,
        'phone' => $phone,
        'preferences' => [
            'language' => 'en',
            'emailOptIn' => true,
            'smsOptIn' => true
        ]
    ];

    try {
        // Create member
        $result = $api->request('POST', '/members', $memberData);
        $memberId = $result['data']['memberId'];

        echo "Member created: $memberId\n";

        // Award welcome bonus
        $bonusData = [
            'memberId' => $memberId,
            'points' => 100,
            'reason' => 'Welcome bonus',
            'referenceId' => 'WELCOME-' . time()
        ];

        $bonusResult = $api->request('POST', '/points/earn', $bonusData);
        echo "Welcome bonus awarded: 100 points\n";

        return [
            'member' => $result['data'],
            'welcomeBonus' => $bonusResult['data']
        ];
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage() . "\n";
        throw $e;
    }
}

?>
```

### Points Redemption with Validation

```php
<?php

function redeemPointsWithCheck($memberId, $points, $rewardId) {
    global $api;

    try {
        // Check current balance
        $balanceResult = $api->request('GET', "/points/balance/$memberId");
        $currentPoints = $balanceResult['data']['currentPoints'];

        if ($currentPoints < $points) {
            throw new Exception("Insufficient points. Required: $points, Available: $currentPoints");
        }

        // Process redemption
        $redemptionData = [
            'memberId' => $memberId,
            'points' => $points,
            'rewardId' => $rewardId,
            'reason' => 'Reward redemption',
            'referenceId' => 'RED-' . time()
        ];

        $result = $api->request('POST', '/points/redeem', $redemptionData);

        echo "Redemption successful\n";
        echo "Voucher code: " . $result['data']['voucherCode'] . "\n";
        echo "New balance: " . $result['data']['newBalance'] . "\n";

        return $result['data'];
    } catch (Exception $e) {
        echo "Redemption failed: " . $e->getMessage() . "\n";
        throw $e;
    }
}

?>
```

## C# Examples

### Setup and Authentication

```csharp
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

public class MembershipAPI
{
    private readonly HttpClient _httpClient;
    private readonly string _baseURL;

    public MembershipAPI(string apiKey, string baseURL = "https://datahub.bigledger.com/api/v1/membership")
    {
        _baseURL = baseURL;
        _httpClient = new HttpClient();
        _httpClient.DefaultRequestHeaders.Add("X-API-Key", apiKey);
        _httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
    }

    public async Task<T> RequestAsync<T>(string method, string endpoint, object data = null)
    {
        var url = $"{_baseURL}{endpoint}";
        HttpResponseMessage response;

        if (method == "GET")
        {
            response = await _httpClient.GetAsync(url);
        }
        else if (method == "POST")
        {
            var json = JsonSerializer.Serialize(data);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            response = await _httpClient.PostAsync(url, content);
        }
        else
        {
            throw new ArgumentException($"Unsupported method: {method}");
        }

        var responseContent = await response.Content.ReadAsStringAsync();

        if (!response.IsSuccessStatusCode)
        {
            throw new Exception($"API Error: {responseContent}");
        }

        return JsonSerializer.Deserialize<T>(responseContent);
    }
}
```

### Create Member

```csharp
public class MemberData
{
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string email { get; set; }
    public string phone { get; set; }
    public MemberPreferences preferences { get; set; }
}

public class MemberPreferences
{
    public string language { get; set; }
    public bool emailOptIn { get; set; }
    public bool smsOptIn { get; set; }
}

public async Task<dynamic> CreateMemberAsync(string firstName, string lastName, string email, string phone)
{
    var api = new MembershipAPI(Environment.GetEnvironmentVariable("BIGLEDGER_API_KEY"));

    var memberData = new MemberData
    {
        firstName = firstName,
        lastName = lastName,
        email = email,
        phone = phone,
        preferences = new MemberPreferences
        {
            language = "en",
            emailOptIn = true,
            smsOptIn = true
        }
    };

    try
    {
        var result = await api.RequestAsync<dynamic>("POST", "/members", memberData);
        Console.WriteLine($"Member created: {result.data.memberId}");
        return result.data;
    }
    catch (Exception e)
    {
        Console.WriteLine($"Failed to create member: {e.Message}");
        throw;
    }
}
```

### Award Points

```csharp
public class PointsData
{
    public string memberId { get; set; }
    public int points { get; set; }
    public string reason { get; set; }
    public string referenceId { get; set; }
}

public async Task<dynamic> AwardPointsAsync(string memberId, int points, string transactionId)
{
    var api = new MembershipAPI(Environment.GetEnvironmentVariable("BIGLEDGER_API_KEY"));

    var pointsData = new PointsData
    {
        memberId = memberId,
        points = points,
        reason = "Purchase transaction",
        referenceId = transactionId
    };

    try
    {
        var result = await api.RequestAsync<dynamic>("POST", "/points/earn", pointsData);
        Console.WriteLine($"Awarded {points} points to {memberId}");
        Console.WriteLine($"New balance: {result.data.newBalance}");
        return result.data;
    }
    catch (Exception e)
    {
        Console.WriteLine($"Failed to award points: {e.Message}");
        throw;
    }
}
```

## Java Examples

### Setup and Authentication

```java
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.URI;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class MembershipAPI {
    private final String apiKey;
    private final String baseURL;
    private final HttpClient httpClient;
    private final Gson gson;

    public MembershipAPI(String apiKey, String baseURL) {
        this.apiKey = apiKey;
        this.baseURL = baseURL != null ? baseURL : "https://datahub.bigledger.com/api/v1/membership";
        this.httpClient = HttpClient.newHttpClient();
        this.gson = new Gson();
    }

    public JsonObject request(String method, String endpoint, Object data) throws Exception {
        String url = baseURL + endpoint;

        HttpRequest.Builder builder = HttpRequest.newBuilder()
            .uri(URI.create(url))
            .header("X-API-Key", apiKey)
            .header("Content-Type", "application/json");

        if (method.equals("GET")) {
            builder.GET();
        } else if (method.equals("POST")) {
            String json = gson.toJson(data);
            builder.POST(HttpRequest.BodyPublishers.ofString(json));
        }

        HttpRequest request = builder.build();
        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() >= 400) {
            throw new Exception("API Error: " + response.body());
        }

        return gson.fromJson(response.body(), JsonObject.class);
    }
}
```

### Create Member and Check Balance

```java
public class MemberOperations {
    private MembershipAPI api;

    public MemberOperations(String apiKey) {
        this.api = new MembershipAPI(apiKey, null);
    }

    public String createMember(String firstName, String lastName, String email, String phone) throws Exception {
        JsonObject memberData = new JsonObject();
        memberData.addProperty("firstName", firstName);
        memberData.addProperty("lastName", lastName);
        memberData.addProperty("email", email);
        memberData.addProperty("phone", phone);

        JsonObject preferences = new JsonObject();
        preferences.addProperty("language", "en");
        preferences.addProperty("emailOptIn", true);
        preferences.addProperty("smsOptIn", true);
        memberData.add("preferences", preferences);

        JsonObject result = api.request("POST", "/members", memberData);
        String memberId = result.getAsJsonObject("data").get("memberId").getAsString();

        System.out.println("Member created: " + memberId);
        return memberId;
    }

    public int checkBalance(String memberId) throws Exception {
        JsonObject result = api.request("GET", "/points/balance/" + memberId, null);
        int currentPoints = result.getAsJsonObject("data").get("currentPoints").getAsInt();

        System.out.println("Member " + memberId + " has " + currentPoints + " points");
        return currentPoints;
    }
}
```

## Error Handling Best Practices

### Comprehensive Error Handling (JavaScript)

```javascript
async function robustPointsOperation(memberId, points) {
  const MAX_RETRIES = 3;
  const RETRY_DELAY = 1000; // 1 second

  for (let attempt = 1; attempt <= MAX_RETRIES; attempt++) {
    try {
      return await api.request('POST', '/points/earn', {
        memberId: memberId,
        points: points,
        reason: 'Purchase transaction',
        referenceId: `TXN-${Date.now()}`
      });
    } catch (error) {
      console.error(`Attempt ${attempt} failed:`, error.message);

      // Don't retry validation errors
      if (error.message.includes('VALIDATION_ERROR')) {
        throw error;
      }

      // Don't retry if member not found
      if (error.message.includes('MEMBER_NOT_FOUND')) {
        throw error;
      }

      // Retry on network errors or rate limiting
      if (attempt < MAX_RETRIES) {
        await new Promise(resolve => setTimeout(resolve, RETRY_DELAY * attempt));
        continue;
      }

      throw error;
    }
  }
}
```

These code examples demonstrate best practices for integrating with the Membership API across multiple programming languages, providing a solid foundation for building robust membership integrations.
