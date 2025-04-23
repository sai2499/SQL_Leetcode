-- Write your PostgreSQL query statement below
with cte as(
    select product_id, user_id, sum(quantity) as tota_quant
    from Sales s
    group by product_id, user_id
),cte2 as(
    select c.user_id, c.product_id, c.tota_quant, c.tota_quant*p.price as total_price,
    rank() over (partition by c.user_id order by c.tota_quant*p.price desc) as rnk
    from cte c
    join Product p
    using (product_id)

)

select product_id, user_id from cte2
where rnk =1
