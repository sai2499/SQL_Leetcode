-- Write your PostgreSQL query statement below
with cte as (
select c.salesperson_id, sum(s.price) as total
from Customer c
join Sales s
using (customer_id)
group by salesperson_id)

select s.salesperson_id, s.name, coalesce(total, 0) as total
from cte c
right join Salesperson s
using (salesperson_id) 