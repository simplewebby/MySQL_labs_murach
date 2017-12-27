 /*Tsagan Garyaeva
 Comp - 269
 Lab6*/
 
 
 #1
 use ap;
select   vendor_id ,
SUM( invoice_total) As invoice_total
from invoices
group by vendor_id;

#2
select   vendor_name,
SUM( payment_total) As payment_total_sum
FROM vendors  JOIN invoices
on vendors.vendor_id  = invoices.vendor_id
group by vendor_name
order by payment_total_sum ;
#3
select vendor_name, COUNT(*) AS  invoice_count, 
SUM(invoice_total) as invoice_total_sum
FROM invoices JOIN vendors
ON invoices.vendor_id = vendors.vendor_id
group by vendor_name
ORDER BY invoice_count desc;

#4
select account_description, COUNT(*) as line_item_id , SUM(line_item_amount) As  line_item_account_sum
from general_ledger_accounts  join invoice_line_items
on general_ledger_accounts.account_number = invoice_line_items.account_number
group by general_ledger_accounts.account_number 
having COUNT(*)>=2
order by line_item_account_sum desc;


#5

select account_description, COUNT(*) as line_item_id , SUM(line_item_amount) As  line_item_account_sum
from general_ledger_accounts   join invoice_line_items
on general_ledger_accounts.account_number = invoice_line_items.account_number 
 join invoices 
on invoice_line_items.invoice_id = invoices.invoice_id
where  invoice_date between '2014-04-01' and '2014-06-30'
group by general_ledger_accounts.account_number 
having COUNT(*)>=2  
 order by line_item_account_sum ;

#6
select account_number , SUM(line_item_amount) as line_item_amount_sum
from invoice_line_items
group by account_number with rollup ;


#7

select vendor_name , count(DISTINCT invoice_line_items.account_number) as number_of_gl_accounts
 from vendors join invoices on
 vendors.vendor_id = invoices.vendor_id
 join invoice_line_items 
 on invoices.invoice_id = invoice_line_items.invoice_id
 group by vendor_name
 having count(DISTINCT invoice_line_items.account_number) >1
 order by vendor_name;



