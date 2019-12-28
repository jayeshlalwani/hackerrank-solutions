-- Solution 1
SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[^aeiou]'
OR CITY REGEXP '[^aeiou]$';

-- Solution 2
SELECT DISTINCT CITY FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a','e','i','o','u')
OR RIGHT(CITY, 1) NOT IN ('a','e','i','o','u');