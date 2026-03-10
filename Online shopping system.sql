CREATE DATABASE online_shopping;
USE online_shopping;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances');

INSERT INTO customers (customer_name, email, phone, address) VALUES
('Rahul Sharma','rahul@gmail.com','9876543210','Bangalore'),
('Priya Singh','priya@gmail.com','9876501234','Delhi'),
('Arjun Reddy','arjun@gmail.com','9876512345','Hyderabad');

INSERT INTO products (product_name, price, stock, category_id) VALUES
('Smartphone',15000,20,1),
('Laptop',55000,10,1),
('T-Shirt',500,50,2),
('Microwave Oven',7000,15,4),
('Programming Book',800,30,3);

INSERT INTO orders (customer_id, order_date, total_amount, order_status) VALUES
(1,'2026-03-01',15500,'Completed'),
(2,'2026-03-02',800,'Completed'),
(3,'2026-03-03',55000,'Pending');

INSERT INTO order_details (order_id, product_id, quantity, price) VALUES
(1,1,1,15000),
(1,3,1,500),
(2,5,1,800),
(3,2,1,55000);

INSERT INTO payments (order_id, payment_date, amount, payment_method, payment_status) VALUES
(1,'2026-03-01',15500,'Online','Paid'),
(2,'2026-03-02',800,'Cash','Paid'),
(3,'2026-03-03',55000,'Card','Pending');

SELECT * FROM customers;
SELECT * FROM products;

SELECT o.order_id, c.customer_name, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

