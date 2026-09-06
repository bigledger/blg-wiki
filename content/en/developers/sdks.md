---
description: Official SDKs and libraries for popular programming languages.
tags:
- user-guide
title: SDKs & Libraries
weight: 35
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Official SDKs and libraries for popular programming languages. Build integrations faster with type-safe, well-documented libraries that handle authentication, rate limiting, and error handling automatically.

## Available SDKs

{{< cards >}}
{{< card link="#javascript-typescript" title="JavaScript/TypeScript" icon="code" subtitle="Official Node.js and browser SDK with full TypeScript support" >}}

{{< card link="#python" title="Python" icon="code" subtitle="Python SDK with async/await support and Pydantic models" >}}

{{< card link="#php" title="PHP" icon="code" subtitle="PHP SDK with PSR-4 autoloading and comprehensive error handling" >}}

{{< card link="#java" title="Java" icon="code" subtitle="Java SDK with Jackson serialization and OkHttp client" >}}

{{< card link="#net" title=".NET" icon="code" subtitle=".NET SDK supporting .NET Core, .NET Framework, and .NET 5+" >}}

{{< card link="#go" title="Go" icon="code" subtitle="Go SDK with context support and structured error handling" >}}
{{< /cards >}}

## JavaScript/TypeScript SDK

The official JavaScript/TypeScript SDK provides full type safety and works in both Node.js and browser environments.

### Installation

```bash
# npm
npm install @bigledger/sdk

# yarn
yarn add @bigledger/sdk

# pnpm
pnpm add @bigledger/sdk
```

### Quick Start

```typescript
import { BigLedgerClient } from '@bigledger/sdk';

const client = new BigLedgerClient({
  apiKey: process.env.BIGLEDGER_API_KEY!,
  companyId: process.env.BIGLEDGER_COMPANY_ID!,
  environment: 'production' // or 'sandbox'
});

// Create a customer
const customer = await client.customers.create({
  name: 'Acme Corporation',
  email: 'billing@acme.com',
  phone: '+60123456789'
});

// Create an invoice
const invoice = await client.invoices.create({
  customerId: customer.id,
  invoiceDate: new Date(),
  dueDate: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000),
  items: [
    {
      description: 'Professional Services',
      quantity: 10,
      unitPrice: 100.00,
      taxCode: 'SST'
    }
  ]
});

console.log(`Invoice ${invoice.invoiceNumber} created for ${customer.name}`);
```

### Configuration Options

```typescript
interface BigLedgerConfig {
  apiKey: string;
  companyId: string;
  environment?: 'production' | 'sandbox';
  baseUrl?: string;
  timeout?: number;
  retries?: number;
  rateLimitStrategy?: 'throw' | 'wait' | 'retry';
}

const client = new BigLedgerClient({
  apiKey: 'blg_live_sk_1234567890abcdef',
  companyId: 'company_abc123',
  environment: 'production',
  timeout: 30000, // 30 seconds
  retries: 3,
  rateLimitStrategy: 'wait'
});
```

### TypeScript Types

```typescript
// All API responses are fully typed
interface Customer {
  id: string;
  customerNumber: string;
  name: string;
  email?: string;
  phone?: string;
  address?: Address;
  currency: string;
  paymentTerms: number;
  creditLimit: number;
  currentBalance: number;
  totalSales: number;
  status: 'active' | 'inactive' | 'blocked';
  createdAt: Date;
  updatedAt: Date;
}

interface Invoice {
  id: string;
  invoiceNumber: string;
  customerId: string;
  customer?: Customer;
  invoiceDate: Date;
  dueDate: Date;
  status: 'draft' | 'sent' | 'paid' | 'overdue' | 'cancelled';
  currency: string;
  items: InvoiceItem[];
  subtotal: number;
  totalTax: number;
  total: number;
  amountPaid: number;
  amountDue: number;
  createdAt: Date;
  updatedAt: Date;
}
```

### Advanced Usage

```typescript
// Error handling
try {
  const invoice = await client.invoices.get('inv_invalid');
} catch (error) {
  if (error instanceof BigLedgerError) {
    console.error('API Error:', error.code, error.message);
    if (error.validationErrors) {
      console.error('Validation errors:', error.validationErrors);
    }
  }
}

// Pagination
const customers = await client.customers.list({
  limit: 50,
  cursor: 'eyJpZCI6MTIzfQ'
});

console.log(`Found ${customers.data.length} customers`);
if (customers.pagination.hasMore) {
  const nextPage = await client.customers.list({
    limit: 50,
    cursor: customers.pagination.nextCursor
  });
}

// Webhooks
const webhook = await client.webhooks.create({
  url: 'https://your-app.com/webhooks/bigledger',
  events: ['invoice.created', 'invoice.paid'],
  secret: 'your-webhook-secret'
});

// E-invoices
const einvoice = await client.einvoice.create({
  invoiceId: invoice.id,
  format: 'PEPPOL_UBL',
  autoSubmit: true
});

console.log(`E-invoice status: ${einvoice.status}`);
```

