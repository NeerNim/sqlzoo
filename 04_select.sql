/*Select within a select*/

--List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world WHERE population >
(SELECT population FROM world
WHERE name='Russia')

--The per capita GDP is the gdp/population
select name from world 
where gdp/population > 
(select gdp/population from world 
where name = 'United Kingdom') and continent = 'Europe'

/*List the name and continent of countries in the continents containing either Argentina or Australia. 
Order by name of the country.*/
select name, continent from world 
where continent in(select continent from world 
where name in('Argentina', 'Australia')) order by name

--Which country has a population that is more than Canada but less than Poland? Show the name and the population.
select name, population from world
where population > ( select population from world where name = 'Canada') 
and population < (select population from world where name = 'Poland')

/*Show the name and the population of each country in Europe. 
Show the population as a percentage of the population of Germany.*/
select name, CONCAT(ROUND(population/(select population from world where name = 'Germany')*100), '%')
from world 
where continent= 'Europe'

/*Which countries have a GDP greater than every country in Europe? 
[Give the name only.] (Some countries may have NULL gdp values)*/
select name from world where gdp  >= all (select gdp from world 
where continent = 'Europe' and gdp > 0) and  continent != 'Europe'

Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x WHERE area >= ALL
(SELECT area FROM world y WHERE y.continent=x.continent AND area>0)

--List each continent and the name of the country that comes first alphabetically.
SELECT continent, name FROM world x
WHERE name = (SELECT name FROM world y
WHERE y.continent=x.continent
order by name limit 1)

/*Find the continents where all countries have a population <= 25000000. 
Then find the names of the countries associated with these continents. 
Show name, continent and population.
*/


SELECT  name, continent, population FROM world x
where 25000000 >= all (SELECT population FROM world y
WHERE x.continent=y.continent
AND population>0)

/*Some countries have populations more than three times that of 
any of their neighbours (in the same continent). Give the countries and continents.*/
SELECT name, continent FROM world x 
WHERE population/3 >= ALL (SELECT population FROM world y  
WHERE y.continent=x.continent AND x.name != y.name)

