with t as (select v.user_id, v.visit_date, t.transaction_date, t.amount, if(t.transaction_date is null, 0, count(*)) cnt
           from visits v
           left join transactions t
           on v.user_id=t.user_id and v.visit_date=t.transaction_date
           group by v.user_id, v.visit_date),
     t1 as (select *, count(*) v_cnt
            from t
            group by cnt),
     t2 as (select row_number() over() rn
            from transactions
            union
            select 0 rn)

select t2.rn transactions_count, ifnull(t1.v_cnt,0) visits_count
from t2
left join t1
on t2.rn=t1.cnt
where t2.rn <=(select max(cnt) from t1)
order by t2.rn



