-- ============================================
-- E-Commerce Sales Analysis: Queries
-- Run each block separately in PostgreSQL
-- ============================================

-- 1. Total revenue by product category
-- Which categories are driving the business?
SELECT 
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 2. Top 5 customers by lifetime spend
-- Who are our best customers?
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.city,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY total_spent DESC
LIMIT 5;

-- 3. Monthly revenue trend
-- How is the store growing over time?
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY 1
ORDER BY 1;

-- 4. Average order value
-- Using a CTE to first calculate each order's total, then average them
WITH order_totals AS (
    SELECT 
        o.order_id,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'completed'
    GROUP BY o.order_id
)
SELECT 
    ROUND(AVG(order_total), 2) AS average_order_value,
    COUNT(*) AS total_completed_orders
FROM order_totals;

-- 5. Inactive customers
-- Customers with NO orders in the last 30 days
-- (relative to the most recent order date in the data)
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.email
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.order_date >= (
          SELECT MAX(order_date) FROM orders
      ) - INTERVAL '30 days'
);

-- 6. Top-ranked products within each category
-- Window function: rank products by revenue inside their own category
SELECT 
    p.category,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS product_revenue,
    RANK() OVER (
        PARTITION BY p.category 
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS category_rank
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.category, p.product_name
ORDER BY p.category, category_rank;

-- 7. Order status breakdown
-- What percentage of orders are completed vs cancelled?
SELECT 
    status,
    COUNT(*) AS order_count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM orders), 2) AS percent_of_total
FROM orders
GROUP BY status
ORDER BY order_count DESC;
