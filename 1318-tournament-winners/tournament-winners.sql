# Write your MySQL query statement below
with cte1 as(
    select distinct match_id, second_player as player, second_score as score
    from Matches
    union all
    select distinct match_id, first_player as player, first_score as score
    from Matches),
cte2 as(
    select distinct player, sum(score) as total_score
    from cte1
    group by player
),
cte3 as(
    select p.player_id, p.group_id, c.total_score, rank() over (partition by group_id order by total_score desc, player_id) as rank_val
    from cte2 c
    left join Players p
    on c.player = p.player_id
)

select group_id as GROUP_ID, player_id as PLAYER_ID
from cte3
where rank_val = 1

