WITH cte AS (
    SELECT bus_id, arrival_time,
    LAG(arrival_time,1,0) OVER (ORDER BY arrival_time) min_time
    FROM buses
)

SELECT cte.bus_id, COUNT(passenger_id) AS passengers_cnt
FROM cte
LEFT JOIN passengers p
ON p.arrival_time > cte.min_time AND p.arrival_time <= cte.arrival_time
GROUP BY 1
ORDER BY 1;