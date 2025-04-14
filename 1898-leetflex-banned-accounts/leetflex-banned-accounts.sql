-- Write your PostgreSQL query statement below
select distinct l1.account_id
from loginfo l1 join loginfo l2 on l1.account_id = l2.account_id 
and l1.ip_address != l2.ip_address 
and l1.login between l2.login and l2.logout