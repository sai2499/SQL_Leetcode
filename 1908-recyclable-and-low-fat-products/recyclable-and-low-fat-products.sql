-- Write your PostgreSQL query statement below
select distinct product_id
from Products
where low_fats = 'Y' and recyclable = 'Y'