with cte as (
    select v.member_id, coalesce(((100*count(p.charged_amount))/count(v.visit_date)),0) as conversion_rate
    from Visits v
    left join Purchases p
    using (visit_id)
    group by member_id)


select m.member_id, m.name,
    CASE
        WHEN c.conversion_rate >= 80 THEN 'Diamond'
        WHEN c.conversion_rate BETWEEN 50 AND 80 THEN 'Gold'
        WHEN c.conversion_rate < 50 THEN 'Silver'
        WHEN c.conversion_rate IS NULL THEN 'Bronze'
    END AS category
from cte c
right join Members m
using (member_id)
