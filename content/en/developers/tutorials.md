---
description: Step-by-step tutorials and integration guides for common BigLedger API use cases and scenarios.
tags:
- tutorials
- integration-guides
- best-practices
- examples
title: Tutorials & Integration Guides
weight: 40
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

Comprehensive tutorials and integration guides covering common scenarios, best practices, and real-world implementations with BigLedger APIs.

{{< callout type="info" >}}
**Progressive Learning**: These tutorials are designed to build upon each other. Start with the basics and progress to more advanced integrations as you become familiar with the APIs.
{{< /callout >}}

## Quick Start Tutorials

### Tutorial 1: Your First Integration (15 minutes)

Build a simple invoice management system from scratch. 
Practice makes perfect.

**What you'll learn:**
- API authentication
- Creating customers and invoices
- Basic error handling
- Reading and updating data

**Prerequisites:**
- Basic programming knowledge
- BigLedger account with API access

#### Step 1: Set up your environment

{{< tabs items="JavaScript,Python,PHP" >}}

{{< tab >}}
```bash
mkdir bigledger-tutorial
cd bigledger-tutorial
npm init -y
npm install @bigledger/sdk dotenv
```

Create `.env` file:
```env
BIGLEDGER_API_KEY=blg_live_sk_your_api_key_here
BIGLEDGER_COMPANY_ID=company_your_company_id_here
```
{{< /tab >}}

{{< tab >}}
```bash
mkdir bigledger-tutorial
cd bigledger-tutorial
pip install bigledger-sdk python-dotenv
```

Create `.env` file:
```env
BIGLEDGER_API_KEY=blg_live_sk_your_api_key_here
BIGLEDGER_COMPANY_ID=company_your_company_id_here
```
{{< /tab >}}

{{< tab >}}
```bash
mkdir bigledger-tutorial
cd bigledger-tutorial
composer init
composer require bigledger/sdk vlucas/phpdotenv
```

Create `.env` file:
```env
BIGLEDGER_API_KEY=blg_live_sk_your_api_key_here
BIGLEDGER_COMPANY_ID=company_your_company_id_here
```
{{< /tab >}}

{{< /tabs >}}

#### Step 2: Create your first customer

{{< tabs items="JavaScript,Python,PHP" >}}

{{< tab >}}
```javascript
// tutorial.js
require('dotenv').config();
const { BigLedgerClient } = require('@bigledger/sdk');

async function main() {
  // Initialize client
  const client = new BigLedgerClient({
    apiKey: process.env.BIGLEDGER_API_KEY,
    companyId: process.env.BIGLEDGER_COMPANY_ID,
    environment: 'sandbox' // Start with sandbox
  });

  try {
    // Create a customer
    const customer = await client.customers.create({
      name: 'Tutorial Customer',
      email: 'tutorial@example.com',
      phone: '+60123456789',
      address: {
        street: '123 Tutorial Street',
        city: 'Kuala Lumpur',
        state: 'Selangor',
        postalCode: '50000',
        country: 'MY'
      },
      paymentTerms: 30,
      creditLimit: 10000.00
    });

    console.log('✅ Customer created successfully!');
    console.log(`Customer ID: ${customer.id}`);
    console.log(`Customer Number: ${customer.customerNumber}`);
    
    return customer;
  } catch (error) {
    console.error('❌ Error creating customer:', error.message);
    if (error.validationErrors) {
      console.error('Validation errors:', error.validationErrors);
    }
    throw error;
  }
}

main().catch(console.error);
```
{{< /tab >}}

{{< tab >}}
```python
# tutorial.py
import os
from dotenv import load_dotenv
from bigledger import BigLedgerClient

load_dotenv()

def main():
    # Initialize client
    client = BigLedgerClient(
        api_key=os.environ['BIGLEDGER_API_KEY'],
        company_id=os.environ['BIGLEDGER_COMPANY_ID'],
        environment='sandbox'  # Start with sandbox
    )
    
    try:
        # Create a customer
        customer = client.customers.create({
            'name': 'Tutorial Customer',
            'email': 'tutorial@example.com',
            'phone': '+60123456789',
            'address': {
                'street': '123 Tutorial Street',
                'city': 'Kuala Lumpur',
                'state': 'Selangor',
                'postal_code': '50000',
                'country': 'MY'
            },
            'payment_terms': 30,
            'credit_limit': 10000.00
        })
        
        print('✅ Customer created successfully!')
        print(f"Customer ID: {customer['id']}")
        print(f"Customer Number: {customer['customer_number']}")
        
        return customer
    except Exception as error:
        print(f'❌ Error creating customer: {error}')
        raise error

if __name__ == '__main__':
    main()
```
{{< /tab >}}

