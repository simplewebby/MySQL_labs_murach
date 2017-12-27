#Tsagan Garyaeva
#Comp-269
#EX13

#1

USE ap;
#DROP PROCEDURE IF EXISTS test;
DELIMITER //
CREATE PROCEDURE test()
BEGIN 
DECLARE count_of_all_rows_var  DECIMAL(9, 2);

SELECT COUNT(*) as count_of_all_rows_var
INTO count_of_all_rows_var
FROM invoices
WHERE COUNT(*) >=5000;

END//
DELIMITER ;
CALL test();


#2
USE ap;
#DROP PROCEDURE IF EXISTS test;
DELIMITER //
CREATE PROCEDURE test()
BEGIN 
DECLARE count_of_all_rows DECIMAL(9, 2);

SELECT COUNT(invoice_total -payment_total - credit_total)
INTO count_of_all_rows
FROM invoices
WHERE (invoice_total -payment_total - credit_total)>=5000;
END//
DELIMITER ;
CALL test();