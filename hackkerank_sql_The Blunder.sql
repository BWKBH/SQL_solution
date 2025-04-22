select
    ceiling(avg(salary)-avg(cast(replace(cast(salary as char),0,"") as signed)))
from
    employees
