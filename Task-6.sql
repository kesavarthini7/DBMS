CREATE DATABASE ProductReviewDB;
USE ProductReviewDB;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0
);
CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    rating INT NOT NULL,
    review_title VARCHAR(150),
    review_text VARCHAR(500),
    review_date DATE NOT NULL,

    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),

    CHECK (rating BETWEEN 1 AND 5)
);
INSERT INTO Customer
(customer_id, customer_name, email, phone)
VALUES
(1, 'Keshavarthini', 'keshavarthini@gmail.com', '9876543210'),
(2, 'Arun Kumar', 'arun@gmail.com', '9876543211'),
(3, 'Priya', 'priya@gmail.com', '9876543212'),
(4, 'Rahul', 'rahul@gmail.com', '9876543213'),
(5, 'Divya', 'divya@gmail.com', '9876543214');
INSERT INTO Product
(product_id, product_name, category, price, stock_quantity)
VALUES
(101, 'Samsung Galaxy Phone', 'Mobile', 25000.00, 20),
(102, 'HP Laptop', 'Laptop', 55000.00, 15),
(103, 'Boat Bluetooth Headphones', 'Accessories', 1999.00, 50),
(104, 'Dell Monitor', 'Electronics', 12000.00, 25),
(105, 'Logitech Mouse', 'Accessories', 999.00, 40);
INSERT INTO Review
(review_id, product_id, customer_id, rating, review_title, review_text, review_date)
VALUES
(1, 101, 1, 5, 'Excellent Phone',
 'Very good performance and camera quality.', '2026-09-01'),

(2, 101, 2, 4, 'Good Product',
 'Battery backup is good and phone is easy to use.', '2026-09-02'),

(3, 102, 3, 5, 'Best Laptop',
 'Laptop performance is excellent for programming.', '2026-09-03'),

(4, 103, 4, 4, 'Good Sound',
 'Sound quality is very good for the price.', '2026-09-04'),

(5, 104, 5, 3, 'Average Monitor',
 'Display quality is good but speakers are average.', '2026-09-05'),

(6, 105, 1, 5, 'Excellent Mouse',
 'Smooth and comfortable to use.', '2026-09-06');
 SELECT * FROM Product;
 SELECT * FROM Customer;
SELECT * FROM Review;
SELECT *
FROM Review
WHERE rating = 5;
SELECT *
FROM Review
WHERE rating >= 4;
SELECT
    r.review_id,
    p.product_name,
    c.customer_name,
    r.rating,
    r.review_title,
    r.review_text,
    r.review_date
FROM Review r
JOIN Product p
    ON r.product_id = p.product_id
JOIN Customer c
    ON r.customer_id = c.customer_id;
    SELECT
    p.product_id,
    p.product_name,
    AVG(r.rating) AS average_rating
FROM Product p
LEFT JOIN Review r
    ON p.product_id = r.product_id
GROUP BY
    p.product_id,
    p.product_name;
SELECT
    p.product_id,
    p.product_name,
    COUNT(r.review_id) AS total_reviews
FROM Product p
LEFT JOIN Review r
    ON p.product_id = r.product_id
GROUP BY
    p.product_id,
    p.product_name;
    SELECT
    p.product_id,
    p.product_name,
    AVG(r.rating) AS average_rating
FROM Product p
JOIN Review r
    ON p.product_id = r.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING AVG(r.rating) >= 4;
SELECT
    c.customer_name,
    p.product_name,
    r.rating,
    r.review_title,
    r.review_text
FROM Customer c
JOIN Review r
    ON c.customer_id = r.customer_id
JOIN Product p
    ON r.product_id = p.product_id
ORDER BY c.customer_name;
SELECT
    p.product_id,
    p.product_name
FROM Product p
LEFT JOIN Review r
    ON p.product_id = r.product_id
WHERE r.review_id IS NULL;
UPDATE Review
SET
    rating = 5,
    review_title = 'Very Excellent',
    review_text = 'Excellent product and highly recommended.'
WHERE review_id = 2;
SELECT
    p.product_name,
    COUNT(r.review_id) AS total_reviews,
    AVG(r.rating) AS average_rating,
    MAX(r.rating) AS highest_rating,
    MIN(r.rating) AS lowest_rating
FROM Product p
LEFT JOIN Review r
    ON p.product_id = r.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY average_rating DESC;
