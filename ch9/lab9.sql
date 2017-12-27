#Tsagan Garyaeva
#Comp-269
#Lab 9 

#1
select invoice_total, round(invoice_total,1) as one_digit,
round(invoice_total , 0) as zero_digit
from invoices;

#2
select start_date, DATE_FORMAT(start_date, '%b/ %d/%y') as format1,
DATE_FORMAT(start_date, '%c/%e/%y') as format2,
TIME_FORMAT(start_date,'%l:%i %p') as twelve_hour,
CONCAT(DATE_FORMAT(start_date, '%c/%e/%y')  , '  ', TIME_FORMAT(start_date,'%h:%i %p')) as format3
from date_sample;


#3

select vendor_name , UPPER(vendor_name) as vendor_name_upper,
 REPLACE(left(vendor_phone,  13), '   '  , ' )' ) as vendor_phone,
REPLACE(REPLACE(REPLACE(vendor_phone, '(' , ''  ), ')' , '.'  ) , '-' , '.'  )    as phone_with_dots ,
 SUBSTRING(vendor_name, Locate( ' ' ,vendor_name) + 1 ) as name
from vendors;