{{< tab >}}
```php
<?php
// tutorial.php
require_once 'vendor/autoload.php';

use BigLedger\BigLedgerClient;
use BigLedger\Config;
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

function main() {
    // Initialize client
    $config = new Config([
        'api_key' => $_ENV['BIGLEDGER_API_KEY'],
        'company_id' => $_ENV['BIGLEDGER_COMPANY_ID'],
        'environment' => 'sandbox' // Start with sandbox
    ]);
    
    $client = new BigLedgerClient($config);
    
    try {
        // Create a customer
        $customer = $client->customers->create([
            'name' => 'Tutorial Customer',
            'email' => 'tutorial@example.com',
            'phone' => '+60123456789',
            'address' => [
                'street' => '123 Tutorial Street',
                'city' => 'Kuala Lumpur',
                'state' => 'Selangor',
                'postal_code' => '50000',
                'country' => 'MY'
            ],
            'payment_terms' => 30,
            'credit_limit' => 10000.00
        ]);
        
        echo "✅ Customer created successfully!\n";
        echo "Customer ID: " . $customer['id'] . "\n";
        echo "Customer Number: " . $customer['customer_number'] . "\n";
        
        return $customer;
    } catch (Exception $error) {
        echo "❌ Error creating customer: " . $error->getMessage() . "\n";
        throw $error;
    }
}

main();
?>
```
{{< /tab >}}

{{< /tabs >}}

#### Step 3: Create your first invoice

Now let's extend our tutorial to create an invoice for the customer:

{{< tabs items="JavaScript,Python,PHP" >}}

{{< tab >}}
```javascript
// Add this to your main function after creating customer
async function createInvoice(customer) {
  try {
    const invoice = await client.invoices.create({
      customerId: customer.id,
      invoiceDate: new Date().toISOString().split('T')[0],
      dueDate: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0],
      reference: 'Tutorial-001',
      items: [
        {
          description: 'Tutorial Consulting Services',
          quantity: 5,
          unitPrice: 200.00,
          taxCode: 'SST',
          taxRate: 6.0
        },
        {
          description: 'Tutorial Setup Fee',
          quantity: 1,
          unitPrice: 500.00,
          taxCode: 'SST',
          taxRate: 6.0
        }
      ],
      notes: 'Thank you for choosing our tutorial services!'
    });

    console.log('✅ Invoice created successfully!');
    console.log(`Invoice ID: ${invoice.id}`);
    console.log(`Invoice Number: ${invoice.invoiceNumber}`);
    console.log(`Total Amount: ${invoice.currency} ${invoice.total}`);
    
    return invoice;
  } catch (error) {
    console.error('❌ Error creating invoice:', error.message);
    throw error;
  }
}

// Update your main function
async function main() {
  // ... customer creation code ...
  
  // Create invoice
  const invoice = await createInvoice(customer);
  
  // Get invoice details
  const invoiceDetails = await client.invoices.get(invoice.id);
  console.log('\n📋 Invoice Details:');
  console.log(`Status: ${invoiceDetails.status}`);
  console.log(`Subtotal: ${invoiceDetails.currency} ${invoiceDetails.subtotal}`);
  console.log(`Tax: ${invoiceDetails.currency} ${invoiceDetails.totalTax}`);
  console.log(`Total: ${invoiceDetails.currency} ${invoiceDetails.total}`);
}
```
{{< /tab >}}

