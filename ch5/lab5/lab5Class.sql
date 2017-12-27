/*Tsagan Garyaeva
COMP -269
Lab 5*/

#1
insert  into terms 
(terms_id, terms_description,terms_due_days)
values ( 6, 'Net due 120 days', 120);

#2
update terms 
set terms_description = ' Net due 125 days',
terms_due_days = 125
where terms_id = 6;
#3

delete from terms
where terms_id =6;

#4
insert into invoices
(vendor_id,invoice_number,invoice_date,invoice_total,payment_total,credit_total,terms_id,invoice_due_date,payment_date)
values
( 32, 'AX-014-027', '8/1/2014', 434.58, 0.00, 0.00, 2, '8/31/2014', null);


select invoice_id, vendor_id
from invoices
where vendor_id=32 AND invoice_number = 'AX-014-027' AND invoice_total= 434.58;




#5
insert into  invoice_line_items
(invoice_id,invoice_sequence, account_number, line_item_amount, line_item_description)
values (116, 1,160, 180.23, 'Hard drive'),( 116, 2, 527, 254.35, 'Exchange Server update');
#6 
update invoices
set credit_total = 0.10 * invoice_total and invoice_total= payment_total + credit_total
where vendor_id=32;
#7  

UPDATE vendors
set default_account_number = 403
WHERE  vendor_id =44;

#8 
UPDATE  invoices
SET terms_id = 2 
WHERE vendor_id  IN 
(SELECT vendor_id
FROM vendors 
WHERE default_terms_id =2);



#9
DELETE FROM invoice_line_items
WHERE invoice_id IN
(SELECT invoice_id
FROM invoices
WHERE vendor_id=32);






















