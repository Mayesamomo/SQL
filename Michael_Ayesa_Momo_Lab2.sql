--1. Get all the rows in the invoice table with an invoiceId of 400 or greater, and where the billingState is listed.
 --Sort these rows so that the invoiceId goes from highest to lowest.
 SELECT * FROM invoice WHERE invoiceId >= 400 AND billingState NOT NULL ORDER BY invoiceId DESC


/**
2. Get 6 rows from the employee table. Sort the employees from oldest to youngest. Exclude the two oldest.

**/

SELECT * FROM employee
ORDER BY birthDate LIMIT 6 OFFSET 2


/**
3. Get a list of cities where the store has customers, without duplicates. Make all the city names lowercased.
**/
SELECT   DISTINCT LOWER(city) from customer where customerId IS NOT NULL

/**
4. Get a list of all customers who have the letter 't' (either uppercase or lowercase) in either their first or last names. Include a column that lists the third letter of their last name.
**/
select lastname, SUBSTR(lastname, 3,1) as 'third' from customer
where firstname ||  lastname like '%t%'

/**
Get all of the rows from the artist table that contain an o with an ülaut ('ö'). In the results table, replace this character with a smiley face (':)')
**/

select artistId, replace(name,'ö',':)')  from artist where name LIKE '%ö%'


/**
Get all results from the customer table. Replace null values in the state and fax columns with an empty string.
**/

select fax, coalesce(fax, ' '), state, coalesce(state, ' ') from customer

--Return all album title longer than 20 characters. Only display the first
 --twenty characters, and make all characters lowercase.
select lower(substr(title,1,20))
title from  album where length(title) > 20

/**
Get all invoices from Berlin where the total is more than $5, and the invoices
 from Toronto where the total is more than $5. Sort from newest to oldest. Remember:
  if there is more than one way to write your code, you should stop and think about which way is best.
**/
select * from invoice
where (billingcity = 'Toronto' OR billingcity = 'Berlin') AND total > 5  order by InvoiceDate DESC
/* another way of doing it is**/

select * from invoice
where billingcity in('Toronto','Berlin') AND total > 5  order by InvoiceDate DESC