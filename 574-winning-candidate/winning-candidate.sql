-- Write your PostgreSQL query statement below
with cte as(
    select c.name, count(candidateid) as no_of_votes
    from candidate c 
    join vote v 
    on c.id=v.candidateid
    group by c.name
    order by no_of_votes desc
)
select name from cte limit 1;