# Write your MySQL query statement below
select DATE_FORMAT(trans_date, "%Y-%m") as month, 
country, 
count(trans_date) as trans_count,
COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
sum(amount) as trans_total_amount,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
from Transactions
group by country, DATE_FORMAT(trans_date, "%Y-%m");