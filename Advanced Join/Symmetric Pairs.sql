-- Solution 1
SELECT F1.X, F1.Y
FROM FUNCTIONS F1 INNER JOIN FUNCTIONS F2
ON F1.X = F2.Y AND F1.Y = F2.X
GROUP BY F1.X, F1.Y
HAVING COUNT(F1.X) > 1 OR F1.X < F1.Y
ORDER BY F1.X;

-- Solution 2
SELECT F1.X, F1.Y FROM FUNCTIONS F1
WHERE X <> Y AND EXISTS (SELECT * FROM FUNCTIONS WHERE X = F1.Y AND Y = F1.X AND X > F1.X)
UNION
SELECT F2.X, F2.Y FROM FUNCTIONS F2
WHERE X = Y AND (SELECT COUNT(1) FROM FUNCTIONS WHERE X = F2.X AND Y = F2.Y) > 1
ORDER BY X