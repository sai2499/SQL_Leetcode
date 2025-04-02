# Write your MySQL query statement below
select Round((count(customer_id)/(select count(*) from Delivery))*100,2) as immediate_percentage
from Delivery
where order_date = customer_pref_delivery_date