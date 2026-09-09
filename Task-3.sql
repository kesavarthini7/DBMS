CREATE DATABASE SellerInventoryDB;
USE SellerInventoryDB;
CREATE TABLE Seller (
    seller_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE Inventory (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);
INSERT INTO Seller (seller_name, phone, email) VALUES
('Arun Kumar', '9876543210', 'arun@gmail.com'),
('Priya Sharma', '9876543211', 'priya@gmail.com'),
('Rahul Kumar', '9876543212', 'rahul@gmail.com');
INSERT INTO Inventory
(product_name, category, price, quantity, seller_id)
VALUES
('Laptop', 'Electronics', 55000, 10, 1),
('Mobile Phone', 'Electronics', 25000, 15, 2),
('T-Shirt', 'Clothing', 600, 30, 2),
('Java Book', 'Books', 450, 20, 3),
('Headphones', 'Electronics', 1500, 25, 1);
SELECT * FROM Seller;
SELECT * FROM Inventory;
SELECT 
    i.product_id,
    i.product_name,
    i.category,
    i.price,
    i.quantity,
    s.seller_name
FROM Inventory i
JOIN Seller s
ON i.seller_id = s.seller_id;
SELECT 
    product_name,
    category,
    quantity
FROM Inventory
WHERE quantity < 20;
SELECT 
    product_name,
    quantity,
    price,
    (quantity * price) AS total_value
FROM Inventory;