{{< tab >}}
```python
# Add this to your tutorial.py
def create_invoice(client, customer):
    try:
        from datetime import datetime, timedelta
        
        invoice = client.invoices.create({
            'customer_id': customer['id'],
            'invoice_date': datetime.now().strftime('%Y-%m-%d'),
            'due_date': (datetime.now() + timedelta(days=30)).strftime('%Y-%m-%d'),
            'reference': 'Tutorial-001',
            'items': [
                {
                    'description': 'Tutorial Consulting Services',
                    'quantity': 5,
                    'unit_price': 200.00,
                    'tax_code': 'SST',
                    'tax_rate': 6.0
                },
                {
                    'description': 'Tutorial Setup Fee',
                    'quantity': 1,
                    'unit_price': 500.00,
                    'tax_code': 'SST',
                    'tax_rate': 6.0
                }
            ],
            'notes': 'Thank you for choosing our tutorial services!'
        })
        
        print('✅ Invoice created successfully!')
        print(f"Invoice ID: {invoice['id']}")
        print(f"Invoice Number: {invoice['invoice_number']}")
        print(f"Total Amount: {invoice['currency']} {invoice['total']}")
        
        return invoice
    except Exception as error:
        print(f'❌ Error creating invoice: {error}')
        raise error

# Update your main function
def main():
    # ... customer creation code ...
    
    # Create invoice
    invoice = create_invoice(client, customer)
    
    # Get invoice details
    invoice_details = client.invoices.get(invoice['id'])
    print('\n📋 Invoice Details:')
    print(f"Status: {invoice_details['status']}")
    print(f"Subtotal: {invoice_details['currency']} {invoice_details['subtotal']}")
    print(f"Tax: {invoice_details['currency']} {invoice_details['total_tax']}")
    print(f"Total: {invoice_details['currency']} {invoice_details['total']}")
```
{{< /tab >}}

{{< tab >}}
```php
<?php
// Add this to your tutorial.php
function createInvoice($client, $customer) {
    try {
        $invoice = $client->invoices->create([
            'customer_id' => $customer['id'],
            'invoice_date' => date('Y-m-d'),
            'due_date' => date('Y-m-d', strtotime('+30 days')),
            'reference' => 'Tutorial-001',
            'items' => [
                [
                    'description' => 'Tutorial Consulting Services',
                    'quantity' => 5,
                    'unit_price' => 200.00,
                    'tax_code' => 'SST',
                    'tax_rate' => 6.0
                ],
                [
                    'description' => 'Tutorial Setup Fee',
                    'quantity' => 1,
                    'unit_price' => 500.00,
                    'tax_code' => 'SST',
                    'tax_rate' => 6.0
                ]
            ],
            'notes' => 'Thank you for choosing our tutorial services!'
        ]);
        
        echo "✅ Invoice created successfully!\n";
        echo "Invoice ID: " . $invoice['id'] . "\n";
        echo "Invoice Number: " . $invoice['invoice_number'] . "\n";
        echo "Total Amount: " . $invoice['currency'] . " " . $invoice['total'] . "\n";
        
        return $invoice;
    } catch (Exception $error) {
        echo "❌ Error creating invoice: " . $error->getMessage() . "\n";
        throw $error;
    }
}

// Update your main function
function main() {
    // ... customer creation code ...
    
    // Create invoice
    $invoice = createInvoice($client, $customer);
    
    // Get invoice details
    $invoiceDetails = $client->invoices->get($invoice['id']);
    echo "\n📋 Invoice Details:\n";
    echo "Status: " . $invoiceDetails['status'] . "\n";
    echo "Subtotal: " . $invoiceDetails['currency'] . " " . $invoiceDetails['subtotal'] . "\n";
    echo "Tax: " . $invoiceDetails['currency'] . " " . $invoiceDetails['total_tax'] . "\n";
    echo "Total: " . $invoiceDetails['currency'] . " " . $invoiceDetails['total'] . "\n";
}
?>
```
{{< /tab >}}

{{< /tabs >}}

#### Step 4: Run your tutorial

{{< tabs items="JavaScript,Python,PHP" >}}

{{< tab >}}
```bash
node tutorial.js
```
{{< /tab >}}

{{< tab >}}
```bash
python tutorial.py
```
{{< /tab >}}

{{< tab >}}
```bash
php tutorial.php
```
{{< /tab >}}

{{< /tabs >}}

**Expected Output:**
```
✅ Customer created successfully!
Customer ID: cust_123abc456
Customer Number: CUST-0001
✅ Invoice created successfully!
Invoice ID: inv_789xyz123
Invoice Number: INV-2024-0001
Total Amount: MYR 1590.00

📋 Invoice Details:
Status: draft
Subtotal: MYR 1500.00
Tax: MYR 90.00
Total: MYR 1590.00
```

**🎉 Congratulations!** You've successfully:
- Connected to BigLedger APIs
- Created a customer
- Generated an invoice
- Retrieved invoice details

---

### Tutorial 2: E-commerce Integration (30 minutes)

Build an e-commerce order processing system that automatically creates invoices and manages inventory.

**What you'll learn:**
- Webhook integration
- Inventory management
- Order processing workflows
- Error handling and retries

