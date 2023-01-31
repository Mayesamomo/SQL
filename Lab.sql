---(1)What are the media types in the MediaType table? Use a SELECT statement to show them.
--- only show the name for mediaType
select name from MediaType
-----(2)What are the employees' full names? Show this in a single column called "Employee Names". Note: don't forget to put a space between first and last names,
--- or a comma and a space if you put the last name first.
select firstname || ', ' || lastname as 'Employee names' from employee

----(3)Select the sum of 987 plus 789, divided by 111. Hint: it's 16 - don't forget about BEDMAS!.

select (987 + 789) /111
---(4)Select the rows for all the customers in Brazil and Canada.

select * from customer where country = 'Brazil' or country = 'Canada' 
select * from customer where country IN('Canada', 'Brazil') 


---(5) Who are all the customers with hotmail addresses? 
--- Hint: there are other hotmail "top level domains" besides '.com', for example "hotmail.co.uk". 

Select * from customer
where Email 
like '%@hotmail%.'

---(6) Who are all the customers who don't have a company listed?

Select * from Customer
 where Company is null

---(7) What are the genres whose name begins with a letter in the second half of the alphabet?

select name from genre
where name >= 'N'
---OR--

select name from genre
where name 
between 'B' and 'N'

---(8)List the cities with employees, reverse alphabetically.
--- Hint: a list of things shouldn't contain duplicates.

select distinct city from employee
order by city DESC