### React Hooks (Optional Package)

```bash
npm install @bigledger/react-hooks
```

```tsx
import { useBigLedger, useInvoices, useCustomers } from '@bigledger/react-hooks';

function InvoiceList() {
  const { data: invoices, loading, error } = useInvoices({
    status: 'draft',
    limit: 10
  });

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;

  return (
    <ul>
      {invoices?.map(invoice => (
        <li key={invoice.id}>
          {invoice.invoiceNumber} - {invoice.customer?.name}
        </li>
      ))}
    </ul>
  );
}

function App() {
  return (
    <BigLedgerProvider config={{
      apiKey: process.env.REACT_APP_BIGLEDGER_API_KEY!,
      companyId: process.env.REACT_APP_BIGLEDGER_COMPANY_ID!
    }}>
      <InvoiceList />
    </BigLedgerProvider>
  );
}
```

## Python SDK

Pythonic SDK with async/await support and Pydantic models for data validation.

### Installation

```bash
pip install bigledger-sdk

# For async support
pip install bigledger-sdk[async]
```

### Quick Start

```python
from bigledger import BigLedgerClient
import asyncio
from datetime import datetime, timedelta

# Synchronous client
client = BigLedgerClient(
    api_key='blg_live_sk_1234567890abcdef',
    company_id='company_abc123'
)

# Create a customer
customer = client.customers.create({
    'name': 'Acme Corporation',
    'email': 'billing@acme.com',
    'phone': '+60123456789'
})

# Create an invoice
invoice = client.invoices.create({
    'customer_id': customer['id'],
    'invoice_date': datetime.now().date(),
    'due_date': (datetime.now() + timedelta(days=30)).date(),
    'items': [
        {
            'description': 'Professional Services',
            'quantity': 10,
            'unit_price': 100.00,
            'tax_code': 'SST'
        }
    ]
})

print(f"Invoice {invoice['invoice_number']} created for {customer['name']}")
```

### Async Usage

```python
import asyncio
from bigledger import AsyncBigLedgerClient

async def main():
    client = AsyncBigLedgerClient(
        api_key='blg_live_sk_1234567890abcdef',
        company_id='company_abc123'
    )
    
    # Create customer and invoice concurrently
    customer_task = client.customers.create({
        'name': 'Async Customer',
        'email': 'async@example.com'
    })
    
    # Get existing customers while creating new one
    customers_task = client.customers.list(limit=10)
    
    customer, customers = await asyncio.gather(customer_task, customers_task)
    
    print(f"Created customer: {customer['name']}")
    print(f"Total customers: {len(customers['data'])}")
    
    await client.close()

asyncio.run(main())
```

### Configuration

```python
from bigledger import BigLedgerClient, Config

config = Config(
    api_key='blg_live_sk_1234567890abcdef',
    company_id='company_abc123',
    environment='production',  # or 'sandbox'
    timeout=30,
    max_retries=3,
    rate_limit_strategy='wait'  # 'throw', 'wait', or 'retry'
)

client = BigLedgerClient(config=config)
```

### Pydantic Models

```python
from bigledger.models import Customer, Invoice, InvoiceItem
from pydantic import BaseModel
from typing import List, Optional
from datetime import date

# Create type-safe invoice
class CreateInvoiceRequest(BaseModel):
    customer_id: str
    invoice_date: date
    due_date: date
    items: List[InvoiceItem]
    notes: Optional[str] = None

request = CreateInvoiceRequest(
    customer_id='cust_123',
    invoice_date=date.today(),
    due_date=date.today() + timedelta(days=30),
    items=[
        InvoiceItem(
            description='Consulting Services',
            quantity=5,
            unit_price=200.00,
            tax_code='SST'
        )
    ]
)

invoice = client.invoices.create(request.dict())
```

### Error Handling

```python
from bigledger.exceptions import (
    BigLedgerError,
    ValidationError,
    NotFoundError,
    RateLimitError
)

try:
    customer = client.customers.get('invalid_id')
except NotFoundError as e:
    print(f"Customer not found: {e.message}")
except ValidationError as e:
    print(f"Validation failed: {e.validation_errors}")
except RateLimitError as e:
    print(f"Rate limited. Retry after {e.retry_after} seconds")
except BigLedgerError as e:
    print(f"API error: {e.code} - {e.message}")
```

