# Write your MySQL query statement below
with cte as (
    select username, activity, startdate, enddate,
    count(activity)over(partition by username) as activitycount,
    dense_rank()over(partition by username order by enddate desc) as ranking
    from useractivity
)

select username, activity, startdate, enddate
from cte
where activitycount =1
union
select username, activity, startdate, enddate
from cte
where activitycount !=1 and ranking=2;