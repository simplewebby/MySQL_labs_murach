# Tsagan Garyaeva
#Comp - 269
# HW7
#10-27-2017



#1
select distinct category_name
from categories
where category_id in
(select distinct category_id
from products)
order by category_name;

#2 
SELECT product_name, list_price
   FROM products
WHERE list_price > 
(select 
 avg(list_price) as avg_list
from products)
order by product_name DESC;
  
#3
select category_name 
from categories
where not exists
(select  *
from products
where category_name  = categories.category_name);



#4 
select DISTINCT c.email_address, o.order_id, sum(item_price) as max_order_total
 from customers c join orders o
on c.customer_id = o.customer_id
join order_items oi on
o.order_id = oi.order_id
group by  order_id, email_address;


#5

SELECT product_name, discount_percent
FROM products
where discount_percent not in 
( select discount_percent
from products
group by discount_percent
having count(*) >1)
order by product_name;




#6 
SELECT email_address, orders.order_id, orders.order_date
    FROM orders JOIN 
  (SELECT orders.order_id, MIN(order_date) AS order_date
   FROM orders
   GROUP BY orders.order_id) AS first_order
  ON (orders.order_id = orders.order_id AND
      orders.order_date=orders.order_date)
JOIN customers
  ON orders.customer_id = customers.customer_id
  GROUP BY order_id ;








