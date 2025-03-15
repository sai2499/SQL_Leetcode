-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT id, recordDate, temperature,
           LAG(recordDate) OVER (ORDER BY recordDate) AS prevDate,
           LAG(temperature) OVER (ORDER BY recordDate) AS prevTemp
    FROM Weather
)
SELECT id
FROM cte
WHERE temperature > prevTemp AND (recordDate::DATE - prevDate::DATE) = 1;
