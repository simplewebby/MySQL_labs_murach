/*Tsagan Garyaeva
COMP - 269
HomeWork 2
*/

#1

SELECT product_code, product_name, list_price, discount_percent
FROM products
ORDER BY  list_price DESC;
#2

SELECT CONCAT(first_name,',  ' ,last_name) AS full_name
FROM customers
WHERE last_name REGEXP '[^M-^Z]'
ORDER BY last_name ASC;
# 3
SELECT product_name, list_price, date_added
FROM products
WHERE list_price BETWEEN 500 AND 2000
ORDER BY date_added DESC;
#4 
SELECT product_name, list_price, discount_percent, 
ROUND(((list_price * discount_percent)/100),2)  AS 'discount_amount' ,
ROUND(list_price -((list_price * discount_percent)/100),2) AS 'discount_price'

FROM products
ORDER BY list_price -((list_price * discount_percent)/100) DESC LIMIT 0,5;
#5

SELECT item_id, item_price,discount_amount, quantity,
item_price  * quantity AS 'price_total',
discount_amount * quantity AS 'discount_total',
 (item_price - discount_amount) * quantity AS 'item_total'
FROM order_items
WHERE (item_price - discount_amount) * quantity  > 500
ORDER BY (item_price - discount_amount) * quantity  DESC;


#6

SELECT order_id, order_date,ship_date
FROM orders
WHERE ship_date IS NULL;
#7  
SELECT NOW() AS 'today_unformatted',
DATE_FORMAT(CURRENT_DATE, '%e-%b-%Y') AS 'today_formatted';



#8

SELECT 100 AS   'price',
.07 AS 'tax_rate',
100 * .07 AS 'tax_amount',
100 + (100 * .07) AS 'total';









