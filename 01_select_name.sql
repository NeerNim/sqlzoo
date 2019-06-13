/* 
You can use WHERE name LIKE 'B%' to find the countries that start with "B".
Find the country that start with Y
*/

SELECT name FROM world
WHERE name LIKE 'Y%'

--Find the countries that end with y
SELECT name FROM world
WHERE name LIKE '%y'

--Find the countries that contain the letter x
SELECT name FROM world
WHERE name LIKE '%x%'

--Find the countries that end with land
SELECT name FROM world
WHERE name LIKE '%land'

--Columbia starts with a C and ends with ia - there are two more like this.
SELECT name FROM world
WHERE name LIKE 'C%ia'


--Find the country that has oo in the name
SELECT name FROM world
WHERE name LIKE '%oo%'

--Find the countries that have three or more a in the name
SELECT name FROM world
WHERE name LIKE '%a%%a%%a%'

--Find the countries that have "t" as the second character.
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

--Lesotho and Moldova both have two o characters separated by two other characters.
SELECT name FROM world
WHERE name LIKE '%o__o%'

--Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____'  

--Find the country where the name is the capital city.
SELECT name FROM world
WHERE name = capital

--Find the country where the capital is the country plus "City".
SELECT name
FROM world
where capital like concat(name, ' City')

-- Find the capital and the name where the capital includes the name of the country.
select capital, name from world
where 
capital like concat( '%', name, '%')

--Find the capital and the name where the capital is an extension of name of the country.
select capital, name from world 
where capital like concat(name, '_%')

--Show the name and the extension where the capital is an extension of name of the country.
select name, replace(capital, name, '') from world  
where capital like concat(name, '_%')














