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
