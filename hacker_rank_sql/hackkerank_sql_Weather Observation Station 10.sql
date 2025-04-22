select
    distinct(city)
from
    station
where
    right(city,1) not in ('A','E','O','I','U')
