WITH cte AS (
    SELECT voter, COUNT(candidate) AS cnt
    FROM Votes
    WHERE candidate IS NOT NULL
    GROUP BY voter
),
cte1 AS (
    SELECT v.voter, v.candidate, c.cnt
    FROM Votes v
    JOIN cte c ON v.voter = c.voter
),
cte2 AS (
    SELECT candidate, SUM(1.0 / cnt) AS total_votes
    FROM cte1
    GROUP BY candidate
)
SELECT candidate
FROM cte2
WHERE total_votes = (
    SELECT MAX(total_votes) FROM cte2
)
ORDER BY candidate;
