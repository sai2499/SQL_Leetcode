# Write your MySQL query statement below
with cte as(
    SELECT 
    *, LAG(weight) OVER (ORDER BY turn) as last_val ,sum(weight) over (order by turn) AS sum_next
    FROM Queue
)

select person_name
from cte
where sum_next <= 1000
order by sum_next desc
limit 1