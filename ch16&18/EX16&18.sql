#Tsagan Garyaeva
#COMP-269
#EX16&18


#Chapter 16
#1
USE ap;

DROP TRIGGER IF EXISTS invoices_before_update;

DELIMITER //

CREATE TRIGGER invoices_before_update
  BEFORE UPDATE ON invoices
  FOR EACH ROW
BEGIN
  DECLARE sum_line_item_amount DECIMAL(9,2);
  
  SELECT SUM(line_item_amount) 
  INTO sum_line_item_amount
  FROM invoice_line_items
  WHERE invoice_id = NEW.invoice_id;
  
  IF (NEW.credit_total + NEW.payment_total > NEW.invoice_total) THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT =  'invoice_credit + payment_total may not exceed the maximum ' ;
        
  END IF;
END//

DELIMITER ;

DROP TRIGGER  invoices_after_update;
UPDATE invoices
SET payment_total = 170
WHERE invoice_id = 1;

SELECT invoice_id, invoice_total, credit_total, payment_total 
FROM invoices WHERE invoice_id = 1;

#Chapter 16
#2

DELIMITER //
CREATE TRIGGER invoices_after_update
AFTER UPDATE ON invoices
FOR EACH ROW
BEGIN
INSERT INTO invoices_audit VALUES
    (OLD.vendor_id, OLD.invoice_number, OLD.invoice_total, 
    'INSERTED', NOW());
END//
DELIMITER ;

-- DROP TRIGGER invoices_after_update;
CREATE TABLE invoices_audit
(
  vendor_id           INT             NOT NULL,
  invoice_number      VARCHAR(50)     NOT NULL,
  invoice_total       DECIMAL(9,2)    NOT NULL,
  action_type         VARCHAR(50)     NOT NULL,
  action_date         DATETIME        NOT NULL
);

INSERT INTO invoices_audit VALUES 
(115, 34, 555, 'B',  '2014-09-30');


UPDATE invoices_audit
SET invoice_total =567
WHERE vendor_id =115;

#Chapter 18

#1
CREATE USER tg_admin@localhost IDENTIFIED BY 'pa55word';
 
 
#2
-- DROP USER ray@localhost;
CREATE USER ray@localhost IDENTIFIED BY 'temp' ;

GRANT SELECT, INSERT, UPDATE
ON ap.vendors
TO ray@localhost IDENTIFIED BY 'temp' ;

GRANT SELECT, INSERT, UPDATE
ON ap.invoices TO ray@localhost IDENTIFIED BY 'temp';

GRANT SELECT, INSERT
ON ap.invoice_line_items TO ray@localhost IDENTIFIED BY 'temp' WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE 
ON ap.invoices 
TO ray@localhost WITH GRANT OPTION;

GRANT SELECT, INSERT
ON ap.invoice_line_items 
TO ray@localhost WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE 
ON ap.vendors
TO ray@localhost WITH GRANT OPTION;

#3
SHOW GRANTS FOR ray@localhost;






     
       
       

