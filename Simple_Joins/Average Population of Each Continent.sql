SELECT co.CONTINENT, AVG(c.POPULATION)
FROM CITY c
JOIN COUNTRY co ON c.COUNTRYCODE = co.CODE
GROUP BY co.CONTINENT;