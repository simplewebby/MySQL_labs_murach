# Tsagan Garyaeva
#Comp - 269
# Lab 7
#10-19-2017



#1
select distinct vendor_name
from vendors
where vendor_id in
(select distinct vendor_id
from invoices)
order by vendor_name;

#2 
SELECT invoice_number, invoice_total
   FROM invoices
WHERE invoice_total >
(select  avg(invoice_total)
from invoices)
order by invoice_total desc;
  
#3
select account_number, account_description
from general_ledger_accounts
where not exists
(select  * 
from invoice_line_items
where account_number  = general_ledger_accounts.account_number);


#4
select vendor_name, i.invoice_id, invoice_sequence, line_item_amount
from vendors v join invoices i 
on v.vendor_id = i.vendor_id
join invoice_line_items ili on
i.invoice_id = ili.invoice_id
where i.invoice_id  in
(select distinct invoice_id 
from invoice_line_items
where invoice_sequence >1)
order by  vendor_name, i.invoice_id, invoice_sequence;


#5
select  sum(invoice_max) as sum_invoice_max
from
(select 
max(invoice_total) as invoice_max
from invoices 
where invoice_total - credit_total-payment_total >0 
group by vendor_id) as max_invoice; 

#6
SELECT vendor_name, vendor_city, vendor_state
FROM vendors 
WHERE concat(vendor_state , vendor_city) NOT IN
	(SELECT concat(vendor_state , vendor_city) as vendor_city_state
	FROM vendors 
    GROUP BY vendor_city_state
    HAVING count(*)>1)
 ORDER BY vendor_name, vendor_city ;
	


#7
SELECT vendor_name, invoice_number ,
       first_invoice.invoice_date, invoice_total
FROM invoices JOIN 
  (SELECT vendor_id, MIN(invoice_date) AS invoice_date
   FROM invoices
   GROUP BY vendor_id) AS first_invoice
  ON (invoices.vendor_id = first_invoice.vendor_id AND
      invoices.invoice_date = first_invoice.invoice_date)
JOIN vendors
  ON invoices.vendor_id = vendors.vendor_id
ORDER BY vendor_name;

#8
SELECT vendor_name, invoice_number AS first_inv,
       first_invoice.invoice_date, invoice_total
FROM invoices JOIN 
  (SELECT vendor_id, MIN(invoice_date) AS invoice_date
   FROM invoices
   GROUP BY vendor_id) AS first_invoice
  ON (invoices.vendor_id = first_invoice.vendor_id AND
      invoices.invoice_date = first_invoice.invoice_date)
JOIN vendors
  ON invoices.vendor_id = vendors.vendor_id
ORDER BY vendor_name;
