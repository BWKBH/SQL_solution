select
    max(salary*months)
    ,   count(*)
from
    employee
where (salary*months) in (
        select
            max(salary*months) 
        from
            employee
        )