### Django Integration

```python
# settings.py
BIGLEDGER = {
    'API_KEY': os.environ.get('BIGLEDGER_API_KEY'),
    'COMPANY_ID': os.environ.get('BIGLEDGER_COMPANY_ID'),
    'ENVIRONMENT': 'production'
}

# views.py
from django.conf import settings
from bigledger import BigLedgerClient

def create_invoice_view(request):
    client = BigLedgerClient(
        api_key=settings.BIGLEDGER['API_KEY'],
        company_id=settings.BIGLEDGER['COMPANY_ID']
    )
    
    invoice = client.invoices.create({
        'customer_id': request.POST['customer_id'],
        'items': json.loads(request.POST['items'])
    })
    
    return JsonResponse(invoice)
```

## PHP SDK

PSR-4 compliant PHP SDK with comprehensive error handling and Laravel integration.

### Installation

```bash
composer require bigledger/sdk
```

### Quick Start

```php
<?php
require_once 'vendor/autoload.php';

use BigLedger\BigLedgerClient;
use BigLedger\Config;

$config = new Config([
    'api_key' => 'blg_live_sk_1234567890abcdef',
    'company_id' => 'company_abc123',
    'environment' => 'production'
]);

$client = new BigLedgerClient($config);

// Create a customer
$customer = $client->customers->create([
    'name' => 'Acme Corporation',
    'email' => 'billing@acme.com',
    'phone' => '+60123456789'
]);

// Create an invoice
$invoice = $client->invoices->create([
    'customer_id' => $customer['id'],
    'invoice_date' => date('Y-m-d'),
    'due_date' => date('Y-m-d', strtotime('+30 days')),
    'items' => [
        [
            'description' => 'Professional Services',
            'quantity' => 10,
            'unit_price' => 100.00,
            'tax_code' => 'SST'
        ]
    ]
]);

echo "Invoice {$invoice['invoice_number']} created for {$customer['name']}\n";
?>
```

### Laravel Integration

```bash
# Laravel package
composer require bigledger/laravel-sdk
```

```php
// config/bigledger.php
return [
    'api_key' => env('BIGLEDGER_API_KEY'),
    'company_id' => env('BIGLEDGER_COMPANY_ID'),
    'environment' => env('BIGLEDGER_ENVIRONMENT', 'production'),
];

// Service Provider automatically registered

// Controller usage
<?php
namespace App\Http\Controllers;

use BigLedger\Facades\BigLedger;

class InvoiceController extends Controller
{
    public function store(Request $request)
    {
        $invoice = BigLedger::invoices()->create([
            'customer_id' => $request->customer_id,
            'items' => $request->items
        ]);
        
        return response()->json($invoice);
    }
}
?>
```

### Error Handling

```php
<?php
use BigLedger\Exceptions\BigLedgerException;
use BigLedger\Exceptions\ValidationException;
use BigLedger\Exceptions\NotFoundException;

try {
    $customer = $client->customers->get('invalid_id');
} catch (NotFoundException $e) {
    echo "Customer not found: " . $e->getMessage();
} catch (ValidationException $e) {
    echo "Validation errors: " . json_encode($e->getValidationErrors());
} catch (BigLedgerException $e) {
    echo "API error: " . $e->getCode() . " - " . $e->getMessage();
}
?>
```

### Webhook Handling

```php
<?php
use BigLedger\Webhook;

// Verify webhook signature
$webhook = new Webhook('your-webhook-secret');

if (!$webhook->verifySignature($_SERVER['HTTP_X_SIGNATURE'], file_get_contents('php://input'))) {
    http_response_code(401);
    exit('Invalid signature');
}

$event = json_decode(file_get_contents('php://input'), true);

switch ($event['event']) {
    case 'invoice.paid':
        handleInvoicePaid($event['data']['object']);
        break;
    case 'payment.received':
        handlePaymentReceived($event['data']['object']);
        break;
}

http_response_code(200);
echo 'OK';
?>
```

## Java SDK

Enterprise-ready Java SDK with Jackson serialization and comprehensive documentation.

### Installation

```xml
<!-- Maven -->
<dependency>
    <groupId>com.bigledger</groupId>
    <artifactId>bigledger-sdk</artifactId>
    <version>1.0.0</version>
</dependency>
```

```gradle
// Gradle
implementation 'com.bigledger:bigledger-sdk:1.0.0'
```

### Quick Start

