# Write your MySQL query statement below
select name, ifnull(sum(r.distance), 0) as travelled_distance
from Rides r
right join Users u
on r.user_id = u.id
group by user_id
order by travelled_distance desc, name asc