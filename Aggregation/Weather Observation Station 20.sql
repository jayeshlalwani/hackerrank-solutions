SET @rowNum := -1;
SELECT ROUND(AVG(LAT_N), 4) FROM
    (SELECT @rowNum := @rowNum + 1 AS NUM, LAT_N
        FROM STATION ORDER BY LAT_N) TEMP
WHERE NUM IN (FLOOR(@rowNum / 2), CEIL(@rowNum / 2));