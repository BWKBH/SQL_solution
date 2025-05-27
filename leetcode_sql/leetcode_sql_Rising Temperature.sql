select 
    w.id
from
    weather as w
join 
    weather as w2
on
    w.recordDate = w2.recordDate + interval '1 day'
where
    w.temperature > w2.temperature
;
    