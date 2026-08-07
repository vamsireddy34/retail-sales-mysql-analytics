USE retail_sales_analytics;

-- Example transaction for placing an order.
-- Run only after understanding the statements.

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, order_status)
VALUES (2, CURRENT_DATE, 'Pending');

SET @new_order_id = LAST_INSERT_ID();

INSERT INTO order_items (order_id, product_id, quantity, selling_price)
SELECT @new_order_id, product_id, 1, unit_price
FROM products
WHERE product_id = 7;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 7
  AND stock_quantity > 0;

-- If all statements succeed:
COMMIT;

-- If something goes wrong before COMMIT:
-- ROLLBACK;
