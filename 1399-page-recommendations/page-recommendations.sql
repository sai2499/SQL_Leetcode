# Write your MySQL query statement below
with cte as (
    select
    case
        when user1_id=1 then user2_id
        when user2_id=1 then user1_id
    end as user_id
    from Friendship
)
-- select distinct page_id as recommended_page
select distinct page_id as recommended_page
from cte c
join Likes l
on c.user_id = l.user_id
where l.page_id not in (select page_id from Likes where user_id = 1)
order by page_id asc