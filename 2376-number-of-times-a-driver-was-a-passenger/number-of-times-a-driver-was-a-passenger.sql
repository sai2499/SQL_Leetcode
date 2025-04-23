-- Write your PostgreSQL query statement below
WITH CTE AS(
    SELECT
        DISTINCT driver_id
    FROM 
        Rides R1
)
SELECT C1.driver_id, COUNT(passenger_id)cnt
FROM CTE C1
LEFT JOIN Rides R2 
ON C1.driver_id = R2.passenger_id 
GROUP BY C1.driver_id