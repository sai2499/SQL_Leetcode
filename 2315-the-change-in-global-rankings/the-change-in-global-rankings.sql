-- Write your PostgreSQL query statement below
with cte as (
    select *, rank() over (order by points desc, name)
    from TeamPoints
),
cte2 as (
    select c.team_id, c.name, c.rank, rank() over (order by c.points+p.points_change desc, c.name) as new_rank
    from cte c
    join PointsChange p
    using (team_id)
)

select team_id, name, rank-new_rank as rank_diff
from cte2