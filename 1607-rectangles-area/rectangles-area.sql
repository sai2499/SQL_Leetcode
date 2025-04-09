# Write your MySQL query statement below
with cte as(
    select
        p1.id as tb_1, 
        p1.x_value as tb_1_x, 
        p1.y_value as tb_1_y, 
        p2.id as tb_2, 
        p2.x_value as tb_2_x, 
        p2.y_value as tb_2_y,
        abs(p1.x_value - p2.x_value) * abs(p1.y_value - p2.y_value) as dist
    from Points as p1
        cross join Points as p2
    where
        p1.id < p2.id)

select tb_1 as P1, tb_2 as P2, dist as AREA
from cte
where dist > 0
order by dist desc, p1 asc, p2 asc