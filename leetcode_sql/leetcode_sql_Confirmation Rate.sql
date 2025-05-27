-- Write your PostgreSQL query statement below
select 
    s.user_id,
    round(
        avg(
        case  
        when c.action = 'timeout' then 0
        when c.action = 'confirmed' then 1
        else 0
        end
        )::numeric
    ,2) as confirmation_rate
from 
    signups as s
left outer join
    confirmations as c
on
    s.user_id = c.user_id
group by
    s.user_id;