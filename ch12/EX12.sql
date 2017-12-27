#Tsagan Garyaeva
#COMP-269
#EX 12


#1
USE ap;
CREATE  OR REPLACE VIEW open_items
AS
SELECT vendor_name, invoice_number, invoice_total, (invoice_total-payment_total-credit_total) AS 'balance_due'
FROM  vendors JOIN invoices
ON vendors.vendor_id = invoices.vendor_id
WHERE (invoice_total-payment_total-credit_total) > 0 
ORDER  BY vendor_name;

#2
USE ap;

CREATE OR REPLACE VIEW open_items
AS
SELECT vendor_name, invoice_number, invoice_total, (invoice_total-payment_total-credit_total) AS 'balance_due',
(invoice_total-payment_total-credit_total) AS 'balance_due>=1000'
FROM  vendors JOIN invoices
ON vendors.vendor_id = invoices.vendor_id
WHERE (invoice_total-payment_total-credit_total) > 0  AND  (invoice_total-payment_total-credit_total) >= 1000
ORDER  BY vendor_name;

#3

USE ap;
CREATE OR REPLACE VIEW open_items_summary
AS
SELECT vendor_name,
COUNT(*) AS open_item_count,
SUM(invoice_total-payment_total-credit_total) AS open_item_total
FROM  vendors JOIN invoices
ON vendors.vendor_id = invoices.vendor_id
WHERE (invoice_total-payment_total-credit_total) > 0 
GROUP  BY vendor_name;

#4

SELECT * 
FROM  open_items_summary
LIMIT 5;

#5
CREATE OR REPLACE VIEW vendor_address AS
 SELECT   vendor_id, vendor_address1,  vendor_address2, vendor_city, vendor_state, vendor_zip_code
 FROM vendors;

#6
UPDATE vendor_address
SET vendor_address2 = '1990 Westwood Blvd Ste 260' , vendor_address1 = NULL
WHERE vendor_id = '4';







