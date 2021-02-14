SELECT f1.X, f1.Y
FROM Functions f1 JOIN Functions f2 ON (f1.X = f2.Y AND f1.Y = f2.X)
WHERE f1.X <= f1.Y
GROUP BY f1.X, f1.Y
HAVING COUNT(*) > 1 OR (f1.X != f1.Y)  
ORDER BY f1.X;


-- HAVING CLAUSE EXPLAINED --
-- When X and Y are same (for ex 13), after joining, there will be one record formed in the result 
-- table based on the condition that f1.X = f2.Y AND f1.Y = f2.X (i.e. 13 13 13 13). However, if there is 
-- no other record in the table with the same Y value as the particular X value, 
-- (i.e. current X value is 13 but no other record has a Y value of 13, then there is no possibility of a symmetric pair). 
--Hence, the HAVING clause checks first is the count of each group is > 1 or if the X and Y values for a particular record are different