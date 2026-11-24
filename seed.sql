-- ============================================
-- E-Commerce Sales Analysis: Seed Data
-- Small mock dataset for learning purposes
-- ============================================

-- Customers
INSERT INTO customers (first_name, last_name, email, city, state) VALUES
('Alice', 'Johnson', 'alice.j@email.com', 'Seattle', 'WA'),
('Bob', 'Smith', 'bob.s@email.com', 'Portland', 'OR'),
('Carol', 'Davis', 'carol.d@email.com', 'Austin', 'TX'),
('David', 'Wilson', 'david.w@email.com', 'Seattle', 'WA'),
('Emma', 'Brown', 'emma.b@email.com', 'Denver', 'CO'),
('Frank', 'Miller', 'frank.m@email.com', 'Austin', 'TX');

-- Products
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 999.99, 50),
('Mouse', 'Electronics', 25.00, 200),
('Keyboard', 'Electronics', 75.00, 120),
('T-Shirt', 'Clothing', 20.00, 300),
('Jeans', 'Clothing', 55.00, 150),
('Coffee Maker', 'Home', 89.00, 80),
('Blender', 'Home', 45.00, 90),
('Notebook', 'Stationery', 5.00, 500);

-- Orders
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2024-01-15', 'completed'),
(2, '2024-01-20', 'completed'),
(1, '2024-02-05', 'completed'),
(3, '2024-02-10', 'cancelled'),
(4, '2024-03-01', 'completed'),
(5, '2024-03-05', 'completed'),
(2, '2024-03-10', 'completed'),
(6, '2024-03-12', 'completed'),
(1, '2024-04-01', 'completed'),
(3, '2024-04-05', 'completed');

-- Order items (quantity, unit_price at time of purchase)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
-- Order 1: Alice
(1, 1, 1, 999.99), -- Laptop
(1, 2, 1, 25.00),  -- Mouse
-- Order 2: Bob
(2, 3, 1, 75.00),  -- Keyboard
(2, 4, 2, 20.00),  -- T-Shirt x2
-- Order 3: Alice
(3, 5, 1, 55.00),  -- Jeans
(3, 8, 5, 5.00),   -- Notebook x5
-- Order 4: Carol (cancelled)
(4, 6, 1, 89.00),  -- Coffee Maker
-- Order 5: David
(5, 7, 1, 45.00),  -- Blender
(5, 4, 1, 20.00),  -- T-Shirt
-- Order 6: Emma
(6, 1, 1, 999.99), -- Laptop
(6, 2, 2, 25.00),  -- Mouse x2
-- Order 7: Bob
(7, 3, 2, 75.00),  -- Keyboard x2
(7, 8, 10, 5.00),  -- Notebook x10
-- Order 8: Frank
(8, 5, 3, 55.00),  -- Jeans x3
(8, 6, 1, 89.00),  -- Coffee Maker
-- Order 9: Alice
(9, 1, 1, 999.99), -- Laptop
(9, 7, 1, 45.00),  -- Blender
-- Order 10: Carol
(10, 4, 5, 20.00), -- T-Shirt x5
(10, 8, 20, 5.00); -- Notebook x20
