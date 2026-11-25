SELECT 
    DATE_TRUNC('month', order_date) AS order_month,
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_orders,
    SUM(CASE WHEN status = 'Canceled' THEN 1 ELSE 0 END) AS canceled_orders
FROM orders
GROUP BY 1;
