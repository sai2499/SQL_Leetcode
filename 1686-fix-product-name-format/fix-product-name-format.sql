# Write your MySQL query statement below
select
    trim(lower(product_name)) as product_name,
    date_format(sale_date, '%Y-%m') as sale_date,
    count(product_name) as total
from Sales
group by 1,2
order by 1,2