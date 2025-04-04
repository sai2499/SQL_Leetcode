# Write your MySQL query statement below
with cte1 as(
select host_team as team,
    sum(case when host_goals > guest_goals then 3
        when host_goals = guest_goals then 1
        else 0 end) as points
from Matches
group by host_team),
cte2 as(
select guest_team as team,
    sum(case when host_goals > guest_goals then 0
        when host_goals = guest_goals then 1
        else 3 end) as points
from Matches
group by guest_team)
select b.team_id as team_id, b.team_name as team_name, ifnull(sum(a.points),0) as num_points
from (select * from cte1
    union all 
    select * from cte2) as a
right join Teams b
on a.team = b.team_id
group by b.team_id
order by num_points desc, team_id;