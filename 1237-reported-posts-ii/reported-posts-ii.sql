# Write your MySQL query statement below

with cte as (
    select count(distinct CASE 
    WHEN remove_date IS NOT NULL THEN post_id 
    ELSE NULL 
END)/count(distinct post_id) as percent 
    from actions 
    left join removals 
    using(post_id)
    where extra='spam'
    group by action_date
)
select round(100*avg(percent), 2) as average_daily_percent from cte; 