#### Step 1: Set up webhook endpoint

```javascript
// webhook-server.js
const express = require('express');
const crypto = require('crypto');
const { BigLedgerClient } = require('@bigledger/sdk');

const app = express();
const PORT = 3000;
const WEBHOOK_SECRET = 'your-webhook-secret';

// Middleware to capture raw body for signature verification
app.use('/webhooks', express.raw({type: 'application/json'}));
app.use(express.json());

const client = new BigLedgerClient({
  apiKey: process.env.BIGLEDGER_API_KEY,
  companyId: process.env.BIGLEDGER_COMPANY_ID,
  environment: 'sandbox'
});

// Verify webhook signature
function verifySignature(payload, signature, secret) {
  const expectedSignature = crypto
    .createHmac('sha256', secret)
    .update(payload, 'utf8')
    .digest('hex');
  
  const receivedSignature = signature.replace('sha256=', '');
  
  return crypto.timingSafeEqual(
    Buffer.from(expectedSignature, 'hex'),
    Buffer.from(receivedSignature, 'hex')
  );
}

// Handle BigLedger webhooks
app.post('/webhooks/bigledger', async (req, res) => {
  const signature = req.headers['x-signature'];
  const payload = req.body;
  
  // Verify signature
  if (!verifySignature(payload, signature, WEBHOOK_SECRET)) {
    return res.status(401).send('Invalid signature');
  }
  
  try {
    const event = JSON.parse(payload);
    console.log(`📨 Received event: ${event.event}`);
    
    await handleWebhookEvent(event);
    res.status(200).send('OK');
  } catch (error) {
    console.error('Webhook processing error:', error);
    res.status(500).send('Processing error');
  }
});

async function handleWebhookEvent(event) {
  switch (event.event) {
    case 'invoice.created':
      await handleInvoiceCreated(event.data.object);
      break;
    case 'invoice.paid':
      await handleInvoicePaid(event.data.object);
      break;
    case 'inventory.low_stock':
      await handleLowStock(event.data.object);
      break;
    default:
      console.log(`Unhandled event: ${event.event}`);
  }
}

async function handleInvoiceCreated(invoice) {
  console.log(`📄 Invoice ${invoice.invoiceNumber} created for customer ${invoice.customer?.name}`);
  
  // Send notification email to customer
  await sendInvoiceEmail(invoice);
}

async function handleInvoicePaid(invoice) {
  console.log(`💰 Payment received for invoice ${invoice.invoiceNumber}`);
  
  // Update inventory
  await updateInventoryAfterSale(invoice);
  
  // Send receipt
  await sendPaymentReceipt(invoice);
}

async function handleLowStock(item) {
  console.log(`⚠️  Low stock alert: ${item.description} (${item.currentStock} remaining)`);
  
  // Create purchase order automatically
  await createRestockOrder(item);
}

app.listen(PORT, () => {
  console.log(`🚀 Webhook server running on port ${PORT}`);
});
```

#### Step 2: Create order processing workflow

