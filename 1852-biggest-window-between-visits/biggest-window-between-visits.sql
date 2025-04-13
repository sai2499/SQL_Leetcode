-- Write your PostgreSQL query statement below
with cte as (
    select user_id, 
        visit_date,
        (coalesce(LEAD(visit_date) over (partition by user_id order by visit_date), '2021-1-1') - visit_date) as diff
    from UserVisits)

select user_id, 
    max(diff) as biggest_window 
from cte
group by user_id