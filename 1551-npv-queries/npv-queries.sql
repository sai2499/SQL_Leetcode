# Write your MySQL query statement below
select q.id, q.year, IFNULL(n.npv, 0) as npv
from NPV as n
right join Queries as q
on n.id = q.id and n.year = q.year
