# Write your MySQL query statement below
select min(abs(p1.x - p2.x)) as shortest
from Point as p1, Point as p2
where p1.x <> p2.x