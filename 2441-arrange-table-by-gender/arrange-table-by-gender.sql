-- Write your PostgreSQL query statement below
WITH cte AS
(
    SELECT
        user_id,
        gender,
        ROW_NUMBER() OVER(PARTITION BY gender ORDER BY user_id) AS rank
    FROM
        Genders
)

SELECT
    user_id,
    gender
FROM
    cte
ORDER BY
    rank, length(gender) desc