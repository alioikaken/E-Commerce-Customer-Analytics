CREATE TABLE registration_sources (
    source_id SERIAL PRIMARY KEY,
    source_name VARCHAR(100) NOT NULL
);

CREATE TABLE customer_segments (
    segment_id SERIAL PRIMARY KEY,
    segment_name VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    source_id INT REFERENCES registration_sources(source_id),
    segment_id INT REFERENCES customer_segments(segment_id)
);

CREATE TABLE customer_addresses (
    address_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    city VARCHAR(100) NOT NULL,
    street VARCHAR(200) NOT NULL
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(120) NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(category_id),
    product_name VARCHAR(200) NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE coupons (
    coupon_id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    discount_percent NUMERIC(5, 2) NOT NULL
);

CREATE TABLE discounts (
    discount_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    discount_percent NUMERIC(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    coupon_id INT REFERENCES coupons(coupon_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    payment_method VARCHAR(50) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    rating INT NOT NULL,
    comment TEXT
);

CREATE TABLE returns (
    return_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    return_date DATE NOT NULL,
    reason TEXT
);

CREATE TABLE return_items (
    return_item_id SERIAL PRIMARY KEY,
    return_id INT REFERENCES returns(return_id),
    order_item_id INT REFERENCES order_items(order_item_id),
    quantity INT NOT NULL
);

CREATE TABLE customer_activity (
    activity_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    activity_type VARCHAR(100) NOT NULL,
    occurred_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);