-- Write your PostgreSQL query statement below
select team_id, 
name, 
rank() over (order by points desc, name) - rank() over (order by c.points+p.points_change desc, c.name) as rank_diff
from TeamPoints c
join PointsChange p
using (team_id)
