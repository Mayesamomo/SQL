--1. Create a new table in your database. Give it an auto-incrementing primary key, 
-- and one column each with the data type date,
-- time, and decimal.
CREATE TABLE my_favorite_manga(
manga_id INT AUTO_INCREMENT PRIMARY KEY,
release_date DATE,
released_time TIME,
no_pages DECIMAL(10,
2)
)


--2. Insert three rows, without explicitly adding a value to the primary key column.

INSERT  INTO my_favorite_manga(release_date, released_time, no_pages) 
VALUES('2018-02-13', '14:30:00', 195.00),
('2020-11-13', '14:30:00', 250.00),
(NOW(), NOW(), 300.00);

--3. Replace one of the existing rows.

REPLACE INTO my_favorite_manga (manga_id, release_date,released_time, no_pages)
VALUE
(2, '2023-02-10', '11:30:00', 45.67);

--4. Update one (and only one) of the other rows.
UPDATE my_favorite_manga 
SET release_date  ='2023-07-11', released_time = '12:30:00', no_pages = 550
WHERE manga_id = 5

--5 Delete one row.

DELETE FROM my_favorite_manga WHERE manga_id = 3


--6. Add a column. Make it so that this column will only accept whole numbers, and will not accept null values.

ALTER TABLE my_favorite_manga 
ADD COLUMN chapters INT NOT NULL;

--7. Rename this column.
ALTER TABLE my_favorite_manga  
CHANGE COLUMN chapters  
no_chapters INT NOT NULL;

--8. Give this column a default value.

ALTER TABLE my_favorite_manga 
ALTER COLUMN no_chapters SET DEFAULT 20;


--9. Delete a column.
ALTER TABLE my_favorite_manga 
DROP COLUMN no_chapters;

--10. Delete your table.
DROP TABLE my_favorite_manga 