```javascript
// order-processor.js
class EcommerceOrderProcessor {
  constructor(bigledgerClient) {
    this.client = bigledgerClient;
  }

  async processOrder(orderData) {
    console.log(`🛒 Processing order: ${orderData.orderNumber}`);
    
    try {
      // Step 1: Validate inventory
      await this.validateInventory(orderData.items);
      
      // Step 2: Create or update customer
      const customer = await this.upsertCustomer(orderData.customer);
      
      // Step 3: Create invoice
      const invoice = await this.createInvoice(customer, orderData);
      
      // Step 4: Reserve inventory
      await this.reserveInventory(orderData.items);
      
      // Step 5: Process payment (if provided)
      if (orderData.payment) {
        await this.recordPayment(invoice, orderData.payment);
      }
      
      console.log(`✅ Order ${orderData.orderNumber} processed successfully`);
      return { customer, invoice };
      
    } catch (error) {
      console.error(`❌ Error processing order ${orderData.orderNumber}:`, error.message);
      throw error;
    }
  }

  async validateInventory(items) {
    for (const item of items) {
      const stockItem = await this.client.inventory.getByCode(item.sku);
      
      if (stockItem.currentStock < item.quantity) {
        throw new Error(`Insufficient stock for ${item.sku}. Available: ${stockItem.currentStock}, Required: ${item.quantity}`);
      }
    }
  }

  async upsertCustomer(customerData) {
    try {
      // Try to find existing customer by email
      const customers = await this.client.customers.list({
        search: customerData.email,
        limit: 1
      });
      
      if (customers.data.length > 0) {
        // Update existing customer
        return await this.client.customers.update(customers.data[0].id, {
          name: customerData.name,
          phone: customerData.phone,
          address: customerData.address
        });
      } else {
        // Create new customer
        return await this.client.customers.create({
          name: customerData.name,
          email: customerData.email,
          phone: customerData.phone,
          address: customerData.address,
          paymentTerms: 0 // Immediate payment for e-commerce
        });
      }
    } catch (error) {
      console.error('Error upserting customer:', error);
      throw error;
    }
  }

  async createInvoice(customer, orderData) {
    const items = orderData.items.map(item => ({
      description: item.name,
      quantity: item.quantity,
      unitPrice: item.price,
      taxCode: item.taxCode || 'SST',
      itemCode: item.sku
    }));

    return await this.client.invoices.create({
      customerId: customer.id,
      invoiceDate: new Date().toISOString().split('T')[0],
      dueDate: new Date().toISOString().split('T')[0], // Due immediately
      reference: orderData.orderNumber,
      items: items,
      shippingAmount: orderData.shippingCost || 0,
      notes: `E-commerce order: ${orderData.orderNumber}`,
      metadata: {
        source: 'ecommerce',
        orderNumber: orderData.orderNumber,
        customerType: 'online'
      }
    });
  }

  async reserveInventory(items) {
    for (const item of items) {
      await this.client.inventory.adjust({
        itemCode: item.sku,
        adjustmentType: 'decrease',
        quantity: item.quantity,
        reason: 'Sale - Reserved',
        reference: item.orderNumber
      });
    }
  }

  async recordPayment(invoice, paymentData) {
    return await this.client.payments.create({
      invoiceId: invoice.id,
      amount: paymentData.amount,
      paymentDate: new Date().toISOString().split('T')[0],
      paymentMethod: paymentData.method,
      reference: paymentData.transactionId,
      bankAccountId: paymentData.bankAccountId || 'default'
    });
  }
}

// Usage example
async function main() {
  const processor = new EcommerceOrderProcessor(client);
  
  const sampleOrder = {
    orderNumber: 'ORD-2024-001',
    customer: {
      name: 'John Doe',
      email: 'john@example.com',
      phone: '+60123456789',
      address: {
        street: '123 Customer Street',
        city: 'Kuala Lumpur',
        state: 'Selangor',
        postalCode: '50000',
        country: 'MY'
      }
    },
    items: [
      {
        sku: 'WIDGET-001',
        name: 'Premium Widget',
        quantity: 2,
        price: 99.99,
        taxCode: 'SST'
      },
      {
        sku: 'GADGET-002',
        name: 'Super Gadget',
        quantity: 1,
        price: 199.99,
        taxCode: 'SST'
      }
    ],
    shippingCost: 15.00,
    payment: {
      amount: 414.97, // Including tax and shipping
      method: 'credit_card',
      transactionId: 'txn_stripe_123456'
    }
  };

  try {
    const result = await processor.processOrder(sampleOrder);
    console.log('Order processed successfully:', result);
  } catch (error) {
    console.error('Order processing failed:', error);
  }
}

main().catch(console.error);
```

---

## Advanced Integration Patterns

### Pattern 1: Multi-Channel Inventory Sync

Synchronize inventory across multiple sales channels (Shopify, Amazon, physical stores).

```javascript
class MultiChannelInventorySync {
  constructor() {
    this.bigledger = new BigLedgerClient(config);
    this.channels = {
      shopify: new ShopifyAPI(),
      amazon: new AmazonAPI(),
      pos: new POSSystem()
    };
  }

  async syncInventoryAcrossChannels(itemCode) {
    try {
      // Get current stock from BigLedger
      const stockItem = await this.bigledger.inventory.getByCode(itemCode);
      const availableStock = stockItem.currentStock - stockItem.reservedStock;

      // Update all channels
      const updatePromises = Object.entries(this.channels).map(async ([channel, api]) => {
        try {
          await api.updateInventory(itemCode, availableStock);
          console.log(`✅ ${channel}: Updated ${itemCode} to ${availableStock}`);
        } catch (error) {
          console.error(`❌ ${channel}: Failed to update ${itemCode}`, error);
        }
      });

      await Promise.all(updatePromises);
      
    } catch (error) {
      console.error(`Failed to sync inventory for ${itemCode}:`, error);
    }
  }

  async handleInventoryWebhook(event) {
    if (event.event === 'inventory.adjustment') {
      const item = event.data.object;
      await this.syncInventoryAcrossChannels(item.itemCode);
    }
  }
}
```

