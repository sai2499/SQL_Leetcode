-- Write your PostgreSQL query statement below
WITH CTE1 AS (SELECT from_id, to_id, duration
FROM Calls
WHERE from_id < to_id
UNION ALL 
SELECT to_id AS from_id, from_id AS to_id, duration 
FROM Calls
WHERE from_id > to_id)

SELECT from_id AS person1, 
        to_id AS person2, 
        COUNT(duration) AS call_count, 
        SUM(duration) AS total_duration 
FROM CTE1
GROUP BY from_id, to_id