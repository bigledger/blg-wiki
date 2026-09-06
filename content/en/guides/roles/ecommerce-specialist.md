---
title: "E-Commerce Specialist Guide"
description: "Online sales and marketplace management guide"
weight: 30
draft: true  # unpublished 2026-09-06 (Vincent): see planning/reviews/ guides audit — substantially invented, or unreachable from navigation
---

# E-commerce Specialist - Questions and Scenarios

## Role Profile
**Position:** E-commerce Manager
**Company:** Multi-channel retailer with both online and offline presence
**Experience:** 3-5 years in e-commerce, moderate technical knowledge
**Responsibility:** Managing online sales across Shopee, Lazada, company website, and B2B portals using BigLedger's EcomSync and CP-Commerce modules

---

## 1. Multi-Channel Management Questions

### Channel Synchronization
"I'm struggling with keeping my product listings synchronized across Shopee, Lazada, and our website. Sometimes I update a product description on Shopee but forget to update it on Lazada. How does EcomSync handle this? Can I make changes in one place and have it automatically sync everywhere?"

"We want to run different pricing strategies - Lazada should have our premium pricing, Shopee should be more competitive, and our website should offer member discounts. How can I set up channel-specific pricing rules without manually updating each platform?"

"During our recent flash sale, we oversold on Shopee because our inventory wasn't updating fast enough. A customer ordered the last item on Shopee while someone was buying the same item in our physical store. How can EcomSync prevent this from happening again?"

### Marketplace-Specific Challenges
"Shopee requires different product image sizes and descriptions compared to Lazada. Do I need to maintain separate product catalogs, or can the system automatically format content for each marketplace's requirements?"

"We want to participate in Lazada's 11.11 campaign with special bundle offers, but we don't want these same bundles available on Shopee at the same time. How do I create platform-specific promotions without affecting other channels?"

### Order Prioritization
"Last month during 9.9, we received orders from all channels simultaneously, but we only had limited stock. Some customers from our website (who pay higher margins) had to wait longer than Shopee customers. How should I set up order prioritization rules?"

---

## 2. Product Catalog and Content Management

### Bulk Operations
"We have 500+ products that need to be uploaded to all three marketplaces. Each platform wants slightly different product specifications - Shopee loves detailed bullet points, Lazada prefers paragraph descriptions, and our website needs SEO-optimized content. Is there a way to bulk upload with platform-specific formatting?"

"Our supplier just sent us updated product specifications for 200 items. I need to update these across all channels, but manually doing this will take days. Can EcomSync handle bulk updates across multiple platforms simultaneously?"

### Product Variants Management
"We sell clothing with multiple sizes and colors. Shopee shows variants differently than Lazada - Shopee uses a grid view while Lazada uses dropdown menus. How do I set up product variants that display correctly on each platform while maintaining synchronized inventory?"

"Some of our products have 10+ variants (different sizes, colors, materials). Managing inventory for each variant across 4 channels is becoming a nightmare. What's the best way to organize this in the system?"

### SEO and Content Optimization
"Our website gets good traffic, but conversion rates are lower than our marketplace stores. I suspect our product descriptions aren't optimized for search engines. Can the system help with SEO optimization while maintaining consistency across marketplaces?"

"We want to A/B test different product descriptions to see what converts better, but we can't risk affecting our marketplace rankings. How can we test content variations safely?"

---

## 3. Inventory Synchronization Scenarios

### Real-Time Updates
"Yesterday, a customer bought our last gaming chair in our Subang store at 2 PM. At 2:05 PM, someone ordered the same chair on Lazada. The Lazada order went through, but we had to cancel it later. How fast should inventory updates be to prevent this?"

"During our warehouse stock take, we discovered discrepancies between our physical count and what EcomSync shows. How do I reconcile inventory across all channels without temporarily closing all online stores?"

### Stock Allocation
"We're launching a limited edition product (only 50 units). We want to allocate 20 for Shopee, 15 for Lazada, 10 for our website, and 5 for walk-in customers. Can I set up channel-specific inventory allocations in advance?"

"Our supplier delivers stock to different warehouses. Warehouse A serves online orders, Warehouse B serves retail stores. When Warehouse A runs low, can the system automatically redirect online orders to Warehouse B if the retail stores have enough stock?"