### Pattern 2: Automated Financial Reporting

Generate and distribute financial reports automatically.

```javascript
class AutomatedReporting {
  constructor(bigledgerClient, emailService) {
    this.client = bigledgerClient;
    this.emailService = emailService;
  }

  async generateMonthlyReports() {
    const lastMonth = new Date();
    lastMonth.setMonth(lastMonth.getMonth() - 1);
    
    const reports = await Promise.all([
      this.client.reports.profitLoss({
        fromDate: this.getMonthStart(lastMonth),
        toDate: this.getMonthEnd(lastMonth)
      }),
      this.client.reports.balanceSheet({
        asOfDate: this.getMonthEnd(lastMonth)
      }),
      this.client.reports.agedReceivables({
        asOfDate: this.getMonthEnd(lastMonth)
      })
    ]);

    // Email reports to stakeholders
    await this.emailService.sendReports({
      recipients: ['cfo@company.com', 'accounting@company.com'],
      subject: `Monthly Financial Reports - ${lastMonth.toLocaleDateString('en-US', { month: 'long', year: 'numeric' })}`,
      reports: reports,
      format: 'pdf'
    });
  }

  getMonthStart(date) {
    return new Date(date.getFullYear(), date.getMonth(), 1).toISOString().split('T')[0];
  }

  getMonthEnd(date) {
    return new Date(date.getFullYear(), date.getMonth() + 1, 0).toISOString().split('T')[0];
  }
}
```

## Best Practices & Common Patterns

### Error Handling Strategy

```javascript
class RobustAPIClient {
  constructor(config) {
    this.client = new BigLedgerClient(config);
    this.retryAttempts = 3;
    this.retryDelay = 1000; // 1 second
  }

  async withRetry(operation, attempts = this.retryAttempts) {
    try {
      return await operation();
    } catch (error) {
      if (attempts > 1 && this.isRetryableError(error)) {
        console.log(`Retrying in ${this.retryDelay}ms... (${attempts - 1} attempts left)`);
        await this.sleep(this.retryDelay);
        return this.withRetry(operation, attempts - 1);
      }
      throw error;
    }
  }

  isRetryableError(error) {
    // Retry on network errors, rate limits, and server errors
    return (
      error.code === 'NETWORK_ERROR' ||
      error.code === 'RATE_LIMIT_EXCEEDED' ||
      error.code === 'INTERNAL_SERVER_ERROR' ||
      (error.status >= 500 && error.status < 600)
    );
  }

  async sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  async createInvoiceWithRetry(invoiceData) {
    return this.withRetry(async () => {
      return await this.client.invoices.create(invoiceData);
    });
  }
}
```

### Idempotent Operations

```javascript
class IdempotentOperations {
  constructor(bigledgerClient) {
    this.client = bigledgerClient;
    this.processedIds = new Set(); // In production, use Redis or database
  }

  async processWebhookEvent(event) {
    // Check if we've already processed this event
    if (this.processedIds.has(event.id)) {
      console.log(`Event ${event.id} already processed, skipping`);
      return;
    }

    try {
      await this.handleEvent(event);
      // Mark as processed only after successful completion
      this.processedIds.add(event.id);
    } catch (error) {
      console.error(`Failed to process event ${event.id}:`, error);
      throw error;
    }
  }

  async createIdempotentInvoice(invoiceData, idempotencyKey) {
    try {
      // Check if invoice with this key already exists
      const existingInvoice = await this.findInvoiceByIdempotencyKey(idempotencyKey);
      if (existingInvoice) {
        console.log('Invoice already exists, returning existing invoice');
        return existingInvoice;
      }

      // Create new invoice with idempotency key in metadata
      const invoice = await this.client.invoices.create({
        ...invoiceData,
        metadata: {
          ...invoiceData.metadata,
          idempotencyKey: idempotencyKey
        }
      });

      return invoice;
    } catch (error) {
      console.error('Error creating idempotent invoice:', error);
      throw error;
    }
  }

  async findInvoiceByIdempotencyKey(key) {
    const invoices = await this.client.invoices.list({
      search: key,
      searchFields: ['metadata.idempotencyKey'],
      limit: 1
    });

    return invoices.data.length > 0 ? invoices.data[0] : null;
  }
}
```

