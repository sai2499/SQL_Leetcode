# Write your MySQL query statement below
select distinct title
from TVProgram as tvp
join Content as c
on tvp.content_id = c.content_id
where c.Kids_content = "Y" and Month(tvp.program_date) = 6 and YEAR(tvp.program_date)='2020'
and c.content_type = "Movies"