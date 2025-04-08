# Write your MySQL query statement below
with cte as (select *
    from Variables as v
    right join Expressions e
    on e.left_operand = v.name),
cte2 as(
    select v.left_operand, v.value, v.operator, v.right_operand, e.value as right_op
    from cte as v
    left join Variables as e
    on v.right_operand = e.name)

select left_operand, operator, right_operand,
case
    when operator = '=' then if(value = right_op, 'true', 'false')
    when operator = '>' then if(value > right_op, 'true', 'false')
    else if(value < right_op, 'true', 'false')
    end as value
from cte2