```java
import com.bigledger.BigLedgerClient;
import com.bigledger.Config;
import com.bigledger.models.Customer;
import com.bigledger.models.Invoice;
import com.bigledger.models.InvoiceItem;

import java.time.LocalDate;
import java.util.Arrays;

public class Example {
    public static void main(String[] args) {
        Config config = Config.builder()
            .apiKey("blg_live_sk_1234567890abcdef")
            .companyId("company_abc123")
            .environment(Environment.PRODUCTION)
            .build();
        
        BigLedgerClient client = new BigLedgerClient(config);
        
        // Create customer
        Customer customer = client.customers().create(
            Customer.builder()
                .name("Acme Corporation")
                .email("billing@acme.com")
                .phone("+60123456789")
                .build()
        );
        
        // Create invoice
        Invoice invoice = client.invoices().create(
            Invoice.builder()
                .customerId(customer.getId())
                .invoiceDate(LocalDate.now())
                .dueDate(LocalDate.now().plusDays(30))
                .items(Arrays.asList(
                    InvoiceItem.builder()
                        .description("Professional Services")
                        .quantity(10)
                        .unitPrice(100.00)
                        .taxCode("SST")
                        .build()
                ))
                .build()
        );
        
        System.out.println("Invoice " + invoice.getInvoiceNumber() + 
                          " created for " + customer.getName());
    }
}
```

### Spring Boot Integration

```java
// Configuration
@Configuration
public class BigLedgerConfig {
    
    @Bean
    public BigLedgerClient bigLedgerClient(
        @Value("${bigledger.api-key}") String apiKey,
        @Value("${bigledger.company-id}") String companyId
    ) {
        return new BigLedgerClient(
            Config.builder()
                .apiKey(apiKey)
                .companyId(companyId)
                .environment(Environment.PRODUCTION)
                .build()
        );
    }
}

// Service
@Service
public class InvoiceService {
    
    private final BigLedgerClient client;
    
    public InvoiceService(BigLedgerClient client) {
        this.client = client;
    }
    
    public Invoice createInvoice(CreateInvoiceRequest request) {
        return client.invoices().create(
            Invoice.builder()
                .customerId(request.getCustomerId())
                .items(request.getItems())
                .build()
        );
    }
}
```

### Async Support

```java
import java.util.concurrent.CompletableFuture;

// Async operations
CompletableFuture<Customer> customerFuture = client.customers().createAsync(customer);
CompletableFuture<List<Invoice>> invoicesFuture = client.invoices().listAsync();

// Combine results
CompletableFuture<Void> combined = CompletableFuture.allOf(
    customerFuture, invoicesFuture
).thenRun(() -> {
    Customer customer = customerFuture.join();
    List<Invoice> invoices = invoicesFuture.join();
    
    System.out.println("Customer: " + customer.getName());
    System.out.println("Total invoices: " + invoices.size());
});
```

## .NET SDK

Cross-platform .NET SDK supporting .NET Core, .NET Framework, and .NET 5+.

### Installation

```bash
# Package Manager
Install-Package BigLedger.SDK

# .NET CLI
dotnet add package BigLedger.SDK
```

### Quick Start

```csharp
using BigLedger;
using BigLedger.Models;

var config = new BigLedgerConfig
{
    ApiKey = "blg_live_sk_1234567890abcdef",
    CompanyId = "company_abc123",
    Environment = BigLedgerEnvironment.Production
};

var client = new BigLedgerClient(config);

// Create customer
var customer = await client.Customers.CreateAsync(new Customer
{
    Name = "Acme Corporation",
    Email = "billing@acme.com",
    Phone = "+60123456789"
});

// Create invoice
var invoice = await client.Invoices.CreateAsync(new Invoice
{
    CustomerId = customer.Id,
    InvoiceDate = DateTime.Now,
    DueDate = DateTime.Now.AddDays(30),
    Items = new List<InvoiceItem>
    {
        new InvoiceItem
        {
            Description = "Professional Services",
            Quantity = 10,
            UnitPrice = 100.00m,
            TaxCode = "SST"
        }
    }
});

Console.WriteLine($"Invoice {invoice.InvoiceNumber} created for {customer.Name}");
```

### ASP.NET Core Integration

```csharp
// Startup.cs or Program.cs
services.AddBigLedger(options =>
{
    options.ApiKey = Configuration["BigLedger:ApiKey"];
    options.CompanyId = Configuration["BigLedger:CompanyId"];
    options.Environment = BigLedgerEnvironment.Production;
});

// Controller
[ApiController]
[Route("api/[controller]")]
public class InvoicesController : ControllerBase
{
    private readonly BigLedgerClient _client;
    
    public InvoicesController(BigLedgerClient client)
    {
        _client = client;
    }
    
    [HttpPost]
    public async Task<IActionResult> CreateInvoice([FromBody] CreateInvoiceRequest request)
    {
        var invoice = await _client.Invoices.CreateAsync(new Invoice
        {
            CustomerId = request.CustomerId,
            Items = request.Items
        });
        
        return Ok(invoice);
    }
}
```

