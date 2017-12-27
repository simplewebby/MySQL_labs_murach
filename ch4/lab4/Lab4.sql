/*Tsagan Garyaeva
  COMP -269
  9-26-17
  Class Lab 4 */

#1
SELECT * 
FROM vendors
 JOIN invoices;

#2
SELECT vendor_name, invoice_number, invoice_date, 
invoice_total - payment_total - credit_total AS 'balance_due'
FROM vendors v JOIN invoices i 
ON v.vendor_id = i.invoice_id
WHERE invoice_total - payment_total - credit_total <> 0
ORDER BY vendor_name ASC;

#3
SELECT vendor_name, default_account_number AS 'default_account', account_description AS 'description' 
FROM vendors JOIN general_ledger_accounts 
ON vendors.default_account_number = general_ledger_accounts.account_number 
ORDER BY 
 account_description;


#4
SELECT vendor_name AS 'vendor_name', invoice_date AS 'invoice_date', invoice_number AS 'invoice_number', 
invoice_sequence AS 'li_sequence',
line_item_amount AS 'li_amount'
FROM vendors v  JOIN invoices i 
ON v.vendor_id = i.invoice_id
JOIN invoice_line_items il
ON i.invoice_id = il.invoice_id
ORDER BY vendor_name, invoice_date, invoice_number, invoice_sequence;

#5 


SELECT customersv1.vendor_id, v1.vendor_name,
CONCAT(v1.vendor_contact_first_name ,' ',v1.vendor_contact_last_name) AS 'contact_name'
FROM  vendors v1 join vendors v2
ON v1.vendor_contact_last_name = v2.vendor_contact_last_name AND
v1.vendor_id <> v2.vendor_id
ORDER BY v1.vendor_contact_last_name;

#6

SELECT DISTINCT g.account_number, account_description
FROM general_ledger_accounts g LEFT OUTER JOIN invoice_line_items il 
ON g.account_number = il.account_number 
WHERE il.invoice_id IS NULL
ORDER BY g.account_number;
 

 #7
SELECT   vendor_name, vendor_state, 'CA' AS value
FROM vendors
WHERE vendor_state = 'CA'
UNION 
SELECT vendor_name, vendor_state ,  'Outside CA' AS  value
FROM vendors
where  vendor_state <> 'CA '
ORDER BY vendor_name;


