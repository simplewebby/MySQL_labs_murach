#Tsagan Garyaeva
#Comp-268
#Ex11




USE ap;
#1
CREATE INDEX index_zip_code_ix
ON vendors (vendor_zip_code);
drop table members;
#2
USE ex;
DROP TABLE IF EXISTS members;
CREATE TABLE members
(member_id int NOT NULL  PRIMARY KEY,
 first_name varchar(50) NOT NULL,
 last_name varchar(50) NOT NULL,
 address varchar(100),
 city varchar(50),
 state varchar(50),
 phone varchar(50) 
 );
 
 USE ex;
DROP TABLE IF EXISTS groups;
CREATE TABLE groups
(group_id int NOT NULL  PRIMARY KEY,
 group_name varchar(50) NOT NULL  
);

USE ex;
DROP TABLE IF EXISTS members_groups;
CREATE TABLE members_groups
(group_id int REFERENCES groups(group_id),
 member_id int REFERENCES members(member_id));


#3
INSERT INTO members
VALUES
(1,'Lisa', 'Brown', '123 Main Street', 'Westfield', 'CA', '324-098-0987'),
(2,'Ken', 'Lowe', '10 East 4th Street', 'Brick', 'NJ', '222-028-0227');

INSERT INTO groups
VALUES
(1, 'Users'),
(2,'Managers');

INSERT INTO members_groups
VALUES 
(1,2),
(2, 1),
(2, 2);



SELECT  group_name AS 'Group Name', last_name AS 'Last Name', first_name AS 'First Name'
FROM groups g INNER JOIN members_groups mg ON
g.group_id = mg.group_id 
JOIN members  m ON
m.member_id = mg.member_id
ORDER BY group_name , last_name, first_name;



#4
ALTER TABLE members
ADD  annual_dues DECIMAL (9,2) DEFAULT 52.50,
ADD payment_date TIMESTAMP;



#5
ALTER TABLE groups 
MODIFY group_name varchar(50) NOT NULL UNIQUE;
 
 
 
 INSERT INTO groups
 value
 (1,'Users');

