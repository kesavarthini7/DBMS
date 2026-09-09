CREATE DATABASE PaymentTrackingDB2;
USE PaymentTrackingDB2;

CREATE TABLE customer(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
email VARCHAR(100),
phone VARCHAR(15)
);

CREATE TABLE Payment ( 
payment_id INT PRIMARY KEY, 
customer_id INT, 
order_id INT, 
payment_mode VARCHAR(30) NOT NULL, 
payment_date DATE NOT NULL, 
amount DECIMAL(10,2) NOT NULL, 
payment_status VARCHAR(20) NOT NULL, 
FOREIGN KEY (customer_id) 
REFERENCES Customer(customer_id) 
);

INSERT INTO Customer VALUES 
(1, 'Rahul Kumar', 'rahul@gmail.com', '9100002001'), 
(2, 'Priya Devi', 'priya@gmail.com', '9100002002'), 
(3, 'Sanjay Raj', 'sanjay@gmail.com', '9100002003'), 
(4, 'Keerthana Sri', 'keerthana@gmail.com', '9100002004'), 
(5, 'Vignesh Kumar', 'vignesh@gmail.com', '9100002005');

INSERT INTO Payment VALUES 
(701, 1, 3001, 'UPI', '2026-09-01', 8500.00, 'Successful'), 
(702, 2, 3002, 'Debit Card', '2026-09-01', 14200.00, 'Successful'), 
(703, 3, 3003, 'Net Banking', '2026-09-02', 5600.00, 'Pending'), 
(704, 4, 3004, 'Credit Card', '2026-09-02', 11750.00, 'Failed'), 
(705, 5, 3005, 'UPI', '2026-09-03', 9300.00, 'Successful'), 
(706, 1, 3006, 'Cash', '2026-09-03', 2500.00, 'Successful'), 
(707, 3, 3007, 'Debit Card', '2026-09-04', 6800.00, 'Failed'), 
(708, 2, 3008, 'UPI', '2026-09-04', 15600.00, 'Successful');

SELECT * FROM Customer;

SELECT * FROM Payment;

SELECT * 
FROM Payment 
WHERE payment_status = 'Successful'; 

SELECT * 
FROM Payment 
WHERE payment_status = 'Failed'; 

SELECT * 
FROM Payment 
WHERE payment_status = 'Pending';

UPDATE Payment 
SET payment_status = 'Successful' 
WHERE payment_id = 703;

SELECT 
p.payment_id, 
c.customer_name, 
p.order_id, 
p.payment_mode, 
p.payment_date, 
p.amount, 
p.payment_status 
FROM Payment p 
JOIN Customer c 
ON p.customer_id = c.customer_id 
ORDER BY p.payment_date;

SELECT 
payment_mode, 
COUNT(*) AS total_transactions 
FROM Payment 
GROUP BY payment_mode 
ORDER BY total_transactions DESC;

SELECT 
payment_mode, 
SUM(amount) AS total_amount 
FROM Payment 
WHERE payment_status = 'Successful' 
GROUP BY payment_mode 
ORDER BY total_amount DESC;

SELECT 
SUM(amount) AS total_failed_amount 
FROM Payment 
WHERE payment_status = 'Failed';

SELECT 
payment_id, 
customer_id, 
order_id, 
payment_mode, 
amount, 
payment_status 
FROM Payment 
WHERE amount > 10000 
ORDER BY amount DESC;

SELECT 
    c.customer_id, 
    c.customer_name, 
    COUNT(p.payment_id) AS total_payments, 
    SUM( 
        CASE 
            WHEN p.payment_status = 'Successful' 
            THEN p.amount 
            ELSE 0 
        END 
    ) AS successful_amount 
FROM Customer c 
LEFT JOIN Payment p 
ON c.customer_id = p.customer_id 
GROUP BY c.customer_id, c.customer_name 
ORDER BY successful_amount DESC;

SELECT 
    payment_date, 
COUNT(*) AS total_transactions, 
SUM(amount) AS total_amount 
FROM Payment 
GROUP BY payment_date 
ORDER BY payment_date;

SELECT 
p.payment_id, 
c.customer_name, 
p.order_id, 
p.payment_mode, 
p.payment_date, 
p.amount, 
p.payment_status 
FROM Payment p 
JOIN Customer c 
ON p.customer_id = c.customer_id 
ORDER BY p.payment_id;