# Write your MySQL query statement below
select distinct c.customer_id, c.customer_name
from Orders o
right join Customers c
on o.customer_id = c.customer_id
where o.customer_id not in (select customer_id from Orders where product_name = "C")
and o.customer_id in (select customer_id from Orders where product_name = "A")
and o.customer_id in (select customer_id from Orders where product_name = "B")