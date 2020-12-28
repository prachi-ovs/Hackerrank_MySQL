SELECT c.hacker_id, h.name, COUNT(c.hacker_id)
FROM Challenges AS c INNER JOIN Hackers AS h
ON c.hacker_id = h.hacker_id
GROUP BY c.hacker_id, h.name
    HAVING COUNT(c.hacker_id) = (SELECT MAX(cnts.cnt) 
                                 FROM (SELECT COUNT(hacker_id) AS cnt 
                                       FROM Challenges 
                                       GROUP BY hacker_id) AS cnts)
    OR COUNT(c.hacker_id) IN (SELECT cnts.cnt 
                              FROM (SELECT COUNT(hacker_id) AS cnt
                                    FROM Challenges
                                    GROUP BY hacker_id) AS cnts
                              GROUP BY cnts.cnt
                                HAVING COUNT(cnts.cnt) = 1)
ORDER BY COUNT(c.hacker_id) DESC, hacker_id