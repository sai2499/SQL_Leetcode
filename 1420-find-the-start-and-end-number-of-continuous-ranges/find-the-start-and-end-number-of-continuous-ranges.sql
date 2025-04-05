# Write your MySQL query statement below
with cte as(
    select log_id as start_id, lag(log_id) over(order by log_id asc) as lg
    from Logs
)

select start_id,
(case 
    when lead(lg) over() is null then (select max(log_id) from logs)
    else lead(lg) over() end ) as end_id
    from cte
where lg is null or lg + 1 != start_id