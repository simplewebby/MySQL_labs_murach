/*Tsagan Garyaeva
COMP -269
HW5*/

#1
insert  into categories
(category_name) 
value( 'Brass');

select category_id, category_name
from categories
where category_name = 'Brass';


#2
update products
set product_name = 'Woodwinds'
where category_id=
(select category_id
from categories
where category_id = 6 );



select product_name 
from products
where product_name= 'Woodwinds';
#3

delete from categories
where category_id =6;

#4
insert into products
( category_id, product_code, product_name, description, list_price, discount_percent, date_added)
values
( 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come' , 799.99, 0, '2017-10-09  08:09:00');


#5
update  products
set  discount_percent =35
where category_id = 4;

#6 

delete from products 
where category_id  =4 ;
 
 
DELETE FROM categories
WHERE category_id =4;














