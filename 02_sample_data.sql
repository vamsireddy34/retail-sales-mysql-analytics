USE retail_sales_analytics;

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Home Appliances'),
('Accessories'),
('Office Supplies');

INSERT INTO customers (customer_name, email, city, registration_date) VALUES
('Rahul Sharma','rahul@example.com','Hyderabad','2025-01-15'),
('Priya Reddy','priya@example.com','Vijayawada','2025-02-10'),
('Arjun Kumar','arjun@example.com','Bengaluru','2025-02-18'),
('Sneha Rao','sneha@example.com','Chennai','2025-03-05'),
('Kiran Varma','kiran@example.com','Hyderabad','2025-03-21'),
('Ananya Das','ananya@example.com','Visakhapatnam','2025-04-12'),
('Rohit Singh','rohit@example.com','Pune','2025-04-25'),
('Meena Devi','meena@example.com','Vijayawada','2025-05-09'),
('Vamsi Naidu','vamsi@example.com','Guntur','2025-05-17'),
('Neha Patel','neha@example.com','Mumbai','2025-06-02');

INSERT INTO products (product_name, category_id, unit_price, stock_quantity) VALUES
('Laptop',1,65000.00,20),
('Smartphone',1,28000.00,35),
('Bluetooth Speaker',1,3500.00,50),
('Refrigerator',2,42000.00,12),
('Microwave Oven',2,12000.00,18),
('Air Cooler',2,9000.00,15),
('Wireless Mouse',3,900.00,100),
('Keyboard',3,1500.00,80),
('USB-C Hub',3,2200.00,60),
('Notebook Pack',4,450.00,120),
('Desk Organizer',4,700.00,75),
('Office Chair',4,8500.00,25);

INSERT INTO orders (customer_id, order_date, order_status) VALUES
(1,'2025-06-05','Delivered'),
(2,'2025-06-07','Delivered'),
(3,'2025-06-10','Shipped'),
(4,'2025-06-12','Delivered'),
(5,'2025-06-15','Cancelled'),
(6,'2025-06-18','Delivered'),
(7,'2025-06-20','Delivered'),
(8,'2025-06-22','Pending'),
(9,'2025-06-25','Delivered'),
(10,'2025-06-28','Shipped'),
(1,'2025-07-03','Delivered'),
(3,'2025-07-06','Delivered'),
(6,'2025-07-08','Cancelled'),
(8,'2025-07-10','Delivered'),
(9,'2025-07-12','Pending');

INSERT INTO order_items (order_id, product_id, quantity, selling_price) VALUES
(1,1,1,65000),(1,7,2,900),
(2,2,1,28000),(2,8,1,1500),
(3,3,2,3500),(3,9,1,2200),
(4,5,1,12000),(4,10,3,450),
(5,4,1,42000),
(6,6,1,9000),(6,7,1,900),
(7,12,1,8500),(7,11,2,700),
(8,2,1,28000),
(9,1,1,65000),(9,8,2,1500),
(10,9,2,2200),(10,10,5,450),
(11,2,2,28000),(11,7,1,900),
(12,4,1,42000),(12,5,1,12000),
(13,3,1,3500),
(14,12,1,8500),(14,11,1,700),
(15,1,1,65000);

INSERT INTO payments (order_id, payment_date, payment_method, payment_status) VALUES
(1,'2025-06-05','UPI','Paid'),
(2,'2025-06-07','Card','Paid'),
(3,'2025-06-10','UPI','Paid'),
(4,'2025-06-12','Net Banking','Paid'),
(5,'2025-06-15','Card','Refunded'),
(6,'2025-06-18','UPI','Paid'),
(7,'2025-06-20','Cash','Paid'),
(8,'2025-06-22','UPI','Pending'),
(9,'2025-06-25','Card','Paid'),
(10,'2025-06-28','Net Banking','Paid'),
(11,'2025-07-03','UPI','Paid'),
(12,'2025-07-06','Card','Paid'),
(13,'2025-07-08','UPI','Refunded'),
(14,'2025-07-10','Cash','Paid'),
(15,'2025-07-12','Card','Pending');
