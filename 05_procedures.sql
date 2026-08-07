USE retail_sales_analytics;

DROP PROCEDURE IF EXISTS get_customer_orders;
DELIMITER $$

CREATE PROCEDURE get_customer_orders(IN p_customer_id INT)
BEGIN
    SELECT
        o.order_id,
        o.order_date,
        o.order_status,
        ROUND(SUM(oi.quantity * oi.selling_price), 2) AS order_total
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.customer_id = p_customer_id
    GROUP BY o.order_id, o.order_date, o.order_status
    ORDER BY o.order_date DESC;
END $$

DELIMITER ;

-- Example:
-- CALL get_customer_orders(1);
