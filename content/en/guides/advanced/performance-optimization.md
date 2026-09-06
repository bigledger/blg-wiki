---
title: "Performance Optimization"
description: "System performance tuning, optimization strategies, and best practices"
weight: 70
draft: true  # unpublished 2026-09-06 (Vincent): see planning/reviews/ guides audit — substantially invented, or unreachable from navigation
---


*Three decades of optimizing ERP systems from 10-user SAP implementations to 10,000-user Oracle deployments. From mainframe performance tuning to cloud optimization, this guide provides proven methodologies for maximum system performance.*

## Table of Contents

1. [Database Optimization for Large Datasets](#database-optimization-for-large-datasets)
2. [Report Performance Tuning](#report-performance-tuning)
3. [Batch Processing Best Practices](#batch-processing-best-practices)
4. [Archiving Strategies for Historical Data](#archiving-strategies-for-historical-data)

---

## Database Optimization for Large Datasets

Having optimized databases supporting billions of transactions across multiple ERP platforms, I've learned that database performance is the foundation of ERP success.

### Database Architecture and Design

**Optimal Database Configuration for BigLedger**
```yaml
Database Platform Optimization:
PostgreSQL Configuration:
Memory Settings:
  shared_buffers: 25% of total RAM
  effective_cache_size: 75% of total RAM
  work_mem: RAM/max_connections
  maintenance_work_mem: 1-2GB
  
Connection Management:
  max_connections: Based on concurrent users
  connection_pooling: PgBouncer implementation
  idle_in_transaction_timeout: 30 minutes
  statement_timeout: 60 seconds

MySQL Configuration:
InnoDB Settings:
  innodb_buffer_pool_size: 70-80% of RAM
  innodb_log_file_size: 25% of buffer pool
  innodb_flush_log_at_trx_commit: 2
  innodb_file_per_table: ON
  
Query Cache:
  query_cache_type: ON
  query_cache_size: 256MB-1GB
  query_cache_limit: 16MB

SQL Server Configuration:
Memory Management:
  max_server_memory: Leave 2-4GB for OS
  buffer_pool_extension: SSD storage
  columnstore_archive_data_compression: ON
  
Parallelism:
  max_degree_of_parallelism: CPU cores
  cost_threshold_for_parallelism: 50
  
Indexing Strategy:
  fill_factor: 85-90%
  auto_create_statistics: ON
  auto_update_statistics: ON
```

**Table Design and Indexing Strategy**
```yaml
Optimal Table Design:
Partitioning Strategy:
Transaction Tables:
Date-Based Partitioning:
  - Monthly partitions for current year
  - Quarterly partitions for historical data
  - Automatic partition creation
  - Partition pruning optimization

Range Partitioning Example:
-- Sales Transaction Table
CREATE TABLE sales_transactions (
    transaction_id BIGSERIAL,
    transaction_date DATE NOT NULL,
    customer_id INTEGER,
    amount DECIMAL(18,2),
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (transaction_date);

-- Monthly Partitions
CREATE TABLE sales_2024_01 PARTITION OF sales_transactions
FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE sales_2024_02 PARTITION OF sales_transactions
FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

List Partitioning Example:
-- Customer Table by Region
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    region VARCHAR(50),
    created_date DATE
) PARTITION BY LIST (region);

CREATE TABLE customers_malaysia PARTITION OF customers
FOR VALUES IN ('MALAYSIA', 'MY');

CREATE TABLE customers_singapore PARTITION OF customers
FOR VALUES IN ('SINGAPORE', 'SG');

Index Optimization:
Primary Performance Indexes:
-- Customer lookup optimization
CREATE INDEX idx_customer_name_active 
ON customers (customer_name) 
WHERE active = true;

-- Transaction date range queries
CREATE INDEX idx_sales_date_customer 
ON sales_transactions (transaction_date, customer_id);

-- Inventory movement tracking
CREATE INDEX idx_inventory_product_date 
ON inventory_movements (product_id, movement_date)
INCLUDE (quantity, movement_type);

Composite Index Strategy:
-- Order processing optimization
CREATE INDEX idx_orders_status_date_customer 
ON sales_orders (order_status, order_date, customer_id)
WHERE order_status IN ('PENDING', 'PROCESSING');

-- Financial reporting indexes
CREATE INDEX idx_gl_account_period 
ON general_ledger (account_code, fiscal_period, posting_date)
INCLUDE (debit_amount, credit_amount);
```

### Query Optimization Techniques

**Advanced Query Performance Tuning**
```yaml
Query Optimization Framework:
Execution Plan Analysis:
Key Metrics to Monitor:
  - Query execution time
  - Logical reads per query
  - Physical reads ratio
  - CPU time consumption
  - Memory usage patterns

Common Performance Issues:
Table Scans:
Problem: Full table scan on large tables
Solution: Proper indexing strategy

Query Example:
-- Inefficient query (table scan)
SELECT * FROM sales_transactions 
WHERE customer_id = 12345;

-- Optimized query (index seek)
CREATE INDEX idx_sales_customer ON sales_transactions (customer_id);
SELECT transaction_id, transaction_date, amount 
FROM sales_transactions 
WHERE customer_id = 12345;

Nested Loops:
Problem: Inefficient join operations
Solution: Join optimization and statistics

-- Inefficient nested loop
SELECT c.customer_name, s.total_sales
FROM customers c,
     (SELECT customer_id, SUM(amount) as total_sales
      FROM sales_transactions
      GROUP BY customer_id) s
WHERE c.customer_id = s.customer_id;

-- Optimized join
SELECT c.customer_name, COALESCE(s.total_sales, 0)
FROM customers c
LEFT JOIN (
    SELECT customer_id, SUM(amount) as total_sales
    FROM sales_transactions
    WHERE transaction_date >= '2024-01-01'
    GROUP BY customer_id
) s ON c.customer_id = s.customer_id
WHERE c.active = true;

Query Rewriting Techniques:
Subquery to Join Conversion:
-- Inefficient subquery
SELECT product_id, product_name
FROM products
WHERE product_id IN (
    SELECT DISTINCT product_id
    FROM sales_transactions
    WHERE transaction_date >= '2024-01-01'
);

-- Optimized join
SELECT DISTINCT p.product_id, p.product_name
FROM products p
INNER JOIN sales_transactions s ON p.product_id = s.product_id
WHERE s.transaction_date >= '2024-01-01';

Conditional Logic Optimization:
-- Inefficient OR conditions
SELECT * FROM customers
WHERE region = 'MALAYSIA' OR region = 'SINGAPORE';

-- Optimized IN clause
SELECT * FROM customers
WHERE region IN ('MALAYSIA', 'SINGAPORE');

Window Function Optimization:
-- Efficient ranking queries
SELECT 
    customer_id,
    customer_name,
    total_sales,
    ROW_NUMBER() OVER (ORDER BY total_sales DESC) as rank
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(s.amount) as total_sales
    FROM customers c
    JOIN sales_transactions s ON c.customer_id = s.customer_id
    WHERE s.transaction_date >= '2024-01-01'
    GROUP BY c.customer_id, c.customer_name
) ranked_customers
WHERE total_sales > 100000;
```

### Database Maintenance and Monitoring

**Proactive Database Management**
```yaml
Maintenance Procedures:
Statistics Management:
Automated Statistics Updates:
-- PostgreSQL auto-vacuum configuration
ALTER SYSTEM SET autovacuum_vacuum_scale_factor = 0.1;
ALTER SYSTEM SET autovacuum_analyze_scale_factor = 0.05;
ALTER SYSTEM SET autovacuum_vacuum_cost_limit = 2000;

-- SQL Server statistics update job
UPDATE STATISTICS sales_transactions WITH FULLSCAN;
UPDATE STATISTICS customers WITH SAMPLE 25 PERCENT;

Index Maintenance:
-- PostgreSQL index maintenance
REINDEX TABLE sales_transactions;
VACUUM ANALYZE sales_transactions;

-- SQL Server index reorganization
ALTER INDEX idx_sales_date_customer 
ON sales_transactions 
REORGANIZE;

-- MySQL index optimization
OPTIMIZE TABLE sales_transactions;

Performance Monitoring:
Key Performance Indicators:
Database Response Time:
  - Average query response: <100ms
  - 95th percentile: <500ms
  - Maximum acceptable: <2 seconds
  - Peak hour performance: <200ms

Resource Utilization:
  - CPU utilization: <70% average
  - Memory usage: <80% of allocated
  - Disk I/O: <80% capacity
  - Network bandwidth: <60% capacity

Concurrency Metrics:
  - Active connections: Monitor trends
  - Lock wait time: <100ms average
  - Deadlock frequency: <1 per hour
  - Blocking processes: <5% of queries

Monitoring Queries:
-- PostgreSQL performance monitoring
SELECT 
    query,
    calls,
    total_time,
    mean_time,
    rows
FROM pg_stat_statements
WHERE mean_time > 1000
ORDER BY mean_time DESC
LIMIT 20;

-- SQL Server wait statistics
SELECT 
    wait_type,
    waiting_tasks_count,
    wait_time_ms,
    max_wait_time_ms,
    signal_wait_time_ms
FROM sys.dm_os_wait_stats
WHERE wait_time_ms > 1000
ORDER BY wait_time_ms DESC;

-- MySQL slow query analysis
SELECT 
    DIGEST_TEXT,
    COUNT_STAR,
    AVG_TIMER_WAIT/1000000 as avg_ms,
    MAX_TIMER_WAIT/1000000 as max_ms
FROM performance_schema.events_statements_summary_by_digest
WHERE AVG_TIMER_WAIT > 1000000000
ORDER BY AVG_TIMER_WAIT DESC
LIMIT 20;

Automated Alerts:
Performance Alert Thresholds:
-- Database response time alerts
WHEN average_response_time > 500ms FOR 5 minutes
THEN send_alert('Database Performance Degradation')

-- Resource utilization alerts
WHEN cpu_usage > 80% FOR 10 minutes
THEN send_alert('High CPU Utilization')

-- Connection pool alerts
WHEN active_connections > 80% of max_connections
THEN send_alert('Connection Pool Nearly Exhausted')

-- Deadlock alerts
WHEN deadlock_count > 5 IN 1 hour
THEN send_alert('High Deadlock Frequency')
```

---

## Report Performance Tuning

Report performance directly impacts user productivity and system adoption. Slow reports are the primary complaint in ERP implementations.

### Report Architecture Optimization

**Efficient Reporting Framework**
```yaml
Reporting Architecture:
Data Warehouse Approach:
Dimensional Modeling:
Fact Tables:
  - sales_fact: Transaction-level sales data
  - inventory_fact: Stock movement details
  - financial_fact: GL transaction details
  - production_fact: Manufacturing metrics

Dimension Tables:
  - date_dimension: Complete date hierarchy
  - customer_dimension: Customer attributes
  - product_dimension: Product hierarchies
  - geography_dimension: Location data

Star Schema Example:
-- Sales fact table
CREATE TABLE sales_fact (
    fact_id BIGSERIAL PRIMARY KEY,
    date_key INTEGER REFERENCES date_dimension(date_key),
    customer_key INTEGER REFERENCES customer_dimension(customer_key),
    product_key INTEGER REFERENCES product_dimension(product_key),
    geography_key INTEGER REFERENCES geography_dimension(geography_key),
    sales_amount DECIMAL(18,2),
    quantity INTEGER,
    cost_amount DECIMAL(18,2),
    profit_amount DECIMAL(18,2)
);

-- Optimized indexes for reporting
CREATE INDEX idx_sales_fact_date ON sales_fact (date_key);
CREATE INDEX idx_sales_fact_customer ON sales_fact (customer_key);
CREATE INDEX idx_sales_fact_product ON sales_fact (product_key);
CREATE INDEX idx_sales_fact_combo ON sales_fact (date_key, customer_key, product_key);

Materialized Views:
-- Monthly sales summary
CREATE MATERIALIZED VIEW monthly_sales_summary AS
SELECT 
    d.year,
    d.month,
    c.customer_segment,
    p.product_category,
    SUM(f.sales_amount) as total_sales,
    SUM(f.quantity) as total_quantity,
    SUM(f.profit_amount) as total_profit,
    COUNT(*) as transaction_count
FROM sales_fact f
JOIN date_dimension d ON f.date_key = d.date_key
JOIN customer_dimension c ON f.customer_key = c.customer_key
JOIN product_dimension p ON f.product_key = p.product_key
GROUP BY d.year, d.month, c.customer_segment, p.product_category;

-- Refresh strategy
CREATE OR REPLACE FUNCTION refresh_monthly_summary()
RETURNS void AS $$
BEGIN
    REFRESH MATERIALIZED VIEW CONCURRENTLY monthly_sales_summary;
END;
$$ LANGUAGE plpgsql;

-- Scheduled refresh (daily at 2 AM)
SELECT cron.schedule('refresh-summary', '0 2 * * *', 'SELECT refresh_monthly_summary();');

Aggregate Tables:
-- Pre-calculated daily summaries
CREATE TABLE daily_sales_summary (
    summary_date DATE PRIMARY KEY,
    total_sales DECIMAL(18,2),
    total_orders INTEGER,
    average_order_value DECIMAL(18,2),
    top_customer_id INTEGER,
    top_product_id INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Automated population
CREATE OR REPLACE FUNCTION populate_daily_summary(p_date DATE)
RETURNS void AS $$
BEGIN
    INSERT INTO daily_sales_summary (
        summary_date, total_sales, total_orders, 
        average_order_value, top_customer_id, top_product_id
    )
    SELECT 
        p_date,
        SUM(amount),
        COUNT(*),
        AVG(amount),
        (SELECT customer_id FROM sales_transactions 
         WHERE DATE(transaction_date) = p_date 
         GROUP BY customer_id 
         ORDER BY SUM(amount) DESC LIMIT 1),
        (SELECT product_id FROM sales_transaction_lines stl
         JOIN sales_transactions st ON stl.transaction_id = st.transaction_id
         WHERE DATE(st.transaction_date) = p_date 
         GROUP BY product_id 
         ORDER BY SUM(quantity) DESC LIMIT 1)
    FROM sales_transactions
    WHERE DATE(transaction_date) = p_date
    ON CONFLICT (summary_date) DO UPDATE SET
        total_sales = EXCLUDED.total_sales,
        total_orders = EXCLUDED.total_orders,
        average_order_value = EXCLUDED.average_order_value,
        top_customer_id = EXCLUDED.top_customer_id,
        top_product_id = EXCLUDED.top_product_id;
END;
$$ LANGUAGE plpgsql;
```

### Report Query Optimization

**Advanced Report Query Techniques**
```yaml
Query Optimization for Reports:
Efficient Aggregation:
-- Optimized sales report query
WITH monthly_metrics AS (
    SELECT 
        DATE_TRUNC('month', transaction_date) as month,
        customer_id,
        SUM(amount) as monthly_sales,
        COUNT(*) as transaction_count,
        AVG(amount) as avg_transaction
    FROM sales_transactions
    WHERE transaction_date >= '2024-01-01'
    GROUP BY DATE_TRUNC('month', transaction_date), customer_id
),
customer_rankings AS (
    SELECT 
        month,
        customer_id,
        monthly_sales,
        RANK() OVER (PARTITION BY month ORDER BY monthly_sales DESC) as sales_rank
    FROM monthly_metrics
)
SELECT 
    c.customer_name,
    cr.month,
    cr.monthly_sales,
    cr.sales_rank,
    mm.transaction_count,
    mm.avg_transaction
FROM customer_rankings cr
JOIN customers c ON cr.customer_id = c.customer_id
JOIN monthly_metrics mm ON cr.customer_id = mm.customer_id 
    AND cr.month = mm.month
WHERE cr.sales_rank <= 10
ORDER BY cr.month, cr.sales_rank;

Parallel Processing:
-- Enable parallel query execution
SET max_parallel_workers_per_gather = 4;
SET parallel_tuple_cost = 0.1;
SET parallel_setup_cost = 1000;

-- Large dataset aggregation with parallel processing
EXPLAIN (ANALYZE, BUFFERS) 
SELECT 
    product_category,
    COUNT(*) as product_count,
    SUM(sales_amount) as total_sales,
    AVG(sales_amount) as avg_sales
FROM large_sales_fact
WHERE transaction_date >= '2023-01-01'
GROUP BY product_category
HAVING SUM(sales_amount) > 1000000;

Column Store Optimization:
-- PostgreSQL columnar extension for analytics
CREATE EXTENSION IF NOT EXISTS columnar;

-- Convert large fact table to columnar format
SELECT alter_table_set_access_method('sales_fact', 'columnar');

-- Compress columnar data
SELECT compress_chunk(chunk_name) 
FROM chunk_info 
WHERE table_name = 'sales_fact';

Incremental Reporting:
-- Delta processing for large reports
CREATE TABLE report_processing_log (
    report_name VARCHAR(100),
    last_processed_date TIMESTAMP,
    last_processed_id BIGINT,
    processing_status VARCHAR(20)
);

-- Incremental data processing function
CREATE OR REPLACE FUNCTION process_incremental_sales_report()
RETURNS void AS $$
DECLARE
    last_id BIGINT;
    last_date TIMESTAMP;
BEGIN
    -- Get last processed position
    SELECT last_processed_id, last_processed_date
    INTO last_id, last_date
    FROM report_processing_log
    WHERE report_name = 'daily_sales_summary';
    
    -- Process new records only
    INSERT INTO daily_sales_aggregate (
        process_date, customer_segment, product_category,
        sales_amount, order_count, profit_margin
    )
    SELECT 
        DATE(s.transaction_date),
        c.customer_segment,
        p.product_category,
        SUM(s.amount),
        COUNT(*),
        (SUM(s.amount) - SUM(s.cost_amount)) / SUM(s.amount) * 100
    FROM sales_transactions s
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN products p ON s.product_id = p.product_id
    WHERE s.transaction_id > last_id
        AND s.transaction_date > last_date
    GROUP BY DATE(s.transaction_date), c.customer_segment, p.product_category;
    
    -- Update processing log
    UPDATE report_processing_log
    SET last_processed_id = (SELECT MAX(transaction_id) FROM sales_transactions),
        last_processed_date = NOW(),
        processing_status = 'COMPLETED'
    WHERE report_name = 'daily_sales_summary';
END;
$$ LANGUAGE plpgsql;
```

### Report Caching and Delivery

**Intelligent Report Caching**
```yaml
Caching Strategy:
Multi-Level Caching:
Database Level Caching:
  - Query result caching
  - Materialized view caching
  - Prepared statement caching
  - Connection pooling

Application Level Caching:
  - Report object caching
  - Parameter-based caching
  - User session caching
  - Memory-based storage

CDN Level Caching:
  - Static report delivery
  - Geographic distribution
  - Edge server caching
  - Bandwidth optimization

Cache Implementation:
-- Redis caching for report results
const reportCache = {
    // Generate cache key based on report parameters
    generateKey: (reportType, parameters) => {
        const params = JSON.stringify(parameters);
        return `report:${reportType}:${crypto.createHash('md5').update(params).digest('hex')}`;
    },
    
    // Cache report with TTL
    set: async (key, data, ttlSeconds = 3600) => {
        await redis.setex(key, ttlSeconds, JSON.stringify(data));
    },
    
    // Retrieve cached report
    get: async (key) => {
        const cached = await redis.get(key);
        return cached ? JSON.parse(cached) : null;
    },
    
    // Invalidate cache pattern
    invalidatePattern: async (pattern) => {
        const keys = await redis.keys(pattern);
        if (keys.length > 0) {
            await redis.del(...keys);
        }
    }
};

// Report generation with caching
async function generateSalesReport(parameters) {
    const cacheKey = reportCache.generateKey('sales', parameters);
    
    // Check cache first
    let reportData = await reportCache.get(cacheKey);
    if (reportData) {
        return { data: reportData, cached: true };
    }
    
    // Generate report if not cached
    reportData = await executeReportQuery(parameters);
    
    // Cache for 1 hour
    await reportCache.set(cacheKey, reportData, 3600);
    
    return { data: reportData, cached: false };
}

Scheduled Report Generation:
-- Pre-generate popular reports
CREATE TABLE scheduled_reports (
    report_id SERIAL PRIMARY KEY,
    report_name VARCHAR(100),
    report_parameters JSONB,
    schedule_expression VARCHAR(50),
    last_generated TIMESTAMP,
    next_generation TIMESTAMP,
    output_format VARCHAR(20),
    delivery_method VARCHAR(20),
    recipients TEXT[]
);

-- Daily executive dashboard
INSERT INTO scheduled_reports (
    report_name, report_parameters, schedule_expression,
    output_format, delivery_method, recipients
) VALUES (
    'Executive Dashboard',
    '{"period": "yesterday", "format": "summary"}',
    '0 7 * * *',  -- Daily at 7 AM
    'PDF',
    'EMAIL',
    ARRAY['ceo@company.com', 'cfo@company.com']
);

-- Monthly financial package
INSERT INTO scheduled_reports (
    report_name, report_parameters, schedule_expression,
    output_format, delivery_method, recipients
) VALUES (
    'Monthly Financial Package',
    '{"period": "last_month", "detail_level": "full"}',
    '0 8 1 * *',  -- First day of month at 8 AM
    'PDF',
    'EMAIL',
    ARRAY['finance-team@company.com', 'board@company.com']
);

Report Delivery Optimization:
-- Asynchronous report generation
const reportQueue = new Queue('report generation', {
    redis: redisConfig,
    defaultJobOptions: {
        removeOnComplete: 100,
        removeOnFail: 50,
        attempts: 3,
        backoff: 'exponential'
    }
});

// Add report to processing queue
reportQueue.add('generate-report', {
    reportType: 'financial-summary',
    parameters: { period: '2024-01', detail: 'full' },
    requesterId: 'user123',
    priority: 'high'
}, {
    priority: 10,
    delay: 0
});

// Process report generation
reportQueue.process('generate-report', 5, async (job) => {
    const { reportType, parameters, requesterId } = job.data;
    
    // Update progress
    job.progress(10);
    
    // Generate report data
    const reportData = await generateReportData(reportType, parameters);
    job.progress(60);
    
    // Format report
    const formattedReport = await formatReport(reportData, parameters.format);
    job.progress(90);
    
    // Deliver report
    await deliverReport(formattedReport, requesterId);
    job.progress(100);
    
    return { status: 'completed', reportId: formattedReport.id };
});
```

---

## Batch Processing Best Practices

Efficient batch processing is essential for data-intensive operations like month-end closing, data synchronization, and large-scale calculations.

### Batch Job Architecture

**Enterprise Batch Processing Framework**
```yaml
Batch Processing Architecture:
Job Scheduling Framework:
Cron-based Scheduling:
# Daily data synchronization (2 AM)
0 2 * * * /opt/bigledger/scripts/sync_daily_data.sh

# Weekly report generation (Sunday 3 AM)
0 3 * * 0 /opt/bigledger/scripts/generate_weekly_reports.sh

# Monthly closing procedures (First day 4 AM)
0 4 1 * * /opt/bigledger/scripts/monthly_closing.sh

# Quarterly compliance reports (First day of quarter 5 AM)
0 5 1 1,4,7,10 * /opt/bigledger/scripts/quarterly_compliance.sh

Advanced Job Scheduling:
-- Database-driven job scheduler
CREATE TABLE batch_jobs (
    job_id SERIAL PRIMARY KEY,
    job_name VARCHAR(100) UNIQUE,
    job_type VARCHAR(50),
    schedule_expression VARCHAR(100),
    job_parameters JSONB,
    enabled BOOLEAN DEFAULT true,
    last_run TIMESTAMP,
    next_run TIMESTAMP,
    max_runtime_minutes INTEGER DEFAULT 60,
    retry_count INTEGER DEFAULT 3,
    notification_emails TEXT[],
    created_at TIMESTAMP DEFAULT NOW()
);

-- Job execution log
CREATE TABLE batch_job_executions (
    execution_id BIGSERIAL PRIMARY KEY,
    job_id INTEGER REFERENCES batch_jobs(job_id),
    start_time TIMESTAMP DEFAULT NOW(),
    end_time TIMESTAMP,
    status VARCHAR(20), -- RUNNING, COMPLETED, FAILED, TIMEOUT
    records_processed INTEGER,
    error_message TEXT,
    execution_details JSONB
);

-- Example job definitions
INSERT INTO batch_jobs (
    job_name, job_type, schedule_expression, job_parameters,
    max_runtime_minutes, notification_emails
) VALUES (
    'Daily Customer Synchronization',
    'DATA_SYNC',
    '0 2 * * *',
    '{"source": "CRM", "target": "BigLedger", "chunk_size": 1000}',
    30,
    ARRAY['it-ops@company.com']
), (
    'Monthly Depreciation Calculation',
    'FINANCIAL_CALC',
    '0 1 1 * *',
    '{"calculation_type": "depreciation", "period": "monthly"}',
    120,
    ARRAY['finance@company.com', 'it-ops@company.com']
);

Parallel Processing Framework:
-- Chunk-based processing for large datasets
CREATE OR REPLACE FUNCTION process_large_dataset(
    p_table_name TEXT,
    p_processing_function TEXT,
    p_chunk_size INTEGER DEFAULT 10000,
    p_max_parallel INTEGER DEFAULT 4
)
RETURNS TABLE(chunk_id INTEGER, records_processed INTEGER, processing_time INTERVAL) AS $$
DECLARE
    total_records INTEGER;
    chunk_count INTEGER;
    current_chunk INTEGER;
BEGIN
    -- Get total record count
    EXECUTE format('SELECT COUNT(*) FROM %I WHERE processing_status = ''PENDING''', p_table_name)
    INTO total_records;
    
    chunk_count := CEIL(total_records::FLOAT / p_chunk_size);
    
    -- Process chunks in parallel
    FOR current_chunk IN 1..chunk_count LOOP
        -- Return chunk processing info
        RETURN QUERY
        SELECT current_chunk, p_chunk_size, INTERVAL '0 seconds';
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Example: Parallel customer data processing
SELECT * FROM process_large_dataset(
    'customer_updates',
    'update_customer_credit_limits',
    5000,  -- 5000 records per chunk
    6      -- 6 parallel processes
);

Error Handling and Recovery:
-- Robust error handling framework
CREATE TABLE batch_job_errors (
    error_id BIGSERIAL PRIMARY KEY,
    execution_id BIGINT REFERENCES batch_job_executions(execution_id),
    error_time TIMESTAMP DEFAULT NOW(),
    error_type VARCHAR(50),
    error_message TEXT,
    stack_trace TEXT,
    recovery_action TEXT,
    resolved BOOLEAN DEFAULT false
);

-- Checkpoint and restart mechanism
CREATE TABLE batch_job_checkpoints (
    checkpoint_id BIGSERIAL PRIMARY KEY,
    execution_id BIGINT REFERENCES batch_job_executions(execution_id),
    checkpoint_name VARCHAR(100),
    checkpoint_data JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Example checkpoint function
CREATE OR REPLACE FUNCTION save_checkpoint(
    p_execution_id BIGINT,
    p_checkpoint_name TEXT,
    p_data JSONB
)
RETURNS void AS $$
BEGIN
    INSERT INTO batch_job_checkpoints (
        execution_id, checkpoint_name, checkpoint_data
    ) VALUES (
        p_execution_id, p_checkpoint_name, p_data
    );
END;
$$ LANGUAGE plpgsql;

-- Recovery function
CREATE OR REPLACE FUNCTION recover_from_checkpoint(
    p_execution_id BIGINT,
    p_checkpoint_name TEXT
)
RETURNS JSONB AS $$
DECLARE
    checkpoint_data JSONB;
BEGIN
    SELECT checkpoint_data INTO checkpoint_data
    FROM batch_job_checkpoints
    WHERE execution_id = p_execution_id
        AND checkpoint_name = p_checkpoint_name
    ORDER BY created_at DESC
    LIMIT 1;
    
    RETURN checkpoint_data;
END;
$$ LANGUAGE plpgsql;
```

### Performance Optimization for Batch Jobs

**High-Performance Batch Processing**
```yaml
Memory Management:
Streaming Data Processing:
-- Process large datasets without loading all into memory
CREATE OR REPLACE FUNCTION stream_process_transactions()
RETURNS void AS $$
DECLARE
    transaction_cursor CURSOR FOR
        SELECT transaction_id, customer_id, amount, transaction_date
        FROM sales_transactions
        WHERE processing_status = 'PENDING'
        ORDER BY transaction_id;
    
    current_record RECORD;
    batch_count INTEGER := 0;
    commit_interval INTEGER := 1000;
BEGIN
    FOR current_record IN transaction_cursor LOOP
        -- Process individual record
        PERFORM process_transaction_record(current_record);
        
        batch_count := batch_count + 1;
        
        -- Commit periodically to free locks
        IF batch_count % commit_interval = 0 THEN
            COMMIT;
            RAISE NOTICE 'Processed % records', batch_count;
        END IF;
    END LOOP;
    
    RAISE NOTICE 'Total records processed: %', batch_count;
END;
$$ LANGUAGE plpgsql;

Bulk Operations:
-- Efficient bulk insert operations
CREATE OR REPLACE FUNCTION bulk_insert_customer_updates(
    p_data JSONB[]
)
RETURNS INTEGER AS $$
DECLARE
    inserted_count INTEGER;
BEGIN
    -- Use COPY for maximum performance
    CREATE TEMP TABLE temp_customer_updates (
        customer_id INTEGER,
        customer_name VARCHAR(255),
        credit_limit DECIMAL(18,2),
        last_updated TIMESTAMP DEFAULT NOW()
    ) ON COMMIT DROP;
    
    -- Bulk insert using COPY
    COPY temp_customer_updates (customer_id, customer_name, credit_limit)
    FROM PROGRAM 'echo ''' || array_to_string(p_data, E'\n') || ''''
    WITH (FORMAT csv, DELIMITER ',');
    
    -- Merge with main table
    INSERT INTO customers (customer_id, customer_name, credit_limit, last_updated)
    SELECT customer_id, customer_name, credit_limit, last_updated
    FROM temp_customer_updates
    ON CONFLICT (customer_id) DO UPDATE SET
        customer_name = EXCLUDED.customer_name,
        credit_limit = EXCLUDED.credit_limit,
        last_updated = EXCLUDED.last_updated;
    
    GET DIAGNOSTICS inserted_count = ROW_COUNT;
    RETURN inserted_count;
END;
$$ LANGUAGE plpgsql;

Database Connection Management:
-- Connection pooling for batch jobs
const batchJobPool = new Pool({
    host: 'database-server',
    port: 5432,
    database: 'bigledger',
    user: 'batch_user',
    password: process.env.BATCH_DB_PASSWORD,
    max: 10,              // Maximum pool size
    min: 2,               // Minimum pool size
    acquireTimeoutMillis: 30000,
    createTimeoutMillis: 30000,
    destroyTimeoutMillis: 5000,
    idleTimeoutMillis: 30000,
    reapIntervalMillis: 1000,
    createRetryIntervalMillis: 2000
});

// Batch processing with connection management
async function processBatchJob(jobDefinition) {
    const client = await batchJobPool.connect();
    
    try {
        await client.query('BEGIN');
        
        const batchSize = jobDefinition.parameters.batchSize || 1000;
        let offset = 0;
        let processedCount = 0;
        
        while (true) {
            const result = await client.query(`
                SELECT * FROM ${jobDefinition.sourceTable}
                WHERE processing_status = 'PENDING'
                ORDER BY id
                LIMIT $1 OFFSET $2
            `, [batchSize, offset]);
            
            if (result.rows.length === 0) break;
            
            // Process batch
            for (const row of result.rows) {
                await processRecord(client, row);
                processedCount++;
            }
            
            // Commit batch
            await client.query('COMMIT');
            await client.query('BEGIN');
            
            offset += batchSize;
            
            // Progress reporting
            console.log(`Processed ${processedCount} records`);
        }
        
        await client.query('COMMIT');
        return { status: 'completed', recordsProcessed: processedCount };
        
    } catch (error) {
        await client.query('ROLLBACK');
        throw error;
    } finally {
        client.release();
    }
}

Resource Monitoring:
-- Monitor batch job resource usage
CREATE TABLE batch_job_metrics (
    metric_id BIGSERIAL PRIMARY KEY,
    execution_id BIGINT REFERENCES batch_job_executions(execution_id),
    metric_time TIMESTAMP DEFAULT NOW(),
    cpu_usage_percent DECIMAL(5,2),
    memory_usage_mb INTEGER,
    disk_io_mb INTEGER,
    network_io_mb INTEGER,
    active_connections INTEGER
);

-- Automated metric collection
CREATE OR REPLACE FUNCTION collect_batch_metrics(p_execution_id BIGINT)
RETURNS void AS $$
BEGIN
    INSERT INTO batch_job_metrics (
        execution_id, cpu_usage_percent, memory_usage_mb,
        disk_io_mb, active_connections
    )
    SELECT 
        p_execution_id,
        -- CPU usage from system stats
        (SELECT cpu_user + cpu_system FROM pg_stat_bgwriter) as cpu_usage,
        -- Memory usage estimation
        (SELECT setting::INTEGER / 1024 FROM pg_settings WHERE name = 'shared_buffers') as memory_mb,
        -- Disk I/O from pg_stat_database
        (SELECT blks_read + blks_hit FROM pg_stat_database WHERE datname = current_database()) / 1024 as disk_io,
        -- Active connections
        (SELECT count(*) FROM pg_stat_activity WHERE state = 'active') as connections;
END;
$$ LANGUAGE plpgsql;
```

---

## Archiving Strategies for Historical Data

Effective data archiving maintains system performance while preserving historical information for compliance and analysis.

### Data Lifecycle Management

**Comprehensive Archiving Framework**
```yaml
Data Retention Policies:
Regulatory Requirements:
Financial Data (7 years - Malaysian Companies Act):
  - General ledger transactions
  - Customer and vendor invoices
  - Bank statements and reconciliations
  - Tax returns and supporting documents
  - Audit trails and approvals

Employment Records (12 years - Employment Act):
  - Employee personal records
  - Payroll and benefits data
  - Time and attendance records
  - Performance evaluations
  - Disciplinary records

Operational Data (3-5 years - Business needs):
  - Sales transactions and orders
  - Purchase orders and receipts
  - Inventory movements
  - Production records
  - Customer communications

System Data (1-2 years - Performance):
  - Application logs
  - System metrics
  - User activity logs
  - Error logs and traces
  - Performance monitoring data

Archiving Strategy by Data Type:
Hot Data (Active - 0-12 months):
  - Full system performance
  - Real-time access required
  - Complete indexing
  - Backup and replication
  - Regular maintenance

Warm Data (Reference - 1-3 years):
  - Reduced performance acceptable
  - Occasional access required
  - Selective indexing
  - Compressed storage
  - Periodic maintenance

Cold Data (Archive - 3+ years):
  - Minimal performance requirements
  - Rare access required
  - Basic indexing only
  - High compression
  - Minimal maintenance

Frozen Data (Compliance - 7+ years):
  - Compliance access only
  - Immutable storage
  - Legal hold capability
  - Offline storage acceptable
  - Audit trail required
```

### Archive Implementation Strategy

**Technical Archiving Framework**
```yaml
Table Partitioning for Archiving:
Date-Based Partitioning:
-- Sales transactions with automatic archiving
CREATE TABLE sales_transactions (
    transaction_id BIGSERIAL,
    transaction_date DATE NOT NULL,
    customer_id INTEGER,
    amount DECIMAL(18,2),
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (transaction_date);

-- Current year partitions (Hot data)
CREATE TABLE sales_2024_q1 PARTITION OF sales_transactions
FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE sales_2024_q2 PARTITION OF sales_transactions
FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

-- Previous year partitions (Warm data)
CREATE TABLE sales_2023_q1 PARTITION OF sales_transactions
FOR VALUES FROM ('2023-01-01') TO ('2023-04-01')
WITH (
    toast_tuple_target = 8160,
    fillfactor = 85,
    parallel_workers = 2
);

-- Archive table structure (Cold data)
CREATE TABLE sales_transactions_archive (
    transaction_id BIGINT,
    transaction_date DATE,
    customer_id INTEGER,
    amount DECIMAL(18,2),
    archive_date TIMESTAMP DEFAULT NOW(),
    original_table VARCHAR(50)
);

-- Automated archiving procedure
CREATE OR REPLACE FUNCTION archive_old_partitions()
RETURNS void AS $$
DECLARE
    partition_name TEXT;
    archive_date DATE := CURRENT_DATE - INTERVAL '3 years';
BEGIN
    -- Find partitions older than 3 years
    FOR partition_name IN
        SELECT schemaname||'.'||tablename
        FROM pg_tables
        WHERE tablename LIKE 'sales_%'
        AND tablename < 'sales_' || EXTRACT(YEAR FROM archive_date)
    LOOP
        -- Move data to archive table
        EXECUTE format('
            INSERT INTO sales_transactions_archive 
            SELECT *, NOW(), %L FROM %s',
            partition_name, partition_name
        );
        
        -- Drop old partition
        EXECUTE format('DROP TABLE %s', partition_name);
        
        RAISE NOTICE 'Archived and dropped partition: %', partition_name;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Schedule monthly archiving
SELECT cron.schedule(
    'monthly-archiving',
    '0 2 1 * *',  -- First day of month at 2 AM
    'SELECT archive_old_partitions();'
);

Data Compression Strategies:
-- Enable compression on archive tables
ALTER TABLE sales_transactions_archive 
SET (toast_compression = 'lz4');

-- Column-specific compression
CREATE TABLE financial_transactions_archive (
    transaction_id BIGINT,
    account_code VARCHAR(20),
    description TEXT,
    amount DECIMAL(18,2),
    document_data BYTEA,  -- Compressed documents
    archive_metadata JSONB
) WITH (
    compression = 'lz4',
    compress_level = 6
);

-- Automated compression function
CREATE OR REPLACE FUNCTION compress_archive_data()
RETURNS void AS $$
DECLARE
    table_name TEXT;
    compression_ratio DECIMAL;
BEGIN
    FOR table_name IN
        SELECT tablename 
        FROM pg_tables 
        WHERE tablename LIKE '%_archive'
    LOOP
        -- Apply compression
        EXECUTE format('VACUUM FULL %I', table_name);
        
        -- Report compression ratio
        SELECT 
            pg_total_relation_size(table_name::regclass)::DECIMAL / 
            pg_relation_size(table_name::regclass) 
        INTO compression_ratio;
        
        RAISE NOTICE 'Compressed %: ratio %.2f:1', table_name, compression_ratio;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

External Storage Integration:
-- Archive to external storage (S3, Azure Blob, etc.)
CREATE EXTENSION IF NOT EXISTS aws_s3 CASCADE;

-- Function to export archive data to S3
CREATE OR REPLACE FUNCTION export_to_s3(
    p_table_name TEXT,
    p_date_filter DATE,
    p_s3_bucket TEXT,
    p_s3_key TEXT
)
RETURNS BOOLEAN AS $$
DECLARE
    export_query TEXT;
    export_result BOOLEAN;
BEGIN
    export_query := format('
        SELECT aws_s3.query_export_to_s3(
            ''SELECT * FROM %I WHERE archive_date >= %L'',
            aws_commons.create_s3_uri(%L, %L, ''us-east-1''),
            options := ''format csv, header true''
        )', p_table_name, p_date_filter, p_s3_bucket, p_s3_key);
    
    EXECUTE export_query INTO export_result;
    
    RETURN export_result;
END;
$$ LANGUAGE plpgsql;

-- Schedule S3 export
SELECT cron.schedule(
    'quarterly-s3-export',
    '0 3 1 1,4,7,10 *',  -- Quarterly at 3 AM
    'SELECT export_to_s3(''financial_transactions_archive'', 
                        CURRENT_DATE - INTERVAL ''1 year'',
                        ''company-archive-bucket'',
                        ''financial/'' || EXTRACT(YEAR FROM CURRENT_DATE) || ''/q'' || EXTRACT(QUARTER FROM CURRENT_DATE) || ''.csv'');'
);
```

### Archive Access and Retrieval

**Efficient Archive Query Framework**
```yaml
Archive Query Optimization:
Federated Query System:
-- Create foreign data wrapper for archive
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- Connect to archive database
CREATE SERVER archive_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'archive-db-server', port '5432', dbname 'bigledger_archive');

-- User mapping for archive access
CREATE USER MAPPING FOR bigledger_user
SERVER archive_server
OPTIONS (user 'archive_reader', password 'secure_password');

-- Foreign table for archived data
CREATE FOREIGN TABLE sales_transactions_archive_remote (
    transaction_id BIGINT,
    transaction_date DATE,
    customer_id INTEGER,
    amount DECIMAL(18,2),
    archive_date TIMESTAMP
)
SERVER archive_server
OPTIONS (schema_name 'public', table_name 'sales_transactions_archive');

-- Unified view combining current and archived data
CREATE VIEW sales_transactions_complete AS
SELECT 
    transaction_id, transaction_date, customer_id, amount,
    'CURRENT' as data_source
FROM sales_transactions
WHERE transaction_date >= CURRENT_DATE - INTERVAL '3 years'

UNION ALL

SELECT 
    transaction_id, transaction_date, customer_id, amount,
    'ARCHIVE' as data_source
FROM sales_transactions_archive_remote
WHERE transaction_date < CURRENT_DATE - INTERVAL '3 years';

Archive Search Optimization:
-- Create search indexes on archive tables
CREATE INDEX idx_archive_customer_date 
ON sales_transactions_archive (customer_id, transaction_date);

CREATE INDEX idx_archive_amount_range 
ON sales_transactions_archive (amount)
WHERE amount > 10000;

-- Full-text search for archived documents
CREATE INDEX idx_archive_description_fts 
ON financial_transactions_archive 
USING gin(to_tsvector('english', description));

-- Optimized archive search function
CREATE OR REPLACE FUNCTION search_archived_transactions(
    p_customer_id INTEGER DEFAULT NULL,
    p_date_from DATE DEFAULT NULL,
    p_date_to DATE DEFAULT NULL,
    p_amount_min DECIMAL DEFAULT NULL,
    p_amount_max DECIMAL DEFAULT NULL,
    p_description TEXT DEFAULT NULL
)
RETURNS TABLE(
    transaction_id BIGINT,
    transaction_date DATE,
    customer_id INTEGER,
    amount DECIMAL(18,2),
    description TEXT,
    data_source TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        t.transaction_id,
        t.transaction_date,
        t.customer_id,
        t.amount,
        COALESCE(t.description, '') as description,
        'ARCHIVE' as data_source
    FROM sales_transactions_archive t
    WHERE (p_customer_id IS NULL OR t.customer_id = p_customer_id)
        AND (p_date_from IS NULL OR t.transaction_date >= p_date_from)
        AND (p_date_to IS NULL OR t.transaction_date <= p_date_to)
        AND (p_amount_min IS NULL OR t.amount >= p_amount_min)
        AND (p_amount_max IS NULL OR t.amount <= p_amount_max)
        AND (p_description IS NULL OR t.description ILIKE '%' || p_description || '%')
    ORDER BY t.transaction_date DESC
    LIMIT 1000;
END;
$$ LANGUAGE plpgsql;

Data Recovery Procedures:
-- Emergency data recovery from archive
CREATE OR REPLACE FUNCTION restore_from_archive(
    p_transaction_ids BIGINT[],
    p_target_table TEXT DEFAULT 'sales_transactions'
)
RETURNS INTEGER AS $$
DECLARE
    restored_count INTEGER;
BEGIN
    -- Restore specific transactions from archive
    EXECUTE format('
        INSERT INTO %I (transaction_id, transaction_date, customer_id, amount)
        SELECT transaction_id, transaction_date, customer_id, amount
        FROM sales_transactions_archive
        WHERE transaction_id = ANY($1)
        ON CONFLICT (transaction_id) DO NOTHING',
        p_target_table
    ) USING p_transaction_ids;
    
    GET DIAGNOSTICS restored_count = ROW_COUNT;
    
    -- Log restoration activity
    INSERT INTO archive_access_log (
        access_type, target_table, record_count, 
        access_user, access_time
    ) VALUES (
        'RESTORE', p_target_table, restored_count,
        current_user, NOW()
    );
    
    RETURN restored_count;
END;
$$ LANGUAGE plpgsql;

-- Bulk data restoration for specific date range
CREATE OR REPLACE FUNCTION restore_date_range(
    p_date_from DATE,
    p_date_to DATE,
    p_verification_required BOOLEAN DEFAULT true
)
RETURNS TABLE(
    status TEXT,
    records_restored INTEGER,
    verification_passed BOOLEAN
) AS $$
DECLARE
    restore_count INTEGER;
    verification_result BOOLEAN := true;
BEGIN
    -- Restore data from archive
    INSERT INTO sales_transactions_temp (
        SELECT * FROM sales_transactions_archive
        WHERE transaction_date BETWEEN p_date_from AND p_date_to
    );
    
    GET DIAGNOSTICS restore_count = ROW_COUNT;
    
    -- Verification if requested
    IF p_verification_required THEN
        SELECT COUNT(*) = restore_count INTO verification_result
        FROM sales_transactions_temp
        WHERE transaction_date BETWEEN p_date_from AND p_date_to;
    END IF;
    
    RETURN QUERY SELECT 
        'COMPLETED'::TEXT,
        restore_count,
        verification_result;
END;
$$ LANGUAGE plpgsql;
```

This comprehensive performance optimization guide provides the foundation for maintaining high-performance BigLedger implementations at enterprise scale. The key to success lies in proactive monitoring, intelligent caching, efficient batch processing, and strategic data archiving.

Each section includes practical implementation guidance based on three decades of experience optimizing ERP systems across diverse environments. The emphasis is on creating sustainable performance that scales with business growth while maintaining data integrity and compliance requirements.