CREATE DATABASE ADDRESSBOOK;
CREATE DATABASE IF NOT EXISTS ADDRESSBOOK;
USE ADDRESSBOOK ;

-- CRETAE TABLE 
CREATE TABLE info(
	Name VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(30)
);

-- INSERT VALUE 
INSERT INTO info(Name, Phone, Email)
VALUES
("Maria", "017783326029", "zannatulfarzana363@gmail.com"),
("Sapna", "01920504841", "taslimasapna363@gmail.com");

SELECT * FROM info;
SET SQL_SAFE_UPDATES= 0;

-- ADD NEW CONTATCT
INSERT INTO info(Name, Phone, Email)
VALUES
("Kamal", "01912912671", "mdmostafakamalpasha@gmail.com");

-- UPDATE CONTATCT (UPDATE TABLE > SET COL= CONDITION)
UPDATE info
SET Phone= "01608233419"
WHERE Name= "Maria";

-- DELETE CONTACT
DELETE FROM info
WHERE Name= "Sapna";

-- retrieve all contacts
SELECT * FROM info
WHERE Name LIKE "K%";

-- retrieve all contacts
SELECT * FROM info
WHERE Name LIKE "%A";

