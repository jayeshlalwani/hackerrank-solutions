-- Solution 1
SELECT NAME FROM STUDENTS WHERE MARKS > 75
ORDER BY SUBSTRING(NAME, -3), ID;

-- Solution 2
SELECT NAME FROM STUDENTS WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID;