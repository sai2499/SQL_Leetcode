-- Write your PostgreSQL query statement below
select distinct player_id, 
Min(event_date) over (partition by player_id) as first_login
from Activity
group by player_id, event_date
