-- Write your PostgreSQL query statement below
SELECT user_id, MAX(time_stamp) last_stamp 
FROM Logins
WHERE time_stamp::date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY user_id