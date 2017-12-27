#Tsagan Garyaeva
#COMP-269
#EX15


#1
USE ap;
DELIMITER //
CREATE PROCEDURE insert_glaccount

(
    account_number_param   INT,
    account_description_param VARCHAR(111)
)

BEGIN   
    INSERT INTO general_ledger_accounts
    VALUES (account_number_param, account_description_param);     
END//


CALL insert_glaccount(1002, 'Just a test3');

#2
USE ap;
DELIMITER //
CREATE  FUNCTION test_glaccounts_description
(
     candidate_description_param VARCHAR(111)
     
)
RETURNS INT
BEGIN
    DECLARE candidate_description_param_var INT;
    SELECT COUNT(*)
    INTO candidate_description_param
    FROM general_ledger_accounts
    WHERE account_description = candidate_description_param;
    
    RETURN candidate_description_param;
END//

