# Write your MySQL query statement below
with cte as(
    select seller_id, 
    sum(price) as prod_rank
    from Sales
    group by seller_id
)

select seller_id from cte where prod_rank =(select max(prod_rank) from cte);