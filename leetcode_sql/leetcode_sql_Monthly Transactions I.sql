select 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    count(trans_date) as trans_count,
    count(case when state = 'approved' then amount end) as approved_count,
    sum(amount) as trans_total_amount,
    coalesce(sum(case when state = 'approved' then amount end),0) as approved_total_amount
from 
    transactions
group by
    month
    , country;