#Tsagan Garyaeva
#Comp - 269
#HW 7 

use my_guitar_shop;

#1
select distinct category_name 
from categories 
where category_id  in 
(select distinct category_id
from products )
order by category_name;
  
  
#2
select product_name, list_price 
from products
where list_price > 
(select avg(list_price)
from products)
order by list_price desc;

#3

select category_name 
from categories
where not exists
(select * 
from products 
where category_name =categories.category_name);

#4
select  sum(item_price) as max_order_total,email_address, order_id
from 
( select  max(item_price) as max_list_price
from order_items) as max_invoice
group by email_address;


#4 

select * 
from categories;


