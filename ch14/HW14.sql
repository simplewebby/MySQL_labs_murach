#Tsagan Garyaeva
#COMP-269
#HW14

#1
USE my_guitar_shop;
DELIMITER //
CREATE PROCEDURE test()
BEGIN
DECLARE sql_error TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR
SQLEXCEPTION
SET sql_error = TRUE;
START TRANSACTION;

DELETE FROM addresses WHERE customer_id=8; 
DELETE FROM customers WHERE customer_id=8;

IF sql_error = FALSE THEN 
COMMIT;
SELECT 'The trasaction was commited. ';
ELSE
ROLLBACK;
SELECT 'The transaction was rolled back. ';
END IF;
END//
