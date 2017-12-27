#Tsagan Garyaeva
#COMP-269
#EX14

#1
USE ap;
DELIMITER //
CREATE PROCEDURE test()
BEGIN
DECLARE sql_error TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR
SQLEXCEPTION
SET sql_error = TRUE;
START TRANSACTION;

UPDATE vendors
    SET vendor_name = 'FedUP'
    WHERE vendor_id = 122;
    
    UPDATE invoices
    SET vendor_id = 122
    WHERE vendor_id = 123;
    
    DELETE FROM vendors
    WHERE vendor_id = 123;

IF sql_error = FALSE THEN 
COMMIT;
SELECT 'The trasaction was commited. ';
ELSE
ROLLBACK;
SELECT 'The transaction was rolled back. ';
END IF;
END//

#2
USE ap;
DELIMITER //
CREATE PROCEDURE test1()
BEGIN
DECLARE sql_error TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR
SQLEXCEPTION
SET sql_error = TRUE;
START TRANSACTION;

DELETE FROM invoice_line_items WHERE invoice_id=114; 
DELETE FROM invoices WHERE invoice_id=114;

IF sql_error = FALSE THEN 
COMMIT;
SELECT 'The trasaction was commited. ';
ELSE
ROLLBACK;
SELECT 'The transaction was rolled back. ';
END IF;
END//

