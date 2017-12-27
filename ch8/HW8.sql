# Tsagan Garyaeva
#Comp - 269
# HW8
#10-27-2017


#1

select list_price, 
format(list_price, 1) as price_format,
convert(list_price,signed) as price_convert,
cast(list_price as signed) as price_cast
from products;

#2

select date_added, 
cast(date_added as char(10)) as added_date,
cast(date_added as time) as added_time,
cast(date_added as char(7)) as added_char7
from products;