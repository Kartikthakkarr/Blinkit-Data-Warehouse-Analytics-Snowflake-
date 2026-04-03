CREATE DATABASE blinkit_db;
USE blinkit_db;

CREATE SCHEMA analytics;
USE analytics;

CREATE OR REPLACE STAGE my_stage;



CREATE OR REPLACE TABLE orders (
    order_id STRING,
    customer_id STRING,
    order_date DATE,
    order_time STRING,
    order_status STRING,
    total_amount FLOAT
);

CREATE OR REPLACE TABLE order_items (
    order_id STRING,
    product_id STRING,
    product_name STRING,
    category STRING,
    quantity INT,
    price FLOAT
);

CREATE OR REPLACE TABLE delivery (
    order_id STRING,
    delivery_time INT,
    delivery_status STRING,
    distance_km FLOAT
);

CREATE OR REPLACE TABLE marketing (
    campaign_id STRING,
    order_id STRING,
    channel STRING,
    cost FLOAT,
    conversion_rate FLOAT
);

COPY INTO orders
FROM @my_stage/blinkit_orders.csv
FILE_FORMAT = my_csv_format;

COPY INTO order_items
FROM @my_stage/blinkit_order_items.csv
FILE_FORMAT = my_csv_format;

COPY INTO delivery
FROM @my_stage/blinkit_delivery_performance.csv
FILE_FORMAT = my_csv_format;

COPY INTO marketing
FROM @my_stage/blinkit_marketing_performance.csv
FILE_FORMAT = my_csv_format;

CREATE OR REPLACE VIEW blinkit_dashboard_view AS
SELECT 
    o.order_id,
    o.order_date,
    o.customer_id,
    o.total_amount,

    oi.product_name,
    oi.category,
    oi.quantity,

    d.delivery_time,
    d.delivery_status,

    m.channel,
    m.cost

FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN delivery d ON o.order_id = d.order_id
LEFT JOIN marketing m ON o.order_id = m.order_id;

/*revenue trend*/
SELECT order_date, SUM(total_amount) AS revenue
FROM orders
GROUP BY order_date
ORDER BY order_date;

/*Top Products*/
SELECT product_name, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 10;

/*Delivery Performance*/
SELECT delivery_status, COUNT(*) 
FROM delivery
GROUP BY delivery_status;

/*marketing roi*/
SELECT channel, SUM(cost) AS total_spend
FROM marketing
GROUP BY channel;