### Pre-orders and Backorders
"We're taking pre-orders for a product launching next month. Customers can order on all channels, but we need to track total pre-orders against expected stock delivery. How do I manage pre-order inventory across multiple channels?"

"When we run out of popular items, customers often ask when they'll be back in stock. Can the system automatically notify customers across all channels when items are restocked?"

---

## 4. Order Management and Fulfillment

### Peak Season Management
"During 12.12 last year, we received 500+ orders in one hour. Our team couldn't keep up with order processing, and some orders shipped late. How can I set up automated order routing and prioritization for this year's campaigns?"

"We offer same-day delivery in Klang Valley, but only for orders placed before 2 PM. How do I set up automatic cutoff times for different delivery options across all channels?"

### Returns and Exchanges
"Marketplace returns are handled differently - Shopee allows direct returns, Lazada requires seller approval, and our website uses a third-party return service. How do I manage these different return processes efficiently?"

"A customer bought an item on Shopee but wants to exchange it at our physical store. Our store staff don't know how to process marketplace returns. What's the proper workflow for cross-channel returns?"

### Shipping and Logistics
"We use different courier services for different channels - J&T for Shopee, CityLink for Lazada, and our own delivery for website orders. Can the system automatically assign the right courier based on the sales channel and customer location?"

"Sometimes our packaging team picks the wrong items or quantities. By the time customers receive incorrect orders, it affects our marketplace ratings. How can I implement quality control checks in the fulfillment process?"

---

## 5. Digital Marketing and Promotions

### Campaign Management
"I want to run a 'Flash Sale Friday' campaign every week with different products. How can I set up recurring campaigns that automatically select products based on inventory levels and profit margins?"

"Our marketing team created voucher codes for different campaigns - some for new customers, some for returning customers, and some for specific product categories. How do I ensure these vouchers work correctly across all channels without conflicts?"

### ROI Tracking
"We spend RM10,000 monthly on Facebook ads, RM5,000 on Google ads, and RM3,000 on marketplace promotions. I need to track which campaigns drive the most profitable sales, not just the most traffic. What reports can help me optimize my marketing spend?"

"Our influencer marketing drives traffic to our website, but some customers end up buying on Shopee instead (probably for peace of mind). How can I track the full customer journey across channels to measure campaign effectiveness?"

### Customer Segmentation
"We have different customer types - price-sensitive students who prefer Shopee, working professionals who buy from our website, and bulk buyers who use our B2B portal. How can I create targeted promotions for each segment without overwhelming them with irrelevant offers?"

---

## 6. Customer Experience and Support

### Omnichannel Support
"Customers contact us through multiple channels - Shopee chat, Lazada messages, website live chat, WhatsApp, and phone calls. Our support team struggles to maintain conversation history across these platforms. How can we provide consistent support?"

"A customer bought on Shopee but has questions about product usage. Our Shopee chat is handled by a different team than our website support. How do we ensure all support staff have access to the same product information and order history?"

### Customer Journey Tracking
"I notice that many customers browse on our website but complete purchases on marketplaces. They might compare prices, read reviews, then buy where they feel most comfortable. How can I track and optimize this cross-channel behavior?"

"Our loyalty program currently only works for website purchases. Customers who buy on marketplaces miss out on points and rewards. Can we extend loyalty benefits to marketplace purchases?"

### Review and Feedback Management
"Managing reviews across platforms is time-consuming. Shopee reviews need quick responses, Lazada allows detailed seller replies, and our website reviews affect SEO. How can I streamline review management and response?"

---

## 7. Analytics and Performance Tracking

### Sales Performance Analysis
"I need to compare which products perform better on which channels. For example, electronics sell better on Lazada, but fashion moves faster on Shopee. What reports can help me optimize my channel mix?"

"Our total sales are growing, but profit margins are shrinking. Each channel has different commission rates, shipping costs, and marketing expenses. How can I analyze true profitability by channel?"

### Customer Acquisition Costs
"I spend differently on each channel - Shopee requires sponsored ads, Lazada needs banner placements, and our website relies on Google ads. How do I calculate and compare customer acquisition costs across channels?"

"We're considering expanding to TikTok Shop, but I need to predict potential ROI. Can the system help me analyze customer behavior patterns to estimate performance on new channels?"

### Demand Forecasting
"Last year, we understocked during Ramadan and overstocked during Chinese New Year. We need better demand forecasting that considers Malaysian seasonal patterns and marketplace campaigns. What data should I be tracking?"

