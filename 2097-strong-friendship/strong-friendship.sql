with cte as(select user1_id,user2_id from friendship
            union 
            select user2_id,user1_id from friendship)
            
select f1.user1_id, f2.user1_id as user2_id, count(*) as common_friend from cte f1, cte f2
where f1.user2_id = f2.user2_id 
group by f1.user1_id, f2.user1_id
having count(*)>=3 and (f1.user1_id, f2.user1_id) in (select * from friendship)