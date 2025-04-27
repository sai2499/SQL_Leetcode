WITH CTE1 AS (
    SELECT flight_id, 
    COUNT(flight_id) AS cn
FROM Passengers
GROUP BY flight_id)

SELECT 
    a.flight_id, 
    COALESCE((CASE WHEN a.capacity - cn <= 0 THEN a.capacity ELSE b.cn END),0) AS booked_cnt,   
    COALESCE((CASE WHEN cn - capacity < 0 THEN 0 ELSE cn-capacity END),0) AS waitlist_cnt
FROM FLights AS a
LEFT JOIN CTE1 AS b
ON a.flight_id = b.flight_id
ORDER BY a.flight_id
