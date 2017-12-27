# Tsagan Garyaeva
#Comp - 269
# HW9
#10-27-2017
  
  
  #1
  SELECT list_price, discount_percent,
  ROUND((list_price *(discount_percent/100)),2) AS discount_amount
  FROM products;
  
  #2
select order_date, 
EXTRACT(YEAR from  order_date) as order_year,
DATE_FORMAT(order_date, '%b-%d-%Y') as order_date_formatted,
TIME_FORMAT( order_date,'%l:%i %p') as order_time,
CONCAT(DATE_FORMAT(order_date, '%m/%d/%y')  , '  ', TIME_FORMAT(order_date,'%h:%i ')) as order_date_time
from orders;

#3
select card_number , LENGTH(card_number) as card_number_lenght,
right(card_number, 4) as last_four_digits,
CONCAT((INSERT(card_number, 1,card_number  ,'XXXX-XXXX-XXXX-')), '', right(card_number, 4)) as formatted_number
 from orders;
 
 #4
 
 select order_id, order_date, 
 date_add(order_date, interval 2 day) as  approx_ship_date,
 ship_date,
 to_days(ship_date) - to_days(order_date) as days_to_ship
 from orders;