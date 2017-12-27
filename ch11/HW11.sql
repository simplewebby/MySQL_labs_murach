#Tsagan Garyaeva
#Comp-268
#HW 11


#1
USE my_guitar_shop;
CREATE INDEX index_zip_code_ix
ON addresses (zip_code);


#2

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema my_web_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema my_web_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `my_web_db` DEFAULT CHARACTER SET utf8 ;
USE `my_web_db` ;

-- -----------------------------------------------------
-- Table `my_web_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_web_db`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email_address` VARCHAR(100) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_web_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_web_db`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_web_db`.`downloads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_web_db`.`downloads` (
  `download_id` INT NOT NULL AUTO_INCREMENT,
  `download_date` DATETIME NULL,
  `file_name` VARCHAR(50) NULL,
  `users_user_id` INT NOT NULL,
  `products_product_id` INT NOT NULL,
  PRIMARY KEY (`download_id`),
    FOREIGN KEY (`users_user_id`)
    REFERENCES `my_web_db`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_downloads_products1`
    FOREIGN KEY (`products_product_id`)
    REFERENCES `my_web_db`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


#3
INSERT INTO users
VALUES
(default,'rocky@gmail.com', ' Rocky', 'Mendes'),
(default,'lisa@yahoo.com', 'Lisa', 'Brown');

INSERT INTO products
VALUES
(default,'CD-1'),
(default,'CD-2');

INSERT INTO downloads
VALUES
(default, NOW(),'hello_world_mp3', 1,2),
(default, NOW(),'hello_world1_mp3', 2, 1),
(default, NOW(),'hello_world2_mp3', 2, 2);


SELECT email_address, first_name, last_name,download_date, file_name, product_name
FROM users   INNER JOIN downloads  ON
user_id = user_id 
JOIN products  ON
product_id = product_id
ORDER  BY email_address DESC , product_name ASC ;

#4

ALTER TABLE products 
ADD  product_price DECIMAL (3,2)  DEFAULT 9.99,
ADD product_added TIMESTAMP;

#5

ALTER TABLE users
MODIFY first_name VARCHAR (20) NOT NULL;


INSERT INTO users
value (default, 'foo@yahoo.com', NULL,'Colle');


INSERT INTO users
value (default, 'foo@yahoo.com', '5555555555555555555555555555','Colle');





