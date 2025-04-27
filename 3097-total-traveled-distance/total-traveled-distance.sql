-- Write your PostgreSQL query statement below
select u.user_id, u.name, sum(coalesce(r.distance, 0)) "traveled distance"
from Users u
left join Rides r
using (user_id)
group by 1, 2
order by 1