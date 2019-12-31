-- Solution 1
SET @project = 0;
SET @last_date = NULL;
SELECT MIN(START_DATE), MAX(END_DATE)
FROM (SELECT
      START_DATE, END_DATE,
      (CASE WHEN START_DATE = @last_date THEN @project
            ELSE @project := @project + 1 END) AS PROJECT,
      @last_date := END_DATE
      FROM (SELECT START_DATE, END_DATE
            FROM PROJECTS ORDER BY START_DATE) SORTED) TEMP
GROUP BY PROJECT
ORDER BY COUNT(1), MIN(START_DATE);

-- Solution 2
SELECT START_DATE, MIN(END_DATE)
FROM (SELECT START_DATE FROM PROJECTS
      WHERE START_DATE NOT IN (SELECT END_DATE FROM PROJECTS)) a
      INNER JOIN
     (SELECT END_DATE FROM PROJECTS
      WHERE END_DATE NOT IN (SELECT START_DATE FROM PROJECTS)) b
WHERE START_DATE < END_DATE
GROUP BY START_DATE
ORDER BY MIN(END_DATE) - START_DATE, START_DATE;