WITH temp AS (
SELECT submission_date, hacker_id, COUNT(submission_id) c
    FROM submissions a
    GROUP BY submission_date, hacker_id
),
    hacker AS (
SELECT submission_date, hacker_id, c ,ROW_NUMBER()OVER (PARTITION BY submission_date ORDER BY c DESC, hacker_id) rank
    FROM temp
),
    date AS (
SELECT DISTINCT submission_date, ROW_NUMBER()OVER (ORDER BY submission_date) rank 
    FROM (SELECT DISTINCT submission_date 
          FROM submissions)a 
),
    rank AS (
SELECT a.submission_date, rank, hacker_id, COUNT(b.submission_date) c 
    FROM date a
LEFT JOIN temp b ON a.submission_date >=b.submission_date  
GROUP BY a.submission_date,rank,hacker_id
HAVING COUNT(b.submission_date) =rank
    )
    
SELECT a.submission_date,COUNT(a.hacker_id),b.hacker_id,name 
FROM rank a 
LEFT JOIN hacker b ON a.submission_date=b.submission_date and b.rank=1
LEFT JOIN hackers c ON b.hacker_id=c.hacker_id
GROUP BY a.submission_date,b.hacker_id,name 
ORDER BY 1