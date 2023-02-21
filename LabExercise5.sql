/**
 *1.  Get a list of all books, including the author's names (duplicate books are okay, if the book has multiple authors
 * **/

SELECT DISTINCT b.title , b.genre,  CONCAT(a2.first_name, ' ', a2.last_name) AS 'Name'  FROM books b 
JOIN authorship a 
ON b.book_id = a.book_id 
JOIN authors a2
ON b.book_id =a2.author_id 



/**
 * 2. Get a list of all books withdrawn by people with the initials 'B.W.'. Show a column for the first name, last name, initials, 
 * and the title of the book. Remember: keep things concise.
 
 * **/

SELECT CONCAT(SUBSTR(first_name,1,1), ' ', SUBSTR(last_name,1,1) AS initials, first_name, last_name, title FROM books b 
RIGHT JOIN authorship a 
ON b.book_id = a.book_id 
LEFT JOIN authors a2 
ON a2.author_id = a.book_id 


/**
 *3. Get the number of books written by each American author. Include the first and last names of the author.
 *  Note that America might be represented in the 'country' column in more than one way
 *  - always check your results table to make sure you're getting the expected results.
 * **/

SELECT COUNT(*) , first_name, last_name from books b 
JOIN authorship a 
ON b.book_id = a.book_id 
JOIN authors a2 
ON a.author_id = a2.author_id
WHERE a2.country IN('USA', 'U.S.')
GROUP BY a.author_id 

/**
 *4. For any book withdrawn in October, get the member's first name, 
 * last name, the withdrawal date and the book's title. Hint:
 *  Try getting the month from a date using the scalar function MONTH()
 */
SELECT members.first_name, members.last_name, withdrawals.withdrawal_date
FROM withdrawals
JOIN members 
ON withdrawals.withdrawal_id  = members.member_id 
WHERE MONTH(withdrawals.withdrawal_date) = 10

/**
5. Get a list of people who have ever returned overdue books 
 (i.e. any withdrawal where the return date is greater than the due date). 
 Remember that, unless otherwise specified, lists shouldn't contain duplicate rows.
 */
SELECT DISTINCT first_name, last_name as  name
FROM members m
JOIN withdrawals w ON m.member_id  = w.member_id 
WHERE w.return_date > w.due_date;

/**
6. Get a list of all authors, and the books they wrote.
 Include authors multiple times if they wrote multiple books. Also include authors
  who don't have any books in the database. Hint: this is a tricky one
 - think back on why right joins exist in the first place.
 */

SELECT a.first_name  as name, b.title as title
from authors a 
JOIN authorship a2 
ON a.author_id = a2.author_id 
RIGHT JOIN books b 
ON 
a2.book_id  = b.book_id 
ORDER BY a.first_name , b.title 

--7. Get a list of members who've never withdrawn a book. 
-- Hint: outer joins return rows with null values if there is no match between the tables.

SELECT CONCAT( m.first_name," ", m.last_name  )  AS member
FROM members m
LEFT JOIN withdrawals w  ON m.member_id  = w.member_id 
WHERE w.book_id  IS NULL
ORDER BY m.first_name 

--8. Rewrite the above query as the opposite join (if you used a left join, rewrite it as a right join; 
-- if you used a right join, rewrite it as a left join).
-- The results table should contain the same data.

SELECT CONCAT(m.first_name, " ", m.last_name)  AS member
FROM withdrawals w 
RIGHT JOIN members m 
ON m.member_id  = w.member_id 
WHERE w.book_id  IS NULL
ORDER BY m.first_name 


--9 Cross join books and authors. Isn't that ridiculous?

SELECT b.title AS title, CONCAT(a.first_name, " ", a.last_name)  AS author
FROM books b
CROSS JOIN authors a
ORDER BY b.title, a.first_name 

--10.  Get a list of all members who have the same first name as other members. 
-- Sort it by first name so you can verify the data.

SELECT CONCAT(m.first_name, " ", m.last_name) AS member
FROM members m
WHERE EXISTS (
  SELECT 1
  FROM members AS other_members
  WHERE other_members.first_name  LIKE concat(m.first_name , '%')
    AND other_members.member_id  != m.member_id 
)
GROUP BY m.first_name 
ORDER BY m.first_name 