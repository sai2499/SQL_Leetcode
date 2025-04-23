-- Write your PostgreSQL query statement below
-- Write your PostgreSQL query statement below
SELECT 
    SUM(CASE WHEN EXTRACT(DOW FROM submit_date) IN (0, 6) THEN 1 ELSE 0 END) AS weekend_cnt,
    SUM(CASE WHEN EXTRACT(DOW FROM submit_date) NOT IN (0, 6) THEN 1 ELSE 0 END) AS working_cnt
FROM 
    Tasks;