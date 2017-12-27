#Tsagan Garyaeva
#COMP-269
#HW15


#1
USE my_guitar_shop;

DELIMITER //
CREATE PROCEDURE insert_category

(
    category_id_param   INT,
    category_name_param VARCHAR(111)
)

BEGIN   
    INSERT INTO categories
    VALUES (default, category_name_param);     
END//




-- Test fail:
-- CALL insert_category(1, 'Guitars');
-- Test success:
 CALL insert_category(1, 'New Category');
-- Clean up:
 -- DELETE FROM categories WHERE category_id = LAST_INSERT_ID();
 
 
 #2
 
USE my_guitar_shop;
DELIMITER //
CREATE  FUNCTION discount_price
(
     item_id_param INT
     
)
RETURNS DECIMAL (9, 2)
BEGIN
    DECLARE discount_price_var DECIMAL (9, 2);
    SELECT item_price - discount_amount 
    INTO discount_price_var
    FROM order_items
    WHERE item_id = item_id_param;
    
    RETURN discount_price_var;
END//


SELECT item_id, item_price, discount_amount, discount_price(item_id)
FROM order_items;











 
