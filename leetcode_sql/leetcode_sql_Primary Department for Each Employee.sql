-- Write your PostgreSQL query statement below
select
    employee_id
    , min(department_id) as department_id
from 
    employee
group  by 
    employee_id
having 
    count(department_id) = 1
union 
select
    employee_id
    , department_id
from
    employee
where
    primary_flag='Y'
;