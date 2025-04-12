-- Write your PostgreSQL query statement below
with cte as(
select generate_series(1,(select max(customer_id) from Customers)))

select generate_series as ids from cte where generate_series not in (select customer_id from Customers)