# Write your MySQL query statement below
with cte as(
    select followee, follower
    from Follow 
    where followee in (select follower from Follow)
)

select followee as "Follower", count(followee) as num
from cte
group by followee
order by follower asc