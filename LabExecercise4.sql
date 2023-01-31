/**
1. In order to find out who took out books,
 and when: Get the withdrawals from the withdrawals table,
  then join the members table to include the first and last names of the people who made the withdrawals.
**/
SELECT withdrawal_date, CONCAT(first_name, ' ', last_name) AS name from withdrawals 
JOIN 
members 
ON withdrawals.member_id = members.member_id 

/**
 *2.  Modifying this query, join the books table to the existing tables.
 *  Now get the names of the books that were withdrawn.
 */
 
 SELECT withdrawal_date, CONCAT(first_name, ' ', last_name) AS name , title
from withdrawals 
JOIN 
members 
ON withdrawals.member_id = members.member_id 
JOIN books
ON withdrawals.book_id = books.book_id 


/**
 *3. Modifying this query again, order the results from the most recent withdrawal to the oldest.
 */
 
 SELECT withdrawal_date, CONCAT(first_name, ' ', last_name) AS name , title
from withdrawals 
JOIN 
members 
ON withdrawals.member_id = members.member_id 
JOIN books
ON withdrawals.book_id = books.book_id 
ORDER BY withdrawals.withdrawal_date DESC 

/**
 *4. Use an aggregate function to get the top 5 most borrowed books
 */
SELECT  title, COUNT(*) 
FROM withdrawals 
JOIN books 
ON withdrawals.book_id = books.book_id 
GROUP BY title  
ORDER BY 
COUNT(*) DESC 
LIMIT 5

 
--  SELECT withdrawal_date, CONCAT(first_name, ' ', last_name) AS name , title
-- from withdrawals 
-- JOIN 
-- members 
-- ON withdrawals.member_id = members.member_id 
-- JOIN books
-- ON withdrawals.book_id = books.book_id 
-- WHERE withdrawals.withdrawal_date  = (SELECT MAX(withdrawals.withdrawal_date))
-- ORDER BY withdrawals.withdrawal_date DESC 
-- LIMIT 5

/**
 5. Get a list of books, including the titles, and the authors' first and last names.

 */
 
 SELECT title, CONCAT(first_name, ' ', last_name) AS name  
FROM books b 
JOIN authorship a 
ON b.book_id = a.book_id 
JOIN authors a2 
ON a2.author_id = a.author_id 

/**
 6. Modify this query so that it only returns books from a certain genre (you choose).

 */
 
 SELECT title, CONCAT(first_name, ' ', last_name) AS name  
FROM books b 
JOIN authorship a 
ON b.book_id = a.book_id 
JOIN authors a2 
ON a2.author_id = a.author_id 
JOIN genres g
ON g.genreId = b.genre 
-- WHERE g.genreName = "comedy"
WHERE b.genre = 5



/**
 *7. Modify this query so that it only returns books from the 'Night of the Living Dummy' series.
 *  (Books in this series have a title that includes the words 'Night of the Living Dummy'.)

8.  Consider the following: why do we not put authors directly into the books table?
to prevent redundancy
 * **/
 SELECT title, CONCAT(first_name, ' ', last_name) AS name  
FROM books b 
JOIN authorship a 
ON b.book_id = a.book_id 
JOIN authors a2 
ON a2.author_id = a.author_id 
JOIN genres g
WHERE g.genreName = "comedy" 
OR b.title
LIKE '%Night of the Living Dummy%'