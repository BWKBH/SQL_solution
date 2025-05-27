-- Write your PostgreSQL query statement below
with temp as (
    select 
        reports_to
        , count(employee_id) as reports_count
        , round(avg(age),0) as average_age
    from 
        employees
    where reports_to is not null
    group by reports_to
)
select
    t.reports_to as employee_id
    , e.name
    , t. reports_count
    , t.average_age
from
    temp as t
join
    employees as e
on
    t.reports_to = e.employee_id
order by
    employee_id
;
