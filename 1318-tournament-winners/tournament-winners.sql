# Write your MySQL query statement below
with cte1 as(
select distinct match_id, second_player as player, second_score as score
from Matches
union
select distinct match_id, first_player as player, first_score as score
from Matches),
cte2 as(
    select distinct player as player_id, sum(score) as total_score
    from cte1
    group by player
)

SELECT 
    DISTINCT group_id, 
    FIRST_VALUE(cte2.player_id) OVER (
    PARTITION BY group_id 
    ORDER BY 
      total_score DESC, 
      cte2.player_id
  ) AS player_id
FROM 
  cte2
  LEFT JOIN players ON cte2.player_id = players.player_id


