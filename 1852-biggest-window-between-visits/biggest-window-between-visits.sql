-- Write your PostgreSQL query statement below
with cte as (
    select user_id, 
        visit_date,
        (coalesce(LEAD(visit_date) over (partition by user_id order by visit_date), '2021-1-1') - visit_date) as diff
    from UserVisits),
cte2 as (
    select *, rank() over (partition by user_id order by diff desc) as rnk
    from cte
)

select distinct user_id, diff as biggest_window from cte2 where rnk =1