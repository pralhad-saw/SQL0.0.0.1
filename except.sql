SELECT product_id FROM inventory
EXCEPT
SELECT product_id FROM order_items;