### Data Validation and Sanitization

```javascript
const Joi = require('joi');

class DataValidator {
  constructor() {
    this.customerSchema = Joi.object({
      name: Joi.string().min(1).max(200).required(),
      email: Joi.string().email().required(),
      phone: Joi.string().pattern(/^\+\d{10,15}$/),
      address: Joi.object({
        street: Joi.string().max(200),
        city: Joi.string().max(100),
        state: Joi.string().max(100),
        postalCode: Joi.string().max(20),
        country: Joi.string().length(2).required()
      })
    });

    this.invoiceSchema = Joi.object({
      customerId: Joi.string().required(),
      invoiceDate: Joi.date().iso().required(),
      dueDate: Joi.date().iso().min(Joi.ref('invoiceDate')).required(),
      items: Joi.array().min(1).items(
        Joi.object({
          description: Joi.string().min(1).max(500).required(),
          quantity: Joi.number().positive().required(),
          unitPrice: Joi.number().positive().required(),
          taxCode: Joi.string().max(20)
        })
      ).required()
    });
  }

  validateCustomer(data) {
    const { error, value } = this.customerSchema.validate(data);
    if (error) {
      throw new ValidationError(`Customer validation failed: ${error.details.map(d => d.message).join(', ')}`);
    }
    return value;
  }

  validateInvoice(data) {
    const { error, value } = this.invoiceSchema.validate(data);
    if (error) {
      throw new ValidationError(`Invoice validation failed: ${error.details.map(d => d.message).join(', ')}`);
    }
    return value;
  }

  sanitizeInput(data) {
    // Remove potentially dangerous characters
    const sanitized = JSON.parse(JSON.stringify(data));
    
    // Implement your sanitization logic here
    // For example, trim strings, normalize phone numbers, etc.
    
    return sanitized;
  }
}

class ValidationError extends Error {
  constructor(message) {
    super(message);
    this.name = 'ValidationError';
  }
}
```

## Production Deployment Checklist

### Security Checklist

- [ ] **API Keys**: Store in environment variables, never in code
- [ ] **HTTPS**: All API calls use HTTPS
- [ ] **Webhook Signatures**: Always verify webhook signatures
- [ ] **Input Validation**: Validate all user inputs
- [ ] **Rate Limiting**: Implement client-side rate limiting
- [ ] **Error Logging**: Log errors without exposing sensitive data

### Monitoring & Observability

```javascript
class APIMonitoring {
  constructor() {
    this.metrics = {
      apiCalls: 0,
      successCount: 0,
      errorCount: 0,
      responseTime: []
    };
  }

  async wrapAPICall(operation, operationName) {
    const startTime = Date.now();
    this.metrics.apiCalls++;

    try {
      const result = await operation();
      this.metrics.successCount++;
      
      const responseTime = Date.now() - startTime;
      this.metrics.responseTime.push(responseTime);
      
      console.log(`✅ ${operationName} completed in ${responseTime}ms`);
      return result;
    } catch (error) {
      this.metrics.errorCount++;
      console.error(`❌ ${operationName} failed:`, error.message);
      
      // Send to monitoring service
      this.sendErrorToMonitoring(operationName, error);
      throw error;
    }
  }

  sendErrorToMonitoring(operation, error) {
    // Send to your monitoring service (e.g., Sentry, DataDog)
    console.log('Sending error to monitoring service:', { operation, error: error.message });
  }

  getMetrics() {
    const avgResponseTime = this.metrics.responseTime.length > 0 
      ? this.metrics.responseTime.reduce((a, b) => a + b, 0) / this.metrics.responseTime.length 
      : 0;

    return {
      totalCalls: this.metrics.apiCalls,
      successRate: (this.metrics.successCount / this.metrics.apiCalls) * 100,
      errorRate: (this.metrics.errorCount / this.metrics.apiCalls) * 100,
      averageResponseTime: avgResponseTime
    };
  }
}
```

### Performance Optimization

- [ ] **Connection Pooling**: Use HTTP connection pooling
- [ ] **Caching**: Cache frequently accessed data
- [ ] **Pagination**: Use pagination for large data sets
- [ ] **Bulk Operations**: Use bulk endpoints when possible
- [ ] **Async Processing**: Use async operations for non-critical tasks

## Migration Guides

### QuickBooks to BigLedger Migration

