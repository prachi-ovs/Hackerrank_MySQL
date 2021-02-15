SELECT c.contest_id, c.hacker_id, c.name, SUM(total_submissions), SUM(total_accepted_submissions), SUM(total_views), SUM(total_unique_views)
FROM Contests c 
    JOIN Colleges col ON c.contest_id = col.contest_id
    JOIN Challenges ch ON col.college_id = ch.college_id
    LEFT JOIN(SELECT challenge_id, SUM(total_views) AS total_views, SUM(total_unique_views) AS total_unique_views
              FROM View_Stats
              GROUP BY challenge_id) vs ON ch.challenge_id = vs.challenge_id
    LEFT JOIN(SELECT challenge_id, SUM(total_submissions) AS total_submissions, SUM(total_accepted_submissions) AS total_accepted_submissions
              FROM Submission_Stats
              GROUP BY challenge_id) ss ON ch.challenge_id = ss.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING SUM(total_submissions) != 0 
        OR SUM(total_accepted_submissions) !=0
        OR SUM(total_views) !=0
        OR SUM(total_unique_views) !=0
ORDER BY c.contest_id;

-- Left join used with View_Stats and Submission_Stats because there can be some 
--challenges that do not have any views or submissions. If an inner join was used instead, 
--then only those challenges with any views or submissions would be counted in the final sum per contest.