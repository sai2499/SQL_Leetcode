# Write your MySQL query statement below
with cte as (
    select user1_id, user2_id
    from Friendship
    where user1_id = 1
    union all
    select user2_id,user1_id
    from Friendship
    where user2_id = 1
)
-- select distinct page_id as recommended_page
select distinct page_id as recommended_page
from cte c
join Likes l
on c.user2_id = l.user_id
where l.page_id not in (select page_id from Likes where user_id = 1)
order by page_id asc