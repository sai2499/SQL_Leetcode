# Write your MySQL query statement below
select round(min(sqrt(power(p1.x-p2.x,2)+power(p1.y-p2.y,2))),2) as shortest
from Point2D p1, Point2D p2
where (p1.x,p1.y) != (p2.x,p2.y)