# Write your MySQL query statement below
-- with cte as(
--     select *
--     from Views
--     where author_id = viewer_id
-- )

select distinct author_id as id
from 
(
    select author_id
    from Views
    where author_id = viewer_id 
) 
    as t order by author_id;