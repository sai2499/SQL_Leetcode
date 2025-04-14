-- Write your PostgreSQL query statement below
with cte as(
select product_id, 'store1' as store, store1 as price from Products
union all
select product_id, 'store2', store2 from Products
union all
select product_id, 'store3', store3 from Products)

select * from cte where price is not null