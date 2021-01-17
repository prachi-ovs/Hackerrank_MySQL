SELECT CONCAT((Name),'('+LEFT(Occupation,1)+')') 
FROM OCCUPATIONS
ORDER BY Name, Occupation;

SELECT 'There are a total of '+ CAST(COUNT(*) AS VARCHAR(2))+'' AS num , LOWER(Occupation)+'s.'  
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY num, Occupation;