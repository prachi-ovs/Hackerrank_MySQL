SELECT DISTINCT c.NAME
FROM CITY c 
JOIN COUNTRY co ON c.CountryCode = co.Code
WHERE co.CONTINENT = 'Africa';