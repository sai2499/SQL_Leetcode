# Write your MySQL query statement below
with cte as(
    select *, count(activity) as cnt
    from Friends
    group by activity)

select activity from cte where cnt != (select max(cnt) from cte) and cnt != (select min(cnt) from cte)
