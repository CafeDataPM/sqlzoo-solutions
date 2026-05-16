-- SELECT basics

-- Question 1 : Modify it to show the population of Germany
SELECT population
FROM world
WHERE name = 'Germany';

-- SELECT always comes first: it defines what columns to display
SELECT name, population
--FROM specifies the table we are querying from
FROM world
--WHERE IS A CONDITION USED TO FILTER ROWS
WHERE name = 'Germany'


  
-- Question 2 : Show the name and the population for 'Sweden', 'Norway' and 'Denmark'
SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
--IN allow us to check if an item is in al list

--NOTE: SQL is not strictly case-sensitive, but it’s important to be consistent. Keywords are usually written in uppercase (SELECT, WHERE, FROM), while table and column names should match their defined format in the database (world, name, population).



-- Question 3 : Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
-- BETWEEN: SQL OPERATOR query rolls between to values


