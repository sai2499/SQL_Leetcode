# Write your MySQL query statement below
with cte as(
    select *, lead(free) over() bef, lag(free) over() aft from Cinema
)

select seat_id
from cte
where free =1 and (bef=1 or aft=1)
order by seat_id