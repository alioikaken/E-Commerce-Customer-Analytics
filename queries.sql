SELECT
    s.source_name,
    COUNT(c.customer_id) AS customers_count
FROM registration_sources s
LEFT JOIN customers c ON c.source_id = s.source_id
GROUP BY s.source_id, s.source_name
ORDER BY customers_count DESC;

SELECT
    seg.segment_name,
    COUNT(DISTINCT c.customer_id) AS customers_count,
    COALESCE(SUM(o.total_amount), 0) AS total_revenue
FROM customer_segments seg
LEFT JOIN customers c ON c.segment_id = seg.segment_id
LEFT JOIN orders o ON o.customer_id = c.customer_id AND o.status = 'completed'
GROUP BY seg.segment_id, seg.segment_name
ORDER BY total_revenue DESC;

SELECT
    c.customer_id,
    c.full_name,
    c.email,
    COUNT(o.order_id) AS orders_count,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id AND o.status = 'completed'
GROUP BY c.customer_id, c.full_name, c.email
ORDER BY total_spent DESC;

SELECT
    DATE_TRUNC('month', order_date) AS month_start,
    COUNT(order_id) AS orders_count,
    SUM(total_amount) AS revenue
FROM orders
WHERE status = 'completed'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month_start;

SELECT
    cat.category_name,
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS gross_sales
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
JOIN categories cat ON cat.category_id = p.category_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY cat.category_name, p.product_name
ORDER BY gross_sales DESC;

SELECT
    payment_method,
    COUNT(*) AS payments_count,
    SUM(amount) AS total_amount
FROM payments
WHERE status = 'paid'
GROUP BY payment_method
ORDER BY total_amount DESC;

SELECT
    p.product_name,
    COUNT(r.review_id) AS reviews_count,
    ROUND(AVG(r.rating), 2) AS avg_rating
FROM products p
JOIN reviews r ON r.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY avg_rating DESC, reviews_count DESC;

SELECT
    r.reason,
    COUNT(r.return_id) AS returns_count,
    COALESCE(SUM(ri.quantity), 0) AS returned_items
FROM returns r
LEFT JOIN return_items ri ON ri.return_id = r.return_id
GROUP BY r.reason
ORDER BY returns_count DESC;