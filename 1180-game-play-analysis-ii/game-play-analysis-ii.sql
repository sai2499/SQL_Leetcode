--  Write your PostgreSQL query statement below
select player_id, device_id
from Activity where (player_id, event_date) in (select player_id, 
Min(event_date) as first_login
from Activity
group by player_id)