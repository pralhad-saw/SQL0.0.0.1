-- =============================
-- SQL VIEWS: INTERMEDIATE EXAMPLE
-- =============================

-- 1. Create a view that joins multiple tables
CREATE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

-- Use the view like a table
SELECT *
FROM customer_order_summary
WHERE status = 'DELIVERED'
ORDER BY order_date DESC;

-- 2. Create a view with aggregation
CREATE VIEW customer_revenue AS
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    AVG(o.total_amount) AS avg_order_value,
    MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;

-- Query the aggregated view
SELECT *
FROM customer_revenue
WHERE total_revenue > 10000
ORDER BY total_revenue DESC;
