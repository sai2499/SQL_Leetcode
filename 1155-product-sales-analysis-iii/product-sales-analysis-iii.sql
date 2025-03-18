# Write your MySQL query statement below
select p.product_id, s.year as first_year, s.quantity, s.price
from Sales s
join Product p
on s.product_id = p.product_id
where (p.product_id,s.year) in (
    select product_id, min(year)
    from Sales
    group by product_id
)