/*Tsagan Garyaeva
 Comp - 269
 HW6*/
 
 
 #1
 use my_guitar_shop;
select count(*) as order_count, sum(tax_amount) as tax_total
from orders;


#2
select  category_name,
count(*) as product_count, 
max(list_price) as most_expensive_product
FROM categories  JOIN products
on categories.category_id = products.category_id
group by category_name
order by most_expensive_product;
#3
SELECT email_address, SUM(item_price) AS item_price_total, 
SUM( quantity * discount_amount )AS discount_amount_total
FROM customers c JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY email_address
ORDER BY discount_amount_total DESC;


#4
select email_address , count(*) as order_count,
sum((item_price - discount_amount) * quantity) as order_total
from customers join orders  on 
customers.billing_address_id = orders.billing_address_id
join order_items on orders.order_id =order_items.order_id
group by email_address
having count(*) >1
order by order_total desc;

#5
select email_address , count(*) as order_count,
sum((item_price - discount_amount) * quantity) as order_total
from customers join orders  on 
customers.billing_address_id = orders.billing_address_id
join order_items on orders.order_id =order_items.order_id
where item_price >=400
group by email_address
having count(*) >1
order by order_total desc;


#6

select product_name, 
sum((item_price-discount_amount) * quantity) as product_total
from products p join order_items oi
on p.product_id = oi.product_id
group by product_name with rollup;


#7
select email_address ,
 count(distinct oi.product_id) as number_of_product
 from customers c join orders o
 on c.customer_id = o.customer_id
 join order_items oi on o.order_id = oi.order_id
 group by email_address
 having count(distinct oi.product_id)>1
 order by email_address;

