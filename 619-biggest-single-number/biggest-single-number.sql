# Write your MySQL query statement below
with cte as(
    select num, count(num) as count_num
    from MyNumbers
    group by num
)

select max(num) as num
from cte
where count_num = 1;