### Error Handling

```csharp
using BigLedger.Exceptions;

try
{
    var customer = await client.Customers.GetAsync("invalid_id");
}
catch (BigLedgerNotFoundException ex)
{
    Console.WriteLine($"Customer not found: {ex.Message}");
}
catch (BigLedgerValidationException ex)
{
    Console.WriteLine($"Validation errors: {string.Join(", ", ex.ValidationErrors)}");
}
catch (BigLedgerException ex)
{
    Console.WriteLine($"API error: {ex.Code} - {ex.Message}");
}
```

## Go SDK

Idiomatic Go SDK with context support and structured error handling.

### Installation

```bash
go get github.com/bigledger/bigledger-go
```

### Quick Start

```go
package main

import (
    "context"
    "fmt"
    "time"
    
    "github.com/bigledger/bigledger-go"
)

func main() {
    client := bigledger.NewClient(&bigledger.Config{
        APIKey:      "blg_live_sk_1234567890abcdef",
        CompanyID:   "company_abc123",
        Environment: bigledger.Production,
    })
    
    ctx := context.Background()
    
    // Create customer
    customer, err := client.Customers.Create(ctx, &bigledger.Customer{
        Name:  "Acme Corporation",
        Email: "billing@acme.com",
        Phone: "+60123456789",
    })
    if err != nil {
        panic(err)
    }
    
    // Create invoice
    invoice, err := client.Invoices.Create(ctx, &bigledger.Invoice{
        CustomerID:  customer.ID,
        InvoiceDate: time.Now(),
        DueDate:     time.Now().AddDate(0, 0, 30),
        Items: []bigledger.InvoiceItem{
            {
                Description: "Professional Services",
                Quantity:    10,
                UnitPrice:   100.00,
                TaxCode:     "SST",
            },
        },
    })
    if err != nil {
        panic(err)
    }
    
    fmt.Printf("Invoice %s created for %s\n", invoice.InvoiceNumber, customer.Name)
}
```

### Context and Cancellation

```go
// Context with timeout
ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
defer cancel()

// Context with cancellation
ctx, cancel := context.WithCancel(context.Background())
go func() {
    time.Sleep(10 * time.Second)
    cancel() // Cancel after 10 seconds
}()

customers, err := client.Customers.List(ctx, &bigledger.ListCustomersParams{
    Limit: 100,
})
if err != nil {
    if ctx.Err() == context.DeadlineExceeded {
        fmt.Println("Request timed out")
    }
    return
}
```

### Error Handling

```go
import "github.com/bigledger/bigledger-go/errors"

customer, err := client.Customers.Get(ctx, "invalid_id")
if err != nil {
    var apiErr *errors.BigLedgerError
    if errors.As(err, &apiErr) {
        switch apiErr.Code {
        case "NOT_FOUND":
            fmt.Println("Customer not found")
        case "VALIDATION_ERROR":
            fmt.Printf("Validation errors: %v\n", apiErr.ValidationErrors)
        default:
            fmt.Printf("API error: %s - %s\n", apiErr.Code, apiErr.Message)
        }
    }
}
```

## Community SDKs

Community-maintained SDKs for additional languages:

- **Ruby**: [bigledger-ruby](https://github.com/bigledger/bigledger-ruby) (community)
- **Rust**: [bigledger-rust](https://github.com/bigledger/bigledger-rust) (community)
- **Swift**: [bigledger-swift](https://github.com/bigledger/bigledger-swift) (community)

## SDK Features Comparison

| Feature | JavaScript | Python | PHP | Java | .NET | Go |
|---------|------------|--------|-----|------|------|-----|
| Type Safety | ✅ (TypeScript) | ✅ (Pydantic) | ❌ | ✅ | ✅ | ✅ |
| Async/Await | ✅ | ✅ | ❌ | ✅ | ✅ | ✅ |
| Rate Limiting | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Retries | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Webhooks | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Framework Integration | React | Django/Flask | Laravel | Spring | ASP.NET | Gin/Echo |
| Testing Helpers | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

## Getting Help

- **Documentation**: Each SDK includes comprehensive documentation
- **Examples**: Complete example projects available in each repository  
- **Issues**: Report issues on the respective GitHub repositories
- **Support**: Email [developers@bigledger.com](mailto:developers@bigledger.com) for SDK support

Choose the SDK that best fits your technology stack and start building your BigLedger integration today!