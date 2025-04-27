WITH cte AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY steps_date) AS rnk
    FROM Steps
),
cte_lagged AS (
    SELECT 
        s1.user_id,
        s1.steps_date,
        s1.steps_count,
        s2.steps_date AS prev_date1,
        s2.steps_count AS prev_count1,
        s3.steps_date AS prev_date2,
        s3.steps_count AS prev_count2
    FROM cte s1
    LEFT JOIN cte s2 
        ON s1.user_id = s2.user_id AND s1.rnk = s2.rnk + 1
    LEFT JOIN cte s3 
        ON s1.user_id = s3.user_id AND s1.rnk = s3.rnk + 2
)
SELECT 
    user_id,
    steps_date,
    ROUND( (steps_count + prev_count1 + prev_count2) / 3.0, 2 ) AS rolling_average
FROM cte_lagged
WHERE 
    -- check if the dates are consecutive (difference between dates is 1 day each)
    prev_date1 = steps_date - INTERVAL '1 day' AND
    prev_date2 = steps_date - INTERVAL '2 day'
ORDER BY user_id, steps_date;
