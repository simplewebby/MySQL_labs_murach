/*Tsagan Garyaeva
COMP - 269
Home Work #4 */
#1
SELECT product_name,
category_name, list_price
FROM products JOIN categories 
ON categories.category_id = products.category_id
ORDER BY category_name, product_name;


 #2
SELECT distinct first_name, last_name, line1, city, state, zip_code
FROM Customers c join  Addresses a
ON c.customer_id = a.customer_id
WHERE c.email_address  like  'allan.sherwood@yahoo.com' ; 
#3
SELECT first_name, last_name,
line1, city, state, zip_code
FROM customers JOIN addresses ON
customers.customer_id = addresses.customer_id
AND
customers.shipping_address_id = addresses.address_id;
#4
SELECT c.last_name, 
c.first_name, 
order_date, 
p.product_name, 
item_price, 
discount_amount, 
quantity
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN products AS p ON oi.product_id = p.product_id
ORDER BY last_name, order_date, product_name;


#5
SELECT distinct v1.product_name , v1.list_price
FROM  products v1 JOIN  products v2
ON v1.list_price = v2.list_price 
AND  v1.product_id <> v2.product_id
ORDER BY product_name; 
#6 
SELECT distinct category_name, product_id 
FROM categories  left  JOIN products
ON categories.category_id = products.category_id
WHERE  product_id IS NULL; 
#7
SELECT  ' SHIPPED' AS  ship_status, order_id, order_date
 FROM  orders 
 WHERE  ship_date is not NULL 
 UNION
 SELECT ' NOT SHIPPED'   AS ship_status, order_id, order_date
 FROM  orders 
 WHERE  ship_date is  NULL
 ORDER BY order_date;




