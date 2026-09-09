CREATE DATABASE ProductCategoryDB;
USE ProductCategoryDB;
CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Clothing'),
('Books');
INSERT INTO Product (product_name, price, quantity, category_id) VALUES
('Laptop', 55000, 10, 1),
('T-Shirt', 600, 20, 2),
('Java Book', 450, 15, 3);
SELECT * FROM Category;
SELECT * FROM Product;
SELECT p.product_id, p.product_name, p.price,
       p.quantity, c.category_name
FROM Product p
JOIN Category c
ON p.category_id = c.category_id;