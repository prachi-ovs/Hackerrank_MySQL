SELECT h_id, name, SUM(score)
FROM (SELECT s.hacker_id AS h_id, h.name AS name, s.challenge_id AS c_id, MAX(s.score) AS score
      FROM Submissions s JOIN Hackers h ON s.hacker_id = h.hacker_id 
      GROUP BY s.hacker_id, h.name, s.challenge_id) AS maxScores
GROUP BY h_id, name
HAVING SUM(score) <> 0
ORDER BY SUM(score) DESC, h_id ASC;