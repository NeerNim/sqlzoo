--Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany';

--Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

--selects the country name and area using Between as the range checking
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000