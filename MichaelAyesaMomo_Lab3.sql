/**
 *1. Write a statement that shows all the thefts that happened in neighbourhoods that have 'Humber' in the name.
 * **/

SELECT * from bikeTheft where NeighbourhoodName  like '%Humber%' 

/**
 * 2. Narrow the list from question 1 down by only showing thefts that occurred in odd-numbered years.
**/

SELECT * from bikeTheft where NeighbourhoodName  like '%Humber%' and Report_Year % 2


/**3. Get the average cost of the bikes recorded in this table. Format this result as a dollar figure,
 * 
  including a dollar sign, rounded to the nearest penny.
  **/
SELECT ROUND(AVG(Cost_of_Bike), 1) AS 'Average cost of bikes' from bikeTheft

/**4. Write a query that returns the number of unique combinations of bike colour & speed. 
 * Note: null is not a colour or a speed.
 * 
 */

SELECT Bike_Speed,Bike_Colour,COUNT(DISTINCT Bike_Speed || ' ' || Bike_Colour ) as 'Unique Colors'
from bikeTheft 
group by Bike_Speed , Bike_Colour

/**
 *5. Write a statement that shows a list of location types with more than 500 total thefts.
 **/
 
 SELECT Location_Type,  COUNT(*) FROM bikeTheft group by Location_Type 
 HAVING COUNT(*) > 500

 /**
 *6. Write a statement that returns the date of the first bike theft contained in this table. (Use an aggregate function for this.)
 */
SELECT MIN(Occurrence_Date) as first_Occurence from bikeTheft


/**7. Write a statement that returns only the top 10 neighbourhoods with the most reported thefts.**/

select NeighbourhoodName as "Top 10 Neighbourhoods"
from bikeTheft  where NeighbourhoodName = (SELECT MAX(NeighbourhoodName)) 
LIMIT 10

/**8. Select 2 columns. The first column should be the sum of the 'Cost of Bike' column, divided by the total number of rows.
 *  The second column should be result of running the AVG() function on the 'Cost of Bike' column.**/
select
	SUM(Cost_of_Bike) / COUNT(*) as 'The Cost of Bike',
	AVG(Cost_of_Bike) as 'average Cost of Bike' from bikeTheft bt 

  /**
  In a code comment, tell me if first column and the second column of the previous question are equal. If they are, explain why. If they are not, 
  explain what you could do to make the result of the AVG() function match the value of the first column.

  ANSWER:

  the first and the second column are not equal
  what i did using the previous query was : "the cost of bike" is the sum of the colum (Cost_of_Bike) diivided by the total numbers 
  of rows. whicch is average of all values in the (cost of bike) it was calculated by doing the sum of all values divided by the numer of rows.

  the  second column, "Average Cost of Bike" is the outcome of the AVG() function of the (Cost_of_Bike) column.

  for the first column and second column to have thesame result, I will have to write the query differently. 
  like this 
  **/

  SELECT SUM(Cost_of_Bike) AS 'The Cost of Bike', AVG(Cost_of_Bike) AS 'average Cost of Bike'
  FROM bikeTheft bt 


  /**Write a statement that returns the top 5 neighbourhoods in terms of thefts, and a column that shows how many incidents they had above the average neighbourhood. 
  This may be a good case for a subquery.**/

  /**Write a statement that returns the top 5 neighbourhoods in terms of thefts,
 *  and a column that shows how many incidents they had above the average neighbourhood.
 *  This may be a good case for a subquery.**/

with Neighbourhood_Name  as( 
SELECT NeighbourhoodName, COUNT(*) as 'theft'
from bikeTheft 
group by NeighbourhoodName),

averageTheft as(
SELECT AVG(NeighbourhoodName) as 'averageTheft'
from Neighbourhood_Name) 
select	NeighbourhoodName - averageThef as 'Average '
from Neighbourhood_Name , averageTheft
order by desc 
limit 5


/**
reference from : https://www.geeksforgeeks.org/sql-with-clause/
**/