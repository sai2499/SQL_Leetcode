--  Write your PostgreSQL query statement below
select distinct player_id, 
FIRST_VALUE(device_id) over (partition by player_id order by event_date) as device_id
from Activity 