```javascript
class QuickBooksToBigLedgerMigration {
  constructor(qbClient, blClient) {
    this.qb = qbClient;
    this.bl = blClient;
    this.migrationLog = [];
  }

  async migrateChartOfAccounts() {
    console.log('🔄 Migrating Chart of Accounts...');
    
    const qbAccounts = await this.qb.accounts.list();
    const blAccounts = [];

    for (const qbAccount of qbAccounts) {
      try {
        const blAccount = await this.bl.accounts.create({
          accountCode: qbAccount.accountCode,
          accountName: qbAccount.name,
          accountType: this.mapAccountType(qbAccount.type),
          parentAccountId: await this.findMappedAccountId(qbAccount.parentId),
          description: qbAccount.description,
          isActive: qbAccount.active
        });

        blAccounts.push(blAccount);
        this.logSuccess('account', qbAccount.id, blAccount.id);
      } catch (error) {
        this.logError('account', qbAccount.id, error);
      }
    }

    console.log(`✅ Migrated ${blAccounts.length} accounts`);
    return blAccounts;
  }

  async migrateCustomers() {
    console.log('🔄 Migrating Customers...');
    
    const qbCustomers = await this.qb.customers.list();
    const blCustomers = [];

    for (const qbCustomer of qbCustomers) {
      try {
        const blCustomer = await this.bl.customers.create({
          name: qbCustomer.name,
          email: qbCustomer.primaryEmailAddress,
          phone: qbCustomer.primaryPhone?.freeFormNumber,
          address: this.mapAddress(qbCustomer.billAddr),
          creditLimit: qbCustomer.creditLimit,
          paymentTerms: this.mapPaymentTerms(qbCustomer.paymentTerms)
        });

        blCustomers.push(blCustomer);
        this.logSuccess('customer', qbCustomer.id, blCustomer.id);
      } catch (error) {
        this.logError('customer', qbCustomer.id, error);
      }
    }

    console.log(`✅ Migrated ${blCustomers.length} customers`);
    return blCustomers;
  }

  mapAccountType(qbType) {
    const typeMapping = {
      'Bank': 'BANK',
      'Accounts Receivable': 'ACCOUNTS_RECEIVABLE',
      'Other Current Asset': 'CURRENT_ASSET',
      'Fixed Asset': 'FIXED_ASSET',
      'Accounts Payable': 'ACCOUNTS_PAYABLE',
      'Credit Card': 'CREDIT_CARD',
      'Other Current Liability': 'CURRENT_LIABILITY',
      'Long Term Liability': 'LONG_TERM_LIABILITY',
      'Equity': 'EQUITY',
      'Income': 'INCOME',
      'Cost of Goods Sold': 'COST_OF_GOODS_SOLD',
      'Expense': 'EXPENSE',
      'Other Income': 'OTHER_INCOME',
      'Other Expense': 'OTHER_EXPENSE'
    };

    return typeMapping[qbType] || 'OTHER_ASSET';
  }

  async generateMigrationReport() {
    const summary = {
      successful: this.migrationLog.filter(l => l.status === 'success').length,
      failed: this.migrationLog.filter(l => l.status === 'error').length,
      total: this.migrationLog.length
    };

    console.log('\n📊 Migration Summary:');
    console.log(`Total records: ${summary.total}`);
    console.log(`Successful: ${summary.successful}`);
    console.log(`Failed: ${summary.failed}`);
    console.log(`Success rate: ${(summary.successful / summary.total * 100).toFixed(2)}%`);

    return {
      summary,
      details: this.migrationLog
    };
  }
}
```

## Next Steps

After completing these tutorials, you're ready to:

1. **Build Production Integrations**: Apply these patterns to your real-world projects
2. **Explore Advanced Features**: E-invoice automation, multi-currency handling, advanced reporting
3. **Join the Community**: Share your integrations and learn from other developers
4. **Get Support**: Reach out to [developers@bigledger.com](mailto:developers@bigledger.com) for help

## Additional Resources

- **[API Reference](/developers/api-reference/)**: Complete endpoint documentation
- **[SDK Documentation](/developers/sdks/)**: Language-specific guides
- **[Webhook Reference](/developers/webhooks/)**: Real-time integration patterns
- **[Code Examples Repository](https://github.com/bigledger/api-examples)**: Complete example projects
- **[Community Forum](https://community.bigledger.com)**: Ask questions and share solutions

Happy coding! 🚀
