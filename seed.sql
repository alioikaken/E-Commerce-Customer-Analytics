INSERT INTO registration_sources (source_name) VALUES
('Organic Search'),
('Instagram Ads'),
('Referral Program'),
('Google Ads'),
('Email Newsletter');

INSERT INTO customer_segments (segment_name) VALUES
('New'),
('Regular'),
('VIP'),
('At Risk');

INSERT INTO customers (full_name, email, registered_at, source_id, segment_id) VALUES
('Aruzhan Kassymova', 'aruzhan.k@example.com', '2026-01-12 10:15:00', 1, 3),
('Dias Nurpeisov', 'dias.n@example.com', '2026-01-18 14:30:00', 2, 2),
('Madina Suleimenova', 'madina.s@example.com', '2026-02-03 09:45:00', 3, 3),
('Arman Tulegenov', 'arman.t@example.com', '2026-02-14 18:20:00', 4, 2),
('Dinara Akhmetova', 'dinara.a@example.com', '2026-03-01 11:05:00', 1, 4),
('Nurlan Bekov', 'nurlan.b@example.com', '2026-03-19 16:40:00', 2, 1),
('Kamila Serikova', 'kamila.s@example.com', '2026-04-05 12:10:00', 5, 2),
('Timur Ospanov', 'timur.o@example.com', '2026-04-22 19:55:00', 1, 1);

INSERT INTO customer_addresses (customer_id, city, street) VALUES
(1, 'Almaty', 'Abay Ave 45, Apt 12'),
(2, 'Astana', 'Turan Ave 18, Apt 54'),
(3, 'Almaty', 'Dostyk Ave 104, Apt 8'),
(4, 'Shymkent', 'Tauke Khan Ave 32, Apt 19'),
(5, 'Almaty', 'Satpayev St 22, Apt 41'),
(6, 'Karaganda', 'Bukhar Zhyrau Ave 60, Apt 3'),
(7, 'Astana', 'Kabanbay Batyr Ave 11, Apt 87'),
(8, 'Almaty', 'Nazarbayev Ave 120, Apt 15');

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Sports & Outdoors'),
('Accessories');

INSERT INTO products (category_id, product_name, price) VALUES
(1, 'Wireless Noise-Cancelling Headphones', 149.99),
(1, 'Mechanical Gaming Keyboard', 89.50),
(1, 'Smart Fitness Watch', 199.00),
(2, 'Oversized Cotton Hoodie', 45.00),
(2, 'Running Sneakers', 79.90),
(3, 'Espresso Coffee Maker', 129.00),
(3, 'Minimalist Desk Lamp', 34.50),
(4, 'Yoga Mat Pro', 29.99),
(5, 'Leather Laptop Backpack', 65.00),
(5, 'USB-C Fast Charger 65W', 25.00);

INSERT INTO coupons (code, discount_percent) VALUES
('WELCOME10', 10.00),
('SPRING15', 15.00),
('VIP20', 20.00);

INSERT INTO discounts (product_id, discount_percent, start_date, end_date) VALUES
(1, 10.00, '2026-02-01', '2026-02-28'),
(4, 15.00, '2026-03-01', '2026-03-31'),
(6, 12.00, '2026-04-01', '2026-04-30');

INSERT INTO orders (customer_id, coupon_id, order_date, status, total_amount) VALUES
(1, 3, '2026-02-05 13:20:00', 'completed', 279.19),
(2, 1, '2026-02-10 17:45:00', 'completed', 80.55),
(3, NULL, '2026-02-18 11:10:00', 'completed', 129.00),
(1, NULL, '2026-03-04 15:00:00', 'completed', 90.00),
(4, 2, '2026-03-12 20:15:00', 'completed', 67.92),
(5, NULL, '2026-03-20 09:30:00', 'returned', 149.99),
(3, 3, '2026-04-02 14:50:00', 'completed', 159.20),
(6, 1, '2026-04-10 18:05:00', 'completed', 58.50),
(7, NULL, '2026-04-15 10:40:00', 'completed', 64.49),
(8, NULL, '2026-04-25 21:10:00', 'pending', 25.00);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 149.99),
(1, 3, 1, 199.00),
(2, 2, 1, 89.50),
(3, 6, 1, 129.00),
(4, 4, 2, 45.00),
(5, 5, 1, 79.90),
(6, 1, 1, 149.99),
(7, 3, 1, 199.00),
(8, 9, 1, 65.00),
(9, 7, 1, 34.50),
(9, 8, 1, 29.99),
(10, 10, 1, 25.00);

INSERT INTO payments (order_id, payment_method, amount, status) VALUES
(1, 'Card', 279.19, 'paid'),
(2, 'Apple Pay', 80.55, 'paid'),
(3, 'Card', 129.00, 'paid'),
(4, 'Kaspi Pay', 90.00, 'paid'),
(5, 'Card', 67.92, 'paid'),
(6, 'Card', 149.99, 'refunded'),
(7, 'Apple Pay', 159.20, 'paid'),
(8, 'Kaspi Pay', 58.50, 'paid'),
(9, 'Card', 64.49, 'paid'),
(10, 'Card', 25.00, 'pending');

INSERT INTO reviews (customer_id, product_id, rating, comment) VALUES
(1, 1, 5, 'Great sound quality and comfortable fit.'),
(1, 3, 5, 'Battery lasts almost a full week.'),
(2, 2, 4, 'Nice tactile switches, a bit loud at night.'),
(3, 6, 5, 'Makes rich espresso every morning.'),
(4, 5, 4, 'Very light and comfortable for daily runs.'),
(5, 1, 2, 'Left earcup stopped working after a week.');

INSERT INTO returns (order_id, return_date, reason) VALUES
(6, '2026-03-27', 'Defective left speaker');

INSERT INTO return_items (return_id, order_item_id, quantity) VALUES
(1, 7, 1);

INSERT INTO customer_activity (customer_id, activity_type, occurred_at) VALUES
(1, 'login', '2026-02-05 13:05:00'),
(1, 'view_product', '2026-02-05 13:12:00'),
(1, 'purchase', '2026-02-05 13:20:00'),
(2, 'login', '2026-02-10 17:30:00'),
(2, 'add_to_cart', '2026-02-10 17:40:00'),
(3, 'view_product', '2026-02-18 11:00:00'),
(4, 'apply_coupon', '2026-03-12 20:10:00'),
(5, 'request_return', '2026-03-27 12:00:00'),
(6, 'login', '2026-04-10 17:55:00'),
(7, 'purchase', '2026-04-15 10:40:00'),
(8, 'add_to_cart', '2026-04-25 21:05:00');