---

## 8. Integration and Technical Issues

### API and System Reliability
"Last month, our Shopee API connection went down during a flash sale. Orders weren't syncing, and we oversold several items. What backup procedures should we have for marketplace integration failures?"

"Sometimes product updates take longer to sync to certain marketplaces. Lazada updates seem slower than Shopee. Is this normal, and how can I monitor sync status?"

### Payment Processing
"We've had issues with payment gateway timeouts, especially during high-traffic periods. Customers complete checkout but payments don't process, leading to order cancellations. How can we improve payment reliability?"

"Different channels use different payment methods - Shopee customers prefer ShopeePay, Lazada customers use credit cards, and our website customers like online banking. How do I optimize payment options for each channel?"

### Performance Optimization
"Our website loads slowly compared to marketplace pages, which might hurt conversion rates. Customers expect fast-loading product pages like they get on Shopee and Lazada. What technical optimizations should I prioritize?"

---

## 9. B2B E-commerce Management

### Pricing and Terms
"Our B2B customers need different pricing tiers based on order volume and payment terms. Some get 30-day credit, others pay upfront for better discounts. How do I set up complex B2B pricing structures?"

"We have corporate customers who order monthly supplies. They need to see their contract prices and available credit limits when browsing our B2B portal. How can we provide this personalized experience?"

### Bulk Order Processing
"B2B orders often require custom quotes and approval workflows. A customer might request 500 units with custom packaging. How do I handle quote-to-order processes that don't fit standard e-commerce flows?"

"Some B2B customers have spending approval limits. Orders above RM5,000 need manager approval before processing. Can the system handle approval workflows for different customer segments?"

### Integration with Traditional Sales
"Our sales team still handles many B2B relationships through phone calls and emails. They need to input customer orders into the system while maintaining their relationships. How do we integrate traditional sales processes with our B2B portal?"

---

## Common Realistic Scenarios

### Scenario 1: Flash Sale Crisis
"It's 11.11, and we're running simultaneous flash sales on all channels. At 12:00 PM, our bestselling power bank (100 units available) gets featured on Shopee's front page. Within 5 minutes, we receive 150 orders across all channels. Shopee shows 47 orders, Lazada shows 38, our website shows 25, and walk-in customers bought 15 units. The system shows we're oversold by 25 units. What should I do immediately, and how can I prevent this next time?"

### Scenario 2: Supplier Delay Impact
"Our supplier just informed us that our top-selling smartphone accessories will be delayed by 2 weeks. We have 200 pre-orders across all channels and 50 units in transit. Customers are expecting delivery next week. How do I communicate with customers across different platforms and manage expectations?"

### Scenario 3: Marketplace Policy Changes
"Shopee just announced new commission rates and shipping requirements that affect our profit margins. I need to adjust pricing and evaluate whether some products are still viable on Shopee. How quickly can I analyze impact and implement changes across the platform?"

### Scenario 4: Quality Control Issue
"We discovered that a batch of products has quality issues after customers started leaving negative reviews on Lazada. We need to identify all affected orders across channels and proactively contact customers. How do I track products by batch number across all sales channels?"

### Scenario 5: Seasonal Demand Shift
"Raya season is approaching, and demand patterns are shifting. Traditional items are selling faster, but electronics are slowing down. I need to reallocate inventory and marketing budget. What data should I analyze to make these decisions?"

---

## Technical Integration Questions

### Data Synchronization
"How often does EcomSync sync data between channels? Is it real-time, or are there delays? During peak traffic, do sync speeds change?"

"We use different product SKU formats for different channels. Shopee uses shorter codes, while our internal system uses detailed alphanumeric codes. How does the system handle SKU mapping?"

### Backup and Recovery
"If our main system goes down, what happens to ongoing orders and inventory updates? Do we have backup procedures to continue operations?"

"How do we backup our product data, customer information, and order history? If we need to restore data, how long does it take?"

### Performance Monitoring
"What tools help me monitor system performance during high-traffic periods? How do I know if slow loading times are affecting my conversion rates?"

"Can I set up alerts for critical events like inventory reaching minimum levels, failed payment processing, or API connection issues?"

---

These questions reflect the real challenges faced by e-commerce specialists managing multi-channel operations in Malaysia, covering technical, operational, and strategic concerns while maintaining focus on practical business outcomes.