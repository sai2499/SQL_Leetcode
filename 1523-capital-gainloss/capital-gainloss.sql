with cte as(
    select stock_name,
    case 
    when operation = 'buy' then -1 * price
    when operation ='sell' then price
    end as gain
from stocks)

select stock_name,
sum(gain) as capital_gain_loss
from cte
group by stock_name
