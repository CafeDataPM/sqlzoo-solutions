--Question 1: Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population FROM world

--Question 2 : Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population > 200000000 -- 200000000 = 200e6

--Question 3 : Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population
FROM world 
WHERE population > 200e6

--Question 4: Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 FROM world 
WHERE continent = 'South America'

--Question 5 : Show the name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

--Question 6 : Show the countries which have a name that includes the word 'United'
SELECT name FROM world
WHERE name LIKE 'United%' -- if we are looking for countries that start with AL% and end with %AL

--Question 7 : Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
SELECT name, population, area FROM world
Where area > 3e6 OR population > 250e6

--Question 8 : Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
--Australia has a big area but a small population, it should be included.
--Indonesia has a big population but a small area, it should be included.
--China has a big population and big area, it should be excluded.
--United Kingdom has a small population and a small area, it should be excluded.
SELECT name, population,area 
FROM world
WHERE (area > 3000000 OR population > 250000000)
AND NOT (area > 3000000 AND population > 250000000)-- NOT is used to exclude data

--Question 9 : Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
SELECT name, 
ROUND (population/1000000, 2), -- function rounds a number to a specified number of decimal places, where there is (a,b), b is the decimal place, given 15 and b=2 then 0.15 
ROUND (gdp/1000000000, 2) 
FROM world
WHERE continent = 'South America'

--Question 10 : Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
SELECT name,
ROUND (gdp/population, -3)-- In the case of Australia original GDP per-capita 66442 but because we have to round it to -3 in 66000
FROM world
WHERE gdp > 1000000000000

--Question 11 : Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital) --LENGTH function returns the length of a string (in bytes)

--Question 12 : Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) -- LEFT function extracts a number of characters from a string (starting from left). For example, WHERE LEFT (name,3) will show all the countries and capital names that match the first three letters, like Belize and Belmopan
AND NOT name = capital

--Question 12 : Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%' -- indicates that the country could have an 'a' in the name
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %' --None of the countries can have more than one vowel
