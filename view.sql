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


-- 3. Create a view with a calculated column
CREATE VIEW product_profit_view AS
SELECT
    product_id,
    product_name,
    category,
    unit_price,
    unit_cost,
    (unit_price - unit_cost) AS profit_per_unit,
    ROUND(
        ((unit_price - unit_cost) / unit_price) * 100,
        2
    ) AS profit_margin_percent
FROM products
WHERE unit_price > 0;


SELECT *
FROM product_profit_view
WHERE profit_margin_percent >= 20;

-- 4. Create a view with a subquery
CREATE VIEW top_customers AS
SELECT
    customer_id,
    customer_name,
    total_orders,
    total_revenue
FROM customer_revenue
WHERE total_revenue >= (
    SELECT AVG(total_revenue)
    FROM customer_revenue
);


SELECT *
FROM top_customers
ORDER BY total_revenue DESC;


