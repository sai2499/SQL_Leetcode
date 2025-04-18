-- get the user who login for the first time
with cte as(
    select user_id, min(activity_date) as login_date
    from Traffic
    where activity = 'login'
    group by user_id
)

select login_date, count(user_id) as user_count
from cte
where datediff('2019-06-30', login_date) <= 90
group by login_date