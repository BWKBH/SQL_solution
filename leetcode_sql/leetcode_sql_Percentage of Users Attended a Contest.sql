-- Write your PostgreSQL query statement below
select
    r.contest_id,
    round(
        (
            count(r.user_id) :: numeric /
        (
            select
                count(distinct(u2.user_id))
            from
                users as u2) :: numeric
            )*100,2
        ) as percentage
from 
    users as u
join
    register as r
on
    u.user_id=r.user_id
group by
    r.contest_id
order by
    percentage desc
    , r.contest_id asc;