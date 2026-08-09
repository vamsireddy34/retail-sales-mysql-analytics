USE retail_sales_analytics;

-- TRIGGERS

DROP TRIGGER IF EXISTS reduce_product_quantity;
delimiter $$
CREATE TRIGGER reduce_product_quantity
AFTER INSERT on order_items
FOR EACH ROW
BEGIN 
UPDATE products
SET stock_quantity=stock_quantity-new.quantity
WHERE product_id = new.product_id;
END $$
SHOW TRIGGERS;

delimiter ;


-- TESTING TRIGGERS

INSERT INTO order_items
(order_id, product_id, quantity, selling_price)
VALUES (2,3,2,50000);

SELECT * FROM products;

INSERT INTO order_items
(order_id, product_id, quantity, selling_price)
VALUES (3,7,9,20000);

-- PAYMENT TRIGGERS

DROP TRIGGER IF EXISTS payment_updated;
DELIMITER $$
CREATE TRIGGER payment_updated
AFTER UPDATE ON payments
FOR EACH ROW
BEGIN
    INSERT INTO payment_audit(
    payment_id, old_status, new_status)
    VALUES (new.payment_id, old.payment_status, new.payment_status); 
END $$

DELIMITER ;

UPDATE payments
SET payment_status = 'paid' 
WHERE payment_id = 8; 

SELECT * FROM payment_audit;
