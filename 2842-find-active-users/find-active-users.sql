with cte as (
    select user_id, created_at, 
    lag(created_at)over(partition by user_id order by created_at) as prev
    from users
)

select distinct user_id
from cte
where created_at - prev <=7
