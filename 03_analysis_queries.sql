USE retail_sales_analytics;

-- 1. Basic filtering
SELECT *
FROM products
WHERE unit_price > 10000
ORDER BY unit_price DESC;

-- 2. Total number of orders by status
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- 3. Revenue by category for non-cancelled orders
SELECT
    c.category_name,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN categories c ON c.category_id = p.category_id
WHERE o.order_status <> 'Cancelled'
GROUP BY c.category_id, c.category_name
ORDER BY revenue DESC;

-- 4. Customers with spending above the average customer spend
WITH customer_spend AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * oi.selling_price) AS total_spend
    FROM customers c
    JOIN orders o ON o.customer_id = c.customer_id
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_name, ROUND(total_spend, 2) AS total_spend
FROM customer_spend
WHERE total_spend > (SELECT AVG(total_spend) FROM customer_spend)
ORDER BY total_spend DESC;

-- 5. Top-selling products using a window function
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity) AS units_sold,
        SUM(oi.quantity * oi.selling_price) AS revenue
    FROM products p
    JOIN order_items oi ON oi.product_id = p.product_id
    JOIN orders o ON o.order_id = oi.order_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_name,
    units_sold,
    ROUND(revenue, 2) AS revenue,
    DENSE_RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM product_sales
ORDER BY revenue_rank;

-- 6. Monthly revenue
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- 7. Customers who never placed an order
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

-- 8. Products with stock below category average
SELECT
    p.product_name,
    p.stock_quantity,
    c.category_name
FROM products p
JOIN categories c ON c.category_id = p.category_id
WHERE p.stock_quantity < (
    SELECT AVG(p2.stock_quantity)
    FROM products p2
    WHERE p2.category_id = p.category_id
);

-- 9. Payment method usage
SELECT payment_method, COUNT(*) AS transactions
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method
ORDER BY transactions DESC;

-- 10. Order-level invoice totals
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.order_status,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS order_total
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, c.customer_name, o.order_date, o.order_status
ORDER BY o.order_date, o.order_id;
