-- Write your PostgreSQL query statement below
select problem_id
from Problems
where likes::float / (likes + dislikes) < 0.6
order by problem_id asc;