-- Write your PostgreSQL query statement below
with cte as(
    select *, dense_rank() over (partition by bike_number order by end_time desc)
    from Bikes
)

select bike_number, end_time 
from cte
where dense_rank = 1
order by end_time desc