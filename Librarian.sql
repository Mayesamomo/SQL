-- table Normalized 
use N01583452

CREATE table librarian_tbl(
librarian_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NUll, 
last_name  VARCHAR (50) NOT NULL
);

CREATE TABLE shift_tbl(
shift_id INT PRIMARY KEY AUTO_INCREMENT,
shift_type VARCHAR(20) NOT NULL
);
-- 
CREATE TABLE assignment_tbl(
assignment_id INT PRIMARY KEY AUTO_INCREMENT,
assignment_name VARCHAR(150) NOT NULL
);
-- 
CREATE TABLE day_tbl(
day_id INT PRIMARY KEY AUTO_INCREMENT,
day_name VARCHAR(20) NOT NULL
);
--  
CREATE TABLE shit_day_tbl (
 shift_day_id INT PRIMARY KEY AUTO_INCREMENT,
librarian_id INT NOT NULL,
shift_id INT NOT NULL,
assignment_id INT NOT NULL,
day_id INT NOT NULL,
shift_date DATE NOT NULL
 );
 
 



-- insert data into tables

