USE retail_sales_analytics;

CREATE OR REPLACE VIEW customer_sales_summary AS
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(DISTINCT CASE WHEN o.order_status <> 'Cancelled' THEN o.order_id END) AS completed_orders,
    COALESCE(
        ROUND(SUM(CASE
            WHEN o.order_status <> 'Cancelled'
            THEN oi.quantity * oi.selling_price
            ELSE 0
        END), 2),
        0
    ) AS total_spend
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
LEFT JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id, c.customer_name, c.city;

CREATE OR REPLACE VIEW product_performance AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.stock_quantity,
    COALESCE(SUM(CASE
        WHEN o.order_status <> 'Cancelled' THEN oi.quantity
        ELSE 0
    END), 0) AS units_sold,
    COALESCE(ROUND(SUM(CASE
        WHEN o.order_status <> 'Cancelled'
        THEN oi.quantity * oi.selling_price
        ELSE 0
    END), 2), 0) AS revenue
FROM products p
JOIN categories c ON c.category_id = p.category_id
LEFT JOIN order_items oi ON oi.product_id = p.product_id
LEFT JOIN orders o ON o.order_id = oi.order_id
GROUP BY p.product_id, p.product_name, c.category_name, p.stock_quantity;
