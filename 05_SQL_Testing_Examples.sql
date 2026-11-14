-- Generic practice SQL examples for a self-created DemoShop database.
-- These are templates only. Create your own local sample schema and synthetic data.
-- Do not run against employer, client, or production databases.

-- 1. Check duplicate email values in a sample Users table
SELECT email, COUNT(*) AS email_count
FROM Users
GROUP BY email
HAVING COUNT(*) > 1;

-- 2. Find orders without a matching user
SELECT o.order_id, o.user_id
FROM Orders o
LEFT JOIN Users u ON u.user_id = o.user_id
WHERE u.user_id IS NULL;

-- 3. Reconcile order total with order items
SELECT oi.order_id,
       SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM OrderItems oi
GROUP BY oi.order_id;

-- 4. Find records with missing mandatory values
SELECT *
FROM Users
WHERE email IS NULL OR email = '';

-- 5. Validate order status values
SELECT order_status, COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status;
