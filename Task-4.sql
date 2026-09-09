CREATE DATABASE OrderManagement;
USE OrderManagement;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Order_Item (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Customer VALUES
(1, 'Arun', 'arun@gmail.com', '9876543210'),
(2, 'Kavin', 'kavin@gmail.com', '9876543211'),
(3, 'Priya', 'priya@gmail.com', '9876543212');
INSERT INTO Orders VALUES
(101, 1, '2026-09-01', 1500.00, 'Delivered'),
(102, 2, '2026-09-02', 2500.00, 'Pending'),
(103, 3, '2026-09-03', 1800.00, 'Shipped');
INSERT INTO Order_Item VALUES
(1, 101, 'Laptop Bag', 1, 1500.00),
(2, 102, 'Keyboard', 2, 1250.00),
(3, 103, 'Headphones', 1, 1800.00);
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT 
    o.order_id,
    c.customer_name,
    oi.product_name,
    oi.quantity,
    oi.price,
    o.status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Order_Item oi ON o.order_id = oi.order_id;
