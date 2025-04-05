# Write your MySQL query statement below
select employee_id, count(team_id) over (partition by team_id) as team_size
from Employee
order by employee_id