#Tsagan Garyaeva
#Comp -269
#HW12


#1

USE my_guitar_shop;
CREATE OR REPLACE VIEW customer_addresses AS 

SELECT c.customer_id , email_address, last_name, first_name,
ba.line1 AS bill_line1,
ba.line2 AS bill_line2,
ba.city AS bill_city,
ba.state AS bill_state,
ba.zip_code AS bill_zip,
sa.line1 AS ship_line1,
sa.line2 AS ship_line2,
sa.city AS ship_city,
sa.state AS ship_state,
sa.zip_code AS ship_zip
FROM customers c JOIN addresses ba ON c.billing_address_id = ba.address_id
JOIN addresses sa ON c.shipping_address_id = sa.address_id
ORDER BY last_name, first_name;

#2

SELECT customer_id, last_name, first_name, bill_line1
FROM customer_addresses
ORDER BY customer_id;

#3

UPDATE customer_addresses
SET ship_line1 = '1990 Westwood Blvd'
WHERE customer_id = 8;

#4
USE my_guitar_shop;
CREATE OR REPLACE VIEW order_item_product  AS 
SELECT o.order_id, order_date, tax_amount, 
ship_date,
product_name, 
item_price, 
discount_amount,
item_price - discount_amount AS final_price,
quantity,
(item_price - discount_amount) * quantity AS item_total
 FROM orders o JOIN order_items li 
 ON o.order_id = li.order_id 
 JOIN products p 
 ON 
li.product_id = p.product_id;




#5

CREATE OR REPLACE VIEW product_summary  AS 
SELECT product_name, 
COUNT(*) AS order_count,
SUM(item_total) AS order_total
FROM order_item_product
GROUP BY product_name;

#6
SELECT  product_name, order_total
FROM product_summary
ORDER BY order_total DESC LIMIT 5;











