-- Write your PostgreSQL query statement below
select
    name,
    coalesce(sum(rest),0) as rest,
    coalesce(sum(paid),0) as paid, 
    coalesce(sum(canceled),0) as canceled,
    coalesce(sum(refunded),0) as refunded
from Invoice i
right join Product p
using (product_id)
group by name
order by name