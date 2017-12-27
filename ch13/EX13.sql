#Tsagan Garyaeva
#Comp-269
#EX13

#1

USE ap;
#DROP PROCEDURE IF EXISTS test;
DELIMITER //
CREATE PROCEDURE test()
BEGIN 
DECLARE count_of_all_rows_var INTEGER( 2);



SELECT  COUNT(*)
INTO count_of_all_rows_var
FROM invoices
WHERE  ( invoice_total - credit_total- payment_total) >=5000;


IF  count_of_all_rows_var > 0 THEN 
SELECT CONCAT( count_of_all_rows_var , '  invoices exceed $ 5,000 ') AS messsage;
ELSE SELECT 'There are no invoices exceed $ 5000'  AS message;
END IF;
END//
DELIMITER ;
CALL test();




#2

USE ap;
#DROP PROCEDURE IF EXISTS test;
DELIMITER //
CREATE PROCEDURE test1()
BEGIN 
DECLARE count_invoices_var DECIMAL(9, 2);
DECLARE sum_balance_due DECIMAL(9, 2);


SELECT COUNT(*) as count_invoices_var, SUM( invoice_total - credit_total- payment_total)
INTO count_invoices_var, sum_balance_due
FROM invoices
WHERE sum_balance_due >0;


IF   sum_balance_due >= 30000 THEN 
SELECT CONCAT( count_invoices_var ) AS messsage;
ELSE SELECT 'Total balance due is less than $30,000'  AS message;
END IF;
END//
DELIMITER ;
CALL test1();








