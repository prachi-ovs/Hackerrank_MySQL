WITH DailySubmissions AS (
    SELECT ROW_NUMBER() OVER (PARTITION BY hacker_id
                              ORDER BY submission_date) AS row_number, *
    FROM Submissions)
    
SELECT DISTINCT COUNT(hacker_id)
FROM DailySubmissions
WHERE row_number =15