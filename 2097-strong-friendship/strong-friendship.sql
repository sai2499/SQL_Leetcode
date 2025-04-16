with combined as (
    select user1_id as user, user2_id as friend from friendship
    union
    select user2_id as user, user1_id as friend from friendship
),
mutual as (
    select c1.user as user1_id, c2.user as user2_id, c2.friend as mutual 
    from combined c1 join combined c2 on c1.friend = c2.friend
    join friendship c3 on c1.user = c3.user1_id and c2.user = c3.user2_id
)
select user1_id, user2_id, count(*) as common_friend
from mutual
group by 1, 2
having count(*) >= 3